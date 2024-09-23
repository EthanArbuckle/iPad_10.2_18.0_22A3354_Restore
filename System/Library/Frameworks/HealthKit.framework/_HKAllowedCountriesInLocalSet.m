@implementation _HKAllowedCountriesInLocalSet

- (_HKAllowedCountriesInLocalSet)initWithLocalCountrySet:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _HKAllowedCountriesInLocalSet *v9;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "contentVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("localSet"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (_HKAllowedCountriesInLocalSet *)-[HKAllowedCountries _initWithCategory:version:localCountrySet:remoteState:remoteCountrySet:](self, 1, v8, v6, 1, 0);

  return v9;
}

- (unint64_t)ineligibilityReasonsForOnboardingCountryCode:(id)a3
{
  id v4;
  void *v5;
  char v6;
  unint64_t v7;

  v4 = a3;
  if (v4
    && (-[HKAllowedCountries localCountrySet](self, "localCountrySet"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "containsCountryCode:", v4),
        v5,
        (v6 & 1) != 0))
  {
    v7 = 0;
  }
  else
  {
    v7 = 8;
  }

  return v7;
}

- (BOOL)someRegionIsSupported
{
  void *v2;
  char v3;

  -[HKAllowedCountries localCountrySet](self, "localCountrySet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEmpty") ^ 1;

  return v3;
}

@end
