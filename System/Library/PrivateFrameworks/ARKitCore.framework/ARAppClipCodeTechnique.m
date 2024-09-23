@implementation ARAppClipCodeTechnique

- (ARAppClipCodeTechnique)initWithIgnoreURLLimitation:(BOOL)a3
{
  ARAppClipCodeTechnique *v4;
  ARAppClipCodeTechnique *v5;
  uint64_t v6;
  NSMutableDictionary *decodedURLs;
  BCSAppClipCodeURLDecoder *v8;
  BCSAppClipCodeURLDecoder *urlDecoder;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ARAppClipCodeTechnique;
  v4 = -[ARImageBasedTechnique init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_ignoreURLLimitation = a3;
    v6 = objc_opt_new();
    decodedURLs = v5->_decodedURLs;
    v5->_decodedURLs = (NSMutableDictionary *)v6;

    v8 = (BCSAppClipCodeURLDecoder *)objc_alloc_init(getBCSAppClipCodeURLDecoderClass());
    urlDecoder = v5->_urlDecoder;
    v5->_urlDecoder = v8;

  }
  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  AppC3DSession *appClipCodeSession;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  ARAppClipCodeTechnique *v14;
  __int16 v15;
  AppC3DSession *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_appClipCodeSession)
  {
    _ARLogTechnique_10();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      appClipCodeSession = self->_appClipCodeSession;
      *(_DWORD *)buf = 138543874;
      v12 = v5;
      v13 = 2048;
      v14 = self;
      v15 = 2048;
      v16 = appClipCodeSession;
      _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Releasing app clip code session: %p …", buf, 0x20u);

    }
    AppC3DRelease();
    _ARLogTechnique_10();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v9;
      v13 = 2048;
      v14 = self;
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: App clip code session released", buf, 0x16u);

    }
  }
  v10.receiver = self;
  v10.super_class = (Class)ARAppClipCodeTechnique;
  -[ARAppClipCodeTechnique dealloc](&v10, sel_dealloc);
}

- (void)prepare:(BOOL)a3
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  _BOOL8 v7;
  int64_t v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  const __CFString *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSDictionary *v21;
  NSDictionary *appClipCodeTrackingOptions;
  _BOOL4 v23;
  _BOOL4 v24;
  objc_class *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  ARAppClipCodeTechnique *v35;
  __int16 v36;
  _BYTE v37[14];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (self->_appClipCodeSession)
  {
    _ARLogTechnique_10();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v6;
      v34 = 2048;
      v35 = self;
      _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: App clip code session already exists, not recreating it.", buf, 0x16u);

    }
  }
  else
  {
    v7 = a3;
    kdebug_trace();
    if (-[NSMutableDictionary count](self->_decodedURLs, "count"))
      -[NSMutableDictionary removeAllObjects](self->_decodedURLs, "removeAllObjects");
    AppC3DConfigCreate();
    v8 = +[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", CFSTR("com.apple.arkit.appClipCodeTracking.performanceTestMode"));
    if (v8 == 2)
      AppC3DConfigSetTrackingConfig();
    if (+[ARAppClipCodeTechnique shouldRunCameraOrScannerPerformanceTestingMode](ARAppClipCodeTechnique, "shouldRunCameraOrScannerPerformanceTestingMode", 0, 0))
    {
      _ARLogTechnique_10();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("scanner");
        *(_DWORD *)buf = 138543874;
        v33 = v11;
        if (v8 == 1)
          v12 = CFSTR("camera");
        v34 = 2048;
        v35 = self;
        v36 = 2112;
        *(_QWORD *)v37 = v12;
        _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Running in '%@' performance test mode", buf, 0x20u);

      }
      v13 = 0;
    }
    else
    {
      v13 = 1;
    }
    AppC3DConfigSetTrackingMode();
    v14 = v29;
    if (v29)
    {
      _ARLogTechnique_10();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v33 = v17;
        v34 = 2048;
        v35 = self;
        v36 = 1024;
        *(_DWORD *)v37 = v13;
        *(_WORD *)&v37[4] = 2112;
        *(_QWORD *)&v37[6] = v29;
        _os_log_impl(&dword_1B3A68000, v15, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not set app clip code config tracking mode to: %d failed with error: %@", buf, 0x26u);

      }
      AppC3DConfigRelease();
      -[ARTechnique delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ARErrorWithCodeAndUserInfo(151, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "technique:didFailWithError:", self, v19);

    }
    else
    {
      AppC3DConfigSetMaxNumberCodesToTrack();
      v30 = *MEMORY[0x1E0CF8820];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v21 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      appClipCodeTrackingOptions = self->_appClipCodeTrackingOptions;
      self->_appClipCodeTrackingOptions = v21;

      AppC3DCreate();
      AppC3DConfigRelease();
      AppC3DSetUpdateCallback();
      -[ARAppClipCodeTechnique setPowerUsage:](self, "setPowerUsage:", -[ARTechnique powerUsage](self, "powerUsage"));
      v23 = -[ARAppClipCodeTechnique deterministicMode](self, "deterministicMode");
      _ARLogTechnique_10();
      v14 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
      if (v23)
      {
        if (v24)
        {
          v25 = (objc_class *)objc_opt_class();
          NSStringFromClass(v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v33 = v26;
          v34 = 2048;
          v35 = self;
          _os_log_impl(&dword_1B3A68000, v14, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: prepared for deterministic mode.", buf, 0x16u);

        }
      }
      else if (v24)
      {
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v28;
        v34 = 2048;
        v35 = self;
        _os_log_impl(&dword_1B3A68000, v14, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: prepared for non-deterministic mode.", buf, 0x16u);

      }
    }

    kdebug_trace();
  }
}

- (int64_t)captureBehavior
{
  return 1;
}

- (id)processData:(id)a3
{
  id v4;
  id v5;
  id v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  int IsZero;
  int8x16_t v12;
  int8x16_t v13;
  __n128 v14;
  int8x16_t v15;
  int8x16_t v16;
  __n128 v17;
  __n128 v18;
  BOOL v19;
  objc_super v21;
  objc_super v22;
  float64x2_t v23;
  float64x2_t v24[4];
  float64x2_t v25[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21.receiver = self;
    v21.super_class = (Class)ARAppClipCodeTechnique;
    v5 = -[ARImageBasedTechnique processData:](&v21, sel_processData_, v4);
    v6 = v4;
    objc_msgSend(v6, "visionTransform");
    IsZero = ARMatrix4x4IsZero(v7, v8, v9, v10);
    objc_msgSend(v6, "timestamp");
    if (IsZero)
    {
      -[ARImageBasedTechnique pushResultData:forTimestamp:](self, "pushResultData:forTimestamp:", MEMORY[0x1E0C9AA60]);
      objc_msgSend(v6, "timestamp");
      kdebug_trace();
    }
    else
    {
      kdebug_trace();
      v26 = 0;
      memset(v25, 0, sizeof(v25));
      objc_msgSend(v6, "cameraIntrinsics");
      objc_msgSend(v6, "visionTransform", ARMatrix3x3RowMajorArray(v25, v12, v13, v14));
      v19 = +[ARAppClipCodeTechnique shouldRunCameraOrScannerPerformanceTestingMode](ARAppClipCodeTechnique, "shouldRunCameraOrScannerPerformanceTestingMode", ARMatrix4x4RowMajorRotationAndTranslation(v24, &v23, v15, v16, v17, v18));
      objc_msgSend(v6, "pixelBuffer");
      objc_msgSend(v6, "timestamp");
      if (v19)
        AppC3DProcessCameraFrameData();
      else
        AppC3DProcess();

    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)ARAppClipCodeTechnique;
    -[ARImageBasedTechnique processData:](&v22, sel_processData_, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)deterministicMode
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_appClipCodeTrackingOptions, "objectForKey:", *MEMORY[0x1E0CF8820]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[NSDictionary isEqual:](self->_appClipCodeTrackingOptions, "isEqual:", v4[12]);
  else
    v5 = 0;

  return v5;
}

- (void)setPowerUsage:(unint64_t)a3
{
  int v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  ARAppClipCodeTechnique *v13;
  __int16 v14;
  ARAppClipCodeTechnique *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)ARAppClipCodeTechnique;
  -[ARTechnique setPowerUsage:](&v9, sel_setPowerUsage_);
  if (self->_appClipCodeSession)
  {
    if (a3 == 1)
      v5 = 1;
    else
      v5 = 2 * (a3 == 2);
    AppC3DSetPerformanceMode();
    _ARLogTechnique_10();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v11 = v8;
      v12 = 2048;
      v13 = self;
      v14 = 2048;
      v15 = self;
      v16 = 1024;
      v17 = v5;
      _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: ARAppClipCodeTechnique(%p): Setting performance mode %i.", buf, 0x26u);

    }
  }
}

- (double)requiredTimeInterval
{
  return 0.0;
}

+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3
{
  return objc_opt_class() == (_QWORD)a3;
}

+ (BOOL)shouldRunCameraOrScannerPerformanceTestingMode
{
  return (unint64_t)(+[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", CFSTR("com.apple.arkit.appClipCodeTracking.performanceTestMode"))- 1) < 2;
}

- (BOOL)ignoreURLLimitation
{
  return self->_ignoreURLLimitation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlDecoder, 0);
  objc_storeStrong((id *)&self->_decodedURLs, 0);
  objc_storeStrong((id *)&self->_appClipCodeTrackingOptions, 0);
}

@end
