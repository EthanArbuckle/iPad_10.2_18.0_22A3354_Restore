@implementation NUStorageImageBuffer

- (NUStorageImageBuffer)init
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_23844);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_23844);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_23844);
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
  _NUAssertFailHandler((uint64_t)"-[NUStorageImageBuffer init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUStorageImageBuffer.m", 24, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (NUStorageImageBuffer)initWithStorage:(id)a3 fromPool:(id)a4
{
  NUPurgeableStorage *v6;
  NUPurgeableStoragePool *v7;
  NUPurgeableStoragePool *v8;
  NUStorageImageBuffer *v9;
  NUPurgeableStorage *storage;
  NUPurgeableStorage *v11;
  NUPurgeableStoragePool *pool;
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
  v6 = (NUPurgeableStorage *)a3;
  v7 = (NUPurgeableStoragePool *)a4;
  if (!v6)
  {
    NUAssertLogger_23831();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "storage != nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v15;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_23831();
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
    _NUAssertFailHandler((uint64_t)"-[NUStorageImageBuffer initWithStorage:fromPool:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUStorageImageBuffer.m", 28, CFSTR("Invalid parameter not satisfying: %s"), v26, v27, v28, v29, (uint64_t)"storage != nil");
  }
  v8 = v7;
  v30.receiver = self;
  v30.super_class = (Class)NUStorageImageBuffer;
  v9 = -[NUStorageImageBuffer init](&v30, sel_init);
  storage = v9->_storage;
  v9->_storage = v6;
  v11 = v6;

  pool = v9->_pool;
  v9->_pool = v8;

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[NUPurgeableStoragePool returnStorage:](self->_pool, "returnStorage:", self->_storage);
  v3.receiver = self;
  v3.super_class = (Class)NUStorageImageBuffer;
  -[NUStorageImageBuffer dealloc](&v3, sel_dealloc);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t v2;
  int64_t v3;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v2 = -[NUPurgeableStorage size](self->_storage, "size");
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (NUPixelFormat)format
{
  return (NUPixelFormat *)-[NUPurgeableStorage format](self->_storage, "format");
}

- (NUColorSpace)colorSpace
{
  return (NUColorSpace *)-[NUPurgeableStorage colorSpace](self->_storage, "colorSpace");
}

- (__CVBuffer)CVPixelBuffer
{
  NUPurgeableStorage *storage;
  __CVBuffer *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  storage = self->_storage;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__NUStorageImageBuffer_CVPixelBuffer__block_invoke;
  v5[3] = &unk_1E5063B58;
  v5[4] = &v6;
  -[NUPurgeableStorage useAsCVPixelBufferWithBlock:](storage, "useAsCVPixelBufferWithBlock:", v5);
  v3 = (__CVBuffer *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NUPurgeableStorage)storage
{
  return self->_storage;
}

- (NUPurgeableStoragePool)pool
{
  return self->_pool;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pool, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

uint64_t __37__NUStorageImageBuffer_CVPixelBuffer__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "CVPixelBuffer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (NUStorageImageBuffer)imageBufferWithSize:(id)a3 format:(id)a4 fromPool:(id)a5
{
  int64_t var1;
  int64_t var0;
  id v9;
  id v10;
  void *v11;
  void *v12;
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

  var1 = a3.var1;
  var0 = a3.var0;
  v35 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    NUAssertLogger_23831();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "pool != nil");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v16;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_23831();
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
    _NUAssertFailHandler((uint64_t)"+[NUStorageImageBuffer imageBufferWithSize:format:fromPool:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUStorageImageBuffer.m", 15, CFSTR("Invalid parameter not satisfying: %s"), v27, v28, v29, v30, (uint64_t)"pool != nil");
  }
  v11 = v10;
  v12 = (void *)objc_msgSend(v10, "newStorageWithSize:format:", var0, var1, v9);
  if (v12)
    v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStorage:fromPool:", v12, v11);
  else
    v13 = 0;

  return (NUStorageImageBuffer *)v13;
}

@end
