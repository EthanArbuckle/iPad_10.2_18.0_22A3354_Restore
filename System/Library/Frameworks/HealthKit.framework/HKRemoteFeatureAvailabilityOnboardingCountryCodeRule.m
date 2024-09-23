@implementation HKRemoteFeatureAvailabilityOnboardingCountryCodeRule

+ (id)ruleIdentifier
{
  return CFSTR("OnboardingCountryCode");
}

- (void)processUserInfo:(id)a3
{
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("OnboardingCountryCode"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[HKRemoteFeatureAvailabilityOnboardingCountryCodeRule setOnboardingCountryCode:](self, "setOnboardingCountryCode:", v4);

}

- (BOOL)evaluate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  -[HKRemoteFeatureAvailabilityOnboardingCountryCodeRule onboardingCountryCode](self, "onboardingCountryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[HKRemoteFeatureAvailabilityOnboardingCountryCodeRule onboardingCountryCode](self, "onboardingCountryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("NIL_COUNTRYCODE")) & 1) != 0)
  {
    -[HKRemoteFeatureAvailabilityBaseRule dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "onboardingCountryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      return 1;
  }
  else
  {

  }
  -[HKRemoteFeatureAvailabilityBaseRule dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "onboardingCountryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKRemoteFeatureAvailabilityOnboardingCountryCodeRule onboardingCountryCode](self, "onboardingCountryCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  return v11;
}

- (NSString)onboardingCountryCode
{
  return self->_onboardingCountryCode;
}

- (void)setOnboardingCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingCountryCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingCountryCode, 0);
}

@end
