@implementation ATXModeSetupPredictionModel

- (ATXModeSetupPredictionModel)initWithMode:(unint64_t)a3
{
  ATXModeSetupPredictionModel *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXModeSetupPredictionModel;
  result = -[ATXModeSetupPredictionModel init](&v5, sel_init);
  if (result)
    result->_mode = a3;
  return result;
}

- (id)featuresToModel
{
  void *v3;
  ATXModeSetupPredictionFeaturesCorrelator *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXModeSetupPredictionFeaturesCorrelator initWithMode:features:]([ATXModeSetupPredictionFeaturesCorrelator alloc], "initWithMode:features:", self->_mode, v3);
  -[ATXModeSetupPredictionFeaturesCorrelator featureVector](v4, "featureVector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)modelName
{
  unint64_t *p_mode;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;

  p_mode = &self->_mode;
  +[ATXFocusModeModelsUtil setupPredictionModelNameForMode:](ATXFocusModeModelsUtil, "setupPredictionModelNameForMode:", self->_mode);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    __atxlog_handle_modes();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ATXModeSetupPredictionModel modelName].cold.1((uint64_t)p_mode, v6);

  }
  return v4;
}

- (id)modeSetupPredictionModel
{
  void *v2;
  void *v3;

  -[ATXModeSetupPredictionModel modelName](self, "modelName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXCoreMLUtilities loadCoreMLModelWithName:](ATXCoreMLUtilities, "loadCoreMLModelWithName:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)probabilityScore
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  id v18;
  id v19;

  -[ATXModeSetupPredictionModel modeSetupPredictionModel](self, "modeSetupPredictionModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0C9E8F8]);
    -[ATXModeSetupPredictionModel featuresToModel](self, "featuresToModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v6 = (void *)objc_msgSend(v4, "initWithDictionary:error:", v5, &v19);
    v7 = v19;

    if (v7)
    {
      __atxlog_handle_modes();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[ATXModeSetupPredictionModel probabilityScore].cold.2((uint64_t)v7, v8, v9);

    }
    v18 = v7;
    objc_msgSend(v3, "predictionFromFeatures:error:", v6, &v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v18;

    if (v11)
    {
      __atxlog_handle_modes();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[ATXModeSetupPredictionModel probabilityScore].cold.1((uint64_t)v11, v12, v13);

    }
    objc_msgSend(v10, "featureValueForName:", CFSTR("classProbability"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXCoreMLUtilities scoreForModelOutputValue:outputIndexedSubscript:](ATXCoreMLUtilities, "scoreForModelOutputValue:outputIndexedSubscript:", v14, 1);
    v16 = v15;

  }
  else
  {
    v16 = 0.0;
  }

  return v16;
}

- (void)modelName
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  ATXModeToString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, v4, "ATXModeSetupPredictionModel: nil returned for CoreML model file name for this mode: %@", (uint8_t *)&v5);

}

- (void)probabilityScore
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, a3, "ATXModeSetupPredictionModel - Error initializing MLDictionaryFeatureProvider for inference on the CoreMLModel: %@", (uint8_t *)&v3);
}

@end
