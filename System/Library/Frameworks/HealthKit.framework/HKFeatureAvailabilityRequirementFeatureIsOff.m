@implementation HKFeatureAvailabilityRequirementFeatureIsOff

- (HKFeatureAvailabilityRequirementFeatureIsOff)initWithFeatureIdentifier:(id)a3 isOffWhenSettingIsAbsent:(BOOL)a4
{
  return -[HKFeatureAvailabilityRequirementFeatureIsOff initWithFeatureIdentifier:settingsOffKey:isOffWhenSettingIsAbsent:](self, "initWithFeatureIdentifier:settingsOffKey:isOffWhenSettingIsAbsent:", a3, CFSTR("Enabled"), a4);
}

- (HKFeatureAvailabilityRequirementFeatureIsOff)initWithFeatureIdentifier:(id)a3 settingsOffKey:(id)a4 isOffWhenSettingIsAbsent:(BOOL)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKFeatureAvailabilityRequirementFeatureIsOff;
  return -[HKFeatureAvailabilityFeatureSettingBooleanRequirement initWithFeatureIdentifier:settingsKey:settingsValue:isSatisfiedWhenSettingIsAbsent:](&v6, sel_initWithFeatureIdentifier_settingsKey_settingsValue_isSatisfiedWhenSettingIsAbsent_, a3, a4, 0, a5);
}

+ (NSString)requirementIdentifier
{
  return (NSString *)CFSTR("FeatureIsOff");
}

- (NSString)requirementDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HKFeatureAvailabilityOnboardingRecordRequirement featureIdentifier](self, "featureIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ must be off"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

@end
