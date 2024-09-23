@implementation _HKFeatureAvailabilityRequirementCountryIsSupportedOnLocalDevice

- (id)isSatisfiedWithOnboardingEligibility:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (objc_msgSend(a3, "ineligibilityReasons") & 8) == 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_HKFeatureAvailabilityRequirementCountryIsSupportedOnLocalDevice;
  if (-[HKFeatureAvailabilityOnboardingEligibilityRequirement isEqual:](&v7, sel_isEqual_, v4))
    v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class());
  else
    v5 = 0;

  return v5;
}

@end
