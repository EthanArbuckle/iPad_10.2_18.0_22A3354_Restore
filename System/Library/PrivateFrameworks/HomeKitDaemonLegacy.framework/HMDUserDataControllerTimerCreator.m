@implementation HMDUserDataControllerTimerCreator

- (id)createExponentialBackoffTimerForZoneFetch
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D28578]), "initWithMinimumTimeInterval:maximumTimeInterval:exponentialFactor:options:", 3, 0, 1.0, 86400.0);
}

@end
