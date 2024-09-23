@implementation NUPipelineStateNode

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return 1;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
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
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    NUAssertLogger_18095();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v16;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18095();
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
        v33 = v22;
        v34 = 2114;
        v35 = v26;
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
      v33 = v21;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUPipelineStateNode nodeByReplayingAgainstCache:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Pipeline.m", 19, CFSTR("Invalid parameter not satisfying: %s"), v27, v28, v29, v30, (uint64_t)"error != nil");
  }
  v10 = v9;
  v11 = (void *)objc_msgSend(v9, "copy");
  -[NURenderNode settings](self, "settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applyPipelineSettings:error:", v12, a5);

  v31.receiver = self;
  v31.super_class = (Class)NUPipelineStateNode;
  -[NURenderNode nodeByReplayingAgainstCache:pipelineState:error:](&v31, sel_nodeByReplayingAgainstCache_pipelineState_error_, v8, v11, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_evaluateImage:(id *)a3
{
  void *v4;
  void *v5;

  -[NURenderNode inputForKey:](self, "inputForKey:", *MEMORY[0x1E0C9E1F8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_evaluateImage:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)debugQuickLookObject
{
  void *v3;
  objc_super v5;
  uint64_t v6;

  if (-[NURenderNode isCached](self, "isCached"))
  {
    v5.receiver = self;
    v5.super_class = (Class)NUPipelineStateNode;
    -[NURenderNode debugQuickLookObject](&v5, sel_debugQuickLookObject);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
    -[NUPipelineStateNode _evaluateImage:](self, "_evaluateImage:", &v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUPipelineStateNode;
  -[NURenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v7, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
