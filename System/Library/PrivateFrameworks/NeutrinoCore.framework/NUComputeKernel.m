@implementation NUComputeKernel

- (NUComputeKernel)initWithDevice:(id)a3
{
  MTLDevice *v4;
  MTLDevice *v5;
  NUComputeKernel *v6;
  MTLDevice *device;
  NSObject *v9;
  void *v10;
  void *specific;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (MTLDevice *)a3;
  if (!v4)
  {
    NUAssertLogger_8539();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "device != nil");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v10;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_8539();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v17 = (void *)MEMORY[0x1E0CB3978];
        v18 = v16;
        objc_msgSend(v17, "callStackSymbols");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v16;
        v28 = 2114;
        v29 = v20;
        _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v15;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUComputeKernel initWithDevice:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 24, CFSTR("Invalid parameter not satisfying: %s"), v21, v22, v23, v24, (uint64_t)"device != nil");
  }
  v5 = v4;
  v25.receiver = self;
  v25.super_class = (Class)NUComputeKernel;
  v6 = -[NUComputeKernel init](&v25, sel_init);
  device = v6->_device;
  v6->_device = v5;

  return v6;
}

- (void)encodeToCommandBuffer:(id)a3 destinationTexture:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
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
  v5 = a3;
  v6 = a4;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_8527);
  v7 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = v7;
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v12;
    _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v13 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v13 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_8527);
      goto LABEL_8;
    }
    if (v13 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_8527);
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
  _NUAssertFailHandler((uint64_t)"-[NUComputeKernel encodeToCommandBuffer:destinationTexture:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 31, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v27, v28, v29, v30, v26);
}

- (MTLDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

+ ($F99D9A4FB75BC57F3386B8DC8EE08D7A)groupSizeForImageSize:(SEL)a3 pipelineState:(id *)a4
{
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t var1;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  id v21;

  v21 = a5;
  v7 = objc_msgSend(v21, "threadExecutionWidth");
  v8 = objc_msgSend(v21, "maxTotalThreadsPerThreadgroup");
  v9 = v8 / v7;
  retstr->var0 = v7;
  retstr->var1 = v8 / v7;
  retstr->var2 = 1;
  if (v7 <= v8)
  {
    v10 = 0;
    var1 = a4->var1;
    v12 = v7 + a4->var0;
    v13 = -1;
    v14 = -(uint64_t)(var1 * a4->var0);
    v15 = -1;
    do
    {
      if (v7 + v10 <= v9)
        v16 = v9;
      else
        v16 = v7 + v10;
      if (v7 + v10 >= v9)
        v17 = v9;
      else
        v17 = v7 + v10;
      if (v14 + (var1 + v9 - 1) / v9 * v9 * (v12 + v10 - 1) / (v7 + v10) * (v7 + v10) <= v13)
      {
        v18 = v16 / v17;
        if (v18 <= v15)
        {
          retstr->var0 = v7 + v10;
          retstr->var1 = v9;
          v15 = v18;
          v13 = v14 + (var1 + v9 - 1) / v9 * v9 * (v12 + v10 - 1) / (v7 + v10) * (v7 + v10);
          retstr->var2 = 1;
        }
      }
      v19 = 2 * v7 + v10;
      v10 += v7;
      v9 = v8 / v19;
    }
    while (v7 + v10 <= v8);
  }

  return result;
}

+ ($F99D9A4FB75BC57F3386B8DC8EE08D7A)gridSizeForThreadGroupSize:(SEL)a3 imageSize:(id *)a4
{
  unint64_t v5;

  v5 = (a5->var1 + a4->var1 - 1) / a4->var1;
  retstr->var0 = (a5->var0 + a4->var0 - 1) / a4->var0;
  retstr->var1 = v5;
  retstr->var2 = 1;
  return result;
}

+ (id)pipelineStateForFunctionWithName:(id)a3 device:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "pipelineStateForFunctionWithName:constants:key:device:error:", a3, 0, a3, a4, a5);
}

+ (id)pipelineStateForFunctionWithName:(id)a3 constants:(id)a4 key:(id)a5 device:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  NSObject *v28;
  void *v29;
  void *specific;
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
  id v45;
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!a7)
  {
    NUAssertLogger_8539();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v29;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_8539();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v32)
      {
        v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E0CB3978];
        v37 = v35;
        objc_msgSend(v36, "callStackSymbols");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v35;
        v51 = 2114;
        v52 = v39;
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
      v50 = v34;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUComputeKernel pipelineStateForFunctionWithName:constants:key:device:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Metal/NUComputeKernel.m", 75, CFSTR("Invalid parameter not satisfying: %s"), v40, v41, v42, v43, (uint64_t)"error != NULL");
  }
  v15 = v14;
  v16 = a1;
  objc_sync_enter(v16);
  v17 = (void *)pipelineStateForFunctionWithName_constants_key_device_error__pipelineStateByFunctionKey;
  if (!pipelineStateForFunctionWithName_constants_key_device_error__pipelineStateByFunctionKey)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v19 = (void *)pipelineStateForFunctionWithName_constants_key_device_error__pipelineStateByFunctionKey;
    pipelineStateForFunctionWithName_constants_key_device_error__pipelineStateByFunctionKey = (uint64_t)v18;

    v17 = (void *)pipelineStateForFunctionWithName_constants_key_device_error__pipelineStateByFunctionKey;
  }
  objc_msgSend(v17, "objectForKey:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    v44 = (void *)objc_msgSend(v15, "newDefaultLibraryWithBundle:error:", v21, &v48);
    v22 = v48;

    if (!v44)
    {
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to load Metal library for device"), v15, v22);
      v20 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    if (v12)
    {
      v47 = v22;
      v23 = (void *)objc_msgSend(v44, "newFunctionWithName:constantValues:error:", v45, v12, &v47);
      v24 = v47;

      v22 = v24;
      if (v23)
      {
LABEL_8:
        v46 = v22;
        v20 = (void *)objc_msgSend(v15, "newComputePipelineStateWithFunction:error:", v23, &v46);
        v25 = v46;

        if (v20)
        {
          objc_msgSend((id)pipelineStateForFunctionWithName_constants_key_device_error__pipelineStateByFunctionKey, "setObject:forKey:", v20, v13);

          v22 = v25;
LABEL_15:

          goto LABEL_16;
        }
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to create pipeline state from function"), v45, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v25;
LABEL_14:
        *a7 = v26;

        v20 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      v23 = (void *)objc_msgSend(v44, "newFunctionWithName:", v45);
      if (v23)
        goto LABEL_8;
    }
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to load Metal kernel function"), v45, v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
LABEL_16:
  objc_sync_exit(v16);

  return v20;
}

@end
