@implementation HKOnboardingUIErrorAnalyticsEvent

- (HKOnboardingUIErrorAnalyticsEvent)initWithFeatureIdentifier:(id)a3 featureVersion:(id)a4 countryCode:(id)a5 step:(id)a6 onboardingEligibility:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  HKOnboardingUIErrorAnalyticsEvent *v20;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  HKAnalyticsErrorCategoryForFeatureAvailabilityOnboardingEligibility();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  HKAnalyticsErrorDetailsForFeatureAvailabilityOnboardingEligibility();
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  HKOTAFactorPackID();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HKOnboardingUIErrorAnalyticsEvent initWithFeatureIdentifier:featureVersion:countryCode:step:errorCategory:errorDetail:OTAFactorPackID:](self, "initWithFeatureIdentifier:featureVersion:countryCode:step:errorCategory:errorDetail:OTAFactorPackID:", v16, v15, v14, v13, v17, v18, v19);

  return v20;
}

- (HKOnboardingUIErrorAnalyticsEvent)initWithFeatureIdentifier:(id)a3 featureVersion:(id)a4 countryCode:(id)a5 step:(id)a6 onboardingIneligibilityReasons:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  HKOnboardingUIErrorAnalyticsEvent *v18;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  HKAnalyticsErrorCategoryForFeatureAvailabilityOnboardingIneligibilityReasons();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HKAnalyticsErrorDetailsForFeatureAvailabilityOnboardingIneligibilityReasons();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HKOTAFactorPackID();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HKOnboardingUIErrorAnalyticsEvent initWithFeatureIdentifier:featureVersion:countryCode:step:errorCategory:errorDetail:OTAFactorPackID:](self, "initWithFeatureIdentifier:featureVersion:countryCode:step:errorCategory:errorDetail:OTAFactorPackID:", v14, v13, v12, v11, v15, v16, v17);

  return v18;
}

- (HKOnboardingUIErrorAnalyticsEvent)initWithFeatureIdentifier:(id)a3 featureVersion:(id)a4 countryCode:(id)a5 step:(id)a6 errorCategory:(id)a7 errorDetail:(id)a8 OTAFactorPackID:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  HKOnboardingUIErrorAnalyticsEvent *v22;
  uint64_t v23;
  NSString *featureIdentifier;
  uint64_t v25;
  NSString *featureVersion;
  uint64_t v27;
  NSString *countryCode;
  uint64_t v29;
  NSString *step;
  uint64_t v31;
  NSString *errorCategory;
  uint64_t v33;
  NSString *errorDetail;
  uint64_t v35;
  NSString *OTAFactorPackID;
  objc_super v38;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v38.receiver = self;
  v38.super_class = (Class)HKOnboardingUIErrorAnalyticsEvent;
  v22 = -[HKOnboardingUIErrorAnalyticsEvent init](&v38, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v15, "copy");
    featureIdentifier = v22->_featureIdentifier;
    v22->_featureIdentifier = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    featureVersion = v22->_featureVersion;
    v22->_featureVersion = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    countryCode = v22->_countryCode;
    v22->_countryCode = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    step = v22->_step;
    v22->_step = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    errorCategory = v22->_errorCategory;
    v22->_errorCategory = (NSString *)v31;

    v33 = objc_msgSend(v20, "copy");
    errorDetail = v22->_errorDetail;
    v22->_errorDetail = (NSString *)v33;

    v35 = objc_msgSend(v21, "copy");
    OTAFactorPackID = v22->_OTAFactorPackID;
    v22->_OTAFactorPackID = (NSString *)v35;

  }
  return v22;
}

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.health.onboardingerrors");
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_countryCode, CFSTR("countryCode"));
  objc_msgSend(v5, "healthDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "environmentDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ageWithCurrentDate:error:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    HKAnalyticsDecadeBucketedAgeForAge();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CB4708]);

  }
  else
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CB46A8], *MEMORY[0x1E0CB4708]);
  }
  objc_msgSend(v5, "healthDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "biologicalSexWithError:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    HKAnalyticsPropertyValueForBiologicalSex();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CB4718]);

  }
  else
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CB4750], *MEMORY[0x1E0CB4718]);
  }
  v15 = (void *)objc_msgSend(v6, "copy");

  return v15;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_featureIdentifier, CFSTR("featureIdentifier"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_featureVersion, CFSTR("featureVersion"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_step, CFSTR("step"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_errorCategory, CFSTR("errorCategory"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_errorDetail, CFSTR("errorDetail"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_OTAFactorPackID, CFSTR("OTAFactorPackID"));
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "environmentDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithBool:", objc_msgSend(v9, "isImproveHealthAndActivityEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CB4740]);

  objc_msgSend(v6, "environmentDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activePairedDeviceProductType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CB4700]);

  objc_msgSend(v6, "environmentDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activePairedDeviceModelNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("activeWatchPPN"));

  objc_msgSend(v6, "environmentDataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "activePairedDeviceRegionInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("activeWatchRegionInfo"));

  v17 = (void *)objc_msgSend(v7, "copy");
  return v17;
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (NSString)featureVersion
{
  return self->_featureVersion;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)step
{
  return self->_step;
}

- (NSString)errorCategory
{
  return self->_errorCategory;
}

- (NSString)errorDetail
{
  return self->_errorDetail;
}

- (NSString)OTAFactorPackID
{
  return self->_OTAFactorPackID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_OTAFactorPackID, 0);
  objc_storeStrong((id *)&self->_errorDetail, 0);
  objc_storeStrong((id *)&self->_errorCategory, 0);
  objc_storeStrong((id *)&self->_step, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_featureVersion, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end
