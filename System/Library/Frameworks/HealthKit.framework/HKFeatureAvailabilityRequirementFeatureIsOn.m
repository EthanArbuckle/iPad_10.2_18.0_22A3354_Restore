@implementation HKFeatureAvailabilityRequirementFeatureIsOn

- (HKFeatureAvailabilityRequirementFeatureIsOn)initWithFeatureIdentifier:(id)a3 isOnWhenSettingIsAbsent:(BOOL)a4
{
  return -[HKFeatureAvailabilityRequirementFeatureIsOn initWithFeatureIdentifier:settingsOnKey:isOnWhenSettingIsAbsent:](self, "initWithFeatureIdentifier:settingsOnKey:isOnWhenSettingIsAbsent:", a3, CFSTR("Enabled"), a4);
}

- (HKFeatureAvailabilityRequirementFeatureIsOn)initWithFeatureIdentifier:(id)a3 settingsOnKey:(id)a4 isOnWhenSettingIsAbsent:(BOOL)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKFeatureAvailabilityRequirementFeatureIsOn;
  return -[HKFeatureAvailabilityFeatureSettingBooleanRequirement initWithFeatureIdentifier:settingsKey:settingsValue:isSatisfiedWhenSettingIsAbsent:](&v6, sel_initWithFeatureIdentifier_settingsKey_settingsValue_isSatisfiedWhenSettingIsAbsent_, a3, a4, 1, a5);
}

+ (NSString)requirementIdentifier
{
  return (NSString *)CFSTR("FeatureIsOn");
}

- (NSString)requirementDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HKFeatureAvailabilityOnboardingRecordRequirement featureIdentifier](self, "featureIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ must be on"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

@end
