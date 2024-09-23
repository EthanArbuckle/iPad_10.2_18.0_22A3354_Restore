@implementation HKFeatureAvailabilityLocalRequirementEvaluationContext

- (id)currentCountryCode
{
  NSString **p_currentCountryCode;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  objc_super v7;

  p_currentCountryCode = &self->_currentCountryCode;
  if (self->_currentCountryCode)
  {
    ++self->__unitTest_cacheHits;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HKFeatureAvailabilityLocalRequirementEvaluationContext;
    -[HKFeatureAvailabilityRequirementEvaluationDataSource currentCountryCode](&v7, sel_currentCountryCode);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      v5 = (__CFString *)v3;
    else
      v5 = CFSTR("NIL");
    objc_storeStrong((id *)p_currentCountryCode, v5);

  }
  if (-[NSString isEqualToString:](*p_currentCountryCode, "isEqualToString:", CFSTR("NIL")))
    return 0;
  else
    return *p_currentCountryCode;
}

- (id)onboardingEligibilityForFeatureWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSMutableDictionary *eligibilityByFeatureIdentifier;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  eligibilityByFeatureIdentifier = self->_eligibilityByFeatureIdentifier;
  if (!eligibilityByFeatureIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->_eligibilityByFeatureIdentifier;
    self->_eligibilityByFeatureIdentifier = v8;

    eligibilityByFeatureIdentifier = self->_eligibilityByFeatureIdentifier;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](eligibilityByFeatureIdentifier, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    ++self->__unitTest_cacheHits;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_eligibilityByFeatureIdentifier, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HKFeatureAvailabilityLocalRequirementEvaluationContext;
    -[HKFeatureAvailabilityRequirementEvaluationDataSource onboardingEligibilityForFeatureWithIdentifier:error:](&v13, sel_onboardingEligibilityForFeatureWithIdentifier_error_, v6, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_eligibilityByFeatureIdentifier, "setObject:forKeyedSubscript:", v11, v6);
  }

  return v11;
}

- (id)onboardingEligibilityForFeatureWithIdentifier:(id)a3 countryCode:(id)a4 error:(id *)a5
{
  id v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  NSMutableDictionary *eligibilityByCountryCodeByFeatureIdentifier;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v8 = a3;
  v9 = (__CFString *)a4;
  v10 = v9;
  v11 = CFSTR("NIL");
  if (v9)
    v11 = v9;
  v12 = v11;
  eligibilityByCountryCodeByFeatureIdentifier = self->_eligibilityByCountryCodeByFeatureIdentifier;
  if (!eligibilityByCountryCodeByFeatureIdentifier)
  {
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v15 = self->_eligibilityByCountryCodeByFeatureIdentifier;
    self->_eligibilityByCountryCodeByFeatureIdentifier = v14;

    eligibilityByCountryCodeByFeatureIdentifier = self->_eligibilityByCountryCodeByFeatureIdentifier;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](eligibilityByCountryCodeByFeatureIdentifier, "objectForKeyedSubscript:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_eligibilityByCountryCodeByFeatureIdentifier, "setObject:forKeyedSubscript:", v17, v8);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_eligibilityByCountryCodeByFeatureIdentifier, "objectForKeyedSubscript:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    ++self->__unitTest_cacheHits;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_eligibilityByCountryCodeByFeatureIdentifier, "objectForKeyedSubscript:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

    goto LABEL_12;
  }
  v23.receiver = self;
  v23.super_class = (Class)HKFeatureAvailabilityLocalRequirementEvaluationContext;
  -[HKFeatureAvailabilityRequirementEvaluationDataSource onboardingEligibilityForFeatureWithIdentifier:countryCode:error:](&v23, sel_onboardingEligibilityForFeatureWithIdentifier_countryCode_error_, v8, v10, a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_eligibilityByCountryCodeByFeatureIdentifier, "objectForKeyedSubscript:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, v12);
    goto LABEL_11;
  }
LABEL_12:

  return v21;
}

- (id)onboardingRecordForFeatureWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSMutableDictionary *onboardingRecordByFeatureIdentifier;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  onboardingRecordByFeatureIdentifier = self->_onboardingRecordByFeatureIdentifier;
  if (!onboardingRecordByFeatureIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->_onboardingRecordByFeatureIdentifier;
    self->_onboardingRecordByFeatureIdentifier = v8;

    onboardingRecordByFeatureIdentifier = self->_onboardingRecordByFeatureIdentifier;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](onboardingRecordByFeatureIdentifier, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    ++self->__unitTest_cacheHits;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_onboardingRecordByFeatureIdentifier, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HKFeatureAvailabilityLocalRequirementEvaluationContext;
    -[HKFeatureAvailabilityRequirementEvaluationDataSource onboardingRecordForFeatureWithIdentifier:error:](&v13, sel_onboardingRecordForFeatureWithIdentifier_error_, v6, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_onboardingRecordByFeatureIdentifier, "setObject:forKeyedSubscript:", v11, v6);
  }

  return v11;
}

- (id)regionAvailabilityForFeatureWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSMutableDictionary *regionAvailabilityByFeatureIdentifier;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  regionAvailabilityByFeatureIdentifier = self->_regionAvailabilityByFeatureIdentifier;
  if (!regionAvailabilityByFeatureIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->_regionAvailabilityByFeatureIdentifier;
    self->_regionAvailabilityByFeatureIdentifier = v8;

    regionAvailabilityByFeatureIdentifier = self->_regionAvailabilityByFeatureIdentifier;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](regionAvailabilityByFeatureIdentifier, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    ++self->__unitTest_cacheHits;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_regionAvailabilityByFeatureIdentifier, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HKFeatureAvailabilityLocalRequirementEvaluationContext;
    -[HKFeatureAvailabilityRequirementEvaluationDataSource regionAvailabilityForFeatureWithIdentifier:error:](&v13, sel_regionAvailabilityForFeatureWithIdentifier_error_, v6, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_regionAvailabilityByFeatureIdentifier, "setObject:forKeyedSubscript:", v11, v6);
  }

  return v11;
}

- (id)isWatchAppInstalledWithBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSMutableDictionary *watchAppInstallationStateByBundleIdentifier;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  watchAppInstallationStateByBundleIdentifier = self->_watchAppInstallationStateByBundleIdentifier;
  if (!watchAppInstallationStateByBundleIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->_watchAppInstallationStateByBundleIdentifier;
    self->_watchAppInstallationStateByBundleIdentifier = v8;

    watchAppInstallationStateByBundleIdentifier = self->_watchAppInstallationStateByBundleIdentifier;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](watchAppInstallationStateByBundleIdentifier, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    ++self->__unitTest_cacheHits;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_watchAppInstallationStateByBundleIdentifier, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HKFeatureAvailabilityLocalRequirementEvaluationContext;
    -[HKFeatureAvailabilityRequirementEvaluationDataSource isWatchAppInstalledWithBundleIdentifier:error:](&v13, sel_isWatchAppInstalledWithBundleIdentifier_error_, v6, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_watchAppInstallationStateByBundleIdentifier, "setObject:forKeyedSubscript:", v11, v6);
  }

  return v11;
}

- (id)featureStatusForFeatureWithIdentifier:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *featureStatusByIdentifierAndContext;
  HKFeatureIdentifierAndContext *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  if (!self->_featureStatusByIdentifierAndContext)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    featureStatusByIdentifierAndContext = self->_featureStatusByIdentifierAndContext;
    self->_featureStatusByIdentifierAndContext = v10;

  }
  v12 = -[HKFeatureIdentifierAndContext initWithFeatureIdentifier:context:]([HKFeatureIdentifierAndContext alloc], "initWithFeatureIdentifier:context:", v8, v9);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_featureStatusByIdentifierAndContext, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    ++self->__unitTest_cacheHits;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_featureStatusByIdentifierAndContext, "objectForKeyedSubscript:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)HKFeatureAvailabilityLocalRequirementEvaluationContext;
    -[HKFeatureAvailabilityRequirementEvaluationDataSource featureStatusForFeatureWithIdentifier:context:error:](&v16, sel_featureStatusForFeatureWithIdentifier_context_error_, v8, v9, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_featureStatusByIdentifierAndContext, "setObject:forKeyedSubscript:", v14, v12);
  }

  return v14;
}

- (int64_t)_unitTest_cacheHits
{
  return self->__unitTest_cacheHits;
}

- (void)set_unitTest_cacheHits:(int64_t)a3
{
  self->__unitTest_cacheHits = a3;
}

- (NSMutableDictionary)eligibilityByFeatureIdentifier
{
  return self->_eligibilityByFeatureIdentifier;
}

- (void)setEligibilityByFeatureIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_eligibilityByFeatureIdentifier, a3);
}

- (NSMutableDictionary)eligibilityByCountryCodeByFeatureIdentifier
{
  return self->_eligibilityByCountryCodeByFeatureIdentifier;
}

- (void)setEligibilityByCountryCodeByFeatureIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_eligibilityByCountryCodeByFeatureIdentifier, a3);
}

- (NSMutableDictionary)onboardingRecordByFeatureIdentifier
{
  return self->_onboardingRecordByFeatureIdentifier;
}

- (void)setOnboardingRecordByFeatureIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingRecordByFeatureIdentifier, a3);
}

- (NSMutableDictionary)regionAvailabilityByFeatureIdentifier
{
  return self->_regionAvailabilityByFeatureIdentifier;
}

- (void)setRegionAvailabilityByFeatureIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_regionAvailabilityByFeatureIdentifier, a3);
}

- (NSMutableDictionary)watchAppInstallationStateByBundleIdentifier
{
  return self->_watchAppInstallationStateByBundleIdentifier;
}

- (void)setWatchAppInstallationStateByBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_watchAppInstallationStateByBundleIdentifier, a3);
}

- (NSMutableDictionary)featureStatusByIdentifierAndContext
{
  return self->_featureStatusByIdentifierAndContext;
}

- (void)setFeatureStatusByIdentifierAndContext:(id)a3
{
  objc_storeStrong((id *)&self->_featureStatusByIdentifierAndContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureStatusByIdentifierAndContext, 0);
  objc_storeStrong((id *)&self->_watchAppInstallationStateByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_regionAvailabilityByFeatureIdentifier, 0);
  objc_storeStrong((id *)&self->_onboardingRecordByFeatureIdentifier, 0);
  objc_storeStrong((id *)&self->_eligibilityByCountryCodeByFeatureIdentifier, 0);
  objc_storeStrong((id *)&self->_eligibilityByFeatureIdentifier, 0);
  objc_storeStrong((id *)&self->_currentCountryCode, 0);
}

@end
