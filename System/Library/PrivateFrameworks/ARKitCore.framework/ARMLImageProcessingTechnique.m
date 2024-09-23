@implementation ARMLImageProcessingTechnique

+ (BOOL)isSupported
{
  if (+[ARMLImageProcessingTechnique isSupported]::onceToken != -1)
    dispatch_once(&+[ARMLImageProcessingTechnique isSupported]::onceToken, &__block_literal_global_121);
  return +[ARMLImageProcessingTechnique isSupported]::supported;
}

uint64_t __43__ARMLImageProcessingTechnique_isSupported__block_invoke()
{
  uint64_t result;

  result = ARAppleNeuralEngine();
  +[ARMLImageProcessingTechnique isSupported]::supported = result;
  return result;
}

- (BOOL)networkProvidesConfigurationsForDeviceOrientation
{
  return 1;
}

- (ARMLImageProcessingTechnique)initWithDispatchQueue:(id)a3 inputTensorNames:(id)a4 outputTensorNames:(id)a5 networkInputScaleBeforeRotation:(CGSize)a6 networkFilePath:(id)a7 useEspressoZeroCopyOutput:(BOOL)a8
{
  _BOOL8 v8;
  double height;
  double width;
  id v15;
  id v16;
  id v17;
  id v18;
  ARMLImageProcessingTechnique *v19;
  ARMLImageProcessingTechnique *v20;

  v8 = a8;
  height = a6.height;
  width = a6.width;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = -[ARMLImageProcessingTechnique initWithDispatchQueue:inputTensorNames:outputTensorNames:networkInputScaleBeforeRotation:networkFilePath:](self, "initWithDispatchQueue:inputTensorNames:outputTensorNames:networkInputScaleBeforeRotation:networkFilePath:", v15, v16, v17, v18, width, height);
  v20 = v19;
  if (v19)
    -[ARMLImageProcessingTechnique setUseEspressoZeroCopyOutput:](v19, "setUseEspressoZeroCopyOutput:", v8);

  return v20;
}

- (ARMLImageProcessingTechnique)initWithDispatchQueue:(id)a3 networkInputScaleBeforeRotation:(CGSize)a4
{
  return -[ARMLImageProcessingTechnique initWithDispatchQueue:networkInputScaleBeforeRotation:delegateInference:](self, "initWithDispatchQueue:networkInputScaleBeforeRotation:delegateInference:", a3, 0, a4.width, a4.height);
}

- (ARMLImageProcessingTechnique)initWithDispatchQueue:(id)a3 networkInputScaleBeforeRotation:(CGSize)a4 delegateInference:(BOOL)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  ARMLImageProcessingTechnique *v11;
  ARMLImageProcessingTechnique *v12;
  dispatch_semaphore_t v13;
  OS_dispatch_semaphore *processingSemaphore;
  objc_super v16;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ARMLImageProcessingTechnique;
  v11 = -[ARImageBasedTechnique init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_processingQueue, a3);
    v13 = dispatch_semaphore_create(1);
    processingSemaphore = v12->_processingSemaphore;
    v12->_processingSemaphore = (OS_dispatch_semaphore *)v13;

    v12->_prepLock._os_unfair_lock_opaque = 0;
    v12->_lockedOrientation = -1;
    v12->_allowedResamplingImageSize = (CGSize)*MEMORY[0x1E0C9D820];
    v12->_delegateInference = a5;
    v12->_networkInputScaleBeforeRotation.width = width;
    v12->_networkInputScaleBeforeRotation.height = height;
  }

  return v12;
}

- (ARMLImageProcessingTechnique)initWithDispatchQueue:(id)a3 inputTensorNames:(id)a4 outputTensorNames:(id)a5 networkInputScaleBeforeRotation:(CGSize)a6 networkFilePath:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  id v16;
  ARMLImageProcessingTechnique *v17;
  ARMLImageProcessingTechnique *v18;
  uint64_t v19;
  NSArray *inputTensorNames;
  uint64_t v21;
  NSArray *outputTensorNames;
  uint64_t v23;
  NSString *networkFilePath;

  height = a6.height;
  width = a6.width;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = -[ARMLImageProcessingTechnique initWithDispatchQueue:networkInputScaleBeforeRotation:](self, "initWithDispatchQueue:networkInputScaleBeforeRotation:", v13, width, height);
  v18 = v17;
  if (v17)
  {
    v17->_espressoInputBufferTimestamp = 0.0;
    v17->_espressoInputBufferLock._os_unfair_lock_opaque = 0;
    v19 = objc_msgSend(v14, "copy");
    inputTensorNames = v18->_inputTensorNames;
    v18->_inputTensorNames = (NSArray *)v19;

    v21 = objc_msgSend(v15, "copy");
    outputTensorNames = v18->_outputTensorNames;
    v18->_outputTensorNames = (NSArray *)v21;

    v23 = objc_msgSend(v16, "copy");
    networkFilePath = v18->_networkFilePath;
    v18->_networkFilePath = (NSString *)v23;

    v18->_bgraPixelBufferPool = 0;
    v18->_failedToLoadNetwork = 1;
    -[ARMLImageProcessingTechnique setUseEspressoZeroCopyOutput:](v18, "setUseEspressoZeroCopyOutput:", 0);
  }

  return v18;
}

- (BOOL)ARMLVerifyLoadedModelVersion:(id)a3 deviceName:(id)a4 major:(int)a5 minor:(int)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  int v18;
  BOOL v19;

  v9 = a4;
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10 || objc_msgSend(v10, "count") != 3)
    goto LABEL_10;
  objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");

  objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "intValue");

  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqual:", v9);
  if (v13 == a5)
    v18 = v17;
  else
    v18 = 0;
  if (v18 != 1)
  {

    goto LABEL_10;
  }

  if (v15 != a6)
  {
LABEL_10:
    v19 = 0;
    goto LABEL_11;
  }
  v19 = 1;
LABEL_11:

  return v19;
}

- (void)dealloc
{
  __CVPixelBufferPool *bgraPixelBufferPool;
  __CVPixelBufferPool **begin;
  __CVPixelBufferPool **end;
  objc_super v6;

  espresso_plan_destroy();
  espresso_context_destroy();
  bgraPixelBufferPool = self->_bgraPixelBufferPool;
  if (bgraPixelBufferPool)
  {
    CVPixelBufferPoolRelease(bgraPixelBufferPool);
    self->_bgraPixelBufferPool = 0;
  }
  begin = self->_espressoOutputBufferPools.__begin_;
  end = self->_espressoOutputBufferPools.__end_;
  while (begin != end)
  {
    if (*begin)
      CVPixelBufferPoolRelease(*begin);
    ++begin;
  }
  v6.receiver = self;
  v6.super_class = (Class)ARMLImageProcessingTechnique;
  -[ARMLImageProcessingTechnique dealloc](&v6, sel_dealloc);
}

- (id)processingSemaphore
{
  return self->_processingSemaphore;
}

- ($C4732ECC957FA13B9B3DF4A51A95735B)espressoNetwork
{
  $81D76D3AE0848955339013A8156F227B *p_espressoNetwork;
  void *plan;
  uint64_t v4;
  $C4732ECC957FA13B9B3DF4A51A95735B result;

  p_espressoNetwork = &self->_espressoNetwork;
  plan = self->_espressoNetwork.plan;
  v4 = *(_QWORD *)&p_espressoNetwork->network_index;
  result.var1 = v4;
  result.var0 = plan;
  return result;
}

- (void)espressoPlan
{
  return self->_espressoPlan;
}

- (int)defaultEngine
{
  return 10007;
}

- ($FD4688982923A924290ECB669CAF1EC2)espressoOutputTensorsData
{
  return ($FD4688982923A924290ECB669CAF1EC2 *)self->_espressoOutputTensors.__begin_;
}

- (unint64_t)espressoOutputTensorsSize
{
  return 0xCF3CF3CF3CF3CF3DLL * ((self->_espressoOutputTensors.__end_ - self->_espressoOutputTensors.__begin_) >> 3);
}

- ($FD4688982923A924290ECB669CAF1EC2)espressoInputTensorsData
{
  return ($FD4688982923A924290ECB669CAF1EC2 *)self->_espressoInputTensors.__begin_;
}

- (unint64_t)espressoInputTensorsSize
{
  return 0xCF3CF3CF3CF3CF3DLL * ((self->_espressoInputTensors.__end_ - self->_espressoInputTensors.__begin_) >> 3);
}

- (id)defaultEngineName
{
  int v2;

  v2 = -[ARMLImageProcessingTechnique defaultEngine](self, "defaultEngine");
  if (v2 > 10005)
  {
    switch(v2)
    {
      case 0x2716:
        return CFSTR("ESPRESSO_ENGINE_ANE_RUNTIME_DIRECT");
      case 0x2717:
        return CFSTR("ESPRESSO_ENGINE_ANE_RUNTIME");
      case 0x7FFFFFFF:
        return CFSTR("ESPRESSO_ENGINE_MAX_VAL");
    }
  }
  else
  {
    switch(v2)
    {
      case 0:
        return CFSTR("ESPRESSO_ENGINE_CPU");
      case 2:
        return CFSTR("ESPRESSO_ENGINE_METAL");
      case 5:
        return CFSTR("ESPRESSO_ENGINE_MPS");
    }
  }
  return &stru_1E6676798;
}

- (void)lockOrientation:(int64_t)a3
{
  self->_lockedOrientation = a3;
}

- (int64_t)numberOfInputChannelsToExpectInNetwork
{
  return 4;
}

- (id)networkModesForOrientation:(int64_t)a3
{
  NSObject *v6;
  objc_class *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  ARMLImageProcessingTechnique *v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 3) >= 2)
  {
    if ((unint64_t)(a3 - 1) < 2)
      return CFSTR("portrait");
    if (_ARLogGeneral(void)::onceToken != -1)
      dispatch_once(&_ARLogGeneral(void)::onceToken, &__block_literal_global_275);
    v6 = (id)_ARLogGeneral(void)::logObj;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543874;
      v10 = v8;
      v11 = 2048;
      v12 = self;
      v13 = 2048;
      v14 = a3;
      _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not find a network config for the device orientation %ld", (uint8_t *)&v9, 0x20u);

    }
  }
  return CFSTR("landscape");
}

- (BOOL)isLoadedModelVersionCorrect:(id)a3
{
  return 1;
}

- (NSString)networkVersionString
{
  __int128 v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[ARMLImageProcessingTechnique espressoNetwork](self, "espressoNetwork", 0, 0, 0, 0, 0, 0, 0, 0);
  if (espresso_network_get_version())
    return (NSString *)0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)loadMLWithPath:(id)a3 networkMode:(id)a4
{
  __CFString *v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  char *v13;
  void *context;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  char *v27;
  BOOL v28;
  NSObject *v29;
  _BOOL4 v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  objc_class *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD v52[5];
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  ARMLImageProcessingTechnique *v56;
  __int16 v57;
  const char *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "fileExistsAtPath:", v6);

    if (v9)
    {
      _ARLogTechnique();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARMLImageProcessingTechnique defaultEngineName](self, "defaultEngineName");
        v13 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v54 = v12;
        v55 = 2048;
        v56 = self;
        v57 = 2112;
        v58 = v13;
        _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Setting up espresso engine '%@'.", buf, 0x20u);

      }
      -[ARMLImageProcessingTechnique defaultEngine](self, "defaultEngine");
      context = (void *)espresso_create_context();
      self->_espressoContext = context;
      if (!context)
      {
        v15 = (void *)espresso_create_context();
        self->_espressoContext = v15;
        if (!v15)
        {
          self->_failedToLoadNetwork = 1;
          goto LABEL_19;
        }
      }
      self->_espressoPlan = (void *)espresso_create_plan();
      -[__CFString UTF8String](objc_retainAutorelease(v6), "UTF8String");
      if (espresso_plan_add_network())
      {
        self->_failedToLoadNetwork = 1;
        goto LABEL_19;
      }
      self->_failedToLoadNetwork = 0;
      -[ARMLImageProcessingTechnique networkVersionString](self, "networkVersionString");
      v27 = (char *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v28 = -[ARMLImageProcessingTechnique isLoadedModelVersionCorrect:](self, "isLoadedModelVersionCorrect:", v27);
        _ARLogTechnique();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
        if (v28)
        {
          if (v30)
          {
            v31 = (objc_class *)objc_opt_class();
            NSStringFromClass(v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v54 = v32;
            v55 = 2048;
            v56 = self;
            v57 = 2112;
            v58 = v27;
            _os_log_impl(&dword_1B3A68000, v29, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Version '%@'.", buf, 0x20u);

          }
          -[ARMLImageProcessingTechnique inputTensorNames](self, "inputTensorNames");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v52[0] = MEMORY[0x1E0C809B0];
          v52[1] = 3221225472;
          v52[2] = __59__ARMLImageProcessingTechnique_loadMLWithPath_networkMode___block_invoke;
          v52[3] = &unk_1E6675DC0;
          v52[4] = self;
          objc_msgSend(v33, "enumerateObjectsUsingBlock:", v52);

          -[ARMLImageProcessingTechnique outputTensorNames](self, "outputTensorNames");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          std::vector<espresso_buffer_t>::resize((uint64_t)&self->_espressoOutputTensors, objc_msgSend(v34, "count"));

          -[ARMLImageProcessingTechnique outputTensorNames](self, "outputTensorNames");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          std::vector<__CVPixelBufferPool *>::resize((uint64_t)&self->_espressoOutputBufferPools, objc_msgSend(v35, "count"));

          -[ARMLImageProcessingTechnique outputTensorNames](self, "outputTensorNames");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v51[0] = MEMORY[0x1E0C809B0];
          v51[1] = 3221225472;
          v51[2] = __59__ARMLImageProcessingTechnique_loadMLWithPath_networkMode___block_invoke_27;
          v51[3] = &unk_1E6675DC0;
          v51[4] = self;
          objc_msgSend(v36, "enumerateObjectsUsingBlock:", v51);

          if (!espresso_plan_build())
          {
            -[ARMLImageProcessingTechnique _bindOutputTensor](self, "_bindOutputTensor");
            -[ARMLImageProcessingTechnique inputTensorNames](self, "inputTensorNames");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            std::vector<espresso_buffer_t>::resize((uint64_t)&self->_espressoInputTensors, objc_msgSend(v44, "count"));

            -[ARMLImageProcessingTechnique inputTensorNames](self, "inputTensorNames");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v50[0] = MEMORY[0x1E0C809B0];
            v50[1] = 3221225472;
            v50[2] = __59__ARMLImageProcessingTechnique_loadMLWithPath_networkMode___block_invoke_30;
            v50[3] = &unk_1E6675DC0;
            v50[4] = self;
            objc_msgSend(v45, "enumerateObjectsUsingBlock:", v50);

            -[ARMLImageProcessingTechnique inputTensorNames](self, "inputTensorNames");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v49[0] = MEMORY[0x1E0C809B0];
            v49[1] = 3221225472;
            v49[2] = __59__ARMLImageProcessingTechnique_loadMLWithPath_networkMode___block_invoke_32;
            v49[3] = &unk_1E6675DC0;
            v49[4] = self;
            objc_msgSend(v46, "enumerateObjectsUsingBlock:", v49);

            -[ARMLImageProcessingTechnique outputTensorNames](self, "outputTensorNames");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48[0] = MEMORY[0x1E0C809B0];
            v48[1] = 3221225472;
            v48[2] = __59__ARMLImageProcessingTechnique_loadMLWithPath_networkMode___block_invoke_34;
            v48[3] = &unk_1E6675DC0;
            v48[4] = self;
            objc_msgSend(v47, "enumerateObjectsUsingBlock:", v48);

            goto LABEL_36;
          }
          _ARLogTechnique();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            v38 = (objc_class *)objc_opt_class();
            NSStringFromClass(v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v54 = v39;
            v55 = 2048;
            v56 = self;
            v57 = 2080;
            v58 = "Could not build espresso plan.";
            _os_log_impl(&dword_1B3A68000, v37, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", buf, 0x20u);

          }
LABEL_35:
          self->_failedToLoadNetwork = 1;
LABEL_36:

          goto LABEL_19;
        }
        if (v30)
        {
          v42 = (objc_class *)objc_opt_class();
          NSStringFromClass(v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v54 = v43;
          v55 = 2048;
          v56 = self;
          v57 = 2080;
          v58 = "Version mismatch";
          _os_log_impl(&dword_1B3A68000, v29, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", buf, 0x20u);

        }
      }
      else
      {
        _ARLogTechnique();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          v40 = (objc_class *)objc_opt_class();
          NSStringFromClass(v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v54 = v41;
          v55 = 2048;
          v56 = self;
          v57 = 2080;
          v58 = "Failed to get espresso network version.";
          _os_log_impl(&dword_1B3A68000, v29, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", buf, 0x20u);

        }
      }

      goto LABEL_35;
    }
    self->_failedToLoadNetwork = 1;
  }
  else
  {
    self->_failedToLoadNetwork = 1;
    _ARLogTechnique();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v54 = v18;
      v55 = 2048;
      v56 = self;
      _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Path to network is nil, check if network is added to spatial_splitting_network_mapping.plist file.", buf, 0x16u);

    }
  }
  _ARLogTechnique();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v54 = v21;
    v55 = 2048;
    v56 = self;
    v57 = 2112;
    v58 = (const char *)v6;
    _os_log_impl(&dword_1B3A68000, v19, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to load model from path '%@'", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v6)
    v24 = v6;
  else
    v24 = CFSTR("<nil>");
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0CB2AA0]);
  -[ARTechnique delegate](self, "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  ARErrorWithCodeAndUserInfo(1004, v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "technique:didFailWithError:", self, v26);

LABEL_19:
}

void __59__ARMLImageProcessingTechnique_loadMLWithPath_networkMode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a2);
  objc_msgSend(v3, "UTF8String");
  if (espresso_network_declare_input())
  {
    _ARLogTechnique();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543874;
      v9 = v6;
      v10 = 2048;
      v11 = v7;
      v12 = 2080;
      v13 = "Failure to declare input tensor";
      _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", (uint8_t *)&v8, 0x20u);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 233) = 1;
  }

}

void __59__ARMLImageProcessingTechnique_loadMLWithPath_networkMode___block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a2);
  objc_msgSend(v3, "UTF8String");
  if (espresso_network_declare_output())
  {
    _ARLogTechnique();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543874;
      v9 = v6;
      v10 = 2048;
      v11 = v7;
      v12 = 2080;
      v13 = "Failure to declare output tensor";
      _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", (uint8_t *)&v8, 0x20u);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 233) = 1;
  }

}

void __59__ARMLImageProcessingTechnique_loadMLWithPath_networkMode___block_invoke_30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "prepareBindInputBuffer:withName:", a3, a2))
  {
    _ARLogTechnique();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543874;
      v9 = v6;
      v10 = 2048;
      v11 = v7;
      v12 = 2080;
      v13 = "Failure to bind input tensor";
      _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", (uint8_t *)&v8, 0x20u);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 233) = 1;
  }
}

void __59__ARMLImageProcessingTechnique_loadMLWithPath_networkMode___block_invoke_32(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v3 = objc_retainAutorelease(a2);
  objc_msgSend(v3, "UTF8String");
  if (espresso_network_query_blob_dimensions())
  {
    _ARLogTechnique();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543874;
      v9 = v6;
      v10 = 2048;
      v11 = v7;
      v12 = 2080;
      v13 = "Failure to determine input tensor shape";
      _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", (uint8_t *)&v8, 0x20u);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 233) = 1;
  }

}

void __59__ARMLImageProcessingTechnique_loadMLWithPath_networkMode___block_invoke_34(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v3 = objc_retainAutorelease(a2);
  objc_msgSend(v3, "UTF8String");
  if (espresso_network_query_blob_dimensions())
  {
    _ARLogTechnique();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543874;
      v9 = v6;
      v10 = 2048;
      v11 = v7;
      v12 = 2080;
      v13 = "Failure to determine output tensor shape";
      _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", (uint8_t *)&v8, 0x20u);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 233) = 1;
  }

}

- (void)_bindOutputTensor
{
  void *v3;
  _QWORD v4[5];

  -[ARMLImageProcessingTechnique outputTensorNames](self, "outputTensorNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__ARMLImageProcessingTechnique__bindOutputTensor__block_invoke;
  v4[3] = &unk_1E6675DC0;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __49__ARMLImageProcessingTechnique__bindOutputTensor__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  int v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  __IOSurface *v17;
  const __CFDictionary *v18;
  CVReturn v19;
  NSObject *v20;
  objc_class *v21;
  id v22;
  uint64_t v23;
  objc_class *v24;
  char *v25;
  uint64_t v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  objc_class *v32;
  id v33;
  uint64_t v34;
  objc_class *v35;
  char *v36;
  uint64_t v37;
  _QWORD *exception;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  CVReturn v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE v52[12];
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  const char *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "useEspressoZeroCopyOutput"))
  {
    objc_msgSend(*(id *)(a1 + 32), "outputTensorNames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "UTF8String");
    v8 = espresso_network_bind_buffer();

    if (v8)
    {
      _ARLogTechnique();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v41 = v11;
        v42 = 2048;
        v43 = v12;
        v44 = 2080;
        v45 = "Failure to bind output tensor";
        _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", buf, 0x20u);

      }
LABEL_10:
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 233) = 1;
      goto LABEL_21;
    }
    pixelBufferOut = 0;
    v17 = *(__IOSurface **)v52;
    v50 = *MEMORY[0x1E0CA9038];
    v51 = MEMORY[0x1E0C9AA70];
    v18 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
    v19 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v17, v18, &pixelBufferOut);
    if (!CVPixelBufferGetIOSurface(pixelBufferOut))
    {
      _ARLogTechnique();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v23 = *(_QWORD *)(a1 + 32);
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (char *)objc_claimAutoreleasedReturnValue();
        v26 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138544130;
        v41 = v22;
        v42 = 2048;
        v43 = v23;
        v44 = 2112;
        v45 = v25;
        v46 = 2048;
        v47 = v26;
        _os_log_impl(&dword_1B3A68000, v20, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ (%p): Could not get IOSurface", buf, 0x2Au);

      }
    }
    if (v19)
    {
      _ARLogTechnique();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v33 = (id)objc_claimAutoreleasedReturnValue();
        v34 = *(_QWORD *)(a1 + 32);
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (char *)objc_claimAutoreleasedReturnValue();
        v37 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138544386;
        v41 = v33;
        v42 = 2048;
        v43 = v34;
        v44 = 2112;
        v45 = v36;
        v46 = 2048;
        v47 = v37;
        v48 = 1024;
        v49 = v19;
        _os_log_impl(&dword_1B3A68000, v31, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ (%p): Could not create CVPixelBuffer for neural network: %d", buf, 0x30u);

      }
      exception = __cxa_allocate_exception(8uLL);
      *exception = "Error: Could not create CVPixelBuffer for neural network";
      __cxa_throw(exception, MEMORY[0x1E0DE4E50], 0);
    }
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    if (espresso_network_bind_direct_cvpixelbuffer())
    {
      _ARLogTechnique();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v41 = v29;
        v42 = 2048;
        v43 = v30;
        v44 = 2080;
        v45 = "Failure to bind direct cvpixelbuffer output";
        _os_log_impl(&dword_1B3A68000, v27, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", buf, 0x20u);

      }
    }
    CVPixelBufferRelease(pixelBufferOut);
  }
  else
  {
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    if (espresso_network_bind_buffer())
    {
      _ARLogTechnique();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v52 = 138543874;
        *(_QWORD *)&v52[4] = v15;
        v53 = 2048;
        v54 = v16;
        v55 = 2080;
        v56 = "Failure to bind output tensor";
        _os_log_impl(&dword_1B3A68000, v13, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", v52, 0x20u);

      }
      goto LABEL_10;
    }
  }
LABEL_21:

}

- (void)changeEspressoConfig:(id)a3
{
  NSString *v5;
  NSString *previous_network_configuration;
  NSString *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  ARMLImageProcessingTechnique *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (NSString *)a3;
  previous_network_configuration = self->_previous_network_configuration;
  if (previous_network_configuration == v5
    || -[NSString isEqualToString:](previous_network_configuration, "isEqualToString:", v5))
  {
    goto LABEL_3;
  }
  -[ARMLImageProcessingTechnique _startLoadingMLModelSignpost](self, "_startLoadingMLModelSignpost");
  espresso_plan_build_clean();
  v7 = objc_retainAutorelease(v5);
  -[NSString UTF8String](v7, "UTF8String");
  if (espresso_network_select_configuration())
  {
    _ARLogTechnique();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = v10;
      v17 = 2048;
      v18 = self;
      v19 = 2080;
      v20 = "Can't set mode";
      _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", buf, 0x20u);

    }
LABEL_11:

    self->_failedToLoadNetwork = 1;
    goto LABEL_12;
  }
  if (espresso_plan_build())
  {
    _ARLogTechnique();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = v12;
      v17 = 2048;
      v18 = self;
      v19 = 2080;
      v20 = "Could not rebuild espresso plan";
      _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", buf, 0x20u);

    }
    goto LABEL_11;
  }
  -[ARMLImageProcessingTechnique _bindOutputTensor](self, "_bindOutputTensor");
  -[ARMLImageProcessingTechnique inputTensorNames](self, "inputTensorNames");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__ARMLImageProcessingTechnique_changeEspressoConfig___block_invoke;
  v14[3] = &unk_1E6675DC0;
  v14[4] = self;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v14);

  -[ARMLImageProcessingTechnique _endLoadingMLModelSignpost](self, "_endLoadingMLModelSignpost");
  -[ARMLImageProcessingTechnique networkModeDidChange:toMode:](self, "networkModeDidChange:toMode:", self->_previous_network_configuration, v7);
LABEL_3:
  objc_storeStrong((id *)&self->_previous_network_configuration, a3);
LABEL_12:

}

void __53__ARMLImageProcessingTechnique_changeEspressoConfig___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "prepareBindInputBuffer:withName:", a3, a2))
  {
    _ARLogTechnique();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543874;
      v9 = v6;
      v10 = 2048;
      v11 = v7;
      v12 = 2080;
      v13 = "Failure to bind input tensor";
      _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", (uint8_t *)&v8, 0x20u);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 233) = 1;
  }
}

- (double)requiredTimeInterval
{
  return 0.016;
}

- (int64_t)captureBehavior
{
  return 1;
}

- (unint64_t)requiredSensorDataTypes
{
  return 1;
}

- (id)resultDataClasses
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", MEMORY[0x1E0C9AA60]);
}

- (int64_t)orientationForInitializingEspresso
{
  return 3;
}

- (void)prepare:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_prepLock;
  NSString *previous_network_configuration;

  v3 = a3;
  p_prepLock = &self->_prepLock;
  os_unfair_lock_lock(&self->_prepLock);
  self->_deterministic = v3;
  if (self->_hasBegunPrep)
  {
    os_unfair_lock_unlock(p_prepLock);
  }
  else
  {
    self->_hasBegunPrep = 1;
    os_unfair_lock_unlock(p_prepLock);
    -[ARMLImageProcessingTechnique _prepareOnce:](self, "_prepareOnce:", v3);
    if (!self->_delegateInference)
    {
      -[ARMLImageProcessingTechnique _startLoadingMLModelSignpost](self, "_startLoadingMLModelSignpost");
      -[ARMLImageProcessingTechnique loadMLWithPath:networkMode:](self, "loadMLWithPath:networkMode:", self->_networkFilePath, 0);
      previous_network_configuration = self->_previous_network_configuration;
      self->_previous_network_configuration = 0;

      -[ARMLImageProcessingTechnique _endLoadingMLModelSignpost](self, "_endLoadingMLModelSignpost");
    }
    -[ARMLImageProcessingTechnique setPrepComplete:](self, "setPrepComplete:", 1);
  }
}

- (void)waitForProcessingCompleteInDeterministicMode
{
  if (self->_deterministic)
    dispatch_sync((dispatch_queue_t)self->_processingQueue, &__block_literal_global_46_1);
}

- (id)processData:(id)a3
{
  id v4;
  id v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ARMLImageProcessingTechnique;
  v5 = -[ARImageBasedTechnique processData:](&v7, sel_processData_, v4);
  if (-[ARMLImageProcessingTechnique prepComplete](self, "prepComplete"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (-[ARMLImageProcessingTechnique requiredSensorDataTypes](self, "requiredSensorDataTypes") & 1) != 0)
    {
      -[ARMLImageProcessingTechnique _asynchronousProcessDownSampledImage:](self, "_asynchronousProcessDownSampledImage:", v4);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[ARMLImageProcessingTechnique _asynchronousProcessEspressoTensor:](self, "_asynchronousProcessEspressoTensor:", v4);
    }
    -[ARMLImageProcessingTechnique waitForProcessingCompleteInDeterministicMode](self, "waitForProcessingCompleteInDeterministicMode");
  }
  return v4;
}

- (void)_asynchronousProcessDownSampledImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double width;
  double height;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  NSObject *processingQueue;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47[4];
  id location;
  _QWORD v49[4];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  const __CFString *v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (-[ARMLImageProcessingTechnique shouldUseSynchronizedUltraWide](self, "shouldUseSynchronizedUltraWide"))
  {
    objc_msgSend(v4, "latestResizedUltraWideImageData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v4;
    if (v6)
    {
      objc_msgSend(v4, "latestResizedUltraWideImageData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v4, "latestResizedUltraWideImageData");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v4;
      }
      else
      {
        objc_msgSend(v4, "originalImageData");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "timestamp");
        -[ARImageBasedTechnique pushResultData:forTimestamp:](self, "pushResultData:forTimestamp:", MEMORY[0x1E0C9AA60]);
        v5 = v4;
      }

    }
  }
  width = self->_networkInputScaleBeforeRotation.width;
  height = self->_networkInputScaleBeforeRotation.height;
  if (-[ARMLImageProcessingTechnique networkProvidesConfigurationsForDeviceOrientation](self, "networkProvidesConfigurationsForDeviceOrientation")&& (objc_msgSend(v5, "rotationOfResultTensor") == 90 || objc_msgSend(v5, "rotationOfResultTensor") == -90))
  {
    height = self->_networkInputScaleBeforeRotation.width;
    width = self->_networkInputScaleBeforeRotation.height;
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v5, "downScalingResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (!v12)
  {

LABEL_27:
    objc_msgSend(v5, "downScalingResults");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARMLImageProcessingTechnique _resampleImage:rotationOfResultTensor:networkInputSize:](self, "_resampleImage:rotationOfResultTensor:networkInputSize:", v22, objc_msgSend(v5, "rotationOfResultTensor"), width, height);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_28;
  }
  v13 = 0;
  v14 = *(_QWORD *)v51;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v51 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
      objc_msgSend(v16, "imageResolution");
      if (v18 == width && v17 == height)
      {
        v20 = v16;

        v13 = v20;
      }
    }
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  }
  while (v12);

  if (!v13)
    goto LABEL_27;
LABEL_28:
  v23 = (void *)objc_msgSend(v5, "rotationOfResultTensor");
  objc_msgSend(v13, "regionOfInterest");
  v25 = v24;
  v27 = v26;
  v28 = (void *)objc_opt_new();
  objc_msgSend(v5, "timestamp");
  objc_msgSend(v28, "setTimestamp:");
  if (-[ARMLImageProcessingTechnique shouldUseSynchronizedUltraWide](self, "shouldUseSynchronizedUltraWide")
    && objc_msgSend(v13, "undistortedPixelBuffer")
    || objc_msgSend(v13, "undistortedPixelBuffer"))
  {
    v29 = objc_msgSend(v13, "undistortedPixelBuffer");
  }
  else
  {
    v29 = objc_msgSend(v13, "pixelBuffer");
  }
  objc_msgSend(v28, "setPixelBuffer:", v29);
  v54 = CFSTR("croppedRect");
  v30 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v13, "cropRegion");
  v49[0] = v31;
  v49[1] = v32;
  v49[2] = v33;
  v49[3] = v34;
  objc_msgSend(v30, "valueWithBytes:objCType:", v49, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setMetaData:", v36);

  objc_msgSend(v5, "originalImageData");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_processingSemaphore, 0))
  {
    objc_msgSend(v5, "timestamp");
    kdebug_trace();
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_processingSemaphore);
  }
  os_unfair_lock_lock(&self->_espressoInputBufferLock);
  objc_msgSend(v37, "timestamp");
  self->_espressoInputBufferTimestamp = v38;
  os_unfair_lock_unlock(&self->_espressoInputBufferLock);
  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __69__ARMLImageProcessingTechnique__asynchronousProcessDownSampledImage___block_invoke;
  v43[3] = &unk_1E6675DE8;
  objc_copyWeak(v47, &location);
  v44 = v37;
  v45 = v28;
  v46 = v5;
  v47[1] = v25;
  v47[2] = v27;
  v47[3] = v23;
  v40 = v5;
  v41 = v28;
  v42 = v37;
  dispatch_async(processingQueue, v43);

  objc_destroyWeak(v47);
  objc_destroyWeak(&location);

}

void __69__ARMLImageProcessingTechnique__asynchronousProcessDownSampledImage___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  os_unfair_lock_s *v4;
  double v5;
  uint64_t v7;
  void *v8;
  double v9;
  char *WeakRetained;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "timestamp");
    v3 = v2;
    v4 = (os_unfair_lock_s *)(WeakRetained + 120);
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 30);
    v5 = *((double *)WeakRetained + 14);
    if (v5 == 0.0 || v3 == v5)
    {
      kdebug_trace();
      *((_QWORD *)WeakRetained + 14) = 0;
      os_unfair_lock_unlock(v4);
      dispatch_semaphore_wait(*((dispatch_semaphore_t *)WeakRetained + 12), 0xFFFFFFFFFFFFFFFFLL);
      v7 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "originalImageData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_runNeuralNetworkAndPushResult:originalImageData:regionOfInterest:rotationOfResultTensor:", v7, v8, *(_QWORD *)(a1 + 80), *(double *)(a1 + 64), *(double *)(a1 + 72));

    }
    else
    {
      os_unfair_lock_unlock(v4);
      kdebug_trace();
      if (objc_msgSend(WeakRetained, "shouldUseSynchronizedUltraWide"))
      {
        objc_msgSend(*(id *)(a1 + 32), "timestampOfSynchronizedWideImageData");
        v3 = v9;
      }
      objc_msgSend(WeakRetained, "pushResultData:forTimestamp:", MEMORY[0x1E0C9AA60], v3);
    }
  }

}

- (void)_runNeuralNetworkAndPushResult:(id)a3 originalImageData:(id)a4 regionOfInterest:(CGSize)a5 rotationOfResultTensor:(int64_t)a6
{
  double height;
  double width;
  id v11;
  void *v12;
  void *v13;
  id v14;

  height = a5.height;
  width = a5.width;
  v14 = a3;
  v11 = a4;
  objc_msgSend(v11, "timestamp");
  -[ARMLImageProcessingTechnique _startMLProcessingSignpostWithTimestamp:](self, "_startMLProcessingSignpostWithTimestamp:");
  -[ARMLImageProcessingTechnique runNeuralNetworkWithImageData:originalImageData:regionOfInterest:rotationOfResultTensor:](self, "runNeuralNetworkWithImageData:originalImageData:regionOfInterest:rotationOfResultTensor:", v14, v11, a6, width, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_processingSemaphore);
  if (-[ARMLImageProcessingTechnique shouldUseSynchronizedUltraWide](self, "shouldUseSynchronizedUltraWide"))
    objc_msgSend(v11, "timestampOfSynchronizedWideImageData");
  else
    objc_msgSend(v11, "timestamp");
  if (v12)
    v13 = v12;
  else
    v13 = (void *)MEMORY[0x1E0C9AA60];
  -[ARImageBasedTechnique pushResultData:forTimestamp:](self, "pushResultData:forTimestamp:", v13);
  objc_msgSend(v11, "timestamp");
  -[ARMLImageProcessingTechnique _endMLProcessingSignpostWithTimestamp:](self, "_endMLProcessingSignpostWithTimestamp:");

}

- (id)runNeuralNetworkWithImageData:(id)a3 originalImageData:(id)a4 regionOfInterest:(CGSize)a5 rotationOfResultTensor:(int64_t)a6
{
  double height;
  double width;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  height = a5.height;
  width = a5.width;
  v17[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  -[ARMLImageProcessingTechnique processImageDataThroughNeuralNetwork:originalImageData:regionOfInterest:rotationOfResultTensor:](self, "processImageDataThroughNeuralNetwork:originalImageData:regionOfInterest:rotationOfResultTensor:", v11, v12, a6, width, height);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
  {
    v17[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v15;
}

- (void)_asynchronousProcessEspressoTensor:(id)a3
{
  id v4;
  OS_dispatch_semaphore *v5;
  NSObject *processingQueue;
  OS_dispatch_semaphore *v7;
  _QWORD v8[4];
  OS_dispatch_semaphore *v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  if (self->_failedToLoadNetwork || dispatch_semaphore_wait((dispatch_semaphore_t)self->_processingSemaphore, 0))
  {
    objc_msgSend(v4, "timestamp");
    -[ARImageBasedTechnique pushResultData:forTimestamp:](self, "pushResultData:forTimestamp:", MEMORY[0x1E0C9AA60]);
  }
  else
  {
    v5 = self->_processingSemaphore;
    objc_initWeak(&location, self);
    processingQueue = self->_processingQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__ARMLImageProcessingTechnique__asynchronousProcessEspressoTensor___block_invoke;
    v8[3] = &unk_1E6672D40;
    objc_copyWeak(&v11, &location);
    v9 = v5;
    v10 = v4;
    v7 = v5;
    dispatch_async(processingQueue, v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __67__ARMLImageProcessingTechnique__asynchronousProcessEspressoTensor___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t *WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (dispatch_semaphore_t *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 40), "timestamp");
    -[dispatch_semaphore_t _startMLProcessingSignpostWithTimestamp:](WeakRetained, "_startMLProcessingSignpostWithTimestamp:");
    -[dispatch_semaphore_t processEspressoTensor:](WeakRetained, "processEspressoTensor:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(WeakRetained[12]);
    if (v3)
    {
      v5[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = (void *)MEMORY[0x1E0C9AA60];
    }
    objc_msgSend(*(id *)(a1 + 40), "timestamp");
    -[dispatch_semaphore_t pushResultData:forTimestamp:](WeakRetained, "pushResultData:forTimestamp:", v4);
    if (v3)

    objc_msgSend(*(id *)(a1 + 40), "timestamp");
    -[dispatch_semaphore_t _endMLProcessingSignpostWithTimestamp:](WeakRetained, "_endMLProcessingSignpostWithTimestamp:");

  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

}

- (id)_resampleImage:(id)a3 rotationOfResultTensor:(int64_t)a4 networkInputSize:(CGSize)a5
{
  double height;
  double width;
  id v8;
  __CVBuffer *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  ARMLImageDownScalingResult *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  ARMLImageDownScalingResult *v25;
  vImage_Buffer v27;
  vImage_Buffer src;

  height = a5.height;
  width = a5.width;
  v8 = a3;
  v9 = ARCreateCVPixelBufferFromPool(&self->_bgraPixelBufferPool, 1111970369, self, CFSTR("Down Scale Output"), width, height);
  if (v9)
  {
    CVPixelBufferLockBaseAddress((CVPixelBufferRef)objc_msgSend(v8, "pixelBuffer"), 0);
    CVPixelBufferLockBaseAddress(v9, 0);
    memset(&src, 0, sizeof(src));
    ARWrapCVPixelBufferVImage((__CVBuffer *)objc_msgSend(v8, "pixelBuffer"), &src.data);
    memset(&v27, 0, sizeof(v27));
    ARWrapCVPixelBufferVImage(v9, &v27.data);
    vImageScale_ARGB8888(&src, &v27, 0, 0x10u);
    CVPixelBufferUnlockBaseAddress(v9, 0);
    CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)objc_msgSend(v8, "pixelBuffer"), 0);
    objc_msgSend(v8, "imageResolution");
    v11 = v10;
    objc_msgSend(v8, "imageResolution");
    v13 = v12;
    objc_msgSend(v8, "regionOfInterest");
    v15 = v14;
    objc_msgSend(v8, "regionOfInterest");
    v17 = v16;
    v18 = [ARMLImageDownScalingResult alloc];
    objc_msgSend(v8, "cropRegion");
    v20 = v19;
    v22 = v21;
    *(float *)&v19 = width / v11;
    *(float *)&v21 = height / v13;
    v25 = -[ARMLImageDownScalingResult initWithPixelBuffer:regionOfInterest:cropRegion:](v18, "initWithPixelBuffer:regionOfInterest:cropRegion:", v9, v15 * *(float *)&v19, v17 * *(float *)&v21, v20, v22, v23, v24);
    CVPixelBufferRelease(v9);
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- ($F613A077D53D3D97A8E0FDF5BAE1891D)networkInputParams
{
  *(_DWORD *)&retstr->var4 = 0;
  *(_OWORD *)&retstr->var0 = xmmword_1B3C0E108;
  return self;
}

- (int)prepareBindInputBuffer:(unint64_t)a3 withName:(id)a4
{
  return 0;
}

- (int)bindInputBuffer:(unint64_t)a3 withImage:(id)a4 andOriginalImageData:(id)a5 rotationOfResultTensor:(int64_t)a6
{
  id v8;
  id v9;
  int v10;

  v8 = a4;
  -[NSArray objectAtIndexedSubscript:](self->_inputTensorNames, "objectAtIndexedSubscript:", a3);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v9, "UTF8String");
  objc_msgSend(v8, "pixelBuffer");
  v10 = espresso_network_bind_direct_cvpixelbuffer();

  return v10;
}

- (id)processImageDataThroughNeuralNetwork:(id)a3 originalImageData:(id)a4 regionOfInterest:(CGSize)a5 rotationOfResultTensor:(int64_t)a6
{
  double height;
  double width;
  id v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  unsigned int v16;
  size_t v17;
  unint64_t i;
  void *v19;
  BOOL v20;
  id v21;
  int blob_dimensions;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CVPixelBufferRef v29;
  char *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  CVPixelBufferRef *v35;
  char *v36;
  __CVBuffer *v37;
  void *v38;
  id v39;
  int v40;
  NSObject *v41;
  objc_class *v42;
  void *v43;
  unint64_t j;
  void *v45;
  BOOL v46;
  NSObject *v47;
  objc_class *v48;
  void *v49;
  NSObject *v50;
  objc_class *v51;
  void *v52;
  __CVBuffer *v54;
  double v55;
  double v56;
  size_t v57;
  size_t v58;
  double v59;
  double v60;
  unint64_t k;
  void *v62;
  BOOL v63;
  int64_t v64;
  void *v65;
  id v66;
  char *__p;
  char *v68;
  char *v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  ARMLImageProcessingTechnique *v73;
  __int16 v74;
  const char *v75;
  _BYTE v76[24];
  const char *v77;
  uint64_t v78;

  height = a5.height;
  width = a5.width;
  v78 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v66 = a4;
  v12 = 0;
  if (v11 && !self->_failedToLoadNetwork)
  {
    v64 = -[ARMLImageProcessingTechnique getDeviceOrientationFromImageData:](self, "getDeviceOrientationFromImageData:", v66);
    -[ARMLImageProcessingTechnique networkModesForOrientation:](self, "networkModesForOrientation:");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARMLImageProcessingTechnique changeEspressoConfig:](self, "changeEspressoConfig:");
    CVPixelBufferLockBaseAddress((CVPixelBufferRef)objc_msgSend(v11, "pixelBuffer"), 0);
    objc_msgSend(v11, "timestamp");
    -[ARMLImageProcessingTechnique _startMLRunNetworkSignpostWithTimestamp:](self, "_startMLRunNetworkSignpostWithTimestamp:");
    objc_msgSend(v11, "timestamp");
    v14 = v13;
    objc_msgSend(v66, "cameraType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0C89F98]);
    v17 = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v11, "pixelBuffer"));
    -[ARMLImageProcessingTechnique _captureMLRunNetworkInputImageData:cameraType:imageWidth:imageHeight:](self, "_captureMLRunNetworkInputImageData:cameraType:imageWidth:imageHeight:", v16, v17, CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v11, "pixelBuffer")), v14);

    __p = 0;
    v68 = 0;
    v69 = 0;
    if (-[ARMLImageProcessingTechnique useEspressoZeroCopyOutput](self, "useEspressoZeroCopyOutput"))
    {
      for (i = 0; ; ++i)
      {
        -[ARMLImageProcessingTechnique outputTensorNames](self, "outputTensorNames");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = i < objc_msgSend(v19, "count");

        if (!v20)
          break;
        objc_msgSend(v11, "timestamp");
        kdebug_trace();
        -[NSArray objectAtIndexedSubscript:](self->_outputTensorNames, "objectAtIndexedSubscript:", i);
        v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v21, "UTF8String");
        blob_dimensions = espresso_network_query_blob_dimensions();

        if (blob_dimensions)
        {
          _ARLogTechnique();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            v24 = (objc_class *)objc_opt_class();
            NSStringFromClass(v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v71 = v25;
            v72 = 2048;
            v73 = self;
            v74 = 2080;
            v75 = "Failure to query network output dimensions";
            _os_log_impl(&dword_1B3A68000, v23, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", buf, 0x20u);

          }
        }
        v26 = *(_QWORD *)v76;
        v27 = *(_QWORD *)&v76[8];
        v28 = *(_QWORD *)&v76[16];
        kdebug_trace();
        v29 = ARCreateCVPixelBufferFromPool(&self->_espressoOutputBufferPools.__begin_[i], 1278226536, self, CFSTR("Espresso Output"), (double)v26, (double)(unint64_t)(v28 * v27));
        kdebug_trace();
        if (v68 >= v69)
        {
          v31 = (v68 - __p) >> 3;
          if ((unint64_t)(v31 + 1) >> 61)
            std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
          v32 = (v69 - __p) >> 2;
          if (v32 <= v31 + 1)
            v32 = v31 + 1;
          if ((unint64_t)(v69 - __p) >= 0x7FFFFFFFFFFFFFF8)
            v33 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v33 = v32;
          if (v33)
            v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cva::Matrix<unsigned int,2u,1u,false>>>((uint64_t)&v69, v33);
          else
            v34 = 0;
          v35 = (CVPixelBufferRef *)&v34[8 * v31];
          *v35 = v29;
          v30 = (char *)(v35 + 1);
          v36 = v68;
          if (v68 != __p)
          {
            do
            {
              v37 = (__CVBuffer *)*((_QWORD *)v36 - 1);
              v36 -= 8;
              *--v35 = v37;
            }
            while (v36 != __p);
            v36 = __p;
          }
          __p = (char *)v35;
          v69 = &v34[8 * v33];
          if (v36)
            operator delete(v36);
        }
        else
        {
          *(_QWORD *)v68 = v29;
          v30 = v68 + 8;
        }
        v68 = v30;
        -[ARMLImageProcessingTechnique outputTensorNames](self, "outputTensorNames");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectAtIndexedSubscript:", i);
        v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v39, "UTF8String");
        v40 = espresso_network_bind_direct_cvpixelbuffer();

        if (v40)
        {
          _ARLogTechnique();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            v42 = (objc_class *)objc_opt_class();
            NSStringFromClass(v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v71 = v43;
            v72 = 2048;
            v73 = self;
            v74 = 2080;
            v75 = "Failure to bind direct cvpixelbuffer output";
            _os_log_impl(&dword_1B3A68000, v41, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", buf, 0x20u);

          }
        }
        kdebug_trace();
      }
    }
    for (j = 0; ; ++j)
    {
      -[ARMLImageProcessingTechnique inputTensorNames](self, "inputTensorNames");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = j < objc_msgSend(v45, "count");

      if (!v46)
        break;
      if (-[ARMLImageProcessingTechnique bindInputBuffer:withImage:andOriginalImageData:rotationOfResultTensor:](self, "bindInputBuffer:withImage:andOriginalImageData:rotationOfResultTensor:", j, v11, v66, a6))
      {
        objc_msgSend(v11, "timestamp");
        -[ARMLImageProcessingTechnique _endMLRunNetworkSignpostWithTimestamp:](self, "_endMLRunNetworkSignpostWithTimestamp:");
        _ARLogTechnique();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          v51 = (objc_class *)objc_opt_class();
          NSStringFromClass(v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v76 = 138543874;
          *(_QWORD *)&v76[4] = v52;
          *(_WORD *)&v76[12] = 2048;
          *(_QWORD *)&v76[14] = self;
          *(_WORD *)&v76[22] = 2048;
          v77 = (const char *)j;
          _os_log_impl(&dword_1B3A68000, v50, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to bind input buffer for index: '%lu'.", v76, 0x20u);

        }
        CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)objc_msgSend(v11, "pixelBuffer"), 0);
        v12 = 0;
        goto LABEL_42;
      }
    }
    if (espresso_plan_execute_sync())
    {
      _ARLogTechnique();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        v48 = (objc_class *)objc_opt_class();
        NSStringFromClass(v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v76 = 138543874;
        *(_QWORD *)&v76[4] = v49;
        *(_WORD *)&v76[12] = 2048;
        *(_QWORD *)&v76[14] = self;
        *(_WORD *)&v76[22] = 2080;
        v77 = "Failure to run network.";
        _os_log_impl(&dword_1B3A68000, v47, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", v76, 0x20u);

      }
      CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)objc_msgSend(v11, "pixelBuffer"), 0);
      objc_msgSend(v11, "timestamp");
      -[ARMLImageProcessingTechnique _endMLRunNetworkSignpostWithTimestamp:](self, "_endMLRunNetworkSignpostWithTimestamp:");
      v12 = 0;
    }
    else
    {
      objc_msgSend(v11, "timestamp");
      -[ARMLImageProcessingTechnique _endMLRunNetworkSignpostWithTimestamp:](self, "_endMLRunNetworkSignpostWithTimestamp:");
      CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)objc_msgSend(v11, "pixelBuffer"), 0);
      v54 = (__CVBuffer *)objc_msgSend(v11, "pixelBuffer");
      objc_msgSend(v11, "timestamp");
      v56 = v55;
      if (v54)
      {
        v57 = CVPixelBufferGetWidth(v54);
        v58 = CVPixelBufferGetHeight(v54);
        v59 = (double)v57;
        v60 = (double)v58;
      }
      else
      {
        v59 = *MEMORY[0x1E0C9D820];
        v60 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      }
      -[ARMLImageProcessingTechnique _startMLCreateResultSignpostWithTimestamp:orientation:outputSize:](self, "_startMLCreateResultSignpostWithTimestamp:orientation:outputSize:", v64, v56, v59, v60);
      if (-[ARMLImageProcessingTechnique useEspressoZeroCopyOutput](self, "useEspressoZeroCopyOutput"))
        -[ARMLImageProcessingTechnique createResultDataFromPixelBuffer:numberOfOutputTensors:imageDataForNeuralNetwork:inputImageData:rotationNeeded:regionOfInterest:](self, "createResultDataFromPixelBuffer:numberOfOutputTensors:imageDataForNeuralNetwork:inputImageData:rotationNeeded:regionOfInterest:", width, height);
      else
        -[ARMLImageProcessingTechnique createResultDataFromTensors:numberOfOutputTensors:imageDataForNeuralNetwork:inputImageData:rotationNeeded:regionOfInterest:](self, "createResultDataFromTensors:numberOfOutputTensors:imageDataForNeuralNetwork:inputImageData:rotationNeeded:regionOfInterest:", width, height);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timestamp");
      -[ARMLImageProcessingTechnique _endMLCreateResultSignpostWithTimestamp:](self, "_endMLCreateResultSignpostWithTimestamp:");
      if (-[ARMLImageProcessingTechnique useEspressoZeroCopyOutput](self, "useEspressoZeroCopyOutput"))
      {
        for (k = 0; ; ++k)
        {
          -[ARMLImageProcessingTechnique outputTensorNames](self, "outputTensorNames");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = k < objc_msgSend(v62, "count");

          if (!v63)
            break;
          CVPixelBufferRelease(*(CVPixelBufferRef *)&__p[8 * k]);
        }
      }
    }
LABEL_42:
    if (__p)
      operator delete(__p);

  }
  return v12;
}

- (id)processEspressoTensor:(id)a3
{
  return 0;
}

- (id)createResultDataFromTensors:(id *)a3 numberOfOutputTensors:(unint64_t)a4 imageDataForNeuralNetwork:(id)a5 inputImageData:(id)a6 rotationNeeded:(int64_t)a7 regionOfInterest:(CGSize)a8
{
  return 0;
}

- (BOOL)preProcessNetworkInputImage:(__CVBuffer *)a3
{
  return 1;
}

- (BOOL)shouldUseSynchronizedUltraWide
{
  return 0;
}

- (int64_t)getDeviceOrientationFromImageData:(id)a3
{
  id v4;
  int64_t lockedOrientation;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  if (!objc_msgSend(v4, "deviceOrientation"))
  {
    lockedOrientation = self->_lockedOrientation;
    if ((lockedOrientation & 0x80000000) == 0)
      goto LABEL_6;
    +[ARBKSAccelerometer sharedWeakAccelerometerHandle](ARBKSAccelerometer, "sharedWeakAccelerometerHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      lockedOrientation = objc_msgSend(v6, "currentOrientation");

      goto LABEL_6;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)ARMLImageProcessingTechnique;
  lockedOrientation = -[ARImageBasedTechnique getDeviceOrientationFromImageData:](&v9, sel_getDeviceOrientationFromImageData_, v4);
LABEL_6:

  return lockedOrientation;
}

- (BOOL)isBusy
{
  intptr_t v3;

  v3 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_processingSemaphore, 0);
  if (!v3)
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_processingSemaphore);
  return v3 != 0;
}

- (void)_startLoadingMLModelSignpost
{
  kdebug_trace();
}

- (void)_endLoadingMLModelSignpost
{
  kdebug_trace();
}

- (void)_startMLProcessingSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endMLProcessingSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startMLRunNetworkSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_captureMLRunNetworkInputImageData:(double)a3 cameraType:(int64_t)a4 imageWidth:(unint64_t)a5 imageHeight:(unint64_t)a6
{
  kdebug_trace();
}

- (void)_endMLRunNetworkSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startMLCreateResultSignpostWithTimestamp:(double)a3 orientation:(int64_t)a4 outputSize:(CGSize)a5
{
  kdebug_trace();
}

- (void)_endMLCreateResultSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (NSString)networkFilePath
{
  return self->_networkFilePath;
}

- (void)setNetworkFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_networkFilePath, a3);
}

- (BOOL)failedToLoadNetwork
{
  return self->_failedToLoadNetwork;
}

- (CGSize)networkInputScaleBeforeRotation
{
  double width;
  double height;
  CGSize result;

  width = self->_networkInputScaleBeforeRotation.width;
  height = self->_networkInputScaleBeforeRotation.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)useEspressoZeroCopyOutput
{
  return self->_useEspressoZeroCopyOutput;
}

- (void)setUseEspressoZeroCopyOutput:(BOOL)a3
{
  self->_useEspressoZeroCopyOutput = a3;
}

- (BOOL)prepComplete
{
  return self->_prepComplete;
}

- (void)setPrepComplete:(BOOL)a3
{
  self->_prepComplete = a3;
}

- (NSArray)inputTensorNames
{
  return self->_inputTensorNames;
}

- (NSArray)outputTensorNames
{
  return self->_outputTensorNames;
}

- (CGSize)allowedResamplingImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_allowedResamplingImageSize.width;
  height = self->_allowedResamplingImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setAllowedResamplingImageSize:(CGSize)a3
{
  self->_allowedResamplingImageSize = a3;
}

- (BOOL)networkHasConfigurations
{
  return self->_networkHasConfigurations;
}

- (void)setNetworkHasConfigurations:(BOOL)a3
{
  self->_networkHasConfigurations = a3;
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  __CVPixelBufferPool **v4;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v5;

  objc_storeStrong((id *)&self->_outputTensorNames, 0);
  objc_storeStrong((id *)&self->_inputTensorNames, 0);
  objc_storeStrong((id *)&self->_networkFilePath, 0);
  objc_storeStrong((id *)&self->_previous_network_configuration, 0);
  begin = self->_espressoInputTensors.__begin_;
  if (begin)
  {
    self->_espressoInputTensors.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_espressoOutputBufferPools.__begin_;
  if (v4)
  {
    self->_espressoOutputBufferPools.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_espressoOutputTensors.__begin_;
  if (v5)
  {
    self->_espressoOutputTensors.__end_ = v5;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_processingSemaphore, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 22) = 0;
  *((_QWORD *)self + 20) = 0;
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 25) = 0;
  *((_QWORD *)self + 23) = 0;
  *((_QWORD *)self + 27) = 0;
  *((_QWORD *)self + 28) = 0;
  *((_QWORD *)self + 26) = 0;
  return self;
}

@end
