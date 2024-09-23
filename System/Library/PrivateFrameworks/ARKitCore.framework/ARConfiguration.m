@implementation ARConfiguration

- (ARConfiguration)init
{

  return 0;
}

- (id)initPrivate
{
  char *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ARConfiguration;
  v2 = -[ARConfiguration init](&v7, sel_init);
  if (v2)
  {
    if ((objc_msgSend(v2, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    {
      objc_msgSend((id)objc_opt_class(), "supportedVideoFormats");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "firstObject");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)*((_QWORD *)v2 + 2);
      *((_QWORD *)v2 + 2) = v4;

    }
    v2[35] = 0;
    *((_QWORD *)v2 + 6) = 0;
    *(_OWORD *)(v2 + 72) = xmmword_1B3BE3690;
    *((_QWORD *)v2 + 1) = 0;
    objc_storeStrong((id *)v2 + 11, CFSTR("ARTimeOfFlightProjectorModeNormalShortHybrid"));
    *((_QWORD *)v2 + 12) = 0;
    v2[34] = +[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", CFSTR("com.apple.arkit.personOcclusion.optimizationStrategy")) != 0;
    *((_QWORD *)v2 + 3) = 0;
    *((_QWORD *)v2 + 13) = -1;
    v2[33] = 0;
    v2[38] = 0;
    v2[41] = 0;
    v2[36] = 0;
  }
  return v2;
}

- (void)setVideoFormat:(ARVideoFormat *)videoFormat
{
  ARVideoFormat *v4;
  void *v5;
  uint64_t v6;
  ARVideoFormat *v7;
  id v8;

  v4 = videoFormat;
  objc_msgSend((id)objc_opt_class(), "supportedVideoFormats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Video format not supported by this configuration"), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  v7 = self->_videoFormat;
  self->_videoFormat = v4;

}

- (ARParentImageSensorSettings)parentImageSensorSettings
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[ARConfiguration imageSensorSettings](self, "imageSensorSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDropsInitialFramesOutsideExposureTargetOffsetThreshold:", +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.imagesensor.initialFrameDrop.enabled")));
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSettings:", v5);

  objc_msgSend(v3, "setAudioCaptureEnabled:", -[ARConfiguration providesAudioData](self, "providesAudioData"));
  objc_msgSend(v3, "setAllowCameraInMultipleForegroundAppLayout:", -[ARConfiguration allowCameraInMultipleForegroundAppLayout](self, "allowCameraInMultipleForegroundAppLayout"));

  return (ARParentImageSensorSettings *)v3;
}

- (ARImageSensorSettings)imageSensorSettings
{
  ARImageSensorSettings *v3;
  void *v4;
  ARImageSensorSettings *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  const char *v15;
  _BYTE v17[22];
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = [ARImageSensorSettings alloc];
  -[ARConfiguration videoFormat](self, "videoFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ARImageSensorSettings initWithVideoFormat:](v3, "initWithVideoFormat:", v4);

  -[ARImageSensorSettings setAutoFocusEnabled:](v5, "setAutoFocusEnabled:", -[ARConfiguration isAutoFocusEnabled](self, "isAutoFocusEnabled"));
  -[ARImageSensorSettings setVideoHDRAllowed:](v5, "setVideoHDRAllowed:", -[ARConfiguration videoHDRAllowed](self, "videoHDRAllowed"));
  -[ARImageSensorSettings setSupportsCapturingHighResolutionFrames:](v5, "setSupportsCapturingHighResolutionFrames:", 1);
  -[ARImageSensorSettings setFocusPixelBlurScoreDeliveryEnabled:](v5, "setFocusPixelBlurScoreDeliveryEnabled:", -[ARConfiguration focusPixelBlurScoreDeliveryEnabled](self, "focusPixelBlurScoreDeliveryEnabled"));
  -[ARConfiguration videoFormat](self, "videoFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "captureDevicePosition");

  if (v7 == 2)
  {
    +[ARKitUserDefaults valueForKey:](ARKitUserDefaults, "valueForKey:", CFSTR("com.apple.arkit.imagesensor.face.mirror"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, "BOOLValue");
      if (_ARLogSensor_onceToken_4 != -1)
        dispatch_once(&_ARLogSensor_onceToken_4, &__block_literal_global_431);
      v11 = (void *)_ARLogSensor_logObj_4;
      if (os_log_type_enabled((os_log_t)_ARLogSensor_logObj_4, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = "disabled";
        *(_DWORD *)v17 = 138543874;
        *(_QWORD *)&v17[4] = v14;
        if ((_DWORD)v10)
          v15 = "enabled";
        *(_WORD *)&v17[12] = 2048;
        *(_QWORD *)&v17[14] = self;
        v18 = 2080;
        v19 = v15;
        _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Face tracking image sensor mirrored video output %s by user defaults", v17, 0x20u);

      }
    }
    else
    {
      v10 = 1;
    }
    -[ARImageSensorSettings setMirrorVideoOutput:](v5, "setMirrorVideoOutput:", v10, *(_OWORD *)v17);

  }
  return v5;
}

- (BOOL)shouldUseJasper
{
  return 0;
}

- (id)depthSensorSettingsForJasper
{
  void *v3;
  void *v4;
  ARDepthSensorSettings *v5;
  __CFString *v6;
  void *v7;

  if (-[ARConfiguration shouldUseJasper](self, "shouldUseJasper"))
  {
    objc_msgSend((id)objc_opt_class(), "_supportedVideoFormatsForJasper:", self->_depthSensorNumberOfPointsMode);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = -[ARDepthSensorSettings initWithVideoFormat:]([ARDepthSensorSettings alloc], "initWithVideoFormat:", v4);
      -[ARConfiguration timeOfFlightProjectorMode](self, "timeOfFlightProjectorMode");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v6 != CFSTR("ARTimeOfFlightProjectorModeNone"))
      {
        -[ARConfiguration timeOfFlightProjectorMode](self, "timeOfFlightProjectorMode");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARDepthSensorSettings setTimeOfFlightProjectorMode:](v5, "setTimeOfFlightProjectorMode:", v7);

      }
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)_querySupportedVideoFormatsForJasper:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  ARVideoFormat *v17;
  ARVideoFormat *v18;
  ARVideoFormat *v20;
  uint64_t v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  if (s_customJasperFrameRate)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v5;
    v28[1] = &unk_1E66CF120;
    v28[2] = &unk_1E66CF120;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
    v6 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  +[ARKitUserDefaults objectForKey:](ARKitUserDefaults, "objectForKey:", CFSTR("com.apple.arkit.jasper.framerate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(","));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    if (objc_msgSend(v10, "count") == 3)
    {
      v11 = v6;
      v6 = v10;
    }
    else
    {
      _ARLogGeneral_9();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v23 = v13;
        v24 = 2048;
        v25 = a1;
        v26 = 2048;
        v27 = -[NSObject count](v6, "count");
        _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Expected 3 jasper frame rate values: %lu", buf, 0x20u);

      }
    }

  }
  +[ARVideoFormat bestTimeOfFlightFormatForDevicePosition:depthSensorNumberOfPointsMode:frameRates:](ARVideoFormat, "bestTimeOfFlightFormatForDevicePosition:depthSensorNumberOfPointsMode:frameRates:", 1, a3, v6);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
  {
    v21 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (ARDeviceSupportsJasper())
  {
    v17 = [ARVideoFormat alloc];
    v18 = -[ARVideoFormat initWithImageResolution:captureDevicePosition:captureDeviceType:](v17, "initWithImageResolution:captureDevicePosition:captureDeviceType:", 1, *MEMORY[0x1E0C89F80], 512.0, 256.0);
    v20 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v16;
}

+ (id)_supportedVideoFormatsForJasper:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[6];

  if (objc_msgSend(a1, "isSupported"))
  {
    objc_msgSend((id)s_supportedJasperFormatsCache, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6 || s_supportedJasperFormatsCache && !objc_msgSend((id)s_supportedJasperFormatsCache, "count"))
    {
      objc_msgSend(a1, "_querySupportedVideoFormatsForJasper:", a3);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)s_supportedJasperFormatsCache;
      s_supportedJasperFormatsCache = v7;

    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __51__ARConfiguration__supportedVideoFormatsForJasper___block_invoke;
    v11[3] = &__block_descriptor_48_e5_v8__0l;
    v11[4] = a1;
    v11[5] = a3;
    if (_supportedVideoFormatsForJasper__onceToken != -1)
      dispatch_once(&_supportedVideoFormatsForJasper__onceToken, v11);
    v9 = (id)s_supportedJasperFormatsCache;
  }
  else
  {
    v9 = (id)MEMORY[0x1E0C9AA60];
  }
  return v9;
}

void __51__ARConfiguration__supportedVideoFormatsForJasper___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_querySupportedVideoFormatsForJasper:", *(_QWORD *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)s_supportedJasperFormatsCache;
  s_supportedJasperFormatsCache = v1;

}

- (void)setCustomSensors:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  char isKindOfClass;
  id v16;
  void *v17;
  id v18;
  ARVideoFormat *v19;
  ARVideoFormat *v20;
  objc_class *v21;
  void *v22;
  NSArray *v23;
  id v24;
  char v25;
  id v26;
  uint64_t v27;
  ARVideoFormat *v28;
  ARVideoFormat *v29;
  ARVideoFormat *videoFormat;
  NSObject *v31;
  objc_class *v32;
  id v33;
  NSArray *v34;
  NSObject *v35;
  objc_class *v36;
  void *v37;
  NSArray *customSensors;
  id location;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  id v46;
  __int16 v47;
  ARConfiguration *v48;
  __int16 v49;
  NSArray *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (!v8)
      goto LABEL_24;
    v9 = *(_QWORD *)v41;
LABEL_4:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v41 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v10);
      if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EF09C220))
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        if (v8)
          goto LABEL_4;
        goto LABEL_24;
      }
    }
    v12 = v11;
    v13 = (id)*MEMORY[0x1E0C89FA0];
    v14 = objc_initWeak(&location, self);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v16 = objc_loadWeakRetained(&location);
      objc_msgSend(v16, "templateConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak(&location, v17);

    }
    v18 = objc_loadWeakRetained(&location);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

    }
    else
    {
      v24 = objc_loadWeakRetained(&location);
      objc_opt_class();
      v25 = objc_opt_isKindOfClass();

      if ((v25 & 1) == 0)
      {
        v27 = 1;
        goto LABEL_20;
      }
    }
    v26 = (id)*MEMORY[0x1E0C89F90];

    v27 = 2;
    v13 = v26;
LABEL_20:
    v28 = [ARVideoFormat alloc];
    -[NSObject imageResolution](v12, "imageResolution");
    v29 = -[ARVideoFormat initWithImageResolution:captureDevicePosition:captureDeviceType:](v28, "initWithImageResolution:captureDevicePosition:captureDeviceType:", v27, v13);
    videoFormat = self->_videoFormat;
    self->_videoFormat = v29;

    _ARLogGeneral_9();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (id)objc_claimAutoreleasedReturnValue();
      -[ARVideoFormat description](self->_videoFormat, "description");
      v34 = (NSArray *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v46 = v33;
      v47 = 2048;
      v48 = self;
      v49 = 2114;
      v50 = v34;
      _os_log_impl(&dword_1B3A68000, v31, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Video format updated from replay sensor: %{public}@", buf, 0x20u);

    }
    objc_destroyWeak(&location);

    goto LABEL_23;
  }
  objc_msgSend((id)objc_opt_class(), "supportedVideoFormats");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v19 = (ARVideoFormat *)objc_claimAutoreleasedReturnValue();
  v20 = self->_videoFormat;
  self->_videoFormat = v19;

  _ARLogGeneral_9();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARVideoFormat description](self->_videoFormat, "description");
    v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v46 = v22;
    v47 = 2048;
    v48 = self;
    v49 = 2114;
    v50 = v23;
    _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Video format reset to default: %{public}@", buf, 0x20u);

  }
LABEL_23:

LABEL_24:
  objc_storeStrong((id *)&self->_customSensors, a3);
  _ARLogGeneral_9();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    customSensors = self->_customSensors;
    *(_DWORD *)buf = 138543874;
    v46 = v37;
    v47 = 2048;
    v48 = self;
    v49 = 2048;
    v50 = customSensors;
    _os_log_impl(&dword_1B3A68000, v35, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Custom sensors set: %p", buf, 0x20u);

  }
}

- (void)setCameraPosition:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  ARVideoFormat *v8;
  ARVideoFormat *v9;
  ARVideoFormat *v10;
  ARVideoFormat *videoFormat;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  ARConfiguration *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3
    && (-[ARConfiguration videoFormat](self, "videoFormat"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "captureDevicePosition"),
        v5,
        v6 != a3))
  {
    +[ARVideoFormat supportedVideoFormatsForDevicePosition:deviceType:](ARVideoFormat, "supportedVideoFormatsForDevicePosition:deviceType:", a3, *MEMORY[0x1E0C89FA0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v10 = (ARVideoFormat *)objc_claimAutoreleasedReturnValue();
    videoFormat = self->_videoFormat;
    self->_videoFormat = v10;

    _ARLogGeneral_9();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARVideoFormat description](self->_videoFormat, "description");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v14;
      v18 = 2048;
      v19 = self;
      v20 = 2114;
      v21 = v15;
      _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Using custom video format for configuration, it may not be supported: %{public}@", (uint8_t *)&v16, 0x20u);

    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "supportedVideoFormats");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (ARVideoFormat *)objc_claimAutoreleasedReturnValue();
    v9 = self->_videoFormat;
    self->_videoFormat = v8;

  }
  self->_cameraPosition = a3;
}

- (BOOL)isLightEstimationEnabled
{
  return -[ARConfiguration lightEstimation](self, "lightEstimation") != 0;
}

- (void)setLightEstimationEnabled:(BOOL)lightEstimationEnabled
{
  -[ARConfiguration setLightEstimation:](self, "setLightEstimation:", lightEstimationEnabled);
}

- (void)setFrameSemantics:(ARFrameSemantics)frameSemantics
{
  BOOL v5;
  id v6;

  if ((objc_msgSend((id)objc_opt_class(), "supportsFrameSemantics:", frameSemantics) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("This set of frame semantics is not supported on this configuration"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  self->_frameSemantics = frameSemantics;
  v5 = (frameSemantics & 0x18) == 0
    && +[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", CFSTR("com.apple.arkit.personOcclusion.optimizationStrategy")) != 0;
  self->_smartPersonOcclusionEnabled = v5;
}

+ (BOOL)supportsFrameSemantics:(ARFrameSemantics)frameSemantics
{
  return frameSemantics == 0;
}

- (NSString)deviceModel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  +[ARKitUserDefaults stringForKey:](ARKitUserDefaults, "stringForKey:", CFSTR("com.apple.arkit.worldtracking.deviceModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[ARConfiguration replaySensor](self, "replaySensor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceModel");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (ARReplaySensorProtocol)replaySensor
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
  -[ARConfiguration customSensors](self, "customSensors", 0);
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
        if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1EF09C220) & 1) != 0)
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

  return (ARReplaySensorProtocol *)v3;
}

- (void)setTimeOfFlightProjectorMode:(id)a3
{
  id v4;
  NSString *timeOfFlightProjectorMode;
  id v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ARTimeOfFlightProjectorModeNone")) & 1) == 0
    && (objc_msgSend((id)objc_opt_class(), "supportsTimeOfFlightProjectorMode") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Projector Mode is not supported on this device"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  timeOfFlightProjectorMode = self->_timeOfFlightProjectorMode;
  self->_timeOfFlightProjectorMode = (NSString *)v4;

}

- (id)techniques
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1B5E2DDB0]();
  -[ARConfiguration createTechniques:](self, "createTechniques:", v3);
  objc_autoreleasePoolPop(v4);
  if (objc_msgSend(v3, "count"))
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (void)createTechniques:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  char v7;
  char v8;
  ARFrameSemantics v9;
  ARDepthTechnique *v10;
  ARDepthTechnique *v11;
  ARParentTechnique *v12;
  void *v13;
  ARMLImageMattingMetadataTechnique *v14;
  ARMLImageMattingMetadataTechnique *v15;
  ARFrameSemantics v16;
  ARPersonOcclusionParentTechnique *v17;
  uint64_t v18;
  ARDepthTechnique *v19;
  ARParentTechnique *v20;
  void *v21;
  ARParentTechnique *v22;
  ARParentTechnique *v23;
  void *v24;
  char v25;
  ARFrameSemantics v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  ARParentTechnique *v31;
  void *v32;
  ARParentTechnique *v33;
  ARMLImageMattingMetadataTechnique *v34;
  ARMLImageMattingMetadataTechnique *v35;
  int64_t v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  NSObject *v42;
  objc_class *v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  ARParentTechnique *v48;
  void *v49;
  ARParentTechnique *v50;
  ARParentTechnique *v51;
  void *v52;
  ARParentTechnique *v53;
  void *v54;
  ARWorldAlignmentTechnique *v55;
  ARWorldAlignment v56;
  void *v57;
  ARWorldAlignmentTechnique *v58;
  void *v59;
  ARParentTechnique *v60;
  _QWORD v61[2];
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  ARConfiguration *v65;
  __int16 v66;
  double v67;
  __int16 v68;
  double v69;
  ARDepthTechnique *v70;
  ARDepthTechnique *v71;
  _QWORD v72[2];

  v72[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = ~-[ARConfiguration frameSemantics](self, "frameSemantics") & 3;
  v6 = -[ARConfiguration frameSemantics](self, "frameSemantics");
  v7 = -[ARConfiguration frameSemantics](self, "frameSemantics");
  v8 = -[ARConfiguration frameSemantics](self, "frameSemantics");
  v9 = -[ARConfiguration frameSemantics](self, "frameSemantics");
  if (!v5 && objc_msgSend((id)objc_opt_class(), "supportsFrameSemantics:", 3))
  {
    if (ARDeviceSupportsJasper())
      v10 = -[ARDepthTechnique initWithPrioritization:temporalSmoothing:]([ARDepthTechnique alloc], "initWithPrioritization:temporalSmoothing:", -[ARConfiguration _depthPrioritization](self, "_depthPrioritization"), (v9 >> 4) & 1);
    else
      v10 = (ARDepthTechnique *)objc_opt_new();
    v11 = v10;
    v26 = v8 & 8 | v9 & 0x10;
    v12 = (ARParentTechnique *)objc_opt_new();
    v27 = (void *)objc_opt_new();
    objc_msgSend(v27, "setShouldOperateOnHighResolutionImages:", 1);
    ARAddScalingTechniquesToTechniques(v4, !self->_disableOcclusionForPersonSegmentation, 0, 256.0, 192.0, 0.002, 0.005);
    v28 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v29 = (void *)objc_opt_new();
    v30 = (void *)objc_msgSend(v28, "initWithObjects:", v12, v27, v29, 0);

    if (v26 && ARDeviceSupportsJasper())
    {
      v31 = [ARParentTechnique alloc];
      v72[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[ARParentTechnique initWithParallelTechniques:](v31, "initWithParallelTechniques:", v32);

      objc_msgSend(v4, "addObject:", v33);
    }
    else
    {
      objc_msgSend(v30, "addObject:", v11);
    }
    if (!self->_disableOcclusionForPersonSegmentation)
    {
      v34 = objc_alloc_init(ARMLImageMattingMetadataTechnique);
      v35 = objc_alloc_init(ARMLImageMattingMetadataTechnique);
      -[ARMLImageMattingMetadataTechnique setShouldOperateOnHighResolutionImages:](v35, "setShouldOperateOnHighResolutionImages:", 1);
      objc_msgSend(v30, "addObject:", v34);
      objc_msgSend(v30, "addObject:", v35);

    }
    v17 = -[ARParentTechnique initWithParallelTechniques:]([ARPersonOcclusionParentTechnique alloc], "initWithParallelTechniques:", v30);
    if (-[ARConfiguration smartPersonOcclusionEnabled](self, "smartPersonOcclusionEnabled"))
      v36 = +[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", CFSTR("com.apple.arkit.personOcclusion.optimizationStrategy"));
    else
      v36 = 0;
    -[ARPersonOcclusionParentTechnique setOptimizationStrategy:](v17, "setOptimizationStrategy:", v36);
    objc_msgSend(v4, "addObject:", v17);
    v37 = (void *)objc_opt_new();
    objc_msgSend(v4, "addObject:", v37);

    goto LABEL_32;
  }
  if ((v6 & 1) != 0 && objc_msgSend((id)objc_opt_class(), "supportsFrameSemantics:", 1))
  {
    ARAddScalingTechniquesToTechniques(v4, !self->_disableOcclusionForPersonSegmentation, 0, 256.0, 192.0, 0.002, 0.005);
    v11 = (ARDepthTechnique *)objc_opt_new();
    v12 = (ARParentTechnique *)objc_opt_new();
    -[ARParentTechnique setShouldOperateOnHighResolutionImages:](v12, "setShouldOperateOnHighResolutionImages:", 1);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v11, v12, 0);
    if (!self->_disableOcclusionForPersonSegmentation)
    {
      v14 = objc_alloc_init(ARMLImageMattingMetadataTechnique);
      v15 = objc_alloc_init(ARMLImageMattingMetadataTechnique);
      -[ARMLImageMattingMetadataTechnique setShouldOperateOnHighResolutionImages:](v15, "setShouldOperateOnHighResolutionImages:", 1);
      objc_msgSend(v13, "addObject:", v14);
      objc_msgSend(v13, "addObject:", v15);

    }
    v16 = v8 & 8 | v9 & 0x10;
    v17 = -[ARParentTechnique initWithParallelTechniques:]([ARPersonOcclusionParentTechnique alloc], "initWithParallelTechniques:", v13);
    if (-[ARConfiguration smartPersonOcclusionEnabled](self, "smartPersonOcclusionEnabled"))
      v18 = 2;
    else
      v18 = 0;
    -[ARPersonOcclusionParentTechnique setOptimizationStrategy:](v17, "setOptimizationStrategy:", v18);
    objc_msgSend(v4, "addObject:", v17);
    if (v16 && ARDeviceSupportsJasper())
    {
      v19 = -[ARDepthTechnique initWithPrioritization:temporalSmoothing:]([ARDepthTechnique alloc], "initWithPrioritization:temporalSmoothing:", -[ARConfiguration _depthPrioritization](self, "_depthPrioritization"), (v9 >> 4) & 1);
      v20 = [ARParentTechnique alloc];
      v71 = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[ARParentTechnique initWithParallelTechniques:](v20, "initWithParallelTechniques:", v21);

      objc_msgSend(v4, "addObject:", v22);
    }

LABEL_32:
    v25 = 1;
    if ((v7 & 4) == 0)
      goto LABEL_45;
    goto LABEL_33;
  }
  if (v8 & 8 | v9 & 0x10 && ARDeviceSupportsJasper())
  {
    v11 = -[ARDepthTechnique initWithPrioritization:temporalSmoothing:]([ARDepthTechnique alloc], "initWithPrioritization:temporalSmoothing:", -[ARConfiguration _depthPrioritization](self, "_depthPrioritization"), (v9 >> 4) & 1);
    v23 = [ARParentTechnique alloc];
    v70 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ARParentTechnique initWithParallelTechniques:](v23, "initWithParallelTechniques:", v24);

    ARAddScalingTechniquesToTechniques(v4, 0, 0, 256.0, 192.0, 0.002, 0.005);
    objc_msgSend(v4, "addObject:", v12);
    v17 = 0;
    goto LABEL_32;
  }
  v17 = 0;
  v25 = 0;
  if ((v7 & 4) == 0)
    goto LABEL_45;
LABEL_33:
  if (objc_msgSend((id)objc_opt_class(), "supportsFrameSemantics:", 4))
  {
    if ((v25 & 1) == 0)
    {
      +[AR2DSkeletonDetectionTechnique inputDimensionsForMLModel](AR2DSkeletonDetectionTechnique, "inputDimensionsForMLModel");
      v39 = v38;
      v41 = v40;
      _ARLogGeneral_9();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v43 = (objc_class *)objc_opt_class();
        NSStringFromClass(v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v63 = v44;
        v64 = 2048;
        v65 = self;
        v66 = 2048;
        v67 = v39;
        v68 = 2048;
        v69 = v41;
        _os_log_impl(&dword_1B3A68000, v42, OS_LOG_TYPE_INFO, "%{public}@ <%p>: ARConfiguration for Body Detection Scaler dimensions: (%f,%f)", buf, 0x2Au);

      }
      if (ARIsANEVersionEqualOrPriorToH12())
        v45 = 0.00600000005;
      else
        v45 = 0.00800000038;
      ARAddScalingTechniquesToTechniques(v4, 0, 0, v39, v41, v45, 0.012);
    }
    v46 = (void *)objc_opt_new();
    v47 = (void *)objc_opt_new();
    v48 = [ARParentTechnique alloc];
    v61[0] = v46;
    v61[1] = v47;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[ARParentTechnique initWithTechniques:](v48, "initWithTechniques:", v49);

    if (v17)
    {
      -[ARParentTechnique techniques](v17, "techniques");
      v51 = (ARParentTechnique *)objc_claimAutoreleasedReturnValue();
      -[ARParentTechnique arrayByAddingObject:](v51, "arrayByAddingObject:", v50);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARPersonOcclusionParentTechnique setTechniques:](v17, "setTechniques:", v52);

    }
    else
    {
      v53 = [ARParentTechnique alloc];
      v60 = v50;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = -[ARParentTechnique initWithParallelTechniques:](v53, "initWithParallelTechniques:", v54);

      objc_msgSend(v4, "addObject:", v51);
    }

  }
LABEL_45:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (-[ARConfiguration isWorldTrackingEnabled](self, "isWorldTrackingEnabled") & 1) == 0)
  {
    v55 = [ARWorldAlignmentTechnique alloc];
    v56 = -[ARConfiguration worldAlignment](self, "worldAlignment");
    -[ARConfiguration videoFormat](self, "videoFormat");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = -[ARWorldAlignmentTechnique initWithAlignment:cameraPosition:](v55, "initWithAlignment:cameraPosition:", v56, objc_msgSend(v57, "captureDevicePosition"));
    objc_msgSend(v4, "addObject:", v58);

  }
  if (-[ARConfiguration lightEstimation](self, "lightEstimation") == 1
    || -[ARConfiguration lightEstimation](self, "lightEstimation") == 2)
  {
    v59 = (void *)objc_opt_new();
    objc_msgSend(v4, "addObject:", v59);

  }
}

- (int64_t)_depthPrioritization
{
  return 1;
}

- (id)secondaryTechniques
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (NSArray)supportedVideoFormats
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Supported video formats should be called on individual configuration class."), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (void)setShouldUse30FPSJasperFormats:(BOOL)a3
{
  void *v3;

  if (s_customJasperFrameRate != 30)
  {
    s_customJasperFrameRate = 30;
    v3 = (void *)s_supportedJasperFormatsCache;
    if (s_supportedJasperFormatsCache)
    {
      s_supportedJasperFormatsCache = MEMORY[0x1E0C9AA60];

    }
  }
}

+ (BOOL)shouldUse30FPSJasperFormats
{
  return s_customJasperFrameRate == 30;
}

- (void)setJasperFrameRate:(int64_t)a3
{
  void *v3;

  if (self->_jasperFrameRate != a3)
  {
    self->_jasperFrameRate = a3;
    s_customJasperFrameRate = a3;
    v3 = (void *)s_supportedJasperFormatsCache;
    if (s_supportedJasperFormatsCache)
    {
      s_supportedJasperFormatsCache = MEMORY[0x1E0C9AA60];

    }
  }
}

- (int64_t)jasperFrameRate
{
  return self->_jasperFrameRate;
}

- (void)setDepthSensorNumberOfPointsMode:(int64_t)a3
{
  void *v4;

  if (self->_depthSensorNumberOfPointsMode != a3 || s_customNumberOfPointsMode != a3)
  {
    self->_depthSensorNumberOfPointsMode = a3;
    s_customNumberOfPointsMode = a3;
    v4 = (void *)s_supportedJasperFormatsCache;
    if (s_supportedJasperFormatsCache)
    {
      s_supportedJasperFormatsCache = MEMORY[0x1E0C9AA60];

    }
  }
}

+ (AVCaptureDevice)configurableCaptureDeviceForPrimaryCamera
{
  SEL v2;
  void *v3;
  void *v4;

  v2 = NSSelectorFromString(CFSTR("supportedVideoFormatsForUltraWide"));
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "performSelector:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0C8B0A0], "defaultDeviceWithDeviceType:mediaType:position:", *MEMORY[0x1E0C89FA0], *MEMORY[0x1E0C8A808], 1);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return (AVCaptureDevice *)v4;
}

+ (ARVideoFormat)recommendedVideoFormatFor4KResolution
{
  return 0;
}

+ (ARVideoFormat)recommendedVideoFormatForHighResolutionFrameCapturing
{
  return 0;
}

+ (void)setShouldProvideX420VideoFormat:(BOOL)a3
{
  if (s_provideX420VideoFormat != a3)
    s_provideX420VideoFormat = a3;
}

+ (BOOL)shouldProvideX420VideoFormat
{
  return s_provideX420VideoFormat;
}

+ (void)setShouldProvideNonBinnedVideoFormats:(BOOL)a3
{
  if (s_provideNonBinnedVideoFormats != a3)
    s_provideNonBinnedVideoFormats = a3;
}

+ (BOOL)shouldProvideNonBinnedVideoFormats
{
  if (s_provideNonBinnedVideoFormats || (ARDeviceSupportsUltraWideCamera() & 1) != 0)
    return 1;
  else
    return ARDeviceSupportsJasper();
}

- (unint64_t)hash
{
  objc_class *v2;
  void *v3;
  unint64_t v4;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  BOOL v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  ARWorldAlignment v17;
  unint64_t v18;
  int v19;
  unint64_t v20;
  int64_t v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  ARFrameSemantics v27;
  void *v28;
  void *v29;
  int64_t v30;
  int v31;
  int64_t v32;
  int v33;
  int64_t v34;
  _BOOL4 v35;
  objc_super v37;

  v6 = a3;
  v37.receiver = self;
  v37.super_class = (Class)ARConfiguration;
  if (!-[ARConfiguration isEqual:](&v37, sel_isEqual_, v6))
  {
    if (!objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()))
    {
      v7 = 0;
      goto LABEL_37;
    }
    v8 = v6;
    -[ARConfiguration customSensors](self, "customSensors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "customSensors");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v9 == (void *)v10)
    {

    }
    else
    {
      v11 = (void *)v10;
      -[ARConfiguration customSensors](self, "customSensors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "customSensors");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v3, "isEqualToArray:", v4);

      if (!v12)
      {
        v7 = 0;
LABEL_36:

        goto LABEL_37;
      }
    }
    -[ARConfiguration videoFormat](self, "videoFormat");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "videoFormat");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 != v14)
    {
      -[ARConfiguration videoFormat](self, "videoFormat");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "videoFormat");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "isEqual:", v4))
      {
        LOBYTE(v15) = 0;
        goto LABEL_34;
      }
    }
    v16 = -[ARConfiguration isAutoFocusEnabled](self, "isAutoFocusEnabled");
    if (v16 == objc_msgSend(v8, "isAutoFocusEnabled"))
    {
      v17 = -[ARConfiguration worldAlignment](self, "worldAlignment");
      if (v17 == objc_msgSend(v8, "worldAlignment"))
      {
        v18 = -[ARConfiguration lightEstimation](self, "lightEstimation");
        if (v18 == objc_msgSend(v8, "lightEstimation"))
        {
          v19 = -[ARConfiguration providesAudioData](self, "providesAudioData");
          if (v19 == objc_msgSend(v8, "providesAudioData"))
          {
            v20 = -[ARConfiguration frameDebugOptions](self, "frameDebugOptions");
            if (v20 == objc_msgSend(v8, "frameDebugOptions"))
            {
              v21 = -[ARConfiguration cameraPosition](self, "cameraPosition");
              if (v21 == objc_msgSend(v8, "cameraPosition"))
              {
                v22 = -[ARConfiguration isPersonMetadataEnabled](self, "isPersonMetadataEnabled");
                if (v22 == objc_msgSend(v8, "isPersonMetadataEnabled"))
                {
                  v23 = -[ARConfiguration allowCameraInMultipleForegroundAppLayout](self, "allowCameraInMultipleForegroundAppLayout");
                  if (v23 == objc_msgSend(v8, "allowCameraInMultipleForegroundAppLayout"))
                  {
                    v24 = -[ARConfiguration disableOcclusionForPersonSegmentation](self, "disableOcclusionForPersonSegmentation");
                    if (v24 == objc_msgSend(v8, "disableOcclusionForPersonSegmentation"))
                    {
                      v25 = -[ARConfiguration disableMLRelocalization](self, "disableMLRelocalization");
                      if (v25 == objc_msgSend(v8, "disableMLRelocalization"))
                      {
                        v26 = -[ARConfiguration disableRenderSyncScheduling](self, "disableRenderSyncScheduling");
                        if (v26 == objc_msgSend(v8, "disableRenderSyncScheduling"))
                        {
                          v27 = -[ARConfiguration frameSemantics](self, "frameSemantics");
                          if (v27 == objc_msgSend(v8, "frameSemantics"))
                          {
                            -[ARConfiguration timeOfFlightProjectorMode](self, "timeOfFlightProjectorMode");
                            v28 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v8, "timeOfFlightProjectorMode");
                            v29 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v28 == v29)
                            {
                              v30 = -[ARConfiguration depthSensorNumberOfPointsMode](self, "depthSensorNumberOfPointsMode");
                              if (v30 == objc_msgSend(v8, "depthSensorNumberOfPointsMode"))
                              {
                                v31 = -[ARConfiguration smartPersonOcclusionEnabled](self, "smartPersonOcclusionEnabled");
                                if (v31 == objc_msgSend(v8, "smartPersonOcclusionEnabled"))
                                {
                                  v32 = -[ARConfiguration jasperFrameRate](self, "jasperFrameRate");
                                  if (v32 == objc_msgSend(v8, "jasperFrameRate"))
                                  {
                                    v33 = -[ARConfiguration videoHDRAllowed](self, "videoHDRAllowed");
                                    if (v33 == objc_msgSend(v8, "videoHDRAllowed"))
                                    {
                                      v34 = -[ARConfiguration maxUltrawideImageForwardingFrameRate](self, "maxUltrawideImageForwardingFrameRate");
                                      if (v34 == objc_msgSend(v8, "maxUltrawideImageForwardingFrameRate"))
                                      {
                                        v35 = -[ARConfiguration focusPixelBlurScoreDeliveryEnabled](self, "focusPixelBlurScoreDeliveryEnabled");
                                        v15 = v35 ^ objc_msgSend(v8, "focusPixelBlurScoreDeliveryEnabled") ^ 1;

                                        v7 = v15;
                                        goto LABEL_33;
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
      }
    }
    LOBYTE(v15) = 0;
    v7 = 0;
LABEL_33:
    if (v13 == v14)
    {
LABEL_35:

      goto LABEL_36;
    }
LABEL_34:

    v7 = v15;
    goto LABEL_35;
  }
  v7 = 1;
LABEL_37:

  return v7;
}

- (id)descriptionWithoutBrackets
{
  void *v3;
  void *v4;
  unint64_t worldAlignment;
  const __CFString *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  worldAlignment = self->_worldAlignment;
  if (worldAlignment > 2)
    v6 = CFSTR("Unknown");
  else
    v6 = off_1E66737E0[worldAlignment];
  objc_msgSend(v3, "appendFormat:", CFSTR(" worldAlignment=%@"), v6);
  v7 = -[ARConfiguration lightEstimation](self, "lightEstimation");
  v8 = CFSTR("Enabled");
  if (!v7)
    v8 = CFSTR("Disabled");
  objc_msgSend(v4, "appendFormat:", CFSTR(" lightEstimation=%@"), v8);
  NSStringFromARFrameSemantics(-[ARConfiguration frameSemantics](self, "frameSemantics"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" frameSemantics=%@"), v9);

  -[ARConfiguration videoFormat](self, "videoFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" videoFormat=%@"), v10);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARConfiguration descriptionWithoutBrackets](self, "descriptionWithoutBrackets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v7);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isKindOfConfiguration:(Class)a3
{
  void *v3;
  BOOL v4;

  -[ARConfiguration getAsKindOfConfiguration:](self, "getAsKindOfConfiguration:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)getAsKindOfConfiguration:(Class)a3
{
  ARConfiguration *v4;
  ARConfiguration *v5;
  void *v6;
  char isKindOfClass;

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = self;
      -[ARConfiguration templateConfiguration](v5, "templateConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[ARConfiguration templateConfiguration](v5, "templateConfiguration");
        v4 = (ARConfiguration *)objc_claimAutoreleasedReturnValue();

        return v4;
      }

    }
    v4 = 0;
    return v4;
  }
  v4 = self;
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initPrivate");
  objc_storeStrong((id *)(v5 + 16), self->_videoFormat);
  *(_BYTE *)(v5 + 35) = -[ARConfiguration isAutoFocusEnabled](self, "isAutoFocusEnabled");
  *(_QWORD *)(v5 + 48) = self->_worldAlignment;
  *(_QWORD *)(v5 + 72) = self->_lightEstimation;
  *(_BYTE *)(v5 + 32) = self->_providesAudioData;
  v6 = -[NSArray copyWithZone:](self->_customSensors, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  *(_QWORD *)(v5 + 80) = self->_frameDebugOptions;
  *(_BYTE *)(v5 + 37) = self->_personMetadataEnabled;
  *(_QWORD *)(v5 + 8) = self->_cameraPosition;
  *(_BYTE *)(v5 + 38) = self->_allowCameraInMultipleForegroundAppLayout;
  *(_BYTE *)(v5 + 39) = self->_disableOcclusionForPersonSegmentation;
  *(_BYTE *)(v5 + 40) = self->_disableMLRelocalization;
  *(_BYTE *)(v5 + 41) = self->_disableRenderSyncScheduling;
  *(_QWORD *)(v5 + 56) = self->_frameSemantics;
  objc_storeStrong((id *)(v5 + 88), self->_timeOfFlightProjectorMode);
  *(_QWORD *)(v5 + 96) = self->_depthSensorNumberOfPointsMode;
  *(_BYTE *)(v5 + 34) = self->_smartPersonOcclusionEnabled;
  *(_QWORD *)(v5 + 24) = self->_jasperFrameRate;
  *(_BYTE *)(v5 + 33) = self->_videoHDRAllowed;
  *(_QWORD *)(v5 + 104) = self->_maxUltrawideImageForwardingFrameRate;
  *(_BYTE *)(v5 + 36) = self->_focusPixelBlurScoreDeliveryEnabled;
  return (id)v5;
}

- (ARVideoFormat)videoFormat
{
  return self->_videoFormat;
}

- (ARWorldAlignment)worldAlignment
{
  return self->_worldAlignment;
}

- (void)setWorldAlignment:(ARWorldAlignment)worldAlignment
{
  self->_worldAlignment = worldAlignment;
}

- (BOOL)providesAudioData
{
  return self->_providesAudioData;
}

- (void)setProvidesAudioData:(BOOL)providesAudioData
{
  self->_providesAudioData = providesAudioData;
}

- (ARFrameSemantics)frameSemantics
{
  return self->_frameSemantics;
}

- (BOOL)videoHDRAllowed
{
  return self->_videoHDRAllowed;
}

- (void)setVideoHDRAllowed:(BOOL)videoHDRAllowed
{
  self->_videoHDRAllowed = videoHDRAllowed;
}

- (BOOL)smartPersonOcclusionEnabled
{
  return self->_smartPersonOcclusionEnabled;
}

- (void)setSmartPersonOcclusionEnabled:(BOOL)a3
{
  self->_smartPersonOcclusionEnabled = a3;
}

- (BOOL)isAutoFocusEnabled
{
  return self->_autoFocusEnabled;
}

- (void)setAutoFocusEnabled:(BOOL)a3
{
  self->_autoFocusEnabled = a3;
}

- (BOOL)focusPixelBlurScoreDeliveryEnabled
{
  return self->_focusPixelBlurScoreDeliveryEnabled;
}

- (void)setFocusPixelBlurScoreDeliveryEnabled:(BOOL)a3
{
  self->_focusPixelBlurScoreDeliveryEnabled = a3;
}

- (NSArray)customSensors
{
  return self->_customSensors;
}

- (unint64_t)lightEstimation
{
  return self->_lightEstimation;
}

- (void)setLightEstimation:(unint64_t)a3
{
  self->_lightEstimation = a3;
}

- (unint64_t)frameDebugOptions
{
  return self->_frameDebugOptions;
}

- (void)setFrameDebugOptions:(unint64_t)a3
{
  self->_frameDebugOptions = a3;
}

- (BOOL)isPersonMetadataEnabled
{
  return self->_personMetadataEnabled;
}

- (void)setPersonMetadataEnabled:(BOOL)a3
{
  self->_personMetadataEnabled = a3;
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- (BOOL)allowCameraInMultipleForegroundAppLayout
{
  return self->_allowCameraInMultipleForegroundAppLayout;
}

- (void)setAllowCameraInMultipleForegroundAppLayout:(BOOL)a3
{
  self->_allowCameraInMultipleForegroundAppLayout = a3;
}

- (BOOL)disableOcclusionForPersonSegmentation
{
  return self->_disableOcclusionForPersonSegmentation;
}

- (void)setDisableOcclusionForPersonSegmentation:(BOOL)a3
{
  self->_disableOcclusionForPersonSegmentation = a3;
}

- (BOOL)disableMLRelocalization
{
  return self->_disableMLRelocalization;
}

- (void)setDisableMLRelocalization:(BOOL)a3
{
  self->_disableMLRelocalization = a3;
}

- (NSString)timeOfFlightProjectorMode
{
  return self->_timeOfFlightProjectorMode;
}

- (int64_t)depthSensorNumberOfPointsMode
{
  return self->_depthSensorNumberOfPointsMode;
}

- (int64_t)maxUltrawideImageForwardingFrameRate
{
  return self->_maxUltrawideImageForwardingFrameRate;
}

- (void)setMaxUltrawideImageForwardingFrameRate:(int64_t)a3
{
  self->_maxUltrawideImageForwardingFrameRate = a3;
}

- (BOOL)disableRenderSyncScheduling
{
  return self->_disableRenderSyncScheduling;
}

- (void)setDisableRenderSyncScheduling:(BOOL)a3
{
  self->_disableRenderSyncScheduling = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeOfFlightProjectorMode, 0);
  objc_storeStrong((id *)&self->_customSensors, 0);
  objc_storeStrong((id *)&self->_videoFormat, 0);
}

@end
