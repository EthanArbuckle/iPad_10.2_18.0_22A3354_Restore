@implementation NUImageCacheNode

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NUScaleNode *v18;
  uint64_t v19;
  uint64_t v20;
  NUScaleNode *v21;
  NSObject *v23;
  void *v24;
  void *specific;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  objc_super v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    NUAssertLogger_12502();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v24;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12502();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v31 = (void *)MEMORY[0x1E0CB3978];
        v32 = v30;
        objc_msgSend(v31, "callStackSymbols");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v30;
        v42 = 2114;
        v43 = v34;
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
      v41 = v29;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageCacheNode nodeByReplayingAgainstCache:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 651, CFSTR("Invalid parameter not satisfying: %s"), v35, v36, v37, v38, (uint64_t)"error != NULL");
  }
  v10 = v9;
  if (objc_msgSend(v9, "evaluationMode") == 1 || !objc_msgSend(v10, "evaluationMode"))
  {
    v39.receiver = self;
    v39.super_class = (Class)NUImageCacheNode;
    -[NUCacheNode nodeByReplayingAgainstCache:pipelineState:error:](&v39, sel_nodeByReplayingAgainstCache_pipelineState_error_, v8, v10, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = objc_msgSend(v10, "scale");
      v15 = NUScaleDivide(v13, v14, 1, objc_msgSend(v12, "subsampleFactor"));
      v17 = v16;
      v18 = [NUScaleNode alloc];
      v19 = objc_msgSend(v10, "scale");
      v21 = -[NUScaleNode initWithTargetScale:effectiveScale:sampleMode:input:](v18, "initWithTargetScale:effectiveScale:sampleMode:input:", v19, v20, v15, v17, objc_msgSend(v10, "sampleMode"), v12);
      +[NURenderNode nodeFromCache:cache:](NURenderNode, "nodeFromCache:cache:", v21, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setEvaluatedForMode:", objc_msgSend(v10, "evaluationMode"));
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("Cannot evaluate cache node"), self);
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (BOOL)tryLoadPersistentURL:(id)a3 error:(id *)a4
{
  id v6;
  NUCGImageSourceNode *v7;
  void *v8;
  NUCGImageSourceNode *v9;
  _BOOL4 v10;

  v6 = a3;
  v7 = [NUCGImageSourceNode alloc];
  objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NUCGImageSourceNode initWithURL:UTI:identifier:](v7, "initWithURL:UTI:identifier:", v6, v8, CFSTR("cache"));

  v10 = -[NUCGImageSourceNode load:](v9, "load:", a4);
  if (v10)
    -[NUCacheNode resolveWithSourceNode:error:](self, "resolveWithSourceNode:error:", v9, 0);

  return v10;
}

- (id)persistentURL
{
  void *v2;
  void *v3;

  -[NUCacheNode persistentURLPrefix](self, "persistentURLPrefix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathExtension:", CFSTR("jpg"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)newRenderRequestWithOriginalRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NUImageExportFormatJPEG *v12;
  NUImageExportRequest *v13;
  void *v14;
  NUImageExportRequest *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  NSObject *v22;
  void *v23;
  void *specific;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[5];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_12502();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "originalRequest != nil");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v23;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12502();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v30 = (void *)MEMORY[0x1E0CB3978];
        v31 = v29;
        objc_msgSend(v30, "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v29;
        v41 = 2114;
        v42 = v33;
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
      v40 = v28;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageCacheNode newRenderRequestWithOriginalRequest:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 689, CFSTR("Invalid parameter not satisfying: %s"), v34, v35, v36, v37, (uint64_t)"originalRequest != nil");
  }
  v7 = v6;
  -[NUCacheNode temporaryURLPrefix](self, "temporaryURLPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathExtension:", CFSTR("jpg"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NUCacheNode inputNode](self, "inputNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageProperties:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_alloc_init(NUImageExportFormatJPEG);
    +[NUGlobalSettings cacheNodeImageCompression](NUGlobalSettings, "cacheNodeImageCompression");
    -[NUImageExportFormatJPEG setCompressionQuality:](v12, "setCompressionQuality:");
    v13 = [NUImageExportRequest alloc];
    objc_msgSend(v7, "composition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[NUImageExportRequest initWithComposition:exportFormat:](v13, "initWithComposition:exportFormat:", v14, v12);

    -[NUExportRequest setDestinationURL:](v15, "setDestinationURL:", v9);
    objc_msgSend(v7, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
    {
      objc_msgSend(v7, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NURenderRequest setName:](v15, "setName:", v17);

    }
    else
    {
      -[NURenderRequest setName:](v15, "setName:", CFSTR("NUImageCacheNode-new"));
    }

    objc_msgSend(v11, "colorSpace");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUImageExportRequest setColorSpace:](v15, "setColorSpace:", v18);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("NUImageCacheNode", v19);
    -[NURenderRequest setResponseQueue:](v15, "setResponseQueue:", v20);

    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __62__NUImageCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke;
    v38[3] = &unk_1E5063F70;
    v38[4] = self;
    -[NURenderRequest setCompletionBlock:](v15, "setCompletionBlock:", v38);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __62__NUImageCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "resolveSourceWithResponse:", a2);
}

@end
