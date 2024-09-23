@implementation _HKAllowedInSomeCountriesAvailability

- (_HKAllowedInSomeCountriesAvailability)initWithAllowedCountries:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _HKAllowedInSomeCountriesAvailability *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v5, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("allowedInSomeCountries_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (_HKAllowedInSomeCountriesAvailability *)-[HKRegionAvailability _initWithCategory:version:allowedCountries:](self, 3, v7, v5);

  return v8;
}

- (unint64_t)ineligibilityReasonsForOnboardingCountryCode:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v10;

  v5 = a3;
  -[HKRegionAvailability allowedCountries](self, "allowedCountries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKRegionAvailability.m"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.allowedCountries"));

  }
  -[HKRegionAvailability allowedCountries](self, "allowedCountries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "ineligibilityReasonsForOnboardingCountryCode:", v5);

  return v8 | (v5 == 0);
}

@end
