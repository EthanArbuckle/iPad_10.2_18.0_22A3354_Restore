@implementation ARWorldTrackingConfiguration

+ (BOOL)isSupported
{
  unsigned int v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___ARWorldTrackingConfiguration;
  v2 = objc_msgSendSuper2(&v4, sel_isSupported);
  if (v2)
    LOBYTE(v2) = +[ARWorldTrackingTechnique isSupported](ARWorldTrackingTechnique, "isSupported");
  return v2;
}

- (ARWorldTrackingConfiguration)init
{
  ARWorldTrackingConfiguration *v2;
  uint64_t v3;
  uint64_t v4;
  NSSet *detectionImages;
  uint64_t v6;
  NSSet *detectionObjects;
  void *v8;
  double v9;
  int v10;
  NSString *slamConfiguration;
  uint64_t v12;
  ARSceneReconstructionOptions *sceneReconstructionOptions;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ARWorldTrackingConfiguration;
  v2 = -[ARConfiguration initPrivate](&v15, sel_initPrivate);
  if (v2)
  {
    if (ARShouldSupport1440pAndAutofocus())
    {
      -[ARConfiguration setAutoFocusEnabled:](v2, "setAutoFocusEnabled:", 1);
      -[ARWorldTrackingConfiguration setMaximumNumberOfTrackedImages:](v2, "setMaximumNumberOfTrackedImages:", 0);
    }
    if (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.environmentTexturing.wantsHDR")))
    {
      v3 = ARLinkedOnOrAfterYukon();
    }
    else
    {
      v3 = 0;
    }
    -[ARWorldTrackingConfiguration setWantsHDREnvironmentTextures:](v2, "setWantsHDREnvironmentTextures:", v3);
    v4 = objc_opt_new();
    detectionImages = v2->_detectionImages;
    v2->_detectionImages = (NSSet *)v4;

    v6 = objc_opt_new();
    detectionObjects = v2->_detectionObjects;
    v2->_detectionObjects = (NSSet *)v6;

    v8 = (void *)objc_opt_new();
    v2->_relocalizationEnabled = objc_msgSend(v8, "relocalizationEnabled");
    objc_msgSend(v8, "minVergenceAngle");
    v2->_minVergenceAngle = v9;
    v10 = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.planeEstimation.mlOnANEDevices"));
    if (v10)
      LOBYTE(v10) = ARAppleNeuralEngine();
    v2->_mlModelEnabled = v10;
    v2->_lowQosSchedulingEnabled = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.planeEstimation.enableLowQosScheduling"));
    v2->_accuratePlaneExtentCheckEnabled = 1;
    slamConfiguration = v2->_slamConfiguration;
    v2->_slamConfiguration = (NSString *)CFSTR("ARKitiOS");

    v2->_userFaceTrackingEnabled = 0;
    *(_WORD *)&v2->_shouldUseUltraWideIfAvailable = 1;
    v2->_depthOptimizedForStaticScene = 0;
    v2->_alwaysUsePrimaryCameraForTracking = 0;
    v2->_ignoreAppClipCodeURLLimitation = 0;
    v2->_appClipCodeTrackingEnabled = 0;
    v12 = objc_opt_new();
    sceneReconstructionOptions = v2->_sceneReconstructionOptions;
    v2->_sceneReconstructionOptions = (ARSceneReconstructionOptions *)v12;

    v2->_recordForGeoTracking = 0;
    v2->_planeBundleAdjustmentEnabled = 0;

  }
  return v2;
}

+ (void)setShouldProvide30FPSVideoFormats:(BOOL)a3
{
  void *v3;

  if (s_provide30FPSVideoFormats != a3)
  {
    s_provide30FPSVideoFormats = a3;
    v3 = (void *)s_supportedFormatsCache;
    if (s_supportedFormatsCache)
    {
      s_supportedFormatsCache = MEMORY[0x1E0C9AA60];

    }
  }
}

+ (BOOL)shouldProvide30FPSVideoFormats
{
  BOOL result;

  result = ARLinkedOnOrAfterSydney();
  if (s_provide30FPSVideoFormats)
    return 1;
  return result;
}

+ (id)_querySupportedVideoFormats
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = (id)*MEMORY[0x1E0C89FA0];
  v4 = (void *)objc_opt_new();
  if ((ARLinkedOnOrAfterSydney() & 1) != 0 || !objc_msgSend(a1, "shouldProvide30FPSVideoFormats"))
  {
    +[ARVideoFormat supportedVideoFormatsForDevicePosition:deviceType:](ARVideoFormat, "supportedVideoFormatsForDevicePosition:deviceType:", 1, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[ARVideoFormat supportedVideoFormatsForDevicePosition:deviceType:frameRate:](ARVideoFormat, "supportedVideoFormatsForDevicePosition:deviceType:frameRate:", 1, v3, 30.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
  v30 = v4;
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v36;
    *(_QWORD *)&v8 = 138543874;
    v28 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v12, "imageResolution", v28);
        if (+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:](ARWorldTrackingTechnique, "supportsVideoResolution:forDeviceType:", v3))
        {
          objc_msgSend(v4, "addObject:", v12);
        }
        else
        {
          _ARLogGeneral_14();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            v14 = (objc_class *)objc_opt_class();
            NSStringFromClass(v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v28;
            v41 = v15;
            v42 = 2048;
            v43 = a1;
            v44 = 2114;
            v45 = v12;
            _os_log_impl(&dword_1B3A68000, v13, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Filtering out video format %{public}@ because world tracking technique does not support its video resolution on current device", buf, 0x20u);

            v4 = v30;
          }

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
    }
    while (v9);
  }

  if (ARLinkedOnOrAfterSydney())
  {
    +[ARVideoFormat supportedVideoFormatsForStillImageCapture](ARVideoFormat, "supportedVideoFormatsForStillImageCapture");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v6 = v16;
    v17 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v17)
    {
      v19 = v17;
      v20 = *(_QWORD *)v32;
      *(_QWORD *)&v18 = 138543874;
      v29 = v18;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(v6);
          v22 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
          objc_msgSend(v22, "imageResolution", v29);
          if (+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:](ARWorldTrackingTechnique, "supportsVideoResolution:forDeviceType:", v3))
          {
            objc_msgSend(v4, "addObject:", v22);
          }
          else
          {
            _ARLogGeneral_14();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              v24 = (objc_class *)objc_opt_class();
              NSStringFromClass(v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v29;
              v41 = v25;
              v42 = 2048;
              v43 = a1;
              v44 = 2114;
              v45 = v22;
              _os_log_impl(&dword_1B3A68000, v23, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Filtering out video format %{public}@ because world tracking technique does not support its video resolution on current device", buf, 0x20u);

              v4 = v30;
            }

          }
        }
        v19 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v19);
    }

    +[ARVideoFormat supportedVideoFormatsForHiResOrX420](ARVideoFormat, "supportedVideoFormatsForHiResOrX420");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v26);

  }
  return v4;
}

+ (id)supportedVideoFormats
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD block[5];

  if (objc_msgSend(a1, "isSupported"))
  {
    if (s_supportedFormatsCache && !objc_msgSend((id)s_supportedFormatsCache, "count"))
    {
      objc_msgSend(a1, "_querySupportedVideoFormats");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)s_supportedFormatsCache;
      s_supportedFormatsCache = v3;

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__ARWorldTrackingConfiguration_supportedVideoFormats__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (supportedVideoFormats_onceToken_0 != -1)
      dispatch_once(&supportedVideoFormats_onceToken_0, block);
    v5 = (id)s_supportedFormatsCache;
    if ((objc_msgSend((id)objc_opt_class(), "shouldProvideX420VideoFormat") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_40);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v7;
    }
    if ((objc_msgSend((id)objc_opt_class(), "shouldProvideNonBinnedVideoFormats") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_13_0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "filteredArrayUsingPredicate:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      return v9;
    }
  }
  else
  {
    v5 = (id)MEMORY[0x1E0C9AA60];
  }
  return v5;
}

void __53__ARWorldTrackingConfiguration_supportedVideoFormats__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_querySupportedVideoFormats");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)s_supportedFormatsCache;
  s_supportedFormatsCache = v1;

}

uint64_t __53__ARWorldTrackingConfiguration_supportedVideoFormats__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isX420PixelFormat") ^ 1;
}

uint64_t __53__ARWorldTrackingConfiguration_supportedVideoFormats__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "deviceFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVideoBinned");

  return v3;
}

+ (id)recommendedVideoFormatFor4KResolution
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_14);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "supportedVideoFormats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __69__ARWorldTrackingConfiguration_recommendedVideoFormatFor4KResolution__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "has4KVideoResolution");
}

+ (id)recommendedVideoFormatForHighResolutionFrameCapturing
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_15);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "supportedVideoFormats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __85__ARWorldTrackingConfiguration_recommendedVideoFormatForHighResolutionFrameCapturing__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isRecommendedForHighResolutionFrameCapturing");
}

+ (id)_querySupportedVideoFormatsForUserFaceTracking
{
  id v3;
  NSObject *v4;
  void *v5;
  objc_class *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = (id)*MEMORY[0x1E0C89FA0];
  +[ARVideoFormat bestVideoFormatForDevicePosition:deviceType:resolution:frameRates:videoBinned:](ARVideoFormat, "bestVideoFormatForDevicePosition:deviceType:resolution:frameRates:videoBinned:", 2, v3, 0x2D000000500, &unk_1E66CEBE0, 1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    || (+[ARFaceTrackingConfiguration fallbackVideoFormatWithCaptureDeviceType:](ARFaceTrackingConfiguration, "fallbackVideoFormatWithCaptureDeviceType:", v3), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _ARLogGeneral_14();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2048;
      v12 = a1;
      _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not find supported video format for running user face tracking in multicam mode.", (uint8_t *)&v9, 0x16u);

    }
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

+ (id)supportedVideoFormatsForUserFaceTracking
{
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD block[5];

  if (objc_msgSend(a1, "supportsUserFaceTracking"))
  {
    if (supportedVideoFormatsForUserFaceTracking_supportedFormats
      && !objc_msgSend((id)supportedVideoFormatsForUserFaceTracking_supportedFormats, "count"))
    {
      objc_msgSend(a1, "_querySupportedVideoFormatsForUserFaceTracking");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)supportedVideoFormatsForUserFaceTracking_supportedFormats;
      supportedVideoFormatsForUserFaceTracking_supportedFormats = v3;

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__ARWorldTrackingConfiguration_supportedVideoFormatsForUserFaceTracking__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (supportedVideoFormatsForUserFaceTracking_onceToken != -1)
      dispatch_once(&supportedVideoFormatsForUserFaceTracking_onceToken, block);
    v5 = (id)supportedVideoFormatsForUserFaceTracking_supportedFormats;
  }
  else
  {
    v5 = (id)MEMORY[0x1E0C9AA60];
  }
  return v5;
}

void __72__ARWorldTrackingConfiguration_supportedVideoFormatsForUserFaceTracking__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_querySupportedVideoFormatsForUserFaceTracking");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)supportedVideoFormatsForUserFaceTracking_supportedFormats;
  supportedVideoFormatsForUserFaceTracking_supportedFormats = v1;

}

+ (id)_querySupportedVideoFormatsForUltraWide
{
  id v3;
  uint64_t v4;
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
  ARVideoFormat *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  ARVideoFormat **v30;
  ARVideoFormat *v31;
  void *v32;
  NSObject *v33;
  objc_class *v34;
  void *v35;
  NSObject *v36;
  objc_class *v37;
  void *v38;
  void *v40;
  unsigned int v41;
  ARVideoFormat *v42;
  ARVideoFormat *v43;
  _QWORD v44[3];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  double v50;
  __int16 v51;
  unsigned int v52;
  __int16 v53;
  int v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
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
      v41 = v4;
      v11 = objc_msgSend(v7, "intValue");
      v12 = objc_msgSend(v9, "intValue");
      _ARLogSensor_4();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v46 = v40;
        v47 = 2048;
        v48 = a1;
        v49 = 2112;
        v50 = *(double *)&v3;
        v51 = 1024;
        v52 = v11;
        v53 = 1024;
        v54 = v12;
        _os_log_impl(&dword_1B3A68000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: ARVideoFormat resolution for %@ set to %i, %i by user defaults", buf, 0x2Cu);

      }
      v4 = v41;
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
    _ARLogSensor_4();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v46 = v22;
      v47 = 2048;
      v48 = a1;
      v49 = 2048;
      v50 = v19;
      _os_log_impl(&dword_1B3A68000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: ARVideoFormat frame rate set to %f by user defaults", buf, 0x20u);

    }
  }
  else
  {
    v19 = 10.0;
  }
  v23 = (void *)MGCopyAnswer();
  if ((objc_msgSend(v23, "BOOLValue") & 1) == 0 && ARDeviceSupportsJasper())
  {
    v24 = -[ARVideoFormat initWithImageResolution:captureDevicePosition:captureDeviceType:]([ARVideoFormat alloc], "initWithImageResolution:captureDevicePosition:captureDeviceType:", 1, v3, 640.0, 480.0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v25;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v26;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARVideoFormat setFrameRatesByPowerUsage:](v24, "setFrameRatesByPowerUsage:", v28);

    v43 = v24;
    v29 = (void *)MEMORY[0x1E0C99D20];
    v30 = &v43;
LABEL_25:
    objc_msgSend(v29, "arrayWithObjects:count:", v30, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  +[ARVideoFormat bestVideoFormatForDevicePosition:deviceType:resolution:frameRate:videoBinned:](ARVideoFormat, "bestVideoFormatForDevicePosition:deviceType:resolution:frameRate:videoBinned:", 1, v3, v11 | (unint64_t)(v12 << 32), v4, v19);
  v31 = (ARVideoFormat *)objc_claimAutoreleasedReturnValue();
  v24 = v31;
  if (v31)
  {
    -[ARVideoFormat imageResolution](v31, "imageResolution");
    if (+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:](ARWorldTrackingTechnique, "supportsVideoResolution:forDeviceType:", v3))
    {
      v42 = v24;
      v29 = (void *)MEMORY[0x1E0C99D20];
      v30 = &v42;
      goto LABEL_25;
    }
    _ARLogGeneral_14();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v46 = v35;
      v47 = 2048;
      v48 = a1;
      v49 = 2114;
      v50 = *(double *)&v24;
      _os_log_impl(&dword_1B3A68000, v33, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Not returning video format %{public}@ because world tracking technique does not support its video resolution on current device", buf, 0x20u);

    }
  }
  _ARLogGeneral_14();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v46 = v38;
    v47 = 2048;
    v48 = a1;
    _os_log_impl(&dword_1B3A68000, v36, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Video format not found for using ultra wide in world tracking", buf, 0x16u);

  }
  v32 = (void *)MEMORY[0x1E0C9AA60];
LABEL_32:

  return v32;
}

+ (id)supportedVideoFormatsForUltraWide
{
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD block[5];

  if (objc_msgSend(a1, "isSupported"))
  {
    if (supportedVideoFormatsForUltraWide_supportedFormats
      && !objc_msgSend((id)supportedVideoFormatsForUltraWide_supportedFormats, "count"))
    {
      objc_msgSend(a1, "_querySupportedVideoFormatsForUltraWide");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)supportedVideoFormatsForUltraWide_supportedFormats;
      supportedVideoFormatsForUltraWide_supportedFormats = v3;

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__ARWorldTrackingConfiguration_supportedVideoFormatsForUltraWide__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (supportedVideoFormatsForUltraWide_onceToken != -1)
      dispatch_once(&supportedVideoFormatsForUltraWide_onceToken, block);
    v5 = (id)supportedVideoFormatsForUltraWide_supportedFormats;
  }
  else
  {
    v5 = (id)MEMORY[0x1E0C9AA60];
  }
  return v5;
}

void __65__ARWorldTrackingConfiguration_supportedVideoFormatsForUltraWide__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_querySupportedVideoFormatsForUltraWide");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)supportedVideoFormatsForUltraWide_supportedFormats;
  supportedVideoFormatsForUltraWide_supportedFormats = v1;

}

- (void)setVideoFormat:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ARWorldTrackingConfiguration;
  -[ARConfiguration setVideoFormat:](&v6, sel_setVideoFormat_, v4);
  if ((objc_msgSend(v4, "has4KVideoResolution") & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isX420PixelFormat");
  -[ARWorldTrackingConfiguration setAlwaysUsePrimaryCameraForTracking:](self, "setAlwaysUsePrimaryCameraForTracking:", v5);

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
  v10.super_class = (Class)ARWorldTrackingConfiguration;
  -[ARConfiguration parentImageSensorSettings](&v10, sel_parentImageSensorSettings);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (objc_msgSend((id)objc_opt_class(), "supportsUserFaceTracking")
    && !+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.worldTracking.forceDisableFrontCamera"))&& !-[ARWorldTrackingConfiguration recordForGeoTracking](self, "recordForGeoTracking"))
  {
    -[ARWorldTrackingConfiguration imageSensorSettingsForUserFaceTracking](self, "imageSensorSettingsForUserFaceTracking");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", -[ARWorldTrackingConfiguration userFaceTrackingEnabled](self, "userFaceTrackingEnabled"));
    if (v6)
      objc_msgSend(v5, "addObject:", v6);

  }
  -[ARWorldTrackingConfiguration imageSensorSettingsForUltraWide](self, "imageSensorSettingsForUltraWide");
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
  ARWorldTrackingConfiguration *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)ARWorldTrackingConfiguration;
  -[ARConfiguration imageSensorSettings](&v15, sel_imageSensorSettings);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVisionDataOutputEnabled:", -[ARWorldTrackingConfiguration shouldEnableVisionDataForImageSensorSettings:](self, "shouldEnableVisionDataForImageSensorSettings:", v3));
  if (objc_msgSend(v3, "visionDataOutputEnabled"))
  {
    -[ARWorldTrackingConfiguration _trackingOptions](self, "_trackingOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImageSensorSettings:", v3);
    -[ARWorldTrackingConfiguration imageSensorSettingsForUltraWide](self, "imageSensorSettingsForUltraWide");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImageSensorSettingsForUltraWide:", v5);

    ARVisionDataParametersForWorldTrackingOptions(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "setVisionDataOutputParameters:", v6);
      _ARLogGeneral_14();
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
      _ARLogGeneral_14();
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
  ARWorldTrackingConfiguration *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!-[ARWorldTrackingConfiguration shouldUseUltraWide](self, "shouldUseUltraWide"))
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
    -[ARImageSensorSettings setVisionDataOutputEnabled:](v5, "setVisionDataOutputEnabled:", -[ARWorldTrackingConfiguration shouldEnableVisionDataForImageSensorSettings:](self, "shouldEnableVisionDataForImageSensorSettings:", v5));
    if (-[ARImageSensorSettings visionDataOutputEnabled](v5, "visionDataOutputEnabled"))
    {
      -[ARWorldTrackingConfiguration _trackingOptions](self, "_trackingOptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARWorldTrackingConfiguration imageSensorSettings](self, "imageSensorSettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setImageSensorSettings:", v8);

      objc_msgSend(v7, "setImageSensorSettingsForUltraWide:", v5);
      ARVisionDataParametersForWorldTrackingOptions(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[ARImageSensorSettings setVisionDataOutputParameters:](v5, "setVisionDataOutputParameters:", v9);
        _ARLogGeneral_14();
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
        _ARLogGeneral_14();
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
  void *v3;
  int shouldUseUltraWideIfAvailable;

  if (!ARDeviceSupportsUltraWideCamera() || !ARUserDefaultsMulticamModeEnabled())
    goto LABEL_8;
  objc_msgSend((id)objc_opt_class(), "supportedVideoFormatsForUltraWide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {

LABEL_8:
    shouldUseUltraWideIfAvailable = 0;
LABEL_9:
    if ((ARLinkedOnOrAfterYukon() & 1) != 0)
      LOBYTE(shouldUseUltraWideIfAvailable) = 0;
    else
      return shouldUseUltraWideIfAvailable & ARDeviceSupportsJasper();
    return shouldUseUltraWideIfAvailable;
  }
  shouldUseUltraWideIfAvailable = self->_shouldUseUltraWideIfAvailable;

  if (!shouldUseUltraWideIfAvailable)
    goto LABEL_9;
  shouldUseUltraWideIfAvailable = 1;
  if ((ARDeviceSupportsMulticamMode() & 1) == 0)
    goto LABEL_9;
  return shouldUseUltraWideIfAvailable;
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
    && ((v5 = -[ARWorldTrackingConfiguration shouldUseUltraWide](self, "shouldUseUltraWide"),
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
    -[ARWorldTrackingConfiguration _trackingOptions](self, "_trackingOptions");
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

- (void)setDetectionImages:(NSSet *)detectionImages
{
  NSSet *v4;
  NSSet *v5;
  NSSet *v6;

  v4 = detectionImages;
  v6 = v4;
  if (!v4)
    v4 = (NSSet *)objc_opt_new();
  objc_storeStrong((id *)&self->_detectionImages, v4);
  v5 = v6;
  if (!v6)
  {

    v5 = 0;
  }

}

- (void)setMaximumNumberOfTrackedImages:(NSInteger)maximumNumberOfTrackedImages
{
  self->_maximumNumberOfTrackedImages = +[ARODTHandleManager actualNumberOfImagesTracked:](ARODTHandleManager, "actualNumberOfImagesTracked:", maximumNumberOfTrackedImages);
}

- (void)createTechniques:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 accuratePlaneExtentCheckEnabled;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  const __CFString *v15;
  ARWorldTrackingTechnique *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  ARImageDetectionTechnique *v20;
  void *v21;
  void *v22;
  ARImageDetectionTechnique *v23;
  ARAppClipCodeTechnique *v24;
  void *v25;
  uint64_t v26;
  ARPlaneEstimationTechnique *v27;
  AREnvironmentTexturingTechnique *v28;
  void *v29;
  uint64_t v30;
  ARObjectDetectionTechnique *v31;
  void *v32;
  void *v33;
  ARObjectDetectionTechnique *v34;
  int v35;
  ARSceneReconstruction v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  void *v42;
  void *v43;
  double v44;
  NSObject *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  float v49;
  void *v50;
  void *v51;
  objc_super v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  ARWorldTrackingConfiguration *v56;
  __int16 v57;
  double v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ARWorldTrackingConfiguration _trackingOptions](self, "_trackingOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARWorldTrackingConfiguration imageSensorSettings](self, "imageSensorSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageSensorSettings:", v6);

  -[ARWorldTrackingConfiguration imageSensorSettingsForUltraWide](self, "imageSensorSettingsForUltraWide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageSensorSettingsForUltraWide:", v7);

  if (-[ARWorldTrackingConfiguration environmentTexturing](self, "environmentTexturing"))
    objc_msgSend(v5, "setPlaneDetection:", objc_msgSend(v5, "planeDetection") | 0x80);
  -[ARConfiguration replaySensor](self, "replaySensor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "replayMode"))
  {
    objc_msgSend(v5, "setDeterministicMode:", 1);
    objc_msgSend(v5, "sceneReconstructionOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDeterministicMode:", 1);

  }
  if (objc_msgSend(v5, "planeDetection"))
  {
    if (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.worldTracking.accuratePlaneExtentCheck")))
    {
      accuratePlaneExtentCheckEnabled = self->_accuratePlaneExtentCheckEnabled;
    }
    else
    {
      accuratePlaneExtentCheckEnabled = 0;
    }
    _ARLogGeneral_14();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("disabled");
      *(_DWORD *)buf = 138543874;
      v54 = v14;
      if (accuratePlaneExtentCheckEnabled)
        v15 = CFSTR("enabled");
      v55 = 2048;
      v56 = self;
      v57 = 2114;
      v58 = *(double *)&v15;
      _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Ray-cast accurate extent check: %{public}@", buf, 0x20u);

    }
    if (accuratePlaneExtentCheckEnabled)
      objc_msgSend(v5, "setPlaneDetection:", objc_msgSend(v5, "planeDetection") | 0x200);
  }
  v16 = -[ARWorldTrackingTechnique initWithOptions:]([ARWorldTrackingTechnique alloc], "initWithOptions:", v5);
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v16);
    -[ARWorldTrackingConfiguration detectionImages](self, "detectionImages");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19)
    {
      v20 = [ARImageDetectionTechnique alloc];
      -[ARWorldTrackingConfiguration detectionImages](self, "detectionImages");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "allObjects");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[ARImageDetectionTechnique initWithReferenceImages:maximumNumberOfTrackedImages:](v20, "initWithReferenceImages:maximumNumberOfTrackedImages:", v22, -[ARWorldTrackingConfiguration maximumNumberOfTrackedImages](self, "maximumNumberOfTrackedImages"));

      -[ARImageDetectionTechnique setEnableAutomaticImageScaleEstimation:](v23, "setEnableAutomaticImageScaleEstimation:", -[ARWorldTrackingConfiguration automaticImageScaleEstimationEnabled](self, "automaticImageScaleEstimationEnabled"));
      objc_msgSend(v17, "addObject:", v23);

    }
    if (-[ARWorldTrackingConfiguration appClipCodeTrackingEnabled](self, "appClipCodeTrackingEnabled"))
    {
      v24 = -[ARAppClipCodeTechnique initWithIgnoreURLLimitation:]([ARAppClipCodeTechnique alloc], "initWithIgnoreURLLimitation:", -[ARWorldTrackingConfiguration ignoreAppClipCodeURLLimitation](self, "ignoreAppClipCodeURLLimitation"));
      if ((unint64_t)(self->_appClipCodePerformanceTestingMode - 1) <= 1)
      {
        objc_msgSend(v4, "removeAllObjects");
        objc_msgSend(v4, "addObject:", v24);
LABEL_42:

        goto LABEL_43;
      }
      objc_msgSend(v17, "addObject:", v24);

    }
    -[ARWorldTrackingTechnique options](v16, "options");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "planeDetection");

    if (v26)
    {
      v27 = -[ARPlaneEstimationTechnique initWithTrackingTechnique:]([ARPlaneEstimationTechnique alloc], "initWithTrackingTechnique:", v16);
      objc_msgSend(v4, "addObject:", v27);

    }
    if (-[ARWorldTrackingConfiguration environmentTexturing](self, "environmentTexturing"))
    {
      v28 = -[AREnvironmentTexturingTechnique initWithOptions:wantsHDREnvironmentTextures:]([AREnvironmentTexturingTechnique alloc], "initWithOptions:wantsHDREnvironmentTextures:", -[ARWorldTrackingConfiguration environmentTexturing](self, "environmentTexturing"), self->_wantsHDREnvironmentTextures);
      objc_msgSend(v4, "addObject:", v28);

    }
    -[ARWorldTrackingConfiguration detectionObjects](self, "detectionObjects");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count");

    if (v30)
    {
      v31 = [ARObjectDetectionTechnique alloc];
      -[ARWorldTrackingConfiguration detectionObjects](self, "detectionObjects");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "allObjects");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[ARObjectDetectionTechnique initWithDetectionObjects:](v31, "initWithDetectionObjects:", v33);

      objc_msgSend(v17, "addObject:", v34);
    }
    v24 = -[ARParentTechnique initWithParallelTechniques:]([ARParentTechnique alloc], "initWithParallelTechniques:", v17);
    objc_msgSend(v4, "insertObject:atIndex:", v24, 0);
    v52.receiver = self;
    v52.super_class = (Class)ARWorldTrackingConfiguration;
    -[ARConfiguration createTechniques:](&v52, sel_createTechniques_, v4);
    if (objc_msgSend(v5, "planeDetection"))
      v35 = -[ARWorldTrackingConfiguration isMLModelEnabled](self, "isMLModelEnabled");
    else
      v35 = 0;
    v36 = -[ARWorldTrackingConfiguration sceneReconstruction](self, "sceneReconstruction");
    if (ARDeviceSupportsJasper())
    {
      if (v36)
        v35 = 1;
      ARAddJasperTechniquesToParent(v24, v4, v35, (-[ARConfiguration frameSemantics](self, "frameSemantics") >> 4) & 1, -[ARConfiguration maxUltrawideImageForwardingFrameRate](self, "maxUltrawideImageForwardingFrameRate"));
      +[ARTechnique techniqueOfClass:inArray:](ARTechnique, "techniqueOfClass:inArray:", objc_opt_class(), v4);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v37)
      {
        v51 = v9;
        objc_msgSend(v37, "pipelineParameters");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "confidenceBucketingHighThreshold");
        v41 = v40;
        -[ARWorldTrackingTechnique mutableOptions](v16, "mutableOptions");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "sceneReconstructionOptions");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v44) = v41;
        objc_msgSend(v43, "setMinDepthUncertaintyThreshold:", v44);

        _ARLogGeneral_14();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          v46 = (objc_class *)objc_opt_class();
          NSStringFromClass(v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[ARWorldTrackingTechnique mutableOptions](v16, "mutableOptions");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "sceneReconstructionOptions");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "minDepthUncertaintyThreshold");
          *(_DWORD *)buf = 138543874;
          v54 = v47;
          v55 = 2048;
          v56 = self;
          v57 = 2048;
          v58 = v49;
          _os_log_impl(&dword_1B3A68000, v45, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Changed the min depth uncertainty threshold of scene reconstruction to %f \n", buf, 0x20u);

        }
        v9 = v51;
      }

    }
    else if (v35)
    {
      ARAddNonJasperSemanticsToParent(v24, v4, -[ARConfiguration maxUltrawideImageForwardingFrameRate](self, "maxUltrawideImageForwardingFrameRate"), 1);
    }
    goto LABEL_42;
  }
LABEL_43:

}

- (id)secondaryTechniques
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)objc_opt_class(), "supportsUserFaceTracking")
    || !-[ARWorldTrackingConfiguration userFaceTrackingEnabled](self, "userFaceTrackingEnabled"))
  {
    return MEMORY[0x1E0C9AA60];
  }
  v3 = (void *)objc_opt_new();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_trackingOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_opt_new();
  -[ARConfiguration deviceModel](self, "deviceModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeviceModel:", v4);

  objc_msgSend(v3, "setRelocalizationEnabled:", -[ARWorldTrackingConfiguration relocalizationEnabled](self, "relocalizationEnabled"));
  -[ARWorldTrackingConfiguration initialWorldMap](self, "initialWorldMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInitialWorldMap:", v5);

  -[ARWorldTrackingConfiguration slamConfiguration](self, "slamConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSlamConfiguration:", v6);

  objc_msgSend(v3, "setPlaneDetection:", -[ARWorldTrackingConfiguration planeDetection](self, "planeDetection"));
  -[ARWorldTrackingConfiguration minVergenceAngle](self, "minVergenceAngle");
  objc_msgSend(v3, "setMinVergenceAngle:");
  objc_msgSend(v3, "setMlModelEnabled:", -[ARWorldTrackingConfiguration isMLModelEnabled](self, "isMLModelEnabled"));
  objc_msgSend(v3, "setLowQosSchedulingEnabled:", -[ARWorldTrackingConfiguration isLowQosSchedulingEnabled](self, "isLowQosSchedulingEnabled"));
  objc_msgSend(v3, "setCollaborationEnabled:", -[ARWorldTrackingConfiguration isCollaborationEnabled](self, "isCollaborationEnabled"));
  objc_msgSend(v3, "setSceneReconstruction:", -[ARWorldTrackingConfiguration sceneReconstruction](self, "sceneReconstruction"));
  -[ARWorldTrackingConfiguration sceneReconstructionOptions](self, "sceneReconstructionOptions");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSceneReconstructionOptions:", v7);

  LOBYTE(v7) = -[ARConfiguration frameSemantics](self, "frameSemantics");
  -[ARConfiguration frameSemantics](self, "frameSemantics");
  if ((v7 & 8) != 0 || -[ARWorldTrackingConfiguration sceneReconstruction](self, "sceneReconstruction"))
    objc_msgSend(v3, "setDepthBuffersWillBeProvided:", 1);
  objc_msgSend(v3, "setAlwaysUsePrimaryCameraForTracking:", -[ARWorldTrackingConfiguration alwaysUsePrimaryCameraForTracking](self, "alwaysUsePrimaryCameraForTracking"));
  objc_msgSend(v3, "setRecordForGeoTracking:", -[ARWorldTrackingConfiguration recordForGeoTracking](self, "recordForGeoTracking"));
  objc_msgSend(v3, "setPlaneBundleAdjustmentEnabled:", -[ARWorldTrackingConfiguration isPlaneBundleAdjustmentEnabled](self, "isPlaneBundleAdjustmentEnabled"));
  -[ARWorldTrackingConfiguration singleShotPlaneCallback](self, "singleShotPlaneCallback");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSingleShotPlaneCallback:", v8);

  -[ARWorldTrackingConfiguration trackedPlaneCallback](self, "trackedPlaneCallback");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTrackedPlaneCallback:", v9);

  -[ARWorldTrackingConfiguration planeDetectionVIOPoseCallback](self, "planeDetectionVIOPoseCallback");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPlaneDetectionVIOPoseCallback:", v10);

  -[ARWorldTrackingConfiguration planeDetectionPoseUpdateCallback](self, "planeDetectionPoseUpdateCallback");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPlaneDetectionPoseUpdateCallback:", v11);

  objc_msgSend(v3, "setDisableMLRelocalization:", -[ARConfiguration disableMLRelocalization](self, "disableMLRelocalization"));
  return v3;
}

- (int64_t)_depthPrioritization
{
  if (-[ARWorldTrackingConfiguration depthOptimizedForStaticScene](self, "depthOptimizedForStaticScene"))
    return 4;
  else
    return 1;
}

+ (BOOL)supportsUserFaceTracking
{
  if (ARDeviceSupportsUltraWideCamera())
  {
    if ((ARDeviceSupportsMulticamWithTripleRGBStreaming() & 1) == 0)
      return 0;
  }
  else if (!ARDeviceSupportsMulticamMode())
  {
    return 0;
  }
  return ARUserDefaultsMulticamModeEnabled();
}

+ (BOOL)supportsSceneReconstruction:(ARSceneReconstruction)sceneReconstruction
{
  BOOL result;

  if (!ARDeviceSupportsJasper())
    return sceneReconstruction == 0;
  result = 1;
  if ((sceneReconstruction & 1) == 0 && (sceneReconstruction & 8) == 0 && (sceneReconstruction & 0x80) == 0)
    return sceneReconstruction == 0;
  return result;
}

- (void)setSceneReconstruction:(ARSceneReconstruction)sceneReconstruction
{
  id v5;

  if ((objc_msgSend((id)objc_opt_class(), "supportsSceneReconstruction:", sceneReconstruction) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Scene Reconstruction type not supported by this configuration"), 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }
  self->_sceneReconstruction = sceneReconstruction;
}

+ (BOOL)supportsFrameSemantics:(unint64_t)a3
{
  objc_super v6;

  if ((a3 & 7) == 0 && (ARDeviceSupportsJasper() & 1) != 0
    || (a3 & 0x1B) == 0 && (ARAppleNeuralEngine() & 1) != 0
    || (a3 & 0x1C) == 0 && (ARAppleNeuralEngine() & 1) != 0
    || (a3 & 4) == 0 && ARAppleNeuralEngine() && (ARDeviceSupportsJasper() & 1) != 0)
  {
    return 1;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___ARWorldTrackingConfiguration;
  return objc_msgSendSuper2(&v6, sel_supportsFrameSemantics_, a3);
}

- (void)setSpatialMappingParameters:(ARSpatialMappingParameters)a3
{
  int64_t var1;

  var1 = a3.var1;
  -[ARSceneReconstructionOptions setVoxelSize:](self->_sceneReconstructionOptions, "setVoxelSize:", a3.var0);
  -[ARSceneReconstructionOptions setBucketsCount:](self->_sceneReconstructionOptions, "setBucketsCount:", var1);
}

- (ARSpatialMappingParameters)spatialMappingParameters
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  ARSpatialMappingParameters result;

  v3 = -[ARSceneReconstructionOptions voxelSize](self->_sceneReconstructionOptions, "voxelSize");
  v4 = -[ARSceneReconstructionOptions bucketsCount](self->_sceneReconstructionOptions, "bucketsCount");
  v5 = v3;
  result.var1 = v4;
  result.var0 = v5;
  return result;
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

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  double *v7;
  double *v8;
  NSString *slamConfiguration;
  void *v10;
  void *v11;
  BOOL v12;
  BOOL v13;
  NSSet *detectionImages;
  NSSet *v16;
  NSSet *detectionObjects;
  int automaticImageScaleEstimationEnabled;
  int collaborationEnabled;
  int shouldUseUltraWideIfAvailable;
  int userFaceTrackingEnabled;
  int depthTemporalSmoothingEnabled;
  int depthOptimizedForStaticScene;
  ARSceneReconstructionOptions *sceneReconstructionOptions;
  int alwaysUsePrimaryCameraForTracking;
  int ignoreAppClipCodeURLLimitation;
  int appClipCodeTrackingEnabled;
  int64_t appClipCodePerformanceTestingMode;
  int recordForGeoTracking;
  int planeBundleAdjustmentEnabled;
  id singleShotPlaneCallback;
  id v32;
  id trackedPlaneCallback;
  id v34;
  id planeDetectionVIOPoseCallback;
  id planeDetectionPoseUpdateCallback;
  id v37;
  id v38;
  void *v39;
  objc_super v40;

  v6 = a3;
  v40.receiver = self;
  v40.super_class = (Class)ARWorldTrackingConfiguration;
  if (-[ARConfiguration isEqual:](&v40, sel_isEqual_, v6))
  {
    v7 = (double *)v6;
    v8 = v7;
    if (self->_planeDetection != *((_QWORD *)v7 + 18)
      || self->_minVergenceAngle != v7[25]
      || self->_mlModelEnabled != *((unsigned __int8 *)v7 + 118)
      || self->_lowQosSchedulingEnabled != *((unsigned __int8 *)v7 + 119)
      || self->_accuratePlaneExtentCheckEnabled != *((unsigned __int8 *)v7 + 120)
      || self->_deliverRawSceneUnderstandingResults != *((unsigned __int8 *)v7 + 121)
      || (slamConfiguration = self->_slamConfiguration, slamConfiguration != *((NSString **)v8 + 24))
      && !-[NSString isEqual:](slamConfiguration, "isEqual:")
      || self->_environmentTexturing != *((_QWORD *)v8 + 17)
      || self->_wantsHDREnvironmentTextures != *((unsigned __int8 *)v8 + 112)
      || self->_relocalizationEnabled != *((unsigned __int8 *)v8 + 117))
    {
      v13 = 0;
LABEL_18:

      goto LABEL_19;
    }
    -[ARWorldTrackingConfiguration initialWorldMap](self, "initialWorldMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "initialWorldMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 != v11)
    {
      -[ARWorldTrackingConfiguration initialWorldMap](self, "initialWorldMap");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "initialWorldMap");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "isEqual:", v4))
      {
        v12 = 0;
        goto LABEL_46;
      }
    }
    detectionImages = self->_detectionImages;
    objc_msgSend(v8, "detectionImages");
    v16 = (NSSet *)objc_claimAutoreleasedReturnValue();
    if ((detectionImages == v16
       || -[NSSet isEqual:](self->_detectionImages, "isEqual:", *((_QWORD *)v8 + 20)))
      && self->_maximumNumberOfTrackedImages == *((_QWORD *)v8 + 21))
    {
      detectionObjects = self->_detectionObjects;
      if (detectionObjects == *((NSSet **)v8 + 22) || -[NSSet isEqual:](detectionObjects, "isEqual:"))
      {
        automaticImageScaleEstimationEnabled = self->_automaticImageScaleEstimationEnabled;
        if (automaticImageScaleEstimationEnabled == objc_msgSend(v8, "automaticImageScaleEstimationEnabled"))
        {
          collaborationEnabled = self->_collaborationEnabled;
          if (collaborationEnabled == objc_msgSend(v8, "isCollaborationEnabled"))
          {
            shouldUseUltraWideIfAvailable = self->_shouldUseUltraWideIfAvailable;
            if (shouldUseUltraWideIfAvailable == objc_msgSend(v8, "shouldUseUltraWideIfAvailable"))
            {
              userFaceTrackingEnabled = self->_userFaceTrackingEnabled;
              if (userFaceTrackingEnabled == objc_msgSend(v8, "userFaceTrackingEnabled"))
              {
                depthTemporalSmoothingEnabled = self->_depthTemporalSmoothingEnabled;
                if (depthTemporalSmoothingEnabled == objc_msgSend(v8, "depthTemporalSmoothingEnabled"))
                {
                  depthOptimizedForStaticScene = self->_depthOptimizedForStaticScene;
                  if (depthOptimizedForStaticScene == objc_msgSend(v8, "depthOptimizedForStaticScene")
                    && self->_sceneReconstruction == *((_QWORD *)v8 + 23))
                  {
                    sceneReconstructionOptions = self->_sceneReconstructionOptions;
                    if (sceneReconstructionOptions == *((ARSceneReconstructionOptions **)v8 + 26)
                      || -[ARSceneReconstructionOptions isEqual:](sceneReconstructionOptions, "isEqual:"))
                    {
                      alwaysUsePrimaryCameraForTracking = self->_alwaysUsePrimaryCameraForTracking;
                      if (alwaysUsePrimaryCameraForTracking == objc_msgSend(v8, "alwaysUsePrimaryCameraForTracking"))
                      {
                        ignoreAppClipCodeURLLimitation = self->_ignoreAppClipCodeURLLimitation;
                        if (ignoreAppClipCodeURLLimitation == objc_msgSend(v8, "ignoreAppClipCodeURLLimitation"))
                        {
                          appClipCodeTrackingEnabled = self->_appClipCodeTrackingEnabled;
                          if (appClipCodeTrackingEnabled == objc_msgSend(v8, "appClipCodeTrackingEnabled"))
                          {
                            appClipCodePerformanceTestingMode = self->_appClipCodePerformanceTestingMode;
                            if (appClipCodePerformanceTestingMode == objc_msgSend(v8, "appClipCodePerformanceTestingMode"))
                            {
                              recordForGeoTracking = self->_recordForGeoTracking;
                              if (recordForGeoTracking == objc_msgSend(v8, "recordForGeoTracking"))
                              {
                                planeBundleAdjustmentEnabled = self->_planeBundleAdjustmentEnabled;
                                if (planeBundleAdjustmentEnabled == objc_msgSend(v8, "isPlaneBundleAdjustmentEnabled"))
                                {
                                  singleShotPlaneCallback = self->_singleShotPlaneCallback;
                                  objc_msgSend(v8, "singleShotPlaneCallback");
                                  v32 = (id)objc_claimAutoreleasedReturnValue();
                                  if (singleShotPlaneCallback == v32)
                                  {
                                    trackedPlaneCallback = self->_trackedPlaneCallback;
                                    objc_msgSend(v8, "trackedPlaneCallback");
                                    v34 = (id)objc_claimAutoreleasedReturnValue();
                                    v39 = trackedPlaneCallback;
                                    if (trackedPlaneCallback == v34)
                                    {
                                      planeDetectionVIOPoseCallback = self->_planeDetectionVIOPoseCallback;
                                      objc_msgSend(v8, "planeDetectionVIOPoseCallback");
                                      v38 = (id)objc_claimAutoreleasedReturnValue();
                                      if (planeDetectionVIOPoseCallback == v38)
                                      {
                                        planeDetectionPoseUpdateCallback = self->_planeDetectionPoseUpdateCallback;
                                        objc_msgSend(v8, "planeDetectionPoseUpdateCallback", v38, v39);
                                        v37 = (id)objc_claimAutoreleasedReturnValue();
                                        v12 = planeDetectionPoseUpdateCallback == v37;

                                      }
                                      else
                                      {
                                        v12 = 0;
                                      }

                                      v13 = v12;
LABEL_45:
                                      if (v10 == v11)
                                      {
LABEL_47:

                                        goto LABEL_18;
                                      }
LABEL_46:

                                      v13 = v12;
                                      goto LABEL_47;
                                    }

                                  }
                                  else
                                  {

                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

    v12 = 0;
    v13 = 0;
    goto LABEL_45;
  }
  v13 = 0;
LABEL_19:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)ARWorldTrackingConfiguration;
  v5 = -[ARConfiguration copyWithZone:](&v24, sel_copyWithZone_);
  v5[18] = self->_planeDetection;
  v5[25] = *(_QWORD *)&self->_minVergenceAngle;
  *((_BYTE *)v5 + 118) = self->_mlModelEnabled;
  *((_BYTE *)v5 + 119) = self->_lowQosSchedulingEnabled;
  *((_BYTE *)v5 + 120) = self->_accuratePlaneExtentCheckEnabled;
  *((_BYTE *)v5 + 121) = self->_deliverRawSceneUnderstandingResults;
  v6 = -[NSString copyWithZone:](self->_slamConfiguration, "copyWithZone:", a3);
  v7 = (void *)v5[24];
  v5[24] = v6;

  v5[17] = self->_environmentTexturing;
  *((_BYTE *)v5 + 112) = self->_wantsHDREnvironmentTextures;
  *((_BYTE *)v5 + 117) = self->_relocalizationEnabled;
  -[ARWorldTrackingConfiguration initialWorldMap](self, "initialWorldMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInitialWorldMap:", v8);

  v9 = -[NSSet copyWithZone:](self->_detectionImages, "copyWithZone:", a3);
  v10 = (void *)v5[20];
  v5[20] = v9;

  v5[21] = self->_maximumNumberOfTrackedImages;
  v11 = -[NSSet copyWithZone:](self->_detectionObjects, "copyWithZone:", a3);
  v12 = (void *)v5[22];
  v5[22] = v11;

  *((_BYTE *)v5 + 113) = self->_automaticImageScaleEstimationEnabled;
  *((_BYTE *)v5 + 114) = self->_collaborationEnabled;
  *((_BYTE *)v5 + 115) = self->_userFaceTrackingEnabled;
  *((_BYTE *)v5 + 122) = self->_shouldUseUltraWideIfAvailable;
  *((_BYTE *)v5 + 123) = self->_depthTemporalSmoothingEnabled;
  *((_BYTE *)v5 + 124) = self->_depthOptimizedForStaticScene;
  v5[23] = self->_sceneReconstruction;
  v13 = -[ARSceneReconstructionOptions copyWithZone:](self->_sceneReconstructionOptions, "copyWithZone:", a3);
  v14 = (void *)v5[26];
  v5[26] = v13;

  *((_BYTE *)v5 + 126) = self->_alwaysUsePrimaryCameraForTracking;
  *((_BYTE *)v5 + 125) = self->_ignoreAppClipCodeURLLimitation;
  *((_BYTE *)v5 + 116) = self->_appClipCodeTrackingEnabled;
  v5[27] = self->_appClipCodePerformanceTestingMode;
  *((_BYTE *)v5 + 127) = self->_recordForGeoTracking;
  *((_BYTE *)v5 + 128) = self->_planeBundleAdjustmentEnabled;
  v15 = MEMORY[0x1B5E2DF90](self->_singleShotPlaneCallback);
  v16 = (void *)v5[28];
  v5[28] = v15;

  v17 = MEMORY[0x1B5E2DF90](self->_trackedPlaneCallback);
  v18 = (void *)v5[29];
  v5[29] = v17;

  v19 = MEMORY[0x1B5E2DF90](self->_planeDetectionVIOPoseCallback);
  v20 = (void *)v5[30];
  v5[30] = v19;

  v21 = MEMORY[0x1B5E2DF90](self->_planeDetectionPoseUpdateCallback);
  v22 = (void *)v5[31];
  v5[31] = v21;

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
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;

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

  if (-[ARWorldTrackingConfiguration wantsHDREnvironmentTextures](self, "wantsHDREnvironmentTextures"))
    v10 = CFSTR("Enabled");
  else
    v10 = CFSTR("Disabled");
  objc_msgSend(v6, "appendFormat:", CFSTR(" wantsHDREnvironmentTextures=%@"), v10);
  NSStringFromARPlaneDetection(self->_planeDetection);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" planeDetection=%@"), v11);

  if (-[ARWorldTrackingConfiguration isCollaborationEnabled](self, "isCollaborationEnabled"))
    v12 = CFSTR("Enabled");
  else
    v12 = CFSTR("Disabled");
  objc_msgSend(v6, "appendFormat:", CFSTR(" collaboration=%@"), v12);
  if (-[ARWorldTrackingConfiguration userFaceTrackingEnabled](self, "userFaceTrackingEnabled"))
    v13 = CFSTR("Enabled");
  else
    v13 = CFSTR("Disabled");
  objc_msgSend(v6, "appendFormat:", CFSTR(" userFaceTracking=%@"), v13);
  NSStringFromARSceneReconstruction(-[ARWorldTrackingConfiguration sceneReconstruction](self, "sceneReconstruction"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" sceneReconstruction=%@"), v14);

  -[ARWorldTrackingConfiguration initialWorldMap](self, "initialWorldMap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[ARWorldTrackingConfiguration initialWorldMap](self, "initialWorldMap");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" initialWorldMap=%@"), v16);

  }
  -[ARWorldTrackingConfiguration detectionImages](self, "detectionImages");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    objc_msgSend(v6, "appendFormat:", CFSTR(" maximumNumberOfTrackedImages=%ld"), -[ARWorldTrackingConfiguration maximumNumberOfTrackedImages](self, "maximumNumberOfTrackedImages"));
    if (-[ARWorldTrackingConfiguration automaticImageScaleEstimationEnabled](self, "automaticImageScaleEstimationEnabled"))
    {
      v19 = CFSTR("Enabled");
    }
    else
    {
      v19 = CFSTR("Disabled");
    }
    objc_msgSend(v6, "appendFormat:", CFSTR(" automaticImageScaleEstimation=%@"), v19);
    -[ARWorldTrackingConfiguration detectionImages](self, "detectionImages");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");
    -[ARWorldTrackingConfiguration detectionImages](self, "detectionImages");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "allObjects");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "ar_map:", &__block_literal_global_89_0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "componentsJoinedByString:", CFSTR(", "));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" detectionImages=[count: %ld, %@]"), v21, v25);

  }
  -[ARWorldTrackingConfiguration detectionObjects](self, "detectionObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  if (v27)
  {
    -[ARWorldTrackingConfiguration detectionObjects](self, "detectionObjects");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "allObjects");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "componentsJoinedByString:", CFSTR(", "));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" detectionObjects=[%@]"), v30);

  }
  if (-[ARWorldTrackingConfiguration appClipCodeTrackingEnabled](self, "appClipCodeTrackingEnabled"))
    v31 = CFSTR("Enabled");
  else
    v31 = CFSTR("Disabled");
  objc_msgSend(v6, "appendFormat:", CFSTR(" appClipCodeTracking=%@"), v31);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

uint64_t __43__ARWorldTrackingConfiguration_description__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shortDebugDescription");
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

- (ARWorldMap)initialWorldMap
{
  return self->_initialWorldMap;
}

- (void)setInitialWorldMap:(ARWorldMap *)initialWorldMap
{
  objc_storeStrong((id *)&self->_initialWorldMap, initialWorldMap);
}

- (NSSet)detectionImages
{
  return self->_detectionImages;
}

- (BOOL)automaticImageScaleEstimationEnabled
{
  return self->_automaticImageScaleEstimationEnabled;
}

- (void)setAutomaticImageScaleEstimationEnabled:(BOOL)automaticImageScaleEstimationEnabled
{
  self->_automaticImageScaleEstimationEnabled = automaticImageScaleEstimationEnabled;
}

- (NSInteger)maximumNumberOfTrackedImages
{
  return self->_maximumNumberOfTrackedImages;
}

- (NSSet)detectionObjects
{
  return self->_detectionObjects;
}

- (void)setDetectionObjects:(NSSet *)detectionObjects
{
  objc_setProperty_nonatomic_copy(self, a2, detectionObjects, 176);
}

- (BOOL)isCollaborationEnabled
{
  return self->_collaborationEnabled;
}

- (void)setCollaborationEnabled:(BOOL)collaborationEnabled
{
  self->_collaborationEnabled = collaborationEnabled;
}

- (BOOL)userFaceTrackingEnabled
{
  return self->_userFaceTrackingEnabled;
}

- (void)setUserFaceTrackingEnabled:(BOOL)userFaceTrackingEnabled
{
  self->_userFaceTrackingEnabled = userFaceTrackingEnabled;
}

- (void)setAppClipCodeTrackingEnabled:(BOOL)appClipCodeTrackingEnabled
{
  self->_appClipCodeTrackingEnabled = appClipCodeTrackingEnabled;
}

- (ARSceneReconstruction)sceneReconstruction
{
  return self->_sceneReconstruction;
}

- (BOOL)relocalizationEnabled
{
  return self->_relocalizationEnabled;
}

- (void)setRelocalizationEnabled:(BOOL)a3
{
  self->_relocalizationEnabled = a3;
}

- (NSString)slamConfiguration
{
  return self->_slamConfiguration;
}

- (void)setSlamConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (double)minVergenceAngle
{
  return self->_minVergenceAngle;
}

- (void)setMinVergenceAngle:(double)a3
{
  self->_minVergenceAngle = a3;
}

- (BOOL)isMLModelEnabled
{
  return self->_mlModelEnabled;
}

- (void)setMlModelEnabled:(BOOL)a3
{
  self->_mlModelEnabled = a3;
}

- (BOOL)isLowQosSchedulingEnabled
{
  return self->_lowQosSchedulingEnabled;
}

- (void)setLowQosSchedulingEnabled:(BOOL)a3
{
  self->_lowQosSchedulingEnabled = a3;
}

- (BOOL)isAccuratePlaneExtentCheckEnabled
{
  return self->_accuratePlaneExtentCheckEnabled;
}

- (void)setAccuratePlaneExtentCheckEnabled:(BOOL)a3
{
  self->_accuratePlaneExtentCheckEnabled = a3;
}

- (BOOL)deliverRawSceneUnderstandingResults
{
  return self->_deliverRawSceneUnderstandingResults;
}

- (void)setDeliverRawSceneUnderstandingResults:(BOOL)a3
{
  self->_deliverRawSceneUnderstandingResults = a3;
}

- (BOOL)shouldUseUltraWideIfAvailable
{
  return self->_shouldUseUltraWideIfAvailable;
}

- (void)setShouldUseUltraWideIfAvailable:(BOOL)a3
{
  self->_shouldUseUltraWideIfAvailable = a3;
}

- (BOOL)depthTemporalSmoothingEnabled
{
  return self->_depthTemporalSmoothingEnabled;
}

- (void)setDepthTemporalSmoothingEnabled:(BOOL)a3
{
  self->_depthTemporalSmoothingEnabled = a3;
}

- (BOOL)depthOptimizedForStaticScene
{
  return self->_depthOptimizedForStaticScene;
}

- (void)setDepthOptimizedForStaticScene:(BOOL)a3
{
  self->_depthOptimizedForStaticScene = a3;
}

- (ARSceneReconstructionOptions)sceneReconstructionOptions
{
  return self->_sceneReconstructionOptions;
}

- (void)setSceneReconstructionOptions:(id)a3
{
  objc_storeStrong((id *)&self->_sceneReconstructionOptions, a3);
}

- (BOOL)ignoreAppClipCodeURLLimitation
{
  return self->_ignoreAppClipCodeURLLimitation;
}

- (void)setIgnoreAppClipCodeURLLimitation:(BOOL)a3
{
  self->_ignoreAppClipCodeURLLimitation = a3;
}

- (int64_t)appClipCodePerformanceTestingMode
{
  return self->_appClipCodePerformanceTestingMode;
}

- (void)setAppClipCodePerformanceTestingMode:(int64_t)a3
{
  self->_appClipCodePerformanceTestingMode = a3;
}

- (BOOL)alwaysUsePrimaryCameraForTracking
{
  return self->_alwaysUsePrimaryCameraForTracking;
}

- (void)setAlwaysUsePrimaryCameraForTracking:(BOOL)a3
{
  self->_alwaysUsePrimaryCameraForTracking = a3;
}

- (BOOL)recordForGeoTracking
{
  return self->_recordForGeoTracking;
}

- (void)setRecordForGeoTracking:(BOOL)a3
{
  self->_recordForGeoTracking = a3;
}

- (BOOL)isPlaneBundleAdjustmentEnabled
{
  return self->_planeBundleAdjustmentEnabled;
}

- (void)setPlaneBundleAdjustmentEnabled:(BOOL)a3
{
  self->_planeBundleAdjustmentEnabled = a3;
}

- (id)singleShotPlaneCallback
{
  return self->_singleShotPlaneCallback;
}

- (void)setSingleShotPlaneCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (id)trackedPlaneCallback
{
  return self->_trackedPlaneCallback;
}

- (void)setTrackedPlaneCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (id)planeDetectionVIOPoseCallback
{
  return self->_planeDetectionVIOPoseCallback;
}

- (void)setPlaneDetectionVIOPoseCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (id)planeDetectionPoseUpdateCallback
{
  return self->_planeDetectionPoseUpdateCallback;
}

- (void)setPlaneDetectionPoseUpdateCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_planeDetectionPoseUpdateCallback, 0);
  objc_storeStrong(&self->_planeDetectionVIOPoseCallback, 0);
  objc_storeStrong(&self->_trackedPlaneCallback, 0);
  objc_storeStrong(&self->_singleShotPlaneCallback, 0);
  objc_storeStrong((id *)&self->_sceneReconstructionOptions, 0);
  objc_storeStrong((id *)&self->_slamConfiguration, 0);
  objc_storeStrong((id *)&self->_detectionObjects, 0);
  objc_storeStrong((id *)&self->_detectionImages, 0);
  objc_storeStrong((id *)&self->_initialWorldMap, 0);
}

@end
