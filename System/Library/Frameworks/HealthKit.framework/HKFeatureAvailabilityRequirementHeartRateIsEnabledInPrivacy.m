@implementation HKFeatureAvailabilityRequirementHeartRateIsEnabledInPrivacy

- (HKFeatureAvailabilityRequirementHeartRateIsEnabledInPrivacy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKFeatureAvailabilityRequirementHeartRateIsEnabledInPrivacy;
  return -[HKFeatureAvailabilityRequirementUserDefaultEvaluator initWithUserDefaultsKey:](&v3, sel_initWithUserDefaultsKey_, CFSTR("EnableHeartRate"));
}

- (BOOL)defaultBoolValueWhenKeyIsMissing
{
  return 1;
}

- (BOOL)isSatisfiedForBoolValue:(BOOL)a3
{
  return a3;
}

- (id)whichUserDefaultsDataSourceInDataSource:(id)a3
{
  return (id)objc_msgSend(a3, "privacyPreferencesDataSource");
}

+ (id)requirementIdentifier
{
  return CFSTR("HeartRateIsEnabledInPrivacy");
}

- (id)requirementDescription
{
  return CFSTR("The Heart Rate setting in Privacy must be enabled");
}

@end
