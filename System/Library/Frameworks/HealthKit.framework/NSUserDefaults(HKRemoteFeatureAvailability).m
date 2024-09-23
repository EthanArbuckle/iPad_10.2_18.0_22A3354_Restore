@implementation NSUserDefaults(HKRemoteFeatureAvailability)

+ (id)hk_remoteFeatureAvailabilityUserDefaults
{
  return (id)objc_msgSend([a1 alloc], "initWithSuiteName:", CFSTR("com.apple.private.health.feature-availability"));
}

@end
