@implementation NUMutableBufferTileAdapter

- (NUMutableBufferTileAdapter)initWithFrameRect:(id *)a3 contentRect:(id *)a4 buffer:(id)a5
{
  id v8;
  char *v9;
  $0AC6E346AE4835514AAA8AC86D8F4844 var0;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  void *v12;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)NUMutableBufferTileAdapter;
  v9 = -[NUMutableBufferTileAdapter init](&v14, sel_init);
  var0 = a3->var0;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)(v9 + 24) = a3->var1;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)(v9 + 8) = var0;
  var1 = a4->var1;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)(v9 + 40) = a4->var0;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)(v9 + 56) = var1;
  v12 = (void *)*((_QWORD *)v9 + 9);
  *((_QWORD *)v9 + 9) = v8;

  return (NUMutableBufferTileAdapter *)v9;
}

- (NUMutableBufferTileAdapter)init
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
  _NUAssertFailHandler((uint64_t)"-[NUMutableBufferTileAdapter init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 374, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v17, v18, v19, v20, v16);
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

- (NUMutableBuffer)mutableBuffer
{
  return self->_buffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
