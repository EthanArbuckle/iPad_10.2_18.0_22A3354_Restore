@implementation NUScaledSourceContainerNode

- (id)resolveSourceNodeForPipelineState:(id)a3 foundScale:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *specific;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[NUMultipleSourceContainerNode sources](self, "sources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v33.receiver = self;
  v33.super_class = (Class)NUScaledSourceContainerNode;
  -[NUMultipleSourceContainerNode resolveSourceNodeForPipelineState:foundScale:error:](&v33, sel_resolveSourceNodeForPipelineState_foundScale_error_, v8, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && objc_msgSend(v8, "evaluationMode") == 1 && v11 == v10)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_6563);
    v12 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = v12;
      objc_msgSend(v13, "stringWithFormat:", CFSTR("Trying to render using a dummy node. Note: You cannot use a NUScaledSourceContainerNodefor 1-1 rendering. You must specify the renderRequest.scalePolicy to match [NUScaledSourceDefiniton scale] or lower."));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v15;
      _os_log_impl(&dword_1A6553000, v14, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      v16 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v16 != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_6563);
LABEL_11:
        v17 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v23 = (void *)MEMORY[0x1E0CB3978];
          v24 = specific;
          v25 = v17;
          objc_msgSend(v23, "callStackSymbols");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v35 = specific;
          v36 = 2114;
          v37 = v27;
          _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_19:
          goto LABEL_16;
        }
        goto LABEL_16;
      }
      if (v16 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_6563);
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_11;
    }
    v28 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      v30 = (void *)MEMORY[0x1E0CB3978];
      v25 = v28;
      objc_msgSend(v30, "callStackSymbols");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v32;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_19;
    }
LABEL_16:
    _NUAssertContinueHandler((uint64_t)"-[NUScaledSourceContainerNode resolveSourceNodeForPipelineState:foundScale:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 361, CFSTR("Trying to render using a dummy node. Note: You cannot use a NUScaledSourceContainerNodefor 1-1 rendering. You must specify the renderRequest.scalePolicy to match [NUScaledSourceDefiniton scale] or lower."), v18, v19, v20, v21, (uint64_t)v33.receiver);
  }

  return v11;
}

@end
