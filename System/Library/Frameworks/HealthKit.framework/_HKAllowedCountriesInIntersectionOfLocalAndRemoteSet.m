@implementation _HKAllowedCountriesInIntersectionOfLocalAndRemoteSet

- (_HKAllowedCountriesInIntersectionOfLocalAndRemoteSet)initWithLocalCountrySet:(id)a3 remoteCountrySet:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _HKAllowedCountriesInIntersectionOfLocalAndRemoteSet *v13;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v9, "contentVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "contentVersion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@_%@_%@"), CFSTR("intersectionOfLocalAndRemoteSet"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (_HKAllowedCountriesInIntersectionOfLocalAndRemoteSet *)-[HKAllowedCountries _initWithCategory:version:localCountrySet:remoteState:remoteCountrySet:](self, 2, v12, v9, 5, v8);

  return v13;
}

- (unint64_t)ineligibilityReasonsForOnboardingCountryCode:(id)a3
{
  id v4;
  void *v5;
  int v6;
  unint64_t v7;
  void *v8;
  char v9;

  v4 = a3;
  if (v4)
  {
    -[HKAllowedCountries localCountrySet](self, "localCountrySet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsCountryCode:", v4);

    if (v6)
      v7 = 0;
    else
      v7 = 8;
    -[HKAllowedCountries remoteCountrySet](self, "remoteCountrySet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsCountryCode:", v4);

    if ((v9 & 1) == 0)
      v7 |= 0x20uLL;
  }
  else
  {
    v7 = 40;
  }

  return v7;
}

- (BOOL)someRegionIsSupported
{
  void *v3;
  int v4;
  void *v5;
  int v6;

  -[HKAllowedCountries localCountrySet](self, "localCountrySet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEmpty");

  if (v4)
  {
    -[HKAllowedCountries remoteCountrySet](self, "remoteCountrySet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEmpty") ^ 1;

  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

@end
