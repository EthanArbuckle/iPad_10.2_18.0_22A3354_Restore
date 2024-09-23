@implementation HDBackgroundFeatureDeliveryAnalyticsEvent

- (HDBackgroundFeatureDeliveryAnalyticsEvent)initWithFeatureIdentifier:(id)a3 eventType:(id)a4 countryCode:(id)a5 countryCodeProvenance:(int64_t)a6 errorCategory:(id)a7 errorDetail:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  HDBackgroundFeatureDeliveryAnalyticsEvent *v19;
  uint64_t v20;
  NSString *featureIdentifier;
  uint64_t v22;
  NSString *eventType;
  uint64_t v24;
  NSString *countryCode;
  uint64_t v26;
  NSString *errorCategory;
  uint64_t v28;
  NSString *errorDetail;
  objc_super v31;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v31.receiver = self;
  v31.super_class = (Class)HDBackgroundFeatureDeliveryAnalyticsEvent;
  v19 = -[HDBackgroundFeatureDeliveryAnalyticsEvent init](&v31, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    featureIdentifier = v19->_featureIdentifier;
    v19->_featureIdentifier = (NSString *)v20;

    v22 = objc_msgSend(v15, "copy");
    eventType = v19->_eventType;
    v19->_eventType = (NSString *)v22;

    v24 = objc_msgSend(v16, "copy");
    countryCode = v19->_countryCode;
    v19->_countryCode = (NSString *)v24;

    v19->_countryCodeProvenance = a6;
    v26 = objc_msgSend(v17, "copy");
    errorCategory = v19->_errorCategory;
    v19->_errorCategory = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    errorDetail = v19->_errorDetail;
    v19->_errorDetail = (NSString *)v28;

  }
  return v19;
}

- (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.health.location.gated.delivery.event");
}

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  NSString *featureIdentifier;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("eventType");
  v18[1] = CFSTR("featureIdentifier");
  featureIdentifier = self->_featureIdentifier;
  v19[0] = self->_eventType;
  v19[1] = featureIdentifier;
  v18[2] = CFSTR("provenance");
  v6 = a3;
  NSStringFromHKOnboardingCompletionCountryCodeProvenance();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "setObject:forKeyedSubscript:", self->_errorCategory, CFSTR("errorCategory"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", self->_errorDetail, CFSTR("errorDetail"));
  objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", 275);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rolloutIdentifiersWithNamespaceName:", *MEMORY[0x1E0CB56B0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "factorPackId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("OTAFactorPackID"));

  objc_msgSend(v6, "environmentDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "isImproveHealthAndActivityEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("isImproveHealthAndActivityAllowed"));

  v16 = (void *)objc_msgSend(v9, "copy");
  return v16;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  NSString *countryCode;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  countryCode = self->_countryCode;
  if (countryCode)
  {
    v7 = CFSTR("countryCode");
    v8[0] = countryCode;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA70];
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDetail, 0);
  objc_storeStrong((id *)&self->_errorCategory, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end
