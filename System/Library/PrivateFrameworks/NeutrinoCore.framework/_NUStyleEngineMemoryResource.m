@implementation _NUStyleEngineMemoryResource

- (_NUStyleEngineMemoryResource)init
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
  _NUAssertFailHandler((uint64_t)"-[_NUStyleEngineMemoryResource init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2535, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (_NUStyleEngineMemoryResource)initWithDevice:(id)a3 descriptor:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _NUStyleEngineMemoryResource *v10;
  CMIExternalMemoryResource *v11;
  CMIExternalMemoryResource *resource;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t sid;
  NSObject *v18;
  _NUStyleEngineMemoryResource *v19;
  void *specific;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  _NUStyleEngineMemoryResource *v24;
  NSObject *v25;
  _NUStyleEngineMemoryResource *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  _NUStyleEngineMemoryResource *v31;
  _NUStyleEngineMemoryResource *v32;
  void *v33;
  _NUStyleEngineMemoryResource *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _NUStyleEngineMemoryResource *v41;
  void *v42;
  _NUStyleEngineMemoryResource *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  objc_super v50;
  uint8_t buf[4];
  _NUStyleEngineMemoryResource *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    NUAssertLogger_24413();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "device != nil");
      v19 = (_NUStyleEngineMemoryResource *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v19;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v32 = (_NUStyleEngineMemoryResource *)dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v33 = (void *)MEMORY[0x1E0CB3978];
        v34 = v32;
        objc_msgSend(v33, "callStackSymbols");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v32;
        v53 = 2114;
        v54 = v36;
        _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
      v24 = (_NUStyleEngineMemoryResource *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v24;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUStyleEngineMemoryResource initWithDevice:descriptor:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2539, CFSTR("Invalid parameter not satisfying: %s"), v37, v38, v39, v40, (uint64_t)"device != nil");
  }
  v9 = v8;
  if (!v8)
  {
    NUAssertLogger_24413();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "desc != nil");
      v26 = (_NUStyleEngineMemoryResource *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v26;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        v41 = (_NUStyleEngineMemoryResource *)dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v42 = (void *)MEMORY[0x1E0CB3978];
        v43 = v41;
        objc_msgSend(v42, "callStackSymbols");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v41;
        v53 = 2114;
        v54 = v45;
        _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
      v31 = (_NUStyleEngineMemoryResource *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v31;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUStyleEngineMemoryResource initWithDevice:descriptor:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2540, CFSTR("Invalid parameter not satisfying: %s"), v46, v47, v48, v49, (uint64_t)"desc != nil");
  }
  v50.receiver = self;
  v50.super_class = (Class)_NUStyleEngineMemoryResource;
  v10 = -[_NUStyleEngineMemoryResource init](&v50, sel_init);
  objc_storeStrong((id *)&v10->_device, a3);
  objc_storeStrong((id *)&v10->_descriptor, a4);
  v11 = (CMIExternalMemoryResource *)objc_alloc_init(MEMORY[0x1E0D08A88]);
  resource = v10->_resource;
  v10->_resource = v11;

  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
  v13 = (id)_NULogger;
  v10->_sid = os_signpost_id_make_with_pointer(v13, v10);

  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
  v14 = (id)_NULogger;
  v15 = v14;
  sid = v10->_sid;
  if (sid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 134217984;
    v52 = v10;
    _os_signpost_emit_with_name_impl(&dword_1A6553000, v15, OS_SIGNPOST_INTERVAL_BEGIN, sid, "_NUStyleEngineMemoryResource", "%p", buf, 0xCu);
  }

  return v10;
}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t sid;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  _NUStyleEngineMemoryResource *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
  v3 = (id)_NULogger;
  v4 = v3;
  sid = self->_sid;
  if (sid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    -[CMIExternalMemoryResource allocatorBackend](self->_resource, "allocatorBackend");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218240;
    v9 = self;
    v10 = 2048;
    v11 = objc_msgSend(v6, "memSize");
    _os_signpost_emit_with_name_impl(&dword_1A6553000, v4, OS_SIGNPOST_INTERVAL_END, sid, "_NUStyleEngineMemoryResource", "%p mem=%zu", buf, 0x16u);

  }
  v7.receiver = self;
  v7.super_class = (Class)_NUStyleEngineMemoryResource;
  -[_NUStyleEngineMemoryResource dealloc](&v7, sel_dealloc);
}

- (BOOL)setup
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D08B18]);
  objc_msgSend(v3, "setMemSize:", -[CMIExternalMemoryDescriptor memSize](self->_descriptor, "memSize"));
  objc_msgSend(v3, "setWireMemory:", 0);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLabel:", v5);

  objc_msgSend(v3, "setMemoryPoolId:", 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D08B10]), "initWithDevice:allocatorType:", self->_device, -[CMIExternalMemoryDescriptor allocatorType](self->_descriptor, "allocatorType"));
  v7 = objc_msgSend(v6, "setupWithDescriptor:", v3);
  if (v7)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
    v8 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 67109120;
      v10[1] = v7;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Failed to setup FigMetalAllocatorBackend, err = %d", (uint8_t *)v10, 8u);
    }
  }
  else
  {
    -[CMIExternalMemoryResource setAllocatorBackend:](self->_resource, "setAllocatorBackend:", v6);
  }

  return v7 == 0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CMIExternalMemoryResource allocatorBackend](self->_resource, "allocatorBackend");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p size: %zu>"), v4, self, objc_msgSend(v5, "memSize"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (MTLDevice)device
{
  return self->_device;
}

- (CMIExternalMemoryDescriptor)descriptor
{
  return self->_descriptor;
}

- (CMIExternalMemoryResource)resource
{
  return self->_resource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resource, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

+ (BOOL)usingSharedMemoryResourceForDevice:(id)a3 withDescriptor:(id)a4 perform:(id)a5
{
  id v7;
  id v8;
  uint64_t (**v9)(id, void *);
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _NUStyleEngineMemoryResource *v15;
  _NUStyleEngineMemoryResource *v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  BOOL (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id v26;

  v7 = a3;
  v8 = a4;
  v9 = (uint64_t (**)(id, void *))a5;
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[NURenderResourcePool shared](NURenderResourcePool, "shared");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __90___NUStyleEngineMemoryResource_usingSharedMemoryResourceForDevice_withDescriptor_perform___block_invoke;
  v24 = &unk_1E5063E68;
  v13 = v7;
  v25 = v13;
  v14 = v8;
  v26 = v14;
  objc_msgSend(v12, "checkOutResourceForKey:matching:", v11, &v21);
  v15 = (_NUStyleEngineMemoryResource *)objc_claimAutoreleasedReturnValue();

  if (v15
    || (v16 = [_NUStyleEngineMemoryResource alloc],
        v15 = -[_NUStyleEngineMemoryResource initWithDevice:descriptor:](v16, "initWithDevice:descriptor:", v13, v14, v21, v22, v23, v24, v25), -[_NUStyleEngineMemoryResource setup](v15, "setup")))
  {
    -[_NUStyleEngineMemoryResource resource](v15, "resource", v21, v22, v23, v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v9[2](v9, v17);

    +[NURenderResourcePool shared](NURenderResourcePool, "shared");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "checkInResource:forKey:", v15, v11);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

@end
