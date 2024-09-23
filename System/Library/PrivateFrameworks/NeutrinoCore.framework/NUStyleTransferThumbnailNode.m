@implementation NUStyleTransferThumbnailNode

- (NUStyleTransferThumbnailNode)initWithInput:(id)a3 settings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NUStyleTransferThumbnailNode *v10;
  NSObject *v12;
  void *v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v28;
  const __CFString *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    NUAssertLogger_24413();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "input != nil");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E0CB3978];
        v21 = v19;
        objc_msgSend(v20, "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v19;
        v33 = 2114;
        v34 = v23;
        _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferThumbnailNode initWithInput:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 965, CFSTR("Invalid parameter not satisfying: %s"), v24, v25, v26, v27, (uint64_t)"input != nil");
  }
  v8 = v7;
  v29 = CFSTR("input");
  v30 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)NUStyleTransferThumbnailNode;
  v10 = -[NURenderNode initWithSettings:inputs:](&v28, sel_initWithSettings_inputs_, v8, v9);

  return v10;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)thumbnailSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int64_t v15;
  int64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *specific;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const __CFString *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v40 = *MEMORY[0x1E0C80C00];
  -[NURenderNode settings](self, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", NUStyleTransferNodeConfigurationKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NURenderNode settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("thumbnailWidth"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "integerValue");
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumbnailWidth"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "integerValue");

  }
  -[NURenderNode settings](self, "settings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("thumbnailHeight"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "integerValue");
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumbnailHeight"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v14, "integerValue");

  }
  if ((v13 | v8) < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = CFSTR("(width >= 0) && (height >= 0)");
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("NUGeometryPrimitives.h"), 38, CFSTR("Invalid parameter not satisfying: %@"));

    if (!v8)
    {
LABEL_12:
      NUAssertLogger_24413();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid thumbnail size"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v37 = v20;
        _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_24413();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v23)
        {
          v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v27 = (void *)MEMORY[0x1E0CB3978];
          v28 = v26;
          objc_msgSend(v27, "callStackSymbols");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v37 = v26;
          v38 = 2114;
          v39 = v30;
          _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v23)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v37 = v25;
        _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"-[NUStyleTransferThumbnailNode thumbnailSize]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 979, CFSTR("Invalid thumbnail size"), v31, v32, v33, v34, (uint64_t)v35);
    }
  }
  else if (!v8)
  {
    goto LABEL_12;
  }
  if (!v13)
    goto LABEL_12;

  v15 = v8;
  v16 = v13;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (NUStyleTransferThumbnailNode)initWithSettings:(id)a3 inputs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *specific;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  objc_class *v27;
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
  v6 = a3;
  v7 = a4;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_24428);
  v8 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = v8;
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v34 = v14;
    _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v15 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v15 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_24428);
      goto LABEL_8;
    }
    if (v15 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_24428);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v16 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v17 = (void *)MEMORY[0x1E0CB3978];
    v18 = v16;
    objc_msgSend(v17, "callStackSymbols");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v34 = v20;
    _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v21 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v23 = (void *)MEMORY[0x1E0CB3978];
  v24 = specific;
  v18 = v21;
  objc_msgSend(v23, "callStackSymbols");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v34 = specific;
  v35 = 2114;
  v36 = v26;
  _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v27 = (objc_class *)objc_opt_class();
  NSStringFromClass(v27);
  v28 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUStyleTransferThumbnailNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 984, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v29, v30, v31, v32, v28);
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "auxiliaryImageType") == 1)
  {
    v10 = (void *)objc_msgSend(v9, "copy");
    v11 = objc_msgSend(v9, "scale");
    if (NUScaleCompare(v11, v12, 1, 4) >= 1 && objc_msgSend(v10, "mediaComponentType") == 1)
    {
      objc_msgSend(v10, "setScale:", 1, 4);
      objc_msgSend(v10, "setSampleMode:", 2);
    }
    -[NUStyleTransferNode inputNode](self, "inputNode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v10, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v19 = CFSTR("input");
      v20[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NURenderNode resolvedNodeWithCachedInputs:cache:pipelineState:error:](self, "resolvedNodeWithCachedInputs:cache:pipelineState:error:", v15, v8, v9, a5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    -[NUStyleTransferNode inputNode](self, "inputNode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v9, a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return 1;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v10, "objectForKeyedSubscript:", NUStyleTransferNodeConfigurationKey);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");
  objc_msgSend(v14, "removeObjectForKey:", CFSTR("priorMatrix"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, NUStyleTransferNodeConfigurationKey);
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("thumbnailWidth"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("thumbnailWidth"));
  }
  else
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("thumbnailWidth"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("thumbnailWidth"));

  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("thumbnailHeight"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("thumbnailHeight"));
  }
  else
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("thumbnailHeight"));
    v18 = v9;
    v19 = a6;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, CFSTR("thumbnailHeight"));

    a6 = v19;
    v9 = v18;
  }

  objc_msgSend(v10, "objectForKeyedSubscript:", NUStyleTransferNodeTuningParametersKey);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, NUStyleTransferNodeTuningParametersKey);

  objc_msgSend(v10, "objectForKeyedSubscript:", NUStyleTransferNodeTargetColorSpaceKey);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, NUStyleTransferNodeTargetColorSpaceKey);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("useFloat16"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, CFSTR("useFloat16"));

  if ((objc_msgSend(v11, "disableIntermediateCaching") & 1) == 0 && objc_msgSend(v11, "evaluationMode") == 1)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], NUStyleTransferNodeShouldCacheKey);
  v27.receiver = self;
  v27.super_class = (Class)NUStyleTransferThumbnailNode;
  -[NUStyleTransferNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v27, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, v9, v12, v11, a6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_evaluateImage:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NUProcessorCache *v22;
  uint64_t v23;

  -[NUStyleTransferNode inputNode](self, "inputNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputImage:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[NUStyleTransferThumbnailNode thumbnailSize](self, "thumbnailSize");
    v9 = v8;
    objc_msgSend(v6, "extent");
    if (v7 == (uint64_t)v11 && v9 == (uint64_t)v10)
    {
      v21 = v6;
    }
    else
    {
      -[NUStyleTransferNode tuningParameters](self, "tuningParameters");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUStyleTransferNode configuration](self, "configuration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "mutableCopy");

      -[NURenderNode settings](self, "settings");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("useFloat16"));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v17)
        v19 = (void *)v17;
      else
        v19 = &unk_1E50A2AC0;
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("useFloat16"));

      -[NUStyleTransferNode targetColorSpace](self, "targetColorSpace");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[_NUStyleTransferThumbnailProcessor generateThumbnailForImage:targetSize:colorSpace:configuration:tuningParameters:error:](_NUStyleTransferThumbnailProcessor, "generateThumbnailForImage:targetSize:colorSpace:configuration:tuningParameters:error:", v6, v7, v9, v20, v15, v13, a3);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if (-[NUStyleTransferNode shouldCache](self, "shouldCache"))
      {
        v22 = -[NUProcessorCache initWithImage:]([NUProcessorCache alloc], "initWithImage:", v21);
        -[NUProcessorCache setLabel:](v22, "setLabel:", CFSTR("NUStyleTransferThumbnailNode.Provider"));
        -[NUProcessorCache outputImage](v22, "outputImage");
        v23 = objc_claimAutoreleasedReturnValue();

        v21 = (id)v23;
      }

    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

@end
