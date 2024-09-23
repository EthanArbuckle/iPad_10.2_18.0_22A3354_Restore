@implementation NUBufferTileAdapter

- (NUBufferTileAdapter)initWithFrameRect:(id *)a3 contentRect:(id *)a4 buffer:(id)a5
{
  id v8;
  char *v9;
  $0AC6E346AE4835514AAA8AC86D8F4844 var0;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
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
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (!v8)
  {
    NUAssertLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "buffer != nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v15;
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
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v21;
        v31 = 2114;
        v32 = v23;
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
      v30 = v20;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUBufferTileAdapter initWithFrameRect:contentRect:buffer:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 338, CFSTR("Invalid parameter not satisfying: %s"), v24, v25, v26, v27, (uint64_t)"buffer != nil");
  }
  v28.receiver = self;
  v28.super_class = (Class)NUBufferTileAdapter;
  v9 = -[NUBufferTileAdapter init](&v28, sel_init);
  var0 = a3->var0;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)(v9 + 24) = a3->var1;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)(v9 + 8) = var0;
  var1 = a4->var1;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)(v9 + 40) = a4->var0;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)(v9 + 56) = var1;
  v12 = (void *)*((_QWORD *)v9 + 9);
  *((_QWORD *)v9 + 9) = v8;

  return (NUBufferTileAdapter *)v9;
}

- (NUBufferTileAdapter)init
{
  NSObject *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_10226);
  v3 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v8;
    _os_log_error_impl(&dword_1A6553000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_10226);
    v9 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v12;
      v23 = 2114;
      v24 = v14;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_10226);
    v9 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v11;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
  }

  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUBufferTileAdapter init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 347, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v17, v18, v19, v20, v16);
}

- ($209B98C1CDF2DEBD503CBDE3C0ED7C90)frameRect
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3;

  v3 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self->var1.var1;
  retstr->var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self->var0.var1;
  retstr->var1 = v3;
  return self;
}

- ($209B98C1CDF2DEBD503CBDE3C0ED7C90)contentRect
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3;

  v3 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[1].var1.var1;
  retstr->var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[1].var0.var1;
  retstr->var1 = v3;
  return self;
}

- (NUBuffer)buffer
{
  return self->_buffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
