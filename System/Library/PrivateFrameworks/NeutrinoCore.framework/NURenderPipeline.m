@implementation NURenderPipeline

- (id)processedRenderNodeForComposition:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  return -[NURenderPipeline processedRenderNodeForComposition:pipelineState:extentPolicy:error:](self, "processedRenderNodeForComposition:pipelineState:extentPolicy:error:", a3, a4, 0, a5);
}

- (id)processedRenderNodeForComposition:(id)a3 pipelineState:(id)a4 extentPolicy:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NUPipelineOutputNode *v13;
  void *v14;
  void *v15;
  NUPipelineOutputNode *v16;
  void *v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[NURenderPipeline _processedRenderNodeForComposition:input:pipelineState:error:](self, "_processedRenderNodeForComposition:input:pipelineState:error:", v10, 0, v11, a6);
  v13 = (NUPipelineOutputNode *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[NURenderPipeline _runPipelineFiltersForRenderNode:composition:pipelineState:error:](self, "_runPipelineFiltersForRenderNode:composition:pipelineState:error:", v13, v10, v11, a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)objc_opt_new();
      if (objc_msgSend(v11, "enableTransparency"))
        objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("renderTransparencyOpaque"));
      if (objc_msgSend(v11, "enforceEvenDimensions"))
        objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("enforceEvenDimensions"));
      if (v12)
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, CFSTR("extentPolicy"));
      v16 = [NUPipelineOutputNode alloc];
      v17 = (void *)objc_msgSend(v15, "copy");
      v13 = -[NUPipelineOutputNode initWithInput:settings:](v16, "initWithInput:settings:", v14, v17);

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (id)_processedRenderNodeForComposition:(id)a3 input:(id)a4 pipelineState:(id)a5 error:(id *)a6
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
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *specific;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  objc_class *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_25215);
  v11 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = v11;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v36 = v16;
    _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v17 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v17 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_25215);
      goto LABEL_8;
    }
    if (v17 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_25215);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v18 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v19 = (void *)MEMORY[0x1E0CB3978];
    v20 = v18;
    objc_msgSend(v19, "callStackSymbols");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v36 = v22;
    _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v23 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v25 = (void *)MEMORY[0x1E0CB3978];
  v26 = specific;
  v20 = v23;
  objc_msgSend(v25, "callStackSymbols");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v36 = specific;
  v37 = 2114;
  v38 = v28;
  _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v29 = (objc_class *)objc_opt_class();
  NSStringFromClass(v29);
  v30 = objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NURenderPipeline _processedRenderNodeForComposition:input:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipeline.m", 52, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v31, v32, v33, v34, v30);
}

- (id)_runPipelineFiltersForRenderNode:(id)a3 composition:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  NURenderPipelineHelper *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[NURenderPipelineHelper initWithPipelineState:]([NURenderPipelineHelper alloc], "initWithPipelineState:", v11);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v21 = v11;
  objc_msgSend(v11, "pipelineFilters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
LABEL_3:
    v17 = 0;
    v18 = v9;
    while (1)
    {
      if (*(_QWORD *)v23 != v16)
        objc_enumerationMutation(v13);
      objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v17), "filterBlock");
      v19 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, NURenderPipelineHelper *, id, void *, id *))v19)[2](v19, v12, v10, v18, a6);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (!v9)
        break;
      ++v17;
      v18 = v9;
      if (v15 == v17)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v15)
          goto LABEL_3;
        break;
      }
    }
  }

  return v9;
}

@end
