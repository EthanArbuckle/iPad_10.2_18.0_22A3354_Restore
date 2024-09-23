@implementation MLModelEngine

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (MLModelConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)supportsConcurrentSubmissions
{
  return 0;
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (MLModelEngine)initWithDescription:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  MLModelEngine *v9;
  NSObject *v10;
  uint64_t v11;
  MLModelConfiguration *configuration;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MLModelEngine;
  v9 = -[MLModelEngine init](&v14, sel_init);
  if (v9)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    v9->_signpostID = os_signpost_id_generate(v10);

    objc_storeStrong((id *)&v9->_modelDescription, a3);
    v11 = objc_msgSend(v8, "copy");
    configuration = v9->_configuration;
    v9->_configuration = (MLModelConfiguration *)v11;

  }
  return v9;
}

- (MLModelEngine)initWithName:(id)a3 inputDescription:(id)a4 outputDescription:(id)a5 orderedInputFeatureNames:(id)a6 orderedOutputFeatureNames:(id)a7 configuration:(id)a8
{
  id v11;
  id v12;
  id v13;
  MLModelDescription *v14;
  MLModelDescription *v15;
  MLModelEngine *v16;

  v11 = a4;
  v12 = a5;
  v13 = a8;
  v14 = [MLModelDescription alloc];
  v15 = -[MLModelDescription initWithInputDescriptions:outputDescriptions:predictedFeatureName:predictedProbabilitiesName:trainingInputDescriptions:metadata:](v14, "initWithInputDescriptions:outputDescriptions:predictedFeatureName:predictedProbabilitiesName:trainingInputDescriptions:metadata:", v11, v12, 0, 0, MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70]);
  v16 = -[MLModelEngine initWithDescription:configuration:](self, "initWithDescription:configuration:", v15, v13);

  return v16;
}

- (BOOL)recordsPredictionEvent
{
  return 1;
}

- (MLModelMetadata)metadata
{
  NSObject *v2;
  uint8_t v4[16];

  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
  }

  return 0;
}

- (unint64_t)predictionTypeForKTrace
{
  NSObject *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  objc_class *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    _os_log_error_impl(&dword_19C486000, v3, OS_LOG_TYPE_ERROR, "%@ must implement method: %@, but it doesn't.", buf, 0x16u);

  }
  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@ must implement method: %@, but it doesn't."), v6, v7);

  return 0;
}

- (id)executionSchedule
{
  MLModelExecutionSchedule *v3;
  MLLayerExecutionSchedule *v4;
  void *v5;
  void *v6;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MLModelExecutionSchedule);
  v4 = -[MLLayerExecutionSchedule initWithLayerError:]([MLLayerExecutionSchedule alloc], "initWithLayerError:", 2);
  -[MLModelEngine modelPath](self, "modelPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLModelExecutionSchedule setModelExecutionSchedule:](v3, "setModelExecutionSchedule:", v6);
  return v3;
}

- (void)setModelPath:(id)a3 modelName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(v11, "copy");
  -[MLModelEngine modelDescription](self, "modelDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setModelPath:", v7);

  -[MLModelEngine modelDescription](self, "modelDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "modelPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendPathComponent:", v6);

}

- (id)modelPath
{
  void *v2;
  void *v3;
  void *v4;

  -[MLModelEngine modelDescription](self, "modelDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  id v5;

  v5 = a3;
  if (a4)
  {
    +[MLModelErrorUtils parameterErrorWithUnderlyingError:format:](MLModelErrorUtils, "parameterErrorWithUnderlyingError:format:", 0, CFSTR("Model does not have a parameter for requested key %@."), v5);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6;
  MLPredictionOptions *v7;
  void *v8;

  v6 = a3;
  v7 = objc_alloc_init(MLPredictionOptions);
  -[MLModelEngine predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  NSObject *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  objc_class *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[MLLogging coreChannel](MLLogging, "coreChannel", a3, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = v13;
    v17 = 2112;
    v18 = v14;
    _os_log_error_impl(&dword_19C486000, v6, OS_LOG_TYPE_ERROR, "%@ must implement method: %@, but it doesn't.", buf, 0x16u);

  }
  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@ must implement method: %@, but it doesn't."), v9, v10);

  return 0;
}

- (id)newRequestForModel:(id)a3 inputFeatures:(id)a4 options:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[MLGenericPredictionRequest initForModel:inputFeatures:options:]([MLGenericPredictionRequest alloc], "initForModel:inputFeatures:options:", v8, v9, v10);

  return v11;
}

- (void)submitPredictionRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  objc_msgSend(v6, "inputFeatures");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predictionOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  -[MLModelEngine predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v8, v9, &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v12;

  v7[2](v7, v10, v11);
}

- (void)enableInstrumentsTracing
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  unint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  MLModelEngine *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MLModelEngine configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modelDisplayName");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v5 = &stru_1E3D68DC8;
  if (v4)
    v5 = v4;
  v6 = v5;
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = 134218498;
    v11 = -[MLModelEngine signpostID](self, "signpostID");
    v12 = 2082;
    v13 = -[__CFString UTF8String](objc_retainAutorelease(v6), "UTF8String");
    v14 = 2048;
    v15 = self;
    _os_signpost_emit_with_name_impl(&dword_19C486000, v7, OS_SIGNPOST_EVENT, v9, "MLModel_Generic_Discover", "Model-signpost-id:%lluModel-name:%{public}sModel-address:%llu", (uint8_t *)&v10, 0x20u);
  }

}

- (id)vectorizeInput:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[MLModelEngine modelDescription](self, "modelDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputFeatureNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[MLFeatureProviderUtils vectorizeFeaturesProvidedBy:featureNames:error:](MLFeatureProviderUtils, "vectorizeFeaturesProvidedBy:featureNames:error:", v6, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)predictionsFromBatch:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelEngine predictionsFromBatch:options:error:](self, "predictionsFromBatch:options:error:", v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  +[MLModel predictionsFromLoopingOverBatch:model:options:error:](MLModel, "predictionsFromLoopingOverBatch:model:options:error:", a3, self, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
}

@end
