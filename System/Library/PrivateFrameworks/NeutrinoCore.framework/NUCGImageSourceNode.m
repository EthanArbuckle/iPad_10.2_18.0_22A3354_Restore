@implementation NUCGImageSourceNode

- (void)_init
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *queue;
  NSObject *v5;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v3 = (OS_dispatch_queue *)dispatch_queue_create("NUCGImageSourceNode", v5);
  queue = self->_queue;
  self->_queue = v3;

}

- (NUCGImageSourceNode)initWithImageSource:(CGImageSource *)a3 identifier:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  NUCGImageSourceNode *v9;
  objc_super v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = CFSTR("identifier");
  v13[0] = a4;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)NUCGImageSourceNode;
  v9 = -[NUSourceNode initWithSettings:](&v11, sel_initWithSettings_, v8);

  -[NUCGImageSourceNode _init](v9, "_init");
  v9->_cgImageSource = (CGImageSource *)CFRetain(a3);
  return v9;
}

- (NUCGImageSourceNode)initWithURL:(id)a3 UTI:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NUCGImageSourceNode *v13;
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
  const __CFString *v47;
  id v48;
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
    NUAssertLogger_2145();
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
    NUAssertLogger_2145();
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
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode initWithURL:UTI:identifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 91, CFSTR("Invalid parameter not satisfying: %s"), v34, v35, v36, v37, (uint64_t)"URL != nil");
  }
  v11 = v10;
  if (!v10)
  {
    NUAssertLogger_2145();
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
    NUAssertLogger_2145();
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
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode initWithURL:UTI:identifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 92, CFSTR("Invalid parameter not satisfying: %s"), v43, v44, v45, v46, (uint64_t)"identifier != nil");
  }
  v47 = CFSTR("identifier");
  v48 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NUCGImageSourceNode initWithURL:UTI:settings:](self, "initWithURL:UTI:settings:", v8, v9, v12);

  return v13;
}

- (NUCGImageSourceNode)initWithURL:(id)a3 UTI:(id)a4 identifier:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NUCGImageSourceNode *v19;
  NSObject *v21;
  void *v22;
  void *specific;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[2];
  _QWORD v54[2];
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    NUAssertLogger_2145();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "URL != nil");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v56 = v22;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2145();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E0CB3978];
        v37 = v35;
        objc_msgSend(v36, "callStackSymbols");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v56 = v35;
        v57 = 2114;
        v58 = v39;
        _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v56 = v27;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode initWithURL:UTI:identifier:options:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 98, CFSTR("Invalid parameter not satisfying: %s"), v40, v41, v42, v43, (uint64_t)"URL != nil");
  }
  if (!v12)
  {
    NUAssertLogger_2145();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "identifier != nil");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v56 = v29;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2145();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v45 = (void *)MEMORY[0x1E0CB3978];
        v46 = v44;
        objc_msgSend(v45, "callStackSymbols");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v56 = v44;
        v57 = 2114;
        v58 = v48;
        _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v32)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v56 = v34;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode initWithURL:UTI:identifier:options:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 99, CFSTR("Invalid parameter not satisfying: %s"), v49, v50, v51, v52, (uint64_t)"identifier != nil");
  }
  v14 = v13;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("useEmbeddedPreview"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  v53[1] = CFSTR("useEmbeddedPreview");
  v54[0] = v12;
  v53[0] = CFSTR("identifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[NUCGImageSourceNode initWithURL:UTI:settings:](self, "initWithURL:UTI:settings:", v10, v11, v18);

  return v19;
}

- (BOOL)useEmbeddedPreview
{
  void *v2;
  void *v3;
  char v4;

  -[NURenderNode settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("useEmbeddedPreview"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (NUCGImageSourceNode)initWithURL:(id)a3 UTI:(id)a4 settings:(id)a5
{
  NSURL *v8;
  NSString *v9;
  id v10;
  void *v11;
  void *v12;
  NUCGImageSourceNode *v13;
  NSURL *URL;
  NSURL *v15;
  NSString *UTI;
  objc_super v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = (NSURL *)a3;
  v9 = (NSString *)a4;
  v10 = a5;
  if (objc_msgSend(v10, "count"))
  {
    v11 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("url"));
    v12 = (void *)objc_msgSend(v11, "copy");

  }
  else
  {
    v19 = CFSTR("url");
    v20[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18.receiver = self;
  v18.super_class = (Class)NUCGImageSourceNode;
  v13 = -[NUSourceNode initWithSettings:](&v18, sel_initWithSettings_, v12);
  -[NUCGImageSourceNode _init](v13, "_init");
  URL = v13->_URL;
  v13->_URL = v8;
  v15 = v8;

  UTI = v13->_UTI;
  v13->_UTI = v9;

  return v13;
}

- (NUCGImageSourceNode)initWithSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *specific;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  objc_class *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_2167);
  v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = v5;
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v11;
    _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_2167);
      goto LABEL_8;
    }
    if (v12 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_2167);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v14 = (void *)MEMORY[0x1E0CB3978];
    v15 = v13;
    objc_msgSend(v14, "callStackSymbols");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v17;
    _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v18 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v20 = (void *)MEMORY[0x1E0CB3978];
  v21 = specific;
  v15 = v18;
  objc_msgSend(v20, "callStackSymbols");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v31 = specific;
  v32 = 2114;
  v33 = v23;
  _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v24 = (objc_class *)objc_opt_class();
  NSStringFromClass(v24);
  v25 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode initWithSettings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 132, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v26, v27, v28, v29, v25);
}

- (void)dealloc
{
  CGImageSource *cgImageSource;
  CMPhotoDecompressionSession *decompressionSession;
  CMPhotoDecompressionContainer *decompressionContainer;
  objc_super v6;

  cgImageSource = self->_cgImageSource;
  if (cgImageSource)
    CFRelease(cgImageSource);
  decompressionSession = self->_decompressionSession;
  if (decompressionSession)
    CFRelease(decompressionSession);
  decompressionContainer = self->_decompressionContainer;
  if (decompressionContainer)
    CFRelease(decompressionContainer);
  v6.receiver = self;
  v6.super_class = (Class)NUCGImageSourceNode;
  -[NUCGImageSourceNode dealloc](&v6, sel_dealloc);
}

- (int64_t)sourceOrientation
{
  NSObject *v4;
  void *v5;
  void *specific;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!-[NUCGImageSourceNode loaded](self, "loaded"))
  {
    NUAssertLogger_2145();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ not loaded"), self);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v5;
      _os_log_error_impl(&dword_1A6553000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2145();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v12 = (void *)MEMORY[0x1E0CB3978];
        v13 = v11;
        objc_msgSend(v12, "callStackSymbols");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v11;
        v22 = 2114;
        v23 = v15;
        _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v10;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode sourceOrientation]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 152, CFSTR("%@ not loaded"), v16, v17, v18, v19, (uint64_t)self);
  }
  return self->_orientation;
}

- (int64_t)normalizeSubsampleFactor:(int64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  int64_t v8;
  int v10;
  int64_t v11;
  NSObject *v12;
  void *v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!-[NUCGImageSourceNode loaded](self, "loaded"))
  {
    NUAssertLogger_2145();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ not loaded"), self);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2145();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E0CB3978];
        v21 = v19;
        objc_msgSend(v20, "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v19;
        v30 = 2114;
        v31 = v23;
        _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode normalizeSubsampleFactor:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 158, CFSTR("%@ not loaded"), v24, v25, v26, v27, (uint64_t)self);
  }
  CGImageSourceGetType(self->_cgImageSource);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC530]))
  {
    v7 = a3 < 8;
    v8 = 8;
    goto LABEL_11;
  }
  if (objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC698]))
  {
    v7 = a3 < 64;
    v8 = 64;
    goto LABEL_11;
  }
  if (objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC580]))
  {
    v7 = a3 < 128;
    v8 = 128;
LABEL_11:
    if (!v7)
      a3 = v8;
    goto LABEL_13;
  }
  if ((objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC5B8]) & 1) != 0)
  {
    a3 = 1;
  }
  else
  {
    v10 = objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC600]);
    v11 = 128;
    if (a3 < 128)
      v11 = a3;
    if (v10)
      a3 = v11;
    else
      a3 = 1;
  }
LABEL_13:

  return a3;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "evaluationMode");
  return (v3 < 4) & (0xBu >> (v3 & 0xF));
}

- (BOOL)supportsPipelineState:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  unint64_t v11;
  __CFString *v12;
  __CFString *v13;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *specific;
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
  uint64_t v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    NUAssertLogger_2145();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v23;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2145();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v30 = (void *)MEMORY[0x1E0CB3978];
        v31 = v29;
        objc_msgSend(v30, "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v29;
        v50 = 2114;
        v51 = v33;
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
      v49 = v28;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode supportsPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 226, CFSTR("Invalid parameter not satisfying: %s"), v34, v35, v36, v37, (uint64_t)"error != nil");
  }
  v7 = v6;
  if (objc_msgSend(v6, "mediaComponentType") != 1)
  {
    +[NUError mismatchError:object:](NUError, "mismatchError:object:", CFSTR("expected an image mediaComponentType"), v7);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v8 = objc_msgSend(v7, "auxiliaryImageType");
  if ((unint64_t)(v8 - 2) >= 0xB)
  {
    if (!v8 && objc_msgSend(v7, "evaluationMode") == 1)
    {
      NUAssertLogger_2145();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("expected a valid auxiliaryImageType during render"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v16;
        _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_2145();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
      if (v17)
      {
        if (v19)
        {
          v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v39 = (void *)MEMORY[0x1E0CB3978];
          v40 = v38;
          objc_msgSend(v39, "callStackSymbols");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v49 = v38;
          v50 = 2114;
          v51 = v42;
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
        v49 = v21;
        _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode supportsPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 239, CFSTR("expected a valid auxiliaryImageType during render"), v43, v44, v45, v46, v47);
    }
    goto LABEL_5;
  }
  -[NUCGImageSourceNode auxiliaryImagePropertiesForAuxImageType:](self, "auxiliaryImagePropertiesForAuxImageType:", objc_msgSend(v7, "auxiliaryImageType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
LABEL_5:
    v10 = 1;
    goto LABEL_11;
  }
  v11 = objc_msgSend(v7, "auxiliaryImageType");
  if (v11 > 0xC)
    v12 = CFSTR("Invalid");
  else
    v12 = off_1E5060F88[v11];
  v13 = v12;
  +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("auxiliary image data not found"), v13);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  v10 = 0;
LABEL_11:

  return v10;
}

- (id)auxiliaryImagePropertiesForAuxImageType:(int64_t)a3
{
  void *v4;
  void *v5;
  const __CFString **v6;
  id v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;

  switch(a3)
  {
    case 2:
      -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = (const __CFString **)MEMORY[0x1E0CBC708];
      goto LABEL_20;
    case 3:
      -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = (const __CFString **)MEMORY[0x1E0CBC720];
      goto LABEL_20;
    case 4:
      -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = (const __CFString **)MEMORY[0x1E0CBC738];
      goto LABEL_20;
    case 5:
      -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = (const __CFString **)MEMORY[0x1E0CBC730];
      goto LABEL_20;
    case 6:
      -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = (const __CFString **)MEMORY[0x1E0CBC748];
      goto LABEL_20;
    case 7:
      -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (const __CFString *)*MEMORY[0x1E0CBC718];
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC718]);
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        v12 = +[NUGlobalSettings enableFlexRange](NUGlobalSettings, "enableFlexRange");

        if (v12)
        {
          -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v4;
          v13 = v9;
          goto LABEL_21;
        }
      }
      else
      {

      }
      -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = (const __CFString **)MEMORY[0x1E0CBC710];
LABEL_20:
      v13 = *v6;
LABEL_21:
      objc_msgSend(v4, "objectForKeyedSubscript:", v13);
      v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

      return v7;
    case 8:
      -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = (const __CFString **)MEMORY[0x1E0CBC728];
      goto LABEL_20;
    case 9:
      -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = (const __CFString **)MEMORY[0x1E0CBC740];
      goto LABEL_20;
    case 10:
      -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v13 = CFSTR("urn:com:apple:photo:2023:aux:originalthumbnail");
      goto LABEL_21;
    case 11:
      -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tag:apple.com,2023:photo:aux:linearthumbnail"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        goto LABEL_17;
      -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("urn:com:apple:photo:2023:aux:linearthumbnail");
      goto LABEL_25;
    case 12:
      -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tag:apple.com,2023:photo:aux:deltamap"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
LABEL_17:
        v7 = v14;
      }
      else
      {
        -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = CFSTR("tag:apple.com,2023:photo:aux:styledeltamap");
LABEL_25:
        objc_msgSend(v15, "objectForKeyedSubscript:", v17);
        v7 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_22;
    default:
      v7 = 0;
      return v7;
  }
}

- (id)resolvedAuxiliaryImageNodeForPipelineState:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  NUCGImageSourceNode *v10;
  void *v11;
  NUCGImageDepthSourceNode *v12;
  NUCGImageSourceNode *v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  NSObject *v18;
  void *v19;
  void *specific;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    NUAssertLogger_2145();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v19;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2145();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v26 = (void *)MEMORY[0x1E0CB3978];
        v27 = v25;
        objc_msgSend(v26, "callStackSymbols");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v25;
        v36 = 2114;
        v37 = v29;
        _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v24;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode resolvedAuxiliaryImageNodeForPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 316, CFSTR("Invalid parameter not satisfying: %s"), v30, v31, v32, v33, (uint64_t)"error != nil");
  }
  v7 = v6;
  v8 = objc_msgSend(v6, "auxiliaryImageType");
  if (v8)
  {
    v9 = v8;
    if (v8 == 1)
    {
      v10 = self;
    }
    else
    {
      -[NUCGImageSourceNode auxiliaryImagePropertiesForAuxImageType:](self, "auxiliaryImagePropertiesForAuxImageType:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        if (v9 == 2)
        {
          v12 = [NUCGImageDepthSourceNode alloc];
          v13 = self;
          v14 = 2;
        }
        else
        {
          v12 = [NUCGAuxiliaryImageSourceNode alloc];
          v13 = self;
          v14 = v9;
        }
        v10 = -[NUCGImageDepthSourceNode initWithSourceNode:auxiliaryImageType:auxiliaryImageProperties:](v12, "initWithSourceNode:auxiliaryImageType:auxiliaryImageProperties:", v13, v14, v11);
      }
      else
      {
        if (v9 > 0xC)
          v15 = CFSTR("Invalid");
        else
          v15 = off_1E5060F88[v9];
        v16 = v15;
        +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("source does not have properties for given auxiliaryImageType:"), v16);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        v10 = 0;
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_evaluateAuxiliaryImageForType:(int64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;

  -[NUCGImageSourceNode auxiliaryImagePropertiesForAuxImageType:](self, "auxiliaryImagePropertiesForAuxImageType:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "auxiliaryImage:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((unint64_t)a3 > 0xC)
      v9 = CFSTR("Invalid");
    else
      v9 = off_1E5060F88[a3];
    v10 = v9;
    +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("source does not have properties for given auxiliary image type:"), v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v8 = 0;
  }

  return v8;
}

- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3
{
  void *v3;
  BOOL v4;

  -[NUCGImageSourceNode auxiliaryImagePropertiesForAuxImageType:](self, "auxiliaryImagePropertiesForAuxImageType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)preparedNodeWithSourceContainer:(id)a3 pipelineState:(id)a4 pipelineSettings:(id)a5 sourceSettings:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v21;
  void *v22;
  void *specific;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  objc_super v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!a7)
  {
    NUAssertLogger_2145();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v22;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2145();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v29 = (void *)MEMORY[0x1E0CB3978];
        v30 = v28;
        objc_msgSend(v29, "callStackSymbols");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v28;
        v40 = 2114;
        v41 = v32;
        _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v27;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode preparedNodeWithSourceContainer:pipelineState:pipelineSettings:sourceSettings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 363, CFSTR("Invalid parameter not satisfying: %s"), v33, v34, v35, v36, (uint64_t)"error != nil");
  }
  v16 = v15;
  if (-[NUCGImageSourceNode load:](self, "load:", a7)
    && -[NUCGImageSourceNode supportsPipelineState:error:](self, "supportsPipelineState:error:", v13, a7))
  {
    if (objc_msgSend(v13, "auxiliaryImageType") == 1 || !objc_msgSend(v13, "auxiliaryImageType"))
    {
      v37.receiver = self;
      v37.super_class = (Class)NUCGImageSourceNode;
      -[NUSourceNode preparedNodeWithSourceContainer:pipelineState:pipelineSettings:sourceSettings:error:](&v37, sel_preparedNodeWithSourceContainer_pipelineState_pipelineSettings_sourceSettings_error_, v12, v13, v14, v16, a7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[NUCGImageSourceNode resolvedAuxiliaryImageNodeForPipelineState:error:](self, "resolvedAuxiliaryImageNodeForPipelineState:error:", v13, a7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "preparedNodeWithSourceContainer:pipelineState:pipelineSettings:sourceSettings:error:", v12, v13, v14, v16, a7);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = 0;
      }

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v16;
  void *v17;
  void *specific;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!a6)
  {
    NUAssertLogger_2145();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v17;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2145();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v24 = (void *)MEMORY[0x1E0CB3978];
        v25 = v23;
        objc_msgSend(v24, "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v23;
        v34 = 2114;
        v35 = v27;
        _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v22;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode resolvedNodeWithCachedInputs:settings:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 392, CFSTR("Invalid parameter not satisfying: %s"), v28, v29, v30, v31, (uint64_t)"error != nil");
  }
  v13 = v12;
  if (-[NUCGImageSourceNode load:](self, "load:", a6)
    && -[NUCGImageSourceNode supportsPipelineState:error:](self, "supportsPipelineState:error:", v13, a6))
  {
    -[NUCGImageSourceNode resolvedAuxiliaryImageNodeForPipelineState:error:](self, "resolvedAuxiliaryImageNodeForPipelineState:error:", v13, a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)_setGeometryFromProperties:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v17;
  NUCGImageSourceNode *v18;
  void *specific;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  NUCGImageSourceNode *v23;
  void *v24;
  void *v25;
  NUCGImageSourceNode *v26;
  void *v27;
  NUCGImageSourceNode *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[4];
  NUCGImageSourceNode *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    NUAssertLogger_2145();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v18 = (NUCGImageSourceNode *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2145();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v26 = (NUCGImageSourceNode *)dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v27 = (void *)MEMORY[0x1E0CB3978];
        v28 = v26;
        objc_msgSend(v27, "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v26;
        v37 = 2114;
        v38 = v30;
        _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (NUCGImageSourceNode *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode _setGeometryFromProperties:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 408, CFSTR("Invalid parameter not satisfying: %s"), v31, v32, v33, v34, (uint64_t)"error != nil");
  }
  v7 = v6;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD048]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD040]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  if ((v11 | v9) < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("NUGeometryPrimitives.h"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(width >= 0) && (height >= 0)"));

  }
  -[NUCGImageSourceNode setSize:](self, "setSize:", v9, v11);
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD0C0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12
    || (objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0]),
        (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = objc_msgSend(v12, "integerValue");
    if ((unint64_t)(v13 - 1) >= 8)
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_418);
      v15 = _NURenderLogger;
      v14 = 1;
      if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v36 = self;
        v37 = 2114;
        v38 = v12;
        v14 = 1;
        _os_log_impl(&dword_1A6553000, v15, OS_LOG_TYPE_INFO, "%@ has invalid orientation: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      v14 = v13;
    }
  }
  else
  {
    v14 = 1;
  }
  -[NUCGImageSourceNode setOrientation:](self, "setOrientation:", v14);

  return 1;
}

- (BOOL)_setAuxiliaryImagePropertiesFromCGProperties:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NUCMPhotoAuxiliaryImageProperties *v24;
  NSObject *v25;
  NUCMPhotoAuxiliaryImageProperties *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCCC8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF28]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && objc_msgSend(v9, "count"))
    {
      v37 = v8;
      v38 = v5;
      v36 = v10;
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC860]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUCGImageSourceNode originalThumbnailDictionary](self, "originalThumbnailDictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = (void *)objc_msgSend(v11, "mutableCopy");
        -[NUCGImageSourceNode originalThumbnailDictionary](self, "originalThumbnailDictionary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v14);

        v11 = v13;
      }
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v15 = v11;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v43;
        v19 = *MEMORY[0x1E0CBC868];
        v41 = *MEMORY[0x1E0CBC720];
        v40 = *MEMORY[0x1E0CBC738];
        v39 = *MEMORY[0x1E0CBC740];
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v43 != v18)
              objc_enumerationMutation(v15);
            v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v20);
            objc_msgSend(v21, "objectForKeyedSubscript:", v19);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22;
            if (v22)
            {
              if (self->_decompressionContainer
                && ((objc_msgSend(v22, "isEqualToString:", CFSTR("urn:com:apple:photo:2023:aux:originalthumbnail")) & 1) != 0
                 || (objc_msgSend(v23, "isEqualToString:", CFSTR("urn:com:apple:photo:2023:aux:linearthumbnail")) & 1) != 0
                 || (objc_msgSend(v23, "isEqualToString:", CFSTR("tag:apple.com,2023:photo:aux:linearthumbnail")) & 1) != 0
                 || (objc_msgSend(v23, "isEqualToString:", v41) & 1) != 0
                 || (objc_msgSend(v23, "isEqualToString:", v40) & 1) != 0
                 || (objc_msgSend(v23, "isEqualToString:", v39) & 1) != 0
                 || (objc_msgSend(v23, "isEqualToString:", CFSTR("tag:apple.com,2023:photo:aux:deltamap")) & 1) != 0
                 || objc_msgSend(v23, "isEqualToString:", CFSTR("tag:apple.com,2023:photo:aux:styledeltamap"))))
              {
                v24 = -[NUCMPhotoAuxiliaryImageProperties initWithProperties:decompressionContainer:]([NUCMPhotoAuxiliaryImageProperties alloc], "initWithProperties:decompressionContainer:", v21, self->_decompressionContainer);
              }
              else
              {
                v24 = -[NUCGAuxiliaryImageProperties initWithCGProperties:imageSource:]([NUCGAuxiliaryImageProperties alloc], "initWithCGProperties:imageSource:", v21, self->_cgImageSource);
              }
              v26 = v24;
              objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, v23);

            }
            else
            {
              if (_NULogOnceToken != -1)
                dispatch_once(&_NULogOnceToken, &__block_literal_global_418);
              v25 = _NURenderLogger;
              if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v47 = v21;
                _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Missing AuxiliaryDataType key: %{public}@", buf, 0xCu);
              }
            }

            ++v20;
          }
          while (v17 != v20);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
        }
        while (v17);
      }

      v27 = *MEMORY[0x1E0CBC718];
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC718]);
      v28 = objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        v29 = (void *)v28;
        v30 = *MEMORY[0x1E0CBC710];
        objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC710]);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v27);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", v30);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setCompatibilityMetadata:", objc_msgSend(v33, "auxiliaryDataInfoMetadata"));

        }
      }
      -[NUCGImageSourceNode setAuxiliaryImagesProperties:](self, "setAuxiliaryImagesProperties:", v6);

      v8 = v37;
      v5 = v38;
      v10 = v36;
    }

  }
  return 1;
}

- (BOOL)_load:(id *)a3
{
  _BOOL8 v5;
  const __CFDictionary *v6;
  const __CFURL *v7;
  CGImageSourceRef v8;
  CGImageSourceRef v9;
  const __CFData *v10;
  const __CFData *v11;
  CGImageSourceRef v12;
  CGImageSourceRef v13;
  void *v14;
  CFDictionaryRef v15;
  _BOOL4 v16;
  BOOL v17;
  id v18;
  NSObject *v19;
  CGImage *ImageAtIndex;
  CGBitmapInfo BitmapInfo;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  CGColorSpaceRef ColorSpace;
  NUColorSpace *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  NUColorSpace *v43;
  CFDictionaryRef v44;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *specific;
  NSObject *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  id v69;
  uint8_t buf[4];
  id v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_2145();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v71 = v52;
      _os_log_error_impl(&dword_1A6553000, v51, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2145();
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v55)
      {
        v58 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v59 = (void *)MEMORY[0x1E0CB3978];
        v60 = v58;
        objc_msgSend(v59, "callStackSymbols");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "componentsJoinedByString:", CFSTR("\n"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v71 = v58;
        v72 = 2114;
        v73 = v62;
        _os_log_error_impl(&dword_1A6553000, v54, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v55)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "componentsJoinedByString:", CFSTR("\n"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v71 = v57;
      _os_log_error_impl(&dword_1A6553000, v54, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode _load:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 531, CFSTR("Invalid parameter not satisfying: %s"), v63, v64, v65, v66, (uint64_t)"error != nil");
  }
  if (!-[NUCGImageSourceNode loaded](self, "loaded"))
  {
    -[NUCGImageSourceNode _finalizeSourceOptions:subsampleFactor:](self, "_finalizeSourceOptions:subsampleFactor:", MEMORY[0x1E0C9AA70], 1);
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    -[NUCGImageSourceNode URL](self, "URL");
    v7 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v8 = CGImageSourceCreateWithURL(v7, v6);
    if (!v8)
    {
      +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Unable to create CGImageSourceRef"), v7);
      v5 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_52:
      -[NUCGImageSourceNode setLoaded:](self, "setLoaded:", v5);

      return v5;
    }
    v9 = v8;
    if (-[NUCGImageSourceNode useEmbeddedPreview](self, "useEmbeddedPreview"))
    {
      -[NUCGImageSourceNode loadEmbeddedThumbnailDataFromImageSource:options:](self, "loadEmbeddedThumbnailDataFromImageSource:options:", v9, v6);
      v10 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v12 = CGImageSourceCreateWithData(v10, v6);
        if (v12)
        {
          v13 = v12;
          CFRelease(v9);
          v9 = v13;
        }
        else
        {
          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_418);
          v14 = (void *)_NURenderLogger;
          if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
          {
            v46 = v14;
            -[__CFURL path](v7, "path");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v71 = v47;
            _os_log_error_impl(&dword_1A6553000, v46, OS_LOG_TYPE_ERROR, "Failed to load image source from embedded thumbnail data at path: '%{public}@'", buf, 0xCu);

          }
        }
      }

    }
    -[NUCGImageSourceNode setCgImageSource:](self, "setCgImageSource:", v9);
    v15 = CGImageSourceCopyPropertiesAtIndex(v9, 0, v6);
    -[NUCGImageSourceNode setCgImageProperties:](self, "setCgImageProperties:", v15);
    if (v15)
    {
      v16 = -[NUCGImageSourceNode _setGeometryFromProperties:error:](self, "_setGeometryFromProperties:error:", v15, a3);
    }
    else
    {
      +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 2, CFSTR("Unable to load CGImageProperties"), self);
      v16 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    v69 = 0;
    v17 = -[NUCGImageSourceNode _loadSemanticStylesProperties:](self, "_loadSemanticStylesProperties:", &v69);
    v18 = v69;
    if (!v17)
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_418);
      v19 = _NURenderLogger;
      if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v71 = v18;
        _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Failed to get style metadata: %{public}@", buf, 0xCu);
      }
    }

    if (v16)
    {
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v9, 0, v6);
      v5 = (_BOOL8)ImageAtIndex;
      if (ImageAtIndex)
      {
        BitmapInfo = CGImageGetBitmapInfo(ImageAtIndex);
        if ((BitmapInfo & 0x1F) > 6)
          v22 = 0;
        else
          v22 = qword_1A671A0A8[BitmapInfo & 0x1F];
        -[NUCGImageSourceNode setAlphaInfo:](self, "setAlphaInfo:", v22);
        if ((BitmapInfo & 0x100) != 0)
        {
          v24 = 4;
        }
        else
        {
          v23 = (BitmapInfo >> 12) & 7;
          if (v23 > 4)
            v24 = 0;
          else
            v24 = qword_1A671A0E0[v23];
        }
        -[NUCGImageSourceNode setComponentInfo:](self, "setComponentInfo:", v24);
        ColorSpace = CGImageGetColorSpace((CGImageRef)v5);
        if (ColorSpace)
        {
          v26 = -[NUColorSpace initWithCGColorSpace:]([NUColorSpace alloc], "initWithCGColorSpace:", ColorSpace);
LABEL_50:
          v43 = v26;
          -[NUCGImageSourceNode setColorSpace:](self, "setColorSpace:", v26);

          CGImageRelease((CGImageRef)v5);
          v44 = CGImageSourceCopyProperties(v9, v6);
          v5 = -[NUCGImageSourceNode _setAuxiliaryImagePropertiesFromCGProperties:error:](self, "_setAuxiliaryImagePropertiesFromCGProperties:error:", v44, a3);

          goto LABEL_51;
        }
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_2167);
        v27 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
        {
          v28 = (void *)MEMORY[0x1E0CB3940];
          v29 = v27;
          objc_msgSend(v28, "stringWithFormat:", CFSTR("Could not get the color space from the image - attempting to use built in sRGB"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v71 = v30;
          _os_log_impl(&dword_1A6553000, v29, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

          v31 = _NULogOnceToken;
          if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
          {
            if (v31 != -1)
              dispatch_once(&_NULogOnceToken, &__block_literal_global_2167);
LABEL_44:
            v32 = (void *)_NUAssertLogger;
            if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
            {
              v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
              v38 = (void *)MEMORY[0x1E0CB3978];
              v68 = v37;
              v39 = v32;
              objc_msgSend(v38, "callStackSymbols");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v71 = v37;
              v72 = 2114;
              v73 = v41;
              _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_55:
              goto LABEL_49;
            }
            goto LABEL_49;
          }
          if (v31 != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_2167);
        }
        else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          goto LABEL_44;
        }
        v42 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          v48 = (void *)MEMORY[0x1E0CB3978];
          v39 = v42;
          objc_msgSend(v48, "callStackSymbols");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "componentsJoinedByString:", CFSTR("\n"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v71 = v50;
          _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

          goto LABEL_55;
        }
LABEL_49:
        _NUAssertContinueHandler((uint64_t)"-[NUCGImageSourceNode _load:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 598, CFSTR("Could not get the color space from the image - attempting to use built in sRGB"), v33, v34, v35, v36, v67);
        +[NUColorSpace sRGBColorSpace](NUColorSpace, "sRGBColorSpace");
        v26 = (NUColorSpace *)objc_claimAutoreleasedReturnValue();
        goto LABEL_50;
      }
      +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("Unable to create image from imageSource"), self);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
LABEL_51:
    CFRelease(v9);
    goto LABEL_52;
  }
  LOBYTE(v5) = 1;
  return v5;
}

- (BOOL)_loadSemanticStylesProperties:(id *)a3
{
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t Container;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[NUCGImageSourceNode URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CMPhotoDecompressionDetectContainerFormat();

  if (!v6)
    return 1;
  v7 = CMPhotoDecompressionSessionCreate();
  if (self->_decompressionSession)
  {
    -[NUCGImageSourceNode URL](self, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    Container = CMPhotoDecompressionSessionCreateContainer();

    if (self->_decompressionContainer)
    {
      v16 = 0;
      v10 = CMPhotoDecompressionContainerCopyCustomMetadataForIndexWithOptions();
      if (v10 >> 1 != 2147475151)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("Failed to load custom metadata"), v14);
        v13 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        return v13;
      }
      return 1;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", Container);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("Failed to create decompression container"), v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("Failed to create decompression session"), v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (id)loadEmbeddedThumbnailDataFromImageSource:(CGImageSource *)a3 options:(id)a4
{
  CFDictionaryRef v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  const char *v33;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v39;
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = CGImageSourceCopyProperties(a3, (CFDictionaryRef)a4);
  -[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("{raw}"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CropSize"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Width"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Height"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue");

    if (!v10 || !v12)
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_418);
      v31 = _NURenderLogger;
      if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v41 = v7;
        _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Invalid image size from Raw properties: %{public}@", buf, 0xCu);
      }
      v28 = 0;
      goto LABEL_36;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Thumbnails"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Width"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "unsignedIntegerValue");

      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Height"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "unsignedIntegerValue");

      if (v16 == v10 && v18 == v12)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("JPEGOffset"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "unsignedIntegerValue");

        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("JPEGLength"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "unsignedIntegerValue");

        if (v20 && v22)
        {
          v23 = (void *)MEMORY[0x1E0C99D50];
          -[NUCGImageSourceNode URL](self, "URL");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 0;
          objc_msgSend(v23, "dataWithContentsOfURL:options:error:", v24, 1, &v39);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v39;

          objc_msgSend(v25, "subdataWithRange:", v20, v22);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (v27)
          {
            v29 = v27;
          }
          else
          {
            NURenderLogger();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v41 = v26;
              _os_log_error_impl(&dword_1A6553000, v38, OS_LOG_TYPE_ERROR, "Failed to load embedded thumbnail data: %{public}@", buf, 0xCu);
            }

          }
          goto LABEL_35;
        }
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_418);
        v32 = _NURenderLogger;
        if (!os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
        {
LABEL_34:
          v28 = 0;
LABEL_35:

LABEL_36:
          goto LABEL_37;
        }
        *(_DWORD *)buf = 138543362;
        v41 = v7;
        v33 = "Invalid thumbnail data range: %{public}@";
      }
      else
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_418);
        v32 = _NURenderLogger;
        if (!os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
          goto LABEL_34;
        *(_DWORD *)buf = 138543362;
        v41 = v7;
        v33 = "Embedded thumbnail dimension mismatch: %{public}@";
      }
    }
    else
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_418);
      v32 = _NURenderLogger;
      if (!os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
        goto LABEL_34;
      *(_DWORD *)buf = 138543362;
      v41 = v7;
      v33 = "Missing thumbnail properties: %{public}@";
    }
    _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, v33, buf, 0xCu);
    goto LABEL_34;
  }
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_418);
  v30 = (void *)_NURenderLogger;
  if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
  {
    v35 = v30;
    -[NUCGImageSourceNode URL](self, "URL");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "path");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v41 = v37;
    _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Invalid {raw} properties: %@", buf, 0xCu);

  }
  v28 = 0;
LABEL_37:

  return v28;
}

- (BOOL)load:(id *)a3
{
  BOOL v5;
  NSObject *queue;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v12 = -[NUCGImageSourceNode loaded](self, "loaded");
  if (*((_BYTE *)v10 + 24))
  {
    v5 = 1;
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28__NUCGImageSourceNode_load___block_invoke;
    block[3] = &unk_1E5063750;
    block[4] = self;
    block[5] = &v9;
    block[6] = a3;
    dispatch_sync(queue, block);
    v5 = *((_BYTE *)v10 + 24) != 0;
  }
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (id)debugQuickLookObject
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;
  uint64_t v9;

  v9 = 0;
  -[NURenderNode outputImage:](self, "outputImage:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || v9)
  {
    v8.receiver = self;
    v8.super_class = (Class)NUCGImageSourceNode;
    -[NURenderNode debugQuickLookObject](&v8, sel_debugQuickLookObject);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v3;
  }
  v6 = v5;

  return v6;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)pixelSizeWithSourceOptions:(id)a3
{
  id v4;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 *p_size;
  int64_t width;
  int64_t height;
  int64_t v8;
  int64_t v9;
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
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NUCGImageSourceNode loaded](self, "loaded"))
  {
    NUAssertLogger_2145();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ not loaded"), self);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2145();
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
        v27 = v17;
        v28 = 2114;
        v29 = v21;
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
      v27 = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode pixelSizeWithSourceOptions:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 791, CFSTR("%@ not loaded"), v22, v23, v24, v25, (uint64_t)self);
  }
  p_size = &self->_size;
  width = self->_size.width;
  height = p_size->height;

  v8 = width;
  v9 = height;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (CGImageSource)cgImageSource
{
  NSObject *v4;
  void *v5;
  void *specific;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!-[NUCGImageSourceNode loaded](self, "loaded"))
  {
    NUAssertLogger_2145();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ not loaded"), self);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v5;
      _os_log_error_impl(&dword_1A6553000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2145();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v12 = (void *)MEMORY[0x1E0CB3978];
        v13 = v11;
        objc_msgSend(v12, "callStackSymbols");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v11;
        v22 = 2114;
        v23 = v15;
        _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v10;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode cgImageSource]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 797, CFSTR("%@ not loaded"), v16, v17, v18, v19, (uint64_t)self);
  }
  return self->_cgImageSource;
}

- (void)_addDefaultFinalizedSourceOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[NUCGImageSourceNode UTI](self, "UTI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CBD2A8]);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0D75130];
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "typeRequiresRasterizationDPI:", v6);

    if ((_DWORD)v5)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E50A2490, *MEMORY[0x1E0CBD1F8]);
  }
  if (+[NUGlobalSettings allAssetsCanUseHDRPipeline](NUGlobalSettings, "allAssetsCanUseHDRPipeline"))
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CBD238]);

}

- (id)_finalizeSourceOptions:(id)a3 subsampleFactor:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NUCGImageSourceNode _addDefaultFinalizedSourceOptions:](self, "_addDefaultFinalizedSourceOptions:", v7);
  if (a4 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CBD290]);

  }
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v7, "addEntriesFromDictionary:", v6);

  return v7;
}

- (id)_evaluateRawImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  CGImageSource *v8;
  const __CFDictionary *v9;
  NSObject *v11;
  void *v12;
  void *specific;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    NUAssertLogger_2145();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2145();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v19 = (void *)MEMORY[0x1E0CB3978];
        v20 = v18;
        objc_msgSend(v19, "callStackSymbols");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v18;
        v29 = 2114;
        v30 = v22;
        _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode _evaluateRawImagePropertiesWithSourceOptions:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 839, CFSTR("Invalid parameter not satisfying: %s"), v23, v24, v25, v26, (uint64_t)"error != NULL");
  }
  v7 = v6;
  if (-[NUCGImageSourceNode load:](self, "load:", a4))
  {
    if (objc_msgSend(v7, "count"))
    {
      v8 = -[NUCGImageSourceNode cgImageSource](self, "cgImageSource");
      if (v8)
      {
        -[NUCGImageSourceNode _finalizeSourceOptions:subsampleFactor:](self, "_finalizeSourceOptions:subsampleFactor:", v7, 1);
        v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        v8 = CGImageSourceCopyPropertiesAtIndex(v8, 0, v9);
        if (!v8)
        {
          +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("Unable to get properties from imageSource"), self);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("Unable to create imageSource"), self);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      -[NUCGImageSourceNode cgImageProperties](self, "cgImageProperties");
      v8 = (CGImageSource *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  CGImageSource *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  CGImageSource *v16;
  double v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  int64_t v24;
  NSObject *v26;
  void *v27;
  void *specific;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!a4)
  {
    NUAssertLogger_2145();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "subsampleFactor != NULL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v59 = v27;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2145();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v30)
      {
        v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v41 = (void *)MEMORY[0x1E0CB3978];
        v42 = v40;
        objc_msgSend(v41, "callStackSymbols");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v59 = v40;
        v60 = 2114;
        v61 = v44;
        _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v30)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v59 = v32;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 868, CFSTR("Invalid parameter not satisfying: %s"), v45, v46, v47, v48, (uint64_t)"subsampleFactor != NULL");
  }
  if (!a5)
  {
    NUAssertLogger_2145();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v59 = v34;
      _os_log_error_impl(&dword_1A6553000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_2145();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (v35)
    {
      if (v37)
      {
        v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v50 = (void *)MEMORY[0x1E0CB3978];
        v51 = v49;
        objc_msgSend(v50, "callStackSymbols");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "componentsJoinedByString:", CFSTR("\n"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v59 = v49;
        v60 = 2114;
        v61 = v53;
        _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v37)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v59 = v39;
      _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 869, CFSTR("Invalid parameter not satisfying: %s"), v54, v55, v56, v57, (uint64_t)"error != NULL");
  }
  v9 = v8;
  if (!-[NUCGImageSourceNode load:](self, "load:", a5))
  {
    v10 = 0;
    goto LABEL_18;
  }
  v10 = -[NUCGImageSourceNode cgImageSource](self, "cgImageSource");
  if (!v10)
  {
    +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("Unable to create imageSource"), self);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  -[NUCGImageSourceNode _finalizeSourceOptions:subsampleFactor:](self, "_finalizeSourceOptions:subsampleFactor:", v9, *a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v11);
  if (+[NUGlobalSettings imageSourceDisableCacheImmediately](NUGlobalSettings, "imageSourceDisableCacheImmediately"))
  {
    v13 = MEMORY[0x1E0C9AAA0];
LABEL_11:
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0C9E100]);
    goto LABEL_12;
  }
  -[NUCGImageSourceNode colorSpace](self, "colorSpace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isHDR");

  if (v15)
  {
    v13 = MEMORY[0x1E0C9AAB0];
    goto LABEL_11;
  }
LABEL_12:
  v16 = (CGImageSource *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCGImageSource:index:options:", v10, 0, v12);
  v10 = v16;
  if (v16)
  {
    -[CGImageSource extent](v16, "extent");
    v18 = (uint64_t)v17;
    -[CGImageSource extent](v10, "extent");
    v20 = (uint64_t)v19;
    v21 = -[NUCGImageSourceNode pixelSizeWithSourceOptions:](self, "pixelSizeWithSourceOptions:", v9);
    v23 = (double)(v21 + v22) / (double)(v20 + v18);
    v24 = 1;
    if (v23 >= 1.0)
      v24 = 1 << llround(log2(v23));
    *a4 = v24;
  }
  else
  {
    +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("Unable to create image from imageSource"), self);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_18:
  return v10;
}

- (id)_evaluateImageGeometryWithSourceOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v6 = a3;
  if (-[NUCGImageSourceNode load:](self, "load:", a4))
  {
    v9.receiver = self;
    v9.super_class = (Class)NUCGImageSourceNode;
    -[NUSourceNode _evaluateImageGeometryWithSourceOptions:error:](&v9, sel__evaluateImageGeometryWithSourceOptions_error_, v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_evaluateImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  _NUImageProperties *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  double v51;
  uint8_t buf[4];
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[NUCGImageSourceNode load:](self, "load:", a4))
  {
    -[NUCGImageSourceNode _evaluateRawImagePropertiesWithSourceOptions:error:](self, "_evaluateRawImagePropertiesWithSourceOptions:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v8 = 0;
LABEL_48:

      goto LABEL_49;
    }
    v8 = objc_alloc_init(_NUImageProperties);
    -[_NUImageProperties setUrl:](v8, "setUrl:", self->_URL);
    -[_NUImageProperties setMetadata:](v8, "setMetadata:", v7);
    -[NUCGImageSourceNode colorSpace](self, "colorSpace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NUImageProperties setColorSpace:](v8, "setColorSpace:", v9);

    v10 = -[NUCGImageSourceNode pixelSizeWithSourceOptions:](self, "pixelSizeWithSourceOptions:", v6);
    -[_NUImageProperties setSize:](v8, "setSize:", v10, v11);
    -[_NUImageProperties setOrientation:](v8, "setOrientation:", -[NUCGImageSourceNode sourceOrientation](self, "sourceOrientation"));
    -[NUCGImageSourceNode UTI](self, "UTI");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NUImageProperties setFileUTI:](v8, "setFileUTI:", v12);

    -[_NUImageProperties setAlphaInfo:](v8, "setAlphaInfo:", -[NUCGImageSourceNode alphaInfo](self, "alphaInfo"));
    -[_NUImageProperties setComponentInfo:](v8, "setComponentInfo:", -[NUCGImageSourceNode componentInfo](self, "componentInfo"));
    -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC708]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      -[_NUImageProperties setAuxiliaryImageProperties:forType:](v8, "setAuxiliaryImageProperties:forType:", v14, 2);
    -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC720]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      -[_NUImageProperties setAuxiliaryImageProperties:forType:](v8, "setAuxiliaryImageProperties:forType:", v16, 3);
    -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC738]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      -[_NUImageProperties setAuxiliaryImageProperties:forType:](v8, "setAuxiliaryImageProperties:forType:", v18, 4);
    -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC748]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      -[_NUImageProperties setAuxiliaryImageProperties:forType:](v8, "setAuxiliaryImageProperties:forType:", v20, 6);
    -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC730]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      -[_NUImageProperties setAuxiliaryImageProperties:forType:](v8, "setAuxiliaryImageProperties:forType:", v22, 5);
    -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC728]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
      -[_NUImageProperties setAuxiliaryImageProperties:forType:](v8, "setAuxiliaryImageProperties:forType:", v24, 8);
    -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC740]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
      -[_NUImageProperties setAuxiliaryImageProperties:forType:](v8, "setAuxiliaryImageProperties:forType:", v26, 9);
    -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC718]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = +[NUGlobalSettings enableFlexRange](NUGlobalSettings, "enableFlexRange");

      if (v29)
      {
        -[_NUImageProperties setAuxiliaryImageProperties:forType:](v8, "setAuxiliaryImageProperties:forType:", v28, 7);
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_418);
        v30 = (void *)_NURenderLogger;
        if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_DEFAULT))
        {
          v31 = v30;
          *(_DWORD *)buf = 138412290;
          v53 = objc_msgSend(v28, "auxiliaryDataInfoMetadata");
          _os_log_impl(&dword_1A6553000, v31, OS_LOG_TYPE_DEFAULT, "FlexRange metadata: %@", buf, 0xCu);

        }
        +[_NUFlexRangeProperties flexRangePropertiesWithGainMapMetadata:](_NUFlexRangeProperties, "flexRangePropertiesWithGainMapMetadata:", objc_msgSend(v28, "auxiliaryDataInfoMetadata"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "colorSpace");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setAlternateColorSpace:", v33);

        v51 = 0.0;
        -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC710]);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v35, "auxiliaryDataInfoMetadata")
          && +[_NUImageProperties getGainMapHeadroom:fromMetadata:](_NUImageProperties, "getGainMapHeadroom:fromMetadata:", &v51, objc_msgSend(v35, "auxiliaryDataInfoMetadata")))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v51);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setCompatibilityGainMapHeadroom:", v36);

        }
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_418);
        v37 = _NURenderLogger;
        if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v53 = (uint64_t)v32;
          _os_log_impl(&dword_1A6553000, v37, OS_LOG_TYPE_DEFAULT, "FlexRange properties: %@", buf, 0xCu);
        }
        -[_NUImageProperties setFlexRangeProperties:](v8, "setFlexRangeProperties:", v32);

        goto LABEL_36;
      }
    }
    else
    {

    }
    -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC710]);
    v39 = objc_claimAutoreleasedReturnValue();

    if (!v39)
      goto LABEL_37;
    -[_NUImageProperties setAuxiliaryImageProperties:forType:](v8, "setAuxiliaryImageProperties:forType:", v39, 7);
    v28 = (void *)v39;
LABEL_36:

LABEL_37:
    -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("urn:com:apple:photo:2023:aux:originalthumbnail"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
      -[_NUImageProperties setAuxiliaryImageProperties:forType:](v8, "setAuxiliaryImageProperties:forType:", v41, 10);
    -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("urn:com:apple:photo:2023:aux:linearthumbnail"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {

    }
    else
    {
      -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("tag:apple.com,2023:photo:aux:linearthumbnail"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v43)
        goto LABEL_43;
    }
    -[_NUImageProperties setAuxiliaryImageProperties:forType:](v8, "setAuxiliaryImageProperties:forType:", v43, 11);

LABEL_43:
    -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("tag:apple.com,2023:photo:aux:deltamap"));
    v46 = objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      v47 = (void *)v46;

    }
    else
    {
      -[NUCGImageSourceNode auxiliaryImagesProperties](self, "auxiliaryImagesProperties");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("tag:apple.com,2023:photo:aux:styledeltamap"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v47)
      {
LABEL_47:
        -[NUCGImageSourceNode semanticStylesProperties](self, "semanticStylesProperties");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[_NUImageProperties setSemanticStyleProperties:](v8, "setSemanticStyleProperties:", v49);

        goto LABEL_48;
      }
    }
    -[_NUImageProperties setAuxiliaryImageProperties:forType:](v8, "setAuxiliaryImageProperties:forType:", v47, 12);

    goto LABEL_47;
  }
  v8 = 0;
LABEL_49:

  return v8;
}

- (CMPhotoDecompressionSession)decompressionSession
{
  return self->_decompressionSession;
}

- (void)setDecompressionSession:(CMPhotoDecompressionSession *)a3
{
  self->_decompressionSession = a3;
}

- (CMPhotoDecompressionContainer)decompressionContainer
{
  return self->_decompressionContainer;
}

- (void)setDecompressionContainer:(CMPhotoDecompressionContainer *)a3
{
  self->_decompressionContainer = a3;
}

- (NSDictionary)originalThumbnailDictionary
{
  return self->_originalThumbnailDictionary;
}

- (void)setOriginalThumbnailDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_originalThumbnailDictionary, a3);
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 224, 1);
}

- (NSString)UTI
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (BOOL)loaded
{
  return self->_loaded;
}

- (void)setLoaded:(BOOL)a3
{
  self->_loaded = a3;
}

- (void)setCgImageSource:(CGImageSource *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 240);
}

- (NSDictionary)cgImageProperties
{
  return self->_cgImageProperties;
}

- (void)setCgImageProperties:(id)a3
{
  objc_storeStrong((id *)&self->_cgImageProperties, a3);
}

- (NUSemanticStyleProperties)semanticStylesProperties
{
  return self->_semanticStylesProperties;
}

- (void)setSemanticStylesProperties:(id)a3
{
  objc_storeStrong((id *)&self->_semanticStylesProperties, a3);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t v2;
  int64_t v3;
  _QWORD v4[2];
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setSize:(id)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3;

  v3 = a3;
  objc_copyStruct(&self->_size, &v3, 16, 1, 0);
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(id)a3
{
  objc_storeStrong((id *)&self->_colorSpace, a3);
}

- (int64_t)alphaInfo
{
  return self->_alphaInfo;
}

- (void)setAlphaInfo:(int64_t)a3
{
  self->_alphaInfo = a3;
}

- (int64_t)componentInfo
{
  return self->_componentInfo;
}

- (void)setComponentInfo:(int64_t)a3
{
  self->_componentInfo = a3;
}

- (NSDictionary)auxiliaryImagesProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 296, 1);
}

- (void)setAuxiliaryImagesProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryImagesProperties, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_semanticStylesProperties, 0);
  objc_storeStrong((id *)&self->_cgImageProperties, 0);
  objc_storeStrong((id *)&self->_UTI, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_originalThumbnailDictionary, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __28__NUCGImageSourceNode_load___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_load:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
