@implementation _NUStyleEngine

- (_NUStyleEngine)init
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *specific;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  objc_class *v22;
  uint64_t v23;
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
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_24428);
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_24428);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_24428);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v12 = (void *)MEMORY[0x1E0CB3978];
    v13 = v11;
    objc_msgSend(v12, "callStackSymbols");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v18 = (void *)MEMORY[0x1E0CB3978];
  v19 = specific;
  v13 = v16;
  objc_msgSend(v18, "callStackSymbols");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  v23 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[_NUStyleEngine init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2221, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (_NUStyleEngine)initWithUsage:(id)a3 metalCommandQueue:(id)a4 configuration:(id)a5 tuningParams:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _NUStyleEngine *v16;
  uint64_t v17;
  NSDictionary *tuningParams;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t sid;
  NSString *usage;
  MTLCommandQueue *metalCommandQueue;
  void *v25;
  NSObject *v27;
  _NUStyleEngine *v28;
  void *specific;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  _NUStyleEngine *v33;
  NSObject *v34;
  _NUStyleEngine *v35;
  void *v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  _NUStyleEngine *v40;
  NSObject *v41;
  _NUStyleEngine *v42;
  void *v43;
  NSObject *v44;
  _BOOL4 v45;
  void *v46;
  _NUStyleEngine *v47;
  _NUStyleEngine *v48;
  void *v49;
  _NUStyleEngine *v50;
  void *v51;
  NSString *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _NUStyleEngine *v57;
  void *v58;
  _NUStyleEngine *v59;
  void *v60;
  NSString *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _NUStyleEngine *v66;
  void *v67;
  _NUStyleEngine *v68;
  void *v69;
  NSString *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  objc_super v75;
  uint8_t buf[4];
  _NUStyleEngine *v77;
  __int16 v78;
  NSString *v79;
  __int16 v80;
  MTLCommandQueue *v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v12)
  {
    NUAssertLogger_24413();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "commandQueue != nil");
      v28 = (_NUStyleEngine *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v77 = v28;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        v48 = (_NUStyleEngine *)dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v49 = (void *)MEMORY[0x1E0CB3978];
        v50 = v48;
        objc_msgSend(v49, "callStackSymbols");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "componentsJoinedByString:", CFSTR("\n"));
        v52 = (NSString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v77 = v48;
        v78 = 2114;
        v79 = v52;
        _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v31)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
      v33 = (_NUStyleEngine *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v77 = v33;
      _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUStyleEngine initWithUsage:metalCommandQueue:configuration:tuningParams:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2225, CFSTR("Invalid parameter not satisfying: %s"), v53, v54, v55, v56, (uint64_t)"commandQueue != nil");
  }
  if (!v13)
  {
    NUAssertLogger_24413();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "config != nil");
      v35 = (_NUStyleEngine *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v77 = v35;
      _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
    if (v36)
    {
      if (v38)
      {
        v57 = (_NUStyleEngine *)dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v58 = (void *)MEMORY[0x1E0CB3978];
        v59 = v57;
        objc_msgSend(v58, "callStackSymbols");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "componentsJoinedByString:", CFSTR("\n"));
        v61 = (NSString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v77 = v57;
        v78 = 2114;
        v79 = v61;
        _os_log_error_impl(&dword_1A6553000, v37, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v38)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
      v40 = (_NUStyleEngine *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v77 = v40;
      _os_log_error_impl(&dword_1A6553000, v37, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUStyleEngine initWithUsage:metalCommandQueue:configuration:tuningParams:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2226, CFSTR("Invalid parameter not satisfying: %s"), v62, v63, v64, v65, (uint64_t)"config != nil");
  }
  v15 = v14;
  if (!v14)
  {
    NUAssertLogger_24413();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "params != nil");
      v42 = (_NUStyleEngine *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v77 = v42;
      _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
    if (v43)
    {
      if (v45)
      {
        v66 = (_NUStyleEngine *)dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v67 = (void *)MEMORY[0x1E0CB3978];
        v68 = v66;
        objc_msgSend(v67, "callStackSymbols");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "componentsJoinedByString:", CFSTR("\n"));
        v70 = (NSString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v77 = v66;
        v78 = 2114;
        v79 = v70;
        _os_log_error_impl(&dword_1A6553000, v44, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v45)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "componentsJoinedByString:", CFSTR("\n"));
      v47 = (_NUStyleEngine *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v77 = v47;
      _os_log_error_impl(&dword_1A6553000, v44, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUStyleEngine initWithUsage:metalCommandQueue:configuration:tuningParams:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2227, CFSTR("Invalid parameter not satisfying: %s"), v71, v72, v73, v74, (uint64_t)"params != nil");
  }
  v75.receiver = self;
  v75.super_class = (Class)_NUStyleEngine;
  v16 = -[_NUStyleEngine init](&v75, sel_init);
  objc_storeStrong((id *)&v16->_usage, a3);
  objc_storeStrong((id *)&v16->_metalCommandQueue, a4);
  objc_storeStrong((id *)&v16->_configuration, a5);
  v17 = objc_msgSend(v15, "copy");
  tuningParams = v16->_tuningParams;
  v16->_tuningParams = (NSDictionary *)v17;

  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
  v19 = (id)_NULogger;
  v16->_sid = os_signpost_id_make_with_pointer(v19, v16);

  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
  v20 = (id)_NULogger;
  v21 = v20;
  sid = v16->_sid;
  if (sid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    usage = v16->_usage;
    metalCommandQueue = v16->_metalCommandQueue;
    -[_NUStyleEngineConfiguration configurationDictionary](v16->_configuration, "configurationDictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v77 = v16;
    v78 = 2112;
    v79 = usage;
    v80 = 2048;
    v81 = metalCommandQueue;
    v82 = 2112;
    v83 = v25;
    _os_signpost_emit_with_name_impl(&dword_1A6553000, v21, OS_SIGNPOST_INTERVAL_BEGIN, sid, "_NUStyleEngine", "%p usage:%@ q:%p config:%@", buf, 0x2Au);

  }
  return v16;
}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t sid;
  NSString *usage;
  MTLCommandQueue *metalCommandQueue;
  objc_super v8;
  uint8_t buf[4];
  _NUStyleEngine *v10;
  __int16 v11;
  NSString *v12;
  __int16 v13;
  MTLCommandQueue *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
  v3 = (id)_NULogger;
  v4 = v3;
  sid = self->_sid;
  if (sid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    usage = self->_usage;
    metalCommandQueue = self->_metalCommandQueue;
    *(_DWORD *)buf = 134218498;
    v10 = self;
    v11 = 2112;
    v12 = usage;
    v13 = 2048;
    v14 = metalCommandQueue;
    _os_signpost_emit_with_name_impl(&dword_1A6553000, v4, OS_SIGNPOST_INTERVAL_END, sid, "_NUStyleEngine", "%p usage:%@ q:%p", buf, 0x20u);
  }

  v8.receiver = self;
  v8.super_class = (Class)_NUStyleEngine;
  -[_NUStyleEngine dealloc](&v8, sel_dealloc);
}

- (unsigned)processingType
{
  void *v3;
  char v4;
  void *v6;
  char v7;
  void *v8;
  int v9;

  -[_NUStyleEngine usage](self, "usage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("learn"));

  if ((v4 & 1) != 0)
    return 1;
  -[_NUStyleEngine usage](self, "usage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("apply"));

  if ((v7 & 1) != 0)
    return 6;
  -[_NUStyleEngine usage](self, "usage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("learn&apply"));

  if (v9)
    return 5;
  else
    return 0;
}

- (id)memoryDescriptor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("ProcessingType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_NUStyleEngine processingType](self, "processingType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D08A80]), "initWithMaxInputDimensions:inputPixelFormat:maxOutputDimensions:cmiResourceEnabled:processorSpecificOptions:", 0, 0, 0, 0, v4);
  -[CMIStyleEngineProcessor setUseLiveMetalAllocations:](self->_processor, "setUseLiveMetalAllocations:", 1);
  -[CMIStyleEngineProcessor externalMemoryDescriptorForConfiguration:](self->_processor, "externalMemoryDescriptorForConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)setupProcessor
{
  id v3;
  void *v4;
  CMIStyleEngineProcessor *v5;
  CMIStyleEngineProcessor *processor;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  _BOOL4 v13;
  const char *v14;
  NSObject *v15;
  int v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *specific;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE v36[12];
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (self->_processor)
  {
    NUAssertLogger_24413();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Already prepared!"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v36 = 138543362;
      *(_QWORD *)&v36[4] = v20;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v36, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v27 = (void *)MEMORY[0x1E0CB3978];
        v28 = v26;
        objc_msgSend(v27, "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v36 = 138543618;
        *(_QWORD *)&v36[4] = v26;
        v37 = 2114;
        v38 = v30;
        _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v36, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v36 = 138543362;
      *(_QWORD *)&v36[4] = v25;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v36, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUStyleEngine setupProcessor]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2300, CFSTR("Already prepared!"), v31, v32, v33, v34, *(uint64_t *)v36);
  }
  v3 = objc_alloc(MEMORY[0x1E0D08AF0]);
  -[_NUStyleEngine metalCommandQueue](self, "metalCommandQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (CMIStyleEngineProcessor *)objc_msgSend(v3, "initWithOptionalMetalCommandQueue:", v4);
  processor = self->_processor;
  self->_processor = v5;

  -[_NUStyleEngine configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "styleEngineConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMIStyleEngineProcessor setConfiguration:](self->_processor, "setConfiguration:", v8);

  -[_NUStyleEngine tuningParams](self, "tuningParams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMIStyleEngineProcessor setTuningParameters:](self->_processor, "setTuningParameters:", v9);

  v10 = -[CMIStyleEngineProcessor setup](self->_processor, "setup");
  if (v10)
  {
    v11 = v10;
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
    v12 = _NULogger;
    v13 = os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR);
    if (v13)
    {
      *(_DWORD *)v36 = 67109120;
      *(_DWORD *)&v36[4] = v11;
      v14 = "*** Failed to setup StyleEngine: %d";
      v15 = v12;
LABEL_12:
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, v14, v36, 8u);
      LOBYTE(v13) = 0;
    }
  }
  else
  {
    v16 = -[CMIStyleEngineProcessor prewarm](self->_processor, "prewarm");
    if (!v16)
    {
      LOBYTE(v13) = 1;
      return v13;
    }
    v17 = v16;
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
    v18 = _NULogger;
    v13 = os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR);
    if (v13)
    {
      *(_DWORD *)v36 = 67109120;
      *(_DWORD *)&v36[4] = v17;
      v14 = "*** Failed to prewarm StyleEngine: %d";
      v15 = v18;
      goto LABEL_12;
    }
  }
  return v13;
}

- (void)resetProcessor
{
  -[CMIStyleEngineProcessor resetState](self->_processor, "resetState");
  -[CMIStyleEngineProcessor purgeResources](self->_processor, "purgeResources");
  -[CMIStyleEngineProcessor setExternalMemoryResource:](self->_processor, "setExternalMemoryResource:", 0);
}

- (BOOL)matchesUsage:(id)a3 metalCommandQueue:(id)a4 configuration:(id)a5 tuning:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  BOOL v18;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  -[_NUStyleEngine usage](self, "usage");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v18 = v14 == v13
     && (-[_NUStyleEngine metalCommandQueue](self, "metalCommandQueue"),
         v15 = (id)objc_claimAutoreleasedReturnValue(),
         v15,
         v15 == v10)
     && (-[_NUStyleEngine configuration](self, "configuration"),
         v16 = (void *)objc_claimAutoreleasedReturnValue(),
         v17 = objc_msgSend(v16, "matchesConfiguration:", v11),
         v16,
         v17)
     && -[_NUStyleEngine matchesTuningParameters:](self, "matchesTuningParameters:", v12);

  return v18;
}

- (BOOL)matchesTuningParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  char v21;

  v4 = a3;
  -[_NUStyleEngine tuningParams](self, "tuningParams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WeightPlaneCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WeightPlaneCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntValue");

  if (v7 != v9)
    goto LABEL_5;
  -[_NUStyleEngine tuningParams](self, "tuningParams");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SpotlightCount_X"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SpotlightCount_X"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntValue");

  if (v12 != v14)
    goto LABEL_5;
  -[_NUStyleEngine tuningParams](self, "tuningParams");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("SpotlightCount_Y"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SpotlightCount_Y"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedIntValue");

  if (v17 == v19)
  {
    -[_NUStyleEngine tuningParams](self, "tuningParams");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToDictionary:", v4);

  }
  else
  {
LABEL_5:
    v21 = 0;
  }

  return v21;
}

- (NSString)usage
{
  return self->_usage;
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (_NUStyleEngineConfiguration)configuration
{
  return self->_configuration;
}

- (NSDictionary)tuningParams
{
  return self->_tuningParams;
}

- (CMIStyleEngineProcessor)processor
{
  return self->_processor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processor, 0);
  objc_storeStrong((id *)&self->_tuningParams, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_usage, 0);
}

+ (BOOL)usingSharedStyleEngineForUsage:(id)a3 withMetalCommandQueue:(id)a4 configuration:(id)a5 tuningParams:(id)a6 perform:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  objc_class *v16;
  uint64_t v17;
  _NUStyleEngineConfiguration *v18;
  void *v19;
  id v20;
  id v21;
  _NUStyleEngineConfiguration *v22;
  id v23;
  _NUStyleEngine *v24;
  NSObject *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v37;
  void *v38;
  id v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  _NUStyleEngine *v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _NUStyleEngineConfiguration *v49;
  id v50;
  uint8_t buf[4];
  _NUStyleEngine *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = -[_NUStyleEngineConfiguration initWithConfigurationDictionary:]([_NUStyleEngineConfiguration alloc], "initWithConfigurationDictionary:", v13);
  +[NURenderResourcePool shared](NURenderResourcePool, "shared");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __106___NUStyleEngine_usingSharedStyleEngineForUsage_withMetalCommandQueue_configuration_tuningParams_perform___block_invoke;
  v46[3] = &unk_1E5063E18;
  v20 = v11;
  v47 = v20;
  v21 = v12;
  v48 = v21;
  v22 = v18;
  v49 = v22;
  v23 = v14;
  v50 = v23;
  v42 = (void *)v17;
  objc_msgSend(v19, "checkOutResourceForKey:matching:", v17, v46);
  v24 = (_NUStyleEngine *)objc_claimAutoreleasedReturnValue();

  v40 = v21;
  if (v24)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
    v25 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134219010;
      v52 = v24;
      v53 = 2048;
      v54 = v21;
      v55 = 2112;
      v56 = v20;
      v57 = 2112;
      v58 = v13;
      v59 = 2112;
      v60 = v23;
      _os_log_debug_impl(&dword_1A6553000, v25, OS_LOG_TYPE_DEBUG, "Reusing _NUStyleEngine instance: %p, queue:%p usage:%@ config:%@ params:%@", buf, 0x34u);
    }
    v26 = v20;
    v27 = v15;
    v28 = v13;
    -[_NUStyleEngineConfiguration styleEngineConfiguration](v22, "styleEngineConfiguration", v40);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NUStyleEngine processor](v24, "processor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setConfiguration:", v29);

    -[_NUStyleEngine processor](v24, "processor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTuningParameters:", v23);

  }
  else
  {
    v24 = -[_NUStyleEngine initWithUsage:metalCommandQueue:configuration:tuningParams:]([_NUStyleEngine alloc], "initWithUsage:metalCommandQueue:configuration:tuningParams:", v20, v21, v22, v23, v21);
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
    v32 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134219010;
      v52 = v24;
      v53 = 2048;
      v54 = v21;
      v55 = 2112;
      v56 = v20;
      v57 = 2112;
      v58 = v13;
      v59 = 2112;
      v60 = v23;
      _os_log_debug_impl(&dword_1A6553000, v32, OS_LOG_TYPE_DEBUG, "Using new _NUStyleEngine instance: %p, queue:%p usage:%@ config:%@ params:%@", buf, 0x34u);
    }
    if (!-[_NUStyleEngine setupProcessor](v24, "setupProcessor"))
    {
      v36 = 0;
      v38 = (void *)v17;
      goto LABEL_14;
    }
    v26 = v20;
    v27 = v15;
    v28 = v13;
  }
  -[_NUStyleEngine metalCommandQueue](v24, "metalCommandQueue");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "device");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUStyleEngine memoryDescriptor](v24, "memoryDescriptor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __106___NUStyleEngine_usingSharedStyleEngineForUsage_withMetalCommandQueue_configuration_tuningParams_perform___block_invoke_482;
  v43[3] = &unk_1E5063E40;
  v24 = v24;
  v44 = v24;
  v45 = v27;
  v36 = +[_NUStyleEngineMemoryResource usingSharedMemoryResourceForDevice:withDescriptor:perform:](_NUStyleEngineMemoryResource, "usingSharedMemoryResourceForDevice:withDescriptor:perform:", v34, v35, v43);

  v15 = v27;
  -[_NUStyleEngine resetProcessor](v24, "resetProcessor");
  +[NURenderResourcePool shared](NURenderResourcePool, "shared");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v42;
  objc_msgSend(v37, "checkInResource:forKey:", v24, v42);

  v13 = v28;
  v20 = v26;
LABEL_14:

  return v36;
}

@end
