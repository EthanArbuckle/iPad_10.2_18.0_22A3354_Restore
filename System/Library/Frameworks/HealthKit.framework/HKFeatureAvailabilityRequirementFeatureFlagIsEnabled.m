@implementation HKFeatureAvailabilityRequirementFeatureFlagIsEnabled

+ (NSString)requirementIdentifier
{
  return (NSString *)CFSTR("FeatureFlagEnabled");
}

- (NSString)requirementDescription
{
  return (NSString *)CFSTR("A required feature flag must be enabled");
}

@end
