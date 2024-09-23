@implementation HKFeatureAvailabilityRequirementFeatureIsNotRemotelyDisabled

+ (NSString)requirementIdentifier
{
  return (NSString *)CFSTR("FeatureIsNotRemotelyDisabled");
}

- (NSString)requirementDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HKFeatureAvailabilityOnboardingEligibilityRequirement featureIdentifier](self, "featureIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ must not be remotely disabled"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)isSatisfiedWithOnboardingEligibility:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (objc_msgSend(a3, "ineligibilityReasons") & 0x40) == 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char isKindOfClass;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKFeatureAvailabilityRequirementFeatureIsNotRemotelyDisabled;
  if (-[HKFeatureAvailabilityOnboardingEligibilityRequirement isEqual:](&v7, sel_isEqual_, v4))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

@end
