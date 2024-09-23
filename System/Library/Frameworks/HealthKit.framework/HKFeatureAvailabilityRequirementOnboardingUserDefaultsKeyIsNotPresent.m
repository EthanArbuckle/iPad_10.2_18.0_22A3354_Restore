@implementation HKFeatureAvailabilityRequirementOnboardingUserDefaultsKeyIsNotPresent

+ (id)requirementIdentifier
{
  return CFSTR("OnboardingUserDefaultsKeyIsNotPresent");
}

- (id)requirementDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HKFeatureAvailabilityRequirementUserDefaultEvaluator userDefaultsKey](self, "userDefaultsKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("The value of the onboarding user defaults key %@ must be nil"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)whichUserDefaultsDataSourceInDataSource:(id)a3
{
  return (id)objc_msgSend(a3, "userNotificationSettingsDataSource");
}

- (BOOL)isSatisfiedForValue:(id)a3
{
  return a3 == 0;
}

@end
