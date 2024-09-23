@implementation EDCategoryCoreAnalyticsLogger

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__EDCategoryCoreAnalyticsLogger_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_13 != -1)
    dispatch_once(&log_onceToken_13, block);
  return (id)log_log_13;
}

void __36__EDCategoryCoreAnalyticsLogger_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_13;
  log_log_13 = (uint64_t)v1;

}

- (EDCategoryCoreAnalyticsLogger)init
{
  EDCategoryCoreAnalyticsLogger *v2;
  EMCoreAnalyticsCollector *v3;
  EMCoreAnalyticsCollector *analyticsCollector;
  uint64_t v5;
  EFScheduler *analyticsScheduler;
  EDBiomeBlackPearlLogger *v7;
  EDBiomeBlackPearlLogger *biomeCollector;
  EDBiomeBlackPearlLogger *v9;
  EDBiomeBlackPearlLogger *biomeFedStatsCollector;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)EDCategoryCoreAnalyticsLogger;
  v2 = -[EDCategoryCoreAnalyticsLogger init](&v13, sel_init);
  if (v2)
  {
    v3 = (EMCoreAnalyticsCollector *)objc_alloc_init(MEMORY[0x1E0D1E138]);
    analyticsCollector = v2->_analyticsCollector;
    v2->_analyticsCollector = v3;

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.email.EDCategoryCoreAnalyticsLogger.analyticsScheduler"), 9);
    v5 = objc_claimAutoreleasedReturnValue();
    analyticsScheduler = v2->_analyticsScheduler;
    v2->_analyticsScheduler = (EFScheduler *)v5;

    v7 = -[EDBiomeBlackPearlLogger initWithStreamType:]([EDBiomeBlackPearlLogger alloc], "initWithStreamType:", 0);
    biomeCollector = v2->_biomeCollector;
    v2->_biomeCollector = v7;

    v9 = -[EDBiomeBlackPearlLogger initWithStreamType:]([EDBiomeBlackPearlLogger alloc], "initWithStreamType:", 1);
    biomeFedStatsCollector = v2->_biomeFedStatsCollector;
    v2->_biomeFedStatsCollector = v9;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel__sendCategorizationAnalyticsForAppLaunchNotification_, CFSTR("EDClientStateForegroundStateDidChange"), 0);

  }
  return v2;
}

- (id)_defaultModelMetadata
{
  _QWORD v3[11];
  _QWORD v4[12];

  v4[11] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("trialExperimentId");
  v3[1] = CFSTR("trialExperimentDeploymentId");
  v4[0] = CFSTR("NA");
  v4[1] = CFSTR("-1");
  v3[2] = CFSTR("trialExperimentTreatmentId");
  v3[3] = CFSTR("trialRolloutId");
  v4[2] = CFSTR("NA");
  v4[3] = CFSTR("NA");
  v3[4] = CFSTR("trialRolloutDeploymentId");
  v3[5] = CFSTR("trialRolloutFactorPackId");
  v4[4] = CFSTR("-1");
  v4[5] = CFSTR("NA");
  v3[6] = CFSTR("blackPearlModelVersion");
  v3[7] = CFSTR("blackPearlSenderModelVersion");
  v4[6] = CFSTR("NA");
  v4[7] = CFSTR("NA");
  v3[8] = CFSTR("blackPearlBreakthroughVersion");
  v3[9] = CFSTR("blackPearlFinalRuleVersion");
  v4[8] = CFSTR("NA");
  v4[9] = CFSTR("NA");
  v3[10] = CFSTR("reasonCodes");
  v4[10] = CFSTR("NA");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 11);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_modelMetadata:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  __CFString *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[11];
  _QWORD v50[13];

  v50[11] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v49[0] = CFSTR("trialExperimentId");
    objc_msgSend(v5, "experimentID");
    v7 = objc_claimAutoreleasedReturnValue();
    v48 = (void *)v7;
    if (v7)
      v8 = (const __CFString *)v7;
    else
      v8 = CFSTR("NA");
    v50[0] = v8;
    v49[1] = CFSTR("trialExperimentDeploymentId");
    objc_msgSend(v6, "experimentDeploymentID");
    v9 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)v9;
    if (v9)
      v10 = (const __CFString *)v9;
    else
      v10 = CFSTR("-1");
    v50[1] = v10;
    v49[2] = CFSTR("trialExperimentTreatmentId");
    objc_msgSend(v6, "experimentTreatmentID");
    v11 = objc_claimAutoreleasedReturnValue();
    v46 = (void *)v11;
    if (v11)
      v12 = (const __CFString *)v11;
    else
      v12 = CFSTR("NA");
    v50[2] = v12;
    v49[3] = CFSTR("trialRolloutId");
    objc_msgSend(v6, "rolloutID");
    v13 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)v13;
    if (v13)
      v14 = (const __CFString *)v13;
    else
      v14 = CFSTR("NA");
    v50[3] = v14;
    v49[4] = CFSTR("trialRolloutDeploymentId");
    objc_msgSend(v6, "rolloutDeploymentID");
    v15 = objc_claimAutoreleasedReturnValue();
    v44 = (void *)v15;
    if (v15)
      v16 = (const __CFString *)v15;
    else
      v16 = CFSTR("-1");
    v50[4] = v16;
    v49[5] = CFSTR("trialRolloutFactorPackId");
    objc_msgSend(v6, "rolloutFactorPackID");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (const __CFString *)v17;
    else
      v19 = CFSTR("NA");
    v50[5] = v19;
    v49[6] = CFSTR("blackPearlModelVersion");
    objc_msgSend(v6, "modelVersion");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20)
      v22 = (const __CFString *)v20;
    else
      v22 = CFSTR("NA");
    v50[6] = v22;
    v49[7] = CFSTR("blackPearlSenderModelVersion");
    objc_msgSend(v6, "senderModelVersion");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v23)
      v25 = (const __CFString *)v23;
    else
      v25 = CFSTR("NA");
    v50[7] = v25;
    v49[8] = CFSTR("blackPearlBreakthroughVersion");
    objc_msgSend(v6, "tsModelVersion");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v26)
      v28 = (const __CFString *)v26;
    else
      v28 = CFSTR("NA");
    v50[8] = v28;
    v49[9] = CFSTR("blackPearlFinalRuleVersion");
    objc_msgSend(v6, "finalRuleVersion");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    if (v29)
      v31 = (const __CFString *)v29;
    else
      v31 = CFSTR("NA");
    v50[9] = v31;
    v49[10] = CFSTR("reasonCodes");
    objc_msgSend(v6, "reasonCodes");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v6, "reasonCodes");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = &stru_1E94A4508;
    }
    v50[10] = v33;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 11);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {

    }
  }
  else
  {
    +[EDCategoryCoreAnalyticsLogger log](EDCategoryCoreAnalyticsLogger, "log");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[EDCategoryCoreAnalyticsLogger _modelMetadata:].cold.1(v34, v35, v36, v37, v38, v39, v40, v41);

    -[EDCategoryCoreAnalyticsLogger _defaultModelMetadata](self, "_defaultModelMetadata");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v42;
}

- (id)_convertModelMetadata:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[11];
  _QWORD v50[13];

  v50[11] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v49[0] = CFSTR("trialExperimentId");
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D469C8]);
    v6 = objc_claimAutoreleasedReturnValue();
    v48 = (void *)v6;
    if (v6)
      v7 = (const __CFString *)v6;
    else
      v7 = CFSTR("NA");
    v50[0] = v7;
    v49[1] = CFSTR("trialExperimentDeploymentId");
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D469C0]);
    v8 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)v8;
    if (v8)
      v9 = (const __CFString *)v8;
    else
      v9 = CFSTR("-1");
    v50[1] = v9;
    v49[2] = CFSTR("trialExperimentTreatmentId");
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D469D0]);
    v10 = objc_claimAutoreleasedReturnValue();
    v46 = (void *)v10;
    if (v10)
      v11 = (const __CFString *)v10;
    else
      v11 = CFSTR("NA");
    v50[2] = v11;
    v49[3] = CFSTR("trialRolloutId");
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D46A00]);
    v12 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)v12;
    if (v12)
      v13 = (const __CFString *)v12;
    else
      v13 = CFSTR("NA");
    v50[3] = v13;
    v49[4] = CFSTR("trialRolloutDeploymentId");
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D469F0]);
    v14 = objc_claimAutoreleasedReturnValue();
    v44 = (void *)v14;
    if (v14)
      v15 = (const __CFString *)v14;
    else
      v15 = CFSTR("-1");
    v50[4] = v15;
    v49[5] = CFSTR("trialRolloutFactorPackId");
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D469F8]);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = (const __CFString *)v16;
    else
      v18 = CFSTR("NA");
    v50[5] = v18;
    v49[6] = CFSTR("blackPearlModelVersion");
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D469E0]);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = (const __CFString *)v19;
    else
      v21 = CFSTR("NA");
    v50[6] = v21;
    v49[7] = CFSTR("blackPearlSenderModelVersion");
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D46A08]);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    if (v22)
      v24 = (const __CFString *)v22;
    else
      v24 = CFSTR("NA");
    v50[7] = v24;
    v49[8] = CFSTR("blackPearlBreakthroughVersion");
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D46A10]);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    if (v25)
      v27 = (const __CFString *)v25;
    else
      v27 = CFSTR("NA");
    v50[8] = v27;
    v49[9] = CFSTR("blackPearlFinalRuleVersion");
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D469D8]);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    if (v28)
      v30 = (const __CFString *)v28;
    else
      v30 = CFSTR("NA");
    v50[9] = v30;
    v49[10] = CFSTR("reasonCodes");
    v31 = (void *)*MEMORY[0x1E0D469E8];
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D469E8]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v5, "objectForKey:", v31);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDCategoryCoreAnalyticsLogger _getCommmaSeparatedString:](self, "_getCommmaSeparatedString:", v31);
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = CFSTR("NA");
    }
    v50[10] = v33;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 11);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {

    }
  }
  else
  {
    +[EDCategoryCoreAnalyticsLogger log](EDCategoryCoreAnalyticsLogger, "log");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[EDCategoryCoreAnalyticsLogger _convertModelMetadata:].cold.1(v34, v35, v36, v37, v38, v39, v40, v41);

    -[EDCategoryCoreAnalyticsLogger _defaultModelMetadata](self, "_defaultModelMetadata");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v42;
}

- (id)_emSharedModelMetadata
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v25;
  __CFString *v26;
  void *v27;
  __CFString *v28;
  _QWORD v29[10];
  _QWORD v30[12];

  v30[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("BlackPearlExperimentID"));
  v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("BlackPearlExperimentDeploymentID"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("BlackPearlExperimentTreatmentID"));
  v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("BlackPearlRolloutID"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("BlackPearlRolloutDeploymentID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("BlackPearlRolloutFactorPackID"));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("BlackPearlModelVersion"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("BlackPearlSenderModelVersion"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("BlackPearlTSModelVersion"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("BlackPearlFinalRuleVersion"));
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v28;
  if (!v28)
    v9 = CFSTR("NA");
  v30[0] = v9;
  v29[0] = CFSTR("trialExperimentId");
  v29[1] = CFSTR("trialExperimentDeploymentId");
  objc_msgSend(v27, "stringValue");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = CFSTR("NA");
  v13 = v26;
  if (!v26)
    v13 = CFSTR("NA");
  v30[1] = v12;
  v30[2] = v13;
  v29[2] = CFSTR("trialExperimentTreatmentId");
  v29[3] = CFSTR("trialRolloutId");
  if (v3)
    v14 = v3;
  else
    v14 = CFSTR("NA");
  v30[3] = v14;
  v29[4] = CFSTR("trialRolloutDeploymentId");
  objc_msgSend(v25, "stringValue");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (const __CFString *)v15;
  else
    v17 = CFSTR("NA");
  if (v4)
    v18 = v4;
  else
    v18 = CFSTR("NA");
  v30[4] = v17;
  v30[5] = v18;
  v29[5] = CFSTR("trialRolloutFactorPackId");
  v29[6] = CFSTR("blackPearlModelVersion");
  if (v5)
    v19 = v5;
  else
    v19 = CFSTR("NA");
  if (v6)
    v20 = v6;
  else
    v20 = CFSTR("NA");
  v30[6] = v19;
  v30[7] = v20;
  v29[7] = CFSTR("blackPearlSenderModelVersion");
  v29[8] = CFSTR("blackPearlBreakthroughVersion");
  v29[9] = CFSTR("blackPearlFinalRuleVersion");
  if (v7)
    v21 = v7;
  else
    v21 = CFSTR("NA");
  if (v8)
    v22 = v8;
  else
    v22 = CFSTR("NA");
  v30[8] = v21;
  v30[9] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)_getCommmaSeparatedString:(id)a3
{
  objc_msgSend(a3, "componentsJoinedByString:", CFSTR(","));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_getMetadataStringValue:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  v3 = (__CFString *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = CFSTR("NA");
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

- (id)_getMetadataIntValue:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  v3 = (__CFString *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = CFSTR("-1");
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

- (void)_sendCategorizationAnalyticsForAppLaunchNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  EDCategoryCoreAnalyticsLogger *v9;

  v4 = a3;
  -[EDCategoryCoreAnalyticsLogger analyticsScheduler](self, "analyticsScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __86__EDCategoryCoreAnalyticsLogger__sendCategorizationAnalyticsForAppLaunchNotification___block_invoke;
  v7[3] = &unk_1E949B6D0;
  v6 = v4;
  v8 = v6;
  v9 = self;
  objc_msgSend(v5, "performBlock:", v7);

}

void __86__EDCategoryCoreAnalyticsLogger__sendCategorizationAnalyticsForAppLaunchNotification___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("EDClientStateForegroundStateDidChangeKeyIsForeground"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_emSharedModelMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E140]), "initWithEventName:collectionData:", CFSTR("com.apple.mail.categorization.openmailapp"), v4);
    objc_msgSend(*(id *)(a1 + 40), "analyticsCollector");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logOneTimeEvent:", v5);

  }
}

- (void)logCategorizationEventForMessagesWithResult:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  EDCategoryCoreAnalyticsLogger *v9;

  v4 = a3;
  -[EDCategoryCoreAnalyticsLogger analyticsScheduler](self, "analyticsScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__EDCategoryCoreAnalyticsLogger_logCategorizationEventForMessagesWithResult___block_invoke;
  v7[3] = &unk_1E949B6D0;
  v6 = v4;
  v8 = v6;
  v9 = self;
  objc_msgSend(v5, "performBlock:", v7);

}

void __77__EDCategoryCoreAnalyticsLogger_logCategorizationEventForMessagesWithResult___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__EDCategoryCoreAnalyticsLogger_logCategorizationEventForMessagesWithResult___block_invoke_2;
  v6[3] = &unk_1E949BA98;
  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7 = v2;
  v8 = v3;
  v5 = v2;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __77__EDCategoryCoreAnalyticsLogger_logCategorizationEventForMessagesWithResult___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v34 = a2;
  v5 = a3;
  objc_msgSend(v5, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_modelMetadata:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v8);

  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "category");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "subtype"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, CFSTR("predictedCategory"));

  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = *(void **)(a1 + 40);
  objc_msgSend(v5, "category");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "type");
  objc_msgSend(v5, "category");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "_loggingCategoryTypeFromType:isHighImpact:", v15, objc_msgSend(v16, "isHighImpact")));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v17, CFSTR("currCategoryView"));

  objc_msgSend(*(id *)(a1 + 40), "_hashedGlobalMessageId:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v18, CFSTR("messageId"));

  v19 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v34, "dateReceived");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeIntervalSinceNow");
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%.0f"), v21 * -1000.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v22, CFSTR("elapsedTimeSinceEmailReceived"));

  v23 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v34, "categorizationResult");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "category");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "numberWithBool:", objc_msgSend(v25, "isHighImpact"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v26, CFSTR("isBreakthrough"));

  v27 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v34, "account");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "baseAccount");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "numberWithBool:", objc_msgSend(v29, "isAppleAccount"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v30, CFSTR("hasIcloudAccountEnabled"));

  objc_msgSend(*(id *)(a1 + 40), "biomeCollector");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "logEventForMessageID:eventType:messageDictionary:", CFSTR("0"), CFSTR("com.apple.mail.categorization.receive"), *(_QWORD *)(a1 + 32));

  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E140]), "initWithEventName:collectionData:", CFSTR("com.apple.mail.categorization.receive"), *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "analyticsCollector");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "logOneTimeEvent:", v32);

}

- (id)_hashedGlobalMessageId:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D1E230], "randomizedStringForGlobalMessageID:", a3);
}

- (void)_logAllEventsToCoreAnalyticsForMessageID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  v11 = a3;
  -[EDCategoryCoreAnalyticsLogger biomeCollector](self, "biomeCollector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryAllEventsForMessageID:andEventType:", v11, CFSTR("com.apple.mail.categorization.receive"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDCategoryCoreAnalyticsLogger biomeCollector](self, "biomeCollector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryAllEventsForMessageID:andEventType:", v11, CFSTR("com.apple.mail.categorization.read"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDCategoryCoreAnalyticsLogger biomeCollector](self, "biomeCollector");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queryAllEventsForMessageID:andEventType:", v11, CFSTR("com.apple.mail.categorization.recategorize"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__EDCategoryCoreAnalyticsLogger__logAllEventsToCoreAnalyticsForMessageID___block_invoke;
  v14[3] = &unk_1E949BAC0;
  v14[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v14);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __74__EDCategoryCoreAnalyticsLogger__logAllEventsToCoreAnalyticsForMessageID___block_invoke_2;
  v13[3] = &unk_1E949BAC0;
  v13[4] = self;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __74__EDCategoryCoreAnalyticsLogger__logAllEventsToCoreAnalyticsForMessageID___block_invoke_3;
  v12[3] = &unk_1E949BAC0;
  v12[4] = self;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

}

void __74__EDCategoryCoreAnalyticsLogger__logAllEventsToCoreAnalyticsForMessageID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E140]), "initWithEventName:collectionData:", CFSTR("com.apple.mail.categorization.receive"), v5);
  objc_msgSend(*(id *)(a1 + 32), "analyticsCollector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logOneTimeEvent:", v3);

}

void __74__EDCategoryCoreAnalyticsLogger__logAllEventsToCoreAnalyticsForMessageID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E140]), "initWithEventName:collectionData:", CFSTR("com.apple.mail.categorization.read"), v5);
  objc_msgSend(*(id *)(a1 + 32), "analyticsCollector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logOneTimeEvent:", v3);

}

void __74__EDCategoryCoreAnalyticsLogger__logAllEventsToCoreAnalyticsForMessageID___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E140]), "initWithEventName:collectionData:", CFSTR("com.apple.mail.categorization.recategorize"), v5);
  objc_msgSend(*(id *)(a1 + 32), "analyticsCollector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logOneTimeEvent:", v3);

}

- (int64_t)_accountTypeForMessage:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "baseAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isAppleAccount") & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(v4, "isGmailAccount") & 1) != 0)
  {
    v5 = 3;
  }
  else if ((objc_msgSend(v4, "isYahooAccount") & 1) != 0)
  {
    v5 = 4;
  }
  else if ((objc_msgSend(v4, "isExchangeAccount") & 1) != 0)
  {
    v5 = 2;
  }
  else if ((objc_msgSend(v4, "isAOLAccount") & 1) != 0)
  {
    v5 = 5;
  }
  else if (objc_msgSend(v4, "isAppleEmployeeAccount"))
  {
    v5 = 0;
  }
  else
  {
    v5 = 7;
  }

  return v5;
}

- (id)_senderIDFromMessage:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "accountForSender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_mailboxFromMessage:(id)a3
{
  id v3;
  void *v4;
  char v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v3 = a3;
  objc_msgSend(v3, "category");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isHighImpact");

  if ((v5 & 1) != 0)
  {
    v6 = CFSTR("Inbox");
  }
  else
  {
    objc_msgSend(v3, "category");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "type");

    if ((unint64_t)(v8 - 1) >= 3)
    {
      objc_msgSend(v3, "mailbox");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "type");

      if ((unint64_t)(v10 - 1) >= 7)
        v6 = CFSTR("Other");
      else
        v6 = off_1E949BAE0[v10 - 1];
    }
    else
    {
      v6 = CFSTR("BlackPearlMailbox");
    }
  }

  return (id)v6;
}

- (int64_t)_loggingCategoryTypeFromType:(unint64_t)a3 isHighImpact:(BOOL)a4
{
  unint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  unint64_t v11;
  uint64_t v12;

  v4 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0uLL:
      return v4;
    case 1uLL:
      v5 = !a4;
      v6 = 2;
      v7 = 5;
      goto LABEL_7;
    case 2uLL:
      v5 = !a4;
      v6 = 3;
      v7 = 6;
LABEL_7:
      if (v5)
        v4 = v6;
      else
        v4 = v7;
      break;
    case 3uLL:
      if (a4)
        v4 = 4;
      else
        v4 = 1;
      break;
    default:
      +[EDCategoryCoreAnalyticsLogger log](EDCategoryCoreAnalyticsLogger, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 134217984;
        v11 = v4;
        _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Error: No correct category type to log for %lu", (uint8_t *)&v10, 0xCu);
      }

      break;
  }
  return v4;
}

- (EDBiomeBlackPearlLogger)biomeCollector
{
  return self->_biomeCollector;
}

- (void)setBiomeCollector:(id)a3
{
  objc_storeStrong((id *)&self->_biomeCollector, a3);
}

- (EMCoreAnalyticsCollector)analyticsCollector
{
  return self->_analyticsCollector;
}

- (void)setAnalyticsCollector:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsCollector, a3);
}

- (EFScheduler)analyticsScheduler
{
  return self->_analyticsScheduler;
}

- (EDBiomeBlackPearlLogger)biomeFedStatsCollector
{
  return self->_biomeFedStatsCollector;
}

- (void)setBiomeFedStatsCollector:(id)a3
{
  objc_storeStrong((id *)&self->_biomeFedStatsCollector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeFedStatsCollector, 0);
  objc_storeStrong((id *)&self->_analyticsScheduler, 0);
  objc_storeStrong((id *)&self->_analyticsCollector, 0);
  objc_storeStrong((id *)&self->_biomeCollector, 0);
}

- (void)_modelMetadata:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "MEMessageCategorizationResultMetadata is nil, returning default values", a5, a6, a7, a8, 0);
}

- (void)_convertModelMetadata:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "Metadata dictionary is nil, returning default values", a5, a6, a7, a8, 0);
}

@end
