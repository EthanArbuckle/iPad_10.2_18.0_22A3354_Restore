@implementation HKFeatureAvailabilityRequirementOnboardingAcknowledged

- (HKFeatureAvailabilityRequirementOnboardingAcknowledged)initWithFeatureIdentifier:(id)a3 settingsKey:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKFeatureAvailabilityRequirementOnboardingAcknowledged;
  return -[HKFeatureAvailabilityFeatureSettingBooleanRequirement initWithFeatureIdentifier:settingsKey:settingsValue:isSatisfiedWhenSettingIsAbsent:](&v5, sel_initWithFeatureIdentifier_settingsKey_settingsValue_isSatisfiedWhenSettingIsAbsent_, a3, a4, 1, 0);
}

- (HKFeatureAvailabilityRequirementOnboardingAcknowledged)initWithFeatureIdentifier:(id)a3
{
  return -[HKFeatureAvailabilityRequirementOnboardingAcknowledged initWithFeatureIdentifier:settingsKey:](self, "initWithFeatureIdentifier:settingsKey:", a3, CFSTR("OnboardingAcknowledged"));
}

+ (NSString)requirementIdentifier
{
  return (NSString *)CFSTR("OnboardingAcknowledged");
}

- (NSString)requirementDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HKFeatureAvailabilityOnboardingRecordRequirement featureIdentifier](self, "featureIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFeatureAvailabilityFeatureSettingBooleanRequirement settingsKey](self, "settingsKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ must have the value YES for the %@ feature setting."), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

@end
