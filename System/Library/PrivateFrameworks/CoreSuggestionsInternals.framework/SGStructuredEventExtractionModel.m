@implementation SGStructuredEventExtractionModel

- (id)_init
{
  SGStructuredEventExtractionModel *v2;
  SGStructuredEventExtractionModel *v3;
  void *v4;
  SGStructuredEventExtractionModel *v5;
  uint64_t v6;
  _PASNotificationToken *assetUpdateToken;
  _QWORD v9[4];
  SGStructuredEventExtractionModel *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SGStructuredEventExtractionModel;
  v2 = -[SGStructuredEventExtractionModel init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SGStructuredEventExtractionModel updateAll](v2, "updateAll");
    +[SGAsset localeAsset](SGAsset, "localeAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __41__SGStructuredEventExtractionModel__init__block_invoke;
    v9[3] = &unk_1E7DAB9B8;
    v5 = v3;
    v10 = v5;
    objc_msgSend(v4, "registerUpdateHandler:", v9);
    v6 = objc_claimAutoreleasedReturnValue();
    assetUpdateToken = v5->_assetUpdateToken;
    v5->_assetUpdateToken = (_PASNotificationToken *)v6;

  }
  return v3;
}

- (void)updateAll
{
  NSDictionary *v3;
  NSDictionary *inputMapping;
  NSDictionary *v5;
  NSDictionary *outputMapping;
  NSDictionary *v7;
  NSDictionary *supportedProviders;
  NSDictionary *v9;
  NSDictionary *engineConfig;

  objc_msgSend((id)objc_opt_class(), "loadLazyPlistWithBasename:", CFSTR("StructuredEventInputMapping"));
  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  inputMapping = self->_inputMapping;
  self->_inputMapping = v3;

  objc_msgSend((id)objc_opt_class(), "loadLazyPlistWithBasename:", CFSTR("StructuredEventOutputMapping"));
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  outputMapping = self->_outputMapping;
  self->_outputMapping = v5;

  objc_msgSend((id)objc_opt_class(), "loadLazyPlistWithBasename:", CFSTR("SupportedProviders"));
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  supportedProviders = self->_supportedProviders;
  self->_supportedProviders = v7;

  objc_msgSend((id)objc_opt_class(), "loadLazyPlistWithBasename:", CFSTR("StructuredEventEngineConfig"));
  v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  engineConfig = self->_engineConfig;
  self->_engineConfig = v9;

}

- (id)modelInferences:(id)a3
{
  return -[SGStructuredEventExtractionModel modelInferences:pflTraining:hasEvent:](self, "modelInferences:pflTraining:hasEvent:", a3, 0, 0);
}

- (id)modelInferences:(id)a3 pflTraining:(BOOL)a4 hasEvent:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  SGExtractionModelCoreMLFeatureWrapper *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v24;
  unint64_t v25;
  id v26;
  uint8_t buf[8];
  uint64_t v28;
  uint64_t v29;
  uint8_t v30[4];
  double v31;
  uint64_t v32;

  v5 = a5;
  v6 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (self->_inputMapping && self->_outputMapping)
  {
    v29 = 0;
    *(_QWORD *)buf = CFSTR("Structured Event model inference");
    v9 = mach_absolute_time();
    v28 = v9;
    sgEventsLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v30 = 0;
      _os_log_debug_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEBUG, "Preparing Structured Event model inference", v30, 2u);
    }

    -[SGStructuredEventExtractionModel loadModel](self, "loadModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend((id)objc_opt_class(), "inputFromTaggedCharacterRanges:usingInputMapping:forModel:pflTraining:hasEvent:", v8, self->_inputMapping, v11, v6, v5);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v26 = 0;
        objc_msgSend(v11, "predictionFromFeatures:error:", v12, &v26);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v26;
        if (v13)
        {
          v15 = -[SGExtractionModelCoreMLFeatureWrapper initWithFeatureProvider:]([SGExtractionModelCoreMLFeatureWrapper alloc], "initWithFeatureProvider:", v13);
        }
        else
        {
          sgEventsLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v30 = 138412290;
            v31 = *(double *)&v14;
            _os_log_error_impl(&dword_1C3607000, v18, OS_LOG_TYPE_ERROR, "Model inference failed: %@", v30, 0xCu);
          }

          v15 = 0;
        }
        sgEventsLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v24 = mach_absolute_time();
          v25 = SGMachTimeToNanoseconds(v24 - v9);
          *(_DWORD *)v30 = 134217984;
          v31 = (double)v25 * 0.000000001;
          _os_log_debug_impl(&dword_1C3607000, v19, OS_LOG_TYPE_DEBUG, "Model inference done in %f", v30, 0xCu);
        }

        if (v15)
        {
          objc_msgSend((id)objc_opt_class(), "modelOutputFromOutputMapping:modelOutput:modelInput:", self->_outputMapping, v15, v12);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = v20;
          v22 = (void *)MEMORY[0x1E0C9AA70];
          if (v20)
            v22 = (void *)v20;
          v17 = v22;
        }
        else
        {
          sgEventsLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v30 = 0;
            _os_log_error_impl(&dword_1C3607000, v21, OS_LOG_TYPE_ERROR, "Unable to convert to instantiate SGExtractionModelCoreMLFeatureWrapper", v30, 2u);
          }
          v17 = (id)MEMORY[0x1E0C9AA70];
        }

      }
      else
      {
        sgEventsLogHandle();
        v15 = (SGExtractionModelCoreMLFeatureWrapper *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v30 = 0;
          _os_log_error_impl(&dword_1C3607000, &v15->super, OS_LOG_TYPE_ERROR, "Model input feature construction failed.", v30, 2u);
        }
        v17 = (id)MEMORY[0x1E0C9AA70];
      }

    }
    else
    {
      sgEventsLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v30 = 0;
        _os_log_error_impl(&dword_1C3607000, v12, OS_LOG_TYPE_ERROR, "SGStructuredEventExtractionModel: Model initialization failed", v30, 2u);
      }
      v17 = (id)MEMORY[0x1E0C9AA70];
    }

    SGRecordMeasurementState(buf);
  }
  else
  {
    sgEventsLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v16, OS_LOG_TYPE_ERROR, "SGStructuredEventExtractionModel: No input or output mapping", buf, 2u);
    }

    v17 = (id)MEMORY[0x1E0C9AA70];
  }

  return v17;
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
  +[SGStructuredEventTrialClientWrapper sharedInstance](SGStructuredEventTrialClientWrapper, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length"))
  {
    sgEventsLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_INFO, "SGStructuredEventExtractionModel: Loading model from trial override at path: %@", buf, 0xCu);
    }

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v6);
  }
  else
  {
    -[SGExtractionModel currentModelURLForModelName:](self, "currentModelURLForModelName:", CFSTR("StructuredEventModel"));
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
      sgEventsLogHandle();
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

- (id)supportedProviders
{
  void *v3;
  NSDictionary *v4;
  NSDictionary *supportedProviders;
  NSDictionary *v6;

  +[SGStructuredEventTrialClientWrapper sharedInstance](SGStructuredEventTrialClientWrapper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportedProviders");
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  supportedProviders = v4;
  if (!v4)
    supportedProviders = self->_supportedProviders;
  v6 = supportedProviders;

  return v6;
}

- (BOOL)isSenderSupportedForExtraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  -[SGStructuredEventExtractionModel supportedProviders](self, "supportedProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("extractionSenders"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_5;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("extractionSenders"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = 1;
  else
LABEL_5:
    v10 = 0;

  return v10;
}

- (BOOL)isSenderSupportedForShadowExtraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  -[SGStructuredEventExtractionModel supportedProviders](self, "supportedProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shadowSenders"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_5;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shadowSenders"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = 1;
  else
LABEL_5:
    v10 = 0;

  return v10;
}

- (BOOL)isSenderSupportedForMLDefaultExtraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  -[SGStructuredEventExtractionModel supportedProviders](self, "supportedProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mlDefaultExtractionSenders"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_5;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mlDefaultExtractionSenders"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = 1;
  else
LABEL_5:
    v10 = 0;

  return v10;
}

- (BOOL)isSenderSupportedForPFLTraining:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  -[SGStructuredEventExtractionModel supportedProviders](self, "supportedProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("schemaOrgSenders"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_5;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("schemaOrgSenders"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = 1;
  else
LABEL_5:
    v10 = 0;

  return v10;
}

- (BOOL)isSenderSupportedForMLHybridExtraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  -[SGStructuredEventExtractionModel supportedProviders](self, "supportedProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mlHybridExtractionSenders"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_5;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mlHybridExtractionSenders"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = 1;
  else
LABEL_5:
    v10 = 0;

  return v10;
}

- (id)engineConfig
{
  void *v3;
  NSDictionary *v4;
  NSDictionary *engineConfig;
  NSDictionary *v6;

  +[SGStructuredEventTrialClientWrapper sharedInstance](SGStructuredEventTrialClientWrapper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "engineConfig");
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  engineConfig = v4;
  if (!v4)
    engineConfig = self->_engineConfig;
  v6 = engineConfig;

  return v6;
}

- (id)inputMapping
{
  void *v3;
  NSDictionary *v4;
  NSDictionary *inputMapping;
  NSDictionary *v6;

  +[SGStructuredEventTrialClientWrapper sharedInstance](SGStructuredEventTrialClientWrapper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "structuredEventInputMapping");
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  inputMapping = v4;
  if (!v4)
    inputMapping = self->_inputMapping;
  v6 = inputMapping;

  return v6;
}

- (id)outputMapping
{
  void *v3;
  NSDictionary *v4;
  NSDictionary *outputMapping;
  NSDictionary *v6;

  +[SGStructuredEventTrialClientWrapper sharedInstance](SGStructuredEventTrialClientWrapper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "structuredEventOutputMapping");
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  outputMapping = v4;
  if (!v4)
    outputMapping = self->_outputMapping;
  v6 = outputMapping;

  return v6;
}

- (unint64_t)maxMergeDistanceForSection:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  -[SGStructuredEventExtractionModel engineConfig](self, "engineConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@.%@"), CFSTR("sectionLabelTokenMergeDistance"), v6, v7);
    objc_msgSend(v8, "valueForKeyPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = objc_msgSend(v10, "unsignedIntegerValue");
LABEL_8:

        goto LABEL_13;
      }
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("defaultLabelTokenMergeDistance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = objc_msgSend(v12, "unsignedIntegerValue");

        goto LABEL_8;
      }
    }

  }
  sgEventsLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1C3607000, v13, OS_LOG_TYPE_FAULT, "SGStructuredEventExtractionModel: No configuration loaded", buf, 2u);
  }

  v11 = 0;
LABEL_13:

  return v11;
}

- (unint64_t)stripRepeatedContentForSectionLength:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  -[SGStructuredEventExtractionModel engineConfig](self, "engineConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@.%@"), CFSTR("stripRepeatedContentInSections"), v6, v7);
    objc_msgSend(v8, "valueForKeyPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = objc_msgSend(v10, "unsignedIntegerValue");

        goto LABEL_9;
      }
    }

  }
  sgEventsLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1C3607000, v12, OS_LOG_TYPE_ERROR, "SGStructuredEventExtractionModel: No configuration loaded", buf, 2u);
  }

  v11 = 0;
LABEL_9:

  return v11;
}

- (unint64_t)addressComponentThreshold
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  uint8_t v8[16];

  -[SGStructuredEventExtractionModel engineConfig](self, "engineConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("addressComponentThreshold"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = objc_msgSend(v4, "unsignedIntegerValue");

        goto LABEL_9;
      }
    }

  }
  sgEventsLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_error_impl(&dword_1C3607000, v6, OS_LOG_TYPE_ERROR, "SGStructuredEventExtractionModel: No configuration loaded", v8, 2u);
  }

  v5 = 0;
LABEL_9:

  return v5;
}

- (id)gazetteer
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  NSObject *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[SGExtractionModel currentModelURLForModelName:](self, "currentModelURLForModelName:", CFSTR("structuredEventGazetteer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v8 = 0;
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCE130]), "initWithContentsOfURL:error:", v2, &v8);
    v4 = v8;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      sgEventsLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v4;
        _os_log_error_impl(&dword_1C3607000, v6, OS_LOG_TYPE_ERROR, "SGPOSTagger: Unable to create gazetteer %@", buf, 0xCu);
      }

    }
  }
  else
  {
    sgEventsLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v4, OS_LOG_TYPE_ERROR, "SGStructuredEventExtractionModel: Unable to get URL for Gazetteer", buf, 2u);
    }
    v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engineConfig, 0);
  objc_storeStrong((id *)&self->_supportedProviders, 0);
  objc_storeStrong((id *)&self->_outputMapping, 0);
  objc_storeStrong((id *)&self->_inputMapping, 0);
  objc_storeStrong((id *)&self->_assetUpdateToken, 0);
}

uint64_t __41__SGStructuredEventExtractionModel__init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAll");
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_4013 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_4013, &__block_literal_global_4014);
  return (id)sharedInstance__pasExprOnceResult_4015;
}

+ (id)inputFromTaggedCharacterRanges:(id)a3 usingInputMapping:(id)a4 forModel:(id)a5 pflTraining:(BOOL)a6 hasEvent:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  void *v14;
  SGExtractionModelCoreMLFeatureWrapper *v15;

  v7 = a7;
  v8 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend((id)objc_opt_class(), "inputDictFromTaggedCharacterRanges:usingTokenMapping:forModel:pflTraining:hasEvent:", v13, v12, v11, v8, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    v15 = -[SGExtractionModelCoreMLFeatureWrapper initWithFeatureDict:]([SGExtractionModelCoreMLFeatureWrapper alloc], "initWithFeatureDict:", v14);
  else
    v15 = 0;

  return v15;
}

void __50__SGStructuredEventExtractionModel_sharedInstance__block_invoke()
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = -[SGStructuredEventExtractionModel _init]([SGStructuredEventExtractionModel alloc], "_init");
  v2 = (void *)sharedInstance__pasExprOnceResult_4015;
  sharedInstance__pasExprOnceResult_4015 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

@end
