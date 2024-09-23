@implementation HKFeatureAvailabilityRequirementCurrentCountryIsSupportedOnActiveRemoteDevice

+ (id)requirementIdentifier
{
  return CFSTR("CurrentCountryIsSupportedOnActiveRemoteDevice");
}

- (id)requirementDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HKFeatureAvailabilityOnboardingEligibilityRequirement featureIdentifier](self, "featureIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("The current country must be supported for %@ on the active device"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(v6, "currentCountryCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFeatureAvailabilityOnboardingEligibilityRequirement featureIdentifier](self, "featureIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "onboardingEligibilityForFeatureWithIdentifier:countryCode:error:", v8, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice isSatisfiedWithOnboardingEligibility:error:](self, "isSatisfiedWithOnboardingEligibility:error:", v9, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
