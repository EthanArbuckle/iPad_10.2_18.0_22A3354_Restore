@implementation ARFaceTrackingConfiguration

+ (BOOL)supportsWorldTracking
{
  int v2;

  v2 = ARDeviceSupportsMulticamMode();
  if (v2)
    LOBYTE(v2) = ARUserDefaultsMulticamModeEnabled();
  return v2;
}

+ (BOOL)supportsFrameSemantics:(unint64_t)a3
{
  objc_super v6;

  if (a3 <= 1 && (ARAppleNeuralEngine() & 1) != 0)
    return 1;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___ARFaceTrackingConfiguration;
  return objc_msgSendSuper2(&v6, sel_supportsFrameSemantics_, a3);
}

- (ARFaceTrackingConfiguration)init
{
  ARFaceTrackingConfiguration *v2;
  ARFaceTrackingConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARFaceTrackingConfiguration;
  v2 = -[ARConfiguration initPrivate](&v5, sel_initPrivate);
  v3 = v2;
  if (v2)
  {
    -[ARFaceTrackingConfiguration setLightEstimationEnabled:](v2, "setLightEstimationEnabled:", 1);
    -[ARFaceTrackingConfiguration setWorldTrackingEnabled:](v3, "setWorldTrackingEnabled:", 0);
    -[ARFaceTrackingConfiguration setMaximumNumberOfTrackedFaces:](v3, "setMaximumNumberOfTrackedFaces:", 1);
    -[ARFaceTrackingConfiguration setLowPower:](v3, "setLowPower:", +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.faceTracking.lowPowerMode.enabled")));
  }
  return v3;
}

- (void)setLightEstimationEnabled:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  -[ARConfiguration setLightEstimation:](self, "setLightEstimation:", v3);
}

- (void)setCameraPosition:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  ARVideoFormat *v7;
  ARVideoFormat *videoFormat;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  ARFaceTrackingConfiguration *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.faceTracking.backCamera.allowed")))
  {
    if (a3
      && (-[ARConfiguration videoFormat](self, "videoFormat"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "captureDevicePosition"),
          v5,
          v6 != a3))
    {
      v14.receiver = self;
      v14.super_class = (Class)ARFaceTrackingConfiguration;
      -[ARConfiguration setCameraPosition:](&v14, sel_setCameraPosition_, a3);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "supportedVideoFormats");
      v13[1] = 3221225472;
      v13[2] = __49__ARFaceTrackingConfiguration_setCameraPosition___block_invoke;
      v13[3] = &__block_descriptor_40_e30_B32__0__ARVideoFormat_8Q16_B24l;
      v13[4] = a3;
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      objc_msgSend(v12, "ar_firstObjectPassingTest:", v13);
      v7 = (ARVideoFormat *)objc_claimAutoreleasedReturnValue();
      videoFormat = self->super._videoFormat;
      self->super._videoFormat = v7;

      self->super._cameraPosition = a3;
    }
  }
  else
  {
    _ARLogGeneral_6();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      v17 = 2048;
      v18 = self;
      _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: setCameraPosition failed: The camera position for face tracking cannot be changed.", buf, 0x16u);

    }
  }
}

BOOL __49__ARFaceTrackingConfiguration_setCameraPosition___block_invoke(uint64_t a1, void *a2)
{
  return !*(_QWORD *)(a1 + 32) || objc_msgSend(a2, "captureDevicePosition") == *(_QWORD *)(a1 + 32);
}

+ (BOOL)isSupported
{
  unsigned int v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___ARFaceTrackingConfiguration;
  v2 = objc_msgSendSuper2(&v4, sel_isSupported);
  if (v2)
    LOBYTE(v2) = +[ARFaceTrackingTechnique isSupported](ARFaceTrackingTechnique, "isSupported");
  return v2;
}

+ (NSInteger)supportedNumberOfTrackedFaces
{
  return (int)CVAFaceTrackingMaximumNumberOfTrackedFaces();
}

+ (id)supportedVideoFormats
{
  uint64_t v3;
  void *v4;
  _QWORD block[5];

  if (supportedVideoFormats_supportedFormats && !objc_msgSend((id)supportedVideoFormats_supportedFormats, "count"))
  {
    objc_msgSend(a1, "_querySupportedVideoFormats");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)supportedVideoFormats_supportedFormats;
    supportedVideoFormats_supportedFormats = v3;

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__ARFaceTrackingConfiguration_supportedVideoFormats__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportedVideoFormats_onceToken != -1)
    dispatch_once(&supportedVideoFormats_onceToken, block);
  return (id)supportedVideoFormats_supportedFormats;
}

void __52__ARFaceTrackingConfiguration_supportedVideoFormats__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_querySupportedVideoFormats");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)supportedVideoFormats_supportedFormats;
  supportedVideoFormats_supportedFormats = v1;

}

+ (id)fallbackVideoFormat
{
  void *v3;
  void *v4;

  ARFaceTrackingDevice();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fallbackVideoFormatWithCaptureDeviceType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)fallbackVideoFormatWithCaptureDeviceType:(id)a3
{
  return +[ARVideoFormat bestVideoFormatForDevicePosition:deviceType:resolution:frameRate:videoBinned:](ARVideoFormat, "bestVideoFormatForDevicePosition:deviceType:resolution:frameRate:videoBinned:", 2, a3, 0x2D000000500, 0, 30.0);
}

+ (id)_querySupportedVideoFormats
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  if (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.faceTracking.backCamera.allowed")))
  {
    +[ARVideoFormat supportedVideoFormatsForDevicePosition:deviceType:](ARVideoFormat, "supportedVideoFormatsForDevicePosition:deviceType:", 1, *MEMORY[0x1E0C89FA0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v4);

  }
  ARFaceTrackingDevice();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARVideoFormat supportedVideoFormatsForDevicePosition:deviceType:](ARVideoFormat, "supportedVideoFormatsForDevicePosition:deviceType:", 2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  if (ARRGBFaceTrackingEnabled() && !objc_msgSend(v3, "count"))
  {
    objc_msgSend(a1, "fallbackVideoFormat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v3, "addObject:", v7);

  }
  return v3;
}

+ (id)supportedVideoFormatsForWorldTracking
{
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD block[5];

  if (objc_msgSend((id)objc_opt_class(), "supportsWorldTracking")
    && +[ARWorldTrackingConfiguration isSupported](ARWorldTrackingConfiguration, "isSupported"))
  {
    if (supportedVideoFormatsForWorldTracking_supportedFormats
      && !objc_msgSend((id)supportedVideoFormatsForWorldTracking_supportedFormats, "count"))
    {
      objc_msgSend(a1, "_querySupportedVideoFormatsForWorldTracking");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)supportedVideoFormatsForWorldTracking_supportedFormats;
      supportedVideoFormatsForWorldTracking_supportedFormats = v3;

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__ARFaceTrackingConfiguration_supportedVideoFormatsForWorldTracking__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (supportedVideoFormatsForWorldTracking_onceToken != -1)
      dispatch_once(&supportedVideoFormatsForWorldTracking_onceToken, block);
    v5 = (id)supportedVideoFormatsForWorldTracking_supportedFormats;
  }
  else
  {
    v5 = (id)MEMORY[0x1E0C9AA60];
  }
  return v5;
}

void __68__ARFaceTrackingConfiguration_supportedVideoFormatsForWorldTracking__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_querySupportedVideoFormatsForWorldTracking");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)supportedVideoFormatsForWorldTracking_supportedFormats;
  supportedVideoFormatsForWorldTracking_supportedFormats = v1;

}

+ (id)_querySupportedVideoFormatsForWorldTracking
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (id)*MEMORY[0x1E0C89FA0];
  if (ARDeviceSupportsUltraWideCamera())
  {
    v4 = (id)*MEMORY[0x1E0C89F98];

    v3 = v4;
  }
  +[ARVideoFormat bestVideoFormatForDevicePosition:deviceType:resolution:frameRates:videoBinned:](ARVideoFormat, "bestVideoFormatForDevicePosition:deviceType:resolution:frameRates:videoBinned:", 1, v3, 0x1E000000280, &unk_1E66CEA60, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "imageResolution");
    if (+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:](ARWorldTrackingTechnique, "supportsVideoResolution:forDeviceType:", v3))
    {
      v7 = v6;
LABEL_11:
      v19 = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
  }
  _ARLogGeneral_6();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v10;
    v22 = 2048;
    v23 = a1;
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: The resolution of video format %@ is not supported by the world tracking technique on current device, trying a fallback video format", buf, 0x20u);

  }
  +[ARVideoFormat bestVideoFormatForDevicePosition:deviceType:resolution:frameRates:videoBinned:](ARVideoFormat, "bestVideoFormatForDevicePosition:deviceType:resolution:frameRates:videoBinned:", 1, v3, 0x2D000000500, &unk_1E66CEA78, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "imageResolution");
    if (+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:](ARWorldTrackingTechnique, "supportsVideoResolution:forDeviceType:", v3))
    {
      v6 = v7;
      goto LABEL_11;
    }
    _ARLogGeneral_6();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v14;
      v22 = 2048;
      v23 = a1;
      v24 = 2114;
      v25 = v7;
      _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_INFO, "%{public}@ <%p>: The resolution of video format %{public}@ is not supported by the world tracking technique on current device", buf, 0x20u);

    }
  }
  _ARLogGeneral_6();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v17;
    v22 = 2048;
    v23 = a1;
    _os_log_impl(&dword_1B3A68000, v15, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not find supported video format for running world tracking in multicam mode.", buf, 0x16u);

  }
  v11 = (void *)MEMORY[0x1E0C9AA60];
LABEL_18:

  return v11;
}

- (void)createTechniques:(id)a3
{
  id v4;
  ARFaceTrackingTechnique *v5;
  ARFaceTrackingTechnique *v6;
  ARParentTechnique *v7;
  void *v8;
  ARParentTechnique *v9;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[ARFaceTrackingConfiguration maximumNumberOfTrackedFaces](self, "maximumNumberOfTrackedFaces") < 1)
    goto LABEL_4;
  v5 = -[ARFaceTrackingTechnique initWithMaximumNumberOfTrackedFaces:]([ARFaceTrackingTechnique alloc], "initWithMaximumNumberOfTrackedFaces:", -[ARFaceTrackingConfiguration maximumNumberOfTrackedFaces](self, "maximumNumberOfTrackedFaces"));
  if (v5)
  {
    v6 = v5;
    v7 = [ARParentTechnique alloc];
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ARParentTechnique initWithParallelTechniques:](v7, "initWithParallelTechniques:", v8);

    objc_msgSend(v4, "addObject:", v9);
LABEL_4:
    v10.receiver = self;
    v10.super_class = (Class)ARFaceTrackingConfiguration;
    -[ARConfiguration createTechniques:](&v10, sel_createTechniques_, v4);
  }

}

- (id)secondaryTechniques
{
  void *v3;
  void *v4;
  ARWorldTrackingOptions *v5;
  void *v6;
  void *v7;
  ARWorldTrackingTechnique *v8;
  ARParentTechnique *v9;
  void *v10;
  ARParentTechnique *v11;
  ARWorldAlignmentTechnique *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "supportsWorldTracking")
    && -[ARFaceTrackingConfiguration isWorldTrackingEnabled](self, "isWorldTrackingEnabled"))
  {
    -[ARFaceTrackingConfiguration imageSensorSettingsForWorldTracking](self, "imageSensorSettingsForWorldTracking");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[ARWorldTrackingOptions initWithImageSensorSettings:]([ARWorldTrackingOptions alloc], "initWithImageSensorSettings:", v4);
    -[ARWorldTrackingOptions setPlaneEstimationShouldUseJasperData:](v5, "setPlaneEstimationShouldUseJasperData:", 0);
    -[ARConfiguration replaySensor](self, "replaySensor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "replayMode"))
      -[ARWorldTrackingOptions setDeterministicMode:](v5, "setDeterministicMode:", 1);
    v8 = -[ARWorldTrackingTechnique initWithOptions:]([ARWorldTrackingTechnique alloc], "initWithOptions:", v5);
    if (v8)
    {
      v9 = [ARParentTechnique alloc];
      v14[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[ARParentTechnique initWithParallelTechniques:](v9, "initWithParallelTechniques:", v10);
      objc_msgSend(v3, "addObject:", v11);

    }
    v12 = -[ARWorldAlignmentTechnique initWithAlignment:cameraPosition:]([ARWorldAlignmentTechnique alloc], "initWithAlignment:cameraPosition:", -[ARConfiguration worldAlignment](self, "worldAlignment"), 1);
    objc_msgSend(v3, "addObject:", v12);

  }
  return v3;
}

- (id)parentImageSensorSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  char v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)ARFaceTrackingConfiguration;
  -[ARConfiguration parentImageSensorSettings](&v21, sel_parentImageSensorSettings);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (objc_msgSend((id)objc_opt_class(), "supportsWorldTracking"))
  {
    -[ARFaceTrackingConfiguration imageSensorSettingsForWorldTracking](self, "imageSensorSettingsForWorldTracking");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoFormat");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[ARConfiguration videoFormat](self, "videoFormat");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(v6, "videoFormat");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "captureDevicePosition");
        -[ARConfiguration videoFormat](self, "videoFormat");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 == objc_msgSend(v13, "captureDevicePosition"))
        {
          objc_msgSend(v6, "videoFormat");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "captureDeviceType");
          v18 = v11;
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[ARConfiguration videoFormat](self, "videoFormat");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "captureDeviceType");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v14, "isEqualToString:", v16);

          if ((v19 & 1) != 0)
            goto LABEL_10;
        }
        else
        {

        }
        objc_msgSend(v6, "setEnabled:", -[ARFaceTrackingConfiguration isWorldTrackingEnabled](self, "isWorldTrackingEnabled"));
        objc_msgSend(v5, "addObject:", v6);
      }
      else
      {

      }
    }
LABEL_10:

  }
  objc_msgSend(v3, "setSettings:", v5);

  return v3;
}

- (id)imageSensorSettingsForLowPower
{
  double v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  AVCaptureDevicePosition v7;
  void *v8;
  ARImageSensorSettings *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  const char *v17;
  _BYTE v19[22];
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[ARVideoFormat imageResolution](self->super._videoFormat, "imageResolution");
  v4 = (int)v3;
  -[ARVideoFormat imageResolution](self->super._videoFormat, "imageResolution");
  v6 = (int)v5;
  v7 = -[ARVideoFormat captureDevicePosition](self->super._videoFormat, "captureDevicePosition");
  +[ARVideoFormat bestVideoFormatForDevicePosition:deviceType:resolution:frameRate:videoBinned:](ARVideoFormat, "bestVideoFormatForDevicePosition:deviceType:resolution:frameRate:videoBinned:", v7, *MEMORY[0x1E0C89FA0], v4 | (v6 << 32), 1, (double)-[ARVideoFormat framesPerSecond](self->super._videoFormat, "framesPerSecond"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ARImageSensorSettings initWithVideoFormat:]([ARImageSensorSettings alloc], "initWithVideoFormat:", v8);
  -[ARImageSensorSettings setAutoFocusEnabled:](v9, "setAutoFocusEnabled:", -[ARConfiguration isAutoFocusEnabled](self, "isAutoFocusEnabled"));
  -[ARImageSensorSettings setSupportsCapturingHighResolutionFrames:](v9, "setSupportsCapturingHighResolutionFrames:", 1);
  if (-[ARVideoFormat captureDevicePosition](self->super._videoFormat, "captureDevicePosition") == AVCaptureDevicePositionFront)
  {
    +[ARKitUserDefaults valueForKey:](ARKitUserDefaults, "valueForKey:", CFSTR("com.apple.arkit.imagesensor.face.mirror"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = objc_msgSend(v10, "BOOLValue");
      if (_ARLogSensor_onceToken_2 != -1)
        dispatch_once(&_ARLogSensor_onceToken_2, &__block_literal_global_92);
      v13 = (void *)_ARLogSensor_logObj_2;
      if (os_log_type_enabled((os_log_t)_ARLogSensor_logObj_2, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = "disabled";
        *(_DWORD *)v19 = 138543874;
        *(_QWORD *)&v19[4] = v16;
        if ((_DWORD)v12)
          v17 = "enabled";
        *(_WORD *)&v19[12] = 2048;
        *(_QWORD *)&v19[14] = self;
        v20 = 2080;
        v21 = v17;
        _os_log_impl(&dword_1B3A68000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Face tracking image sensor mirrored video output %s by user defaults", v19, 0x20u);

      }
    }
    else
    {
      v12 = 1;
    }
    -[ARImageSensorSettings setMirrorVideoOutput:](v9, "setMirrorVideoOutput:", v12, *(_OWORD *)v19);

  }
  return v9;
}

- (id)imageSensorSettings
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  objc_super v8;

  if (self->_lowPower)
  {
    -[ARFaceTrackingConfiguration imageSensorSettingsForLowPower](self, "imageSensorSettingsForLowPower");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ARFaceTrackingConfiguration;
    -[ARConfiguration imageSensorSettings](&v8, sel_imageSensorSettings);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;
  v5 = -[ARFaceTrackingConfiguration maximumNumberOfTrackedFaces](self, "maximumNumberOfTrackedFaces");
  v6 = (_QWORD *)MEMORY[0x1E0C8AA68];
  if (v5 <= 0)
    v6 = (_QWORD *)MEMORY[0x1E0C8AA38];
  objc_msgSend(v4, "setMetaData:", *v6);
  objc_msgSend(v4, "setMaximumNumberOfTrackedFaces:", -[ARFaceTrackingConfiguration maximumNumberOfTrackedFaces](self, "maximumNumberOfTrackedFaces"));
  objc_msgSend(v4, "setCalibrationDataOutputEnabled:", 0);
  return v4;
}

- (id)imageSensorSettingsForWorldTracking
{
  void *v3;
  void *v4;
  ARImageSensorSettings *v5;
  uint64_t v6;
  ARWorldTrackingOptions *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  ARFaceTrackingConfiguration *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "supportedVideoFormatsForWorldTracking");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[ARImageSensorSettings initWithVideoFormat:]([ARImageSensorSettings alloc], "initWithVideoFormat:", v4);
    -[ARImageSensorSettings setAutoFocusEnabled:](v5, "setAutoFocusEnabled:", -[ARConfiguration isAutoFocusEnabled](self, "isAutoFocusEnabled"));
    if (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.worldTracking.visionData")))
    {
      v6 = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.worldTracking.simulateHWFeatureDetection")) ^ 1;
    }
    else
    {
      v6 = 0;
    }
    -[ARImageSensorSettings setVisionDataOutputEnabled:](v5, "setVisionDataOutputEnabled:", v6);
    if (-[ARImageSensorSettings visionDataOutputEnabled](v5, "visionDataOutputEnabled"))
    {
      v7 = -[ARWorldTrackingOptions initWithImageSensorSettings:]([ARWorldTrackingOptions alloc], "initWithImageSensorSettings:", v5);
      -[ARWorldTrackingOptions setImageSensorSettings:](v7, "setImageSensorSettings:", v5);
      ARVisionDataParametersForWorldTrackingOptions(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[ARImageSensorSettings setVisionDataOutputParameters:](v5, "setVisionDataOutputParameters:", v8);
      }
      else
      {
        _ARLogGeneral_6();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = (objc_class *)objc_opt_class();
          NSStringFromClass(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 138543618;
          v14 = v11;
          v15 = 2048;
          v16 = self;
          _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error reading vision data output parameters.", (uint8_t *)&v13, 0x16u);

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

- (void)setMaximumNumberOfTrackedFaces:(NSInteger)maximumNumberOfTrackedFaces
{
  NSInteger v5;

  if (ARLinkedOnOrAfterYukon())
  {
    v5 = (int)+[ARFaceTrackingConfiguration supportedNumberOfTrackedFaces](ARFaceTrackingConfiguration, "supportedNumberOfTrackedFaces");
    if ((maximumNumberOfTrackedFaces & 0x8000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    self->_maximumNumberOfTrackedFaces = 0;
    return;
  }
  v5 = 1;
  if (maximumNumberOfTrackedFaces < 0)
    goto LABEL_6;
LABEL_3:
  if (v5 >= maximumNumberOfTrackedFaces)
    self->_maximumNumberOfTrackedFaces = maximumNumberOfTrackedFaces;
  else
    self->_maximumNumberOfTrackedFaces = v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  NSInteger v7;
  _BOOL4 v8;
  int v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ARFaceTrackingConfiguration;
  if (-[ARConfiguration isEqual:](&v11, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = -[ARFaceTrackingConfiguration isWorldTrackingEnabled](self, "isWorldTrackingEnabled");
    if (v6 == objc_msgSend(v5, "isWorldTrackingEnabled")
      && (v7 = -[ARFaceTrackingConfiguration maximumNumberOfTrackedFaces](self, "maximumNumberOfTrackedFaces"),
          v7 == objc_msgSend(v5, "maximumNumberOfTrackedFaces")))
    {
      v8 = -[ARFaceTrackingConfiguration lowPower](self, "lowPower");
      v9 = v8 ^ objc_msgSend(v5, "lowPower") ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARFaceTrackingConfiguration;
  v4 = -[ARConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[112] = -[ARFaceTrackingConfiguration isWorldTrackingEnabled](self, "isWorldTrackingEnabled");
  *((_QWORD *)v4 + 15) = -[ARFaceTrackingConfiguration maximumNumberOfTrackedFaces](self, "maximumNumberOfTrackedFaces");
  v4[113] = -[ARFaceTrackingConfiguration lowPower](self, "lowPower");
  return v4;
}

- (NSInteger)maximumNumberOfTrackedFaces
{
  return self->_maximumNumberOfTrackedFaces;
}

- (BOOL)isWorldTrackingEnabled
{
  return self->_worldTrackingEnabled;
}

- (void)setWorldTrackingEnabled:(BOOL)worldTrackingEnabled
{
  self->_worldTrackingEnabled = worldTrackingEnabled;
}

- (BOOL)lowPower
{
  return self->_lowPower;
}

- (void)setLowPower:(BOOL)a3
{
  self->_lowPower = a3;
}

@end
