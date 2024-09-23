@implementation MLModelConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentModelName, 0);
  objc_storeStrong((id *)&self->_rootModelURL, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_preferredMetalDevice, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_optimizationHints, 0);
  objc_storeStrong((id *)&self->_modelDisplayName, 0);
  objc_storeStrong((id *)&self->_e5rtCustomANECompilerOptions, 0);
  objc_storeStrong((id *)&self->_e5rtMutableMILWeightURLs, 0);
  objc_storeStrong((id *)&self->_e5rtDynamicCallableFunctions, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  MLModelConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = -[MLModelConfiguration init](+[MLModelConfiguration allocWithZone:](MLModelConfiguration, "allocWithZone:", a3), "init");
  -[MLModelConfiguration setComputeUnits:](v4, "setComputeUnits:", -[MLModelConfiguration computeUnits](self, "computeUnits"));
  -[MLModelConfiguration setUseWatchSPIForScribble:](v4, "setUseWatchSPIForScribble:", -[MLModelConfiguration useWatchSPIForScribble](self, "useWatchSPIForScribble"));
  -[MLModelConfiguration setAllowLowPrecisionAccumulationOnGPU:](v4, "setAllowLowPrecisionAccumulationOnGPU:", -[MLModelConfiguration allowLowPrecisionAccumulationOnGPU](self, "allowLowPrecisionAccumulationOnGPU"));
  -[MLModelConfiguration setAllowBackgroundGPUComputeSetting:](v4, "setAllowBackgroundGPUComputeSetting:", -[MLModelConfiguration allowBackgroundGPUComputeSetting](self, "allowBackgroundGPUComputeSetting"));
  -[MLModelConfiguration preferredMetalDevice](self, "preferredMetalDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelConfiguration setPreferredMetalDevice:](v4, "setPreferredMetalDevice:", v5);

  -[MLModelConfiguration setEnableTestVectorMode:](v4, "setEnableTestVectorMode:", -[MLModelConfiguration enableTestVectorMode](self, "enableTestVectorMode"));
  -[MLModelConfiguration parameters](self, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelConfiguration setParameters:](v4, "setParameters:", v6);

  -[MLModelConfiguration rootModelURL](self, "rootModelURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelConfiguration setRootModelURL:](v4, "setRootModelURL:", v7);

  -[MLModelConfiguration setProfilingOptions:](v4, "setProfilingOptions:", -[MLModelConfiguration profilingOptions](self, "profilingOptions"));
  -[MLModelConfiguration setUsePreloadedKey:](v4, "setUsePreloadedKey:", -[MLModelConfiguration usePreloadedKey](self, "usePreloadedKey"));
  -[MLModelConfiguration setTrainWithMLCompute:](v4, "setTrainWithMLCompute:", -[MLModelConfiguration trainWithMLCompute](self, "trainWithMLCompute"));
  -[MLModelConfiguration parentModelName](self, "parentModelName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelConfiguration setParentModelName:](v4, "setParentModelName:", v8);

  -[MLModelConfiguration modelDisplayName](self, "modelDisplayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelConfiguration setModelDisplayName:](v4, "setModelDisplayName:", v9);

  -[MLModelConfiguration setAllowsInstrumentation:](v4, "setAllowsInstrumentation:", -[MLModelConfiguration allowsInstrumentation](self, "allowsInstrumentation"));
  -[MLModelConfiguration setExperimentalMLE5EngineUsage:](v4, "setExperimentalMLE5EngineUsage:", -[MLModelConfiguration experimentalMLE5EngineUsage](self, "experimentalMLE5EngineUsage"));
  -[MLModelConfiguration setPreparesLazily:](v4, "setPreparesLazily:", -[MLModelConfiguration preparesLazily](self, "preparesLazily"));
  -[MLModelConfiguration setPredictionConcurrencyHint:](v4, "setPredictionConcurrencyHint:", -[MLModelConfiguration predictionConcurrencyHint](self, "predictionConcurrencyHint"));
  -[MLModelConfiguration setUsePrecompiledE5Bundle:](v4, "setUsePrecompiledE5Bundle:", -[MLModelConfiguration usePrecompiledE5Bundle](self, "usePrecompiledE5Bundle"));
  -[MLModelConfiguration setExperimentalMLE5BNNSGraphBackendUsage:](v4, "setExperimentalMLE5BNNSGraphBackendUsage:", -[MLModelConfiguration experimentalMLE5BNNSGraphBackendUsage](self, "experimentalMLE5BNNSGraphBackendUsage"));
  -[MLModelConfiguration e5rtDynamicCallableFunctions](self, "e5rtDynamicCallableFunctions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelConfiguration setE5rtDynamicCallableFunctions:](v4, "setE5rtDynamicCallableFunctions:", v10);

  -[MLModelConfiguration e5rtMutableMILWeightURLs](self, "e5rtMutableMILWeightURLs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelConfiguration setE5rtMutableMILWeightURLs:](v4, "setE5rtMutableMILWeightURLs:", v11);

  -[MLModelConfiguration optimizationHints](self, "optimizationHints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelConfiguration setOptimizationHints:](v4, "setOptimizationHints:", v12);

  -[MLModelConfiguration functionName](self, "functionName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelConfiguration setFunctionName:](v4, "setFunctionName:", v13);

  -[MLModelConfiguration setE5rtComputeDeviceTypeMask:](v4, "setE5rtComputeDeviceTypeMask:", -[MLModelConfiguration e5rtComputeDeviceTypeMask](self, "e5rtComputeDeviceTypeMask"));
  -[MLModelConfiguration e5rtCustomANECompilerOptions](self, "e5rtCustomANECompilerOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelConfiguration setE5rtCustomANECompilerOptions:](v4, "setE5rtCustomANECompilerOptions:", v14);

  -[MLModelConfiguration setExperimentalMLE5BNNSGraphBackendUsageMultiSegment:](v4, "setExperimentalMLE5BNNSGraphBackendUsageMultiSegment:", -[MLModelConfiguration experimentalMLE5BNNSGraphBackendUsageMultiSegment](self, "experimentalMLE5BNNSGraphBackendUsageMultiSegment"));
  -[MLModelConfiguration setSerializesMILTextForDebugging:](v4, "setSerializesMILTextForDebugging:", -[MLModelConfiguration serializesMILTextForDebugging](self, "serializesMILTextForDebugging"));
  return v4;
}

- (MLComputeUnits)computeUnits
{
  return self->_computeUnits;
}

- (BOOL)allowsInstrumentation
{
  return self->_allowsInstrumentation;
}

- (MLModelConfiguration)init
{
  return -[MLModelConfiguration initWithComputeUnits:](self, "initWithComputeUnits:", 2);
}

- (MLModelConfiguration)initWithComputeUnits:(int64_t)a3
{
  char *v4;
  MLModelConfiguration *v5;
  void *v6;
  NSDictionary *parameters;
  NSURL *rootModelURL;
  NSString *parentModelName;
  NSString *modelDisplayName;
  int v11;
  NSDictionary *e5rtDynamicCallableFunctions;
  NSDictionary *v13;
  NSDictionary *e5rtMutableMILWeightURLs;
  MLOptimizationHints *v15;
  MLOptimizationHints *optimizationHints;
  NSString *functionName;
  NSString *e5rtCustomANECompilerOptions;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MLModelConfiguration;
  v4 = -[MLModelConfiguration init](&v20, sel_init);
  v5 = (MLModelConfiguration *)v4;
  if (v4)
  {
    *((_QWORD *)v4 + 12) = a3;
    *(_WORD *)(v4 + 75) = 0;
    v4[73] = 0;
    v6 = (void *)*((_QWORD *)v4 + 16);
    *((_QWORD *)v4 + 16) = 0;

    v5->_enableTestVectorMode = 0;
    parameters = v5->_parameters;
    v5->_parameters = 0;

    rootModelURL = v5->_rootModelURL;
    v5->_rootModelURL = 0;

    v5->_usePreloadedKey = 0;
    v5->_trainWithMLCompute = 0;
    parentModelName = v5->_parentModelName;
    v5->_profilingOptions = 0;
    v5->_parentModelName = (NSString *)&stru_1E3D68DC8;

    modelDisplayName = v5->_modelDisplayName;
    v5->_modelDisplayName = 0;

    v5->_allowsInstrumentation = 1;
    v5->_experimentalMLE5EngineUsage = _os_feature_enabled_impl() ^ 1;
    v5->_preparesLazily = 0;
    v5->_predictionConcurrencyHint = 0;
    v5->_usePrecompiledE5Bundle = 0;
    v5->_experimentalMLE5BNNSGraphBackendUsage = _os_feature_enabled_impl() ^ 1;
    v11 = _os_feature_enabled_impl();
    e5rtDynamicCallableFunctions = v5->_e5rtDynamicCallableFunctions;
    v13 = (NSDictionary *)MEMORY[0x1E0C9AA70];
    v5->_experimentalMLE5BNNSGraphBackendUsageMultiSegment = v11 ^ 1u;
    v5->_e5rtDynamicCallableFunctions = v13;

    e5rtMutableMILWeightURLs = v5->_e5rtMutableMILWeightURLs;
    v5->_e5rtMutableMILWeightURLs = v13;

    v15 = objc_alloc_init(MLOptimizationHints);
    optimizationHints = v5->_optimizationHints;
    v5->_optimizationHints = v15;

    functionName = v5->_functionName;
    v5->_functionName = 0;

    e5rtCustomANECompilerOptions = v5->_e5rtCustomANECompilerOptions;
    v5->_e5rtComputeDeviceTypeMask = -1;
    v5->_e5rtCustomANECompilerOptions = 0;

    v5->_serializesMILTextForDebugging = 0;
  }
  return v5;
}

- (NSString)modelDisplayName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)trainWithMLCompute
{
  return self->_trainWithMLCompute;
}

- (int64_t)profilingOptions
{
  return self->_profilingOptions;
}

- (void)setRootModelURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void)setModelDisplayName:(NSString *)modelDisplayName
{
  objc_setProperty_atomic_copy(self, a2, modelDisplayName, 88);
}

- (void)setAllowsInstrumentation:(BOOL)a3
{
  self->_allowsInstrumentation = a3;
}

- (BOOL)preparesLazily
{
  return self->_preparesLazily;
}

- (NSString)parentModelName
{
  return self->_parentModelName;
}

- (void)setComputeUnits:(MLComputeUnits)computeUnits
{
  self->_computeUnits = computeUnits;
}

- (BOOL)enableTestVectorMode
{
  return self->_enableTestVectorMode;
}

- (BOOL)allowLowPrecisionAccumulationOnGPU
{
  return self->_allowLowPrecisionAccumulationOnGPU;
}

- (id)preferredMetalDevice
{
  return self->_preferredMetalDevice;
}

- (int64_t)predictionConcurrencyHint
{
  return self->_predictionConcurrencyHint;
}

- (MLOptimizationHints)optimizationHints
{
  return self->_optimizationHints;
}

- (BOOL)allowBackgroundGPUComputeSetting
{
  return self->_allowBackgroundGPUComputeSetting;
}

- (BOOL)useWatchSPIForScribble
{
  return self->_useWatchSPIForScribble;
}

- (BOOL)usePreloadedKey
{
  return self->_usePreloadedKey;
}

- (void)setUseWatchSPIForScribble:(BOOL)a3
{
  self->_useWatchSPIForScribble = a3;
}

- (void)setUsePreloadedKey:(BOOL)a3
{
  self->_usePreloadedKey = a3;
}

- (void)setTrainWithMLCompute:(BOOL)a3
{
  self->_trainWithMLCompute = a3;
}

- (void)setProfilingOptions:(int64_t)a3
{
  self->_profilingOptions = a3;
}

- (void)setPreparesLazily:(BOOL)a3
{
  self->_preparesLazily = a3;
}

- (void)setPreferredMetalDevice:(id)preferredMetalDevice
{
  objc_storeStrong((id *)&self->_preferredMetalDevice, preferredMetalDevice);
}

- (void)setPredictionConcurrencyHint:(int64_t)a3
{
  self->_predictionConcurrencyHint = a3;
}

- (void)setParentModelName:(id)a3
{
  objc_storeStrong((id *)&self->_parentModelName, a3);
}

- (void)setParameters:(NSDictionary *)parameters
{
  objc_setProperty_atomic(self, a2, parameters, 136);
}

- (void)setOptimizationHints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setEnableTestVectorMode:(BOOL)a3
{
  self->_enableTestVectorMode = a3;
}

- (void)setAllowLowPrecisionAccumulationOnGPU:(BOOL)allowLowPrecisionAccumulationOnGPU
{
  self->_allowLowPrecisionAccumulationOnGPU = allowLowPrecisionAccumulationOnGPU;
}

- (void)setAllowBackgroundGPUComputeSetting:(BOOL)a3
{
  self->_allowBackgroundGPUComputeSetting = a3;
}

- (NSURL)rootModelURL
{
  return (NSURL *)objc_getProperty(self, a2, 144, 1);
}

- (NSDictionary)parameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 136, 1);
}

+ (id)defaultConfiguration
{
  return objc_alloc_init(MLModelConfiguration);
}

- (BOOL)usesCompileTimeMPSGraphTypeInferenceForModelVersion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  -[MLModelConfiguration optimizationHints](self, "optimizationHints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "reshapeFrequency");

  v7 = v6 == 1 || (dyld_program_sdk_at_least() & 1) == 0 && objc_msgSend(v4, "majorVersion") < 9;
  return v7;
}

- (id)neuralEngineCompilerOptions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  -[MLModelConfiguration e5rtCustomANECompilerOptions](self, "e5rtCustomANECompilerOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[MLModelConfiguration optimizationHints](self, "optimizationHints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "specializationStrategy");

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (dyld_program_sdk_at_least())
      objc_msgSend(v8, "addObject:", CFSTR("EnableLowEffortCPAllocation=true"));
    if (v7 == 1)
      objc_msgSend(v8, "addObject:", CFSTR("SpatialSplitMode=GenericDAG"));
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)computeUnitsToString:(int64_t)a3
{
  id v4;

  if ((unint64_t)a3 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("computeUnits has an unrecognized value"), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  return off_1E3D65328[a3];
}

- (id)experimentalMLE5EngineUsageToString:(int64_t)a3
{
  id v4;

  if ((unint64_t)a3 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("e5EngineUsage has an unrecognized value"), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  return off_1E3D65348[a3];
}

- (id)bnnsGraphBackendUsageToString:(int64_t)a3
{
  if (a3)
    return CFSTR("Disable");
  else
    return CFSTR("Enable");
}

- (void)setAllowBackgroundGPUCompute:(BOOL)a3
{
  self->_allowBackgroundGPUComputeSetting = a3;
}

- (BOOL)isEqual:(id)a3
{
  MLModelConfiguration *v4;
  BOOL v5;

  v4 = (MLModelConfiguration *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[MLModelConfiguration isEqualToModelConfiguration:](self, "isEqualToModelConfiguration:", v4);
  }

  return v5;
}

- (BOOL)isEqualToModelConfiguration:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  MLComputeUnits v8;
  int v9;
  int v10;
  int v11;
  BOOL v12;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int64_t v22;
  int v23;
  int v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int64_t v34;
  int v35;
  int64_t v36;
  int v37;
  int64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  BOOL v43;
  BOOL v44;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  int v48;
  int64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;

  v7 = a3;
  v8 = -[MLModelConfiguration computeUnits](self, "computeUnits");
  if (v8 == objc_msgSend(v7, "computeUnits"))
  {
    v9 = -[MLModelConfiguration useWatchSPIForScribble](self, "useWatchSPIForScribble");
    if (v9 == objc_msgSend(v7, "useWatchSPIForScribble"))
    {
      v10 = -[MLModelConfiguration allowLowPrecisionAccumulationOnGPU](self, "allowLowPrecisionAccumulationOnGPU");
      if (v10 == objc_msgSend(v7, "allowLowPrecisionAccumulationOnGPU"))
      {
        v11 = -[MLModelConfiguration allowBackgroundGPUComputeSetting](self, "allowBackgroundGPUComputeSetting");
        if (v11 == objc_msgSend(v7, "allowBackgroundGPUComputeSetting"))
        {
          -[MLModelConfiguration preferredMetalDevice](self, "preferredMetalDevice");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "preferredMetalDevice");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14 != v15
            || (v16 = -[MLModelConfiguration enableTestVectorMode](self, "enableTestVectorMode"),
                v16 != objc_msgSend(v7, "enableTestVectorMode")))
          {
            v12 = 0;
LABEL_10:

            goto LABEL_6;
          }
          -[MLModelConfiguration parameters](self, "parameters");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            -[MLModelConfiguration parameters](self, "parameters");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "parameters");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v3, "isEqualToDictionary:", v4) & 1) == 0)
            {
              v12 = 0;
LABEL_23:

              goto LABEL_24;
            }
          }
          else
          {
            objc_msgSend(v7, "parameters");
            v18 = objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              v12 = 0;
              v17 = (void *)v18;
              goto LABEL_24;
            }
          }
          -[MLModelConfiguration rootModelURL](self, "rootModelURL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            -[MLModelConfiguration rootModelURL](self, "rootModelURL");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "rootModelURL");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v20, "isEqual:", v5) & 1) != 0)
            {
              v67 = v20;
LABEL_25:
              v22 = -[MLModelConfiguration profilingOptions](self, "profilingOptions");
              if (v22 != objc_msgSend(v7, "profilingOptions")
                || (v23 = -[MLModelConfiguration usePreloadedKey](self, "usePreloadedKey"),
                    v23 != objc_msgSend(v7, "usePreloadedKey"))
                || (v24 = -[MLModelConfiguration trainWithMLCompute](self, "trainWithMLCompute"),
                    v24 != objc_msgSend(v7, "trainWithMLCompute")))
              {
LABEL_28:
                v12 = 0;
                if (!v19)
                  goto LABEL_30;
                goto LABEL_29;
              }
              -[MLModelConfiguration parentModelName](self, "parentModelName");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (v25)
              {
                v66 = v5;
                -[MLModelConfiguration parentModelName](self, "parentModelName");
                v26 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "parentModelName");
                v27 = objc_claimAutoreleasedReturnValue();
                v65 = (void *)v26;
                v28 = (void *)v26;
                v29 = (void *)v27;
                if ((objc_msgSend(v28, "isEqualToString:", v27) & 1) == 0)
                {

                  v12 = 0;
                  v5 = v66;
                  if (!v19)
                    goto LABEL_30;
                  goto LABEL_29;
                }
                v63 = v29;
                v64 = v25;
              }
              else
              {
                v64 = 0;
                objc_msgSend(v7, "parentModelName");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                if (v30)
                {

                  goto LABEL_28;
                }
                v66 = v5;
              }
              -[MLModelConfiguration modelDisplayName](self, "modelDisplayName");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (v31)
              {
                -[MLModelConfiguration modelDisplayName](self, "modelDisplayName");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "modelDisplayName");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v32, "isEqualToString:") & 1) != 0)
                {
                  v61 = v32;
LABEL_47:
                  v34 = -[MLModelConfiguration experimentalMLE5EngineUsage](self, "experimentalMLE5EngineUsage");
                  if (v34 == objc_msgSend(v7, "experimentalMLE5EngineUsage"))
                  {
                    v35 = -[MLModelConfiguration preparesLazily](self, "preparesLazily");
                    if (v35 == objc_msgSend(v7, "preparesLazily"))
                    {
                      v36 = -[MLModelConfiguration predictionConcurrencyHint](self, "predictionConcurrencyHint");
                      if (v36 == objc_msgSend(v7, "predictionConcurrencyHint"))
                      {
                        v37 = -[MLModelConfiguration usePrecompiledE5Bundle](self, "usePrecompiledE5Bundle");
                        if (v37 == objc_msgSend(v7, "usePrecompiledE5Bundle"))
                        {
                          v38 = -[MLModelConfiguration experimentalMLE5BNNSGraphBackendUsage](self, "experimentalMLE5BNNSGraphBackendUsage");
                          if (v38 == objc_msgSend(v7, "experimentalMLE5BNNSGraphBackendUsage"))
                          {
                            -[MLModelConfiguration e5rtMutableMILWeightURLs](self, "e5rtMutableMILWeightURLs");
                            v39 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v7, "e5rtMutableMILWeightURLs");
                            v59 = (void *)objc_claimAutoreleasedReturnValue();
                            v60 = v39;
                            if (objc_msgSend(v39, "isEqual:"))
                            {
                              -[MLModelConfiguration e5rtDynamicCallableFunctions](self, "e5rtDynamicCallableFunctions");
                              v40 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v7, "e5rtDynamicCallableFunctions");
                              v57 = (void *)objc_claimAutoreleasedReturnValue();
                              v58 = v40;
                              if (!objc_msgSend(v40, "isEqual:"))
                              {
                                v44 = 0;
                                goto LABEL_78;
                              }
                              -[MLModelConfiguration optimizationHints](self, "optimizationHints");
                              v41 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v7, "optimizationHints");
                              v55 = (void *)objc_claimAutoreleasedReturnValue();
                              v56 = v41;
                              if (!objc_msgSend(v41, "isEqual:"))
                              {
                                v43 = 0;
LABEL_77:

                                v44 = v43;
                                goto LABEL_78;
                              }
                              -[MLModelConfiguration functionName](self, "functionName");
                              v54 = (void *)objc_claimAutoreleasedReturnValue();
                              if (v54)
                              {
                                -[MLModelConfiguration functionName](self, "functionName");
                                v42 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v7, "functionName");
                                v52 = (void *)objc_claimAutoreleasedReturnValue();
                                v53 = v42;
                                if ((objc_msgSend(v42, "isEqual:") & 1) == 0)
                                {
                                  v43 = 0;
LABEL_76:

                                  goto LABEL_77;
                                }
                              }
                              else
                              {
                                objc_msgSend(v7, "functionName");
                                v45 = (void *)objc_claimAutoreleasedReturnValue();
                                if (v45)
                                {

                                  v44 = 0;
                                  goto LABEL_80;
                                }
                              }
                              v46 = -[MLModelConfiguration e5rtComputeDeviceTypeMask](self, "e5rtComputeDeviceTypeMask");
                              if (v46 == objc_msgSend(v7, "e5rtComputeDeviceTypeMask"))
                              {
                                -[MLModelConfiguration e5rtCustomANECompilerOptions](self, "e5rtCustomANECompilerOptions");
                                v47 = objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v7, "e5rtCustomANECompilerOptions");
                                v50 = (void *)objc_claimAutoreleasedReturnValue();
                                v51 = (void *)v47;
                                if ((void *)v47 == v50)
                                {
                                  v48 = -[MLModelConfiguration serializesMILTextForDebugging](self, "serializesMILTextForDebugging", v50);
                                  if (v48 == objc_msgSend(v7, "serializesMILTextForDebugging"))
                                  {
                                    v49 = -[MLModelConfiguration experimentalMLE5BNNSGraphBackendUsageMultiSegment](self, "experimentalMLE5BNNSGraphBackendUsageMultiSegment");
                                    v44 = v49 == objc_msgSend(v7, "experimentalMLE5BNNSGraphBackendUsageMultiSegment");

                                    v43 = v44;
LABEL_75:
                                    if (v54)
                                      goto LABEL_76;
LABEL_80:

LABEL_78:
                                    v12 = v44;
                                    if (!v31)
                                      goto LABEL_61;
                                    goto LABEL_60;
                                  }
                                }

                              }
                              v44 = 0;
                              v43 = 0;
                              goto LABEL_75;
                            }

                          }
                        }
                      }
                    }
                  }
                  v44 = 0;
                  v12 = 0;
                  if (!v31)
                  {
LABEL_61:

LABEL_62:
                    v5 = v66;
                    if (v64)
                    {

                    }
                    if (!v19)
                    {
LABEL_30:

                      if (!v17)
                        goto LABEL_24;
                      goto LABEL_23;
                    }
LABEL_29:

                    goto LABEL_30;
                  }
LABEL_60:

                  v12 = v44;
                  goto LABEL_61;
                }

              }
              else
              {
                objc_msgSend(v7, "modelDisplayName");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v33)
                  goto LABEL_47;

              }
              v12 = 0;
              goto LABEL_62;
            }

          }
          else
          {
            objc_msgSend(v7, "rootModelURL");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v21)
              goto LABEL_25;

          }
          v12 = 0;
          if (v17)
            goto LABEL_23;
LABEL_24:

          goto LABEL_10;
        }
      }
    }
  }
  v12 = 0;
LABEL_6:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int64_t v17;
  int64_t v18;
  int64_t v19;
  int64_t v20;
  int64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MLModelConfiguration computeUnits](self, "computeUnits"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v38, "hash");
  v4 = -[MLModelConfiguration useWatchSPIForScribble](self, "useWatchSPIForScribble");
  v5 = v4 ^ -[MLModelConfiguration allowLowPrecisionAccumulationOnGPU](self, "allowLowPrecisionAccumulationOnGPU");
  v6 = v5 ^ -[MLModelConfiguration allowBackgroundGPUComputeSetting](self, "allowBackgroundGPUComputeSetting");
  -[MLModelConfiguration preferredMetalDevice](self, "preferredMetalDevice");
  v37 = objc_claimAutoreleasedReturnValue();
  v7 = v3 ^ v6 ^ v37 ^ -[MLModelConfiguration enableTestVectorMode](self, "enableTestVectorMode");
  -[MLModelConfiguration parameters](self, "parameters");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v36, "hash");
  -[MLModelConfiguration rootModelURL](self, "rootModelURL");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 ^ objc_msgSend(v35, "hash");
  v10 = v9 ^ -[MLModelConfiguration profilingOptions](self, "profilingOptions");
  v11 = v10 ^ -[MLModelConfiguration usePreloadedKey](self, "usePreloadedKey");
  v12 = v11 ^ -[MLModelConfiguration trainWithMLCompute](self, "trainWithMLCompute");
  -[MLModelConfiguration parentModelName](self, "parentModelName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[MLModelConfiguration modelDisplayName](self, "modelDisplayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v7 ^ v14 ^ objc_msgSend(v15, "hash");
  v17 = -[MLModelConfiguration experimentalMLE5EngineUsage](self, "experimentalMLE5EngineUsage");
  v18 = v17 ^ -[MLModelConfiguration preparesLazily](self, "preparesLazily");
  v19 = v18 ^ -[MLModelConfiguration predictionConcurrencyHint](self, "predictionConcurrencyHint");
  v20 = v19 ^ -[MLModelConfiguration usePrecompiledE5Bundle](self, "usePrecompiledE5Bundle");
  v21 = v20 ^ -[MLModelConfiguration experimentalMLE5BNNSGraphBackendUsage](self, "experimentalMLE5BNNSGraphBackendUsage");
  -[MLModelConfiguration e5rtMutableMILWeightURLs](self, "e5rtMutableMILWeightURLs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v21 ^ objc_msgSend(v22, "hash");
  -[MLModelConfiguration e5rtDynamicCallableFunctions](self, "e5rtDynamicCallableFunctions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v16 ^ v23 ^ objc_msgSend(v24, "hash");
  -[MLModelConfiguration optimizationHints](self, "optimizationHints");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "hash");
  -[MLModelConfiguration functionName](self, "functionName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v27 ^ objc_msgSend(v28, "hash");
  v30 = v29 ^ -[MLModelConfiguration e5rtComputeDeviceTypeMask](self, "e5rtComputeDeviceTypeMask");
  -[MLModelConfiguration e5rtCustomANECompilerOptions](self, "e5rtCustomANECompilerOptions");
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = v30 ^ v31 ^ -[MLModelConfiguration serializesMILTextForDebugging](self, "serializesMILTextForDebugging");
  v33 = v25 ^ v32 ^ -[MLModelConfiguration experimentalMLE5BNNSGraphBackendUsageMultiSegment](self, "experimentalMLE5BNNSGraphBackendUsageMultiSegment");

  return v33;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  objc_msgSend(v21, "encodeInteger:forKey:", -[MLModelConfiguration computeUnits](self, "computeUnits"), CFSTR("computeUnits"));
  objc_msgSend(v21, "encodeBool:forKey:", -[MLModelConfiguration useWatchSPIForScribble](self, "useWatchSPIForScribble"), CFSTR("useSPIforScribble"));
  objc_msgSend(v21, "encodeBool:forKey:", -[MLModelConfiguration allowLowPrecisionAccumulationOnGPU](self, "allowLowPrecisionAccumulationOnGPU"), CFSTR("allowLowPrecisionAccumulationOnGPU"));
  objc_msgSend(v21, "encodeBool:forKey:", -[MLModelConfiguration allowBackgroundGPUComputeSetting](self, "allowBackgroundGPUComputeSetting"), CFSTR("allowBackgroundGPUCompute"));
  -[MLModelConfiguration preferredMetalDevice](self, "preferredMetalDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v8 = -1;
LABEL_8:
    objc_msgSend(v21, "encodeInteger:forKey:", v8, CFSTR("MPSDeviceOptions"));
    goto LABEL_9;
  }
  -[MLModelConfiguration preferredMetalDevice](self, "preferredMetalDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MPSGetPreferredDevice(0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    v8 = 0;
    goto LABEL_8;
  }
  -[MLModelConfiguration preferredMetalDevice](self, "preferredMetalDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 1;
  MPSGetPreferredDevice(1uLL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v9)
    goto LABEL_8;
  -[MLModelConfiguration preferredMetalDevice](self, "preferredMetalDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 2;
  MPSGetPreferredDevice(2uLL);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v11)
    goto LABEL_8;
LABEL_9:
  objc_msgSend(v21, "encodeBool:forKey:", -[MLModelConfiguration enableTestVectorMode](self, "enableTestVectorMode"), CFSTR("enableTestVectorMode"));
  -[MLModelConfiguration parameters](self, "parameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v12, CFSTR("parameters"));

  -[MLModelConfiguration rootModelURL](self, "rootModelURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v13, CFSTR("rootModelURL"));

  objc_msgSend(v21, "encodeInteger:forKey:", -[MLModelConfiguration profilingOptions](self, "profilingOptions"), CFSTR("profilingOptions"));
  objc_msgSend(v21, "encodeBool:forKey:", -[MLModelConfiguration usePreloadedKey](self, "usePreloadedKey"), CFSTR("usePreloadedKey"));
  objc_msgSend(v21, "encodeBool:forKey:", -[MLModelConfiguration trainWithMLCompute](self, "trainWithMLCompute"), CFSTR("forceMLComputeTraining"));
  -[MLModelConfiguration parentModelName](self, "parentModelName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v14, CFSTR("parentModelName"));

  -[MLModelConfiguration modelDisplayName](self, "modelDisplayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v15, CFSTR("modelName"));

  objc_msgSend(v21, "encodeBool:forKey:", -[MLModelConfiguration preparesLazily](self, "preparesLazily"), CFSTR("preparesLazily"));
  objc_msgSend(v21, "encodeInteger:forKey:", -[MLModelConfiguration predictionConcurrencyHint](self, "predictionConcurrencyHint"), CFSTR("predictionConcurrencyHint"));
  objc_msgSend(v21, "encodeBool:forKey:", -[MLModelConfiguration usePrecompiledE5Bundle](self, "usePrecompiledE5Bundle"), CFSTR("usePrecompiledE5Bundle"));
  objc_msgSend(v21, "encodeInteger:forKey:", -[MLModelConfiguration experimentalMLE5BNNSGraphBackendUsage](self, "experimentalMLE5BNNSGraphBackendUsage"), CFSTR("experimentalMLE5BNNSGraphBackendUsage"));
  -[MLModelConfiguration e5rtDynamicCallableFunctions](self, "e5rtDynamicCallableFunctions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v16, CFSTR("e5rtDynamicCallableFunctions"));

  -[MLModelConfiguration e5rtMutableMILWeightURLs](self, "e5rtMutableMILWeightURLs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v17, CFSTR("e5rtMutableMILWeightURLs"));

  -[MLModelConfiguration optimizationHints](self, "optimizationHints");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v18, CFSTR("optimizationHints"));

  -[MLModelConfiguration functionName](self, "functionName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v19, CFSTR("functionName"));

  objc_msgSend(v21, "encodeInt64:forKey:", -[MLModelConfiguration e5rtComputeDeviceTypeMask](self, "e5rtComputeDeviceTypeMask"), CFSTR("e5rtComputeDeviceTypeMask"));
  -[MLModelConfiguration e5rtCustomANECompilerOptions](self, "e5rtCustomANECompilerOptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v20, CFSTR("e5rtCustomANECompilerOptions"));

  objc_msgSend(v21, "encodeBool:forKey:", -[MLModelConfiguration serializesMILTextForDebugging](self, "serializesMILTextForDebugging"), CFSTR("serializesMILTextForDebugging"));
  objc_msgSend(v21, "encodeInteger:forKey:", -[MLModelConfiguration experimentalMLE5BNNSGraphBackendUsageMultiSegment](self, "experimentalMLE5BNNSGraphBackendUsageMultiSegment"), CFSTR("experimentalMLE5BNNSGraphBackendUsageMultiSegment"));

}

- (MLModelConfiguration)initWithCoder:(id)a3
{
  id v4;
  MLModelConfiguration *v5;
  MPSDeviceOptions v6;
  uint64_t v7;
  MTLDevice *preferredMetalDevice;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSDictionary *parameters;
  uint64_t v17;
  NSURL *rootModelURL;
  uint64_t v19;
  NSString *parentModelName;
  uint64_t v21;
  NSString *modelDisplayName;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSDictionary *e5rtDynamicCallableFunctions;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSDictionary *e5rtMutableMILWeightURLs;
  uint64_t v35;
  MLOptimizationHints *optimizationHints;
  uint64_t v37;
  NSString *functionName;
  uint64_t v39;
  NSString *e5rtCustomANECompilerOptions;

  v4 = a3;
  v5 = -[MLModelConfiguration initWithComputeUnits:](self, "initWithComputeUnits:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("computeUnits")));
  if (v5)
  {
    v5->_useWatchSPIForScribble = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useSPIforScribble"));
    v5->_allowLowPrecisionAccumulationOnGPU = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowLowPrecisionAccumulationOnGPU"));
    v5->_allowBackgroundGPUComputeSetting = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowBackgroundGPUCompute"));
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPSDeviceOptions"));
    if (v6 == -1)
    {
      preferredMetalDevice = v5->_preferredMetalDevice;
      v5->_preferredMetalDevice = 0;
    }
    else
    {
      MPSGetPreferredDevice(v6);
      v7 = objc_claimAutoreleasedReturnValue();
      preferredMetalDevice = v5->_preferredMetalDevice;
      v5->_preferredMetalDevice = (MTLDevice *)v7;
    }

    v5->_enableTestVectorMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableTestVectorMode"));
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("parameters"));
    v15 = objc_claimAutoreleasedReturnValue();
    parameters = v5->_parameters;
    v5->_parameters = (NSDictionary *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rootModelURL"));
    v17 = objc_claimAutoreleasedReturnValue();
    rootModelURL = v5->_rootModelURL;
    v5->_rootModelURL = (NSURL *)v17;

    v5->_profilingOptions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("profilingOptions"));
    v5->_usePreloadedKey = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usePreloadedKey"));
    v5->_trainWithMLCompute = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forceMLComputeTraining"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentModelName"));
    v19 = objc_claimAutoreleasedReturnValue();
    parentModelName = v5->_parentModelName;
    v5->_parentModelName = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelName"));
    v21 = objc_claimAutoreleasedReturnValue();
    modelDisplayName = v5->_modelDisplayName;
    v5->_modelDisplayName = (NSString *)v21;

    v5->_preparesLazily = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("preparesLazily"));
    v5->_predictionConcurrencyHint = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("predictionConcurrencyHint"));
    v5->_usePrecompiledE5Bundle = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usePrecompiledE5Bundle"));
    v5->_experimentalMLE5BNNSGraphBackendUsage = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("experimentalMLE5BNNSGraphBackendUsage"));
    v5->_experimentalMLE5BNNSGraphBackendUsageMultiSegment = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("experimentalMLE5BNNSGraphBackendUsageMultiSegment"));
    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("e5rtDynamicCallableFunctions"));
    v27 = objc_claimAutoreleasedReturnValue();
    e5rtDynamicCallableFunctions = v5->_e5rtDynamicCallableFunctions;
    v5->_e5rtDynamicCallableFunctions = (NSDictionary *)v27;

    v29 = (void *)MEMORY[0x1E0C99E60];
    v30 = objc_opt_class();
    v31 = objc_opt_class();
    objc_msgSend(v29, "setWithObjects:", v30, v31, objc_opt_class(), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("e5rtMutableMILWeightURLs"));
    v33 = objc_claimAutoreleasedReturnValue();
    e5rtMutableMILWeightURLs = v5->_e5rtMutableMILWeightURLs;
    v5->_e5rtMutableMILWeightURLs = (NSDictionary *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("optimizationHints"));
    v35 = objc_claimAutoreleasedReturnValue();
    optimizationHints = v5->_optimizationHints;
    v5->_optimizationHints = (MLOptimizationHints *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("functionName"));
    v37 = objc_claimAutoreleasedReturnValue();
    functionName = v5->_functionName;
    v5->_functionName = (NSString *)v37;

    v5->_e5rtComputeDeviceTypeMask = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("e5rtComputeDeviceTypeMask"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("e5rtCustomANECompilerOptions"));
    v39 = objc_claimAutoreleasedReturnValue();
    e5rtCustomANECompilerOptions = v5->_e5rtCustomANECompilerOptions;
    v5->_e5rtCustomANECompilerOptions = (NSString *)v39;

    v5->_serializesMILTextForDebugging = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("serializesMILTextForDebugging"));
  }

  return v5;
}

- (id)description
{
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  _BOOL4 v19;
  const char *v20;
  const char *v22;
  int64_t v23;
  const char *v24;
  void *v25;
  void *v26;
  void *v27;
  const char *v28;
  const char *v29;
  int64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v39 = (void *)MEMORY[0x1E0CB3940];
  -[MLModelConfiguration computeUnitsToString:](self, "computeUnitsToString:", self->_computeUnits);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MLModelConfiguration useWatchSPIForScribble](self, "useWatchSPIForScribble"))
    v3 = "YES";
  else
    v3 = "NO";
  v37 = v3;
  if (-[MLModelConfiguration allowLowPrecisionAccumulationOnGPU](self, "allowLowPrecisionAccumulationOnGPU"))
    v4 = "YES";
  else
    v4 = "NO";
  v36 = v4;
  if (-[MLModelConfiguration allowBackgroundGPUComputeSetting](self, "allowBackgroundGPUComputeSetting"))
    v5 = "YES";
  else
    v5 = "NO";
  v35 = v5;
  -[MLModelConfiguration preferredMetalDevice](self, "preferredMetalDevice");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MLModelConfiguration enableTestVectorMode](self, "enableTestVectorMode"))
    v6 = "YES";
  else
    v6 = "NO";
  v33 = v6;
  -[MLModelConfiguration parameters](self, "parameters");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelConfiguration rootModelURL](self, "rootModelURL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[MLModelConfiguration profilingOptions](self, "profilingOptions");
  if (-[MLModelConfiguration usePreloadedKey](self, "usePreloadedKey"))
    v7 = "YES";
  else
    v7 = "NO";
  v29 = v7;
  if (-[MLModelConfiguration trainWithMLCompute](self, "trainWithMLCompute"))
    v8 = "YES";
  else
    v8 = "NO";
  v28 = v8;
  -[MLModelConfiguration parentModelName](self, "parentModelName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelConfiguration modelDisplayName](self, "modelDisplayName");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelConfiguration experimentalMLE5EngineUsageToString:](self, "experimentalMLE5EngineUsageToString:", self->_experimentalMLE5EngineUsage);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MLModelConfiguration preparesLazily](self, "preparesLazily"))
    v9 = "YES";
  else
    v9 = "NO";
  v24 = v9;
  v23 = -[MLModelConfiguration predictionConcurrencyHint](self, "predictionConcurrencyHint");
  if (-[MLModelConfiguration usePrecompiledE5Bundle](self, "usePrecompiledE5Bundle"))
    v10 = "YES";
  else
    v10 = "NO";
  v22 = v10;
  -[MLModelConfiguration bnnsGraphBackendUsageToString:](self, "bnnsGraphBackendUsageToString:", self->_experimentalMLE5BNNSGraphBackendUsage);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelConfiguration e5rtMutableMILWeightURLs](self, "e5rtMutableMILWeightURLs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelConfiguration e5rtDynamicCallableFunctions](self, "e5rtDynamicCallableFunctions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelConfiguration optimizationHints](self, "optimizationHints");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "description");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelConfiguration functionName](self, "functionName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelConfiguration bnnsGraphBackendUsageToString:](self, "bnnsGraphBackendUsageToString:", self->_experimentalMLE5BNNSGraphBackendUsageMultiSegment);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MLModelConfiguration e5rtComputeDeviceTypeMask](self, "e5rtComputeDeviceTypeMask");
  -[MLModelConfiguration e5rtCustomANECompilerOptions](self, "e5rtCustomANECompilerOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[MLModelConfiguration serializesMILTextForDebugging](self, "serializesMILTextForDebugging");
  v20 = "NO";
  if (v19)
    v20 = "YES";
  objc_msgSend(v39, "stringWithFormat:", CFSTR("\n computeUnits: %@,             \n useWatchSPIForScribble: %s,             \n allowLowPrecisionAccumulationOnGPU: %s,             \n allowBackgroundGPUComputeSetting: %s,             \n preferredMetalDevice: %@,             \n enableTestVectorMode: %s,             \n parameters: %@,             \n rootModelURL: %@,             \n profilingOptions: %lu,             \n usePreloadedKey: %s,             \n trainWithMLCompute: %s,             \n parentModelName: %@,             \n modelName: %@,             \n experimentalMLE5EngineUsage: %@,             \n preparesLazily: %s,             \n predictionConcurrencyHint: %zd,             \n usePrecompiledE5Bundle: %s,             \n experimentalMLE5BNNSGraphBackendUsage: %@,             \n e5rtMutableMILWeightURLs: %@             \n e5rtDynamicCallableFunctions: %@             \n optimizationHints: %@,             \n functionName: %@,             \n experimentalMLE5BNNSGraphBackendUsageMultiSegment: %@,             \n e5rtComputeDeviceTypeMask: 0x%llx,             \n e5rtCustomANECompilerOptions: %@,             \n serializesMILTextForDebugging: %s,             "), v38, v37, v36, v35, v34, v33, v32, v31, v30, v29, v28, v27, v41, v26, v24, v23,
    v22,
    v11,
    v12,
    v13,
    v14,
    v15,
    v16,
    v17,
    v18,
    v20);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

- (NSString)functionName
{
  return self->_functionName;
}

- (void)setFunctionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)experimentalMLE5EngineUsage
{
  return self->_experimentalMLE5EngineUsage;
}

- (void)setExperimentalMLE5EngineUsage:(int64_t)a3
{
  self->_experimentalMLE5EngineUsage = a3;
}

- (BOOL)usePrecompiledE5Bundle
{
  return self->_usePrecompiledE5Bundle;
}

- (void)setUsePrecompiledE5Bundle:(BOOL)a3
{
  self->_usePrecompiledE5Bundle = a3;
}

- (int64_t)experimentalMLE5BNNSGraphBackendUsage
{
  return self->_experimentalMLE5BNNSGraphBackendUsage;
}

- (void)setExperimentalMLE5BNNSGraphBackendUsage:(int64_t)a3
{
  self->_experimentalMLE5BNNSGraphBackendUsage = a3;
}

- (int64_t)experimentalMLE5BNNSGraphBackendUsageMultiSegment
{
  return self->_experimentalMLE5BNNSGraphBackendUsageMultiSegment;
}

- (void)setExperimentalMLE5BNNSGraphBackendUsageMultiSegment:(int64_t)a3
{
  self->_experimentalMLE5BNNSGraphBackendUsageMultiSegment = a3;
}

- (NSDictionary)e5rtDynamicCallableFunctions
{
  return self->_e5rtDynamicCallableFunctions;
}

- (void)setE5rtDynamicCallableFunctions:(id)a3
{
  NSDictionary *v4;
  NSDictionary *e5rtDynamicCallableFunctions;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  e5rtDynamicCallableFunctions = self->_e5rtDynamicCallableFunctions;
  self->_e5rtDynamicCallableFunctions = v4;

}

- (NSDictionary)e5rtMutableMILWeightURLs
{
  return self->_e5rtMutableMILWeightURLs;
}

- (void)setE5rtMutableMILWeightURLs:(id)a3
{
  NSDictionary *v4;
  NSDictionary *e5rtMutableMILWeightURLs;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  e5rtMutableMILWeightURLs = self->_e5rtMutableMILWeightURLs;
  self->_e5rtMutableMILWeightURLs = v4;

}

- (unint64_t)e5rtComputeDeviceTypeMask
{
  return self->_e5rtComputeDeviceTypeMask;
}

- (void)setE5rtComputeDeviceTypeMask:(unint64_t)a3
{
  self->_e5rtComputeDeviceTypeMask = a3;
}

- (NSString)e5rtCustomANECompilerOptions
{
  return self->_e5rtCustomANECompilerOptions;
}

- (void)setE5rtCustomANECompilerOptions:(id)a3
{
  NSString *v4;
  NSString *e5rtCustomANECompilerOptions;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  e5rtCustomANECompilerOptions = self->_e5rtCustomANECompilerOptions;
  self->_e5rtCustomANECompilerOptions = v4;

}

- (BOOL)serializesMILTextForDebugging
{
  return self->_serializesMILTextForDebugging;
}

- (void)setSerializesMILTextForDebugging:(BOOL)a3
{
  self->_serializesMILTextForDebugging = a3;
}

@end
