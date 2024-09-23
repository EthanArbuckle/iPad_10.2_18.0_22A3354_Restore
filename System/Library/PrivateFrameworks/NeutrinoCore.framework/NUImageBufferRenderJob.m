@implementation NUImageBufferRenderJob

- (id)imageAccumulationNodeWithImageSize:(id)a3 tileSize:(id)a4 borderSize:(id)a5 format:(id)a6 colorSpace:(id)a7
{
  return 0;
}

- (id)renderBufferOfSize:(id)a3 format:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NUStorageImageBuffer *v11;
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
  _BYTE v29[12];
  __int16 v30;
  void *v31;
  uint64_t v32;

  var1 = a3.var1;
  var0 = a3.var0;
  v32 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[NUImageRenderJob storagePool](self, "storagePool");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "newStorageWithSize:format:", var0, var1, v7);
  if (!v9)
  {
    NUAssertLogger_9655();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No storage allocated"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v29 = 138543362;
      *(_QWORD *)&v29[4] = v14;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v29, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_9655();
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
        *(_DWORD *)v29 = 138543618;
        *(_QWORD *)&v29[4] = v20;
        v30 = 2114;
        v31 = v24;
        _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v29, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v29 = 138543362;
      *(_QWORD *)&v29[4] = v19;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v29, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageBufferRenderJob renderBufferOfSize:format:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageRenderJob.m", 475, CFSTR("No storage allocated"), v25, v26, v27, v28, *(uint64_t *)v29);
  }
  v10 = (void *)v9;
  v11 = -[NUStorageImageBuffer initWithStorage:fromPool:]([NUStorageImageBuffer alloc], "initWithStorage:fromPool:", v9, v8);

  return v11;
}

- (id)result
{
  _NUImageBufferRenderResult *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(_NUImageBufferRenderResult);
  -[NUImageRenderJob renderedRegion](self, "renderedRegion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUImageRenderResult setRegion:](v3, "setRegion:", v4);

  -[NUImageRenderJob renderBuffer](self, "renderBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUImageBufferRenderResult setBuffer:](v3, "setBuffer:", v5);

  -[NURenderJob outputGeometry](self, "outputGeometry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUImageRenderResult setGeometry:](v3, "setGeometry:", v6);

  return v3;
}

@end
