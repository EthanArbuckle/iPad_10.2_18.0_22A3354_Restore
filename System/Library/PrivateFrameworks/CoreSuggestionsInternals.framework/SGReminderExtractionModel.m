@implementation SGReminderExtractionModel

- (id)_init
{
  SGReminderExtractionModel *v2;
  id v3;
  void *v4;
  uint64_t v5;
  _PASLock *lock;
  void *v7;
  SGReminderExtractionModel *v8;
  uint64_t v9;
  _PASNotificationToken *assetUpdateToken;
  objc_super v12;
  _QWORD v13[4];
  SGReminderExtractionModel *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SGReminderExtractionModel;
  v2 = -[SGReminderExtractionModel init](&v15, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D815F0]);
    v4 = (void *)objc_opt_new();
    v5 = objc_msgSend(v3, "initWithGuardedData:", v4);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v5;

    -[SGReminderExtractionModel updateAll](v2, "updateAll");
    +[SGAsset localeAsset](SGAsset, "localeAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __34__SGReminderExtractionModel__init__block_invoke;
    v13[3] = &unk_1E7DAB9B8;
    v8 = v2;
    v14 = v8;
    objc_msgSend(v7, "registerUpdateHandler:", v13);
    v9 = objc_claimAutoreleasedReturnValue();
    assetUpdateToken = v8->_assetUpdateToken;
    v8->_assetUpdateToken = (_PASNotificationToken *)v9;

  }
  v12.receiver = v2;
  v12.super_class = (Class)SGReminderExtractionModel;
  return -[SGReminderExtractionModel init](&v12, sel_init);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[SGAsset localeAsset](SGAsset, "localeAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterUpdateHandlerWithToken:", self->_assetUpdateToken);

  v4.receiver = self;
  v4.super_class = (Class)SGReminderExtractionModel;
  -[SGReminderExtractionModel dealloc](&v4, sel_dealloc);
}

- (void)updateAll
{
  NSDictionary *v3;
  NSDictionary *enrichments;
  NSDictionary *v5;
  NSDictionary *inputTokenMapping;
  NSDictionary *v7;
  NSDictionary *outputConfig;
  NSDictionary *v9;
  NSDictionary *reminderOverrides;
  NSDictionary *v11;
  void *v12;
  void *v13;
  _PASLock *lock;
  id v15;
  _QWORD v16[5];
  id v17;

  objc_msgSend((id)objc_opt_class(), "loadLazyPlistWithBasename:", CFSTR("ReminderPreprocessor"));
  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  enrichments = self->_enrichments;
  self->_enrichments = v3;

  objc_msgSend((id)objc_opt_class(), "loadLazyPlistWithBasename:", CFSTR("ReminderInputMapping"));
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  inputTokenMapping = self->_inputTokenMapping;
  self->_inputTokenMapping = v5;

  objc_msgSend((id)objc_opt_class(), "loadLazyPlistWithBasename:", CFSTR("ReminderOutputMapping"));
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  outputConfig = self->_outputConfig;
  self->_outputConfig = v7;

  objc_msgSend((id)objc_opt_class(), "loadLazyPlistWithBasename:", CFSTR("ReminderOverrides"));
  v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  reminderOverrides = self->_reminderOverrides;
  self->_reminderOverrides = v9;

  v11 = self->_enrichments;
  if (v11)
  {
    -[NSDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("config"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_enrichments, "objectForKeyedSubscript:", CFSTR("config"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("wordBoundary"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    lock = self->_lock;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __38__SGReminderExtractionModel_updateAll__block_invoke;
    v16[3] = &unk_1E7DAB9E0;
    v16[4] = self;
    v17 = v12;
    v15 = v12;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v16);

  }
}

- (id)loadModel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setComputeUnits:", 0);
  +[SGReminderTrialClientWrapper sharedInstance](SGReminderTrialClientWrapper, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length"))
  {
    sgRemindersLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_INFO, "SGReminderExtractionModel: Loading model from trial override at path: %@", buf, 0xCu);
    }

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v6);
  }
  else
  {
    -[SGExtractionModel currentModelURLForModelName:](self, "currentModelURLForModelName:", CFSTR("ReminderModel"));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  if (v8)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:configuration:error:", v8, v3, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      sgRemindersLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v11;
        _os_log_error_impl(&dword_1C3607000, v13, OS_LOG_TYPE_ERROR, "Unable to load model from URL: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }

  return v10;
}

- (id)modelInferences:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  SGExtractionModelCoreMLFeatureWrapper *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v23;
  unint64_t v24;
  id v25;
  id v26;
  uint8_t v27[8];
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (!self->_inputTokenMapping)
  {
    sgRemindersLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v27 = 0;
      _os_log_error_impl(&dword_1C3607000, v12, OS_LOG_TYPE_ERROR, "No inputTokenMapping found", v27, 2u);
    }
    goto LABEL_14;
  }
  if (!self->_outputConfig)
  {
    sgRemindersLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v27 = 0;
      _os_log_error_impl(&dword_1C3607000, v12, OS_LOG_TYPE_ERROR, "No output configuration found.", v27, 2u);
    }
LABEL_14:

    v13 = v5;
    goto LABEL_37;
  }
  v29 = 0;
  *(_QWORD *)v27 = CFSTR("ReminderDissector model inference");
  v6 = mach_absolute_time();
  v28 = v6;
  sgRemindersLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "Preparing model inference", buf, 2u);
  }

  -[SGReminderExtractionModel loadModel](self, "loadModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "inputFromTaggedCharacterRanges:usingTokenMapping:forModel:", v4, self->_inputTokenMapping, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v26 = 0;
      objc_msgSend(v8, "predictionFromFeatures:error:", v9, &v26);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v26;
      if (v10)
      {
        v11 = -[SGExtractionModelCoreMLFeatureWrapper initWithFeatureProvider:]([SGExtractionModelCoreMLFeatureWrapper alloc], "initWithFeatureProvider:", v10);
      }
      else
      {
        sgRemindersLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v31 = *(double *)&v25;
          _os_log_error_impl(&dword_1C3607000, v16, OS_LOG_TYPE_ERROR, "Model inference failed: %@", buf, 0xCu);
        }

        v11 = 0;
      }
      sgRemindersLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v23 = mach_absolute_time();
        v24 = SGMachTimeToNanoseconds(v23 - v6);
        *(_DWORD *)buf = 134217984;
        v31 = (double)v24 * 0.000000001;
        _os_log_debug_impl(&dword_1C3607000, v17, OS_LOG_TYPE_DEBUG, "Model inference done in %f", buf, 0xCu);
      }

      if (v11)
      {
        objc_msgSend((id)objc_opt_class(), "modelOutputFromOutputMapping:modelOutput:modelInput:", self->_outputConfig, v11, v9);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        if (v18)
          v20 = (void *)v18;
        else
          v20 = v5;
        v13 = v20;

      }
      else
      {
        sgRemindersLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1C3607000, v21, OS_LOG_TYPE_ERROR, "Unable to convert to instantiate SGExtractionModelCoreMLFeatureWrapper", buf, 2u);
        }

        v13 = v5;
      }

    }
    else
    {
      sgRemindersLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C3607000, v15, OS_LOG_TYPE_ERROR, "Unable to load model features.", buf, 2u);
      }

      v13 = v5;
    }

  }
  else
  {
    sgRemindersLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v14, OS_LOG_TYPE_ERROR, "Model initialization failed", buf, 2u);
    }

    v13 = v5;
  }

  SGRecordMeasurementState(v27);
LABEL_37:

  return v13;
}

- (id)enrichments
{
  void *v3;
  NSDictionary *v4;
  NSDictionary *enrichments;
  NSDictionary *v6;

  +[SGReminderTrialClientWrapper sharedInstance](SGReminderTrialClientWrapper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reminderEnrichments");
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  enrichments = v4;
  if (!v4)
    enrichments = self->_enrichments;
  v6 = enrichments;

  return v6;
}

- (id)reminderOverrides
{
  void *v3;
  NSDictionary *v4;
  NSDictionary *reminderOverrides;
  NSDictionary *v6;

  +[SGReminderTrialClientWrapper sharedInstance](SGReminderTrialClientWrapper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reminderOverrides");
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  reminderOverrides = v4;
  if (!v4)
    reminderOverrides = self->_reminderOverrides;
  v6 = reminderOverrides;

  return v6;
}

- (id)inputTokenMapping
{
  void *v3;
  NSDictionary *v4;
  NSDictionary *inputTokenMapping;
  NSDictionary *v6;

  +[SGReminderTrialClientWrapper sharedInstance](SGReminderTrialClientWrapper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reminderInputMapping");
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  inputTokenMapping = v4;
  if (!v4)
    inputTokenMapping = self->_inputTokenMapping;
  v6 = inputTokenMapping;

  return v6;
}

- (id)outputConfig
{
  void *v3;
  NSDictionary *v4;
  NSDictionary *outputConfig;
  NSDictionary *v6;

  +[SGReminderTrialClientWrapper sharedInstance](SGReminderTrialClientWrapper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reminderOutputMapping");
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  outputConfig = v4;
  if (!v4)
    outputConfig = self->_outputConfig;
  v6 = outputConfig;

  return v6;
}

- (BOOL)hasWhitelistedVerbInContent:(id)a3
{
  uint64_t v3;

  return -[SGReminderExtractionModel _whitelistedVerbRangeInContent:](self, "_whitelistedVerbRangeInContent:", a3) != 0x7FFFFFFFFFFFFFFFLL
      || v3 != 0;
}

- (id)whitelistedVerbInContent:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = -[SGReminderExtractionModel _whitelistedVerbRangeInContent:](self, "_whitelistedVerbRangeInContent:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL && v6 == 0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v4, "substringWithRange:", v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (_NSRange)_whitelistedVerbRangeInContent:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _NSRange result;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__11000;
  v17 = __Block_byref_object_dispose__11001;
  lock = self->_lock;
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__SGReminderExtractionModel__whitelistedVerbRangeInContent___block_invoke;
  v12[3] = &unk_1E7DABA10;
  v12[4] = &v13;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v12);
  v6 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  if (v6)
  {
    v7 = objc_msgSend(v6, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
    v9 = v8;
  }
  else
  {
    v9 = 0;
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v10 = v7;
  v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

- (id)whitelistedRangesInContent:(id)a3
{
  id v4;
  _PASLock *lock;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__11000;
  v25 = __Block_byref_object_dispose__11001;
  v26 = 0;
  v26 = (id)objc_opt_new();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__11000;
  v19 = __Block_byref_object_dispose__11001;
  lock = self->_lock;
  v6 = MEMORY[0x1E0C809B0];
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__SGReminderExtractionModel_whitelistedRangesInContent___block_invoke;
  v14[3] = &unk_1E7DABA10;
  v14[4] = &v15;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v14);
  v7 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  if (v7 && objc_msgSend(v4, "length"))
  {
    v8 = objc_msgSend(v4, "length");
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __56__SGReminderExtractionModel_whitelistedRangesInContent___block_invoke_2;
    v11[3] = &unk_1E7DAD288;
    v12 = v4;
    v13 = &v21;
    objc_msgSend(v7, "enumerateMatchesInString:options:range:usingBlock:", v12, 0, 0, v8, v11);

  }
  v9 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v9;
}

- (id)modelDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SGReminderExtractionModel loadModel](self, "loadModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v2, "modelDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E870]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setReminderOverridesForTesting:(id)a3
{
  objc_storeStrong((id *)&self->_reminderOverrides, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_reminderOverrides, 0);
  objc_storeStrong((id *)&self->_outputConfig, 0);
  objc_storeStrong((id *)&self->_inputTokenMapping, 0);
  objc_storeStrong((id *)&self->_enrichments, 0);
  objc_storeStrong((id *)&self->_assetUpdateToken, 0);
}

void __56__SGReminderExtractionModel_whitelistedRangesInContent___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 8));
}

uint64_t __56__SGReminderExtractionModel_whitelistedRangesInContent___block_invoke_2(uint64_t result, void *a2)
{
  uint64_t v2;
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  if (a2)
  {
    v2 = result;
    v3 = a2;
    v4 = objc_msgSend(v3, "range");
    v5 = 50;
    if (v4 > 0x32)
      v5 = v4;
    v6 = v5 - 50;
    v7 = objc_msgSend(*(id *)(v2 + 32), "length");
    v8 = objc_msgSend(v3, "range");
    v10 = v9;

    v11 = v10 + v8 + 50;
    if (v7 < v11)
      v11 = v7;
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 40), "addIndexesInRange:", v6, v11 - v6);
  }
  return result;
}

void __60__SGReminderExtractionModel__whitelistedVerbRangeInContent___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 8));
}

void __38__SGReminderExtractionModel_updateAll__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;

  v9 = a2;
  v3 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", CFSTR("verbsMapping"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  +[SGReminderMessage regexFromJoinedArray:wordBoundary:](SGReminderMessage, "regexFromJoinedArray:wordBoundary:", v6, *(_QWORD *)(a1 + 40));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v9[1];
  v9[1] = v7;

}

uint64_t __34__SGReminderExtractionModel__init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAll");
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_11057 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_11057, &__block_literal_global_11058);
  return (id)sharedInstance__pasExprOnceResult_11059;
}

+ (id)inputFromTaggedCharacterRanges:(id)a3 usingTokenMapping:(id)a4 forModel:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  SGExtractionModelCoreMLFeatureWrapper *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "inputDictFromTaggedCharacterRanges:usingTokenMapping:forModel:", v9, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = -[SGExtractionModelCoreMLFeatureWrapper initWithFeatureDict:]([SGExtractionModelCoreMLFeatureWrapper alloc], "initWithFeatureDict:", v10);
  else
    v11 = 0;

  return v11;
}

+ (id)enrichTaggedCharacterRangesWithModelOutput:(id)a3 usingInputCharacterRanges:(id)a4
{
  id v5;
  id v6;
  void *v7;
  __objc2_class **v8;
  void *v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v31 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v5;
  v8 = off_1E7DA6000;
  v9 = v6;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v36)
  {
    v34 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v40 != v34)
          objc_enumerationMutation(obj);
        objc_msgSend(obj, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count"))
        {
          v12 = 0;
          do
          {
            if (objc_msgSend(v7, "count") <= v12)
            {
              v13 = (void *)objc_opt_new();
              objc_msgSend(v7, "addObject:", v13);

            }
            objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("NONE"));

            if ((v15 & 1) == 0)
            {
              objc_msgSend(v7, "objectAtIndexedSubscript:", v12);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_alloc(MEMORY[0x1E0CB3940]);
              +[SGTaggedCharacterRange annotationTypeUniqueIdentifier:](SGTaggedCharacterRange, "annotationTypeUniqueIdentifier:", 10);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("%@_%@"), v18, v19);
              objc_msgSend(v16, "addObject:", v20);

              v8 = off_1E7DA6000;
              v6 = v9;

            }
            ++v12;
          }
          while (objc_msgSend(v11, "count") > v12);
        }

      }
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v36);
  }

  if (objc_msgSend(v7, "count"))
  {
    v21 = 0;
    do
    {
      v32 = objc_alloc(v8[134]);
      objc_msgSend(v6, "objectAtIndexedSubscript:", v21);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "tags");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v21);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "arrayByAddingObjectsFromArray:", v33);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "range");
      v26 = v25;
      objc_msgSend(v9, "objectAtIndexedSubscript:", v21);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "text");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v32, "initWithAnnotationType:tags:range:text:", 4, v22, v24, v26, v28);
      objc_msgSend(v31, "addObject:", v29);

      v8 = off_1E7DA6000;
      v6 = v9;

      ++v21;
    }
    while (objc_msgSend(v7, "count") > v21);
  }

  return v31;
}

void __43__SGReminderExtractionModel_sharedInstance__block_invoke()
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = -[SGReminderExtractionModel _init]([SGReminderExtractionModel alloc], "_init");
  v2 = (void *)sharedInstance__pasExprOnceResult_11059;
  sharedInstance__pasExprOnceResult_11059 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

@end
