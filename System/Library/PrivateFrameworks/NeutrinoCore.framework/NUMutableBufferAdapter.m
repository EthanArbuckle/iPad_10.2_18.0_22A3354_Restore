@implementation NUMutableBufferAdapter

- (NUMutableBufferAdapter)initWithMutableBuffer:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NUMutableBufferAdapter *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "size");
  v7 = v6;
  objc_msgSend(v4, "format");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NUMutableBufferAdapter initWithSize:format:rowBytes:mutableBytes:](self, "initWithSize:format:rowBytes:mutableBytes:", v5, v7, v8, objc_msgSend(v4, "rowBytes"), objc_msgSend(v4, "mutableBytes"));

  return v9;
}

- (NUMutableBufferAdapter)initWithSize:(id)a3 format:(id)a4 rowBytes:(int64_t)a5 mutableBytes:(void *)a6
{
  NUMutableBufferAdapter *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NUMutableBufferAdapter;
  result = -[NUBufferAdapter initWithSize:format:rowBytes:bytes:](&v8, sel_initWithSize_format_rowBytes_bytes_, a3.var0, a3.var1, a4, a5);
  result->_mutableBytes = a6;
  return result;
}

- (NUMutableBufferAdapter)initWithSize:(id)a3 format:(id)a4 rowBytes:(int64_t)a5 bytes:(const void *)a6
{
  id v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  uint64_t v21;
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
  v7 = a4;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_10226);
  v8 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v13;
    _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_10226);
    v14 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v17;
      v28 = 2114;
      v29 = v19;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_10226);
    v14 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v16;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
  }

  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUMutableBufferAdapter initWithSize:format:rowBytes:bytes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 616, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v22, v23, v24, v25, v21);
}

- (void)mutableBytes
{
  NSObject *v3;
  void *v4;
  void *specific;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!self->super._valid)
  {
    NUAssertLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Buffer no longer valid"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v4;
      _os_log_error_impl(&dword_1A6553000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = v10;
        v20 = 2114;
        v21 = v12;
        _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v9;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUMutableBufferAdapter mutableBytes]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 620, CFSTR("Buffer no longer valid"), v13, v14, v15, v16, v17);
  }
  return self->_mutableBytes;
}

- (void)mutableBytesAtPoint:(id)a3
{
  NSObject *v4;
  void *v5;
  void *specific;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!self->super._valid)
  {
    NUAssertLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Buffer no longer valid"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v5;
      _os_log_error_impl(&dword_1A6553000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v18;
        v35 = 2114;
        v36 = v20;
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
      v34 = v10;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUMutableBufferAdapter mutableBytesAtPoint:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 625, CFSTR("Buffer no longer valid"), v21, v22, v23, v24, v32);
  }
  if (a3.var0 < 0 || a3.var0 >= self->super._size.width || a3.var1 < 0 || a3.var1 >= self->super._size.height)
  {
    NUAssertLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "NUPixelPointInRect(point, extent)");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (v13)
    {
      if (v15)
      {
        v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v25;
        v35 = 2114;
        v36 = v27;
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
      v34 = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUMutableBufferAdapter mutableBytesAtPoint:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 627, CFSTR("Invalid parameter not satisfying: %s"), v28, v29, v30, v31, (uint64_t)"NUPixelPointInRect(point, extent)");
  }
  return (char *)self->_mutableBytes
       + self->super._rowBytes * a3.var1
       + -[NUPixelFormat bytesPerPixel](self->super._format, "bytesPerPixel") * a3.var0;
}

- (id)newRenderDestination
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0C9DDE8]);
  v4 = -[NUMutableBufferAdapter mutableBytes](self, "mutableBytes");
  v5 = -[NUBufferAdapter size](self, "size");
  -[NUBufferAdapter size](self, "size");
  v7 = v6;
  v8 = -[NUBufferAdapter rowBytes](self, "rowBytes");
  -[NUBufferAdapter format](self, "format");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithBitmapData:width:height:bytesPerRow:format:", v4, v5, v7, v8, objc_msgSend(v9, "CIFormat"));

  objc_msgSend(v10, "setLabel:", CFSTR("NUMutableBufferAdapter-new"));
  return v10;
}

- (void)provideMutableBuffer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *specific;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = v4;
  if (!self->super._valid)
  {
    NUAssertLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Buffer no longer valid"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v6;
      _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v9)
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
    _NUAssertFailHandler((uint64_t)"-[NUMutableBufferAdapter provideMutableBuffer:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 643, CFSTR("Buffer no longer valid"), v15, v16, v17, v18, v19);
  }
  (*((void (**)(id, NUMutableBufferAdapter *))v4 + 2))(v4, self);

}

@end
