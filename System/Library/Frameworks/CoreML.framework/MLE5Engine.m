@implementation MLE5Engine

- (BOOL)supportsConcurrentSubmissions
{
  return 1;
}

- (unint64_t)predictionTypeForKTrace
{
  return 21;
}

+ (id)loadModelFromCompiledArchive:(_MLModelInputArchiver *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  MLProgramE5Container *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint8_t v24[8];
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = -[MLProgramE5Container initWithCompiledArchive:modelVersionInfo:compilerVersionInfo:error:]([MLProgramE5Container alloc], "initWithCompiledArchive:modelVersionInfo:compilerVersionInfo:error:", a3, v12, v13, a7);
  if (!v15)
    goto LABEL_19;
  if (objc_msgSend(v14, "experimentalMLE5EngineUsage") == 1)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v24 = 0;
      _os_log_error_impl(&dword_19C486000, v16, OS_LOG_TYPE_ERROR, "MLE5Engine is disabled through the configuration.", v24, 2u);
    }

    if (a7)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v27 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MLE5Engine is disabled through the configuration."));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
      *a7 = v20;

LABEL_19:
      a7 = 0;
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  if ((objc_msgSend(v14, "profilingOptions") & 1) == 0)
  {
LABEL_8:
    a7 = (id *)objc_msgSend(objc_alloc((Class)a1), "initWithContainer:configuration:error:", v15, v14, a7);
    goto LABEL_20;
  }
  if (e5rtWouldUseBackwardCompatibilityPath(void)::onceToken != -1)
    dispatch_once(&e5rtWouldUseBackwardCompatibilityPath(void)::onceToken, &__block_literal_global_311);
  if (e5rtWouldUseBackwardCompatibilityPath(void)::chipID <= 32773)
  {
    if (e5rtWouldUseBackwardCompatibilityPath(void)::chipID
      && e5rtWouldUseBackwardCompatibilityPath(void)::chipID != 28672)
    {
      goto LABEL_8;
    }
  }
  else if (((unint64_t)(e5rtWouldUseBackwardCompatibilityPath(void)::chipID - 32774) > 0x2A
          || ((1 << (e5rtWouldUseBackwardCompatibilityPath(void)::chipID - 6)) & 0x40204008801) == 0)
         && e5rtWouldUseBackwardCompatibilityPath(void)::chipID != 33537)
  {
    goto LABEL_8;
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v24 = 0;
    _os_log_error_impl(&dword_19C486000, v21, OS_LOG_TYPE_ERROR, "MLE5Engine does not support profiling options on the current device.", v24, 2u);
  }

  if (a7)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MLE5Engine does not support profiling options on the current device."));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
LABEL_20:

  return a7;
}

- (MLE5Engine)initWithContainer:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  id v12;
  id v13;
  MLE5ProgramLibrary *v14;
  MLE5ProgramLibrary *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  MLE5Engine *v19;
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v22 = 0;
  v23 = 0;
  objc_msgSend(v8, "modelAssetDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[MLProgramE5Container deduceFunctionNameToCompute:modelDescription:fromConfiguration:modelAssetDescription:error:](MLProgramE5Container, "deduceFunctionNameToCompute:modelDescription:fromConfiguration:modelAssetDescription:error:", &v23, &v22, v9, v10, a5);
  v12 = v23;
  v13 = v22;

  if (v11)
  {
    v14 = -[MLE5ProgramLibrary initWithContainer:configuration:error:]([MLE5ProgramLibrary alloc], "initWithContainer:configuration:error:", v8, v9, a5);
    v15 = v14;
    if (v14)
    {
      if (-[MLE5ProgramLibrary prepareAndReturnError:](v14, "prepareAndReturnError:", a5))
      {
        objc_msgSend(v8, "classScoreVectorNameOfFunctionNamed:", v12);
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "optionalInputDefaultValuesForFunctionNamed:", v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "compilerVersionInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[MLE5Engine initWithProgramLibrary:modelDescription:configuration:functionName:classProbabilitiesFeatureName:optionalInputDefaultValues:compilerVersionInfo:](self, "initWithProgramLibrary:modelDescription:configuration:functionName:classProbabilitiesFeatureName:optionalInputDefaultValues:compilerVersionInfo:", v15, v13, v9, v12, v16, v17, v18);

        v19 = self;
LABEL_10:

LABEL_12:
        goto LABEL_13;
      }
      if (_os_feature_enabled_impl())
      {
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          -[MLE5ProgramLibrary modelDisplayName](v15, "modelDisplayName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v25 = v21;
          _os_log_fault_impl(&dword_19C486000, v16, OS_LOG_TYPE_FAULT, "On-Device model specialization failed. MLModel will fall back to the legacy engine. (Model Display Name: %@.)", buf, 0xCu);

        }
        v19 = 0;
        goto LABEL_10;
      }
    }
    v19 = 0;
    goto LABEL_12;
  }
  v19 = 0;
LABEL_13:

  return v19;
}

+ (Class)containerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)prepareWithConcurrencyHint:(int64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  int64_t v8;
  char v9;

  -[MLE5Engine operationPool](self, "operationPool");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3 <= 1)
    v8 = 1;
  else
    v8 = a3;
  v9 = objc_msgSend(v6, "prepareWithInitialPoolSize:error:", v8, a4);

  return v9;
}

- (MLE5ExecutionStreamOperationPool)operationPool
{
  return (MLE5ExecutionStreamOperationPool *)objc_getProperty(self, a2, 40, 1);
}

- (MLE5Engine)initWithProgramLibrary:(id)a3 modelDescription:(id)a4 configuration:(id)a5 functionName:(id)a6 classProbabilitiesFeatureName:(id)a7 optionalInputDefaultValues:(id)a8 compilerVersionInfo:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  MLE5Engine *v20;
  MLE5Engine *v21;
  MLE5ExecutionStreamPool *v22;
  MLE5ExecutionStreamPool *streamPool;
  uint64_t v24;
  MLE5ExecutionStreamOperationPool *operationPool;
  uint64_t v26;
  NSString *classProbabilitiesFeatureName;
  void *v28;
  uint64_t v29;
  id classLabelsSharedKey;
  void *v31;
  MLFeatureProviderConformer *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  MLFeatureProviderConformer *inputFeatureConformer;
  void *v37;
  MLFeatureProviderConformer *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  MLFeatureProviderConformer *stateFeatureConformer;
  dispatch_semaphore_t v43;
  OS_dispatch_semaphore *batchMaxInFlightSem;
  id v46;
  id v47;
  id v48;
  objc_super v49;

  v48 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v47 = a8;
  v46 = a9;
  v49.receiver = self;
  v49.super_class = (Class)MLE5Engine;
  v20 = -[MLModelEngine initWithDescription:configuration:](&v49, sel_initWithDescription_configuration_, v16, v17);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_functionName, a6);
    v22 = -[MLE5ExecutionStreamPool initWithModelConfiguration:modelSignpostId:]([MLE5ExecutionStreamPool alloc], "initWithModelConfiguration:modelSignpostId:", v17, -[MLModelEngine signpostID](v21, "signpostID"));
    streamPool = v21->_streamPool;
    v21->_streamPool = v22;

    objc_storeStrong((id *)&v21->_compilerVersionInfo, a9);
    +[MLE5ExecutionStreamOperationPoolFactory createPoolFromLibrary:functionName:modelDescription:modelConfiguration:modelSignpostId:compilerVersionInfo:](MLE5ExecutionStreamOperationPoolFactory, "createPoolFromLibrary:functionName:modelDescription:modelConfiguration:modelSignpostId:compilerVersionInfo:", v48, v18, v16, v17, -[MLModelEngine signpostID](v21, "signpostID"), v21->_compilerVersionInfo);
    v24 = objc_claimAutoreleasedReturnValue();
    operationPool = v21->_operationPool;
    v21->_operationPool = (MLE5ExecutionStreamOperationPool *)v24;

    v26 = objc_msgSend(v19, "copy");
    classProbabilitiesFeatureName = v21->_classProbabilitiesFeatureName;
    v21->_classProbabilitiesFeatureName = (NSString *)v26;

    objc_storeStrong((id *)&v21->_programLibrary, a3);
    objc_msgSend(v16, "classLabels");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      +[MLProbabilityDictionary sharedKeySetForLabels:](MLProbabilityDictionary, "sharedKeySetForLabels:", v28);
      v29 = objc_claimAutoreleasedReturnValue();
      classLabelsSharedKey = v21->_classLabelsSharedKey;
      v21->_classLabelsSharedKey = (id)v29;

    }
    objc_msgSend(v16, "inputDescriptionsByName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      v32 = [MLFeatureProviderConformer alloc];
      objc_msgSend(v16, "inputDescriptionsByName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "allValues");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[MLFeatureProviderConformer initWithFeatureDescriptions:defaultValues:usingRank5Mapping:optionalInputTypes:passthroughStateFeatures:](v32, "initWithFeatureDescriptions:defaultValues:usingRank5Mapping:optionalInputTypes:passthroughStateFeatures:", v34, v47, 0, MEMORY[0x1E0C9AA70], 1);
      inputFeatureConformer = v21->_inputFeatureConformer;
      v21->_inputFeatureConformer = (MLFeatureProviderConformer *)v35;

    }
    objc_msgSend(v16, "stateDescriptionsByName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      v38 = [MLFeatureProviderConformer alloc];
      objc_msgSend(v16, "stateDescriptionsByName");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "allValues");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[MLFeatureProviderConformer initWithFeatureDescriptions:defaultValues:usingRank5Mapping:optionalInputTypes:passthroughStateFeatures:](v38, "initWithFeatureDescriptions:defaultValues:usingRank5Mapping:optionalInputTypes:passthroughStateFeatures:", v40, MEMORY[0x1E0C9AA70], 0, MEMORY[0x1E0C9AA70], 0);
      stateFeatureConformer = v21->_stateFeatureConformer;
      v21->_stateFeatureConformer = (MLFeatureProviderConformer *)v41;

    }
    v43 = dispatch_semaphore_create(+[MLModel maxPredictionsInFlight](MLModel, "maxPredictionsInFlight"));
    batchMaxInFlightSem = v21->_batchMaxInFlightSem;
    v21->_batchMaxInFlightSem = (OS_dispatch_semaphore *)v43;

  }
  return v21;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  +[MLState emptyState](MLState, "emptyState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLE5Engine _predictionFromFeatures:usingState:options:error:](self, "_predictionFromFeatures:usingState:options:error:", v8, v10, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)predictionFromFeatures:(id)a3 usingState:(id)a4 options:(id)a5 error:(id *)a6
{
  -[MLE5Engine _predictionFromFeatures:usingState:options:error:](self, "_predictionFromFeatures:usingState:options:error:", a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_predictionFromFeatures:(id)a3 usingState:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v12, "usesCPUOnly"))
  {
    -[MLModelEngine configuration](self, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "computeUnits");

    if (v14)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        -[MLModelEngine modelDescription](self, "modelDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "modelURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138412290;
        v26 = v17;
        _os_log_impl(&dword_19C486000, v15, OS_LOG_TYPE_INFO, "MLPredictionOptions's usesCPUOnly property has been deprecated and ignored for the model: %@", (uint8_t *)&v25, 0xCu);

      }
    }
  }
  -[MLE5Engine _conformInputFeatures:error:](self, "_conformInputFeatures:error:", v10, a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    +[MLState emptyState](MLState, "emptyState");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v19 == v11;

    if (!v20)
    {
      -[MLE5Engine _conformState:error:](self, "_conformState:error:", v11, a6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        v23 = 0;
        goto LABEL_13;
      }
      +[MLFeatureProviderUtils lazyProviderWithFeaturesProvidedBy:addedToFeaturesProvidedBy:](MLFeatureProviderUtils, "lazyProviderWithFeaturesProvidedBy:addedToFeaturesProvidedBy:", v21, v18);
      v22 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v22;
    }
    -[MLE5Engine _predictionFromFeatures:options:error:](self, "_predictionFromFeatures:options:error:", v18, v12, a6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

    goto LABEL_14;
  }
  v23 = 0;
LABEL_14:

  return v23;
}

- (id)_conformInputFeatures:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  id v11;
  _QWORD aBlock[5];

  v6 = a3;
  v7 = -[MLModelEngine signpostID](self, "signpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__MLE5Engine__conformInputFeatures_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = v7;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[MLE5Engine inputFeatureConformer](self, "inputFeatureConformer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MLE5Engine inputFeatureConformer](self, "inputFeatureConformer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "conformFeatures:error:", v6, a4);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v6;
  }
  v8[2](v8);

  return v11;
}

- (id)_conformState:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD aBlock[5];

  v6 = a3;
  v7 = -[MLModelEngine signpostID](self, "signpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __34__MLE5Engine__conformState_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = v7;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(v6, "featureProviderRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLE5Engine stateFeatureConformer](self, "stateFeatureConformer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MLE5Engine stateFeatureConformer](self, "stateFeatureConformer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "conformFeatures:error:", v9, a4);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = v9;
  }

  v8[2](v8);
  return v12;
}

- (BOOL)_validateStreamReuse:(BOOL)a3 expectation:(id)a4 error:(id *)a5
{
  _BOOL4 v6;
  __CFString *v7;
  __CFString *v8;
  BOOL v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v18;
  uint8_t v20[8];
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v6 = a3;
  v24[1] = *MEMORY[0x1E0C80C00];
  v7 = (__CFString *)a4;
  v8 = v7;
  if (v7 == CFSTR("MLE5EngineStreamReuseExpectationNever") && v6)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v20 = 0;
      _os_log_error_impl(&dword_19C486000, v16, OS_LOG_TYPE_ERROR, "MLE5Engine unexpectedly reused the E5 stream.", v20, 2u);
    }

    if (!a5)
      goto LABEL_17;
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MLE5Engine unexpectedly reused the E5 stream."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
    *a5 = v15;

LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  v10 = 1;
  if (v7 == CFSTR("MLE5EngineStreamReuseExpectationAlways") && !v6)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v20 = 0;
      _os_log_error_impl(&dword_19C486000, v11, OS_LOG_TYPE_ERROR, "MLE5Engine unexpectedly didn't reuse the E5 stream.", v20, 2u);
    }

    if (!a5)
      goto LABEL_17;
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MLE5Engine unexpectedly didn't reuse the E5 stream."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
LABEL_18:

  return v10;
}

- (BOOL)_cleanUpAndReconfigureStream:(id)a3 forInputFeatures:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  -[MLE5Engine _cleanUpStream:](self, "_cleanUpStream:", v8);
  -[MLE5Engine operationPool](self, "operationPool");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v8, "setupOperationForInputFeatures:operationPool:error:", v9, v10, a5);

  return (char)a5;
}

- (id)_predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  -[MLE5Engine streamPool](self, "streamPool");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "takeOut");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "reusableForSyncPredictionForInputFeatures:options:", v8, v9);
  objc_msgSend(v9, "e5rtStreamReuseExpectation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MLE5Engine _validateStreamReuse:expectation:error:](self, "_validateStreamReuse:expectation:error:", v12, v13, a5);

  if (v14)
  {
    if ((v12 & 1) != 0
      || -[MLE5Engine _cleanUpAndReconfigureStream:forInputFeatures:error:](self, "_cleanUpAndReconfigureStream:forInputFeatures:error:", v11, v8, a5))
    {
      -[MLE5Engine _predictionFromFeatures:stream:options:error:](self, "_predictionFromFeatures:stream:options:error:", v8, v11, v9, a5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLE5Engine streamPool](self, "streamPool");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "putBack:", v11);
    }
    else
    {
      -[MLE5Engine streamPool](self, "streamPool");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "putBack:", v11);
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_predictionFromFeatures:(id)a3 stream:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;

  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v10, "executeForInputFeatures:options:error:", a3, v11, a6))
  {
    objc_msgSend(v10, "operations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "outputFeatures");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLE5Engine _postProcessingForOutputs:options:error:](self, "_postProcessingForOutputs:options:error:", v14, v11, a6);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      if (objc_msgSend(v11, "hasDirectBindingExpectations"))
      {
        objc_msgSend(v13, "directlyBoundInputFeatureNames");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "directlyBoundOutputFeatureNames");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v11, "validateExpectationsWithDirectlyBoundInputs:outputs:error:", v16, v17, a6);

        if ((v18 & 1) == 0)
        {

          v19 = 0;
          goto LABEL_8;
        }
      }
    }

  }
  else
  {
    v15 = 0;
  }
  v15 = v15;
  v19 = v15;
LABEL_8:

  return v19;
}

- (id)newRequestForModel:(id)a3 inputFeatures:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  +[MLState emptyState](MLState, "emptyState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MLE5Engine _newRequestForModel:inputFeatures:usingState:options:error:](self, "_newRequestForModel:inputFeatures:usingState:options:error:", v10, v11, v13, v12, a6);

  return v14;
}

- (id)_newRequestForModel:(id)a3 inputFeatures:(id)a4 usingState:(id)a5 options:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  objc_super v21;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  -[MLE5Engine _conformInputFeatures:error:](self, "_conformInputFeatures:error:", a4, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_6;
  +[MLState emptyState](MLState, "emptyState");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 != v13)
  {
    -[MLE5Engine _conformState:error:](self, "_conformState:error:", v13, a7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      +[MLFeatureProviderUtils lazyProviderWithFeaturesProvidedBy:addedToFeaturesProvidedBy:](MLFeatureProviderUtils, "lazyProviderWithFeaturesProvidedBy:addedToFeaturesProvidedBy:", v17, v15);
      v18 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v18;
      goto LABEL_5;
    }
LABEL_6:
    v19 = 0;
    goto LABEL_7;
  }
LABEL_5:
  v21.receiver = self;
  v21.super_class = (Class)MLE5Engine;
  v19 = -[MLModelEngine newRequestForModel:inputFeatures:options:error:](&v21, sel_newRequestForModel_inputFeatures_options_error_, v12, v15, v14, a7);
LABEL_7:

  return v19;
}

- (void)submitPredictionRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1A1AD6ED8]();
  objc_msgSend(v10, "inputFeatures");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predictionOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLE5Engine _predictionFromFeatures:options:completionHandler:](self, "_predictionFromFeatures:options:completionHandler:", v8, v9, v6);

  objc_autoreleasePoolPop(v7);
}

- (void)_predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  id v16;
  BOOL v17;
  id v18;
  char v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  void (**v26)(id, _QWORD, id);
  id v27;
  id v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  -[MLE5Engine streamPool](self, "streamPool");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "takeOut");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "reusableForAsyncSubmissionForInputFeatures:options:", v8, v9);
  objc_msgSend(v9, "e5rtStreamReuseExpectation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v15 = -[MLE5Engine _validateStreamReuse:expectation:error:](self, "_validateStreamReuse:expectation:error:", v13, v14, &v29);
  v16 = v29;

  if (v15)
  {
    if ((v13 & 1) == 0)
    {
      v28 = v16;
      v17 = -[MLE5Engine _cleanUpAndReconfigureStream:forInputFeatures:error:](self, "_cleanUpAndReconfigureStream:forInputFeatures:error:", v12, v8, &v28);
      v18 = v28;

      if (!v17)
      {
        -[MLE5Engine streamPool](self, "streamPool");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "putBack:", v12);

        v16 = v18;
        v10[2](v10, 0, v18);
        goto LABEL_10;
      }
      v16 = v18;
    }
    v27 = v16;
    v19 = objc_msgSend(v12, "prepareAsyncSubmissionForInputFeatures:options:error:", v8, v9, &v27);
    v20 = v27;

    if ((v19 & 1) != 0)
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __64__MLE5Engine__predictionFromFeatures_options_completionHandler___block_invoke;
      v23[3] = &unk_1E3D663C0;
      v23[4] = self;
      v24 = v9;
      v25 = v12;
      v26 = v10;
      objc_msgSend(v25, "submitWithCompletionHandler:", v23);

      v16 = v20;
    }
    else
    {
      -[MLE5Engine _cleanUpStream:](self, "_cleanUpStream:", v12);
      -[MLE5Engine streamPool](self, "streamPool");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "putBack:", v12);

      v16 = v20;
      v10[2](v10, 0, v20);
    }
  }
  else
  {
    -[MLE5Engine _cleanUpStream:](self, "_cleanUpStream:", v12);
    v10[2](v10, 0, v16);
  }
LABEL_10:

}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id *v18;
  void *v19;
  void *v20;
  MLArrayBatchProvider *v21;
  id *v23;
  _QWORD *v24;
  dispatch_queue_t v25;
  id v26;
  void *v27;
  _QWORD v28[4];
  NSObject *v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t *v33;
  uint64_t v34;
  id obj;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v23 = a5;
  v7 = a3;
  v26 = a4;
  v27 = v7;
  v8 = objc_msgSend(v7, "count");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
  if (v8)
  {
    v10 = v8;
    do
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null", v23);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v11);

      --v10;
    }
    while (v10);
  }
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__15721;
  v40 = __Block_byref_object_dispose__15722;
  v41 = 0;
  -[MLE5Engine batchMaxInFlightSem](self, "batchMaxInFlightSem", v23);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_group_create();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v14 = objc_claimAutoreleasedReturnValue();
  v25 = dispatch_queue_create("com.apple.coreml.MLE5BatchPredictionQueue", v14);

  if (v8)
  {
    v15 = 0;
    while (1)
    {
      objc_msgSend(v27, "featuresAtIndex:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLE5Engine inputFeatureConformer](self, "inputFeatureConformer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (id *)(v37 + 5);
      obj = (id)v37[5];
      objc_msgSend(v17, "conformFeatures:error:", v16, &obj);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v18, obj);

      if (!v19)
        break;
      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_group_enter(v13);
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __49__MLE5Engine_predictionsFromBatch_options_error___block_invoke;
      v28[3] = &unk_1E3D66410;
      v29 = v25;
      v33 = &v36;
      v30 = v9;
      v34 = v15;
      v31 = v13;
      v32 = v12;
      -[MLE5Engine _predictionFromFeatures:options:completionHandler:](self, "_predictionFromFeatures:options:completionHandler:", v19, v26, v28);

      if (v8 == ++v15)
        goto LABEL_10;
    }

  }
LABEL_10:
  dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  v20 = (void *)v37[5];
  if (v20)
  {
    v21 = 0;
    if (v24)
      *v24 = objc_retainAutorelease(v20);
  }
  else
  {
    v21 = -[MLArrayBatchProvider initWithFeatureProviderArray:]([MLArrayBatchProvider alloc], "initWithFeatureProviderArray:", v9);
  }

  _Block_object_dispose(&v36, 8);
  return v21;
}

- (id)_postProcessingForOutputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;

  v8 = a3;
  v9 = a4;
  -[MLE5Engine classLabels](self, "classLabels");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && v10)
  {
    kdebug_trace();
    -[MLE5Engine _outputFeaturesByAddingClassifierResultTo:classifyTopK:error:](self, "_outputFeaturesByAddingClassifierResultTo:classifyTopK:error:", v8, objc_msgSend(v9, "classifyTopK"), a5);
    v11 = objc_claimAutoreleasedReturnValue();

    kdebug_trace();
    v8 = (id)v11;
  }

  return v8;
}

- (void)_cleanUpStream:(id)a3
{
  objc_msgSend(a3, "resetAfterLingering:", 0.0);
}

- (id)_outputFeaturesByAddingClassifierResultTo:(id)a3 classifyTopK:(unint64_t)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[MLE5Engine _classifierResultFromOutputFeatures:classifyTopK:error:](self, "_classifierResultFromOutputFeatures:classifyTopK:error:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[MLModelEngine modelDescription](self, "modelDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predictedClassFeatureDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLModelEngine modelDescription](self, "modelDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "classProbabilityFeatureDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "asFeatureDictionaryWithPredictedClassDescription:classProbabilityDescription:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)newStateWithClientBuffers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MLModelEngine modelDescription](self, "modelDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stateDescriptionsByName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLE5Engine programLibrary](self, "programLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLE5Engine functionName](self, "functionName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v10 = (void *)objc_msgSend(v7, "newStateForFunctionNamed:stateNames:clientBuffers:error:", v8, v9, v4, &v17);
  v11 = v17;

  if (!v10)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "localizedDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v16;
      _os_log_error_impl(&dword_19C486000, v12, OS_LOG_TYPE_ERROR, "Failed to create state with error: %@", buf, 0xCu);

    }
    v13 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(v11, "localizedDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Failed to create state with error: %@"), v14);

  }
  return v10;
}

- (NSString)serializedMILText
{
  void *v2;
  void *v3;

  -[MLE5Engine programLibrary](self, "programLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serializedMILText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)evaluateFunction:(id)a3 arguments:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v21;
  uint64_t v22;
  void *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqualToString:", v10);

  if ((v11 & 1) == 0)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v8;
      v26 = 2080;
      v27 = "main";
      _os_log_error_impl(&dword_19C486000, v12, OS_LOG_TYPE_ERROR, "Unable to evaluate the function named %@ because the implementation supports only %s function.", buf, 0x16u);
    }

    if (a5)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to evaluate the function named %@ because the implementation supports only %s function."), v8, "main");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v16 = (void *)MEMORY[0x1A1AD6ED8]();
  +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  -[MLE5Engine _predictionFromFeatures:options:error:](self, "_predictionFromFeatures:options:error:", v9, v17, &v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v21;

  objc_autoreleasePoolPop(v16);
  if (a5 && !v18)
    *a5 = objc_retainAutorelease(v19);

  return v18;
}

- (id)newContextAndReturnError:(id *)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v9[8];
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    _os_log_error_impl(&dword_19C486000, v4, OS_LOG_TYPE_ERROR, "The implementation doesn't support model training.", v9, 2u);
  }

  if (a3)
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The implementation doesn't support model training."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (id)classLabels
{
  void *v2;
  void *v3;

  -[MLModelEngine modelDescription](self, "modelDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "classLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)classify:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t v23[8];
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  kdebug_trace();
  -[MLModelEngine modelDescription](self, "modelDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predictedFeatureName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[MLE5Engine classLabels](self, "classLabels");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[MLE5Engine predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v8, v9, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[MLE5Engine _classifierResultFromOutputFeatures:classifyTopK:error:](self, "_classifierResultFromOutputFeatures:classifyTopK:error:", v13, objc_msgSend(v9, "classifyTopK"), a5);
        a5 = (id *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        a5 = 0;
      }

      goto LABEL_16;
    }
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_error_impl(&dword_19C486000, v18, OS_LOG_TYPE_ERROR, "Unable to classify the input because the model description doesn't have class labels.", v23, 2u);
    }

    if (a5)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to classify the input because the model description doesn't have class labels."));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v21);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_error_impl(&dword_19C486000, v14, OS_LOG_TYPE_ERROR, "Unable to classify the input because the model description doesn't have predictedFeatureName property.", v23, 2u);
    }

    if (a5)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to classify the input because the model description doesn't have predictedFeatureName property."));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v17);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
      a5 = 0;
    }
  }
LABEL_16:
  kdebug_trace();

  return a5;
}

- (id)_classifierResultFromOutputFeatures:(id)a3 classifyTopK:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  MLProbabilityDictionary *v15;
  void *v16;
  MLProbabilityDictionary *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t v25[8];
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[MLE5Engine _classProbabilitiesInOutputFeatures:error:](self, "_classProbabilitiesInOutputFeatures:error:", v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_12:
    v22 = 0;
    goto LABEL_15;
  }
  -[MLE5Engine classLabels](self, "classLabels");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  if (v11 >= a4)
    v12 = a4;
  else
    v12 = v11;

  if (!v12)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_error_impl(&dword_19C486000, v18, OS_LOG_TYPE_ERROR, "There must be at least one class to return.", v25, 2u);
    }

    if (a5)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("There must be at least one class to return."));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v21);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_12;
  }
  -[MLE5Engine classLabels](self, "classLabels");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v12 == v14)
  {
    v15 = [MLProbabilityDictionary alloc];
    -[MLE5Engine classLabelsSharedKey](self, "classLabelsSharedKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[MLProbabilityDictionary initWithSharedKeySet:probabilityMultiArray:](v15, "initWithSharedKeySet:probabilityMultiArray:", v16, v9);

  }
  else
  {
    -[MLE5Engine _probabilityDictionaryWithMultiArray:classifyTopK:](self, "_probabilityDictionaryWithMultiArray:classifyTopK:", v9, v12);
    v17 = (MLProbabilityDictionary *)objc_claimAutoreleasedReturnValue();
  }
  -[MLProbabilityDictionary classLabelOfMaxProbability](v17, "classLabelOfMaxProbability");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLClassifierResult resultWithClassProbability:additionalFeatures:classLabelOfMaxProbability:](MLClassifierResult, "resultWithClassProbability:additionalFeatures:classLabelOfMaxProbability:", v17, v8, v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v22;
}

- (id)_probabilityDictionaryWithMultiArray:(id)a3 classifyTopK:(int64_t)a4
{
  id v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  MLProbabilityDictionary *v19;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  void *__p;
  _QWORD *v27;

  v6 = a3;
  -[MLE5Engine classLabels](self, "classLabels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&__p, objc_msgSend(v7, "count"));

  v9 = __p;
  v8 = v27;
  if (__p != v27)
  {
    v10 = 0;
    v11 = __p;
    do
      *v11++ = v10++;
    while (v11 != v8);
  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __64__MLE5Engine__probabilityDictionaryWithMultiArray_classifyTopK___block_invoke;
  v21[3] = &unk_1E3D66438;
  v12 = v6;
  v22 = v12;
  v23 = v9;
  v24 = &v9[a4];
  v25 = v8;
  objc_msgSend(v12, "getBytesWithHandler:", v21);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
  if (a4)
  {
    v15 = 8 * a4;
    do
    {
      -[MLE5Engine classLabels](self, "classLabels");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", *v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v17);

      objc_msgSend(v12, "objectAtIndexedSubscript:", *v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v18);

      ++v9;
      v15 -= 8;
    }
    while (v15);
  }
  v19 = -[MLProbabilityDictionary initWithLabels:probabilityArray:]([MLProbabilityDictionary alloc], "initWithLabels:probabilityArray:", v13, v14);

  if (__p)
  {
    v27 = __p;
    operator delete(__p);
  }

  return v19;
}

- (id)_classProbabilitiesInOutputFeatures:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  _QWORD v59[2];

  v59[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MLE5Engine classProbabilitiesFeatureName](self, "classProbabilitiesFeatureName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "featureValueForName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (objc_msgSend(v8, "type") == 5)
    {
      objc_msgSend(v8, "multiArrayValue");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");
      -[MLE5Engine classLabels](self, "classLabels");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v10 == v12)
      {
        if (objc_msgSend(v9, "dataType") == 65552
          || objc_msgSend(v9, "dataType") == 65568
          || objc_msgSend(v9, "dataType") == 65600)
        {
          v9 = v9;
          a4 = (id *)v9;
LABEL_21:

          goto LABEL_22;
        }
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          -[MLE5Engine classProbabilitiesFeatureName](self, "classProbabilitiesFeatureName");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v51 = v45;
          _os_log_error_impl(&dword_19C486000, v34, OS_LOG_TYPE_ERROR, "Class probability feature named %@ must be a MLMultiArray of Float16, Float32 or Float64.", buf, 0xCu);

        }
        if (!a4)
          goto LABEL_21;
        v35 = (void *)MEMORY[0x1E0CB35C8];
        v46 = *MEMORY[0x1E0CB2D50];
        v36 = (void *)MEMORY[0x1E0CB3940];
        -[MLE5Engine classProbabilitiesFeatureName](self, "classProbabilitiesFeatureName");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringWithFormat:", CFSTR("Class probability feature named %@ must be a MLMultiArray of Float16, Float32 or Float64."), v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v38;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v39);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          -[MLE5Engine classProbabilitiesFeatureName](self, "classProbabilitiesFeatureName");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v9, "count");
          -[MLE5Engine classLabels](self, "classLabels");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v51 = v42;
          v52 = 2048;
          v53 = v43;
          v54 = 2048;
          v55 = objc_msgSend(v44, "count");
          _os_log_error_impl(&dword_19C486000, v24, OS_LOG_TYPE_ERROR, "Class probability feature named %@ has %tu classes, but there are %zd class labels.", buf, 0x20u);

        }
        if (!a4)
          goto LABEL_21;
        v25 = (void *)MEMORY[0x1E0CB35C8];
        v48 = *MEMORY[0x1E0CB2D50];
        v26 = (void *)MEMORY[0x1E0CB3940];
        -[MLE5Engine classProbabilitiesFeatureName](self, "classProbabilitiesFeatureName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v9, "count");
        -[MLE5Engine classLabels](self, "classLabels");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", CFSTR("Class probability feature named %@ has %tu classes, but there are %zd class labels."), v27, v28, objc_msgSend(v29, "count"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v31);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
LABEL_20:
      a4 = 0;
      goto LABEL_21;
    }
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      -[MLE5Engine classProbabilitiesFeatureName](self, "classProbabilitiesFeatureName");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", objc_msgSend(v8, "type"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v51 = v40;
      v52 = 2112;
      v53 = (uint64_t)v41;
      _os_log_error_impl(&dword_19C486000, v18, OS_LOG_TYPE_ERROR, "Output feature named %@ is supposed to be a MLMultiArray representing class probabilities but it is %@.", buf, 0x16u);

    }
    if (a4)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v56 = *MEMORY[0x1E0CB2D50];
      v20 = (void *)MEMORY[0x1E0CB3940];
      -[MLE5Engine classProbabilitiesFeatureName](self, "classProbabilitiesFeatureName");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", objc_msgSend(v8, "type"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("Output feature named %@ is supposed to be a MLMultiArray representing class probabilities but it is %@."), v9, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v23);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_20;
    }
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[MLE5Engine classProbabilitiesFeatureName](self, "classProbabilitiesFeatureName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v51 = v33;
      _os_log_error_impl(&dword_19C486000, v13, OS_LOG_TYPE_ERROR, "There is no output feature named %@.", buf, 0xCu);

    }
    if (a4)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v58 = *MEMORY[0x1E0CB2D50];
      v15 = (void *)MEMORY[0x1E0CB3940];
      -[MLE5Engine classProbabilitiesFeatureName](self, "classProbabilitiesFeatureName");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("There is no output feature named %@."), v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, &v58, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_20;
    }
  }
LABEL_22:

  return a4;
}

- (unint64_t)_extractSupportedComputeUnitFromString:(id)a3
{
  id v3;
  unint64_t v4;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "containsString:", CFSTR("classic_cpu")) & 1) != 0
    || (objc_msgSend(v3, "containsString:", CFSTR("mlc")) & 1) != 0)
  {
    goto LABEL_3;
  }
  if ((objc_msgSend(v3, "containsString:", CFSTR("mps_graph")) & 1) != 0)
  {
    v4 = 2;
    goto LABEL_4;
  }
  if ((objc_msgSend(v3, "containsString:", CFSTR("ane")) & 1) != 0)
  {
    v4 = 4;
    goto LABEL_4;
  }
  if ((objc_msgSend(v3, "containsString:", CFSTR("bnns")) & 1) != 0
    || (objc_msgSend(v3, "containsString:", CFSTR("e5_minimal_cpu")) & 1) != 0)
  {
LABEL_3:
    v4 = 1;
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_error_impl(&dword_19C486000, v6, OS_LOG_TYPE_ERROR, "Internal error, unsupported backend with name=%@.", (uint8_t *)&v7, 0xCu);
    }

    v4 = 0;
  }
LABEL_4:

  return v4;
}

- (unint64_t)_extractSupportFromBackendDict:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = a3;
  v5 = 0;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v5 |= -[MLE5Engine _extractSupportedComputeUnitFromString:](self, "_extractSupportedComputeUnitFromString:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++), (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v5;
}

- (id)_trimQuotesFromBackendName:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("\"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)_totalRuntimeInMilliSecondsFromE5AnalyticsDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v18 = v3;
  if (v3)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = v3;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v22;
      v6 = *MEMORY[0x1E0D1FD20];
      v7 = *MEMORY[0x1E0D1FD08];
      v8 = 0.0;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v22 != v5)
            objc_enumerationMutation(obj);
          objc_msgSend(obj, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLE5Engine _trimQuotesFromBackendName:](self, "_trimQuotesFromBackendName:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "doubleValue");
          v16 = v15;

          v8 = v8 + v16;
        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v4);
    }
    else
    {
      v8 = 0.0;
    }

  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (id)executionSchedule
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  MLLayerExecutionSchedule *v35;
  void *v36;
  void *v37;
  void *v38;
  MLLayerPath *v39;
  void *v40;
  MLLayerPath *v41;
  void *v42;
  void *v43;
  void *v44;
  MLModelStructurePath *v45;
  MLModelStructurePath *v46;
  id v47;
  NSObject *v48;
  void *v50;
  void *v51;
  MLModelExecutionSchedule *v52;
  void *v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  os_log_t log;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  unint64_t v70;
  MLLayerExecutionSchedule *v71;
  unint64_t v72;
  void *v73;
  id obj;
  void *v75;
  void *v76;
  uint64_t i;
  void *v78;
  id v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  id v93;
  MLLayerPath *v94;
  MLLayerExecutionSchedule *v95;
  _BYTE v96[128];
  _BYTE v97[128];
  uint8_t v98[128];
  uint8_t buf[4];
  void *v100;
  __int16 v101;
  id v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[MLModelEngine modelDescription](self, "modelDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v100 = v5;
    _os_log_impl(&dword_19C486000, v3, OS_LOG_TYPE_INFO, "The client requested MLE5Engine to report the segmentation analytics of the model: %@. ", buf, 0xCu);

  }
  -[MLE5Engine programLibrary](self, "programLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = 0;
  objc_msgSend(v6, "segmentationAnalyticsAndReturnError:", &v93);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v93;

  if (v53)
  {
    -[MLE5Engine _totalRuntimeInMilliSecondsFromE5AnalyticsDictionary:](self, "_totalRuntimeInMilliSecondsFromE5AnalyticsDictionary:");
    v8 = v7;
    v52 = objc_alloc_init(MLModelExecutionSchedule);
    log = (os_log_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v55 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    obj = v53;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
    if (v9)
    {
      v64 = v9;
      v62 = *MEMORY[0x1E0D1FD10];
      v63 = *(_QWORD *)v90;
      v60 = *MEMORY[0x1E0D1FD20];
      v61 = *MEMORY[0x1E0D1FCF8];
      v57 = *MEMORY[0x1E0D1FD08];
      v58 = *MEMORY[0x1E0D1FD28];
      v66 = *MEMORY[0x1E0D1FD00];
      v56 = *MEMORY[0x1E0D1FD18];
      v54 = *MEMORY[0x1E0C99768];
      do
      {
        for (i = 0; i != v64; ++i)
        {
          if (*(_QWORD *)v90 != v63)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * i);
          objc_msgSend(obj, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v62);
          v75 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(obj, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v61);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = v12;
          objc_msgSend(v12, "objectForKeyedSubscript:", v60);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = -[MLE5Engine _extractSupportFromBackendDict:](self, "_extractSupportFromBackendDict:", v76);
          v70 = -[MLE5Engine _extractSupportedComputeUnitFromString:](self, "_extractSupportedComputeUnitFromString:", v13);
          if (v70)
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", v58);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = v13;
            v79 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v87 = 0u;
            v88 = 0u;
            v85 = 0u;
            v86 = 0u;
            v15 = v14;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
            if (v16)
            {
              v17 = *(_QWORD *)v86;
              do
              {
                for (j = 0; j != v16; ++j)
                {
                  if (*(_QWORD *)v86 != v17)
                    objc_enumerationMutation(v15);
                  v19 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * j);
                  v20 = -[MLE5Engine _extractSupportedComputeUnitFromString:](self, "_extractSupportedComputeUnitFromString:", v19);
                  objc_msgSend(v15, "objectForKeyedSubscript:", v19);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v79, "setObject:forKeyedSubscript:", v21, v22);

                }
                v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
              }
              while (v16);
            }

            objc_msgSend(v78, "objectForKeyedSubscript:", v57);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v83 = 0u;
            v84 = 0u;
            v81 = 0u;
            v82 = 0u;
            v25 = v23;
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
            if (v26)
            {
              v27 = *(_QWORD *)v82;
              do
              {
                for (k = 0; k != v26; ++k)
                {
                  if (*(_QWORD *)v82 != v27)
                    objc_enumerationMutation(v25);
                  v29 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * k);
                  v30 = -[MLE5Engine _extractSupportedComputeUnitFromString:](self, "_extractSupportedComputeUnitFromString:", v29);
                  objc_msgSend(v25, "objectForKeyedSubscript:", v29);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v30);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "setObject:forKeyedSubscript:", v31, v32);

                }
                v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
              }
              while (v26);
            }

            -[MLE5Engine _trimQuotesFromBackendName:](self, "_trimQuotesFromBackendName:", v68);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectForKeyedSubscript:", v65);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = 0.0;
            if (v8 > 0.0)
            {
              objc_msgSend(v67, "doubleValue");
              v33 = v34 / v8;
            }
            v35 = [MLLayerExecutionSchedule alloc];
            objc_msgSend(v78, "objectForKeyedSubscript:", v66);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "objectForKeyedSubscript:", v56);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = -[MLLayerExecutionSchedule initWithComputeUnits:layerName:layerError:layerTypeName:supportedComputeUnits:layerIndex:supportMessages:computeTimeRatio:](v35, "initWithComputeUnits:layerName:layerError:layerTypeName:supportedComputeUnits:layerIndex:supportMessages:computeTimeRatio:", v70, v36, 0, v37, v70 | v72, objc_msgSend(v75, "integerValue"), v33, v79);

            -[MLModelEngine modelPath](self, "modelPath");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "scopedModelNames");
            v73 = (void *)objc_claimAutoreleasedReturnValue();

            v39 = [MLLayerPath alloc];
            objc_msgSend(v78, "objectForKeyedSubscript:", v66);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = -[MLLayerPath initWithScopedModelAndLayerName:layerName:](v39, "initWithScopedModelAndLayerName:layerName:", v73, v40);

            v94 = v41;
            v95 = v71;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addEntriesFromDictionary:](log, "addEntriesFromDictionary:", v42);

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "OpPath");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "objectForKeyedSubscript:", v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v44, "count"))
            {
              v45 = [MLModelStructurePath alloc];
              v80 = v69;
              v46 = -[MLModelStructurePath initWithMLProgramOperationPathComponents:scopedModelNames:error:](v45, "initWithMLProgramOperationPathComponents:scopedModelNames:error:", v44, v73, &v80);
              v47 = v80;

              if (v46)
              {
                objc_msgSend(v55, "setObject:forKeyedSubscript:", v71, v46);
              }
              else
              {
                +[MLLogging coreChannel](MLLogging, "coreChannel");
                v48 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v100 = v44;
                  v101 = 2112;
                  v102 = v47;
                  _os_log_error_impl(&dword_19C486000, v48, OS_LOG_TYPE_ERROR, "Failed to construct ModelStructurePath from path components=%@, error=%@", buf, 0x16u);
                }

                objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v54, CFSTR("Failed to construct ModelStructurePath from path components=%@, error=%@"), v44, v47);
                v46 = 0;
              }
            }
            else
            {
              v46 = 0;
              v47 = v69;
            }

            v69 = v47;
            v13 = v68;
          }

        }
        v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
      }
      while (v64);
    }

    -[MLModelExecutionSchedule setModelExecutionSchedule:](v52, "setModelExecutionSchedule:", log);
    -[MLModelExecutionSchedule setModelExecutionScheduleByModelStructurePath:](v52, "setModelExecutionScheduleByModelStructurePath:", v55);

  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      -[MLModelEngine modelDescription](self, "modelDescription");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "modelURL");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v100 = v51;
      v101 = 2112;
      v102 = v69;
      _os_log_error_impl(&dword_19C486000, log, OS_LOG_TYPE_ERROR, "MLE5Engine failed to get segmentation analytics of the model: %@, error =%@", buf, 0x16u);

    }
    v52 = 0;
  }

  return v52;
}

- (void)enableInstrumentsTracing
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MLE5Engine;
  -[MLModelEngine enableInstrumentsTracing](&v4, sel_enableInstrumentsTracing);
  -[MLE5Engine streamPool](self, "streamPool");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enableInstrumentsTracing");

}

- (id)newStateForFeatureNamed:(id)a3 initializerBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MLE5Engine programLibrary](self, "programLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLE5Engine functionName](self, "functionName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v11 = (void *)objc_msgSend(v8, "newStateForFunctionNamed:stateNames:clientBuffers:error:", v9, v10, MEMORY[0x1E0C9AA70], &v20);
  v12 = v20;

  if (!v11)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "localizedDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v17;
      _os_log_error_impl(&dword_19C486000, v13, OS_LOG_TYPE_ERROR, "Failed to create state with error: %@", buf, 0xCu);

    }
    v14 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(v12, "localizedDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Failed to create state with error: %@"), v15);

  }
  if (v7)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __55__MLE5Engine_newStateForFeatureNamed_initializerBlock___block_invoke;
    v18[3] = &unk_1E3D67020;
    v19 = v7;
    objc_msgSend(v11, "getMultiArrayForStateNamed:handler:", v6, v18);

  }
  return v11;
}

- (MLE5ExecutionStreamPool)streamPool
{
  return (MLE5ExecutionStreamPool *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)functionName
{
  return self->_functionName;
}

- (NSString)classProbabilitiesFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (id)classLabelsSharedKey
{
  return objc_getProperty(self, a2, 64, 1);
}

- (MLFeatureProviderConformer)inputFeatureConformer
{
  return (MLFeatureProviderConformer *)objc_getProperty(self, a2, 72, 1);
}

- (MLFeatureProviderConformer)stateFeatureConformer
{
  return (MLFeatureProviderConformer *)objc_getProperty(self, a2, 80, 1);
}

- (OS_dispatch_semaphore)batchMaxInFlightSem
{
  return self->_batchMaxInFlightSem;
}

- (MLVersionInfo)compilerVersionInfo
{
  return self->_compilerVersionInfo;
}

- (MLE5ProgramLibrary)programLibrary
{
  return self->_programLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_programLibrary, 0);
  objc_storeStrong((id *)&self->_compilerVersionInfo, 0);
  objc_storeStrong((id *)&self->_batchMaxInFlightSem, 0);
  objc_storeStrong((id *)&self->_stateFeatureConformer, 0);
  objc_storeStrong((id *)&self->_inputFeatureConformer, 0);
  objc_storeStrong(&self->_classLabelsSharedKey, 0);
  objc_storeStrong((id *)&self->_classProbabilitiesFeatureName, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_operationPool, 0);
  objc_storeStrong((id *)&self->_streamPool, 0);
}

uint64_t __55__MLE5Engine_newStateForFeatureNamed_initializerBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__MLE5Engine__probabilityDictionaryWithMultiArray_classifyTopK___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  float v12;
  float v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  float v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  float v28;
  float v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  float v33;
  float v34;
  float v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  unint64_t v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t v44;
  double v45;
  double v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t *v52;
  double v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  double v61;
  double v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t *v65;
  double v66;
  double v67;
  double v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  NSObject *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  __int16 v90[8];

  result = objc_msgSend(*(id *)(a1 + 32), "dataType");
  if (result == 65568)
  {
    v6 = *(uint64_t **)(a1 + 48);
    v5 = *(uint64_t **)(a1 + 56);
    if (v6 == v5)
      return result;
    v7 = *(uint64_t **)(a1 + 40);
    while (1)
    {
      v8 = v5 - v7;
      if (v8 < 2)
        return result;
      if (v8 == 3)
        return _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZZ64__MLE5Engine__probabilityDictionaryWithMultiArray_classifyTopK__EUb_E3__0NS_11__wrap_iterIPmEEEEjT1_S7_S7_T0_(v7, v7 + 1, v5 - 1, a2);
      if (v8 == 2)
        break;
      if ((char *)v5 - (char *)v7 <= 63)
      {
        if (v5 - 1 == v7)
          return result;
        while (2)
        {
          v76 = v5;
          if (v7 == v5)
          {
LABEL_119:
            if (v76 != v7)
            {
              v82 = *v7;
              *v7 = *v76;
              *v76 = v82;
            }
          }
          else
          {
            v77 = v7 + 1;
            if (v7 + 1 != v5)
            {
              v78 = *v7;
              v76 = v7;
              v79 = v7 + 1;
              do
              {
                v81 = *v79++;
                v80 = v81;
                if (*(float *)(a2 + 4 * v81) > *(float *)(a2 + 4 * v78))
                {
                  v78 = v80;
                  v76 = v77;
                }
                v77 = v79;
              }
              while (v79 != v5);
              goto LABEL_119;
            }
          }
          if (++v7 == v5 - 1)
            return result;
          continue;
        }
      }
      v9 = &v7[v8 >> 1];
      v10 = v5 - 1;
      result = _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZZ64__MLE5Engine__probabilityDictionaryWithMultiArray_classifyTopK__EUb_E3__0NS_11__wrap_iterIPmEEEEjT1_S7_S7_T0_(v7, v9, v5 - 1, a2);
      v11 = *v7;
      v12 = *(float *)(a2 + 4 * *v7);
      v13 = *(float *)(a2 + 4 * *v9);
      if (v12 > v13)
      {
LABEL_13:
        v18 = v7 + 1;
        if (v7 + 1 >= v10)
        {
          v21 = v7 + 1;
        }
        else
        {
          v19 = v7 + 1;
          while (1)
          {
            v20 = *(float *)(a2 + 4 * *v9);
            do
            {
              v21 = v19;
              v23 = *v19++;
              v22 = v23;
            }
            while (*(float *)(a2 + 4 * v23) > v20);
            do
            {
              v25 = *--v10;
              v24 = v25;
            }
            while (*(float *)(a2 + 4 * v25) <= v20);
            if (v21 >= v10)
              break;
            *v21 = v24;
            *v10 = v22;
            result = (result + 1);
            if (v9 == v21)
              v9 = v10;
          }
        }
        if (v21 != v9)
        {
          v26 = *v21;
          if (*(float *)(a2 + 4 * *v9) > *(float *)(a2 + 4 * *v21))
          {
            *v21 = *v9;
            *v9 = v26;
            result = (result + 1);
          }
        }
        if (v21 == v6)
          return result;
        if (!(_DWORD)result)
        {
          if (v21 <= v6)
          {
            v32 = v21 + 1;
            while (v32 != v5)
            {
              v33 = *(float *)(a2 + 4 * *v32);
              v34 = *(float *)(a2 + 4 * *(v32++ - 1));
              if (v33 > v34)
                goto LABEL_28;
            }
          }
          else
          {
            while (v18 != v21)
            {
              v28 = *(float *)(a2 + 4 * *v18);
              v29 = *(float *)(a2 + 4 * *(v18++ - 1));
              if (v28 > v29)
                goto LABEL_28;
            }
          }
          return result;
        }
LABEL_28:
        if (v21 <= v6)
        {
          v27 = v21 + 1;
        }
        else
        {
          v5 = v21;
          v27 = v7;
        }
      }
      else
      {
        v14 = v5 - 2;
        while (v14 != v7)
        {
          v15 = v14;
          v17 = *v14--;
          v16 = v17;
          if (*(float *)(a2 + 4 * v17) > v13)
          {
            *v7 = v16;
            *v15 = v11;
            result = (result + 1);
            v10 = v15;
            goto LABEL_13;
          }
        }
        v30 = v7 + 1;
        if (v12 <= *(float *)(a2 + 4 * *v10))
        {
          while (v30 != v10)
          {
            v31 = *v30;
            if (v12 > *(float *)(a2 + 4 * *v30))
            {
              *v30++ = *v10;
              *v10 = v31;
              goto LABEL_44;
            }
            ++v30;
          }
          return result;
        }
LABEL_44:
        if (v30 == v10)
          return result;
        while (1)
        {
          v35 = *(float *)(a2 + 4 * *v7);
          do
          {
            v27 = v30;
            v37 = *v30++;
            v36 = v37;
          }
          while (v35 <= *(float *)(a2 + 4 * v37));
          do
          {
            v39 = *--v10;
            v38 = v39;
          }
          while (v35 > *(float *)(a2 + 4 * v39));
          if (v27 >= v10)
            break;
          *v27 = v38;
          *v10 = v36;
        }
        if (v27 > v6)
          return result;
      }
      v7 = v27;
      if (v5 == v6)
        return result;
    }
    v74 = *(v5 - 1);
    v75 = *v7;
    if (*(float *)(a2 + 4 * v74) <= *(float *)(a2 + 4 * *v7))
      return result;
LABEL_125:
    *v7 = v74;
    *(v5 - 1) = v75;
    return result;
  }
  result = objc_msgSend(*(id *)(a1 + 32), "dataType");
  if (result != 65600)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
    {
      v90[0] = 0;
      _os_log_error_impl(&dword_19C486000, v73, OS_LOG_TYPE_ERROR, "MLMultiArray for class probabilities must be Float64 or Float32.", (uint8_t *)v90, 2u);
    }

    return objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("MLMultiArray for class probabilities must be Float64 or Float32."));
  }
  v40 = *(uint64_t **)(a1 + 48);
  v5 = *(uint64_t **)(a1 + 56);
  if (v40 == v5)
    return result;
  v7 = *(uint64_t **)(a1 + 40);
LABEL_56:
  v41 = v5 - v7;
  if (v41 < 2)
    return result;
  if (v41 == 3)
    return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLTreeEnsembleClassifier _buildClassificationClasses:topk:error:]::$_1 &,std::__wrap_iter<unsigned long *>>(v7, v7 + 1, v5 - 1, a2);
  if (v41 == 2)
  {
    v74 = *(v5 - 1);
    v75 = *v7;
    if (*(double *)(a2 + 8 * v74) <= *(double *)(a2 + 8 * *v7))
      return result;
    goto LABEL_125;
  }
  if ((char *)v5 - (char *)v7 <= 63)
  {
    if (v5 - 1 == v7)
      return result;
    while (1)
    {
      v83 = v5;
      if (v7 == v5)
        goto LABEL_133;
      v84 = v7 + 1;
      if (v7 + 1 != v5)
        break;
LABEL_135:
      if (++v7 == v5 - 1)
        return result;
    }
    v85 = *v7;
    v83 = v7;
    v86 = v7 + 1;
    do
    {
      v88 = *v86++;
      v87 = v88;
      if (*(double *)(a2 + 8 * v88) > *(double *)(a2 + 8 * v85))
      {
        v85 = v87;
        v83 = v84;
      }
      v84 = v86;
    }
    while (v86 != v5);
LABEL_133:
    if (v83 != v7)
    {
      v89 = *v7;
      *v7 = *v83;
      *v83 = v89;
    }
    goto LABEL_135;
  }
  v42 = &v7[v41 >> 1];
  v43 = v5 - 1;
  result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLTreeEnsembleClassifier _buildClassificationClasses:topk:error:]::$_1 &,std::__wrap_iter<unsigned long *>>(v7, v42, v5 - 1, a2);
  v44 = *v7;
  v45 = *(double *)(a2 + 8 * *v7);
  v46 = *(double *)(a2 + 8 * *v42);
  if (v45 > v46)
    goto LABEL_65;
  v47 = v5 - 2;
  while (v47 != v7)
  {
    v48 = v47;
    v50 = *v47--;
    v49 = v50;
    if (*(double *)(a2 + 8 * v50) > v46)
    {
      *v7 = v49;
      *v48 = v44;
      result = (result + 1);
      v43 = v48;
LABEL_65:
      v51 = v7 + 1;
      if (v7 + 1 >= v43)
      {
        v54 = v7 + 1;
      }
      else
      {
        v52 = v7 + 1;
        while (1)
        {
          v53 = *(double *)(a2 + 8 * *v42);
          do
          {
            v54 = v52;
            v56 = *v52++;
            v55 = v56;
          }
          while (*(double *)(a2 + 8 * v56) > v53);
          do
          {
            v58 = *--v43;
            v57 = v58;
          }
          while (*(double *)(a2 + 8 * v58) <= v53);
          if (v54 >= v43)
            break;
          *v54 = v57;
          *v43 = v55;
          result = (result + 1);
          if (v42 == v54)
            v42 = v43;
        }
      }
      if (v54 != v42)
      {
        v59 = *v54;
        if (*(double *)(a2 + 8 * *v42) > *(double *)(a2 + 8 * *v54))
        {
          *v54 = *v42;
          *v42 = v59;
          result = (result + 1);
        }
      }
      if (v54 == v40)
        return result;
      if (!(_DWORD)result)
      {
        if (v54 <= v40)
        {
          v65 = v54 + 1;
          do
          {
            if (v65 == v5)
              return result;
            v66 = *(double *)(a2 + 8 * *v65);
            v67 = *(double *)(a2 + 8 * *(v65++ - 1));
          }
          while (v66 <= v67);
        }
        else
        {
          do
          {
            if (v51 == v54)
              return result;
            v61 = *(double *)(a2 + 8 * *v51);
            v62 = *(double *)(a2 + 8 * *(v51++ - 1));
          }
          while (v61 <= v62);
        }
      }
      if (v54 <= v40)
      {
        v60 = v54 + 1;
      }
      else
      {
        v5 = v54;
        v60 = v7;
      }
LABEL_103:
      v7 = v60;
      if (v5 == v40)
        return result;
      goto LABEL_56;
    }
  }
  v63 = v7 + 1;
  if (v45 <= *(double *)(a2 + 8 * *v43))
  {
    while (1)
    {
      if (v63 == v43)
        return result;
      v64 = *v63;
      if (v45 > *(double *)(a2 + 8 * *v63))
        break;
      ++v63;
    }
    *v63++ = *v43;
    *v43 = v64;
  }
  if (v63 != v43)
  {
    while (1)
    {
      v68 = *(double *)(a2 + 8 * *v7);
      do
      {
        v60 = v63;
        v70 = *v63++;
        v69 = v70;
      }
      while (v68 <= *(double *)(a2 + 8 * v70));
      do
      {
        v72 = *--v43;
        v71 = v72;
      }
      while (v68 > *(double *)(a2 + 8 * v72));
      if (v60 >= v43)
        break;
      *v60 = v71;
      *v43 = v69;
    }
    if (v60 <= v40)
      goto LABEL_103;
  }
  return result;
}

void __49__MLE5Engine_predictionsFromBatch_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MLE5Engine_predictionsFromBatch_options_error___block_invoke_2;
  block[3] = &unk_1E3D663E8;
  v18 = *(_QWORD *)(a1 + 64);
  v13 = v5;
  v14 = v6;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 72);
  v15 = v8;
  v19 = v9;
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  v10 = v6;
  v11 = v5;
  dispatch_sync(v7, block);

}

intptr_t __49__MLE5Engine_predictionsFromBatch_options_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id *v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "setObject:atIndexedSubscript:", v2, *(_QWORD *)(a1 + 80));
  }
  else
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v5 = *(_QWORD *)(v3 + 40);
    v4 = (id *)(v3 + 40);
    if (!v5)
      objc_storeStrong(v4, *(id *)(a1 + 40));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

void __64__MLE5Engine__predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v21 = v6;
  objc_msgSend(v7, "_postProcessingForOutputs:options:error:", v5, v8, &v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v21;

  if (v9)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "hasDirectBindingExpectations"))
    {
      objc_msgSend(*(id *)(a1 + 48), "operations");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "directlyBoundInputFeatureNames");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "directlyBoundOutputFeatureNames");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(void **)(a1 + 40);
      v20 = v10;
      v16 = objc_msgSend(v15, "validateExpectationsWithDirectlyBoundInputs:outputs:error:", v13, v14, &v20);
      v17 = v20;

      if ((v16 & 1) == 0)
      {

        v9 = 0;
      }

      v10 = v17;
    }
    v18 = v9;
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "streamPool");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "putBack:", *(_QWORD *)(a1 + 48));

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __34__MLE5Engine__conformState_error___block_invoke()
{
  return kdebug_trace();
}

uint64_t __42__MLE5Engine__conformInputFeatures_error___block_invoke()
{
  return kdebug_trace();
}

+ (id)loadModelAssetDescriptionFromCompiledArchive:(_MLModelInputArchiver *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  MLProgramE5Container *v12;
  MLProgramE5Container *v13;
  void *v14;

  v10 = a4;
  v11 = a5;
  v12 = -[MLProgramE5Container initWithCompiledArchive:modelVersionInfo:compilerVersionInfo:error:]([MLProgramE5Container alloc], "initWithCompiledArchive:modelVersionInfo:compilerVersionInfo:error:", a3, v10, v11, a7);
  v13 = v12;
  if (v12)
  {
    -[MLProgramE5Container modelAssetDescription](v12, "modelAssetDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
