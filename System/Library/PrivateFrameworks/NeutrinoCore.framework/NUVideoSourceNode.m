@implementation NUVideoSourceNode

- (NUVideoSourceNode)initWithURL:(id)a3 identifier:(id)a4 options:(id)a5
{
  NSURL *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NUVideoSourceNode *v14;
  NSURL *URL;
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
  objc_super v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = (NSURL *)a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    NUAssertLogger_551();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "URL != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
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
        v51 = v31;
        v52 = 2114;
        v53 = v35;
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
      v51 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode initWithURL:identifier:options:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 101, CFSTR("Invalid parameter not satisfying: %s"), v36, v37, v38, v39, (uint64_t)"URL != nil");
  }
  if (!v9)
  {
    NUAssertLogger_551();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "identifier != nil");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v25;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
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
        v51 = v40;
        v52 = 2114;
        v53 = v44;
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
      v51 = v30;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode initWithURL:identifier:options:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 102, CFSTR("Invalid parameter not satisfying: %s"), v45, v46, v47, v48, (uint64_t)"identifier != nil");
  }
  v11 = v10;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("url"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("identifier"));
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("appliedCropRect"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("appliedCropRect"));

  v49.receiver = self;
  v49.super_class = (Class)NUVideoSourceNode;
  v14 = -[NUSourceNode initWithSettings:](&v49, sel_initWithSettings_, v12);
  URL = v14->_URL;
  v14->_URL = v8;

  -[NUVideoSourceNode _initializeQueue](v14, "_initializeQueue");
  return v14;
}

- (NUVideoSourceNode)initWithVideoData:(id)a3 identifier:(id)a4 options:(id)a5
{
  NSData *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NUVideoSourceNode *v14;
  NSData *videoData;
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
  objc_super v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = (NSData *)a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    NUAssertLogger_551();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "data != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
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
        v51 = v31;
        v52 = 2114;
        v53 = v35;
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
      v51 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode initWithVideoData:identifier:options:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 118, CFSTR("Invalid parameter not satisfying: %s"), v36, v37, v38, v39, (uint64_t)"data != nil");
  }
  if (!v9)
  {
    NUAssertLogger_551();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "identifier != nil");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v25;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
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
        v51 = v40;
        v52 = 2114;
        v53 = v44;
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
      v51 = v30;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode initWithVideoData:identifier:options:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 119, CFSTR("Invalid parameter not satisfying: %s"), v45, v46, v47, v48, (uint64_t)"identifier != nil");
  }
  v11 = v10;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("identifier"));
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("appliedCropRect"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("appliedCropRect"));

  v49.receiver = self;
  v49.super_class = (Class)NUVideoSourceNode;
  v14 = -[NUSourceNode initWithSettings:](&v49, sel_initWithSettings_, v12);
  videoData = v14->_videoData;
  v14->_videoData = v8;

  -[NUVideoSourceNode _initializeQueue](v14, "_initializeQueue");
  return v14;
}

- (NUVideoSourceNode)initWithSettings:(id)a3
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_562);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_562);
      goto LABEL_8;
    }
    if (v12 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_562);
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
  _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode initWithSettings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 134, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v26, v27, v28, v29, v25);
}

- (void)_initializeQueue
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *queue;
  NSObject *v5;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v3 = (OS_dispatch_queue *)dispatch_queue_create("NUVideoSourceNode", v5);
  queue = self->_queue;
  self->_queue = v3;

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
  if (!self->_loaded)
  {
    NUAssertLogger_551();
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
    NUAssertLogger_551();
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
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode sourceOrientation]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 143, CFSTR("%@ not loaded"), v16, v17, v18, v19, (uint64_t)self);
  }
  return self->_orientation;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return 1;
}

- (id)sourceOptionsForSettings:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  __CFString *v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v16;
  __int128 v17;

  v5 = a3;
  v6 = objc_alloc(MEMORY[0x1E0C99E08]);
  v7 = (void *)objc_msgSend(v6, "initWithDictionary:", MEMORY[0x1E0C9AA70]);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("auxiliaryImageType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("auxiliaryImageType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Disparity"));

    if (v10)
    {
      v11 = CFSTR("Disparity");
      objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("Disparity"), CFSTR("imageType"));

    }
  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("none"), CFSTR("imageType"));
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hardCropCleanAperture"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if (v13)
  {
    v16 = 0u;
    v17 = 0u;
    -[NUVideoSourceNode cleanAperture](self, "cleanAperture");
  }
  v14 = (void *)objc_msgSend(v7, "copy");

  return v14;
}

- (BOOL)_load:(id *)a3
{
  BOOL v4;
  AVAsset *v5;
  AVAsset *asset;
  void *v7;
  NSArray *v8;
  NSArray *metadata;
  void *v10;
  NSArray *v11;
  NSArray *trackGroups;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSDictionary *trackMetadata;
  void *v25;
  void *v26;
  float v27;
  void *v28;
  void *v29;
  uint64_t Dimensions;
  int64_t v31;
  uint64_t v32;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  NSDictionary *colorProperties;
  void *v50;
  AVAsset *v51;
  void *v52;
  void *v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  double v59;
  CGFloat v60;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 v61;
  BOOL v62;
  id v63;
  BOOL v64;
  id v65;
  NSObject *v67;
  void *v68;
  void *specific;
  NSObject *v70;
  _BOOL4 v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  NUVideoSourceNode *v86;
  id v88;
  id v89;
  char v90[48];
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  $86B46DF249C2B4242DBB096758D29184 v95;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 v96;
  _QWORD v97[3];
  _QWORD v98[3];
  _BYTE v99[128];
  CGRect buf;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_551();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.origin.x) = 138543362;
      *(_QWORD *)((char *)&buf.origin.x + 4) = v68;
      _os_log_error_impl(&dword_1A6553000, v67, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
    v70 = objc_claimAutoreleasedReturnValue();
    v71 = os_log_type_enabled(v70, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v71)
      {
        v74 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v75 = (void *)MEMORY[0x1E0CB3978];
        v76 = v74;
        objc_msgSend(v75, "callStackSymbols");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "componentsJoinedByString:", CFSTR("\n"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.origin.x) = 138543618;
        *(_QWORD *)((char *)&buf.origin.x + 4) = v74;
        WORD2(buf.origin.y) = 2114;
        *(_QWORD *)((char *)&buf.origin.y + 6) = v78;
        _os_log_error_impl(&dword_1A6553000, v70, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else if (v71)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "componentsJoinedByString:", CFSTR("\n"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.origin.x) = 138543362;
      *(_QWORD *)((char *)&buf.origin.x + 4) = v73;
      _os_log_error_impl(&dword_1A6553000, v70, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode _load:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 174, CFSTR("Invalid parameter not satisfying: %s"), v79, v80, v81, v82, (uint64_t)"error != NULL");
  }
  if (self->_loaded)
    return 1;
  if (self->_URL)
    objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:");
  else
    objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithData:contentType:options:", self->_videoData, *MEMORY[0x1E0C8A2E8], MEMORY[0x1E0C9AA70]);
  v5 = (AVAsset *)objc_claimAutoreleasedReturnValue();
  asset = self->_asset;
  self->_asset = v5;

  -[AVAsset metadata](self->_asset, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (NSArray *)objc_msgSend(v7, "copy");
  metadata = self->_metadata;
  self->_metadata = v8;

  -[AVAsset trackGroups](self->_asset, "trackGroups");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (NSArray *)objc_msgSend(v10, "copy");
  trackGroups = self->_trackGroups;
  self->_trackGroups = v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v86 = self;
  -[AVAsset tracks](self->_asset, "tracks");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v92;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v92 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
        objc_msgSend(v19, "metadata");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v20, "copy");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v19, "trackID"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, v22);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
    }
    while (v16);
  }

  v23 = objc_msgSend(v13, "copy");
  trackMetadata = v86->_trackMetadata;
  v86->_trackMetadata = (NSDictionary *)v23;

  +[NUVideoUtilities firstEnabledVideoTrackInAsset:error:](NUVideoUtilities, "firstEnabledVideoTrackInAsset:error:", v86->_asset, a3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    if ((objc_msgSend(v25, "isDecodable") & 1) != 0)
    {
      objc_msgSend(v26, "preferredTransform");
      v86->_orientation = +[NUVideoUtilities videoOrientationForAssetPreferredTransform:](NUVideoUtilities, "videoOrientationForAssetPreferredTransform:", v90);
      objc_msgSend(v26, "nominalFrameRate");
      v86->_nominalFrameRate = v27;
      objc_msgSend(v26, "formatDescriptions");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "count"))
      {
        v85 = v28;
        objc_msgSend(v28, "firstObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        Dimensions = (uint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)v29);
        v31 = (int)Dimensions;
        v32 = Dimensions >> 32;
        if ((((int)Dimensions | (unint64_t)(Dimensions >> 32)) & 0x8000000000000000) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "handleFailureInFunction:file:lineNumber:description:", v84, CFSTR("NUGeometryPrimitives.h"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(width >= 0) && (height >= 0)"));

        }
        v86->_size.width = v31;
        v86->_size.height = v32;
        buf = CMVideoFormatDescriptionGetCleanAperture((CMVideoFormatDescriptionRef)v29, 0);
        NU::RectT<long>::RectT(&v95, &buf, 3);
        v33 = v96;
        v86->_cleanAperture.origin = v95;
        v86->_cleanAperture.size = v33;
        CMFormatDescriptionGetExtension((CMFormatDescriptionRef)v29, (CFStringRef)*MEMORY[0x1E0CA8D68]);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        CMFormatDescriptionGetExtension((CMFormatDescriptionRef)v29, (CFStringRef)*MEMORY[0x1E0CA8E98]);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        CMFormatDescriptionGetExtension((CMFormatDescriptionRef)v29, (CFStringRef)*MEMORY[0x1E0CA8EE8]);
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = (void *)v36;
        if (v34 && v35 && v36)
        {
          v38 = v34;
          v39 = v35;
          v40 = (id)v36;
        }
        else
        {
          v41 = (void *)*MEMORY[0x1E0C8AE98];
          if (v34)
            v41 = v34;
          v38 = v41;

          v42 = (void *)*MEMORY[0x1E0C8AF50];
          if (v35)
            v42 = v35;
          v39 = v42;

          v43 = (void *)*MEMORY[0x1E0C8AF70];
          if (v37)
            v43 = v37;
          v40 = v43;

          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_344);
          v44 = (void *)_NULogger;
          if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
          {
            v45 = v44;
            objc_msgSend(v85, "firstObject");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf.origin.x) = 138412290;
            *(_QWORD *)((char *)&buf.origin.x + 4) = v46;
            _os_log_impl(&dword_1A6553000, v45, OS_LOG_TYPE_INFO, "Invalid color properties in format description: %@", (uint8_t *)&buf, 0xCu);

          }
        }
        v47 = *MEMORY[0x1E0C8AF40];
        v97[0] = *MEMORY[0x1E0C8AE90];
        v97[1] = v47;
        v98[0] = v38;
        v98[1] = v39;
        v97[2] = *MEMORY[0x1E0C8AF68];
        v98[2] = v40;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 3);
        v48 = objc_claimAutoreleasedReturnValue();
        colorProperties = v86->_colorProperties;
        v86->_colorProperties = (NSDictionary *)v48;

        -[NUSourceNode originalNode](v86, "originalNode");
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (v50)
        {
          +[NUVideoUtilities readStillImageTimeFromVideoAsset:](NUVideoUtilities, "readStillImageTimeFromVideoAsset:", v86->_asset);
          *(CGPoint *)&v86->_livePhotoKeyFrameTime.value = buf.origin;
          v86->_livePhotoKeyFrameTime.epoch = *(_QWORD *)&buf.size.width;
        }
        v51 = v86->_asset;
        if (v51)
          -[AVAsset duration](v51, "duration");
        else
          memset(&buf, 0, 24);
        *(CGPoint *)&v86->_duration.value = buf.origin;
        v86->_duration.epoch = *(_QWORD *)&buf.size.width;

        -[NURenderNode settings](v86, "settings");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("appliedCropRect"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (v53)
        {
          objc_msgSend(v53, "nu_CGRect");
          v55 = (double)v86->_size.width / v54;
          v57 = (double)v86->_size.height / v56;
          v60 = *(double *)(MEMORY[0x1E0C9D538] + 8) - v59 * v57;
          buf.origin.x = *MEMORY[0x1E0C9D538] - v58 * v55;
          buf.origin.y = v60;
          buf.size.width = v55;
          buf.size.height = v57;
          NU::RectT<long>::RectT(&v95, &buf, 2);
          v61 = v96;
          v86->_originalExtent.origin = v95;
          v86->_originalExtent.size = v61;
        }
        v89 = 0;
        v62 = -[NUVideoSourceNode loadAuxiliaryVideoTrackProperties:](v86, "loadAuxiliaryVideoTrackProperties:", &v89);
        v63 = v89;
        if (v62)
        {
          v88 = 0;
          v64 = -[NUVideoSourceNode loadAudioMixParameters:](v86, "loadAudioMixParameters:", &v88);
          v65 = v88;

          if (v64)
          {
            v4 = 1;
            v86->_loaded = 1;
          }
          else
          {
            +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to load audio mix parameters"), v86->_asset, v65);
            v4 = 0;
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
          v63 = v65;
        }
        else
        {
          +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to load auxiliary video track properties"), v86->_asset, v63);
          v4 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }

        v28 = v85;
      }
      else
      {
        +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("no format descriptions available"), v26);
        v4 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      +[NUError unsupportedError:object:](NUError, "unsupportedError:object:", CFSTR("asset is unplayable"), v86);
      v4 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)loadAudioMixParameters:(id *)a3
{
  NUVideoSourceNode *v4;
  void *v5;
  AVAudioMixInputParameters *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  void *v26;
  BOOL v27;
  NSObject *v28;
  AVAudioMixInputParameters *cinematicAudioMixInputParameters;
  void *v30;
  NUVideoSourceNode *v32;
  id *v33;
  void *v34;
  AVAudioMixInputParameters *v35;
  AVAudioMixInputParameters *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[16];
  uint64_t v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v4 = self;
  v45 = *MEMORY[0x1E0C80C00];
  +[NUVideoUtilities cinematicAudioTrackInAsset:](NUVideoUtilities, "cinematicAudioTrackInAsset:", self->_asset);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v27 = 1;
    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x1E0C8B260], "audioMixInputParametersWithTrack:", v5);
  v36 = (AVAudioMixInputParameters *)objc_claimAutoreleasedReturnValue();
  +[NUVideoUtilities metadataTrackWithCinematicAudioDataInAsset:](NUVideoUtilities, "metadataTrackWithCinematicAudioDataInAsset:", v4->_asset);
  v6 = (AVAudioMixInputParameters *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_344);
    v28 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Missing cinematic audio metadata track, continuing with default audio mix paramaters", buf, 2u);
    }
    goto LABEL_27;
  }
  *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
  v42 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v43 = 0;
  +[NUVideoUtilities readTimedMetadataGroupAtTime:fromTrack:outputSettings:videoComposition:error:](NUVideoUtilities, "readTimedMetadataGroupAtTime:fromTrack:outputSettings:videoComposition:error:", buf, v6, 0, 0, &v43);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v43;
  if (!v7)
  {
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Could not read timed metadata group at time zero from cinematic audio metadata track"), v6, v8);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:

    v27 = 0;
    cinematicAudioMixInputParameters = v6;
    v6 = v36;
    goto LABEL_33;
  }
  v32 = v4;
  v33 = a3;
  objc_msgSend(v7, "items");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9
    || (v10 = (void *)v9,
        objc_msgSend(v7, "items"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "count"),
        v11,
        v10,
        !v12))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_344);
    v13 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Missing cinematic audio metadata group items, continuing with default audio mix paramaters", buf, 2u);
    }
  }
  v34 = v7;
  v35 = v6;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v7, "items");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (!v15)
    goto LABEL_21;
  v16 = v15;
  v17 = *(_QWORD *)v38;
  while (2)
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v38 != v17)
        objc_enumerationMutation(v14);
      v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
      objc_msgSend(v19, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", kCinematicAudioMetadataIdentifier);

      if (v21)
      {
        objc_msgSend(v19, "dataType");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.metadata.datatype.raw-data"));

        if ((v23 & 1) != 0)
        {
          objc_msgSend(v19, "dataValue");
          v24 = objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            v25 = (void *)v24;
            objc_msgSend(MEMORY[0x1E0C8B048], "cinematicAudioEffectWithData:", v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[AVAudioMixInputParameters addEffect:](v36, "addEffect:", v26);

            continue;
          }
          +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 3, CFSTR("Missing cinematic audio metadata data value"), v19);
          *v33 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v19, "dataType");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 2, CFSTR("Expected cinematic audio metadata as raw data"), v30);
          *v33 = (id)objc_claimAutoreleasedReturnValue();

        }
        v6 = v35;
        goto LABEL_32;
      }
    }
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    if (v16)
      continue;
    break;
  }
LABEL_21:

  v6 = v35;
  v4 = v32;
LABEL_27:
  cinematicAudioMixInputParameters = v4->_cinematicAudioMixInputParameters;
  v4->_cinematicAudioMixInputParameters = v36;
  v27 = 1;
LABEL_33:

LABEL_34:
  return v27;
}

- (BOOL)loadAuxiliaryVideoTrackProperties:(id *)a3
{
  NSDictionary *v4;
  __objc2_class **v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  __objc2_class **v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _NUAVAssetTrackAuxiliaryVideoTrackProperties *v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  NSDictionary *v26;
  NSDictionary *auxiliaryVideoTrackProperties;
  NSObject *v29;
  void *v30;
  void *specific;
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
  id v46;
  NSDictionary *obj;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  NUVideoSourceNode *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint8_t v61[128];
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_551();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v30;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v37 = (void *)MEMORY[0x1E0CB3978];
        v38 = v36;
        objc_msgSend(v37, "callStackSymbols");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v63 = v36;
        v64 = 2114;
        v65 = v40;
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
      v63 = v35;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode loadAuxiliaryVideoTrackProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 330, CFSTR("Invalid parameter not satisfying: %s"), v41, v42, v43, v44, (uint64_t)"error != NULL");
  }
  v46 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(&unk_1E50A37A8, "arrayByAddingObjectsFromArray:", &unk_1E50A37C0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = self;
  objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A7A8], self->_asset);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v4 = (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
  v49 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (!v49)
    goto LABEL_38;
  v48 = *(_QWORD *)v57;
  v5 = off_1E505E000;
  obj = v4;
LABEL_4:
  v6 = 0;
  while (1)
  {
    if (*(_QWORD *)v57 != v48)
      objc_enumerationMutation(obj);
    v7 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v6);
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v8 = v50;
    v9 = -[__CFString countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    if (v9)
      break;
LABEL_36:

    if (++v6 == v49)
    {
      v4 = obj;
      v49 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      if (!v49)
      {
LABEL_38:

        v25 = v46;
        v26 = (NSDictionary *)v46;
        auxiliaryVideoTrackProperties = v51->_auxiliaryVideoTrackProperties;
        v51->_auxiliaryVideoTrackProperties = v26;
        LOBYTE(v21) = 1;
        goto LABEL_40;
      }
      goto LABEL_4;
    }
  }
  v10 = v9;
  v11 = v5;
  v12 = *(_QWORD *)v53;
LABEL_9:
  v13 = 0;
  while (1)
  {
    if (*(_QWORD *)v53 != v12)
      objc_enumerationMutation(v8);
    v14 = objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v13), "integerValue");
    NUMediaCharacteristicForAuxiliaryImageType(v14);
    v15 = (_NUAVAssetTrackAuxiliaryVideoTrackProperties *)objc_claimAutoreleasedReturnValue();
    if (v15 && objc_msgSend(v7, "hasMediaCharacteristic:", v15))
    {
      v16 = CFSTR("Invalid");
      if (v14 <= 0xC)
        v16 = off_1E5060F88[v14];
      v17 = v16;
    }
    else
    {
      v17 = 0;
    }
    if (v14 != 2)
    {
      if (v17)
        goto LABEL_29;
      goto LABEL_23;
    }
    if (v17)
      goto LABEL_26;
    -[__objc2_class metadataTrackWithPortraitVideoDataInAsset:](v11[124], "metadataTrackWithPortraitVideoDataInAsset:", v51->_asset);
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
      break;
LABEL_23:

    if (v10 == ++v13)
    {
      v10 = -[__CFString countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      if (v10)
        goto LABEL_9;
      v5 = v11;
      goto LABEL_36;
    }
  }
  v19 = (void *)v18;
  v17 = CFSTR("Disparity");
  v20 = CFSTR("Disparity");

LABEL_26:
  v5 = v11;
  -[__objc2_class firstEnabledVideoTrackInAsset:error:](v11[124], "firstEnabledVideoTrackInAsset:error:", v51->_asset, a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    if ((-[__objc2_class track:hasSamplesForEachSampleInTrack:](v11[124], "track:hasSamplesForEachSampleInTrack:", v7, v21) & 1) != 0)
    {

LABEL_29:
      v15 = objc_alloc_init(_NUAVAssetTrackAuxiliaryVideoTrackProperties);
      -[_NUAVAssetTrackAuxiliaryVideoTrackProperties setTrackID:](v15, "setTrackID:", objc_msgSend(v7, "trackID"));
      v5 = v11;
      v22 = -[__objc2_class naturalSizeOfTrack:oriented:](v11[124], "naturalSizeOfTrack:oriented:", v7, 0);
      -[_NUAVAssetTrackAuxiliaryVideoTrackProperties setSize:](v15, "setSize:", v22, v23);
      objc_msgSend(v46, "setObject:forKeyedSubscript:", v15, v17);
      v8 = v17;
    }
    else
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_344);
      v24 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v7;
        _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Detected disparity track with missing samples. Cinematic effect will be disabled. %@", buf, 0xCu);
      }

    }
    goto LABEL_36;
  }

  v25 = v46;
  v4 = obj;
  auxiliaryVideoTrackProperties = obj;
LABEL_40:

  return (char)v21;
}

- (BOOL)load:(id *)a3
{
  BOOL v3;
  NSObject *queue;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  if (self->_loaded)
  {
    v3 = 1;
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__NUVideoSourceNode_load___block_invoke;
    block[3] = &unk_1E5063750;
    block[4] = self;
    block[5] = &v7;
    block[6] = a3;
    dispatch_sync(queue, block);
    v3 = *((_BYTE *)v8 + 24) != 0;
  }
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (id)asset:(id *)a3
{
  AVAsset *v4;

  if (-[NUVideoSourceNode load:](self, "load:", a3))
    v4 = self->_asset;
  else
    v4 = 0;
  return v4;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v3;
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

  v3 = self;
  v24 = *MEMORY[0x1E0C80C00];
  if (!LOBYTE(self[8].var0))
  {
    NUAssertLogger_551();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ not loaded"), v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v5;
      _os_log_error_impl(&dword_1A6553000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
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
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode duration]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 414, CFSTR("%@ not loaded"), v16, v17, v18, v19, (uint64_t)v3);
  }
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 224);
  return self;
}

- (BOOL)isHDR
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_colorProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0C8AF40]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C8AF48]);

  return v3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)pixelSizeWithSourceOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t width;
  int64_t *p_height;
  int64_t v11;
  int64_t v12;
  BOOL v13;
  int64_t v14;
  int64_t v15;
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
  int64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_loaded)
  {
    NUAssertLogger_551();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ not loaded"), self);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v17;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
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
        v35 = v23;
        v36 = 2114;
        v37 = v27;
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
      v35 = v22;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode pixelSizeWithSourceOptions:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 425, CFSTR("%@ not loaded"), v28, v29, v30, v31, (uint64_t)self);
  }
  v5 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (NUAuxiliaryImageTypeFromString(v6) && NUAuxiliaryImageTypeFromString(v6) != 1)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_auxiliaryVideoTrackProperties, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    width = objc_msgSend(v8, "size");
    v12 = v11;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("applyCleanAperture"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "nu_pixelRect");
      width = v32;
      p_height = &v33;
    }
    else
    {
      p_height = &self->_originalExtent.size.height;
      width = self->_originalExtent.size.width;
      if (width)
        v13 = self->_originalExtent.size.height == 0;
      else
        v13 = 1;
      if (v13)
      {
        p_height = &self->_size.height;
        width = self->_size.width;
      }
    }
    v12 = *p_height;
  }

  v14 = width;
  v15 = v12;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- ($209B98C1CDF2DEBD503CBDE3C0ED7C90)cleanAperture
{
  $209B98C1CDF2DEBD503CBDE3C0ED7C90 *v3;
  $0AC6E346AE4835514AAA8AC86D8F4844 v4;
  NSObject *v5;
  void *v6;
  void *specific;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v3 = self;
  v25 = *MEMORY[0x1E0C80C00];
  if (!LOBYTE(self[6].var0.var0))
  {
    NUAssertLogger_551();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ not loaded"), v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v6;
      _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v9)
      {
        v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v13 = (void *)MEMORY[0x1E0CB3978];
        v14 = v12;
        objc_msgSend(v13, "callStackSymbols");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v12;
        v23 = 2114;
        v24 = v16;
        _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v11;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode cleanAperture]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 448, CFSTR("%@ not loaded"), v17, v18, v19, v20, (uint64_t)v3);
  }
  v4 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[8].var1.var1;
  retstr->var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[8].var0.var1;
  retstr->var1 = v4;
  return self;
}

- (id)_evaluateVideo:(id *)a3
{
  NUVideoSourceNode *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v14;
  NSObject *v15;
  AVAsset *asset;
  uint64_t v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __objc2_class **v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  __objc2_class *v29;
  _BOOL4 v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *specific;
  NSObject *v58;
  _BOOL4 v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  id obj;
  id obja;
  NUVideoSourceNode *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  id v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  void *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  id v110;
  CMTime time2;
  _BYTE time1[32];
  __int128 v113;
  _OWORD v114[3];
  uint8_t buf[16];
  _OWORD v116[2];
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  id v125;
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  uint8_t v131[32];
  __int128 v132;
  _QWORD v133[12];

  v133[9] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_551();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v131 = 138543362;
      *(_QWORD *)&v131[4] = v56;
      _os_log_error_impl(&dword_1A6553000, v55, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v131, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
    v58 = objc_claimAutoreleasedReturnValue();
    v59 = os_log_type_enabled(v58, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v59)
      {
        v62 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v63 = (void *)MEMORY[0x1E0CB3978];
        v64 = v62;
        objc_msgSend(v63, "callStackSymbols");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "componentsJoinedByString:", CFSTR("\n"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v131 = 138543618;
        *(_QWORD *)&v131[4] = v62;
        *(_WORD *)&v131[12] = 2114;
        *(_QWORD *)&v131[14] = v66;
        _os_log_error_impl(&dword_1A6553000, v58, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v131, 0x16u);

      }
    }
    else if (v59)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "componentsJoinedByString:", CFSTR("\n"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v131 = 138543362;
      *(_QWORD *)&v131[4] = v61;
      _os_log_error_impl(&dword_1A6553000, v58, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v131, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode _evaluateVideo:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 454, CFSTR("Invalid parameter not satisfying: %s"), v67, v68, v69, v70, (uint64_t)"error != nil");
  }
  v4 = self;
  if (!-[NUVideoSourceNode load:](self, "load:"))
  {
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("[NUVideoSourceNode _evaluateVideo] asset failed to load"), 0, *a3);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0C8B268], "composition");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v97)
  {
    +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 1, CFSTR("[NUVideoSourceNode _evaluateVideo] failed to get new composition"), 0);
    v14 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_85;
  }
  v5 = *MEMORY[0x1E0C8A7A8];
  v133[0] = *MEMORY[0x1E0C8A808];
  v133[1] = v5;
  v94 = v5;
  v6 = *MEMORY[0x1E0C8A7F8];
  v90 = *MEMORY[0x1E0C8A7A0];
  v133[2] = *MEMORY[0x1E0C8A7A0];
  v133[3] = v6;
  v7 = *MEMORY[0x1E0C8A7F0];
  v133[4] = *MEMORY[0x1E0C8A7B8];
  v133[5] = v7;
  v8 = *MEMORY[0x1E0C8A7D0];
  v133[6] = *MEMORY[0x1E0C8A800];
  v133[7] = v8;
  v133[8] = *MEMORY[0x1E0C8A7E0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v133, 9);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUVideoUtilities firstEnabledVideoTrackInAsset:error:](NUVideoUtilities, "firstEnabledVideoTrackInAsset:error:", v4->_asset, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    v14 = 0;
    goto LABEL_84;
  }
  v132 = 0u;
  memset(v131, 0, sizeof(v131));
  objc_msgSend(v10, "timeRange");
  +[NUVideoUtilities metadataTrackWithPortraitVideoDataInAsset:](NUVideoUtilities, "metadataTrackWithPortraitVideoDataInAsset:", v4->_asset);
  v12 = objc_claimAutoreleasedReturnValue();
  v78 = (void *)v12;
  v74 = a3;
  if (v12
    && !+[NUVideoUtilities track:hasSamplesForEachSampleInTrack:](NUVideoUtilities, "track:hasSamplesForEachSampleInTrack:", v12, v11))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_344);
    v15 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Detected metadata track with missing samples. Cinematic effect will be disabled.", buf, 2u);
    }
    v88 = 1;
  }
  else
  {
    v88 = 0;
  }
  asset = v4->_asset;
  v125 = 0;
  +[NUVideoUtilities auxiliaryTrackInAsset:ofType:error:](NUVideoUtilities, "auxiliaryTrackInAsset:ofType:error:", asset, 2, &v125);
  v17 = objc_claimAutoreleasedReturnValue();
  v76 = v125;
  if (v17
    && !+[NUVideoUtilities track:hasSamplesForEachSampleInTrack:](NUVideoUtilities, "track:hasSamplesForEachSampleInTrack:", v17, v11))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_344);
    v18 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Detected disparity track with missing samples. Cinematic effect will be disabled.", buf, 2u);
    }
    v88 = 1;
  }
  v96 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  v19 = v9;
  v79 = v11;
  v77 = (void *)v17;
  v72 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v121, v130, 16);
  v75 = v9;
  if (!v72)
    goto LABEL_60;
  v20 = *(_QWORD *)v122;
  v82 = v4;
  v86 = (id)*MEMORY[0x1E0C8A760];
  v71 = *(_QWORD *)v122;
  obj = v19;
  do
  {
    v21 = 0;
    do
    {
      if (*(_QWORD *)v122 != v20)
        objc_enumerationMutation(v19);
      v73 = v21;
      v22 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * v21);
      v117 = 0u;
      v118 = 0u;
      v119 = 0u;
      v120 = 0u;
      objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", v22, v4->_asset);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v117, v129, 16);
      v25 = off_1E505E000;
      if (!v24)
        goto LABEL_58;
      v26 = v24;
      v92 = *(_QWORD *)v118;
      while (2)
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v118 != v92)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * i);
          memset(v116, 0, sizeof(v116));
          *(_OWORD *)buf = 0u;
          v29 = v25[124];
          if (v28)
            objc_msgSend(v28, "timeRange");
          else
            memset(v114, 0, sizeof(v114));
          *(_OWORD *)time1 = *(_OWORD *)v131;
          *(_OWORD *)&time1[16] = *(_OWORD *)&v131[16];
          v113 = v132;
          -[__objc2_class conformRange:inRange:](v29, "conformRange:inRange:", v114, time1);
          if ((buf[12] & 1) != 0)
          {
            v30 = 0;
            if ((BYTE4(v116[1]) & 1) != 0
              && !*((_QWORD *)&v116[1] + 1)
              && (*((_QWORD *)&v116[0] + 1) & 0x8000000000000000) == 0)
            {
              *(_OWORD *)time1 = *(_OWORD *)((char *)v116 + 8);
              *(_QWORD *)&time1[16] = *((_QWORD *)&v116[1] + 1);
              time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
              v30 = CMTimeCompare((CMTime *)time1, &time2) == 0;
            }
          }
          else
          {
            v30 = 0;
          }
          v31 = !v30;
          if (objc_msgSend(v22, "isEqualToString:", v94)
            && objc_msgSend(v28, "hasMediaCharacteristic:", v86))
          {
            v31 = (v88 | v30) ^ 1;
          }
          if (objc_msgSend(v22, "isEqualToString:", v8)
            && -[__objc2_class metadataTrackContainsPortraitVideoData:](v25[124], "metadataTrackContainsPortraitVideoData:", v28))
          {
            v31 &= v88 ^ 1;
          }
          if (objc_msgSend(v22, "isEqualToString:", v8))
          {
            if ((v31 & ~-[__objc2_class metadataTrackContainsLegacyCinematicAudioData:](v25[124], "metadataTrackContainsLegacyCinematicAudioData:", v28) & 1) == 0)continue;
          }
          else if (!v31)
          {
            continue;
          }
          objc_msgSend(v97, "addMutableTrackWithMediaType:preferredTrackID:", v22, objc_msgSend(v28, "trackID"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v32, "trackID"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v28, "trackID"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "setObject:forKeyedSubscript:", v33, v34);

          if (objc_msgSend(v22, "isEqualToString:", v90))
          {
            objc_msgSend(v32, "setAlternateGroupID:", objc_msgSend(v28, "alternateGroupID"));
            objc_msgSend(v28, "languageCode");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setLanguageCode:", v35);

          }
          objc_msgSend(v32, "setEnabled:", objc_msgSend(v28, "isEnabled"));
          v110 = 0;
          *(_OWORD *)time1 = *(_OWORD *)buf;
          *(_OWORD *)&time1[16] = v116[0];
          v113 = v116[1];
          time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
          objc_msgSend(v32, "insertTimeRange:ofTrack:atTime:error:", time1, v28, &time2, &v110);
          v36 = v110;
          if (v36)
          {
            v54 = v36;
            +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("unable to insert time range"), v82, v36);
            *v74 = (id)objc_claimAutoreleasedReturnValue();

            v14 = 0;
            goto LABEL_83;
          }

          v25 = off_1E505E000;
        }
        v26 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v117, v129, 16);
        if (v26)
          continue;
        break;
      }
LABEL_58:

      v21 = v73 + 1;
      v19 = obj;
      v4 = v82;
      v20 = v71;
    }
    while (v73 + 1 != v72);
    v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v130, 16);
  }
  while (v72);
LABEL_60:

  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", v90, v4->_asset);
  obja = (id)objc_claimAutoreleasedReturnValue();
  v84 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v106, v128, 16);
  if (v84)
  {
    v83 = *(_QWORD *)v107;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v107 != v83)
          objc_enumerationMutation(obja);
        v85 = v37;
        v38 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v37);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v38, "trackID"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "objectForKeyedSubscript:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "intValue");

        objc_msgSend(v97, "trackWithTrackID:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = 0u;
        v103 = 0u;
        v104 = 0u;
        v105 = 0u;
        v91 = v38;
        objc_msgSend(v38, "availableTrackAssociationTypes");
        v87 = (id)objc_claimAutoreleasedReturnValue();
        v93 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v102, v127, 16);
        if (v93)
        {
          v89 = *(_QWORD *)v103;
          do
          {
            v43 = 0;
            do
            {
              if (*(_QWORD *)v103 != v89)
                objc_enumerationMutation(v87);
              v95 = v43;
              v44 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * v43);
              v98 = 0u;
              v99 = 0u;
              v100 = 0u;
              v101 = 0u;
              objc_msgSend(MEMORY[0x1E0D75130], "associatedTracksOfTypeForTrack:trackAssociationType:", v91, v44);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v98, v126, 16);
              if (v46)
              {
                v47 = v46;
                v48 = *(_QWORD *)v99;
                do
                {
                  for (j = 0; j != v47; ++j)
                  {
                    if (*(_QWORD *)v99 != v48)
                      objc_enumerationMutation(v45);
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * j), "trackID"));
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v96, "objectForKeyedSubscript:", v50);
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    v52 = objc_msgSend(v51, "intValue");

                    objc_msgSend(v97, "trackWithTrackID:", v52);
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "addTrackAssociationToTrack:type:", v53, v44);

                  }
                  v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v98, v126, 16);
                }
                while (v47);
              }

              v43 = v95 + 1;
            }
            while (v95 + 1 != v93);
            v93 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v102, v127, 16);
          }
          while (v93);
        }

        v37 = v85 + 1;
      }
      while (v85 + 1 != v84);
      v84 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v106, v128, 16);
    }
    while (v84);
  }

  v14 = v97;
LABEL_83:
  v9 = v75;

  v11 = v79;
LABEL_84:

LABEL_85:
  return v14;
}

- (id)_evaluateVideoCompositionWithSourceOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  float v11;
  float v12;
  CMTime *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v20;
  void *v21;
  void *specific;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CMTime time1;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  CMTime v40;
  CMTime v41;
  CMTime v42;
  CMTime v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  CMTime time2;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    NUAssertLogger_551();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time2.value) = 138543362;
      *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v21;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time2, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v28 = (void *)MEMORY[0x1E0CB3978];
        v29 = v27;
        objc_msgSend(v28, "callStackSymbols");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(time2.value) = 138543618;
        *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v27;
        LOWORD(time2.flags) = 2114;
        *(_QWORD *)((char *)&time2.flags + 2) = v31;
        _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time2, 0x16u);

      }
    }
    else if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time2.value) = 138543362;
      *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v26;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time2, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode _evaluateVideoCompositionWithSourceOptions:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 594, CFSTR("Invalid parameter not satisfying: %s"), v32, v33, v34, v35, (uint64_t)"error != NULL");
  }
  v7 = v6;
  -[NURenderNode outputVideo:](self, "outputVideo:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[NUVideoUtilities firstEnabledVideoTrackInAsset:error:](NUVideoUtilities, "firstEnabledVideoTrackInAsset:error:", v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v14 = 0;
LABEL_19:

      goto LABEL_20;
    }
    v10 = objc_alloc_init(MEMORY[0x1E0C8B288]);
    objc_msgSend(v9, "naturalSize");
    objc_msgSend(v10, "setRenderSize:");
    objc_msgSend(v10, "setSourceTrackIDForFrameTiming:", objc_msgSend(v9, "trackID"));
    objc_msgSend(v9, "minFrameDuration");
    if ((v48 & 1) != 0)
    {
      objc_msgSend(v9, "minFrameDuration");
      v44 = v46;
      v45 = v47;
      v13 = (CMTime *)&v44;
    }
    else
    {
      objc_msgSend(v9, "nominalFrameRate");
      if (v11 <= 0.0)
      {
        CMTimeMake(&v41, 1, 30);
        v40 = v41;
        v13 = &v40;
      }
      else
      {
        objc_msgSend(v9, "nominalFrameRate");
        CMTimeMakeWithSeconds(&v43, 1.0 / v12, 600);
        v42 = v43;
        v13 = &v42;
      }
    }
    objc_msgSend(v10, "setFrameDuration:", v13);
    if (v10)
    {
      objc_msgSend(v10, "frameDuration");
      if ((v38 & 0x100000000) != 0)
      {
        objc_msgSend(v10, "frameDuration");
        time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
        if (CMTimeCompare(&time1, &time2) > 0)
        {
          +[NUVideoCompositionInstruction defaultInstructionForAsset:error:](NUVideoCompositionInstruction, "defaultInstructionForAsset:error:", v8, a4);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v15;
          if (v15)
          {
            v49 = v15;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setInstructions:", v17);

            objc_msgSend(v16, "requiredSourceSampleDataTrackIDs");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setSourceSampleDataTrackIDs:", v18);

            v14 = v10;
          }
          else
          {
            v14 = 0;
          }

          goto LABEL_18;
        }
      }
    }
    else
    {
      v37 = 0;
      v38 = 0;
      v39 = 0;
    }
    +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("Invalid frame duration for video track"), v9);
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

    goto LABEL_19;
  }
  v14 = 0;
LABEL_20:

  return v14;
}

- (BOOL)supportsPipelineState:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  __CFString *v9;
  BOOL v10;
  __CFString *v11;
  NSObject *v13;
  void *v14;
  void *specific;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!a4)
  {
    NUAssertLogger_551();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v14;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v21 = (void *)MEMORY[0x1E0CB3978];
        v22 = v20;
        objc_msgSend(v21, "callStackSymbols");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v20;
        v31 = 2114;
        v32 = v24;
        _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v19;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode supportsPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 640, CFSTR("Invalid parameter not satisfying: %s"), v25, v26, v27, v28, (uint64_t)"error != NULL");
  }
  v6 = v5;
  v7 = objc_msgSend(v5, "auxiliaryImageType");
  if ((unint64_t)(v7 - 5) >= 4)
  {
    if (!v7 && (objc_msgSend(v6, "evaluationMode") == 2 || objc_msgSend(v6, "evaluationMode") == 3))
    {
      +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("expected a valid auxiliaryImageType during render"), v6);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v8 = objc_msgSend(v6, "auxiliaryImageType");
    if (v8 > 0xC)
      v9 = CFSTR("Invalid");
    else
      v9 = off_1E5060F88[v8];
    v11 = v9;
    +[NUError unsupportedError:object:](NUError, "unsupportedError:object:", CFSTR("auxiliary image is not supported"), v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v10 = 0;
  }

  return v10;
}

- (id)preparedNodeWithSourceContainer:(id)a3 pipelineState:(id)a4 pipelineSettings:(id)a5 sourceSettings:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  NSDictionary *auxiliaryVideoTrackProperties;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  NSObject *v29;
  void *v30;
  void *specific;
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
  objc_super v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!a7)
  {
    NUAssertLogger_551();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v30;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v37 = (void *)MEMORY[0x1E0CB3978];
        v38 = v36;
        objc_msgSend(v37, "callStackSymbols");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v36;
        v48 = 2114;
        v49 = v40;
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
      v47 = v35;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode preparedNodeWithSourceContainer:pipelineState:pipelineSettings:sourceSettings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 676, CFSTR("Invalid parameter not satisfying: %s"), v41, v42, v43, v44, (uint64_t)"error != nil");
  }
  v16 = v15;
  if (!-[NUVideoSourceNode load:](self, "load:", a7)
    || !-[NUVideoSourceNode supportsPipelineState:error:](self, "supportsPipelineState:error:", v13, a7))
  {
    goto LABEL_15;
  }
  v17 = objc_msgSend(v13, "auxiliaryImageType");
  if (v17 >= 2)
  {
    v18 = v17;
    auxiliaryVideoTrackProperties = self->_auxiliaryVideoTrackProperties;
    if (v17 > 0xC)
      v20 = CFSTR("Invalid");
    else
      v20 = off_1E5060F88[v17];
    v21 = v20;
    -[NSDictionary objectForKeyedSubscript:](auxiliaryVideoTrackProperties, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {

      goto LABEL_10;
    }
    v24 = (void *)MEMORY[0x1E0CB3940];
    if (v18 > 0xC)
      v25 = CFSTR("Invalid");
    else
      v25 = off_1E5060F88[v18];
    v26 = v25;
    objc_msgSend(v24, "stringWithFormat:", CFSTR("Requested auxiliary track type %@ but no associated track property found"), v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    +[NUError invalidError:object:](NUError, "invalidError:object:", v27, v13);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
    v23 = 0;
    goto LABEL_16;
  }
LABEL_10:
  v45.receiver = self;
  v45.super_class = (Class)NUVideoSourceNode;
  -[NUSourceNode preparedNodeWithSourceContainer:pipelineState:pipelineSettings:sourceSettings:error:](&v45, sel_preparedNodeWithSourceContainer_pipelineState_pipelineSettings_sourceSettings_error_, v12, v13, v14, v16, a7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v23;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NUVideoSourceNode *v14;
  unint64_t v15;
  __CFString *v16;
  __CFString *v17;
  NUKeyFrameSourceNode *v18;
  NUPixelBufferSourceNode *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  NSDictionary *auxiliaryVideoTrackProperties;
  unint64_t v25;
  __CFString *v26;
  __CFString *v27;
  double v28;
  uint64_t v29;
  double v30;
  NUCISourceNode *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NUVideoSourceNode *v36;
  NUVideoSourceNode *v37;
  uint64_t v38;
  uint64_t v39;
  NUVideoSourceNode *v40;
  void *v41;
  NSObject *v43;
  void *v44;
  void *specific;
  NSObject *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  _BOOL4 v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  __CFString *v76;
  _BYTE v77[24];
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!a6)
  {
    NUAssertLogger_551();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v82 = v44;
      _os_log_error_impl(&dword_1A6553000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v47)
      {
        v50 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v51 = (void *)MEMORY[0x1E0CB3978];
        v52 = v50;
        objc_msgSend(v51, "callStackSymbols");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v82 = v50;
        v83 = 2114;
        v84 = v54;
        _os_log_error_impl(&dword_1A6553000, v46, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v47)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v82 = v49;
      _os_log_error_impl(&dword_1A6553000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode resolvedNodeWithCachedInputs:settings:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 705, CFSTR("Invalid parameter not satisfying: %s"), v55, v56, v57, v58, (uint64_t)"error != nil");
  }
  v13 = v12;
  if (!-[NUVideoSourceNode load:](self, "load:", a6)
    || !-[NUVideoSourceNode supportsPipelineState:error:](self, "supportsPipelineState:error:", v13, a6))
  {
    goto LABEL_40;
  }
  if (!objc_msgSend(v13, "evaluationMode") || objc_msgSend(v13, "evaluationMode") == 2)
  {
    v14 = self;
    goto LABEL_41;
  }
  if (objc_msgSend(v13, "evaluationMode") == 3)
  {
    if (objc_msgSend(v13, "auxiliaryImageType") == 10
      || objc_msgSend(v13, "auxiliaryImageType") == 1
      || !objc_msgSend(v13, "auxiliaryImageType"))
    {
      v17 = CFSTR("video");
    }
    else
    {
      v15 = objc_msgSend(v13, "auxiliaryImageType");
      if (v15 > 0xC)
        v16 = CFSTR("Invalid");
      else
        v16 = off_1E5060F88[v15];
      v17 = v16;
    }
    objc_msgSend(v13, "videoFrames");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[NUVideoSourceNode _settingsForPipelineState:](self, "_settingsForPipelineState:", v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v19 = -[NUPixelBufferSourceNode initWithPixelBuffer:settings:orientation:]([NUPixelBufferSourceNode alloc], "initWithPixelBuffer:settings:orientation:", objc_msgSend(v21, "pixelBuffer"), v22, -[NUVideoSourceNode sourceOrientation](self, "sourceOrientation"));
LABEL_28:

      goto LABEL_29;
    }
    v23 = objc_msgSend(v13, "auxiliaryImageType");
    if (v23 <= 9 && ((1 << v23) & 0x218) != 0)
    {
      auxiliaryVideoTrackProperties = self->_auxiliaryVideoTrackProperties;
      v25 = objc_msgSend(v13, "auxiliaryImageType");
      v76 = v17;
      if (v25 > 0xC)
        v26 = CFSTR("Invalid");
      else
        v26 = off_1E5060F88[v25];
      v27 = v26;
      -[NSDictionary objectForKeyedSubscript:](auxiliaryVideoTrackProperties, "objectForKeyedSubscript:", v27);
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = (double)objc_msgSend(v75, "size");
      objc_msgSend(v75, "size");
      v30 = (double)v29;
      v31 = [NUCISourceNode alloc];
      v32 = (void *)MEMORY[0x1E0C9DDC8];
      objc_msgSend(MEMORY[0x1E0C9DD80], "blackColor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "imageWithColor:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "imageByCroppingToRect:", 0.0, 0.0, v28, v30);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[NUCISourceNode initWithImage:settings:orientation:](v31, "initWithImage:settings:orientation:", v35, v22, -[NUVideoSourceNode sourceOrientation](self, "sourceOrientation"));

      v17 = v76;
      goto LABEL_28;
    }
    +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("unable to find video frame"), v17);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_40:
    v14 = 0;
    goto LABEL_41;
  }
  if (objc_msgSend(v13, "evaluationMode") != 1)
  {
    NUAssertLogger_551();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported pipelineState evaluation mode: %@"), v13);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v82 = v60;
      _os_log_error_impl(&dword_1A6553000, v59, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v61 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
    v62 = objc_claimAutoreleasedReturnValue();
    v63 = os_log_type_enabled(v62, OS_LOG_TYPE_ERROR);
    if (v61)
    {
      if (v63)
      {
        v66 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v67 = (void *)MEMORY[0x1E0CB3978];
        v68 = v66;
        objc_msgSend(v67, "callStackSymbols");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "componentsJoinedByString:", CFSTR("\n"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v82 = v66;
        v83 = 2114;
        v84 = v70;
        _os_log_error_impl(&dword_1A6553000, v62, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v63)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "componentsJoinedByString:", CFSTR("\n"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v82 = v65;
      _os_log_error_impl(&dword_1A6553000, v62, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode resolvedNodeWithCachedInputs:settings:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 779, CFSTR("Unsupported pipelineState evaluation mode: %@"), v71, v72, v73, v74, (uint64_t)v13);
  }
  if (!v13)
  {
    v78 = 0;
    v79 = 0;
    v80 = 0;
    goto LABEL_25;
  }
  objc_msgSend(v13, "time");
  if ((v79 & 0x100000000) == 0)
  {
LABEL_25:
    +[NUError unsupportedError:object:](NUError, "unsupportedError:object:", CFSTR("invalid frame time"), v13);
    v14 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_41;
  }
  -[NUVideoSourceNode _settingsForPipelineState:](self, "_settingsForPipelineState:", v13);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v18 = [NUKeyFrameSourceNode alloc];
  objc_msgSend(v13, "time");
  v19 = -[NUKeyFrameSourceNode initWithVideoSource:time:settings:orientation:](v18, "initWithVideoSource:time:settings:orientation:", self, v77, v17, -[NUVideoSourceNode sourceOrientation](self, "sourceOrientation"));
LABEL_29:

  -[NUSourceNode originalNode](self, "originalNode");
  v36 = (NUVideoSourceNode *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "auxiliaryImageType") == 2)
  {
    v37 = 0;
  }
  else
  {
    v38 = objc_msgSend(v13, "auxiliaryImageType");
    v37 = v36;
    if (v38 != 1)
    {
      v39 = objc_msgSend(v13, "auxiliaryImageType", v36);
      if (v36)
        v40 = v36;
      else
        v40 = self;
      if (v39)
        v37 = v40;
      else
        v37 = v36;
    }
  }
  -[NUSourceNode setOriginalNode:](v19, "setOriginalNode:", v37);
  -[NUSourceNode sourceDerivation](self, "sourceDerivation");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUSourceNode setSourceDerivation:](v19, "setSourceDerivation:", v41);

  -[NURenderNode setEvaluatedForMode:](v19, "setEvaluatedForMode:", objc_msgSend(v13, "evaluationMode"));
  v14 = v19;

LABEL_41:
  return v14;
}

- (id)_settingsForPipelineState:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSURL *URL;
  void *v8;
  void *v9;
  CFDictionaryRef v10;
  unint64_t v11;
  __CFString *v12;
  __CFString *v13;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 size;
  void *v15;
  _OWORD v17[2];
  CMTime time;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = v5;
  URL = self->_URL;
  if (URL)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", URL, CFSTR("identifier"));
    if (v4)
    {
LABEL_3:
      objc_msgSend(v4, "time");
      goto LABEL_6;
    }
  }
  else
  {
    -[NURenderNode settings](self, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("identifier"));

    if (v4)
      goto LABEL_3;
  }
  memset(&time, 0, sizeof(time));
LABEL_6:
  v10 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("time"));

  v11 = objc_msgSend(v4, "auxiliaryImageType");
  if (v11 > 0xC)
    v12 = CFSTR("Invalid");
  else
    v12 = off_1E5060F88[v11];
  v13 = v12;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("auxiliaryImageType"));

  if (self->_originalExtent.size.width && self->_originalExtent.size.height)
  {
    size = self->_originalExtent.size;
    v17[0] = self->_originalExtent.origin;
    v17[1] = size;
    objc_msgSend(MEMORY[0x1E0CB3B18], "nu_valueWithPixelRect:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("originalExtent"));

  }
  return v6;
}

- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5
{
  id v7;
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
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!a5)
  {
    NUAssertLogger_551();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
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
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 817, CFSTR("Invalid parameter not satisfying: %s"), v22, v23, v24, v25, (uint64_t)"error != nil");
  }
  v8 = v7;
  +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 5, CFSTR("Video node cannot generate a valid CIImage"), self);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

  return 0;
}

- (id)_evaluateImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _NUImageProperties *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
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
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    NUAssertLogger_551();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v22;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
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
        v38 = v28;
        v39 = 2114;
        v40 = v32;
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
      v38 = v27;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode _evaluateImagePropertiesWithSourceOptions:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 826, CFSTR("Invalid parameter not satisfying: %s"), v33, v34, v35, v36, (uint64_t)"error != NULL");
  }
  v7 = v6;
  -[NUSourceNode originalNode](self, "originalNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    -[NUVideoSourceNode _evaluateVideoPropertiesWithSourceOptions:error:](self, "_evaluateVideoPropertiesWithSourceOptions:error:", v7, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = objc_alloc_init(_NUImageProperties);
      -[_NUImageProperties setMetadata:](v12, "setMetadata:", MEMORY[0x1E0C9AA70]);
      objc_msgSend(v11, "colorProperties");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUColorSpace colorSpaceFromVideoColorProperties:](NUColorSpace, "colorSpaceFromVideoColorProperties:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_344);
        v15 = (void *)_NULogger;
        if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
        {
          v16 = v15;
          objc_msgSend(v11, "colorProperties");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v38 = v17;
          _os_log_impl(&dword_1A6553000, v16, OS_LOG_TYPE_DEFAULT, "Invalid video color properties: %{public}@, assuming sRGB.", buf, 0xCu);

        }
        +[NUColorSpace sRGBColorSpace](NUColorSpace, "sRGBColorSpace");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[_NUImageProperties setColorSpace:](v12, "setColorSpace:", v14);
      v18 = objc_msgSend(v11, "size");
      -[_NUImageProperties setSize:](v12, "setSize:", v18, v19);
      -[_NUImageProperties setOrientation:](v12, "setOrientation:", objc_msgSend(v11, "orientation"));
      -[_NUImageProperties setAlphaInfo:](v12, "setAlphaInfo:", 2);
      -[_NUImageProperties setComponentInfo:](v12, "setComponentInfo:", 0);

    }
    else
    {
      v12 = 0;
    }
    goto LABEL_15;
  }
  objc_msgSend(v8, "imageProperties:", a4);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    v12 = -[_NUImageProperties initWithProperties:]([_NUImageProperties alloc], "initWithProperties:", v10);
    -[_NUImageProperties resetAuxiliaryImageProperties](v12, "resetAuxiliaryImageProperties");
LABEL_15:

    goto LABEL_16;
  }
  v12 = 0;
LABEL_16:

  return v12;
}

- (id)_evaluateVideoPropertiesWithSourceOptions:(id)a3 error:(id *)a4
{
  id v6;
  _NUVideoProperties *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  int64_t epoch;
  _OWORD v21[4];
  _OWORD v22[4];
  _QWORD v23[2];
  __int128 v24;
  __int128 v25;

  v6 = a3;
  if (-[NUVideoSourceNode load:](self, "load:", a4))
  {
    v7 = objc_alloc_init(_NUVideoProperties);
    -[_NUVideoProperties setUrl:](v7, "setUrl:", self->_URL);
    -[_NUVideoProperties setMetadata:](v7, "setMetadata:", self->_metadata);
    -[_NUVideoProperties setTrackGroups:](v7, "setTrackGroups:", self->_trackGroups);
    -[_NUVideoProperties setTrackMetadata:](v7, "setTrackMetadata:", self->_trackMetadata);
    v8 = -[NUVideoSourceNode pixelSizeWithSourceOptions:](self, "pixelSizeWithSourceOptions:", v6);
    -[_NUVideoProperties setSize:](v7, "setSize:", v8, v9);
    -[_NUVideoProperties setOrientation:](v7, "setOrientation:", -[NUVideoSourceNode sourceOrientation](self, "sourceOrientation"));
    *(float *)&v10 = self->_nominalFrameRate;
    -[_NUVideoProperties setNominalFrameRate:](v7, "setNominalFrameRate:", v10);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("applyCleanAperture"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "nu_pixelRect");
      v23[0] = 0;
      v23[1] = 0;
      v24 = v25;
      v13 = v23;
    }
    else
    {
      -[NUVideoSourceNode cleanAperture](self, "cleanAperture");
      v22[0] = v22[2];
      v22[1] = v22[3];
      v13 = v22;
    }
    -[_NUVideoProperties setCleanAperture:](v7, "setCleanAperture:", v13);
    -[NUVideoSourceNode cleanAperture](self, "cleanAperture");
    v21[0] = v21[2];
    v21[1] = v21[3];
    -[_NUVideoProperties setOriginalCleanAperture:](v7, "setOriginalCleanAperture:", v21);
    -[_NUVideoProperties setOriginalSize:](v7, "setOriginalSize:", self->_size.width, self->_size.height);
    -[_NUVideoProperties setColorProperties:](v7, "setColorProperties:", self->_colorProperties);
    v19 = *(_OWORD *)&self->_livePhotoKeyFrameTime.value;
    epoch = self->_livePhotoKeyFrameTime.epoch;
    -[_NUVideoProperties setLivePhotoKeyFrameTime:](v7, "setLivePhotoKeyFrameTime:", &v19);
    -[NUVideoSourceNode duration](self, "duration");
    v15 = v17;
    v16 = v18;
    -[_NUVideoProperties setDuration:](v7, "setDuration:", &v15);
    -[_NUVideoProperties setAuxiliaryVideoTrackProperties:](v7, "setAuxiliaryVideoTrackProperties:", self->_auxiliaryVideoTrackProperties);
    -[_NUVideoProperties setCinematicAudioMixInputParameters:](v7, "setCinematicAudioMixInputParameters:", self->_cinematicAudioMixInputParameters);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_evaluateVideoAttributes:(id *)a3
{
  NUVideoAttributes *v4;
  _BYTE v6[24];

  if (!-[NUVideoSourceNode load:](self, "load:", a3))
    return 0;
  v4 = [NUVideoAttributes alloc];
  -[NUVideoSourceNode duration](self, "duration");
  return -[NUVideoAttributes initWithDuration:](v4, "initWithDuration:", v6);
}

- (id)_evaluateTimedMetadataSampleWithIdentifier:(id)a3 atTime:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  NURenderPipelineVideoMetadataSample *v17;
  void *v18;
  NURenderPipelineVideoMetadataSample *v19;
  __int128 v21;
  int64_t var3;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[NURenderNode outputVideo:](self, "outputVideo:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A7D0], v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (+[NUVideoUtilities metadataTrack:containsIdentifier:](NUVideoUtilities, "metadataTrack:containsIdentifier:", v15, v8))
          {
            v21 = *(_OWORD *)&a4->var0;
            var3 = a4->var3;
            +[NUVideoUtilities readTimedMetadataGroupAtTime:fromTrack:outputSettings:videoComposition:error:](NUVideoUtilities, "readTimedMetadataGroupAtTime:fromTrack:outputSettings:videoComposition:error:", &v21, v15, 0, 0, a5);
            v16 = objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              v18 = (void *)v16;
              v19 = [NURenderPipelineVideoMetadataSample alloc];
              v21 = *(_OWORD *)&a4->var0;
              var3 = a4->var3;
              v17 = -[NURenderPipelineVideoMetadataSample initWithFrameTime:metadataGroup:](v19, "initWithFrameTime:metadataGroup:", &v21, v18);

              goto LABEL_14;
            }
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v12)
          continue;
        break;
      }
    }
    v17 = 0;
LABEL_14:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)requiresVideoComposition
{
  return +[NUGlobalSettings videoCompositorDebugMode](NUGlobalSettings, "videoCompositorDebugMode") == 3;
}

- (BOOL)requiresAudioMix
{
  return 0;
}

- (NSDictionary)auxiliaryVideoTrackProperties
{
  return self->_auxiliaryVideoTrackProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryVideoTrackProperties, 0);
  objc_storeStrong((id *)&self->_cinematicAudioMixInputParameters, 0);
  objc_storeStrong((id *)&self->_colorProperties, 0);
  objc_storeStrong((id *)&self->_trackMetadata, 0);
  objc_storeStrong((id *)&self->_trackGroups, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_videoData, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __26__NUVideoSourceNode_load___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_load:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
