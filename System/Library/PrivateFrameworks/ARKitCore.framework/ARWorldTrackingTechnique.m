@implementation ARWorldTrackingTechnique

uint64_t __39__ARWorldTrackingTechnique_isSupported__block_invoke()
{
  uint64_t result;

  result = CV3DVIOIsVideoModeSupported();
  +[ARWorldTrackingTechnique isSupported]::supported = (_DWORD)result == *MEMORY[0x1E0CFCA08];
  return result;
}

+ (BOOL)isSupported
{
  if (+[ARWorldTrackingTechnique isSupported]::onceToken != -1)
    dispatch_once(&+[ARWorldTrackingTechnique isSupported]::onceToken, &__block_literal_global_36);
  return +[ARWorldTrackingTechnique isSupported]::supported;
}

+ (BOOL)supportsVideoResolution:(CGSize)a3 forDeviceType:(id)a4
{
  double height;
  double width;
  id v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  BOOL v9;
  BOOL v11;

  height = a3.height;
  width = a3.width;
  v6 = a4;
  if ((v7 & 1) == 0
  {
    +[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:]::customWideVideoResolution = *MEMORY[0x1E0C9D820];
  }
  if ((v8 & 1) == 0
  {
    +[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:]::customUltraWideVideoResolution = *MEMORY[0x1E0C9D820];
  }
  if (+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:]::onceToken[0] != -1)
    dispatch_once(+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:]::onceToken, &__block_literal_global_6_0);
  if ((id)*MEMORY[0x1E0C89FA0] == v6)
  {
    if (*(double *)&+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:]::customWideVideoResolution != width
      || *((double *)&+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:]::customWideVideoResolution + 1) != height)
    {
      if ((id)*MEMORY[0x1E0C89F98] != v6
        || (*(double *)&+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:]::customUltraWideVideoResolution == width
          ? (v11 = *((double *)&+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:]::customUltraWideVideoResolution
                   + 1) == height)
          : (v11 = 0),
            !v11))
      {
        if (width == 640.0 && height == 480.0)
          goto LABEL_41;
        if (width == 1280.0 && height == 720.0)
          goto LABEL_41;
        if (width == 1440.0 && height == 1080.0)
          goto LABEL_41;
        if (width == 1920.0 && height == 1080.0)
          goto LABEL_41;
        v9 = 0;
        if (width == 1920.0 && height == 1440.0)
          goto LABEL_41;
        goto LABEL_42;
      }
    }
LABEL_27:
    v9 = 1;
    goto LABEL_42;
  }
  if ((id)*MEMORY[0x1E0C89F98] != v6)
  {
    v9 = 0;
    goto LABEL_42;
  }
  if (*(double *)&+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:]::customUltraWideVideoResolution == width
    && *((double *)&+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:]::customUltraWideVideoResolution
       + 1) == height)
  {
    goto LABEL_27;
  }
  if (width == 640.0 && height == 480.0 || (v9 = 0, width == 1920.0) && height == 1440.0)
LABEL_41:
    v9 = CV3DVIOIsVideoModeSupported() == *MEMORY[0x1E0CFCA08];
LABEL_42:

  return v9;
}

void __66__ARWorldTrackingTechnique_supportsVideoResolution_forDeviceType___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  +[ARKitUserDefaults valueForKey:](ARKitUserDefaults, "valueForKey:", CFSTR("com.apple.arkit.worldtracking.calibrationParameters.back.wide"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v0, "objectForKeyedSubscript:", ARWorldTrackingBackWideCalibrationParametersKeyImageWidth);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "doubleValue");
      v3 = v2;

      objc_msgSend(v0, "objectForKeyedSubscript:", ARWorldTrackingBackWideCalibrationParametersKeyImageHeight);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "doubleValue");
      v6 = v5;

      *(_QWORD *)&+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:]::customWideVideoResolution = v3;
      *((_QWORD *)&+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:]::customWideVideoResolution + 1) = v6;
    }
  }
  +[ARKitUserDefaults valueForKey:](ARKitUserDefaults, "valueForKey:", CFSTR("com.apple.arkit.worldtracking.calibrationParameters.back.ultrawide"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v15;
  if (v15)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = v15;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", ARWorldTrackingBackWideCalibrationParametersKeyImageWidth);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v11 = v10;

      objc_msgSend(v15, "objectForKeyedSubscript:", ARWorldTrackingBackWideCalibrationParametersKeyImageHeight);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      v14 = v13;

      *(_QWORD *)&+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:]::customUltraWideVideoResolution = v11;
      *((_QWORD *)&+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:]::customUltraWideVideoResolution + 1) = v14;
      v7 = v15;
    }
  }

}

- (ARWorldTrackingTechnique)init
{
  void *v3;
  ARWorldTrackingTechnique *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ARWorldTrackingTechnique initWithOptions:](self, "initWithOptions:", v3);

  return v4;
}

- (ARWorldTrackingTechnique)initWithOptions:(id)a3
{
  id v4;
  ARWorldTrackingTechnique *v5;
  uint64_t v6;
  NSHashTable *observers;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *observersSemaphore;
  uint64_t v10;
  ARWorldTrackingOptions *mutableOptions;
  dispatch_semaphore_t v12;
  OS_dispatch_semaphore *resultSemaphore;
  dispatch_semaphore_t v14;
  OS_dispatch_semaphore *sessionHandleStateSemaphore;
  uint64_t v16;
  NSMutableSet *anchorsReceived;
  uint64_t v18;
  NSMutableSet *participantAnchors;
  double v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  double v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  CV3DPosePredictionContext *predictorHandle;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  ARWorldTrackingTechnique *v36;
  NSObject *v37;
  objc_class *v38;
  void *v39;
  unsigned int visualizationCameraID;
  NSObject *v41;
  objc_class *v42;
  void *v43;
  _BOOL4 useFixedIntrinsics;
  const __CFString *v45;
  double v46;
  double v47;
  NSObject *v48;
  objc_class *v49;
  void *v50;
  NSObject *v51;
  objc_class *v52;
  void *v53;
  _BOOL4 allowPoseGraphUpdates;
  const __CFString *v55;
  ARWorldTrackingOptions *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  BOOL v60;
  uint64_t v61;
  ARWorldTrackingOptions *options;
  NSNumber *detectionCountUserDefaultValue;
  NSNumber *minVergenceAngleDegreesUserDefaultValue;
  deterministicMode *lineFeaturesAlwaysOnUserDefaultValue;
  NSString *detectionPolicyString;
  uint64_t v67;
  OS_dispatch_queue *resultDataQueue;
  uint64_t v69;
  NSMutableArray *latestSpatialMappingData;
  uint64_t v71;
  NSMutableDictionary *meshChunksWaitingForSemantics;
  uint64_t v73;
  NSMutableDictionary *meshChunkIdentifiersCurrentlyBeingProcessed;
  MTLDevice *v75;
  MTLDevice *sharedMetalDevice;
  uint64_t v77;
  MTLCommandQueue *spatialMappingCommandQueue;
  uint64_t v79;
  NSMutableDictionary *spatialMappingPointClouds;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  MTLFunction *annotateDepthDataKernelFunction;
  uint64_t v86;
  NSMutableDictionary *spatialMappingResultDataWaitingForSemantics;
  ARWorldTrackingTechnique *v89;
  objc_super v90;
  uint8_t buf[4];
  void *v92;
  __int16 v93;
  ARWorldTrackingTechnique *v94;
  __int16 v95;
  __int128 v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v90.receiver = self;
  v90.super_class = (Class)ARWorldTrackingTechnique;
  v5 = -[ARImageBasedTechnique init](&v90, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = objc_claimAutoreleasedReturnValue();
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v6;

    v8 = dispatch_semaphore_create(1);
    observersSemaphore = v5->_observersSemaphore;
    v5->_observersSemaphore = (OS_dispatch_semaphore *)v8;

    v10 = objc_msgSend(v4, "copy");
    mutableOptions = v5->_mutableOptions;
    v5->_mutableOptions = (ARWorldTrackingOptions *)v10;

    v12 = dispatch_semaphore_create(1);
    resultSemaphore = v5->_resultSemaphore;
    v5->_resultSemaphore = (OS_dispatch_semaphore *)v12;

    v14 = dispatch_semaphore_create(1);
    sessionHandleStateSemaphore = v5->_sessionHandleStateSemaphore;
    v5->_sessionHandleStateSemaphore = (OS_dispatch_semaphore *)v14;

    v5->_surfaceDetectionSessionLock._os_unfair_lock_opaque = 0;
    v5->_raycastSessionLock._os_unfair_lock_opaque = 0;
    if ((objc_msgSend((id)objc_opt_class(), "isSupported") & 1) != 0)
    {
      v5->_lastRelocalizationTimestamp = 0.0;
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v16 = objc_claimAutoreleasedReturnValue();
      anchorsReceived = v5->_anchorsReceived;
      v5->_anchorsReceived = (NSMutableSet *)v16;

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v18 = objc_claimAutoreleasedReturnValue();
      participantAnchors = v5->_participantAnchors;
      v5->_participantAnchors = (NSMutableSet *)v18;

      v5->_participantAnchorsEnabled = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.worldTracking.participantAnchors"));
      v5->_resultLatency = 0.008;
      +[ARKitUserDefaults numberForKey:](ARKitUserDefaults, "numberForKey:", CFSTR("com.apple.arkit.worldTracking.resultLatency"));
      v89 = (ARWorldTrackingTechnique *)objc_claimAutoreleasedReturnValue();
      if (v89)
      {
        -[ARWorldTrackingTechnique doubleValue](v89, "doubleValue");
        v5->_resultLatency = v20 * 0.001;
      }
      _ARLogTechnique();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v5->_resultLatency * 1000.0;
        *(_DWORD *)buf = 138543874;
        v92 = v23;
        v93 = 2048;
        v94 = v5;
        v95 = 2048;
        *(double *)&v96 = v24;
        _os_log_impl(&dword_1B3A68000, v21, OS_LOG_TYPE_INFO, "%{public}@ <%p>: World tracking result latency %fms", buf, 0x20u);

      }
      CV3DGetVersionInfo();
      _ARLogTechnique();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v92 = v27;
        v93 = 2048;
        v94 = v5;
        v95 = 1024;
        LODWORD(v96) = 0;
        WORD2(v96) = 1024;
        *(_DWORD *)((char *)&v96 + 6) = 0;
        WORD5(v96) = 1024;
        HIDWORD(v96) = 0;
        _os_log_impl(&dword_1B3A68000, v25, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: AppleCV3D version %u.%u.%u", buf, 0x28u);

      }
      v5->_sessionHandleState = 1;
      _ARLogTechnique();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        predictorHandle = v5->_predictorHandle;
        *(_DWORD *)buf = 138543874;
        v92 = v30;
        v93 = 2048;
        v94 = v5;
        v95 = 2048;
        *(_QWORD *)&v96 = predictorHandle;
        _os_log_impl(&dword_1B3A68000, v28, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Created pose predictor handle: %p", buf, 0x20u);

      }
      -[ARWorldTrackingOptions imageSensorSettings](v5->_mutableOptions, "imageSensorSettings");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "videoFormat");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "captureDeviceType");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
        v35 = -[ARWorldTrackingOptions cameraIdForCaptureDeviceType:](v5->_mutableOptions, "cameraIdForCaptureDeviceType:", v34);
      else
        v35 = 0;
      v5->_visualizationCameraID = v35;
      _ARLogTechnique();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        v38 = (objc_class *)objc_opt_class();
        NSStringFromClass(v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        visualizationCameraID = v5->_visualizationCameraID;
        *(_DWORD *)buf = 138544130;
        v92 = v39;
        v93 = 2048;
        v94 = v5;
        v95 = 1024;
        LODWORD(v96) = visualizationCameraID;
        WORD2(v96) = 2112;
        *(_QWORD *)((char *)&v96 + 6) = v34;
        _os_log_impl(&dword_1B3A68000, v37, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: World tracking visualization camera identifier: %u, visualization capture device type: %@", buf, 0x26u);

      }
      v5->_useFixedIntrinsics = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.worldtracking.fixedIntrinsics"));
      _ARLogTechnique();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        useFixedIntrinsics = v5->_useFixedIntrinsics;
        *(_DWORD *)buf = 138543874;
        v92 = v43;
        if (useFixedIntrinsics)
          v45 = CFSTR("fixed");
        else
          v45 = CFSTR("varying");
        v93 = 2048;
        v94 = v5;
        v95 = 2112;
        *(_QWORD *)&v96 = v45;
        _os_log_impl(&dword_1B3A68000, v41, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: World tracking will use %@ intrinsics", buf, 0x20u);

      }
      +[ARKitUserDefaults doubleForKey:](ARKitUserDefaults, "doubleForKey:", CFSTR("com.apple.arkit.worldtracking.minVergenceAngle"));
      v47 = v46;
      v5->_minVergenceAngleCosine = cos(v46 * 3.14159265 / 180.0);
      _ARLogTechnique();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        v49 = (objc_class *)objc_opt_class();
        NSStringFromClass(v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v92 = v50;
        v93 = 2048;
        v94 = v5;
        v95 = 2048;
        *(double *)&v96 = v47;
        _os_log_impl(&dword_1B3A68000, v48, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: World tracking will use %.03f° as minimum vergence angle threshold", buf, 0x20u);

      }
      v5->_allowPoseGraphUpdates = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.worldtracking.poseGraphUpdates"));
      _ARLogTechnique();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        v52 = (objc_class *)objc_opt_class();
        NSStringFromClass(v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        allowPoseGraphUpdates = v5->_allowPoseGraphUpdates;
        *(_DWORD *)buf = 138543874;
        v92 = v53;
        if (allowPoseGraphUpdates)
          v55 = CFSTR("allowed");
        else
          v55 = CFSTR("disallowed");
        v93 = 2048;
        v94 = v5;
        v95 = 2112;
        *(_QWORD *)&v96 = v55;
        _os_log_impl(&dword_1B3A68000, v51, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: World tracking pose graph update custom setting: %@", buf, 0x20u);

      }
      v56 = v5->_mutableOptions;
      +[ARKitUserDefaults numberForKey:](ARKitUserDefaults, "numberForKey:", CFSTR("com.apple.arkit.planeEstimation.minDetectionCount"));
      v57 = objc_claimAutoreleasedReturnValue();
      +[ARKitUserDefaults numberForKey:](ARKitUserDefaults, "numberForKey:", CFSTR("com.apple.arkit.planeEstimation.minVergenceAngle"));
      v58 = objc_claimAutoreleasedReturnValue();
      +[ARKitUserDefaults valueForKey:](ARKitUserDefaults, "valueForKey:", CFSTR("com.apple.arkit.planeEstimation.lineFeaturesAlwaysOn"));
      v59 = objc_claimAutoreleasedReturnValue();
      v60 = -[ARWorldTrackingTechnique deterministicMode](v5, "deterministicMode");
      +[ARKitUserDefaults stringForKey:](ARKitUserDefaults, "stringForKey:", CFSTR("com.apple.arkit.planeEstimation.detectionMethod"));
      v61 = objc_claimAutoreleasedReturnValue();
      options = v5->_surfaceDetectionParametrization.options;
      v5->_surfaceDetectionParametrization.options = v56;

      detectionCountUserDefaultValue = v5->_surfaceDetectionParametrization.detectionCountUserDefaultValue;
      v5->_surfaceDetectionParametrization.detectionCountUserDefaultValue = (NSNumber *)v57;

      minVergenceAngleDegreesUserDefaultValue = v5->_surfaceDetectionParametrization.minVergenceAngleDegreesUserDefaultValue;
      v5->_surfaceDetectionParametrization.minVergenceAngleDegreesUserDefaultValue = (NSNumber *)v58;

      lineFeaturesAlwaysOnUserDefaultValue = v5->_surfaceDetectionParametrization.lineFeaturesAlwaysOnUserDefaultValue;
      v5->_surfaceDetectionParametrization.lineFeaturesAlwaysOnUserDefaultValue = (deterministicMode *)v59;

      v5->_surfaceDetectionParametrization.var0 = v60;
      detectionPolicyString = v5->_surfaceDetectionParametrization.detectionPolicyString;
      v5->_surfaceDetectionParametrization.detectionPolicyString = (NSString *)v61;

      ARCreateFixedPriorityDispatchQueue("com.apple.arkit.worldTracking.resultData");
      v67 = objc_claimAutoreleasedReturnValue();
      resultDataQueue = v5->_resultDataQueue;
      v5->_resultDataQueue = (OS_dispatch_queue *)v67;

      if (ARDeviceSupportsJasper())
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v69 = objc_claimAutoreleasedReturnValue();
        latestSpatialMappingData = v5->_latestSpatialMappingData;
        v5->_latestSpatialMappingData = (NSMutableArray *)v69;

        v5->_latestSpatialMappingDataLock._os_unfair_lock_opaque = 0;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v71 = objc_claimAutoreleasedReturnValue();
        meshChunksWaitingForSemantics = v5->_meshChunksWaitingForSemantics;
        v5->_meshChunksWaitingForSemantics = (NSMutableDictionary *)v71;

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v73 = objc_claimAutoreleasedReturnValue();
        meshChunkIdentifiersCurrentlyBeingProcessed = v5->_meshChunkIdentifiersCurrentlyBeingProcessed;
        v5->_meshChunkIdentifiersCurrentlyBeingProcessed = (NSMutableDictionary *)v73;

        v5->_volumeSamplingLock._os_unfair_lock_opaque = 0;
        v75 = (MTLDevice *)MTLCreateSystemDefaultDevice();
        sharedMetalDevice = v5->_sharedMetalDevice;
        v5->_sharedMetalDevice = v75;

        v77 = -[MTLDevice newCommandQueue](v5->_sharedMetalDevice, "newCommandQueue");
        spatialMappingCommandQueue = v5->_spatialMappingCommandQueue;
        v5->_spatialMappingCommandQueue = (MTLCommandQueue *)v77;

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v79 = objc_claimAutoreleasedReturnValue();
        spatialMappingPointClouds = v5->_spatialMappingPointClouds;
        v5->_spatialMappingPointClouds = (NSMutableDictionary *)v79;

        v5->_spatialMappingPointCloudsLock._os_unfair_lock_opaque = 0;
        ARKitCoreBundle();
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "URLForResource:withExtension:", CFSTR("default"), CFSTR("metallib"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        v83 = (void *)-[MTLDevice newLibraryWithURL:error:](v5->_sharedMetalDevice, "newLibraryWithURL:error:", v82, 0);
        v84 = objc_msgSend(v83, "newFunctionWithName:", CFSTR("annotateDepthData"));
        annotateDepthDataKernelFunction = v5->_annotateDepthDataKernelFunction;
        v5->_annotateDepthDataKernelFunction = (MTLFunction *)v84;

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v86 = objc_claimAutoreleasedReturnValue();
        spatialMappingResultDataWaitingForSemantics = v5->_spatialMappingResultDataWaitingForSemantics;
        v5->_spatialMappingResultDataWaitingForSemantics = (NSMutableDictionary *)v86;

      }
      v36 = v89;
    }
    else
    {
      v36 = v5;
      v5 = 0;
    }

  }
  return v5;
}

- (ARWorldTrackingOptions)options
{
  void *v2;
  void *v3;

  -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (ARWorldTrackingOptions *)v3;
}

- (int64_t)vioHandleState
{
  int64_t sessionHandleState;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sessionHandleStateSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  sessionHandleState = self->_sessionHandleState;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sessionHandleStateSemaphore);
  return sessionHandleState;
}

- (void)dealloc
{
  __CVPixelBufferPool *depth16grayBufferPool;
  __CVPixelBufferPool *confidence8BufferPool;
  __CVPixelBufferPool *poolForSemanticsAnnotatedDepth;
  __CVPixelBufferPool *poolForConfidenceAnnotatedDepth;
  __CVPixelBufferPool *poolForUncertaintyAnnotatedDepth;
  __CVPixelBufferPool *poolForUncertaintyMaskedSemanticsDepth;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  CV3DSLAMSession *slamSessionHandle;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  CV3DPosePredictionContext *predictorHandle;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  ARWorldTrackingTechnique *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  depth16grayBufferPool = self->_depth16grayBufferPool;
  if (depth16grayBufferPool)
  {
    CVPixelBufferPoolRelease(depth16grayBufferPool);
    self->_depth16grayBufferPool = 0;
  }
  confidence8BufferPool = self->_confidence8BufferPool;
  if (confidence8BufferPool)
  {
    CVPixelBufferPoolRelease(confidence8BufferPool);
    self->_confidence8BufferPool = 0;
  }
  poolForSemanticsAnnotatedDepth = self->_poolForSemanticsAnnotatedDepth;
  if (poolForSemanticsAnnotatedDepth)
  {
    CVPixelBufferPoolRelease(poolForSemanticsAnnotatedDepth);
    self->_poolForSemanticsAnnotatedDepth = 0;
  }
  poolForConfidenceAnnotatedDepth = self->_poolForConfidenceAnnotatedDepth;
  if (poolForConfidenceAnnotatedDepth)
  {
    CVPixelBufferPoolRelease(poolForConfidenceAnnotatedDepth);
    self->_poolForConfidenceAnnotatedDepth = 0;
  }
  poolForUncertaintyAnnotatedDepth = self->_poolForUncertaintyAnnotatedDepth;
  if (poolForUncertaintyAnnotatedDepth)
  {
    CVPixelBufferPoolRelease(poolForUncertaintyAnnotatedDepth);
    self->_poolForUncertaintyAnnotatedDepth = 0;
  }
  poolForUncertaintyMaskedSemanticsDepth = self->_poolForUncertaintyMaskedSemanticsDepth;
  if (poolForUncertaintyMaskedSemanticsDepth)
  {
    CVPixelBufferPoolRelease(poolForUncertaintyMaskedSemanticsDepth);
    self->_poolForUncertaintyMaskedSemanticsDepth = 0;
  }
  os_unfair_lock_lock(&self->_surfaceDetectionSessionLock);
  std::shared_ptr<PlaneDetectionSession>::reset[abi:ne180100](&self->_planeDetectionSession.__ptr_);
  os_unfair_lock_unlock(&self->_surfaceDetectionSessionLock);
  os_unfair_lock_lock(&self->_raycastSessionLock);
  std::shared_ptr<PlaneDetectionSession>::reset[abi:ne180100](&self->_raycastSession.__ptr_);
  os_unfair_lock_unlock(&self->_raycastSessionLock);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sessionHandleStateSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (self->_slamSessionHandle)
  {
    _ARLogTechnique();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      slamSessionHandle = self->_slamSessionHandle;
      *(_DWORD *)buf = 138543874;
      v25 = v11;
      v26 = 2048;
      v27 = self;
      v28 = 2048;
      v29 = slamSessionHandle;
      _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Releasing SLAM handle: %p …", buf, 0x20u);

    }
    CV3DSLAMSessionWait();
    CV3DSLAMSessionRelease();
    self->_slamSessionHandle = 0;
    self->_sessionHandleState = 0;
    _ARLogTechnique();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v15;
      v26 = 2048;
      v27 = self;
      _os_log_impl(&dword_1B3A68000, v13, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: SLAM handle released", buf, 0x16u);

    }
  }
  if (self->_predictorHandle)
  {
    _ARLogTechnique();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      predictorHandle = self->_predictorHandle;
      *(_DWORD *)buf = 138543874;
      v25 = v18;
      v26 = 2048;
      v27 = self;
      v28 = 2048;
      v29 = predictorHandle;
      _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Releasing predictor handle: %p …", buf, 0x20u);

    }
    CV3DPosePredictionRelease();
    self->_predictorHandle = 0;
    _ARLogTechnique();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v22;
      v26 = 2048;
      v27 = self;
      _os_log_impl(&dword_1B3A68000, v20, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Predictor handle released", buf, 0x16u);

    }
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sessionHandleStateSemaphore);
  v23.receiver = self;
  v23.super_class = (Class)ARWorldTrackingTechnique;
  -[ARWorldTrackingTechnique dealloc](&v23, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ARWorldTrackingTechnique;
  if (-[ARTechnique isEqual:](&v10, sel_isEqual_, v4))
  {
    v5 = v4;
    -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mutableOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_fullDescription
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v10.receiver = self;
  v10.super_class = (Class)ARWorldTrackingTechnique;
  -[ARImageBasedTechnique _fullDescription](&v10, sel__fullDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0))
  {
    v6 = CFSTR("Busy");
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);
    v6 = CFSTR("NotBusy");
  }
  objc_msgSend(v5, "appendFormat:", CFSTR("\tResult is %@\n"), v6);
  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_sessionHandleStateSemaphore, 0))
  {
    v7 = CFSTR("Busy");
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_sessionHandleStateSemaphore);
    v7 = CFSTR("NotBusy");
  }
  objc_msgSend(v5, "appendFormat:", CFSTR("\tState is %@\n"), v7);
  objc_msgSend(v5, "appendFormat:", CFSTR("\tslamSessionHandle state(%li)\n"), self->_sessionHandleState);
  objc_msgSend(v5, "appendFormat:", CFSTR("\tpredictorHandle state(%li)\n"), self->_predictorHandle);
  objc_msgSend(v5, "appendFormat:", CFSTR("\tresult latency(%lf)\n"), *(_QWORD *)&self->_resultLatency);
  objc_msgSend(v5, "appendFormat:", CFSTR("\tkeyframe count(%d)\n"), self->_previousKeyframeCount);
  if (self->_hasQualityKeyframe)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("\tQualityKeyframe: %@\n"), v8);
  objc_msgSend(v5, "appendFormat:", CFSTR("\tQualityKeyframeTimestamp(%lf)\n"), *(_QWORD *)&self->_lastQualityKeyframeTimestamp);
  objc_msgSend(v5, "appendFormat:", CFSTR("\tReinitializationAttempts(%i)\n"), self->_reinitializationAttempts);
  objc_msgSend(v5, "appendFormat:", CFSTR("\tReinitializationAttemptsAtInitialization(%li)\n"), self->_reinitializationAttemptsAtInitialization);
  objc_msgSend(v5, "appendFormat:", CFSTR("\tLastRelocalizationTimestamp(%lf)\n"), *(_QWORD *)&self->_lastRelocalizationTimestamp);
  objc_msgSend(v5, "appendFormat:", CFSTR("\tOriginTimestamp(%lf)\n"), *(_QWORD *)&self->_originTimestamp);
  objc_msgSend(v5, "appendFormat:", CFSTR("\tErrorData: %@\n"), self->_errorData);
  return v5;
}

- (unint64_t)requiredSensorDataTypes
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "slamConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("CoreLocationIntegration")))
  {

    return 71;
  }
  -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "recordForGeoTracking");

  if (v6)
    return 71;
  return 7;
}

- (int64_t)captureBehavior
{
  return 1;
}

- (BOOL)deterministicMode
{
  void *v2;
  char v3;

  -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deterministicMode");

  return v3;
}

- (double)requiredTimeInterval
{
  return self->_resultLatency;
}

- (id)resultDataClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

- (void)_handleCV3DError:(__CFError *)a3 withDescription:(id)a4 failTechnique:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  __CFError *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  ARWorldTrackingTechnique *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  __CFError *v21;
  uint64_t v22;

  v5 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  if (v9)
  {
    _ARLogTechnique();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138544130;
      v15 = v12;
      v16 = 2048;
      v17 = self;
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ => %@", (uint8_t *)&v14, 0x2Au);

    }
    if (v5)
    {
      ARErrorWithCodeAndUserInfo(200, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARWorldTrackingTechnique _didFailWithError:](self, "_didFailWithError:", v13);

    }
  }

}

- (BOOL)reconfigurableFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  const __CFString *v22;
  int v24;
  void *v25;
  __int16 v26;
  ARWorldTrackingTechnique *v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[ARWorldTrackingTechnique vioHandleState](self, "vioHandleState") == 4
    || !objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    objc_msgSend(v4, "options");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqual:", v5) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v6, "imageSensorSettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "imageSensorSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if ((v10 & 1) == 0)
      {
        objc_msgSend(v6, "imageSensorSettings");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "autoFocusEnabled");
        objc_msgSend(v5, "imageSensorSettings");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setAutoFocusEnabled:", v12);

      }
      objc_msgSend(v5, "setPlaneDetection:", objc_msgSend(v6, "planeDetection"));
      objc_msgSend(v6, "minVergenceAngle");
      objc_msgSend(v5, "setMinVergenceAngle:");
      objc_msgSend(v5, "setMlModelEnabled:", objc_msgSend(v6, "mlModelEnabled"));
      objc_msgSend(v5, "setSceneReconstruction:", objc_msgSend(v6, "sceneReconstruction"));
      objc_msgSend(v6, "sceneReconstructionOptions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSceneReconstructionOptions:", v14);

      objc_msgSend(v5, "setDepthBuffersWillBeProvided:", objc_msgSend(v6, "depthBuffersWillBeProvided"));
      objc_msgSend(v5, "setPlaneBundleAdjustmentEnabled:", objc_msgSend(v6, "planeBundleAdjustmentEnabled"));
      objc_msgSend(v6, "singleShotPlaneCallback");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSingleShotPlaneCallback:", v15);

      objc_msgSend(v6, "trackedPlaneCallback");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTrackedPlaneCallback:", v16);

      objc_msgSend(v6, "planeDetectionVIOPoseCallback");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPlaneDetectionVIOPoseCallback:", v17);

      objc_msgSend(v6, "planeDetectionPoseUpdateCallback");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPlaneDetectionPoseUpdateCallback:", v18);

      v7 = objc_msgSend(v6, "isEqual:", v5);
    }
    _ARLogTechnique();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("not ");
      v24 = 138543874;
      v25 = v21;
      if (v7)
        v22 = &stru_1E6676798;
      v26 = 2048;
      v27 = self;
      v28 = 2112;
      v29 = v22;
      _os_log_impl(&dword_1B3A68000, v19, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: is %@reconfigurable", (uint8_t *)&v24, 0x20u);

    }
  }

  return v7;
}

- (void)reconfigureFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  RaycastSession *ptr;
  void *v10;
  PlaneDetectionSession *v11;
  unsigned __int16 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  NSObject *v15;
  objc_class *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  __int16 v33;
  ARWorldTrackingTechnique *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mutableOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v4, "mutableOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "depthBuffersWillBeProvided") & 1) != 0)
    {

    }
    else
    {
      ptr = self->_raycastSession.__ptr_;

      if (ptr)
        RaycastSession::InvalidateDenseFrame(self->_raycastSession.__ptr_);
    }
    objc_msgSend(v4, "options");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARWorldTrackingTechnique setMutableOptions:](self, "setMutableOptions:", v10);

    objc_storeStrong((id *)&self->_surfaceDetectionParametrization.options, *((id *)v4 + 39));
    objc_storeStrong((id *)&self->_surfaceDetectionParametrization.detectionCountUserDefaultValue, *((id *)v4 + 40));
    objc_storeStrong((id *)&self->_surfaceDetectionParametrization.minVergenceAngleDegreesUserDefaultValue, *((id *)v4 + 41));
    objc_storeStrong((id *)&self->_surfaceDetectionParametrization.lineFeaturesAlwaysOnUserDefaultValue, *((id *)v4 + 42));
    self->_surfaceDetectionParametrization.var0 = *((_BYTE *)v4 + 344);
    objc_storeStrong((id *)&self->_surfaceDetectionParametrization.detectionPolicyString, *((id *)v4 + 44));
    v11 = self->_planeDetectionSession.__ptr_;
    if (v11)
    {
      v12 = PlaneDetectionSession::DidParametersOrConfigurationChanged(v11, &self->_surfaceDetectionParametrization);
      v13 = v12 != 0;
      v14 = v12 > 0xFFu;
    }
    else
    {
      v14 = 0;
      v13 = 0;
    }
    if (-[ARWorldTrackingTechnique vioHandleState](self, "vioHandleState") == 3)
    {
      if (v13)
      {
        -[ARWorldTrackingTechnique _initializeSurfaceDetection:](self, "_initializeSurfaceDetection:", &self->_surfaceDetectionParametrization);
      }
      else if (v14)
      {
        -[ARWorldTrackingTechnique updateSurfaceDetectionConfiguration](self, "updateSurfaceDetectionConfiguration");
      }
      _ARLogTechnique();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromARPlaneDetection(objc_msgSend(v18, "planeDetection"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138543874;
        v32 = v17;
        v33 = 2048;
        v34 = self;
        v35 = 2112;
        v36 = v19;
        _os_log_impl(&dword_1B3A68000, v15, OS_LOG_TYPE_INFO, "%{public}@ <%p>: reconfigured for detection type(s): %@", (uint8_t *)&v31, 0x20u);

      }
      -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "sceneReconstruction") == 0;

      if (v21)
      {
        -[ARWorldTrackingTechnique sceneReconstructionHandler](self, "sceneReconstructionHandler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "pause");

      }
      else
      {
        -[ARWorldTrackingTechnique sceneReconstructionHandler](self, "sceneReconstructionHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22 == 0;

        if (v23)
        {
          -[ARWorldTrackingTechnique setupSceneReconstruction](self, "setupSceneReconstruction");
        }
        else
        {
          -[ARWorldTrackingTechnique sceneReconstructionHandler](self, "sceneReconstructionHandler");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "sceneReconstruction");
          -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "sceneReconstructionOptions");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "reconfigureSceneReconstruction:options:", v26, v28);

        }
        -[ARWorldTrackingTechnique sceneReconstructionHandler](self, "sceneReconstructionHandler");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "start");

        -[ARWorldTrackingTechnique _configureMeshPlaneHarmonization](self, "_configureMeshPlaneHarmonization");
      }
    }
  }

}

- (void)updateSurfaceDetectionConfiguration
{
  PlaneDetectionSession *ptr;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  ARWorldTrackingTechnique *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  ptr = self->_planeDetectionSession.__ptr_;
  if (ptr)
  {
    if (PlaneDetectionSession::UpdateConfiguration(ptr, &self->_surfaceDetectionParametrization))
    {
      -[ARWorldTrackingTechnique _updateVIOLineDetectionPolicy](self, "_updateVIOLineDetectionPolicy");
    }
    else
    {
      _ARLogTechnique();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = (objc_class *)objc_opt_class();
        NSStringFromClass(v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138543618;
        v9 = v6;
        v10 = 2048;
        v11 = self;
        _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error updating surface detection configuration", (uint8_t *)&v8, 0x16u);

      }
      ARErrorWithCodeAndUserInfo(200, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARWorldTrackingTechnique _didFailWithError:](self, "_didFailWithError:", v7);

    }
  }
}

- (void)prepare:(BOOL)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  -[ARWorldTrackingTechnique getObservers](self, "getObservers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sessionHandleStateSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (self->_sessionHandleState == 1)
  {
    self->_sessionHandleState = 2;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_sessionHandleStateSemaphore);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v4 = v15;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v21 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v8, "technique:didChangeState:", self, 2);
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v5);
    }

    v9 = -[ARWorldTrackingTechnique _initializeSLAMAndPredictorHandle](self, "_initializeSLAMAndPredictorHandle");
    if (v9 == 3)
      -[ARWorldTrackingTechnique _initializeSurfaceDetection:](self, "_initializeSurfaceDetection:", &self->_surfaceDetectionParametrization);
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_sessionHandleStateSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    self->_sessionHandleState = v9;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_sessionHandleStateSemaphore);
    if (v9 != 2)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v10 = v4;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v17;
        do
        {
          for (j = 0; j != v11; ++j)
          {
            if (*(_QWORD *)v17 != v12)
              objc_enumerationMutation(v10);
            v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * j);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v14, "technique:didChangeState:", self, v9);
          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        }
        while (v11);
      }

    }
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_sessionHandleStateSemaphore);
  }
  kdebug_trace();

}

- (id)processData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  objc_class *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  unsigned int v37;
  NSObject *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  simd_float4 v46;
  simd_float4 v47;
  simd_float4 v48;
  simd_float4 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  unint64_t v54;
  float32x4_t v55;
  void *v56;
  BOOL v57;
  PlaneDetectionSession *ptr;
  void *v59;
  uint64_t v60;
  char v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  int8x16_t v68;
  int8x16_t v69;
  __n128 v70;
  float v71;
  uint64_t v72;
  float v73;
  uint64_t v74;
  NSObject *v75;
  objc_class *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  objc_class *v80;
  void *v81;
  void *v82;
  NSObject *v83;
  objc_class *v84;
  void *v85;
  void *v86;
  id v87;
  uint64_t v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  simd_float4 v94;
  simd_float4 v95;
  simd_float4 v96;
  simd_float4 v97;
  _QWORD v98[2];
  uint64_t (*v99)();
  void *v100;
  uint64_t v101;
  id v102;
  double v103;
  uint64_t v104;
  double v105;
  objc_super v106;
  float64x2_t buf[4];
  uint64_t v108;
  _BYTE v109[32];
  __int128 v110;
  __int128 v111;
  uint64_t v112;
  simd_float4x4 v113;
  simd_float4x4 v114;

  v112 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v106.receiver = self;
  v106.super_class = (Class)ARWorldTrackingTechnique;
  v8 = -[ARImageBasedTechnique processData:](&v106, sel_processData_, v7);
  if (-[ARWorldTrackingTechnique vioHandleState](self, "vioHandleState") != 3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ARImageBasedTechnique pushResultData:forFrame:](self, "pushResultData:forFrame:", MEMORY[0x1E0C9AA60], 0);
    goto LABEL_76;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v7;
      *(_QWORD *)v109 = 0;
      objc_msgSend(v12, "acceleration");
      objc_msgSend(v12, "acceleration");
      objc_msgSend(v12, "acceleration");
      objc_msgSend(v12, "timestamp");
      if ((CV3DSLAMSessionPushAccel() & 1) == 0)
      {
        _ARLogTechnique();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = (objc_class *)objc_opt_class();
          NSStringFromClass(v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = *(void **)v109;
          LODWORD(buf[0].f64[0]) = 138543874;
          *(_QWORD *)((char *)buf[0].f64 + 4) = v15;
          WORD2(buf[0].f64[1]) = 2048;
          *(_QWORD *)((char *)&buf[0].f64[1] + 6) = self;
          HIWORD(buf[1].f64[0]) = 2112;
          buf[1].f64[1] = *(float64_t *)v109;
          _os_log_impl(&dword_1B3A68000, v13, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error pushing accelometer data: %@", (uint8_t *)buf, 0x20u);

        }
        ARErrorWithCodeAndUserInfo(200, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARWorldTrackingTechnique _didFailWithError:](self, "_didFailWithError:", v17);

      }
      objc_msgSend(v12, "acceleration");
      objc_msgSend(v12, "acceleration");
      objc_msgSend(v12, "acceleration");
      objc_msgSend(v12, "timestamp");
      v18 = CV3DPosePredictionPushAccel();
      if (!v18)
        goto LABEL_73;
      _ARLogTechnique();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromCV3DPosePredictionReturn(v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf[0].f64[0]) = 138543874;
        *(_QWORD *)((char *)buf[0].f64 + 4) = v21;
        WORD2(buf[0].f64[1]) = 2048;
        *(_QWORD *)((char *)&buf[0].f64[1] + 6) = self;
        HIWORD(buf[1].f64[0]) = 2112;
        *(_QWORD *)&buf[1].f64[1] = v22;
        _os_log_impl(&dword_1B3A68000, v19, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error pushing accelometer data to predictor: %@", (uint8_t *)buf, 0x20u);

      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_74;
        v35 = v7;
        objc_msgSend(v35, "pointCloud");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        CV3DSLAMJasperPointCloudCreateFromADPointCloud();

        -[ARWorldTrackingTechnique CV3DSLAMJasperPointCloudProjectorModeFromAVTimeOfFlightProjectorMode:](self, "CV3DSLAMJasperPointCloudProjectorModeFromAVTimeOfFlightProjectorMode:", objc_msgSend(v35, "projectorMode"));
        v37 = CV3DSLAMJasperPointCloudSetProjectorMode();
        if (v37)
        {
          _ARLogTechnique();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v39 = (objc_class *)objc_opt_class();
            NSStringFromClass(v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromCV3DSLAMJasperPointCloudReturn(v37);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf[0].f64[0]) = 138543874;
            *(_QWORD *)((char *)buf[0].f64 + 4) = v40;
            WORD2(buf[0].f64[1]) = 2048;
            *(_QWORD *)((char *)&buf[0].f64[1] + 6) = self;
            HIWORD(buf[1].f64[0]) = 2112;
            *(_QWORD *)&buf[1].f64[1] = v41;
            _os_log_impl(&dword_1B3A68000, v38, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error setting jasper projector mode: %@", (uint8_t *)buf, 0x20u);

          }
        }
        v105 = 0.0;
        objc_msgSend(v35, "timestamp");
        if ((CV3DSLAMSessionPushJasperPointCloud() & 1) == 0)
        {
          _ARLogTechnique();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            v43 = (objc_class *)objc_opt_class();
            NSStringFromClass(v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf[0].f64[0]) = 138543874;
            *(_QWORD *)((char *)buf[0].f64 + 4) = v44;
            WORD2(buf[0].f64[1]) = 2048;
            *(_QWORD *)((char *)&buf[0].f64[1] + 6) = self;
            HIWORD(buf[1].f64[0]) = 2112;
            buf[1].f64[1] = v105;
            _os_log_impl(&dword_1B3A68000, v42, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error pushing jasper buffer to SLAM: %@", (uint8_t *)buf, 0x20u);

          }
          ARErrorWithCodeAndUserInfo(200, 0);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[ARWorldTrackingTechnique _didFailWithError:](self, "_didFailWithError:", v45);

        }
        if (self->_planeDetectionSession.__ptr_ || self->_raycastSession.__ptr_)
        {
          objc_msgSend(v35, "extrinsicsToWideSensor");
          ARMatrix4x4FromMatrix4x3();
          v96 = v47;
          v97 = v46;
          v94 = v49;
          v95 = v48;
          objc_msgSend(v35, "visionCameraTransform");
          v92 = v51;
          v93 = v50;
          v90 = v53;
          v91 = v52;
          v113.columns[1] = v96;
          v113.columns[0] = v97;
          v113.columns[3] = v94;
          v113.columns[2] = v95;
          v114 = __invert_f4(v113);
          v54 = 0;
          v55 = vmulq_f32((float32x4_t)v114.columns[3], (float32x4_t)vdupq_n_s32(0x3A83126Fu));
          v55.i32[3] = v114.columns[3].i32[3];
          *(_OWORD *)v109 = v93;
          *(_OWORD *)&v109[16] = v92;
          v110 = v91;
          v111 = v90;
          do
          {
            buf[v54 / 0x10] = (float64x2_t)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v114.columns[0], COERCE_FLOAT(*(_OWORD *)&v109[v54])), (float32x4_t)v114.columns[1], *(float32x2_t *)&v109[v54], 1), (float32x4_t)v114.columns[2], *(float32x4_t *)&v109[v54], 2), v55, *(float32x4_t *)&v109[v54], 3);
            v54 += 16;
          }
          while (v54 != 64);
        }
        os_unfair_lock_lock(&self->_surfaceDetectionSessionLock);
        if (self->_planeDetectionSession.__ptr_)
        {
          -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v56, "planeDetection") == 0;

          if (!v57)
          {
            v104 = 0;
            CV3DSLAMSessionCopyJasperCameraCalibration();
            ARMatrix3x3MakeRowMajorTransform(buf[0].f64);
            ptr = self->_planeDetectionSession.__ptr_;
            objc_msgSend(v35, "pointCloud");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "timestamp");
            v89 = v60;
            PlaneDetectionSession::PushJasperPointCloud((uint64_t)ptr, v59);

          }
        }
        os_unfair_lock_unlock(&self->_surfaceDetectionSessionLock);
        os_unfair_lock_lock(&self->_raycastSessionLock);
        if (self->_raycastSession.__ptr_)
        {
          objc_msgSend(v35, "timestamp");
          CV3DRaycastPushJasperPointCloud();
        }
        os_unfair_lock_unlock(&self->_raycastSessionLock);
        CV3DSLAMJasperPointCloudRelease();
LABEL_73:

LABEL_74:
        if (-[ARWorldTrackingTechnique deterministicMode](self, "deterministicMode", v89))
          CV3DSLAMSessionWait();
LABEL_76:
        v87 = v7;
        goto LABEL_77;
      }
      v25 = v7;
      *(_QWORD *)v109 = 0;
      objc_msgSend(v25, "rotationRate");
      objc_msgSend(v25, "rotationRate");
      objc_msgSend(v25, "rotationRate");
      objc_msgSend(v25, "timestamp");
      if ((CV3DSLAMSessionPushGyro() & 1) == 0)
      {
        _ARLogTechnique();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = (objc_class *)objc_opt_class();
          NSStringFromClass(v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = *(void **)v109;
          LODWORD(buf[0].f64[0]) = 138543874;
          *(_QWORD *)((char *)buf[0].f64 + 4) = v28;
          WORD2(buf[0].f64[1]) = 2048;
          *(_QWORD *)((char *)&buf[0].f64[1] + 6) = self;
          HIWORD(buf[1].f64[0]) = 2112;
          buf[1].f64[1] = *(float64_t *)v109;
          _os_log_impl(&dword_1B3A68000, v26, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error pushing gyro data: %@", (uint8_t *)buf, 0x20u);

        }
        ARErrorWithCodeAndUserInfo(200, 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARWorldTrackingTechnique _didFailWithError:](self, "_didFailWithError:", v30);

      }
      objc_msgSend(v25, "rotationRate");
      objc_msgSend(v25, "rotationRate");
      objc_msgSend(v25, "rotationRate");
      objc_msgSend(v25, "timestamp");
      v31 = CV3DPosePredictionPushGyro();
      if (!v31)
        goto LABEL_73;
      _ARLogTechnique();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromCV3DPosePredictionReturn(v31);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf[0].f64[0]) = 138543874;
        *(_QWORD *)((char *)buf[0].f64 + 4) = v33;
        WORD2(buf[0].f64[1]) = 2048;
        *(_QWORD *)((char *)&buf[0].f64[1] + 6) = self;
        HIWORD(buf[1].f64[0]) = 2112;
        *(_QWORD *)&buf[1].f64[1] = v34;
        _os_log_impl(&dword_1B3A68000, v19, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: CV3DPosePredictionPushAccel error: %@", (uint8_t *)buf, 0x20u);

      }
    }

    ARErrorWithCodeAndUserInfo(200, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARWorldTrackingTechnique _didFailWithError:](self, "_didFailWithError:", v23);

    goto LABEL_73;
  }
  v9 = v7;
  -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "alwaysUsePrimaryCameraForTracking");
  if (!v11)
  {
    v24 = 0;
    goto LABEL_49;
  }
  -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageSensorSettingsForUltraWide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v24 = 0;
    goto LABEL_49;
  }
  objc_msgSend(v9, "cameraType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C89FA0]))
  {
    v24 = 1;
LABEL_49:
    v61 = objc_msgSend(v9, "isHighResolution");
    if (v24)
    {

      if ((v11 & 1) == 0)
      {
LABEL_51:

LABEL_54:
        if ((v61 & 1) != 0)
          goto LABEL_77;
        -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "imageSensorSettingsForUltraWide");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        if (v63)
        {
          objc_msgSend(v9, "cameraType");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v64, "isEqualToString:", *MEMORY[0x1E0C89F98]);

          if (v65)
          {
            objc_msgSend(v9, "extrinsicMatrixToDeviceType:", *MEMORY[0x1E0C89FA0]);
            -[ARWorldTrackingTechnique setExtrinsicsToWideSensor:](self, "setExtrinsicsToWideSensor:");
          }
        }
        else
        {

        }
        objc_msgSend(v9, "timestamp");
        kdebug_trace();
        -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "cameraType");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "cameraIdForCaptureDeviceType:", v67);

        objc_msgSend(v9, "timestamp");
        objc_msgSend(v9, "visionData");
        kdebug_trace();
        v108 = 0;
        memset(buf, 0, sizeof(buf));
        objc_msgSend(v9, "cameraIntrinsics");
        objc_msgSend(v9, "ISO", ARMatrix3x3RowMajorArray(buf, v68, v69, v70));
        v105 = v71;
        objc_msgSend(v9, "exposureDuration");
        v104 = v72;
        objc_msgSend(v9, "temperature");
        v103 = v73;
        kdebug_trace();
        kdebug_trace();
        v102 = 0;
        objc_msgSend(v9, "pixelBuffer");
        objc_msgSend(v9, "timestamp");
        v74 = CV3DSLAMCameraFrameCreate();
        v98[0] = MEMORY[0x1E0C809B0];
        v98[1] = 3221225472;
        v99 = __40__ARWorldTrackingTechnique_processData___block_invoke;
        v100 = &__block_descriptor_40_e5_v8__0l;
        v101 = v74;
        if (!v74)
        {
          _ARLogTechnique();
          v75 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
          {
            v76 = (objc_class *)objc_opt_class();
            NSStringFromClass(v76);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v109 = 138543874;
            *(_QWORD *)&v109[4] = v77;
            *(_WORD *)&v109[12] = 2048;
            *(_QWORD *)&v109[14] = self;
            *(_WORD *)&v109[22] = 2112;
            *(_QWORD *)&v109[24] = v102;
            _os_log_impl(&dword_1B3A68000, v75, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create camera frame: %@", v109, 0x20u);

          }
          ARErrorWithCodeAndUserInfo(200, 0);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          -[ARWorldTrackingTechnique _didFailWithError:](self, "_didFailWithError:", v78);

        }
        if (objc_msgSend(v9, "visionData"))
        {
          kdebug_trace();
          objc_msgSend(v9, "visionData");
          if ((CV3DSLAMCameraFrameAddHWFP() & 1) == 0)
          {
            _ARLogTechnique();
            v79 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
            {
              v80 = (objc_class *)objc_opt_class();
              NSStringFromClass(v80);
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v109 = 138543874;
              *(_QWORD *)&v109[4] = v81;
              *(_WORD *)&v109[12] = 2048;
              *(_QWORD *)&v109[14] = self;
              *(_WORD *)&v109[22] = 2112;
              *(_QWORD *)&v109[24] = v102;
              _os_log_impl(&dword_1B3A68000, v79, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not add HWFP: %@", v109, 0x20u);

            }
            ARErrorWithCodeAndUserInfo(200, 0);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARWorldTrackingTechnique _didFailWithError:](self, "_didFailWithError:", v82);

          }
        }
        if ((CV3DSLAMSessionPushCamera() & 1) == 0)
        {
          _ARLogTechnique();
          v83 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
          {
            v84 = (objc_class *)objc_opt_class();
            NSStringFromClass(v84);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v109 = 138543874;
            *(_QWORD *)&v109[4] = v85;
            *(_WORD *)&v109[12] = 2048;
            *(_QWORD *)&v109[14] = self;
            *(_WORD *)&v109[22] = 2112;
            *(_QWORD *)&v109[24] = 0;
            _os_log_impl(&dword_1B3A68000, v83, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Pushing camera failed: %@", v109, 0x20u);

          }
          ARErrorWithCodeAndUserInfo(200, 0);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          -[ARWorldTrackingTechnique _didFailWithError:](self, "_didFailWithError:", v86);

        }
        kdebug_trace();
        ((void (*)(_QWORD *))v99)(v98);
        goto LABEL_73;
      }
    }
    else if (!v11)
    {
      goto LABEL_51;
    }

    goto LABEL_54;
  }

LABEL_77:
  return v7;
}

uint64_t __40__ARWorldTrackingTechnique_processData___block_invoke()
{
  return CV3DSLAMCameraFrameRelease();
}

- (id)predictedResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v6;
  ARWorldTrackingPoseData *cachedPoseData;
  void *v8;
  uint64_t v9;
  ARWorldTrackingPoseData *v10;
  int v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  ARWorldTrackingPoseData *v34;
  _BYTE buf[12];
  __int16 buf_12;
  _BYTE buf_14[10];
  int v38;
  __int16 v39;
  double v40[2];
  double v41[3];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  cachedPoseData = self->_cachedPoseData;
  if (cachedPoseData
    && (-[ARWorldTrackingPoseData worldTrackingState](cachedPoseData, "worldTrackingState"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "state"),
        v8,
        v9))
  {
    v10 = (ARWorldTrackingPoseData *)-[ARWorldTrackingPoseData copy](self->_cachedPoseData, "copy");
    if (!v10)
      v10 = -[ARWorldTrackingPoseData initWithTimestamp:]([ARWorldTrackingPoseData alloc], "initWithTimestamp:", a3);
    v11 = -[ARWorldTrackingTechnique _updatePoseData:forTimeStamp:updateTrackingState:](self, "_updatePoseData:forTimeStamp:updateTrackingState:", v10, 0, a3);
    if (v11)
    {
      _ARLogTechnique();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v14;
        buf_12 = 2048;
        *(_QWORD *)buf_14 = self;
        *(_WORD *)&buf_14[8] = 1024;
        v38 = v11;
        v39 = 2048;
        v40[0] = a3;
        _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to predict pose [%i] for timestamp %f", buf, 0x26u);

      }
      v15 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_msgSend(v6, "imageData");
      v12 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject cameraPosition](v12, "cameraPosition") == 2)
      {
        -[ARWorldTrackingPoseData cameraTransform](v10, "cameraTransform");
        v28 = v17;
        v29 = v16;
        v26 = v19;
        v27 = v18;
        *(double *)&v20 = ARFrontFacingCameraFlip();
        v21 = 0;
        v30 = v20;
        v31 = v22;
        v32 = v23;
        v33 = v24;
        do
        {
          *(float32x4_t *)&buf[v21] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(*(__int128 *)((char *)&v30 + v21))), v28, *(float32x2_t *)((char *)&v30 + v21), 1), v27, *(float32x4_t *)((char *)&v30 + v21), 2), v26, *(float32x4_t *)((char *)&v30 + v21), 3);
          v21 += 16;
        }
        while (v21 != 64);
        -[ARWorldTrackingPoseData setCameraTransform:](v10, "setCameraTransform:", *(double *)buf, *(double *)&buf_14[2], *(double *)((char *)v40 + 2), v41[0]);
      }
      v34 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1, *(_OWORD *)&v26, *(_OWORD *)&v27, *(_OWORD *)&v28, *(_OWORD *)&v29, v30, v31, v32, v33);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v15 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v15;
}

- (void)mergeResultData:(id)a3 intoData:(id)a4 context:(id)a5
{
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  char v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id obj;
  id v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  i = (uint64_t)a3;
  v39 = a4;
  v38 = a5;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = (id)i;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  v9 = 0;
  if (!v8)
  {
    v41 = 0;
    v43 = 0;
    v46 = 0;
    goto LABEL_18;
  }
  v41 = 0;
  v43 = 0;
  v46 = 0;
  v10 = *(_QWORD *)v52;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v52 != v10)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v46;
        v13 = v9;
        v46 = v11;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v43;
          v13 = v9;
          v43 = v11;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = v41;
            v13 = v9;
            v41 = v11;
          }
          else
          {
            objc_opt_class();
            v12 = v9;
            v13 = v11;
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
          }
        }
      }
      v14 = v11;

      v9 = v13;
    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  }
  while (v8);
LABEL_18:

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = v39;
  v15 = 0;
  v16 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v16)
  {
    v42 = 0;
    v40 = 0;
    v17 = 0;
    i = *(_QWORD *)v48;
    while (1)
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v48 != i)
          objc_enumerationMutation(v45);
        v19 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v18);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = v15;
          v15 = v19;
LABEL_29:
          v21 = v17;
LABEL_30:
          v22 = v19;

          v17 = v21;
          goto LABEL_31;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = v42;
          v42 = v19;
          goto LABEL_29;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = v40;
          v40 = v19;
          goto LABEL_29;
        }
        objc_opt_class();
        v20 = v17;
        v21 = v19;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_30;
LABEL_31:
        ++v18;
      }
      while (v16 != v18);
      v23 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      v16 = v23;
      if (!v23)
        goto LABEL_38;
    }
  }
  v42 = 0;
  v40 = 0;
  v17 = 0;
LABEL_38:

  objc_msgSend(v15, "worldTrackingState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "majorRelocalization");
  if ((v25 & 1) != 0)
  {
    v26 = 1;
  }
  else
  {
    objc_msgSend(v46, "worldTrackingState");
    i = objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend((id)i, "majorRelocalization");
  }
  objc_msgSend(v15, "worldTrackingState");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setMajorRelocalization:", v26);

  if ((v25 & 1) == 0)
  objc_msgSend(v15, "worldTrackingState");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "minorRelocalization");
  if ((v29 & 1) != 0)
  {
    v30 = 1;
  }
  else
  {
    objc_msgSend(v46, "worldTrackingState");
    i = objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend((id)i, "minorRelocalization");
  }
  objc_msgSend(v15, "worldTrackingState");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setMinorRelocalization:", v30);

  if ((v29 & 1) == 0)
  objc_msgSend(v15, "worldTrackingState");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "poseGraphUpdated");
  if ((v33 & 1) != 0)
  {
    v34 = 1;
  }
  else
  {
    objc_msgSend(v46, "worldTrackingState");
    i = objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend((id)i, "poseGraphUpdated");
  }
  objc_msgSend(v15, "worldTrackingState");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setPoseGraphUpdated:", v34);

  if ((v33 & 1) == 0)
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = v45;
    v37 = v36;
    if (v43 && !v42)
      objc_msgSend(v36, "addObject:", v43);
    if (v41 && !v40)
      objc_msgSend(v37, "addObject:", v41);
    if (v9 && !v17)
      objc_msgSend(v37, "addObject:", v9);

  }
}

- (void)prepareResultData:(id)a3 forContext:(id)a4
{
  void *v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  int v16;
  double v17;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  id v25;
  _OWORD v26[4];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  v25 = a4;
  objc_msgSend(a3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v25, "cameraPosition") == 2)
    {
      objc_msgSend(v5, "cameraTransform");
      v23 = v7;
      v24 = v6;
      v21 = v9;
      v22 = v8;
      *(double *)&v10 = ARFrontFacingCameraFlip();
      v11 = 0;
      v26[0] = v10;
      v26[1] = v12;
      v26[2] = v13;
      v26[3] = v14;
      do
      {
        *(__int128 *)((char *)&v27 + v11 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v24, COERCE_FLOAT(v26[v11])), v23, *(float32x2_t *)&v26[v11], 1), v22, (float32x4_t)v26[v11], 2), v21, (float32x4_t)v26[v11], 3);
        ++v11;
      }
      while (v11 != 4);
      objc_msgSend(v5, "setCameraTransform:", *(double *)&v27, *(double *)&v28, *(double *)&v29, *(double *)&v30);
    }
    objc_msgSend(v25, "imageData", *(_OWORD *)&v21, *(_OWORD *)&v22, *(_OWORD *)&v23, *(_OWORD *)&v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isMirrored");

    if (v16)
    {
      objc_msgSend(v5, "cameraTransform");
      objc_msgSend(v5, "setCameraTransform:", ARMatrix4x4MirrorX(v17, v18, v19, v20));
    }
  }

}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *resultDataQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  objc_super v23;
  _QWORD block[4];
  id v25;
  id v26;
  ARWorldTrackingTechnique *v27;
  id v28;
  id v29;

  v22 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_resultDataQueue);
  -[ARWorldTrackingTechnique _pushWTResultDataForTimestamp:](self, "_pushWTResultDataForTimestamp:", a3);
  objc_msgSend(v22, "resultDataOfClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "resultDataOfClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ar_firstObjectPassingTest:", &__block_literal_global_92_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "resultDataOfClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ar_firstObjectPassingTest:", &__block_literal_global_95);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resultDataOfClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v12;
  objc_msgSend(v12, "ar_firstObjectPassingTest:", &__block_literal_global_96);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resultDataOfClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  resultDataQueue = self->_resultDataQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke_4;
  block[3] = &unk_1E6673AA0;
  v17 = v13;
  v25 = v17;
  v18 = v9;
  v26 = v18;
  v27 = self;
  v19 = v15;
  v28 = v19;
  v20 = v11;
  v29 = v20;
  dispatch_sync(resultDataQueue, block);
  v23.receiver = self;
  v23.super_class = (Class)ARWorldTrackingTechnique;
  -[ARImageBasedTechnique requestResultDataAtTimestamp:context:](&v23, sel_requestResultDataAtTimestamp_context_, v22, a3);

}

BOOL __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;

  v5 = objc_msgSend(a2, "source");
  if (v5 == 2)
    *a4 = 1;
  return v5 == 2;
}

BOOL __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;

  v5 = objc_msgSend(a2, "source");
  if (v5 == 1)
    *a4 = 1;
  return v5 == 1;
}

BOOL __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;

  v5 = objc_msgSend(a2, "source");
  if (v5 == 2)
    *a4 = 1;
  return v5 == 2;
}

CVPixelBufferRef __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke_4(uint64_t a1)
{
  void *v2;
  CVPixelBufferPoolRef *v3;
  __CVBuffer *v4;
  __CVBuffer *v5;
  double Width;
  double Height;
  OSType PixelFormatType;
  CVPixelBufferRef result;
  CVPixelBufferRef v10;
  uint64_t v11;
  uint64_t v12;
  __CVBuffer *v13;
  __CVBuffer *v14;
  double v15;
  double v16;
  OSType v17;
  CVPixelBufferRef v18;
  CVPixelBufferRef v19;
  uint64_t v20;
  uint64_t v21;
  __CVBuffer *v22;
  __CVBuffer *v23;
  double v24;
  double v25;
  OSType v26;
  CVPixelBufferRef v27;
  CVPixelBufferRef v28;
  uint64_t v29;
  __CVBuffer *v30;
  __CVBuffer *v31;
  double v32;
  double v33;
  OSType v34;
  CVPixelBufferRef v35;
  CVPixelBufferRef v36;
  char v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void (**v46)(_QWORD, _QWORD);
  void *v47;
  BOOL v48;
  void *v49;
  char v50;
  void *v51;
  _QWORD v52[5];
  _QWORD v53[2];
  void (*v54)(uint64_t);
  void *v55;
  CVPixelBufferRef v56;
  _QWORD v57[2];
  void (*v58)(uint64_t);
  void *v59;
  CVPixelBufferRef v60;
  _QWORD v61[2];
  void (*v62)(uint64_t);
  void *v63;
  CVPixelBufferRef v64;
  simd_float4x4 v65;

  v2 = *(void **)(a1 + 32);
  if (v2
    && objc_msgSend(v2, "segmentationBuffer")
    && objc_msgSend(*(id *)(a1 + 40), "singleFrameDepthBuffer")
    && ARDeviceSupportsJasper())
  {
    v3 = (CVPixelBufferPoolRef *)(*(_QWORD *)(a1 + 48) + 464);
    v4 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 40), "singleFrameDepthBuffer");
    if (v4)
    {
      v5 = v4;
      Width = (double)CVPixelBufferGetWidth(v4);
      Height = (double)CVPixelBufferGetHeight(v5);
    }
    else
    {
      Width = *MEMORY[0x1E0C9D820];
      Height = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(*(id *)(a1 + 32), "segmentationBuffer"));
    result = ARCreateCVPixelBufferFromPool(v3, PixelFormatType, *(void **)(a1 + 48), CFSTR("segmentation annotated depth"), Width, Height);
    if (!result)
      return result;
    v10 = result;
    v11 = MEMORY[0x1E0C809B0];
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v62 = __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke_5;
    v63 = &__block_descriptor_40_e5_v8__0l;
    v64 = result;
    v12 = *(_QWORD *)(a1 + 48);
    v13 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 40), "singleFrameDepthBuffer");
    v14 = v13;
    if (v13)
    {
      v15 = (double)CVPixelBufferGetWidth(v13);
      v16 = (double)CVPixelBufferGetHeight(v14);
    }
    else
    {
      v15 = *MEMORY[0x1E0C9D820];
      v16 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    v17 = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(*(id *)(a1 + 32), "confidenceBuffer"));
    v18 = ARCreateCVPixelBufferFromPool((CVPixelBufferPoolRef *)(v12 + 480), v17, *(void **)(a1 + 48), CFSTR("confidence annotated depth"), v15, v16);
    v19 = v18;
    if (!v18)
      return (CVPixelBufferRef)((uint64_t (*)(_QWORD *))v62)(v61);
    v57[0] = v11;
    v57[1] = 3221225472;
    v58 = __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke_6;
    v59 = &__block_descriptor_40_e5_v8__0l;
    v60 = v18;
    v20 = objc_msgSend(*(id *)(a1 + 32), "uncertaintyBuffer");
    v21 = *(_QWORD *)(a1 + 48);
    if (v20)
    {
      v22 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 40), "singleFrameDepthBuffer");
      v23 = v22;
      if (v22)
      {
        v24 = (double)CVPixelBufferGetWidth(v22);
        v25 = (double)CVPixelBufferGetHeight(v23);
      }
      else
      {
        v24 = *MEMORY[0x1E0C9D820];
        v25 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      }
      v26 = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(*(id *)(a1 + 32), "uncertaintyBuffer"));
      v27 = ARCreateCVPixelBufferFromPool((CVPixelBufferPoolRef *)(v21 + 472), v26, *(void **)(a1 + 48), CFSTR("uncertainty annotated depth"), v24, v25);
      v28 = v27;
      if (!v27)
        goto LABEL_27;
      v53[0] = v11;
      v53[1] = 3221225472;
      v54 = __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke_7;
      v55 = &__block_descriptor_40_e5_v8__0l;
      v56 = v27;
      v29 = *(_QWORD *)(a1 + 48);
      v30 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 40), "singleFrameDepthBuffer");
      v31 = v30;
      if (v30)
      {
        v32 = (double)CVPixelBufferGetWidth(v30);
        v33 = (double)CVPixelBufferGetHeight(v31);
      }
      else
      {
        v32 = *MEMORY[0x1E0C9D820];
        v33 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      }
      v34 = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(*(id *)(a1 + 32), "segmentationBuffer"));
      v35 = ARCreateCVPixelBufferFromPool((CVPixelBufferPoolRef *)(v29 + 488), v34, *(void **)(a1 + 48), CFSTR("uncertainty masked segmentation buffer"), v32, v33);
      v36 = v35;
      if (v35)
      {
        v52[0] = v11;
        v52[1] = 3221225472;
        v52[2] = __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke_8;
        v52[3] = &__block_descriptor_40_e5_v8__0l;
        v52[4] = v35;
        objc_msgSend(*(id *)(a1 + 48), "annotateDepth:withSemantics:toTargetSemanticsImage:targetConfidenceBuffer:targetUncertaintyBuffer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v10, v19, v28);
        objc_msgSend(*(id *)(a1 + 32), "setSemanticsSampledForDepth:", v10);
        objc_msgSend(*(id *)(a1 + 32), "setConfidenceSampledForDepth:", v19);
        objc_msgSend(*(id *)(a1 + 32), "setUncertaintySampledForDepth:", v28);
        +[ARSISemanticSegmentationTechnique createUncertaintyMaskedSegmentationBuffer:fromSegmentationBuffer:uncertaintyBuffer:maskValue:](ARSISemanticSegmentationTechnique, "createUncertaintyMaskedSegmentationBuffer:fromSegmentationBuffer:uncertaintyBuffer:maskValue:", v36, v10, v28, 255);
        __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke_8((uint64_t)v52);
      }
      v54((uint64_t)v53);
      if (!v36)
      {
LABEL_27:
        v37 = 0;
LABEL_28:
        v58((uint64_t)v57);
        result = (CVPixelBufferRef)((uint64_t (*)(_QWORD *))v62)(v61);
        if ((v37 & 1) == 0)
          return result;
        goto LABEL_29;
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "annotateDepth:withSemantics:toTargetSemanticsImage:targetConfidenceBuffer:targetUncertaintyBuffer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v10, v19, 0);
      objc_msgSend(*(id *)(a1 + 32), "setSemanticsSampledForDepth:", v10);
      objc_msgSend(*(id *)(a1 + 32), "setConfidenceSampledForDepth:", v19);
    }
    objc_msgSend(*(id *)(a1 + 32), "setMaskedSemanticsSampledForDepth:", v10);
    v37 = 1;
    goto LABEL_28;
  }
LABEL_29:
  if (*(_QWORD *)(a1 + 56) && *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 48), "mutableOptions");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v38, "planeDetection"))
    {
      objc_msgSend(*(id *)(a1 + 48), "mutableOptions");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "mlModelEnabled");

      if (v40)
      {
        os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 152));
        v41 = *(_QWORD *)(a1 + 40);
        v42 = *(void **)(a1 + 48);
        if (v41)
          objc_msgSend(v42, "pushToSceneUnderstandingDepth:segmentation:pose:", v41, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
        else
          objc_msgSend(v42, "pushToSceneUnderstandingSegmentation:pose:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
        objc_msgSend(*(id *)(a1 + 48), "mutableOptions");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "planeDetectionVIOPoseCallback");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (v44)
        {
          objc_msgSend(*(id *)(a1 + 48), "mutableOptions");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "planeDetectionVIOPoseCallback");
          v46 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v46[2](v46, *(_QWORD *)(a1 + 56));

        }
        os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 152));
      }
    }
    else
    {

    }
  }
  if (*(_QWORD *)(a1 + 40) && *(_QWORD *)(a1 + 56))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 156));
    objc_msgSend(*(id *)(a1 + 48), "pushToHitTestingDepth:pose:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 156));
  }
  if (ARDeviceSupportsJasper())
  {
    objc_msgSend(*(id *)(a1 + 48), "mutableOptions");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "sceneReconstruction") == 0;

  }
  else
  {
    v48 = 1;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    v49 = *(void **)(a1 + 56);
    if (v49)
    {
      if (*(_QWORD *)(a1 + 32))
        v50 = v48;
      else
        v50 = 1;
      if ((v50 & 1) == 0)
      {
        objc_msgSend(v49, "visionCameraTransform");
        *(simd_float4x4 *)(*(_QWORD *)(a1 + 48) + 704) = __invert_f4(v65);
        objc_msgSend(*(id *)(a1 + 48), "sceneReconstructionHandler");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "pushDepth:semanticSegmentation:personSegmentation:pose:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));

      }
    }
  }
  result = (CVPixelBufferRef)objc_msgSend(*(id *)(a1 + 48), "deterministicMode");
  if ((_DWORD)result)
    return (CVPixelBufferRef)CV3DSLAMSessionWait();
  return result;
}

void __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke_5(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke_6(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke_7(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke_8(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3
{
  return (Class)objc_opt_class() == a3 || (Class)objc_opt_class() == a3 || objc_opt_class() == (_QWORD)a3;
}

- (void)annotateDepth:(id)a3 withSemantics:(id)a4 toTargetSemanticsImage:(__CVBuffer *)a5 targetConfidenceBuffer:(__CVBuffer *)a6 targetUncertaintyBuffer:(__CVBuffer *)a7
{
  -[ARWorldTrackingTechnique annotateDepth:withSemantics:toTargetSemanticsImage:targetConfidenceBuffer:targetUncertaintyBuffer:useGpu:](self, "annotateDepth:withSemantics:toTargetSemanticsImage:targetConfidenceBuffer:targetUncertaintyBuffer:useGpu:", a3, a4, a5, a6, a7, 1);
}

- (void)annotateDepth:(id)a3 withSemantics:(id)a4 toTargetSemanticsImage:(__CVBuffer *)a5 targetConfidenceBuffer:(__CVBuffer *)a6 targetUncertaintyBuffer:(__CVBuffer *)a7 useGpu:(BOOL)a8
{
  _BOOL4 v8;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  void *v22;
  float v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __CVBuffer *v31;
  __CVBuffer *v32;
  size_t Width;
  size_t Height;
  double v35;
  double v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  void *v40;
  float v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  simd_float3 v47;
  simd_float3 v48;
  simd_float3 v49;
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
  size_t BytesPerRow;
  size_t v63;
  size_t v64;
  size_t v65;
  float *BaseAddress;
  _BYTE *v67;
  char *v68;
  char *v69;
  _BYTE *v70;
  char *v71;
  char *v72;
  char *v73;
  double v74;
  unint64_t v75;
  unint64_t v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  unint64_t v81;
  unsigned int v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  float32x4_t v91;
  void *v92;
  float32x4_t v93;
  double v94;
  double v95;
  simd_float3 v96;
  void *v97;
  CVPixelBufferRef pixelBuffera;
  float32x4_t v101;
  double v102;
  double v103;
  simd_float3 v104;
  void *v105;
  float32x4_t v106;
  float v107;
  float v108;
  simd_float3 v109;
  void *v110;
  id v112;
  id v113;
  _QWORD v114[3];
  _QWORD v115[3];
  _QWORD v116[3];
  _QWORD v117[3];
  float32x4_t v118;
  float32x4_t v119;
  float32x4_t v120;
  float32x4_t v121;
  float32x4_t v122;
  float32x4_t v123;
  float32x4_t v124;
  float32x4_t v125;
  float32x4_t v126;
  float32x4_t v127;
  simd_float3x3 v128;
  simd_float3x3 v129;

  v8 = a8;
  v112 = a3;
  v113 = a4;
  objc_msgSend(v113, "sourceImageData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timestamp");
  objc_msgSend(v112, "sourceImageData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timestamp");
  kdebug_trace();

  objc_msgSend(v112, "depthBufferSize");
  v14 = v13;
  v16 = v15;
  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  objc_msgSend(v112, "sourceImageData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "extrinsicMatrixToDeviceType:", *MEMORY[0x1E0C89F98]);
  v91 = v19;
  v93 = v18;
  v101 = v21;
  v106 = v20;

  v118 = v93;
  v119 = v91;
  v120 = v106;
  v121 = vdivq_f32(v101, (float32x4_t)vdupq_n_s32(0x447A0000u));
  objc_msgSend(v113, "sourceImageData");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "cameraIntrinsics");
  v102 = v24;
  v107 = v23;
  v94 = v25;
  objc_msgSend(v113, "sourceImageData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "imageResolution");
  v28 = v27;
  v30 = v29;
  v31 = (__CVBuffer *)objc_msgSend(v113, "segmentationBuffer");
  v32 = v31;
  if (v31)
  {
    Width = CVPixelBufferGetWidth(v31);
    Height = CVPixelBufferGetHeight(v32);
    v35 = (double)Width;
    v36 = (double)Height;
  }
  else
  {
    v35 = *MEMORY[0x1E0C9D820];
    v36 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v37.f32[0] = ARAdjustIntrinsicsForViewportSize(v107, v102, v94, v28, v30, v35, v36);
  v122 = v37;
  v123 = v38;
  v124 = v39;

  objc_msgSend(v112, "sourceImageData");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "cameraIntrinsics");
  v103 = v42;
  v108 = v41;
  v95 = v43;
  objc_msgSend(v112, "sourceImageData");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "imageResolution");
  v47.f32[0] = ARAdjustIntrinsicsForViewportSize(v108, v103, v95, v45, v46, v14, v16);
  v104 = v48;
  v109 = v47;
  v96 = v49;

  objc_msgSend(v112, "sourceImageData");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "cameraType");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "sourceImageData");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "cameraType");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "cameraIdForCaptureDeviceType:", v54);

  }
  kdebug_trace();
  kdebug_trace();
  CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v113, "segmentationBuffer"));
  CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v113, "segmentationBuffer"));
  kdebug_trace();
  kdebug_trace();
  kdebug_trace();
  kdebug_trace();
  kdebug_trace();
  kdebug_trace();
  v128.columns[2] = v104;
  v128.columns[0] = v109;
  v128.columns[0].i32[3] = 0;
  v128.columns[1] = v96;
  v128.columns[1].i32[3] = 0;
  v128.columns[2].i32[3] = 0;
  v129 = __invert_f3(v128);
  v125 = (float32x4_t)v129.columns[0];
  v126 = (float32x4_t)v129.columns[1];
  v127 = (float32x4_t)v129.columns[2];
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 55, (unint64_t)v14, (unint64_t)v16, 0);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = (void *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_sharedMetalDevice, "newTextureWithDescriptor:iosurface:plane:", v85, CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(v112, "depthBuffer")), 0);
    objc_msgSend(v92, "setLabel:", CFSTR("depthTexture"));
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 13, (unint64_t)v14, (unint64_t)v16, 0);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = (void *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_sharedMetalDevice, "newTextureWithDescriptor:iosurface:plane:", v105, CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(v113, "segmentationBuffer")), 0);
    objc_msgSend(v110, "setLabel:", CFSTR("semanticsTexture"));
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 55, (unint64_t)v14, (unint64_t)v16, 0);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = (void *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_sharedMetalDevice, "newTextureWithDescriptor:iosurface:plane:", v97, CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(v113, "confidenceBuffer")), 0);
    objc_msgSend(v110, "setLabel:", CFSTR("confidenceTexture"));
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 13, (unint64_t)v14, (unint64_t)v16, 0);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setUsage:", 3);
    v88 = (void *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_sharedMetalDevice, "newTextureWithDescriptor:iosurface:plane:", v90, CVPixelBufferGetIOSurface(a5), 0);
    objc_msgSend(v88, "setLabel:", CFSTR("targetSemanticsTexture"));
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 55, (unint64_t)v14, (unint64_t)v16, 0);
    pixelBuffera = (CVPixelBufferRef)objc_claimAutoreleasedReturnValue();
    -[__CVBuffer setUsage:](pixelBuffera, "setUsage:", 3);
    v86 = (void *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_sharedMetalDevice, "newTextureWithDescriptor:iosurface:plane:", pixelBuffera, CVPixelBufferGetIOSurface(a6), 0);
    objc_msgSend(v86, "setLabel:", CFSTR("targetConfidenceTexture"));
    v87 = (void *)-[MTLDevice newBufferWithBytes:length:options:](self->_sharedMetalDevice, "newBufferWithBytes:length:options:", &v118, 160, 0);
    v55 = (void *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_sharedMetalDevice, "newComputePipelineStateWithFunction:error:", self->_annotateDepthDataKernelFunction, 0);
    if (a7)
    {
      objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 55, (unint64_t)v14, (unint64_t)v16, 0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = (void *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_sharedMetalDevice, "newTextureWithDescriptor:iosurface:plane:", v56, CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(v113, "uncertaintyBuffer")), 0);
      objc_msgSend(v110, "setLabel:", CFSTR("uncertaintyTexture"));
      objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 55, (unint64_t)v14, (unint64_t)v16, 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setUsage:", 3);
      v58 = (void *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_sharedMetalDevice, "newTextureWithDescriptor:iosurface:plane:", v57, CVPixelBufferGetIOSurface(a7), 0);
      v59 = v110;
      objc_msgSend(v58, "setLabel:", CFSTR("targetUncertaintyTexture"));
      -[MTLCommandQueue commandBuffer](self->_spatialMappingCommandQueue, "commandBuffer");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "computeCommandEncoder");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setComputePipelineState:", v55);
      objc_msgSend(v61, "setBuffer:offset:atIndex:", v87, 0, 0);
      objc_msgSend(v61, "setTexture:atIndex:", v92, 1);
      objc_msgSend(v61, "setTexture:atIndex:", v110, 2);
      objc_msgSend(v61, "setTexture:atIndex:", v89, 3);
      objc_msgSend(v61, "setTexture:atIndex:", v88, 5);
      objc_msgSend(v61, "setTexture:atIndex:", v86, 6);
      objc_msgSend(v61, "setTexture:atIndex:", v84, 4);
      objc_msgSend(v61, "setTexture:atIndex:", v58, 7);
      v117[0] = (unint64_t)v14;
      v117[1] = (unint64_t)v16;
      v117[2] = 1;
      v116[0] = objc_msgSend(v55, "threadExecutionWidth");
      v116[1] = (unint64_t)objc_msgSend(v55, "maxTotalThreadsPerThreadgroup") / v116[0];
      v116[2] = 1;
      objc_msgSend(v61, "dispatchThreads:threadsPerThreadgroup:", v117, v116);
      objc_msgSend(v61, "endEncoding");

      objc_msgSend(v60, "commit");
      objc_msgSend(v60, "waitUntilCompleted");

    }
    else
    {
      -[MTLCommandQueue commandBuffer](self->_spatialMappingCommandQueue, "commandBuffer");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v110;
      objc_msgSend(v56, "computeCommandEncoder");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "setComputePipelineState:", v55);
      objc_msgSend(v83, "setBuffer:offset:atIndex:", v87, 0, 0);
      objc_msgSend(v83, "setTexture:atIndex:", v92, 1);
      objc_msgSend(v83, "setTexture:atIndex:", v110, 2);
      objc_msgSend(v83, "setTexture:atIndex:", v89, 3);
      objc_msgSend(v83, "setTexture:atIndex:", v88, 5);
      objc_msgSend(v83, "setTexture:atIndex:", v86, 6);
      v115[0] = (unint64_t)v14;
      v115[1] = (unint64_t)v16;
      v115[2] = 1;
      v114[0] = objc_msgSend(v55, "threadExecutionWidth");
      v114[1] = (unint64_t)objc_msgSend(v55, "maxTotalThreadsPerThreadgroup") / v114[0];
      v114[2] = 1;
      objc_msgSend(v83, "dispatchThreads:threadsPerThreadgroup:", v115, v114);
      objc_msgSend(v83, "endEncoding");

      objc_msgSend(v56, "commit");
      objc_msgSend(v56, "waitUntilCompleted");
    }

  }
  else
  {
    BytesPerRow = CVPixelBufferGetBytesPerRow((CVPixelBufferRef)objc_msgSend(v112, "depthBuffer"));
    v63 = CVPixelBufferGetBytesPerRow((CVPixelBufferRef)objc_msgSend(v113, "segmentationBuffer"));
    v64 = CVPixelBufferGetBytesPerRow((CVPixelBufferRef)objc_msgSend(v113, "confidenceBuffer"));
    v65 = CVPixelBufferGetBytesPerRow((CVPixelBufferRef)objc_msgSend(v113, "uncertaintyBuffer"));
    CVPixelBufferLockBaseAddress((CVPixelBufferRef)objc_msgSend(v113, "segmentationBuffer"), 1uLL);
    CVPixelBufferLockBaseAddress((CVPixelBufferRef)objc_msgSend(v113, "confidenceBuffer"), 1uLL);
    CVPixelBufferLockBaseAddress((CVPixelBufferRef)objc_msgSend(v113, "uncertaintyBuffer"), 1uLL);
    CVPixelBufferLockBaseAddress((CVPixelBufferRef)objc_msgSend(v112, "depthBuffer"), 1uLL);
    CVPixelBufferLockBaseAddress(a5, 0);
    CVPixelBufferLockBaseAddress(a6, 0);
    CVPixelBufferLockBaseAddress(a7, 0);
    BaseAddress = (float *)CVPixelBufferGetBaseAddress((CVPixelBufferRef)objc_msgSend(v112, "depthBuffer"));
    v67 = CVPixelBufferGetBaseAddress((CVPixelBufferRef)objc_msgSend(v113, "segmentationBuffer"));
    v68 = (char *)CVPixelBufferGetBaseAddress((CVPixelBufferRef)objc_msgSend(v113, "confidenceBuffer"));
    v69 = (char *)CVPixelBufferGetBaseAddress((CVPixelBufferRef)objc_msgSend(v113, "uncertaintyBuffer"));
    v70 = CVPixelBufferGetBaseAddress(a5);
    v71 = (char *)CVPixelBufferGetBaseAddress(a6);
    v72 = (char *)CVPixelBufferGetBaseAddress(a7);
    if (v16 > 0.0)
    {
      v75 = 0;
      do
      {
        if (v14 > 0.0)
        {
          v76 = 0;
          *(float *)&v74 = (float)v75;
          v77 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v74, 0);
          do
          {
            v78 = vmulq_n_f32(vaddq_f32(v127, vmlaq_f32(vmulq_n_f32(v125, (float)v76), v77, v126)), BaseAddress[v76]);
            v79 = vaddq_f32(v121, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v118, v78.f32[0]), v119, *(float32x2_t *)v78.f32, 1), v120, v78, 2));
            v80 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v122, v79.f32[0]), v123, *(float32x2_t *)v79.f32, 1), v124, v79, 2);
            v81 = vdivq_f32(v80, (float32x4_t)vdupq_laneq_s32((int32x4_t)v80, 2)).u64[0];
            LODWORD(v73) = llroundf(*((float *)&v81 + 1));
            if (v73 <= 0xBF)
            {
              v82 = llroundf(*(float *)&v81);
              if ((v82 & 0x80000000) == 0 && (int)v82 <= 255)
              {
                v70[v76] = v67[v63 * (_QWORD)v73 + v82];
                *(_DWORD *)&v71[4 * v76] = *(_DWORD *)&v68[4 * v82 + v64 * (_QWORD)v73];
                v73 = &v69[v65 * (_QWORD)v73];
                *(_DWORD *)&v72[4 * v76] = *(_DWORD *)&v73[4 * v82];
              }
            }
            ++v76;
          }
          while (v14 > (double)v76);
        }
        v74 = (double)++v75;
        v70 += v63;
        BaseAddress = (float *)((char *)BaseAddress + BytesPerRow);
        v71 += v64;
        v72 += v65;
      }
      while (v16 > (double)v75);
    }
    CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)objc_msgSend(v112, "depthBuffer"), 1uLL);
    CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)objc_msgSend(v113, "segmentationBuffer"), 1uLL);
    CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)objc_msgSend(v113, "confidenceBuffer"), 1uLL);
    CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)objc_msgSend(v113, "uncertaintyBuffer"), 1uLL);
    CVPixelBufferUnlockBaseAddress(a5, 0);
    CVPixelBufferUnlockBaseAddress(a6, 0);
  }
  CVPixelBufferGetWidth(a6);
  CVPixelBufferGetHeight(a6);
  kdebug_trace();
  kdebug_trace();

}

- (void)pushToSceneUnderstandingSegmentation:(id)a3 pose:(id)a4
{
  id v6;
  __CVBuffer *v7;
  __CVBuffer *v8;
  double Width;
  double Height;
  void *v11;
  float v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  simd_float3 v18;
  simd_float3 v19;
  simd_float3 v20;
  PlaneDetectionSession *ptr;
  simd_float4 v22;
  simd_float4 v23;
  simd_float4 v24;
  simd_float4 v25;
  double v26;
  double v27;
  simd_float4 v28;
  simd_float4 v29;
  simd_float4 v30;
  simd_float4 v31;
  double v32;
  simd_float3 v33;
  double v34;
  simd_float3 v35;
  float v36;
  simd_float3 v37;
  ARSegmentationData *v38;
  simd_float3x3 v39;
  simd_float4x4 v40;

  v38 = (ARSegmentationData *)a3;
  v6 = a4;
  if (self->_planeDetectionSession.__ptr_ && -[ARSegmentationData normalsBuffer](v38, "normalsBuffer"))
  {
    kdebug_trace();
    v7 = -[ARSegmentationData segmentationBuffer](v38, "segmentationBuffer");
    v8 = v7;
    if (v7)
    {
      Width = (double)CVPixelBufferGetWidth(v7);
      Height = (double)CVPixelBufferGetHeight(v8);
    }
    else
    {
      Width = *MEMORY[0x1E0C9D820];
      Height = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    -[ARSegmentationData sourceImageData](v38, "sourceImageData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cameraIntrinsics");
    v34 = v13;
    v36 = v12;
    v32 = v14;
    -[ARSegmentationData sourceImageData](v38, "sourceImageData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageResolution");
    v18.f32[0] = ARAdjustIntrinsicsForViewportSize(v36, v34, v32, v16, v17, Width, Height);
    v35 = v19;
    v37 = v18;
    v33 = v20;

    ptr = self->_planeDetectionSession.__ptr_;
    objc_msgSend(v6, "visionCameraTransform");
    v30 = v23;
    v31 = v22;
    v28 = v25;
    v29 = v24;
    -[ARSegmentationData timestamp](v38, "timestamp");
    v27 = v26;
    v39.columns[1] = v35;
    v39.columns[0] = v37;
    v39.columns[0].i32[3] = 0;
    v39.columns[1].i32[3] = 0;
    v40.columns[0] = v31;
    v39.columns[2] = v33;
    v39.columns[2].i32[3] = 0;
    v40.columns[2] = v29;
    v40.columns[1] = v30;
    v40.columns[3] = v28;
    PlaneDetectionSession::PushSemanticsAndNormals(ptr, v38, v40, v39, v27);
    kdebug_trace();
  }

}

- (void)pushToHitTestingDepth:(id)a3 pose:(id)a4
{
  id v6;
  void *v7;
  float v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  simd_float3 v18;
  simd_float3 v19;
  simd_float3 v20;
  RaycastSession *ptr;
  __CVBuffer *v22;
  __CVBuffer *v23;
  simd_float4 v24;
  simd_float4 v25;
  simd_float4 v26;
  simd_float4 v27;
  simd_float4 v28;
  simd_float4 v29;
  simd_float4 v30;
  simd_float4 v31;
  double v32;
  simd_float3 v33;
  double v34;
  simd_float3 v35;
  float v36;
  simd_float3 v37;
  id v38;
  simd_float3x3 v39;
  simd_float4x4 v40;

  v38 = a3;
  v6 = a4;
  if (self->_raycastSession.__ptr_)
  {
    objc_msgSend(v38, "sourceImageData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cameraIntrinsics");
    v34 = v9;
    v36 = v8;
    v32 = v10;
    objc_msgSend(v38, "sourceImageData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageResolution");
    v13 = v12;
    v15 = v14;
    objc_msgSend(v38, "depthBufferSize");
    v18.f32[0] = ARAdjustIntrinsicsForViewportSize(v36, v34, v32, v13, v15, v16, v17);
    v35 = v19;
    v37 = v18;
    v33 = v20;

    ptr = self->_raycastSession.__ptr_;
    v22 = (__CVBuffer *)objc_msgSend(v38, "singleFrameDepthBuffer");
    v23 = (__CVBuffer *)objc_msgSend(v38, "singleFrameConfidenceBuffer");
    objc_msgSend(v6, "visionCameraTransform");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v39.columns[1] = v35;
    v39.columns[0] = v37;
    v39.columns[0].i32[3] = 0;
    v39.columns[1].i32[3] = 0;
    v39.columns[2] = v33;
    v39.columns[2].i32[3] = 0;
    v40.columns[0] = v25;
    v40.columns[1] = v27;
    v40.columns[2] = v29;
    v40.columns[3] = v31;
    RaycastSession::PushDenseFrame(ptr, v22, v23, v39, v40);
  }

}

- (void)pushToSceneUnderstandingDepth:(id)a3 segmentation:(id)a4 pose:(id)a5
{
  ARSegmentationData *v8;
  id v9;
  void *v10;
  float v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  simd_float3 v21;
  simd_float3 v22;
  simd_float3 v23;
  PlaneDetectionSession *ptr;
  simd_float4 v25;
  simd_float4 v26;
  simd_float4 v27;
  simd_float4 v28;
  double v29;
  double v30;
  simd_float4 v31;
  simd_float4 v32;
  simd_float4 v33;
  simd_float4 v34;
  double v35;
  simd_float3 v36;
  double v37;
  simd_float3 v38;
  float v39;
  simd_float3 v40;
  ARMLDepthData *v41;
  simd_float3x3 v42;
  simd_float4x4 v43;

  v41 = (ARMLDepthData *)a3;
  v8 = (ARSegmentationData *)a4;
  v9 = a5;
  if (self->_planeDetectionSession.__ptr_)
  {
    kdebug_trace();
    -[ARMLDepthData sourceImageData](v41, "sourceImageData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cameraIntrinsics");
    v37 = v12;
    v39 = v11;
    v35 = v13;
    -[ARMLDepthData sourceImageData](v41, "sourceImageData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageResolution");
    v16 = v15;
    v18 = v17;
    -[ARMLDepthData depthBufferSize](v41, "depthBufferSize");
    v21.f32[0] = ARAdjustIntrinsicsForViewportSize(v39, v37, v35, v16, v18, v19, v20);
    v38 = v22;
    v40 = v21;
    v36 = v23;

    ptr = self->_planeDetectionSession.__ptr_;
    objc_msgSend(v9, "visionCameraTransform");
    v33 = v26;
    v34 = v25;
    v31 = v28;
    v32 = v27;
    -[ARSegmentationData timestamp](v8, "timestamp");
    v30 = v29;
    v42.columns[1] = v38;
    v42.columns[0] = v40;
    v42.columns[0].i32[3] = 0;
    v42.columns[1].i32[3] = 0;
    v43.columns[0] = v34;
    v42.columns[2] = v36;
    v42.columns[2].i32[3] = 0;
    v43.columns[2] = v32;
    v43.columns[1] = v33;
    v43.columns[3] = v31;
    PlaneDetectionSession::PushDepthWithSemantics(ptr, v41, v8, v43, v42, v30);
    kdebug_trace();
  }

}

- (void)didReceiveKeyframesUpdatedCallback:(CV3DReconKeyframeList *)a3
{
  uint64_t Count;
  uint64_t v5;
  uint64_t v6;
  uint64_t KeyframeUUIDAtIndex;
  const void *v8;
  NSObject *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t PointCloud;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  double v22;
  NSObject *p_super;
  objc_class *v24;
  void *v25;
  void *v26;
  double v27;
  uint64_t PointsCount;
  objc_class *v29;
  void *v30;
  void *v31;
  ARSpatialMappingPointCloud *v32;
  NSObject *v33;
  objc_class *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  objc_class *v40;
  void *v41;
  void *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  _QWORD v51[2];
  uint64_t (*v52)();
  void *v53;
  uint64_t v54;
  _QWORD v55[2];
  uint64_t (*v56)();
  void *v57;
  uint64_t v58;
  void *v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  ARWorldTrackingTechnique *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v59 = 0;
  Count = CV3DReconKeyframeListGetCount();
  kdebug_trace();
  kdebug_trace();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (!Count)
  {
LABEL_29:
    os_unfair_lock_lock(&self->_spatialMappingPointCloudsLock);
    -[NSMutableDictionary addEntriesFromDictionary:](self->_spatialMappingPointClouds, "addEntriesFromDictionary:", v46);
    os_unfair_lock_unlock(&self->_spatialMappingPointCloudsLock);
    kdebug_trace();
    goto LABEL_38;
  }
  v5 = 0;
  v6 = MEMORY[0x1E0C809B0];
  while (1)
  {
    KeyframeUUIDAtIndex = CV3DReconKeyframeListGetKeyframeUUIDAtIndex();
    if (v59)
      break;
    v8 = (const void *)KeyframeUUIDAtIndex;
    objc_msgSend(MEMORY[0x1E0CB3A28], "ar_UUIDWithCFUUIDRef:", KeyframeUUIDAtIndex);
    v9 = objc_claimAutoreleasedReturnValue();
    CFRelease(v8);
    CV3DReconKeyframeListGetKeyframeToWorldTransformAtIndex();
    v47 = v10;
    v48 = v11;
    v49 = v12;
    v50 = v13;
    if (v59)
    {
      _ARLogGeneral();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v40 = (objc_class *)objc_opt_class();
        NSStringFromClass(v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v59;
        *(_DWORD *)buf = 138543874;
        v61 = v41;
        v62 = 2048;
        v63 = self;
        v64 = 2112;
        v65 = v59;
        _os_log_impl(&dword_1B3A68000, v39, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error getting keyframe transform: %@", buf, 0x20u);

      }
      goto LABEL_36;
    }
    v14 = CV3DReconKeyframeListCopyKeyframeAtIndex();
    if (v59)
    {
      _ARLogGeneral();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v43 = (objc_class *)objc_opt_class();
        NSStringFromClass(v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v59;
        *(_DWORD *)buf = 138543874;
        v61 = v44;
        v62 = 2048;
        v63 = self;
        v64 = 2112;
        v65 = v59;
        _os_log_impl(&dword_1B3A68000, v39, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error getting keyframe: %@", buf, 0x20u);

      }
LABEL_36:

      goto LABEL_37;
    }
    v55[0] = v6;
    v55[1] = 3221225472;
    v56 = __63__ARWorldTrackingTechnique_didReceiveKeyframesUpdatedCallback___block_invoke;
    v57 = &__block_descriptor_40_e5_v8__0l;
    v58 = v14;
    PointCloud = CV3DReconKeyframeCreatePointCloud();
    if (v59)
    {
      _ARLogGeneral();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v59;
        *(_DWORD *)buf = 138543874;
        v61 = v18;
        v62 = 2048;
        v63 = self;
        v64 = 2112;
        v65 = v59;
        _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error creating point cloud keyframe: %@", buf, 0x20u);

      }
      v20 = 1;
      goto LABEL_18;
    }
    v21 = PointCloud;
    v51[0] = v6;
    v51[1] = 3221225472;
    v52 = __63__ARWorldTrackingTechnique_didReceiveKeyframesUpdatedCallback___block_invoke_129;
    v53 = &__block_descriptor_40_e5_v8__0l;
    v54 = PointCloud;
    CV3DReconKeyframeGetCreationTime();
    if (v59)
    {
      _ARLogGeneral();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v59;
        *(_DWORD *)buf = 138543874;
        v61 = v25;
        v62 = 2048;
        v63 = self;
        v64 = 2112;
        v65 = v59;
        _os_log_impl(&dword_1B3A68000, p_super, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error getting keyframe timestamp: %@", buf, 0x20u);

      }
    }
    else
    {
      v27 = v22;
      PointsCount = CV3DReconPointCloudGetPointsCount();
      if (v59)
      {
        _ARLogGeneral();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          v29 = (objc_class *)objc_opt_class();
          NSStringFromClass(v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v59;
          *(_DWORD *)buf = 138543874;
          v61 = v30;
          v62 = 2048;
          v63 = self;
          v64 = 2112;
          v65 = v59;
          _os_log_impl(&dword_1B3A68000, p_super, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error getting point cloud size: %@", buf, 0x20u);

        }
      }
      else
      {
        if (!PointsCount)
        {
          objc_msgSend(v46, "objectForKeyedSubscript:", v9);
          v33 = objc_claimAutoreleasedReturnValue();
          p_super = v33;
          if (v33)
            -[NSObject updateTransform:](v33, "updateTransform:", v47, v48, v49, v50);
          v20 = 0;
          goto LABEL_17;
        }
        v32 = -[ARSpatialMappingPointCloud initWithPointCloud:smTransform:identifier:timestamp:]([ARSpatialMappingPointCloud alloc], "initWithPointCloud:smTransform:identifier:timestamp:", v21, v9, v47, v48, v49, v50, v27);
        if (v32)
        {
          objc_msgSend(v46, "setObject:forKeyedSubscript:", v32, v9);
          v20 = 0;
          p_super = &v32->super;
          goto LABEL_17;
        }
        _ARLogGeneral();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          v34 = (objc_class *)objc_opt_class();
          NSStringFromClass(v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v61 = v35;
          v62 = 2048;
          v63 = self;
          _os_log_impl(&dword_1B3A68000, p_super, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error constructing point cloud", buf, 0x16u);

        }
      }
    }
    v20 = 1;
LABEL_17:

    ((void (*)(_QWORD *))v52)(v51);
LABEL_18:
    ((void (*)(_QWORD *))v56)(v55);

    if (v20)
      goto LABEL_38;
    if (Count == ++v5)
      goto LABEL_29;
  }
  _ARLogGeneral();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v59;
    *(_DWORD *)buf = 138543874;
    v61 = v37;
    v62 = 2048;
    v63 = self;
    v64 = 2112;
    v65 = v59;
    _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error getting keyframe UUID: %@", buf, 0x20u);

  }
LABEL_37:

LABEL_38:
}

uint64_t __63__ARWorldTrackingTechnique_didReceiveKeyframesUpdatedCallback___block_invoke()
{
  return CV3DReconKeyframeRelease();
}

uint64_t __63__ARWorldTrackingTechnique_didReceiveKeyframesUpdatedCallback___block_invoke_129()
{
  return CV3DReconPointCloudRelease();
}

- (ARWorldMap)serializeWorldMapWithReferenceOrigin:(double)a3
{
  void *v6;
  ARWorldMap *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_opt_new();
  if ((CV3DSLAMSessionSerializeMap() & 1) != 0)
  {
    v7 = -[ARWorldMap initWithTrackingData:referenceOriginTransform:]([ARWorldMap alloc], "initWithTrackingData:referenceOriginTransform:", v6, a2, a3, a4, a5);
  }
  else
  {
    _ARLogTechnique();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v10;
      v18 = 2048;
      v19 = a1;
      v20 = 2112;
      v21 = 0;
      _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to serialize map: %@", buf, 0x20u);

    }
    v7 = 0;
  }

  return v7;
}

- (void)clearMap
{
  char v3;
  NSObject *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  ARWorldTrackingTechnique *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[ARWorldTrackingTechnique vioHandleState](self, "vioHandleState") == 3)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    self->_didClearMap = 1;
    -[ARWorldTrackingTechnique setHasQualityKeyframe:](self, "setHasQualityKeyframe:", 0);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);
    kdebug_trace();
    v3 = CV3DSLAMSessionClearMap();
    _ARLogTechnique();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if ((v3 & 1) != 0)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v11 = v7;
        v12 = 2048;
        v13 = self;
        _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: World map cleared", buf, 0x16u);

      }
      kdebug_trace();
      -[ARWorldTrackingTechnique resetSceneReconstruction](self, "resetSceneReconstruction");
      -[ARWorldTrackingTechnique _resetSurfaceDetection](self, "_resetSurfaceDetection");
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v11 = v9;
        v12 = 2048;
        v13 = self;
        v14 = 2112;
        v15 = 0;
        _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error clearing vio map: %@", buf, 0x20u);

      }
    }
  }
}

- (id)serializeSurfaceData
{
  os_unfair_lock_s *p_surfaceDetectionSessionLock;
  void *v4;

  if (self->_planeDetectionSession.__ptr_)
  {
    p_surfaceDetectionSessionLock = &self->_surfaceDetectionSessionLock;
    os_unfair_lock_lock(&self->_surfaceDetectionSessionLock);
    PlaneDetectionSession::SerializePlanes(self->_planeDetectionSession.__ptr_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_surfaceDetectionSessionLock);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)loadSurfaceData:(id)a3
{
  const __CFData *v4;
  const __CFData *v5;

  v4 = (const __CFData *)a3;
  if (self->_planeDetectionSession.__ptr_)
  {
    v5 = v4;
    os_unfair_lock_lock(&self->_surfaceDetectionSessionLock);
    PlaneDetectionSession::LoadPlanes(self->_planeDetectionSession.__ptr_, v5);
    self->_hasLoadedSurfaceData = 1;
    os_unfair_lock_unlock(&self->_surfaceDetectionSessionLock);
    v4 = v5;
  }

}

- (void)addReferenceAnchors:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  void *v27;
  const void *v28;
  int v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  objc_class *v35;
  id v36;
  void *v37;
  __n128 v38;
  __n128 v39;
  __n128 v40;
  __n128 v41;
  uint64_t v42;
  void *v43;
  const __CFString *v44;
  id v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  id obj;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  _BYTE buf[32];
  _BYTE v66[32];
  uint64_t v67;
  simd_float4x4 v68;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_allowPoseGraphUpdates)
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v45 = v4;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v57;
      do
      {
        v7 = 0;
        v46 = v5;
        do
        {
          if (*(_QWORD *)v57 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v7);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              *(double *)v9.i64 = ARRenderingToVisionCoordinateTransform();
              v53 = v10;
              v54 = v9;
              v51 = v12;
              v52 = v11;
              objc_msgSend(v8, "referenceTransform");
              v49 = v14;
              v50 = v13;
              v47 = v16;
              v48 = v15;
              *(double *)&v17 = ARVisionToRenderingCoordinateTransform();
              v21 = 0;
              v60 = v50;
              v61 = v49;
              v62 = v48;
              v63 = v47;
              do
              {
                *(float32x4_t *)&buf[v21] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v54, COERCE_FLOAT(*(__int128 *)((char *)&v60 + v21))), v53, *(float32x2_t *)((char *)&v60 + v21), 1), v52, *(float32x4_t *)((char *)&v60 + v21), 2), v51, *(float32x4_t *)((char *)&v60 + v21), 3);
                v21 += 16;
              }
              while (v21 != 64);
              v22 = 0;
              v23 = *(float32x4_t *)buf;
              v24 = *(float32x4_t *)&buf[16];
              v25 = *(float32x4_t *)v66;
              v26 = *(float32x4_t *)&v66[16];
              v60 = v17;
              v61 = v18;
              v62 = v19;
              v63 = v20;
              do
              {
                *(float32x4_t *)&buf[v22] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v23, COERCE_FLOAT(*(__int128 *)((char *)&v60 + v22))), v24, *(float32x2_t *)((char *)&v60 + v22), 1), v25, *(float32x4_t *)((char *)&v60 + v22), 2), v26, *(float32x4_t *)((char *)&v60 + v22), 3);
                v22 += 16;
              }
              while (v22 != 64);
              *(double *)v68.columns[0].i64 = ARNormalizedTransform(*(float32x4_t *)buf);
              __invert_f4(v68);
              objc_msgSend(v8, "identifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = (const void *)objc_msgSend(v27, "ar_createCFUUIDRef");

              *(_QWORD *)&v60 = 0;
              v29 = CV3DSLAMSessionAddAnchor();
              if ((v29 & 1) == 0)
              {
                _ARLogTechnique();
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  v31 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v31);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  v33 = (void *)v60;
                  *(_DWORD *)buf = 138543874;
                  *(_QWORD *)&buf[4] = v32;
                  *(_WORD *)&buf[12] = 2048;
                  *(_QWORD *)&buf[14] = self;
                  *(_WORD *)&buf[22] = 2112;
                  *(_QWORD *)&buf[24] = v60;
                  _os_log_impl(&dword_1B3A68000, v30, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error adding anchor: %@", buf, 0x20u);

                }
              }
              _ARLogTechnique();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                v35 = (objc_class *)objc_opt_class();
                NSStringFromClass(v35);
                v36 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "identifier");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "referenceTransform");
                ARMatrix4x4Description(0, v38, v39, v40, v41);
                v42 = objc_claimAutoreleasedReturnValue();
                v43 = (void *)v42;
                *(_DWORD *)buf = 138544386;
                v44 = CFSTR("FAILED");
                if (v29)
                  v44 = CFSTR("SUCESS");
                *(_QWORD *)&buf[4] = v36;
                *(_WORD *)&buf[12] = 2048;
                *(_QWORD *)&buf[14] = self;
                *(_WORD *)&buf[22] = 2112;
                *(_QWORD *)&buf[24] = v37;
                *(_WORD *)v66 = 2112;
                *(_QWORD *)&v66[2] = v42;
                *(_WORD *)&v66[10] = 2112;
                *(_QWORD *)&v66[12] = v44;
                _os_log_impl(&dword_1B3A68000, v34, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: CV3DVIOAddAnchor: %@ - %@, %@", buf, 0x34u);

              }
              CFRelease(v28);
              v5 = v46;
            }
          }
          ++v7;
        }
        while (v7 != v5);
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      }
      while (v5);
    }

    v4 = v45;
  }

}

- (void)removeReferenceAnchors:(id)a3
{
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  const void *v8;
  int v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  id v15;
  void *v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  id v24;
  id obj;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  ARWorldTrackingTechnique *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  const __CFString *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  if (self->_allowPoseGraphUpdates && self->_slamSessionHandle)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v24;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
    if (v4)
    {
      v26 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v28 != v26)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v6, "identifier");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = (const void *)objc_msgSend(v7, "ar_createCFUUIDRef");

          v9 = CV3DSLAMSessionRemoveAnchor();
          if ((v9 & 1) == 0)
          {
            _ARLogTechnique();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              v11 = (objc_class *)objc_opt_class();
              NSStringFromClass(v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v32 = v12;
              v33 = 2048;
              v34 = self;
              v35 = 2112;
              v36 = 0;
              _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error removing anchor: %@", buf, 0x20u);

            }
          }
          _ARLogTechnique();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            v14 = (objc_class *)objc_opt_class();
            NSStringFromClass(v14);
            v15 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "referenceTransform");
            ARMatrix4x4Description(0, v17, v18, v19, v20);
            v21 = objc_claimAutoreleasedReturnValue();
            v22 = (void *)v21;
            *(_DWORD *)buf = 138544386;
            v23 = CFSTR("FAILED");
            if (v9)
              v23 = CFSTR("SUCESS");
            v32 = v15;
            v33 = 2048;
            v34 = self;
            v35 = 2112;
            v36 = v16;
            v37 = 2112;
            v38 = v21;
            v39 = 2112;
            v40 = v23;
            _os_log_impl(&dword_1B3A68000, v13, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: CV3DVIORemoveAnchor: %@ - %@, %@", buf, 0x34u);

          }
          CFRelease(v8);
        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
      }
      while (v4);
    }

  }
}

- (void)addObserver:(id)a3
{
  NSObject *observersSemaphore;
  id v5;

  observersSemaphore = self->_observersSemaphore;
  v5 = a3;
  dispatch_semaphore_wait(observersSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_observersSemaphore);
}

- (void)removeObserver:(id)a3
{
  NSObject *observersSemaphore;
  id v5;

  observersSemaphore = self->_observersSemaphore;
  v5 = a3;
  dispatch_semaphore_wait(observersSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_observersSemaphore);
}

- (id)getObservers
{
  void *v3;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_observersSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_observersSemaphore);
  return v3;
}

- (void)pushCollaborationData:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  int CMPoseAnchorTransformation;
  simd_float4 v8;
  simd_float4 v9;
  simd_float4 v10;
  simd_float4 v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  simd_float4 v16;
  simd_float4 v17;
  simd_float4 v18;
  simd_float4 v19;
  uint64_t v20;
  uint64_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  simd_float4 v26;
  uint64_t v27;
  simd_float4 v28;
  simd_float4 v29;
  simd_float4 v30;
  simd_float4 v31;
  uint64_t v32;
  simd_float4 v33;
  simd_float4 v34;
  simd_float4 v35;
  void *v36;
  ARParticipantAnchor *v37;
  NSObject *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  void *v46;
  NSMutableSet *anchorsReceived;
  void *v48;
  NSMutableSet *v49;
  void *v50;
  NSObject *v51;
  objc_class *v52;
  id v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  NSMutableSet *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  void *v61;
  NSObject *v62;
  objc_class *v63;
  id v64;
  void *v65;
  void *v66;
  int v67;
  NSObject *v68;
  NSObject *v69;
  objc_class *v70;
  id v71;
  void *v72;
  uint64_t v73;
  void *v74;
  NSObject *v75;
  objc_class *v76;
  void *v77;
  ARWorldTrackingTechnique *v78;
  objc_class *v79;
  void *v80;
  CV3DSLAMSession *slamSessionHandle;
  id v82;
  simd_float4 v83;
  simd_float4 v84;
  simd_float4 v85;
  simd_float4 v86;
  float32x4_t v87;
  float32x4_t v88;
  float32x4_t v89;
  float32x4_t v90;
  simd_float4 v91;
  float32x4_t v92;
  float32x4_t v93;
  simd_float4 v94;
  float32x4_t v95;
  float32x4_t v96;
  simd_float4 v97;
  float32x4_t v98;
  float32x4_t v99;
  id v100;
  simd_float4x4 v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;
  simd_float4 v105;
  id v106;
  _BYTE v107[128];
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint8_t v111[32];
  __int128 v112;
  __int128 v113;
  uint64_t v114;
  simd_float4x4 v115;
  _BYTE buf[32];
  float32x4_t v117;
  float32x4_t v118;
  uint64_t v119;
  simd_float4x4 v120;
  simd_float4x4 v121;

  v119 = *MEMORY[0x1E0C80C00];
  v100 = a3;
  -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCollaborationEnabled");

  if ((v5 & 1) != 0)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_sessionHandleStateSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    v106 = 0;
    if (objc_msgSend(v100, "vioDataType") == 7)
    {
      v104 = 0;
      v114 = 0;
      v112 = 0u;
      v113 = 0u;
      memset(v111, 0, sizeof(v111));
      v108 = 0;
      v109 = 0;
      v110 = 0;
      objc_msgSend(v100, "vioData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      CMPoseAnchorTransformation = CV3DSLAMSessionGetCMPoseAnchorTransformation();

      if (CMPoseAnchorTransformation)
      {
        *(double *)v8.i64 = ARMatrix4x4MakeRowMajorTransform((double *)v111);
        v101.columns[0] = v8;
        v94 = v10;
        v97 = v9;
        v91 = v11;
        *(double *)v12.i64 = ARVisionToRenderingCoordinateTransform();
        v89 = v13;
        v90 = v12;
        v87 = v15;
        v88 = v14;
        *(double *)v16.i64 = ARRenderingToVisionCoordinateTransform();
        v83 = v17;
        v84 = v16;
        v85 = v19;
        v86 = v18;
        v120.columns[0] = v101.columns[0];
        v120.columns[2] = v94;
        v120.columns[1] = v97;
        v120.columns[3] = v91;
        v121 = __invert_f4(v120);
        v20 = 0;
        v115 = v121;
        do
        {
          *(float32x4_t *)&buf[v20 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v90, COERCE_FLOAT(*(_OWORD *)&v115.columns[v20])), v89, *(float32x2_t *)v115.columns[v20].f32, 1), v88, (float32x4_t)v115.columns[v20], 2), v87, (float32x4_t)v115.columns[v20], 3);
          ++v20;
        }
        while (v20 != 4);
        v21 = 0;
        v22 = *(float32x4_t *)buf;
        v23 = *(float32x4_t *)&buf[16];
        v24 = v117;
        v25 = v118;
        v115.columns[0] = v84;
        v115.columns[1] = v83;
        v115.columns[2] = v86;
        v115.columns[3] = v85;
        do
        {
          *(float32x4_t *)&buf[v21 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v22, COERCE_FLOAT(*(_OWORD *)&v115.columns[v21])), v23, *(float32x2_t *)v115.columns[v21].f32, 1), v24, (float32x4_t)v115.columns[v21], 2), v25, (float32x4_t)v115.columns[v21], 3);
          ++v21;
        }
        while (v21 != 4);
        v101.columns[0] = *(simd_float4 *)buf;
        v95 = v117;
        v98 = *(float32x4_t *)&buf[16];
        v92 = v118;
        if (ARLinkedOnOrAfterAzul())
        {
          *(double *)v26.i64 = simd_matrix4x4((float32x4_t)_PromotedConst_1);
          v27 = 0;
          v115.columns[0] = v26;
          v115.columns[1] = v28;
          v115.columns[2] = v29;
          v115.columns[3] = v30;
          do
          {
            *(float32x4_t *)&buf[v27 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v101.columns[0], COERCE_FLOAT(*(_OWORD *)&v115.columns[v27])), v98, *(float32x2_t *)v115.columns[v27].f32, 1), v95, (float32x4_t)v115.columns[v27], 2), v92, (float32x4_t)v115.columns[v27], 3);
            ++v27;
          }
          while (v27 != 4);
          v101.columns[0] = *(simd_float4 *)&buf[16];
          v96 = v117;
          v99 = *(float32x4_t *)buf;
          v93 = v118;
          *(double *)v31.i64 = simd_matrix4x4((float32x4_t)_PromotedConst_512);
          v32 = 0;
          v115.columns[0] = v31;
          v115.columns[1] = v33;
          v115.columns[2] = v34;
          v115.columns[3] = v35;
          do
          {
            *(float32x4_t *)&buf[v32 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v99, COERCE_FLOAT(*(_OWORD *)&v115.columns[v32])), (float32x4_t)v101.columns[0], *(float32x2_t *)v115.columns[v32].f32, 1), v96, (float32x4_t)v115.columns[v32], 2), v93, (float32x4_t)v115.columns[v32], 3);
            ++v32;
          }
          while (v32 != 4);
          v101.columns[0].i64[0] = *(_QWORD *)buf;
          v95.i64[0] = v117.i64[0];
          v98.i64[0] = *(_QWORD *)&buf[16];
          v92.i64[0] = v118.i64[0];
        }
        v115.columns[0] = v105;
        v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &v115);
        v37 = -[ARAnchor initWithIdentifier:transform:]([ARParticipantAnchor alloc], "initWithIdentifier:transform:", v36, *(double *)v101.columns[0].i64, *(double *)v98.i64, *(double *)v95.i64, *(double *)v92.i64);
        -[ARAnchor setSessionIdentifier:](v37, "setSessionIdentifier:", v36);
        dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
        -[NSMutableSet removeObject:](self->_participantAnchors, "removeObject:", v37);
        -[NSMutableSet addObject:](self->_participantAnchors, "addObject:", v37);
        _ARLogTechnique();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          v39 = (objc_class *)objc_opt_class();
          NSStringFromClass(v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[ARAnchor description](v37, "description");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v40;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = self;
          *(_WORD *)&buf[22] = 2112;
          *(_QWORD *)&buf[24] = v41;
          _os_log_impl(&dword_1B3A68000, v38, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Participant anchor updated: %@", buf, 0x20u);

        }
        dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);

      }
      else
      {
        _ARLogTechnique();
        v75 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        {
          v76 = (objc_class *)objc_opt_class();
          NSStringFromClass(v76);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v77;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = self;
          *(_WORD *)&buf[22] = 2112;
          *(_QWORD *)&buf[24] = v106;
          _os_log_impl(&dword_1B3A68000, v75, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error getting pose for participant anchor: %@", buf, 0x20u);

        }
      }
      v78 = self;
    }
    else
    {
      objc_msgSend(v100, "vioDataType");
      objc_msgSend(v100, "vioData");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "length");
      objc_msgSend(v100, "vioSessionID");
      kdebug_trace();

      objc_msgSend(v100, "anchors");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {
        anchorsReceived = self->_anchorsReceived;
        objc_msgSend(v100, "anchors");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet minusSet:](anchorsReceived, "minusSet:", v48);

        v49 = self->_anchorsReceived;
        objc_msgSend(v100, "anchors");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet unionSet:](v49, "unionSet:", v50);

        _ARLogTechnique();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          v52 = (objc_class *)objc_opt_class();
          NSStringFromClass(v52);
          v53 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "anchors");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "count");
          v56 = -[NSMutableSet count](self->_anchorsReceived, "count");
          *(_DWORD *)v111 = 138544130;
          *(_QWORD *)&v111[4] = v53;
          *(_WORD *)&v111[12] = 2048;
          *(_QWORD *)&v111[14] = self;
          *(_WORD *)&v111[22] = 2048;
          *(_QWORD *)&v111[24] = v55;
          LOWORD(v112) = 2048;
          *(_QWORD *)((char *)&v112 + 2) = v56;
          _os_log_impl(&dword_1B3A68000, v51, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: collaboration data received with anchors: %tu => %tu", v111, 0x2Au);

        }
        v102 = 0u;
        v103 = 0u;
        memset(&v101.columns[2], 0, 32);
        v57 = self->_anchorsReceived;
        v58 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v101.columns[2], v107, 16);
        if (v58)
        {
          v59 = *(_QWORD *)v101.columns[3].i64[0];
          do
          {
            for (i = 0; i != v58; ++i)
            {
              if (*(_QWORD *)v101.columns[3].i64[0] != v59)
                objc_enumerationMutation(v57);
              v61 = *(void **)(v101.columns[2].i64[1] + 8 * i);
              _ARLogTechnique();
              v62 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
              {
                v63 = (objc_class *)objc_opt_class();
                NSStringFromClass(v63);
                v64 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "description");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v111 = 138543874;
                *(_QWORD *)&v111[4] = v64;
                *(_WORD *)&v111[12] = 2048;
                *(_QWORD *)&v111[14] = self;
                *(_WORD *)&v111[22] = 2112;
                *(_QWORD *)&v111[24] = v65;
                _os_log_impl(&dword_1B3A68000, v62, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: received anchor: %@", v111, 0x20u);

              }
            }
            v58 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v101.columns[2], v107, 16);
          }
          while (v58);
        }

      }
      objc_msgSend(v100, "vioDataType");
      objc_msgSend(v100, "vioData");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = CV3DSLAMSessionPushCMData();

      _ARLogTechnique();
      v68 = objc_claimAutoreleasedReturnValue();
      v69 = v68;
      if (v67)
      {
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        {
          v70 = (objc_class *)objc_opt_class();
          NSStringFromClass(v70);
          v71 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "vioData");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = objc_msgSend(v72, "length");
          NSStringFromSLAMCMDataType(objc_msgSend(v100, "vioDataType"));
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v111 = 138544130;
          *(_QWORD *)&v111[4] = v71;
          *(_WORD *)&v111[12] = 2048;
          *(_QWORD *)&v111[14] = self;
          *(_WORD *)&v111[22] = 2048;
          *(_QWORD *)&v111[24] = v73;
          LOWORD(v112) = 2112;
          *(_QWORD *)((char *)&v112 + 2) = v74;
          _os_log_impl(&dword_1B3A68000, v69, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: collaboration data pushed to VIO: %lu, %@", v111, 0x2Au);

        }
      }
      else if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        v79 = (objc_class *)objc_opt_class();
        NSStringFromClass(v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        slamSessionHandle = self->_slamSessionHandle;
        v82 = v106;
        *(_DWORD *)v111 = 138544130;
        *(_QWORD *)&v111[4] = v80;
        *(_WORD *)&v111[12] = 2048;
        *(_QWORD *)&v111[14] = self;
        *(_WORD *)&v111[22] = 2048;
        *(_QWORD *)&v111[24] = slamSessionHandle;
        LOWORD(v112) = 2112;
        *(_QWORD *)((char *)&v112 + 2) = v106;
        _os_log_impl(&dword_1B3A68000, v69, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: error pushing SLAM data %p, %@", v111, 0x2Au);

      }
      objc_msgSend(v100, "vioSessionID");
      v78 = self;
      kdebug_trace();
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)v78->_sessionHandleStateSemaphore);
  }
  else
  {
    _ARLogTechnique();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v111 = 138543618;
      *(_QWORD *)&v111[4] = v44;
      *(_WORD *)&v111[12] = 2048;
      *(_QWORD *)&v111[14] = self;
      _os_log_impl(&dword_1B3A68000, v42, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: collaboration data cannot be pushed because the feature is disabled.", v111, 0x16u);

    }
  }

}

- (void)_reportCollaborationData:(id)a3 type:(unsigned __int8)a4 metadata:(const void *)a5
{
  unsigned int v6;
  id v8;
  NSObject *v9;
  objc_class *v10;
  id v11;
  uint64_t v12;
  void *v13;
  ARCollaborationData *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  __int128 v33;
  char v34;
  _BYTE v35[128];
  _BYTE buf[22];
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  const void *v42;
  uint64_t v43;

  v6 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  _ARLogTechnique();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "length");
    NSStringFromSLAMCMDataType(v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = self;
    v37 = 2048;
    v38 = v12;
    v39 = 2112;
    v40 = v13;
    v41 = 2048;
    v42 = a5;
    _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: collaboration data received from VIO: %lu, %@, %p", buf, 0x34u);

  }
  v14 = -[ARCollaborationData initWithVIOData:type:sessionID:]([ARCollaborationData alloc], "initWithVIOData:type:sessionID:", v8, v6, -[ARWorldTrackingTechnique vioSessionIdentifier](self, "vioSessionIdentifier"));
  if (v6 != 1)
    goto LABEL_10;
  v34 = 0;
  v33 = 0uLL;
  v32 = 0;
  if (!MEMORY[0x1B5E2CA78](a5, &v34, &v33, &v32))
  {
    _ARLogTechnique();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v32;
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = self;
      v37 = 2112;
      v38 = (uint64_t)v32;
      _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to parse anchor metadata: %@", buf, 0x20u);

    }
    goto LABEL_10;
  }
  if (v34)
  {
    *(_OWORD *)buf = v33;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", buf);
    -[ARCollaborationData setAnchorIdentifier:](v14, "setAnchorIdentifier:", v15);

LABEL_10:
    -[ARWorldTrackingTechnique getObservers](self, "getObservers");
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v29;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v23);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v24, "technique:didOutputCollaborationData:", self, v14, (_QWORD)v28);
          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      }
      while (v21);
    }

    goto LABEL_20;
  }
  _ARLogTechnique();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v27;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_1B3A68000, v25, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Not reporting non-user created anchor.", buf, 0x16u);

  }
LABEL_20:

}

- (void)removePlanesByUUIDs:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (self->_planeDetectionSession.__ptr_)
  {
    v5 = v4;
    os_unfair_lock_lock(&self->_surfaceDetectionSessionLock);
    PlaneDetectionSession::ErasePlanes((uint64_t)self->_planeDetectionSession.__ptr_, v5);
    os_unfair_lock_unlock(&self->_surfaceDetectionSessionLock);
    v4 = v5;
  }

}

- (BOOL)isMultiSessionMode
{
  void *v2;
  id v3;
  BOOL v4;

  -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "slamConfiguration");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "UTF8String");
  v4 = CV3DSLAMConfigPresetFromString() == 26;

  return v4;
}

- (int)extentCheckFromConfiguration
{
  if ((-[ARWorldTrackingOptions planeDetection](self->_mutableOptions, "planeDetection") & 0x200) != 0)
    return 4;
  else
    return 2;
}

- (id)raycast:(id)a3
{
  id v4;
  RaycastSession *ptr;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  void *v10;
  _BYTE v12[96];

  v4 = a3;
  if (self->_raycastSession.__ptr_)
  {
    ARInitializeHitTestIntentWithExtentCheck((uint64_t)v12, v4, 0, -[ARWorldTrackingTechnique extentCheckFromConfiguration](self, "extentCheckFromConfiguration"), *(simd_float4 *)self->_anon_280, *(simd_float4 *)&self->_anon_280[16], *(simd_float4 *)&self->_anon_280[32], *(simd_float4 *)&self->_anon_280[48]);
    ptr = self->_raycastSession.__ptr_;
    -[ARWorldTrackingTechnique referenceOriginTransform](self, "referenceOriginTransform");
    RaycastSession::PerformHitTest(v6, v7, v8, v9, (uint64_t)ptr, (uint64_t)v12, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ARReleaseHitTestIntent((uint64_t)v12);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

- (id)trackedRaycast:(id)a3 updateHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  ARTrackedRaycast *v10;
  _BYTE v12[64];
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  if (self->_raycastSession.__ptr_)
  {
    ARInitializeHitTestIntentWithExtentCheck((uint64_t)v12, v6, 1, -[ARWorldTrackingTechnique extentCheckFromConfiguration](self, "extentCheckFromConfiguration"), *(simd_float4 *)self->_anon_280, *(simd_float4 *)&self->_anon_280[16], *(simd_float4 *)&self->_anon_280[32], *(simd_float4 *)&self->_anon_280[48]);
    RaycastSession::PerformHitTest(*(float32x4_t *)self->_anon_280, *(float32x4_t *)&self->_anon_280[16], *(float32x4_t *)&self->_anon_280[32], *(float32x4_t *)&self->_anon_280[48], (uint64_t)self->_raycastSession.__ptr_, (uint64_t)v12, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "ar_UUIDWithCFUUIDRef:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      ARReleaseHitTestIntent((uint64_t)v12);
      v10 = -[ARTrackedRaycast initWithIdentifier:ray:worldTrackingTechnique:updateHandler:]([ARTrackedRaycast alloc], "initWithIdentifier:ray:worldTrackingTechnique:updateHandler:", v9, v6, self, v7);
      -[ARTrackedRaycastPostProcessor addTrackedRaycast:andProcessInitialResults:](self->_trackedRaycastPostProcessor, "addTrackedRaycast:andProcessInitialResults:", v10, v8);

    }
    else
    {
      ARReleaseHitTestIntent((uint64_t)v12);
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)stopRaycast:(id)a3
{
  id v4;
  ARTrackedRaycastPostProcessor *trackedRaycastPostProcessor;
  id v6;
  _QWORD v7[4];
  id v8;
  ARWorldTrackingTechnique *v9;

  v4 = a3;
  trackedRaycastPostProcessor = self->_trackedRaycastPostProcessor;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__ARWorldTrackingTechnique_stopRaycast___block_invoke;
  v7[3] = &unk_1E6673AC8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[ARTrackedRaycastPostProcessor performBlockWhileLockingRaycasts:](trackedRaycastPostProcessor, "performBlockWhileLockingRaycasts:", v7);

}

void __40__ARWorldTrackingTechnique_stopRaycast___block_invoke(uint64_t a1)
{
  const __CFUUID *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (const __CFUUID *)objc_msgSend(v5, "ar_createCFUUIDRef");

  RaycastSession::StopRaycast(*(RaycastSession **)(*(_QWORD *)(a1 + 40) + 608), v2);
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 592);
  objc_msgSend(v3, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTrackedRaycastWithIdentifier:");

}

- (void)invalidateAllRaycasts
{
  ARTrackedRaycastPostProcessor *trackedRaycastPostProcessor;
  _QWORD v3[5];

  trackedRaycastPostProcessor = self->_trackedRaycastPostProcessor;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__ARWorldTrackingTechnique_invalidateAllRaycasts__block_invoke;
  v3[3] = &unk_1E6673AF0;
  v3[4] = self;
  -[ARTrackedRaycastPostProcessor performBlockWhileLockingRaycasts:](trackedRaycastPostProcessor, "performBlockWhileLockingRaycasts:", v3);
}

uint64_t __49__ARWorldTrackingTechnique_invalidateAllRaycasts__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "invalidateAllRaycasts");
}

- (void)stopAllRaycasts
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[ARTrackedRaycastPostProcessor trackedRaycasts](self->_trackedRaycastPostProcessor, "trackedRaycasts", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "stopTracking");
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)didUpdateRaycastResult:(CV3DHitTestResults *)a3
{
  unint64_t var1;
  uint64_t v6;
  unint64_t i;
  CV3DHitTestResult *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = (id)objc_opt_new();
  var1 = a3->var1;
  if (var1)
  {
    v6 = 0;
    for (i = 0; i < var1; ++i)
    {
      v8 = &a3->var0[v6];
      if (v8->var0)
      {
        -[ARWorldTrackingTechnique raycastResultFrom:](self, "raycastResultFrom:", &a3->var0[v6]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3A28], "ar_UUIDWithCFUUIDRef:", v8->var0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v12 = (void *)objc_opt_new();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, v10);

        }
        objc_msgSend(v14, "objectForKeyedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v9);

        var1 = a3->var1;
      }
      ++v6;
    }
  }
  -[ARTrackedRaycastPostProcessor processUpdatedResults:](self->_trackedRaycastPostProcessor, "processUpdatedResults:", v14);
  CV3DReleaseHitTestResults();

}

- (void)_handleRaycastResultCallback:(CV3DRaycastResultMap *)a3
{
  id v5;
  simd_float4x4 v6;

  -[ARWorldTrackingTechnique referenceOriginTransform](self, "referenceOriginTransform");
  ARRaycastResultsDictionaryFrom(a3, v6);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[ARTrackedRaycastPostProcessor processUpdatedResults:](self->_trackedRaycastPostProcessor, "processUpdatedResults:", v5);

}

- (id)raycastResultFrom:(CV3DHitTestResult *)a3
{
  simd_float4x4 v5;

  -[ARWorldTrackingTechnique referenceOriginTransform](self, "referenceOriginTransform");
  return ARRaycastResultFrom(a3, v5);
}

- (void)_updateVIOLineDetectionPolicy
{
  void *v3;
  void *v4;

  -[ARWorldTrackingTechnique options](self, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "planeEstimationShouldUseJasperData"))
  {
    -[ARWorldTrackingTechnique options](self, "options");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "planeDetection");

  }
  CV3DSLAMSessionSetLineEnablementPolicy();
}

- (int64_t)_initializeSLAMAndPredictorHandle
{
  ARWorldTrackingTechnique *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  NSObject *v11;
  objc_class *v12;
  id v13;
  void *v14;
  char *v15;
  void *v16;
  uint64_t v17;
  CV3DSLAMSession **p_slamSessionHandle;
  int v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  CV3DSLAMSession *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  objc_class *v32;
  void *v33;
  CV3DPosePredictionContext *predictorHandle;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v40;
  objc_class *v41;
  void *v42;
  objc_class *v43;
  void *v44;
  NSObject *v45;
  objc_class *v46;
  void *v47;
  CV3DSLAMSession *v48;
  void *v49;
  id v50;
  void *v51;
  NSObject *v52;
  objc_class *v53;
  void *v54;
  CV3DSLAMSession *v55;
  void *v56;
  id v57;
  void *v58;
  std::__shared_weak_count *v59;
  unint64_t *v60;
  unint64_t v61;
  char v62;
  NSObject *v63;
  NSObject *v64;
  objc_class *v65;
  void *v66;
  objc_class *v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  NSObject *v72;
  objc_class *v73;
  void *v74;
  CV3DSLAMSession *v75;
  void *v76;
  void *v77;
  ARWorldTrackingTechnique *v78;
  void *v79;
  void *v80;
  void *v81;
  BOOL v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t i;
  void *v91;
  NSObject *v92;
  objc_class *v93;
  id v94;
  char *v95;
  void *v96;
  BOOL v97;
  void *v98;
  NSObject *v99;
  objc_class *v100;
  id v101;
  void *v102;
  int v103;
  const char *v104;
  NSObject *v105;
  objc_class *v106;
  id v107;
  void *v108;
  int v109;
  const char *v110;
  NSObject *v111;
  objc_class *v112;
  id v113;
  void *v114;
  void *v115;
  void *v116;
  char *v117;
  id *v118;
  id *v119;
  id *v120;
  void *v121;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  void *v127;
  uint64_t v128;
  uint64_t (*v129)(uint64_t, uint64_t, CFDataRef, uint64_t);
  void *v130;
  id v131;
  void *v132;
  id from;
  _QWORD v134[4];
  id v135;
  id v136[5];
  id v137[5];
  id v138;
  id location;
  void *v140;
  const char *v141;
  _QWORD v142[2];
  uint64_t (*v143)();
  void *v144;
  uint64_t v145;
  id v146;
  void *v147;
  _QWORD v148[2];
  uint64_t (*v149)();
  void *v150;
  uint64_t v151;
  uint64_t v152;
  _QWORD v153[2];
  uint64_t (*v154)();
  void *v155;
  uint64_t v156;
  uint64_t v157;
  uint8_t v158[128];
  uint8_t buf[4];
  _BYTE v160[18];
  __int16 v161;
  const char *v162;
  __int16 v163;
  id v164;
  uint64_t v165;

  v165 = *MEMORY[0x1E0C80C00];
  -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "initialWorldMap");
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    self->_relocalizingAfterSensorDataDrop = 1;
  kdebug_trace();
  v157 = 0;
  v4 = objc_msgSend(v121, "createSLAMCalibration:", &v157);
  v5 = (void *)MEMORY[0x1E0C809B0];
  v153[0] = MEMORY[0x1E0C809B0];
  v153[1] = 3221225472;
  v154 = __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke;
  v155 = &__block_descriptor_40_e5_v8__0l;
  v156 = v157;
  if (!v4)
  {
    v152 = 0;
    objc_msgSend(v121, "createSLAMConfig:calibration:", &v152);
    v147 = 0;
    v148[0] = v5;
    v148[1] = 3221225472;
    v149 = __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke_2;
    v150 = &__block_descriptor_40_e5_v8__0l;
    v151 = v152;
    if (!CV3DSLAMConfigAsString())
    {
      _ARLogTechnique();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "slamConfiguration");
        v15 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)v160 = v13;
        *(_WORD *)&v160[8] = 2048;
        *(_QWORD *)&v160[10] = self;
        v161 = 2112;
        v162 = v15;
        _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Created SLAM configuration with configuration preset '%@'. SLAM config string:", buf, 0x20u);

      }
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v147);
      ARLogDebugNoClassLongMessage(v16, CFSTR("ARWorldTrackingTechnique"));

      free(v147);
      v2 = self;
    }
    v146 = 0;
    v17 = CV3DSLAMSessionCreate();
    p_slamSessionHandle = &v2->_slamSessionHandle;
    v2->_slamSessionHandle = (CV3DSLAMSession *)v17;
    if (!v17)
    {
      _ARLogTechnique();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *p_slamSessionHandle;
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)v160 = v25;
        *(_WORD *)&v160[8] = 2048;
        *(_QWORD *)&v160[10] = self;
        v161 = 2048;
        v162 = (const char *)v26;
        v163 = 2112;
        v164 = v146;
        _os_log_impl(&dword_1B3A68000, v23, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error initializing SLAM handle (%p): %@", buf, 0x2Au);

      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      ARKitCoreBundle();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Unable to initialize tracking."), &stru_1E6676798, CFSTR("Localizable_iOS"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0CB2D68]);

      ARErrorWithCodeAndUserInfo(200, v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARWorldTrackingTechnique _didFailWithError:](self, "_didFailWithError:", v30);

      v10 = 4;
      goto LABEL_23;
    }
    v142[0] = v5;
    v142[1] = 3221225472;
    v143 = __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke_148;
    v144 = &__block_descriptor_40_e5_v8__0l;
    v145 = CV3DPosePredictionConfigCreate();
    v19 = CV3DPosePredictionCreate();
    if (v19)
    {
      _ARLogGeneral();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)v160 = v22;
        *(_WORD *)&v160[8] = 2048;
        *(_QWORD *)&v160[10] = v2;
        v161 = 1024;
        LODWORD(v162) = v19;
        _os_log_impl(&dword_1B3A68000, v20, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: CV3DPosePredictionCreate error: %d", buf, 0x1Cu);

      }
    }
    else
    {
      if (!CV3PosePredictionInitialize())
      {
        kdebug_trace();
        v140 = 0;
        v141 = 0;
        if (CV3DSLAMSessionGetSessionID())
        {
          v2->_vioSessionIdentifier = (unint64_t)v141;
          _ARLogTechnique();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            v41 = (objc_class *)objc_opt_class();
            NSStringFromClass(v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)v160 = v42;
            *(_WORD *)&v160[8] = 2048;
            *(_QWORD *)&v160[10] = v2;
            v161 = 2048;
            v162 = v141;
            _os_log_impl(&dword_1B3A68000, v40, OS_LOG_TYPE_INFO, "%{public}@ <%p>: initialized with session identifier %llX", buf, 0x20u);

          }
        }
        else
        {
          _ARLogTechnique();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            v43 = (objc_class *)objc_opt_class();
            NSStringFromClass(v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)v160 = v44;
            *(_WORD *)&v160[8] = 2048;
            *(_QWORD *)&v160[10] = v2;
            v161 = 2112;
            v162 = (const char *)v146;
            _os_log_impl(&dword_1B3A68000, v40, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: unable to read VIO session identifier: %@", buf, 0x20u);

          }
        }

        objc_initWeak(&location, self);
        v140 = 0;
        v137[1] = v5;
        v137[2] = (id)3221225472;
        v137[3] = __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke_149;
        v137[4] = &unk_1E6673B18;
        objc_copyWeak(&v138, &location);
        if ((CV3DSLAMSetNewStateBlock() & 1) == 0)
        {
          _ARLogTechnique();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            v46 = (objc_class *)objc_opt_class();
            NSStringFromClass(v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = *p_slamSessionHandle;
            v49 = v140;
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)v160 = v47;
            *(_WORD *)&v160[8] = 2048;
            *(_QWORD *)&v160[10] = self;
            v161 = 2048;
            v162 = (const char *)v48;
            v163 = 2112;
            v164 = v140;
            _os_log_impl(&dword_1B3A68000, v45, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: error setting metadata callback (%p): %@", buf, 0x2Au);

          }
          v50 = objc_loadWeakRetained(&location);
          ARErrorWithCodeAndUserInfo(200, 0);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "_didFailWithError:", v51);

        }
        objc_destroyWeak(&v138);
        v140 = 0;
        v136[1] = v5;
        v136[2] = (id)3221225472;
        v136[3] = __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke_151;
        v136[4] = &unk_1E6673B40;
        v120 = v137;
        objc_copyWeak(v137, &location);
        CV3DSLAMSetErrorBlock();
        if (v140)
        {
          _ARLogTechnique();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            v53 = (objc_class *)objc_opt_class();
            NSStringFromClass(v53);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = *p_slamSessionHandle;
            v56 = v140;
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)v160 = v54;
            *(_WORD *)&v160[8] = 2048;
            *(_QWORD *)&v160[10] = self;
            v161 = 2048;
            v162 = (const char *)v55;
            v163 = 2112;
            v164 = v140;
            _os_log_impl(&dword_1B3A68000, v52, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: error setting error callback (%p): %@", buf, 0x2Au);

          }
          v57 = objc_loadWeakRetained(&location);
          ARErrorWithCodeAndUserInfo(200, 0);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "_didFailWithError:", v58);

        }
        v134[0] = v5;
        v134[1] = 3221225472;
        v134[2] = __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke_153;
        v134[3] = &unk_1E6673B68;
        v118 = &v135;
        objc_copyWeak(&v135, &location);
        v136[0] = (id)MEMORY[0x1B5E2DF90](v134);
        LOBYTE(from) = -[ARWorldTrackingTechnique deterministicMode](self, "deterministicMode");
        std::allocate_shared[abi:ne180100]<RaycastSession,std::allocator<RaycastSession>,CV3DSLAMSession *&,void({block_pointer} {__strong}&)(CV3DRaycastResultMap const*),BOOL,void>(p_slamSessionHandle, v136, (unsigned __int8 *)&from, buf);
        std::shared_ptr<arkit::KeyMapBuffer<void const*,std::vector<unsigned char>>>::operator=[abi:ne180100]((uint64_t)&self->_raycastSession, (__int128 *)buf);
        v59 = *(std::__shared_weak_count **)&v160[4];
        if (*(_QWORD *)&v160[4])
        {
          v60 = (unint64_t *)(*(_QWORD *)&v160[4] + 8);
          do
            v61 = __ldaxr(v60);
          while (__stlxr(v61 - 1, v60));
          if (!v61)
          {
            ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
            std::__shared_weak_count::__release_weak(v59);
          }
        }
        v140 = 0;
        v62 = CV3DSLAMSessionSetOutputMapPoints();
        _ARLogTechnique();
        v63 = objc_claimAutoreleasedReturnValue();
        v64 = v63;
        if ((v62 & 1) != 0)
        {
          if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
          {
            v65 = (objc_class *)objc_opt_class();
            NSStringFromClass(v65);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)v160 = v66;
            *(_WORD *)&v160[8] = 2048;
            *(_QWORD *)&v160[10] = self;
            _os_log_impl(&dword_1B3A68000, v64, OS_LOG_TYPE_INFO, "%{public}@ <%p>: map points enabled", buf, 0x16u);

          }
        }
        else if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          v67 = (objc_class *)objc_opt_class();
          NSStringFromClass(v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v140;
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)v160 = v68;
          *(_WORD *)&v160[8] = 2048;
          *(_QWORD *)&v160[10] = self;
          v161 = 2112;
          v162 = (const char *)v140;
          _os_log_impl(&dword_1B3A68000, v64, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to enable map points: %@", buf, 0x20u);

        }
        -[ARWorldTrackingTechnique _updateVIOLineDetectionPolicy](self, "_updateVIOLineDetectionPolicy");
        -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(v70, "isCollaborationEnabled");

        if (v71)
        {
          objc_initWeak(&from, self);
          v132 = 0;
          v127 = v5;
          v128 = 3221225472;
          v129 = __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke_155;
          v130 = &unk_1E6673B90;
          objc_copyWeak(&v131, &from);
          if ((CV3DSLAMSessionSetCMDataBlock() & 1) == 0)
          {
            _ARLogGeneral();
            v72 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
            {
              v73 = (objc_class *)objc_opt_class();
              NSStringFromClass(v73);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v75 = *p_slamSessionHandle;
              v76 = v132;
              *(_DWORD *)buf = 138544130;
              *(_QWORD *)v160 = v74;
              *(_WORD *)&v160[8] = 2048;
              *(_QWORD *)&v160[10] = self;
              v161 = 2048;
              v162 = (const char *)v75;
              v163 = 2112;
              v164 = v132;
              _os_log_impl(&dword_1B3A68000, v72, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: error setting collaboration data callback (%p): %@", buf, 0x2Au);

            }
            ARErrorWithCodeAndUserInfo(200, 0);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            -[ARWorldTrackingTechnique _didFailWithError:](self, "_didFailWithError:", v77, &v135, v137);

          }
          objc_destroyWeak(&v131);
          objc_destroyWeak(&from);
        }
        v78 = self;
        if (-[ARWorldTrackingTechnique isMultiSessionMode](self, "isMultiSessionMode", v118))
        {
          if (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.worldTracking.enableMLCMRelocalization")))
          {
            -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "initialWorldMap");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "anchors");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = objc_msgSend(v81, "count") == 0;

            v78 = self;
            if (!v82)
            {
              -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v83, "initialWorldMap");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "anchors");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              ARAnchorsForPoseGraphUpdates(v85);
              v86 = (void *)objc_claimAutoreleasedReturnValue();

              v125 = 0u;
              v126 = 0u;
              v123 = 0u;
              v124 = 0u;
              v87 = v86;
              v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v123, v158, 16);
              if (v88)
              {
                v89 = *(_QWORD *)v124;
                do
                {
                  for (i = 0; i != v88; ++i)
                  {
                    if (*(_QWORD *)v124 != v89)
                      objc_enumerationMutation(v87);
                    v91 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * i);
                    _ARLogGeneral();
                    v92 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
                    {
                      v93 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v93);
                      v94 = (id)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v91, "identifier");
                      v95 = (char *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543874;
                      *(_QWORD *)v160 = v94;
                      *(_WORD *)&v160[8] = 2048;
                      *(_QWORD *)&v160[10] = self;
                      v161 = 2114;
                      v162 = v95;
                      _os_log_impl(&dword_1B3A68000, v92, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Anchor received from loaded world map: %{public}@", buf, 0x20u);

                    }
                    -[NSMutableSet addObject:](self->_anchorsReceived, "addObject:", v91);
                  }
                  v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v123, v158, 16);
                }
                while (v88);
              }

              v78 = self;
            }
          }
        }
        if (ARDeviceSupportsJasper())
        {
          -[ARWorldTrackingTechnique mutableOptions](v78, "mutableOptions");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = objc_msgSend(v96, "sceneReconstruction") == 0;

          if (!v97)
          {
            -[ARWorldTrackingTechnique setupSceneReconstruction](self, "setupSceneReconstruction");
            -[ARWorldTrackingTechnique sceneReconstructionHandler](self, "sceneReconstructionHandler");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "start");

            -[ARWorldTrackingTechnique _configureMeshPlaneHarmonization](self, "_configureMeshPlaneHarmonization");
          }
        }
        _ARLogTechnique();
        v99 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
        {
          v100 = (objc_class *)objc_opt_class();
          NSStringFromClass(v100);
          v101 = (id)objc_claimAutoreleasedReturnValue();
          -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = objc_msgSend(v102, "isCollaborationEnabled");
          v104 = "disabled";
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)v160 = v101;
          if (v103)
            v104 = "enabled";
          *(_WORD *)&v160[8] = 2048;
          *(_QWORD *)&v160[10] = self;
          v161 = 2080;
          v162 = v104;
          _os_log_impl(&dword_1B3A68000, v99, OS_LOG_TYPE_INFO, "%{public}@ <%p>: initialized with collaboration %s", buf, 0x20u);

        }
        _ARLogTechnique();
        v105 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
        {
          v106 = (objc_class *)objc_opt_class();
          NSStringFromClass(v106);
          v107 = (id)objc_claimAutoreleasedReturnValue();
          -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = objc_msgSend(v108, "relocalizationEnabled");
          v110 = "disabled";
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)v160 = v107;
          if (v109)
            v110 = "enabled";
          *(_WORD *)&v160[8] = 2048;
          *(_QWORD *)&v160[10] = self;
          v161 = 2080;
          v162 = v110;
          _os_log_impl(&dword_1B3A68000, v105, OS_LOG_TYPE_INFO, "%{public}@ <%p>: initialized with relocalization %s", buf, 0x20u);

        }
        _ARLogTechnique();
        v111 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
        {
          v112 = (objc_class *)objc_opt_class();
          NSStringFromClass(v112);
          v113 = (id)objc_claimAutoreleasedReturnValue();
          -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "imageSensorSettings");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "videoFormat");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "description");
          v117 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)v160 = v113;
          *(_WORD *)&v160[8] = 2048;
          *(_QWORD *)&v160[10] = self;
          v161 = 2112;
          v162 = v117;
          _os_log_impl(&dword_1B3A68000, v111, OS_LOG_TYPE_INFO, "%{public}@ <%p>: initialized with video format: %@", buf, 0x20u);

        }
        objc_destroyWeak(v119);
        objc_destroyWeak(v120);
        objc_destroyWeak(&location);
        v10 = 3;
        goto LABEL_22;
      }
      _ARLogTechnique();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        predictorHandle = v2->_predictorHandle;
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)v160 = v33;
        *(_WORD *)&v160[8] = 2048;
        *(_QWORD *)&v160[10] = self;
        v161 = 2048;
        v162 = (const char *)predictorHandle;
        v163 = 2112;
        v164 = v146;
        _os_log_impl(&dword_1B3A68000, v31, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error initializing predictor handle (%p): %@", buf, 0x2Au);

      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      ARKitCoreBundle();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("Unable to initialize tracking."), &stru_1E6676798, CFSTR("Localizable_iOS"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0CB2D68]);

      ARErrorWithCodeAndUserInfo(200, v35);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARWorldTrackingTechnique _didFailWithError:](self, "_didFailWithError:", v38);

    }
    v10 = 4;
LABEL_22:
    ((void (*)(_QWORD *))v143)(v142);
LABEL_23:
    ((void (*)(_QWORD *))v149)(v148);
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ARKitCoreBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Unable to initialize tracking."), &stru_1E6676798, CFSTR("Localizable_iOS"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB2D68]);

  ARErrorWithCodeAndUserInfo(200, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARWorldTrackingTechnique _didFailWithError:](self, "_didFailWithError:", v9);

  v10 = 4;
LABEL_24:
  ((void (*)(_QWORD *))v154)(v153);

  return v10;
}

uint64_t __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke()
{
  return CV3DSLAMCalibrationRelease();
}

uint64_t __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke_2()
{
  return CV3DSLAMConfigRelease();
}

uint64_t __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke_148()
{
  return CV3DPosePredictionConfigRelease();
}

void __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke_149(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "onMetadataCallback:", a2);

}

void __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke_151(uint64_t a1, void *a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleSLAMError:", a2);

}

void __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke_153(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleRaycastResultCallback:", a2);

}

uint64_t __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke_155(uint64_t a1, uint64_t a2, CFDataRef theData, uint64_t a4)
{
  id WeakRetained;

  CFDataGetLength(theData);
  kdebug_trace();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reportCollaborationData:type:metadata:", theData, a2, a4);

  return kdebug_trace();
}

- (unsigned)CV3DSLAMJasperPointCloudProjectorModeFromAVTimeOfFlightProjectorMode:(int64_t)a3
{
  _BYTE *v3;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  ARWorldTrackingTechnique *v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v3 = (_BYTE *)*MEMORY[0x1E0C80C00];
  v16 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0:
      goto LABEL_5;
    case 1:
      v3 = (_BYTE *)MEMORY[0x1E0CFC9B0];
      goto LABEL_9;
    case 2:
      v3 = (_BYTE *)MEMORY[0x1E0CFC9B8];
      goto LABEL_9;
    case 3:
    case 4:
      _ARLogTechnique();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543874;
        v11 = v8;
        v12 = 2048;
        v13 = self;
        v14 = 2048;
        v15 = a3;
        _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error, the following projector mode is not supported by CV3D (enum value %ld)", (uint8_t *)&v10, 0x20u);

      }
LABEL_5:
      v3 = (_BYTE *)MEMORY[0x1E0CFC9A8];
      goto LABEL_9;
    case 6:
      v3 = (_BYTE *)MEMORY[0x1E0CFC9A0];
LABEL_9:
      LOBYTE(v3) = *v3;
      break;
    default:
      return v3;
  }
  return v3;
}

- (void)setupSceneReconstruction
{
  ARSceneReconstructionHandler *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  ARSceneReconstructionHandler *v8;
  ARSceneReconstructionHandler *sceneReconstructionHandler;

  if (!self->_sceneReconstructionHandler)
  {
    if (self->_slamSessionHandle)
    {
      v3 = [ARSceneReconstructionHandler alloc];
      -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "sceneReconstruction");
      -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sceneReconstructionOptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[ARSceneReconstructionHandler initWithSceneReconstruction:options:slamSessionHandle:](v3, "initWithSceneReconstruction:options:slamSessionHandle:", v5, v7, self->_slamSessionHandle);
      sceneReconstructionHandler = self->_sceneReconstructionHandler;
      self->_sceneReconstructionHandler = v8;

      -[ARSceneReconstructionHandler setDelegate:](self->_sceneReconstructionHandler, "setDelegate:", self);
    }
  }
}

- (void)resetSceneReconstruction
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  ARWorldTrackingTechnique *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _ARLogTechnique();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Resetting scene reconstruction", (uint8_t *)&v8, 0x16u);

  }
  -[ARWorldTrackingTechnique sceneReconstructionHandler](self, "sceneReconstructionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reset");

  +[ARSpatialMappingResultData emptyResultData](ARSpatialMappingResultData, "emptyResultData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_latestSpatialMappingDataLock);
  -[NSMutableArray addObject:](self->_latestSpatialMappingData, "addObject:", v7);
  os_unfair_lock_unlock(&self->_latestSpatialMappingDataLock);
  os_unfair_lock_lock(&self->_spatialMappingPointCloudsLock);
  -[NSMutableDictionary removeAllObjects](self->_spatialMappingPointClouds, "removeAllObjects");
  os_unfair_lock_unlock(&self->_spatialMappingPointCloudsLock);
  kdebug_trace();

}

- (void)_configureMeshPlaneHarmonization
{
  void *v3;
  unint64_t v4;
  id v5;
  id v6;

  -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "planeDetection") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = ((unint64_t)objc_msgSend(v3, "planeDetection") >> 1) & 1;

  }
  -[ARWorldTrackingTechnique sceneReconstructionHandler](self, "sceneReconstructionHandler");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "meshPlaneHarmonizationShouldEnable:", v4);

}

- (BOOL)querySceneReconstructionOccupancyWithPoints:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  ARSceneReconstructionHandler *sceneReconstructionHandler;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  sceneReconstructionHandler = self->_sceneReconstructionHandler;
  if (sceneReconstructionHandler)
    v9 = -[ARSceneReconstructionHandler queryOccupancyWithPoints:callback:](sceneReconstructionHandler, "queryOccupancyWithPoints:callback:", v6, v7);
  else
    v9 = 0;

  return v9;
}

- (void)sceneReconstructionHandler:(id)a3 didFailWithError:(id)a4
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
  ARWorldTrackingTechnique *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _ARLogTechnique();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544130;
    v13 = v10;
    v14 = 2048;
    v15 = self;
    v16 = 2048;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Scene reconstruction handler %p failed with error %@", (uint8_t *)&v12, 0x2Au);

  }
  ARErrorWithCodeAndUserInfo(200, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARWorldTrackingTechnique _didFailWithError:](self, "_didFailWithError:", v11);

}

- (void)sceneReconstructionHandler:(id)a3 didOutputMeshList:(CV3DReconMeshList *)a4 withTimestamp:(double)a5
{
  ARSpatialMappingResultData *v8;
  void *v9;
  ARSpatialMappingResultData *v10;

  v8 = [ARSpatialMappingResultData alloc];
  -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ARSpatialMappingResultData initWithMeshList:sceneReconstruction:timestamp:](v8, "initWithMeshList:sceneReconstruction:timestamp:", a4, objc_msgSend(v9, "sceneReconstruction"), a5);

  os_unfair_lock_lock(&self->_latestSpatialMappingDataLock);
  -[NSMutableArray addObject:](self->_latestSpatialMappingData, "addObject:", v10);
  os_unfair_lock_unlock(&self->_latestSpatialMappingDataLock);

}

- (void)sceneReconstructionHandler:(id)a3 didOutputKeyframeList:(CV3DReconKeyframeList *)a4 withTimestamp:(double)a5
{
  -[ARWorldTrackingTechnique didReceiveKeyframesUpdatedCallback:](self, "didReceiveKeyframesUpdatedCallback:", a4, a5);
  CV3DReconKeyframeListRelease();
}

- (void)_handlePlaneDetectionCallback:(CV3DPlaneDetectionPlaneList *)a3
{
  void *v5;
  void *v6;
  ARCV3DPlaneDetectionPlaneList *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  ARPlaneData *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trackedPlaneCallback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[ARCV3DPlaneDetectionPlaneList initWithDetectionResult:]([ARCV3DPlaneDetectionPlaneList alloc], "initWithDetectionResult:", a3);
    -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trackedPlaneCallback");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, ARCV3DPlaneDetectionPlaneList *))v9)[2](v9, v7);

  }
  os_unfair_lock_lock(&self->_raycastSessionLock);
  if (self->_raycastSession.__ptr_)
    CV3DRaycastPushPlanes();
  os_unfair_lock_unlock(&self->_raycastSessionLock);
  -[ARWorldTrackingTechnique sceneReconstructionHandler](self, "sceneReconstructionHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "processPlaneList:", a3);

  v11 = -[ARPlaneData initWithDetectionResult:detectionTypeMask:sceneUnderstandingEnabled:]([ARPlaneData alloc], "initWithDetectionResult:detectionTypeMask:sceneUnderstandingEnabled:", a3, -[ARWorldTrackingOptions planeDetection](self->_mutableOptions, "planeDetection"), -[ARWorldTrackingOptions mlModelEnabled](self->_mutableOptions, "mlModelEnabled"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[ARWorldTrackingTechnique getObservers](self, "getObservers", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "technique:didDetectPlane:timestamp:", self, v11, 0.0);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (void)_handleSingleShotPlaneDetectionCallback:(CV3DPlaneDetectionSingleShotPlaneList *)a3
{
  void *v5;
  void *v6;
  ARCV3DPlaneDetectionSingleShotPlaneList *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);

  -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "singleShotPlaneCallback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[ARCV3DPlaneDetectionSingleShotPlaneList initWithDetectionResult:]([ARCV3DPlaneDetectionSingleShotPlaneList alloc], "initWithDetectionResult:", a3);
    -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "singleShotPlaneCallback");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, ARCV3DPlaneDetectionSingleShotPlaneList *))v9)[2](v9, v7);

  }
  CV3DPlaneDetectionSingleShotPlaneListRelease();
}

- (void)_initializeSurfaceDetection:(const PlaneDetectionConfiguration *)a3
{
  os_unfair_lock_s *p_surfaceDetectionSessionLock;
  void *v6;
  int v7;
  uint64_t v8;
  id *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;

  objc_initWeak(&location, self);
  p_surfaceDetectionSessionLock = &self->_surfaceDetectionSessionLock;
  os_unfair_lock_lock_with_options();
  -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "planeBundleAdjustmentEnabled");

  if (v7)
  {
    v8 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __56__ARWorldTrackingTechnique__initializeSurfaceDetection___block_invoke;
    v22[3] = &unk_1E6673BB8;
    v9 = &v23;
    objc_copyWeak(&v23, &location);
    v24 = (id)MEMORY[0x1B5E2DF90](v22);
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = __56__ARWorldTrackingTechnique__initializeSurfaceDetection___block_invoke_2;
    v19[3] = &unk_1E6673BE0;
    objc_copyWeak(&v20, &location);
    v21 = (id)MEMORY[0x1B5E2DF90](v19);
    std::allocate_shared[abi:ne180100]<PlaneDetectionSession,std::allocator<PlaneDetectionSession>,CV3DSLAMSession *&,PlaneDetectionConfiguration const&,void({block_pointer} {__strong}&)(CV3DPlaneDetectionPlaneList const*),void({block_pointer} {__strong}&)(CV3DPlaneDetectionSingleShotPlaneList const*),void>(&self->_slamSessionHandle, (uint64_t)a3, &v21, &v24, &v18);
    std::shared_ptr<arkit::KeyMapBuffer<void const*,std::vector<unsigned char>>>::operator=[abi:ne180100]((uint64_t)&self->_planeDetectionSession, &v18);
    v10 = (std::__shared_weak_count *)*((_QWORD *)&v18 + 1);
    if (*((_QWORD *)&v18 + 1))
    {
      v11 = (unint64_t *)(*((_QWORD *)&v18 + 1) + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }

    objc_destroyWeak(&v20);
  }
  else
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __56__ARWorldTrackingTechnique__initializeSurfaceDetection___block_invoke_3;
    v16[3] = &unk_1E6673BE0;
    v9 = &v17;
    objc_copyWeak(&v17, &location);
    v24 = (id)MEMORY[0x1B5E2DF90](v16);
    std::allocate_shared[abi:ne180100]<PlaneDetectionSession,std::allocator<PlaneDetectionSession>,CV3DSLAMSession *&,PlaneDetectionConfiguration const&,void({block_pointer} {__strong}&)(CV3DPlaneDetectionPlaneList const*),void>(&self->_slamSessionHandle, (uint64_t)a3, &v24, &v18);
    std::shared_ptr<arkit::KeyMapBuffer<void const*,std::vector<unsigned char>>>::operator=[abi:ne180100]((uint64_t)&self->_planeDetectionSession, &v18);
    v13 = (std::__shared_weak_count *)*((_QWORD *)&v18 + 1);
    if (*((_QWORD *)&v18 + 1))
    {
      v14 = (unint64_t *)(*((_QWORD *)&v18 + 1) + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }

  objc_destroyWeak(v9);
  os_unfair_lock_unlock(p_surfaceDetectionSessionLock);
  objc_destroyWeak(&location);
}

void __56__ARWorldTrackingTechnique__initializeSurfaceDetection___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleSingleShotPlaneDetectionCallback:", a2);

}

void __56__ARWorldTrackingTechnique__initializeSurfaceDetection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handlePlaneDetectionCallback:", a2);

}

void __56__ARWorldTrackingTechnique__initializeSurfaceDetection___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handlePlaneDetectionCallback:", a2);

}

- (void)_resetSurfaceDetection
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  ARWorldTrackingTechnique *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _ARLogTechnique();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v5;
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Resetting surface detection", (uint8_t *)&v6, 0x16u);

  }
  -[ARWorldTrackingTechnique _initializeSurfaceDetection:](self, "_initializeSurfaceDetection:", &self->_surfaceDetectionParametrization);
}

- (int64_t)_mappingStatusFromMapSize:(int)a3 keyframeQuality:(int)a4 isTrackingMap:(BOOL)a5 timestamp:(double)a6
{
  _BOOL4 v7;
  int64_t v9;

  v7 = a5;
  if (self->_previousKeyframeCount < a3)
  {
    self->_previousKeyframeCount = a3;
    if (a4)
    {
      self->_lastQualityKeyframeTimestamp = a6;
      -[ARWorldTrackingTechnique setHasQualityKeyframe:](self, "setHasQualityKeyframe:", 1);
    }
  }
  if (v7)
    self->_lastPoseTrackingMapTimestamp = a6;
  if (self->_previousKeyframeCount)
  {
    if (a6 - self->_lastQualityKeyframeTimestamp >= 1.0)
    {
      if (a6 - self->_lastPoseTrackingMapTimestamp >= 1.0)
        v9 = 1;
      else
        v9 = 3;
    }
    else
    {
      v9 = 2;
    }
  }
  else
  {
    v9 = 0;
  }
  kdebug_trace();
  return v9;
}

- (id)_featurePointDataFromSLAMState:(const CV3DSLAMStateContext *)a3
{
  void *v4;
  int PointCloud;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  ARWorldTrackingFeaturePointData *v9;
  ARPointCloud *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  ARWorldTrackingTechnique *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PointCloud = CV3DSLAMStateGetPointCloud();
  if (PointCloud == *MEMORY[0x1E0CFCA08] && CV3DSLAMStateGetTimestamp() == PointCloud)
  {
    if (CV3DSLAMStateGetStatus() == PointCloud)
    {
      objc_msgSend(v4, "length");
      v9 = -[ARWorldTrackingFeaturePointData initWithTimestamp:]([ARWorldTrackingFeaturePointData alloc], "initWithTimestamp:", 0.0);
      kdebug_trace();
      v11 = -[ARPointCloud initWithCV3DPointData:minVergenceAngleCosine:]([ARPointCloud alloc], "initWithCV3DPointData:minVergenceAngleCosine:", v4, self->_minVergenceAngleCosine);
      -[ARWorldTrackingFeaturePointData setVisionFeaturePoints:](v9, "setVisionFeaturePoints:", v11);

      kdebug_trace();
      goto LABEL_8;
    }
    _ARLogTechnique();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v13 = v8;
      v14 = 2048;
      v15 = self;
      v16 = 2048;
      v17 = 0;
      _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Point cloud rejected because tracking state is not nominal: %f", buf, 0x20u);

    }
  }
  v9 = 0;
LABEL_8:

  return v9;
}

- (void)_updateTrackingState:(id)a3 slamState:(const CV3DSLAMStateContext *)a4
{
  NSObject *v5;
  objc_class *v6;
  void *v7;
  char v8;
  _BOOL4 relocalizingAfterSensorDataDrop;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  const __CFString *v13;
  _BOOL4 didClearMap;
  double *p_originTimestamp;
  char v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  double v21;
  int64_t reinitializationAttempts;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  int64_t reinitializationAttemptsAtInitialization;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _BOOL8 v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  _BYTE buf[22];
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  _BYTE v50[10];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  CV3DSLAMStateGetStatus();
  v43 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
  v44 = *MEMORY[0x1E0C83FF0];
  v41 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 48);
  v42 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 32);
  if (CV3DSLAMStateGetRelocalizationTimestamp() == *MEMORY[0x1E0CFCA08]
    && self->_lastRelocalizationTimestamp < 0.0)
  {
    CV3DSLAMStateIsGlobalRelocalization();
    CV3DSLAMStateRelocalizationSucceeded();
    kdebug_trace();
    _ARLogTechnique();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = self;
      v47 = 2048;
      v48 = 0;
      v49 = 1024;
      *(_DWORD *)v50 = 0;
      *(_WORD *)&v50[4] = 1024;
      *(_DWORD *)&v50[6] = 0;
      _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Relocalization event: %f, global %i, succeeded %i", buf, 0x2Cu);

    }
    self->_lastRelocalizationTimestamp = 0.0;
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  relocalizingAfterSensorDataDrop = self->_relocalizingAfterSensorDataDrop;
  if (!self->_relocalizingAfterSensorDataDrop || !self->_didClearMap)
  {
    p_originTimestamp = &self->_originTimestamp;
    if ((v8 & 1) != 0)
      goto LABEL_17;
LABEL_19:
    v16 = 0;
    if (*p_originTimestamp >= 2.22044605e-16)
      goto LABEL_23;
    goto LABEL_20;
  }
  _ARLogTechnique();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("NO");
    didClearMap = self->_didClearMap;
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2048;
    if (didClearMap)
      v13 = CFSTR("YES");
    *(_QWORD *)&buf[14] = self;
    v47 = 2112;
    v48 = CFSTR("NO");
    v49 = 2112;
    *(_QWORD *)v50 = v13;
    _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Clearing relocalization after sensor data drop because major relocalization(%@) or clear map (%@) occurred.", buf, 0x2Au);

  }
  self->_relocalizingAfterSensorDataDrop = 0;
  if ((v8 & 1) == 0)
  {
    relocalizingAfterSensorDataDrop = 0;
    p_originTimestamp = &self->_originTimestamp;
    goto LABEL_19;
  }
  p_originTimestamp = &self->_originTimestamp;
  if (self->_didClearMap)
  {
    relocalizingAfterSensorDataDrop = 0;
    goto LABEL_19;
  }
LABEL_17:
  v16 = 1;
LABEL_20:
  objc_msgSend(v45, "timestamp", v33, v34, v35, v36, v37, v38, v39, v40);
  *(_QWORD *)p_originTimestamp = v17;
  _ARLogTechnique();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *p_originTimestamp;
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v20;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = self;
    v47 = 2048;
    v48 = *(const __CFString **)&v21;
    _os_log_impl(&dword_1B3A68000, v18, OS_LOG_TYPE_INFO, "%{public}@ <%p>: VIO origin timestamp: %f", buf, 0x20u);

  }
  relocalizingAfterSensorDataDrop = self->_relocalizingAfterSensorDataDrop;
LABEL_23:
  if (relocalizingAfterSensorDataDrop)
  {
    reinitializationAttempts = self->_reinitializationAttempts;
    if (self->_reinitializationAttemptsAtInitialization != reinitializationAttempts)
    {
      self->_reinitializationAttemptsAtInitialization = reinitializationAttempts;
      _ARLogTechnique();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        reinitializationAttemptsAtInitialization = self->_reinitializationAttemptsAtInitialization;
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = self;
        v47 = 2048;
        v48 = (const __CFString *)reinitializationAttemptsAtInitialization;
        _os_log_impl(&dword_1B3A68000, v23, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Setting tracking state to limited with relocalizing after sensor data drop, resetting reinitialziation attempts counter to %li", buf, 0x20u);

      }
    }
    v27 = 4;
    v28 = 1;
  }
  else
  {
    v28 = 1;
    if (self->_reinitializationAttemptsAtInitialization == self->_reinitializationAttempts)
    {
      v28 = 2;
      v27 = 0;
    }
    else
    {
      v27 = 3;
    }
  }
  v29 = (void *)CV3DSLAMStateCopyUpdatedAnchors();
  v30 = v29;
  if (v29)
    v31 = objc_msgSend(v29, "count") != 0;
  else
    v31 = 0;
  v32 = (void *)objc_opt_new();
  objc_msgSend(v32, "setState:", v28);
  objc_msgSend(v32, "setReason:", v27);
  objc_msgSend(v32, "setMajorRelocalization:", 0);
  objc_msgSend(v32, "setMinorRelocalization:", v16 & 1);
  objc_msgSend(v32, "setPoseGraphUpdated:", v31);
  objc_msgSend(v32, "setMajorRelocalizationCameraTransform:", *(double *)&v44, *(double *)&v43, *(double *)&v42, *(double *)&v41);
  objc_msgSend(v32, "setVioTrackingState:", 1);
  objc_msgSend(v32, "setLastMajorRelocalizationTimestamp:", self->_lastMajorRelocalizationTimestamp);
  objc_msgSend(v32, "setOriginTimestamp:", *p_originTimestamp);
  objc_msgSend(v32, "setCurrentVIOMapSize:", self->_currentVIOMapSize);
  objc_msgSend(v32, "setNumberOfCameraSwitches:", self->_numberOfCameraSwitches);
  objc_msgSend(v32, "setReinitializationAttempts:", self->_reinitializationAttempts);
  objc_msgSend(v45, "setWorldTrackingState:", v32);

}

- (unsigned)_trackingCameraID:(CV3DSLAMStateContext *)a3
{
  void *v4;
  id v5;
  unsigned int *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *lastCameraType;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  NSString *v17;
  NSString *v18;
  int v20;
  void *v21;
  __int16 v22;
  ARWorldTrackingTechnique *v23;
  __int16 v24;
  NSString *v25;
  __int16 v26;
  NSString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (CV3DSLAMStateGetCameraSwitchingStatistics() == *MEMORY[0x1E0CFCA08]
    && (v5 = objc_retainAutorelease(v4),
        v6 = (unsigned int *)objc_msgSend(v5, "bytes"),
        (unint64_t)(objc_msgSend(v5, "length") - 24) <= 0x17))
  {
    v7 = *v6;
    -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activeVideoFormatsMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "captureDeviceType");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();

    lastCameraType = self->_lastCameraType;
    if (lastCameraType && lastCameraType != v12)
    {
      _ARLogTechnique();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = self->_lastCameraType;
        v20 = 138544130;
        v21 = v16;
        v22 = 2048;
        v23 = self;
        v24 = 2112;
        v25 = v17;
        v26 = 2112;
        v27 = v12;
        _os_log_impl(&dword_1B3A68000, v14, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Camera type changed from %@ to %@", (uint8_t *)&v20, 0x2Au);

      }
      if (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.worldTracking.warningSounds")))
      {
        softLinkAudioServicesPlaySystemSound(0x454u);
      }
      ++self->_numberOfCameraSwitches;
    }
    v18 = self->_lastCameraType;
    self->_lastCameraType = v12;

  }
  else
  {
    LODWORD(v7) = 0;
  }

  return v7;
}

- (int)_updatePoseData:(id)x2_0 forTimeStamp:(double)a4 updateTrackingState:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int Pose;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  uint64_t SLAMState;
  uint64_t v17;
  ARSLAMState *v18;
  uint64_t v19;
  int v20;
  int v21;
  double RowMajorTransform;
  double v23;
  double v24;
  double v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  double v31;
  void *v32;
  NSObject *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[2];
  uint64_t (*v47)();
  void *v48;
  uint64_t v49;
  _QWORD v50[2];
  uint64_t (*v51)();
  void *v52;
  uint64_t v53;
  double v54[3];
  double v55[9];
  double v56[3];
  uint8_t v57[32];
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint8_t buf[32];
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  simd_float4x3 v69;

  v5 = a5;
  v68 = *MEMORY[0x1E0C80C00];
  v8 = x2_0;
  v9 = CV3DSLAMStateSnapshotCreate();
  v10 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v51 = __77__ARWorldTrackingTechnique__updatePoseData_forTimeStamp_updateTrackingState___block_invoke;
  v52 = &__block_descriptor_40_e5_v8__0l;
  v53 = v9;
  Pose = CV3DPosePredictionGetPose();
  if (Pose)
  {
    if (self->_lastPoseMetaDataTimestamp <= 0.0)
    {
LABEL_11:
      v20 = 1;
      goto LABEL_26;
    }
    _ARLogTechnique();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCV3DPosePredictionReturn(Pose);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v15;
      LOWORD(v65) = 2048;
      *(double *)((char *)&v65 + 2) = a4;
      _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to update pose [%@] for timestamp %f", buf, 0x2Au);

    }
LABEL_10:

    goto LABEL_11;
  }
  SLAMState = CV3DSLAMStateSnapshotCreateSLAMState();
  v17 = SLAMState;
  if (!SLAMState)
  {
    _ARLogTechnique();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2048;
      *(double *)&buf[24] = a4;
      _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to create SLAM state for timestamp %f", buf, 0x20u);

    }
    goto LABEL_10;
  }
  v46[0] = v10;
  v46[1] = 3221225472;
  v47 = __77__ARWorldTrackingTechnique__updatePoseData_forTimeStamp_updateTrackingState___block_invoke_171;
  v48 = &__block_descriptor_40_e5_v8__0l;
  v49 = SLAMState;
  v18 = -[ARSLAMState initWithSLAMState:]([ARSLAMState alloc], "initWithSLAMState:", SLAMState);
  objc_msgSend(v8, "setSlamState:", v18);

  v67 = 0;
  v65 = 0u;
  v66 = 0u;
  memset(buf, 0, sizeof(buf));
  v61 = 0;
  v62 = 0;
  v63 = 0;
  v19 = -[ARWorldTrackingTechnique _trackingCameraID:](self, "_trackingCameraID:", v17);
  v44 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
  v45 = *MEMORY[0x1E0C83FF0];
  v42 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 48);
  v43 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 32);
  v20 = CV3DSLAMStateSnapshotGetPose();
  if (!v20)
  {
    v60 = 0;
    v58 = 0u;
    v59 = 0u;
    memset(v57, 0, sizeof(v57));
    memset(v56, 0, sizeof(v56));
    -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "imageSensorSettingsForUltraWide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = (_DWORD)v19 == self->_visualizationCameraID;

      if (!v30)
      {
        v21 = CV3DSLAMStateConvertPoseToCameraFrame();
        -[ARWorldTrackingTechnique extrinsicsToWideSensor](self, "extrinsicsToWideSensor");
        ARCascadeTransform((double *)v57, v56, v69, v55, v54);
LABEL_17:
        RowMajorTransform = ARMatrix4x4MakeRowMajorTransform((double *)v57);
        goto LABEL_18;
      }
    }
    else
    {

    }
    v21 = CV3DSLAMStateConvertPoseToCameraFrame();
    goto LABEL_17;
  }
  v21 = *MEMORY[0x1E0CFC9E8];
  v23 = *(double *)&v44;
  RowMajorTransform = *(double *)&v45;
  v25 = *(double *)&v42;
  v24 = *(double *)&v43;
LABEL_18:
  if (v21 == *MEMORY[0x1E0CFCA08])
  {
    objc_msgSend(v8, "setVisionCameraTransform:", RowMajorTransform, v23, v24, v25);
    if (v5)
      -[ARWorldTrackingTechnique _updateTrackingState:slamState:](self, "_updateTrackingState:slamState:", v8, v17);
    *(_QWORD *)v57 = 0;
    CV3DSLAMStateGetTimestamp();
    v31 = *(double *)v57;
    objc_msgSend(v8, "worldTrackingState");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setPoseTimestamp:", v31);

  }
  else
  {
    _ARLogTechnique();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCV3DSLAMReturn(v21);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v57 = 138543874;
      *(_QWORD *)&v57[4] = v35;
      *(_WORD *)&v57[12] = 2048;
      *(_QWORD *)&v57[14] = self;
      *(_WORD *)&v57[22] = 2112;
      *(_QWORD *)&v57[24] = v36;
      _os_log_impl(&dword_1B3A68000, v33, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error converting pose from IMU to camera frame: %@", v57, 0x20u);

    }
    v20 = 1;
  }
  -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions", v42, v43, v44, v45);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "activeVideoFormatsMap");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v19);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCurrentlyActiveVideoFormat:", v40);

  ((void (*)(_QWORD *))v47)(v46);
LABEL_26:
  ((void (*)(_QWORD *))v51)(v50);

  return v20;
}

uint64_t __77__ARWorldTrackingTechnique__updatePoseData_forTimeStamp_updateTrackingState___block_invoke()
{
  return CV3DSLAMStateSnapshotRelease();
}

uint64_t __77__ARWorldTrackingTechnique__updatePoseData_forTimeStamp_updateTrackingState___block_invoke_171()
{
  return CV3DSLAMStateRelease();
}

- (void)onMetadataCallback:(CV3DSLAMStateContext *)a3
{
  int Timestamp;
  int v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  int v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  int reinitializationAttempts;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  PlaneDetectionSession *ptr;
  void *v22;
  int v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  ARWorldTrackingTechnique *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  Timestamp = CV3DSLAMStateGetTimestamp();
  v6 = *MEMORY[0x1E0CFCA08];
  if (Timestamp != *MEMORY[0x1E0CFCA08])
  {
    _ARLogTechnique();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v9;
      v27 = 2048;
      v28 = self;
      v29 = 1024;
      LODWORD(v30) = Timestamp;
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: onMetadataCallback: CV3DSLAMStateGetTimestamp error: %d", buf, 0x1Cu);

    }
  }
  v10 = CV3DPosePredictionPushSLAMMetadata();
  if (v10)
  {
    _ARLogTechnique();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v13;
      v27 = 2048;
      v28 = self;
      v29 = 1024;
      LODWORD(v30) = v10;
      _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: onMetadataCallback: CV3DPosePredictionPushSLAMMetadata error: %d", buf, 0x1Cu);

    }
  }
  else
  {
    CV3DSLAMStateGetStatus();
    if (CV3DSLAMStateNumReinit() == v6 && self->_reinitializationAttempts)
    {
      _ARLogTechnique();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        reinitializationAttempts = self->_reinitializationAttempts;
        *(_DWORD *)buf = 138544386;
        v26 = v16;
        v27 = 2048;
        v28 = self;
        v29 = 2048;
        v30 = 0;
        v31 = 1024;
        v32 = reinitializationAttempts;
        v33 = 1024;
        v34 = 0;
        _os_log_impl(&dword_1B3A68000, v14, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Reinitialization attempts changed at %f, %i => %i", buf, 0x2Cu);

      }
      self->_reinitializationAttempts = 0;
      if (!self->_relocalizingAfterSensorDataDrop && CV3DSLAMStateGetMapSize() == v6)
      {
        _ARLogTechnique();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v26 = v20;
          v27 = 2048;
          v28 = self;
          _os_log_impl(&dword_1B3A68000, v18, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: SLAM re-init with 0 mapsize. Triggering scene recon and surface detection reset", buf, 0x16u);

        }
        -[ARWorldTrackingTechnique resetSceneReconstruction](self, "resetSceneReconstruction");
        -[ARWorldTrackingTechnique _resetSurfaceDetection](self, "_resetSurfaceDetection");
      }
    }
    kdebug_trace();
    os_unfair_lock_lock(&self->_raycastSessionLock);
    if (self->_raycastSession.__ptr_)
      CV3DRaycastPushSlamState();
    os_unfair_lock_unlock(&self->_raycastSessionLock);
    os_unfair_lock_lock(&self->_surfaceDetectionSessionLock);
    ptr = self->_planeDetectionSession.__ptr_;
    if (ptr)
      PlaneDetectionSession::PushSlamState(ptr, a3);
    os_unfair_lock_unlock(&self->_surfaceDetectionSessionLock);
    -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isCollaborationEnabled");

    if (v23)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      CV3DSLAMStateGetMapMergeStats();
      objc_msgSend(v24, "count");
      kdebug_trace();

    }
  }
}

- (void)_pushWTResultDataForTimestamp:(double)a3
{
  void *v5;
  ARWorldTrackingTechnique *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ARWorldTrackingReferenceAnchorData *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSObject *v21;
  objc_class *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  NSObject *v30;
  objc_class *v31;
  id v32;
  void *v33;
  NSObject *v34;
  objc_class *v35;
  id v36;
  uint64_t v37;
  NSObject *v38;
  objc_class *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  BOOL v47;
  void *v48;
  void (**v49)(_QWORD, _QWORD);
  int *v50;
  ARWorldTrackingPoseData *cachedPoseData;
  double v52;
  double v53;
  NSObject *v54;
  objc_class *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  BOOL v60;
  ARWorldTrackingPoseData *v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v69;
  void *v70;
  BOOL v71;
  const void *v72;
  int8x16_t v73;
  int8x16_t v74;
  __n128 v75;
  __n128 v76;
  NSObject *v77;
  objc_class *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  int LineCloud;
  ARLineCloud *v84;
  void *v85;
  int OldestStateCovarianceMatrices;
  int v87;
  ARInertialState *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  simd_float4 v96;
  __int128 v97;
  __int128 v98;
  void *v99;
  void *v100;
  int v101;
  void *v102;
  int CollaborativeMapStatistics;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  int MapMergeStats;
  void *v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t k;
  void *v115;
  void *v116;
  char isKindOfClass;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  char v122;
  id *p_isa;
  void *v124;
  void *v125;
  void *v126;
  ARWorldTrackingParticipantAnchorData *v127;
  BOOL v128;
  ARWorldTrackingTechnique *v129;
  uint64_t v130;
  NSObject *v131;
  objc_class *v132;
  id v133;
  void *v134;
  void *v135;
  void *v136;
  ARWorldTrackingErrorData *errorData;
  void *v138;
  void *v139;
  ARWorldTrackingTechnique *v140;
  void *v141;
  int v142;
  void *ExternalAnchorNames;
  ARWorldTrackingReferenceAnchorData *v144;
  float32x4_t v145;
  void *v146;
  float32x4_t v147;
  void *v148;
  float32x4_t v149;
  void *v150;
  float32x4_t v151;
  void *v152;
  ARWorldTrackingPoseData *obj;
  ARWorldTrackingTechnique *v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  uint64_t v159;
  _OWORD v160[2];
  _OWORD v161[2];
  simd_float4 v162[2];
  _OWORD v163[2];
  _OWORD v164[6];
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  double v173;
  _BYTE v174[12];
  __int16 v175;
  ARWorldTrackingTechnique *v176;
  _BYTE v177[128];
  __int128 v178;
  uint64_t v179;
  __int128 v180;
  uint64_t v181;
  CFTypeRef v182[3];
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  float64x2_t buf[4];
  uint64_t v190;
  simd_float4 v191;
  uint64_t v192;
  float64x2_t v193;
  uint64_t v194;
  _BYTE v195[128];
  _BYTE v196[128];
  uint64_t v197;
  simd_float4x4 v198;
  simd_float4x4 v199;
  simd_float4x4 v200;

  v197 = *MEMORY[0x1E0C80C00];
  obj = -[ARWorldTrackingPoseData initWithTimestamp:]([ARWorldTrackingPoseData alloc], "initWithTimestamp:", a3);
  v142 = -[ARWorldTrackingTechnique _updatePoseData:forTimeStamp:updateTrackingState:](self, "_updatePoseData:forTimeStamp:updateTrackingState:", a3);
  v152 = (void *)objc_opt_new();
  v173 = 0.0;
  -[ARWorldTrackingPoseData slamState](obj, "slamState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = self;
  objc_msgSend(v5, "slamState");
  CV3DSLAMStateGetTimestamp();

  v6 = self;
  if (self->_lastPoseMetaDataTimestamp >= 0.0)
    goto LABEL_46;
  kdebug_trace();
  self->_lastPoseMetaDataTimestamp = v173;
  v182[0] = 0;
  -[ARWorldTrackingPoseData slamState](obj, "slamState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "slamState");
  v150 = (void *)CV3DSLAMStateCopyUpdatedAnchors();

  if (!v150)
  {
    -[ARWorldTrackingTechnique _handleCV3DError:withDescription:failTechnique:](self, "_handleCV3DError:withDescription:failTechnique:", v182[0], CFSTR("Get updated anchors error"), 0);
    CFRelease(v182[0]);
  }
  -[ARWorldTrackingPoseData slamState](obj, "slamState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "slamState");
  v148 = (void *)CV3DSLAMStateCopyNewAnchors();

  if (!v148)
  {
    -[ARWorldTrackingTechnique _handleCV3DError:withDescription:failTechnique:](self, "_handleCV3DError:withDescription:failTechnique:", v182[0], CFSTR("Get added anchors error"), 0);
    CFRelease(v182[0]);
  }
  -[ARWorldTrackingPoseData slamState](obj, "slamState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "slamState");
  v146 = (void *)CV3DSLAMStateCopyRemovedAnchors();

  if (!v146)
  {
    -[ARWorldTrackingTechnique _handleCV3DError:withDescription:failTechnique:](self, "_handleCV3DError:withDescription:failTechnique:", v182[0], CFSTR("Get removed anchors error"), 0);
    CFRelease(v182[0]);
  }
  if (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.worldTracking.enableMLCMRelocalization")))
  {
    -[ARWorldTrackingPoseData slamState](obj, "slamState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "slamState");
    ExternalAnchorNames = (void *)CV3DSLAMStateGetExternalAnchorNames();

    if (ExternalAnchorNames)
      goto LABEL_12;
    -[ARWorldTrackingTechnique _handleCV3DError:withDescription:failTechnique:](self, "_handleCV3DError:withDescription:failTechnique:", v182[0], CFSTR("Get external anchors error"), 0);
    CFRelease(v182[0]);
  }
  ExternalAnchorNames = 0;
LABEL_12:
  if (objc_msgSend(v150, "count")
    || objc_msgSend(v148, "count")
    || objc_msgSend(v146, "count")
    || objc_msgSend(ExternalAnchorNames, "count"))
  {
    objc_msgSend(v150, "count");
    objc_msgSend(v148, "count");
    objc_msgSend(v146, "count");
    kdebug_trace();
    v11 = [ARWorldTrackingReferenceAnchorData alloc];
    ARAnchorsFromCV3DAnchorsArray(v150, 0, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ARAnchorsFromCV3DAnchorsArray(v148, 0, a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ARAnchorsFromCV3DAnchorsArray(v146, 0, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ARAnchorsFromCV3DAnchorsArray(ExternalAnchorNames, 0, a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = -[ARWorldTrackingReferenceAnchorData initWithUpdatedAnchors:addedAnchors:removedAnchors:externalAnchors:](v11, "initWithUpdatedAnchors:addedAnchors:removedAnchors:externalAnchors:", v12, v13, v14, v15);

    -[ARWorldTrackingReferenceAnchorData setTimestamp:](v144, "setTimestamp:", a3);
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_sessionHandleStateSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    -[ARWorldTrackingReferenceAnchorData setReceivedAnchors:](v144, "setReceivedAnchors:", self->_anchorsReceived);
    v171 = 0u;
    v172 = 0u;
    v169 = 0u;
    v170 = 0u;
    -[ARWorldTrackingReferenceAnchorData addedAnchors](v144, "addedAnchors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v169, v196, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v170;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v170 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * i);
          if (-[NSMutableSet containsObject:](v154->_anchorsReceived, "containsObject:", v20))
          {
            _ARLogTechnique();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              v22 = (objc_class *)objc_opt_class();
              NSStringFromClass(v22);
              v23 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "description");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(buf[0].f64[0]) = 138543874;
              *(_QWORD *)((char *)buf[0].f64 + 4) = v23;
              WORD2(buf[0].f64[1]) = 2048;
              *(_QWORD *)((char *)&buf[0].f64[1] + 6) = v154;
              HIWORD(buf[1].f64[0]) = 2112;
              *(_QWORD *)&buf[1].f64[1] = v24;
              _os_log_impl(&dword_1B3A68000, v21, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: adding received anchor %@", (uint8_t *)buf, 0x20u);

            }
            -[NSMutableSet removeObject:](v154->_anchorsReceived, "removeObject:", v20);
          }
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v169, v196, 16);
      }
      while (v17);
    }

    v167 = 0u;
    v168 = 0u;
    v165 = 0u;
    v166 = 0u;
    -[ARWorldTrackingReferenceAnchorData externalAnchors](v144, "externalAnchors");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v165, v195, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v166;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v166 != v27)
            objc_enumerationMutation(v25);
          v29 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * j);
          _ARLogTechnique();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            v31 = (objc_class *)objc_opt_class();
            NSStringFromClass(v31);
            v32 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "description");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf[0].f64[0]) = 138543874;
            *(_QWORD *)((char *)buf[0].f64 + 4) = v32;
            WORD2(buf[0].f64[1]) = 2048;
            *(_QWORD *)((char *)&buf[0].f64[1] + 6) = v154;
            HIWORD(buf[1].f64[0]) = 2112;
            *(_QWORD *)&buf[1].f64[1] = v33;
            _os_log_impl(&dword_1B3A68000, v30, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: updating external anchor %@", (uint8_t *)buf, 0x20u);

          }
        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v165, v195, 16);
      }
      while (v26);
    }

    _ARLogTechnique();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      v37 = -[NSMutableSet count](v154->_anchorsReceived, "count");
      LODWORD(buf[0].f64[0]) = 138543874;
      *(_QWORD *)((char *)buf[0].f64 + 4) = v36;
      WORD2(buf[0].f64[1]) = 2048;
      *(_QWORD *)((char *)&buf[0].f64[1] + 6) = v154;
      HIWORD(buf[1].f64[0]) = 2048;
      *(_QWORD *)&buf[1].f64[1] = v37;
      _os_log_impl(&dword_1B3A68000, v34, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: remaining received anchors to be added %tu", (uint8_t *)buf, 0x20u);

    }
    dispatch_semaphore_signal((dispatch_semaphore_t)v154->_sessionHandleStateSemaphore);
    objc_msgSend(v152, "addObject:", v144);
    -[ARTrackedRaycastPostProcessor updateFromPoseGraphEventWithData:referenceOriginTransform:](v154->_trackedRaycastPostProcessor, "updateFromPoseGraphEventWithData:referenceOriginTransform:", v144, *(double *)v154->_anon_280, *(double *)&v154->_anon_280[16], *(double *)&v154->_anon_280[32], *(double *)&v154->_anon_280[48]);
    _ARLogTechnique();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      v40 = (id)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v150, "count");
      v42 = objc_msgSend(v148, "count");
      v43 = objc_msgSend(v146, "count");
      v44 = objc_msgSend(ExternalAnchorNames, "count");
      LODWORD(buf[0].f64[0]) = 138544898;
      *(_QWORD *)((char *)buf[0].f64 + 4) = v40;
      WORD2(buf[0].f64[1]) = 2048;
      *(_QWORD *)((char *)&buf[0].f64[1] + 6) = v154;
      HIWORD(buf[1].f64[0]) = 2048;
      buf[1].f64[1] = a3;
      LOWORD(buf[2].f64[0]) = 2048;
      *(_QWORD *)((char *)buf[2].f64 + 2) = v41;
      WORD1(buf[2].f64[1]) = 2048;
      *(_QWORD *)((char *)&buf[2].f64[1] + 4) = v42;
      WORD2(buf[3].f64[0]) = 2048;
      *(_QWORD *)((char *)buf[3].f64 + 6) = v43;
      HIWORD(buf[3].f64[1]) = 2048;
      v190 = v44;
      _os_log_impl(&dword_1B3A68000, v38, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: World tracking anchors changed at timestamp %f, updated %lu, added %lu, removed %lu, external %lu", (uint8_t *)buf, 0x48u);

    }
    self = v154;
  }
  -[ARWorldTrackingTechnique mutableOptions](self, "mutableOptions");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "planeDetectionPoseUpdateCallback");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46 == 0;

  if (!v47)
  {
    -[ARWorldTrackingTechnique mutableOptions](v154, "mutableOptions");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "planeDetectionPoseUpdateCallback");
    v49 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v49)[2](v49, v150);

  }
  os_unfair_lock_lock(&v154->_raycastSessionLock);
  if (v154->_raycastSession.__ptr_)
  {
    -[ARWorldTrackingPoseData visionCameraTransform](obj, "visionCameraTransform");
    __invert_f4(v198);
    CV3DRaycastTriggerUpdateFromTrackableIntentsAsync();
  }
  os_unfair_lock_unlock(&v154->_raycastSessionLock);

  v6 = v154;
LABEL_46:
  dispatch_semaphore_wait((dispatch_semaphore_t)v6->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v50 = (int *)MEMORY[0x1E0CFCA08];
  if (v142)
  {
    cachedPoseData = v6->_cachedPoseData;
    if (cachedPoseData)
    {
      -[ARWorldTrackingPoseData timestamp](cachedPoseData, "timestamp");
      v53 = v52;
      _ARLogTechnique();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      {
        v55 = (objc_class *)objc_opt_class();
        NSStringFromClass(v55);
        v56 = (id)objc_claimAutoreleasedReturnValue();
        -[ARWorldTrackingPoseData timestamp](v154->_cachedPoseData, "timestamp");
        LODWORD(buf[0].f64[0]) = 138544386;
        *(_QWORD *)((char *)buf[0].f64 + 4) = v56;
        WORD2(buf[0].f64[1]) = 2048;
        *(_QWORD *)((char *)&buf[0].f64[1] + 6) = v154;
        HIWORD(buf[1].f64[0]) = 2048;
        buf[1].f64[1] = (a3 - v53) * 1000.0;
        LOWORD(buf[2].f64[0]) = 2048;
        *(double *)((char *)buf[2].f64 + 2) = a3;
        WORD1(buf[2].f64[1]) = 2048;
        *(_QWORD *)((char *)&buf[2].f64[1] + 4) = v57;
        _os_log_impl(&dword_1B3A68000, v54, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Using cached pose data with age: %fms (%f - %f)", (uint8_t *)buf, 0x34u);

      }
      v58 = -[ARWorldTrackingPoseData copy](v154->_cachedPoseData, "copy");

      obj = (ARWorldTrackingPoseData *)v58;
      objc_msgSend(v152, "addObject:", v58);
    }
    goto LABEL_70;
  }
  -[ARWorldTrackingPoseData cameraTransform](obj, "cameraTransform");
  -[ARWorldTrackingPoseData cameraTransform](obj, "cameraTransform");
  -[ARWorldTrackingPoseData cameraTransform](obj, "cameraTransform");
  kdebug_trace();
  -[ARWorldTrackingPoseData worldTrackingState](obj, "worldTrackingState");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "state") == 0;

  if (!v60)
  {
    v61 = v154->_cachedPoseData;
    if (v61)
    {
      -[ARWorldTrackingPoseData visionCameraTransform](v61, "visionCameraTransform");
      v149 = v63;
      v151 = v62;
      v145 = v65;
      v147 = v64;
      -[ARWorldTrackingPoseData visionCameraTransform](obj, "visionCameraTransform");
      if (AREqualTransforms(v151, v149, v147, v145, v66, v67, v68, v69))
        kdebug_trace();
    }
    objc_storeStrong((id *)&v154->_cachedPoseData, obj);
  }
  objc_msgSend(v152, "addObject:", obj);
  if (v154->_didClearMap)
    v154->_didClearMap = 0;
  -[ARWorldTrackingTechnique mutableOptions](v154, "mutableOptions");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v70, "isCollaborationEnabled"))
  {
    v71 = !v154->_participantAnchorsEnabled;

    if (v71)
      goto LABEL_66;
    objc_msgSend(MEMORY[0x1E0CB3A28], "ar_UUIDWithIntegerValue:", -[ARWorldTrackingTechnique vioSessionIdentifier](v154, "vioSessionIdentifier"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = (const void *)objc_msgSend(v70, "ar_createCFUUIDRef");
    *(_QWORD *)&v180 = 0;
    v190 = 0;
    memset(buf, 0, sizeof(buf));
    v193 = 0uLL;
    v194 = 0;
    -[ARWorldTrackingPoseData visionCameraTransform](obj, "visionCameraTransform");
    ARMatrix4x4RowMajorRotationAndTranslation(buf, &v193, v73, v74, v75, v76);
    v199.columns[0] = (simd_float4)ARDisplayCenterTransformForCaptureDevicePosition(1);
    v200 = __invert_f4(v199);
    v200.columns[1] = (simd_float4)vcvtq_f64_f32(*(float32x2_t *)v200.columns[3].f32);
    v200.columns[2].i64[0] = *(_OWORD *)&vaddq_f64(v193, (float64x2_t)v200.columns[1]);
    v200.columns[2].i64[1] = *(_QWORD *)&vsubq_f64(v193, *(float64x2_t *)(&v200 + 16)).f64[1];
    v191 = v200.columns[2];
    v192 = v194;
    *(_QWORD *)&v178 = 0;
    if (CV3DSLAMSessionCreateCMPoseAnchorData())
    {
      v77 = v180;
      -[ARWorldTrackingTechnique _reportCollaborationData:type:metadata:](v154, "_reportCollaborationData:type:metadata:", (_QWORD)v180, 7, 0);
    }
    else
    {
      _ARLogTechnique();
      v77 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
      {
        v78 = (objc_class *)objc_opt_class();
        NSStringFromClass(v78);
        v79 = (id)objc_claimAutoreleasedReturnValue();
        v80 = (void *)v178;
        LODWORD(v182[0]) = 138543874;
        *(CFTypeRef *)((char *)v182 + 4) = v79;
        WORD2(v182[1]) = 2048;
        *(CFTypeRef *)((char *)&v182[1] + 6) = v154;
        HIWORD(v182[2]) = 2112;
        v183 = v178;
        _os_log_impl(&dword_1B3A68000, v77, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Error creating participant anchor data: %@", (uint8_t *)v182, 0x20u);

      }
    }

    CFRelease(v72);
  }

LABEL_66:
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARWorldTrackingPoseData slamState](obj, "slamState");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "slamState");
  LineCloud = CV3DSLAMStateGetLineCloud();

  if (LineCloud == *v50 && objc_msgSend(v81, "length"))
  {
    v84 = -[ARLineCloud initWithLineCloudData:]([ARLineCloud alloc], "initWithLineCloudData:", v81);
    -[ARWorldTrackingPoseData setLineCloud:](obj, "setLineCloud:", v84);

  }
LABEL_70:
  -[ARWorldTrackingPoseData slamState](obj, "slamState");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "slamState");
  OldestStateCovarianceMatrices = CV3DSLAMStateGetOldestStateCovarianceMatrices();

  v87 = *v50;
  if (OldestStateCovarianceMatrices == *v50)
  {
    v88 = -[ARInertialState initWithCovarianceMatrix:]([ARInertialState alloc], "initWithCovarianceMatrix:", buf);
    *(CFTypeRef *)&v89 = v182[0];
    *(CFTypeRef *)&v90 = v182[1];
    *((_QWORD *)&v89 + 1) = v183;
    *((_QWORD *)&v90 + 1) = v184;
    *(_QWORD *)&v91 = v186;
    *(_QWORD *)&v92 = v187;
    *(CFTypeRef *)&v93 = v182[2];
    *((_QWORD *)&v93 + 1) = v185;
    *(_QWORD *)&v94 = v188;
    v164[0] = v89;
    v164[1] = v91;
    v164[2] = v90;
    v164[3] = v92;
    v164[4] = v93;
    v164[5] = v94;
    -[ARInertialState setOrientation:](v88, "setOrientation:", v164);
    *(_QWORD *)&v95 = v179;
    v163[0] = v178;
    v163[1] = v95;
    -[ARInertialState setPosition:](v88, "setPosition:", v163);
    v96.i64[0] = v192;
    v162[0] = v191;
    v162[1] = v96;
    -[ARInertialState setVelocity:](v88, "setVelocity:", v162);
    *(_QWORD *)&v97 = v181;
    v161[1] = v97;
    v161[0] = v180;
    -[ARInertialState setAccelerometerBias:](v88, "setAccelerometerBias:", v161);
    *(_QWORD *)&v98 = v194;
    v160[0] = v193;
    v160[1] = v98;
    -[ARInertialState setGyroscopeBias:](v88, "setGyroscopeBias:", v160);
    -[ARWorldTrackingPoseData worldTrackingState](obj, "worldTrackingState");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setInertialState:", v88);

  }
  -[ARWorldTrackingTechnique mutableOptions](v154, "mutableOptions");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend(v100, "isCollaborationEnabled");

  if (v101)
  {
    *(_QWORD *)v174 = 0;
    v159 = 0;
    -[ARWorldTrackingPoseData slamState](obj, "slamState");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "slamState");
    CollaborativeMapStatistics = CV3DSLAMStateGetCollaborativeMapStatistics();

    v104 = *(void **)v174;
    if (CollaborativeMapStatistics == v87 && *(_QWORD *)v174)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v159);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARWorldTrackingPoseData worldTrackingState](obj, "worldTrackingState");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "setCollaborationStats:", v105);

      v104 = *(void **)v174;
    }
    free(v104);
    v107 = (void *)objc_opt_new();
    -[ARWorldTrackingPoseData slamState](obj, "slamState");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "slamState");
    MapMergeStats = CV3DSLAMStateGetMapMergeStats();

    if (MapMergeStats == v87)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v107, "count"));
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = 0u;
      v158 = 0u;
      v155 = 0u;
      v156 = 0u;
      v111 = v107;
      v112 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v155, v177, 16);
      if (v112)
      {
        v113 = *(_QWORD *)v156;
        do
        {
          for (k = 0; k != v112; ++k)
          {
            if (*(_QWORD *)v156 != v113)
              objc_enumerationMutation(v111);
            v115 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * k);
            objc_msgSend(v115, "firstObject");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              objc_msgSend(v115, "firstObject");
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v110, "addObject:", v118);

            }
          }
          v112 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v155, v177, 16);
        }
        while (v112);
      }

      -[ARWorldTrackingPoseData worldTrackingState](obj, "worldTrackingState");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "setMergedSessionIdentifiers:", v110);

    }
  }
  -[ARWorldTrackingTechnique mutableOptions](v154, "mutableOptions");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "slamConfiguration");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = objc_msgSend(v121, "isEqualToString:", CFSTR("ObjectDetectionMapBuilding"));

  p_isa = (id *)&v154->super.super.super.isa;
  if ((v122 & 1) == 0)
  {
    *(_DWORD *)v174 = 0;
    LODWORD(v159) = 0;
    -[ARWorldTrackingPoseData slamState](obj, "slamState");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "slamState");
    CV3DSLAMStateGetMapSize();

    v154->_currentVIOMapSize = *(int *)v174;
    -[ARWorldTrackingPoseData slamState](obj, "slamState");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "slamState");
    CV3DSLAMStateGetMapKeyFrameQuality();

    -[ARWorldTrackingPoseData slamState](obj, "slamState");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "slamState");
    CV3DSLAMStateWasTrackingMap();

    p_isa = (id *)&v154->super.super.super.isa;
    -[ARWorldTrackingPoseData setWorldMappingStatus:](obj, "setWorldMappingStatus:", -[ARWorldTrackingTechnique _mappingStatusFromMapSize:keyframeQuality:isTrackingMap:timestamp:](v154, "_mappingStatusFromMapSize:keyframeQuality:isTrackingMap:timestamp:", *(unsigned int *)v174, v159, 0, a3));
  }
  objc_msgSend(p_isa, "mutableOptions");
  v127 = (ARWorldTrackingParticipantAnchorData *)objc_claimAutoreleasedReturnValue();
  if (-[ARWorldTrackingParticipantAnchorData isCollaborationEnabled](v127, "isCollaborationEnabled"))
  {
    v128 = objc_msgSend(p_isa[46], "count") == 0;

    if (v128)
      goto LABEL_94;
    v127 = -[ARWorldTrackingParticipantAnchorData initWithAnchors:]([ARWorldTrackingParticipantAnchorData alloc], "initWithAnchors:", v154->_participantAnchors);
    -[NSMutableSet removeAllObjects](v154->_participantAnchors, "removeAllObjects");
    objc_msgSend(v152, "addObject:", v127);
  }

LABEL_94:
  v129 = v154;
  if (v154->_errorData)
  {
    objc_msgSend(v152, "addObject:");
    if (obj)
    {
      v130 = -[ARWorldTrackingErrorData errorCode](v154->_errorData, "errorCode");
      if (v130 == *MEMORY[0x1E0CFC998])
      {
        _ARLogTechnique();
        v131 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG))
        {
          v132 = (objc_class *)objc_opt_class();
          NSStringFromClass(v132);
          v133 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v174 = 138543618;
          *(_QWORD *)&v174[4] = v133;
          v175 = 2048;
          v176 = v154;
          _os_log_impl(&dword_1B3A68000, v131, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Setting tracking state to initializing due to significant sensor data lose.", v174, 0x16u);

        }
        v134 = (void *)objc_opt_new();
        -[ARWorldTrackingPoseData setWorldTrackingState:](obj, "setWorldTrackingState:", v134);

        -[ARWorldTrackingPoseData worldTrackingState](obj, "worldTrackingState");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "setState:", 0);

        -[ARWorldTrackingPoseData worldTrackingState](obj, "worldTrackingState");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "setReason:", 1);

        v129 = v154;
      }
    }
    errorData = v129->_errorData;
    v129->_errorData = 0;

    v129 = v154;
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)v129->_resultSemaphore);
  -[ARWorldTrackingPoseData slamState](obj, "slamState");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARWorldTrackingTechnique _featurePointDataFromSLAMState:](v129, "_featurePointDataFromSLAMState:", objc_msgSend(v138, "slamState"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();

  v140 = v154;
  if (v139)
    objc_msgSend(v152, "addObject:", v139);
  os_unfair_lock_lock(&v154->_latestSpatialMappingDataLock);
  if (-[NSMutableArray count](v154->_latestSpatialMappingData, "count"))
  {
    objc_msgSend(v152, "addObjectsFromArray:", v154->_latestSpatialMappingData);
    -[NSMutableArray removeAllObjects](v154->_latestSpatialMappingData, "removeAllObjects");
  }
  os_unfair_lock_unlock(&v154->_latestSpatialMappingDataLock);
  os_unfair_lock_lock(&v154->_spatialMappingPointCloudsLock);
  if (-[NSMutableDictionary count](v154->_spatialMappingPointClouds, "count"))
  {
    -[NSMutableDictionary allValues](v154->_spatialMappingPointClouds, "allValues");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "addObjectsFromArray:", v141);

    v140 = v154;
    -[NSMutableDictionary removeAllObjects](v154->_spatialMappingPointClouds, "removeAllObjects");
  }
  os_unfair_lock_unlock(&v154->_spatialMappingPointCloudsLock);
  -[ARImageBasedTechnique pushResultData:forTimestamp:](v140, "pushResultData:forTimestamp:", v152, a3);
  if (!obj)
  {
    if (!v139)
      goto LABEL_111;
    goto LABEL_109;
  }
  -[ARWorldTrackingPoseData timestamp](obj, "timestamp");
  if (v139)
LABEL_109:
    objc_msgSend(v139, "timestamp");
LABEL_111:
  objc_msgSend(v139, "timestamp");
  kdebug_trace();

}

- (void)_handleSLAMError:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  ARWorldTrackingErrorData *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  ARWorldTrackingErrorData *v27;
  _BYTE buf[12];
  __int16 v29;
  ARWorldTrackingTechnique *v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "code");
  kdebug_trace();
  _ARLogTechnique();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v7;
    v29 = 2048;
    v30 = self;
    v31 = 2112;
    v32 = *(double *)&v4;
    _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: SLAM error callback: %@", buf, 0x20u);

  }
  v8 = CACurrentMediaTime();
  v9 = objc_msgSend(v4, "code");
  if (v9 == *MEMORY[0x1E0CFC998] || (v10 = objc_msgSend(v4, "code"), v10 == *MEMORY[0x1E0CFC990]))
  {
    _ARLogTechnique();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v13;
      v29 = 2048;
      v30 = self;
      v31 = 2048;
      v32 = v8;
      _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: World tracking encountered a significant drop in sensor data, attempting to relocalize at time %f.", buf, 0x20u);

    }
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    self->_relocalizingAfterSensorDataDrop = 1;
    self->_lastRelocalizationTimestamp = 0.0;
    self->_originTimestamp = 0.0;
    v14 = (ARWorldTrackingErrorData *)-[ARWorldTrackingPoseData copy](self->_cachedPoseData, "copy");
    -[ARWorldTrackingPoseData worldTrackingState](self->_cachedPoseData, "worldTrackingState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setState:", 1);

    -[ARWorldTrackingPoseData worldTrackingState](self->_cachedPoseData, "worldTrackingState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setReason:", 1);

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);
    if (v14)
    {
      v27 = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARImageBasedTechnique pushResultData:forFrame:](self, "pushResultData:forFrame:", v17, 0);

    }
    objc_msgSend(v4, "code");
    kdebug_trace();
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v4, "code");
  if (!CV3DSLAMIsFatalError())
  {
    v26 = objc_msgSend(v4, "code");
    *(_QWORD *)buf = &v26;
    if (v8
       - *((double *)std::__tree<std::__value_type<long,double>,std::__map_value_compare<long,std::__value_type<long,double>,std::less<long>,true>,std::allocator<std::__value_type<long,double>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long &&>,std::tuple<>>((uint64_t **)&self->_lastErrorLogTimestamp, &v26, (uint64_t)&std::piecewise_construct, (uint64_t **)buf)+ 5) > 1.0)
    {
      v26 = objc_msgSend(v4, "code");
      *(_QWORD *)buf = &v26;
      *((double *)std::__tree<std::__value_type<long,double>,std::__map_value_compare<long,std::__value_type<long,double>,std::less<long>,true>,std::allocator<std::__value_type<long,double>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long &&>,std::tuple<>>((uint64_t **)&self->_lastErrorLogTimestamp, &v26, (uint64_t)&std::piecewise_construct, (uint64_t **)buf)+ 5) = v8;
      _ARLogTechnique();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v4, "code");
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v24;
        v29 = 2048;
        v30 = self;
        v31 = 2048;
        v32 = *(double *)&v25;
        _os_log_impl(&dword_1B3A68000, v22, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: World tracking performance is being affected by resource constraints [%li]", buf, 0x20u);

      }
    }
    if (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.worldTracking.warningSounds")))
    {
      softLinkAudioServicesPlaySystemSound(0x3EBu);
    }
    v14 = -[ARWorldTrackingErrorData initWithTimestamp:]([ARWorldTrackingErrorData alloc], "initWithTimestamp:", v8);
    -[ARWorldTrackingErrorData setErrorCode:](v14, "setErrorCode:", objc_msgSend(v4, "code"));
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    objc_storeStrong((id *)&self->_errorData, v14);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);
    objc_msgSend(v4, "code");
    kdebug_trace();
    goto LABEL_10;
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sessionHandleStateSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  self->_sessionHandleState = 4;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sessionHandleStateSemaphore);
  _ARLogTechnique();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v20;
    v29 = 2048;
    v30 = self;
    _os_log_impl(&dword_1B3A68000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: World tracking encountered fatal error.", buf, 0x16u);

  }
  ARErrorWithCodeAndUserInfo(200, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARWorldTrackingTechnique _didFailWithError:](self, "_didFailWithError:", v21);

  objc_msgSend(v4, "code");
  kdebug_trace();
LABEL_11:

}

- (void)_didFailWithError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ARTechnique delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ARTechnique delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "technique:didFailWithError:", self, v7);

  }
}

- (BOOL)hasLoadedSurfaceData
{
  return self->_hasLoadedSurfaceData;
}

- (unint64_t)techniqueIndex
{
  return self->_techniqueIndex;
}

- (void)setTechniqueIndex:(unint64_t)a3
{
  self->_techniqueIndex = a3;
}

- (ARWorldTrackingOptions)mutableOptions
{
  return (ARWorldTrackingOptions *)objc_getProperty(self, a2, 560, 1);
}

- (void)setMutableOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 560);
}

- (double)referenceOriginTransform
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 640), 64, 1, 0);
  return *(double *)&v2;
}

- (void)setReferenceOriginTransform:(__n128)a3
{
  _OWORD v5[4];

  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  v5[3] = a5;
  objc_copyStruct((void *)(a1 + 640), v5, 64, 1, 0);
}

- (CV3DSLAMSession)slamSessionHandle
{
  return self->_slamSessionHandle;
}

- (void)setSlamSessionHandle:(CV3DSLAMSession *)a3
{
  self->_slamSessionHandle = a3;
}

- (CV3DPosePredictionContext)predictorHandle
{
  return self->_predictorHandle;
}

- (void)setPredictorHandle:(CV3DPosePredictionContext *)a3
{
  self->_predictorHandle = a3;
}

- (shared_ptr<RaycastSession>)raycastSession
{
  RaycastSession **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<RaycastSession> result;

  cntrl = self->_raycastSession.__cntrl_;
  *v2 = self->_raycastSession.__ptr_;
  v2[1] = (RaycastSession *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (RaycastSession *)self;
  return result;
}

- (void)setRaycastSession:(shared_ptr<RaycastSession>)a3
{
  std::shared_ptr<RaycastSession>::operator=[abi:ne180100](&self->_raycastSession.__ptr_, (uint64_t *)a3.__ptr_);
}

- (shared_ptr<PlaneDetectionSession>)planeDetectionSession
{
  PlaneDetectionSession **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<PlaneDetectionSession> result;

  cntrl = self->_planeDetectionSession.__cntrl_;
  *v2 = self->_planeDetectionSession.__ptr_;
  v2[1] = (PlaneDetectionSession *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (PlaneDetectionSession *)self;
  return result;
}

- (void)setPlaneDetectionSession:(shared_ptr<PlaneDetectionSession>)a3
{
  std::shared_ptr<RaycastSession>::operator=[abi:ne180100](&self->_planeDetectionSession.__ptr_, (uint64_t *)a3.__ptr_);
}

- (__n128)reconstructionFrameBundleToWorld
{
  return a1[44];
}

- (__n128)setReconstructionFrameBundleToWorld:(__n128)a3
{
  result[44] = a2;
  result[45] = a3;
  result[46] = a4;
  result[47] = a5;
  return result;
}

- (unint64_t)vioSessionIdentifier
{
  return self->_vioSessionIdentifier;
}

- (BOOL)hasQualityKeyframe
{
  return self->_hasQualityKeyframe;
}

- (void)setHasQualityKeyframe:(BOOL)a3
{
  self->_hasQualityKeyframe = a3;
}

- (ARTrackedRaycastPostProcessor)trackedRaycastPostProcessor
{
  return (ARTrackedRaycastPostProcessor *)objc_getProperty(self, a2, 592, 1);
}

- (void)setTrackedRaycastPostProcessor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 592);
}

- (double)extrinsicsToWideSensor
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 768), 64, 1, 0);
  return *(double *)&v2;
}

- (void)setExtrinsicsToWideSensor:(__n128)a3
{
  _OWORD v5[4];

  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  v5[3] = a5;
  objc_copyStruct((void *)(a1 + 768), v5, 64, 1, 0);
}

- (ARSceneReconstructionHandler)sceneReconstructionHandler
{
  return self->_sceneReconstructionHandler;
}

- (void).cxx_destruct
{
  std::shared_ptr<arkit::KeyMapBuffer<void const*,std::vector<unsigned char>>>::~shared_ptr[abi:ne180100]((uint64_t)&self->_planeDetectionSession);
  std::shared_ptr<arkit::KeyMapBuffer<void const*,std::vector<unsigned char>>>::~shared_ptr[abi:ne180100]((uint64_t)&self->_raycastSession);
  objc_storeStrong((id *)&self->_sceneReconstructionHandler, 0);
  objc_storeStrong((id *)&self->_trackedRaycastPostProcessor, 0);
  objc_storeStrong((id *)&self->_mutableOptions, 0);
  objc_storeStrong((id *)&self->_resultDataQueue, 0);
  objc_storeStrong((id *)&self->_spatialMappingObjectRefinementQueue, 0);
  objc_storeStrong((id *)&self->_spatialMappingResultDataWaitingForSemantics, 0);
  objc_storeStrong((id *)&self->_spatialMappingPointClouds, 0);
  objc_storeStrong((id *)&self->_annotateDepthDataKernelFunction, 0);
  objc_storeStrong((id *)&self->_sharedMetalDevice, 0);
  objc_storeStrong((id *)&self->_spatialMappingCommandQueue, 0);
  objc_storeStrong((id *)&self->_meshChunkIdentifiersCurrentlyBeingProcessed, 0);
  objc_storeStrong((id *)&self->_meshChunksWaitingForSemantics, 0);
  objc_storeStrong((id *)&self->_latestSpatialMappingData, 0);
  objc_storeStrong((id *)&self->_participantAnchors, 0);
  objc_storeStrong((id *)&self->_anchorsReceived, 0);

  objc_storeStrong((id *)&self->_resultSemaphore, 0);
  objc_storeStrong((id *)&self->_lastCameraType, 0);
  objc_storeStrong((id *)&self->_cachedPoseData, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
  objc_storeStrong((id *)&self->_sessionHandleStateSemaphore, 0);
  std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)&self->_lastErrorLogTimestamp, (_QWORD *)self->_lastErrorLogTimestamp.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_observersSemaphore, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 13) = (char *)self + 112;
  *((_QWORD *)self + 44) = 0;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 328) = 0u;
  *((_BYTE *)self + 344) = 0;
  *((_QWORD *)self + 76) = 0;
  *((_QWORD *)self + 77) = 0;
  *((_QWORD *)self + 78) = 0;
  *((_QWORD *)self + 79) = 0;
  return self;
}

@end
