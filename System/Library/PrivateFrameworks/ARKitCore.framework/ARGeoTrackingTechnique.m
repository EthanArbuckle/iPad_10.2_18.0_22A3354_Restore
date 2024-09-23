@implementation ARGeoTrackingTechnique

- (ARGeoTrackingTechnique)init
{
  ARGeoTrackingTechnique *v2;
  ARGeoTrackingTechnique *v3;
  uint64_t v4;
  OS_dispatch_queue *visualLocalizationQueue;
  float v6;
  float v7;
  float v8;
  _BOOL4 v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  ARGeoTrackingTechniqueState *v17;
  ARGeoTrackingTechniqueState *state;
  double v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  double maxHorizontalAccuracy;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  ARGeoTrackingTechnique *v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)ARGeoTrackingTechnique;
  v2 = -[ARTechnique init](&v25, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_resultLock._os_unfair_lock_opaque = 0;
    ARCreateFixedPriorityDispatchQueue("com.apple.arkit.visualLocalizationQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    visualLocalizationQueue = v3->_visualLocalizationQueue;
    v3->_visualLocalizationQueue = (OS_dispatch_queue *)v4;

    v3->_resetLock._os_unfair_lock_opaque = 0;
    -[ARGeoTrackingTechnique setVLPoseEstimationExecuting:](v3, "setVLPoseEstimationExecuting:", 0);
    +[ARKitUserDefaults floatForKey:](ARKitUserDefaults, "floatForKey:", CFSTR("com.apple.arkit.geotracking.visualLocalizationCallInterval"));
    -[ARGeoTrackingTechnique setVisualLocalizationCallInterval:](v3, "setVisualLocalizationCallInterval:", v6);
    +[ARKitUserDefaults floatForKey:](ARKitUserDefaults, "floatForKey:", CFSTR("com.apple.arkit.geotracking.posteriorVisualLocalizationCallInterval"));
    -[ARGeoTrackingTechnique setPosteriorVisualLocalizationCallInterval:](v3, "setPosteriorVisualLocalizationCallInterval:", v7);
    +[ARKitUserDefaults floatForKey:](ARKitUserDefaults, "floatForKey:", CFSTR("com.apple.arkit.geotracking.visualLocalizationCallIntervalTimeThreshold"));
    -[ARGeoTrackingTechnique setVisualLocalizationCallIntervalTimeThreshold:](v3, "setVisualLocalizationCallIntervalTimeThreshold:", v8);
    -[ARGeoTrackingTechnique setVisualLocalizationUpdatesRequested:](v3, "setVisualLocalizationUpdatesRequested:", 1);
    -[ARGeoTrackingTechnique setSupportEnablementOptions:](v3, "setSupportEnablementOptions:", 0);
    v3->_statusLock._os_unfair_lock_opaque = 0;
    -[ARGeoTrackingTechnique setVLTraceRecorder:](v3, "setVLTraceRecorder:", 0);
    v9 = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.geotracking.useclfusion"));
    v3->_useCoreLocationFusion = v9;
    if (v9)
    {
      _ARLogTechnique_9();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v12;
        v28 = 2048;
        v29 = v3;
        _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_INFO, "%{public}@ <%p>: CL fusion is enabled.", buf, 0x16u);

      }
    }
    v13 = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.geotracking.usecmfusion"));
    v3->_useCoreMotionFusion = v13;
    if (v13)
    {
      _ARLogTechnique_9();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v16;
        v28 = 2048;
        v29 = v3;
        _os_log_impl(&dword_1B3A68000, v14, OS_LOG_TYPE_INFO, "%{public}@ <%p>: CM fusion is enabled.", buf, 0x16u);

      }
    }
    v3->_useGradualCorrection = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.geotracking.usegradualcorrection"));
    v3->_useVLTraceRecorder = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.geotracking.useVLTraceRecorder"));
    v17 = -[ARGeoTrackingTechniqueState initWithResetCount:]([ARGeoTrackingTechniqueState alloc], "initWithResetCount:", 0);
    state = v3->_state;
    v3->_state = v17;

    objc_msgSend(MEMORY[0x1E0DC6F58], "maximumHorizontalAccuracyThreshold");
    v3->_maxHorizontalAccuracy = v19;
    _ARLogTechnique_9();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      maxHorizontalAccuracy = v3->_maxHorizontalAccuracy;
      *(_DWORD *)buf = 138543874;
      v27 = v22;
      v28 = 2048;
      v29 = v3;
      v30 = 2048;
      v31 = maxHorizontalAccuracy;
      _os_log_impl(&dword_1B3A68000, v20, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: self.maxHorizontalAccuracy %fm", buf, 0x20u);

    }
    v3->_requestResultDataAtTimestampCallCount = 0;
  }
  return v3;
}

- (ARGeoTrackingTechnique)initWithAuditToken:(id)a3
{
  id v5;
  ARGeoTrackingTechnique *v6;
  ARGeoTrackingTechnique *v7;

  v5 = a3;
  v6 = -[ARGeoTrackingTechnique init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_auditToken, a3);

  return v7;
}

- (void)dealloc
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  ARGeoTrackingTechnique *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _ARLogTechnique_9();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v5;
    v15 = 2048;
    v16 = self;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: dealloc", buf, 0x16u);

  }
  if (self->_VLTraceRecorder)
  {
    -[ARGeoTrackingTechnique VLTraceRecorder](self, "VLTraceRecorder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finish");

  }
  _ARLogTechnique_9();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v9;
    v15 = 2048;
    v16 = self;
    _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Stopping location simulation", buf, 0x16u);

  }
  -[ARGeoTrackingTechnique locationSimulationManager](self, "locationSimulationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clearSimulatedLocations");

  -[ARGeoTrackingTechnique locationSimulationManager](self, "locationSimulationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stopLocationSimulation");

  v12.receiver = self;
  v12.super_class = (Class)ARGeoTrackingTechnique;
  -[ARGeoTrackingTechnique dealloc](&v12, sel_dealloc);
}

- (void)prepare:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  ARGeoTrackingTechnique *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  self->_deterministic = a3;
  -[ARGeoTrackingTechniqueState VLHandle](self->_state, "VLHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (self->_auditToken)
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC6F58]), "initWithAuditToken:", self->_auditToken);
    else
      v5 = objc_opt_new();
    v6 = (void *)v5;
    -[ARGeoTrackingTechniqueState setVLHandle:](self->_state, "setVLHandle:", v5);

    _ARLogTechnique_9();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARGeoTrackingTechniqueState VLHandle](self->_state, "VLHandle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v9;
      v22 = 2048;
      v23 = self;
      v24 = 2048;
      v25 = (uint64_t)v10;
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: VLHandle created,%p", (uint8_t *)&v20, 0x20u);

    }
  }
  if (!self->_VLTraceRecorder && self->_useVLTraceRecorder)
  {
    -[ARGeoTrackingTechniqueState VLHandle](self->_state, "VLHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setDebugInfoShouldPreserveImageData:", 1);

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/var/mobile/Library/Caches/VisualLocalization/Traces"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _ARLogTechnique_9();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "absoluteString");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = objc_msgSend(v16, "UTF8String");
      v20 = 138543874;
      v21 = v15;
      v22 = 2048;
      v23 = self;
      v24 = 2080;
      v25 = v17;
      _os_log_impl(&dword_1B3A68000, v13, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Capturing traces at %s", (uint8_t *)&v20, 0x20u);

    }
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6F60]), "initWithDirectory:", v12);
    -[ARGeoTrackingTechnique setVLTraceRecorder:](self, "setVLTraceRecorder:", v18);

    -[ARGeoTrackingTechnique VLTraceRecorder](self, "VLTraceRecorder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "start");

  }
}

- (unint64_t)requiredSensorDataTypes
{
  return 79;
}

- (id)resultDataClasses
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

- (int64_t)captureBehavior
{
  return 1;
}

- (BOOL)reconfigurableFrom:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  return v4;
}

- (void)reconfigureFrom:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  id v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  ARGeoTrackingTechnique *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ARLogTechnique_9();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2048;
    v13 = self;
    _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Reconfiguring existing geo tracking technique.", (uint8_t *)&v10, 0x16u);

  }
  v8 = v4;
  objc_msgSend(v8, "visualLocalizationCallInterval");
  -[ARGeoTrackingTechnique setVisualLocalizationCallInterval:](self, "setVisualLocalizationCallInterval:");
  objc_msgSend(v8, "posteriorVisualLocalizationCallInterval");
  -[ARGeoTrackingTechnique setPosteriorVisualLocalizationCallInterval:](self, "setPosteriorVisualLocalizationCallInterval:");
  objc_msgSend(v8, "visualLocalizationCallIntervalTimeThreshold");
  -[ARGeoTrackingTechnique setVisualLocalizationCallIntervalTimeThreshold:](self, "setVisualLocalizationCallIntervalTimeThreshold:");
  v9 = objc_msgSend(v8, "visualLocalizationUpdatesRequested");

  -[ARGeoTrackingTechnique setVisualLocalizationUpdatesRequested:](self, "setVisualLocalizationUpdatesRequested:", v9);
}

- (void)_simulateReplayLocationUpdates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  ARGeoTrackingTechnique *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isSecure") & 1) == 0)
  {
    objc_msgSend(v4, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    _ARLogTechnique_9();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v9;
      v23 = 2048;
      v24 = self;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Simulating Location to CL: %@", (uint8_t *)&v21, 0x20u);

    }
    -[ARGeoTrackingTechnique locationSimulationManager](self, "locationSimulationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      _ARLogTechnique_9();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v13;
        v23 = 2048;
        v24 = self;
        _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Creating location simulation manager.", (uint8_t *)&v21, 0x16u);

      }
      v14 = objc_alloc_init(MEMORY[0x1E0C9E418]);
      -[ARGeoTrackingTechnique setLocationSimulationManager:](self, "setLocationSimulationManager:", v14);

      -[ARGeoTrackingTechnique locationSimulationManager](self, "locationSimulationManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stopLocationSimulation");

      -[ARGeoTrackingTechnique locationSimulationManager](self, "locationSimulationManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "clearSimulatedLocations");

    }
    -[ARGeoTrackingTechnique locationSimulationManager](self, "locationSimulationManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setLocationDistance:", 1.0);

    -[ARGeoTrackingTechnique locationSimulationManager](self, "locationSimulationManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLocationRepeatBehavior:", 1);

    -[ARGeoTrackingTechnique locationSimulationManager](self, "locationSimulationManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appendSimulatedLocation:", v6);

    -[ARGeoTrackingTechnique locationSimulationManager](self, "locationSimulationManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "startLocationSimulation");

  }
}

- (id)processData:(id)a3
{
  id v4;
  ARGeoTrackingTechniqueState *v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  ARGeoTrackingTechniqueState *v28;
  int v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _BOOL4 v33;
  id v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  int v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  NSObject *v45;
  objc_class *v46;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  objc_class *v50;
  void *v51;
  dispatch_semaphore_t v52;
  NSObject *v53;
  objc_class *v54;
  void *v55;
  NSObject *v56;
  objc_class *v57;
  void *v58;
  objc_class *v59;
  void *v60;
  void *v61;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  unint64_t v68;
  NSObject *v69;
  NSObject *v70;
  objc_class *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  _BOOL4 v75;
  NSObject *v76;
  objc_class *v77;
  void *v78;
  void *v79;
  int v80;
  int v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  objc_super v92;
  _QWORD v93[4];
  NSObject *v94;
  ARGeoTrackingTechnique *v95;
  ARGeoTrackingTechniqueState *v96;
  NSObject *v97;
  uint8_t buf[4];
  void *v99;
  __int16 v100;
  ARGeoTrackingTechnique *v101;
  __int16 v102;
  uint64_t v103;
  __int16 v104;
  uint64_t v105;
  __int16 v106;
  uint64_t v107;
  __int16 v108;
  uint64_t v109;
  __int16 v110;
  int v111;
  __int16 v112;
  int v113;
  __int16 v114;
  uint64_t v115;
  __int16 v116;
  uint64_t v117;
  __int16 v118;
  uint64_t v119;
  __int16 v120;
  uint64_t v121;
  __int16 v122;
  int v123;
  __int16 v124;
  uint64_t v125;
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_resetLock);
  v5 = self->_state;
  os_unfair_lock_unlock(&self->_resetLock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    _ARLogTechnique_9();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "location");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "coordinate");
      v10 = v9;
      objc_msgSend(v6, "location");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "coordinate");
      v12 = v11;
      objc_msgSend(v6, "location");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "altitude");
      v14 = v13;
      objc_msgSend(v6, "location");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "altitudeWgs84");
      v16 = v15;
      objc_msgSend(v6, "location");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = objc_msgSend(v86, "isAltitudeWgs84Available");
      objc_msgSend(v6, "location");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v85, "isCoordinateFused");
      objc_msgSend(v6, "location");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "rawCoordinate");
      v18 = v17;
      objc_msgSend(v6, "location");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "rawCoordinate");
      v20 = v19;
      objc_msgSend(v6, "location");
      v91 = v4;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "horizontalAccuracy");
      v23 = v22;
      objc_msgSend(v6, "location");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "rawHorizontalAccuracy");
      v26 = v25;
      objc_msgSend(v6, "location");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v5;
      v29 = objc_msgSend(v27, "isCoordinateFusedWithVL");
      objc_msgSend(v6, "location");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "ellipsoidalAltitude");
      *(_DWORD *)buf = 138546691;
      v99 = v84;
      v100 = 2048;
      v101 = self;
      v102 = 2049;
      v103 = v10;
      v104 = 2049;
      v105 = v12;
      v106 = 2049;
      v107 = v14;
      v108 = 2049;
      v109 = v16;
      v110 = 1024;
      v111 = v81;
      v112 = 1024;
      v113 = v80;
      v114 = 2049;
      v115 = v18;
      v116 = 2049;
      v117 = v20;
      v118 = 2049;
      v119 = v23;
      v120 = 2049;
      v121 = v26;
      v122 = 1024;
      v123 = v29;
      v5 = v28;
      v124 = 2049;
      v125 = v31;
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Received new location point: lat=%{private}.8f, lon=%{private}.8f, alt=%{private}.3f, alt_wgs84=%{private}.3f, wgs84_available=%d, fused=%d, rawLat=%{private}.8f, rawLon=%{private}.8f, acc=%{private}.3f, rawAcc=%{private}.3f, fusedWithVL=%d, ellipsoidalAltitude=%{private}.3f.", buf, 0x82u);

      v4 = v91;
    }

    -[ARGeoTrackingTechnique _simulateReplayLocationUpdates:](self, "_simulateReplayLocationUpdates:", v6);
    objc_msgSend(v6, "location");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "type") == 6)
    {
      v33 = 0;
    }
    else
    {
      objc_msgSend(v6, "location");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "type");

      if (v39 == 10)
      {
        v33 = 0;
LABEL_21:
        if (-[ARGeoTrackingTechniqueState hasStartedAvailabilityCheck](v5, "hasStartedAvailabilityCheck")
          || (objc_msgSend(v6, "isUndulationValid") & 1) != 0)
        {
          if ((objc_msgSend(v6, "isAltitudeValid") & 1) != 0)
          {
            if (v33)
            {
              _ARLogTechnique_9();
              v45 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
              {
                v46 = (objc_class *)objc_opt_class();
                NSStringFromClass(v46);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v99 = v47;
                v100 = 2048;
                v101 = self;
                _os_log_impl(&dword_1B3A68000, v45, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Received location valid for geo tracking.", buf, 0x16u);

              }
              -[ARGeoTrackingTechniqueState removeFailureReason:](v5, "removeFailureReason:", 1024);
              v48 = objc_msgSend(v6, "copy");
              -[ARGeoTrackingTechniqueState setLastCLLocation:](v5, "setLastCLLocation:", v48);
              if (!-[ARGeoTrackingTechniqueState hasStartedAvailabilityCheck](v5, "hasStartedAvailabilityCheck"))
              {
                _ARLogTechnique_9();
                v49 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
                {
                  v50 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v50);
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v99 = v51;
                  v100 = 2048;
                  v101 = self;
                  _os_log_impl(&dword_1B3A68000, v49, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Received candidate location for ENU origin. Checking geo tracking availability.", buf, 0x16u);

                }
                -[ARGeoTrackingTechniqueState setHasStartedAvailabilityCheck:](v5, "setHasStartedAvailabilityCheck:", 1);
                -[ARGeoTrackingTechniqueState addFailureReason:](v5, "addFailureReason:", 4096);
                if (self->_deterministic)
                  v52 = dispatch_semaphore_create(0);
                else
                  v52 = 0;
                -[NSObject location](v48, "location");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "coordinate");
                v65 = v64;
                v67 = v66;
                v68 = -[ARGeoTrackingTechnique supportEnablementOptions](self, "supportEnablementOptions");
                v93[0] = MEMORY[0x1E0C809B0];
                v93[1] = 3221225472;
                v93[2] = __38__ARGeoTrackingTechnique_processData___block_invoke;
                v93[3] = &unk_1E6674D28;
                v69 = v52;
                v94 = v69;
                v95 = self;
                v96 = v5;
                v97 = v48;
                +[ARGeoTrackingConfiguration checkAvailabilityAtCoordinate:withOptions:completionHandler:](ARGeoTrackingConfiguration, "checkAvailabilityAtCoordinate:withOptions:completionHandler:", v68, v93, v65, v67);

                if (v69)
                {
                  _ARLogTechnique_9();
                  v70 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
                  {
                    v71 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v71);
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v99 = v72;
                    v100 = 2048;
                    v101 = self;
                    _os_log_impl(&dword_1B3A68000, v70, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Waiting for availability check to finish", buf, 0x16u);

                  }
                  dispatch_semaphore_wait(v69, 0xFFFFFFFFFFFFFFFFLL);
                }

              }
              -[ARGeoTrackingTechniqueState VLHandle](v5, "VLHandle");
              v73 = objc_claimAutoreleasedReturnValue();
              if (!v73)
                goto LABEL_41;
              v74 = (void *)v73;
              v75 = -[ARGeoTrackingTechnique visualLocalizationUpdatesRequested](self, "visualLocalizationUpdatesRequested");

              if (!v75)
                goto LABEL_41;
              _ARLogTechnique_9();
              v76 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
              {
                v77 = (objc_class *)objc_opt_class();
                NSStringFromClass(v77);
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v99 = v78;
                v100 = 2048;
                v101 = self;
                _os_log_impl(&dword_1B3A68000, v76, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Pre-warming VL with this location.", buf, 0x16u);

              }
              -[ARGeoTrackingTechniqueState VLHandle](v5, "VLHandle");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "location");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "prepareWithDeviceLocation:", v79);

              goto LABEL_40;
            }
LABEL_38:
            _ARLogTechnique_9();
            v48 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
LABEL_41:

              goto LABEL_42;
            }
            v59 = (objc_class *)objc_opt_class();
            NSStringFromClass(v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v99 = v60;
            v100 = 2048;
            v101 = self;
            _os_log_impl(&dword_1B3A68000, v48, OS_LOG_TYPE_INFO, "%{public}@ <%p>: New location is not valid for geo tracking.", buf, 0x16u);
LABEL_40:

            goto LABEL_41;
          }
        }
        else
        {
          _ARLogTechnique_9();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            v54 = (objc_class *)objc_opt_class();
            NSStringFromClass(v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v99 = v55;
            v100 = 2048;
            v101 = self;
            _os_log_impl(&dword_1B3A68000, v53, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Location to set ENU origin must have undulation.", buf, 0x16u);

          }
          if ((objc_msgSend(v6, "isAltitudeValid") & 1) != 0)
            goto LABEL_38;
        }
        _ARLogTechnique_9();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v57 = (objc_class *)objc_opt_class();
          NSStringFromClass(v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v99 = v58;
          v100 = 2048;
          v101 = self;
          _os_log_impl(&dword_1B3A68000, v56, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Received location must have valid altitude.", buf, 0x16u);

        }
        goto LABEL_38;
      }
      objc_msgSend(v6, "location");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "horizontalAccuracy");
      v33 = 0;
      if (fabs(v40) != INFINITY)
      {
        objc_msgSend(v6, "location");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "horizontalAccuracy");
        if (v42 >= 0.0)
        {
          objc_msgSend(v6, "location");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "horizontalAccuracy");
          v33 = v44 < self->_maxHorizontalAccuracy;

        }
        else
        {
          v33 = 0;
        }

      }
    }

    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v34 = v4;
    objc_msgSend(v34, "deviceMotion");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "magneticFieldCalibrationLevel") != -1)
    {
      objc_msgSend(v34, "deviceMotion");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "magneticFieldCalibrationLevel");

      if (!v37)
      {
LABEL_12:

        goto LABEL_42;
      }
      v35 = (void *)objc_msgSend(v34, "copy");
      -[ARGeoTrackingTechniqueState setLastCMDeviceMotion:](v5, "setLastCMDeviceMotion:", v35);
      if (self->_useCoreMotionFusion)
        -[ARGeoTrackingTechniqueState addDeviceMotionData:](v5, "addDeviceMotionData:", v35);
    }

    goto LABEL_12;
  }
LABEL_42:
  v92.receiver = self;
  v92.super_class = (Class)ARGeoTrackingTechnique;
  -[ARTechnique processData:](&v92, sel_processData_, v4);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  return v61;
}

void __38__ARGeoTrackingTechnique_processData___block_invoke(id *a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  id v12;
  NSObject *v13;
  objc_class *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  objc_class *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  objc_class *v39;
  void *v40;
  id v41;
  uint64_t v42;
  id v43;
  objc_class *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[2];
  NSObject *(*v55)(uint64_t);
  void *v56;
  id v57;
  uint8_t buf[4];
  id v59;
  __int16 v60;
  id v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  _BYTE v71[28];
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  uint64_t v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v55 = __38__ARGeoTrackingTechnique_processData___block_invoke_2;
  v56 = &unk_1E6672168;
  v57 = a1[4];
  os_unfair_lock_lock((os_unfair_lock_t)a1[5] + 26);
  v6 = a1[5];
  v7 = a1[6];
  v8 = (id)*((_QWORD *)v6 + 14);
  os_unfair_lock_unlock((os_unfair_lock_t)v6 + 26);
  if (v7 == v8)
  {
    objc_msgSend(a1[6], "setHasReturnedAvailabilityCheck:", 1);
    objc_msgSend(a1[6], "removeFailureReason:", 4096);
    if ((a2 & 1) != 0)
    {
      objc_msgSend(a1[6], "setEnuOrigin:", a1[7]);
      _ARLogTechnique_9();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v47 = a1[5];
        objc_msgSend(a1[7], "location");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "coordinate");
        v17 = v16;
        objc_msgSend(a1[7], "location");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "coordinate");
        v19 = v18;
        objc_msgSend(a1[7], "location");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "horizontalAccuracy");
        v22 = v21;
        objc_msgSend(a1[7], "location");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "altitude");
        v25 = v24;
        objc_msgSend(a1[7], "location");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isAltitudeWgs84Available");
        objc_msgSend(a1[7], "location");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "altitudeWgs84");
        v30 = v29;
        objc_msgSend(a1[7], "timestamp");
        *(_DWORD *)buf = 138545411;
        v59 = v15;
        v60 = 2048;
        v61 = v47;
        v62 = 2049;
        v63 = v17;
        v64 = 2049;
        v65 = v19;
        v66 = 2049;
        v67 = v22;
        v68 = 2049;
        v69 = v25;
        v70 = 1024;
        *(_DWORD *)v71 = v27;
        *(_WORD *)&v71[4] = 2049;
        *(_QWORD *)&v71[6] = v30;
        *(_WORD *)&v71[14] = 2048;
        *(_QWORD *)&v71[16] = v31;
        _os_log_impl(&dword_1B3A68000, v13, OS_LOG_TYPE_INFO, "%{public}@ <%p>: VL ENU origin set: latitude,%{private}.08f,longitude,%{private}.08f,horizAccuracy,%{private}f,altitude,%{private}.06f,isAltitudeWgs84Available:%d,altitudeWGS84:%{private}.06f,timestamp:%.06f", buf, 0x58u);

      }
      _ARLogTechnique_9();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = (id)objc_claimAutoreleasedReturnValue();
        v35 = a1[5];
        v36 = a1[7];
        if (v36)
        {
          objc_msgSend(v36, "locationECEF");
          v36 = a1[7];
          v37 = v53;
          if (v36)
          {
            objc_msgSend(v36, "locationECEF");
            v36 = a1[7];
            v38 = v52;
            if (v36)
            {
              objc_msgSend(v36, "locationECEF");
              v50 = v51;
              v36 = a1[7];
            }
            else
            {
              v50 = 0;
            }
          }
          else
          {
            v50 = 0;
            v38 = 0;
          }
        }
        else
        {
          v50 = 0;
          v38 = 0;
          v37 = 0;
        }
        objc_msgSend(v36, "timestamp");
        *(_DWORD *)buf = 138544643;
        v59 = v34;
        v60 = 2048;
        v61 = v35;
        v62 = 2049;
        v63 = v37;
        v64 = 2049;
        v65 = v38;
        v66 = 2049;
        v67 = v50;
        v68 = 2048;
        v69 = v42;
        _os_log_impl(&dword_1B3A68000, v32, OS_LOG_TYPE_INFO, "%{public}@ <%p>: VL ECEFxENUorigin,%{private}f,ECEFyENUorigin,%{private}f,ECEFzENUorigin,%{private}f,ts,%f", buf, 0x3Eu);

      }
      v43 = a1[7];
      if (v43)
        objc_msgSend(v43, "ecefFromlocation");
      _ARLogTechnique_9();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v44 = (objc_class *)objc_opt_class();
        NSStringFromClass(v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = a1[5];
        *(_DWORD *)buf = 138547714;
        v59 = v45;
        v60 = 2048;
        v61 = v46;
        v62 = 2048;
        v63 = 0;
        v64 = 2048;
        v65 = 0;
        v66 = 2048;
        v67 = 0;
        v68 = 2048;
        v69 = 0;
        v70 = 2048;
        *(_QWORD *)v71 = 0;
        *(_WORD *)&v71[8] = 2048;
        *(_QWORD *)&v71[10] = 0;
        *(_WORD *)&v71[18] = 2048;
        *(_QWORD *)&v71[20] = 0;
        v72 = 2048;
        v73 = 0;
        v74 = 2048;
        v75 = 0;
        v76 = 2048;
        v77 = 0;
        v78 = 2048;
        v79 = 0;
        v80 = 2048;
        v81 = 0;
        v82 = 2048;
        v83 = 0;
        v84 = 2048;
        v85 = 0;
        v86 = 2048;
        v87 = 0;
        v88 = 2048;
        v89 = 0;
        _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: ECEFxENUorigin:-ecefFromEnu %f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f", buf, 0xB6u);

      }
    }
    else
    {
      objc_msgSend(a1[6], "addFailureReason:", 512);
      objc_msgSend(a1[5], "_setTrackingState:techniqueStateObject:", 0, a1[6]);
      _ARLogTechnique_9();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v39 = (objc_class *)objc_opt_class();
        NSStringFromClass(v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = a1[5];
        *(_DWORD *)buf = 138543618;
        v59 = v40;
        v60 = 2048;
        v61 = v41;
        _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Geo tracking is not available at received location. Cannot run geo tracking.", buf, 0x16u);

      }
    }
  }
  else
  {
    _ARLogTechnique_9();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = a1[5];
      *(_DWORD *)buf = 138543618;
      v59 = v11;
      v60 = 2048;
      v61 = v12;
      _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Geo tracking was reset while availability check was running.", buf, 0x16u);

    }
  }

  v55((uint64_t)v54);
}

NSObject *__38__ARGeoTrackingTechnique_processData___block_invoke_2(uint64_t a1)
{
  NSObject *result;

  result = *(NSObject **)(a1 + 32);
  if (result)
    return dispatch_semaphore_signal(result);
  return result;
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v6;
  double v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  ARGeoTrackingTechniqueState *v21;
  ARGeoTrackingTechniqueState *state;
  void *v23;
  uint64_t v24;
  double v25;
  void *v26;
  _BOOL8 useVLTraceRecorder;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  long double v41;
  double v42;
  BOOL v43;
  ARGeoTrackingTechniqueState *v44;
  void *v45;
  uint64_t v46;
  ARGeoTrackingTechniqueState *v47;
  void *v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  void *v58;
  int v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  double v68;
  double v69;
  double v70;
  double v71;
  ARGeoTrackingData *v72;
  void *v73;
  ARGeoTrackingData *v74;
  void *v75;
  void *v76;
  void *v77;
  ARGeoTrackingTechniqueState *v78;
  float64x2_t v79;
  float64x2_t v80;
  float64x2_t v81;
  float64x2_t v82;
  float64x2_t v83;
  float64x2_t v84;
  float64x2_t v85;
  float64x2_t v86;
  uint64_t v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  float64x2_t v92;
  float64x2_t v93;
  float64x2_t *v94;
  uint64_t v95;
  float64x2_t v96;
  float64x2_t v97;
  float64x2_t v98;
  float64x2_t v99;
  float64x2_t v100;
  float64x2_t v101;
  float64x2_t v102;
  float64x2_t v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  float64x2_t v108;
  float64x2_t v109;
  float64x2_t *v110;
  double v111;
  void *v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  double v117;
  double v118;
  void *v119;
  double v120;
  double v121;
  ARLocationEstimationData *v122;
  CLLocationCoordinate2D v123;
  ARLocationEstimationData *v124;
  void *v125;
  ARGeoTrackingTechniqueState *v126;
  NSObject *v127;
  objc_class *v128;
  void *v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  double v138;
  double v139;
  float64x2_t v140;
  double v141;
  double v142;
  unint64_t v143;
  ARGeoTrackingTechniqueState *v144;
  float64x2_t v145;
  unint64_t v146;
  float64x2_t v147;
  float64x2_t v148;
  float64x2_t v149;
  void *v150;
  uint64_t v151;
  NSObject *v152;
  _BOOL4 v153;
  objc_class *v154;
  void *v155;
  int64_t v156;
  const char *v157;
  objc_class *v158;
  int64_t v159;
  ARGeoTrackingTechniqueState *v160;
  NSObject *v161;
  objc_class *v162;
  void *v163;
  NSObject *v164;
  objc_class *v165;
  void *v166;
  uint64_t v167;
  void *v168;
  uint64_t v169;
  void *v170;
  void *v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  NSObject *v183;
  objc_class *v184;
  void *v185;
  double v186;
  os_unfair_lock_s *v187;
  id v188;
  void *v189;
  void *v190;
  uint64_t v191;
  void *v192;
  void *v193;
  double v194;
  double v195;
  double v196;
  unint64_t v197;
  double latitudea;
  CLLocationDegrees latitudeb[2];
  float64x2_t latitude;
  void *v201;
  int8x16_t v202;
  _OWORD var20[3];
  float64_t v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  int8x16_t v213;
  double v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  float64x2_t v223;
  float64x2_t v224;
  float64x2_t v225;
  float64x2_t v226;
  float64x2_t v227;
  float64x2_t v228;
  float64x2_t v229;
  float64x2_t v230;
  float64x2_t v231[8];
  simd_float4x4 v232;
  simd_float4x4 v233;

  STACK[0xC48] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  ++self->_requestResultDataAtTimestampCallCount;
  -[ARGeoTrackingTechniqueState firstRequestResultTimestamp](self->_state, "firstRequestResultTimestamp");
  if (v7 <= 0.0)
    -[ARGeoTrackingTechniqueState setFirstRequestResultTimestamp:](self->_state, "setFirstRequestResultTimestamp:", a3);
  objc_msgSend(v6, "imageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cameraType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C89FA0]);

  if (v10)
  {
    objc_msgSend(v6, "resultDataOfClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = &OBJC_IVAR___ARWorldTrackingTechnique__meshChunkIdentifiersCurrentlyBeingProcessed;
    if (!objc_msgSend(v11, "count"))
    {
      -[ARGeoTrackingTechniqueState firstRequestResultTimestamp](self->_state, "firstRequestResultTimestamp");
      if (a3 - v25 > 1.5)
        -[ARGeoTrackingTechniqueState addFailureReason:](self->_state, "addFailureReason:", 64);
      goto LABEL_85;
    }
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARGeoTrackingTechniqueState lastPoseOriginTimestamp](self->_state, "lastPoseOriginTimestamp");
    if (v14 == 0.0)
    {
      objc_msgSend(v13, "worldTrackingState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "originTimestamp");
      -[ARGeoTrackingTechniqueState setLastPoseOriginTimestamp:](self->_state, "setLastPoseOriginTimestamp:");

    }
    objc_msgSend(v13, "worldTrackingState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "originTimestamp");
    v18 = v17;
    -[ARGeoTrackingTechniqueState lastPoseOriginTimestamp](self->_state, "lastPoseOriginTimestamp");
    v20 = v19;

    if (v18 > v20)
    {
      os_unfair_lock_lock(&self->_resetLock);
      v21 = -[ARGeoTrackingTechniqueState initWithResetCount:]([ARGeoTrackingTechniqueState alloc], "initWithResetCount:", -[ARGeoTrackingTechniqueState resetCount](self->_state, "resetCount") + 1);
      state = self->_state;
      self->_state = v21;

      objc_msgSend(v13, "worldTrackingState");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "originTimestamp");
      -[ARGeoTrackingTechniqueState setLastPoseOriginTimestamp:](self->_state, "setLastPoseOriginTimestamp:");

      if (self->_auditToken)
        v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC6F58]), "initWithAuditToken:", self->_auditToken);
      else
        v24 = objc_opt_new();
      v26 = (void *)v24;
      -[ARGeoTrackingTechniqueState setVLHandle:](self->_state, "setVLHandle:", v24);

      useVLTraceRecorder = self->_useVLTraceRecorder;
      -[ARGeoTrackingTechniqueState VLHandle](self->_state, "VLHandle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "_setDebugInfoShouldPreserveImageData:", useVLTraceRecorder);

      os_unfair_lock_unlock(&self->_resetLock);
      _ARLogTechnique_9();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARGeoTrackingTechniqueState VLHandle](self->_state, "VLHandle");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(STACK[0xB90]) = 138543874;
        STACK[0xB94] = (unint64_t)v31;
        LOWORD(STACK[0xB9C]) = 2048;
        STACK[0xB9E] = (unint64_t)self;
        LOWORD(STACK[0xBA6]) = 2048;
        STACK[0xBA8] = (unint64_t)v32;
        _os_log_impl(&dword_1B3A68000, v29, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Reset detected. VLHandle created,%p", (uint8_t *)&STACK[0xB90], 0x20u);

      }
    }
    *(_OWORD *)&STACK[0xB80] = 0u;
    *(_OWORD *)&STACK[0xB70] = 0u;
    *(_OWORD *)&STACK[0xB60] = 0u;
    *(_OWORD *)&STACK[0xB50] = 0u;
    *(_OWORD *)&STACK[0xB40] = 0u;
    *(_OWORD *)&STACK[0xB30] = 0u;
    *(_OWORD *)&STACK[0xB20] = 0u;
    *(_OWORD *)&STACK[0xB10] = 0u;
    objc_msgSend(v13, "visionCameraTransform");
    ARMatrix4x4FloatToDouble((float64x2_t *)&STACK[0xA90], v33, v34, v35, v36);
    v37 = *(_OWORD *)&STACK[0xAE0];
    *(_OWORD *)&STACK[0xBD0] = *(_OWORD *)&STACK[0xAD0];
    *(_OWORD *)&STACK[0xBE0] = v37;
    v38 = *(_OWORD *)&STACK[0xB00];
    *(_OWORD *)&STACK[0xBF0] = *(_OWORD *)&STACK[0xAF0];
    *(_OWORD *)&STACK[0xC00] = v38;
    v39 = *(_OWORD *)&STACK[0xAA0];
    *(_OWORD *)&STACK[0xB90] = *(_OWORD *)&STACK[0xA90];
    *(_OWORD *)&STACK[0xBA0] = v39;
    v40 = *(_OWORD *)&STACK[0xAC0];
    *(_OWORD *)&STACK[0xBB0] = *(_OWORD *)&STACK[0xAB0];
    *(_OWORD *)&STACK[0xBC0] = v40;
    __invert_d4();
    v41 = acos(*(long double *)&STACK[0xB60]) * 0.318309886;
    v42 = v41 * 180.0;
    *(float *)&v41 = v41 * 180.0;
    v43 = +[ARGeoTrackingTechnique isCameraUp:](ARGeoTrackingTechnique, "isCameraUp:", (double)v41);
    v44 = self->_state;
    if (v43)
      -[ARGeoTrackingTechniqueState removeFailureReason:](v44, "removeFailureReason:", 128);
    else
      -[ARGeoTrackingTechniqueState addFailureReason:](v44, "addFailureReason:", 128);
    objc_msgSend(v13, "worldTrackingState");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "vioTrackingState");

    v47 = self->_state;
    if (v46)
      -[ARGeoTrackingTechniqueState addFailureReason:](v47, "addFailureReason:", 64);
    else
      -[ARGeoTrackingTechniqueState removeFailureReason:](v47, "removeFailureReason:", 64);
    if ((-[ARGeoTrackingTechniqueState failureReasons](self->_state, "failureReasons") & 0x40) != 0
      || (-[ARGeoTrackingTechniqueState failureReasons](self->_state, "failureReasons") & 0x80) != 0)
    {
LABEL_84:

      v12 = &OBJC_IVAR___ARWorldTrackingTechnique__meshChunkIdentifiersCurrentlyBeingProcessed;
LABEL_85:
      objc_msgSend(v8, "timestamp");
      -[ARGeoTrackingTechnique _updateVLStateData:](self, "_updateVLStateData:");
      v187 = (os_unfair_lock_s *)((char *)self + v12[574]);
      os_unfair_lock_lock(v187);
      v188 = objc_alloc(MEMORY[0x1E0C99D20]);
      -[ARGeoTrackingTechniqueState resultDatas](self->_state, "resultDatas");
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      v190 = (void *)objc_msgSend(v188, "initWithArray:", v189);

      -[ARGeoTrackingTechniqueState resultDatas](self->_state, "resultDatas");
      v191 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v191, "removeAllObjects");

      os_unfair_lock_unlock(v187);
      -[ARTechnique delegate](self, "delegate");
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v191) = objc_opt_respondsToSelector();

      if ((v191 & 1) != 0)
      {
        -[ARTechnique delegate](self, "delegate");
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v193, "technique:didOutputResultData:timestamp:context:", self, v190, v6, a3);

      }
      goto LABEL_88;
    }
    -[ARGeoTrackingTechniqueState removeFailureReason:](self->_state, "removeFailureReason:", 64);
    -[ARGeoTrackingTechniqueState addVioPoseData:](self->_state, "addVioPoseData:", v13);
    if (-[ARGeoTrackingTechniqueState VLHasExecuted](self->_state, "VLHasExecuted"))
    {
      -[ARGeoTrackingTechniqueState lastCLLocation](self->_state, "lastCLLocation");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_useCoreLocationFusion || self->_useCoreMotionFusion)
        -[ARGeoTrackingTechnique _estimateEnuFromVioFromCLCM:](self, "_estimateEnuFromVioFromCLCM:", v48);
      v201 = v8;
      if (self->_useGradualCorrection)
      {
        *(_OWORD *)&STACK[0xA80] = 0u;
        *(_OWORD *)&STACK[0xA70] = 0u;
        *(_OWORD *)&STACK[0xA60] = 0u;
        *(_OWORD *)&STACK[0xA50] = 0u;
        *(_OWORD *)&STACK[0xA40] = 0u;
        *(_OWORD *)&STACK[0xA20] = 0u;
        *(_OWORD *)&STACK[0xA30] = 0u;
        *(_OWORD *)&STACK[0xA10] = 0u;
        objc_msgSend(v13, "visionCameraTransform");
        -[ARGeoTrackingTechniqueState gradualCorrectionFilter](self->_state, "gradualCorrectionFilter", ARMatrix4x4FloatToDouble((float64x2_t *)&STACK[0xA10], v49, v50, v51, v52).f64[0]);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timestamp");
        v54 = *(_OWORD *)&STACK[0xA60];
        *(_OWORD *)&STACK[0xBD0] = *(_OWORD *)&STACK[0xA50];
        *(_OWORD *)&STACK[0xBE0] = v54;
        v55 = *(_OWORD *)&STACK[0xA80];
        *(_OWORD *)&STACK[0xBF0] = *(_OWORD *)&STACK[0xA70];
        *(_OWORD *)&STACK[0xC00] = v55;
        v56 = *(_OWORD *)&STACK[0xA20];
        *(_OWORD *)&STACK[0xB90] = *(_OWORD *)&STACK[0xA10];
        *(_OWORD *)&STACK[0xBA0] = v56;
        v57 = *(_OWORD *)&STACK[0xA40];
        *(_OWORD *)&STACK[0xBB0] = *(_OWORD *)&STACK[0xA30];
        *(_OWORD *)&STACK[0xBC0] = v57;
        objc_msgSend(v53, "updateWithVIOPose:timestamp:", &STACK[0xB90]);

        *(_OWORD *)&STACK[0x9F0] = 0u;
        *(_OWORD *)&STACK[0xA00] = 0u;
        *(_OWORD *)&STACK[0x9D0] = 0u;
        *(_OWORD *)&STACK[0x9E0] = 0u;
        *(_OWORD *)&STACK[0x9B0] = 0u;
        *(_OWORD *)&STACK[0x9C0] = 0u;
        *(_OWORD *)&STACK[0x990] = 0u;
        *(_OWORD *)&STACK[0x9A0] = 0u;
        -[ARGeoTrackingTechniqueState gradualCorrectionFilter](self->_state, "gradualCorrectionFilter");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "getCurrentENUFromVIO:", &STACK[0x990]);

        if (v59)
        {
          v60 = *(_OWORD *)&STACK[0x9E0];
          *(_OWORD *)&STACK[0x950] = *(_OWORD *)&STACK[0x9D0];
          *(_OWORD *)&STACK[0x960] = v60;
          v61 = *(_OWORD *)&STACK[0xA00];
          *(_OWORD *)&STACK[0x970] = *(_OWORD *)&STACK[0x9F0];
          *(_OWORD *)&STACK[0x980] = v61;
          v62 = *(_OWORD *)&STACK[0x9A0];
          *(_OWORD *)&STACK[0x910] = *(_OWORD *)&STACK[0x990];
          *(_OWORD *)&STACK[0x920] = v62;
          v63 = *(_OWORD *)&STACK[0x9C0];
          *(_OWORD *)&STACK[0x930] = *(_OWORD *)&STACK[0x9B0];
          *(_OWORD *)&STACK[0x940] = v63;
          -[ARGeoTrackingTechniqueState setEnuFromVIO:](self->_state, "setEnuFromVIO:", &STACK[0x910]);
          v64 = *(_OWORD *)&STACK[0x9E0];
          *(_OWORD *)&STACK[0xBD0] = *(_OWORD *)&STACK[0x9D0];
          *(_OWORD *)&STACK[0xBE0] = v64;
          v65 = *(_OWORD *)&STACK[0xA00];
          *(_OWORD *)&STACK[0xBF0] = *(_OWORD *)&STACK[0x9F0];
          *(_OWORD *)&STACK[0xC00] = v65;
          v66 = *(_OWORD *)&STACK[0x9A0];
          *(_OWORD *)&STACK[0xB90] = *(_OWORD *)&STACK[0x990];
          *(_OWORD *)&STACK[0xBA0] = v66;
          v67 = *(_OWORD *)&STACK[0x9C0];
          *(_OWORD *)&STACK[0xBB0] = *(_OWORD *)&STACK[0x9B0];
          *(_OWORD *)&STACK[0xBC0] = v67;
          __invert_d4();
          v68 = ARMatrix4x4DoubleToFloat(v231);
          v196 = v69;
          latitudea = v68;
          v194 = v71;
          v195 = v70;
          v72 = [ARGeoTrackingData alloc];
          -[ARGeoTrackingTechniqueState enuOrigin](self->_state, "enuOrigin");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = -[ARGeoTrackingData initWithENUOrigin:vioFromENU:](v72, "initWithENUOrigin:vioFromENU:", v73, latitudea, v196, v195, v194);

          os_unfair_lock_lock(&self->_resultLock);
          -[ARGeoTrackingTechniqueState resultDatas](self->_state, "resultDatas");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "addObject:", v74);

          os_unfair_lock_unlock(&self->_resultLock);
        }
      }
      *(_OWORD *)&STACK[0xC00] = 0u;
      *(_OWORD *)&STACK[0xBF0] = 0u;
      *(_OWORD *)&STACK[0xBE0] = 0u;
      *(_OWORD *)&STACK[0xBD0] = 0u;
      *(_OWORD *)&STACK[0xBC0] = 0u;
      *(_OWORD *)&STACK[0xBB0] = 0u;
      *(_OWORD *)&STACK[0xBA0] = 0u;
      *(_OWORD *)&STACK[0xB90] = 0u;
      -[ARGeoTrackingTechniqueState enuOrigin](self->_state, "enuOrigin");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v76;
      if (v76)
      {
        objc_msgSend(v76, "ecefFromlocation");
      }
      else
      {
        *(_OWORD *)&STACK[0xC00] = 0u;
        *(_OWORD *)&STACK[0xBF0] = 0u;
        *(_OWORD *)&STACK[0xBE0] = 0u;
        *(_OWORD *)&STACK[0xBD0] = 0u;
        *(_OWORD *)&STACK[0xBC0] = 0u;
        *(_OWORD *)&STACK[0xBB0] = 0u;
        *(_OWORD *)&STACK[0xBA0] = 0u;
        *(_OWORD *)&STACK[0xB90] = 0u;
      }

      v78 = self->_state;
      if (v78)
      {
        -[ARGeoTrackingTechniqueState enuFromVIO](v78, "enuFromVIO");
        v79 = v223;
        v80 = v224;
        v81 = v225;
        v82 = v226;
        v84 = v227;
        v83 = v228;
        v85 = v229;
        v86 = v230;
      }
      else
      {
        v85 = 0uLL;
        v229 = 0u;
        v230 = 0u;
        v86 = 0uLL;
        v227 = 0u;
        v228 = 0u;
        v225 = 0u;
        v226 = 0u;
        v84 = 0uLL;
        v83 = 0uLL;
        v81 = 0uLL;
        v82 = 0uLL;
        v79 = 0uLL;
        v80 = 0uLL;
        v223 = 0u;
        v224 = 0u;
      }
      v87 = 0;
      v88 = *(_OWORD *)&STACK[0xB60];
      *(_OWORD *)&STACK[0x9D0] = *(_OWORD *)&STACK[0xB50];
      *(_OWORD *)&STACK[0x9E0] = v88;
      v89 = *(_OWORD *)&STACK[0xB80];
      *(_OWORD *)&STACK[0x9F0] = *(_OWORD *)&STACK[0xB70];
      *(_OWORD *)&STACK[0xA00] = v89;
      v90 = *(_OWORD *)&STACK[0xB20];
      *(_OWORD *)&STACK[0x990] = *(_OWORD *)&STACK[0xB10];
      *(_OWORD *)&STACK[0x9A0] = v90;
      v91 = *(_OWORD *)&STACK[0xB40];
      *(_OWORD *)&STACK[0x9B0] = *(_OWORD *)&STACK[0xB30];
      *(_OWORD *)&STACK[0x9C0] = v91;
      *(_OWORD *)&STACK[0xA10] = 0u;
      *(_OWORD *)&STACK[0xA20] = 0u;
      *(_OWORD *)&STACK[0xA30] = 0u;
      *(_OWORD *)&STACK[0xA40] = 0u;
      *(_OWORD *)&STACK[0xA50] = 0u;
      *(_OWORD *)&STACK[0xA60] = 0u;
      *(_OWORD *)&STACK[0xA70] = 0u;
      *(_OWORD *)&STACK[0xA80] = 0u;
      do
      {
        v93 = *(float64x2_t *)((char *)&STACK[0x990] + v87);
        v92 = *(float64x2_t *)((char *)&STACK[0x990] + v87 + 16);
        v94 = (float64x2_t *)((char *)&STACK[0xA10] + v87);
        *v94 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v79, v93.f64[0]), v81, v93, 1), v84, v92.f64[0]), v85, v92, 1);
        v94[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v80, v93.f64[0]), v82, v93, 1), v83, v92.f64[0]), v86, v92, 1);
        v87 += 32;
      }
      while (v87 != 128);
      v95 = 0;
      v96 = *(float64x2_t *)&STACK[0xBA0];
      v97 = *(float64x2_t *)&STACK[0xB90];
      v98 = *(float64x2_t *)&STACK[0xBC0];
      v99 = *(float64x2_t *)&STACK[0xBB0];
      v100 = *(float64x2_t *)&STACK[0xBE0];
      v101 = *(float64x2_t *)&STACK[0xBD0];
      v102 = *(float64x2_t *)&STACK[0xC00];
      v103 = *(float64x2_t *)&STACK[0xBF0];
      v104 = *(_OWORD *)&STACK[0xA60];
      v219 = *(_OWORD *)&STACK[0xA50];
      v220 = v104;
      v105 = *(_OWORD *)&STACK[0xA80];
      v221 = *(_OWORD *)&STACK[0xA70];
      v222 = v105;
      v106 = *(_OWORD *)&STACK[0xA20];
      v215 = *(_OWORD *)&STACK[0xA10];
      v216 = v106;
      v107 = *(_OWORD *)&STACK[0xA40];
      v217 = *(_OWORD *)&STACK[0xA30];
      v218 = v107;
      *(_OWORD *)&STACK[0x9F0] = 0u;
      *(_OWORD *)&STACK[0xA00] = 0u;
      *(_OWORD *)&STACK[0x9D0] = 0u;
      *(_OWORD *)&STACK[0x9E0] = 0u;
      *(_OWORD *)&STACK[0x9B0] = 0u;
      *(_OWORD *)&STACK[0x9C0] = 0u;
      *(_OWORD *)&STACK[0x990] = 0u;
      *(_OWORD *)&STACK[0x9A0] = 0u;
      do
      {
        v109 = *(float64x2_t *)((char *)&v215 + v95);
        v108 = *(float64x2_t *)((char *)&v215 + v95 + 16);
        v110 = (float64x2_t *)((char *)&STACK[0x990] + v95);
        *v110 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v97, v109.f64[0]), v99, v109, 1), v101, v108.f64[0]), v103, v108, 1);
        v110[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v96, v109.f64[0]), v98, v109, 1), v100, v108.f64[0]), v102, v108, 1);
        v95 += 32;
      }
      while (v95 != 128);
      ARECEFToLLA(&v213);
      *(int8x16_t *)latitudeb = v213;
      v111 = v214;
      v112 = (void *)objc_opt_class();
      v113 = *(_OWORD *)&STACK[0xA60];
      v219 = *(_OWORD *)&STACK[0xA50];
      v220 = v113;
      v114 = *(_OWORD *)&STACK[0xA80];
      v221 = *(_OWORD *)&STACK[0xA70];
      v222 = v114;
      v115 = *(_OWORD *)&STACK[0xA20];
      v215 = *(_OWORD *)&STACK[0xA10];
      v216 = v115;
      v116 = *(_OWORD *)&STACK[0xA40];
      v217 = *(_OWORD *)&STACK[0xA30];
      v218 = v116;
      objc_msgSend(v112, "getHeadingForEnuFromCam:", &v215);
      v118 = v117 * 0.318309886 * 180.0;
      -[ARGeoTrackingTechniqueState enuOrigin](self->_state, "enuOrigin");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "undulation");
      v121 = ARWGS84ToMSLAltitude(v111, v120);

      v122 = [ARLocationEstimationData alloc];
      v123 = CLLocationCoordinate2DMake(latitudeb[0], latitudeb[1]);
      v124 = -[ARLocationEstimationData initWithCoordinates:altitude:heading:](v122, "initWithCoordinates:altitude:heading:", v123.latitude, v123.longitude, v121, v118);
      os_unfair_lock_lock(&self->_resultLock);
      -[ARGeoTrackingTechniqueState resultDatas](self->_state, "resultDatas");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "addObject:", v124);

      os_unfair_lock_unlock(&self->_resultLock);
      v8 = v201;
    }
    if (0xEEEEEEEEEEEEEEEFLL * self->_requestResultDataAtTimestampCallCount + 0x888888888888888 > 0x1111111111111110)
    {
LABEL_69:
      -[ARGeoTrackingTechniqueState lastCMDeviceMotion](self->_state, "lastCMDeviceMotion");
      v167 = objc_claimAutoreleasedReturnValue();
      if (v167)
      {
        v168 = (void *)v167;
        -[ARGeoTrackingTechniqueState lastCLLocation](self->_state, "lastCLLocation");
        v169 = objc_claimAutoreleasedReturnValue();
        if (v169)
        {
          v170 = (void *)v169;
          -[ARGeoTrackingTechniqueState enuOrigin](self->_state, "enuOrigin");
          v171 = (void *)objc_claimAutoreleasedReturnValue();

          if (v171)
          {
            -[ARGeoTrackingTechniqueState firstVLExecutionAttemptTimestamp](self->_state, "firstVLExecutionAttemptTimestamp");
            if (v172 < 0.0)
            {
              objc_msgSend(v8, "timestamp");
              -[ARGeoTrackingTechniqueState setFirstVLExecutionAttemptTimestamp:](self->_state, "setFirstVLExecutionAttemptTimestamp:");
            }
            objc_msgSend(v8, "timestamp");
            v174 = v173;
            -[ARGeoTrackingTechniqueState firstVLExecutionAttemptTimestamp](self->_state, "firstVLExecutionAttemptTimestamp");
            v176 = v174 - v175;
            -[ARGeoTrackingTechnique visualLocalizationCallIntervalTimeThreshold](self, "visualLocalizationCallIntervalTimeThreshold");
            if (v176 >= v177)
              -[ARGeoTrackingTechnique posteriorVisualLocalizationCallInterval](self, "posteriorVisualLocalizationCallInterval");
            else
              -[ARGeoTrackingTechnique visualLocalizationCallInterval](self, "visualLocalizationCallInterval");
            v179 = v178;
            if (!-[ARGeoTrackingTechnique VLPoseEstimationExecuting](self, "VLPoseEstimationExecuting"))
            {
              if (-[ARGeoTrackingTechnique visualLocalizationUpdatesRequested](self, "visualLocalizationUpdatesRequested"))
              {
                objc_msgSend(v8, "timestamp");
                v181 = v180;
                -[ARGeoTrackingTechniqueState lastVLExecutionAttemptTimestamp](self->_state, "lastVLExecutionAttemptTimestamp");
                if (v181 - v182 > v179)
                {
                  objc_msgSend(v8, "timestamp");
                  -[ARGeoTrackingTechniqueState setLastVLExecutionAttemptTimestamp:](self->_state, "setLastVLExecutionAttemptTimestamp:");
                  -[ARGeoTrackingTechniqueState setFailureReasons:](self->_state, "setFailureReasons:", 0);
                  _ARLogTechnique_9();
                  v183 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v183, OS_LOG_TYPE_INFO))
                  {
                    v184 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v184);
                    v185 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0DC6F58], "minimumTiltAngle");
                    LODWORD(STACK[0xB90]) = 138544130;
                    STACK[0xB94] = (unint64_t)v185;
                    LOWORD(STACK[0xB9C]) = 2048;
                    STACK[0xB9E] = (unint64_t)self;
                    LOWORD(STACK[0xBA6]) = 2048;
                    *(double *)&STACK[0xBA8] = v42;
                    LOWORD(STACK[0xBB0]) = 2048;
                    *(double *)&STACK[0xBB2] = 180.0 - v186;
                    _os_log_impl(&dword_1B3A68000, v183, OS_LOG_TYPE_INFO, "%{public}@ <%p>: pitchDegs<- %f minimumTiltAngle<- %f", (uint8_t *)&STACK[0xB90], 0x2Au);

                  }
                  -[ARGeoTrackingTechnique _estimatePose:pose:](self, "_estimatePose:pose:", v8, v13);
                }
              }
            }
          }
        }
        else
        {

        }
      }
      goto LABEL_84;
    }
    if (-[ARGeoTrackingTechniqueState trackingState](self->_state, "trackingState") == 3)
    {
      *(_OWORD *)&STACK[0xA80] = 0u;
      *(_OWORD *)&STACK[0xA70] = 0u;
      *(_OWORD *)&STACK[0xA60] = 0u;
      *(_OWORD *)&STACK[0xA50] = 0u;
      *(_OWORD *)&STACK[0xA40] = 0u;
      *(_OWORD *)&STACK[0xA20] = 0u;
      *(_OWORD *)&STACK[0xA30] = 0u;
      *(_OWORD *)&STACK[0xA10] = 0u;
      v126 = self->_state;
      if (v126)
      {
        -[ARGeoTrackingTechniqueState enuFromVIO](v126, "enuFromVIO");
      }
      else
      {
        v211 = 0uLL;
        v212 = 0uLL;
        v209 = 0uLL;
        v210 = 0uLL;
        v207 = 0uLL;
        v208 = 0uLL;
        v205 = 0uLL;
        v206 = 0uLL;
      }
      *(_OWORD *)&STACK[0xBD0] = v209;
      *(_OWORD *)&STACK[0xBE0] = v210;
      *(_OWORD *)&STACK[0xBF0] = v211;
      *(_OWORD *)&STACK[0xC00] = v212;
      *(_OWORD *)&STACK[0xB90] = v205;
      *(_OWORD *)&STACK[0xBA0] = v206;
      *(_OWORD *)&STACK[0xBB0] = v207;
      *(_OWORD *)&STACK[0xBC0] = v208;
      __invert_d4();
      _ARLogTechnique_9();
      v127 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
      {
        v128 = (objc_class *)objc_opt_class();
        NSStringFromClass(v128);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        v131 = *(_OWORD *)&STACK[0xA10];
        v130 = *(_OWORD *)&STACK[0xA20];
        v132 = *(_OWORD *)&STACK[0xA40];
        v133 = *(_OWORD *)&STACK[0xA30];
        v134 = *(_OWORD *)&STACK[0xA60];
        v135 = *(_OWORD *)&STACK[0xA50];
        v136 = *(_OWORD *)&STACK[0xA80];
        v137 = *(_OWORD *)&STACK[0xA70];
        LODWORD(STACK[0xB90]) = 138547714;
        STACK[0xB94] = (unint64_t)v129;
        LOWORD(STACK[0xB9C]) = 2048;
        STACK[0xB9E] = (unint64_t)self;
        LOWORD(STACK[0xBA6]) = 2048;
        STACK[0xBA8] = v131;
        LOWORD(STACK[0xBB0]) = 2048;
        STACK[0xBB2] = v133;
        LOWORD(STACK[0xBBA]) = 2048;
        STACK[0xBBC] = v135;
        LOWORD(STACK[0xBC4]) = 2048;
        STACK[0xBC6] = v137;
        LOWORD(STACK[0xBCE]) = 2048;
        STACK[0xBD0] = *((_QWORD *)&v131 + 1);
        LOWORD(STACK[0xBD8]) = 2048;
        STACK[0xBDA] = *((_QWORD *)&v133 + 1);
        LOWORD(STACK[0xBE2]) = 2048;
        STACK[0xBE4] = *((_QWORD *)&v135 + 1);
        LOWORD(STACK[0xBEC]) = 2048;
        STACK[0xBEE] = *((_QWORD *)&v137 + 1);
        LOWORD(STACK[0xBF6]) = 2048;
        STACK[0xBF8] = v130;
        LOWORD(STACK[0xC00]) = 2048;
        STACK[0xC02] = v132;
        LOWORD(STACK[0xC0A]) = 2048;
        STACK[0xC0C] = v134;
        LOWORD(STACK[0xC14]) = 2048;
        STACK[0xC16] = v136;
        LOWORD(STACK[0xC1E]) = 2048;
        STACK[0xC20] = *((_QWORD *)&v130 + 1);
        LOWORD(STACK[0xC28]) = 2048;
        STACK[0xC2A] = *((_QWORD *)&v132 + 1);
        LOWORD(STACK[0xC32]) = 2048;
        STACK[0xC34] = *((_QWORD *)&v134 + 1);
        LOWORD(STACK[0xC3C]) = 2048;
        STACK[0xC3E] = *((_QWORD *)&v136 + 1);
        _os_log_impl(&dword_1B3A68000, v127, OS_LOG_TYPE_INFO, "%{public}@ <%p>: anchorsForCameraWithTransform:vioFromENU<- %f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f", (uint8_t *)&STACK[0xB90], 0xB6u);

      }
    }
    objc_msgSend(v13, "visionCameraTransform");
    v233 = __invert_f4(v232);
    *(double *)v233.columns[0].i64 = v233.columns[3].f32[2];
    latitude = (float64x2_t)v233.columns[0];
    v202 = (int8x16_t)vcvtq_f64_f32(*(float32x2_t *)v233.columns[3].f32);
    -[ARGeoTrackingTechniqueState lastLoggedVioTimestamp](self->_state, "lastLoggedVioTimestamp");
    v138 = 0.0;
    if (v139 >= 0.0)
    {
      -[ARGeoTrackingTechniqueState lastLoggedVioTimestamp](self->_state, "lastLoggedVioTimestamp");
      v142 = a3 - v141;
      if (a3 - v141 > 0.0)
      {
        v143 = vextq_s8(v202, v202, 8uLL).u64[0];
        v144 = self->_state;
        if (v144)
        {
          v197 = v143;
          -[ARGeoTrackingTechniqueState lastLoggedVioPosition](v144, "lastLoggedVioPosition");
          v143 = v197;
          v145 = (float64x2_t)var20[2];
          v146 = vextq_s8((int8x16_t)v145, (int8x16_t)v145, 8uLL).u64[0];
          v140.f64[0] = v204;
        }
        else
        {
          v145.f64[0] = 0.0;
          v146 = 0;
          v140.f64[0] = 0.0;
        }
        *(_QWORD *)&v145.f64[1] = v146;
        *(_QWORD *)&v147.f64[0] = v202.i64[0];
        *(_QWORD *)&v147.f64[1] = v143;
        v148 = vsubq_f64(v147, v145);
        v149 = vsubq_f64(latitude, v140);
        v138 = sqrt(vmulq_f64(v149, v149).f64[0] + vaddvq_f64(vmulq_f64(v148, v148))) / v142;
      }
    }
    objc_msgSend(v13, "worldTrackingState");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = objc_msgSend(v150, "vioTrackingState");

    _ARLogTechnique_9();
    v152 = objc_claimAutoreleasedReturnValue();
    v153 = os_log_type_enabled(v152, OS_LOG_TYPE_INFO);
    if (v151)
    {
      if (v153)
      {
        v154 = (objc_class *)objc_opt_class();
        NSStringFromClass(v154);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        v156 = -[ARGeoTrackingTechniqueState resetCount](self->_state, "resetCount");
        LODWORD(STACK[0xB90]) = 138543874;
        STACK[0xB94] = (unint64_t)v155;
        LOWORD(STACK[0xB9C]) = 2048;
        STACK[0xB9E] = (unint64_t)self;
        LOWORD(STACK[0xBA6]) = 2048;
        STACK[0xBA8] = v156;
        v157 = "%{public}@ <%p>: _VIO<state: limited resets= %ld";
LABEL_61:
        _os_log_impl(&dword_1B3A68000, v152, OS_LOG_TYPE_INFO, v157, (uint8_t *)&STACK[0xB90], 0x20u);

      }
    }
    else if (v153)
    {
      v158 = (objc_class *)objc_opt_class();
      NSStringFromClass(v158);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      v159 = -[ARGeoTrackingTechniqueState resetCount](self->_state, "resetCount");
      LODWORD(STACK[0xB90]) = 138543874;
      STACK[0xB94] = (unint64_t)v155;
      LOWORD(STACK[0xB9C]) = 2048;
      STACK[0xB9E] = (unint64_t)self;
      LOWORD(STACK[0xBA6]) = 2048;
      STACK[0xBA8] = v159;
      v157 = "%{public}@ <%p>: _VIO<state: nominal resets= %ld";
      goto LABEL_61;
    }

    -[ARGeoTrackingTechniqueState setLastLoggedVioTimestamp:](self->_state, "setLastLoggedVioTimestamp:", a3);
    v160 = self->_state;
    var20[0] = v202;
    var20[1] = latitude;
    -[ARGeoTrackingTechniqueState setLastLoggedVioPosition:](v160, "setLastLoggedVioPosition:", var20);
    _ARLogTechnique_9();
    v161 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v161, OS_LOG_TYPE_INFO))
    {
      v162 = (objc_class *)objc_opt_class();
      NSStringFromClass(v162);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(STACK[0xB90]) = 138543874;
      STACK[0xB94] = (unint64_t)v163;
      LOWORD(STACK[0xB9C]) = 2048;
      STACK[0xB9E] = (unint64_t)self;
      LOWORD(STACK[0xBA6]) = 2048;
      *(double *)&STACK[0xBA8] = v138;
      _os_log_impl(&dword_1B3A68000, v161, OS_LOG_TYPE_INFO, "%{public}@ <%p>: _VIO< speed: %f m/s", (uint8_t *)&STACK[0xB90], 0x20u);

    }
    if (v138 > 5.0)
    {
      _ARLogTechnique_9();
      v164 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
      {
        v165 = (objc_class *)objc_opt_class();
        NSStringFromClass(v165);
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(STACK[0xB90]) = 138544642;
        STACK[0xB94] = (unint64_t)v166;
        LOWORD(STACK[0xB9C]) = 2048;
        STACK[0xB9E] = (unint64_t)self;
        LOWORD(STACK[0xBA6]) = 2048;
        *(double *)&STACK[0xBA8] = v138;
        LOWORD(STACK[0xBB0]) = 2048;
        STACK[0xBB2] = v202.i64[0];
        LOWORD(STACK[0xBBA]) = 2048;
        STACK[0xBBC] = v202.u64[1];
        LOWORD(STACK[0xBC4]) = 2048;
        STACK[0xBC6] = *(_QWORD *)&latitude.f64[0];
        _os_log_impl(&dword_1B3A68000, v164, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: _VIO< speed EXCESSIVE: %f m/s at position:(%f,%f,%f)", (uint8_t *)&STACK[0xB90], 0x3Eu);

      }
    }
    objc_msgSend(v13, "visionCameraTransform");
    -[ARGeoTrackingTechnique _logVioTransform:withTimestamp:withSuffix:](self, "_logVioTransform:withTimestamp:withSuffix:", "heartbeat");
    goto LABEL_69;
  }
LABEL_88:

}

+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3
{
  return objc_opt_class() == (_QWORD)a3;
}

+ (BOOL)isSupported
{
  return objc_msgSend(a1, "isSupportedWithOptions:", 0);
}

+ (BOOL)isSupportedWithOptions:(unint64_t)a3
{
  char v3;
  int HasGPSCapability;

  v3 = a3;
  HasGPSCapability = +[ARWorldTrackingTechnique isSupported](ARWorldTrackingTechnique, "isSupported");
  if (HasGPSCapability)
  {
    HasGPSCapability = objc_msgSend(MEMORY[0x1E0DC6F58], "isVisualLocalizationSupported");
    if (HasGPSCapability)
    {
      if ((v3 & 2) != 0 || (HasGPSCapability = ARDeviceHasGPSCapability()) != 0)
      {
        if ((v3 & 4) != 0)
          LOBYTE(HasGPSCapability) = 1;
        else
          LOBYTE(HasGPSCapability) = ARAppleNeuralEngine();
      }
    }
  }
  return HasGPSCapability;
}

+ (int64_t)getFailureReasonFromVLError:(int64_t)a3
{
  int64_t result;

  result = a3;
  if (a3 <= 200)
  {
    if (a3 <= 99)
    {
      if (a3 == 1)
        return result;
      if (a3 == 2)
        return 256;
    }
    else
    {
      switch(a3)
      {
        case 100:
          return 2;
        case 101:
          return 4;
        case 200:
          return 8;
      }
    }
  }
  else if (a3 > 299)
  {
    switch(a3)
    {
      case 300:
        return 32;
      case 400:
        return 128;
      case 404:
        return 1024;
    }
  }
  else if ((unint64_t)(a3 - 201) < 7)
  {
    return 16;
  }
  return 2048;
}

+ (long)getHeadingForEnuFromCam:(uint64_t)a3
{
  long double v3;

  v3 = atan2(*(long double *)(a3 + 64), *(long double *)(a3 + 72));
  return v3 + ceil(v3 / -6.28318531) * 6.28318531;
}

+ (BOOL)isCameraUp:(float)a3
{
  double v3;
  double v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC6F58], "minimumTiltAngle");
  return 180.0 - v4 >= v3;
}

- (void)_setTrackingState:(int64_t)a3 techniqueStateObject:(id)a4
{
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  ARGeoTrackingTechnique *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _ARLogTechnique_9();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromARGeoTrackingState(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v9;
    v13 = 2048;
    v14 = self;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Setting new tracking state: %@", (uint8_t *)&v11, 0x20u);

  }
  objc_msgSend(v6, "setTrackingState:", a3);

}

- (int64_t)_getHighestPriorityFailureWithTechniqueStateObject:(id)a3
{
  id v4;
  unint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  ARGeoTrackingTechnique *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "failureReasons");
  if (objc_msgSend(v4, "lastLoggedFailureReasons") != v5)
  {
    v7 = 1;
    *(_QWORD *)&v6 = 138543874;
    v22 = v6;
    while (1)
    {
      v8 = objc_msgSend(v4, "lastLoggedFailureReasons", v22) & v7;
      if ((v7 & v5) == 0 || v8)
      {
        if ((v7 & v5) != 0 || !v8)
          goto LABEL_12;
        _ARLogTechnique_9();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v14 = (objc_class *)objc_opt_class();
          NSStringFromClass(v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromARGeoTrackingInternalFailureReason(v7);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v22;
          v24 = v15;
          v25 = 2048;
          v26 = self;
          v27 = 2112;
          v28 = (uint64_t)v16;
          _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: ARGeoTrackingTechnique failure reason: ended %@", buf, 0x20u);

        }
      }
      else
      {
        objc_msgSend(v4, "setFailureLogCount:", objc_msgSend(v4, "failureLogCount") + 1);
        _ARLogTechnique_9();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v10 = (objc_class *)objc_opt_class();
          NSStringFromClass(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v4, "failureLogCount");
          NSStringFromARGeoTrackingInternalFailureReason(v7);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v24 = v11;
          v25 = 2048;
          v26 = self;
          v27 = 2048;
          v28 = v12;
          v29 = 2112;
          v30 = v13;
          _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: ARGeoTrackingTechnique failure reason: %ld started %@", buf, 0x2Au);

        }
      }

LABEL_12:
      v7 *= 2;
      if (v7 == 0x2000)
      {
        objc_msgSend(v4, "setLastLoggedFailureReasons:", v5);
        break;
      }
    }
  }
  if (objc_msgSend(v4, "trackingState") == 3)
  {
    v17 = 0;
    goto LABEL_35;
  }
  if ((v5 & 1) != 0)
  {
LABEL_28:
    v18 = 8;
    goto LABEL_29;
  }
  if ((v5 & 0x400) != 0)
  {
    v18 = 4;
    goto LABEL_29;
  }
  if ((v5 & 0x1000) != 0)
  {
    v18 = 5;
    goto LABEL_29;
  }
  if ((v5 & 0x200) != 0)
  {
    v18 = 1;
    goto LABEL_29;
  }
  if ((v5 & 6) == 0)
  {
    if ((v5 & 0x80) != 0)
    {
      v18 = 7;
      goto LABEL_29;
    }
    if ((v5 & 0x40) != 0)
    {
      v18 = 3;
      goto LABEL_29;
    }
    if ((v5 & 0x138) == 0)
    {
      v18 = (v5 >> 8) & 8;
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  v18 = 6;
LABEL_29:
  v19 = objc_msgSend(v4, "trackingState");
  if (v5)
    v20 = 0;
  else
    v20 = v19 == 2;
  if (v20)
    v17 = 8;
  else
    v17 = v18;
LABEL_35:

  return v17;
}

- (void)_logVioTransform:(float32x4_t)a3 withTimestamp:(float32x4_t)a4 withSuffix:(float32x4_t)a5
{
  double v11;
  id v12;
  int v13;
  int v14;
  int v15;
  NSObject *v16;
  int v17;
  objc_class *v18;
  void *v19;
  float64x2_t v20[12];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE buf[32];
  _BYTE v26[32];
  _BYTE v27[32];
  float64x2_t v28;
  float64x2_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  memset(&v20[8], 0, 64);
  ARMatrix4x4FloatToDouble(v20, a2, a3, a4, a5);
  *(float64x2_t *)v27 = v20[4];
  *(float64x2_t *)&v27[16] = v20[5];
  v28 = v20[6];
  v29 = v20[7];
  *(float64x2_t *)buf = v20[0];
  *(float64x2_t *)&buf[16] = v20[1];
  *(float64x2_t *)v26 = v20[2];
  *(float64x2_t *)&v26[16] = v20[3];
  __invert_d4();
  v11 = atan2(*(long double *)&v21, *((long double *)&v21 + 1)) * 0.318309886 * 180.0;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  v12 = *(id *)(a1 + 112);
  v13 = objc_msgSend(v12, "poseOkCount");
  v14 = objc_msgSend(v12, "poseOkCount");
  v15 = objc_msgSend(v12, "failureLogCount");
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  _ARLogTechnique_9();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = v14 + v15;
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545666;
    *(_QWORD *)&buf[4] = v19;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a1;
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)&buf[24] = v23;
    *(_WORD *)v26 = 2048;
    *(_QWORD *)&v26[2] = *((_QWORD *)&v23 + 1);
    *(_WORD *)&v26[10] = 2048;
    *(_QWORD *)&v26[12] = v24;
    *(_WORD *)&v26[20] = 2048;
    *(double *)&v26[22] = v11 + ceil(v11 / -360.0) * 360.0;
    *(_WORD *)&v26[30] = 1024;
    *(_DWORD *)v27 = v17;
    *(_WORD *)&v27[4] = 1024;
    *(_DWORD *)&v27[6] = v13;
    *(_WORD *)&v27[10] = 2048;
    *(double *)&v27[12] = a6;
    *(_WORD *)&v27[20] = 2080;
    *(_QWORD *)&v27[22] = a8;
    _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_INFO, "%{public}@ <%p>: _VIO<--x,y,z,yaw-( %f,%f,%f,%f°)- %i,%i ts %f %s", buf, 0x5Eu);

  }
}

- (void)_estimatePose:(id)a3 pose:(id)a4
{
  id v6;
  id v7;
  __CVBuffer *v8;
  __CVBuffer *v9;
  ARGeoTrackingTechniqueState *v10;
  ARWorldTrackingPoseData *v11;
  ARWorldTrackingPoseData *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  void *v22;
  void *v23;
  float v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  float v36;
  uint64_t v37;
  double v38;
  NSObject *v39;
  objc_class *v40;
  void *v41;
  float v42;
  dispatch_semaphore_t v43;
  __int128 v44;
  double v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  double v49;
  NSObject *v50;
  objc_class *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  float v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  ARWorldTrackingPoseData *v60;
  id v61;
  NSObject *v62;
  ARGeoTrackingTechniqueState *v63;
  uint64_t v64;
  int64_t requestResultDataAtTimestampCallCount;
  __int128 v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  float v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  double v76;
  __int128 v77;
  __int128 v78;
  double v79;
  __int128 v80;
  __int128 v81;
  double v82;
  uint64_t v83;
  __int128 v84;
  _OWORD v85[2];
  _QWORD v86[4];
  ARGeoTrackingTechniqueState *v87;
  ARGeoTrackingTechnique *v88;
  dispatch_semaphore_t v89;
  id v90;
  id v91;
  ARWorldTrackingPoseData *v92;
  __CVBuffer *v93;
  int64_t v94;
  __int128 v95;
  double v96;
  uint8_t buf[4];
  void *v98;
  __int16 v99;
  ARGeoTrackingTechnique *v100;
  __int16 v101;
  uint64_t v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "timestamp");
  kdebug_trace();
  v8 = (__CVBuffer *)objc_msgSend(v6, "pixelBuffer");
  if (v8)
  {
    v9 = v8;
    CVPixelBufferRetain(v8);
    os_unfair_lock_lock(&self->_resetLock);
    v10 = self->_state;
    os_unfair_lock_unlock(&self->_resetLock);
    v11 = [ARWorldTrackingPoseData alloc];
    objc_msgSend(v7, "timestamp");
    v12 = -[ARWorldTrackingPoseData initWithTimestamp:](v11, "initWithTimestamp:");
    objc_msgSend(v7, "visionCameraTransform");
    v82 = v13;
    objc_msgSend(v7, "visionCameraTransform");
    v79 = v14;
    objc_msgSend(v7, "visionCameraTransform");
    v76 = v15;
    objc_msgSend(v7, "visionCameraTransform");
    -[ARWorldTrackingPoseData setVisionCameraTransform:](v12, "setVisionCameraTransform:", v82, v79, v76);
    objc_msgSend(v7, "cameraTransform");
    -[ARWorldTrackingPoseData setCameraTransform:](v12, "setCameraTransform:");
    objc_msgSend(v7, "worldTrackingState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARWorldTrackingPoseData setWorldTrackingState:](v12, "setWorldTrackingState:", v16);

    -[ARGeoTrackingTechniqueState lastCMDeviceMotion](v10, "lastCMDeviceMotion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "deviceMotion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "gravity");
    v83 = v19;
    v64 = v20;
    v66 = v21;

    objc_msgSend(v17, "deviceMotion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "attitude");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = ARCameraDirectionFromCMAttitude(v23);
    v67 = v17;
    objc_msgSend(v17, "deviceMotion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "headingAccuracy");
    v27 = v26;

    -[ARGeoTrackingTechniqueState lastCLLocation](v10, "lastCLLocation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARWorldTrackingPoseData visionCameraTransform](v12, "visionCameraTransform");
    v70 = v30;
    v71 = v29;
    v68 = v32;
    v69 = v31;
    objc_msgSend(v6, "cameraIntrinsics");
    v77 = v34;
    v80 = v33;
    v74 = v35;
    if (v6)
    {
      objc_msgSend(v6, "radialDistortion");
      v36 = v96;
      v72 = v36;
      objc_msgSend(v6, "radialDistortion");
      *(float *)&v37 = v72;
      v38 = *((double *)&v95 + 1);
    }
    else
    {
      v38 = 0.0;
      LODWORD(v37) = 0;
    }
    v42 = v38;
    *((float *)&v37 + 1) = v42;
    v73 = v37;
    requestResultDataAtTimestampCallCount = self->_requestResultDataAtTimestampCallCount;
    -[ARGeoTrackingTechnique setVLPoseEstimationExecuting:](self, "setVLPoseEstimationExecuting:", 1);
    if (self->_deterministic)
      v43 = dispatch_semaphore_create(0);
    else
      v43 = 0;
    *(_QWORD *)&v44 = v83;
    *((_QWORD *)&v44 + 1) = v64;
    v84 = v44;
    v45 = v24;
    v46 = v80;
    HIDWORD(v46) = 0;
    v81 = v46;
    v47 = v77;
    HIDWORD(v47) = 0;
    v78 = v47;
    v48 = v74;
    HIDWORD(v48) = 0;
    v75 = v48;
    objc_msgSend(v6, "timestamp");
    -[ARGeoTrackingTechnique _logVioTransform:withTimestamp:withSuffix:](self, "_logVioTransform:withTimestamp:withSuffix:", "estimatePose", v71, v70, v69, v68, v49);
    -[ARGeoTrackingTechniqueState setHasStartedLocalization:](self->_state, "setHasStartedLocalization:", 1);
    objc_msgSend(v6, "timestamp");
    kdebug_trace();
    _ARLogTechnique_9();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      v51 = (objc_class *)objc_opt_class();
      NSStringFromClass(v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timestamp");
      *(_DWORD *)buf = 138543874;
      v98 = v52;
      v99 = 2048;
      v100 = self;
      v101 = 2048;
      v102 = v53;
      _os_log_impl(&dword_1B3A68000, v50, OS_LOG_TYPE_INFO, "%{public}@ <%p>: VL pose is estimating (%f)", buf, 0x20u);

    }
    objc_msgSend(v6, "timestamp");
    kdebug_trace();
    -[ARGeoTrackingTechniqueState VLHandle](v10, "VLHandle");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "location");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exposureTargetOffset");
    v57 = v56;
    objc_msgSend(v6, "timestamp");
    v59 = v58;
    v86[0] = MEMORY[0x1E0C809B0];
    v86[1] = 3221225472;
    v86[2] = __45__ARGeoTrackingTechnique__estimatePose_pose___block_invoke;
    v86[3] = &unk_1E6674D50;
    v87 = v10;
    v88 = self;
    v89 = v43;
    v90 = v28;
    v93 = v9;
    v94 = requestResultDataAtTimestampCallCount;
    v91 = v6;
    v92 = v12;
    v85[0] = v84;
    v85[1] = v66;
    v60 = v12;
    v61 = v28;
    v62 = v43;
    v63 = v10;
    -[ARGeoTrackingTechnique _callVLWithHandle:pixelBuffer:deviceLocation:heading:inputGravity:vioTransform:cameraIntrinsics:radialDistortion:exposureTargetOffset:timestamp:vlDeterminismSemaphore:completionHandler:](self, "_callVLWithHandle:pixelBuffer:deviceLocation:heading:inputGravity:vioTransform:cameraIntrinsics:radialDistortion:exposureTargetOffset:timestamp:vlDeterminismSemaphore:completionHandler:", v54, v9, v55, v85, v62, v86, v45, v27, v71, v70, v69, v68, v81, v78, v75, v73,
      *(_QWORD *)&v57,
      v59);

    kdebug_trace();
    kdebug_trace();

  }
  else
  {
    _ARLogTechnique_9();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v98 = v41;
      v99 = 2048;
      v100 = self;
      _os_log_impl(&dword_1B3A68000, v39, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Pixel buffer is nil", buf, 0x16u);

    }
    kdebug_trace();
  }

}

void __45__ARGeoTrackingTechnique__estimatePose_pose___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,__int128 a23,__int128 a24,__int128 a25,__int128 a26,__int128 a27,__int128 a28,__int128 a29,__int128 a30,__int128 a31,__int128 a32,__int128 a33,__int128 a34,__int128 a35,__int128 a36,__int128 a37,__int128 a38,__int128 a39,__int128 a40,__int128 a41,__int128 a42,float64x2_t a43)
{
  id v45;
  id v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  uint64_t v51;
  NSObject *v52;
  objc_class *v53;
  id v54;
  void *v55;
  unint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  void *v63;
  objc_class *v64;
  void *v65;
  unint64_t v66;
  void *v67;
  NSObject *v68;
  objc_class *v69;
  void *v70;
  void *v71;
  unint64_t v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  ARVisualLocalizationResultData *v77;
  void *v78;
  __int128 v79;
  NSObject *v80;
  objc_class *v81;
  void *v82;
  unint64_t v83;
  unint64_t v84;
  NSObject *v85;
  objc_class *v86;
  void *v87;
  unint64_t v88;
  CFAbsoluteTime Current;
  NSObject *v90;
  objc_class *v91;
  void *v92;
  unint64_t v93;
  unint64_t v94;
  NSObject *v95;
  objc_class *v96;
  void *v97;
  unint64_t v98;
  unint64_t v99;
  NSObject *v100;
  objc_class *v101;
  void *v102;
  unint64_t v103;
  __n128 v104;
  __n128 v105;
  __n128 v106;
  __n128 v107;
  void *v108;
  uint64_t i;
  NSObject *v110;
  objc_class *v111;
  void *v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  unint64_t v117;
  unint64_t v118;
  float v119;
  NSObject *v120;
  objc_class *v121;
  void *v122;
  unint64_t v123;
  float v124;
  void *v125;
  void *v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  float64x2_t v131;
  double v132;
  NSObject *v133;
  objc_class *v134;
  void *v135;
  unint64_t v136;
  int v137;
  unint64_t v138;
  ARVisualLocalizationResultData *v139;
  uint64_t v140;
  void *v141;
  double v142;
  ARVisualLocalizationResultData *v143;
  NSObject *v144;
  objc_class *v145;
  void *v146;
  unint64_t v147;
  int v148;
  float32x4_t v149;
  float32x4_t v150;
  float32x4_t v151;
  float32x4_t v152;
  void *v153;
  uint64_t v154;
  ARGeoTrackingConsensusAndAverageFilter *v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  ARGeoTrackingConsensusAndAverageFilter *v160;
  uint64_t v161;
  uint64_t v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  float64x2_t v167;
  float64x2_t v168;
  float64x2_t *v169;
  uint64_t v170;
  float64x2_t v171;
  float64x2_t v172;
  float64x2_t v173;
  float64x2_t v174;
  float64x2_t v175;
  float64x2_t v176;
  float64x2_t v177;
  float64x2_t v178;
  float64x2_t v179;
  float64x2_t v180;
  float64x2_t *v181;
  uint64_t v182;
  float64x2_t v183;
  float64x2_t v184;
  float64x2_t v185;
  float64x2_t v186;
  float64x2_t v187;
  float64x2_t v188;
  float64x2_t v189;
  float64x2_t v190;
  float64x2_t v191;
  float64x2_t v192;
  float64x2_t *v193;
  void *v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  void *v203;
  char v204;
  uint64_t v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  float64x2_t v210;
  float64x2_t v211;
  float64x2_t *v212;
  uint64_t v213;
  float64x2_t v214;
  float64x2_t v215;
  float64x2_t v216;
  float64x2_t v217;
  float64x2_t v218;
  float64x2_t v219;
  float64x2_t v220;
  float64x2_t v221;
  float64x2_t v222;
  float64x2_t v223;
  float64x2_t *v224;
  uint64_t v225;
  float64x2_t v226;
  float64x2_t v227;
  float64x2_t v228;
  float64x2_t v229;
  float64x2_t v230;
  float64x2_t v231;
  float64x2_t v232;
  float64x2_t v233;
  float64x2_t v234;
  float64x2_t v235;
  float64x2_t *v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  NSObject *v241;
  objc_class *v242;
  void *v243;
  unint64_t v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __n128 v249;
  __n128 v250;
  __n128 v251;
  __n128 v252;
  void *v253;
  NSObject *v254;
  objc_class *v255;
  void *v256;
  unint64_t v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __n128 v262;
  __n128 v263;
  __n128 v264;
  __n128 v265;
  void *v266;
  NSObject *v267;
  objc_class *v268;
  void *v269;
  unint64_t v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __n128 v275;
  __n128 v276;
  __n128 v277;
  __n128 v278;
  void *v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  double v284;
  double v285;
  double v286;
  int v287;
  NSObject *v288;
  _BOOL4 v289;
  objc_class *v290;
  void *v291;
  unint64_t v292;
  int v293;
  int v294;
  uint64_t v295;
  void *v296;
  __int128 v297;
  void *v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  ARGeoTrackingData *v303;
  objc_class *v304;
  void *v305;
  unint64_t v306;
  int v307;
  int v308;
  uint64_t v309;
  void *v310;
  __int128 v311;
  void *v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  NSObject *v317;
  objc_class *v318;
  void *v319;
  unint64_t v320;
  ARGeoTrackingGradualCorrectionFilter *v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  ARGeoTrackingGradualCorrectionFilter *v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  void *v331;
  __int128 *v332;
  __int128 v333;
  __int128 v334;
  __int128 v335;
  __int128 v336;
  ARGeoTrackingData *v337;
  void *v338;
  void *v339;
  float64x2_t v340;
  float64x2_t v341;
  float64x2_t v342;
  float64x2_t v343;
  float64x2_t v344;
  float64x2_t v345;
  float64x2_t vars0;
  float64x2_t v347;
  __int128 v348;
  float64x2_t v349;
  double v350;
  id v351;
  double v352;
  void *v353;
  __int128 v354;
  float64x2_t v355;
  float64x2_t v356;
  double v357;
  void *v358;
  double v359;

  STACK[0x19C8] = *MEMORY[0x1E0C80C00];
  v45 = a2;
  v46 = a3;
  objc_msgSend(v45, "confidence");
  kdebug_trace();
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "VLHandle");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "_algorithmVersion");

  if (v45)
  {
    objc_msgSend(v45, "debugInfo");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v46, "userInfo");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectForKeyedSubscript:", *MEMORY[0x1E0DC6F68]);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v51 = *(_QWORD *)(a1 + 40);
  v358 = v45;
  v353 = v49;
  if (*(_QWORD *)(v51 + 168))
  {
    _ARLogTechnique_9();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      v54 = v46;
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v49, "pngData");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(STACK[0x1930]) = 138543874;
      STACK[0x1934] = (unint64_t)v55;
      LOWORD(STACK[0x193C]) = 2048;
      STACK[0x193E] = v56;
      LOWORD(STACK[0x1946]) = 2048;
      STACK[0x1948] = (unint64_t)v57;
      _os_log_impl(&dword_1B3A68000, v52, OS_LOG_TYPE_INFO, "%{public}@ <%p>: writing VL trace with image data %p", (uint8_t *)&STACK[0x1930], 0x20u);

      v46 = v54;
    }

    objc_msgSend(*(id *)(a1 + 40), "VLTraceRecorder");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "recordAttempt:", v49);

    v51 = *(_QWORD *)(a1 + 40);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v51 + 104));
  v60 = *(_QWORD *)(a1 + 32);
  v59 = *(_QWORD *)(a1 + 40);
  v61 = *(_QWORD *)(v59 + 112);
  os_unfair_lock_unlock((os_unfair_lock_t)(v59 + 104));
  if (v60 == v61)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "setHasReturnedLocalization:", 1);
    v63 = v358;
    if (v46)
    {
      _ARLogTechnique_9();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        v69 = (objc_class *)objc_opt_class();
        NSStringFromClass(v69);
        v70 = v46;
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v70, "localizedDescription");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(STACK[0x1930]) = 138543874;
        STACK[0x1934] = (unint64_t)v71;
        LOWORD(STACK[0x193C]) = 2048;
        STACK[0x193E] = v72;
        LOWORD(STACK[0x1946]) = 2112;
        STACK[0x1948] = (unint64_t)v73;
        _os_log_impl(&dword_1B3A68000, v68, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Visual localization error: %@", (uint8_t *)&STACK[0x1930], 0x20u);

        v46 = v70;
      }

      v74 = v46;
      v75 = objc_msgSend(v46, "code");
      v76 = objc_msgSend((id)objc_opt_class(), "getFailureReasonFromVLError:", v75);
      v77 = -[ARVisualLocalizationResultData initWithVLLocalizationResult:errorCode:debugInfo:heading:inputLocation:algorithmVersion:undulation:]([ARVisualLocalizationResultData alloc], "initWithVLLocalizationResult:errorCode:debugInfo:heading:inputLocation:algorithmVersion:undulation:", 0, v75, v353, *(_QWORD *)(a1 + 56), v48, NAN, NAN);
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 56));
      objc_msgSend(*(id *)(a1 + 32), "resultDatas");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "addObject:", v77);

      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 56));
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 88));
      objc_msgSend(*(id *)(a1 + 32), "addFailureReason:", v76);
      if (objc_msgSend(*(id *)(a1 + 32), "trackingState") == 1 && (v76 & 6) == 0)
        objc_msgSend(*(id *)(a1 + 40), "_setTrackingState:techniqueStateObject:", 2, *(_QWORD *)(a1 + 32));
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 88));

      v46 = v74;
    }
    objc_msgSend(v358, "confidence");
    kdebug_trace();
    v67 = v353;
    if (!v358)
    {
LABEL_103:
      objc_msgSend(*(id *)(a1 + 40), "setVLPoseEstimationExecuting:", 0);
      if (!*(_BYTE *)(*(_QWORD *)(a1 + 40) + 72))
        goto LABEL_13;
      goto LABEL_12;
    }
    v351 = v46;
    objc_msgSend(v358, "location");
    v79 = *(_OWORD *)&STACK[0x1900];
    *(_OWORD *)&STACK[0x18A0] = *(_OWORD *)&STACK[0x1910];
    *(_OWORD *)&STACK[0x1890] = v79;
    ARECEFToLLA((int8x16_t *)&STACK[0x18B0]);
    v354 = *(_OWORD *)&STACK[0x18C0];
    v348 = *(_OWORD *)&STACK[0x18B0];
    _ARLogTechnique_9();
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
    {
      v81 = (objc_class *)objc_opt_class();
      NSStringFromClass(v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = *(_QWORD *)(a1 + 40);
      v84 = *(_QWORD *)(a1 + 88);
      LODWORD(STACK[0x1930]) = 138543874;
      STACK[0x1934] = (unint64_t)v82;
      LOWORD(STACK[0x193C]) = 2048;
      STACK[0x193E] = v83;
      LOWORD(STACK[0x1946]) = 2048;
      STACK[0x1948] = v84;
      _os_log_impl(&dword_1B3A68000, v80, OS_LOG_TYPE_INFO, "%{public}@ <%p>: VL Result: at frame = %ld", (uint8_t *)&STACK[0x1930], 0x20u);

    }
    _ARLogTechnique_9();
    v85 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
    {
      v86 = (objc_class *)objc_opt_class();
      NSStringFromClass(v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = *(_QWORD *)(a1 + 40);
      Current = CFAbsoluteTimeGetCurrent();
      LODWORD(STACK[0x1930]) = 138543874;
      STACK[0x1934] = (unint64_t)v87;
      LOWORD(STACK[0x193C]) = 2048;
      STACK[0x193E] = v88;
      LOWORD(STACK[0x1946]) = 2048;
      *(CFAbsoluteTime *)&STACK[0x1948] = Current;
      _os_log_impl(&dword_1B3A68000, v85, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: VL Result: iOSTime = %f", (uint8_t *)&STACK[0x1930], 0x20u);

    }
    _ARLogTechnique_9();
    v90 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
    {
      v91 = (objc_class *)objc_opt_class();
      NSStringFromClass(v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v358, "inputTimestamp");
      LODWORD(STACK[0x1930]) = 138543874;
      STACK[0x1934] = (unint64_t)v92;
      LOWORD(STACK[0x193C]) = 2048;
      STACK[0x193E] = v93;
      LOWORD(STACK[0x1946]) = 2048;
      STACK[0x1948] = v94;
      _os_log_impl(&dword_1B3A68000, v90, OS_LOG_TYPE_INFO, "%{public}@ <%p>: VL Result: sensorTimestamp = %f", (uint8_t *)&STACK[0x1930], 0x20u);

    }
    _ARLogTechnique_9();
    v95 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
    {
      v96 = (objc_class *)objc_opt_class();
      NSStringFromClass(v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v358, "location");
      v99 = STACK[0x18F0];
      LODWORD(STACK[0x1930]) = 138544643;
      STACK[0x1934] = (unint64_t)v97;
      LOWORD(STACK[0x193C]) = 2048;
      STACK[0x193E] = v98;
      LOWORD(STACK[0x1946]) = 2049;
      STACK[0x1948] = v348;
      LOWORD(STACK[0x1950]) = 2049;
      STACK[0x1952] = *((_QWORD *)&v348 + 1);
      LOWORD(STACK[0x195A]) = 2049;
      STACK[0x195C] = v354;
      LOWORD(STACK[0x1964]) = 2049;
      STACK[0x1966] = v99;
      _os_log_impl(&dword_1B3A68000, v95, OS_LOG_TYPE_INFO, "%{public}@ <%p>: VL Result: lat,lon,alt,accuracy = %{private}f, %{private}f, %{private}f, %{private}f", (uint8_t *)&STACK[0x1930], 0x3Eu);

    }
    _ARLogTechnique_9();
    v100 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
    {
      v101 = (objc_class *)objc_opt_class();
      NSStringFromClass(v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v358, "transform");
      v104.n128_f64[0] = ARMatrix4x4DoubleToFloat((float64x2_t *)&STACK[0x1810]);
      ARMatrix4x4Description(1, v104, v105, v106, v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(STACK[0x1930]) = 138543875;
      STACK[0x1934] = (unint64_t)v102;
      LOWORD(STACK[0x193C]) = 2048;
      STACK[0x193E] = v103;
      LOWORD(STACK[0x1946]) = 2113;
      STACK[0x1948] = (unint64_t)v108;
      _os_log_impl(&dword_1B3A68000, v100, OS_LOG_TYPE_INFO, "%{public}@ <%p>: VL Result: ecefFromCam = %{private}@", (uint8_t *)&STACK[0x1930], 0x20u);

    }
    for (i = 0; i != 6; ++i)
    {
      _ARLogTechnique_9();
      v110 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
      {
        v111 = (objc_class *)objc_opt_class();
        NSStringFromClass(v111);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v358, "covariance");
        *(double *)&v114 = *((float *)&STACK[0x1780] + i);
        objc_msgSend(v358, "covariance");
        *(double *)&v115 = *((float *)&STACK[0x16F0] + i + 6);
        objc_msgSend(v358, "covariance");
        *(double *)&v116 = *((float *)&STACK[0x1660] + i + 12);
        objc_msgSend(v358, "covariance");
        *(double *)&v117 = *((float *)&STACK[0x15D0] + i + 18);
        objc_msgSend(v358, "covariance");
        *(double *)&v118 = *((float *)&STACK[0x1540] + i + 24);
        objc_msgSend(v358, "covariance");
        v119 = *((float *)&STACK[0x14B0] + i + 30);
        LODWORD(STACK[0x1930]) = 138545410;
        STACK[0x1934] = (unint64_t)v112;
        LOWORD(STACK[0x193C]) = 2048;
        STACK[0x193E] = v113;
        LOWORD(STACK[0x1946]) = 2048;
        STACK[0x1948] = i + 1;
        LOWORD(STACK[0x1950]) = 2048;
        STACK[0x1952] = v114;
        LOWORD(STACK[0x195A]) = 2048;
        STACK[0x195C] = v115;
        LOWORD(STACK[0x1964]) = 2048;
        STACK[0x1966] = v116;
        LOWORD(STACK[0x196E]) = 2048;
        STACK[0x1970] = v117;
        LOWORD(STACK[0x1978]) = 2048;
        STACK[0x197A] = v118;
        LOWORD(STACK[0x1982]) = 2048;
        *(double *)&STACK[0x1984] = v119;
        _os_log_impl(&dword_1B3A68000, v110, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: VL Result: covariance col %zu = %f, %f, %f, %f, %f, %f", (uint8_t *)&STACK[0x1930], 0x5Cu);

      }
    }
    _ARLogTechnique_9();
    v120 = objc_claimAutoreleasedReturnValue();
    v63 = v358;
    if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
    {
      v121 = (objc_class *)objc_opt_class();
      NSStringFromClass(v121);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v358, "confidence");
      LODWORD(STACK[0x1930]) = 138543874;
      STACK[0x1934] = (unint64_t)v122;
      LOWORD(STACK[0x193C]) = 2048;
      STACK[0x193E] = v123;
      LOWORD(STACK[0x1946]) = 2048;
      *(double *)&STACK[0x1948] = v124;
      _os_log_impl(&dword_1B3A68000, v120, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: VL Result: confidence = %f", (uint8_t *)&STACK[0x1930], 0x20u);

    }
    *(_OWORD *)&STACK[0x14A0] = 0u;
    *(_OWORD *)&STACK[0x1490] = 0u;
    *(_OWORD *)&STACK[0x1480] = 0u;
    *(_OWORD *)&STACK[0x1470] = 0u;
    *(_OWORD *)&STACK[0x1460] = 0u;
    *(_OWORD *)&STACK[0x1450] = 0u;
    *(_OWORD *)&STACK[0x1440] = 0u;
    *(_OWORD *)&STACK[0x1430] = 0u;
    objc_msgSend(v358, "transform");
    *(_OWORD *)&STACK[0x1420] = 0u;
    *(_OWORD *)&STACK[0x1410] = 0u;
    *(_OWORD *)&STACK[0x1400] = 0u;
    *(_OWORD *)&STACK[0x13F0] = 0u;
    *(_OWORD *)&STACK[0x13E0] = 0u;
    *(_OWORD *)&STACK[0x13D0] = 0u;
    *(_OWORD *)&STACK[0x13C0] = 0u;
    *(_OWORD *)&STACK[0x13B0] = 0u;
    objc_msgSend(*(id *)(a1 + 32), "enuOrigin");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = v125;
    v67 = v353;
    if (v125)
    {
      objc_msgSend(v125, "ecefFromlocation");
    }
    else
    {
      *(_OWORD *)&STACK[0x13A0] = 0u;
      *(_OWORD *)&STACK[0x1390] = 0u;
      *(_OWORD *)&STACK[0x1380] = 0u;
      *(_OWORD *)&STACK[0x1370] = 0u;
      *(_OWORD *)&STACK[0x1360] = 0u;
      *(_OWORD *)&STACK[0x1350] = 0u;
      *(_OWORD *)&STACK[0x1340] = 0u;
      *(_OWORD *)&STACK[0x1330] = 0u;
    }
    v127 = *(_OWORD *)&STACK[0x1380];
    *(_OWORD *)&STACK[0x1970] = *(_OWORD *)&STACK[0x1370];
    *(_OWORD *)&STACK[0x1980] = v127;
    v128 = *(_OWORD *)&STACK[0x13A0];
    *(_OWORD *)&STACK[0x1990] = *(_OWORD *)&STACK[0x1390];
    *(_OWORD *)&STACK[0x19A0] = v128;
    v129 = *(_OWORD *)&STACK[0x1340];
    *(_OWORD *)&STACK[0x1930] = *(_OWORD *)&STACK[0x1330];
    *(_OWORD *)&STACK[0x1940] = v129;
    v130 = *(_OWORD *)&STACK[0x1360];
    *(_OWORD *)&STACK[0x1950] = *(_OWORD *)&STACK[0x1350];
    *(_OWORD *)&STACK[0x1960] = v130;
    __invert_d4();

    v343 = *(float64x2_t *)&STACK[0x13E0];
    v344 = *(float64x2_t *)&STACK[0x13C0];
    v347 = *(float64x2_t *)&STACK[0x1420];
    v349 = *(float64x2_t *)&STACK[0x1400];
    v342 = *(float64x2_t *)&STACK[0x13B0];
    v345 = *(float64x2_t *)&STACK[0x13F0];
    vars0 = *(float64x2_t *)&STACK[0x13D0];
    v355 = *(float64x2_t *)&STACK[0x1410];
    v131 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(*(float64x2_t *)&STACK[0x13B0], *(double *)&STACK[0x1430]), *(float64x2_t *)&STACK[0x13D0], *(float64x2_t *)&STACK[0x1430], 1), *(float64x2_t *)&STACK[0x13F0], *(double *)&STACK[0x1440]), *(float64x2_t *)&STACK[0x1410], *(float64x2_t *)&STACK[0x1440], 1);
    v132 = (1.57079633 - atan2(v131.f64[1], v131.f64[0])) * 0.318309886 * 180.0;
    v340 = *(float64x2_t *)&STACK[0x1490];
    v341 = *(float64x2_t *)&STACK[0x14A0];
    _ARLogTechnique_9();
    v133 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
    {
      v356 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v342, v340.f64[0]), vars0, v340, 1), v345, v341.f64[0]), v355, v341, 1);
      v134 = (objc_class *)objc_opt_class();
      NSStringFromClass(v134);
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      v136 = *(_QWORD *)(a1 + 40);
      v137 = objc_msgSend(*(id *)(a1 + 32), "poseOkCount");
      objc_msgSend(*(id *)(a1 + 64), "timestamp");
      LODWORD(STACK[0x1930]) = 138545155;
      STACK[0x1934] = (unint64_t)v135;
      LOWORD(STACK[0x193C]) = 2048;
      STACK[0x193E] = v136;
      v63 = v358;
      LOWORD(STACK[0x1946]) = 2048;
      STACK[0x1948] = *(_QWORD *)&v356.f64[0];
      LOWORD(STACK[0x1950]) = 2048;
      STACK[0x1952] = *(_QWORD *)&v356.f64[1];
      LOWORD(STACK[0x195A]) = 2048;
      STACK[0x195C] = *(_OWORD *)&vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v344, v340.f64[0]), v343, v340, 1), v349, v341.f64[0]), v347, v341, 1);
      LOWORD(STACK[0x1964]) = 2049;
      *(double *)&STACK[0x1966] = v132 + ceil(v132 / -360.0) * 360.0;
      LOWORD(STACK[0x196E]) = 1024;
      LODWORD(STACK[0x1970]) = v137;
      LOWORD(STACK[0x1974]) = 2048;
      STACK[0x1976] = v138;
      _os_log_impl(&dword_1B3A68000, v133, OS_LOG_TYPE_INFO, "%{public}@ <%p>: _VL_VIO<-x,y,z,yaw-( %f,%f,%f,%{private}f°)- %i ts %f vlPose", (uint8_t *)&STACK[0x1930], 0x4Eu);

    }
    v139 = [ARVisualLocalizationResultData alloc];
    v140 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "enuOrigin");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "undulation");
    v143 = -[ARVisualLocalizationResultData initWithVLLocalizationResult:errorCode:debugInfo:heading:inputLocation:algorithmVersion:undulation:](v139, "initWithVLLocalizationResult:errorCode:debugInfo:heading:inputLocation:algorithmVersion:undulation:", v63, 0, v353, v140, v48, v132, v142);

    objc_msgSend(*(id *)(a1 + 32), "setPoseOkCount:", objc_msgSend(*(id *)(a1 + 32), "poseOkCount") + 1);
    _ARLogTechnique_9();
    v144 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v144, OS_LOG_TYPE_INFO))
    {
      v145 = (objc_class *)objc_opt_class();
      NSStringFromClass(v145);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      v147 = *(_QWORD *)(a1 + 40);
      v148 = objc_msgSend(*(id *)(a1 + 32), "poseOkCount");
      LODWORD(STACK[0x1930]) = 138543874;
      STACK[0x1934] = (unint64_t)v146;
      LOWORD(STACK[0x193C]) = 2048;
      STACK[0x193E] = v147;
      LOWORD(STACK[0x1946]) = 1024;
      LODWORD(STACK[0x1948]) = v148;
      _os_log_impl(&dword_1B3A68000, v144, OS_LOG_TYPE_INFO, "%{public}@ <%p>: VL Pose is OK %d ! ", (uint8_t *)&STACK[0x1930], 0x1Cu);

    }
    *(_OWORD *)&STACK[0x1320] = 0u;
    *(_OWORD *)&STACK[0x1310] = 0u;
    *(_OWORD *)&STACK[0x1300] = 0u;
    *(_OWORD *)&STACK[0x12F0] = 0u;
    *(_OWORD *)&STACK[0x12E0] = 0u;
    *(_OWORD *)&STACK[0x12D0] = 0u;
    *(_OWORD *)&STACK[0x12C0] = 0u;
    *(_OWORD *)&STACK[0x12B0] = 0u;
    objc_msgSend(*(id *)(a1 + 72), "visionCameraTransform");
    objc_msgSend(*(id *)(a1 + 32), "consensusAverageFilter", ARMatrix4x4FloatToDouble((float64x2_t *)&STACK[0x12B0], v149, v150, v151, v152).f64[0]);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    if (v153)
    {

    }
    else
    {
      v154 = *(_QWORD *)(a1 + 40);
      if (!*(_BYTE *)(v154 + 73) || !*(_BYTE *)(v154 + 74))
      {
        v155 = [ARGeoTrackingConsensusAndAverageFilter alloc];
        v156 = *(_OWORD *)&STACK[0x1400];
        *(_OWORD *)&STACK[0x1970] = *(_OWORD *)&STACK[0x13F0];
        *(_OWORD *)&STACK[0x1980] = v156;
        v157 = *(_OWORD *)&STACK[0x1420];
        *(_OWORD *)&STACK[0x1990] = *(_OWORD *)&STACK[0x1410];
        *(_OWORD *)&STACK[0x19A0] = v157;
        v158 = *(_OWORD *)&STACK[0x13C0];
        *(_OWORD *)&STACK[0x1930] = *(_OWORD *)&STACK[0x13B0];
        *(_OWORD *)&STACK[0x1940] = v158;
        v159 = *(_OWORD *)&STACK[0x13E0];
        *(_OWORD *)&STACK[0x1950] = *(_OWORD *)&STACK[0x13D0];
        *(_OWORD *)&STACK[0x1960] = v159;
        v160 = -[ARGeoTrackingConsensusAndAverageFilter initWithENUFromECEF:maxHistory:minInlierScore:](v155, "initWithENUFromECEF:maxHistory:minInlierScore:", &STACK[0x1930], 20, 1.0);
        objc_msgSend(*(id *)(a1 + 32), "setConsensusAverageFilter:", v160);

      }
    }
    *(_OWORD *)&STACK[0x12A0] = 0u;
    *(_OWORD *)&STACK[0x1290] = 0u;
    *(_OWORD *)&STACK[0x1280] = 0u;
    *(_OWORD *)&STACK[0x1270] = 0u;
    *(_OWORD *)&STACK[0x1260] = 0u;
    *(_OWORD *)&STACK[0x1250] = 0u;
    *(_OWORD *)&STACK[0x1240] = 0u;
    *(_OWORD *)&STACK[0x1230] = 0u;
    v161 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(v161 + 73) && *(_BYTE *)(v161 + 74))
    {
      v162 = 0;
      v163 = *(_OWORD *)&STACK[0x1300];
      *(_OWORD *)&STACK[0x1970] = *(_OWORD *)&STACK[0x12F0];
      *(_OWORD *)&STACK[0x1980] = v163;
      v164 = *(_OWORD *)&STACK[0x1320];
      *(_OWORD *)&STACK[0x1990] = *(_OWORD *)&STACK[0x1310];
      *(_OWORD *)&STACK[0x19A0] = v164;
      v165 = *(_OWORD *)&STACK[0x12C0];
      *(_OWORD *)&STACK[0x1930] = *(_OWORD *)&STACK[0x12B0];
      *(_OWORD *)&STACK[0x1940] = v165;
      v166 = *(_OWORD *)&STACK[0x12E0];
      *(_OWORD *)&STACK[0x1950] = *(_OWORD *)&STACK[0x12D0];
      *(_OWORD *)&STACK[0x1960] = v166;
      *(_OWORD *)&STACK[0x11A0] = 0u;
      *(_OWORD *)&STACK[0x1190] = 0u;
      *(_OWORD *)&STACK[0x1180] = 0u;
      *(_OWORD *)&STACK[0x1170] = 0u;
      *(_OWORD *)&STACK[0x1160] = 0u;
      *(_OWORD *)&STACK[0x1150] = 0u;
      *(_OWORD *)&STACK[0x1140] = 0u;
      *(_OWORD *)&STACK[0x1130] = 0u;
      do
      {
        v168 = *(float64x2_t *)((char *)&STACK[0x1930] + v162);
        v167 = *(float64x2_t *)((char *)&STACK[0x1930] + v162 + 16);
        v169 = (float64x2_t *)((char *)&STACK[0x1130] + v162);
        *v169 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)xmmword_1B3BE4190, v168.f64[0]), (float64x2_t)0, v168, 1), (float64x2_t)xmmword_1B3BE4160, v167.f64[0]), (float64x2_t)0, v167, 1);
        v169[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)0, v168.f64[0]), (float64x2_t)xmmword_1B3BE4160, v168, 1), (float64x2_t)0, v167.f64[0]), (float64x2_t)xmmword_1B3BE4190, v167, 1);
        v162 += 32;
      }
      while (v162 != 128);
      v170 = 0;
      v171 = *(float64x2_t *)&STACK[0x1440];
      v172 = *(float64x2_t *)&STACK[0x1430];
      v173 = *(float64x2_t *)&STACK[0x1460];
      v174 = *(float64x2_t *)&STACK[0x1450];
      v175 = *(float64x2_t *)&STACK[0x1480];
      v176 = *(float64x2_t *)&STACK[0x1470];
      v177 = *(float64x2_t *)&STACK[0x14A0];
      v178 = *(float64x2_t *)&STACK[0x1490];
      *(_OWORD *)&STACK[0x11B0] = 0u;
      *(_OWORD *)&STACK[0x11C0] = 0u;
      *(_OWORD *)&STACK[0x11D0] = 0u;
      *(_OWORD *)&STACK[0x11E0] = 0u;
      *(_OWORD *)&STACK[0x11F0] = 0u;
      *(_OWORD *)&STACK[0x1200] = 0u;
      *(_OWORD *)&STACK[0x1210] = 0u;
      *(_OWORD *)&STACK[0x1220] = 0u;
      do
      {
        v180 = *(float64x2_t *)((char *)&STACK[0x1130] + v170);
        v179 = *(float64x2_t *)((char *)&STACK[0x1130] + v170 + 16);
        v181 = (float64x2_t *)((char *)&STACK[0x11B0] + v170);
        *v181 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v172, v180.f64[0]), v174, v180, 1), v176, v179.f64[0]), v178, v179, 1);
        v181[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v171, v180.f64[0]), v173, v180, 1), v175, v179.f64[0]), v177, v179, 1);
        v170 += 32;
      }
      while (v170 != 128);
      v182 = 0;
      v183 = *(float64x2_t *)&STACK[0x13C0];
      v184 = *(float64x2_t *)&STACK[0x13B0];
      v185 = *(float64x2_t *)&STACK[0x13E0];
      v186 = *(float64x2_t *)&STACK[0x13D0];
      v187 = *(float64x2_t *)&STACK[0x1400];
      v188 = *(float64x2_t *)&STACK[0x13F0];
      v189 = *(float64x2_t *)&STACK[0x1420];
      v190 = *(float64x2_t *)&STACK[0x1410];
      *(_OWORD *)&STACK[0x1930] = 0u;
      *(_OWORD *)&STACK[0x1940] = 0u;
      *(_OWORD *)&STACK[0x1950] = 0u;
      *(_OWORD *)&STACK[0x1960] = 0u;
      *(_OWORD *)&STACK[0x1970] = 0u;
      *(_OWORD *)&STACK[0x1980] = 0u;
      *(_OWORD *)&STACK[0x1990] = 0u;
      *(_OWORD *)&STACK[0x19A0] = 0u;
      do
      {
        v192 = *(float64x2_t *)((char *)&STACK[0x11B0] + v182);
        v191 = *(float64x2_t *)((char *)&STACK[0x11B0] + v182 + 16);
        v193 = (float64x2_t *)((char *)&STACK[0x1930] + v182);
        *v193 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v184, v192.f64[0]), v186, v192, 1), v188, v191.f64[0]), v190, v191, 1);
        v193[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v183, v192.f64[0]), v185, v192, 1), v187, v191.f64[0]), v189, v191, 1);
        v182 += 32;
      }
      while (v182 != 128);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "consensusAverageFilter");
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      v195 = *(_OWORD *)&STACK[0x1300];
      *(_OWORD *)&STACK[0x1970] = *(_OWORD *)&STACK[0x12F0];
      *(_OWORD *)&STACK[0x1980] = v195;
      v196 = *(_OWORD *)&STACK[0x1320];
      *(_OWORD *)&STACK[0x1990] = *(_OWORD *)&STACK[0x1310];
      *(_OWORD *)&STACK[0x19A0] = v196;
      v197 = *(_OWORD *)&STACK[0x12C0];
      *(_OWORD *)&STACK[0x1930] = *(_OWORD *)&STACK[0x12B0];
      *(_OWORD *)&STACK[0x1940] = v197;
      v198 = *(_OWORD *)&STACK[0x12E0];
      *(_OWORD *)&STACK[0x1950] = *(_OWORD *)&STACK[0x12D0];
      *(_OWORD *)&STACK[0x1960] = v198;
      v199 = *(_OWORD *)&STACK[0x1470];
      *(_OWORD *)&STACK[0x1100] = *(_OWORD *)&STACK[0x1480];
      v200 = *(_OWORD *)&STACK[0x14A0];
      *(_OWORD *)&STACK[0x1110] = *(_OWORD *)&STACK[0x1490];
      *(_OWORD *)&STACK[0x1120] = v200;
      v201 = *(_OWORD *)&STACK[0x1440];
      *(_OWORD *)&STACK[0x10B0] = *(_OWORD *)&STACK[0x1430];
      *(_OWORD *)&STACK[0x10C0] = v201;
      v202 = *(_OWORD *)&STACK[0x1460];
      *(_OWORD *)&STACK[0x10D0] = *(_OWORD *)&STACK[0x1450];
      *(_OWORD *)&STACK[0x10E0] = v202;
      *(_OWORD *)&STACK[0x10F0] = v199;
      objc_msgSend(v194, "updateWithVIOPose:VLPose:", &STACK[0x1930], &STACK[0x10B0]);

      objc_msgSend(*(id *)(a1 + 32), "consensusAverageFilter");
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "timestamp");
      v204 = objc_msgSend(v203, "getCurrentENUFromVIO:ENUFromVIO:", &STACK[0x1230]);

      if ((v204 & 1) != 0)
        goto LABEL_67;
      v205 = 0;
      v206 = *(_OWORD *)&STACK[0x1300];
      *(_OWORD *)&STACK[0x1970] = *(_OWORD *)&STACK[0x12F0];
      *(_OWORD *)&STACK[0x1980] = v206;
      v207 = *(_OWORD *)&STACK[0x1320];
      *(_OWORD *)&STACK[0x1990] = *(_OWORD *)&STACK[0x1310];
      *(_OWORD *)&STACK[0x19A0] = v207;
      v208 = *(_OWORD *)&STACK[0x12C0];
      *(_OWORD *)&STACK[0x1930] = *(_OWORD *)&STACK[0x12B0];
      *(_OWORD *)&STACK[0x1940] = v208;
      v209 = *(_OWORD *)&STACK[0x12E0];
      *(_OWORD *)&STACK[0x1950] = *(_OWORD *)&STACK[0x12D0];
      *(_OWORD *)&STACK[0x1960] = v209;
      *(_OWORD *)&STACK[0x1010] = 0u;
      *(_OWORD *)&STACK[0x1020] = 0u;
      *(_OWORD *)&STACK[0xFF0] = 0u;
      *(_OWORD *)&STACK[0x1000] = 0u;
      *(_OWORD *)&STACK[0xFD0] = 0u;
      *(_OWORD *)&STACK[0xFE0] = 0u;
      *(_OWORD *)&STACK[0xFB0] = 0u;
      *(_OWORD *)&STACK[0xFC0] = 0u;
      do
      {
        v211 = *(float64x2_t *)((char *)&STACK[0x1930] + v205);
        v210 = *(float64x2_t *)((char *)&STACK[0x1930] + v205 + 16);
        v212 = (float64x2_t *)((char *)&STACK[0xFB0] + v205);
        *v212 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)xmmword_1B3BE4190, v211.f64[0]), (float64x2_t)0, v211, 1), (float64x2_t)xmmword_1B3BE4160, v210.f64[0]), (float64x2_t)0, v210, 1);
        v212[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)0, v211.f64[0]), (float64x2_t)xmmword_1B3BE4160, v211, 1), (float64x2_t)0, v210.f64[0]), (float64x2_t)xmmword_1B3BE4190, v210, 1);
        v205 += 32;
      }
      while (v205 != 128);
      v213 = 0;
      v214 = *(float64x2_t *)&STACK[0x1440];
      v215 = *(float64x2_t *)&STACK[0x1430];
      v216 = *(float64x2_t *)&STACK[0x1460];
      v217 = *(float64x2_t *)&STACK[0x1450];
      v218 = *(float64x2_t *)&STACK[0x1480];
      v219 = *(float64x2_t *)&STACK[0x1470];
      v220 = *(float64x2_t *)&STACK[0x14A0];
      v221 = *(float64x2_t *)&STACK[0x1490];
      *(_OWORD *)&STACK[0x1030] = 0u;
      *(_OWORD *)&STACK[0x1040] = 0u;
      *(_OWORD *)&STACK[0x1050] = 0u;
      *(_OWORD *)&STACK[0x1060] = 0u;
      *(_OWORD *)&STACK[0x1070] = 0u;
      *(_OWORD *)&STACK[0x1080] = 0u;
      *(_OWORD *)&STACK[0x1090] = 0u;
      *(_OWORD *)&STACK[0x10A0] = 0u;
      do
      {
        v223 = *(float64x2_t *)((char *)&STACK[0xFB0] + v213);
        v222 = *(float64x2_t *)((char *)&STACK[0xFB0] + v213 + 16);
        v224 = (float64x2_t *)((char *)&STACK[0x1030] + v213);
        *v224 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v215, v223.f64[0]), v217, v223, 1), v219, v222.f64[0]), v221, v222, 1);
        v224[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v214, v223.f64[0]), v216, v223, 1), v218, v222.f64[0]), v220, v222, 1);
        v213 += 32;
      }
      while (v213 != 128);
      v225 = 0;
      v226 = *(float64x2_t *)&STACK[0x13C0];
      v227 = *(float64x2_t *)&STACK[0x13B0];
      v228 = *(float64x2_t *)&STACK[0x13E0];
      v229 = *(float64x2_t *)&STACK[0x13D0];
      v230 = *(float64x2_t *)&STACK[0x1400];
      v231 = *(float64x2_t *)&STACK[0x13F0];
      v232 = *(float64x2_t *)&STACK[0x1420];
      v233 = *(float64x2_t *)&STACK[0x1410];
      *(_OWORD *)&STACK[0x1930] = 0u;
      *(_OWORD *)&STACK[0x1940] = 0u;
      *(_OWORD *)&STACK[0x1950] = 0u;
      *(_OWORD *)&STACK[0x1960] = 0u;
      *(_OWORD *)&STACK[0x1970] = 0u;
      *(_OWORD *)&STACK[0x1980] = 0u;
      *(_OWORD *)&STACK[0x1990] = 0u;
      *(_OWORD *)&STACK[0x19A0] = 0u;
      do
      {
        v235 = *(float64x2_t *)((char *)&STACK[0x1030] + v225);
        v234 = *(float64x2_t *)((char *)&STACK[0x1030] + v225 + 16);
        v236 = (float64x2_t *)((char *)&STACK[0x1930] + v225);
        *v236 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v227, v235.f64[0]), v229, v235, 1), v231, v234.f64[0]), v233, v234, 1);
        v236[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v226, v235.f64[0]), v228, v235, 1), v230, v234.f64[0]), v232, v234, 1);
        v225 += 32;
      }
      while (v225 != 128);
    }
    v237 = *(_OWORD *)&STACK[0x1980];
    *(_OWORD *)&STACK[0x1270] = *(_OWORD *)&STACK[0x1970];
    *(_OWORD *)&STACK[0x1280] = v237;
    v238 = *(_OWORD *)&STACK[0x19A0];
    *(_OWORD *)&STACK[0x1290] = *(_OWORD *)&STACK[0x1990];
    *(_OWORD *)&STACK[0x12A0] = v238;
    v239 = *(_OWORD *)&STACK[0x1940];
    *(_OWORD *)&STACK[0x1230] = *(_OWORD *)&STACK[0x1930];
    *(_OWORD *)&STACK[0x1240] = v239;
    v240 = *(_OWORD *)&STACK[0x1960];
    *(_OWORD *)&STACK[0x1250] = *(_OWORD *)&STACK[0x1950];
    *(_OWORD *)&STACK[0x1260] = v240;
LABEL_67:
    _ARLogTechnique_9();
    v241 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v241, OS_LOG_TYPE_INFO))
    {
      v242 = (objc_class *)objc_opt_class();
      NSStringFromClass(v242);
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      v244 = *(_QWORD *)(a1 + 40);
      v245 = *(_OWORD *)&STACK[0x1280];
      *(_OWORD *)&STACK[0x1970] = *(_OWORD *)&STACK[0x1270];
      *(_OWORD *)&STACK[0x1980] = v245;
      v246 = *(_OWORD *)&STACK[0x12A0];
      *(_OWORD *)&STACK[0x1990] = *(_OWORD *)&STACK[0x1290];
      *(_OWORD *)&STACK[0x19A0] = v246;
      v247 = *(_OWORD *)&STACK[0x1240];
      *(_OWORD *)&STACK[0x1930] = *(_OWORD *)&STACK[0x1230];
      *(_OWORD *)&STACK[0x1940] = v247;
      v248 = *(_OWORD *)&STACK[0x1260];
      *(_OWORD *)&STACK[0x1950] = *(_OWORD *)&STACK[0x1250];
      *(_OWORD *)&STACK[0x1960] = v248;
      v249.n128_f64[0] = ARMatrix4x4DoubleToFloat((float64x2_t *)&STACK[0x1930]);
      ARMatrix4x4Description(0, v249, v250, v251, v252);
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(STACK[0x1930]) = 138543875;
      STACK[0x1934] = (unint64_t)v243;
      LOWORD(STACK[0x193C]) = 2048;
      STACK[0x193E] = v244;
      LOWORD(STACK[0x1946]) = 2113;
      STACK[0x1948] = (unint64_t)v253;
      _os_log_impl(&dword_1B3A68000, v241, OS_LOG_TYPE_INFO, "%{public}@ <%p>: New ENUFromVIO = %{private}@", (uint8_t *)&STACK[0x1930], 0x20u);

    }
    _ARLogTechnique_9();
    v254 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v254, OS_LOG_TYPE_DEBUG))
    {
      v255 = (objc_class *)objc_opt_class();
      NSStringFromClass(v255);
      v256 = (void *)objc_claimAutoreleasedReturnValue();
      v257 = *(_QWORD *)(a1 + 40);
      v258 = *(_OWORD *)&STACK[0x1400];
      *(_OWORD *)&STACK[0x1970] = *(_OWORD *)&STACK[0x13F0];
      *(_OWORD *)&STACK[0x1980] = v258;
      v259 = *(_OWORD *)&STACK[0x1420];
      *(_OWORD *)&STACK[0x1990] = *(_OWORD *)&STACK[0x1410];
      *(_OWORD *)&STACK[0x19A0] = v259;
      v260 = *(_OWORD *)&STACK[0x13C0];
      *(_OWORD *)&STACK[0x1930] = *(_OWORD *)&STACK[0x13B0];
      *(_OWORD *)&STACK[0x1940] = v260;
      v261 = *(_OWORD *)&STACK[0x13E0];
      *(_OWORD *)&STACK[0x1950] = *(_OWORD *)&STACK[0x13D0];
      *(_OWORD *)&STACK[0x1960] = v261;
      v262.n128_f64[0] = ARMatrix4x4DoubleToFloat((float64x2_t *)&STACK[0x1930]);
      ARMatrix4x4Description(1, v262, v263, v264, v265);
      v266 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(STACK[0x1930]) = 138543875;
      STACK[0x1934] = (unint64_t)v256;
      LOWORD(STACK[0x193C]) = 2048;
      STACK[0x193E] = v257;
      LOWORD(STACK[0x1946]) = 2113;
      STACK[0x1948] = (unint64_t)v266;
      _os_log_impl(&dword_1B3A68000, v254, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: enuFromEcef = %{private}@", (uint8_t *)&STACK[0x1930], 0x20u);

    }
    _ARLogTechnique_9();
    v267 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v267, OS_LOG_TYPE_DEBUG))
    {
      v268 = (objc_class *)objc_opt_class();
      NSStringFromClass(v268);
      v269 = (void *)objc_claimAutoreleasedReturnValue();
      v270 = *(_QWORD *)(a1 + 40);
      v271 = *(_OWORD *)&STACK[0x1300];
      *(_OWORD *)&STACK[0x1970] = *(_OWORD *)&STACK[0x12F0];
      *(_OWORD *)&STACK[0x1980] = v271;
      v272 = *(_OWORD *)&STACK[0x1320];
      *(_OWORD *)&STACK[0x1990] = *(_OWORD *)&STACK[0x1310];
      *(_OWORD *)&STACK[0x19A0] = v272;
      v273 = *(_OWORD *)&STACK[0x12C0];
      *(_OWORD *)&STACK[0x1930] = *(_OWORD *)&STACK[0x12B0];
      *(_OWORD *)&STACK[0x1940] = v273;
      v274 = *(_OWORD *)&STACK[0x12E0];
      *(_OWORD *)&STACK[0x1950] = *(_OWORD *)&STACK[0x12D0];
      *(_OWORD *)&STACK[0x1960] = v274;
      v275.n128_f64[0] = ARMatrix4x4DoubleToFloat((float64x2_t *)&STACK[0x1930]);
      ARMatrix4x4Description(0, v275, v276, v277, v278);
      v279 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(STACK[0x1930]) = 138543874;
      STACK[0x1934] = (unint64_t)v269;
      LOWORD(STACK[0x193C]) = 2048;
      STACK[0x193E] = v270;
      LOWORD(STACK[0x1946]) = 2112;
      STACK[0x1948] = (unint64_t)v279;
      _os_log_impl(&dword_1B3A68000, v267, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: camCVFromVIO = %@", (uint8_t *)&STACK[0x1930], 0x20u);

    }
    v280 = *(_OWORD *)&STACK[0x1280];
    *(_OWORD *)&STACK[0x1970] = *(_OWORD *)&STACK[0x1270];
    *(_OWORD *)&STACK[0x1980] = v280;
    v281 = *(_OWORD *)&STACK[0x12A0];
    *(_OWORD *)&STACK[0x1990] = *(_OWORD *)&STACK[0x1290];
    *(_OWORD *)&STACK[0x19A0] = v281;
    v282 = *(_OWORD *)&STACK[0x1240];
    *(_OWORD *)&STACK[0x1930] = *(_OWORD *)&STACK[0x1230];
    *(_OWORD *)&STACK[0x1940] = v282;
    v283 = *(_OWORD *)&STACK[0x1260];
    *(_OWORD *)&STACK[0x1950] = *(_OWORD *)&STACK[0x1250];
    *(_OWORD *)&STACK[0x1960] = v283;
    __invert_d4();
    v350 = ARMatrix4x4DoubleToFloat(&a43);
    v352 = v284;
    v357 = v285;
    v359 = v286;
    v287 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 75);
    _ARLogTechnique_9();
    v288 = objc_claimAutoreleasedReturnValue();
    v289 = os_log_type_enabled(v288, OS_LOG_TYPE_INFO);
    if (v287)
    {
      if (v289)
      {
        v290 = (objc_class *)objc_opt_class();
        NSStringFromClass(v290);
        v291 = (void *)objc_claimAutoreleasedReturnValue();
        v292 = *(_QWORD *)(a1 + 40);
        v293 = *(unsigned __int8 *)(v292 + 73);
        v294 = *(unsigned __int8 *)(v292 + 74);
        LODWORD(STACK[0x1930]) = 138544130;
        STACK[0x1934] = (unint64_t)v291;
        LOWORD(STACK[0x193C]) = 2048;
        STACK[0x193E] = v292;
        LOWORD(STACK[0x1946]) = 1024;
        LODWORD(STACK[0x1948]) = v293;
        LOWORD(STACK[0x194C]) = 1024;
        LODWORD(STACK[0x194E]) = v294;
        _os_log_impl(&dword_1B3A68000, v288, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Setting target ENUFromVIO for GCF, _useCoreLocationFusion=%d, _useCoreMotionFusion=%d", (uint8_t *)&STACK[0x1930], 0x22u);

      }
      if ((objc_msgSend(*(id *)(a1 + 32), "VLHasExecuted") & 1) != 0)
      {
        v295 = *(_QWORD *)(a1 + 40);
        if (!*(_BYTE *)(v295 + 73) && !*(_BYTE *)(v295 + 74))
        {
          objc_msgSend(*(id *)(a1 + 32), "gradualCorrectionFilter");
          v296 = (void *)objc_claimAutoreleasedReturnValue();
          v297 = *(_OWORD *)&STACK[0x12A0];
          a33 = *(_OWORD *)&STACK[0x1290];
          a34 = v297;
          objc_msgSend(v296, "setTargetTranslation:", &a33);

          v295 = *(_QWORD *)(a1 + 40);
        }
        if (!*(_BYTE *)(v295 + 74))
        {
          objc_msgSend(*(id *)(a1 + 32), "gradualCorrectionFilter");
          v298 = (void *)objc_claimAutoreleasedReturnValue();
          v299 = *(_OWORD *)&STACK[0x1280];
          *(_OWORD *)&STACK[0x1970] = *(_OWORD *)&STACK[0x1270];
          *(_OWORD *)&STACK[0x1980] = v299;
          v300 = *(_OWORD *)&STACK[0x12A0];
          *(_OWORD *)&STACK[0x1990] = *(_OWORD *)&STACK[0x1290];
          *(_OWORD *)&STACK[0x19A0] = v300;
          v301 = *(_OWORD *)&STACK[0x1240];
          *(_OWORD *)&STACK[0x1930] = *(_OWORD *)&STACK[0x1230];
          *(_OWORD *)&STACK[0x1940] = v301;
          v302 = *(_OWORD *)&STACK[0x1260];
          *(_OWORD *)&STACK[0x1950] = *(_OWORD *)&STACK[0x1250];
          *(_OWORD *)&STACK[0x1960] = v302;
          objc_msgSend(v298, "setTargetRotation:", &STACK[0x1930]);
          v303 = 0;
LABEL_99:

          goto LABEL_100;
        }
LABEL_92:
        v303 = 0;
LABEL_100:
        os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 56));
        objc_msgSend(*(id *)(a1 + 32), "resultDatas");
        v338 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v338, "addObject:", v143);

        if (v303)
        {
          objc_msgSend(*(id *)(a1 + 32), "resultDatas");
          v339 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v339, "addObject:", v303);

        }
        os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 56));
        os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 88));
        objc_msgSend(*(id *)(a1 + 40), "_setTrackingState:techniqueStateObject:", 3, *(_QWORD *)(a1 + 32));
        os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 88));
        objc_msgSend(*(id *)(a1 + 64), "timestamp");
        objc_msgSend(*(id *)(a1 + 32), "setLastVLExecutionTimestamp:");

        v46 = v351;
        goto LABEL_103;
      }
      _ARLogTechnique_9();
      v317 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v317, OS_LOG_TYPE_INFO))
      {
        v318 = (objc_class *)objc_opt_class();
        NSStringFromClass(v318);
        v319 = (void *)objc_claimAutoreleasedReturnValue();
        v320 = *(_QWORD *)(a1 + 40);
        LODWORD(STACK[0x1930]) = 138543618;
        STACK[0x1934] = (unint64_t)v319;
        LOWORD(STACK[0x193C]) = 2048;
        STACK[0x193E] = v320;
        _os_log_impl(&dword_1B3A68000, v317, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Creating GCF", (uint8_t *)&STACK[0x1930], 0x16u);

      }
      v321 = [ARGeoTrackingGradualCorrectionFilter alloc];
      v322 = *(_OWORD *)&STACK[0x1280];
      *(_OWORD *)&STACK[0x1970] = *(_OWORD *)&STACK[0x1270];
      *(_OWORD *)&STACK[0x1980] = v322;
      v323 = *(_OWORD *)&STACK[0x12A0];
      *(_OWORD *)&STACK[0x1990] = *(_OWORD *)&STACK[0x1290];
      *(_OWORD *)&STACK[0x19A0] = v323;
      v324 = *(_OWORD *)&STACK[0x1240];
      *(_OWORD *)&STACK[0x1930] = *(_OWORD *)&STACK[0x1230];
      *(_OWORD *)&STACK[0x1940] = v324;
      v325 = *(_OWORD *)&STACK[0x1260];
      *(_OWORD *)&STACK[0x1950] = *(_OWORD *)&STACK[0x1250];
      *(_OWORD *)&STACK[0x1960] = v325;
      v326 = -[ARGeoTrackingGradualCorrectionFilter initWithTargetTransform:](v321, "initWithTargetTransform:", &STACK[0x1930]);
      objc_msgSend(*(id *)(a1 + 32), "setGradualCorrectionFilter:", v326);

      v327 = *(_OWORD *)&STACK[0x1280];
      a39 = *(_OWORD *)&STACK[0x1270];
      a40 = v327;
      v328 = *(_OWORD *)&STACK[0x12A0];
      a41 = *(_OWORD *)&STACK[0x1290];
      a42 = v328;
      v329 = *(_OWORD *)&STACK[0x1240];
      a35 = *(_OWORD *)&STACK[0x1230];
      a36 = v329;
      v330 = *(_OWORD *)&STACK[0x1260];
      a37 = *(_OWORD *)&STACK[0x1250];
      a38 = v330;
      v331 = *(void **)(a1 + 32);
      v332 = &a35;
    }
    else
    {
      if (v289)
      {
        v304 = (objc_class *)objc_opt_class();
        NSStringFromClass(v304);
        v305 = (void *)objc_claimAutoreleasedReturnValue();
        v306 = *(_QWORD *)(a1 + 40);
        v307 = *(unsigned __int8 *)(v306 + 73);
        v308 = *(unsigned __int8 *)(v306 + 74);
        LODWORD(STACK[0x1930]) = 138544130;
        STACK[0x1934] = (unint64_t)v305;
        LOWORD(STACK[0x193C]) = 2048;
        STACK[0x193E] = v306;
        LOWORD(STACK[0x1946]) = 1024;
        LODWORD(STACK[0x1948]) = v307;
        LOWORD(STACK[0x194C]) = 1024;
        LODWORD(STACK[0x194E]) = v308;
        _os_log_impl(&dword_1B3A68000, v288, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Setting ENUFromVIO, _useCoreLocationFusion=%d, _useCoreMotionFusion=%d", (uint8_t *)&STACK[0x1930], 0x22u);

      }
      if ((objc_msgSend(*(id *)(a1 + 32), "VLHasExecuted") & 1) != 0)
      {
        v309 = *(_QWORD *)(a1 + 40);
        if (!*(_BYTE *)(v309 + 73) && !*(_BYTE *)(v309 + 74))
        {
          v310 = *(void **)(a1 + 32);
          v311 = *(_OWORD *)&STACK[0x12A0];
          a23 = *(_OWORD *)&STACK[0x1290];
          a24 = v311;
          objc_msgSend(v310, "setEnuFromVIOTranslation:", &a23);
          v309 = *(_QWORD *)(a1 + 40);
        }
        if (!*(_BYTE *)(v309 + 74))
        {
          v312 = *(void **)(a1 + 32);
          v313 = *(_OWORD *)&STACK[0x1280];
          *(_OWORD *)&STACK[0x1970] = *(_OWORD *)&STACK[0x1270];
          *(_OWORD *)&STACK[0x1980] = v313;
          v314 = *(_OWORD *)&STACK[0x12A0];
          *(_OWORD *)&STACK[0x1990] = *(_OWORD *)&STACK[0x1290];
          *(_OWORD *)&STACK[0x19A0] = v314;
          v315 = *(_OWORD *)&STACK[0x1240];
          *(_OWORD *)&STACK[0x1930] = *(_OWORD *)&STACK[0x1230];
          *(_OWORD *)&STACK[0x1940] = v315;
          v316 = *(_OWORD *)&STACK[0x1260];
          *(_OWORD *)&STACK[0x1950] = *(_OWORD *)&STACK[0x1250];
          *(_OWORD *)&STACK[0x1960] = v316;
          objc_msgSend(v312, "setEnuFromVIORotation:", &STACK[0x1930]);
          v309 = *(_QWORD *)(a1 + 40);
        }
        if (*(_BYTE *)(v309 + 73) || *(_BYTE *)(v309 + 74))
          goto LABEL_92;
LABEL_98:
        v337 = [ARGeoTrackingData alloc];
        objc_msgSend(*(id *)(a1 + 32), "enuOrigin");
        v298 = (void *)objc_claimAutoreleasedReturnValue();
        v303 = -[ARGeoTrackingData initWithENUOrigin:vioFromENU:](v337, "initWithENUOrigin:vioFromENU:", v298, v350, v352, v357, v359);
        goto LABEL_99;
      }
      v333 = *(_OWORD *)&STACK[0x1280];
      a29 = *(_OWORD *)&STACK[0x1270];
      a30 = v333;
      v334 = *(_OWORD *)&STACK[0x12A0];
      a31 = *(_OWORD *)&STACK[0x1290];
      a32 = v334;
      v335 = *(_OWORD *)&STACK[0x1240];
      a25 = *(_OWORD *)&STACK[0x1230];
      a26 = v335;
      v336 = *(_OWORD *)&STACK[0x1260];
      a27 = *(_OWORD *)&STACK[0x1250];
      a28 = v336;
      v331 = *(void **)(a1 + 32);
      v332 = &a25;
    }
    objc_msgSend(v331, "setEnuFromVIO:", v332);
    goto LABEL_98;
  }
  _ARLogTechnique_9();
  v62 = objc_claimAutoreleasedReturnValue();
  v63 = v358;
  if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
  {
    v64 = (objc_class *)objc_opt_class();
    NSStringFromClass(v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = *(_QWORD *)(a1 + 40);
    LODWORD(STACK[0x1930]) = 138543618;
    STACK[0x1934] = (unint64_t)v65;
    LOWORD(STACK[0x193C]) = 2048;
    STACK[0x193E] = v66;
    _os_log_impl(&dword_1B3A68000, v62, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Geo tracking has been reset. Dropping VL result.", (uint8_t *)&STACK[0x1930], 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "setVLPoseEstimationExecuting:", 0);
  v67 = v353;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 72))
LABEL_12:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
LABEL_13:

}

- (void)_callVLWithHandle:(double)a3 pixelBuffer:(__n128)a4 deviceLocation:(__n128)a5 heading:(__n128)a6 inputGravity:(__n128)a7 vioTransform:(uint64_t)a8 cameraIntrinsics:(void *)a9 radialDistortion:(uint64_t)a10 exposureTargetOffset:(void *)a11 timestamp:(__int128 *)a12 vlDeterminismSemaphore:(void *)a13 completionHandler:(void *)a14
{
  id v27;
  id v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  objc_class *v32;
  void *v33;
  NSObject *v34;
  __int128 v35;
  __int128 v36;
  _QWORD block[4];
  __int128 v42;
  __int128 v43;
  __n128 v44;
  __n128 v45;
  __n128 v46;
  __n128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  NSObject *v51;
  id v52;
  id v53;
  uint64_t v54;
  double v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _OWORD v60[2];
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v35 = *a12;
  v36 = a12[1];
  v27 = a9;
  v28 = a11;
  v29 = a13;
  v30 = a14;
  if (*(_BYTE *)(a1 + 72))
  {
    v60[0] = v35;
    v60[1] = v36;
    objc_msgSend(v27, "_deterministicLocateWithPixelBuffer:deviceLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:exposureTargetOffset:timestamp:completionHandler:", a10, v28, v60, v30, a2, a3, a4.n128_f64[0], a5.n128_f64[0], a6.n128_f64[0], a7.n128_f64[0], a15, a16, a17, a18, a19, a20);
    dispatch_semaphore_wait(v29, 0xFFFFFFFFFFFFFFFFLL);
    _ARLogTechnique_9();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v62 = v33;
      v63 = 2048;
      v64 = a1;
      v65 = 2048;
      v66 = a20;
      _os_log_impl(&dword_1B3A68000, v31, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Deterministic VL call completed at timestamp=%f", buf, 0x20u);

    }
  }
  else
  {
    v34 = *(NSObject **)(a1 + 64);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __211__ARGeoTrackingTechnique__callVLWithHandle_pixelBuffer_deviceLocation_heading_inputGravity_vioTransform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_vlDeterminismSemaphore_completionHandler___block_invoke;
    block[3] = &unk_1E6674D78;
    v51 = v27;
    v54 = a10;
    v52 = v28;
    v55 = a2;
    v56 = a3;
    v42 = v35;
    v43 = v36;
    v44 = a4;
    v45 = a5;
    v46 = a6;
    v47 = a7;
    v48 = a15;
    v49 = a16;
    v50 = a17;
    v57 = a18;
    v58 = a19;
    v59 = a20;
    v53 = v30;
    dispatch_async(v34, block);

    v31 = v51;
  }

}

void __211__ARGeoTrackingTechnique__callVLWithHandle_pixelBuffer_deviceLocation_heading_inputGravity_vioTransform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_vlDeterminismSemaphore_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  _OWORD v14[2];
  id v15;

  v2 = *(_QWORD *)(a1 + 200);
  v3 = *(void **)(a1 + 176);
  v4 = *(_QWORD *)(a1 + 184);
  v5 = *(_OWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 224);
  v8 = *(_QWORD *)(a1 + 232);
  v9 = *(_QWORD *)(a1 + 240);
  v15 = 0;
  v10 = *(double *)(a1 + 208);
  v11 = *(double *)(a1 + 216);
  v14[0] = v5;
  v14[1] = v6;
  objc_msgSend(v3, "locateWithPixelBuffer:deviceLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:ambientLightIntensity:timestamp:error:", v2, v4, v14, &v15, v10, v11, *(double *)(a1 + 64), *(double *)(a1 + 80), *(double *)(a1 + 96), *(double *)(a1 + 112), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144), *(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 160), *(_QWORD *)(a1 + 168),
    v7,
    v8,
    v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v15;
  (*(void (**)(void))(*(_QWORD *)(a1 + 192) + 16))();

}

- (void)_estimateEnuFromVioFromCLCM:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  NSObject *v15;
  double v16;
  double v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  ARGeoTrackingTechniqueState *state;
  int v29;
  double v30;
  int v31;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  int v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  float64x2_t v45;
  float64x2_t v46;
  float64x2_t *v47;
  void *v48;
  int v49;
  NSObject *v50;
  objc_class *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  int v57;
  int v58;
  NSObject *v59;
  objc_class *v60;
  void *v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  double v67;
  double v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  double v78;
  double v79;
  __float2 v80;
  unsigned int v88;
  float v89;
  unsigned int v90;
  float v91;
  unsigned int v92;
  float32x4_t v93;
  float v94;
  unsigned int v98;
  float32x4_t v99;
  uint64_t v105;
  float64x2_t v106;
  float64x2_t v107;
  float64x2_t v108;
  float64x2_t v109;
  float64x2_t v110;
  float64x2_t v111;
  float64x2_t v112;
  float64x2_t v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  float64x2_t v118;
  float64x2_t v119;
  float64x2_t *v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  void *v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  double v130;
  double v131;
  NSObject *v132;
  objc_class *v133;
  void *v134;
  uint64_t v135;
  float64x2_t v136;
  float64x2_t v137;
  float64x2_t v138;
  float64x2_t v139;
  float64x2_t v140;
  float64x2_t v141;
  float64x2_t v142;
  float64x2_t v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  float64x2_t v148;
  float64x2_t v149;
  float64x2_t *v150;
  float64x2_t v151;
  float64x2_t v152;
  double v153;
  NSObject *v154;
  _BOOL4 v155;
  double v156;
  objc_class *v157;
  void *v158;
  objc_class *v159;
  void *v160;
  void *v161;
  ARGeoTrackingTechniqueState *v162;
  void *v163;
  uint64_t v164;
  float64x2_t v165;
  float64x2_t v166;
  float64x2_t *v167;
  double v168;
  double v169;
  double v172;
  double v173;
  NSObject *v174;
  _BOOL4 v175;
  objc_class *v176;
  void *v177;
  __n128 v178;
  __n128 v179;
  __n128 v180;
  __n128 v181;
  void *v182;
  ARGeoTrackingTechniqueState *v183;
  void *v184;
  objc_class *v185;
  void *v186;
  ARGeoTrackingTechniqueState *v187;
  double v188;
  double v189;
  double v190;
  double v191;
  ARGeoTrackingData *v192;
  os_unfair_lock_s *p_resultLock;
  void *v194;
  float64x2_t v195;
  float64x2_t v196;
  float64x2_t v197;
  float64x2_t v198;
  float64x2_t v199;
  __int128 v200;
  float64x2_t v201;
  __int128 vars0a;
  float64x2_t vars0;
  void *v204;
  float64x2_t v205;
  float64x2_t v206;
  float64x2_t v207;
  float64x2_t v208;
  float64x2_t v209;
  float64x2_t v210;
  float64x2_t v211;
  NSObject *v212;
  float64x2_t v213;
  float64x2_t v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  float64x2_t v223[8];
  _BYTE v224[128];

  STACK[0xF78] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ARGeoTrackingTechniqueState enuOrigin](self->_state, "enuOrigin");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && v5)
  {
    objc_msgSend(v4, "timestamp");
    v8 = v7;
    -[ARGeoTrackingTechniqueState findClosestVioPoseToTimestamp:](self->_state, "findClosestVioPoseToTimestamp:");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      _ARLogTechnique_9();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(STACK[0xEE0]) = 138543874;
        STACK[0xEE4] = (unint64_t)v21;
        LOWORD(STACK[0xEEC]) = 2048;
        STACK[0xEEE] = (unint64_t)self;
        LOWORD(STACK[0xEF6]) = 2048;
        *(double *)&STACK[0xEF8] = v8;
        _os_log_impl(&dword_1B3A68000, v15, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: CLCM No VIO pose found near timestamp: %f; bailing out",
          (uint8_t *)&STACK[0xEE0],
          0x20u);

      }
      goto LABEL_101;
    }
    objc_msgSend(v4, "timestamp");
    v11 = v10;
    -[NSObject timestamp](v9, "timestamp");
    v13 = v12;
    if (self->_useCoreMotionFusion)
    {
      -[ARGeoTrackingTechniqueState findClosestDeviceMotionDataToTimestamp:](self->_state, "findClosestDeviceMotionDataToTimestamp:", v8);
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = v14;
        -[NSObject timestamp](v14, "timestamp");
        v17 = vabdd_f64(v16, v8);
        goto LABEL_15;
      }
      _ARLogTechnique_9();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(STACK[0xEE0]) = 138543874;
        STACK[0xEE4] = (unint64_t)v24;
        LOWORD(STACK[0xEEC]) = 2048;
        STACK[0xEEE] = (unint64_t)self;
        LOWORD(STACK[0xEF6]) = 2048;
        *(double *)&STACK[0xEF8] = v8;
        _os_log_impl(&dword_1B3A68000, v22, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: CLCM No device orientation found near timestamp: %f", (uint8_t *)&STACK[0xEE0], 0x20u);

      }
    }
    v15 = 0;
    v17 = 1.79769313e308;
LABEL_15:
    -[ARGeoTrackingTechniqueState lastLocationProcessedForFusion](self->_state, "lastLocationProcessedForFusion");
    v25 = (id)objc_claimAutoreleasedReturnValue();

    -[ARGeoTrackingTechniqueState setLastLocationProcessedForFusion:](self->_state, "setLastLocationProcessedForFusion:", v4);
    *(_OWORD *)&STACK[0xDD0] = 0u;
    *(_OWORD *)&STACK[0xDC0] = 0u;
    *(_OWORD *)&STACK[0xDB0] = 0u;
    *(_OWORD *)&STACK[0xDA0] = 0u;
    *(_OWORD *)&STACK[0xD90] = 0u;
    *(_OWORD *)&STACK[0xD80] = 0u;
    *(_OWORD *)&STACK[0xD70] = 0u;
    v214 = 0u;
    *(_OWORD *)&STACK[0xD60] = 0u;
    -[NSObject transform](v9, "transform");
    if (self->_useGradualCorrection)
    {
      -[ARGeoTrackingTechniqueState gradualCorrectionFilter](self->_state, "gradualCorrectionFilter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26)
      {
        objc_msgSend(v26, "ENUFromVIOTarget");
        v206 = *(float64x2_t *)&STACK[0xEF0];
        v207 = *(float64x2_t *)&STACK[0xEE0];
        v208 = *(float64x2_t *)&STACK[0xF10];
        v209 = *(float64x2_t *)&STACK[0xF00];
        v210 = *(float64x2_t *)&STACK[0xF30];
        v211 = *(float64x2_t *)&STACK[0xF20];
        v213 = *(float64x2_t *)&STACK[0xF50];
        v214 = *(float64x2_t *)&STACK[0xF40];
      }
      else
      {
        v213 = 0u;
        v210 = 0u;
        v211 = 0u;
        v208 = 0u;
        v209 = 0u;
        v206 = 0u;
        v207 = 0u;
      }

    }
    else
    {
      state = self->_state;
      if (state)
      {
        -[ARGeoTrackingTechniqueState enuFromVIO](state, "enuFromVIO");
        v206 = *(float64x2_t *)&STACK[0xEF0];
        v207 = *(float64x2_t *)&STACK[0xEE0];
        v208 = *(float64x2_t *)&STACK[0xF10];
        v209 = *(float64x2_t *)&STACK[0xF00];
        v210 = *(float64x2_t *)&STACK[0xF30];
        v211 = *(float64x2_t *)&STACK[0xF20];
        v213 = *(float64x2_t *)&STACK[0xF50];
        v214 = *(float64x2_t *)&STACK[0xF40];
      }
      else
      {
        v214 = 0u;
        v213 = 0u;
        v210 = 0u;
        v211 = 0u;
        v208 = 0u;
        v209 = 0u;
        v206 = 0u;
        v207 = 0u;
      }
    }
    v29 = 0;
    if (v25 == v4)
    {
      v31 = 0;
    }
    else
    {
      v30 = vabdd_f64(v11, v13);
      v31 = 0;
      if (v30 < 1.0)
      {
        v212 = v15;
        v204 = v6;
        _ARLogTechnique_9();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          v33 = (objc_class *)objc_opt_class();
          NSStringFromClass(v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "location");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "isCoordinateFused");
          objc_msgSend(v4, "location");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "isCoordinateFusedWithVL");
          v39 = -[NSObject fused](v212, "fused");
          LODWORD(STACK[0xEE0]) = 138544386;
          STACK[0xEE4] = (unint64_t)v34;
          LOWORD(STACK[0xEEC]) = 2048;
          STACK[0xEEE] = (unint64_t)self;
          LOWORD(STACK[0xEF6]) = 1024;
          LODWORD(STACK[0xEF8]) = v36;
          LOWORD(STACK[0xEFC]) = 1024;
          LODWORD(STACK[0xEFE]) = v38;
          LOWORD(STACK[0xF02]) = 1024;
          LODWORD(STACK[0xF04]) = v39;
          _os_log_impl(&dword_1B3A68000, v32, OS_LOG_TYPE_INFO, "%{public}@ <%p>: CLCM Performing fusion update, fusedLocation=%d, VLFusedLocation=%d, fusedMotion=%d.", (uint8_t *)&STACK[0xEE0], 0x28u);

        }
        v40 = *(_OWORD *)&STACK[0xDB0];
        *(_OWORD *)&STACK[0xF20] = *(_OWORD *)&STACK[0xDA0];
        *(_OWORD *)&STACK[0xF30] = v40;
        v41 = *(_OWORD *)&STACK[0xDD0];
        *(_OWORD *)&STACK[0xF40] = *(_OWORD *)&STACK[0xDC0];
        *(_OWORD *)&STACK[0xF50] = v41;
        v42 = *(_OWORD *)&STACK[0xD70];
        *(_OWORD *)&STACK[0xEE0] = *(_OWORD *)&STACK[0xD60];
        *(_OWORD *)&STACK[0xEF0] = v42;
        v43 = *(_OWORD *)&STACK[0xD90];
        *(_OWORD *)&STACK[0xF00] = *(_OWORD *)&STACK[0xD80];
        *(_OWORD *)&STACK[0xF10] = v43;
        __invert_d4();
        v44 = 0;
        *(_OWORD *)&STACK[0xE60] = 0u;
        *(_OWORD *)&STACK[0xE70] = 0u;
        *(_OWORD *)&STACK[0xE80] = 0u;
        *(_OWORD *)&STACK[0xE90] = 0u;
        *(_OWORD *)&STACK[0xEA0] = 0u;
        *(_OWORD *)&STACK[0xEB0] = 0u;
        *(_OWORD *)&STACK[0xEC0] = 0u;
        *(_OWORD *)&STACK[0xED0] = 0u;
        do
        {
          v46 = *(float64x2_t *)((char *)&STACK[0xCE0] + v44);
          v45 = *(float64x2_t *)((char *)&STACK[0xCE0] + v44 + 16);
          v47 = (float64x2_t *)((char *)&STACK[0xE60] + v44);
          *v47 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v207, v46.f64[0]), v209, v46, 1), v211, v45.f64[0]), v214, v45, 1);
          v47[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v206, v46.f64[0]), v208, v46, 1), v210, v45.f64[0]), v213, v45, 1);
          v44 += 32;
        }
        while (v44 != 128);
        if (self->_useCoreLocationFusion
          && (objc_msgSend(v4, "location"),
              v48 = (void *)objc_claimAutoreleasedReturnValue(),
              v49 = objc_msgSend(v48, "isCoordinateFusedWithVL"),
              v48,
              v49))
        {
          _ARLogTechnique_9();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            v51 = (objc_class *)objc_opt_class();
            NSStringFromClass(v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(STACK[0xEE0]) = 138543874;
            STACK[0xEE4] = (unint64_t)v52;
            LOWORD(STACK[0xEEC]) = 2048;
            STACK[0xEEE] = (unint64_t)self;
            LOWORD(STACK[0xEF6]) = 2048;
            *(double *)&STACK[0xEF8] = v30;
            _os_log_impl(&dword_1B3A68000, v50, OS_LOG_TYPE_INFO, "%{public}@ <%p>: CLCM Computing translation from CL fusion, time diff VIO-CL=%fs", (uint8_t *)&STACK[0xEE0], 0x20u);

          }
          objc_msgSend(v204, "locationECEF");
          v200 = *(_OWORD *)&STACK[0xCD0];
          vars0a = *(_OWORD *)&STACK[0xCC0];
          objc_msgSend(v4, "locationECEF");
          v53 = *(_OWORD *)&STACK[0xCA0];
          v54 = *(_OWORD *)&STACK[0xCB0];
          *(_OWORD *)&STACK[0xC70] = v200;
          *(_OWORD *)&STACK[0xC60] = vars0a;
          *(_OWORD *)&STACK[0xC50] = v54;
          *(_OWORD *)&STACK[0xC40] = v53;
          ARECEFToENU(&STACK[0xC80]);
          v55 = *(_OWORD *)&STACK[0xC90];
          *(_OWORD *)&STACK[0xEC0] = *(_OWORD *)&STACK[0xC80];
          *(_OWORD *)&STACK[0xED0] = (unint64_t)v55;
          v31 = 1;
        }
        else
        {
          v31 = 0;
        }
        if (!self->_useCoreMotionFusion || v212 == 0)
        {
          v57 = 0;
        }
        else
        {
          v58 = -[NSObject fused](v212, "fused");
          v57 = 0;
          if (v58 && v17 < 0.02)
          {
            _ARLogTechnique_9();
            v59 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              v60 = (objc_class *)objc_opt_class();
              NSStringFromClass(v60);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(STACK[0xEE0]) = 138543874;
              STACK[0xEE4] = (unint64_t)v61;
              LOWORD(STACK[0xEEC]) = 2048;
              STACK[0xEEE] = (unint64_t)self;
              LOWORD(STACK[0xEF6]) = 2048;
              *(double *)&STACK[0xEF8] = v17;
              _os_log_impl(&dword_1B3A68000, v59, OS_LOG_TYPE_INFO, "%{public}@ <%p>: CLCM Computing rotation from CM fusion, time diff VIO-CM=%fs", (uint8_t *)&STACK[0xEE0], 0x20u);

            }
            v62 = (void *)objc_opt_class();
            v63 = *(_OWORD *)&STACK[0xEB0];
            *(_OWORD *)&STACK[0xF20] = *(_OWORD *)&STACK[0xEA0];
            *(_OWORD *)&STACK[0xF30] = v63;
            v64 = *(_OWORD *)&STACK[0xED0];
            *(_OWORD *)&STACK[0xF40] = *(_OWORD *)&STACK[0xEC0];
            *(_OWORD *)&STACK[0xF50] = v64;
            v65 = *(_OWORD *)&STACK[0xE70];
            *(_OWORD *)&STACK[0xEE0] = *(_OWORD *)&STACK[0xE60];
            *(_OWORD *)&STACK[0xEF0] = v65;
            v66 = *(_OWORD *)&STACK[0xE90];
            *(_OWORD *)&STACK[0xF00] = *(_OWORD *)&STACK[0xE80];
            *(_OWORD *)&STACK[0xF10] = v66;
            objc_msgSend(v62, "getHeadingForEnuFromCam:", &STACK[0xEE0]);
            v68 = v67;
            *(_OWORD *)&STACK[0xC30] = 0u;
            *(_OWORD *)&STACK[0xC20] = 0u;
            *(_OWORD *)&STACK[0xC10] = 0u;
            *(_OWORD *)&STACK[0xC00] = 0u;
            *(_OWORD *)&STACK[0xBF0] = 0u;
            *(_OWORD *)&STACK[0xBE0] = 0u;
            *(_OWORD *)&STACK[0xBD0] = 0u;
            *(_OWORD *)&STACK[0xBC0] = 0u;
            -[NSObject transform](v212, "transform");
            v69 = *(_OWORD *)&STACK[0xB90];
            *(_OWORD *)&STACK[0xF20] = *(_OWORD *)&STACK[0xB80];
            *(_OWORD *)&STACK[0xF30] = v69;
            v70 = *(_OWORD *)&STACK[0xBB0];
            *(_OWORD *)&STACK[0xF40] = *(_OWORD *)&STACK[0xBA0];
            *(_OWORD *)&STACK[0xF50] = v70;
            v71 = *(_OWORD *)&STACK[0xB50];
            *(_OWORD *)&STACK[0xEE0] = *(_OWORD *)&STACK[0xB40];
            *(_OWORD *)&STACK[0xEF0] = v71;
            v72 = *(_OWORD *)&STACK[0xB70];
            *(_OWORD *)&STACK[0xF00] = *(_OWORD *)&STACK[0xB60];
            *(_OWORD *)&STACK[0xF10] = v72;
            __invert_d4();
            v73 = (void *)objc_opt_class();
            v74 = *(_OWORD *)&STACK[0xC10];
            *(_OWORD *)&STACK[0xF20] = *(_OWORD *)&STACK[0xC00];
            *(_OWORD *)&STACK[0xF30] = v74;
            v75 = *(_OWORD *)&STACK[0xC30];
            *(_OWORD *)&STACK[0xF40] = *(_OWORD *)&STACK[0xC20];
            *(_OWORD *)&STACK[0xF50] = v75;
            v76 = *(_OWORD *)&STACK[0xBD0];
            *(_OWORD *)&STACK[0xEE0] = *(_OWORD *)&STACK[0xBC0];
            *(_OWORD *)&STACK[0xEF0] = v76;
            v77 = *(_OWORD *)&STACK[0xBF0];
            *(_OWORD *)&STACK[0xF00] = *(_OWORD *)&STACK[0xBE0];
            *(_OWORD *)&STACK[0xF10] = v77;
            objc_msgSend(v73, "getHeadingForEnuFromCam:", &STACK[0xEE0]);
            v79 = v78;
            *(_OWORD *)&STACK[0xF50] = 0u;
            *(_OWORD *)&STACK[0xF40] = 0u;
            *(_OWORD *)&STACK[0xF30] = 0u;
            *(_OWORD *)&STACK[0xF20] = 0u;
            *(_OWORD *)&STACK[0xF10] = 0u;
            *(_OWORD *)&STACK[0xF00] = 0u;
            *(_OWORD *)&STACK[0xEF0] = 0u;
            *(_OWORD *)&STACK[0xEE0] = 0u;
            *(float *)&v78 = v78 - v68;
            v80 = __sincosf_stret(*(float *)&v78 * 0.5);
            _Q2 = vmulq_n_f32((float32x4_t)xmmword_1B3BDFDC0, v80.__sinval);
            _S3 = _Q2.i32[1];
            _S5 = _Q2.i32[2];
            __asm { FMLS            S0, S5, V2.S[2] }
            *(float *)&v88 = _S0 + (float)(v80.__cosval * v80.__cosval);
            v89 = vmlas_n_f32(vmuls_lane_f32(v80.__cosval, _Q2, 2), _Q2.f32[1], _Q2.f32[0]);
            *(float *)&v90 = v89 + v89;
            v91 = vmlas_n_f32(-(float)(v80.__cosval * _Q2.f32[1]), _Q2.f32[2], _Q2.f32[0]);
            *(float *)&v92 = v91 + v91;
            v93.i64[0] = __PAIR64__(v90, v88);
            v93.i64[1] = v92;
            v94 = vmlas_n_f32(-(float)(v80.__cosval * _Q2.f32[2]), _Q2.f32[1], _Q2.f32[0]);
            __asm
            {
              FMLA            S4, S3, V2.S[1]
              FMLS            S16, S2, V2.S[0]
              FMLA            S4, S5, V2.S[1]
            }
            *(float *)&v98 = _S4 + _S4;
            v99.f32[0] = v94 + v94;
            v99.i32[1] = _S16;
            v99.i64[1] = v98;
            __asm
            {
              FMLA            S6, S2, V2.S[2]
              FMLA            S7, S5, V2.S[1]
              FMLA            S1, S5, V2.S[2]
              FMLS            S1, S2, V2.S[0]
              FMLS            S1, S3, V2.S[1]
            }
            _Q2.f32[0] = _S6 + _S6;
            _Q2.f32[1] = _S7 + _S7;
            _Q2.i64[1] = _S1;
            ARMatrix4x4FloatToDouble((float64x2_t *)&STACK[0xEE0], v93, v99, _Q2, (float32x4_t)xmmword_1B3BDFD50);
            v105 = 0;
            v106 = *(float64x2_t *)&STACK[0xE70];
            v107 = *(float64x2_t *)&STACK[0xE60];
            v108 = *(float64x2_t *)&STACK[0xE90];
            v109 = *(float64x2_t *)&STACK[0xE80];
            v110 = *(float64x2_t *)&STACK[0xEB0];
            v111 = *(float64x2_t *)&STACK[0xEA0];
            v112 = *(float64x2_t *)&STACK[0xED0];
            v113 = *(float64x2_t *)&STACK[0xEC0];
            v114 = *(_OWORD *)&STACK[0xF30];
            *(_OWORD *)&STACK[0xB00] = *(_OWORD *)&STACK[0xF20];
            *(_OWORD *)&STACK[0xB10] = v114;
            v115 = *(_OWORD *)&STACK[0xF50];
            *(_OWORD *)&STACK[0xB20] = *(_OWORD *)&STACK[0xF40];
            *(_OWORD *)&STACK[0xB30] = v115;
            v116 = *(_OWORD *)&STACK[0xEF0];
            *(_OWORD *)&STACK[0xAC0] = *(_OWORD *)&STACK[0xEE0];
            *(_OWORD *)&STACK[0xAD0] = v116;
            v117 = *(_OWORD *)&STACK[0xF10];
            *(_OWORD *)&STACK[0xAE0] = *(_OWORD *)&STACK[0xF00];
            *(_OWORD *)&STACK[0xAF0] = v117;
            *(_OWORD *)&STACK[0xE50] = 0u;
            *(_OWORD *)&STACK[0xE40] = 0u;
            *(_OWORD *)&STACK[0xE30] = 0u;
            *(_OWORD *)&STACK[0xE20] = 0u;
            *(_OWORD *)&STACK[0xE10] = 0u;
            *(_OWORD *)&STACK[0xE00] = 0u;
            *(_OWORD *)&STACK[0xDF0] = 0u;
            *(_OWORD *)&STACK[0xDE0] = 0u;
            do
            {
              v119 = *(float64x2_t *)((char *)&STACK[0xAC0] + v105);
              v118 = *(float64x2_t *)((char *)&STACK[0xAC0] + v105 + 16);
              v120 = (float64x2_t *)((char *)&STACK[0xDE0] + v105);
              *v120 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v107, v119.f64[0]), v109, v119, 1), v111, v118.f64[0]), v113, v118, 1);
              v120[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v106, v119.f64[0]), v108, v119, 1), v110, v118.f64[0]), v112, v118, 1);
              v105 += 32;
            }
            while (v105 != 128);
            v121 = *(_OWORD *)&STACK[0xE30];
            *(_OWORD *)&STACK[0xEA0] = *(_OWORD *)&STACK[0xE20];
            *(_OWORD *)&STACK[0xEB0] = v121;
            v122 = *(_OWORD *)&STACK[0xE50];
            *(_OWORD *)&STACK[0xEC0] = *(_OWORD *)&STACK[0xE40];
            *(_OWORD *)&STACK[0xED0] = v122;
            v123 = *(_OWORD *)&STACK[0xDF0];
            *(_OWORD *)&STACK[0xE60] = *(_OWORD *)&STACK[0xDE0];
            *(_OWORD *)&STACK[0xE70] = v123;
            v124 = *(_OWORD *)&STACK[0xE10];
            *(_OWORD *)&STACK[0xE80] = *(_OWORD *)&STACK[0xE00];
            *(_OWORD *)&STACK[0xE90] = v124;
            v125 = (void *)objc_opt_class();
            v126 = *(_OWORD *)&STACK[0xEB0];
            *(_OWORD *)&STACK[0xE20] = *(_OWORD *)&STACK[0xEA0];
            *(_OWORD *)&STACK[0xE30] = v126;
            v127 = *(_OWORD *)&STACK[0xED0];
            *(_OWORD *)&STACK[0xE40] = *(_OWORD *)&STACK[0xEC0];
            *(_OWORD *)&STACK[0xE50] = v127;
            v128 = *(_OWORD *)&STACK[0xE70];
            *(_OWORD *)&STACK[0xDE0] = *(_OWORD *)&STACK[0xE60];
            *(_OWORD *)&STACK[0xDF0] = v128;
            v129 = *(_OWORD *)&STACK[0xE90];
            *(_OWORD *)&STACK[0xE00] = *(_OWORD *)&STACK[0xE80];
            *(_OWORD *)&STACK[0xE10] = v129;
            objc_msgSend(v125, "getHeadingForEnuFromCam:", &STACK[0xDE0]);
            v131 = v130;
            _ARLogTechnique_9();
            v132 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
            {
              v133 = (objc_class *)objc_opt_class();
              NSStringFromClass(v133);
              v134 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(STACK[0xDE0]) = 138544387;
              STACK[0xDE4] = (unint64_t)v134;
              LOWORD(STACK[0xDEC]) = 2048;
              STACK[0xDEE] = (unint64_t)self;
              LOWORD(STACK[0xDF6]) = 2049;
              *(double *)&STACK[0xDF8] = v68 * 0.318309886 * 180.0;
              LOWORD(STACK[0xE00]) = 2049;
              *(double *)&STACK[0xE02] = v79 * 0.318309886 * 180.0;
              LOWORD(STACK[0xE0A]) = 2049;
              *(double *)&STACK[0xE0C] = v131 * 0.318309886 * 180.0;
              _os_log_impl(&dword_1B3A68000, v132, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: CLCM origHeading=%{private}f,cmHeading=%{private}f,newHeading=%{private}f", (uint8_t *)&STACK[0xDE0], 0x34u);

            }
            v57 = 1;
            v31 = 1;
          }
        }
        v135 = 0;
        v136 = *(float64x2_t *)&STACK[0xE70];
        v137 = *(float64x2_t *)&STACK[0xE60];
        v138 = *(float64x2_t *)&STACK[0xE90];
        v139 = *(float64x2_t *)&STACK[0xE80];
        v140 = *(float64x2_t *)&STACK[0xEB0];
        v141 = *(float64x2_t *)&STACK[0xEA0];
        v142 = *(float64x2_t *)&STACK[0xED0];
        v143 = *(float64x2_t *)&STACK[0xEC0];
        v144 = *(_OWORD *)&STACK[0xDB0];
        *(_OWORD *)&STACK[0xC00] = *(_OWORD *)&STACK[0xDA0];
        *(_OWORD *)&STACK[0xC10] = v144;
        v145 = *(_OWORD *)&STACK[0xDD0];
        *(_OWORD *)&STACK[0xC20] = *(_OWORD *)&STACK[0xDC0];
        *(_OWORD *)&STACK[0xC30] = v145;
        v146 = *(_OWORD *)&STACK[0xD70];
        *(_OWORD *)&STACK[0xBC0] = *(_OWORD *)&STACK[0xD60];
        *(_OWORD *)&STACK[0xBD0] = v146;
        v147 = *(_OWORD *)&STACK[0xD90];
        *(_OWORD *)&STACK[0xBE0] = *(_OWORD *)&STACK[0xD80];
        *(_OWORD *)&STACK[0xBF0] = v147;
        *(_OWORD *)&STACK[0xF50] = 0u;
        *(_OWORD *)&STACK[0xF40] = 0u;
        *(_OWORD *)&STACK[0xF30] = 0u;
        *(_OWORD *)&STACK[0xF20] = 0u;
        *(_OWORD *)&STACK[0xF10] = 0u;
        *(_OWORD *)&STACK[0xF00] = 0u;
        *(_OWORD *)&STACK[0xEF0] = 0u;
        *(_OWORD *)&STACK[0xEE0] = 0u;
        do
        {
          v149 = *(float64x2_t *)((char *)&STACK[0xBC0] + v135);
          v148 = *(float64x2_t *)((char *)&STACK[0xBC0] + v135 + 16);
          v150 = (float64x2_t *)((char *)&STACK[0xEE0] + v135);
          *v150 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v137, v149.f64[0]), v139, v149, 1), v141, v148.f64[0]), v143, v148, 1);
          v150[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v136, v149.f64[0]), v138, v149, 1), v140, v148.f64[0]), v142, v148, 1);
          v135 += 32;
        }
        while (v135 != 128);
        v205 = *(float64x2_t *)&STACK[0xF50];
        v201 = *(float64x2_t *)&STACK[0xF30];
        vars0 = *(float64x2_t *)&STACK[0xF40];
        v198 = *(float64x2_t *)&STACK[0xF10];
        v199 = *(float64x2_t *)&STACK[0xF20];
        v196 = *(float64x2_t *)&STACK[0xEF0];
        v197 = *(float64x2_t *)&STACK[0xF00];
        v195 = *(float64x2_t *)&STACK[0xEE0];
        if (v31)
        {
          v151 = vsubq_f64(*(float64x2_t *)&STACK[0xF50], v213);
          v152 = vsubq_f64(*(float64x2_t *)&STACK[0xF40], v214);
          v153 = vaddvq_f64(vaddq_f64(vmulq_f64(v152, v152), vmulq_f64(v151, v151)));
          _ARLogTechnique_9();
          v154 = objc_claimAutoreleasedReturnValue();
          v155 = os_log_type_enabled(v154, OS_LOG_TYPE_DEBUG);
          if (v153 >= 0.0625)
          {
            v156 = fabs(v153);
            if (v156 < INFINITY || v156 > INFINITY)
            {
              if (v155)
              {
                v159 = (objc_class *)objc_opt_class();
                NSStringFromClass(v159);
                v160 = (void *)objc_claimAutoreleasedReturnValue();
                ARVector3Description((__n128)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vars0), v205));
                v161 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(STACK[0xEE0]) = 138543875;
                STACK[0xEE4] = (unint64_t)v160;
                LOWORD(STACK[0xEEC]) = 2048;
                STACK[0xEEE] = (unint64_t)self;
                LOWORD(STACK[0xEF6]) = 2113;
                STACK[0xEF8] = (unint64_t)v161;
                _os_log_impl(&dword_1B3A68000, v154, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: CLCM ENUFromVIO new translation vector: %{private}@", (uint8_t *)&STACK[0xEE0], 0x20u);

              }
              v162 = self->_state;
              if (self->_useGradualCorrection)
              {
                -[ARGeoTrackingTechniqueState gradualCorrectionFilter](v162, "gradualCorrectionFilter");
                v163 = (void *)objc_claimAutoreleasedReturnValue();
                *(float64x2_t *)&STACK[0xAA0] = vars0;
                *(float64x2_t *)&STACK[0xAB0] = v205;
                objc_msgSend(v163, "setTargetTranslation:", &STACK[0xAA0]);

                if ((v57 & 1) != 0)
                  goto LABEL_67;
              }
              else
              {
                *(float64x2_t *)&STACK[0xA80] = vars0;
                *(float64x2_t *)&STACK[0xA90] = v205;
                -[ARGeoTrackingTechniqueState setEnuFromVIOTranslation:](v162, "setEnuFromVIOTranslation:", &STACK[0xA80]);
                if ((v57 & 1) != 0)
                  goto LABEL_67;
              }
LABEL_91:
              v29 = 0;
              v31 = 1;
              goto LABEL_92;
            }
          }
          if (v155)
          {
            v157 = (objc_class *)objc_opt_class();
            NSStringFromClass(v157);
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(STACK[0xEE0]) = 138543618;
            STACK[0xEE4] = (unint64_t)v158;
            LOWORD(STACK[0xEEC]) = 2048;
            STACK[0xEEE] = (unint64_t)self;
            _os_log_impl(&dword_1B3A68000, v154, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: CLCM ENUFromVIO update: translation difference too small, ignoring", (uint8_t *)&STACK[0xEE0], 0x16u);

          }
          if ((v57 & 1) == 0)
            goto LABEL_91;
        }
        else if (!v57)
        {
          v29 = 0;
          v31 = 0;
LABEL_92:
          v6 = v204;
          v15 = v212;
          goto LABEL_95;
        }
LABEL_67:
        *(float64x2_t *)&STACK[0xEF0] = v206;
        *(float64x2_t *)&STACK[0xEE0] = v207;
        *(float64x2_t *)&STACK[0xF10] = v208;
        *(float64x2_t *)&STACK[0xF00] = v209;
        *(float64x2_t *)&STACK[0xF30] = v210;
        *(float64x2_t *)&STACK[0xF20] = v211;
        *(float64x2_t *)&STACK[0xF50] = v213;
        *(float64x2_t *)&STACK[0xF40] = v214;
        __invert_d4();
        v164 = 0;
        *(_OWORD *)&STACK[0xEE0] = 0u;
        *(_OWORD *)&STACK[0xEF0] = 0u;
        *(_OWORD *)&STACK[0xF00] = 0u;
        *(_OWORD *)&STACK[0xF10] = 0u;
        *(_OWORD *)&STACK[0xF20] = 0u;
        *(_OWORD *)&STACK[0xF30] = 0u;
        *(_OWORD *)&STACK[0xF40] = 0u;
        *(_OWORD *)&STACK[0xF50] = 0u;
        do
        {
          v166 = *(float64x2_t *)&v224[v164];
          v165 = *(float64x2_t *)&v224[v164 + 16];
          v167 = (float64x2_t *)((char *)&STACK[0xEE0] + v164);
          *v167 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v195, v166.f64[0]), v197, v166, 1), v199, v165.f64[0]), vars0, v165, 1);
          v167[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v196, v166.f64[0]), v198, v166, 1), v201, v165.f64[0]), v205, v165, 1);
          v164 += 32;
        }
        while (v164 != 128);
        v168 = (*(double *)&STACK[0xEE0] + *(double *)&STACK[0xF08] + *(double *)&STACK[0xF30] + -1.0) * 0.5;
        v169 = 1.0;
        if (v168 >= 1.001 || v168 <= 1.0)
          v169 = (*(double *)&STACK[0xEE0] + *(double *)&STACK[0xF08] + *(double *)&STACK[0xF30] + -1.0) * 0.5;
        if (v168 >= -1.0 || v168 <= -1.001)
          v172 = v169;
        else
          v172 = -1.0;
        v173 = acos(v172);
        _ARLogTechnique_9();
        v174 = objc_claimAutoreleasedReturnValue();
        v175 = os_log_type_enabled(v174, OS_LOG_TYPE_DEBUG);
        if (fabs(v173) == INFINITY || v173 * 180.0 < 3.14159265)
        {
          v15 = v212;
          if (v175)
          {
            v185 = (objc_class *)objc_opt_class();
            NSStringFromClass(v185);
            v186 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(STACK[0xE60]) = 138543618;
            STACK[0xE64] = (unint64_t)v186;
            LOWORD(STACK[0xE6C]) = 2048;
            STACK[0xE6E] = (unint64_t)self;
            _os_log_impl(&dword_1B3A68000, v174, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: CLCM ENUFromVIO update: rotation difference too small, ignoring", (uint8_t *)&STACK[0xE60], 0x16u);

          }
        }
        else
        {
          if (v175)
          {
            v176 = (objc_class *)objc_opt_class();
            NSStringFromClass(v176);
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            *(float64x2_t *)&STACK[0xE70] = v196;
            *(float64x2_t *)&STACK[0xE60] = v195;
            *(float64x2_t *)&STACK[0xE90] = v198;
            *(float64x2_t *)&STACK[0xE80] = v197;
            *(float64x2_t *)&STACK[0xEB0] = v201;
            *(float64x2_t *)&STACK[0xEA0] = v199;
            *(float64x2_t *)&STACK[0xED0] = v205;
            *(float64x2_t *)&STACK[0xEC0] = vars0;
            v178.n128_f64[0] = ARMatrix4x4DoubleToFloat((float64x2_t *)&STACK[0xE60]);
            ARMatrix4x4Description(0, v178, v179, v180, v181);
            v182 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(STACK[0xE60]) = 138543875;
            STACK[0xE64] = (unint64_t)v177;
            LOWORD(STACK[0xE6C]) = 2048;
            STACK[0xE6E] = (unint64_t)self;
            LOWORD(STACK[0xE76]) = 2113;
            STACK[0xE78] = (unint64_t)v182;
            _os_log_impl(&dword_1B3A68000, v174, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: CLCM ENUFromVIO new rotation: %{private}@", (uint8_t *)&STACK[0xE60], 0x20u);

          }
          v183 = self->_state;
          v15 = v212;
          if (self->_useGradualCorrection)
          {
            -[ARGeoTrackingTechniqueState gradualCorrectionFilter](v183, "gradualCorrectionFilter");
            v184 = (void *)objc_claimAutoreleasedReturnValue();
            *(float64x2_t *)&STACK[0xE70] = v196;
            *(float64x2_t *)&STACK[0xE60] = v195;
            *(float64x2_t *)&STACK[0xE90] = v198;
            *(float64x2_t *)&STACK[0xE80] = v197;
            *(float64x2_t *)&STACK[0xEB0] = v201;
            *(float64x2_t *)&STACK[0xEA0] = v199;
            *(float64x2_t *)&STACK[0xED0] = v205;
            *(float64x2_t *)&STACK[0xEC0] = vars0;
            objc_msgSend(v184, "setTargetRotation:", &STACK[0xE60]);

          }
          else
          {
            *(float64x2_t *)&STACK[0xE60] = v195;
            *(float64x2_t *)&STACK[0xE70] = v196;
            *(float64x2_t *)&STACK[0xE80] = v197;
            *(float64x2_t *)&STACK[0xE90] = v198;
            *(float64x2_t *)&STACK[0xEA0] = v199;
            *(float64x2_t *)&STACK[0xEB0] = v201;
            *(float64x2_t *)&STACK[0xEC0] = vars0;
            *(float64x2_t *)&STACK[0xED0] = v205;
            -[ARGeoTrackingTechniqueState setEnuFromVIORotation:](v183, "setEnuFromVIORotation:", &STACK[0xE60]);
          }
        }
        v6 = v204;
        v29 = 1;
      }
    }
LABEL_95:
    if ((v29 | v31) == 1 && !self->_useGradualCorrection)
    {
      v187 = self->_state;
      if (v187)
      {
        -[ARGeoTrackingTechniqueState enuFromVIO](v187, "enuFromVIO");
      }
      else
      {
        v221 = 0u;
        v222 = 0u;
        v219 = 0u;
        v220 = 0u;
        v217 = 0u;
        v218 = 0u;
        v215 = 0u;
        v216 = 0u;
      }
      *(_OWORD *)&STACK[0xF20] = v219;
      *(_OWORD *)&STACK[0xF30] = v220;
      *(_OWORD *)&STACK[0xF40] = v221;
      *(_OWORD *)&STACK[0xF50] = v222;
      *(_OWORD *)&STACK[0xEE0] = v215;
      *(_OWORD *)&STACK[0xEF0] = v216;
      *(_OWORD *)&STACK[0xF00] = v217;
      *(_OWORD *)&STACK[0xF10] = v218;
      __invert_d4();
      v188 = ARMatrix4x4DoubleToFloat(v223);
      v192 = -[ARGeoTrackingData initWithENUOrigin:vioFromENU:]([ARGeoTrackingData alloc], "initWithENUOrigin:vioFromENU:", v6, v188, v189, v190, v191);
      p_resultLock = &self->_resultLock;
      os_unfair_lock_lock(&self->_resultLock);
      -[ARGeoTrackingTechniqueState resultDatas](self->_state, "resultDatas");
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v194, "addObject:", v192);

      os_unfair_lock_unlock(p_resultLock);
    }
LABEL_101:

    goto LABEL_102;
  }
  _ARLogTechnique_9();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(STACK[0xEE0]) = 138543618;
    STACK[0xEE4] = (unint64_t)v19;
    LOWORD(STACK[0xEEC]) = 2048;
    STACK[0xEEE] = (unint64_t)self;
    _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: At least one location must have been received so far.", (uint8_t *)&STACK[0xEE0], 0x16u);

  }
LABEL_102:

}

- (void)_updateVLStateData:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  int64_t v22;
  int64_t v23;
  int64_t v24;
  int64_t v25;
  double v26;
  unint64_t v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  double v32;
  ARGeoTrackingStatus *v33;
  void *v34;
  ARVLStateData *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  id v44;
  os_unfair_lock_s *p_resultLock;
  void *v46;
  int64_t v47;
  _BOOL4 v48;
  _BOOL4 v49;
  _BOOL4 v50;
  _BOOL4 v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  ARGeoTrackingTechnique *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  -[ARGeoTrackingTechniqueState lastVLExecutionTimestamp](self->_state, "lastVLExecutionTimestamp");
  v6 = v5;
  -[ARGeoTrackingTechniqueState firstVLExecutionAttemptTimestamp](self->_state, "firstVLExecutionAttemptTimestamp");
  v8 = v7;
  -[ARGeoTrackingTechniqueState lastCLLocation](self->_state, "lastCLLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "horizontalAccuracy");
  v12 = v11;
  objc_msgSend(v9, "location");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "horizontalAccuracy");
  v15 = v14;
  objc_msgSend(v9, "location");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "verticalAccuracy");
  v18 = v17;
  objc_msgSend(v9, "location");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "verticalAccuracy");
  v21 = v20;

  os_unfair_lock_lock(&self->_statusLock);
  v22 = -[ARGeoTrackingTechniqueState trackingState](self->_state, "trackingState");
  v23 = -[ARGeoTrackingTechniqueState trackingAccuracy](self->_state, "trackingAccuracy");
  v24 = -[ARGeoTrackingTechnique _getHighestPriorityFailureWithTechniqueStateObject:](self, "_getHighestPriorityFailureWithTechniqueStateObject:", self->_state);
  v25 = -[ARGeoTrackingTechniqueState failureReasons](self->_state, "failureReasons");
  v51 = -[ARGeoTrackingTechniqueState hasStartedAvailabilityCheck](self->_state, "hasStartedAvailabilityCheck");
  v50 = -[ARGeoTrackingTechniqueState hasReturnedAvailabilityCheck](self->_state, "hasReturnedAvailabilityCheck");
  v49 = -[ARGeoTrackingTechniqueState hasStartedLocalization](self->_state, "hasStartedLocalization");
  v48 = -[ARGeoTrackingTechniqueState hasReturnedLocalization](self->_state, "hasReturnedLocalization");
  os_unfair_lock_unlock(&self->_statusLock);
  if (v22 == 3)
  {
    v26 = sqrt(v18 * v21 + v12 * v15);
    if (v26 >= 1.88)
    {
      if (v26 >= 3.64)
        v27 = 1;
      else
        v27 = 2;
    }
    else
    {
      v27 = 3;
    }
  }
  else
  {
    v27 = 0;
  }
  if (v27 != v23)
  {
    _ARLogTechnique_9();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v47 = v24;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromARGeoTrackingAccuracy(v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v53 = v30;
      v54 = 2048;
      v55 = self;
      v56 = 2112;
      v57 = v31;
      _os_log_impl(&dword_1B3A68000, v28, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Geo tracking (base level) accuracy changed to: %@", buf, 0x20u);

      v24 = v47;
    }

    os_unfair_lock_lock(&self->_statusLock);
    -[ARGeoTrackingTechniqueState setTrackingAccuracy:](self->_state, "setTrackingAccuracy:", v27);
    os_unfair_lock_unlock(&self->_statusLock);
  }
  if (v8 > 0.0)
    v8 = a3 - v8;
  if (v6 <= 0.0)
    v32 = v6;
  else
    v32 = a3 - v6;
  v33 = -[ARGeoTrackingStatus initWithGeoTrackingState:accuracy:stateReason:failureReasons:]([ARGeoTrackingStatus alloc], "initWithGeoTrackingState:accuracy:stateReason:failureReasons:", v22, v27, v24, v25);
  -[ARGeoTrackingTechniqueState lastCMDeviceMotion](self->_state, "lastCMDeviceMotion");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = [ARVLStateData alloc];
  objc_msgSend(v9, "location");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v36, "copy");
  objc_msgSend(v9, "timestamp");
  v39 = v38;
  objc_msgSend(v34, "deviceMotion");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "heading");
  v42 = v41;
  objc_msgSend(v34, "timestamp");
  v44 = -[ARVLStateData init:timeSinceInitialization:trackingStatus:fusedReplayLocation:fusedReplayLocationTimestamp:fusedReplayHeading:fusedReplayHeadingTimestamp:hasStartedAvailabilityCheck:hasReturnedAvailabilityCheck:hasStartedLocalization:hasReturnedLocalization:](v35, "init:timeSinceInitialization:trackingStatus:fusedReplayLocation:fusedReplayLocationTimestamp:fusedReplayHeading:fusedReplayHeadingTimestamp:hasStartedAvailabilityCheck:hasReturnedAvailabilityCheck:hasStartedLocalization:hasReturnedLocalization:", v33, v37, v51, v50, v49, v48, v32, v8, v39, v42, v43);

  p_resultLock = &self->_resultLock;
  os_unfair_lock_lock(&self->_resultLock);
  -[ARGeoTrackingTechniqueState resultDatas](self->_state, "resultDatas");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addObject:", v44);

  os_unfair_lock_unlock(p_resultLock);
}

- (void)getLocationFromWorldPosition:(_OWORD *)a3@<X8> error:(__n128)a4@<Q0>
{
  os_unfair_lock_s *v7;
  id v8;
  __int128 v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  __int128 v15;
  void *v16;
  void *v17;
  void *v18;
  __n128 v19;
  double v20;
  void *v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v28;
  int8x16_t v29;
  double v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[32];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v7 = (os_unfair_lock_s *)(a1 + 104);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  v8 = *(id *)(a1 + 112);
  os_unfair_lock_unlock(v7);
  if (objc_msgSend(v8, "trackingState") == 3)
  {
    v9 = 0uLL;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    memset(buf, 0, sizeof(buf));
    if (v8)
    {
      objc_msgSend(v8, "enuFromVIO");
      v9 = 0uLL;
    }
    v37 = v9;
    v38 = v9;
    v35 = v9;
    v36 = v9;
    v33 = v9;
    v34 = v9;
    v31 = v9;
    v32 = v9;
    objc_msgSend(v8, "enuOrigin");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "ecefFromlocation");
    }
    else
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
    }

    v19 = a4;
    v19.n128_u32[3] = 1.0;
    ARVisionTransformFromARTransform(*MEMORY[0x1E0C83FF0], *(__n128 *)(MEMORY[0x1E0C83FF0] + 16), *(__n128 *)(MEMORY[0x1E0C83FF0] + 32), v19);
    ARECEFToLLA(&v29);
    v26 = v29.i64[1];
    v28 = v29.i64[0];
    v20 = v30;
    objc_msgSend(v8, "enuOrigin");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "undulation");
    *(double *)&v23 = ARWGS84ToMSLAltitude(v20, v22);
    v25 = v23;

  }
  else
  {
    _ARLogTechnique_9();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a1;
      _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: getGeoLocationForPoint requires geo tracking to be localized.", buf, 0x16u);

    }
    if (a2)
    {
      v46 = *MEMORY[0x1E0CB2D50];
      ARKitCoreBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Geo tracking is not localized."), &stru_1E6676798, CFSTR("Localizable_iOS"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ARErrorWithCodeAndUserInfo(151, v18);
      *a2 = (id)objc_claimAutoreleasedReturnValue();

    }
    v28 = 0;
    v26 = 0;
    *(_QWORD *)&v15 = 0;
    v25 = v15;
  }

  *(_QWORD *)&v24 = v28;
  *((_QWORD *)&v24 + 1) = v26;
  *a3 = v24;
  a3[1] = v25;
}

- (double)visualLocalizationCallInterval
{
  return self->_visualLocalizationCallInterval;
}

- (void)setVisualLocalizationCallInterval:(double)a3
{
  self->_visualLocalizationCallInterval = a3;
}

- (double)posteriorVisualLocalizationCallInterval
{
  return self->_posteriorVisualLocalizationCallInterval;
}

- (void)setPosteriorVisualLocalizationCallInterval:(double)a3
{
  self->_posteriorVisualLocalizationCallInterval = a3;
}

- (double)visualLocalizationCallIntervalTimeThreshold
{
  return self->_visualLocalizationCallIntervalTimeThreshold;
}

- (void)setVisualLocalizationCallIntervalTimeThreshold:(double)a3
{
  self->_visualLocalizationCallIntervalTimeThreshold = a3;
}

- (BOOL)visualLocalizationUpdatesRequested
{
  return self->_visualLocalizationUpdatesRequested;
}

- (void)setVisualLocalizationUpdatesRequested:(BOOL)a3
{
  self->_visualLocalizationUpdatesRequested = a3;
}

- (unint64_t)supportEnablementOptions
{
  return self->_supportEnablementOptions;
}

- (void)setSupportEnablementOptions:(unint64_t)a3
{
  self->_supportEnablementOptions = a3;
}

- (BOOL)VLPoseEstimationExecuting
{
  return self->_VLPoseEstimationExecuting;
}

- (void)setVLPoseEstimationExecuting:(BOOL)a3
{
  self->_VLPoseEstimationExecuting = a3;
}

- (VLTraceRecorder)VLTraceRecorder
{
  return (VLTraceRecorder *)objc_getProperty(self, a2, 168, 1);
}

- (void)setVLTraceRecorder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (CLSimulationManager)locationSimulationManager
{
  return self->_locationSimulationManager;
}

- (void)setLocationSimulationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationSimulationManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationSimulationManager, 0);
  objc_storeStrong((id *)&self->_VLTraceRecorder, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_visualLocalizationQueue, 0);
}

@end
