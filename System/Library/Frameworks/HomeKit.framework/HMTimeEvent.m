@implementation HMTimeEvent

+ (BOOL)isSupportedForHome:(id)a3
{
  return +[HMEvent sharedTriggerActivationSupportedForHome:](HMEvent, "sharedTriggerActivationSupportedForHome:", a3);
}

@end
