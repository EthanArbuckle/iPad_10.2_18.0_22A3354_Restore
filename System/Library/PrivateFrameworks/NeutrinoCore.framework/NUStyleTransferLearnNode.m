@implementation NUStyleTransferLearnNode

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NUStyleTransferThumbnailNode *v11;
  void *v12;
  void *v13;
  NUStyleTransferThumbnailNode *v14;
  void *v15;
  NUStyleTransferThumbnailNode *v16;
  void *v17;
  void *v18;
  NUStyleTransferThumbnailNode *v19;
  void *v20;
  void *v21;
  NSObject *v23;
  void *v24;
  void *specific;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "auxiliaryImageType") != 1)
  {
    NUAssertLogger_24413();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ cannot be applied to aux images"), objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v24;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v38 = (void *)MEMORY[0x1E0CB3978];
        v39 = v37;
        objc_msgSend(v38, "callStackSymbols");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v58 = v37;
        v59 = 2114;
        v60 = v41;
        _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v29;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v42 = objc_opt_class();
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferLearnNode nodeByReplayingAgainstCache:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1132, CFSTR("%@ cannot be applied to aux images"), v43, v44, v45, v46, v42);
  }
  if (objc_msgSend(v9, "evaluationMode") == 2)
  {
    NUAssertLogger_24413();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ cannot be evaluated for video"), objc_opt_class());
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v31;
      _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (v32)
    {
      if (v34)
      {
        v47 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v48 = (void *)MEMORY[0x1E0CB3978];
        v49 = v47;
        objc_msgSend(v48, "callStackSymbols");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "componentsJoinedByString:", CFSTR("\n"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v58 = v47;
        v59 = 2114;
        v60 = v51;
        _os_log_error_impl(&dword_1A6553000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v34)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v36;
      _os_log_error_impl(&dword_1A6553000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v52 = objc_opt_class();
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferLearnNode nodeByReplayingAgainstCache:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1133, CFSTR("%@ cannot be evaluated for video"), v53, v54, v55, v56, v52);
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  v11 = [NUStyleTransferThumbnailNode alloc];
  -[NUStyleTransferNode inputNode](self, "inputNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderNode settings](self, "settings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[NUStyleTransferThumbnailNode initWithInput:settings:](v11, "initWithInput:settings:", v12, v13);

  -[NUStyleTransferThumbnailNode nodeByReplayingAgainstCache:pipelineState:error:](v14, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v9, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("thumbnail"));
    v16 = [NUStyleTransferThumbnailNode alloc];
    -[NUStyleTransferNode targetNode](self, "targetNode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderNode settings](self, "settings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[NUStyleTransferThumbnailNode initWithInput:settings:](v16, "initWithInput:settings:", v17, v18);

    -[NUStyleTransferThumbnailNode nodeByReplayingAgainstCache:pipelineState:error:](v19, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v9, a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, CFSTR("target"));
      -[NURenderNode resolvedNodeWithCachedInputs:cache:pipelineState:error:](self, "resolvedNodeWithCachedInputs:cache:pipelineState:error:", v10, v8, v9, a5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return 1;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUStyleTransferLearnNode;
  -[NUStyleTransferNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v7, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_evaluateImage:(id *)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NUProcessorCache *v18;
  void *v19;
  uint64_t v20;
  NSObject *v22;
  void *v23;
  void *specific;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  id v56;
  id v57;
  id v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  -[NUStyleTransferNode thumbnailNode](self, "thumbnailNode");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    NUAssertLogger_24413();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing input thumbnail node"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v23;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v37 = (void *)MEMORY[0x1E0CB3978];
        v38 = v36;
        objc_msgSend(v37, "callStackSymbols");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = v36;
        v61 = 2114;
        v62 = v40;
        _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v28;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferLearnNode _evaluateImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1188, CFSTR("Missing input thumbnail node"), v41, v42, v43, v44, v54);
  }
  v6 = (void *)v5;
  -[NUStyleTransferNode targetNode](self, "targetNode");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    NUAssertLogger_24413();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing output thumbnail node"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v30;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (v31)
    {
      if (v33)
      {
        v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v46 = (void *)MEMORY[0x1E0CB3978];
        v47 = v45;
        objc_msgSend(v46, "callStackSymbols");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = v45;
        v61 = 2114;
        v62 = v49;
        _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v33)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v35;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferLearnNode _evaluateImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1191, CFSTR("Missing output thumbnail node"), v50, v51, v52, v53, v54);
  }
  v8 = (void *)v7;
  v58 = 0;
  objc_msgSend(v6, "outputImage:", &v58);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v58;
  if (v9)
  {
    v57 = 0;
    objc_msgSend(v8, "outputImage:", &v57);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v57;

    if (v11)
    {
      -[NUStyleTransferNode configuration](self, "configuration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");

      objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1E50A2AC0, CFSTR("useFloat16"));
      -[NUStyleTransferNode tuningParameters](self, "tuningParameters");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUStyleTransferNode targetColorSpace](self, "targetColorSpace");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = 0;
      +[_NUStyleTransferLearnProcessor learnStyleFromInputThumbnail:targetThumbnail:colorSpace:configuration:tuningParameters:error:](_NUStyleTransferLearnProcessor, "learnStyleFromInputThumbnail:targetThumbnail:colorSpace:configuration:tuningParameters:error:", v9, v11, v16, v14, v15, &v56);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v56;

      if (-[NUStyleTransferNode shouldCache](self, "shouldCache"))
      {
        v18 = -[NUProcessorCache initWithImage:]([NUProcessorCache alloc], "initWithImage:", v17);
        -[NUProcessorCache setLabel:](v18, "setLabel:", CFSTR("NUStyleTransferLearnNode.Provider"));
        +[NUPixelFormat R16h](NUPixelFormat, "R16h");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NUProcessorCache setPixelFormat:](v18, "setPixelFormat:", v19);

        -[NUProcessorCache outputImage](v18, "outputImage");
        v20 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v20;
      }

      v12 = v55;
    }
    else
    {
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Invalid target thumbnail"), v6, v12);
      v17 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    v10 = v12;
  }
  else
  {
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Invalid input thumbnail"), v6, v10);
    v17 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

@end
