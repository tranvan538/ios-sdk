//
//  CBOperationQueue.m
//
//  Copyright 2013 Cybozu
//
//  Licensed under the Apache License, Version 2.0 (the "License"); you may not
//  use this file except in compliance with the License.  You may obtain a copy
//  of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
//  WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
//  License for the specific language governing permissions and limitations under
//  the License.
//

#import "CBOperationQueue.h"

@implementation CBOperationQueue

+ (CBOperationQueue *)sharedConcurrentQueue
{
    static CBOperationQueue *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [self new];
    });
    
    return sharedInstance;
}

+ (CBOperationQueue *)sharedNonConcurrentQueue
{
    static CBOperationQueue *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [self new];
        sharedInstance.maxConcurrentOperationCount = 1;
    });
    
    return sharedInstance;
}

@end