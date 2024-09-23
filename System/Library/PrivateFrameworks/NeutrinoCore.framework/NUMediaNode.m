@implementation NUMediaNode

- (int64_t)channelType
{
  return 1;
}

- (void)setInputNode:(id)a3
{
  NSObject *v4;
  void *v5;
  void *specific;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
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
  v20 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NUAssertLogger_4813();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad input node: %@"), v20);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v5;
      _os_log_error_impl(&dword_1A6553000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4813();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v12 = (void *)MEMORY[0x1E0CB3978];
        v13 = v11;
        objc_msgSend(v12, "callStackSymbols");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v11;
        v23 = 2114;
        v24 = v15;
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
      v22 = v10;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUMediaNode setInputNode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 1144, CFSTR("Bad input node: %@"), v16, v17, v18, v19, (uint64_t)v20);
  }
  -[NURenderTagNode setInput:](self, "setInput:", v20);

}

- (BOOL)bindTo:(id)a3 error:(id *)a4
{
  id v6;
  char isKindOfClass;
  void *v8;

  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "node");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUMediaNode setInputNode:](self, "setInputNode:", v8);

  }
  else
  {
    +[NUError mismatchError:object:](NUError, "mismatchError:object:", CFSTR("Expected media data"), v6);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return isKindOfClass & 1;
}

- (id)evaluateDataWithFormat:(id)a3 error:(id *)a4
{
  id v6;
  NURenderPipelineState *v7;
  void *v8;
  id v9;
  id v10;
  NUChannelMediaData *v11;
  NUChannelMediaData *v12;
  id v14;

  v6 = a3;
  if (objc_msgSend(v6, "channelType") == 1)
  {
    v7 = objc_alloc_init(NURenderPipelineState);
    -[NURenderPipelineState setEvaluationMode:](v7, "setEvaluationMode:", 0);
    -[NURenderPipelineState setMediaComponentType:](v7, "setMediaComponentType:", 1);
    v14 = 0;
    -[NURenderNode nodeByReplayingAgainstCache:error:](self, "nodeByReplayingAgainstCache:error:", v7, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;
    if (v8)
    {
      v10 = v6;
      v11 = -[NUChannelMediaData initWithNode:format:]([NUChannelMediaData alloc], "initWithNode:format:", v8, v10);
      if (-[NUChannelMediaData evaluate:](v11, "evaluate:", a4))
        v12 = v11;
      else
        v12 = 0;

    }
    else
    {
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to prepare render pipeline"), self, v9);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    +[NUError mismatchError:object:](NUError, "mismatchError:object:", CFSTR("Incompatible channel format"), v6);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

@end
