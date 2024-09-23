@implementation ARPositionalTrackingConfiguration

+ (BOOL)isSupported
{
  return +[ARWorldTrackingConfiguration isSupported](ARWorldTrackingConfiguration, "isSupported");
}

- (ARPositionalTrackingConfiguration)init
{
  ARPositionalTrackingConfiguration *v2;
  ARPositionalTrackingConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARPositionalTrackingConfiguration;
  v2 = -[ARConfiguration initPrivate](&v5, sel_initPrivate);
  v3 = v2;
  if (v2)
  {
    -[ARConfiguration setLightEstimationEnabled:](v2, "setLightEstimationEnabled:", 0);
    -[ARConfiguration setAutoFocusEnabled:](v3, "setAutoFocusEnabled:", 1);
    v3->_relocalizationEnabled = 1;
  }
  return v3;
}

+ (id)supportedVideoFormats
{
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD block[5];

  if (objc_msgSend(a1, "isSupported"))
  {
    if (supportedVideoFormats_supportedFormats_0
      && !objc_msgSend((id)supportedVideoFormats_supportedFormats_0, "count"))
    {
      objc_msgSend(a1, "_querySupportedVideoFormats");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)supportedVideoFormats_supportedFormats_0;
      supportedVideoFormats_supportedFormats_0 = v3;

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__ARPositionalTrackingConfiguration_supportedVideoFormats__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (supportedVideoFormats_onceToken_1 != -1)
      dispatch_once(&supportedVideoFormats_onceToken_1, block);
    v5 = (id)supportedVideoFormats_supportedFormats_0;
  }
  else
  {
    v5 = (id)MEMORY[0x1E0C9AA60];
  }
  return v5;
}

void __58__ARPositionalTrackingConfiguration_supportedVideoFormats__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_querySupportedVideoFormats");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)supportedVideoFormats_supportedFormats_0;
  supportedVideoFormats_supportedFormats_0 = v1;

}

+ (id)_querySupportedVideoFormats
{
  id v3;
  id v4;
  _BOOL8 v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  unsigned int v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  _BOOL4 v24;
  NSObject *v25;
  _BOOL4 v26;
  objc_class *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  NSObject *v31;
  objc_class *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v3 = (id)*MEMORY[0x1E0C89FA0];
  if (ARDeviceSupportsUltraWideCamera())
  {
    v4 = (id)*MEMORY[0x1E0C89F98];

    v3 = v4;
  }
  v5 = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.imagesensor.back.wide.videoBinned"));
  +[ARKitUserDefaults resolutionDictionaryForKey:](ARKitUserDefaults, "resolutionDictionaryForKey:", CFSTR("com.apple.arkit.imagesensor.back.wide.resolution"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = v6;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("width"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("height"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8)
      v11 = v9 == 0;
    else
      v11 = 1;
    if (v11)
    {
      v12 = 480;
      v13 = 640;
    }
    else
    {
      v13 = objc_msgSend(v8, "intValue");
      v12 = objc_msgSend(v10, "intValue");
      if (_ARLogSensor_onceToken_8 != -1)
        dispatch_once(&_ARLogSensor_onceToken_8, &__block_literal_global_44);
      v14 = (void *)_ARLogSensor_logObj_8;
      if (os_log_type_enabled((os_log_t)_ARLogSensor_logObj_8, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v14;
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v39 = v35;
        v40 = 2048;
        v41 = a1;
        v42 = 1024;
        LODWORD(v43[0]) = v13;
        WORD2(v43[0]) = 1024;
        *(_DWORD *)((char *)v43 + 6) = v12;
        _os_log_impl(&dword_1B3A68000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: ARVideoFormat resolution set to %i, %i by user defaults", buf, 0x22u);

      }
    }

  }
  else
  {
    v12 = 480;
    v13 = 640;
  }
  +[ARVideoFormat bestVideoFormatForDevicePosition:deviceType:resolution:frameRate:videoBinned:](ARVideoFormat, "bestVideoFormatForDevicePosition:deviceType:resolution:frameRate:videoBinned:", 1, v3, v13 | (unint64_t)(v12 << 32), v5, 10.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "imageResolution");
    if (+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:](ARWorldTrackingTechnique, "supportsVideoResolution:forDeviceType:", v3))
    {
      v37 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v18;
      goto LABEL_34;
    }
    _ARLogGeneral_16();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v39 = v23;
      v40 = 2048;
      v41 = a1;
      v42 = 2114;
      v43[0] = v18;
      _os_log_impl(&dword_1B3A68000, v21, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Not returning video format %{public}@ because world tracking technique does not support its video resolution on current device", buf, 0x20u);

    }
  }
  +[ARVideoFormat bestVideoFormatForDevicePosition:deviceType:resolution:frameRate:videoBinned:](ARVideoFormat, "bestVideoFormatForDevicePosition:deviceType:resolution:frameRate:videoBinned:", 1, v3, 0x2D000000500, v5, 10.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v20, "imageResolution");
    v24 = +[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:](ARWorldTrackingTechnique, "supportsVideoResolution:forDeviceType:", v3);
    _ARLogGeneral_16();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
    if (v24)
    {
      if (v26)
      {
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v28;
        v40 = 2048;
        v41 = a1;
        _os_log_impl(&dword_1B3A68000, v25, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Falling back to 1280x720 for positional tracking configuration", buf, 0x16u);

      }
      v36 = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    if (v26)
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v39 = v30;
      v40 = 2048;
      v41 = a1;
      v42 = 2114;
      v43[0] = v20;
      _os_log_impl(&dword_1B3A68000, v25, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Not returning video format %{public}@ because world tracking technique does not support its video resolution on current device", buf, 0x20u);

    }
  }
  _ARLogGeneral_16();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = v33;
    v40 = 2048;
    v41 = a1;
    _os_log_impl(&dword_1B3A68000, v31, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Video format not found for positional tracking configuration", buf, 0x16u);

  }
  v19 = (void *)MEMORY[0x1E0C9AA60];
LABEL_34:

  return v19;
}

- (id)imageSensorSettings
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  ARPositionalTrackingConfiguration *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)ARPositionalTrackingConfiguration;
  -[ARConfiguration imageSensorSettings](&v11, sel_imageSensorSettings);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.worldTracking.visionData")))
  {
    v4 = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.worldTracking.simulateHWFeatureDetection")) ^ 1;
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v3, "setVisionDataOutputEnabled:", v4);
  if (objc_msgSend(v3, "visionDataOutputEnabled"))
  {
    -[ARPositionalTrackingConfiguration worldTrackingOptions](self, "worldTrackingOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImageSensorSettings:", v3);
    ARVisionDataParametersForWorldTrackingOptions(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "setVisionDataOutputParameters:", v6);
    }
    else
    {
      _ARLogGeneral_16();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v13 = v9;
        v14 = 2048;
        v15 = self;
        _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error reading vision data output parameters.", buf, 0x16u);

      }
    }

  }
  return v3;
}

- (id)worldTrackingOptions
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  -[ARConfiguration deviceModel](self, "deviceModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeviceModel:", v4);

  objc_msgSend(v3, "setRelocalizationEnabled:", -[ARPositionalTrackingConfiguration isRelocalizationEnabled](self, "isRelocalizationEnabled"));
  objc_msgSend(v3, "setPlaneDetection:", -[ARPositionalTrackingConfiguration planeDetection](self, "planeDetection"));
  if (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.planeEstimation.mlOnANEDevices")))
  {
    v5 = ARAppleNeuralEngine();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v3, "setMlModelEnabled:", v5);
  -[ARPositionalTrackingConfiguration initialWorldMap](self, "initialWorldMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInitialWorldMap:", v6);

  -[ARConfiguration replaySensor](self, "replaySensor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "replayMode"))
    objc_msgSend(v3, "setDeterministicMode:", 1);
  if (self->_vioFusionEnabled)
    objc_msgSend(v3, "setSlamConfiguration:", CFSTR("CoreLocationIntegration"));
  objc_msgSend(v3, "setPlaneEstimationShouldUseJasperData:", 0);

  return v3;
}

- (void)createTechniques:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  const __CFString *v11;
  ARWorldTrackingTechnique *v12;
  ARParentTechnique *v13;
  void *v14;
  ARParentTechnique *v15;
  void *v16;
  uint64_t v17;
  ARPlaneEstimationTechnique *v18;
  objc_super v19;
  ARWorldTrackingTechnique *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  ARPositionalTrackingConfiguration *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ARPositionalTrackingConfiguration worldTrackingOptions](self, "worldTrackingOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPositionalTrackingConfiguration imageSensorSettings](self, "imageSensorSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageSensorSettings:", v6);

  if (objc_msgSend(v5, "planeDetection"))
  {
    v7 = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.worldTracking.accuratePlaneExtentCheck"));
    _ARLogGeneral_16();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("disabled");
      *(_DWORD *)buf = 138543874;
      v22 = v10;
      if (v7)
        v11 = CFSTR("enabled");
      v23 = 2048;
      v24 = self;
      v25 = 2114;
      v26 = v11;
      _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Ray-cast accurate extent check: %{public}@", buf, 0x20u);

    }
    if (v7)
      objc_msgSend(v5, "setPlaneDetection:", objc_msgSend(v5, "planeDetection") | 0x200);
  }
  v12 = -[ARWorldTrackingTechnique initWithOptions:]([ARWorldTrackingTechnique alloc], "initWithOptions:", v5);
  if (v12)
  {
    v13 = [ARParentTechnique alloc];
    v20 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[ARParentTechnique initWithParallelTechniques:](v13, "initWithParallelTechniques:", v14);

    objc_msgSend(v4, "addObject:", v15);
    -[ARWorldTrackingTechnique options](v12, "options");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "planeDetection");

    if (v17)
    {
      v18 = -[ARPlaneEstimationTechnique initWithTrackingTechnique:]([ARPlaneEstimationTechnique alloc], "initWithTrackingTechnique:", v12);
      objc_msgSend(v4, "addObject:", v18);

    }
    v19.receiver = self;
    v19.super_class = (Class)ARPositionalTrackingConfiguration;
    -[ARConfiguration createTechniques:](&v19, sel_createTechniques_, v4);
    if (-[ARPositionalTrackingConfiguration planeDetection](self, "planeDetection"))
      ARAddNonJasperSemanticsToParent(v15, v4, -[ARConfiguration maxUltrawideImageForwardingFrameRate](self, "maxUltrawideImageForwardingFrameRate"), 0);

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ARPositionalTrackingConfiguration;
  if (-[ARConfiguration isEqual:](&v12, sel_isEqual_, v4))
  {
    v5 = (unsigned __int8 *)v4;
    if (self->_planeDetection == *((_QWORD *)v5 + 15))
    {
      -[ARPositionalTrackingConfiguration initialWorldMap](self, "initialWorldMap");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "initialWorldMap");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v10 = self->_relocalizationEnabled == v5[112] && self->_vioFusionEnabled == v5[113];
      }
      else
      {
        -[ARPositionalTrackingConfiguration initialWorldMap](self, "initialWorldMap");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "initialWorldMap");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (objc_msgSend(v8, "isEqual:", v9) & 1) != 0
           && self->_relocalizationEnabled == v5[112]
           && self->_vioFusionEnabled == v5[113];

      }
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ARPositionalTrackingConfiguration;
  v4 = -[ARConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v4[15] = self->_planeDetection;
  -[ARPositionalTrackingConfiguration initialWorldMap](self, "initialWorldMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInitialWorldMap:", v5);

  *((_BYTE *)v4 + 112) = self->_relocalizationEnabled;
  *((_BYTE *)v4 + 113) = self->_vioFusionEnabled;
  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ARConfiguration isAutoFocusEnabled](self, "isAutoFocusEnabled");
  v8 = CFSTR("Disabled");
  if (v7)
    v8 = CFSTR("Enabled");
  objc_msgSend(v6, "appendFormat:", CFSTR(" autoFocus=%@"), v8);
  NSStringFromARPlaneDetection(self->_planeDetection);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" planeDetection=%@"), v9);

  -[ARPositionalTrackingConfiguration initialWorldMap](self, "initialWorldMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ARPositionalTrackingConfiguration initialWorldMap](self, "initialWorldMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" initialWorldMap=%@"), v11);

  }
  -[ARConfiguration descriptionWithoutBrackets](self, "descriptionWithoutBrackets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v12);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
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

- (BOOL)isRelocalizationEnabled
{
  return self->_relocalizationEnabled;
}

- (void)setRelocalizationEnabled:(BOOL)a3
{
  self->_relocalizationEnabled = a3;
}

- (BOOL)isVIOFusionEnabled
{
  return self->_vioFusionEnabled;
}

- (void)setVioFusionEnabled:(BOOL)a3
{
  self->_vioFusionEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialWorldMap, 0);
}

@end
