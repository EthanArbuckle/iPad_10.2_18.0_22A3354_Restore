@implementation NURAWGainMapNode

- (NURAWGainMapNode)initWithInput:(id)a3 gainMapVersion:(id)a4 gainMapParameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NURAWGainMapNode *v15;
  NSObject *v17;
  void *v18;
  void *specific;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  objc_super v33;
  uint64_t v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    NUAssertLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "node != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = (void *)MEMORY[0x1E0CB3978];
        v26 = v24;
        objc_msgSend(v25, "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v24;
        v38 = 2114;
        v39 = v28;
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
      v37 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURAWGainMapNode initWithInput:gainMapVersion:gainMapParameters:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 1196, CFSTR("Invalid parameter not satisfying: %s"), v29, v30, v31, v32, (uint64_t)"node != nil");
  }
  v11 = v10;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("GM1")))
  {
    objc_msgSend(v11, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("inputGain"));

  }
  v34 = *MEMORY[0x1E0C9E1F8];
  v35 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33.receiver = self;
  v33.super_class = (Class)NURAWGainMapNode;
  v15 = -[NUFilterNode initWithFilterName:settings:inputs:](&v33, sel_initWithFilterName_settings_inputs_, CFSTR("NURAWGainMapFilter"), v12, v14);

  return v15;
}

- (NURAWGainMapNode)initWithFilterName:(id)a3 settings:(id)a4 inputs:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *specific;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  objc_class *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_572);
  v11 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = v11;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v17;
    _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v18 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v18 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_572);
      goto LABEL_8;
    }
    if (v18 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_572);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v19 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v20 = (void *)MEMORY[0x1E0CB3978];
    v21 = v19;
    objc_msgSend(v20, "callStackSymbols");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v23;
    _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v24 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v26 = (void *)MEMORY[0x1E0CB3978];
  v27 = specific;
  v21 = v24;
  objc_msgSend(v26, "callStackSymbols");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v37 = specific;
  v38 = 2114;
  v39 = v29;
  _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v30 = (objc_class *)objc_opt_class();
  NSStringFromClass(v30);
  v31 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NURAWGainMapNode initWithFilterName:settings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 1209, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v32, v33, v34, v35, v31);
}

- (NURAWGainMapNode)initWithFilter:(id)a3 settings:(id)a4 inputs:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *specific;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  objc_class *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_572);
  v11 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = v11;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v17;
    _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v18 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v18 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_572);
      goto LABEL_8;
    }
    if (v18 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_572);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v19 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v20 = (void *)MEMORY[0x1E0CB3978];
    v21 = v19;
    objc_msgSend(v20, "callStackSymbols");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v23;
    _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v24 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v26 = (void *)MEMORY[0x1E0CB3978];
  v27 = specific;
  v21 = v24;
  objc_msgSend(v26, "callStackSymbols");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v37 = specific;
  v38 = 2114;
  v39 = v29;
  _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v30 = (objc_class *)objc_opt_class();
  NSStringFromClass(v30);
  v31 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NURAWGainMapNode initWithFilter:settings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+RAW.m", 1214, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v32, v33, v34, v35, v31);
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v8 = a4;
  v9 = a3;
  if (objc_msgSend(v8, "auxiliaryImageType") == 7)
  {
    v10 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v10, "setAuxiliaryImageType:", 1);
    v14.receiver = self;
    v14.super_class = (Class)NURAWGainMapNode;
    -[NUFilterNode nodeByReplayingAgainstCache:pipelineState:error:](&v14, sel_nodeByReplayingAgainstCache_pipelineState_error_, v9, v10, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NURenderNode inputForKey:](self, "inputForKey:", *MEMORY[0x1E0C9E1F8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nodeByReplayingAgainstCache:pipelineState:error:", v9, v8, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NURAWGainMapNode;
  -[NUFilterNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v7, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_evaluateImageGeometry:(id *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NUImageGeometry *v7;
  NUImageGeometry *v8;
  NUImageGeometry *v9;
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NURAWGainMapNode;
  -[NUFilterNode _evaluateImageGeometry:](&v12, sel__evaluateImageGeometry_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (-[NURenderNode isCached](self, "isCached")
      || (v5 = objc_msgSend(v4, "renderScale"), NUScaleCompare(v5, v6, 1, 2) <= 0))
    {
      v8 = v4;
    }
    else
    {
      v7 = [NUImageGeometry alloc];
      objc_msgSend(v4, "extent");
      v8 = -[NUImageGeometry initWithExtent:renderScale:orientation:](v7, "initWithExtent:renderScale:orientation:", &v11, 1, 2, objc_msgSend(v4, "orientation"));
    }
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
