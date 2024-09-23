@implementation ARSession

+ (void)initialize
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__ARSession_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, block);
}

void __23__ARSession_initialize__block_invoke(uint64_t a1)
{
  os_activity_t v2;
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  _BYTE v18[10];
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = _os_activity_create(&dword_1B3A68000, "ARKit Session", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v3 = (void *)arkitActivity;
  arkitActivity = (uint64_t)v2;

  _ARLogSession_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    ARKitCoreBuildVersionString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v14 = v6;
    v15 = 2048;
    v16 = v7;
    v17 = 2114;
    *(_QWORD *)v18 = v8;
    _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>:  ==== Loading ARKit %{public}@ ====", buf, 0x20u);

  }
  CV3DGetVersionInfo();
  _ARLogSession_0();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138544386;
    v14 = v11;
    v15 = 2048;
    v16 = v12;
    v17 = 1024;
    *(_DWORD *)v18 = 0;
    *(_WORD *)&v18[4] = 1024;
    *(_DWORD *)&v18[6] = 0;
    v19 = 1024;
    v20 = 0;
    _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>:  ==== Using AppleCV3D %u.%u.%u  ====", buf, 0x28u);

  }
}

- (BOOL)wantsPredictedAnchorTracking
{
  return 0;
}

+ (id)_runningSessions
{
  if (_runningSessions_sessionsOnceToken != -1)
    dispatch_once(&_runningSessions_sessionsOnceToken, &__block_literal_global_69);
  objc_msgSend((id)_weakSessions, "ar_compactZeroedWeakPointers");
  return (id)objc_msgSend((id)_weakSessions, "allObjects");
}

void __29__ARSession__runningSessions__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_weakSessions;
  _weakSessions = v0;

}

- (ARSession)init
{
  unsigned int *v2;
  uint64_t v3;
  void *v4;
  dispatch_semaphore_t v5;
  void *v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  dispatch_semaphore_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  dispatch_semaphore_t v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  dispatch_semaphore_t v27;
  void *v28;
  dispatch_semaphore_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  ARTrackedRaycastPostProcessor *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  objc_class *v60;
  id v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  id v68;
  uint64_t v69;
  void *v70;
  ARRecon3DLogger *v71;
  void *v72;
  _QWORD v74[4];
  id v75;
  _QWORD handler[4];
  id v77;
  id location;
  objc_super v79;
  uint8_t buf[4];
  id v81;
  __int16 v82;
  unsigned int *v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v79.receiver = self;
  v79.super_class = (Class)ARSession;
  v2 = -[ARSession init](&v79, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 55);
    *((_QWORD *)v2 + 55) = v3;

    *((_QWORD *)v2 + 58) = 0;
    v5 = dispatch_semaphore_create(1);
    v6 = (void *)*((_QWORD *)v2 + 17);
    *((_QWORD *)v2 + 17) = v5;

    v7 = dispatch_semaphore_create(1);
    v8 = (void *)*((_QWORD *)v2 + 19);
    *((_QWORD *)v2 + 19) = v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INTERACTIVE, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = dispatch_queue_create("com.apple.arkit.stateSerialQueue", v10);
    dispatch_queue_set_specific(v11, &kARSessionStateQueueSpecificKey, (void *)kARSessionStateQueueSpecificValue, 0);
    objc_storeStrong((id *)v2 + 20, v11);
    *((_QWORD *)v2 + 61) = 0;
    v12 = objc_opt_new();
    v13 = (void *)*((_QWORD *)v2 + 60);
    *((_QWORD *)v2 + 60) = v12;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v2 + 21);
    *((_QWORD *)v2 + 21) = v14;

    v16 = dispatch_semaphore_create(1);
    v17 = (void *)*((_QWORD *)v2 + 22);
    *((_QWORD *)v2 + 22) = v16;

    v18 = objc_opt_new();
    v19 = (void *)*((_QWORD *)v2 + 65);
    *((_QWORD *)v2 + 65) = v18;

    v20 = objc_opt_new();
    v21 = (void *)*((_QWORD *)v2 + 18);
    *((_QWORD *)v2 + 18) = v20;

    v22 = dispatch_semaphore_create(1);
    v23 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v22;

    v24 = MEMORY[0x1E0C83FF0];
    v25 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
    *((_OWORD *)v2 + 4) = *MEMORY[0x1E0C83FF0];
    *((_OWORD *)v2 + 5) = v25;
    v26 = *(_OWORD *)(v24 + 48);
    *((_OWORD *)v2 + 6) = *(_OWORD *)(v24 + 32);
    *((_OWORD *)v2 + 7) = v26;
    v27 = dispatch_semaphore_create(1);
    v28 = (void *)*((_QWORD *)v2 + 39);
    *((_QWORD *)v2 + 39) = v27;

    v29 = dispatch_semaphore_create(1);
    v30 = (void *)*((_QWORD *)v2 + 47);
    *((_QWORD *)v2 + 47) = v29;

    *((_BYTE *)v2 + 384) = 0;
    v31 = objc_opt_new();
    v32 = (void *)*((_QWORD *)v2 + 44);
    *((_QWORD *)v2 + 44) = v31;

    if (+[ARQATracer isEnabled](ARQATracer, "isEnabled"))
    {
      v33 = objc_opt_new();
      v34 = (void *)*((_QWORD *)v2 + 64);
      *((_QWORD *)v2 + 64) = v33;

      objc_msgSend(v2, "_addObserver:", *((_QWORD *)v2 + 64));
    }
    *((_BYTE *)v2 + 50) = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.personDetectionTechnique.renderBoundingBoxesIntoCapturedImage"));
    *((_QWORD *)v2 + 27) = 0x4010000000000000;
    +[ARKitUserDefaults numberForKey:](ARKitUserDefaults, "numberForKey:", CFSTR("com.apple.arkit.session.defaultRelocalizationTimeout"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35)
    {
      objc_msgSend(v35, "doubleValue");
      *((_QWORD *)v2 + 27) = v37;
      _ARLogSession_0();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v39 = (objc_class *)objc_opt_class();
        NSStringFromClass(v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)*((_QWORD *)v2 + 27);
        *(_DWORD *)buf = 138543874;
        v81 = v40;
        v82 = 2048;
        v83 = v2;
        v84 = 2048;
        v85 = v41;
        _os_log_impl(&dword_1B3A68000, v38, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Overriding default relocalization timeout: %f", buf, 0x20u);

      }
    }
    *((_QWORD *)v2 + 31) = +[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", CFSTR("com.apple.arkit.session.featurePointAccumulationCount"));
    _ARLogSession_0();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)*((_QWORD *)v2 + 31);
      *(_DWORD *)buf = 138543874;
      v81 = v44;
      v82 = 2048;
      v83 = v2;
      v84 = 2048;
      v85 = v45;
      _os_log_impl(&dword_1B3A68000, v42, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Feature point accumulation set to %ld", buf, 0x20u);

    }
    objc_initWeak(&location, v2);
    v46 = (void *)objc_opt_new();
    objc_msgSend(v46, "setUnderlyingQueue:", v11);
    v47 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __17__ARSession_init__block_invoke;
    handler[3] = &unk_1E6674788;
    objc_copyWeak(&v77, &location);
    notify_register_dispatch("com.apple.system.peakpowerpressurelevel", (int *)v2 + 50, v11, handler);
    objc_msgSend(v2, "_updatePowerPressureLevelWithToken:", v2[50]);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = v47;
    v74[1] = 3221225472;
    v74[2] = __17__ARSession_init__block_invoke_2;
    v74[3] = &unk_1E66747B0;
    objc_copyWeak(&v75, &location);
    objc_msgSend(v48, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0CB3050], 0, v46, v74);
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = (void *)*((_QWORD *)v2 + 23);
    *((_QWORD *)v2 + 23) = v49;

    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_updateThermalState:", v51);

    objc_msgSend(v2, "_updatePowerUsage");
    ARCreateFixedPriorityDispatchQueue("com.apple.arkit.technique.prepare");
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = (void *)*((_QWORD *)v2 + 34);
    *((_QWORD *)v2 + 34) = v52;

    v54 = -[ARTrackedRaycastPostProcessor initWithSession:]([ARTrackedRaycastPostProcessor alloc], "initWithSession:", v2);
    v55 = (void *)*((_QWORD *)v2 + 40);
    *((_QWORD *)v2 + 40) = v54;

    +[ARBKSAccelerometer sharedAccelerometerHandle](ARBKSAccelerometer, "sharedAccelerometerHandle");
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = (void *)*((_QWORD *)v2 + 41);
    *((_QWORD *)v2 + 41) = v56;

    _ARLogSession_0();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      v59 = v10;
      v60 = (objc_class *)objc_opt_class();
      NSStringFromClass(v60);
      v61 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "identifier");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v81 = v61;
      v82 = 2048;
      v83 = v2;
      v84 = 2112;
      v85 = v62;
      _os_log_impl(&dword_1B3A68000, v58, OS_LOG_TYPE_INFO, "%{public}@ <%p>: initialized with identifier %@", buf, 0x20u);

      v10 = v59;
    }

    v63 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 261);
    v64 = (void *)*((_QWORD *)v2 + 45);
    *((_QWORD *)v2 + 45) = v63;

    objc_opt_class();
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_sync_enter(v65);
    v67 = (void *)MEMORY[0x1B5E2DDB0](v66);
    v68 = +[ARSession _runningSessions](ARSession, "_runningSessions");
    objc_msgSend((id)_weakSessions, "addPointer:", v2);
    objc_autoreleasePoolPop(v67);
    objc_sync_exit(v65);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v69 = objc_claimAutoreleasedReturnValue();
    v70 = (void *)*((_QWORD *)v2 + 69);
    *((_QWORD *)v2 + 69) = v69;

    v2[7] = 0;
    *(_QWORD *)(v2 + 97) = 0;
    *((_QWORD *)v2 + 50) = ARCreateCV3DLoggingHandle(+[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", CFSTR("com.apple.arkit.slamManager.cv3dLoggingLevel.api")), +[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", CFSTR("com.apple.arkit.slamManager.cv3dLoggingLevel.internal")));
    v71 = -[ARRecon3DLogger initWithInternalLogging:]([ARRecon3DLogger alloc], "initWithInternalLogging:", 1);
    v72 = (void *)*((_QWORD *)v2 + 51);
    *((_QWORD *)v2 + 51) = v71;

    objc_destroyWeak(&v75);
    objc_destroyWeak(&v77);

    objc_destroyWeak(&location);
  }
  return (ARSession *)v2;
}

void __17__ARSession_init__block_invoke(uint64_t a1, uint64_t a2)
{
  id *v3;
  id WeakRetained;
  id v5;

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updatePowerPressureLevelWithToken:", a2);

  v5 = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "_updatePowerUsage");

}

void __17__ARSession_init__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  id v6;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_updateThermalState:", v5);
  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "_updatePowerUsage");

}

- (void)dealloc
{
  void (**v3)(_QWORD);
  void *v4;
  int peakPowerPressureToken;
  objc_super v6;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __20__ARSession_dealloc__block_invoke;
  v7[3] = &unk_1E6672168;
  v7[4] = self;
  v3 = (void (**)(_QWORD))MEMORY[0x1B5E2DF90](v7, a2);
  if (dispatch_get_specific(&kARSessionStateQueueSpecificKey) == (void *)kARSessionStateQueueSpecificValue)
    v3[2](v3);
  else
    dispatch_sync((dispatch_queue_t)self->_stateQueue, v3);
  if (self->_thermalStateObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self->_thermalStateObserver);

  }
  peakPowerPressureToken = self->_peakPowerPressureToken;
  if (peakPowerPressureToken)
    notify_cancel(peakPowerPressureToken);
  +[ARKitUserDefaults clearUserDefaultsCache](ARKitUserDefaults, "clearUserDefaultsCache");
  CV3DLoggingReleaseHandle();

  v6.receiver = self;
  v6.super_class = (Class)ARSession;
  -[ARSession dealloc](&v6, sel_dealloc);
}

uint64_t __20__ARSession_dealloc__block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if (result)
  {
    _ARLogSession_0();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138543618;
      v8 = v5;
      v9 = 2048;
      v10 = v6;
      _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: ARSession is being deallocated without being paused. Please pause running sessions explicitly.", (uint8_t *)&v7, 0x16u);

    }
    return objc_msgSend(*(id *)(a1 + 32), "_pauseWaitingForOutstandingCallbacks:", 0);
  }
  return result;
}

- (ARFrame)currentFrame
{
  ARFrame *v3;

  kdebug_trace();
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_lastProcessedFrameSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v3 = self->_lastProcessedFrame;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_lastProcessedFrameSemaphore);
  -[ARFrame timestamp](v3, "timestamp");
  kdebug_trace();
  return v3;
}

- (ARConfiguration)configuration
{
  void *v3;
  void *v4;

  kdebug_trace();
  -[ARSession configurationInternal](self, "configurationInternal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  kdebug_trace();
  return (ARConfiguration *)v4;
}

- (void)runWithConfiguration:(ARConfiguration *)configuration
{
  -[ARSession runWithConfiguration:options:](self, "runWithConfiguration:options:", configuration, 0);
}

- (void)runWithConfiguration:(ARConfiguration *)configuration options:(ARSessionRunOptions)options
{
  ARConfiguration *v6;
  NSObject *v7;
  id v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  id v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  NSObject *v16;
  objc_class *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *stateQueue;
  objc_class *v24;
  void *v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  ARSession *v31;
  ARSessionRunOptions v32;
  id v33;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  ARSession *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = configuration;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v7 = _os_activity_create(&dword_1B3A68000, "Running with configuration", (os_activity_t)arkitActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);

  v8 = (id)-[ARConfiguration copy](v6, "copy");
  if (-[ARSession forceAddSceneReconstructionKeyframePointCloudWithColor](self, "forceAddSceneReconstructionKeyframePointCloudWithColor"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      objc_msgSend(v9, "setSceneReconstruction:", objc_msgSend(v9, "sceneReconstruction") | 0x18);
      _ARLogSession_0();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromARSceneReconstruction(objc_msgSend(v9, "sceneReconstruction"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v36 = v12;
        v37 = 2048;
        v38 = self;
        v39 = 2112;
        v40 = v13;
        _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_INFO, "%{public}@ <%p>: SceneReconstruction after enforcing addition of KeyframePointCloudWithColor=%@", buf, 0x20u);

      }
    }
  }
  -[ARSession _sessionRequestedRunWithConfiguration:options:](self, "_sessionRequestedRunWithConfiguration:options:", v8, options);
  kdebug_trace();
  v14 = +[ARSession _supportsConfiguration:](ARSession, "_supportsConfiguration:", v8);
  _ARLogSession_0();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      ARSessionRunOptionsToString(options);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v36 = v18;
      v37 = 2048;
      v38 = self;
      v39 = 2114;
      v40 = v8;
      v41 = 2114;
      v42 = v19;
      _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: begin run with configuration\nConfiguration: %{public}@\nOptions: %{public}@", buf, 0x2Au);

    }
    v20 = (void *)MEMORY[0x1B5E2DDB0]();
    v33 = 0;
    +[ARSession _applySessionOverrides:outError:](ARSession, "_applySessionOverrides:outError:", v8, &v33);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v33;

    objc_autoreleasePoolPop(v20);
    if (v21)
    {
      -[ARSessionMetrics sessionStarted:withConfiguration:](self->_metrics, "sessionStarted:withConfiguration:", self, v21);
      stateQueue = self->_stateQueue;
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __42__ARSession_runWithConfiguration_options___block_invoke;
      v29[3] = &unk_1E6674800;
      v8 = v21;
      v30 = v8;
      v31 = self;
      v32 = options;
      dispatch_async(stateQueue, v29);

    }
    else
    {
      _ARLogSession_0();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v36 = v28;
        v37 = 2048;
        v38 = self;
        v39 = 2112;
        v40 = v22;
        _os_log_impl(&dword_1B3A68000, v26, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to apply overrides to configuration. Error: %@", buf, 0x20u);

      }
      -[ARSession _sessionDidFailWithError:](self, "_sessionDidFailWithError:", v22);
      kdebug_trace();
      v8 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v36 = v25;
      v37 = 2048;
      v38 = self;
      v39 = 2112;
      v40 = v8;
      _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to run the session, configuration is not supported on this device: %@", buf, 0x20u);

    }
    ARErrorWithCodeAndUserInfo(100, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    -[ARSession _sessionDidFailWithError:](self, "_sessionDidFailWithError:", v22);
    kdebug_trace();
  }

  os_activity_scope_leave(&state);
}

void __42__ARSession_runWithConfiguration_options___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  BOOL v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  objc_class *v26;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "isKindOfConfiguration:", objc_opt_class()))
    goto LABEL_4;
  if (+[ARGeoTrackingConfiguration verifyLocationPermissions](ARGeoTrackingConfiguration, "verifyLocationPermissions"))
  {
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 152), 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "anchorsToAdd");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __42__ARSession_runWithConfiguration_options___block_invoke_35;
    v34[3] = &unk_1E66747D8;
    v34[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", v34);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 152));

LABEL_4:
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "configurationInternal");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "initialWorldMap");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6 != 0;

    }
    else
    {
      v7 = 0;
    }
    v8 = v5 ^ 1;
    if (((v5 ^ 1) & 1) == 0 && !v7 && (v3 & 1) != 0 && objc_msgSend(*(id *)(a1 + 40), "relocalizing"))
    {
      v3 &= ~1uLL;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "clearMap");
    }
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 296), "finishedReplaying") & 1) != 0)
    {
      v9 = *(void **)(*(_QWORD *)(a1 + 40) + 296);
      objc_msgSend(*(id *)(a1 + 32), "replaySensor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v9) = v9 != v10;

      v11 = v3 | 3;
      if ((v9 & 1) != 0)
        v3 |= 3uLL;
    }
    else
    {
      v11 = v3 | 3;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v3 = v11;
    }
    _ARLogSession_0();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      ARSessionRunOptionsToString(v3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v36 = v14;
      v37 = 2048;
      v38 = v15;
      v39 = 2112;
      v40 = v16;
      v41 = 2112;
      v42 = v17;
      _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: running with configuration\nConfiguration: %@\nOptions: %@", buf, 0x2Au);

    }
    v18 = objc_msgSend(*(id *)(a1 + 40), "state") == 0;
    v20 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(a1 + 40);
    if (((v18 | v3 | v8) & 1) != 0)
      objc_msgSend(v19, "_updateSessionWithConfiguration:options:", v20, v3);
    else
      objc_msgSend(v19, "_updateSessionStateWithConfiguration:options:", v20, v3);
    if (objc_msgSend(*(id *)(a1 + 40), "state") == 2 && objc_msgSend(*(id *)(a1 + 40), "pausedSensors"))
    {
      _ARLogSession_0();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v36 = v23;
        v37 = 2048;
        v38 = v24;
        v25 = "%{public}@ <%p>: deferring run due to paused sensors";
LABEL_31:
        _os_log_impl(&dword_1B3A68000, v21, OS_LOG_TYPE_DEFAULT, v25, buf, 0x16u);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setState:", 1);
      _ARLogSession_0();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v36 = v23;
        v37 = 2048;
        v38 = v27;
        v25 = "%{public}@ <%p>: running";
        goto LABEL_31;
      }
    }

    kdebug_trace();
    return;
  }
  _ARLogSession_0();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v36 = v30;
    v37 = 2048;
    v38 = v31;
    _os_log_impl(&dword_1B3A68000, v28, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Location permissions not sufficient to run geo tracking.", buf, 0x16u);

  }
  v32 = *(void **)(a1 + 40);
  ARErrorWithCodeAndUserInfo(105, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "_sessionDidFailWithError:", v33);

}

void __42__ARSession_runWithConfiguration_options___block_invoke_35(uint64_t a1, void *a2)
{
  char isKindOfClass;
  void *v4;
  id v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    v5 = v6;
    if ((objc_msgSend(v5, "isAltitudeAvailable") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "_lookupAltitudeForAnchor:", v5);

    v4 = v6;
  }

}

- (void)pause
{
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  NSObject *stateQueue;
  _QWORD block[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  ARSession *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = _os_activity_create(&dword_1B3A68000, "Pausing session", (os_activity_t)arkitActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);

  _ARLogSession_0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = v6;
    v12 = 2048;
    v13 = self;
    _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: begin pause", buf, 0x16u);

  }
  kdebug_trace();
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __18__ARSession_pause__block_invoke;
  block[3] = &unk_1E6672168;
  block[4] = self;
  dispatch_async(stateQueue, block);
  os_activity_scope_leave(&state);
}

uint64_t __18__ARSession_pause__block_invoke(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  objc_class *v7;
  uint64_t v8;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_pauseWaitingForOutstandingCallbacks:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setState:", 0);
    _ARLogSession_0();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = (objc_class *)objc_opt_class();
      NSStringFromClass(v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v10 = 138543618;
      v11 = v4;
      v12 = 2048;
      v13 = v5;
      v6 = "%{public}@ <%p>: paused";
LABEL_6:
      _os_log_impl(&dword_1B3A68000, v2, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, 0x16u);

    }
  }
  else
  {
    _ARLogSession_0();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 138543618;
      v11 = v4;
      v12 = 2048;
      v13 = v8;
      v6 = "%{public}@ <%p>: already paused";
      goto LABEL_6;
    }
  }

  return kdebug_trace();
}

- (void)addAnchor:(ARAnchor *)anchor
{
  ARAnchor *v4;
  void *v5;
  NSObject *stateQueue;
  ARAnchor *v7;
  _QWORD v8[4];
  ARAnchor *v9;
  ARSession *v10;

  v4 = anchor;
  -[ARAnchor identifier](v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ar_integerValue");
  kdebug_trace();

  stateQueue = self->_stateQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __23__ARSession_addAnchor___block_invoke;
  v8[3] = &unk_1E6672118;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(stateQueue, v8);

}

uint64_t __23__ARSession_addAnchor___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  _OWORD v13[4];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  simd_float4x4 v18;
  simd_float4x4 v19;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = *(id *)(a1 + 32);
    if ((objc_msgSend(v2, "isAltitudeAvailable") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "_lookupAltitudeForAnchor:", v2);

  }
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 136), 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "timestamp");
  objc_msgSend(*(id *)(a1 + 32), "setLastUpdateTimestamp:");
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "referenceOriginTransformAvailable"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "referenceOriginTransform");
    v19 = __invert_f4(v18);
    v11 = (float32x4_t)v19.columns[1];
    v12 = (float32x4_t)v19.columns[0];
    v9 = (float32x4_t)v19.columns[3];
    v10 = (float32x4_t)v19.columns[2];
    objc_msgSend(*(id *)(a1 + 32), "transform");
    v3 = 0;
    v13[0] = v4;
    v13[1] = v5;
    v13[2] = v6;
    v13[3] = v7;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    do
    {
      *(__int128 *)((char *)&v14 + v3 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v12, COERCE_FLOAT(v13[v3])), v11, *(float32x2_t *)&v13[v3], 1), v10, (float32x4_t)v13[v3], 2), v9, (float32x4_t)v13[v3], 3);
      ++v3;
    }
    while (v3 != 4);
    objc_msgSend(*(id *)(a1 + 32), "setReferenceTransform:", *(double *)&v14, *(double *)&v15, *(double *)&v16, *(double *)&v17);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 136));
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 152), 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "addAnchor:", *(_QWORD *)(a1 + 32));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 152));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "recordAddedAnchor:", *(_QWORD *)(a1 + 32));
}

- (void)removeAnchor:(ARAnchor *)anchor
{
  ARAnchor *v4;
  void *v5;
  NSObject *stateQueue;
  ARAnchor *v7;
  _QWORD v8[5];
  ARAnchor *v9;

  v4 = anchor;
  -[ARAnchor identifier](v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ar_integerValue");
  kdebug_trace();

  stateQueue = self->_stateQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __26__ARSession_removeAnchor___block_invoke;
  v8[3] = &unk_1E6672118;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(stateQueue, v8);

}

uint64_t __26__ARSession_removeAnchor___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 152), 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "removeAnchor:", *(_QWORD *)(a1 + 40));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 152));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "recordRemovedAnchor:", *(_QWORD *)(a1 + 40));
}

- (void)setWorldOrigin:(simd_float4x4)relativeTransform
{
  NSObject *stateQueue;
  _QWORD v4[4];
  simd_float4x4 v5;
  ARSession *v6;

  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__ARSession_setWorldOrigin___block_invoke;
  v4[3] = &unk_1E6674828;
  v6 = self;
  v5 = relativeTransform;
  dispatch_async(stateQueue, v4);
}

intptr_t __28__ARSession_setWorldOrigin___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  __n128 v12;
  __n128 v13;
  __n128 v14;
  __n128 v15;
  void *v16;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  _OWORD v22[4];
  uint8_t buf[32];
  __int128 v24;
  double v25[3];
  uint64_t v26;
  simd_float4x4 v27;
  simd_float4x4 v28;

  v26 = *MEMORY[0x1E0C80C00];
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 96) + 152), 0xFFFFFFFFFFFFFFFFLL);
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 96) + 136), 0xFFFFFFFFFFFFFFFFLL);
  v2 = *(_QWORD *)(a1 + 96);
  v3 = *(void **)(v2 + 128);
  if (v3)
  {
    objc_msgSend(v3, "sessionOriginTransform");
    v28 = __invert_f4(v27);
    v20 = (float32x4_t)v28.columns[1];
    v21 = (float32x4_t)v28.columns[0];
    v18 = (float32x4_t)v28.columns[3];
    v19 = (float32x4_t)v28.columns[2];
    v2 = *(_QWORD *)(a1 + 96);
  }
  else
  {
    v20 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 16);
    v21 = *(float32x4_t *)MEMORY[0x1E0C83FF0];
    v18 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48);
    v19 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 32);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v2 + 136));
  v4 = 0;
  v5 = *(_OWORD *)(a1 + 48);
  v6 = *(_OWORD *)(a1 + 64);
  v7 = *(_OWORD *)(a1 + 80);
  v22[0] = *(_OWORD *)(a1 + 32);
  v22[1] = v5;
  v22[2] = v6;
  v22[3] = v7;
  memset(buf, 0, sizeof(buf));
  v24 = 0u;
  *(_OWORD *)v25 = 0u;
  do
  {
    *(float32x4_t *)&buf[v4 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(v22[v4])), v20, *(float32x2_t *)&v22[v4], 1), v19, (float32x4_t)v22[v4], 2), v18, (float32x4_t)v22[v4], 3);
    ++v4;
  }
  while (v4 != 4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 96) + 144), "setSessionTransform:", *(double *)buf, *(double *)&buf[16], *(double *)&v24, v25[0]);
  _ARLogSession_0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 96);
    objc_msgSend(*(id *)(v11 + 144), "sessionTransform");
    ARMatrix4x4Description(0, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v16;
    _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: world origin updated %@", buf, 0x20u);

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 96) + 152));
}

+ (void)forceEnvironmentTexturingTechniqueToManualMode:(id)a3
{
  id v4;
  AREnvironmentTexturingTechnique *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = -[AREnvironmentTexturingTechnique initWithOptions:wantsHDREnvironmentTextures:]([AREnvironmentTexturingTechnique alloc], "initWithOptions:wantsHDREnvironmentTextures:", 1, objc_msgSend(v4, "wantsHDREnvironmentTextures"));
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {
      _ARLogSession_0();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543618;
        v10 = v8;
        v11 = 2048;
        v12 = a1;
        _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Forcing environment texturing technique to manual mode", (uint8_t *)&v9, 0x16u);

      }
      objc_msgSend(v4, "reconfigureFrom:", v5);
    }

  }
}

- (void)forceEnvironmentTexturingToManualMode:(BOOL)a3
{
  NSObject *stateQueue;
  _QWORD v4[5];
  BOOL v5;

  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__ARSession_forceEnvironmentTexturingToManualMode___block_invoke;
  v4[3] = &unk_1E6674850;
  v4[4] = self;
  v5 = a3;
  dispatch_async(stateQueue, v4);
}

uint64_t __51__ARSession_forceEnvironmentTexturingToManualMode___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v4;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 32) != v2 && v2 != 0)
  {
    v4 = result;
    result = +[ARSession forceEnvironmentTexturingTechniqueToManualMode:](ARSession, "forceEnvironmentTexturingTechniqueToManualMode:", *(_QWORD *)(v1 + 16));
    LOBYTE(v2) = *(_BYTE *)(v4 + 40);
    v1 = *(_QWORD *)(v4 + 32);
  }
  *(_BYTE *)(v1 + 32) = v2;
  return result;
}

- (void)getCurrentWorldMapWithCompletionHandler:(void *)completionHandler
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = completionHandler;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__ARSession_getCurrentWorldMapWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6672288;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __53__ARSession_getCurrentWorldMapWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  _QWORD block[4];
  id v44;
  _QWORD v45[2];
  _QWORD v46[4];

  v46[2] = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = v2;
  if (v2
    && (objc_msgSend(v2, "mutableOptions"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "slamConfiguration"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("ObjectDetectionMapBuilding")),
        v5,
        v4,
        !v6))
  {
    objc_msgSend(*(id *)(a1 + 32), "currentFrame");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    kdebug_trace();
    v38 = v11;
    if (v11
      && objc_msgSend(v3, "hasQualityKeyframe")
      && (objc_msgSend(v11, "gravityAlignedReferenceOriginTransform"),
          objc_msgSend(v3, "serializeWorldMapWithReferenceOrigin:"),
          (v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v13 = (void *)v12;
      objc_msgSend(v3, "serializeSurfaceData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSurfaceData:", v14);

      objc_msgSend(v11, "anchors");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_55);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "filteredArrayUsingPredicate:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAnchors:", v17);

      v18 = *(void **)(*(_QWORD *)(a1 + 32) + 520);
      v19 = objc_msgSend(v11, "worldMappingStatus");
      objc_msgSend(v13, "rawFeaturePoints");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "recordSaveMap:numberOfFeaturePoints:", v19, objc_msgSend(v20, "count"));

      objc_msgSend(v13, "trackingData", 0);
    }
    else
    {
      v45[0] = *MEMORY[0x1E0CB2D68];
      ARKitCoreBundle();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Not enough features have been recorded to create a world map yet."), &stru_1E6676798, CFSTR("Localizable_iOS"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v22;
      v45[1] = *MEMORY[0x1E0CB2D80];
      ARKitCoreBundle();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Make sure that tracking has initialized and continue to scan the environment."), &stru_1E6676798, CFSTR("Localizable_iOS"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v46[1] = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      ARErrorWithCodeAndUserInfo(400, v25);
      v37 = objc_claimAutoreleasedReturnValue();

      v13 = 0;
      objc_msgSend(0, "trackingData", v37);
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "length");
    objc_msgSend(v13, "surfaceData");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "length");
    objc_msgSend(v13, "rawFeaturePoints");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "count");
    objc_msgSend(v13, "anchors");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "count");
    kdebug_trace();

    v30 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 456);
    v31 = v30;
    if (!v30)
    {
      v31 = MEMORY[0x1E0C80D38];
      v32 = MEMORY[0x1E0C80D38];
    }
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __53__ARSession_getCurrentWorldMapWithCompletionHandler___block_invoke_4;
    v39[3] = &unk_1E6674878;
    v33 = *(id *)(a1 + 40);
    v40 = v13;
    v41 = v36;
    v42 = v33;
    v34 = v36;
    v35 = v13;
    dispatch_async(v31, v39);
    if (!v30)

    v10 = v38;
  }
  else
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 456);
    v8 = v7;
    if (!v7)
    {
      v8 = MEMORY[0x1E0C80D38];
      v9 = MEMORY[0x1E0C80D38];
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__ARSession_getCurrentWorldMapWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E6673928;
    v44 = *(id *)(a1 + 40);
    dispatch_async(v8, block);
    if (!v7)

    v10 = v44;
  }

}

void __53__ARSession_getCurrentWorldMapWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = *MEMORY[0x1E0CB2D68];
  ARKitCoreBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Getting the current world map requires that world tracking is configured."), &stru_1E6676798, CFSTR("Localizable_iOS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = *MEMORY[0x1E0CB2D80];
  ARKitCoreBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Make sure that an ARWorldTrackingConfiguration is being used."), &stru_1E6676798, CFSTR("Localizable_iOS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(a1 + 32);
  ARErrorWithCodeAndUserInfo(303, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

}

uint64_t __53__ARSession_getCurrentWorldMapWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char v3;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = 0;
  }
  else
  {
    objc_opt_class();
    v3 = objc_opt_isKindOfClass() ^ 1;
  }

  return v3 & 1;
}

uint64_t __53__ARSession_getCurrentWorldMapWithCompletionHandler___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)adPipelineParameters
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[ARSession technique](self, "technique");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_3;
  v4 = objc_opt_class();
  -[ARSession technique](self, "technique");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARTechnique techniqueOfClass:inArray:](ARTechnique, "techniqueOfClass:inArray:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_3:
    -[ARSession secondaryTechnique](self, "secondaryTechnique");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_opt_class();
      -[ARSession secondaryTechnique](self, "secondaryTechnique");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[ARTechnique techniqueOfClass:inArray:](ARTechnique, "techniqueOfClass:inArray:", v8, v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v7, "pipelineParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)createReferenceObjectWithTransform:(simd_float4x4)transform center:(simd_float3)center extent:(simd_float3)extent completionHandler:(void *)completionHandler
{
  id v7;
  NSObject *stateQueue;
  id v9;
  _QWORD block[4];
  simd_float4x4 v14;
  simd_float3 v15;
  simd_float3 v16;
  ARSession *v17;
  id v18;

  v7 = completionHandler;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__ARSession_createReferenceObjectWithTransform_center_extent_completionHandler___block_invoke;
  block[3] = &unk_1E66748A0;
  v17 = self;
  v18 = v7;
  v14 = transform;
  v15 = center;
  v16 = extent;
  v9 = v7;
  dispatch_async(stateQueue, block);

}

void __80__ARSession_createReferenceObjectWithTransform_center_extent_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  _QWORD block[4];
  id v32;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 128) + 8);
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "mutableOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "slamConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("ObjectDetectionMapBuilding"));

    if ((v6 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 128), "currentFrame");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      kdebug_trace();
      if (v7)
      {
        objc_msgSend(v7, "gravityAlignedReferenceOriginTransform");
        objc_msgSend(v3, "serializeWorldMapWithReferenceOrigin:");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          objc_msgSend(v8, "extractReferenceObjectWithTransform:center:extent:error:", 0, *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 80), *(double *)(a1 + 96), *(double *)(a1 + 112));
          v10 = objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v11 = (void *)v10;
            v12 = 0;
LABEL_14:
            kdebug_trace();
            v21 = *(NSObject **)(*(_QWORD *)(a1 + 128) + 456);
            v22 = v21;
            if (!v21)
            {
              v22 = MEMORY[0x1E0C80D38];
              v23 = MEMORY[0x1E0C80D38];
            }
            v27[0] = MEMORY[0x1E0C809B0];
            v27[1] = 3221225472;
            v27[2] = __80__ARSession_createReferenceObjectWithTransform_center_extent_completionHandler___block_invoke_3;
            v27[3] = &unk_1E6674878;
            v24 = *(id *)(a1 + 136);
            v29 = v12;
            v30 = v24;
            v28 = v11;
            v25 = v12;
            v26 = v11;
            dispatch_async(v22, v27);
            if (!v21)

            goto LABEL_19;
          }
        }
      }
      else
      {
        v9 = 0;
      }
      v33[0] = *MEMORY[0x1E0CB2D68];
      ARKitCoreBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Not enough features have been recorded to create a reference object at this position."), &stru_1E6676798, CFSTR("Localizable_iOS"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v17;
      v33[1] = *MEMORY[0x1E0CB2D80];
      ARKitCoreBundle();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Make sure the bounds of the object are correct, or scan the object further and try again."), &stru_1E6676798, CFSTR("Localizable_iOS"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v34[1] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      ARErrorWithCodeAndUserInfo(400, v20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = 0;
      goto LABEL_14;
    }
  }
  v13 = *(NSObject **)(*(_QWORD *)(a1 + 128) + 456);
  v14 = v13;
  if (!v13)
  {
    v14 = MEMORY[0x1E0C80D38];
    v15 = MEMORY[0x1E0C80D38];
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__ARSession_createReferenceObjectWithTransform_center_extent_completionHandler___block_invoke_2;
  block[3] = &unk_1E6673928;
  v32 = *(id *)(a1 + 136);
  dispatch_async(v14, block);
  if (!v13)

  v7 = v32;
LABEL_19:

}

void __80__ARSession_createReferenceObjectWithTransform_center_extent_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = *MEMORY[0x1E0CB2D68];
  ARKitCoreBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Creating a reference object requires that object scanning is configured."), &stru_1E6676798, CFSTR("Localizable_iOS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = *MEMORY[0x1E0CB2D80];
  ARKitCoreBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Make sure that an ARObjectScanningConfiguration is being used."), &stru_1E6676798, CFSTR("Localizable_iOS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(a1 + 32);
  ARErrorWithCodeAndUserInfo(303, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

}

uint64_t __80__ARSession_createReferenceObjectWithTransform_center_extent_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_pauseWaitingForOutstandingCallbacks:(BOOL)a3
{
  _BOOL8 v3;
  ARRenderSyncScheduler *resultRequestScheduler;
  ARRenderSyncScheduler *secondaryResultRequestScheduler;
  id v7;
  id pendingHiResFrameCaptureCompletionBlock;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  resultRequestScheduler = self->_resultRequestScheduler;
  self->_resultRequestScheduler = 0;

  secondaryResultRequestScheduler = self->_secondaryResultRequestScheduler;
  self->_secondaryResultRequestScheduler = 0;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_pendingHiResFrameCaptureSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (self->_pendingHiResFrameCaptureCompletionBlock)
  {
    self->_isHiResFrameCaptureInProgress = 0;
    v7 = (id)MEMORY[0x1B5E2DF90]();
    pendingHiResFrameCaptureCompletionBlock = self->_pendingHiResFrameCaptureCompletionBlock;
    self->_pendingHiResFrameCaptureCompletionBlock = 0;

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_pendingHiResFrameCaptureSemaphore);
    if (v7)
    {
      -[ARSession delegateQueue](self, "delegateQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (!v9)
      {
        v10 = MEMORY[0x1E0C80D38];
        v11 = MEMORY[0x1E0C80D38];
      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50__ARSession__pauseWaitingForOutstandingCallbacks___block_invoke;
      block[3] = &unk_1E6673928;
      v7 = v7;
      v13 = v7;
      dispatch_async(v10, block);
      if (!v9)

    }
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_pendingHiResFrameCaptureSemaphore);
    v7 = 0;
  }
  -[ARSessionMetrics sessionStopped](self->_metrics, "sessionStopped");
  -[ARSession _stopAllSensorsWaitingForOutstandingCallbacks:](self, "_stopAllSensorsWaitingForOutstandingCallbacks:", v3);

}

void __50__ARSession__pauseWaitingForOutstandingCallbacks___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  ARKitCoreBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Could not complete high-resolution frame capturing because the session was paused."), &stru_1E6676798, CFSTR("Localizable_iOS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *MEMORY[0x1E0CB2D68];
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  ARErrorWithCodeAndUserInfo(107, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

}

- (BOOL)_shouldUpdateLocationSensorForFusion
{
  return self->_vioFusionEnabled;
}

- (void)setState:(unint64_t)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_state != a3)
  {
    self->_state = a3;
    kdebug_trace();
    if (-[ARSession _shouldUpdateLocationSensorForFusion](self, "_shouldUpdateLocationSensorForFusion"))
      -[ARRemoteLocationSensor updateARSessionState:](self->_locationSensor, "updateARSessionState:", a3);
    -[ARSession _getObservers](self, "_getObservers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    kdebug_trace();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "session:didChangeState:", self, self->_state, (_QWORD)v12);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    kdebug_trace();
  }
}

- (__n128)originTransform
{
  unsigned __int128 v2;
  unsigned __int128 v4;
  simd_float4x4 v5;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 136), 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(*(id *)(a1 + 128), "sessionOriginTransform");
  v4 = (unsigned __int128)__invert_f4(v5);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 136));
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 152), 0xFFFFFFFFFFFFFFFFLL);
  if (objc_msgSend(*(id *)(a1 + 144), "sessionTransformUpdated"))
  {
    objc_msgSend(*(id *)(a1 + 144), "sessionTransform");
    v4 = v2;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 152));
  return (__n128)v4;
}

- (void)setOriginTransform:(__n128)a3
{
  NSObject *v5;
  _QWORD v6[4];
  __n128 v7;
  __n128 v8;
  __n128 v9;
  __n128 v10;
  uint64_t v11;

  v5 = *(NSObject **)(a1 + 160);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__ARSession_setOriginTransform___block_invoke;
  v6[3] = &unk_1E6674828;
  v11 = a1;
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_async(v5, v6);
}

intptr_t __32__ARSession_setOriginTransform___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 96) + 152), 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 96) + 144), "setSessionTransform:", *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 80));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 96) + 152));
}

- (__n128)predictedDeviceTransformAtTimestamp:(uint64_t)a1
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  __n128 v16;
  simd_float4 v17;
  simd_float4 v18;
  simd_float4 v19;
  unint64_t v20;
  unint64_t v21;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  simd_float4 v27;
  simd_float4 v28;
  simd_float4 v29;
  simd_float4 v30;
  simd_float4 v31;
  os_activity_scope_state_s state;
  simd_float4 v33;
  simd_float4 v34;
  simd_float4 v35;
  simd_float4 v36;
  simd_float4 v37;
  simd_float4 v38;
  simd_float4 v39;
  simd_float4 v40;
  simd_float4x4 v41;
  simd_float4x4 v42;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v4 = _os_activity_create(&dword_1B3A68000, "Predicted device transform", (os_activity_t)arkitActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &state);

  kdebug_trace();
  objc_msgSend((id)a1, "technique");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (objc_msgSend((id)a1, "configurationInternal"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "worldAlignment"),
        v6,
        v7 != 2))
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend((id)a1, "configurationInternal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "videoFormat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCameraPosition:", objc_msgSend(v10, "captureDevicePosition"));

    objc_msgSend(v5, "predictedResultDataAtTimestamp:context:", v8, a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 136), 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend((id)a1, "_cameraTransformForResultData:previousFrame:", v11, *(_QWORD *)(a1 + 128));
    v25 = v13;
    v26 = v12;
    v23 = v15;
    v24 = v14;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 136));
    v16 = ARDisplayCenterTransformForCaptureDevicePosition(objc_msgSend(v8, "cameraPosition"));
    v29 = v17;
    v31 = (simd_float4)v16;
    v27 = v19;
    v28 = v18;
    kdebug_trace();
    v41.columns[1] = v29;
    v41.columns[0] = v31;
    v41.columns[3] = v27;
    v41.columns[2] = v28;
    v42 = __invert_f4(v41);
    v20 = 0;
    v33 = v31;
    v34 = v29;
    v35 = v28;
    v36 = v27;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v37 + v20) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v26, COERCE_FLOAT(*(_OWORD *)((char *)&v33 + v20))), v25, *(float32x2_t *)&v33.f32[v20 / 4], 1), v24, *(float32x4_t *)((char *)&v33 + v20), 2), v23, *(float32x4_t *)((char *)&v33 + v20), 3);
      v20 += 16;
    }
    while (v20 != 64);
    v21 = 0;
    v33 = v37;
    v34 = v38;
    v35 = v39;
    v36 = v40;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v37 + v21) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v42.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v33 + v21))), (float32x4_t)v42.columns[1], *(float32x2_t *)&v33.f32[v21 / 4], 1), (float32x4_t)v42.columns[2], *(float32x4_t *)((char *)&v33 + v21), 2), (float32x4_t)v42.columns[3], *(float32x4_t *)((char *)&v33 + v21), 3);
      v21 += 16;
    }
    while (v21 != 64);
    v30 = v37;

  }
  else
  {
    v30 = *(simd_float4 *)MEMORY[0x1E0C83FF0];
  }

  os_activity_scope_leave(&state);
  return (__n128)v30;
}

- (void)_interruptSession
{
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  id v6;
  void *v7;
  os_activity_scope_state_s v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  ARSession *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[ARSession state](self, "state") == 1)
  {
    v8.opaque[0] = 0;
    v8.opaque[1] = 0;
    v3 = _os_activity_create(&dword_1B3A68000, "Session was interrupted", (os_activity_t)arkitActivity, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v3, &v8);

    _ARLogSession_0();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      ARSensorDataTypesToString(-[ARSession pausedSensors](self, "pausedSensors", v8.opaque[0], v8.opaque[1]));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v10 = v6;
      v11 = 2048;
      v12 = self;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: was interrupted: paused sensor type(s) %@", buf, 0x20u);

    }
    -[ARSession _stopSensorsWithDataTypes:keepingDataTypes:](self, "_stopSensorsWithDataTypes:keepingDataTypes:", -[ARSession runningSensors](self, "runningSensors"), -[ARSession pausedSensors](self, "pausedSensors"));
    -[ARSession setState:](self, "setState:", 2);
    os_activity_scope_leave(&v8);
  }
}

- (void)_endInterruption
{
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  os_activity_scope_state_s v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  ARSession *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[ARSession state](self, "state") == 2)
  {
    v8.opaque[0] = 0;
    v8.opaque[1] = 0;
    v3 = _os_activity_create(&dword_1B3A68000, "Session interruption ended", (os_activity_t)arkitActivity, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v3, &v8);

    _ARLogSession_0();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v10 = v6;
      v11 = 2048;
      v12 = self;
      _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: interruption ended", buf, 0x16u);

    }
    -[ARSession configurationInternal](self, "configurationInternal", v8.opaque[0], v8.opaque[1]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARSession _updateSessionWithConfiguration:options:](self, "_updateSessionWithConfiguration:options:", v7, 0);

    -[ARSession setState:](self, "setState:", 1);
    os_activity_scope_leave(&v8);
  }
}

- (void)_updatePowerPressureLevelWithToken:(int)a3
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  objc_class *v11;
  uint64_t state64;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  ARSession *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  if (notify_get_state(a3, &state64))
  {
    self->_peakPowerPressureLevel = 0;
    _ARLogSession_0();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v6;
      v15 = 2048;
      v16 = self;
      v7 = "%{public}@ <%p>: could not read peak power";
      v8 = v4;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 22;
LABEL_6:
      _os_log_impl(&dword_1B3A68000, v8, v9, v7, buf, v10);

    }
  }
  else
  {
    self->_peakPowerPressureLevel = state64;
    _ARLogSession_0();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v6;
      v15 = 2048;
      v16 = self;
      v17 = 2048;
      v18 = state64;
      v7 = "%{public}@ <%p>: peak power level: %llu";
      v8 = v4;
      v9 = OS_LOG_TYPE_INFO;
      v10 = 32;
      goto LABEL_6;
    }
  }

}

- (void)_updateThermalState:(id)a3
{
  int64_t v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int64_t thermalState;
  int v9;
  void *v10;
  __int16 v11;
  ARSession *v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "thermalState");
  self->_thermalState = v4;
  -[ARSessionMetrics sessionUpdateThermalState:](self->_metrics, "sessionUpdateThermalState:", v4);
  _ARLogSession_0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    thermalState = self->_thermalState;
    v9 = 138543874;
    v10 = v7;
    v11 = 2048;
    v12 = self;
    v13 = 2048;
    v14 = thermalState;
    _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: thermal state: %li", (uint8_t *)&v9, 0x20u);

  }
}

- (void)_updatePowerUsage
{
  -[ARSession _updatePowerUsageForced:](self, "_updatePowerUsageForced:", 0);
}

- (void)_updatePowerUsageForced:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = a3;
  v5 = ARPowerUsageForThermalState(self->_thermalState);
  v6 = ARPowerUsageForPowerPressureLevel(self->_peakPowerPressureLevel);
  if (v5 <= v6)
    v7 = v6;
  else
    v7 = v5;
  -[ARSession _changePowerUsage:forced:](self, "_changePowerUsage:forced:", v7, v3);
}

- (void)_changePowerUsage:(unint64_t)a3
{
  -[ARSession _changePowerUsage:forced:](self, "_changePowerUsage:forced:", a3, 0);
}

- (BOOL)_shouldSkipAnchorCreationForData:(id)a3
{
  return 0;
}

- (void)_changePowerUsage:(unint64_t)a3 forced:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  objc_class *v11;
  id v12;
  unint64_t v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  id v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  os_activity_scope_state_s state;
  uint8_t v31[128];
  uint8_t buf[4];
  id v33;
  __int16 v34;
  ARSession *v35;
  __int16 v36;
  unint64_t v37;
  uint64_t v38;

  v4 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  if (-[ARSession powerUsage](self, "powerUsage") != a3 || v4)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v7 = _os_activity_create(&dword_1B3A68000, "Power usage changed", (os_activity_t)arkitActivity, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v7, &state);

    v8 = -[ARSession powerUsage](self, "powerUsage");
    -[ARSession setPowerUsage:](self, "setPowerUsage:", a3);
    if (a3)
    {
      _ARLogSession_0();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v8 <= a3)
      {
        if (v10)
        {
          v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          v17 = (id)objc_claimAutoreleasedReturnValue();
          v18 = -[ARSession powerUsage](self, "powerUsage");
          *(_DWORD *)buf = 138543874;
          v33 = v17;
          v34 = 2048;
          v35 = self;
          v36 = 2048;
          v37 = v18;
          _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Increasing power utilization [%li]", buf, 0x20u);

        }
      }
      else if (v10)
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v13 = -[ARSession powerUsage](self, "powerUsage");
        *(_DWORD *)buf = 138543874;
        v33 = v12;
        v34 = 2048;
        v35 = self;
        v36 = 2048;
        v37 = v13;
        _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Decreasing power utilization [%li]", buf, 0x20u);

      }
    }
    else
    {
      _ARLogSession_0();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v15;
        v34 = 2048;
        v35 = self;
        _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Restoring normal power utilization", buf, 0x16u);

      }
    }

    -[ARSession technique](self, "technique");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPowerUsage:", a3);

    -[ARSession secondaryTechnique](self, "secondaryTechnique");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPowerUsage:", a3);

    kdebug_trace();
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[ARSession availableSensors](self, "availableSensors", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v27;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v27 != v23)
            objc_enumerationMutation(v21);
          v25 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v24);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v25, "setPowerUsage:", a3);
          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v22);
    }

    kdebug_trace();
    os_activity_scope_leave(&state);
  }
}

- (id)_stateQueue
{
  return self->_stateQueue;
}

- (id)_prepareTechniquesQueue
{
  return self->_prepareTechniquesQueue;
}

- (id)_frameContextByConsumingPendingChanges
{
  void *v3;
  void *v4;
  void *v5;
  ARWorldTrackingTechnique *worldTrackingTechnique;
  void *v7;
  void *v8;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_frameContextHandlerSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  -[ARFrameContextHandler createdContextByConsumingPendingChanges](self->_frameContextHandler, "createdContextByConsumingPendingChanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARSession configurationInternal](self, "configurationInternal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWorldAlignment:", objc_msgSend(v4, "worldAlignment"));

  -[ARSession configurationInternal](self, "configurationInternal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFrameDebugOptions:", objc_msgSend(v5, "frameDebugOptions"));

  worldTrackingTechnique = self->_worldTrackingTechnique;
  if (worldTrackingTechnique)
  {
    -[ARWorldTrackingTechnique mutableOptions](worldTrackingTechnique, "mutableOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "initialWorldMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWorldMap:", v8);

  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_frameContextHandlerSemaphore);
  return v3;
}

+ (BOOL)_supportsConfiguration:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  BOOL v6;
  id v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "deviceModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else if ((objc_msgSend((id)objc_opt_class(), "isSupported") & 1) == 0)
  {
    v6 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v3, "userFaceTrackingEnabled"))
    {
      v5 = +[ARWorldTrackingConfiguration supportsUserFaceTracking](ARWorldTrackingConfiguration, "supportsUserFaceTracking");
LABEL_10:
      v6 = v5;
      goto LABEL_13;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "isWorldTrackingEnabled"))
    {
      v5 = +[ARFaceTrackingConfiguration supportsWorldTracking](ARFaceTrackingConfiguration, "supportsWorldTracking");
      goto LABEL_10;
    }
  }
  v6 = 1;
LABEL_13:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v3;
    v8 = v7;
    if (v6)
    {
      v6 = 1;
    }
    else if (objc_msgSend(v7, "supportEnablementOptions"))
    {
      v6 = +[ARGeoTrackingConfiguration isSupportedWithOptions:](ARGeoTrackingConfiguration, "isSupportedWithOptions:", objc_msgSend(v8, "supportEnablementOptions"));
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_lastProcessedFrameSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v6, "appendFormat:", CFSTR(" currentFrame=%p"), self->_lastProcessedFrame);
  -[ARFrame timestamp](self->_lastProcessedFrame, "timestamp");
  objc_msgSend(v6, "appendFormat:", CFSTR(" timestamp=%f"), v7);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_lastProcessedFrameSemaphore);
  -[ARSession configurationInternal](self, "configurationInternal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" configuration=%@"), v8);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (id)_fullDescription
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSUInteger v13;
  NSUInteger v14;
  void *v15;
  void *v16;
  void *v17;
  NSUInteger v18;
  os_unfair_lock_s *p_weakPixelBuffersLock;
  NSPointerArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[ARSession description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_frameContextHandlerSemaphore, 0))
  {
    v6 = CFSTR("Busy");
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_frameContextHandlerSemaphore);
    v6 = CFSTR("NotBusy");
  }
  objc_msgSend(v5, "appendFormat:", CFSTR("nextFrameContextHandler: %@\n"), v6);
  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_lastProcessedFrameSemaphore, 0))
  {
    v7 = CFSTR("Busy");
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_lastProcessedFrameSemaphore);
    v7 = CFSTR("NotBusy");
  }
  objc_msgSend(v5, "appendFormat:", CFSTR("lastProcessedFrame: %@\n"), v7);
  if (self->_relocalizationRequested)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("RelocalizationRequested: %@\n"), v8);
  objc_msgSend(v5, "appendFormat:", CFSTR("RelocalizationTimeoutDate: %@\n"), self->_relocalizationTimeoutDate);
  -[ARSession technique](self, "technique");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_fullDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Technique:\n%@\n"), v10);

  -[ARSession secondaryTechnique](self, "secondaryTechnique");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_fullDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Secondary Technique: \n%@\n"), v12);

  objc_msgSend(v5, "appendFormat:", CFSTR("Sensors:\n"));
  if (-[NSArray count](self->_availableSensors, "count"))
  {
    v13 = 0;
    do
    {
      v14 = v13 + 1;
      -[NSArray objectAtIndexedSubscript:](self->_availableSensors, "objectAtIndexedSubscript:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t\t"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("\t%lu: %@\n"), v14, v17);

      v18 = -[NSArray count](self->_availableSensors, "count");
      v13 = v14;
    }
    while (v14 < v18);
  }
  p_weakPixelBuffersLock = &self->_weakPixelBuffersLock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v5, "appendFormat:", CFSTR("Alive Pixel Buffers: %ld\n"), -[NSPointerArray count](self->_weakPixelBuffers, "count"));
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = self->_weakPixelBuffers;
  v21 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v28;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v20);
        v25 = (__CFString *)CFCopyDescription(*(CFTypeRef *)(*((_QWORD *)&v27 + 1) + 8 * v24));
        objc_msgSend(v5, "appendFormat:", CFSTR("\t| - %@\n"), v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v22);
  }

  os_unfair_lock_unlock(p_weakPixelBuffersLock);
  return v5;
}

+ (id)_fullDescription
{
  void *v2;
  void *v3;
  void *v4;

  +[ARSession _runningSessions](ARSession, "_runningSessions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "count") < 2)
  {
    objc_msgSend(v2, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_fullDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v2, "description");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (NSArray)raycast:(ARRaycastQuery *)query
{
  ARRaycastQuery *v4;
  ARWorldTrackingTechnique *worldTrackingTechnique;
  void *v6;
  void *v7;
  ARQATracer *tracer;

  v4 = query;
  worldTrackingTechnique = self->_worldTrackingTechnique;
  if (worldTrackingTechnique)
  {
    if (self->_tracer)
    {
      -[ARQATracer traceRaycastQuery:](self->_tracer, "traceRaycastQuery:", v4);
      worldTrackingTechnique = self->_worldTrackingTechnique;
    }
    -[ARWorldTrackingTechnique raycast:](worldTrackingTechnique, "raycast:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARSession annotateAnchorToRaycastResults:](self, "annotateAnchorToRaycastResults:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    tracer = self->_tracer;
    if (tracer)
      -[ARQATracer traceRaycastResults:](tracer, "traceRaycastResults:", v7);
    -[ARSessionMetrics recordRaycast:tracked:](self->_metrics, "recordRaycast:tracked:", v4, 0);
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v7;
}

- (ARTrackedRaycast)trackedRaycast:(ARRaycastQuery *)query updateHandler:(void *)updateHandler
{
  ARSessionMetrics *metrics;
  void *v7;
  ARRaycastQuery *v8;
  void *v9;

  metrics = self->_metrics;
  v7 = updateHandler;
  v8 = query;
  -[ARSessionMetrics recordRaycast:tracked:](metrics, "recordRaycast:tracked:", v8, 1);
  -[ARWorldTrackingTechnique trackedRaycast:updateHandler:](self->_worldTrackingTechnique, "trackedRaycast:updateHandler:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (ARTrackedRaycast *)v9;
}

- (id)annotateAnchorToRaycastResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  id v25;
  void *v27;
  void *v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _OWORD v37[4];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;
  simd_float4x4 v44;
  simd_float4x4 v45;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARSession currentFrame](self, "currentFrame");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v28 = v5;
    v27 = v6;
    objc_msgSend(v6, "anchors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ARDictionaryFromAnchors(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v34 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v14, "anchorIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v14, "anchorIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "objectForKeyedSubscript:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            v18 = v17 != 0;
            if (v17)
            {
              objc_msgSend(v14, "setAnchor:", v17);
              objc_msgSend(v17, "transform");
              v45 = __invert_f4(v44);
              v31 = (float32x4_t)v45.columns[1];
              v32 = (float32x4_t)v45.columns[0];
              v29 = (float32x4_t)v45.columns[3];
              v30 = (float32x4_t)v45.columns[2];
              objc_msgSend(v14, "worldTransform");
              v19 = 0;
              v37[0] = v20;
              v37[1] = v21;
              v37[2] = v22;
              v37[3] = v23;
              v38 = 0u;
              v39 = 0u;
              v40 = 0u;
              v41 = 0u;
              do
              {
                *(__int128 *)((char *)&v38 + v19 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v32, COERCE_FLOAT(v37[v19])), v31, *(float32x2_t *)&v37[v19], 1), v30, (float32x4_t)v37[v19], 2), v29, (float32x4_t)v37[v19], 3);
                ++v19;
              }
              while (v19 != 4);
              objc_msgSend(v14, "setLocalTransform:", *(double *)&v38, *(double *)&v39, *(double *)&v40, *(double *)&v41);
            }

          }
          else
          {
            v18 = 0;
          }
          v24 = objc_msgSend(v14, "target");
          if (v18 || v24 == 2)
            objc_msgSend(v28, "addObject:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      }
      while (v11);
    }

    v5 = v28;
    v25 = v28;

    v6 = v27;
  }
  else
  {
    v25 = (id)MEMORY[0x1E0C9AA60];
  }

  return v25;
}

- (void)updateWithCollaborationData:(ARCollaborationData *)collaborationData
{
  ARCollaborationData *v4;
  uint64_t v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  ARSession *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = collaborationData;
  v5 = -[ARCollaborationData vioSessionID](v4, "vioSessionID");
  v6 = -[ARWorldTrackingTechnique vioSessionIdentifier](self->_worldTrackingTechnique, "vioSessionIdentifier");
  _ARLogSession_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5 == v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARSession identifier](self, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v10;
      v19 = 2048;
      v20 = self;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Ignoring collaboration data originating from own session with ID: %@", (uint8_t *)&v17, 0x20u);

    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromARCollaborationData(v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v14;
      v19 = 2048;
      v20 = self;
      v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: updateWithCollaborationData: %@", (uint8_t *)&v17, 0x20u);

    }
    -[ARCollaborationData timestamp](v4, "timestamp");
    -[ARCollaborationData vioDataType](v4, "vioDataType");
    -[ARCollaborationData vioData](v4, "vioData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "length");
    -[ARCollaborationData vioSessionID](v4, "vioSessionID");
    kdebug_trace();

    -[ARWorldTrackingTechnique pushCollaborationData:](self->_worldTrackingTechnique, "pushCollaborationData:", v4);
    -[ARCollaborationData timestamp](v4, "timestamp");
    -[ARCollaborationData vioSessionID](v4, "vioSessionID");
    kdebug_trace();
    -[ARRecordingTechniquePublic recordCollaborationData:localSession:](self->_recordingTechnique, "recordCollaborationData:localSession:", v4, 0);
  }

}

- (id)_getGeoAnchorAltitude:(id)a3
{
  os_unfair_lock_s *p_geoAnchorToAltitudeLock;
  id v5;
  void *v6;
  void *v7;

  p_geoAnchorToAltitudeLock = &self->_geoAnchorToAltitudeLock;
  v5 = a3;
  os_unfair_lock_lock(p_geoAnchorToAltitudeLock);
  -[ARSession geoAnchorToAltitude](self, "geoAnchorToAltitude");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_geoAnchorToAltitudeLock);
  return v7;
}

- (void)_setGeoAnchorAltitude:(id)a3 pair:(id)a4
{
  os_unfair_lock_s *p_geoAnchorToAltitudeLock;
  id v7;
  id v8;
  void *v9;

  p_geoAnchorToAltitudeLock = &self->_geoAnchorToAltitudeLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_geoAnchorToAltitudeLock);
  -[ARSession geoAnchorToAltitude](self, "geoAnchorToAltitude");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v7, v8);

  os_unfair_lock_unlock(p_geoAnchorToAltitudeLock);
}

- (void)_removeGeoAnchorAltitude:(id)a3
{
  os_unfair_lock_s *p_geoAnchorToAltitudeLock;
  id v5;
  void *v6;

  p_geoAnchorToAltitudeLock = &self->_geoAnchorToAltitudeLock;
  v5 = a3;
  os_unfair_lock_lock(p_geoAnchorToAltitudeLock);
  -[ARSession geoAnchorToAltitude](self, "geoAnchorToAltitude");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v5);

  os_unfair_lock_unlock(p_geoAnchorToAltitudeLock);
}

- (void)getGeoLocationForPoint:(simd_float3)position completionHandler:(void *)completionHandler
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  OS_dispatch_queue *delegateQueue;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  OS_dispatch_queue *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  OS_dispatch_queue *v22;
  NSObject *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  _QWORD v28[4];
  __int128 v29;
  __int128 v30;
  id v31;
  _QWORD block[4];
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  id v37;
  _QWORD v38[4];
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  ARSession *v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;
  __int16 v48;
  double v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = completionHandler;
  -[ARSession geoTrackingTechnique](self, "geoTrackingTechnique");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v37 = 0;
    objc_msgSend(v6, "getLocationFromWorldPosition:error:", &v37, *(double *)position.i64);
    v8 = v37;
    if (v8)
    {
      delegateQueue = self->_delegateQueue;
      v10 = delegateQueue;
      if (!delegateQueue)
      {
        v10 = MEMORY[0x1E0C80D38];
        v11 = MEMORY[0x1E0C80D38];
      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__ARSession_getGeoLocationForPoint_completionHandler___block_invoke_2;
      block[3] = &unk_1E66748C8;
      v34 = v5;
      v33 = v8;
      dispatch_async(v10, block);
      if (!delegateQueue)

      v12 = v34;
    }
    else
    {
      v25 = v36;
      v26 = v35;
      _ARLogSession_0();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138545155;
        v41 = v21;
        v42 = 2048;
        v43 = self;
        v44 = 2049;
        v45 = position.f32[0];
        v46 = 2049;
        v47 = position.f32[1];
        v48 = 2049;
        v49 = position.f32[2];
        v50 = 2049;
        v51 = v26;
        v52 = 2049;
        v53 = *((_QWORD *)&v26 + 1);
        v54 = 2049;
        v55 = v25;
        _os_log_impl(&dword_1B3A68000, v19, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Converted to geo location point: %{private}f, %{private}f, %{private}f -> %{private}f, %{private}f, %{private}f", buf, 0x52u);

      }
      v22 = self->_delegateQueue;
      v23 = v22;
      if (!v22)
      {
        v23 = MEMORY[0x1E0C80D38];
        v24 = MEMORY[0x1E0C80D38];
      }
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __54__ARSession_getGeoLocationForPoint_completionHandler___block_invoke_135;
      v28[3] = &unk_1E66748F0;
      v31 = v5;
      v29 = v26;
      v30 = v25;
      dispatch_async(v23, v28);
      if (!v22)

      v12 = v31;
    }

  }
  else
  {
    _ARLogSession_0();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v15;
      v42 = 2048;
      v43 = self;
      _os_log_impl(&dword_1B3A68000, v13, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: ARGeoTrackingConfiguration is not running. Cannot call getGeoLocationForPoint.", buf, 0x16u);

    }
    v16 = self->_delegateQueue;
    v17 = v16;
    if (!v16)
    {
      v17 = MEMORY[0x1E0C80D38];
      v18 = MEMORY[0x1E0C80D38];
    }
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __54__ARSession_getGeoLocationForPoint_completionHandler___block_invoke;
    v38[3] = &unk_1E6673928;
    v39 = v5;
    dispatch_async(v17, v38);
    if (!v16)

    v8 = v39;
  }

}

void __54__ARSession_getGeoLocationForPoint_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0CB2D68];
  ARKitCoreBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Unable to call method as ARGeoTrackingConfiguration is not running."), &stru_1E6676798, CFSTR("Localizable_iOS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ARErrorWithCodeAndUserInfo(501, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*MEMORY[0x1E0C9E500], *(double *)(MEMORY[0x1E0C9E500] + 8), 0.0);
}

uint64_t __54__ARSession_getGeoLocationForPoint_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *MEMORY[0x1E0C9E500], *(double *)(MEMORY[0x1E0C9E500] + 8), 0.0);
}

uint64_t __54__ARSession_getGeoLocationForPoint_completionHandler___block_invoke_135(uint64_t a1)
{
  uint64_t v2;
  CLLocationCoordinate2D v3;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = CLLocationCoordinate2DMake(*(CLLocationDegrees *)(a1 + 32), *(CLLocationDegrees *)(a1 + 40));
  return (*(uint64_t (**)(uint64_t, _QWORD, CLLocationDegrees, CLLocationDegrees, double))(v2 + 16))(v2, 0, v3.latitude, v3.longitude, *(double *)(a1 + 48));
}

- (BOOL)querySceneReconstructionOccupancyWithPoints:(id)a3 callback:(id)a4
{
  id v6;
  void *v7;
  ARWorldTrackingTechnique *worldTrackingTechnique;
  BOOL v9;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = v6;
  worldTrackingTechnique = self->_worldTrackingTechnique;
  if (worldTrackingTechnique)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__ARSession_querySceneReconstructionOccupancyWithPoints_callback___block_invoke;
    v11[3] = &unk_1E6674918;
    v12 = v6;
    v9 = -[ARWorldTrackingTechnique querySceneReconstructionOccupancyWithPoints:callback:](worldTrackingTechnique, "querySceneReconstructionOccupancyWithPoints:callback:", a3, v11);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __66__ARSession_querySceneReconstructionOccupancyWithPoints_callback___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t Width;
  id v4;

  if (a2)
  {
    Width = CV3DReconOccupancyQueryResultGetWidth();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", CV3DReconOccupancyQueryResultGetRawPtr(), Width);
    a2 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (id)a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  CV3DReconOccupancyQueryResultRelease();

}

- (void)_addObserver:(id)a3
{
  NSObject *observersSemaphore;
  id v5;

  observersSemaphore = self->_observersSemaphore;
  v5 = a3;
  dispatch_semaphore_wait(observersSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_observersSemaphore);
}

- (void)_removeObserver:(id)a3
{
  NSObject *observersSemaphore;
  id v5;

  observersSemaphore = self->_observersSemaphore;
  v5 = a3;
  dispatch_semaphore_wait(observersSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_observersSemaphore);
}

- (id)_getObservers
{
  void *v3;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_observersSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_observersSemaphore);
  return v3;
}

- (void)_setPrimaryTechnique:(id)a3
{
  -[ARSession _setPrimaryTechnique:secondaryTechnique:](self, "_setPrimaryTechnique:secondaryTechnique:", a3, 0);
}

- (void)_setPrimaryTechnique:(id)a3 secondaryTechnique:(id)a4
{
  ARRenderSyncScheduler *v6;
  ARRenderSyncScheduler *v7;
  void *v8;
  uint64_t v9;
  ARRenderSyncScheduler *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  ARRenderSyncScheduler *resultRequestScheduler;
  ARRenderSyncScheduler *v15;
  ARRenderSyncScheduler *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  ARRenderSyncScheduler *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  ARRenderSyncScheduler *v24;
  ARRenderSyncScheduler *v25;
  ARRenderSyncScheduler *v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  ARRenderSyncScheduler *v30;
  NSObject *v31;
  objc_class *v32;
  void *v33;
  ARRenderSyncScheduler *secondaryResultRequestScheduler;
  ARRenderSyncScheduler *v35;
  ARRenderSyncScheduler *v36;
  NSObject *v37;
  objc_class *v38;
  void *v39;
  ARRenderSyncScheduler *v40;
  NSObject *v41;
  objc_class *v42;
  void *v43;
  ARRenderSyncScheduler *v44;
  ARRenderSyncScheduler *v45;
  ARRenderSyncScheduler *v46;
  NSObject *v47;
  objc_class *v48;
  void *v49;
  ARRenderSyncScheduler *v50;
  void *v51;
  void *v52;
  ARSession *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  ARRenderSyncScheduler *v65;
  ARRenderSyncScheduler *v66;
  ARRenderSyncScheduler *v67;
  ARRenderSyncScheduler *v68;
  void *v69;
  _QWORD v70[5];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t v75[128];
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  ARSession *v79;
  __int16 v80;
  ARRenderSyncScheduler *v81;
  __int16 v82;
  ARRenderSyncScheduler *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v6 = (ARRenderSyncScheduler *)a3;
  v7 = (ARRenderSyncScheduler *)a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARSession technique](self, "technique");
  v9 = objc_claimAutoreleasedReturnValue();
  -[ARSession secondaryTechnique](self, "secondaryTechnique");
  v10 = (ARRenderSyncScheduler *)objc_claimAutoreleasedReturnValue();
  v68 = (ARRenderSyncScheduler *)v9;
  if ((ARRenderSyncScheduler *)v9 != v6)
  {
    _ARLogSession_0();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v77 = v13;
      v78 = 2048;
      v79 = self;
      v80 = 2048;
      v81 = v68;
      v82 = 2048;
      v83 = v6;
      _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Replacing session primary technique %p with %p", buf, 0x2Au);

    }
    -[ARRenderSyncScheduler setDelegate:](v68, "setDelegate:", 0);
    resultRequestScheduler = self->_resultRequestScheduler;
    if (!resultRequestScheduler)
    {
      v15 = -[ARRenderSyncScheduler initWithExpectedFramesPerSecond:]([ARRenderSyncScheduler alloc], "initWithExpectedFramesPerSecond:", 60);
      v16 = self->_resultRequestScheduler;
      self->_resultRequestScheduler = v15;

      _ARLogSession_0();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = self->_resultRequestScheduler;
        *(_DWORD *)buf = 138543874;
        v77 = v19;
        v78 = 2048;
        v79 = self;
        v80 = 2048;
        v81 = v20;
        _os_log_impl(&dword_1B3A68000, v17, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Creating primary renderSyncScheduler <%p>", buf, 0x20u);

      }
      resultRequestScheduler = self->_resultRequestScheduler;
    }
    -[ARSession setupResultRequestSyncScheduler:forTechnique:](self, "setupResultRequestSyncScheduler:forTechnique:", resultRequestScheduler, v6);
    _ARLogSession_0();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARRenderSyncScheduler inputJitterBufferInterval](self->_resultRequestScheduler, "inputJitterBufferInterval");
      v25 = v24;
      -[ARRenderSyncScheduler vsyncOffset](self->_resultRequestScheduler, "vsyncOffset");
      *(_DWORD *)buf = 138544130;
      v77 = v23;
      v78 = 2048;
      v79 = self;
      v80 = 2048;
      v81 = v25;
      v82 = 2048;
      v83 = v26;
      _os_log_impl(&dword_1B3A68000, v21, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Primary render sync scheduler jitter buffer interval: %f, vsync offset: %f", buf, 0x2Au);

    }
    _ARLogSession_0();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARRenderSyncScheduler bonusLatency](v6, "bonusLatency");
      *(_DWORD *)buf = 138543874;
      v77 = v29;
      v78 = 2048;
      v79 = self;
      v80 = 2048;
      v81 = v30;
      _os_log_impl(&dword_1B3A68000, v27, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Primary technique bonus latency %f", buf, 0x20u);

    }
  }
  objc_msgSend(v8, "addObject:", v6);
  if (v10 != v7)
  {
    _ARLogSession_0();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v77 = v33;
      v78 = 2048;
      v79 = self;
      v80 = 2048;
      v81 = v10;
      v82 = 2048;
      v83 = v7;
      _os_log_impl(&dword_1B3A68000, v31, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Replacing session secondary technique %p with %p", buf, 0x2Au);

    }
    -[ARRenderSyncScheduler setDelegate:](v10, "setDelegate:", 0);
    secondaryResultRequestScheduler = self->_secondaryResultRequestScheduler;
    if (!secondaryResultRequestScheduler)
    {
      v35 = -[ARRenderSyncScheduler initWithExpectedFramesPerSecond:]([ARRenderSyncScheduler alloc], "initWithExpectedFramesPerSecond:", 60);
      v36 = self->_secondaryResultRequestScheduler;
      self->_secondaryResultRequestScheduler = v35;

      _ARLogSession_0();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v38 = (objc_class *)objc_opt_class();
        NSStringFromClass(v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = self->_secondaryResultRequestScheduler;
        *(_DWORD *)buf = 138543874;
        v77 = v39;
        v78 = 2048;
        v79 = self;
        v80 = 2048;
        v81 = v40;
        _os_log_impl(&dword_1B3A68000, v37, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Creating secondary renderSyncScheduler <%p>", buf, 0x20u);

      }
      secondaryResultRequestScheduler = self->_secondaryResultRequestScheduler;
    }
    -[ARSession setupResultRequestSyncScheduler:forTechnique:](self, "setupResultRequestSyncScheduler:forTechnique:", secondaryResultRequestScheduler, v7);
    _ARLogSession_0();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARRenderSyncScheduler inputJitterBufferInterval](self->_secondaryResultRequestScheduler, "inputJitterBufferInterval");
      v45 = v44;
      -[ARRenderSyncScheduler vsyncOffset](self->_secondaryResultRequestScheduler, "vsyncOffset");
      *(_DWORD *)buf = 138544130;
      v77 = v43;
      v78 = 2048;
      v79 = self;
      v80 = 2048;
      v81 = v45;
      v82 = 2048;
      v83 = v46;
      _os_log_impl(&dword_1B3A68000, v41, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Secondary render sync scheduler jitter buffer interval: %f, vsync offset: %f", buf, 0x2Au);

    }
    _ARLogSession_0();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      v48 = (objc_class *)objc_opt_class();
      NSStringFromClass(v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARRenderSyncScheduler bonusLatency](v7, "bonusLatency");
      *(_DWORD *)buf = 138543874;
      v77 = v49;
      v78 = 2048;
      v79 = self;
      v80 = 2048;
      v81 = v50;
      _os_log_impl(&dword_1B3A68000, v47, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Secondary technique bonus latency %f", buf, 0x20u);

    }
  }
  if (v7)
    objc_msgSend(v8, "addObject:", v7);
  -[ARSession setupSessionForTechniques:](self, "setupSessionForTechniques:", v8);
  -[ARSession setTechnique:](self, "setTechnique:", v6);
  -[ARSession setSecondaryTechnique:](self, "setSecondaryTechnique:", v7);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_frameContextHandlerSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  -[ARFrameContextHandler clearInFlightContextsReapplyingChanges](self->_frameContextHandler, "clearInFlightContextsReapplyingChanges");
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_frameContextHandlerSemaphore);
  if (ARDeviceSupportsJasper())
  {
    -[ARSession adPipelineParameters](self, "adPipelineParameters");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "aggregationParameters");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
      -[ARDepthPointCloudCoalescer setAggregationParameters:](self->_depthPointCloudCoalescer, "setAggregationParameters:", v52);

  }
  if (ARLinkedOnOrAfterAzulC())
  {
    v65 = v10;
    v66 = v7;
    v67 = v6;
    v69 = (void *)objc_opt_new();
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v53 = self;
    -[ARSession currentFrame](self, "currentFrame");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "anchors");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
    if (v56)
    {
      v57 = v56;
      v58 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v57; ++i)
        {
          if (*(_QWORD *)v72 != v58)
            objc_enumerationMutation(v55);
          v60 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v70[0] = MEMORY[0x1E0C809B0];
            v70[1] = 3221225472;
            v70[2] = __53__ARSession__setPrimaryTechnique_secondaryTechnique___block_invoke;
            v70[3] = &unk_1E6674940;
            v70[4] = v60;
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v70);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARSession technique](v53, "technique");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "techniqueMatchingPredicate:", v61);
            v63 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v63)
            {
              -[ARSession secondaryTechnique](v53, "secondaryTechnique");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "techniqueMatchingPredicate:", v61);
              v63 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v63)
                objc_msgSend(v69, "addObject:", v60);
            }

          }
        }
        v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
      }
      while (v57);
    }

    if (objc_msgSend(v69, "count"))
    {
      dispatch_semaphore_wait((dispatch_semaphore_t)v53->_frameContextHandlerSemaphore, 0xFFFFFFFFFFFFFFFFLL);
      -[ARFrameContextHandler stopTrackingAnchors:](v53->_frameContextHandler, "stopTrackingAnchors:", v69);
      dispatch_semaphore_signal((dispatch_semaphore_t)v53->_frameContextHandlerSemaphore);
    }

    v7 = v66;
    v6 = v67;
    v10 = v65;
  }

}

uint64_t __53__ARSession__setPrimaryTechnique_secondaryTechnique___block_invoke()
{
  void *v0;

  v0 = (void *)objc_opt_class();
  return objc_msgSend(v0, "producesResultDataForAnchorOfClass:", objc_opt_class());
}

- (void)setupSessionForTechniques:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __objc2_class **v10;
  ARWorldTrackingTechnique *v11;
  void *v12;
  void *v13;
  ARWorldTrackingTechnique *worldTrackingTechnique;
  ARWorldTrackingTechnique **p_worldTrackingTechnique;
  ARWorldTrackingTechnique *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  char v27;
  BOOL v28;
  AREnvironmentTexturingTechnique *v29;
  AREnvironmentTexturingTechnique *environmentTexturingTechnique;
  ARRecordingTechniquePublic *v31;
  ARRecordingTechniquePublic *recordingTechnique;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v39 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v9, "setDelegate:", self);
        objc_msgSend(v9, "setPowerUsage:", -[ARSession powerUsage](self, "powerUsage"));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v6);
  }
  v10 = off_1E666E000;
  +[ARTechnique techniqueOfClass:inArray:](ARTechnique, "techniqueOfClass:inArray:", objc_opt_class(), v4);
  v11 = (ARWorldTrackingTechnique *)objc_claimAutoreleasedReturnValue();
  +[ARTechnique techniqueOfClass:inArray:](ARTechnique, "techniqueOfClass:inArray:", objc_opt_class(), v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
    objc_msgSend(v12, "setMotionManager:", self->_motionManger);
  p_worldTrackingTechnique = &self->_worldTrackingTechnique;
  worldTrackingTechnique = self->_worldTrackingTechnique;
  if (worldTrackingTechnique != v11)
  {
    -[ARWorldTrackingTechnique invalidateAllRaycasts](worldTrackingTechnique, "invalidateAllRaycasts");
    -[ARWorldTrackingTechnique removeObserver:](self->_worldTrackingTechnique, "removeObserver:", self);
  }
  objc_storeStrong((id *)&self->_worldTrackingTechnique, v11);
  v16 = *p_worldTrackingTechnique;
  if (*p_worldTrackingTechnique)
  {
    -[ARWorldTrackingTechnique setTrackedRaycastPostProcessor:](v16, "setTrackedRaycastPostProcessor:", self->_trackedRaycastPostProcessor);
    -[ARWorldTrackingTechnique mutableOptions](self->_worldTrackingTechnique, "mutableOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "slamConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    self->_vioFusionEnabled = objc_msgSend(v18, "isEqualToString:", CFSTR("CoreLocationIntegration"));

    v16 = self->_worldTrackingTechnique;
  }
  -[ARWorldTrackingTechnique addObserver:](v16, "addObserver:", self);
  +[ARTechnique techniqueOfClass:inArray:](ARTechnique, "techniqueOfClass:inArray:", objc_opt_class(), v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARSession setGeoTrackingTechnique:](self, "setGeoTrackingTechnique:", v19);

  +[ARTechnique techniqueOfClass:inArray:](ARTechnique, "techniqueOfClass:inArray:", objc_opt_class(), v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  self->_techniquesWantPredictedPoseForWideCam = v20 != 0;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v21 = v4;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v22)
  {
    v23 = v22;
    v33 = v13;
    v24 = *(_QWORD *)v35;
    while (2)
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v35 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "resultDataClasses");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "containsObject:", objc_opt_class());

        if ((v27 & 1) != 0)
        {
          v28 = 1;
          goto LABEL_24;
        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v23)
        continue;
      break;
    }
    v28 = 0;
LABEL_24:
    v10 = off_1E666E000;
    v13 = v33;
  }
  else
  {
    v28 = 0;
  }

  self->_configuredForWorldTracking = v28;
  -[__objc2_class techniqueOfClass:inArray:](v10[68], "techniqueOfClass:inArray:", objc_opt_class(), v21);
  v29 = (AREnvironmentTexturingTechnique *)objc_claimAutoreleasedReturnValue();
  environmentTexturingTechnique = self->_environmentTexturingTechnique;
  self->_environmentTexturingTechnique = v29;

  -[__objc2_class techniqueOfClass:inArray:](v10[68], "techniqueOfClass:inArray:", objc_opt_class(), v21);
  v31 = (ARRecordingTechniquePublic *)objc_claimAutoreleasedReturnValue();
  recordingTechnique = self->_recordingTechnique;
  self->_recordingTechnique = v31;

}

- (void)setupResultRequestSyncScheduler:(id)a3 forTechnique:(id)a4
{
  id v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  char v17;
  char v18;
  double v19;
  _BOOL4 v20;
  _BOOL4 v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;

  v27 = a4;
  v6 = a3;
  v7 = objc_msgSend(v27, "requiredSensorDataTypes");
  objc_msgSend(v27, "techniqueOfClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "mutableOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageSensorSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "visionDataOutputEnabled");

    objc_msgSend(v9, "mutableOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageSensorSettingsForUltraWide");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "visionDataOutputEnabled");

    v16 = (v12 | v15) ^ 1;
    v17 = v15 ^ 1;
    if ((v7 & 0x10) == 0)
    {
LABEL_3:
      v18 = v16 | v17;
      v19 = 0.005;
      if (!v16)
        v19 = 0.015;
      if ((v18 & 1) == 0)
      {
        v20 = -[ARSession isUserFaceTracking](self, "isUserFaceTracking", v19);
        v19 = 0.035;
        if (!v20)
          v19 = 0.015;
      }
      goto LABEL_12;
    }
  }
  else
  {
    v17 = 1;
    v16 = 1;
    if ((v7 & 0x10) == 0)
      goto LABEL_3;
  }
  v21 = ARHasH10();
  v19 = 0.018;
  if (v21)
    v19 = 0.01;
LABEL_12:
  objc_msgSend(v6, "setInputJitterBufferInterval:", v19);
  objc_msgSend(v6, "inputJitterBufferInterval");
  v23 = v22 * 0.75;
  objc_msgSend(v27, "setBonusLatency:", v22 * 0.75);
  objc_msgSend(v27, "requiredTimeInterval");
  v25 = v24 - v23;
  if (v25 >= 0.0)
    v26 = v25;
  else
    v26 = 0.0;
  objc_msgSend(v6, "setVsyncOffset:", -(ARDispatchAfterLeewayForTimeInterval(v26) + v26 + 0.003));

}

- (void)_updateSessionWithConfiguration:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char isKindOfClass;
  ARReplayConfiguration *v13;
  void *v14;
  ARReplayConfiguration *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  NSObject *v35;
  objc_class *v36;
  void *v37;
  ARParentTechnique *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  NSObject *v46;
  objc_class *v47;
  void *v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  void *v52;
  NSObject *v53;
  _BOOL4 v54;
  objc_class *v55;
  void *v56;
  ARParentTechnique *v57;
  void *v58;
  void *v59;
  objc_class *v60;
  void *v61;
  unint64_t v62;
  void *v63;
  NSObject *v64;
  _BOOL4 v65;
  objc_class *v66;
  void *v67;
  ARParentTechnique *v68;
  void *v69;
  void *v70;
  objc_class *v71;
  void *v72;
  uint64_t v73;
  unint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  ARVideoFormat *v79;
  ARVideoFormat *primaryVideoFormat;
  void *v81;
  uint64_t v82;
  NSObject *prepareTechniquesQueue;
  ARParentTechnique *v84;
  NSObject *v85;
  objc_class *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  _QWORD block[4];
  ARParentTechnique *v93;
  ARParentTechnique *v94;
  BOOL v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _BYTE v104[128];
  _BYTE v105[128];
  _QWORD v106[2];
  uint8_t buf[4];
  void *v108;
  __int16 v109;
  ARSession *v110;
  __int16 v111;
  id v112;
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "techniques");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "secondaryTechniques");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "customSensors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "replaySensor");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v13 = [ARReplayConfiguration alloc];
        objc_msgSend(v6, "replaySensor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[ARReplayConfiguration initWithBaseConfiguration:replaySensor:](v13, "initWithBaseConfiguration:replaySensor:", v6, v14);

        -[ARCustomTechniquesConfiguration techniques](v15, "techniques");
        v16 = objc_claimAutoreleasedReturnValue();

        -[ARReplayConfiguration secondaryTechniques](v15, "secondaryTechniques");
        v17 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v17;
        v7 = (void *)v16;
      }
    }
  }
  v88 = v7;
  v90 = v8;
  if (!v7)
  {
    _ARLogSession_0();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v108 = v37;
      v109 = 2048;
      v110 = self;
      v111 = 2112;
      v112 = v6;
      _os_log_impl(&dword_1B3A68000, v35, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to run the session, configuration is not supported on this device: %@", buf, 0x20u);

    }
    ARErrorWithCodeAndUserInfo(100, 0);
    v38 = (ARParentTechnique *)objc_claimAutoreleasedReturnValue();
    -[ARSession _sessionDidFailWithError:](self, "_sessionDidFailWithError:", v38, 0, v8);
    goto LABEL_65;
  }
  if (self->_forceEnvironmentTexturingToManualMode)
  {
    v18 = (void *)objc_opt_new();
    objc_msgSend(v18, "addObjectsFromArray:", v7, v7, v8);
    objc_msgSend(v18, "addObjectsFromArray:", v8);
    +[ARTechnique techniqueOfClass:inArray:](ARTechnique, "techniqueOfClass:inArray:", objc_opt_class(), v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[ARSession forceEnvironmentTexturingTechniqueToManualMode:](ARSession, "forceEnvironmentTexturingTechniqueToManualMode:", v19);

  }
  if (objc_msgSend(v6, "isKindOfConfiguration:", objc_opt_class()))
  {
    objc_msgSend(v6, "replaySensor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = (void *)objc_opt_new();
      objc_msgSend(v21, "configureForReplay");
      _ARLogSession_0();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v108 = v24;
        v109 = 2048;
        v110 = self;
        v111 = 2048;
        v112 = v21;
        _os_log_impl(&dword_1B3A68000, v22, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Creating location sensor for replay: %p", buf, 0x20u);

      }
      objc_msgSend(v6, "replaySensor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v106[0] = v25;
      v106[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "setCustomSensors:", v26);
    }
  }
  v91 = v6;
  -[ARSession _updateSensorsWithConfiguration:](self, "_updateSensorsWithConfiguration:", v6, v88);
  v102 = 0u;
  v103 = 0u;
  v101 = 0u;
  v100 = 0u;
  v27 = v7;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v100, v105, 16);
  if (v28)
  {
    v29 = v28;
    v30 = 0;
    v31 = *(_QWORD *)v101;
    v32 = 1;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v101 != v31)
          objc_enumerationMutation(v27);
        v34 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
        v32 |= objc_msgSend(v34, "requiredSensorDataTypes");
        v30 |= objc_msgSend(v34, "optionalSensorDataTypes");
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v100, v105, 16);
    }
    while (v29);
  }
  else
  {
    v30 = 0;
    v32 = 1;
  }

  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v39 = v8;
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v97;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v97 != v42)
          objc_enumerationMutation(v39);
        v44 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * j);
        v32 |= objc_msgSend(v44, "requiredSensorDataTypes");
        v30 |= objc_msgSend(v44, "optionalSensorDataTypes");
      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
    }
    while (v41);
  }

  v6 = v91;
  if (objc_msgSend(v91, "isKindOfConfiguration:", objc_opt_class()))
  {
    objc_msgSend(v91, "replaySensor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      _ARLogSession_0();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        v47 = (objc_class *)objc_opt_class();
        NSStringFromClass(v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v108 = v48;
        v109 = 2048;
        v110 = self;
        _os_log_impl(&dword_1B3A68000, v46, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Disabling location data type because of replay.", buf, 0x16u);

      }
      v32 &= ~0x40uLL;
      v30 &= ~0x40uLL;
    }
  }
  v49 = -[ARSession runningSensors](self, "runningSensors");
  v50 = (-[ARSession runningSensors](self, "runningSensors") ^ (v32 | v30)) & v49;
  v51 = -[ARSession runningSensors](self, "runningSensors");
  -[ARSession _stopSensorsWithDataTypes:keepingDataTypes:](self, "_stopSensorsWithDataTypes:keepingDataTypes:", v50, v32 | v30);
  -[ARSession _updateSessionStateWithConfiguration:options:](self, "_updateSessionStateWithConfiguration:options:", v91, a4);
  -[ARSession setConfigurationInternal:](self, "setConfigurationInternal:", v91);
  -[ARSession _sessionWillRunWithConfiguration:](self, "_sessionWillRunWithConfiguration:", v91);
  if (-[ARSession state](self, "state") != 2 || !-[ARSession pausedSensors](self, "pausedSensors"))
  {
    -[ARSession technique](self, "technique");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    _ARLogSession_0();
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG);
    if ((a4 & 1) != 0 || !v52)
    {
      if (v54)
      {
        v60 = (objc_class *)objc_opt_class();
        NSStringFromClass(v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v108 = v61;
        v109 = 2048;
        v110 = self;
        _os_log_impl(&dword_1B3A68000, v53, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Using all new techniques.", buf, 0x16u);

      }
      v57 = -[ARParentTechnique initWithTechniques:delegate:]([ARParentTechnique alloc], "initWithTechniques:delegate:", v27, self);
    }
    else
    {
      if (v54)
      {
        v55 = (objc_class *)objc_opt_class();
        NSStringFromClass(v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v108 = v56;
        v109 = 2048;
        v110 = self;
        _os_log_impl(&dword_1B3A68000, v53, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Re-using existing techniques if possible.", buf, 0x16u);

      }
      v57 = -[ARParentTechnique initWithTechniques:delegate:]([ARParentTechnique alloc], "initWithTechniques:delegate:", v27, self);
      -[ARSession technique](self, "technique");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "techniques");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARParentTechnique reuseTechniques:](v57, "reuseTechniques:", v59);

    }
    v62 = v51 ^ v50;
    if (objc_msgSend(v39, "count"))
    {
      -[ARSession secondaryTechnique](self, "secondaryTechnique");
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      _ARLogSession_0();
      v64 = objc_claimAutoreleasedReturnValue();
      v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG);
      if ((a4 & 1) != 0 || !v63)
      {
        if (v65)
        {
          v71 = (objc_class *)objc_opt_class();
          NSStringFromClass(v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v108 = v72;
          v109 = 2048;
          v110 = self;
          _os_log_impl(&dword_1B3A68000, v64, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Using all new secondary techniques.", buf, 0x16u);

        }
        v68 = -[ARParentTechnique initWithTechniques:delegate:]([ARParentTechnique alloc], "initWithTechniques:delegate:", v39, self);
      }
      else
      {
        if (v65)
        {
          v66 = (objc_class *)objc_opt_class();
          NSStringFromClass(v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v108 = v67;
          v109 = 2048;
          v110 = self;
          _os_log_impl(&dword_1B3A68000, v64, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Re-using existing techniques if possible.", buf, 0x16u);

        }
        v68 = -[ARParentTechnique initWithTechniques:delegate:]([ARParentTechnique alloc], "initWithTechniques:delegate:", v39, self);
        -[ARSession secondaryTechnique](self, "secondaryTechnique");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "techniques");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARParentTechnique reuseTechniques:](v68, "reuseTechniques:", v70);

      }
    }
    else
    {
      v68 = 0;
    }
    v73 = v32 & ~v62;
    v74 = v30 & ~v62;
    -[ARSession _setPrimaryTechnique:secondaryTechnique:](self, "_setPrimaryTechnique:secondaryTechnique:", v57, v68);
    -[ARSession configurationInternal](self, "configurationInternal");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "parentImageSensorSettings");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "settings");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "firstObject");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "videoFormat");
    v79 = (ARVideoFormat *)objc_claimAutoreleasedReturnValue();
    primaryVideoFormat = self->_primaryVideoFormat;
    self->_primaryVideoFormat = v79;

    objc_msgSend(v91, "replaySensor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v81, "replayMode");
    prepareTechniquesQueue = self->_prepareTechniquesQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__ARSession__updateSessionWithConfiguration_options___block_invoke;
    block[3] = &unk_1E6673460;
    v38 = v57;
    v93 = v38;
    v95 = v82 != 0;
    v84 = v68;
    v94 = v84;
    dispatch_async(prepareTechniquesQueue, block);
    if (v81)
      dispatch_sync((dispatch_queue_t)self->_prepareTechniquesQueue, &__block_literal_global_150);
    -[ARRenderSyncScheduler setExcessiveCallbackOptions:](self->_resultRequestScheduler, "setExcessiveCallbackOptions:", v81 != 0);
    -[ARRenderSyncScheduler setExcessiveCallbackOptions:](self->_secondaryResultRequestScheduler, "setExcessiveCallbackOptions:", v81 != 0);
    if (v82 || objc_msgSend(v91, "disableRenderSyncScheduling"))
    {
      -[ARRenderSyncScheduler setSchedulingActive:](self->_resultRequestScheduler, "setSchedulingActive:", 0);
      -[ARRenderSyncScheduler setSchedulingActive:](self->_secondaryResultRequestScheduler, "setSchedulingActive:", 0);
      _ARLogSession_0();
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
      {
        v86 = (objc_class *)objc_opt_class();
        NSStringFromClass(v86);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v108 = v87;
        v109 = 2048;
        v110 = self;
        _os_log_impl(&dword_1B3A68000, v85, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Disabling scheduling for ResultRequestSchedulers", buf, 0x16u);

      }
    }
    -[ARSession _startSensorsWithRequiredDataTypes:optionalDataTypes:](self, "_startSensorsWithRequiredDataTypes:optionalDataTypes:", v73, v74);
    -[ARSession _configureSensorsForRecording](self, "_configureSensorsForRecording");
    -[ARSession _saveGraphFileInFileName:](self, "_saveGraphFileInFileName:", 0);

    v6 = v91;
LABEL_65:

  }
}

uint64_t __53__ARSession__updateSessionWithConfiguration_options___block_invoke(uint64_t a1)
{
  kdebug_trace();
  objc_msgSend(*(id *)(a1 + 32), "prepare:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "prepare:", *(unsigned __int8 *)(a1 + 48));
  return kdebug_trace();
}

- (void)_updateSessionStateWithConfiguration:(id)a3 options:(unint64_t)a4
{
  char v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  NSArray *resultDatasOfSecondaryFrameContexts;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  ARSession *v25;
  _BYTE v26[128];
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_frameContextHandlerSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if ((v4 & 2) != 0)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_lastProcessedFrameSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[ARFrame anchors](self->_lastProcessedFrame, "anchors", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          -[ARFrameContextHandler removeAnchor:](self->_frameContextHandler, "removeAnchor:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v8);
    }

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_lastProcessedFrameSemaphore);
    -[ARFrameContextHandler clearAddedAnchors](self->_frameContextHandler, "clearAddedAnchors");
    _ARLogSession_0();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v13;
      v24 = 2048;
      v25 = self;
      _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Removing existing anchors", buf, 0x16u);

    }
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0)
        goto LABEL_4;
LABEL_17:
      -[ARWorldTrackingTechnique resetSceneReconstruction](self->_worldTrackingTechnique, "resetSceneReconstruction");
      if ((v4 & 1) == 0)
        goto LABEL_21;
      goto LABEL_18;
    }
  }
  else if ((v4 & 4) == 0)
  {
    goto LABEL_3;
  }
  -[ARWorldTrackingTechnique stopAllRaycasts](self->_worldTrackingTechnique, "stopAllRaycasts");
  if ((v4 & 8) != 0)
    goto LABEL_17;
LABEL_4:
  if ((v4 & 1) == 0)
    goto LABEL_21;
LABEL_18:
  -[ARFrameContextHandler resetSessionTransform](self->_frameContextHandler, "resetSessionTransform");
  _ARLogSession_0();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v16;
    v24 = 2048;
    v25 = self;
    _os_log_impl(&dword_1B3A68000, v14, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Reset session transform", buf, 0x16u);

  }
LABEL_21:
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_frameContextHandlerSemaphore);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultDataOfSecondaryFrameContextsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  resultDatasOfSecondaryFrameContexts = self->resultDatasOfSecondaryFrameContexts;
  self->resultDatasOfSecondaryFrameContexts = 0;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultDataOfSecondaryFrameContextsSemaphore);
}

- (BOOL)_exposeInternalDepthData
{
  if (_exposeInternalDepthData_onceToken != -1)
    dispatch_once(&_exposeInternalDepthData_onceToken, &__block_literal_global_151_0);
  return _exposeInternalDepthData_exposeInternalDepthData;
}

void __37__ARSession__exposeInternalDepthData__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  +[ARKitUserDefaults listForKey:](ARKitUserDefaults, "listForKey:", CFSTR("com.apple.arkit.appleDepthSPI.bundleID.approvedList"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", CFSTR("com.apple."));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__ARSession__exposeInternalDepthData__block_invoke_2;
  v6[3] = &unk_1E6674988;
  v7 = v1;
  v3 = v1;
  objc_msgSend(v5, "ar_firstObjectPassingTest:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    _exposeInternalDepthData_exposeInternalDepthData = 1;

}

uint64_t __37__ARSession__exposeInternalDepthData__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", a2);
  *a4 = result;
  return result;
}

- (void)technique:(id)a3 didOutputResultData:(id)a4 timestamp:(double)a5 context:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i1;
  void *v24;
  BOOL v25;
  ARFrameContextHandler *frameContextHandler;
  void *v27;
  uint64_t v28;
  void *v29;
  NSArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  ARFrame *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  objc_class *v43;
  id v44;
  uint64_t v45;
  NSObject *v46;
  objc_class *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t k;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t m;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  float32x4_t v85;
  float32x4_t v86;
  float32x4_t v87;
  float32x4_t v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  simd_float4 v92;
  simd_float4 v93;
  simd_float4 v94;
  simd_float4 v95;
  NSObject *v96;
  objc_class *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  __n128 v101;
  __n128 v102;
  __n128 v103;
  __n128 v104;
  id v105;
  id v106;
  void *v107;
  void *v108;
  ARRemoteLocationSensor *locationSensor;
  void *v110;
  id v111;
  void *v112;
  NSObject *v113;
  objc_class *v114;
  id v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  id v126;
  void *v127;
  void *v128;
  id v129;
  void *v130;
  void *v131;
  void *v132;
  double v133;
  float v134;
  float v135;
  void *v136;
  double v137;
  void *v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  void *v144;
  id v145;
  void *v146;
  id v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  BOOL v155;
  void *v156;
  id v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t nn;
  ARPersonMetadata *v161;
  void *v162;
  _BOOL4 v163;
  _BOOL4 v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  double v170;
  void *v171;
  double v172;
  id v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t n;
  void *v177;
  double v178;
  void *v179;
  void *v180;
  uint64_t v181;
  void *v182;
  uint64_t v183;
  void *v184;
  _BOOL4 v185;
  ARSession *v186;
  void *v187;
  int v188;
  void *v189;
  int v190;
  void *v191;
  BOOL v192;
  void *v193;
  void *v194;
  void *v195;
  uint64_t v196;
  void *v197;
  void *v198;
  uint64_t v199;
  void *v200;
  void *v201;
  void *v202;
  _BOOL4 v203;
  void *v204;
  void *v205;
  void *v206;
  BOOL v207;
  void *v208;
  uint64_t v209;
  int v210;
  void *v211;
  void *v212;
  NSObject *v213;
  objc_class *v214;
  id v215;
  id v216;
  id v217;
  void *v218;
  id v219;
  void *v220;
  id v221;
  ARSession *v222;
  void *v223;
  void *v224;
  BOOL v225;
  ARWorldTrackingTechnique *worldTrackingTechnique;
  void *v227;
  void *v228;
  void *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t ii;
  uint64_t v233;
  void *v234;
  float32x4_t v235;
  float32x4_t v236;
  float32x4_t v237;
  float32x4_t v238;
  uint64_t v239;
  simd_float4 v240;
  simd_float4 v241;
  simd_float4 v242;
  simd_float4 v243;
  void *v244;
  void *v245;
  ARRawSceneUnderstandingData *v246;
  void *v247;
  void *v248;
  uint64_t v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  _BOOL4 v254;
  id v255;
  float32x4_t v256;
  float32x4_t v257;
  float32x4_t v258;
  float32x4_t v259;
  uint64_t v260;
  simd_float4 v261;
  simd_float4 v262;
  simd_float4 v263;
  simd_float4 v264;
  _BOOL4 v265;
  void *v266;
  ARCamera *v267;
  void *v268;
  id v269;
  void *v270;
  void *v271;
  void *v272;
  ARSession *v273;
  BOOL v274;
  void *v275;
  float32x4_t v276;
  float32x4_t v277;
  float32x4_t v278;
  float32x4_t v279;
  double v280;
  double v281;
  double v282;
  void *v283;
  void *v284;
  char isKindOfClass;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  _BOOL4 v295;
  void *v296;
  void *v297;
  BOOL v298;
  double v299;
  _BOOL4 v300;
  int v301;
  NSObject *v302;
  objc_class *v303;
  id v304;
  void *v305;
  ARSession *v306;
  double v307;
  NSDate *v308;
  NSObject *stateQueue;
  NSObject *v310;
  objc_class *v311;
  id v312;
  uint64_t v313;
  NSDate *relocalizationTimeoutDate;
  void *v315;
  id v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t jj;
  void *v320;
  NSObject *v321;
  objc_class *v322;
  id v323;
  void *v324;
  void *v325;
  id v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t kk;
  void *v330;
  NSObject *v331;
  objc_class *v332;
  id v333;
  void *v334;
  void *v335;
  id v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t mm;
  void *v340;
  NSObject *v341;
  objc_class *v342;
  id v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  _BOOL4 v352;
  void *v353;
  int v354;
  void *v355;
  NSObject *v356;
  objc_class *v357;
  id v358;
  uint64_t v359;
  void *v360;
  BOOL v361;
  void *v362;
  float32x4_t v363;
  float32x4_t v364;
  int v365;
  void *v366;
  id obj;
  uint64_t v368;
  int v369;
  double v370;
  float32x4_t v371;
  float32x4_t v372;
  void *v373;
  double v374;
  float32x4_t v375;
  float32x4_t v376;
  _BOOL4 v377;
  double v378;
  float32x4_t v379;
  float32x4_t v380;
  void *v381;
  char v382;
  double v383;
  _BOOL4 v384;
  ARWorldTrackingTechnique *v385;
  uint64_t v386;
  float32x4_t v387;
  double v388;
  void *v389;
  float32x4_t v390;
  double v391;
  void *v392;
  float32x4_t v393;
  double v394;
  void *v395;
  float32x4_t v396;
  double v397;
  float32x4_t v398;
  double v399;
  void *v400;
  void *v401;
  float32x4_t v402;
  double v403;
  void *v404;
  void *v405;
  float32x4_t v406;
  double v407;
  float32x4_t v408;
  double v409;
  void *v410;
  uint64_t location;
  id *locationa;
  void *v413;
  ARSession *v414;
  __int128 v415;
  __int128 v416;
  __int128 v417;
  __int128 v418;
  __int128 v419;
  __int128 v420;
  __int128 v421;
  __int128 v422;
  __int128 v423;
  __int128 v424;
  __int128 v425;
  __int128 v426;
  _QWORD block[5];
  __int128 v428;
  __int128 v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  __int128 v433;
  __int128 v434;
  __int128 v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  __int128 v443;
  __int128 v444;
  __int128 v445;
  __int128 v446;
  __int128 v447;
  __int128 v448;
  __int128 v449;
  __int128 v450;
  __int128 v451;
  __int128 v452;
  __int128 v453;
  __int128 v454;
  __int128 v455;
  __int128 v456;
  __int128 v457;
  __int128 v458;
  __int128 v459;
  simd_float4x4 v460;
  _BYTE v461[128];
  _BYTE v462[128];
  _BYTE v463[128];
  _BYTE v464[128];
  _BYTE v465[128];
  _BYTE v466[128];
  _BYTE v467[128];
  _BYTE v468[128];
  uint8_t buf[32];
  _OWORD v470[2];
  int v471;
  _BYTE v472[128];
  _BYTE v473[128];
  _BYTE v474[128];
  uint64_t v475;
  simd_float4x4 v476;
  simd_float4x4 v477;

  v475 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  obj = a4;
  v11 = a6;
  kdebug_trace();
  kdebug_trace();
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_frameContextHandlerSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v413 = v11;
  -[ARFrameContextHandler markFrameContextProcessed:](self->_frameContextHandler, "markFrameContextProcessed:", v11);
  v414 = self;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_frameContextHandlerSemaphore);
  v456 = 0u;
  v457 = 0u;
  v458 = 0u;
  v459 = 0u;
  v362 = v10;
  objc_msgSend(v10, "splitTechniques");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v456, v474, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v457;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v457 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v456 + 1) + 8 * i), "requestResultDataAtTimestamp:context:", v413, a5);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v456, v474, 16);
    }
    while (v13);
  }

  if (!v413 || (objc_msgSend(v413, "imageData"), (v16 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_23:
    if (v414->resultDatasOfSecondaryFrameContexts)
    {
      dispatch_semaphore_wait((dispatch_semaphore_t)v414->_resultDataOfSecondaryFrameContextsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
      objc_msgSend(obj, "arrayByAddingObjectsFromArray:", v414->resultDatasOfSecondaryFrameContexts);
      v28 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v450 = 0u;
      v451 = 0u;
      v448 = 0u;
      v449 = 0u;
      v30 = v414->resultDatasOfSecondaryFrameContexts;
      v31 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v448, v472, 16);
      if (v31)
      {
        v32 = *(_QWORD *)v449;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v449 != v32)
              objc_enumerationMutation(v30);
            v34 = *(_QWORD *)(*((_QWORD *)&v448 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  continue;
              }
            }
            objc_msgSend(v29, "addObject:", v34);
          }
          v31 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v448, v472, 16);
        }
        while (v31);
      }

      objc_storeStrong((id *)&v414->resultDatasOfSecondaryFrameContexts, v29);
      dispatch_semaphore_signal((dispatch_semaphore_t)v414->_resultDataOfSecondaryFrameContextsSemaphore);

      obj = (id)v28;
    }
    v35 = -[ARFrame initWithTimestamp:context:]([ARFrame alloc], "initWithTimestamp:context:", v413, a5);
    dispatch_semaphore_wait((dispatch_semaphore_t)v414->_lastProcessedFrameSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal((dispatch_semaphore_t)v414->_lastProcessedFrameSemaphore);
    objc_msgSend(v413, "orientationData");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "deviceMotion");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "heading");
    -[ARFrame setRawHeading:](v35, "setRawHeading:");

    objc_msgSend(v413, "locationData");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "location");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARFrame setRawLocation:](v35, "setRawLocation:", v39);

    objc_msgSend(v413, "locationData");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "timestamp");
    -[ARFrame setRawLocationTimestamp:](v35, "setRawLocationTimestamp:");

    objc_msgSend(v413, "locationData");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "undulation");
    -[ARFrame setUndulation:](v35, "setUndulation:");

    if ((v414->_runningSensors & 0x40) != 0)
    {
      _ARLogSession_0();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        v43 = (objc_class *)objc_opt_class();
        NSStringFromClass(v43);
        v44 = (id)objc_claimAutoreleasedReturnValue();
        -[ARFrame rawHeading](v35, "rawHeading");
        *(_DWORD *)buf = 138543875;
        *(_QWORD *)&buf[4] = v44;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v414;
        *(_WORD *)&buf[22] = 2049;
        *(_QWORD *)&buf[24] = v45;
        _os_log_impl(&dword_1B3A68000, v42, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: currentFrame.rawHeading,%{private}f", buf, 0x20u);

      }
      _ARLogSession_0();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        v47 = (objc_class *)objc_opt_class();
        NSStringFromClass(v47);
        v48 = (id)objc_claimAutoreleasedReturnValue();
        -[ARFrame rawLocationTimestamp](v35, "rawLocationTimestamp");
        v50 = v49;
        -[ARFrame rawLocation](v35, "rawLocation");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "coordinate");
        v53 = v52;
        -[ARFrame rawLocation](v35, "rawLocation");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "coordinate");
        v56 = v55;
        -[ARFrame rawLocation](v35, "rawLocation");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "altitudeWgs84");
        v59 = v58;
        -[ARFrame rawLocation](v35, "rawLocation");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "isAltitudeWgs84Available");
        *(_DWORD *)buf = 138544899;
        *(_QWORD *)&buf[4] = v48;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v414;
        *(_WORD *)&buf[22] = 2049;
        *(_QWORD *)&buf[24] = v50;
        LOWORD(v470[0]) = 2049;
        *(_QWORD *)((char *)v470 + 2) = v53;
        WORD5(v470[0]) = 2049;
        *(_QWORD *)((char *)v470 + 12) = v56;
        WORD2(v470[1]) = 2049;
        *(_QWORD *)((char *)&v470[1] + 6) = v59;
        HIWORD(v470[1]) = 1024;
        v471 = v61;
        _os_log_impl(&dword_1B3A68000, v46, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: currentFrame.rawLocation,%{private}lf,%{private}lf,%{private}lf,%{private}lf,%d", buf, 0x44u);

      }
    }
    if (-[ARFrame isHighResolution](v35, "isHighResolution"))
    {
      -[ARSession technique](v414, "technique");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "predictedResultDataAtTimestamp:context:", v413, a5);
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(obj, "arrayByAddingObjectsFromArray:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v64 = obj;
    }
    v446 = 0u;
    v447 = 0u;
    v444 = 0u;
    v445 = 0u;
    obj = v64;
    location = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v444, v468, 16);
    if (location)
    {
      v382 = 0;
      v368 = 0;
      v386 = *(_QWORD *)v445;
      do
      {
        for (k = 0; k != location; ++k)
        {
          if (*(_QWORD *)v445 != v386)
            objc_enumerationMutation(obj);
          v66 = *(void **)(*((_QWORD *)&v444 + 1) + 8 * k);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v66, "cameraTransform");
            v378 = v68;
            v383 = v67;
            v370 = v70;
            v374 = v69;
            -[ARFrame camera](v35, "camera");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "setTransform:", v383, v378, v374, v370);

            v382 = 1;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && v414->_renderPersonBoundingBoxesIntoCapturedImage)
          {
            v442 = 0u;
            v443 = 0u;
            v440 = 0u;
            v441 = 0u;
            objc_msgSend(v66, "detectedObjects");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v440, v467, 16);
            if (v73)
            {
              v74 = *(_QWORD *)v441;
              do
              {
                for (m = 0; m != v73; ++m)
                {
                  if (*(_QWORD *)v441 != v74)
                    objc_enumerationMutation(v72);
                  objc_msgSend(*(id *)(*((_QWORD *)&v440 + 1) + 8 * m), "boundingBox");
                  ARDrawNormalizedCGRectIntoYUVPixelBuffer(-[ARFrame capturedImage](v35, "capturedImage"), 255, v76, v77, v78, v79);
                }
                v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v440, v467, 16);
              }
              while (v73);
            }

          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v66, "worldTrackingState");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = objc_msgSend(v80, "state");
            -[ARFrame camera](v35, "camera");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "setTrackingState:", v81);

            v83 = objc_msgSend(v80, "reason");
            -[ARFrame camera](v35, "camera");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "setTrackingStateReason:", v83);

            -[ARFrame setWorldTrackingState:](v35, "setWorldTrackingState:", v80);
            objc_msgSend(v413, "setDidRelocalize:", objc_msgSend(v80, "majorRelocalization"));
            if (objc_msgSend(v413, "didRelocalize"))
            {
              dispatch_semaphore_wait((dispatch_semaphore_t)v414->_lastProcessedFrameSemaphore, 0xFFFFFFFFFFFFFFFFLL);
              objc_msgSend(v80, "majorRelocalizationCameraTransform");
              v375 = v86;
              v379 = v85;
              v371 = v87;
              v363 = v88;
              -[ARFrame camera](v414->_lastProcessedFrame, "camera");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "transform");
              v477 = __invert_f4(v476);
              v90 = 0;
              v460 = v477;
              memset(buf, 0, sizeof(buf));
              memset(v470, 0, sizeof(v470));
              do
              {
                *(float32x4_t *)&buf[v90 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v379, COERCE_FLOAT(*(_OWORD *)&v460.columns[v90])), v375, *(float32x2_t *)v460.columns[v90].f32, 1), v371, (float32x4_t)v460.columns[v90], 2), v363, (float32x4_t)v460.columns[v90], 3);
                ++v90;
              }
              while (v90 != 4);
              v376 = *(float32x4_t *)&buf[16];
              v380 = *(float32x4_t *)buf;
              v372 = (float32x4_t)v470[0];
              v364 = (float32x4_t)v470[1];
              -[ARFrame referenceOriginTransform](v414->_lastProcessedFrame, "referenceOriginTransform");
              v91 = 0;
              v460.columns[0] = v92;
              v460.columns[1] = v93;
              v460.columns[2] = v94;
              v460.columns[3] = v95;
              memset(buf, 0, sizeof(buf));
              memset(v470, 0, sizeof(v470));
              do
              {
                *(float32x4_t *)&buf[v91 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v380, COERCE_FLOAT(*(_OWORD *)&v460.columns[v91])), v376, *(float32x2_t *)v460.columns[v91].f32, 1), v372, (float32x4_t)v460.columns[v91], 2), v364, (float32x4_t)v460.columns[v91], 3);
                ++v91;
              }
              while (v91 != 4);
              objc_msgSend(v413, "setRelocalizationDeltaTransform:", *(double *)buf, *(double *)&buf[16], *(double *)v470, *(double *)&v470[1]);

              dispatch_semaphore_signal((dispatch_semaphore_t)v414->_lastProcessedFrameSemaphore);
              _ARLogSession_0();
              v96 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
              {
                v97 = (objc_class *)objc_opt_class();
                NSStringFromClass(v97);
                v98 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v80, "lastMajorRelocalizationTimestamp");
                v100 = v99;
                objc_msgSend(v413, "relocalizationDeltaTransform");
                ARMatrix4x4Description(0, v101, v102, v103, v104);
                v105 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                *(_QWORD *)&buf[4] = v98;
                *(_WORD *)&buf[12] = 2048;
                *(_QWORD *)&buf[14] = v414;
                *(_WORD *)&buf[22] = 2048;
                *(_QWORD *)&buf[24] = v100;
                LOWORD(v470[0]) = 2112;
                *(_QWORD *)((char *)v470 + 2) = v105;
                _os_log_impl(&dword_1B3A68000, v96, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Relocalization time stamp: %f, delta transform: %@", buf, 0x2Au);

              }
            }

          }
          if ((objc_msgSend(v413, "frameDebugOptions") & 4) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[ARFrame setWorldTrackingErrorData:](v35, "setWorldTrackingErrorData:", v66);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v106 = v66;
            -[ARFrame setWorldMappingStatus:](v35, "setWorldMappingStatus:", objc_msgSend(v106, "worldMappingStatus"));
            objc_msgSend(v413, "frameDebugOptions");
            objc_msgSend(v106, "lineCloud");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARFrame setWorldTrackingLineCloud:](v35, "setWorldTrackingLineCloud:", v107);

            objc_msgSend(v106, "currentlyActiveVideoFormat");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARFrame setCurrentlyActiveVideoFormat:](v35, "setCurrentlyActiveVideoFormat:", v108);

            if (-[ARSession _shouldUpdateLocationSensorForFusion](v414, "_shouldUpdateLocationSensorForFusion"))
            {
              locationSensor = v414->_locationSensor;
              objc_msgSend(v413, "imageData");
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              -[ARRemoteLocationSensor updateEstimationFromVIOPose:imageData:](locationSensor, "updateEstimationFromVIOPose:imageData:", v106, v110);

            }
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v111 = v66;
            objc_msgSend(v111, "location");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARFrame setLocation:](v35, "setLocation:", v112);

            objc_msgSend(v111, "heading");
            -[ARFrame setHeading:](v35, "setHeading:");
            _ARLogSession_0();
            v113 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG))
            {
              v114 = (objc_class *)objc_opt_class();
              NSStringFromClass(v114);
              v115 = (id)objc_claimAutoreleasedReturnValue();
              -[ARFrame location](v35, "location");
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v116, "coordinate");
              v118 = v117;
              -[ARFrame location](v35, "location");
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v119, "coordinate");
              v121 = v120;
              -[ARFrame location](v35, "location");
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v122, "altitude");
              v124 = v123;
              -[ARFrame heading](v35, "heading");
              *(_DWORD *)buf = 138544643;
              *(_QWORD *)&buf[4] = v115;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v414;
              *(_WORD *)&buf[22] = 2049;
              *(_QWORD *)&buf[24] = v118;
              LOWORD(v470[0]) = 2049;
              *(_QWORD *)((char *)v470 + 2) = v121;
              WORD5(v470[0]) = 2049;
              *(_QWORD *)((char *)v470 + 12) = v124;
              WORD2(v470[1]) = 2049;
              *(_QWORD *)((char *)&v470[1] + 6) = v125;
              _os_log_impl(&dword_1B3A68000, v113, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: currentFrame.lat,lon,alt,heading: %{private}lf,%{private}lf,%{private}lf,%{private}lf", buf, 0x3Eu);

            }
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v126 = v66;
            -[ARFrame setVlState:](v35, "setVlState:", v126);
            objc_msgSend(v126, "trackingStatus");
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARFrame setGeoTrackingStatus:](v35, "setGeoTrackingStatus:", v127);

            objc_msgSend(v126, "fusedReplayLocation");
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARFrame setRawLocation:](v35, "setRawLocation:", v128);

            objc_msgSend(v126, "fusedReplayLocationTimestamp");
            -[ARFrame setRawLocationTimestamp:](v35, "setRawLocationTimestamp:");

          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v129 = v66;
            objc_msgSend(v129, "debugInfo");
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARFrame setVlDebugInfo:](v35, "setVlDebugInfo:", v130);

          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v368 = objc_msgSend(v66, "worldAlignmentModifiers");
            if ((v368 & 1) == 0)
            {
              objc_msgSend(v66, "worldAlignmentTransform");
              -[ARFrame setWorldAlignmentTransform:](v35, "setWorldAlignmentTransform:");
            }
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v66, "lightEstimate");
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARFrame setLightEstimate:](v35, "setLightEstimate:", v131);

            LODWORD(v131) = ARLinkedOnOrAfterCrystal();
            objc_msgSend(v66, "lightEstimate");
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v132, "ambientIntensity");
            if ((_DWORD)v131)
              v134 = v133 / 1000.0;
            else
              v134 = v133;
            v135 = ARMapLightIntensity(v134);
            -[ARFrame camera](v35, "camera");
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            *(float *)&v137 = v135;
            objc_msgSend(v136, "setExposureOffset:", v137);

          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v66, "featurePoints");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARFrame setReferenceFeaturePoints:](v35, "setReferenceFeaturePoints:", v138);

          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v139 = v66;
            if (objc_msgSend(v139, "source") == 1)
              -[ARFrame setSegmentationBuffer:](v35, "setSegmentationBuffer:", objc_msgSend(v139, "segmentationBuffer"));

          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v140 = v66;
            -[ARFrame setDownSampledMattingPixelBuffer:](v35, "setDownSampledMattingPixelBuffer:", objc_msgSend(v140, "downSampledImageBuffer"));
            -[ARFrame setMattingScaleImagePixelBuffer:](v35, "setMattingScaleImagePixelBuffer:", objc_msgSend(v140, "mattingScaleImageBuffer"));

          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v141 = v66;
            -[ARFrame setEstimatedDepthData:](v35, "setEstimatedDepthData:", objc_msgSend(v141, "depthBuffer"));

          }
          if (-[ARSession _exposeInternalDepthData](v414, "_exposeInternalDepthData"))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v142 = v66;
              -[ARFrame setDepthMap:](v35, "setDepthMap:", objc_msgSend(v142, "depthMap"));

            }
          }
          if ((-[ARConfiguration frameSemantics](v414->_configurationInternal, "frameSemantics") & 8) != 0
            && ARDeviceSupportsJasper()
            && objc_msgSend(v66, "isMemberOfClass:", objc_opt_class()))
          {
            v143 = v66;
            v144 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF21B8]), "initWithDepthMap:confidenceMap:", objc_msgSend(v143, "singleFrameDepthBuffer"), objc_msgSend(v143, "confidenceMap"));
            -[ARFrame setSceneDepth:](v35, "setSceneDepth:", v144);
            -[ARFrame setDepthConfidenceData:](v35, "setDepthConfidenceData:", objc_msgSend(v143, "confidenceBuffer"));

          }
          if ((-[ARConfiguration frameSemantics](v414->_configurationInternal, "frameSemantics") & 0x10) != 0
            && ARDeviceSupportsJasper()
            && objc_msgSend(v66, "isMemberOfClass:", objc_opt_class()))
          {
            v145 = v66;
            v146 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF21B8]), "initWithDepthMap:confidenceMap:", objc_msgSend(v145, "depthBuffer"), objc_msgSend(v145, "confidenceMap"));
            -[ARFrame setSmoothedSceneDepth:](v35, "setSmoothedSceneDepth:", v146);
            -[ARFrame setDepthConfidenceData:](v35, "setDepthConfidenceData:", objc_msgSend(v145, "confidenceBuffer"));

          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v147 = v66;
            v148 = (void *)objc_opt_new();
            objc_msgSend(v147, "trackedDetectionResult");
            v149 = (void *)objc_claimAutoreleasedReturnValue();

            if (v149)
            {
              objc_msgSend(v147, "trackedDetectionResult");
              v150 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v148, "addObject:", v150);

            }
            objc_msgSend(v147, "alignedDetectionResult");
            v151 = (void *)objc_claimAutoreleasedReturnValue();

            if (v151)
            {
              objc_msgSend(v147, "alignedDetectionResult");
              v152 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v148, "addObject:", v152);

            }
            objc_msgSend(v148, "ar_map:", &__block_literal_global_183);
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARFrame setDetectedBodies:](v35, "setDetectedBodies:", v153);

          }
        }
        location = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v444, v468, 16);
      }
      while (location);
    }
    else
    {
      v382 = 0;
      v368 = 0;
    }

    objc_msgSend(obj, "ar_filter:", &__block_literal_global_187_1);
    v381 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v381, "count"))
      -[ARSession _sessionDidUpdateSpatialMappingPointClouds:](v414, "_sessionDidUpdateSpatialMappingPointClouds:", v381);
    -[ARSession configurationInternal](v414, "configurationInternal");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v154, "isPersonMetadataEnabled")
      && -[ARFrame segmentationBuffer](v35, "segmentationBuffer"))
    {
      v155 = -[ARFrame estimatedDepthData](v35, "estimatedDepthData") == 0;

      if (v155)
      {
LABEL_143:
        if (ARInternalOSBuild() && (objc_msgSend(v413, "frameDebugOptions") & 2) != 0)
          -[ARFrame setResultDatas:](v35, "setResultDatas:", obj);
        -[ARFrame camera](v35, "camera");
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        v163 = objc_msgSend(v162, "trackingState") == 0;

        if (v163)
        {
          if ((v382 & 1) != 0 || objc_msgSend(v413, "worldAlignment") == 2)
          {
            v164 = !v414->_configuredForWorldTracking;
            -[ARFrame camera](v35, "camera");
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            v166 = v165;
            if (v164)
            {
              objc_msgSend(v165, "setTrackingState:", 2);
            }
            else
            {
              objc_msgSend(v165, "setTrackingState:", 1);

              -[ARFrame camera](v35, "camera");
              v166 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v166, "setTrackingStateReason:", 1);
            }
          }
          else
          {
            if ((-[ARSession runningSensors](v414, "runningSensors") & 8) != 0)
              goto LABEL_155;
            -[ARFrame camera](v35, "camera");
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v166, "setTrackingState:", 2);
          }

        }
LABEL_155:
        if ((objc_msgSend(v413, "frameDebugOptions") & 1) != 0)
        {
          v167 = (void *)objc_opt_new();
          objc_msgSend(v413, "imageData");
          v168 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v168, "captureDate");
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v169, "timeIntervalSinceNow");
          objc_msgSend(v167, "setVideoLatency:", -v170);

          objc_msgSend(v413, "imageData");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v171, "timestamp");
          objc_msgSend(v167, "addTimestamp:forDataOfClass:", objc_opt_class(), v172);

          v434 = 0u;
          v435 = 0u;
          v432 = 0u;
          v433 = 0u;
          v173 = obj;
          v174 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v432, v465, 16);
          if (v174)
          {
            v175 = *(_QWORD *)v433;
            do
            {
              for (n = 0; n != v174; ++n)
              {
                if (*(_QWORD *)v433 != v175)
                  objc_enumerationMutation(v173);
                v177 = *(void **)(*((_QWORD *)&v432 + 1) + 8 * n);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  objc_msgSend(v177, "timestamp");
                  objc_msgSend(v167, "addTimestamp:forDataOfClass:", objc_opt_class(), v178);
                }
              }
              v174 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v432, v465, 16);
            }
            while (v174);
          }

          -[ARFrame setTimingData:](v35, "setTimingData:", v167);
        }
        if (-[ARSession powerUsage](v414, "powerUsage"))
        {
          -[ARFrame setShouldRestrictFrameRate:](v35, "setShouldRestrictFrameRate:", 1);
        }
        else
        {
          -[ARFrame setShouldRestrictFrameRate:](v35, "setShouldRestrictFrameRate:", 0);
          -[ARSession configurationInternal](v414, "configurationInternal");
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v179, "videoFormat");
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          v181 = objc_msgSend(v180, "framesPerSecond");

          -[ARFrame setRenderFramesPerSecond:](v35, "setRenderFramesPerSecond:", (uint64_t)fmax((double)v181, 60.0));
        }
        dispatch_semaphore_wait((dispatch_semaphore_t)v414->_lastProcessedFrameSemaphore, 0xFFFFFFFFFFFFFFFFLL);
        -[ARFrame camera](v35, "camera");
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        v183 = objc_msgSend(v182, "trackingStateReason");
        v384 = v183 == 4;
        if (v183 == 4)
        {
          -[ARFrame camera](v35, "camera");
          v184 = (void *)objc_claimAutoreleasedReturnValue();
          v185 = objc_msgSend(v184, "trackingState") == 1;

          if (!v185)
          {
            v384 = 0;
LABEL_176:
            v186 = v414;
LABEL_177:
            -[ARSession technique](v186, "technique");
            v187 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v187, "techniqueOfClass:", objc_opt_class());
            v373 = (void *)objc_claimAutoreleasedReturnValue();

            if (v373)
              v188 = objc_msgSend(v373, "finishedLoadingImages") ^ 1;
            else
              v188 = 0;
            -[ARSession technique](v414, "technique");
            v189 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v189, "techniqueOfClass:", objc_opt_class());
            v366 = (void *)objc_claimAutoreleasedReturnValue();

            if (v366)
              v190 = objc_msgSend(v366, "finishedLoadingObjects") ^ 1;
            else
              v190 = 0;
            if ((v188 | v190) == 1)
            {
              -[ARFrame camera](v35, "camera");
              v191 = (void *)objc_claimAutoreleasedReturnValue();
              v192 = objc_msgSend(v191, "trackingState") == 0;

              if (!v192)
              {
                -[ARFrame camera](v35, "camera");
                v193 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v193, "setTrackingState:", 1);

                -[ARFrame camera](v35, "camera");
                v194 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v194, "setTrackingStateReason:", 1);

              }
            }
            locationa = (id *)&v414->_lastProcessedFrame;
            -[ARFrame camera](v414->_lastProcessedFrame, "camera");
            v195 = (void *)objc_claimAutoreleasedReturnValue();
            v196 = objc_msgSend(v195, "trackingState");
            -[ARFrame camera](v35, "camera");
            v197 = (void *)objc_claimAutoreleasedReturnValue();
            if (v196 == objc_msgSend(v197, "trackingState"))
            {
              objc_msgSend(*locationa, "camera");
              v198 = (void *)objc_claimAutoreleasedReturnValue();
              v199 = objc_msgSend(v198, "trackingStateReason");
              -[ARFrame camera](v35, "camera");
              v200 = (void *)objc_claimAutoreleasedReturnValue();
              v377 = v199 != objc_msgSend(v200, "trackingStateReason");

            }
            else
            {
              v377 = 1;
            }

            -[ARSession geoTrackingTechnique](v414, "geoTrackingTechnique");
            v201 = (void *)objc_claimAutoreleasedReturnValue();
            if (v201)
            {
              -[ARFrame geoTrackingStatus](v35, "geoTrackingStatus");
              v202 = (void *)objc_claimAutoreleasedReturnValue();
              v203 = v202 == 0;

              if (v203)
              {
                +[ARGeoTrackingStatus initialStatus](ARGeoTrackingStatus, "initialStatus");
                v204 = (void *)objc_claimAutoreleasedReturnValue();
                -[ARFrame setGeoTrackingStatus:](v35, "setGeoTrackingStatus:", v204);

              }
            }
            -[ARFrame geoTrackingStatus](v35, "geoTrackingStatus");
            v205 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v205)
            {
              v365 = 0;
              goto LABEL_201;
            }
            objc_msgSend(*locationa, "geoTrackingStatus");
            v206 = (void *)objc_claimAutoreleasedReturnValue();
            v207 = v206 == 0;

            if (v207)
            {
              v365 = 1;
            }
            else
            {
              -[ARFrame geoTrackingStatus](v35, "geoTrackingStatus");
              v208 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*locationa, "geoTrackingStatus");
              v209 = objc_claimAutoreleasedReturnValue();
              v210 = objc_msgSend(v208, "isEqual:", v209);

              -[ARFrame geoTrackingStatus](v35, "geoTrackingStatus");
              v211 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*locationa, "geoTrackingStatus");
              v212 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v209) = objc_msgSend(v211, "isEqualPrivate:", v212);

              v365 = v210 ^ 1;
              if ((v209 & 1) != 0)
                goto LABEL_201;
            }
            _ARLogSession_0();
            v213 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v213, OS_LOG_TYPE_INFO))
            {
              v214 = (objc_class *)objc_opt_class();
              NSStringFromClass(v214);
              v215 = (id)objc_claimAutoreleasedReturnValue();
              -[ARFrame geoTrackingStatus](v35, "geoTrackingStatus");
              v405 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromARGeoTrackingState(objc_msgSend(v405, "state"));
              v216 = (id)objc_claimAutoreleasedReturnValue();
              -[ARFrame geoTrackingStatus](v35, "geoTrackingStatus");
              v401 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromARGeoTrackingStateReason(objc_msgSend(v401, "stateReason"));
              v217 = (id)objc_claimAutoreleasedReturnValue();
              -[ARFrame geoTrackingStatus](v35, "geoTrackingStatus");
              v218 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromARGeoTrackingAccuracy(objc_msgSend(v218, "accuracy"));
              v219 = (id)objc_claimAutoreleasedReturnValue();
              -[ARFrame geoTrackingStatus](v35, "geoTrackingStatus");
              v220 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromARGeoTrackingInternalFailureReason(objc_msgSend(v220, "failureReasons"));
              v221 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544642;
              *(_QWORD *)&buf[4] = v215;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v414;
              *(_WORD *)&buf[22] = 2112;
              *(_QWORD *)&buf[24] = v216;
              LOWORD(v470[0]) = 2112;
              *(_QWORD *)((char *)v470 + 2) = v217;
              WORD5(v470[0]) = 2112;
              *(_QWORD *)((char *)v470 + 12) = v219;
              WORD2(v470[1]) = 2112;
              *(_QWORD *)((char *)&v470[1] + 6) = v221;
              _os_log_impl(&dword_1B3A68000, v213, OS_LOG_TYPE_INFO, "%{public}@ <%p>: GeoTrackingStatus changed: (%@), reason: (%@), accuracy: (%@), internal: (%@)", buf, 0x3Eu);

            }
LABEL_201:
            v222 = v414;
            if (objc_msgSend(v413, "didRelocalize"))
            {
              os_unfair_lock_lock(&v414->_worldMapSurfaceDataLock);
              objc_msgSend(v413, "worldMap");
              v223 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v223, "surfaceData");
              v224 = (void *)objc_claimAutoreleasedReturnValue();
              if (v224)
              {
                v225 = -[ARWorldTrackingTechnique hasLoadedSurfaceData](v414->_worldTrackingTechnique, "hasLoadedSurfaceData");

                v222 = v414;
                if (!v225)
                {
                  -[ARFrame timestamp](v35, "timestamp");
                  kdebug_trace();
                  worldTrackingTechnique = v414->_worldTrackingTechnique;
                  objc_msgSend(v413, "worldMap");
                  v227 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v227, "surfaceData");
                  v228 = (void *)objc_claimAutoreleasedReturnValue();
                  -[ARWorldTrackingTechnique loadSurfaceData:](worldTrackingTechnique, "loadSurfaceData:", v228);

                  dispatch_semaphore_wait((dispatch_semaphore_t)v414->_frameContextHandlerSemaphore, 0xFFFFFFFFFFFFFFFFLL);
                  v428 = 0u;
                  v429 = 0u;
                  v430 = 0u;
                  v431 = 0u;
                  -[ARFrame anchors](v35, "anchors");
                  v229 = (void *)objc_claimAutoreleasedReturnValue();
                  v230 = objc_msgSend(v229, "countByEnumeratingWithState:objects:count:", &v428, v464, 16);
                  if (v230)
                  {
                    v231 = *(_QWORD *)v429;
                    do
                    {
                      for (ii = 0; ii != v230; ++ii)
                      {
                        if (*(_QWORD *)v429 != v231)
                          objc_enumerationMutation(v229);
                        v233 = *(_QWORD *)(*((_QWORD *)&v428 + 1) + 8 * ii);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                          -[ARFrameContextHandler removeAnchor:](v414->_frameContextHandler, "removeAnchor:", v233);
                      }
                      v230 = objc_msgSend(v229, "countByEnumeratingWithState:objects:count:", &v428, v464, 16);
                    }
                    while (v230);
                  }

                  v222 = v414;
                  dispatch_semaphore_signal((dispatch_semaphore_t)v414->_frameContextHandlerSemaphore);
                  -[ARFrame timestamp](v35, "timestamp");
                  kdebug_trace();
                }
              }
              else
              {

                v222 = v414;
              }
              os_unfair_lock_unlock(&v414->_worldMapSurfaceDataLock);
            }
            -[ARSession _updateOriginTransformForFrame:previousFrame:modifiers:context:](v222, "_updateOriginTransformForFrame:previousFrame:modifiers:context:", v35, v222->_lastProcessedFrame, v368, v413);
            if (-[ARFrame referenceOriginTransformAvailable](v35, "referenceOriginTransformAvailable"))
            {
              if (objc_msgSend(v413, "worldAlignment") == 2)
              {
                -[ARFrame camera](v35, "camera");
                v234 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v234, "setTransform:", *MEMORY[0x1E0C83FF0], *(double *)(MEMORY[0x1E0C83FF0] + 16), *(double *)(MEMORY[0x1E0C83FF0] + 32), *(double *)(MEMORY[0x1E0C83FF0] + 48));
              }
              else
              {
                -[ARFrame referenceOriginTransform](v35, "referenceOriginTransform");
                v402 = v236;
                v406 = v235;
                v393 = v238;
                v396 = v237;
                -[ARFrame camera](v35, "camera");
                v234 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v234, "transform");
                v239 = 0;
                v460.columns[0] = v240;
                v460.columns[1] = v241;
                v460.columns[2] = v242;
                v460.columns[3] = v243;
                memset(buf, 0, sizeof(buf));
                memset(v470, 0, sizeof(v470));
                do
                {
                  *(float32x4_t *)&buf[v239 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v406, COERCE_FLOAT(*(_OWORD *)&v460.columns[v239])), v402, *(float32x2_t *)v460.columns[v239].f32, 1), v396, (float32x4_t)v460.columns[v239], 2), v393, (float32x4_t)v460.columns[v239], 3);
                  ++v239;
                }
                while (v239 != 4);
                v403 = *(double *)&buf[16];
                v407 = *(double *)buf;
                v394 = *(double *)&v470[1];
                v397 = *(double *)v470;
                -[ARFrame camera](v35, "camera");
                v244 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v244, "setTransform:", v407, v403, v397, v394);

              }
              if (v414->_worldTrackingTechnique)
              {
                -[ARFrame referenceOriginTransform](v35, "referenceOriginTransform");
                -[ARWorldTrackingTechnique setReferenceOriginTransform:](v414->_worldTrackingTechnique, "setReferenceOriginTransform:");
              }
            }
            objc_msgSend(obj, "ar_firstObjectPassingTest:", &__block_literal_global_201);
            v395 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v395, "resultDataOfClass:", objc_opt_class());
            v245 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v245, "ar_firstObjectPassingTest:", &__block_literal_global_204);
            v404 = (void *)objc_claimAutoreleasedReturnValue();

            if (v404)
            {
              v246 = objc_alloc_init(ARRawSceneUnderstandingData);
              if (objc_msgSend(v404, "segmentationBuffer"))
              {
                -[ARRawSceneUnderstandingData setSemanticSegmentationBuffer:](v246, "setSemanticSegmentationBuffer:", objc_msgSend(v404, "segmentationBuffer"));
                -[ARRawSceneUnderstandingData setSemanticSegmentationBufferSampledForDepth:](v246, "setSemanticSegmentationBufferSampledForDepth:", objc_msgSend(v404, "semanticsSampledForDepth"));
                -[ARRawSceneUnderstandingData setSemanticSegmentationConfidenceBuffer:](v246, "setSemanticSegmentationConfidenceBuffer:", objc_msgSend(v404, "confidenceBuffer"));
                -[ARRawSceneUnderstandingData setSemanticSegmentationConfidenceBufferSampledForDepth:](v246, "setSemanticSegmentationConfidenceBufferSampledForDepth:", objc_msgSend(v404, "confidenceSampledForDepth"));
                -[ARRawSceneUnderstandingData setSemanticSegmentationUncertaintyBuffer:](v246, "setSemanticSegmentationUncertaintyBuffer:", objc_msgSend(v404, "uncertaintyBuffer"));
              }
              objc_msgSend(v395, "resultDataOfClass:", objc_opt_class());
              v247 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v247, "ar_firstObjectPassingTest:", &__block_literal_global_208);
              v248 = (void *)objc_claimAutoreleasedReturnValue();

              if (v248)
              {
                -[ARRawSceneUnderstandingData setDepthBuffer:](v246, "setDepthBuffer:", objc_msgSend(v248, "singleFrameDepthBuffer"));
                -[ARRawSceneUnderstandingData setDepthConfidenceBuffer:](v246, "setDepthConfidenceBuffer:", objc_msgSend(v248, "singleFrameConfidenceBuffer"));
              }
              if (ARDeviceSupportsJasper())
                v249 = objc_msgSend(v248, "normalsBuffer");
              else
                v249 = objc_msgSend(v404, "normalsBuffer");
              -[ARRawSceneUnderstandingData setNormalsBuffer:](v246, "setNormalsBuffer:", v249);
              objc_msgSend(v395, "resultDataOfClass:", objc_opt_class());
              v250 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v250, "firstObject");
              v251 = (void *)objc_claimAutoreleasedReturnValue();

              if (v251)
              {
                objc_msgSend(v251, "timestamp");
                -[ARRawSceneUnderstandingData setTimestamp:](v246, "setTimestamp:");
                -[ARRawSceneUnderstandingData setCapturedImage:](v246, "setCapturedImage:", objc_msgSend(v251, "pixelBuffer"));
              }
              objc_msgSend(v395, "resultDataOfClass:", objc_opt_class());
              v252 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v252, "firstObject");
              v253 = (void *)objc_claimAutoreleasedReturnValue();

              if (v253)
                v254 = v251 != 0;
              else
                v254 = 0;
              if (v254)
              {
                v255 = -[ARCamera initFromImageData:]([ARCamera alloc], "initFromImageData:", v251);
                -[ARFrame referenceOriginTransform](v35, "referenceOriginTransform");
                v408 = v256;
                v398 = v257;
                v387 = v259;
                v390 = v258;
                objc_msgSend(v253, "cameraTransform");
                v260 = 0;
                v460.columns[0] = v261;
                v460.columns[1] = v262;
                v460.columns[2] = v263;
                v460.columns[3] = v264;
                memset(buf, 0, sizeof(buf));
                memset(v470, 0, sizeof(v470));
                do
                {
                  *(float32x4_t *)&buf[v260 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v408, COERCE_FLOAT(*(_OWORD *)&v460.columns[v260])), v398, *(float32x2_t *)v460.columns[v260].f32, 1), v390, (float32x4_t)v460.columns[v260], 2), v387, (float32x4_t)v460.columns[v260], 3);
                  ++v260;
                }
                while (v260 != 4);
                objc_msgSend(v255, "setTransform:", *(double *)buf, *(double *)&buf[16], *(double *)v470, *(double *)&v470[1]);
                -[ARRawSceneUnderstandingData setWideCamera:](v246, "setWideCamera:", v255);

              }
              v265 = v253 != 0;
              objc_msgSend(v251, "latestUltraWideImage");
              v266 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v266)
                v265 = 0;

              if (v265)
              {
                v267 = [ARCamera alloc];
                objc_msgSend(v251, "latestUltraWideImage");
                v268 = (void *)objc_claimAutoreleasedReturnValue();
                v269 = -[ARCamera initFromImageData:](v267, "initFromImageData:", v268);

                -[ARRawSceneUnderstandingData setUltraWideCamera:](v246, "setUltraWideCamera:", v269);
              }
              objc_msgSend(v395, "resultDataOfClass:", objc_opt_class());
              v270 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v270, "firstObject");
              v271 = (void *)objc_claimAutoreleasedReturnValue();

              if (v271)
              {
                objc_msgSend(v271, "latestResizedUltraWideImageData");
                v272 = (void *)objc_claimAutoreleasedReturnValue();
                -[ARRawSceneUnderstandingData setUltraWideDownscalingResultData:](v246, "setUltraWideDownscalingResultData:", v272);

              }
              -[ARFrame setRawSceneUnderstandingData:](v35, "setRawSceneUnderstandingData:", v246);

            }
            v273 = v414;
            if (v414->_configuredForWorldTracking)
            {
              v274 = -[ARSession is6DofFaceTracking](v414, "is6DofFaceTracking");
              v273 = v414;
              if (!v274)
              {
                -[ARSession _updateFeaturePointsForFrame:previousFrame:trackingStateChanged:context:](v414, "_updateFeaturePointsForFrame:previousFrame:trackingStateChanged:context:", v35, v414->_lastProcessedFrame, v377, v413);
                v273 = v414;
              }
            }
            if (-[ARSession is6DofFaceTracking](v273, "is6DofFaceTracking"))
            {
              -[ARFrame camera](v35, "camera");
              v275 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v275, "transform");
              v409 = ARFrontWideCameraTransformFromBackWideAngleCameraTransform(v276, v277, v278, v279);
              v399 = v280;
              v388 = v282;
              v391 = v281;
              -[ARFrame camera](v35, "camera");
              v283 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v283, "setTransform:", v409, v399, v391, v388);

            }
            -[ARFrame lightEstimate](v35, "lightEstimate");
            v284 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              -[ARFrame lightEstimate](v35, "lightEstimate");
              v286 = (void *)objc_claimAutoreleasedReturnValue();
              -[ARFrame camera](v35, "camera");
              v287 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v286, "lightEstimateByApplyingRotation:", ARMatrix3x3FromMatrix4x4(objc_msgSend(v287, "transform")));
              v288 = (void *)objc_claimAutoreleasedReturnValue();
              -[ARFrame setLightEstimate:](v35, "setLightEstimate:", v288);

            }
            -[ARFrame anchors](v414->_lastProcessedFrame, "anchors");
            v289 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v289, "count");
            kdebug_trace();

            -[ARFrame anchors](v414->_lastProcessedFrame, "anchors");
            v290 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARFrame setAnchors:](v35, "setAnchors:", v290);

            -[ARFrame privateAnchors](v414->_lastProcessedFrame, "privateAnchors");
            v291 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARFrame setPrivateAnchors:](v35, "setPrivateAnchors:", v291);

            v400 = (void *)objc_opt_new();
            v389 = (void *)objc_opt_new();
            v410 = (void *)objc_opt_new();
            v392 = (void *)objc_opt_new();
            -[ARSession _updateAnchorsForFrame:resultDatas:context:addedAnchors:updatedAnchors:removedAnchors:externalAnchors:](v414, "_updateAnchorsForFrame:resultDatas:context:addedAnchors:updatedAnchors:removedAnchors:externalAnchors:", v35, obj, v413, v400, v389, v410, v392);
            -[ARFrame anchors](v35, "anchors");
            v292 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v292, "count");
            kdebug_trace();

            if (v377)
            {
              -[ARFrame camera](v35, "camera");
              v293 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v293, "trackingState"))
              {
                -[ARFrame camera](v35, "camera");
                v294 = (void *)objc_claimAutoreleasedReturnValue();
                v295 = objc_msgSend(v294, "trackingStateReason") == 1;

                if (!v295)
                  goto LABEL_265;
              }
              else
              {

              }
              if (*locationa)
              {
                objc_msgSend(*locationa, "camera");
                v296 = (void *)objc_claimAutoreleasedReturnValue();
                if (!objc_msgSend(v296, "trackingState"))
                {

                  goto LABEL_265;
                }
                objc_msgSend(*locationa, "camera");
                v297 = (void *)objc_claimAutoreleasedReturnValue();
                v298 = objc_msgSend(v297, "trackingStateReason") == 1;

                if (v298)
                  goto LABEL_265;
              }
              -[ARFrame timestamp](v35, "timestamp");
              v414->_currentTrackingStartingTimestamp = v299;
            }
LABEL_265:
            if (!-[ARFrame isHighResolution](v35, "isHighResolution"))
            {
              objc_storeStrong(locationa, v35);
              -[ARFrame timestamp](v35, "timestamp");
              kdebug_trace();
            }
            v300 = -[ARSession relocalizing](v414, "relocalizing");
            -[ARSession setRelocalizing:](v414, "setRelocalizing:", v384);
            v301 = v384 ^ v300;
            v369 = v384 ^ v300;
            if ((v384 & (v384 ^ v300)) == 1)
            {
              _ARLogSession_0();
              v302 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v302, OS_LOG_TYPE_INFO))
              {
                v303 = (objc_class *)objc_opt_class();
                NSStringFromClass(v303);
                v304 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v304;
                *(_WORD *)&buf[12] = 2048;
                *(_QWORD *)&buf[14] = v414;
                _os_log_impl(&dword_1B3A68000, v302, OS_LOG_TYPE_INFO, "%{public}@ <%p>: world tracking did start relocalizing", buf, 0x16u);

              }
              objc_msgSend(v413, "worldMap");
              v305 = (void *)objc_claimAutoreleasedReturnValue();

              if (v305)
              {
                v306 = v414;
                v414->_relocalizationRequested = 1;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v414->_defaultRelocalizationDuration);
                v313 = objc_claimAutoreleasedReturnValue();
                relocalizationTimeoutDate = v414->_relocalizationTimeoutDate;
                v414->_relocalizationTimeoutDate = (NSDate *)v313;

                -[ARSession _sessionShouldAttemptRelocalization](v414, "_sessionShouldAttemptRelocalization");
                v306 = v414;
              }
            }
            else if (v384)
            {
              v306 = v414;
              if (!v414->_relocalizationRequested)
              {
                -[NSDate timeIntervalSinceNow](v414->_relocalizationTimeoutDate, "timeIntervalSinceNow");
                v306 = v414;
                if (v307 < 0.0)
                {
                  v308 = v414->_relocalizationTimeoutDate;
                  v414->_relocalizationTimeoutDate = 0;

                  v306 = v414;
                  stateQueue = v414->_stateQueue;
                  block[0] = MEMORY[0x1E0C809B0];
                  block[1] = 3221225472;
                  block[2] = __61__ARSession_technique_didOutputResultData_timestamp_context___block_invoke_213;
                  block[3] = &unk_1E6672168;
                  block[4] = v414;
                  dispatch_async(stateQueue, block);
                }
              }
            }
            else
            {
              v306 = v414;
              if (v301)
              {
                _ARLogSession_0();
                v310 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v310, OS_LOG_TYPE_DEBUG))
                {
                  v311 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v311);
                  v312 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  *(_QWORD *)&buf[4] = v312;
                  *(_WORD *)&buf[12] = 2048;
                  *(_QWORD *)&buf[14] = v414;
                  _os_log_impl(&dword_1B3A68000, v310, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: world tracking ended relocalization", buf, 0x16u);

                }
                v306 = v414;
                v414->_relocalizationRequested = 0;
              }
            }
            -[ARSessionMetrics sessionDidUpdateFrame:](v306->_metrics, "sessionDidUpdateFrame:", v35);
            v385 = v414->_worldTrackingTechnique;
            dispatch_semaphore_signal((dispatch_semaphore_t)v414->_lastProcessedFrameSemaphore);
            if (objc_msgSend(v392, "count"))
            {
              v315 = (void *)objc_msgSend(v392, "copy");
              -[ARSession _sessionDidUpdateExternalAnchors:](v414, "_sessionDidUpdateExternalAnchors:", v315);

              v425 = 0u;
              v426 = 0u;
              v423 = 0u;
              v424 = 0u;
              v316 = v392;
              v317 = objc_msgSend(v316, "countByEnumeratingWithState:objects:count:", &v423, v463, 16);
              if (v317)
              {
                v318 = *(_QWORD *)v424;
                do
                {
                  for (jj = 0; jj != v317; ++jj)
                  {
                    if (*(_QWORD *)v424 != v318)
                      objc_enumerationMutation(v316);
                    v320 = *(void **)(*((_QWORD *)&v423 + 1) + 8 * jj);
                    _ARLogSession_0();
                    v321 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v321, OS_LOG_TYPE_DEBUG))
                    {
                      v322 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v322);
                      v323 = (id)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v320, "description");
                      v324 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543874;
                      *(_QWORD *)&buf[4] = v323;
                      *(_WORD *)&buf[12] = 2048;
                      *(_QWORD *)&buf[14] = v414;
                      *(_WORD *)&buf[22] = 2112;
                      *(_QWORD *)&buf[24] = v324;
                      _os_log_impl(&dword_1B3A68000, v321, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: External anchor updated: %@", buf, 0x20u);

                    }
                  }
                  v317 = objc_msgSend(v316, "countByEnumeratingWithState:objects:count:", &v423, v463, 16);
                }
                while (v317);
              }

            }
            if (objc_msgSend(v410, "count"))
            {
              v325 = (void *)objc_msgSend(v410, "copy");
              -[ARSession _sessionDidRemoveAnchors:](v414, "_sessionDidRemoveAnchors:", v325);

              v421 = 0u;
              v422 = 0u;
              v419 = 0u;
              v420 = 0u;
              v326 = v410;
              v327 = objc_msgSend(v326, "countByEnumeratingWithState:objects:count:", &v419, v462, 16);
              if (v327)
              {
                v328 = *(_QWORD *)v420;
                do
                {
                  for (kk = 0; kk != v327; ++kk)
                  {
                    if (*(_QWORD *)v420 != v328)
                      objc_enumerationMutation(v326);
                    v330 = *(void **)(*((_QWORD *)&v419 + 1) + 8 * kk);
                    _ARLogSession_0();
                    v331 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v331, OS_LOG_TYPE_DEBUG))
                    {
                      v332 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v332);
                      v333 = (id)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v330, "description");
                      v334 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543874;
                      *(_QWORD *)&buf[4] = v333;
                      *(_WORD *)&buf[12] = 2048;
                      *(_QWORD *)&buf[14] = v414;
                      *(_WORD *)&buf[22] = 2112;
                      *(_QWORD *)&buf[24] = v334;
                      _os_log_impl(&dword_1B3A68000, v331, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Anchor removed: %@", buf, 0x20u);

                    }
                  }
                  v327 = objc_msgSend(v326, "countByEnumeratingWithState:objects:count:", &v419, v462, 16);
                }
                while (v327);
              }

            }
            if (objc_msgSend(v400, "count"))
            {
              v335 = (void *)objc_msgSend(v400, "copy");
              -[ARSession _sessionDidAddAnchors:](v414, "_sessionDidAddAnchors:", v335);

              v417 = 0u;
              v418 = 0u;
              v415 = 0u;
              v416 = 0u;
              v336 = v400;
              v337 = objc_msgSend(v336, "countByEnumeratingWithState:objects:count:", &v415, v461, 16);
              if (v337)
              {
                v338 = *(_QWORD *)v416;
                do
                {
                  for (mm = 0; mm != v337; ++mm)
                  {
                    if (*(_QWORD *)v416 != v338)
                      objc_enumerationMutation(v336);
                    v340 = *(void **)(*((_QWORD *)&v415 + 1) + 8 * mm);
                    _ARLogSession_0();
                    v341 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v341, OS_LOG_TYPE_DEBUG))
                    {
                      v342 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v342);
                      v343 = (id)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v340, "description");
                      v344 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543874;
                      *(_QWORD *)&buf[4] = v343;
                      *(_WORD *)&buf[12] = 2048;
                      *(_QWORD *)&buf[14] = v414;
                      *(_WORD *)&buf[22] = 2112;
                      *(_QWORD *)&buf[24] = v344;
                      _os_log_impl(&dword_1B3A68000, v341, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Anchor added: %@", buf, 0x20u);

                    }
                  }
                  v337 = objc_msgSend(v336, "countByEnumeratingWithState:objects:count:", &v415, v461, 16);
                }
                while (v337);
              }

            }
            if (objc_msgSend(v389, "count"))
            {
              v345 = (void *)objc_msgSend(v389, "copy");
              -[ARSession _sessionDidUpdateAnchors:](v414, "_sessionDidUpdateAnchors:", v345);

            }
            if (v377)
            {
              -[ARFrame camera](v35, "camera");
              v346 = (void *)objc_claimAutoreleasedReturnValue();
              -[ARSession _sessionCameraDidChangeTrackingState:](v414, "_sessionCameraDidChangeTrackingState:", v346);

            }
            if (v365)
            {
              -[ARFrame geoTrackingStatus](v35, "geoTrackingStatus");
              v347 = (void *)objc_claimAutoreleasedReturnValue();
              -[ARSession _sessionDidChangeGeoTrackingStatus:](v414, "_sessionDidChangeGeoTrackingStatus:", v347);

            }
            if (-[ARFrame isHighResolution](v35, "isHighResolution"))
              -[ARSession _sessionDidCaptureHighResolutionFrame:error:](v414, "_sessionDidCaptureHighResolutionFrame:error:", v35, 0);
            else
              -[ARSession _sessionDidUpdateFrame:](v414, "_sessionDidUpdateFrame:", v35);
            kdebug_trace();
            if (!v385)
              goto LABEL_340;
            if (objc_msgSend(v410, "count"))
            {
              objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_215);
              v348 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v410, "filteredArrayUsingPredicate:", v348);
              v349 = (void *)objc_claimAutoreleasedReturnValue();

              -[ARWorldTrackingTechnique removeReferenceAnchors:](v385, "removeReferenceAnchors:", v349);
            }
            -[ARFrame camera](v35, "camera");
            v350 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v350, "trackingState") == 1)
            {
              -[ARFrame camera](v35, "camera");
              v351 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v351, "trackingStateReason") == 1)
              {

                goto LABEL_339;
              }
              -[ARFrame camera](v35, "camera");
              v360 = (void *)objc_claimAutoreleasedReturnValue();
              v361 = objc_msgSend(v360, "trackingStateReason") == 4;

              if (v361)
                goto LABEL_340;
            }
            else
            {

            }
            v352 = -[ARFrame referenceOriginTransformUpdated](v35, "referenceOriginTransformUpdated");
            -[ARFrame anchors](v35, "anchors");
            v353 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v353, "count"))
              v354 = v369 ^ v352;
            else
              v354 = 0;

            if (v354)
            {
              -[ARFrame anchors](v35, "anchors");
              v355 = (void *)objc_claimAutoreleasedReturnValue();
              ARAnchorsForPoseGraphUpdates(v355);
              v350 = (void *)objc_claimAutoreleasedReturnValue();

              -[ARWorldTrackingTechnique addReferenceAnchors:](v385, "addReferenceAnchors:", v350);
              _ARLogSession_0();
              v356 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v356, OS_LOG_TYPE_DEBUG))
              {
                v357 = (objc_class *)objc_opt_class();
                NSStringFromClass(v357);
                v358 = (id)objc_claimAutoreleasedReturnValue();
                v359 = objc_msgSend(v350, "count");
                *(_DWORD *)buf = 138543874;
                *(_QWORD *)&buf[4] = v358;
                *(_WORD *)&buf[12] = 2048;
                *(_QWORD *)&buf[14] = v414;
                *(_WORD *)&buf[22] = 2048;
                *(_QWORD *)&buf[24] = v359;
                _os_log_impl(&dword_1B3A68000, v356, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: all anchors re-added to pose graph updates: %tu", buf, 0x20u);

              }
            }
            else
            {
              if (!objc_msgSend(v400, "count"))
              {
LABEL_340:

                goto LABEL_341;
              }
              ARAnchorsForPoseGraphUpdates(v400);
              v350 = (void *)objc_claimAutoreleasedReturnValue();
              -[ARWorldTrackingTechnique addReferenceAnchors:](v385, "addReferenceAnchors:", v350);
            }
LABEL_339:

            goto LABEL_340;
          }
          v186 = v414;
          if (v414->_relocalizationRequested)
          {
            v384 = 1;
            goto LABEL_177;
          }
          -[ARFrame camera](v35, "camera");
          v182 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v182, "setTrackingStateReason:", 1);
        }

        goto LABEL_176;
      }
      objc_msgSend(obj, "ar_firstObjectPassingTest:", &__block_literal_global_190);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      if (v154)
      {
        v156 = (void *)objc_opt_new();
        objc_msgSend(v154, "transformToCVPixelBuffer:depthBuffer:", -[ARFrame segmentationBuffer](v35, "segmentationBuffer"), -[ARFrame estimatedDepthData](v35, "estimatedDepthData"));
        v438 = 0u;
        v439 = 0u;
        v436 = 0u;
        v437 = 0u;
        v157 = (id)objc_claimAutoreleasedReturnValue();
        v158 = objc_msgSend(v157, "countByEnumeratingWithState:objects:count:", &v436, v466, 16);
        if (v158)
        {
          v159 = *(_QWORD *)v437;
          do
          {
            for (nn = 0; nn != v158; ++nn)
            {
              if (*(_QWORD *)v437 != v159)
                objc_enumerationMutation(v157);
              v161 = -[ARPersonMetadata initWithDepthBasedPersonDetectionResult:]([ARPersonMetadata alloc], "initWithDepthBasedPersonDetectionResult:", *(_QWORD *)(*((_QWORD *)&v436 + 1) + 8 * nn));
              objc_msgSend(v156, "addObject:", v161);

            }
            v158 = objc_msgSend(v157, "countByEnumeratingWithState:objects:count:", &v436, v466, 16);
          }
          while (v158);
        }

        -[ARFrame setDetectedPersonMetadata:](v35, "setDetectedPersonMetadata:", v156);
      }
    }

    goto LABEL_143;
  }
  objc_msgSend(v413, "imageData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isSecondary") & 1) == 0)
  {

    goto LABEL_23;
  }
  objc_msgSend(v413, "imageData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isHighResolution");

  if ((v19 & 1) != 0)
    goto LABEL_23;
  dispatch_semaphore_wait((dispatch_semaphore_t)v414->_resultDataOfSecondaryFrameContextsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  objc_storeStrong((id *)&v414->resultDatasOfSecondaryFrameContexts, a4);
  dispatch_semaphore_signal((dispatch_semaphore_t)v414->_resultDataOfSecondaryFrameContextsSemaphore);
  dispatch_semaphore_wait((dispatch_semaphore_t)v414->_frameContextHandlerSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v452 = 0u;
  v453 = 0u;
  v454 = 0u;
  v455 = 0u;
  objc_msgSend(v413, "anchorsToRemove");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v452, v473, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v453;
    do
    {
      for (i1 = 0; i1 != v21; ++i1)
      {
        if (*(_QWORD *)v453 != v22)
          objc_enumerationMutation(v20);
        -[ARFrameContextHandler removeAnchor:](v414->_frameContextHandler, "removeAnchor:", *(_QWORD *)(*((_QWORD *)&v452 + 1) + 8 * i1));
      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v452, v473, 16);
    }
    while (v21);
  }

  objc_msgSend(v413, "anchorsToStopTracking");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count") == 0;

  if (!v25)
  {
    frameContextHandler = v414->_frameContextHandler;
    objc_msgSend(v413, "anchorsToStopTracking");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARFrameContextHandler stopTrackingAnchors:](frameContextHandler, "stopTrackingAnchors:", v27);

  }
  dispatch_semaphore_signal((dispatch_semaphore_t)v414->_frameContextHandlerSemaphore);
LABEL_341:

}

ARBody2D *__61__ARSession_technique_didOutputResultData_timestamp_context___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ARBody2D *v3;
  ARSkeleton2D *v4;
  ARBody2D *v5;

  v2 = a2;
  v3 = [ARBody2D alloc];
  v4 = -[ARSkeleton2D initWithDetectedSkeleton:]([ARSkeleton2D alloc], "initWithDetectedSkeleton:", v2);

  v5 = -[ARBody2D initWithSkeleton2D:](v3, "initWithSkeleton2D:", v4);
  return v5;
}

uint64_t __61__ARSession_technique_didOutputResultData_timestamp_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __61__ARSession_technique_didOutputResultData_timestamp_context___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  char isKindOfClass;

  v5 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    *a4 = 1;
  return isKindOfClass & 1;
}

uint64_t __61__ARSession_technique_didOutputResultData_timestamp_context___block_invoke_200(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  char isKindOfClass;

  v5 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    *a4 = 1;
  return isKindOfClass & 1;
}

BOOL __61__ARSession_technique_didOutputResultData_timestamp_context___block_invoke_2_203(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;

  v5 = objc_msgSend(a2, "source");
  if (v5 == 2)
    *a4 = 1;
  return v5 == 2;
}

BOOL __61__ARSession_technique_didOutputResultData_timestamp_context___block_invoke_3_206(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;

  v5 = objc_msgSend(a2, "source");
  if (v5 == 2)
    *a4 = 1;
  return v5 == 2;
}

uint64_t __61__ARSession_technique_didOutputResultData_timestamp_context___block_invoke_213(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _ARLogSession_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v4;
    v9 = 2048;
    v10 = v5;
    _os_log_impl(&dword_1B3A68000, v2, OS_LOG_TYPE_INFO, "%{public}@ <%p>: default relocalization timed out", (uint8_t *)&v7, 0x16u);

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clearMap");
}

BOOL __61__ARSession_technique_didOutputResultData_timestamp_context___block_invoke_214()
{
  return (objc_opt_respondsToSelector() & 1) == 0;
}

- (void)technique:(id)a3 didFailWithError:(id)a4
{
  -[ARSession _sessionDidFailWithError:](self, "_sessionDidFailWithError:", a4);
}

- (__n128)_cameraTransformForResultData:(void *)a3 previousFrame:(void *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  void *v18;
  __int128 v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _OWORD v41[4];
  _BYTE v42[128];
  uint8_t buf[32];
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v33 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
  v35 = *MEMORY[0x1E0C83FF0];
  v29 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 48);
  v31 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 32);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v38;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v12, "cameraTransform");
          v33 = v14;
          v35 = v13;
          v29 = v16;
          v31 = v15;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v9);
  }
  if (!objc_msgSend(v6, "count", v29, v31, v33, v35))
  {
    if (v7)
    {
      objc_msgSend(v7, "camera");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v7, "camera");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "transform");
        v36 = v19;

        goto LABEL_21;
      }
    }
    _ARLogGeneral_26();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a1;
      _os_log_impl(&dword_1B3A68000, v20, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: prediction failure can lead to no resultData. Falling back to old camera transform", buf, 0x16u);

    }
  }
  if (objc_msgSend(v7, "referenceOriginTransformAvailable"))
  {
    objc_msgSend(v7, "referenceOriginTransform");
    v27 = 0;
    v41[0] = v36;
    v41[1] = v34;
    v41[2] = v32;
    v41[3] = v30;
    memset(buf, 0, sizeof(buf));
    v44 = 0u;
    v45 = 0u;
    do
    {
      *(float32x4_t *)&buf[v27 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v23, COERCE_FLOAT(v41[v27])), v24, *(float32x2_t *)&v41[v27], 1), v25, (float32x4_t)v41[v27], 2), v26, (float32x4_t)v41[v27], 3);
      ++v27;
    }
    while (v27 != 4);
    v36 = *(_OWORD *)buf;
  }
LABEL_21:

  return (__n128)v36;
}

- (void)_updateOriginTransformForFrame:(id)a3 previousFrame:(id)a4 modifiers:(unint64_t)a5 context:(id)a6
{
  unsigned __int8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  simd_float4x4 v17;
  char v18;
  void *v19;
  __n128 v20;
  __n128 v21;
  simd_float4 v22;
  simd_float4 v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  uint64_t v28;
  __n128 v29;
  __float2 v30;
  float v39;
  uint64_t v40;
  float v41;
  uint64_t v45;
  uint64_t v51;
  NSObject *v52;
  objc_class *v53;
  void *v54;
  NSObject *v55;
  objc_class *v56;
  void *v57;
  int v58;
  char v59;
  uint64_t v60;
  void *v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  uint64_t v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v69;
  float32x4_t v70;
  uint64_t v71;
  uint64_t v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;
  uint64_t v77;
  simd_float4x4 v78;
  NSObject *v79;
  objc_class *v80;
  void *v81;
  __n128 v82;
  __n128 v83;
  __n128 v84;
  __n128 v85;
  void *v86;
  simd_float4 v87;
  float32x4_t v88;
  __n128 v89;
  float32x4_t v90;
  __n128 v91;
  float32x4_t v92;
  float32x4_t v93;
  __n128 v94;
  float32x4_t v95;
  float32x4_t v96;
  simd_float4 v97;
  float32x4_t v98;
  float32x4_t v99;
  __int128 v100;
  float32x4_t v101;
  float32x4_t v102;
  float32x4_t v103;
  __int128 v104;
  float32x4_t v105;
  float32x4_t v106;
  float32x4_t v107;
  __int128 v108;
  float32x4_t v109;
  float32x4_t v110;
  float32x4_t v111;
  __int128 v112;
  float32x4_t v113;
  float32x4_t v114;
  float32x4_t v115;
  simd_float4x4 v116;
  simd_float4x4 buf;
  uint64_t v118;
  simd_float4x4 v119;
  simd_float4x4 v120;
  simd_float4x4 v121;
  simd_float4x4 v122;
  simd_float4x4 v123;
  simd_float4x4 v124;
  simd_float4x4 v125;
  simd_float4x4 v126;
  simd_float4x4 v127;
  simd_float4x4 v128;
  simd_float4x4 v129;
  simd_float4x4 v130;
  simd_float4x4 v131;
  simd_float4x4 v132;

  v7 = a5;
  v118 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if ((objc_msgSend(v12, "sessionTransformUpdated") & 1) == 0)
  {
    if ((v7 & 8) != 0)
    {
      objc_msgSend(v12, "resumeSessionCameraPositionAndHeading");
    }
    else if ((v7 & 4) != 0)
    {
      objc_msgSend(v12, "resumeSessionCameraPosition");
    }
  }
  if (objc_msgSend(v12, "didRelocalize"))
  {
    objc_msgSend(v12, "worldMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v12, "worldMap");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "referenceOriginTransform");
      v120 = __invert_f4(v119);
      objc_msgSend(v10, "setWorldAlignmentTransform:", *(double *)v120.columns[0].i64, *(double *)v120.columns[1].i64, *(double *)v120.columns[2].i64, *(double *)v120.columns[3].i64);

      objc_msgSend(v12, "resetSessionTransform");
    }
  }
  if (!objc_msgSend(v12, "sessionTransformReset"))
  {
    v18 = objc_msgSend(v12, "sessionTransformUpdated");
    v16 = (v7 >> 1) & 1;
    if ((v18 & 1) != 0)
    {
      objc_msgSend(v12, "sessionTransform");
      v17 = __invert_f4(v121);
      if (!v11)
      {
        v15 = 1;
        goto LABEL_37;
      }
      *(_QWORD *)&v104 = v17.columns[1].i64[0];
      *(_QWORD *)&v108 = v17.columns[2].i64[0];
      *(_QWORD *)&v112 = v17.columns[0].i64[0];
    }
    else
    {
      if (!v11)
      {
        v108 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 32);
        v112 = *MEMORY[0x1E0C83FF0];
        v100 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 48);
        v104 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
LABEL_36:
        v58 = objc_msgSend(v11, "sessionOriginTransformAvailable");
        v15 = 0;
        v17.columns[3].i64[0] = v100;
        v17.columns[1].i64[0] = v104;
        v17.columns[2].i64[0] = v108;
        v17.columns[0].i64[0] = v112;
        if (!v58)
          goto LABEL_38;
LABEL_37:
        objc_msgSend(v10, "setSessionOriginTransform:", *(double *)v17.columns[0].i64, *(double *)v17.columns[1].i64, *(double *)v17.columns[2].i64, *(double *)v17.columns[3].i64);
        goto LABEL_38;
      }
      objc_msgSend(v11, "sessionOriginTransform");
      *(_QWORD *)&v108 = v17.columns[2].i64[0];
      *(_QWORD *)&v112 = v17.columns[0].i64[0];
      *(_QWORD *)&v104 = v17.columns[1].i64[0];
    }
    *(_QWORD *)&v100 = v17.columns[3].i64[0];
    if ((objc_msgSend(v12, "sessionTransformShouldResumeCameraHeading") & 1) != 0
      || objc_msgSend(v12, "sessionTransformShouldResumeCameraPosition"))
    {
      objc_msgSend(v11, "camera");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "transform");
      v91 = v21;
      v94 = v20;
      v87 = v22;
      v97 = v23;

      if (objc_msgSend(v11, "worldAlignment") == 2)
      {
        objc_msgSend(v11, "gravityAlignedReferenceOriginTransform", *(_OWORD *)&v87, *(_OWORD *)&v91, *(_OWORD *)&v94);
        v95 = v25;
        v98 = v24;
        v88 = v27;
        v92 = v26;
        objc_msgSend(v11, "referenceOriginTransform");
        v123 = __invert_f4(v122);
        v28 = 0;
        v116 = v123;
        memset(&buf, 0, sizeof(buf));
        do
        {
          buf.columns[v28] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v98, COERCE_FLOAT(*(_OWORD *)&v116.columns[v28])), v95, *(float32x2_t *)v116.columns[v28].f32, 1), v92, (float32x4_t)v116.columns[v28], 2), v88, (float32x4_t)v116.columns[v28], 3);
          ++v28;
        }
        while (v28 != 4);
        v91 = (__n128)buf.columns[1];
        v94 = (__n128)buf.columns[0];
        v87 = buf.columns[2];
        v97 = buf.columns[3];
      }
      if (objc_msgSend(v12, "sessionTransformShouldResumeCameraHeading", *(_OWORD *)&v87))
      {
        v29.n128_f64[0] = AREulerAnglesFromMatrix(v94, v91, v89);
        v89 = v29;
        v30 = __sincosf_stret(vmuls_lane_f32(0.5, (float32x2_t)v29.n128_u64[0], 1));
        _Q0 = vmulq_n_f32((float32x4_t)xmmword_1B3BDFDD0, v30.__sinval);
        _S2 = _Q0.i32[1];
        _S4 = _Q0.i32[2];
        __asm { FMLS            S3, S4, V0.S[2] }
        v39 = vmlas_n_f32(vmuls_lane_f32(v30.__cosval, _Q0, 2), _Q0.f32[1], _Q0.f32[0]);
        *(float *)&v40 = _S3 + (float)(v30.__cosval * v30.__cosval);
        *((float *)&v40 + 1) = v39 + v39;
        *(_QWORD *)&v112 = v40;
        v41 = vmlas_n_f32(-(float)(v30.__cosval * _Q0.f32[2]), _Q0.f32[1], _Q0.f32[0]);
        __asm
        {
          FMLA            S5, S2, V0.S[1]
          FMLS            S5, S0, V0.S[0]
          FMLA            S6, S4, V0.S[1]
        }
        *(float *)&v45 = v41 + v41;
        HIDWORD(v45) = _S5;
        __asm
        {
          FMLA            S7, S0, V0.S[2]
          FMLA            S5, S4, V0.S[1]
          FMLA            S1, S4, V0.S[2]
          FMLS            S1, S0, V0.S[0]
          FMLS            S1, S2, V0.S[1]
        }
        *(float *)&v51 = _S7 + _S7;
        *((float *)&v51 + 1) = _S5 + _S5;
        *(_QWORD *)&v104 = v45;
        *(_QWORD *)&v108 = v51;
        _ARLogSession_0();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          v53 = (objc_class *)objc_opt_class();
          NSStringFromClass(v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          buf.columns[0].i32[0] = 138543874;
          *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v54;
          buf.columns[0].i16[6] = 2048;
          *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)self;
          buf.columns[1].i16[3] = 2048;
          *(double *)&buf.columns[1].i64[1] = v89.n128_f32[1] * 180.0 / 3.14159265;
          _os_log_impl(&dword_1B3A68000, v52, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Updated session heading (%0.2f°)", (uint8_t *)&buf, 0x20u);

        }
        *(_QWORD *)&v100 = 0;
      }
      if (objc_msgSend(v12, "sessionTransformShouldResumeCameraPosition", *(_OWORD *)&v89))
      {
        _ARLogSession_0();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          v56 = (objc_class *)objc_opt_class();
          NSStringFromClass(v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          buf.columns[0].i32[0] = 138544386;
          *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v57;
          buf.columns[0].i16[6] = 2048;
          *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)self;
          buf.columns[1].i16[3] = 2048;
          *(double *)&buf.columns[1].i64[1] = v97.f32[0];
          buf.columns[2].i16[0] = 2048;
          *(double *)((char *)buf.columns[2].i64 + 2) = v97.f32[1];
          buf.columns[2].i16[5] = 2048;
          *(double *)((char *)&buf.columns[2].i64[1] + 4) = v97.f32[2];
          _os_log_impl(&dword_1B3A68000, v55, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Updated session origin (%f, %f, %f)", (uint8_t *)&buf, 0x34u);

        }
        v16 = 1;
        v15 = 1;
        v17.columns[2].i64[0] = v108;
        v17.columns[0].i64[0] = v112;
        v17.columns[1].i64[0] = v104;
        v17.columns[3].i64[0] = v97.i64[0];
        goto LABEL_37;
      }
      v16 = 1;
      v17.columns[3].i64[0] = v100;
      v15 = 1;
      goto LABEL_35;
    }
    if ((v18 & 1) != 0)
    {
      v15 = 1;
      v17.columns[3].i64[0] = v100;
LABEL_35:
      v17.columns[2].i64[0] = v108;
      v17.columns[0].i64[0] = v112;
      v17.columns[1].i64[0] = v104;
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  v15 = objc_msgSend(v11, "sessionOriginTransformAvailable");
  v16 = objc_msgSend(v11, "sessionOriginTransformAvailable");
LABEL_38:
  v59 = objc_msgSend(v10, "worldAlignmentTransformAvailable", *(double *)v17.columns[0].i64, *(double *)v17.columns[1].i64, *(double *)v17.columns[2].i64, *(double *)v17.columns[3].i64);
  if ((v7 & 1) != 0 || (v59 & 1) != 0)
  {
    if (-[ARConfiguration worldAlignment](self->_configurationInternal, "worldAlignment") != ARWorldAlignmentCamera)
      goto LABEL_55;
LABEL_47:
    objc_msgSend(v10, "camera");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "transform");
    v125 = __invert_f4(v124);
    objc_msgSend(v10, "setReferenceOriginTransform:", *(double *)v125.columns[0].i64, *(double *)v125.columns[1].i64, *(double *)v125.columns[2].i64, *(double *)v125.columns[3].i64);

    if (!(_DWORD)v16)
    {
      objc_msgSend(v10, "setReferenceOriginTransformUpdated:", 1);
      objc_msgSend(v10, "setReferenceOriginChanged:", 0);
      goto LABEL_71;
    }
    objc_msgSend(v11, "sessionOriginTransform");
    v109 = v63;
    v113 = v62;
    v101 = v65;
    v105 = v64;
    objc_msgSend(v10, "sessionOriginTransform");
    v127 = __invert_f4(v126);
    v66 = 0;
    v116 = v127;
    memset(&buf, 0, sizeof(buf));
    do
    {
      buf.columns[v66] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v113, COERCE_FLOAT(*(_OWORD *)&v116.columns[v66])), v109, *(float32x2_t *)v116.columns[v66].f32, 1), v105, (float32x4_t)v116.columns[v66], 2), v101, (float32x4_t)v116.columns[v66], 3);
      ++v66;
    }
    while (v66 != 4);
    v96 = (float32x4_t)buf.columns[1];
    v99 = (float32x4_t)buf.columns[0];
    v90 = (float32x4_t)buf.columns[3];
    v93 = (float32x4_t)buf.columns[2];
    objc_msgSend(v10, "worldAlignmentTransform");
    v110 = v68;
    v114 = v67;
    v102 = v70;
    v106 = v69;
    objc_msgSend(v11, "worldAlignmentTransform");
    v129 = __invert_f4(v128);
    v71 = 0;
    v116 = v129;
    memset(&buf, 0, sizeof(buf));
    do
    {
      buf.columns[v71] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v99, COERCE_FLOAT(*(_OWORD *)&v116.columns[v71])), v96, *(float32x2_t *)v116.columns[v71].f32, 1), v93, (float32x4_t)v116.columns[v71], 2), v90, (float32x4_t)v116.columns[v71], 3);
      ++v71;
    }
    while (v71 != 4);
    v72 = 0;
    v116 = buf;
    memset(&buf, 0, sizeof(buf));
    do
    {
      buf.columns[v72] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v114, COERCE_FLOAT(*(_OWORD *)&v116.columns[v72])), v110, *(float32x2_t *)v116.columns[v72].f32, 1), v106, (float32x4_t)v116.columns[v72], 2), v102, (float32x4_t)v116.columns[v72], 3);
      ++v72;
    }
    while (v72 != 4);
    objc_msgSend(v10, "setReferenceOriginDelta:", *(double *)buf.columns[0].i64, *(double *)buf.columns[1].i64, *(double *)buf.columns[2].i64, *(double *)buf.columns[3].i64);
    v60 = 1;
    goto LABEL_67;
  }
  if (objc_msgSend(v11, "worldAlignmentTransformAvailable"))
  {
    objc_msgSend(v11, "worldAlignmentTransform");
    objc_msgSend(v10, "setWorldAlignmentTransform:");
  }
  if (-[ARConfiguration worldAlignment](self->_configurationInternal, "worldAlignment") == ARWorldAlignmentCamera)
    goto LABEL_47;
  if ((v15 & 1) == 0)
  {
    if (objc_msgSend(v11, "referenceOriginTransformAvailable"))
    {
      objc_msgSend(v11, "referenceOriginTransform");
      objc_msgSend(v10, "setReferenceOriginTransform:");
      v60 = 0;
      goto LABEL_67;
    }
    v60 = 0;
    goto LABEL_56;
  }
LABEL_55:
  v60 = 1;
LABEL_56:
  if (objc_msgSend(v10, "sessionOriginTransformAvailable")
    && objc_msgSend(v10, "worldAlignmentTransformAvailable"))
  {
    objc_msgSend(v10, "sessionOriginTransform");
    v111 = v74;
    v115 = v73;
    v103 = v76;
    v107 = v75;
    objc_msgSend(v10, "worldAlignmentTransform");
    v131 = __invert_f4(v130);
    v77 = 0;
    v116 = v131;
    memset(&buf, 0, sizeof(buf));
    do
    {
      buf.columns[v77] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v115, COERCE_FLOAT(*(_OWORD *)&v116.columns[v77])), v111, *(float32x2_t *)v116.columns[v77].f32, 1), v107, (float32x4_t)v116.columns[v77], 2), v103, (float32x4_t)v116.columns[v77], 3);
      ++v77;
    }
    while (v77 != 4);
    v78.columns[2].i64[0] = buf.columns[2].i64[0];
    v78.columns[3].i64[0] = buf.columns[3].i64[0];
    v78.columns[0].i64[0] = buf.columns[0].i64[0];
    v78.columns[1].i64[0] = buf.columns[1].i64[0];
  }
  else if (objc_msgSend(v10, "sessionOriginTransformAvailable"))
  {
    objc_msgSend(v10, "sessionOriginTransform");
  }
  else
  {
    if (!objc_msgSend(v10, "worldAlignmentTransformAvailable"))
      goto LABEL_67;
    objc_msgSend(v10, "worldAlignmentTransform");
    v78 = __invert_f4(v132);
  }
  objc_msgSend(v10, "setReferenceOriginTransform:", *(double *)v78.columns[0].i64, *(double *)v78.columns[1].i64, *(double *)v78.columns[2].i64, *(double *)v78.columns[3].i64);
LABEL_67:
  objc_msgSend(v10, "setReferenceOriginTransformUpdated:", v60);
  objc_msgSend(v10, "setReferenceOriginChanged:", v16);
  if ((_DWORD)v16)
  {
    _ARLogSession_0();
    v79 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
    {
      v80 = (objc_class *)objc_opt_class();
      NSStringFromClass(v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "referenceOriginTransform");
      ARMatrix4x4Description(0, v82, v83, v84, v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      buf.columns[0].i32[0] = 138543874;
      *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v81;
      buf.columns[0].i16[6] = 2048;
      *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)self;
      buf.columns[1].i16[3] = 2112;
      buf.columns[1].i64[1] = (uint64_t)v86;
      _os_log_impl(&dword_1B3A68000, v79, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Reference origin changed %@", (uint8_t *)&buf, 0x20u);

    }
  }
LABEL_71:

}

- (void)_updateFeaturePointsForFrame:(id)a3 previousFrame:(id)a4 trackingStateChanged:(BOOL)a5 context:(id)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  ARSession *v45;
  uint64_t v46;

  v6 = a5;
  v46 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!objc_msgSend(v9, "referenceOriginChanged"))
  {
    objc_msgSend(v9, "referenceFeaturePoints");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count"))
    {
      objc_msgSend(v10, "cachedPointClouds");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "referenceFeaturePoints");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "containsObject:", v20) ^ 1;

    }
    else
    {
      v21 = 0;
    }

    if (v6)
    {
      objc_msgSend(v9, "camera");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "trackingStateReason");

      if (v23 == 1)
      {

        v10 = 0;
      }
    }
    if (v21)
    {
      objc_msgSend(v10, "cachedPointClouds");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v24, "mutableCopy");
      v26 = v25;
      if (v25)
        v27 = v25;
      else
        v27 = (id)objc_opt_new();
      v33 = v27;

      objc_msgSend(v9, "referenceFeaturePoints");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v34);

      if ((unint64_t)objc_msgSend(v33, "count") > self->_featurePointAccumulationCount)
        objc_msgSend(v33, "removeObjectAtIndex:", 0);
      objc_msgSend(v9, "setCachedPointClouds:", v33);
      +[ARPointCloud concatPointClouds:](ARPointCloud, "concatPointClouds:", v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setReferenceFeaturePoints:", v35);

      objc_msgSend(v9, "referenceOriginTransformUpdated");
      goto LABEL_27;
    }
    objc_msgSend(v9, "referenceFeaturePoints");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      objc_msgSend(v9, "camera");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "trackingState") != 2)
      {
        objc_msgSend(v9, "camera");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v29, "trackingStateReason") != 4)
        {
          objc_msgSend(v9, "camera");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "trackingStateReason");

          if (v40 != 1)
          {
            objc_msgSend(v9, "setFeaturePoints:", 0);
LABEL_21:
            if (!objc_msgSend(v9, "referenceOriginTransformUpdated"))
              goto LABEL_31;
            goto LABEL_27;
          }
LABEL_20:
          objc_msgSend(v10, "cachedPointClouds");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setCachedPointClouds:", v30);

          objc_msgSend(v10, "referenceFeaturePoints");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setReferenceFeaturePoints:", v31);

          objc_msgSend(v10, "featurePoints");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setFeaturePoints:", v32);

          goto LABEL_21;
        }

      }
    }

    goto LABEL_20;
  }
  _ARLogSession_0();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = v13;
    v44 = 2048;
    v45 = self;
    _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Removing previous cached feature points, because reference origin changed", buf, 0x16u);

  }
  objc_msgSend(v9, "referenceFeaturePoints");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v9, "referenceFeaturePoints");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");
    objc_msgSend(v9, "setCachedPointClouds:", v17);

LABEL_27:
    v36 = objc_msgSend(v9, "referenceOriginTransformAvailable");
    objc_msgSend(v9, "referenceFeaturePoints");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      objc_msgSend(v9, "referenceOriginTransform");
      objc_msgSend(v37, "pointCloudByApplyingTransform:");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFeaturePoints:", v38);

    }
    else
    {
      objc_msgSend(v9, "setFeaturePoints:", v37);
    }

  }
LABEL_31:

}

- (void)setGeoTrackingTechnique:(id)a3
{
  ARRemoteGeoTrackingTechnique *v5;
  ARRemoteGeoTrackingTechnique *geoTrackingTechnique;
  NSObject *v7;
  _BOOL4 v8;
  ARRemoteGeoTrackingTechnique **p_geoTrackingTechnique;
  objc_class *v10;
  void *v11;
  ARRemoteGeoTrackingTechnique *v12;
  objc_class *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  ARSession *v18;
  __int16 v19;
  ARRemoteGeoTrackingTechnique *v20;
  __int16 v21;
  ARRemoteGeoTrackingTechnique *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = (ARRemoteGeoTrackingTechnique *)a3;
  geoTrackingTechnique = self->_geoTrackingTechnique;
  _ARLogSession_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (geoTrackingTechnique == v5)
  {
    if (v8)
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v14;
      v17 = 2048;
      v18 = self;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: The specified geo tracking technique is already set: %@", (uint8_t *)&v15, 0x20u);

    }
  }
  else
  {
    p_geoTrackingTechnique = &self->_geoTrackingTechnique;
    if (v8)
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = self->_geoTrackingTechnique;
      v15 = 138544130;
      v16 = v11;
      v17 = 2048;
      v18 = self;
      v19 = 2112;
      v20 = v12;
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Changing geo tracking technique - old: %@, new: %@", (uint8_t *)&v15, 0x2Au);

    }
    -[ARRemoteTechnique setActive:](*p_geoTrackingTechnique, "setActive:", 0);
    objc_storeStrong((id *)&self->_geoTrackingTechnique, a3);
    -[ARRemoteTechnique setActive:](*p_geoTrackingTechnique, "setActive:", 1);
  }

}

- (void)_lookupAltitudeAtCoordinate:(CLLocationCoordinate2D)a3 completionHandler:(id)a4
{
  -[ARRemoteLocationSensor lookupAltitudeAtCoordinate:completionHandler:](self->_locationSensor, "lookupAltitudeAtCoordinate:completionHandler:", a4, a3.latitude, a3.longitude);
}

- (void)_lookupAltitudeForAnchor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  double v8;
  CLLocationDegrees v9;
  CLLocationDegrees v10;
  CLLocationCoordinate2D v11;
  _QWORD v12[5];
  id v13;
  CLLocationCoordinate2D v14;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARSession _getGeoAnchorAltitude:](self, "_getGeoAnchorAltitude:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    v7 = objc_msgSend(v4, "isAltitudeLookupInProgress");

    if ((v7 & 1) == 0)
    {
      objc_msgSend(v4, "setIsAltitudeLookupInProgress:", 1);
      objc_msgSend(v4, "coordinate");
      v9 = v8;
      objc_msgSend(v4, "coordinate");
      v11 = CLLocationCoordinate2DMake(v9, v10);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __38__ARSession__lookupAltitudeForAnchor___block_invoke;
      v12[3] = &unk_1E6674A30;
      v12[4] = self;
      v13 = v4;
      v14 = v11;
      -[ARSession _lookupAltitudeAtCoordinate:completionHandler:](self, "_lookupAltitudeAtCoordinate:completionHandler:", v12, v11.latitude, v11.longitude);

    }
  }

}

void __38__ARSession__lookupAltitudeForAnchor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  uint64_t v6;
  ARAltitudeUndulationPair *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  ARAltitudeUndulationPair *v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  double v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  uint64_t v24;
  ARAltitudeUndulationPair *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "uncertainty");
    if (v5 == -1.0)
      v6 = 2;
    else
      v6 = 1;
    v7 = [ARAltitudeUndulationPair alloc];
    objc_msgSend(v4, "altitude");
    v9 = v8;
    objc_msgSend(v4, "undulation");
    v11 = v10;
    v12 = v7;
    v13 = v9;
    v14 = 0;
    v15 = v6;
    goto LABEL_13;
  }
  _ARLogSession_0();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 32);
    v28 = 138543618;
    v29 = v18;
    v30 = 2048;
    v31 = v19;
    _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to look up altitude or undulation for anchor", (uint8_t *)&v28, 0x16u);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "altitudeSource") != 3)
    goto LABEL_12;
  v20 = ARGetFallbackUndulationValue(*(double *)(a1 + 48), *(double *)(a1 + 56));
  _ARLogSession_0();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(a1 + 32);
    v28 = 138543875;
    v29 = v23;
    v30 = 2048;
    v31 = v24;
    v32 = 2049;
    v33 = v20;
    _os_log_impl(&dword_1B3A68000, v21, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Falling back to hardcoded undulation value: %{private}f", (uint8_t *)&v28, 0x20u);

  }
  v25 = -[ARAltitudeUndulationPair initWithAltitude:undulation:lookupFailed:source:]([ARAltitudeUndulationPair alloc], "initWithAltitude:undulation:lookupFailed:source:", 0, 3, 0.0, v20);
  if (!v25)
  {
LABEL_12:
    v12 = [ARAltitudeUndulationPair alloc];
    v13 = NAN;
    v11 = NAN;
    v14 = 1;
    v15 = 0;
LABEL_13:
    v25 = -[ARAltitudeUndulationPair initWithAltitude:undulation:lookupFailed:source:](v12, "initWithAltitude:undulation:lookupFailed:source:", v14, v15, v13, v11);
  }
  v26 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_setGeoAnchorAltitude:pair:", v27, v25);

  objc_msgSend(*(id *)(a1 + 40), "setIsAltitudeLookupInProgress:", 0);
}

- (void)_updateAnchorsForFrame:(id)a3 resultDatas:(id)a4 context:(id)a5 addedAnchors:(id)a6 updatedAnchors:(id)a7 removedAnchors:(id)a8 externalAnchors:(id)a9
{
  uint64_t v9;
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
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  _BOOL4 v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  void *v58;
  NSObject *v59;
  objc_class *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _BOOL4 v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t k;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  id v82;
  void *v83;
  double v84;
  NSObject *v85;
  objc_class *v86;
  id v87;
  void *v88;
  void *v89;
  __n128 v90;
  __n128 v91;
  __n128 v92;
  __n128 v93;
  id v94;
  __int128 v95;
  float32x4_t v96;
  float32x4_t v97;
  float32x4_t v98;
  uint64_t v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  float32x4_t v105;
  float32x4_t v106;
  float32x4_t v107;
  uint64_t v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  float32x4_t v114;
  float32x4_t v115;
  float32x4_t v116;
  uint64_t v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  float32x4_t v123;
  float32x4_t v124;
  float32x4_t v125;
  uint64_t v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  void *v131;
  uint64_t v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t m;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t n;
  void *v153;
  void *v154;
  id v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  id v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t ii;
  void *v172;
  NSObject *v173;
  objc_class *v174;
  id v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  uint64_t v183;
  uint64_t jj;
  void *v185;
  id v186;
  void *v187;
  void *v188;
  float32x4_t v189;
  float32x4_t v190;
  float32x4_t v191;
  float32x4_t v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  void *v201;
  void *v202;
  double v203;
  double v204;
  double v205;
  double v206;
  double v207;
  double v208;
  double v209;
  double v210;
  void *v211;
  id v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t kk;
  void *v217;
  void *v218;
  double v219;
  double v220;
  double v221;
  double v222;
  void *v223;
  void *v224;
  id v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t mm;
  void *v230;
  void *v231;
  id v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t nn;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t i1;
  void *v247;
  void *v248;
  uint64_t v249;
  void *v250;
  char isKindOfClass;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t i2;
  void *v256;
  void *v257;
  void *v258;
  uint64_t v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t i3;
  void *v274;
  uint64_t v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  uint64_t v286;
  void *v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  void *v291;
  void *v292;
  id v293;
  int v294;
  NSObject *v295;
  _BOOL4 v296;
  objc_class *v297;
  id v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t i4;
  void *v307;
  void *v308;
  NSObject *v309;
  objc_class *v310;
  id v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t i5;
  void *v317;
  NSObject *v318;
  objc_class *v319;
  id v320;
  void *v321;
  objc_class *v322;
  id v323;
  void *v324;
  void *v325;
  void *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t i6;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t i7;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  id v350;
  id v351;
  id v352;
  id v353;
  id v354;
  id v355;
  void *v356;
  double v357;
  double v358;
  double v359;
  double v360;
  double v361;
  double v362;
  double v363;
  double v364;
  id obj;
  uint64_t v366;
  double v367;
  double v368;
  double v369;
  _BOOL4 v370;
  double v371;
  double v372;
  double v373;
  uint64_t v374;
  double v375;
  double v376;
  double v377;
  float32x4_t v378;
  float32x4_t v379;
  float32x4_t v380;
  float32x4_t v381;
  double v382;
  double v383;
  double v384;
  void *v385;
  float32x4_t v386;
  float32x4_t v387;
  float32x4_t v388;
  float32x4_t v389;
  uint64_t v390;
  float32x4_t v391;
  float32x4_t v392;
  float32x4_t v393;
  float32x4_t v394;
  void *v395;
  id v396[2];
  id v397[2];
  id v398[2];
  id v399[2];
  void *v400;
  void *v401;
  uint64_t v402;
  float32x4_t v403;
  void *v404;
  float32x4_t v405;
  uint64_t v406;
  void *v407;
  void *v408;
  float32x4_t v409;
  uint64_t v410;
  void *v411;
  void *v412;
  void *v413;
  float32x4_t v414;
  uint64_t v415;
  void *v416;
  __int128 v417;
  __int128 v418;
  __int128 v419;
  __int128 v420;
  __int128 v421;
  __int128 v422;
  __int128 v423;
  __int128 v424;
  __int128 v425;
  __int128 v426;
  __int128 v427;
  __int128 v428;
  __int128 v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  __int128 v433;
  __int128 v434;
  __int128 v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  __int128 v443;
  __int128 v444;
  __int128 v445;
  __int128 v446;
  __int128 v447;
  __int128 v448;
  __int128 v449;
  __int128 v450;
  __int128 v451;
  __int128 v452;
  __int128 v453;
  __int128 v454;
  __int128 v455;
  __int128 v456;
  __int128 v457;
  __int128 v458;
  __int128 v459;
  __int128 v460;
  __int128 v461;
  __int128 v462;
  __int128 v463;
  __int128 v464;
  __int128 v465;
  __int128 v466;
  __int128 v467;
  __int128 v468;
  __int128 v469;
  __int128 v470;
  __int128 v471;
  __int128 v472;
  __int128 v473;
  __int128 v474;
  __int128 v475;
  __int128 v476;
  __int128 v477;
  __int128 v478;
  __int128 v479;
  __int128 v480;
  __int128 v481;
  __int128 v482;
  __int128 v483;
  __int128 v484;
  __int128 v485;
  __int128 v486;
  __int128 v487;
  __int128 v488;
  __int128 v489;
  __int128 v490;
  __int128 v491;
  __int128 v492;
  __int128 v493;
  __int128 v494;
  __int128 v495;
  __int128 v496;
  _BYTE v497[128];
  _BYTE v498[128];
  _BYTE v499[128];
  _BYTE v500[128];
  _BYTE v501[128];
  _BYTE v502[128];
  _BYTE v503[128];
  _BYTE v504[128];
  _BYTE v505[128];
  _BYTE v506[128];
  _BYTE v507[128];
  _BYTE v508[128];
  _BYTE v509[128];
  _BYTE v510[128];
  _BYTE v511[128];
  _BYTE v512[128];
  _BYTE v513[128];
  _BYTE v514[128];
  _BYTE v515[128];
  uint8_t buf[32];
  __int128 v517;
  __int128 v518;
  uint64_t v519;
  simd_float4x4 v520;
  simd_float4x4 v521;

  v9 = MEMORY[0x1E0C80A78](self, a2, a3, a4, a5, a6, a7, a8);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v415 = v9;
  v519 = *MEMORY[0x1E0C80C00];
  v21 = v20;
  v353 = v19;
  v355 = v17;
  v354 = v15;
  v352 = v13;
  v351 = v11;
  v350 = a9;
  if (objc_msgSend(v21, "referenceOriginTransformAvailable"))
  {
    objc_msgSend(v21, "referenceOriginTransform");
    v521 = __invert_f4(v520);
    v414 = (float32x4_t)v521.columns[0];
    v409 = (float32x4_t)v521.columns[1];
    v403 = (float32x4_t)v521.columns[3];
    v405 = (float32x4_t)v521.columns[2];
  }
  else
  {
    v414 = *(float32x4_t *)MEMORY[0x1E0C83FF0];
    v409 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 16);
    v403 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48);
    v405 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 32);
  }
  objc_msgSend(v21, "anchors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v412 = v21;
  objc_msgSend(v21, "privateAnchors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "arrayByAddingObjectsFromArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v348 = v24;
  ARDictionaryFromAnchors(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v408 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v411 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v407 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v416 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *(void **)(v415 + 128);
  if (v26
    && (objc_msgSend(v26, "worldTrackingState", v24),
        v27 = (void *)objc_claimAutoreleasedReturnValue(),
        v27,
        v27))
  {
    objc_msgSend(v21, "worldTrackingState");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "originTimestamp");
    v30 = v29;
    objc_msgSend(*(id *)(v415 + 128), "worldTrackingState");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "originTimestamp");
    v33 = v30 > v32;

  }
  else
  {
    v33 = 0;
  }
  v370 = v33;
  v492 = 0u;
  v491 = 0u;
  v490 = 0u;
  v489 = 0u;
  objc_msgSend(v25, "allValues", v348);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v489, v515, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v490;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v490 != v37)
          objc_enumerationMutation(v34);
        v39 = *(void **)(*((_QWORD *)&v489 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v40 = v39;
          if ((objc_msgSend(v40, "isAltitudeAvailable") & 1) == 0)
          {
            objc_msgSend(v40, "identifier");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v415, "_getGeoAnchorAltitude:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            if (v42)
            {
              if (objc_msgSend(v42, "lookupFailed"))
              {
                objc_msgSend(v40, "identifier");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v407, "setObject:forKey:", v40, v43);

              }
              else
              {
                v44 = objc_msgSend(v42, "source");
                objc_msgSend(v42, "altitude");
                v46 = v45;
                if (objc_msgSend(v40, "altitudeSource") == 3)
                {
                  objc_msgSend(v40, "altitude");
                  v46 = v47;
                  v44 = 3;
                }
                objc_msgSend(v40, "coordinate");
                v49 = v48;
                v51 = v50;
                objc_msgSend(v42, "undulation");
                objc_msgSend(v40, "initWithCoordinate:altitude:altitudeSource:isAltitudeAvailable:undulation:", v44, 1, v49, v51, v46, v52);
              }
            }

          }
        }
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v489, v515, 16);
    }
    while (v36);
  }

  v488 = 0u;
  v487 = 0u;
  v486 = 0u;
  v485 = 0u;
  objc_msgSend(v407, "allValues");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v485, v514, 16);
  v413 = v25;
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v486;
    do
    {
      for (j = 0; j != v55; ++j)
      {
        if (*(_QWORD *)v486 != v56)
          objc_enumerationMutation(v53);
        v58 = *(void **)(*((_QWORD *)&v485 + 1) + 8 * j);
        _ARLogSession_0();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          v60 = (objc_class *)objc_opt_class();
          NSStringFromClass(v60);
          v61 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "identifier");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v61;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v415;
          *(_WORD *)&buf[22] = 2112;
          *(_QWORD *)&buf[24] = v62;
          _os_log_impl(&dword_1B3A68000, v59, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to look up geo anchor altitude. Removing anchor: %@", buf, 0x20u);

          v25 = v413;
        }

        objc_msgSend(v58, "identifier");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "removeObjectForKey:", v63);

        objc_msgSend(v58, "identifier");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v415, "_removeGeoAnchorAltitude:", v64);

      }
      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v485, v514, 16);
    }
    while (v55);
  }

  v65 = v355;
  v66 = v370;
  if (v370)
  {
    v484 = 0u;
    v483 = 0u;
    v482 = 0u;
    v481 = 0u;
    objc_msgSend(v25, "allValues");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v481, v513, 16);
    if (v68)
    {
      v69 = v68;
      v70 = *(_QWORD *)v482;
      do
      {
        for (k = 0; k != v69; ++k)
        {
          if (*(_QWORD *)v482 != v70)
            objc_enumerationMutation(v67);
          v72 = *(void **)(*((_QWORD *)&v481 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v73 = (void *)objc_msgSend(v72, "copy");
            objc_msgSend(v73, "identifier");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setObject:forKey:", v73, v74);

            v75 = v73;
            objc_msgSend(v75, "setIsTracked:", 0);
            objc_msgSend(v75, "identifier");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v411, "setObject:forKey:", v75, v76);

          }
        }
        v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v481, v513, 16);
      }
      while (v69);
    }

    v66 = v370;
  }
  v77 = v412;
  if (objc_msgSend(v412, "referenceOriginTransformUpdated"))
  {
    v480 = 0u;
    v479 = 0u;
    v478 = 0u;
    v477 = 0u;
    objc_msgSend(v25, "allValues");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v374 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v477, v512, 16);
    if (!v374)
      goto LABEL_79;
    v79 = *(_QWORD *)v478;
    v366 = *(_QWORD *)v478;
    while (1)
    {
      v80 = 0;
      do
      {
        if (*(_QWORD *)v478 != v79)
          objc_enumerationMutation(v78);
        v81 = *(void **)(*((_QWORD *)&v477 + 1) + 8 * v80);
        if (!v66 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || (v82 = v81) == 0)
        {
          v82 = (id)objc_msgSend(v81, "copy");
          objc_msgSend(v82, "identifier");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v413, "setObject:forKey:", v82, v83);

        }
        if (objc_msgSend(v65, "didRelocalize"))
        {
          objc_msgSend(v82, "lastUpdateTimestamp");
          if (v84 > *(double *)(v415 + 240))
          {
            _ARLogSession_0();
            v85 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
            {
              v86 = (objc_class *)objc_opt_class();
              NSStringFromClass(v86);
              v87 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v82, "identifier");
              v88 = v78;
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "relocalizationDeltaTransform");
              ARMatrix4x4Description(0, v90, v91, v92, v93);
              v94 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              *(_QWORD *)&buf[4] = v87;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v415;
              v66 = v370;
              *(_WORD *)&buf[22] = 2112;
              *(_QWORD *)&buf[24] = v89;
              LOWORD(v517) = 2112;
              *(_QWORD *)((char *)&v517 + 2) = v94;
              _os_log_impl(&dword_1B3A68000, v85, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Relocalization - Anchor (%@) left in place, delta %@", buf, 0x2Au);

              v78 = v88;
              v79 = v366;

              v65 = v355;
              v77 = v412;
            }

            objc_msgSend(v65, "relocalizationDeltaTransform");
            v391 = v96;
            *(_OWORD *)v396 = v95;
            v378 = v98;
            v386 = v97;
            objc_msgSend(v82, "referenceTransform");
            v99 = 0;
            v493 = v100;
            v494 = v101;
            v495 = v102;
            v496 = v103;
            memset(buf, 0, sizeof(buf));
            v517 = 0u;
            v518 = 0u;
            do
            {
              *(float32x4_t *)&buf[v99] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*(float32x4_t *)v396, COERCE_FLOAT(*(__int128 *)((char *)&v493 + v99))), v391, *(float32x2_t *)((char *)&v493 + v99), 1), v386, *(float32x4_t *)((char *)&v493 + v99), 2), v378, *(float32x4_t *)((char *)&v493 + v99), 3);
              v99 += 16;
            }
            while (v99 != 64);
            objc_msgSend(v82, "setReferenceTransform:", *(double *)buf, *(double *)&buf[16], *(double *)&v517, *(double *)&v518);
            objc_msgSend(v77, "referenceOriginTransform");
            v392 = v105;
            *(_OWORD *)v397 = v104;
            v379 = v107;
            v387 = v106;
            objc_msgSend(v82, "referenceTransform");
            v108 = 0;
            v493 = v109;
            v494 = v110;
            v495 = v111;
            v496 = v112;
            memset(buf, 0, sizeof(buf));
            v517 = 0u;
            v518 = 0u;
            do
            {
              *(float32x4_t *)&buf[v108] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*(float32x4_t *)v397, COERCE_FLOAT(*(__int128 *)((char *)&v493 + v108))), v392, *(float32x2_t *)((char *)&v493 + v108), 1), v387, *(float32x4_t *)((char *)&v493 + v108), 2), v379, *(float32x4_t *)((char *)&v493 + v108), 3);
              v108 += 16;
            }
            while (v108 != 64);
LABEL_72:
            objc_msgSend(v82, "setTransform:", *(double *)buf, *(double *)&buf[16], *(double *)&v517, *(double *)&v518);
            objc_msgSend(v82, "identifier");
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v411, "setObject:forKey:", v82, v131);

            goto LABEL_73;
          }
        }
        if (!objc_msgSend(v77, "referenceOriginChanged")
          || (objc_msgSend(v77, "referenceOriginDeltaAvailable") & 1) != 0)
        {
          if (objc_msgSend(v77, "referenceOriginDeltaAvailable"))
          {
            objc_msgSend(v77, "referenceOriginDelta");
            v393 = v114;
            *(_OWORD *)v398 = v113;
            v380 = v116;
            v388 = v115;
            objc_msgSend(v82, "referenceTransform");
            v117 = 0;
            v493 = v118;
            v494 = v119;
            v495 = v120;
            v496 = v121;
            memset(buf, 0, sizeof(buf));
            v517 = 0u;
            v518 = 0u;
            do
            {
              *(float32x4_t *)&buf[v117] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*(float32x4_t *)v398, COERCE_FLOAT(*(__int128 *)((char *)&v493 + v117))), v393, *(float32x2_t *)((char *)&v493 + v117), 1), v388, *(float32x4_t *)((char *)&v493 + v117), 2), v380, *(float32x4_t *)((char *)&v493 + v117), 3);
              v117 += 16;
            }
            while (v117 != 64);
            objc_msgSend(v82, "setReferenceTransform:", *(double *)buf, *(double *)&buf[16], *(double *)&v517, *(double *)&v518);
          }
          objc_msgSend(v77, "referenceOriginTransform");
          v394 = v123;
          *(_OWORD *)v399 = v122;
          v381 = v125;
          v389 = v124;
          objc_msgSend(v82, "referenceTransform");
          v126 = 0;
          v493 = v127;
          v494 = v128;
          v495 = v129;
          v496 = v130;
          memset(buf, 0, sizeof(buf));
          v517 = 0u;
          v518 = 0u;
          do
          {
            *(float32x4_t *)&buf[v126] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*(float32x4_t *)v399, COERCE_FLOAT(*(__int128 *)((char *)&v493 + v126))), v394, *(float32x2_t *)((char *)&v493 + v126), 1), v389, *(float32x4_t *)((char *)&v493 + v126), 2), v381, *(float32x4_t *)((char *)&v493 + v126), 3);
            v126 += 16;
          }
          while (v126 != 64);
          goto LABEL_72;
        }
        objc_msgSend(v82, "transform");
        v132 = 0;
        v493 = v133;
        v494 = v134;
        v495 = v135;
        v496 = v136;
        memset(buf, 0, sizeof(buf));
        v517 = 0u;
        v518 = 0u;
        do
        {
          *(float32x4_t *)&buf[v132] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v414, COERCE_FLOAT(*(__int128 *)((char *)&v493 + v132))), v409, *(float32x2_t *)((char *)&v493 + v132), 1), v405, *(float32x4_t *)((char *)&v493 + v132), 2), v403, *(float32x4_t *)((char *)&v493 + v132), 3);
          v132 += 16;
        }
        while (v132 != 64);
        objc_msgSend(v82, "setReferenceTransform:", *(double *)buf, *(double *)&buf[16], *(double *)&v517, *(double *)&v518);
LABEL_73:

        ++v80;
      }
      while (v80 != v374);
      v137 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v477, v512, 16);
      v374 = v137;
      if (!v137)
      {
LABEL_79:

        v25 = v413;
        break;
      }
    }
  }
  v476 = 0u;
  v475 = 0u;
  v474 = 0u;
  v473 = 0u;
  objc_msgSend(v65, "anchorsToRemove");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v473, v511, 16);
  if (v139)
  {
    v140 = v139;
    v141 = *(_QWORD *)v474;
    do
    {
      for (m = 0; m != v140; ++m)
      {
        if (*(_QWORD *)v474 != v141)
          objc_enumerationMutation(v138);
        objc_msgSend(*(id *)(*((_QWORD *)&v473 + 1) + 8 * m), "identifier");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKey:", v143);
        v144 = (void *)objc_claimAutoreleasedReturnValue();

        if (v144)
        {
          objc_msgSend(v144, "identifier");
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v407, "setObject:forKey:", v144, v145);

          objc_msgSend(v144, "identifier");
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "removeObjectForKey:", v146);

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v144, "identifier");
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v415, "_removeGeoAnchorAltitude:", v147);

          }
        }

      }
      v140 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v473, v511, 16);
    }
    while (v140);
  }

  if (ARLinkedOnOrAfterAzulC())
  {
    v472 = 0u;
    v471 = 0u;
    v470 = 0u;
    v469 = 0u;
    objc_msgSend(v65, "anchorsToStopTracking");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v469, v510, 16);
    if (v149)
    {
      v150 = v149;
      v151 = *(_QWORD *)v470;
      do
      {
        for (n = 0; n != v150; ++n)
        {
          if (*(_QWORD *)v470 != v151)
            objc_enumerationMutation(v148);
          objc_msgSend(*(id *)(*((_QWORD *)&v469 + 1) + 8 * n), "identifier");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKey:", v153);
          v154 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v155 = v154;
            if (objc_msgSend(v155, "isTracked"))
            {
              v156 = (void *)objc_msgSend(v155, "copy");
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v156, "setIsTracked:", 0);
              objc_msgSend(v156, "identifier");
              v157 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v413, "setObject:forKey:", v156, v157);

              objc_msgSend(v156, "identifier");
              v158 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v411, "setObject:forKey:", v156, v158);

              v25 = v413;
            }

          }
        }
        v150 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v469, v510, 16);
      }
      while (v150);
    }

    v65 = v355;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v356 = (void *)objc_opt_new();
  if (objc_msgSend(v65, "didRelocalize"))
  {
    objc_msgSend(v65, "worldMap");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "anchors");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    ARDictionaryFromAnchors(v161);
    v162 = (void *)objc_claimAutoreleasedReturnValue();

    v163 = v407;
    if (objc_msgSend(*(id *)(v415 + 8), "isMultiSessionMode")
      && +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.worldTracking.enableMLCMRelocalization")))
    {
      objc_msgSend(v355, "worldMap");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v164, "anchors");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      ARAnchorsForPoseGraphUpdates(v165);
      v166 = (void *)objc_claimAutoreleasedReturnValue();

      v468 = 0u;
      v467 = 0u;
      v466 = 0u;
      v465 = 0u;
      v167 = v166;
      v168 = objc_msgSend(v167, "countByEnumeratingWithState:objects:count:", &v465, v509, 16);
      if (v168)
      {
        v169 = v168;
        v170 = *(_QWORD *)v466;
        do
        {
          for (ii = 0; ii != v169; ++ii)
          {
            if (*(_QWORD *)v466 != v170)
              objc_enumerationMutation(v167);
            v172 = *(void **)(*((_QWORD *)&v465 + 1) + 8 * ii);
            _ARLogGeneral_26();
            v173 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v173, OS_LOG_TYPE_DEBUG))
            {
              v174 = (objc_class *)objc_opt_class();
              NSStringFromClass(v174);
              v175 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v172, "identifier");
              v176 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v175;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v415;
              *(_WORD *)&buf[22] = 2114;
              *(_QWORD *)&buf[24] = v176;
              _os_log_impl(&dword_1B3A68000, v173, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: skipped adding anchor loaded from world map: %{public}@", buf, 0x20u);

            }
            objc_msgSend(v172, "identifier");
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v162, "removeObjectForKey:", v177);

          }
          v169 = objc_msgSend(v167, "countByEnumeratingWithState:objects:count:", &v465, v509, 16);
        }
        while (v169);
      }

      v178 = v412;
      v25 = v413;
      v163 = v407;
    }
    else
    {
      v178 = v412;
    }
  }
  else
  {
    v162 = v159;
    v178 = v412;
    v163 = v407;
  }
  objc_msgSend(v178, "camera");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = objc_msgSend(v179, "trackingState");

  if (v180)
  {
    v464 = 0u;
    v463 = 0u;
    v462 = 0u;
    v461 = 0u;
    obj = v353;
    v181 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v461, v508, 16);
    v182 = v412;
    if (!v181)
      goto LABEL_155;
    v183 = v181;
    v390 = *(_QWORD *)v462;
    while (1)
    {
      for (jj = 0; jj != v183; ++jj)
      {
        if (*(_QWORD *)v462 != v390)
          objc_enumerationMutation(obj);
        v185 = *(void **)(*((_QWORD *)&v461 + 1) + 8 * jj);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v186 = v185;
          objc_msgSend(v182, "camera");
          v187 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v186, "setCurrentCamera:", v187);

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if (objc_msgSend((id)v415, "isUserFaceTracking"))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v182, "camera");
              v188 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v188, "transform");
              v193 = ARFrontWideCameraTransformFromBackWideAngleCameraTransformWithZFlip(v189, v190, v191, v192);
              v375 = v194;
              v382 = v193;
              v367 = v196;
              v371 = v195;

              objc_msgSend(v182, "referenceOriginTransform");
              v361 = v198;
              v363 = v197;
              v357 = v200;
              v359 = v199;
              objc_msgSend(v25, "allValues");
              v201 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v185, "anchorsForCameraWithTransform:referenceOriginTransform:existingAnchors:anchorsToRemove:", v201, v356, v382, v375, v371, v367, v363, v361, v359, v357);
              v202 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_135;
            }
          }
          if ((objc_msgSend((id)v415, "_shouldSkipAnchorCreationForData:", v185) & 1) != 0)
          {
            v202 = 0;
          }
          else
          {
            objc_msgSend(v182, "camera");
            v201 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v201, "transform");
            v376 = v204;
            v383 = v203;
            v368 = v206;
            v372 = v205;
            objc_msgSend(v182, "referenceOriginTransform");
            v362 = v208;
            v364 = v207;
            v358 = v210;
            v360 = v209;
            objc_msgSend(v25, "allValues");
            v211 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v185, "anchorsForCameraWithTransform:referenceOriginTransform:existingAnchors:anchorsToRemove:", v211, v356, v383, v376, v372, v368, v364, v362, v360, v358);
            v202 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_135:
          }
          v460 = 0u;
          v459 = 0u;
          v458 = 0u;
          v457 = 0u;
          v212 = v202;
          v213 = objc_msgSend(v212, "countByEnumeratingWithState:objects:count:", &v457, v507, 16);
          if (v213)
          {
            v214 = v213;
            v215 = *(_QWORD *)v458;
            do
            {
              for (kk = 0; kk != v214; ++kk)
              {
                if (*(_QWORD *)v458 != v215)
                  objc_enumerationMutation(v212);
                v217 = *(void **)(*((_QWORD *)&v457 + 1) + 8 * kk);
                objc_msgSend(v217, "identifier");
                v218 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v162, "setObject:forKey:", v217, v218);

              }
              v214 = objc_msgSend(v212, "countByEnumeratingWithState:objects:count:", &v457, v507, 16);
            }
            while (v214);
          }

          v182 = v412;
          v25 = v413;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v182, "referenceOriginTransform");
          v377 = v220;
          v384 = v219;
          v369 = v222;
          v373 = v221;
          objc_msgSend(v25, "allValues");
          v223 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v185, "externalAnchorsWithReferenceOriginTransform:existingAnchors:", v223, v384, v377, v373, v369);
          v224 = (void *)objc_claimAutoreleasedReturnValue();

          v455 = 0u;
          v456 = 0u;
          v453 = 0u;
          v454 = 0u;
          v225 = v224;
          v226 = objc_msgSend(v225, "countByEnumeratingWithState:objects:count:", &v453, v506, 16);
          if (v226)
          {
            v227 = v226;
            v228 = *(_QWORD *)v454;
            do
            {
              for (mm = 0; mm != v227; ++mm)
              {
                if (*(_QWORD *)v454 != v228)
                  objc_enumerationMutation(v225);
                v230 = *(void **)(*((_QWORD *)&v453 + 1) + 8 * mm);
                objc_msgSend(v230, "identifier");
                v231 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v416, "setObject:forKey:", v230, v231);

              }
              v227 = objc_msgSend(v225, "countByEnumeratingWithState:objects:count:", &v453, v506, 16);
            }
            while (v227);
          }

          v182 = v412;
        }
      }
      v183 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v461, v508, 16);
      if (!v183)
      {
LABEL_155:

        v163 = v407;
        break;
      }
    }
  }
  v451 = 0u;
  v452 = 0u;
  v449 = 0u;
  v450 = 0u;
  v232 = v356;
  v233 = objc_msgSend(v232, "countByEnumeratingWithState:objects:count:", &v449, v505, 16);
  if (v233)
  {
    v234 = v233;
    v235 = *(_QWORD *)v450;
    do
    {
      for (nn = 0; nn != v234; ++nn)
      {
        if (*(_QWORD *)v450 != v235)
          objc_enumerationMutation(v232);
        objc_msgSend(*(id *)(*((_QWORD *)&v449 + 1) + 8 * nn), "identifier");
        v237 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKey:", v237);
        v238 = (void *)objc_claimAutoreleasedReturnValue();

        if (v238)
        {
          objc_msgSend(v238, "identifier");
          v239 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v163, "setObject:forKey:", v238, v239);

          objc_msgSend(v238, "identifier");
          v240 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "removeObjectForKey:", v240);

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v238, "identifier");
            v241 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v415, "_removeGeoAnchorAltitude:", v241);

          }
        }

      }
      v234 = objc_msgSend(v232, "countByEnumeratingWithState:objects:count:", &v449, v505, 16);
    }
    while (v234);
  }

  if ((objc_msgSend(v412, "referenceOriginTransformUpdated") & 1) == 0)
  {
    v447 = 0u;
    v448 = 0u;
    v445 = 0u;
    v446 = 0u;
    objc_msgSend(v25, "allValues");
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    v243 = objc_msgSend(v242, "countByEnumeratingWithState:objects:count:", &v445, v504, 16);
    if (!v243)
      goto LABEL_179;
    v244 = v243;
    v245 = *(_QWORD *)v446;
    while (1)
    {
      for (i1 = 0; i1 != v244; ++i1)
      {
        if (*(_QWORD *)v446 != v245)
          objc_enumerationMutation(v242);
        v247 = *(void **)(*((_QWORD *)&v445 + 1) + 8 * i1);
        objc_msgSend(v247, "identifier");
        v248 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v162, "objectForKey:", v248);
        v249 = objc_claimAutoreleasedReturnValue();
        if (v249)
        {
          v250 = (void *)v249;
        }
        else
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
            continue;
          v248 = (void *)objc_msgSend(v247, "copy");
          objc_msgSend(v247, "identifier");
          v250 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKey:", v248, v250);
        }

      }
      v244 = objc_msgSend(v242, "countByEnumeratingWithState:objects:count:", &v445, v504, 16);
      if (!v244)
      {
LABEL_179:

        break;
      }
    }
  }
  v385 = v232;
  v443 = 0u;
  v444 = 0u;
  v441 = 0u;
  v442 = 0u;
  objc_msgSend(v355, "anchorsToAdd");
  v400 = (void *)objc_claimAutoreleasedReturnValue();
  v252 = objc_msgSend(v400, "countByEnumeratingWithState:objects:count:", &v441, v503, 16);
  if (v252)
  {
    v253 = v252;
    v254 = *(_QWORD *)v442;
    do
    {
      for (i2 = 0; i2 != v253; ++i2)
      {
        if (*(_QWORD *)v442 != v254)
          objc_enumerationMutation(v400);
        v256 = *(void **)(*((_QWORD *)&v441 + 1) + 8 * i2);
        objc_msgSend(v256, "identifier");
        v257 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v413, "objectForKey:", v257);
        v258 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v258)
        {
          if (objc_msgSend(v412, "referenceOriginTransformAvailable"))
          {
            objc_msgSend(v256, "transform");
            v259 = 0;
            v493 = v260;
            v494 = v261;
            v495 = v262;
            v496 = v263;
            memset(buf, 0, sizeof(buf));
            v517 = 0u;
            v518 = 0u;
            do
            {
              *(float32x4_t *)&buf[v259] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v414, COERCE_FLOAT(*(__int128 *)((char *)&v493 + v259))), v409, *(float32x2_t *)((char *)&v493 + v259), 1), v405, *(float32x4_t *)((char *)&v493 + v259), 2), v403, *(float32x4_t *)((char *)&v493 + v259), 3);
              v259 += 16;
            }
            while (v259 != 64);
            objc_msgSend(v256, "setReferenceTransform:", *(double *)buf, *(double *)&buf[16], *(double *)&v517, *(double *)&v518);
          }
          objc_msgSend(v256, "identifier");
          v264 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v407, "objectForKey:", v264);
          v265 = (void *)objc_claimAutoreleasedReturnValue();

          if (v265)
          {
            objc_msgSend(v265, "identifier");
            v266 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v407, "removeObjectForKey:", v266);

            objc_msgSend(v256, "identifier");
            v267 = (void *)objc_claimAutoreleasedReturnValue();
            v268 = v411;
          }
          else
          {
            objc_msgSend(v256, "identifier");
            v267 = (void *)objc_claimAutoreleasedReturnValue();
            v268 = v408;
          }
          objc_msgSend(v268, "setObject:forKey:", v256, v267);

          objc_msgSend(v256, "identifier");
          v269 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v413, "setObject:forKey:", v256, v269);

        }
      }
      v253 = objc_msgSend(v400, "countByEnumeratingWithState:objects:count:", &v441, v503, 16);
    }
    while (v253);
  }

  v439 = 0u;
  v440 = 0u;
  v437 = 0u;
  v438 = 0u;
  objc_msgSend(v162, "allValues");
  v401 = (void *)objc_claimAutoreleasedReturnValue();
  v270 = objc_msgSend(v401, "countByEnumeratingWithState:objects:count:", &v437, v502, 16);
  if (v270)
  {
    v271 = v270;
    v272 = *(_QWORD *)v438;
    do
    {
      for (i3 = 0; i3 != v271; ++i3)
      {
        if (*(_QWORD *)v438 != v272)
          objc_enumerationMutation(v401);
        v274 = *(void **)(*((_QWORD *)&v437 + 1) + 8 * i3);
        if (objc_msgSend(v412, "referenceOriginTransformAvailable"))
        {
          objc_msgSend(v274, "transform");
          v275 = 0;
          v493 = v276;
          v494 = v277;
          v495 = v278;
          v496 = v279;
          memset(buf, 0, sizeof(buf));
          v517 = 0u;
          v518 = 0u;
          do
          {
            *(float32x4_t *)&buf[v275] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v414, COERCE_FLOAT(*(__int128 *)((char *)&v493 + v275))), v409, *(float32x2_t *)((char *)&v493 + v275), 1), v405, *(float32x4_t *)((char *)&v493 + v275), 2), v403, *(float32x4_t *)((char *)&v493 + v275), 3);
            v275 += 16;
          }
          while (v275 != 64);
          objc_msgSend(v274, "setReferenceTransform:", *(double *)buf, *(double *)&buf[16], *(double *)&v517, *(double *)&v518);
        }
        objc_msgSend(v412, "timestamp");
        objc_msgSend(v274, "setLastUpdateTimestamp:");
        objc_msgSend(v274, "identifier");
        v280 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v413, "objectForKey:", v280);
        v281 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v274, "identifier");
        v282 = (void *)objc_claimAutoreleasedReturnValue();
        if (v281)
          v283 = v411;
        else
          v283 = v408;
        objc_msgSend(v283, "setObject:forKey:", v274, v282);

        objc_msgSend(v274, "identifier");
        v284 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v413, "setObject:forKey:", v274, v284);

      }
      v271 = objc_msgSend(v401, "countByEnumeratingWithState:objects:count:", &v437, v502, 16);
    }
    while (v271);
  }

  v435 = 0u;
  v436 = 0u;
  v433 = 0u;
  v434 = 0u;
  objc_msgSend(v355, "collaborationData");
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  v286 = objc_msgSend(v285, "countByEnumeratingWithState:objects:count:", &v433, v501, 16);
  v287 = v413;
  if (v286)
  {
    v288 = v286;
    v289 = *(_QWORD *)v434;
    v395 = v285;
    v406 = *(_QWORD *)v434;
    do
    {
      v290 = 0;
      v402 = v288;
      do
      {
        if (*(_QWORD *)v434 != v289)
          objc_enumerationMutation(v285);
        v291 = *(void **)(*((_QWORD *)&v433 + 1) + 8 * v290);
        if (objc_msgSend(v291, "vioDataType") == 1)
        {
          v410 = v290;
          objc_msgSend(v291, "anchorIdentifier");
          v292 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v287, "objectForKey:", v292);
          v293 = (id)objc_claimAutoreleasedReturnValue();

          v294 = objc_msgSend(v293, "isMemberOfClass:", objc_opt_class());
          _ARLogSession_0();
          v295 = objc_claimAutoreleasedReturnValue();
          v296 = os_log_type_enabled(v295, OS_LOG_TYPE_DEBUG);
          if (v294)
          {
            if (v296)
            {
              v297 = (objc_class *)objc_opt_class();
              NSStringFromClass(v297);
              v298 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v293, "description");
              v299 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v298;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v415;
              *(_WORD *)&buf[22] = 2112;
              *(_QWORD *)&buf[24] = v299;
              _os_log_impl(&dword_1B3A68000, v295, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Sending collaboration data with anchor: %@", buf, 0x20u);

              v287 = v413;
            }

            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v293);
            v300 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v291, "setAnchors:", v300);

            objc_msgSend((id)v415, "_sessionDidOutputCollaborationData:", v291);
          }
          else
          {
            if (v296)
            {
              v322 = (objc_class *)objc_opt_class();
              NSStringFromClass(v322);
              v323 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v291, "anchorIdentifier");
              v324 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v293, "description");
              v325 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              *(_QWORD *)&buf[4] = v323;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v415;
              v288 = v402;
              *(_WORD *)&buf[22] = 2112;
              *(_QWORD *)&buf[24] = v324;
              LOWORD(v517) = 2112;
              *(_QWORD *)((char *)&v517 + 2) = v325;
              _os_log_impl(&dword_1B3A68000, v295, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Not sending anchor data, it is not found or not a simple anchor: %@, %@", buf, 0x2Au);

              v287 = v413;
            }

          }
          v289 = v406;
        }
        else
        {
          if (objc_msgSend(v291, "vioDataType") != 3)
            goto LABEL_247;
          v404 = v291;
          v410 = v290;
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v301 = (void *)objc_claimAutoreleasedReturnValue();
          v429 = 0u;
          v430 = 0u;
          v431 = 0u;
          v432 = 0u;
          objc_msgSend(v287, "allValues");
          v302 = (void *)objc_claimAutoreleasedReturnValue();
          v303 = objc_msgSend(v302, "countByEnumeratingWithState:objects:count:", &v429, v500, 16);
          if (v303)
          {
            v304 = v303;
            v305 = *(_QWORD *)v430;
            do
            {
              for (i4 = 0; i4 != v304; ++i4)
              {
                if (*(_QWORD *)v430 != v305)
                  objc_enumerationMutation(v302);
                v307 = *(void **)(*((_QWORD *)&v429 + 1) + 8 * i4);
                if (objc_msgSend(v307, "isMemberOfClass:", objc_opt_class()))
                  objc_msgSend(v301, "addObject:", v307);
              }
              v304 = objc_msgSend(v302, "countByEnumeratingWithState:objects:count:", &v429, v500, 16);
            }
            while (v304);
          }

          v308 = (void *)objc_msgSend(v301, "copy");
          objc_msgSend(v404, "setAnchors:", v308);

          _ARLogSession_0();
          v309 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v309, OS_LOG_TYPE_DEBUG))
          {
            v310 = (objc_class *)objc_opt_class();
            NSStringFromClass(v310);
            v311 = (id)objc_claimAutoreleasedReturnValue();
            v312 = objc_msgSend(v301, "count");
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v311;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v415;
            *(_WORD *)&buf[22] = 2048;
            *(_QWORD *)&buf[24] = v312;
            _os_log_impl(&dword_1B3A68000, v309, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Sending registration data with anchors: %tu", buf, 0x20u);

          }
          v427 = 0u;
          v428 = 0u;
          v425 = 0u;
          v426 = 0u;
          v293 = v301;
          v313 = objc_msgSend(v293, "countByEnumeratingWithState:objects:count:", &v425, v499, 16);
          if (v313)
          {
            v314 = v313;
            v315 = *(_QWORD *)v426;
            do
            {
              for (i5 = 0; i5 != v314; ++i5)
              {
                if (*(_QWORD *)v426 != v315)
                  objc_enumerationMutation(v293);
                v317 = *(void **)(*((_QWORD *)&v425 + 1) + 8 * i5);
                _ARLogSession_0();
                v318 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v318, OS_LOG_TYPE_DEBUG))
                {
                  v319 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v319);
                  v320 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v317, "description");
                  v321 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  *(_QWORD *)&buf[4] = v320;
                  *(_WORD *)&buf[12] = 2048;
                  *(_QWORD *)&buf[14] = v415;
                  *(_WORD *)&buf[22] = 2112;
                  *(_QWORD *)&buf[24] = v321;
                  _os_log_impl(&dword_1B3A68000, v318, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Sending registration data with anchor: %@", buf, 0x20u);

                }
              }
              v314 = objc_msgSend(v293, "countByEnumeratingWithState:objects:count:", &v425, v499, 16);
            }
            while (v314);
          }

          objc_msgSend((id)v415, "_sessionDidOutputCollaborationData:", v404);
          v287 = v413;
          v285 = v395;
          v289 = v406;
          v288 = v402;
        }

        v290 = v410;
LABEL_247:
        ++v290;
      }
      while (v290 != v288);
      v288 = objc_msgSend(v285, "countByEnumeratingWithState:objects:count:", &v433, v501, 16);
    }
    while (v288);
  }

  v423 = 0u;
  v424 = 0u;
  v421 = 0u;
  v422 = 0u;
  objc_msgSend(v287, "allValues");
  v326 = (void *)objc_claimAutoreleasedReturnValue();
  v327 = objc_msgSend(v326, "countByEnumeratingWithState:objects:count:", &v421, v498, 16);
  if (v327)
  {
    v328 = v327;
    v329 = *(_QWORD *)v422;
    do
    {
      for (i6 = 0; i6 != v328; ++i6)
      {
        if (*(_QWORD *)v422 != v329)
          objc_enumerationMutation(v326);
        v331 = *(void **)(*((_QWORD *)&v421 + 1) + 8 * i6);
        objc_msgSend(v331, "sessionIdentifier");
        v332 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v332)
        {
          objc_msgSend((id)v415, "identifier");
          v333 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v331, "setSessionIdentifier:", v333);

        }
      }
      v328 = objc_msgSend(v326, "countByEnumeratingWithState:objects:count:", &v421, v498, 16);
    }
    while (v328);
  }

  v419 = 0u;
  v420 = 0u;
  v417 = 0u;
  v418 = 0u;
  objc_msgSend(v407, "allValues");
  v334 = (void *)objc_claimAutoreleasedReturnValue();
  v335 = objc_msgSend(v334, "countByEnumeratingWithState:objects:count:", &v417, v497, 16);
  if (v335)
  {
    v336 = v335;
    v337 = *(_QWORD *)v418;
    do
    {
      for (i7 = 0; i7 != v336; ++i7)
      {
        if (*(_QWORD *)v418 != v337)
          objc_enumerationMutation(v334);
        objc_msgSend(*(id *)(*((_QWORD *)&v417 + 1) + 8 * i7), "setSessionIdentifier:", 0);
      }
      v336 = objc_msgSend(v334, "countByEnumeratingWithState:objects:count:", &v417, v497, 16);
    }
    while (v336);
  }

  objc_msgSend(v287, "allValues");
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  ARAnchorsForPublicDelegate(v339);
  v340 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v412, "setAnchors:", v340);

  objc_msgSend(v287, "allValues");
  v341 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_230);
  v342 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v341, "filteredArrayUsingPredicate:", v342);
  v343 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v412, "setPrivateAnchors:", v343);
  objc_msgSend(v408, "allValues");
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v354, "addObjectsFromArray:", v344);

  objc_msgSend(v411, "allValues");
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v352, "addObjectsFromArray:", v345);

  objc_msgSend(v407, "allValues");
  v346 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v351, "addObjectsFromArray:", v346);

  objc_msgSend(v416, "allValues");
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v350, "addObjectsFromArray:", v347);

}

uint64_t __115__ARSession__updateAnchorsForFrame_resultDatas_context_addedAnchors_updatedAnchors_removedAnchors_externalAnchors___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHiddenFromPublicDelegate");
}

- (void)setAvailableSensors:(id)a3
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  ARSession *v12;
  ARImageSensor *imageSensor;
  ARReplaySensorProtocol *replaySensor;
  uint64_t v15;
  uint64_t v16;
  ARRemoteLocationSensor *v17;
  uint64_t v18;
  _UNKNOWN **v19;
  __objc2_class **v20;
  char **v21;
  uint64_t j;
  void *v23;
  char **v24;
  __objc2_class **v25;
  _UNKNOWN **v26;
  ARRemoteLocationSensor *v27;
  id v28;
  ARReplaySensorProtocol *v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  ARRemoteLocationSensor *locationSensor;
  void *v34;
  ARSession *v35;
  NSArray *obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  ARSession *v48;
  __int16 v49;
  ARRemoteLocationSensor *v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v35 = self;
  v6 = self->_availableSensors;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v42 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        if (objc_msgSend(v5, "indexOfObjectIdenticalTo:", v11) == 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v11, "setDelegate:", 0);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
    }
    while (v8);
  }
  v34 = v5;

  v12 = self;
  imageSensor = self->_imageSensor;
  self->_imageSensor = 0;

  replaySensor = self->_replaySensor;
  self->_replaySensor = 0;

  objc_storeStrong((id *)&self->_availableSensors, a3);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = self->_availableSensors;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v38;
    v19 = &off_1E666D000;
    v20 = off_1E666E000;
    v21 = &selRef_tracer;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v38 != v18)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v23, "setPowerUsage:", -[ARSession powerUsage](v12, "powerUsage", v34));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_storeStrong((id *)&v35->_imageSensor, v23);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v24 = v21;
          v25 = v20;
          v26 = v19;
          v27 = v23;

          v17 = v27;
          v19 = v26;
          v20 = v25;
          v21 = v24;
          v12 = v35;
        }
        if (objc_msgSend(v23, "conformsToProtocol:", v21[232], v34))
        {
          v28 = v23;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v28, "setSession:", v12);
          v29 = v12->_replaySensor;
          v12->_replaySensor = (ARReplaySensorProtocol *)v28;

        }
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
    }
    while (v16);
  }
  else
  {
    v17 = 0;
  }

  _ARLogSession_0();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v46 = v32;
    v47 = 2048;
    v48 = v12;
    v49 = 2048;
    v50 = v17;
    _os_log_impl(&dword_1B3A68000, v30, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Setting new location sensor: %p", buf, 0x20u);

  }
  locationSensor = v12->_locationSensor;
  v12->_locationSensor = v17;

}

- (id)replaySensor
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[ARSession availableSensors](self, "availableSensors", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_replaceOrAddSensor:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_availableSensors;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v7)
  {

LABEL_13:
    objc_msgSend(v5, "addObject:", v4, (_QWORD)v14);
    goto LABEL_14;
  }
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v15;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v15 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
      v13 = objc_msgSend(v12, "providedDataTypes", (_QWORD)v14);
      if ((objc_msgSend(v4, "providedDataTypes") & v13) != 0)
      {
        objc_msgSend(v12, "stop");
        -[ARSession setRunningSensors:](self, "setRunningSensors:", -[ARSession runningSensors](self, "runningSensors") & ~objc_msgSend(v12, "providedDataTypes"));
        -[ARSession setPausedSensors:](self, "setPausedSensors:", -[ARSession pausedSensors](self, "pausedSensors") & ~objc_msgSend(v12, "providedDataTypes"));
        v9 = 1;
        v12 = v4;
      }
      objc_msgSend(v5, "addObject:", v12);
    }
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  }
  while (v8);

  if ((v9 & 1) == 0)
    goto LABEL_13;
LABEL_14:
  -[ARSession setAvailableSensors:](self, "setAvailableSensors:", v5);

}

+ (id)_applySessionOverrides:(id)a3 outError:(id *)a4
{
  ARRecordingConfiguration *v6;
  _UNKNOWN **v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  _BOOL4 v24;
  const __CFString *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  __CFString *v30;
  BOOL v31;
  NSObject *v32;
  objc_class *v33;
  id v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  objc_class *v42;
  id v43;
  void *v44;
  __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  _UNKNOWN **v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  __CFString *v59;
  objc_class *v60;
  id v61;
  void *v62;
  void *v63;
  NSObject *v64;
  objc_class *v65;
  void *v66;
  objc_class *v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  objc_class *v73;
  void *v74;
  ARRecordingConfiguration *v75;
  void *v76;
  dispatch_time_t v77;
  id v78;
  ARRecordingConfiguration *v79;
  NSObject *v80;
  objc_class *v81;
  void *v82;
  id v84;
  _QWORD block[4];
  id v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  id v91;
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  id v95;
  __int16 v96;
  const __CFString *v97;
  __int16 v98;
  id v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v6 = (ARRecordingConfiguration *)a3;
  v7 = &off_1E666D000;
  v8 = +[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", CFSTR("com.apple.arkit.session.cameraPosition"));
  if (v8)
  {
    v9 = v8;
    -[ARRecordingConfiguration videoFormat](v6, "videoFormat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "captureDevicePosition");

    if (v11 != v9)
    {
      -[ARCustomTechniquesConfiguration setCameraPosition:](v6, "setCameraPosition:", v9);
      _ARLogSession_0();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = CFSTR("Front");
        *(_DWORD *)buf = 138543874;
        v93 = v14;
        if (v9 == 1)
          v15 = CFSTR("Back");
        v94 = 2048;
        v95 = a1;
        v96 = 2112;
        v97 = v15;
        _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Overriding default camera position to %@", buf, 0x20u);

      }
    }
  }
  -[ARRecordingConfiguration videoFormat](v6, "videoFormat");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[ARRecordingConfiguration videoFormat](v6, "videoFormat");
    v18 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject captureDevicePosition](v18, "captureDevicePosition") == 1)
    {
      -[ARRecordingConfiguration videoFormat](v6, "videoFormat");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "captureDeviceType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)*MEMORY[0x1E0C89FA0];

      v31 = v20 == v21;
      v7 = &off_1E666D000;
      if (!v31)
        goto LABEL_19;
      +[ARKitUserDefaults valueForKey:](ARKitUserDefaults, "valueForKey:", CFSTR("com.apple.arkit.imagesensor.back.wide.autoFocus"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
LABEL_18:

        goto LABEL_19;
      }
      -[ARConfiguration setAutoFocusEnabled:](v6, "setAutoFocusEnabled:", +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.imagesensor.back.wide.autoFocus")));
      _ARLogSession_0();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[ARConfiguration isAutoFocusEnabled](v6, "isAutoFocusEnabled");
        v25 = CFSTR("disabled");
        *(_DWORD *)buf = 138543874;
        v93 = v23;
        if (v24)
          v25 = CFSTR("enabled");
        v94 = 2048;
        v95 = a1;
        v96 = 2112;
        v97 = v25;
        _os_log_impl(&dword_1B3A68000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Image sensor auto focus %@ by user defaults", buf, 0x20u);

      }
    }

    goto LABEL_18;
  }
LABEL_19:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[ARKitUserDefaults objectForKey:](ARKitUserDefaults, "objectForKey:", CFSTR("com.apple.arkit.imagedetection.assetcatalog"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = v26;
      objc_msgSend(v27, "objectForKey:", CFSTR("path"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKey:", CFSTR("imageGroup"));
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (__CFString *)v29;
      if (v28)
        v31 = v29 == 0;
      else
        v31 = 1;
      if (v31)
      {
        _ARLogSession_0();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = (objc_class *)objc_opt_class();
          NSStringFromClass(v33);
          v34 = a1;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v93 = v35;
          v94 = 2048;
          v95 = v34;
          v96 = 2112;
          v97 = CFSTR("com.apple.arkit.imagedetection.assetcatalog");
          _os_log_impl(&dword_1B3A68000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: When using the default '%@' the options 'path' and 'recognition_group_name' need to be specified", buf, 0x20u);

          a1 = v34;
          v7 = &off_1E666D000;
        }
      }
      else
      {
        v36 = objc_msgSend(v28, "isAbsolutePath");
        if ((v36 & 1) == 0)
        {
          NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "lastObject");
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v38, "stringByAppendingPathComponent:", v28);
          v39 = objc_claimAutoreleasedReturnValue();

          v28 = (void *)v39;
        }
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v28);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        +[ARReferenceImage referenceImagesInGroupNamed:catalogURL:](ARReferenceImage, "referenceImagesInGroupNamed:catalogURL:", v30, v40);
        v32 = objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          -[ARRecordingConfiguration setDetectionImages:](v6, "setDetectionImages:", v32);
        }
        else
        {
          _ARLogSession_0();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = (objc_class *)objc_opt_class();
            NSStringFromClass(v42);
            v43 = a1;
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v93 = v44;
            v94 = 2048;
            v95 = v43;
            v96 = 2112;
            v97 = v30;
            v98 = 2112;
            v99 = v28;
            _os_log_impl(&dword_1B3A68000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: No recognition group named '%@' found in '%@'", buf, 0x2Au);

            a1 = v43;
            v7 = &off_1E666D000;
          }

        }
      }

    }
  }
  objc_msgSend(v7[481], "stringForKey:", CFSTR("com.apple.arkit.session.replay.filepath"));
  v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v45)
    goto LABEL_54;
  v46 = (void *)objc_opt_new();
  if (-[__CFString isAbsolutePath](v45, "isAbsolutePath"))
  {
    objc_msgSend(v46, "addObject:", v45);
  }
  else
  {
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "lastObject");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    NSTemporaryDirectory();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "stringByAppendingPathComponent:", v45);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addObject:", v50);

    objc_msgSend(v48, "stringByAppendingPathComponent:", v45);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addObject:", v51);

  }
  v52 = objc_msgSend(v46, "indexOfObjectPassingTest:", &__block_literal_global_384);
  if (v52 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v46, "objectAtIndex:", v52);
    v58 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v58);
    v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v60 = (objc_class *)ARReplaySensorClassForMovieURL(v59, a4);
    if (v60)
    {
      v84 = a1;
      v61 = (id)objc_msgSend([v60 alloc], "initWithSequenceURL:replayMode:", v59, 0);
      -[ARRecordingConfiguration parentImageSensorSettings](v6, "parentImageSensorSettings");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setParentImageSensorSettings:", v62);

      if (!v61)
      {
        _ARLogSession_0();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          v81 = (objc_class *)objc_opt_class();
          NSStringFromClass(v81);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v93 = v82;
          v94 = 2048;
          v95 = a1;
          v96 = 2112;
          v97 = v59;
          _os_log_impl(&dword_1B3A68000, v80, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to create replay sensor for file: %@", buf, 0x20u);

        }
        goto LABEL_67;
      }
      v91 = v61;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v91, 1);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARCustomTechniquesConfiguration setCustomSensors:](v6, "setCustomSensors:", v63);
      _ARLogSession_0();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        v65 = (objc_class *)objc_opt_class();
        NSStringFromClass(v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v93 = v66;
        v94 = 2048;
        v95 = v84;
        v96 = 2112;
        v97 = (const __CFString *)v58;
        _os_log_impl(&dword_1B3A68000, v64, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Forcing replay of sequence instead of live sensor capturing from file: %@", buf, 0x20u);

        v7 = &off_1E666D000;
      }

      a1 = v84;
    }

    if (!a4)
      goto LABEL_53;
    goto LABEL_50;
  }
  if (a4)
  {
    v53 = v7;
    v54 = (void *)MEMORY[0x1E0CB35C8];
    v89 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Replay URL points to a file which does not exist or which the app cannot access: %@"), v45);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v55;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v54;
    v7 = v53;
    objc_msgSend(v57, "errorWithDomain:code:userInfo:", CFSTR("com.apple.arkit.error"), 102, v56);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_50:
    if (*a4)
    {
      _ARLogSession_0();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        v67 = (objc_class *)objc_opt_class();
        NSStringFromClass(v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = *a4;
        *(_DWORD *)buf = 138544130;
        v93 = v68;
        v94 = 2048;
        v95 = a1;
        v96 = 2112;
        v97 = v45;
        v98 = 2112;
        v99 = v69;
        _os_log_impl(&dword_1B3A68000, v58, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Cannot force replay of file %@, because of file issue: %@", buf, 0x2Au);

      }
LABEL_67:

      v79 = 0;
      goto LABEL_68;
    }
  }
LABEL_53:

LABEL_54:
  v70 = objc_msgSend(v7[481], "integerForKey:", CFSTR("com.apple.arkit.session.forceRecording"));
  if (v70)
  {
    v71 = v70;
    _ARLogSession_0();
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      v73 = (objc_class *)objc_opt_class();
      NSStringFromClass(v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v93 = v74;
      v94 = 2048;
      v95 = a1;
      v96 = 2048;
      v97 = (const __CFString *)v71;
      _os_log_impl(&dword_1B3A68000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Forcing %li second recording", buf, 0x20u);

    }
    v75 = -[ARRecordingConfiguration initWithBaseConfiguration:fileURL:]([ARRecordingConfiguration alloc], "initWithBaseConfiguration:fileURL:", v6, 0);
    -[ARRecordingConfiguration startRecording](v75, "startRecording");
    if (v71 >= 1)
    {
      -[ARRecordingConfiguration recordingTechnique](v75, "recordingTechnique");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = dispatch_time(0, 1000000000 * v71);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__ARSession__applySessionOverrides_outError___block_invoke_389;
      block[3] = &unk_1E6673410;
      v87 = a1;
      v88 = v71;
      v86 = v76;
      v78 = v76;
      dispatch_after(v77, MEMORY[0x1E0C80D38], block);

    }
  }
  else
  {
    v75 = v6;
  }
  if (+[ARQATracer isEnabled](ARQATracer, "isEnabled"))
    -[ARConfiguration setFrameDebugOptions:](v75, "setFrameDebugOptions:", -[ARConfiguration frameDebugOptions](v75, "frameDebugOptions") | 2);
  v6 = v75;
  v79 = v6;
LABEL_68:

  return v79;
}

uint64_t __45__ARSession__applySessionOverrides_outError___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = (void *)MEMORY[0x1E0CB3620];
  v6 = a2;
  objc_msgSend(v5, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

  if ((_DWORD)v8)
    *a4 = 1;
  return v8;
}

uint64_t __45__ARSession__applySessionOverrides_outError___block_invoke_389(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _ARLogSession_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v8 = 138543874;
    v9 = v4;
    v10 = 2048;
    v11 = v5;
    v12 = 2048;
    v13 = v6;
    _os_log_impl(&dword_1B3A68000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Forcing recording end after %li seconds", (uint8_t *)&v8, 0x20u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "finishRecording");
}

- (void)captureHighResolutionFrameWithCompletion:(void *)completion
{
  -[ARSession captureHighResolutionFrameWithPhotoSettings:completion:](self, "captureHighResolutionFrameWithPhotoSettings:completion:", 0, completion);
}

- (void)captureHighResolutionFrameWithPhotoSettings:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  void *v21;
  id pendingHiResFrameCaptureCompletionBlock;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD block[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_pendingHiResFrameCaptureSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (-[ARSession state](self, "state"))
  {
    if (self->_isHiResFrameCaptureInProgress)
    {
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_pendingHiResFrameCaptureSemaphore);
      -[ARSession delegateQueue](self, "delegateQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (!v8)
      {
        v9 = MEMORY[0x1E0C80D38];
        v10 = MEMORY[0x1E0C80D38];
      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68__ARSession_captureHighResolutionFrameWithPhotoSettings_completion___block_invoke_2;
      block[3] = &unk_1E6673928;
      v27 = v7;
      dispatch_async(v9, block);
      if (!v8)

      v11 = v27;
    }
    else
    {
      v21 = (void *)MEMORY[0x1B5E2DF90](v7);
      pendingHiResFrameCaptureCompletionBlock = self->_pendingHiResFrameCaptureCompletionBlock;
      self->_pendingHiResFrameCaptureCompletionBlock = v21;

      self->_isHiResFrameCaptureInProgress = 1;
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_pendingHiResFrameCaptureSemaphore);
      -[ARSession availableSensors](self, "availableSensors");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __68__ARSession_captureHighResolutionFrameWithPhotoSettings_completion___block_invoke_3;
      v24[3] = &unk_1E6674A98;
      v25 = v6;
      objc_msgSend(v23, "enumerateObjectsUsingBlock:", v24);

      -[ARSessionMetrics recordHiResFrameCapture](self->_metrics, "recordHiResFrameCapture");
      v11 = v25;
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    ARKitCoreBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Cannot capture high-resolution frame while the session is paused."), &stru_1E6676798, CFSTR("Localizable_iOS"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = *MEMORY[0x1E0CB2D68];
    v32[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_pendingHiResFrameCaptureSemaphore);
    -[ARSession delegateQueue](self, "delegateQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v17)
    {
      v18 = MEMORY[0x1E0C80D38];
      v19 = MEMORY[0x1E0C80D38];
    }
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __68__ARSession_captureHighResolutionFrameWithPhotoSettings_completion___block_invoke;
    v28[3] = &unk_1E66748C8;
    v29 = v16;
    v30 = v7;
    v20 = v16;
    dispatch_async(v18, v28);
    if (!v17)

  }
}

void __68__ARSession_captureHighResolutionFrameWithPhotoSettings_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  ARErrorWithCodeAndUserInfo(107, *(void **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __68__ARSession_captureHighResolutionFrameWithPhotoSettings_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  ARErrorWithCodeAndUserInfo(106, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __68__ARSession_captureHighResolutionFrameWithPhotoSettings_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "captureHighResolutionFrameWithPhotoSettings:", *(_QWORD *)(a1 + 32));
    *a4 = 1;
  }

}

- (void)_updateSensorsWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  ARReplaySensorProtocol *replaySensor;
  ARReplaySensorProtocol *v9;
  CMMotionManager *v10;
  CMMotionManager *motionManger;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  CMMotionManager *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  ARIOMotionSensor *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  CMMotionManager *v26;
  ARDeviceOrientationSensor *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  NSObject *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  ARDeviceOrientationSensor *v38;
  NSObject *v39;
  objc_class *v40;
  void *v41;
  _QWORD v42[5];
  uint8_t v43[4];
  void *v44;
  __int16 v45;
  ARSession *v46;
  _BYTE buf[24];
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "customSensors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ARSession availableSensors](self, "availableSensors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "customSensors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToArray:", v7))
    {
      if ((-[ARReplaySensorProtocol finishedReplaying](self->_replaySensor, "finishedReplaying") & 1) == 0)
      {

        goto LABEL_20;
      }
      replaySensor = self->_replaySensor;
      objc_msgSend(v4, "replaySensor");
      v9 = (ARReplaySensorProtocol *)objc_claimAutoreleasedReturnValue();

      if (replaySensor == v9)
        goto LABEL_42;
    }
    else
    {

    }
    -[ARSession _stopAllSensorsWaitingForOutstandingCallbacks:](self, "_stopAllSensorsWaitingForOutstandingCallbacks:", 1);
    objc_msgSend(v4, "customSensors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARSession setAvailableSensors:](self, "setAvailableSensors:", v6);
LABEL_20:

    goto LABEL_42;
  }
  if (!self->_motionManger)
  {
    v10 = (CMMotionManager *)objc_opt_new();
    motionManger = self->_motionManger;
    self->_motionManger = v10;

    _ARLogSession_0();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = self->_motionManger;
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2048;
      v48 = (uint64_t (*)(uint64_t, uint64_t))v15;
      _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Creating new motion manager %p.", buf, 0x20u);

    }
  }
  -[ARSession configurationInternal](self, "configurationInternal");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "customSensors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {

LABEL_12:
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARSession _imageSensorForConfiguration:existingSensor:](self, "_imageSensorForConfiguration:existingSensor:", v4, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      objc_msgSend(v18, "addObject:", v19);
    if (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.session.useIOKit")))
    {
      v20 = objc_alloc_init(ARIOMotionSensor);
      _ARLogSession_0();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = self;
        _os_log_impl(&dword_1B3A68000, v21, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Using IOKit for motion sensor", buf, 0x16u);

      }
    }
    else
    {
      v20 = -[ARMotionSensor initWithMotionManager:]([ARMotionSensor alloc], "initWithMotionManager:", self->_motionManger);
      _ARLogSession_0();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = self->_motionManger;
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2048;
        v48 = (uint64_t (*)(uint64_t, uint64_t))v26;
        _os_log_impl(&dword_1B3A68000, v21, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Using CoreMotion for motion sensor (%p).", buf, 0x20u);

      }
    }

    if (v20)
      objc_msgSend(v18, "addObject:", v20);
    v27 = -[ARDeviceOrientationSensor initWithMotionManager:alignment:]([ARDeviceOrientationSensor alloc], "initWithMotionManager:alignment:", self->_motionManger, objc_msgSend(v4, "worldAlignment"));
    if (v27)
      objc_msgSend(v18, "addObject:", v27);
    v28 = (void *)objc_opt_new();
    if (v28)
      objc_msgSend(v18, "addObject:", v28);
    -[ARSession _stopAllSensorsWaitingForOutstandingCallbacks:](self, "_stopAllSensorsWaitingForOutstandingCallbacks:", 1);
    -[ARSession setAvailableSensors:](self, "setAvailableSensors:", v18);

    goto LABEL_42;
  }
  -[ARSession availableSensors](self, "availableSensors");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "count") == 0;

  if (v30)
    goto LABEL_12;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v48 = __Block_byref_object_copy__3;
  v49 = __Block_byref_object_dispose__3;
  v50 = 0;
  -[ARSession availableSensors](self, "availableSensors");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __45__ARSession__updateSensorsWithConfiguration___block_invoke;
  v42[3] = &unk_1E6674AC0;
  v42[4] = buf;
  objc_msgSend(v31, "enumerateObjectsUsingBlock:", v42);

  -[ARSession _imageSensorForConfiguration:existingSensor:](self, "_imageSensorForConfiguration:existingSensor:", v4, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    _ARLogSession_0();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v43 = 138543618;
      v44 = v35;
      v45 = 2048;
      v46 = self;
      _os_log_impl(&dword_1B3A68000, v33, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Replacing image sensor", v43, 0x16u);

    }
    -[ARSession _replaceOrAddSensor:](self, "_replaceOrAddSensor:", v32);
  }
  -[ARSession configurationInternal](self, "configurationInternal");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "worldAlignment");
  LOBYTE(v37) = v37 == objc_msgSend(v4, "worldAlignment");

  if ((v37 & 1) == 0)
  {
    v38 = -[ARDeviceOrientationSensor initWithMotionManager:alignment:]([ARDeviceOrientationSensor alloc], "initWithMotionManager:alignment:", self->_motionManger, objc_msgSend(v4, "worldAlignment"));
    if (v38)
    {
      _ARLogSession_0();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = (objc_class *)objc_opt_class();
        NSStringFromClass(v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v43 = 138543618;
        v44 = v41;
        v45 = 2048;
        v46 = self;
        _os_log_impl(&dword_1B3A68000, v39, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Replacing orientation sensor because alignment has changed", v43, 0x16u);

      }
      -[ARSession _replaceOrAddSensor:](self, "_replaceOrAddSensor:", v38);
    }

  }
  _Block_object_dispose(buf, 8);

LABEL_42:
}

void __45__ARSession__updateSensorsWithConfiguration___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if ((objc_msgSend(v7, "providedDataTypes") & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)_imageSensorForConfiguration:(id)a3 existingSensor:(id)a4
{
  ARParentImageSensor *v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  _BOOL4 v10;
  objc_class *v11;
  void *v12;
  ARParentImageSensor *v13;
  objc_class *v14;
  void *v15;
  ARParentImageSensor *v16;
  ARParentImageSensor *v17;
  int v19;
  void *v20;
  __int16 v21;
  ARSession *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = (ARParentImageSensor *)a4;
  objc_msgSend(a3, "parentImageSensorSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ARParentImageSensor canReconfigure:](v6, "canReconfigure:", v7);
  _ARLogSession_0();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v12;
      v21 = 2048;
      v22 = self;
      _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Reconfiguring existing image sensor based on new settings...", (uint8_t *)&v19, 0x16u);

    }
    -[ARParentImageSensor reconfigure:](v6, "reconfigure:", v7);
    v13 = v6;
  }
  else
  {
    if (v10)
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v15;
      v21 = 2048;
      v22 = self;
      _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Creating new image sensor, because settings are changed...", (uint8_t *)&v19, 0x16u);

    }
    v13 = -[ARParentImageSensor initWithSettings:]([ARParentImageSensor alloc], "initWithSettings:", v7);
  }
  v16 = v13;
  if (v13 == v6)
    v13 = 0;
  v17 = v13;

  return v17;
}

- (void)_startSensorsWithRequiredDataTypes:(unint64_t)a3 optionalDataTypes:(unint64_t)a4
{
  unint64_t v4;
  NSObject *v8;
  NSObject *v9;
  objc_class *v10;
  id v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  id v21;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  id v25;
  void *v26;
  NSObject *v27;
  objc_class *v28;
  id v29;
  void *v30;
  NSObject *v31;
  objc_class *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  ARSession *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a4 | a3;
  if (a4 | a3)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v8 = _os_activity_create(&dword_1B3A68000, "Start sensors", (os_activity_t)arkitActivity, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &state);

    kdebug_trace();
    _ARLogSession_0();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      ARSensorDataTypesToString(v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v44 = v11;
      v45 = 2048;
      v46 = self;
      v47 = 2112;
      v48 = v12;
      _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Starting sensors with data type(s): %@ …", buf, 0x20u);

    }
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v13 = self->_availableSensors;
    v14 = 0;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v39 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if ((objc_msgSend(v18, "providedDataTypes", (_QWORD)v38) & v4) != 0)
          {
            objc_msgSend(v18, "setDelegate:", self);
            objc_msgSend(v18, "start");
            v14 |= objc_msgSend(v18, "providedDataTypes");
          }
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
      }
      while (v15);
    }

    -[ARSession setRunningSensors:](self, "setRunningSensors:", -[ARSession runningSensors](self, "runningSensors") | v14);
    _ARLogSession_0();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      ARSensorDataTypesToString(v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v44 = v21;
      v45 = 2048;
      v46 = self;
      v47 = 2112;
      v48 = v22;
      _os_log_impl(&dword_1B3A68000, v19, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Started sensors with data type(s): %@", buf, 0x20u);

    }
    _ARLogSession_0();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      ARSensorDataTypesToString(-[ARSession runningSensors](self, "runningSensors"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v44 = v25;
      v45 = 2048;
      v46 = self;
      v47 = 2112;
      v48 = v26;
      _os_log_impl(&dword_1B3A68000, v23, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Currently running sensors with data type(s): %@", buf, 0x20u);

    }
    if ((v14 & a3) != a3)
    {
      _ARLogSession_0();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (id)objc_claimAutoreleasedReturnValue();
        ARSensorDataTypesToString(v14 & a3 ^ a3);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v44 = v29;
        v45 = 2048;
        v46 = self;
        v47 = 2112;
        v48 = v30;
        _os_log_impl(&dword_1B3A68000, v27, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to start required sensor(s) %@", buf, 0x20u);

      }
      _ARLogSession_0();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v33 = (id)objc_claimAutoreleasedReturnValue();
        ARSensorDataTypesToString(v14);
        v34 = (id)objc_claimAutoreleasedReturnValue();
        ARSensorDataTypesToString(a3);
        v35 = (id)objc_claimAutoreleasedReturnValue();
        ARSensorDataTypesToString(a4);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v44 = v33;
        v45 = 2048;
        v46 = self;
        v47 = 2112;
        v48 = v34;
        v49 = 2112;
        v50 = v35;
        v51 = 2112;
        v52 = v36;
        _os_log_impl(&dword_1B3A68000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: startedSensorDataTypes: %@  VS.  requiredDataTypes: %@ optionalDataTypes: %@", buf, 0x34u);

      }
      ARErrorWithCodeAndUserInfo(101, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARSession _sessionDidFailWithError:](self, "_sessionDidFailWithError:", v37);

    }
    -[ARSession runningSensors](self, "runningSensors", (_QWORD)v38);
    kdebug_trace();
    os_activity_scope_leave(&state);
  }
}

- (void)_configureSensorsForRecording
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[ARSession technique](self, "technique");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "techniqueOfClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = self->_availableSensors;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v10, "setRecordingMode:", 1, (_QWORD)v14);
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    if ((-[ARSession runningSensors](self, "runningSensors") & 0x40) != 0)
    {
      -[ARSession latestLocationData](self, "latestLocationData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[ARSession latestLocationData](self, "latestLocationData");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (id)objc_msgSend(v4, "processData:", v12);

      }
    }
  }

}

- (void)_stopSensorsWithDataTypes:(unint64_t)a3 keepingDataTypes:(unint64_t)a4
{
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  NSObject *v15;
  NSObject *v16;
  objc_class *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  NSObject *v26;
  objc_class *v27;
  id v28;
  void *v29;
  NSObject *v30;
  objc_class *v31;
  id v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  os_activity_scope_state_s state;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  id v45;
  __int16 v46;
  ARSession *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v8 = self->_availableSensors;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v40 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "providedDataTypes");
          if ((v13 & a3) != 0 && (v13 & a4) == 0)
          {
            objc_msgSend(v12, "setDelegate:", 0);
            objc_msgSend(v7, "addObject:", v12);
          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v7, "count"))
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      v15 = _os_activity_create(&dword_1B3A68000, "Stopping sensors", (os_activity_t)arkitActivity, OS_ACTIVITY_FLAG_DEFAULT);
      os_activity_scope_enter(v15, &state);

      kdebug_trace();
      _ARLogSession_0();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        ARSensorDataTypesToString(a3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v45 = v18;
        v46 = 2048;
        v47 = self;
        v48 = 2112;
        v49 = v19;
        _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Stopping sensors with data type(s): %@", buf, 0x20u);

      }
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v20 = v7;
      v21 = 0;
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v35;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v35 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
            objc_msgSend(v25, "stop", (_QWORD)v34);
            v21 |= objc_msgSend(v25, "providedDataTypes");
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
        }
        while (v22);
      }

      -[ARSession setRunningSensors:](self, "setRunningSensors:", -[ARSession runningSensors](self, "runningSensors") & ~v21);
      -[ARSession setPausedSensors:](self, "setPausedSensors:", -[ARSession pausedSensors](self, "pausedSensors") & ~v21);
      -[ARSession runningSensors](self, "runningSensors");
      kdebug_trace();
      _ARLogSession_0();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (id)objc_claimAutoreleasedReturnValue();
        ARSensorDataTypesToString(v21);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v45 = v28;
        v46 = 2048;
        v47 = self;
        v48 = 2112;
        v49 = v29;
        _os_log_impl(&dword_1B3A68000, v26, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Stopped sensors with data type(s): %@", buf, 0x20u);

      }
      _ARLogSession_0();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        v32 = (id)objc_claimAutoreleasedReturnValue();
        ARSensorDataTypesToString(-[ARSession runningSensors](self, "runningSensors"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v45 = v32;
        v46 = 2048;
        v47 = self;
        v48 = 2112;
        v49 = v33;
        _os_log_impl(&dword_1B3A68000, v30, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Currently running sensors with data type(s): %@", buf, 0x20u);

      }
      os_activity_scope_leave(&state);
    }

  }
}

- (void)_stopAllSensorsWaitingForOutstandingCallbacks:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  os_activity_scope_state_s state;
  _BYTE v38[128];
  _BYTE v39[128];
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  ARSession *v44;
  uint64_t v45;

  v3 = a3;
  v45 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_availableSensors, "count"))
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v5 = _os_activity_create(&dword_1B3A68000, "Stopping all sensors", (os_activity_t)arkitActivity, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v5, &state);

    -[ARSession runningSensors](self, "runningSensors");
    kdebug_trace();
    _ARLogSession_0();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v8;
      v43 = 2048;
      v44 = self;
      _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Stopping all sensors", buf, 0x16u);

    }
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v9 = self->_availableSensors;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v34;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v34 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v12++), "setDelegate:", 0);
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      }
      while (v10);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = self->_availableSensors;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v30;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v16++), "stop");
        }
        while (v14 != v16);
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
      }
      while (v14);
    }

    if (v3)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v17 = self->_availableSensors;
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v38, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v26;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v26 != v19)
              objc_enumerationMutation(v17);
            v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v20);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v21, "waitForOutstandingCallbacks", (_QWORD)v25);
            ++v20;
          }
          while (v18 != v20);
          v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v38, 16);
        }
        while (v18);
      }

    }
    -[ARSession setRunningSensors:](self, "setRunningSensors:", 0, (_QWORD)v25);
    -[ARSession setPausedSensors:](self, "setPausedSensors:", 0);
    -[ARSession runningSensors](self, "runningSensors");
    kdebug_trace();
    _ARLogSession_0();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v24;
      v43 = 2048;
      v44 = self;
      _os_log_impl(&dword_1B3A68000, v22, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Stopped all sensors", buf, 0x16u);

    }
    os_activity_scope_leave(&state);
  }
}

- (BOOL)isPrimaryImageData:(id)a3
{
  id v4;
  ARVideoFormat *primaryVideoFormat;
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  primaryVideoFormat = self->_primaryVideoFormat;
  v7 = 1;
  if (primaryVideoFormat)
  {
    v6 = -[ARVideoFormat captureDevicePosition](primaryVideoFormat, "captureDevicePosition");
    if (v6 != objc_msgSend(v4, "cameraPosition") || objc_msgSend(v4, "isHighResolution"))
      v7 = 0;
  }

  return v7;
}

- (void)sensor:(id)a3 didOutputSensorData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  ARWorldTrackingTechnique *worldTrackingTechnique;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  int v23;
  void *v24;
  ARPointCloud *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  int v34;
  ARImageData *v35;
  void *latestUltraWideImageData;
  ARImageData *v37;
  void *v38;
  void *v39;
  id v40;
  ARRecordingTechniquePublic *recordingTechnique;
  BOOL v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  int v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  int v60;
  uint64_t v61;
  char *v62;
  double v63;
  uint64_t v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  ARRecordingTechniquePublic *v69;
  _QWORD v70[4];
  id v71;
  id v72[3];
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "providedDataTypes");
  kdebug_trace();
  -[ARSession technique](self, "technique");
  v69 = (ARRecordingTechniquePublic *)objc_claimAutoreleasedReturnValue();
  -[ARSession secondaryTechnique](self, "secondaryTechnique");
  v67 = v6;
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_techniquesWantPredictedPoseForWideCam
    || ARDeviceSupportsJasper()
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    v8 = (void *)objc_opt_new();
    -[ARSession configurationInternal](self, "configurationInternal", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "videoFormat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCameraPosition:", objc_msgSend(v10, "captureDevicePosition"));

    worldTrackingTechnique = self->_worldTrackingTechnique;
    objc_msgSend(v7, "timestamp");
    -[ARWorldTrackingTechnique predictedResultDataAtTimestamp:context:](worldTrackingTechnique, "predictedResultDataAtTimestamp:context:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ar_firstObjectPassingTest:", &__block_literal_global_400);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v7;
      if (v13)
      {
        objc_msgSend(v13, "visionCameraTransform");
      }
      else
      {
        v15 = *MEMORY[0x1E0C83FF0];
        v16 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
        v17 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 32);
        v18 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 48);
      }
      objc_msgSend(v14, "setVisionCameraTransform:", *(double *)&v15, *(double *)&v16, *(double *)&v17, *(double *)&v18);
      -[ARDepthPointCloudCoalescer addDepthPointCloudData:](self->_depthPointCloudCoalescer, "addDepthPointCloudData:", v14);

    }
  }
  else
  {
    v13 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = -[ARRecordingTechniquePublic processData:](v69, "processData:", v7);
    v31 = (id)objc_msgSend(v68, "processData:", v7);
    goto LABEL_49;
  }
  v19 = v7;
  if (-[ARSession isPrimaryImageData:](self, "isPrimaryImageData:", v19))
  {
    objc_msgSend(v19, "timestamp");
    kdebug_trace();
  }
  v20 = objc_msgSend(v19, "cameraPosition", v67);
  v21 = (_QWORD *)MEMORY[0x1E0C89FA0];
  if (v20 == 1)
  {
    objc_msgSend(v19, "cameraType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", *v21);

    if (v23)
    {
      if (ARDeviceSupportsJasper())
      {
        -[ARDepthPointCloudCoalescer depthPointCloudWithPose:imageData:](self->_depthPointCloudCoalescer, "depthPointCloudWithPose:imageData:", v13, v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v25 = -[ARPointCloud initWithDepthPointCloud:]([ARPointCloud alloc], "initWithDepthPointCloud:", v24);
          objc_msgSend(v19, "setPointCloud:", v25);

        }
        if (v13)
        {
          objc_msgSend(v13, "visionCameraTransform");
        }
        else
        {
          v26 = *MEMORY[0x1E0C83FF0];
          v27 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
          v28 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 32);
          v29 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 48);
        }
        objc_msgSend(v19, "setVisionTransform:", *(double *)&v26, *(double *)&v27, *(double *)&v28, *(double *)&v29);

      }
      else if (v13)
      {
        objc_msgSend(v13, "visionCameraTransform");
        objc_msgSend(v19, "setVisionTransform:");
      }
    }
  }
  objc_msgSend(v19, "cameraType");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = *MEMORY[0x1E0C89F98];
  v34 = objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0C89F98]);

  if (v34)
  {
    v35 = (ARImageData *)v19;
    latestUltraWideImageData = self->_latestUltraWideImageData;
    self->_latestUltraWideImageData = v35;
  }
  else
  {
    objc_msgSend(v19, "cameraType");
    latestUltraWideImageData = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(latestUltraWideImageData, "isEqualToString:", *v21)
      && objc_msgSend(v19, "cameraPosition") == 1)
    {
      v37 = self->_latestUltraWideImageData;

      if (!v37)
        goto LABEL_34;
      objc_msgSend(v19, "setLatestUltraWideImage:", self->_latestUltraWideImageData);
      objc_msgSend(v19, "timestamp");
      -[ARImageData setTimestampOfSynchronizedWideImageData:](self->_latestUltraWideImageData, "setTimestampOfSynchronizedWideImageData:");
      latestUltraWideImageData = self->_latestUltraWideImageData;
      self->_latestUltraWideImageData = 0;
    }
  }

LABEL_34:
  objc_msgSend(v19, "cameraType");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v38, "isEqualToString:", v33))
  {
LABEL_37:

LABEL_38:
    if (-[ARSession isPrimaryImageData:](self, "isPrimaryImageData:", v19))
    {
      v40 = -[ARRecordingTechniquePublic processData:](v69, "processData:", v19);
      objc_msgSend(v19, "setVisionData:", 0);
    }
    else
    {
      if (objc_msgSend(v19, "isHighResolution"))
      {
        recordingTechnique = v69;
      }
      else
      {
        objc_msgSend(v19, "setSecondary:", 1);
        v46 = (id)objc_msgSend(v68, "processData:", v19);
        recordingTechnique = self->_recordingTechnique;
      }
      v47 = -[ARRecordingTechniquePublic processData:](recordingTechnique, "processData:", v19);
    }

LABEL_49:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ARSession _sessionDidOutputAudioData:](self, "_sessionDidOutputAudioData:", v7);
LABEL_75:
      kdebug_trace();
      goto LABEL_76;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v48 = v7;
      v49 = objc_msgSend(v48, "isSecondary");
      v50 = 256;
      if (v49)
        v50 = 264;
      v51 = *(id *)((char *)&self->super.isa + v50);
      if (objc_msgSend(v51, "schedulingActive") && !objc_msgSend(v48, "isHighResolution"))
      {
        v58 = objc_msgSend(v48, "captureFramesPerSecond");
        -[ARSession configurationInternal](self, "configurationInternal");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v59, "isKindOfConfiguration:", objc_opt_class());

        if (v60)
        {
          v58 = 60;
          v61 = 60 / objc_msgSend(v48, "captureFramesPerSecond");
        }
        else
        {
          v61 = 1;
        }
        objc_initWeak(&location, self);
        objc_msgSend(v51, "setExpectedFramesPerSecond:", v58);
        if (v61 >= 1)
        {
          v62 = 0;
          v63 = 1.0 / (double)v58;
          v64 = MEMORY[0x1E0C809B0];
          do
          {
            objc_msgSend(v48, "timestamp", v67);
            v66 = v63 * (double)(uint64_t)v62 + v65;
            kdebug_trace();
            v70[0] = v64;
            v70[1] = 3221225472;
            v70[2] = __40__ARSession_sensor_didOutputSensorData___block_invoke_2;
            v70[3] = &unk_1E6674B08;
            objc_copyWeak(v72, &location);
            v72[1] = *(id *)&v66;
            v71 = v48;
            v72[2] = v62;
            objc_msgSend(v51, "submitBlock:", v70);

            objc_destroyWeak(v72);
            ++v62;
          }
          while ((char *)v61 != v62);
        }
        objc_destroyWeak(&location);
      }
      else
      {
        if ((objc_msgSend(v48, "isSecondary", v67) & 1) != 0)
          -[ARSession secondaryTechnique](self, "secondaryTechnique");
        else
          -[ARSession technique](self, "technique");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (v53)
        {
          objc_msgSend(v48, "timestamp");
          kdebug_trace();
          -[ARSession _frameContextByConsumingPendingChanges](self, "_frameContextByConsumingPendingChanges");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "setImageData:", v48);
          -[ARSession latestDeviceOrientationData](self, "latestDeviceOrientationData");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "setOrientationData:", v55);

          -[ARSession latestLocationData](self, "latestLocationData");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "setLocationData:", v56);

          objc_msgSend(v48, "timestamp");
          kdebug_trace();
          objc_msgSend(v54, "imageData");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "timestamp");
          objc_msgSend(v53, "requestResultDataAtTimestamp:context:", v54);

        }
      }

      goto LABEL_75;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v52 = (void *)objc_msgSend(v7, "copy");
      -[ARSession setLatestDeviceOrientationData:](self, "setLatestDeviceOrientationData:", v52);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_75;
      v52 = (void *)objc_msgSend(v7, "copy");
      -[ARSession setLatestLocationData:](self, "setLatestLocationData:", v52);
    }

    goto LABEL_75;
  }
  -[ARVideoFormat captureDeviceType](self->_primaryVideoFormat, "captureDeviceType");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v39, "isEqualToString:", v33))
  {

    goto LABEL_37;
  }
  v42 = -[ARSession is6DofFaceTracking](self, "is6DofFaceTracking");

  if (v42)
    goto LABEL_38;
  if (self->_configuredForWorldTracking)
    v43 = -[ARWorldTrackingTechnique processData:](self->_worldTrackingTechnique, "processData:", v19);
  v44 = -[AREnvironmentTexturingTechnique processData:](self->_environmentTexturingTechnique, "processData:", v19);
  v45 = -[ARRecordingTechniquePublic processData:](self->_recordingTechnique, "processData:", v19);
  objc_msgSend(v19, "setVisionData:", 0);

LABEL_76:
}

uint64_t __40__ARSession_sensor_didOutputSensorData___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  char isKindOfClass;

  v5 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    *a4 = 1;
  return isKindOfClass & 1;
}

void __40__ARSession_sensor_didOutputSensorData___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[16];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v21 = a1;
    kdebug_trace();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v3 = WeakRetained[60];
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v23 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v9 = objc_msgSend(v8, "providedDataTypes");
            if ((v9 & ~objc_msgSend(WeakRetained, "runningSensors")) == 0)
            {
              objc_msgSend(v8, "currentData");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              if (v10)
              {
                objc_msgSend(WeakRetained, "technique");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                v12 = (id)objc_msgSend(v11, "processData:", v10);

                objc_msgSend(WeakRetained, "secondaryTechnique");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = (id)objc_msgSend(v13, "processData:", v10);

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v15 = (void *)objc_msgSend(v10, "copy");
                  objc_msgSend(WeakRetained, "setLatestDeviceOrientationData:", v15);

                }
              }

            }
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v5);
    }

    if ((objc_msgSend(*(id *)(v21 + 32), "isSecondary") & 1) != 0)
      objc_msgSend(WeakRetained, "secondaryTechnique");
    else
      objc_msgSend(WeakRetained, "technique");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      kdebug_trace();
      objc_msgSend(WeakRetained, "_frameContextByConsumingPendingChanges");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setImageData:", *(_QWORD *)(v21 + 32));
      objc_msgSend(WeakRetained, "latestDeviceOrientationData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setOrientationData:", v18);

      objc_msgSend(WeakRetained, "latestLocationData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setLocationData:", v19);

      if (*(uint64_t *)(v21 + 56) < 1)
      {
        kdebug_trace();
        -[NSObject requestResultDataAtTimestamp:context:](v16, "requestResultDataAtTimestamp:context:", v17, *(double *)(v21 + 48));
      }
      else
      {
        -[NSObject predictedResultDataAtTimestamp:context:](v16, "predictedResultDataAtTimestamp:context:", v17, *(double *)(v21 + 48));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "technique:didOutputResultData:timestamp:context:", v16, v20, v17, *(double *)(v21 + 48));

      }
    }
  }
  else
  {
    _ARLogSession_0();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_DEBUG, "Ignoring request result call, because session is nil", buf, 2u);
    }
  }

}

- (void)sensor:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  ARSession *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ARSession configurationInternal](self, "configurationInternal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isKindOfConfiguration:", objc_opt_class()))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_12;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v7, "underlyingErrors", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v14, "code") == 102)
          {
            if (_ARLogSensor_onceToken_10 != -1)
              dispatch_once(&_ARLogSensor_onceToken_10, &__block_literal_global_795);
            v15 = (void *)_ARLogSensor_logObj_10;
            if (os_log_type_enabled((os_log_t)_ARLogSensor_logObj_10, OS_LOG_TYPE_DEBUG))
            {
              v16 = v15;
              v17 = (objc_class *)objc_opt_class();
              NSStringFromClass(v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v24 = v18;
              v25 = 2048;
              v26 = self;
              v27 = 2112;
              v28 = v14;
              _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Restarting device orientation sensor with magnetic north reference frame due to %@.", buf, 0x20u);

            }
            objc_msgSend(v6, "changeReferenceFrame:", 4);
            -[ARSessionMetrics recordTrueNorthUnavailable](self->_metrics, "recordTrueNorthUnavailable");

            goto LABEL_20;
          }
        }
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
        if (v11)
          continue;
        break;
      }
    }
  }

LABEL_12:
  if (objc_msgSend(v7, "code") == 107)
    -[ARSession _sessionDidCaptureHighResolutionFrame:error:](self, "_sessionDidCaptureHighResolutionFrame:error:", 0, v7);
  else
    -[ARSession _sessionDidFailWithError:](self, "_sessionDidFailWithError:", v7);
LABEL_20:

}

- (void)sensorDidPause:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  NSObject *stateQueue;
  uint64_t v9;
  id v10;
  dispatch_time_t v11;
  NSObject *v12;
  _QWORD v13[5];
  _QWORD block[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  ARSession *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ARLogSession_0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v7;
    v18 = 2048;
    v19 = self;
    _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: begin interruption", buf, 0x16u);

  }
  stateQueue = self->_stateQueue;
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__ARSession_sensorDidPause___block_invoke;
  block[3] = &unk_1E6672118;
  block[4] = self;
  v15 = v4;
  v10 = v4;
  dispatch_async(stateQueue, block);
  v11 = dispatch_time(0, 400000000);
  v12 = self->_stateQueue;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __28__ARSession_sensorDidPause___block_invoke_3;
  v13[3] = &unk_1E6672168;
  v13[4] = self;
  dispatch_after(v11, v12, v13);

}

uint64_t __28__ARSession_sensorDidPause___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v13;
  id location;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "pausedSensors"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "sessionStopped");
    objc_msgSend(*(id *)(a1 + 32), "_getObservers");
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v2 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v16 != v4)
            objc_enumerationMutation(v2);
          v6 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v6, "sessionWasInterrupted:", *(_QWORD *)(a1 + 32));
        }
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v3);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_initWeak(&location, v7);
      objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (!v8)
      {
        v9 = MEMORY[0x1E0C80D38];
        v10 = MEMORY[0x1E0C80D38];
      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __28__ARSession_sensorDidPause___block_invoke_2;
      block[3] = &unk_1E66721B8;
      objc_copyWeak(&v13, &location);
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(v9, block);
      if (!v8)

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "setPausedSensors:", objc_msgSend(*(id *)(a1 + 32), "pausedSensors") | objc_msgSend(*(id *)(a1 + 40), "providedDataTypes"));
}

void __28__ARSession_sensorDidPause___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "sessionWasInterrupted:", *(_QWORD *)(a1 + 32));

}

void __28__ARSession_sensorDidPause___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  objc_class *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "pausedSensors"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_interruptSession");
    _ARLogSession_0();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = (objc_class *)objc_opt_class();
      NSStringFromClass(v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v9 = 138543618;
      v10 = v4;
      v11 = 2048;
      v12 = v5;
      v6 = "%{public}@ <%p>: interrupted";
LABEL_6:
      _os_log_impl(&dword_1B3A68000, v2, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0x16u);

    }
  }
  else
  {
    _ARLogSession_0();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138543618;
      v10 = v4;
      v11 = 2048;
      v12 = v8;
      v6 = "%{public}@ <%p>: cancel interruption";
      goto LABEL_6;
    }
  }

}

- (void)sensorDidRestart:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  NSObject *stateQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  ARSession *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ARLogSession_0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v7;
    v14 = 2048;
    v15 = self;
    _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: end interruption", buf, 0x16u);

  }
  stateQueue = self->_stateQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __30__ARSession_sensorDidRestart___block_invoke;
  v10[3] = &unk_1E6672118;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(stateQueue, v10);

}

void __30__ARSession_sensorDidRestart___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _QWORD block[5];
  id v15;
  id location;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setPausedSensors:", objc_msgSend(*(id *)(a1 + 32), "pausedSensors") & ~objc_msgSend(*(id *)(a1 + 40), "providedDataTypes"));
  if (!objc_msgSend(*(id *)(a1 + 32), "pausedSensors"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_endInterruption");
    v2 = *(_QWORD **)(a1 + 32);
    v3 = (void *)v2[65];
    objc_msgSend(v2, "configurationInternal");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sessionStarted:withConfiguration:", v2, v4);

    objc_msgSend(*(id *)(a1 + 32), "_getObservers");
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "sessionInterruptionEnded:", *(_QWORD *)(a1 + 32));
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v6);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_initWeak(&location, v10);
      objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (!v11)
      {
        v12 = MEMORY[0x1E0C80D38];
        v13 = MEMORY[0x1E0C80D38];
      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __30__ARSession_sensorDidRestart___block_invoke_2;
      block[3] = &unk_1E66721B8;
      objc_copyWeak(&v15, &location);
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(v12, block);
      if (!v11)

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }

  }
}

void __30__ARSession_sensorDidRestart___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "sessionInterruptionEnded:", *(_QWORD *)(a1 + 32));

}

- (void)_sessionWillRunWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ARSession _getObservers](self, "_getObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "session:willRunWithConfiguration:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_sessionRequestedRunWithConfiguration:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ARSession _getObservers](self, "_getObservers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "session:requestedRunWithConfiguration:options:", self, v6, a4);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)_sessionDidUpdateFrame:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSUInteger v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  _QWORD block[5];
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE location[12];
  __int16 v30;
  ARSession *v31;
  __int16 v32;
  NSUInteger v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "timestamp");
  kdebug_trace();
  v5 = (void *)objc_msgSend(v4, "capturedImage");
  v6 = os_unfair_lock_lock_with_options();
  v7 = (void *)MEMORY[0x1B5E2DDB0](v6);
  -[NSPointerArray ar_compactZeroedWeakPointers](self->_weakPixelBuffers, "ar_compactZeroedWeakPointers");
  if (-[NSPointerArray count](self->_weakPixelBuffers, "count")
    && -[NSPointerArray pointerAtIndex:](self->_weakPixelBuffers, "pointerAtIndex:", -[NSPointerArray count](self->_weakPixelBuffers, "count") - 1) != v5)
  {
    -[NSPointerArray addPointer:](self->_weakPixelBuffers, "addPointer:", v5);
  }
  objc_autoreleasePoolPop(v7);
  v8 = -[NSPointerArray count](self->_weakPixelBuffers, "count");
  os_unfair_lock_unlock(&self->_weakPixelBuffersLock);
  if (v8 < 0xB || self->_replaySensor)
  {
    -[ARSession _getObservers](self, "_getObservers");
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v13, "session:didUpdateFrame:", self, v4);
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v10);
    }

    -[ARSession delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_initWeak((id *)location, v14);
      -[ARSession delegateQueue](self, "delegateQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (!v15)
      {
        v16 = MEMORY[0x1E0C80D38];
        v17 = MEMORY[0x1E0C80D38];
      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __36__ARSession__sessionDidUpdateFrame___block_invoke;
      block[3] = &unk_1E6674B30;
      objc_copyWeak(&v23, (id *)location);
      block[4] = self;
      v22 = v4;
      dispatch_async(v16, block);
      if (!v15)

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)location);
    }
    objc_msgSend(v4, "timestamp");
    kdebug_trace();

  }
  else
  {
    _ARLogSession_0();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543874;
      *(_QWORD *)&location[4] = v20;
      v30 = 2048;
      v31 = self;
      v32 = 2048;
      v33 = v8;
      _os_log_impl(&dword_1B3A68000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: The delegate of ARSession is retaining %lu ARFrames. The camera will stop delivering camera images if the delegate keeps holding on to too many ARFrames. This could be a threading or memory management issue in the delegate and should be fixed.", location, 0x20u);

    }
    objc_msgSend(v4, "timestamp");
    kdebug_trace();
    kdebug_trace();
  }

}

void __36__ARSession__sessionDidUpdateFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "session:didUpdateFrame:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_sessionDidCaptureHighResolutionFrame:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id pendingHiResFrameCaptureCompletionBlock;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_pendingHiResFrameCaptureSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (self->_pendingHiResFrameCaptureCompletionBlock)
  {
    self->_isHiResFrameCaptureInProgress = 0;
    v8 = (void *)MEMORY[0x1B5E2DF90]();
    pendingHiResFrameCaptureCompletionBlock = self->_pendingHiResFrameCaptureCompletionBlock;
    self->_pendingHiResFrameCaptureCompletionBlock = 0;

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_pendingHiResFrameCaptureSemaphore);
    if (v8)
    {
      -[ARSession delegateQueue](self, "delegateQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (!v10)
      {
        v11 = MEMORY[0x1E0C80D38];
        v12 = MEMORY[0x1E0C80D38];
      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57__ARSession__sessionDidCaptureHighResolutionFrame_error___block_invoke;
      block[3] = &unk_1E6674878;
      v17 = v8;
      v15 = v6;
      v16 = v7;
      v13 = v8;
      dispatch_async(v11, block);
      if (!v10)

    }
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_pendingHiResFrameCaptureSemaphore);
  }

}

uint64_t __57__ARSession__sessionDidCaptureHighResolutionFrame_error___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_sessionCameraDidChangeTrackingState:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  os_activity_scope_state_s state;
  uint8_t v28[128];
  uint8_t buf[4];
  id v30;
  __int16 v31;
  ARSession *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "trackingState");
  objc_msgSend(v4, "trackingStateReason");
  kdebug_trace();
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = _os_activity_create(&dword_1B3A68000, "Tracking state changed", (os_activity_t)arkitActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  _ARLogSession_0();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    ARTrackingStateToString(objc_msgSend(v4, "trackingState"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    ARTrackingStateReasonToString(objc_msgSend(v4, "trackingStateReason"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v30 = v8;
    v31 = 2048;
    v32 = self;
    v33 = 2112;
    v34 = v9;
    v35 = 2112;
    v36 = v10;
    _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Tracking state changed: %@ reason: %@", buf, 0x2Au);

  }
  -[ARSession _getObservers](self, "_getObservers");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v15, "session:cameraDidChangeTrackingState:", self, v4);
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v12);
  }

  -[ARSession delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak((id *)buf, v16);
    -[ARSession delegateQueue](self, "delegateQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v17)
    {
      v18 = MEMORY[0x1E0C80D38];
      v19 = MEMORY[0x1E0C80D38];
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__ARSession__sessionCameraDidChangeTrackingState___block_invoke;
    block[3] = &unk_1E6674B30;
    objc_copyWeak(&v22, (id *)buf);
    block[4] = self;
    v21 = v4;
    dispatch_async(v18, block);
    if (!v17)

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  objc_msgSend(v4, "trackingState");
  objc_msgSend(v4, "trackingStateReason");
  kdebug_trace();

  os_activity_scope_leave(&state);
}

void __50__ARSession__sessionCameraDidChangeTrackingState___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "session:cameraDidChangeTrackingState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_sessionDidFailWithError:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  ARSession *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ARLogSession_0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v26 = v7;
    v27 = 2048;
    v28 = self;
    v29 = 2112;
    v30 = v4;
    _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: did fail with error: %@", buf, 0x20u);

  }
  -[ARSessionMetrics reportSessionFailure:](self->_metrics, "reportSessionFailure:", v4);
  objc_msgSend(v4, "code");
  kdebug_trace();
  -[ARSession pause](self, "pause");
  -[ARSession _getObservers](self, "_getObservers");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "session:didFailWithError:", self, v4);
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  -[ARSession delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak((id *)buf, v13);
    -[ARSession delegateQueue](self, "delegateQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14)
    {
      v15 = MEMORY[0x1E0C80D38];
      v16 = MEMORY[0x1E0C80D38];
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__ARSession__sessionDidFailWithError___block_invoke;
    block[3] = &unk_1E6674B30;
    objc_copyWeak(&v19, (id *)buf);
    block[4] = self;
    v18 = v4;
    dispatch_async(v15, block);
    if (!v14)

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  objc_msgSend(v4, "code");
  kdebug_trace();

}

void __38__ARSession__sessionDidFailWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "session:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_sessionDidAddAnchors:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  ARSession *v20;
  id v21;
  id v22;
  id location;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  os_activity_scope_state_s state;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "count");
  kdebug_trace();
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = _os_activity_create(&dword_1B3A68000, "Did add anchors", (os_activity_t)arkitActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  -[ARSession _getObservers](self, "_getObservers");
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "session:didAddAnchors:", self, v4);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }

  ARAnchorsForPublicDelegate(v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    -[ARSession delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_initWeak(&location, v12);
      -[ARSession delegateQueue](self, "delegateQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (!v13)
      {
        v14 = MEMORY[0x1E0C80D38];
        v15 = MEMORY[0x1E0C80D38];
      }
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __35__ARSession__sessionDidAddAnchors___block_invoke;
      v19 = &unk_1E6674B30;
      objc_copyWeak(&v22, &location);
      v20 = self;
      v21 = v11;
      dispatch_async(v14, &v16);
      if (!v13)

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }

  }
  objc_msgSend(v4, "count", v16, v17, v18, v19, v20);
  kdebug_trace();

  os_activity_scope_leave(&state);
}

void __35__ARSession__sessionDidAddAnchors___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "session:didAddAnchors:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_sessionDidUpdateAnchors:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  ARSession *v19;
  id v20;
  id v21;
  id location;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "count");
  kdebug_trace();
  -[ARSession _getObservers](self, "_getObservers");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "session:didUpdateAnchors:", self, v4);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }

  ARAnchorsForPublicDelegate(v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    -[ARSession delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_initWeak(&location, v11);
      -[ARSession delegateQueue](self, "delegateQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (!v12)
      {
        v13 = MEMORY[0x1E0C80D38];
        v14 = MEMORY[0x1E0C80D38];
      }
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __38__ARSession__sessionDidUpdateAnchors___block_invoke;
      v18 = &unk_1E6674B30;
      objc_copyWeak(&v21, &location);
      v19 = self;
      v20 = v10;
      dispatch_async(v13, &v15);
      if (!v12)

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }

  }
  objc_msgSend(v4, "count", v15, v16, v17, v18, v19);
  kdebug_trace();

}

void __38__ARSession__sessionDidUpdateAnchors___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "session:didUpdateAnchors:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_sessionDidRemoveAnchors:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  ARSession *v19;
  id v20;
  id v21;
  id location;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "count");
  kdebug_trace();
  -[ARSession _getObservers](self, "_getObservers");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "session:didRemoveAnchors:", self, v4);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }

  ARAnchorsForPublicDelegate(v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    -[ARSession delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_initWeak(&location, v11);
      -[ARSession delegateQueue](self, "delegateQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (!v12)
      {
        v13 = MEMORY[0x1E0C80D38];
        v14 = MEMORY[0x1E0C80D38];
      }
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __38__ARSession__sessionDidRemoveAnchors___block_invoke;
      v18 = &unk_1E6674B30;
      objc_copyWeak(&v21, &location);
      v19 = self;
      v20 = v10;
      dispatch_async(v13, &v15);
      if (!v12)

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }

  }
  objc_msgSend(v4, "count", v15, v16, v17, v18, v19);
  kdebug_trace();

}

void __38__ARSession__sessionDidRemoveAnchors___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "session:didRemoveAnchors:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_sessionDidUpdateExternalAnchors:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "count");
  kdebug_trace();
  -[ARSession _getObservers](self, "_getObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "session:didUpdateExternalAnchors:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  objc_msgSend(v4, "count");
  kdebug_trace();

}

- (void)_sessionShouldAttemptRelocalization
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *stateQueue;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id obj;
  _QWORD v15[5];
  id v16;
  id v17;
  id from;
  _QWORD block[6];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[6];
  id v26;
  _QWORD v27[3];
  char v28;
  id location;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v28 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __48__ARSession__sessionShouldAttemptRelocalization__block_invoke;
  v25[3] = &unk_1E6674B58;
  v25[4] = self;
  objc_copyWeak(&v26, &location);
  v25[5] = v27;
  v3 = (void *)MEMORY[0x1B5E2DF90](v25);
  -[ARSession _getObservers](self, "_getObservers");
  v23 = 0u;
  v24 = 0u;
  v22 = 0u;
  v21 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          stateQueue = self->_stateQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __48__ARSession__sessionShouldAttemptRelocalization__block_invoke_432;
          block[3] = &unk_1E6674878;
          v9 = v3;
          block[5] = self;
          v20 = v9;
          block[4] = v7;
          dispatch_async(stateQueue, block);

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "sessionShouldAttemptRelocalization:completion:", self, v3);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    }
    while (v4);
  }

  -[ARSession delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&from, v10);
    -[ARSession delegateQueue](self, "delegateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
    {
      v12 = MEMORY[0x1E0C80D38];
      v13 = MEMORY[0x1E0C80D38];
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __48__ARSession__sessionShouldAttemptRelocalization__block_invoke_2;
    v15[3] = &unk_1E6674B80;
    v16 = v3;
    objc_copyWeak(&v17, &from);
    v15[4] = self;
    dispatch_async(v12, v15);
    if (!v11)

    objc_destroyWeak(&v17);
    objc_destroyWeak(&from);
  }

  objc_destroyWeak(&v26);
  _Block_object_dispose(v27, 8);
  objc_destroyWeak(&location);
}

void __48__ARSession__sessionShouldAttemptRelocalization__block_invoke(uint64_t a1, int a2)
{
  _BYTE *WeakRetained;
  _BYTE *v5;
  uint64_t v6;
  BOOL v7;
  NSObject *v8;
  _BOOL4 v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 136), 0xFFFFFFFFFFFFFFFFLL);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v6 + 24))
    v7 = 1;
  else
    v7 = WeakRetained == 0;
  if (!v7)
  {
    *(_BYTE *)(v6 + 24) = 1;
    if (objc_msgSend(WeakRetained, "relocalizing"))
    {
      _ARLogSession_0();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
      if (a2)
      {
        if (v9)
        {
          v10 = (objc_class *)objc_opt_class();
          NSStringFromClass(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = *(_QWORD *)(a1 + 32);
          v18 = 138543618;
          v19 = v11;
          v20 = 2048;
          v21 = v12;
          _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: developer asked for relocalization", (uint8_t *)&v18, 0x16u);

        }
        v5[232] = 1;
      }
      else
      {
        if (v9)
        {
          v13 = (objc_class *)objc_opt_class();
          NSStringFromClass(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = *(_QWORD *)(a1 + 32);
          v18 = 138543618;
          v19 = v14;
          v20 = 2048;
          v21 = v15;
          _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: developer specifically declined relocalization", (uint8_t *)&v18, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)*((_QWORD *)v5 + 28);
        *((_QWORD *)v5 + 28) = v16;

      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 136));

}

uint64_t __48__ARSession__sessionShouldAttemptRelocalization__block_invoke_432(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "sessionShouldAttemptRelocalization:", *(_QWORD *)(a1 + 40)));
}

void __48__ARSession__sessionShouldAttemptRelocalization__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(WeakRetained, "sessionShouldAttemptRelocalization:", *(_QWORD *)(a1 + 32)));

}

- (void)_sessionDidOutputAudioData:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id location;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "timestamp");
  kdebug_trace();
  -[ARSession _getObservers](self, "_getObservers");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "session:didOutputAudioSampleBuffer:", self, objc_msgSend(v4, "sampleBuffer"));
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  -[ARSession delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, v10);
    -[ARSession delegateQueue](self, "delegateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
    {
      v12 = MEMORY[0x1E0C80D38];
      v13 = MEMORY[0x1E0C80D38];
    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __40__ARSession__sessionDidOutputAudioData___block_invoke;
    v14[3] = &unk_1E6674B30;
    objc_copyWeak(&v16, &location);
    v14[4] = self;
    v15 = v4;
    dispatch_async(v12, v14);
    if (!v11)

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

void __40__ARSession__sessionDidOutputAudioData___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "session:didOutputAudioSampleBuffer:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "sampleBuffer"));

}

- (void)_sessionDidOutputCollaborationData:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  ARSession *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ARLogSession_0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromARCollaborationData(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v7;
    v29 = 2048;
    v30 = self;
    v31 = 2112;
    v32 = v8;
    _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: didOutputCollaborationData: %@", buf, 0x20u);

  }
  objc_msgSend(v4, "timestamp");
  objc_msgSend(v4, "vioDataType");
  objc_msgSend(v4, "vioData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "length");
  kdebug_trace();

  -[ARSession _getObservers](self, "_getObservers");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "session:didOutputCollaborationData:", self, v4);
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  -[ARSession delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak((id *)buf, v15);
    -[ARSession delegateQueue](self, "delegateQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!v16)
    {
      v17 = MEMORY[0x1E0C80D38];
      v18 = MEMORY[0x1E0C80D38];
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__ARSession__sessionDidOutputCollaborationData___block_invoke;
    block[3] = &unk_1E6674B30;
    objc_copyWeak(&v21, (id *)buf);
    block[4] = self;
    v20 = v4;
    dispatch_async(v17, block);
    if (!v16)

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  -[ARRecordingTechniquePublic recordCollaborationData:localSession:](self->_recordingTechnique, "recordCollaborationData:localSession:", v4, 1);
  objc_msgSend(v4, "timestamp");
  kdebug_trace();

}

void __48__ARSession__sessionDidOutputCollaborationData___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "session:didOutputCollaborationData:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_sessionDidChangeGeoTrackingStatus:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  ARSession *v18;
  id v19;
  id v20;
  id location;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "state");
  objc_msgSend(v4, "stateReason");
  objc_msgSend(v4, "accuracy");
  kdebug_trace();
  -[ARSession _getObservers](self, "_getObservers");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "session:didChangeGeoTrackingStatus:", self, v4);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }

  -[ARSession delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, v10);
    -[ARSession delegateQueue](self, "delegateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
    {
      v12 = MEMORY[0x1E0C80D38];
      v13 = MEMORY[0x1E0C80D38];
    }
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __48__ARSession__sessionDidChangeGeoTrackingStatus___block_invoke;
    v17 = &unk_1E6674B30;
    objc_copyWeak(&v20, &location);
    v18 = self;
    v19 = v4;
    dispatch_async(v12, &v14);
    if (!v11)

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  objc_msgSend(v4, "state", v14, v15, v16, v17, v18);
  objc_msgSend(v4, "stateReason");
  objc_msgSend(v4, "accuracy");
  kdebug_trace();

}

void __48__ARSession__sessionDidChangeGeoTrackingStatus___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "session:didChangeGeoTrackingStatus:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_sessionDidUpdateSpatialMappingPointClouds:(id)a3
{
  id v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_observers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "session:didUpdateSpatialMappingPointClouds:", self, v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)technique:(id)a3 didChangeState:(int64_t)a4
{
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  ARSession *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a4 == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "ar_UUIDWithIntegerValue:", objc_msgSend(a3, "vioSessionIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARSession setIdentifier:](self, "setIdentifier:", v5);

    _ARLogSession_0();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARSession identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v8;
      v12 = 2048;
      v13 = self;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: identifier changed to %@", (uint8_t *)&v10, 0x20u);

    }
  }
}

- (void)technique:(id)a3 didOutputCollaborationData:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  ARSession *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _ARLogSession_0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromARCollaborationData(v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544130;
    v13 = v10;
    v14 = 2048;
    v15 = self;
    v16 = 2048;
    v17 = v6;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Technique (%p) didOutputCollaborationData: %@", (uint8_t *)&v12, 0x2Au);

  }
  if (objc_msgSend(v7, "vioDataType") == 1 || objc_msgSend(v7, "vioDataType") == 3)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_frameContextHandlerSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    -[ARFrameContextHandler addCollaborationData:](self->_frameContextHandler, "addCollaborationData:", v7);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_frameContextHandlerSemaphore);
  }
  else
  {
    -[ARSession _sessionDidOutputCollaborationData:](self, "_sessionDidOutputCollaborationData:", v7);
  }

}

- (BOOL)is6DofFaceTracking
{
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;

  -[ARSession configurationInternal](self, "configurationInternal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[ARSession configurationInternal](self, "configurationInternal");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "templateConfiguration");
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(v3, "isWorldTrackingEnabled");
  else
    v6 = 0;

  return v6;
}

- (BOOL)isUserFaceTracking
{
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;

  -[ARSession configurationInternal](self, "configurationInternal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[ARSession configurationInternal](self, "configurationInternal");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "templateConfiguration");
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(v3, "userFaceTrackingEnabled");
  else
    v6 = 0;

  return v6;
}

- (void)_saveGraphFileInFileName:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  ARSession *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.session.configuration.saveDotGraph")))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", CFSTR("digraph g { "));
    objc_msgSend(v5, "addObject:", CFSTR("node [shape=record]"));
    -[ARSession technique](self, "technique");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dotGraphWithLines:", v5);

    objc_msgSend(v5, "addObject:", CFSTR("}"));
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSTemporaryDirectory();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARSession configurationInternal](self, "configurationInternal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("%@.dot"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0;
    objc_msgSend(v7, "writeToFile:atomically:encoding:error:", v12, 1, 4, &v20);
    v13 = v20;
    _ARLogGeneral_26();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v22 = v17;
        v23 = 2048;
        v24 = self;
        v25 = 2112;
        v26 = v13;
        _os_log_impl(&dword_1B3A68000, v15, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Graph: Could not write dot graph to file. Error: %@", buf, 0x20u);

      }
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v22 = v19;
        v23 = 2048;
        v24 = self;
        v25 = 2114;
        v26 = v12;
        _os_log_impl(&dword_1B3A68000, v15, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Graph: Successfully wrote the configuration's dot file to '%{public}@'", buf, 0x20u);

      }
      if (a3)
        *a3 = objc_retainAutorelease(v12);
    }

  }
}

+ (void)setRenderType:(unint64_t)a3
{
  +[ARSessionMetrics setRenderType:](ARSessionMetrics, "setRenderType:", a3);
}

- (ARParentTechnique)technique
{
  return (ARParentTechnique *)objc_getProperty(self, a2, 424, 1);
}

- (void)setTechnique:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (ARParentTechnique)secondaryTechnique
{
  return (ARParentTechnique *)objc_getProperty(self, a2, 432, 1);
}

- (void)setSecondaryTechnique:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 440, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (dispatch_queue_t)delegateQueue
{
  return (dispatch_queue_t)self->_delegateQueue;
}

- (void)setDelegateQueue:(dispatch_queue_t)delegateQueue
{
  objc_storeStrong((id *)&self->_delegateQueue, delegateQueue);
}

- (unint64_t)state
{
  return self->_state;
}

- (ARConfiguration)configurationInternal
{
  return (ARConfiguration *)objc_getProperty(self, a2, 472, 1);
}

- (void)setConfigurationInternal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 472);
}

- (NSArray)availableSensors
{
  return self->_availableSensors;
}

- (unint64_t)runningSensors
{
  return self->_runningSensors;
}

- (void)setRunningSensors:(unint64_t)a3
{
  self->_runningSensors = a3;
}

- (unint64_t)pausedSensors
{
  return self->_pausedSensors;
}

- (void)setPausedSensors:(unint64_t)a3
{
  self->_pausedSensors = a3;
}

- (unint64_t)powerUsage
{
  return self->_powerUsage;
}

- (void)setPowerUsage:(unint64_t)a3
{
  self->_powerUsage = a3;
}

- (BOOL)forceAddSceneReconstructionKeyframePointCloudWithColor
{
  return self->_forceAddSceneReconstructionKeyframePointCloudWithColor;
}

- (void)setForceAddSceneReconstructionKeyframePointCloudWithColor:(BOOL)a3
{
  self->_forceAddSceneReconstructionKeyframePointCloudWithColor = a3;
}

- (ARQATracer)tracer
{
  return self->_tracer;
}

- (void)setTracer:(id)a3
{
  objc_storeStrong((id *)&self->_tracer, a3);
}

- (ARSessionMetrics)metrics
{
  return self->_metrics;
}

- (ARDeviceOrientationData)latestDeviceOrientationData
{
  return (ARDeviceOrientationData *)objc_getProperty(self, a2, 528, 1);
}

- (void)setLatestDeviceOrientationData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 528);
}

- (ARLocationData)latestLocationData
{
  return (ARLocationData *)objc_getProperty(self, a2, 536, 1);
}

- (void)setLatestLocationData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 536);
}

- (ARRemoteGeoTrackingTechnique)geoTrackingTechnique
{
  return self->_geoTrackingTechnique;
}

- (BOOL)relocalizing
{
  return self->_relocalizing;
}

- (void)setRelocalizing:(BOOL)a3
{
  self->_relocalizing = a3;
}

- (NSMutableDictionary)geoAnchorToAltitude
{
  return self->_geoAnchorToAltitude;
}

- (void)setGeoAnchorToAltitude:(id)a3
{
  objc_storeStrong((id *)&self->_geoAnchorToAltitude, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoAnchorToAltitude, 0);
  objc_storeStrong((id *)&self->_geoTrackingTechnique, 0);
  objc_storeStrong((id *)&self->_latestLocationData, 0);
  objc_storeStrong((id *)&self->_latestDeviceOrientationData, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_tracer, 0);
  objc_storeStrong((id *)&self->_availableSensors, 0);
  objc_storeStrong((id *)&self->_configurationInternal, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dontUseDirectlySecondaryTechnique, 0);
  objc_storeStrong((id *)&self->_dontUseDirectlyTechnique, 0);
  objc_storeStrong((id *)&self->_recon3DLogging, 0);
  objc_storeStrong((id *)&self->_pendingHiResFrameCaptureSemaphore, 0);
  objc_storeStrong(&self->_pendingHiResFrameCaptureCompletionBlock, 0);
  objc_storeStrong((id *)&self->_weakPixelBuffers, 0);
  objc_storeStrong((id *)&self->_depthPointCloudCoalescer, 0);
  objc_storeStrong((id *)&self->_latestUltraWideImageData, 0);
  objc_storeStrong((id *)&self->_primaryVideoFormat, 0);
  objc_storeStrong((id *)&self->_bksAccelerometer, 0);
  objc_storeStrong((id *)&self->_trackedRaycastPostProcessor, 0);
  objc_storeStrong((id *)&self->_resultDataOfSecondaryFrameContextsSemaphore, 0);
  objc_storeStrong((id *)&self->resultDatasOfSecondaryFrameContexts, 0);
  objc_storeStrong((id *)&self->_replaySensor, 0);
  objc_storeStrong((id *)&self->_locationSensor, 0);
  objc_storeStrong((id *)&self->_imageSensor, 0);
  objc_storeStrong((id *)&self->_prepareTechniquesQueue, 0);
  objc_storeStrong((id *)&self->_secondaryResultRequestScheduler, 0);
  objc_storeStrong((id *)&self->_resultRequestScheduler, 0);
  objc_storeStrong((id *)&self->_relocalizationTimeoutDate, 0);
  objc_storeStrong((id *)&self->_motionManger, 0);
  objc_storeStrong(&self->_thermalStateObserver, 0);
  objc_storeStrong((id *)&self->_observersSemaphore, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_frameContextHandlerSemaphore, 0);
  objc_storeStrong((id *)&self->_frameContextHandler, 0);
  objc_storeStrong((id *)&self->_lastProcessedFrameSemaphore, 0);
  objc_storeStrong((id *)&self->_lastProcessedFrame, 0);
  objc_storeStrong((id *)&self->_lastPredictedFrameSemaphore, 0);
  objc_storeStrong((id *)&self->_recordingTechnique, 0);
  objc_storeStrong((id *)&self->_environmentTexturingTechnique, 0);
  objc_storeStrong((id *)&self->_worldTrackingTechnique, 0);
}

@end
