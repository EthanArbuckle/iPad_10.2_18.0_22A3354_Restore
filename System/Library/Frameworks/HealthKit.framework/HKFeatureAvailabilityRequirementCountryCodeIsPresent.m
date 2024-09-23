@implementation HKFeatureAvailabilityRequirementCountryCodeIsPresent

+ (id)requirementIdentifier
{
  return CFSTR("CountryCodeIsPresent");
}

- (id)requirementDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HKFeatureAvailabilityOnboardingEligibilityRequirement featureIdentifier](self, "featureIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("A country code must be present for %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
