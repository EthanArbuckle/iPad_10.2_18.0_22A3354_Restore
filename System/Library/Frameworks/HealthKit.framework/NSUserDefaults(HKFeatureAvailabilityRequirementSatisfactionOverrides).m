@implementation NSUserDefaults(HKFeatureAvailabilityRequirementSatisfactionOverrides)

+ (id)hk_featureAvailabilityRequirementEvaluationOverridesUserDefaults
{
  return (id)objc_msgSend([a1 alloc], "initWithSuiteName:", CFSTR("com.apple.private.health.feature-availability-requirement-overrides"));
}

@end
