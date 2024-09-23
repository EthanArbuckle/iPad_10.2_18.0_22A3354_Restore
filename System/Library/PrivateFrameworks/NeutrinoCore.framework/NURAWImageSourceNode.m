@implementation NURAWImageSourceNode

- (NURAWImageSourceNode)initWithImageSource:(CGImageSource *)a3 identifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *specific;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  objc_class *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_572);
  v6 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = v6;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v12;
    _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v13 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v13 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_572);
      goto LABEL_8;
    }
    if (v13 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_572);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v14 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v15 = (void *)MEMORY[0x1E0CB3978];
    v16 = v14;
    objc_msgSend(v15, "callStackSymbols");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v18;
    _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v19 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v21 = (void *)MEMORY[0x1E0CB3978];
  v22 = specific;
  v16 = v19;
  objc_msgSend(v21, "callStackSymbols");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v32 = specific;
  v33 = 2114;
  v34 = v24;
  _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v25 = (objc_class *)objc_opt_class();
  NSStringFromClass(v25);
  v26 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NURAWImageSourceNode initWithImageSource:identifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 130, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v27, v28, v29, v30, v26);
}

- (NURAWImageSourceNode)initWithURL:(id)a3 UTI:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NURAWImageSourceNode *v13;
  NSObject *v15;
  void *v16;
  void *specific;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[2];
  _QWORD v48[2];
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    NUAssertLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "URL != nil");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v16;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v30 = (void *)MEMORY[0x1E0CB3978];
        v31 = v29;
        objc_msgSend(v30, "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v29;
        v51 = 2114;
        v52 = v33;
        _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v21;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURAWImageSourceNode initWithURL:UTI:identifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 135, CFSTR("Invalid parameter not satisfying: %s"), v34, v35, v36, v37, (uint64_t)"URL != nil");
  }
  v11 = v10;
  if (!v10)
  {
    NUAssertLogger();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "identifier != nil");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v23;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v24)
    {
      if (v26)
      {
        v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v39 = (void *)MEMORY[0x1E0CB3978];
        v40 = v38;
        objc_msgSend(v39, "callStackSymbols");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v38;
        v51 = 2114;
        v52 = v42;
        _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v28;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURAWImageSourceNode initWithURL:UTI:identifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 136, CFSTR("Invalid parameter not satisfying: %s"), v43, v44, v45, v46, (uint64_t)"identifier != nil");
  }
  v47[0] = CFSTR("asRAW");
  v47[1] = CFSTR("identifier");
  v48[0] = MEMORY[0x1E0C9AAB0];
  v48[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NURAWImageSourceNode initWithURL:UTI:settings:](self, "initWithURL:UTI:settings:", v8, v9, v12);

  return v13;
}

- (NURAWImageSourceNode)initWithURL:(id)a3 UTI:(id)a4 settings:(id)a5
{
  NURAWImageSourceNode *v5;
  NSCache *v6;
  NSCache *propertiesByOptionCache;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NURAWImageSourceNode;
  v5 = -[NUCGImageSourceNode initWithURL:UTI:settings:](&v9, sel_initWithURL_UTI_settings_, a3, a4, a5);
  v6 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
  propertiesByOptionCache = v5->_propertiesByOptionCache;
  v5->_propertiesByOptionCache = v6;

  -[NSCache setName:](v5->_propertiesByOptionCache, "setName:", CFSTR("NURAWImageSourceNode.propertiesCache"));
  -[NSCache setCountLimit:](v5->_propertiesByOptionCache, "setCountLimit:", 8);
  return v5;
}

- (void)_addDefaultFinalizedSourceOptions:(id)a3
{
  id v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NURAWImageSourceNode;
  v3 = a3;
  -[NUCGImageSourceNode _addDefaultFinalizedSourceOptions:](&v5, sel__addDefaultFinalizedSourceOptions_, v3);
  v4 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CBD200], v5.receiver, v5.super_class);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("1"), *MEMORY[0x1E0CBD258]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("kCGImageSourceShouldUseRawDataForFullSize"));

}

- (id)_RAWCameraSpaceProperties:(id)a3 RAWProperties:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _NURAWCameraSpaceProperties *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_firstFilterOfType:inArray:", 6, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setRawConvert:", v7);
  objc_msgSend(v5, "rawConvert");
  v8 = (_NURAWCameraSpaceProperties *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v8 = objc_alloc_init(_NURAWCameraSpaceProperties);
    objc_msgSend(v5, "rawConvert");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKey:", CFSTR("inputXYZtoCamera1"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NURAWCameraSpaceProperties setXyzToCamera1:](v8, "setXyzToCamera1:", v10);

    objc_msgSend(v5, "rawConvert");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForKey:", CFSTR("inputXYZtoCamera2"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NURAWCameraSpaceProperties setXyzToCamera2:](v8, "setXyzToCamera2:", v12);

    objc_msgSend(v5, "rawConvert");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueForKey:", CFSTR("inputRange"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    -[_NURAWCameraSpaceProperties setWhiteValue:](v8, "setWhiteValue:");

    objc_msgSend(v5, "rawConvert");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valueForKey:", CFSTR("inputFactor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    -[_NURAWCameraSpaceProperties setWhiteFactor:](v8, "setWhiteFactor:");

  }
  return v8;
}

- (id)_RAWToneCurveProperties:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _NURAWToneCurveProperties *v6;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_firstFilterOfType:inArray:", 14, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "_firstFilterOfType:inArray:", 10, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_NURAWToneCurveProperties initWithToneCurveFilter:gainMapTableFilter:]([_NURAWToneCurveProperties alloc], "initWithToneCurveFilter:gainMapTableFilter:", v4, v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_hasLensCorrectionFilter:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_firstFilterOfType:inArray:", 5, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4 != 0;
}

- (void)_processRAWProperties:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _NURAWImageProperties *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  _NURAWNoiseReductionProperties *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  char isKindOfClass;
  void *v39;
  int v40;
  void *v41;
  char v42;
  void *v43;
  int v44;
  void *v45;
  char v46;
  void *v47;
  int v48;
  void *v49;
  id v50;
  double v51;
  double v52;

  v50 = a3;
  objc_msgSend(v50, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CBD068];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD068]);
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v50, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CBD210];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD210]);
  v9 = objc_claimAutoreleasedReturnValue();

  if (!(v6 | v9))
    goto LABEL_7;
  objc_msgSend(v50, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "removeObjectForKey:", v5);
  objc_msgSend(v11, "removeObjectForKey:", v8);
  objc_msgSend(v50, "setMetadata:", v11);

  if (!v6 || v9 == 0)
  {
LABEL_7:
    v13 = 0;
  }
  else
  {
    v13 = objc_alloc_init(_NURAWImageProperties);
    objc_msgSend((id)v9, "objectForKeyedSubscript:", CFSTR("kCGImageSourceMethodVersion"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NURAWImageProperties setDecoderVersion:](v13, "setDecoderVersion:", v14);

    objc_msgSend((id)v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD208]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NURAWImageProperties setAvailableDecoderVersions:](v13, "setAvailableDecoderVersions:", v15);

    objc_msgSend((id)v6, "objectForKeyedSubscript:", CFSTR("wx"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v6, "objectForKeyedSubscript:", CFSTR("wy"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v16 && v17)
    {
      v51 = 0.0;
      v52 = 0.0;
      objc_msgSend(v16, "doubleValue");
      v20 = v19;
      objc_msgSend(v18, "doubleValue");
      nu_xy_to_tempTint(&v52, &v51, v20, v21);
      -[_NURAWImageProperties setTemperature:](v13, "setTemperature:", v52);
      v22 = v51;
    }
    else
    {
      -[_NURAWImageProperties setTemperature:](v13, "setTemperature:", 5000.0);
      v22 = 0.0;
    }
    -[_NURAWImageProperties setTint:](v13, "setTint:", v22);

  }
  objc_msgSend((id)v9, "objectForKeyedSubscript:", CFSTR("kCGImageSourceLuminanceNoiseReductionAmount"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = objc_alloc_init(_NURAWNoiseReductionProperties);
    objc_msgSend((id)v9, "objectForKeyedSubscript:", CFSTR("kCGImageSourceLuminanceNoiseReductionAmount"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");
    -[_NURAWNoiseReductionProperties setLuminance:](v24, "setLuminance:");

    objc_msgSend((id)v9, "objectForKeyedSubscript:", CFSTR("kCGImageSourceColorNoiseReductionAmount"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    -[_NURAWNoiseReductionProperties setColor:](v24, "setColor:");

    objc_msgSend((id)v9, "objectForKeyedSubscript:", CFSTR("kCGImageSourceNoiseReductionSharpnessAmount"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValue");
    -[_NURAWNoiseReductionProperties setSharpness:](v24, "setSharpness:");

    objc_msgSend((id)v9, "objectForKeyedSubscript:", CFSTR("kCGImageSourceNoiseReductionContrastAmount"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValue");
    -[_NURAWNoiseReductionProperties setContrast:](v24, "setContrast:");

    objc_msgSend((id)v9, "objectForKeyedSubscript:", CFSTR("kCGImageSourceNoiseReductionDetailAmount"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "doubleValue");
    -[_NURAWNoiseReductionProperties setDetail:](v24, "setDetail:");

    -[_NURAWImageProperties setNoiseReductionProperties:](v13, "setNoiseReductionProperties:", v24);
  }
  objc_msgSend((id)v6, "objectForKeyedSubscript:", CFSTR("filters"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURAWImageSourceNode _RAWCameraSpaceProperties:RAWProperties:](self, "_RAWCameraSpaceProperties:RAWProperties:", v30, v13);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NURAWImageProperties setRawCameraSpaceProperties:](v13, "setRawCameraSpaceProperties:", v31);

  objc_msgSend((id)v6, "objectForKeyedSubscript:", CFSTR("filters"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURAWImageSourceNode _RAWToneCurveProperties:](self, "_RAWToneCurveProperties:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NURAWImageProperties setRawToneCurveProperties:](v13, "setRawToneCurveProperties:", v33);

  objc_msgSend(v50, "metadata");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = *MEMORY[0x1E0C89CB8];
  objc_msgSend(v35, "objectForKeyedSubscript:", *MEMORY[0x1E0C89CB8]);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v35, "objectForKeyedSubscript:", v36);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "unsignedIntValue");

    if ((v40 & 0x10000) != 0)
      -[_NURAWImageProperties setIsAppleProRaw:](v13, "setIsAppleProRaw:", 1);
  }
  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("23"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v42 = objc_opt_isKindOfClass();

  if ((v42 & 1) != 0)
  {
    objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("23"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "unsignedLongLongValue");

    if ((v44 & 4) != 0)
      -[_NURAWImageProperties setIsSensorRawCapture:](v13, "setIsSensorRawCapture:", 1);
    if ((v44 & 0x100000) != 0)
      -[_NURAWImageProperties setIsUnifiedBracketingHDRCapture:](v13, "setIsUnifiedBracketingHDRCapture:", 1);
  }
  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("20"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v46 = objc_opt_isKindOfClass();

  if ((v46 & 1) != 0)
  {
    objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("20"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "intValue");

    if (v48 == 12)
      -[_NURAWImageProperties setIsDeepFusion:](v13, "setIsDeepFusion:", 1);
  }
  objc_msgSend((id)v6, "objectForKeyedSubscript:", CFSTR("filters"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NURAWImageProperties setHasLensCorrection:](v13, "setHasLensCorrection:", -[NURAWImageSourceNode _hasLensCorrectionFilter:](self, "_hasLensCorrectionFilter:", v49));

  objc_msgSend(v50, "setRawProperties:", v13);
}

- (id)_evaluateImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NURAWImageSourceNode;
  -[NUCGImageSourceNode _evaluateImagePropertiesWithSourceOptions:error:](&v7, sel__evaluateImagePropertiesWithSourceOptions_error_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURAWImageSourceNode _processRAWProperties:](self, "_processRAWProperties:", v5);
  return v5;
}

- (id)_evaluateImageGeometryWithSourceOptions:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NURAWImageSourceNode;
  -[NUCGImageSourceNode _evaluateImageGeometryWithSourceOptions:error:](&v5, sel__evaluateImageGeometryWithSourceOptions_error_, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v14;
  void *v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!a4)
  {
    NUAssertLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "subsampleFactor != NULL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v15;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v22 = (void *)MEMORY[0x1E0CB3978];
        v23 = v21;
        objc_msgSend(v22, "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v21;
        v33 = 2114;
        v34 = v25;
        _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v20;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURAWImageSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 321, CFSTR("Invalid parameter not satisfying: %s"), v26, v27, v28, v29, (uint64_t)"subsampleFactor != NULL");
  }
  v9 = v8;
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD270]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  if (v11 <= 5 && *a4 >= 2)
    *a4 = 1;
  v30.receiver = self;
  v30.super_class = (Class)NURAWImageSourceNode;
  -[NUCGImageSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:](&v30, sel__evaluateImageWithSourceOptions_subsampleFactor_error_, v9, a4, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)load:(id *)a3
{
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v10;
  void *v11;
  void *specific;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v18 = (void *)MEMORY[0x1E0CB3978];
        v19 = v17;
        objc_msgSend(v18, "callStackSymbols");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v17;
        v29 = 2114;
        v30 = v21;
        _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURAWImageSourceNode load:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 337, CFSTR("Invalid parameter not satisfying: %s"), v22, v23, v24, v25, (uint64_t)"error != nil");
  }
  v26.receiver = self;
  v26.super_class = (Class)NURAWImageSourceNode;
  v5 = -[NUCGImageSourceNode load:](&v26, sel_load_);
  -[NUCGImageSourceNode cgImageProperties](self, "cgImageProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD210]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      +[NUError unsupportedError:object:](NUError, "unsupportedError:object:", CFSTR("Unsupported RAW source"), self);
      v5 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5;
}

- (id)_rawMethodVersionForSettings:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v17;
  void *v18;
  void *specific;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    NUAssertLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v32 = (void *)MEMORY[0x1E0CB3978];
        v33 = v31;
        objc_msgSend(v32, "callStackSymbols");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v31;
        v51 = 2114;
        v52 = v35;
        _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURAWImageSourceNode _rawMethodVersionForSettings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 353, CFSTR("Invalid parameter not satisfying: %s"), v36, v37, v38, v39, (uint64_t)"error != nil");
  }
  v7 = v6;
  -[NUCGImageSourceNode cgImageProperties](self, "cgImageProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD210]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD208]);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    NUAssertLogger();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No kCISupportedDecoderVersionsKey available: %@"), self);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v25;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v41 = (void *)MEMORY[0x1E0CB3978];
        v42 = v40;
        objc_msgSend(v41, "callStackSymbols");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v40;
        v51 = 2114;
        v52 = v44;
        _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v28)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v30;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURAWImageSourceNode _rawMethodVersionForSettings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 359, CFSTR("No kCISupportedDecoderVersionsKey available: %@"), v45, v46, v47, v48, (uint64_t)self);
  }
  v11 = (void *)v10;
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1D8]);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    if ((objc_msgSend(v11, "containsObject:", v12) & 1) == 0)
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_573);
      v14 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v50 = v13;
        v51 = 2112;
        v52 = v11;
        _os_log_impl(&dword_1A6553000, v14, OS_LOG_TYPE_INFO, "Requested kCIInputDecoderVersionKey %@ is not available: %@, falling back to newest", buf, 0x16u);
      }
      objc_msgSend(v11, "lastObject");
      v15 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v15;
    }
  }
  else
  {
    objc_msgSend(v11, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)_neutralColorArrayForSettings:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  double v19;
  double v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E230]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E238]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v19 = 0.0;
    v20 = 0.0;
    objc_msgSend(v4, "doubleValue");
    v12 = v11;
    objc_msgSend(v6, "doubleValue");
    nu_tempTint_to_xy(&v20, &v19, v12, v13);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v14;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v15;
    v16 = (void *)MEMORY[0x1E0C99D20];
    v17 = v22;
LABEL_12:
    objc_msgSend(v16, "arrayWithObjects:count:", v17, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E220]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E228]);
  v8 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v8;
  if (v14)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v21[0] = v14;
    v21[1] = v8;
    v16 = (void *)MEMORY[0x1E0C99D20];
    v17 = v21;
    goto LABEL_12;
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (id)_neutralColorVectorForSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  NSObject *v15;
  void *v16;
  void *specific;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NURAWImageSourceNode _neutralColorArrayForSettings:](self, "_neutralColorArrayForSettings:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "count") != 2)
    {
      NUAssertLogger();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Incorrect count for neutral: %@, %@"), v6, v4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v16;
        _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v19)
        {
          v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v23 = (void *)MEMORY[0x1E0CB3978];
          v24 = v22;
          objc_msgSend(v23, "callStackSymbols");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v32 = v22;
          v33 = 2114;
          v34 = v26;
          _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v19)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v21;
        _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"-[NURAWImageSourceNode _neutralColorVectorForSettings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 401, CFSTR("Incorrect count for neutral: %@, %@"), v27, v28, v29, v30, (uint64_t)v6);
    }
    v7 = (void *)MEMORY[0x1E0C9DDF8];
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    objc_msgSend(v7, "vectorWithX:Y:", v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_sourceOptionsForSettings:(id)a3 rawMethodVersion:(id)a4 sushiLevel:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v22;
  void *v23;
  void *specific;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const __CFString *v54;
  uint64_t v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    NUAssertLogger();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "rawMethodVersion != nil");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v23;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v37 = (void *)MEMORY[0x1E0CB3978];
        v38 = v36;
        objc_msgSend(v37, "callStackSymbols");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = v36;
        v58 = 2114;
        v59 = v40;
        _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v28;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURAWImageSourceNode _sourceOptionsForSettings:rawMethodVersion:sushiLevel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 412, CFSTR("Invalid parameter not satisfying: %s"), v41, v42, v43, v44, (uint64_t)"rawMethodVersion != nil");
  }
  v11 = v10;
  if (!v10)
  {
    NUAssertLogger();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "sushiLevel != nil");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v30;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (v31)
    {
      if (v33)
      {
        v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v46 = (void *)MEMORY[0x1E0CB3978];
        v47 = v45;
        objc_msgSend(v46, "callStackSymbols");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = v45;
        v58 = 2114;
        v59 = v49;
        _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v33)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v35;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURAWImageSourceNode _sourceOptionsForSettings:rawMethodVersion:sushiLevel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 413, CFSTR("Invalid parameter not satisfying: %s"), v50, v51, v52, v53, (uint64_t)"sushiLevel != nil");
  }
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CBD270]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CBD258]);
  if (objc_msgSend(v9, "integerValue") <= 5)
  {
    -[NURAWImageSourceNode _neutralColorArrayForSettings:](self, "_neutralColorArrayForSettings:", v8);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (id)v13;
    if (v13)
    {
      v54 = CFSTR("kCGImageSourceNeutral");
      v55 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CBD210]);

    }
LABEL_9:

    goto LABEL_10;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("1")))
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E208]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("kCGImageSourceLuminanceNoiseReductionAmount"));

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1C8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("kCGImageSourceColorNoiseReductionAmount"));

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E250]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("kCGImageSourceNoiseReductionSharpnessAmount"));

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E240]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, CFSTR("kCGImageSourceNoiseReductionContrastAmount"));

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E248]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, CFSTR("kCGImageSourceNoiseReductionDetailAmount"));

    if (objc_msgSend(v14, "count"))
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CBD210]);
    goto LABEL_9;
  }
LABEL_10:

  return v12;
}

- (id)_cachedRawImagePropertiesForOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSCache *propertiesByOptionCache;
  void *v9;

  v6 = a3;
  -[NSCache objectForKey:](self->_propertiesByOptionCache, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[NUCGImageSourceNode _evaluateRawImagePropertiesWithSourceOptions:error:](self, "_evaluateRawImagePropertiesWithSourceOptions:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      propertiesByOptionCache = self->_propertiesByOptionCache;
      v9 = (void *)objc_msgSend(v6, "copy");
      -[NSCache setObject:forKey:](propertiesByOptionCache, "setObject:forKey:", v7, v9);

    }
  }

  return v7;
}

- (id)_appendFilter:(id)a3 filterType:(int)a4 settings:(id)a5 source:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  id v13;
  NURAWDemosaicNode *v14;
  id v15;
  uint64_t v16;
  void *v17;
  NUCropNode *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  NURawFilterNode *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  NURAWDemosaicNode *v43;
  void *v44;
  void *v45;
  void *v46;
  NURawFilterNode *p_super;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _OWORD v57[2];
  _OWORD v58[2];
  CGRect v59;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  switch((int)v8)
  {
    case 1:
      v14 = [NURAWDemosaicNode alloc];
      v15 = v10;
      v16 = 1;
      goto LABEL_22;
    case 2:
      objc_msgSend(v10, "valueForKey:", CFSTR("inputCropRect"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = [NUCropNode alloc];
      objc_msgSend(v17, "CGRectValue");
      v59.origin.x = v19;
      v59.origin.y = v20;
      v59.size.width = v21;
      v59.size.height = v22;
      NU::RectT<long>::RectT(v58, &v59, 2);
      v57[0] = v58[0];
      v57[1] = v58[1];
      v23 = -[NUCropNode initWithRect:input:](v18, "initWithRect:input:", v57, v12);
      goto LABEL_32;
    case 3:
      v14 = [NURAWGeometryResetNode alloc];
      v15 = v10;
      v16 = 3;
      goto LABEL_22;
    case 4:
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E208]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v24, CFSTR("inputLNRAmount"));
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("inputUILuminanceNoiseReductionAmount"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        -[NUCGImageSourceNode cgImageProperties](self, "cgImageProperties");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD210]);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("kCGImageSourceLuminanceNoiseReductionAmount"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "doubleValue");
        v30 = v29;

        objc_msgSend(v25, "doubleValue");
        if (v31 >= 0.0 || v30 <= 0.0)
          v32 = v30 + fmin(fmax(v31, 0.0), 1.0) * (1.0 - v30);
        else
          v32 = (fmin(fmax(v31, -0.1), 0.0) + 0.1) / 0.1 * v30 + 0.0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v32);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v49, CFSTR("inputLNRAmount"));

      }
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1C8]);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (v50)
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v50, CFSTR("inputCNRAmount"));
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("inputUIColorNoiseReductionAmount"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v17, "doubleValue");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmax(fmin((v51 + 1.0) * 0.5, 1.0), 0.0));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v52, CFSTR("inputCNRAmount"));

      }
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E250]);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v53, CFSTR("inputSharpenAmount"));

      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E240]);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v54, CFSTR("inputContrastAmount"));

      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E248]);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v55, CFSTR("inputDetailAmount"));

      +[NURenderPipelineFunction functionWithEvaluationBlock:](NURenderPipelineFunction, "functionWithEvaluationBlock:", &__block_literal_global_156);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v56, CFSTR("inputScaleFactor"));

      v23 = -[NURawFilterNode initWithRawFilter:type:settings:input:]([NURawFilterNode alloc], "initWithRawFilter:type:settings:input:", v10, 4, v13, v12);
LABEL_32:
      p_super = v23;

      goto LABEL_24;
    case 6:
      -[NURAWImageSourceNode _neutralColorArrayForSettings:](self, "_neutralColorArrayForSettings:", v11);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v33, CFSTR("inputNeutral"));

      v14 = [NURawFilterNode alloc];
      v15 = v10;
      v16 = 6;
      goto LABEL_22;
    case 7:
      -[NURAWImageSourceNode _neutralColorVectorForSettings:](self, "_neutralColorVectorForSettings:", v11);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v34, CFSTR("inputWhitePoint"));

      v14 = [NURawFilterNode alloc];
      v15 = v10;
      v16 = 7;
      goto LABEL_22;
    case 8:
      -[NURAWImageSourceNode _neutralColorVectorForSettings:](self, "_neutralColorVectorForSettings:", v11);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v35, CFSTR("inputWhitePoint"));

      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1E8]);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v36, CFSTR("inputExposure"));

      v14 = [NURawFilterNode alloc];
      v15 = v10;
      v16 = 8;
      goto LABEL_22;
    case 9:
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1E8]);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v37, CFSTR("inputExposure"));

      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E198]);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v38, CFSTR("inputBias"));

      v14 = [NURawFilterNode alloc];
      v15 = v10;
      v16 = 9;
      goto LABEL_22;
    case 10:
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("inputToneMapping"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v39, CFSTR("inputStrength"));

      v14 = [NURawFilterNode alloc];
      v15 = v10;
      v16 = 10;
      goto LABEL_22;
    case 11:
      goto LABEL_19;
    case 12:
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1A0]);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v40, CFSTR("inputBoostAmount"));

      v14 = [NURawFilterNode alloc];
      v15 = v10;
      v16 = 12;
      goto LABEL_22;
    case 13:
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("debugDisableGamutMap"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "BOOLValue");

      if ((v42 & 1) != 0)
      {
LABEL_19:
        v43 = (NURAWDemosaicNode *)v12;
      }
      else
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("inputGamutMapMax"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v46, CFSTR("inputGamutMapMax"));

        v14 = [NURawFilterNode alloc];
        v15 = v10;
        v16 = 13;
LABEL_22:
        v43 = -[NURawFilterNode initWithRawFilter:type:settings:input:](v14, "initWithRawFilter:type:settings:input:", v15, v16, v13, v12);
      }
      p_super = &v43->super;
LABEL_24:

      return p_super;
    case 14:
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1A0]);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v44, CFSTR("inputBoostAmount"));

      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1A8]);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v45, CFSTR("inputBoostShadowAmount"));

      v14 = [NURawFilterNode alloc];
      v15 = v10;
      v16 = 14;
      goto LABEL_22;
    default:
      v14 = [NURawFilterNode alloc];
      v15 = v10;
      v16 = v8;
      goto LABEL_22;
  }
}

- (id)sourceOptionsForSettings:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[NUSourceNode isValid:](self, "isValid:", a4))
  {
    -[NURAWImageSourceNode _rawMethodVersionForSettings:error:](self, "_rawMethodVersionForSettings:error:", v6, a4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
    {
      v9 = *MEMORY[0x1E0CBD258];
      v18[0] = *MEMORY[0x1E0CBD270];
      v18[1] = v9;
      v19[0] = v7;
      v19[1] = CFSTR("1");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NURAWImageSourceNode _cachedRawImagePropertiesForOptions:error:](self, "_cachedRawImagePropertiesForOptions:error:", v10, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD210]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("kCGImageSourceSupportedSushiLevels"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 && objc_msgSend(v14, "containsObject:", v12))
        {
          v15 = v12;
        }
        else
        {
          v15 = CFSTR("3");
          if ((objc_msgSend(v14, "containsObject:", CFSTR("3")) & 1) == 0)
          {
            v15 = CFSTR("2");
            if (!objc_msgSend(v14, "containsObject:", CFSTR("2")))
              v15 = CFSTR("1");
          }
        }
        -[NURAWImageSourceNode _sourceOptionsForSettings:rawMethodVersion:sushiLevel:](self, "_sourceOptionsForSettings:rawMethodVersion:sushiLevel:", v6, v8, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

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

- (BOOL)shouldGenerateMeteorGainMap
{
  BOOL v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (+[NUGlobalSettings forceMeteorGainMapGeneration](NUGlobalSettings, "forceMeteorGainMapGeneration"))
    return 1;
  if (+[NUGlobalSettings disableMeteorGainMapGeneration](NUGlobalSettings, "disableMeteorGainMapGeneration"))
  {
    return 0;
  }
  -[NUCGImageSourceNode cgImageProperties](self, "cgImageProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD210]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCGImageSourceMethodVersion"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v20 = CFSTR("inputDecoderVersion");
    v21[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    -[NURAWImageSourceNode sourceOptionsForSettings:error:](self, "sourceOptionsForSettings:error:", v8, &v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v17;
    if (v9)
    {
      v16 = 0;
      -[NURAWImageSourceNode _rawFiltersWithSourceOptions:error:](self, "_rawFiltersWithSourceOptions:error:", v9, &v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v16;

      if (v11)
      {
        v3 = -[NURAWImageSourceNode _hasLensCorrectionFilter:](self, "_hasLensCorrectionFilter:", v11);
      }
      else
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_573);
        v14 = _NULogger;
        if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v19 = v12;
          _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Failed to get RAW filters: %{public}@", buf, 0xCu);
        }
        v3 = 0;
      }

    }
    else
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_573);
      v13 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v19 = v10;
        _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Failed to get RAW source options: %{public}@", buf, 0xCu);
      }
      v3 = 0;
      v12 = v10;
    }

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)supportsPipelineState:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v10;
  void *v11;
  void *specific;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    NUAssertLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v18 = (void *)MEMORY[0x1E0CB3978];
        v19 = v17;
        objc_msgSend(v18, "callStackSymbols");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v17;
        v29 = 2114;
        v30 = v21;
        _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURAWImageSourceNode supportsPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 751, CFSTR("Invalid parameter not satisfying: %s"), v22, v23, v24, v25, (uint64_t)"error != nil");
  }
  v7 = v6;
  if (objc_msgSend(v6, "mediaComponentType") == 1)
  {
    if (objc_msgSend(v7, "auxiliaryImageType") == 7
      && -[NURAWImageSourceNode shouldGenerateMeteorGainMap](self, "shouldGenerateMeteorGainMap")
      || objc_msgSend(v7, "auxiliaryImageType") == 10
      || objc_msgSend(v7, "auxiliaryImageType") == 11)
    {
      v8 = 1;
    }
    else
    {
      v26.receiver = self;
      v26.super_class = (Class)NURAWImageSourceNode;
      v8 = -[NUCGImageSourceNode supportsPipelineState:error:](&v26, sel_supportsPipelineState_error_, v7, a4);
    }
  }
  else
  {
    +[NUError mismatchError:object:](NUError, "mismatchError:object:", CFSTR("expected image media type"), v7);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NURAWImageSourceNode *v13;
  NURAWImageSourceNode *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v12, "auxiliaryImageType") == 7
    && -[NURAWImageSourceNode shouldGenerateMeteorGainMap](self, "shouldGenerateMeteorGainMap")
    || objc_msgSend(v12, "auxiliaryImageType") == 10
    || objc_msgSend(v12, "auxiliaryImageType") == 11)
  {
    v13 = self;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)NURAWImageSourceNode;
    -[NUCGImageSourceNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v16, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, v10, v11, v12, a6);
    v13 = (NURAWImageSourceNode *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  return v14;
}

- (id)_rawFiltersWithSourceOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;

  -[NURAWImageSourceNode _cachedRawImagePropertiesForOptions:error:](self, "_cachedRawImagePropertiesForOptions:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD068]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("filters"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "indexOfObjectPassingTest:", &__block_literal_global_195);
    v9 = objc_msgSend(v7, "indexOfObjectPassingTest:", &__block_literal_global_196);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL && v9 != 0x7FFFFFFFFFFFFFFFLL && v8 > v9)
    {
      v12 = v9;
      objc_msgSend(v7, "objectAtIndex:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v7, "mutableCopy");
      objc_msgSend(v14, "removeObjectAtIndex:", v8);
      objc_msgSend(v14, "insertObject:atIndex:", v13, v12);
      v15 = objc_msgSend(v14, "copy");

      v7 = (void *)v15;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)preparedNodeWithSourceContainer:(id)a3 pipelineState:(id)a4 pipelineSettings:(id)a5 sourceSettings:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NURAWImageSourceNode *v22;
  NUSubsampleNode *v23;
  NUSubsampleNode *v24;
  NUSubsampleNode *v25;
  uint64_t v26;
  NUSubsampleNode *v27;
  uint64_t v28;
  objc_class *v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v33;
  char v34;
  BOOL v35;
  NUSubsampleNode *v36;
  NUSubsampleNode *v37;
  char v38;
  NUSubsampleNode *v39;
  void *v40;
  void *v41;
  NUSubsampleNode *v42;
  uint64_t v43;
  BOOL v44;
  const __CFString *v45;
  BOOL v46;
  _BOOL4 v47;
  BOOL v48;
  _BOOL4 v49;
  BOOL v50;
  uint64_t v51;
  NUSubsampleNode *v52;
  BOOL v53;
  void *v54;
  void *v55;
  NURAWGainMapNode *v56;
  void *v57;
  int v58;
  int v59;
  int v60;
  NUFilterNode *v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  NUFilterNode *v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  NUFilterNode *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  id v75;
  NURawFilterNode *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  int v81;
  uint64_t v82;
  void *v83;
  void *v84;
  id v85;
  NURawFilterNode *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  NSObject *v91;
  void *v92;
  void *specific;
  NSObject *v94;
  _BOOL4 v95;
  void *v96;
  void *v97;
  NSObject *v98;
  void *v99;
  void *v100;
  NSObject *v101;
  _BOOL4 v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  NUFilterNode *v132;
  uint64_t v133;
  id *v134;
  NUSubsampleNode *v135;
  void *v136;
  id obj;
  id v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  uint64_t v142;
  NUSubsampleNode *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  NURAWImageSourceNode *v147;
  NUSubsampleNode *v148;
  unsigned __int8 v149;
  void *v150;
  NUSubsampleNode *v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  objc_super v156;
  _QWORD v157[3];
  _QWORD v158[3];
  const __CFString *v159;
  id v160;
  _QWORD v161[3];
  _QWORD v162[3];
  const __CFString *v163;
  id v164;
  uint64_t v165;
  NUSubsampleNode *v166;
  uint64_t v167;
  void *v168;
  uint64_t v169;
  NUSubsampleNode *v170;
  uint64_t v171;
  void *v172;
  uint8_t v173[128];
  uint8_t buf[4];
  void *v175;
  __int16 v176;
  void *v177;
  uint64_t v178;

  v178 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v138 = a5;
  v14 = a6;
  -[NURAWImageSourceNode sourceOptionsForSettings:error:](self, "sourceOptionsForSettings:error:", v14, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && -[NURAWImageSourceNode supportsPipelineState:error:](self, "supportsPipelineState:error:", v13, a7))
  {
    v147 = self;
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD270]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD258]);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      NUAssertLogger();
      v91 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing kCIInputDecoderVersionKey"));
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v175 = v92;
        _os_log_error_impl(&dword_1A6553000, v91, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger();
      v94 = objc_claimAutoreleasedReturnValue();
      v95 = os_log_type_enabled(v94, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v95)
        {
          v105 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v106 = (void *)MEMORY[0x1E0CB3978];
          v107 = v105;
          objc_msgSend(v106, "callStackSymbols");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "componentsJoinedByString:", CFSTR("\n"));
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v175 = v105;
          v176 = 2114;
          v177 = v109;
          _os_log_error_impl(&dword_1A6553000, v94, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v95)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "componentsJoinedByString:", CFSTR("\n"));
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v175 = v97;
        _os_log_error_impl(&dword_1A6553000, v94, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"-[NURAWImageSourceNode preparedNodeWithSourceContainer:pipelineState:pipelineSettings:sourceSettings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 838, CFSTR("Missing kCIInputDecoderVersionKey"), v110, v111, v112, v113, v123);
    }
    v18 = (void *)v17;
    if (!v17)
    {
      NUAssertLogger();
      v98 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing sushi level"));
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v175 = v99;
        _os_log_error_impl(&dword_1A6553000, v98, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v100 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger();
      v101 = objc_claimAutoreleasedReturnValue();
      v102 = os_log_type_enabled(v101, OS_LOG_TYPE_ERROR);
      if (v100)
      {
        if (v102)
        {
          v114 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v115 = (void *)MEMORY[0x1E0CB3978];
          v116 = v114;
          objc_msgSend(v115, "callStackSymbols");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "componentsJoinedByString:", CFSTR("\n"));
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v175 = v114;
          v176 = 2114;
          v177 = v118;
          _os_log_error_impl(&dword_1A6553000, v101, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v102)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "componentsJoinedByString:", CFSTR("\n"));
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v175 = v104;
        _os_log_error_impl(&dword_1A6553000, v101, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"-[NURAWImageSourceNode preparedNodeWithSourceContainer:pipelineState:pipelineSettings:sourceSettings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 839, CFSTR("Missing sushi level"), v119, v120, v121, v122, v123);
    }
    if (objc_msgSend(v13, "auxiliaryImageType") == 1)
    {
      v19 = 1;
    }
    else
    {
      if (objc_msgSend(v13, "auxiliaryImageType") != 7
        || !-[NURAWImageSourceNode shouldGenerateMeteorGainMap](v147, "shouldGenerateMeteorGainMap"))
      {
        if (objc_msgSend(v13, "auxiliaryImageType") != 10 && objc_msgSend(v13, "auxiliaryImageType") != 11)
        {
          v156.receiver = v147;
          v156.super_class = (Class)NURAWImageSourceNode;
          -[NUCGImageSourceNode preparedNodeWithSourceContainer:pipelineState:pipelineSettings:sourceSettings:error:](&v156, sel_preparedNodeWithSourceContainer_pipelineState_pipelineSettings_sourceSettings_error_, v12, v13, v138, v14, a7);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_92:

          goto LABEL_93;
        }
        v142 = objc_msgSend(v13, "auxiliaryImageType");
        goto LABEL_15;
      }
      v19 = 7;
    }
    v142 = v19;
LABEL_15:
    -[NURAWImageSourceNode _rawFiltersWithSourceOptions:error:](v147, "_rawFiltersWithSourceOptions:error:", v15, a7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      v20 = 0;
LABEL_91:

      goto LABEL_92;
    }
    -[NURAWImageSourceNode _RAWToneCurveProperties:](v147, "_RAWToneCurveProperties:", v21);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    if (v142 == 1)
    {
      objc_msgSend(v13, "beginGroupWithName:error:", CFSTR("RAW"), a7);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v141)
      {
        v20 = 0;
LABEL_90:

        goto LABEL_91;
      }
    }
    else
    {
      v141 = 0;
    }
    v134 = a7;
    v124 = v18;
    v125 = v16;
    v136 = v13;
    v22 = v147;
    v126 = v15;
    v127 = v12;
    v23 = -[NUSubsampleNode initWithPreparedSource:container:pipelineSettings:sourceOptions:]([NUSubsampleNode alloc], "initWithPreparedSource:container:pipelineSettings:sourceOptions:", v147, v12, v138, v15);
    v152 = 0u;
    v153 = 0u;
    v154 = 0u;
    v155 = 0u;
    v128 = v21;
    obj = v21;
    v140 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v152, v173, 16);
    v135 = v23;
    if (!v140)
    {
      v24 = 0;
      v143 = 0;
      v151 = 0;
      v25 = v23;
LABEL_83:
      v148 = v24;
      v42 = v23;

      v13 = v136;
      if (v141 && !objc_msgSend(v136, "endGroupWithName:error:", CFSTR("RAW"), v134))
      {
        v20 = 0;
      }
      else
      {
        v25 = v25;
        v20 = v25;
      }
      v12 = v127;
LABEL_89:
      v16 = v125;
      v15 = v126;
      v18 = v124;

      v21 = v128;
      goto LABEL_90;
    }
    v143 = 0;
    v144 = 0;
    v149 = 0;
    v24 = 0;
    v151 = 0;
    v139 = *(_QWORD *)v153;
    v130 = *MEMORY[0x1E0C9E1E8];
    v133 = *MEMORY[0x1E0C9E1F8];
    v129 = *MEMORY[0x1E0C9E1A0];
    v25 = v23;
    v150 = v14;
LABEL_23:
    v26 = 0;
    while (1)
    {
      v27 = v24;
      if (*(_QWORD *)v153 != v139)
        objc_enumerationMutation(obj);
      v145 = v26;
      v28 = *(_QWORD *)(*((_QWORD *)&v152 + 1) + 8 * v26);
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend((id)objc_opt_class(), "_filterTypeForClassName:", v146);
      v31 = v30;
      v33 = v30 > 8 && v142 == 7;
      v34 = v30 > 0xA || v33;
      v35 = v30 < 4;
      v36 = v25;

      v37 = v23;
      v38 = v35 | BYTE4(v144);
      v25 = v36;
      v151 = v37;
      v39 = v37;
      if ((v38 & 1) == 0)
      {
        -[NUSourceNode _addResampleNode:subsampleNode:](v22, "_addResampleNode:subsampleNode:", v36, v135);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        -[NUSourceNode _addScaleNode:pipelineState:pipelineSettings:sourceSettings:](v22, "_addScaleNode:pipelineState:pipelineSettings:sourceSettings:", v40, v136, v138, v150);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = v41;
        BYTE4(v144) = 1;
        v39 = v25;
      }
      v148 = v36;
      if (v144 & 1 | ((v34 & 1) == 0))
      {
        v42 = v39;
      }
      else
      {
        -[NUSourceNode _addOrientationNode:sourceSettings:error:](v22, "_addOrientationNode:sourceSettings:error:", v25, v150, v134);
        v43 = objc_claimAutoreleasedReturnValue();

        -[NUSourceNode _addOrientationNode:sourceSettings:error:](v22, "_addOrientationNode:sourceSettings:error:", v39, v150, v134);
        v42 = (NUSubsampleNode *)objc_claimAutoreleasedReturnValue();

        if (!v43)
        {

          v25 = 0;
          v20 = 0;
          v12 = v127;
          v13 = v136;
          v14 = v150;
          goto LABEL_89;
        }
        LOBYTE(v144) = 1;
        v25 = (NUSubsampleNode *)v43;
      }
      v14 = v150;
      if (!v143)
      {
        if ((v31 & 0xFFFFFFFE) == 0xA)
          v143 = v25;
        else
          v143 = 0;
      }
      v44 = (_DWORD)v31 != 11 || v141 == 0;
      v45 = CFSTR("Linear");
      if (v44 && ((_DWORD)v31 == 6 ? (v46 = v141 == 0) : (v46 = 1), v45 = CFSTR("SushiLevel1"), v46))
      {
        v47 = v31 == 10;
        v48 = v142 == 11 && (_DWORD)v31 == 10;
        v49 = v31 == 14;
        v50 = (v142 & 0xFFFFFFFFFFFFFFFELL) == 0xA && (_DWORD)v31 == 14;
        if (v48 || v50)
        {
          v23 = v42;
          goto LABEL_77;
        }
      }
      else
      {
        objc_msgSend(v141, "addTag:forNode:", v45, v25);
        v51 = objc_claimAutoreleasedReturnValue();

        v49 = 0;
        v47 = 0;
        v25 = (NUSubsampleNode *)v51;
      }
      v52 = v25;
      -[NURAWImageSourceNode _appendFilter:filterType:settings:source:](v147, "_appendFilter:filterType:settings:source:", v28, v31, v150, v25);
      v25 = (NUSubsampleNode *)objc_claimAutoreleasedReturnValue();

      -[NURAWImageSourceNode _appendFilter:filterType:settings:source:](v147, "_appendFilter:filterType:settings:source:", v28, v31, 0, v42);
      v23 = (NUSubsampleNode *)objc_claimAutoreleasedReturnValue();

      v53 = (_DWORD)v31 == 5;
      if ((((_DWORD)v31 == 9) & v149) == 1)
      {
        objc_msgSend(v150, "objectForKeyedSubscript:", CFSTR("gainMapVersion"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v150, "objectForKeyedSubscript:", CFSTR("gainMapParameters"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = -[NURAWGainMapNode initWithInput:gainMapVersion:gainMapParameters:]([NURAWGainMapNode alloc], "initWithInput:gainMapVersion:gainMapParameters:", v25, v54, v55);

        v25 = (NUSubsampleNode *)v56;
      }
      if (v47)
      {
        objc_msgSend(v150, "objectForKeyedSubscript:", CFSTR("debugTransferTone"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v57, "BOOLValue");

        if (v58)
        {
          objc_msgSend(v131, "baselineExposure");
          v60 = v59;
          v61 = [NUFilterNode alloc];
          v171 = v130;
          LODWORD(v62) = v60;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v172 = v63;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v172, &v171, 1);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v169 = v133;
          v170 = v151;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v170, &v169, 1);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v132 = -[NUFilterNode initWithFilterName:settings:inputs:](v61, "initWithFilterName:settings:inputs:", CFSTR("CIExposureAdjust"), v64, v65);

          v66 = [NUFilterNode alloc];
          v167 = v130;
          LODWORD(v67) = v60;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v168 = v68;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v168, &v167, 1);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v165 = v133;
          v166 = v148;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v166, &v165, 1);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = -[NUFilterNode initWithFilterName:settings:inputs:](v66, "initWithFilterName:settings:inputs:", CFSTR("CIExposureAdjust"), v69, v70);

          objc_msgSend(v150, "objectForKeyedSubscript:", CFSTR("inputToneMapping"));
          v72 = objc_claimAutoreleasedReturnValue();
          v73 = (void *)v72;
          v74 = &unk_1E50A3728;
          if (v72)
            v74 = (void *)v72;
          v75 = v74;

          v76 = [NURawFilterNode alloc];
          v163 = CFSTR("inputStrength");
          v164 = v75;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v164, &v163, 1);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v161[0] = v133;
          v162[0] = v71;
          v162[1] = v132;
          v161[1] = CFSTR("inputSourceImage");
          v161[2] = CFSTR("inputTargetImage");
          v162[2] = v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v162, v161, 3);
          v78 = (void *)objc_claimAutoreleasedReturnValue();

          v79 = -[NURawFilterNode initWithRawFilterName:type:settings:inputs:](v76, "initWithRawFilterName:type:settings:inputs:", CFSTR("NUToneTransferFilter"), v31, v77, v78);
          v14 = v150;

          v53 = (_DWORD)v31 == 5;
          v25 = (NUSubsampleNode *)v79;
        }
      }
      v149 |= v53;
      if (v49)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("debugTransferTone"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = objc_msgSend(v80, "BOOLValue");

        if (v81)
        {
          objc_msgSend(v14, "objectForKeyedSubscript:", v129);
          v82 = objc_claimAutoreleasedReturnValue();
          v83 = (void *)v82;
          v84 = &unk_1E50A3728;
          if (v82)
            v84 = (void *)v82;
          v85 = v84;

          v86 = [NURawFilterNode alloc];
          v159 = CFSTR("inputStrength");
          v160 = v85;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v160, &v159, 1);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v157[0] = v133;
          v157[1] = CFSTR("inputSourceImage");
          v24 = v148;
          v158[0] = v148;
          v158[1] = v151;
          v157[2] = CFSTR("inputTargetImage");
          v158[2] = v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v158, v157, 3);
          v88 = (void *)objc_claimAutoreleasedReturnValue();

          v89 = -[NURawFilterNode initWithRawFilterName:type:settings:inputs:](v86, "initWithRawFilterName:type:settings:inputs:", CFSTR("NUToneTransferFilter"), v31, v87, v88);
          v14 = v150;

          v25 = (NUSubsampleNode *)v89;
          v22 = v147;
          goto LABEL_78;
        }
      }
LABEL_77:
      v22 = v147;
      v24 = v148;
LABEL_78:

      v26 = v145 + 1;
      if (v140 == v145 + 1)
      {
        v140 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v152, v173, 16);
        if (v140)
          goto LABEL_23;
        goto LABEL_83;
      }
    }
  }
  v20 = 0;
LABEL_93:

  return v20;
}

- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertiesByOptionCache, 0);
}

uint64_t __59__NURAWImageSourceNode__rawFiltersWithSourceOptions_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("RAWLinearSpacePlaceholder"));

  return v3;
}

uint64_t __59__NURAWImageSourceNode__rawFiltersWithSourceOptions_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("RAWProfileGainTableMap"));

  return v3;
}

uint64_t __65__NURAWImageSourceNode__appendFilter_filterType_settings_source___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = objc_msgSend(a2, "scale");
  return objc_msgSend(v2, "numberWithDouble:", NUScaleToDouble(v3, v4));
}

+ (id)_firstFilterOfType:(int)a3 inArray:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "attributes", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CIAttributeFilterName"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(a1, "_filterTypeForClassName:", v13) == a3)
        {
          v14 = v11;

          goto LABEL_11;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

+ (int)_filterTypeForClassName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;

  v3 = a3;
  if (_filterTypeForClassName__onceToken != -1)
    dispatch_once(&_filterTypeForClassName__onceToken, &__block_literal_global);
  objc_msgSend((id)_filterTypeForClassName__typeMapping, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "unsignedIntegerValue");
  else
    v6 = 0;

  return v6;
}

void __48__NURAWImageSourceNode__filterTypeForClassName___block_invoke()
{
  void *v0;

  v0 = (void *)_filterTypeForClassName__typeMapping;
  _filterTypeForClassName__typeMapping = (uint64_t)&unk_1E50A34D0;

}

@end
