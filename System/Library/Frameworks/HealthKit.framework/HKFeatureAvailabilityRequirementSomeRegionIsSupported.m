@implementation HKFeatureAvailabilityRequirementSomeRegionIsSupported

+ (id)requirementIdentifier
{
  return CFSTR("SomeRegionIsSupported");
}

- (id)isSatisfiedWithRegionAvailability:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  objc_msgSend(v5, "allowedCountries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "allowedCountries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithBool:", objc_msgSend(v8, "someRegionIsSupported"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AAB0];
  }

  return v9;
}

- (id)requirementDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HKFeatureAvailabilityRegionAvailabilityRequirement featureIdentifier](self, "featureIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("At least one country must be supported for %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
