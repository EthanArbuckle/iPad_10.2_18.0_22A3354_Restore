@implementation HKFeatureAvailabilityRequirementNotAgeGatedForUserDefaultsKey

- (HKFeatureAvailabilityRequirementNotAgeGatedForUserDefaultsKey)initWithUserDefaultsKey:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKFeatureAvailabilityRequirementNotAgeGatedForUserDefaultsKey;
  return -[HKFeatureAvailabilityRequirementUserDefaultEvaluator initWithUserDefaultsKey:](&v4, sel_initWithUserDefaultsKey_, a3);
}

- (BOOL)defaultBoolValueWhenKeyIsMissing
{
  return 0;
}

- (BOOL)isSatisfiedForBoolValue:(BOOL)a3
{
  return !a3;
}

- (id)whichUserDefaultsDataSourceInDataSource:(id)a3
{
  return (id)objc_msgSend(a3, "ageGatingDataSource");
}

+ (id)requirementIdentifier
{
  return CFSTR("NotAgeGatedForUserDefaultsKey");
}

- (id)requirementDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HKFeatureAvailabilityRequirementUserDefaultEvaluator userDefaultsKey](self, "userDefaultsKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("The value of the age gating user defaults key %@ must not be YES"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
