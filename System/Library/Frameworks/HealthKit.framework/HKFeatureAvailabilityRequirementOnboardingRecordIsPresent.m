@implementation HKFeatureAvailabilityRequirementOnboardingRecordIsPresent

+ (NSString)requirementIdentifier
{
  return (NSString *)CFSTR("OnboardingRecordIsPresent");
}

- (NSString)requirementDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HKFeatureAvailabilityOnboardingRecordRequirement featureIdentifier](self, "featureIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("An onboarding record must be present for %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)isSatisfiedWithOnboardingRecord:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "onboardingState") != 1);
}

@end
