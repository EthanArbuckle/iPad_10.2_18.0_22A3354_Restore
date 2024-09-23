@implementation ARBodyTrackingConfiguration

+ (BOOL)isSupported
{
  int v2;

  v2 = +[ARWorldTrackingConfiguration isSupported](ARWorldTrackingConfiguration, "isSupported");
  if (v2)
    LOBYTE(v2) = ARAppleNeuralEngine();
  return v2;
}

+ (id)supportedVideoFormats
{
  void *v2;

  if (objc_msgSend(a1, "isSupported"))
  {
    +[ARWorldTrackingConfiguration supportedVideoFormats](ARWorldTrackingConfiguration, "supportedVideoFormats");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v2;
}

+ (id)recommendedVideoFormatFor4KResolution
{
  return +[ARWorldTrackingConfiguration recommendedVideoFormatFor4KResolution](ARWorldTrackingConfiguration, "recommendedVideoFormatFor4KResolution");
}

+ (id)recommendedVideoFormatForHighResolutionFrameCapturing
{
  return +[ARWorldTrackingConfiguration recommendedVideoFormatForHighResolutionFrameCapturing](ARWorldTrackingConfiguration, "recommendedVideoFormatForHighResolutionFrameCapturing");
}

+ (BOOL)supportsFrameSemantics:(unint64_t)a3
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  objc_super v9;

  if (objc_msgSend(a1, "allowsParallelPersonOcclusion"))
    v5 = 0;
  else
    v5 = 3;
  v6 = objc_msgSend(a1, "allowsParallelSceneDepth");
  v7 = v5 | 0x18;
  if (v6)
    v7 = v5;
  if ((v7 & a3) == 0 && (ARAppleNeuralEngine() & 1) != 0)
    return 1;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___ARBodyTrackingConfiguration;
  return objc_msgSendSuper2(&v9, sel_supportsFrameSemantics_, a3);
}

- (ARBodyTrackingConfiguration)init
{
  ARBodyTrackingConfiguration *v2;
  ARBodyTrackingConfiguration *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARBodyTrackingConfiguration;
  v2 = -[ARConfiguration initPrivate](&v6, sel_initPrivate);
  v3 = v2;
  if (v2)
  {
    -[ARConfiguration setAutoFocusEnabled:](v2, "setAutoFocusEnabled:", 1);
    -[ARBodyTrackingConfiguration setMaximumNumberOfTrackedImages:](v3, "setMaximumNumberOfTrackedImages:", 0);
    v4 = (void *)objc_opt_new();
    -[ARBodyTrackingConfiguration setDetectionImages:](v3, "setDetectionImages:", v4);

    -[ARBodyTrackingConfiguration setWantsHDREnvironmentTextures:](v3, "setWantsHDREnvironmentTextures:", +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.environmentTexturing.wantsHDR")));
    -[ARBodyTrackingConfiguration setLowQosSchedulingEnabled:](v3, "setLowQosSchedulingEnabled:", +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.planeEstimation.enableLowQosScheduling")));
    if (objc_msgSend((id)objc_opt_class(), "supportsFrameSemantics:", 4))
      -[ARConfiguration setFrameSemantics:](v3, "setFrameSemantics:", 4);
    -[ARBodyTrackingConfiguration setAutomaticSkeletonScaleEstimationEnabled:](v3, "setAutomaticSkeletonScaleEstimationEnabled:", 0);
    v3->_alwaysUsePrimaryCameraForTracking = 0;
    v3->_ignoreAppClipCodeURLLimitation = 0;
    v3->_appClipCodeTrackingEnabled = 0;
  }
  return v3;
}

- (void)setMaximumNumberOfTrackedImages:(NSInteger)maximumNumberOfTrackedImages
{
  self->_maximumNumberOfTrackedImages = +[ARODTHandleManager actualNumberOfImagesTracked:](ARODTHandleManager, "actualNumberOfImagesTracked:", maximumNumberOfTrackedImages);
}

- (id)imageSensorSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  objc_class *v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  ARBodyTrackingConfiguration *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)ARBodyTrackingConfiguration;
  -[ARConfiguration imageSensorSettings](&v15, sel_imageSensorSettings);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVisionDataOutputEnabled:", -[ARBodyTrackingConfiguration shouldEnableVisionDataForImageSensorSettings:](self, "shouldEnableVisionDataForImageSensorSettings:", v3));
  if (objc_msgSend(v3, "visionDataOutputEnabled"))
  {
    -[ARBodyTrackingConfiguration _trackingOptions](self, "_trackingOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImageSensorSettings:", v3);
    -[ARBodyTrackingConfiguration imageSensorSettingsForUltraWide](self, "imageSensorSettingsForUltraWide");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImageSensorSettingsForUltraWide:", v5);

    ARVisionDataParametersForWorldTrackingOptions(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "setVisionDataOutputParameters:", v6);
      _ARLogGeneral_27();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v17 = v9;
        v18 = 2048;
        v19 = self;
        v20 = 2114;
        v21 = v6;
        v10 = "%{public}@ <%p>: Setting vision data output parameters for wide: %{public}@";
        v11 = v7;
        v12 = 32;
LABEL_7:
        _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_DEBUG, v10, buf, v12);

      }
    }
    else
    {
      _ARLogGeneral_27();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v17 = v9;
        v18 = 2048;
        v19 = self;
        v10 = "%{public}@ <%p>: Did not receive vision data output parameters for wide.";
        v11 = v7;
        v12 = 22;
        goto LABEL_7;
      }
    }

  }
  return v3;
}

- (id)_trackingOptions
{
  ARWorldTrackingOptions *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(ARWorldTrackingOptions);
  -[ARConfiguration deviceModel](self, "deviceModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARWorldTrackingOptions setDeviceModel:](v3, "setDeviceModel:", v4);

  -[ARWorldTrackingOptions setPlaneDetection:](v3, "setPlaneDetection:", -[ARBodyTrackingConfiguration planeDetection](self, "planeDetection"));
  if (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.planeEstimation.mlOnANEDevices")))
  {
    v5 = ARAppleNeuralEngine();
  }
  else
  {
    v5 = 0;
  }
  -[ARWorldTrackingOptions setMlModelEnabled:](v3, "setMlModelEnabled:", v5);
  -[ARBodyTrackingConfiguration initialWorldMap](self, "initialWorldMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARWorldTrackingOptions setInitialWorldMap:](v3, "setInitialWorldMap:", v6);

  -[ARWorldTrackingOptions setLowQosSchedulingEnabled:](v3, "setLowQosSchedulingEnabled:", -[ARBodyTrackingConfiguration isLowQosSchedulingEnabled](self, "isLowQosSchedulingEnabled"));
  -[ARConfiguration replaySensor](self, "replaySensor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "replayMode"))
    -[ARWorldTrackingOptions setDeterministicMode:](v3, "setDeterministicMode:", 1);
  -[ARWorldTrackingOptions setAlwaysUsePrimaryCameraForTracking:](v3, "setAlwaysUsePrimaryCameraForTracking:", -[ARBodyTrackingConfiguration alwaysUsePrimaryCameraForTracking](self, "alwaysUsePrimaryCameraForTracking"));
  -[ARWorldTrackingOptions setDisableMLRelocalization:](v3, "setDisableMLRelocalization:", -[ARConfiguration disableMLRelocalization](self, "disableMLRelocalization"));

  return v3;
}

- (void)setVideoFormat:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ARBodyTrackingConfiguration;
  -[ARConfiguration setVideoFormat:](&v6, sel_setVideoFormat_, v4);
  if ((objc_msgSend(v4, "has4KVideoResolution") & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isX420PixelFormat");
  -[ARBodyTrackingConfiguration setAlwaysUsePrimaryCameraForTracking:](self, "setAlwaysUsePrimaryCameraForTracking:", v5);

}

- (void)createTechniques:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  const __CFString *v14;
  ARWorldTrackingTechnique *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  ARImageDetectionTechnique *v19;
  void *v20;
  void *v21;
  ARImageDetectionTechnique *v22;
  ARAppClipCodeTechnique *v23;
  void *v24;
  uint64_t v25;
  ARPlaneEstimationTechnique *v26;
  AREnvironmentTexturingTechnique *v27;
  ARParentTechnique *v28;
  void *v29;
  int v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  ARSplitTechniqueSynchronizerTechnique *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  ARFrameRateLimitingStrategy *v54;
  ARSplitTechniqueSynchronizerTechnique *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  ARParentTechnique *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[4];
  id v66;
  objc_super v67;
  void *v68;
  _QWORD v69[2];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  ARBodyTrackingConfiguration *v73;
  __int16 v74;
  const __CFString *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ARBodyTrackingConfiguration _trackingOptions](self, "_trackingOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARBodyTrackingConfiguration imageSensorSettings](self, "imageSensorSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageSensorSettings:", v6);

  -[ARBodyTrackingConfiguration imageSensorSettingsForUltraWide](self, "imageSensorSettingsForUltraWide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageSensorSettingsForUltraWide:", v7);

  if (-[ARBodyTrackingConfiguration environmentTexturing](self, "environmentTexturing"))
    objc_msgSend(v5, "setPlaneDetection:", objc_msgSend(v5, "planeDetection") | 0x80);
  -[ARConfiguration replaySensor](self, "replaySensor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "replayMode"))
    objc_msgSend(v5, "setDeterministicMode:", 1);
  if (objc_msgSend(v5, "planeDetection"))
  {
    v10 = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.worldTracking.accuratePlaneExtentCheck"));
    _ARLogGeneral_27();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("disabled");
      *(_DWORD *)buf = 138543874;
      v71 = v13;
      if (v10)
        v14 = CFSTR("enabled");
      v72 = 2048;
      v73 = self;
      v74 = 2114;
      v75 = v14;
      _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Ray-cast accurate extent check: %{public}@", buf, 0x20u);

    }
    if (v10)
      objc_msgSend(v5, "setPlaneDetection:", objc_msgSend(v5, "planeDetection") | 0x200);
  }
  v15 = -[ARWorldTrackingTechnique initWithOptions:]([ARWorldTrackingTechnique alloc], "initWithOptions:", v5);
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v15);
    -[ARBodyTrackingConfiguration detectionImages](self, "detectionImages");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18)
    {
      v19 = [ARImageDetectionTechnique alloc];
      -[ARBodyTrackingConfiguration detectionImages](self, "detectionImages");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "allObjects");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[ARImageDetectionTechnique initWithReferenceImages:maximumNumberOfTrackedImages:](v19, "initWithReferenceImages:maximumNumberOfTrackedImages:", v21, -[ARBodyTrackingConfiguration maximumNumberOfTrackedImages](self, "maximumNumberOfTrackedImages"));

      -[ARImageDetectionTechnique setEnableAutomaticImageScaleEstimation:](v22, "setEnableAutomaticImageScaleEstimation:", -[ARBodyTrackingConfiguration automaticImageScaleEstimationEnabled](self, "automaticImageScaleEstimationEnabled"));
      objc_msgSend(v16, "addObject:", v22);

    }
    if (-[ARBodyTrackingConfiguration appClipCodeTrackingEnabled](self, "appClipCodeTrackingEnabled"))
    {
      v23 = -[ARAppClipCodeTechnique initWithIgnoreURLLimitation:]([ARAppClipCodeTechnique alloc], "initWithIgnoreURLLimitation:", -[ARBodyTrackingConfiguration ignoreAppClipCodeURLLimitation](self, "ignoreAppClipCodeURLLimitation"));
      objc_msgSend(v16, "addObject:", v23);

    }
    -[ARWorldTrackingTechnique options](v15, "options");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "planeDetection");

    if (v25)
    {
      v26 = -[ARPlaneEstimationTechnique initWithTrackingTechnique:]([ARPlaneEstimationTechnique alloc], "initWithTrackingTechnique:", v15);
      objc_msgSend(v4, "addObject:", v26);

    }
    if (-[ARBodyTrackingConfiguration environmentTexturing](self, "environmentTexturing"))
    {
      v27 = -[AREnvironmentTexturingTechnique initWithOptions:wantsHDREnvironmentTextures:]([AREnvironmentTexturingTechnique alloc], "initWithOptions:wantsHDREnvironmentTextures:", -[ARBodyTrackingConfiguration environmentTexturing](self, "environmentTexturing"), self->_wantsHDREnvironmentTextures);
      objc_msgSend(v4, "addObject:", v27);

    }
    v28 = -[ARParentTechnique initWithParallelTechniques:]([ARParentTechnique alloc], "initWithParallelTechniques:", v16);
    objc_msgSend(v4, "insertObject:atIndex:", v28, 0);
    v67.receiver = self;
    v67.super_class = (Class)ARBodyTrackingConfiguration;
    -[ARConfiguration createTechniques:](&v67, sel_createTechniques_, v4);
    if (-[ARBodyTrackingConfiguration planeDetection](self, "planeDetection"))
    {
      -[ARBodyTrackingConfiguration _trackingOptions](self, "_trackingOptions");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "mlModelEnabled");

      if (v30)
      {
        v31 = ARDeviceSupportsJasper();
        v32 = -[ARConfiguration maxUltrawideImageForwardingFrameRate](self, "maxUltrawideImageForwardingFrameRate");
        if (v31)
          ARAddJasperTechniquesToParent(v28, v4, 1, 0, v32);
        else
          ARAddNonJasperSemanticsToParent(v28, v4, v32, 1);
      }
    }
    if ((-[ARConfiguration frameSemantics](self, "frameSemantics") & 4) != 0)
    {
      v61 = v28;
      +[ARParentTechnique parentTechniqueOfClass:inArray:](ARParentTechnique, "parentTechniqueOfClass:inArray:", objc_opt_class(), v4);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v33, "techniques");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "arrayWithArray:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = objc_opt_new();
      v38 = (void *)objc_opt_new();
      objc_msgSend(v38, "setAutomaticSkeletonScaleEstimationEnabled:", -[ARBodyTrackingConfiguration automaticSkeletonScaleEstimationEnabled](self, "automaticSkeletonScaleEstimationEnabled"));
      v39 = (void *)objc_opt_new();
      v62 = (void *)v37;
      objc_msgSend(v36, "addObject:", v37);
      v63 = v36;
      v64 = v33;
      objc_msgSend(v33, "setTechniques:", v36);
      objc_msgSend(v4, "addObject:", v38);
      objc_msgSend(v4, "addObject:", v39);
      v40 = (void *)MEMORY[0x1E0C99E60];
      v69[0] = objc_opt_class();
      v69[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setWithArray:", v41);
      v42 = objc_claimAutoreleasedReturnValue();

      v60 = (void *)v42;
      v43 = -[ARSplitTechniqueSynchronizerTechnique initWithSynchronizedResultDataClasses:]([ARSplitTechniqueSynchronizerTechnique alloc], "initWithSynchronizedResultDataClasses:", v42);
      objc_msgSend(v4, "insertObject:atIndex:", v43, objc_msgSend(v4, "indexOfObjectPassingTest:", &__block_literal_global_70));
      v44 = (void *)objc_opt_new();
      objc_msgSend(v44, "setDelegate:", v43);
      v68 = v44;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v39;
      objc_msgSend(v39, "setSplitTechniques:", v45);

      if (ARDeviceSupportsJasper())
      {
        v46 = objc_alloc(MEMORY[0x1E0C99E60]);
        v47 = objc_opt_class();
        v48 = (void *)objc_msgSend(v46, "initWithObjects:", v47, objc_opt_class(), 0);
        v49 = (void *)MEMORY[0x1E0CB3880];
        v65[0] = MEMORY[0x1E0C809B0];
        v65[1] = 3221225472;
        v65[2] = __48__ARBodyTrackingConfiguration_createTechniques___block_invoke_2;
        v65[3] = &unk_1E6674940;
        v58 = v48;
        v66 = v58;
        objc_msgSend(v49, "predicateWithBlock:", v65);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        +[ARTechnique techniqueMatchingPredicate:inArray:](ARTechnique, "techniqueMatchingPredicate:inArray:", v50, v4);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v51)
        {
          +[ARParentTechnique parentTechniqueOfClass:inArray:](ARParentTechnique, "parentTechniqueOfClass:inArray:", objc_opt_class(), v4);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = (void *)objc_opt_new();
          objc_msgSend(v56, "splitTechniques");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "arrayByAddingObject:", v57);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setSplitTechniques:", v53);

          v54 = -[ARFrameRateLimitingStrategy initWithFrameRate:]([ARFrameRateLimitingStrategy alloc], "initWithFrameRate:", 10);
          objc_msgSend(v56, "setSplitTechniqueFowardingStrategy:", v54);

          v55 = -[ARSplitTechniqueSynchronizerTechnique initWithSynchronizedResultDataClasses:]([ARSplitTechniqueSynchronizerTechnique alloc], "initWithSynchronizedResultDataClasses:", v58);
          objc_msgSend(v57, "setDelegate:", v55);
          objc_msgSend(v4, "insertObject:atIndex:", v55, 0);

          v51 = 0;
        }

      }
      v28 = v61;
    }

  }
}

BOOL __48__ARBodyTrackingConfiguration_createTechniques___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
    objc_msgSend(v3, "techniqueOfClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v2, "techniqueOfClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4 != 0;
}

uint64_t __48__ARBodyTrackingConfiguration_createTechniques___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "synchronizedResultDataClasses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isSubsetOfSet:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)setAllowsParallelPersonOcclusion:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (s_allowsParallelPersonOcclusion != a3)
  {
    v3 = a3;
    s_allowsParallelPersonOcclusion = a3;
    _ARLogGeneral_27();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543874;
      v9 = v7;
      v10 = 2048;
      v11 = a1;
      v12 = 1024;
      v13 = v3;
      _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Setting parallel person occlusion to '%d'", (uint8_t *)&v8, 0x1Cu);

    }
  }
}

+ (BOOL)allowsParallelPersonOcclusion
{
  return s_allowsParallelPersonOcclusion;
}

+ (void)setAllowsParallelSceneDepth:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (s_allowsParallelSceneDepth != a3)
  {
    v3 = a3;
    s_allowsParallelSceneDepth = a3;
    _ARLogGeneral_27();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543874;
      v9 = v7;
      v10 = 2048;
      v11 = a1;
      v12 = 1024;
      v13 = v3;
      _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Setting parallel scene depth to '%d'", (uint8_t *)&v8, 0x1Cu);

    }
  }
}

+ (BOOL)allowsParallelSceneDepth
{
  return s_allowsParallelSceneDepth;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  ARWorldMap *initialWorldMap;
  ARWorldMap *v8;
  NSSet *detectionImages;
  NSSet *v10;
  int automaticImageScaleEstimationEnabled;
  int automaticSkeletonScaleEstimationEnabled;
  int alwaysUsePrimaryCameraForTracking;
  int ignoreAppClipCodeURLLimitation;
  int appClipCodeTrackingEnabled;
  BOOL v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ARBodyTrackingConfiguration;
  if (-[ARConfiguration isEqual:](&v18, sel_isEqual_, v4))
  {
    v5 = (unsigned __int8 *)v4;
    v6 = v5;
    if (self->_planeDetection == *((_QWORD *)v5 + 17)
      && self->_environmentTexturing == *((_QWORD *)v5 + 16)
      && self->_wantsHDREnvironmentTextures == v5[112])
    {
      initialWorldMap = self->_initialWorldMap;
      objc_msgSend(v5, "initialWorldMap");
      v8 = (ARWorldMap *)objc_claimAutoreleasedReturnValue();
      if (initialWorldMap == v8 || -[ARWorldMap isEqual:](self->_initialWorldMap, "isEqual:", *((_QWORD *)v6 + 15)))
      {
        detectionImages = self->_detectionImages;
        objc_msgSend(v6, "detectionImages");
        v10 = (NSSet *)objc_claimAutoreleasedReturnValue();
        if ((detectionImages == v10
           || -[NSSet isEqual:](self->_detectionImages, "isEqual:", *((_QWORD *)v6 + 18)))
          && self->_maximumNumberOfTrackedImages == *((_QWORD *)v6 + 19)
          && (automaticImageScaleEstimationEnabled = self->_automaticImageScaleEstimationEnabled,
              automaticImageScaleEstimationEnabled == objc_msgSend(v6, "automaticImageScaleEstimationEnabled"))&& (automaticSkeletonScaleEstimationEnabled = self->_automaticSkeletonScaleEstimationEnabled, automaticSkeletonScaleEstimationEnabled == objc_msgSend(v6, "automaticSkeletonScaleEstimationEnabled"))&& self->_lowQosSchedulingEnabled == v6[118]&& (alwaysUsePrimaryCameraForTracking = self->_alwaysUsePrimaryCameraForTracking, alwaysUsePrimaryCameraForTracking == objc_msgSend(v6, "alwaysUsePrimaryCameraForTracking"))&& (ignoreAppClipCodeURLLimitation = self->_ignoreAppClipCodeURLLimitation, ignoreAppClipCodeURLLimitation == objc_msgSend(v6, "ignoreAppClipCodeURLLimitation")))
        {
          appClipCodeTrackingEnabled = self->_appClipCodeTrackingEnabled;
          v16 = appClipCodeTrackingEnabled == objc_msgSend(v6, "appClipCodeTrackingEnabled");
        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ARBodyTrackingConfiguration;
  v5 = -[ARConfiguration copyWithZone:](&v9, sel_copyWithZone_);
  *((_QWORD *)v5 + 17) = self->_planeDetection;
  *((_QWORD *)v5 + 16) = self->_environmentTexturing;
  *((_BYTE *)v5 + 112) = self->_wantsHDREnvironmentTextures;
  objc_storeStrong((id *)v5 + 15, self->_initialWorldMap);
  v6 = -[NSSet copyWithZone:](self->_detectionImages, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 18);
  *((_QWORD *)v5 + 18) = v6;

  *((_QWORD *)v5 + 19) = self->_maximumNumberOfTrackedImages;
  *((_BYTE *)v5 + 113) = self->_automaticImageScaleEstimationEnabled;
  *((_BYTE *)v5 + 114) = self->_automaticSkeletonScaleEstimationEnabled;
  *((_BYTE *)v5 + 118) = self->_lowQosSchedulingEnabled;
  *((_BYTE *)v5 + 117) = self->_alwaysUsePrimaryCameraForTracking;
  *((_BYTE *)v5 + 116) = self->_ignoreAppClipCodeURLLimitation;
  *((_BYTE *)v5 + 115) = self->_appClipCodeTrackingEnabled;
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARConfiguration descriptionWithoutBrackets](self, "descriptionWithoutBrackets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v7);

  if (-[ARConfiguration isAutoFocusEnabled](self, "isAutoFocusEnabled"))
    v8 = CFSTR("Enabled");
  else
    v8 = CFSTR("Disabled");
  objc_msgSend(v6, "appendFormat:", CFSTR(" autoFocus=%@"), v8);
  NSStringFromAREnvironmentTexturing(self->_environmentTexturing);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" environmentTexturing=%@"), v9);

  if (-[ARBodyTrackingConfiguration wantsHDREnvironmentTextures](self, "wantsHDREnvironmentTextures"))
    v10 = CFSTR("Enabled");
  else
    v10 = CFSTR("Disabled");
  objc_msgSend(v6, "appendFormat:", CFSTR(" wantsHDREnvironmentTextures=%@"), v10);
  NSStringFromARPlaneDetection(self->_planeDetection);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" planeDetection=%@"), v11);

  -[ARBodyTrackingConfiguration initialWorldMap](self, "initialWorldMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[ARBodyTrackingConfiguration initialWorldMap](self, "initialWorldMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" initialWorldMap=%@"), v13);

  }
  -[ARBodyTrackingConfiguration detectionImages](self, "detectionImages");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    objc_msgSend(v6, "appendFormat:", CFSTR(" maximumNumberOfTrackedImages=%ld"), -[ARBodyTrackingConfiguration maximumNumberOfTrackedImages](self, "maximumNumberOfTrackedImages"));
    if (-[ARBodyTrackingConfiguration automaticImageScaleEstimationEnabled](self, "automaticImageScaleEstimationEnabled"))
    {
      v16 = CFSTR("Enabled");
    }
    else
    {
      v16 = CFSTR("Disabled");
    }
    objc_msgSend(v6, "appendFormat:", CFSTR(" automaticImageScaleEstimation=%@"), v16);
    -[ARBodyTrackingConfiguration detectionImages](self, "detectionImages");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");
    -[ARBodyTrackingConfiguration detectionImages](self, "detectionImages");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ar_map:", &__block_literal_global_67);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR(", "));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" detectionImages=[count: %ld, %@]"), v18, v22);

  }
  if (-[ARBodyTrackingConfiguration automaticSkeletonScaleEstimationEnabled](self, "automaticSkeletonScaleEstimationEnabled"))
  {
    v23 = CFSTR("Enabled");
  }
  else
  {
    v23 = CFSTR("Disabled");
  }
  objc_msgSend(v6, "appendFormat:", CFSTR(" automaticSkeletonScaleEstimation=%@"), v23);
  if (-[ARBodyTrackingConfiguration appClipCodeTrackingEnabled](self, "appClipCodeTrackingEnabled"))
    v24 = CFSTR("Enabled");
  else
    v24 = CFSTR("Disabled");
  objc_msgSend(v6, "appendFormat:", CFSTR(" appClipCodeTracking=%@"), v24);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

uint64_t __42__ARBodyTrackingConfiguration_description__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shortDebugDescription");
}

+ (BOOL)supportsUserFaceTracking
{
  return 0;
}

+ (BOOL)supportsAppClipCodeTracking
{
  return (ARAppleNeuralEngine() & 1) != 0
      || +[ARAppClipCodeTechnique shouldRunCameraOrScannerPerformanceTestingMode](ARAppClipCodeTechnique, "shouldRunCameraOrScannerPerformanceTestingMode");
}

- (BOOL)appClipCodeTrackingEnabled
{
  if (self->_appClipCodeTrackingEnabled)
    return objc_msgSend((id)objc_opt_class(), "supportsAppClipCodeTracking");
  else
    return 0;
}

- (id)parentImageSensorSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ARBodyTrackingConfiguration;
  -[ARConfiguration parentImageSensorSettings](&v10, sel_parentImageSensorSettings);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (objc_msgSend((id)objc_opt_class(), "supportsUserFaceTracking")
    && !+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.worldTracking.forceDisableFrontCamera")))
  {
    -[ARBodyTrackingConfiguration imageSensorSettingsForUserFaceTracking](self, "imageSensorSettingsForUserFaceTracking");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", 0);
    if (v6)
      objc_msgSend(v5, "addObject:", v6);

  }
  -[ARBodyTrackingConfiguration imageSensorSettingsForUltraWide](self, "imageSensorSettingsForUltraWide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v5, "addObject:", v7);
  -[ARConfiguration depthSensorSettingsForJasper](self, "depthSensorSettingsForJasper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v5, "addObject:", v8);
  objc_msgSend(v3, "setSettings:", v5);

  return v3;
}

+ (id)_querySupportedVideoFormatsForUltraWide
{
  id v3;
  _BOOL8 v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  void *v33;
  id v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  double v41;
  __int16 v42;
  unsigned int v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = (id)*MEMORY[0x1E0C89F98];
  v4 = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.imagesensor.back.ultrawide.videoBinned"));
  +[ARKitUserDefaults resolutionDictionaryForKey:](ARKitUserDefaults, "resolutionDictionaryForKey:", CFSTR("com.apple.arkit.imagesensor.back.ultrawide.resolution"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("width"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("height"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7)
      v10 = v8 == 0;
    else
      v10 = 1;
    if (v10)
    {
      v12 = 480;
      v11 = 640;
    }
    else
    {
      v34 = a1;
      v11 = objc_msgSend(v7, "intValue");
      v12 = objc_msgSend(v9, "intValue");
      _ARLogSensor_6();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v37 = v33;
        v38 = 2048;
        v39 = v34;
        v40 = 2112;
        v41 = *(double *)&v3;
        v42 = 1024;
        v43 = v11;
        v44 = 1024;
        v45 = v12;
        _os_log_impl(&dword_1B3A68000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: ARVideoFormat resolution for %@ set to %i, %i by user defaults", buf, 0x2Cu);

      }
      a1 = v34;
    }

  }
  else
  {
    v12 = 480;
    v11 = 640;
  }
  +[ARKitUserDefaults valueForKey:](ARKitUserDefaults, "valueForKey:", CFSTR("com.apple.arkit.imagesensor.back.ultrawide.frameRate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "doubleValue");
    v19 = v18;
    _ARLogSensor_6();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v22;
      v38 = 2048;
      v39 = a1;
      v40 = 2048;
      v41 = v19;
      _os_log_impl(&dword_1B3A68000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: ARVideoFormat frame rate set to %f by user defaults", buf, 0x20u);

    }
  }
  else
  {
    v19 = 10.0;
  }
  +[ARVideoFormat bestVideoFormatForDevicePosition:deviceType:resolution:frameRate:videoBinned:](ARVideoFormat, "bestVideoFormatForDevicePosition:deviceType:resolution:frameRate:videoBinned:", 1, v3, v11 | (unint64_t)(v12 << 32), v4, v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "imageResolution");
    if (+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:](ARWorldTrackingTechnique, "supportsVideoResolution:forDeviceType:", v3))
    {
      v35 = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
    _ARLogGeneral_27();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v28;
      v38 = 2048;
      v39 = a1;
      v40 = 2114;
      v41 = *(double *)&v24;
      _os_log_impl(&dword_1B3A68000, v26, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Not returning video format %{public}@ because world tracking technique does not support its video resolution on current device", buf, 0x20u);

    }
  }
  _ARLogGeneral_27();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v37 = v31;
    v38 = 2048;
    v39 = a1;
    _os_log_impl(&dword_1B3A68000, v29, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Video format not found for using ultra wide in world tracking", buf, 0x16u);

  }
  v25 = (void *)MEMORY[0x1E0C9AA60];
LABEL_28:

  return v25;
}

+ (id)supportedVideoFormatsForUltraWide
{
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD block[5];

  if (objc_msgSend(a1, "isSupported"))
  {
    if (supportedVideoFormatsForUltraWide_supportedFormats_0
      && !objc_msgSend((id)supportedVideoFormatsForUltraWide_supportedFormats_0, "count"))
    {
      objc_msgSend(a1, "_querySupportedVideoFormatsForUltraWide");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)supportedVideoFormatsForUltraWide_supportedFormats_0;
      supportedVideoFormatsForUltraWide_supportedFormats_0 = v3;

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__ARBodyTrackingConfiguration_supportedVideoFormatsForUltraWide__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (supportedVideoFormatsForUltraWide_onceToken_0 != -1)
      dispatch_once(&supportedVideoFormatsForUltraWide_onceToken_0, block);
    v5 = (id)supportedVideoFormatsForUltraWide_supportedFormats_0;
  }
  else
  {
    v5 = (id)MEMORY[0x1E0C9AA60];
  }
  return v5;
}

void __64__ARBodyTrackingConfiguration_supportedVideoFormatsForUltraWide__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_querySupportedVideoFormatsForUltraWide");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)supportedVideoFormatsForUltraWide_supportedFormats_0;
  supportedVideoFormatsForUltraWide_supportedFormats_0 = v1;

}

- (id)imageSensorSettingsForUserFaceTracking
{
  void *v3;
  void *v4;
  ARImageSensorSettings *v5;

  objc_msgSend((id)objc_opt_class(), "supportedVideoFormatsForUserFaceTracking");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[ARImageSensorSettings initWithVideoFormat:]([ARImageSensorSettings alloc], "initWithVideoFormat:", v4);
    -[ARImageSensorSettings setAutoFocusEnabled:](v5, "setAutoFocusEnabled:", -[ARConfiguration isAutoFocusEnabled](self, "isAutoFocusEnabled"));
    -[ARImageSensorSettings setMirrorVideoOutput:](v5, "setMirrorVideoOutput:", 1);
    -[ARImageSensorSettings setCalibrationDataOutputEnabled:](v5, "setCalibrationDataOutputEnabled:", 0);
    -[ARImageSensorSettings setMetaData:](v5, "setMetaData:", *MEMORY[0x1E0C8AA68]);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (ARImageSensorSettings)imageSensorSettingsForUltraWide
{
  void *v3;
  void *v4;
  ARImageSensorSettings *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  objc_class *v17;
  int v18;
  void *v19;
  __int16 v20;
  ARBodyTrackingConfiguration *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!-[ARBodyTrackingConfiguration shouldUseUltraWide](self, "shouldUseUltraWide"))
    return (ARImageSensorSettings *)0;
  objc_msgSend((id)objc_opt_class(), "supportedVideoFormatsForUltraWide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[ARImageSensorSettings initWithVideoFormat:]([ARImageSensorSettings alloc], "initWithVideoFormat:", v4);
    LODWORD(v6) = 1126170624;
    -[ARImageSensorSettings setMaxGainOverride:](v5, "setMaxGainOverride:", v6);
    -[ARImageSensorSettings setVisionDataOutputEnabled:](v5, "setVisionDataOutputEnabled:", -[ARBodyTrackingConfiguration shouldEnableVisionDataForImageSensorSettings:](self, "shouldEnableVisionDataForImageSensorSettings:", v5));
    if (-[ARImageSensorSettings visionDataOutputEnabled](v5, "visionDataOutputEnabled"))
    {
      -[ARBodyTrackingConfiguration _trackingOptions](self, "_trackingOptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARBodyTrackingConfiguration imageSensorSettings](self, "imageSensorSettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setImageSensorSettings:", v8);

      objc_msgSend(v7, "setImageSensorSettingsForUltraWide:", v5);
      ARVisionDataParametersForWorldTrackingOptions(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[ARImageSensorSettings setVisionDataOutputParameters:](v5, "setVisionDataOutputParameters:", v9);
        _ARLogGeneral_27();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          v11 = (objc_class *)objc_opt_class();
          NSStringFromClass(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543874;
          v19 = v12;
          v20 = 2048;
          v21 = self;
          v22 = 2114;
          v23 = v9;
          v13 = "%{public}@ <%p>: Setting vision data output parameters for ultra wide: %{public}@";
          v14 = v10;
          v15 = 32;
LABEL_11:
          _os_log_impl(&dword_1B3A68000, v14, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&v18, v15);

        }
      }
      else
      {
        _ARLogGeneral_27();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543618;
          v19 = v12;
          v20 = 2048;
          v21 = self;
          v13 = "%{public}@ <%p>: Did not receive vision data output parameters for ultra wide.";
          v14 = v10;
          v15 = 22;
          goto LABEL_11;
        }
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldUseUltraWide
{
  BOOL v2;
  void *v3;

  if (!ARDeviceSupportsUltraWideCamera())
    return 0;
  if ((ARDeviceSupportsJasper() & 1) == 0)
  {
    if (ARDeviceSupportsMulticamMode() && ARUserDefaultsMulticamModeEnabled())
    {
      objc_msgSend((id)objc_opt_class(), "supportedVideoFormatsForUltraWide");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = objc_msgSend(v3, "count") != 0;

      return v2;
    }
    return 0;
  }
  return 1;
}

- (BOOL)shouldEnableVisionDataForImageSensorSettings:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void **v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;

  objc_msgSend(a3, "videoFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && ((v5 = -[ARBodyTrackingConfiguration shouldUseUltraWide](self, "shouldUseUltraWide"),
         objc_msgSend(v4, "captureDeviceType"),
         v6 = (void *)objc_claimAutoreleasedReturnValue(),
         v7 = v6,
         !v5)
      ? (v8 = (void **)MEMORY[0x1E0C89FA0])
      : (v8 = (void **)MEMORY[0x1E0C89F98]),
        v9 = *v8,
        v6,
        v7 == v9))
  {
    -[ARBodyTrackingConfiguration _trackingOptions](self, "_trackingOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "slamConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("MeasureApp"));

    if (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.worldTracking.visionData")))
    {
      v10 = (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.worldTracking.simulateHWFeatureDetection")) | v13) ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (ARWorldMap)initialWorldMap
{
  return self->_initialWorldMap;
}

- (void)setInitialWorldMap:(ARWorldMap *)initialWorldMap
{
  objc_storeStrong((id *)&self->_initialWorldMap, initialWorldMap);
}

- (AREnvironmentTexturing)environmentTexturing
{
  return self->_environmentTexturing;
}

- (void)setEnvironmentTexturing:(AREnvironmentTexturing)environmentTexturing
{
  self->_environmentTexturing = environmentTexturing;
}

- (BOOL)wantsHDREnvironmentTextures
{
  return self->_wantsHDREnvironmentTextures;
}

- (void)setWantsHDREnvironmentTextures:(BOOL)wantsHDREnvironmentTextures
{
  self->_wantsHDREnvironmentTextures = wantsHDREnvironmentTextures;
}

- (ARPlaneDetection)planeDetection
{
  return self->_planeDetection;
}

- (void)setPlaneDetection:(ARPlaneDetection)planeDetection
{
  self->_planeDetection = planeDetection;
}

- (NSSet)detectionImages
{
  return self->_detectionImages;
}

- (void)setDetectionImages:(NSSet *)detectionImages
{
  objc_setProperty_nonatomic_copy(self, a2, detectionImages, 144);
}

- (BOOL)automaticImageScaleEstimationEnabled
{
  return self->_automaticImageScaleEstimationEnabled;
}

- (void)setAutomaticImageScaleEstimationEnabled:(BOOL)automaticImageScaleEstimationEnabled
{
  self->_automaticImageScaleEstimationEnabled = automaticImageScaleEstimationEnabled;
}

- (BOOL)automaticSkeletonScaleEstimationEnabled
{
  return self->_automaticSkeletonScaleEstimationEnabled;
}

- (void)setAutomaticSkeletonScaleEstimationEnabled:(BOOL)automaticSkeletonScaleEstimationEnabled
{
  self->_automaticSkeletonScaleEstimationEnabled = automaticSkeletonScaleEstimationEnabled;
}

- (NSInteger)maximumNumberOfTrackedImages
{
  return self->_maximumNumberOfTrackedImages;
}

- (void)setAppClipCodeTrackingEnabled:(BOOL)appClipCodeTrackingEnabled
{
  self->_appClipCodeTrackingEnabled = appClipCodeTrackingEnabled;
}

- (BOOL)ignoreAppClipCodeURLLimitation
{
  return self->_ignoreAppClipCodeURLLimitation;
}

- (void)setIgnoreAppClipCodeURLLimitation:(BOOL)a3
{
  self->_ignoreAppClipCodeURLLimitation = a3;
}

- (BOOL)alwaysUsePrimaryCameraForTracking
{
  return self->_alwaysUsePrimaryCameraForTracking;
}

- (void)setAlwaysUsePrimaryCameraForTracking:(BOOL)a3
{
  self->_alwaysUsePrimaryCameraForTracking = a3;
}

- (BOOL)isLowQosSchedulingEnabled
{
  return self->_lowQosSchedulingEnabled;
}

- (void)setLowQosSchedulingEnabled:(BOOL)a3
{
  self->_lowQosSchedulingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectionImages, 0);
  objc_storeStrong((id *)&self->_initialWorldMap, 0);
}

@end
