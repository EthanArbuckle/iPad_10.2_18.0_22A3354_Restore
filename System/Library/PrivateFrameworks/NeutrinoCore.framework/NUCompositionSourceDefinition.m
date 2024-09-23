@implementation NUCompositionSourceDefinition

- (id)sourceContainerNodeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NUCompositionSourceNode *v12;
  void *v13;
  void *v14;
  NUCompositionSourceNode *v15;
  NUSingleSourceContainerNode *v16;
  NSObject *v18;
  void *v19;
  void *specific;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    NUAssertLogger_6578();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v19;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_6578();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v26 = (void *)MEMORY[0x1E0CB3978];
        v27 = v25;
        objc_msgSend(v26, "callStackSymbols");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v25;
        v38 = 2114;
        v39 = v29;
        _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v24;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSourceDefinition(NodeProvider) sourceContainerNodeWithIdentifier:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 615, CFSTR("Invalid parameter not satisfying: %s"), v30, v31, v32, v33, (uint64_t)"error != NULL");
  }
  v7 = v6;
  -[NUCompositionSourceDefinition composition](self, "composition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[NURenderPipelineRegistry sharedRegistry](NURenderPipelineRegistry, "sharedRegistry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "renderPipelineForIdentifier:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = [NUCompositionSourceNode alloc];
    -[NUCompositionSourceDefinition composition](self, "composition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = CFSTR("container");
    v35 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[NUCompositionSourceNode initWithComposition:renderPipeline:settings:](v12, "initWithComposition:renderPipeline:settings:", v13, v11, v14);

    v16 = -[NUSingleSourceContainerNode initWithSourceNode:assetIdentifier:]([NUSingleSourceContainerNode alloc], "initWithSourceNode:assetIdentifier:", v15, v7);
  }
  else
  {
    +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("No render pipeline registered for composition identifier"), v9);
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (NUCompositionSourceDefinition)init
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_7194);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_7194);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_7194);
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
  _NUAssertFailHandler((uint64_t)"-[NUCompositionSourceDefinition init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUSource.m", 368, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (NUCompositionSourceDefinition)initWithComposition:(id)a3
{
  NUComposition *v4;
  NUComposition *v5;
  NUCompositionSourceDefinition *v6;
  NUComposition *composition;
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
  v4 = (NUComposition *)a3;
  if (!v4)
  {
    NUAssertLogger_7182();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "composition != nil");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v10;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_7182();
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
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSourceDefinition initWithComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUSource.m", 373, CFSTR("Invalid parameter not satisfying: %s"), v21, v22, v23, v24, (uint64_t)"composition != nil");
  }
  v5 = v4;
  v25.receiver = self;
  v25.super_class = (Class)NUCompositionSourceDefinition;
  v6 = -[NUCompositionSourceDefinition init](&v25, sel_init);
  composition = v6->_composition;
  v6->_composition = v5;

  return v6;
}

- (NUComposition)composition
{
  return (NUComposition *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composition, 0);
}

@end
