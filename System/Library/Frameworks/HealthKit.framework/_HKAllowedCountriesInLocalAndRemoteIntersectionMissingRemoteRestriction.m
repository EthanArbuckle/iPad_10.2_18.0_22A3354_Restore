@implementation _HKAllowedCountriesInLocalAndRemoteIntersectionMissingRemoteRestriction

- (_HKAllowedCountriesInLocalAndRemoteIntersectionMissingRemoteRestriction)initWithLocalCountrySet:(id)a3 remoteState:(int64_t)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  _HKAllowedCountriesInLocalAndRemoteIntersectionMissingRemoteRestriction *v13;
  void *v15;

  v7 = a3;
  if (a4 == 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAllowedCountries.m"), 274, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("remoteState != HKRemoteAllowedCountriesStateReady"));

  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "contentVersion"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if ((unint64_t)(a4 - 1) > 4)
    v11 = CFSTR("unknown");
  else
    v11 = *(&off_1E37EE370 + a4 - 1);
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@_%@_%@"), CFSTR("intersectionOfLocalAndRemoteSet"), v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (_HKAllowedCountriesInLocalAndRemoteIntersectionMissingRemoteRestriction *)-[HKAllowedCountries _initWithCategory:version:localCountrySet:remoteState:remoteCountrySet:](self, 2, v12, v7, a4, 0);

  return v13;
}

- (unint64_t)ineligibilityReasonsForOnboardingCountryCode:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

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
  v8 = -[HKAllowedCountries remoteState](self, "remoteState");
  v9 = v7 | 4;
  v10 = v7 | 2;
  if (v8 != 2)
    v10 = v7;
  if (v8 != 3)
    v9 = v10;
  if (v8 == 4)
    v11 = v7 | 0x10;
  else
    v11 = v9;

  return v11;
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
