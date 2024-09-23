@implementation NUMutableBufferImageAdapter

- (NUMutableBufferImageAdapter)initWithMutableBuffer:(id)a3 colorSpace:(id)a4 validRegion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NUMutableBufferAdapter *v11;
  NUMutableBufferImageAdapter *v12;
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
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    NUAssertLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "buffer != nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v15;
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
        v29 = v21;
        v30 = 2114;
        v31 = v23;
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
      v29 = v20;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUMutableBufferImageAdapter initWithMutableBuffer:colorSpace:validRegion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 476, CFSTR("Invalid parameter not satisfying: %s"), v24, v25, v26, v27, (uint64_t)"buffer != nil");
  }
  v11 = -[NUMutableBufferAdapter initWithMutableBuffer:]([NUMutableBufferAdapter alloc], "initWithMutableBuffer:", v8);
  v12 = -[NUMutableBufferImageAdapter initWithMutableBufferProvider:colorSpace:validRegion:](self, "initWithMutableBufferProvider:colorSpace:validRegion:", v11, v9, v10);

  return v12;
}

- (NUMutableBufferImageAdapter)initWithMutableBufferProvider:(id)a3 colorSpace:(id)a4 validRegion:(id)a5
{
  NUMutableBufferProvider *v8;
  NUMutableBufferImageAdapter *v9;
  NUMutableBufferProvider *mutableBufferProvider;
  objc_super v12;

  v8 = (NUMutableBufferProvider *)a3;
  v12.receiver = self;
  v12.super_class = (Class)NUMutableBufferImageAdapter;
  v9 = -[NUBufferImageAdapter initWithBufferProvider:colorSpace:validRegion:](&v12, sel_initWithBufferProvider_colorSpace_validRegion_, v8, a4, a5);
  mutableBufferProvider = v9->_mutableBufferProvider;
  v9->_mutableBufferProvider = v8;

  return v9;
}

- (NUMutableBufferImageAdapter)initWithBufferProvider:(id)a3 colorSpace:(id)a4 validRegion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
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
  a3;
  v8 = a4;
  v9 = a5;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_10226);
  v10 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_10226);
    v16 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v19;
      v30 = 2114;
      v31 = v21;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_10226);
    v16 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v18;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
  }

  v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  v23 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUMutableBufferImageAdapter initWithBufferProvider:colorSpace:validRegion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageUtilities.mm", 491, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (void)writeBufferRegion:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NUMutableBufferProvider *mutableBufferProvider;
  uint64_t v10;
  id v11;
  NURegion *v12;
  NURegion *validRegion;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  v8 = -[NUBufferImageAdapter size](self, "size");
  mutableBufferProvider = self->_mutableBufferProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__NUMutableBufferImageAdapter_writeBufferRegion_withBlock___block_invoke;
  v14[3] = &unk_1E5061E10;
  v16 = 0;
  v17 = 0;
  v18 = v8;
  v19 = v10;
  v11 = v7;
  v15 = v11;
  -[NUMutableBufferProvider provideMutableBuffer:](mutableBufferProvider, "provideMutableBuffer:", v14);
  -[NURegion regionByAddingRegion:](self->super._validRegion, "regionByAddingRegion:", v6);
  v12 = (NURegion *)objc_claimAutoreleasedReturnValue();
  validRegion = self->super._validRegion;
  self->super._validRegion = v12;

}

- (BOOL)copySurfaceStorage:(id)a3 fromRect:(id *)a4 toPoint:(id)a5 device:(id)a6
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  _OWORD v8[2];

  var1 = a4->var1;
  v8[0] = a4->var0;
  v8[1] = var1;
  return -[NUMutableBufferImageAdapter copyBufferStorage:fromRect:toPoint:](self, "copyBufferStorage:fromRect:toPoint:", a3, v8, a5.var0, a5.var1, a6);
}

- (BOOL)copyBufferStorage:(id)a3 fromRect:(id *)a4 toPoint:(id)a5
{
  int64_t var1;
  int64_t var0;
  id v9;
  $0AC6E346AE4835514AAA8AC86D8F4844 v10;
  void *v11;
  $0AC6E346AE4835514AAA8AC86D8F4844 v12;
  uint64_t v13;
  _QWORD v15[7];
  $0AC6E346AE4835514AAA8AC86D8F4844 v16;
  $0AC6E346AE4835514AAA8AC86D8F4844 v17;
  _OWORD v18[2];

  var1 = a5.var1;
  var0 = a5.var0;
  v9 = a3;
  v10 = a4->var1;
  v18[0] = a4->var0;
  v18[1] = v10;
  +[NURegion regionWithRect:](NURegion, "regionWithRect:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = 3221225472;
  v12 = a4->var1;
  v16 = a4->var0;
  v17 = v12;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[2] = __66__NUMutableBufferImageAdapter_copyBufferStorage_fromRect_toPoint___block_invoke;
  v15[3] = &unk_1E5063930;
  v15[4] = self;
  v15[5] = var0;
  v15[6] = var1;
  v13 = objc_msgSend(v9, "readBufferInRegion:block:", v11, v15);

  return v13 == 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableBufferProvider, 0);
}

uint64_t __66__NUMutableBufferImageAdapter_copyBufferStorage_fromRect_toPoint___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  _OWORD v7[2];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_OWORD *)(a1 + 72);
  v7[0] = *(_OWORD *)(a1 + 56);
  v7[1] = v5;
  return +[NUImageUtilities copyPixelsToImage:atPoint:fromBuffer:inRect:](NUImageUtilities, "copyPixelsToImage:atPoint:fromBuffer:inRect:", v2, v3, v4, a2, v7);
}

void __59__NUMutableBufferImageAdapter_writeBufferRegion_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NUMutableBufferTileAdapter *v4;
  __int128 v5;
  NUMutableBufferTileAdapter *v6;
  _OWORD v7[2];
  _OWORD v8[2];
  char v9;

  v3 = a2;
  v9 = 0;
  v4 = [NUMutableBufferTileAdapter alloc];
  v5 = *(_OWORD *)(a1 + 56);
  v8[0] = *(_OWORD *)(a1 + 40);
  v8[1] = v5;
  v7[0] = v8[0];
  v7[1] = v5;
  v6 = -[NUMutableBufferTileAdapter initWithFrameRect:contentRect:buffer:](v4, "initWithFrameRect:contentRect:buffer:", v8, v7, v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
