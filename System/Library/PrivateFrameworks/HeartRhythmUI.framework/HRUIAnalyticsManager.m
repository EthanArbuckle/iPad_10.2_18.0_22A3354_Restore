@implementation HRUIAnalyticsManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  return (id)sharedManager_sharedManager;
}

void __37__HRUIAnalyticsManager_sharedManager__block_invoke()
{
  HRUIAnalyticsManager *v0;
  void *v1;

  v0 = objc_alloc_init(HRUIAnalyticsManager);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

}

- (HRUIAnalyticsManager)init
{
  HRUIAnalyticsManager *v2;
  HRUIAnalyticsManager *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSString *productType;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HRUIAnalyticsManager;
  v2 = -[HRUIAnalyticsManager init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_currentAtrialFibrillationOnboardingStep = -1;
    v2->_currentElectrocardiogramOnboardingStep = -1;
    objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getActivePairedDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForProperty:", *MEMORY[0x24BE6B3B0]);
    v6 = objc_claimAutoreleasedReturnValue();
    productType = v3->_productType;
    v3->_productType = (NSString *)v6;

  }
  return v3;
}

- (void)trackAtrialFibrillationDetectionOnboardingStep:(int64_t)a3 forOnboardingVersion:(int64_t)a4 countryCode:(id)a5 provenance:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *productType;
  NSObject *v16;
  NSString *v17;
  int v18;
  int64_t v19;
  __int16 v20;
  int64_t v21;
  __int16 v22;
  NSString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  if (self->_currentAtrialFibrillationOnboardingStep < a3)
  {
    self->_currentAtrialFibrillationOnboardingStep = a3;
    v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("version"));

    -[HRUIAnalyticsManager _stringFromHRUIAtrialFibrillationDetectionOnboardingStep:](self, "_stringFromHRUIAtrialFibrillationDetectionOnboardingStep:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("stepName"));

    -[HRUIAnalyticsManager _stringFromProvenance:](self, "_stringFromProvenance:", a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("provenance"));

    productType = self->_productType;
    if (productType)
      objc_msgSend(v11, "setObject:forKey:", productType, CFSTR("watchProductType"));
    if (v10)
      objc_msgSend(v11, "setObject:forKey:", v10, CFSTR("countryCode"));
    _HKInitializeLogging();
    v16 = *MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_productType;
      v18 = 134218498;
      v19 = a3;
      v20 = 2048;
      v21 = a6;
      v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_215454000, v16, OS_LOG_TYPE_DEFAULT, "Completed atrial fibrillation onboarding step: %ld with provenance: %ld _productType %@", (uint8_t *)&v18, 0x20u);
    }
    -[HRUIAnalyticsManager _sendAnalyticsEvent:withPayload:](self, "_sendAnalyticsEvent:withPayload:", CFSTR("com.apple.health.HeartRhythm.AtrialFibrillationDetectionOnboardingStep"), v11);

  }
}

- (void)trackElectrocardiogramOnboardingStep:(int64_t)a3 forOnboardingType:(int64_t)a4 onboardingVersion:(id)a5 countryCode:(id)a6 provenance:(int64_t)a7
{
  id v12;
  objc_class *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *productType;
  NSObject *v22;
  NSString *v23;
  int v24;
  int64_t v25;
  __int16 v26;
  int64_t v27;
  __int16 v28;
  NSString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v12 = a6;
  if (self->_currentElectrocardiogramOnboardingStep < a3)
  {
    self->_currentElectrocardiogramOnboardingStep = a3;
    v13 = (objc_class *)MEMORY[0x24BDBCED8];
    v14 = a5;
    v15 = objc_alloc_init(v13);
    -[HRUIAnalyticsManager _stringAlgorithmVersionFromOnboardingVersion:](self, "_stringAlgorithmVersionFromOnboardingVersion:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("algorithmVersion"));

    -[HRUIAnalyticsManager _stringFromOnboardingType:](self, "_stringFromOnboardingType:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("onboardingFlowType"));

    -[HRUIAnalyticsManager _stringFromOnboardingVersion:](self, "_stringFromOnboardingVersion:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setObject:forKey:", v18, CFSTR("version"));
    -[HRUIAnalyticsManager _stringFromHRUIElectrocardiogramOnboardingStep:](self, "_stringFromHRUIElectrocardiogramOnboardingStep:", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v19, CFSTR("stepName"));

    -[HRUIAnalyticsManager _stringFromProvenance:](self, "_stringFromProvenance:", a7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v20, CFSTR("provenance"));

    productType = self->_productType;
    if (productType)
      objc_msgSend(v15, "setObject:forKey:", productType, CFSTR("watchProductType"));
    if (v12)
      objc_msgSend(v15, "setObject:forKey:", v12, CFSTR("countryCode"));
    _HKInitializeLogging();
    v22 = *MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
    {
      v23 = self->_productType;
      v24 = 134218498;
      v25 = a3;
      v26 = 2048;
      v27 = a7;
      v28 = 2112;
      v29 = v23;
      _os_log_impl(&dword_215454000, v22, OS_LOG_TYPE_DEFAULT, "Completed electrocardiogram onboarding step: %ld with provenance: %ld productType %@", (uint8_t *)&v24, 0x20u);
    }
    -[HRUIAnalyticsManager _sendAnalyticsEvent:withPayload:](self, "_sendAnalyticsEvent:withPayload:", CFSTR("com.apple.health.HeartRhythm.ElectrocardiogramOnboardingStep"), v15);

  }
}

- (void)trackElectrocardiogramDataTypeViewed
{
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("type");
  v5[0] = CFSTR("Data Type Viewed");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRUIAnalyticsManager _sendAnalyticsEvent:withPayload:](self, "_sendAnalyticsEvent:withPayload:", CFSTR("com.apple.health.HeartRhythm.ElectrocardiogramDataTypeInteraction"), v3);

}

- (void)trackElectrocardiogramPDFViewed
{
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("type");
  v5[0] = CFSTR("PDF Viewed");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRUIAnalyticsManager _sendAnalyticsEvent:withPayload:](self, "_sendAnalyticsEvent:withPayload:", CFSTR("com.apple.health.HeartRhythm.ElectrocardiogramDataTypeInteraction"), v3);

}

- (void)trackElectrocardiogramPDFShared
{
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("type");
  v5[0] = CFSTR("PDF Shared");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRUIAnalyticsManager _sendAnalyticsEvent:withPayload:](self, "_sendAnalyticsEvent:withPayload:", CFSTR("com.apple.health.HeartRhythm.ElectrocardiogramDataTypeInteraction"), v3);

}

- (void)trackElectrocardiogramPDFSharedFrom:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("type");
  -[HRUIAnalyticsManager _pdfSharedStringFromProvenance:](self, "_pdfSharedStringFromProvenance:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRUIAnalyticsManager _sendAnalyticsEvent:withPayload:](self, "_sendAnalyticsEvent:withPayload:", CFSTR("com.apple.health.HeartRhythm.ElectrocardiogramDataTypeInteraction"), v5);

}

- (void)_sendAnalyticsEvent:(id)a3 withPayload:(id)a4
{
  AnalyticsSendEvent();
}

- (id)_pdfSharedStringFromProvenance:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("PDF Shared");
  if (a3 == 1)
    v3 = CFSTR("PDF Shared from PDF Viewer");
  if (a3)
    return (id)v3;
  else
    return CFSTR("PDF Shared from Data Type Room");
}

- (id)_stringFromHRUIAtrialFibrillationDetectionOnboardingStep:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return CFSTR("Unknown");
  else
    return off_24D34A710[a3];
}

- (id)_stringFromHRUIElectrocardiogramOnboardingStep:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 9)
    return CFSTR("Unknown");
  else
    return off_24D34A738[a3 - 1];
}

- (id)_stringFromProvenance:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return CFSTR("Unknown");
  else
    return off_24D34A788[a3 - 1];
}

- (id)_stringFromOnboardingType:(int64_t)a3
{
  if (a3)
    return CFSTR("Update");
  else
    return CFSTR("Full");
}

- (id)_stringFromOnboardingVersion:(id)a3
{
  if (!a3)
    return CFSTR("Unknown");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(a3, "integerValue"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_stringAlgorithmVersionFromOnboardingVersion:(id)a3
{
  uint64_t v3;

  if (!a3)
    return CFSTR("Unknown");
  v3 = objc_msgSend(MEMORY[0x24BDD3B70], "algorithmVersionForOnboardingVersion:", objc_msgSend(a3, "integerValue"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)currentAtrialFibrillationOnboardingStep
{
  return self->_currentAtrialFibrillationOnboardingStep;
}

- (void)setCurrentAtrialFibrillationOnboardingStep:(int64_t)a3
{
  self->_currentAtrialFibrillationOnboardingStep = a3;
}

- (int64_t)currentElectrocardiogramOnboardingStep
{
  return self->_currentElectrocardiogramOnboardingStep;
}

- (void)setCurrentElectrocardiogramOnboardingStep:(int64_t)a3
{
  self->_currentElectrocardiogramOnboardingStep = a3;
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_storeStrong((id *)&self->_productType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productType, 0);
}

@end
