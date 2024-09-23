@implementation NUVideoCacheNode

- (id)_evaluateImageGeometry:(id *)a3
{
  uint64_t v3;
  void *v4;
  NUImageGeometry *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NUImageGeometry *v11;
  uint64_t v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NUVideoCacheNode;
  -[NUCacheNode _evaluateImageGeometry:](&v14, sel__evaluateImageGeometry_, a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  v5 = [NUImageGeometry alloc];
  objc_msgSend(v4, "extent");
  v6 = objc_msgSend(v4, "renderScale");
  v8 = v7;
  v9 = objc_msgSend(v4, "orientation");
  objc_msgSend(v4, "spaceMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NUImageGeometry initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:](v5, "initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:", &v13, v6, v8, v9, v10, 4);

  return v11;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NUScaleNode *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NUScaleNode *v36;
  NSObject *v38;
  void *v39;
  void *specific;
  NSObject *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
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
  uint64_t v55;
  objc_super v56;
  objc_super v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    NUAssertLogger_12502();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v59 = v39;
      _os_log_error_impl(&dword_1A6553000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12502();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v42)
      {
        v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v46 = (void *)MEMORY[0x1E0CB3978];
        v47 = v45;
        objc_msgSend(v46, "callStackSymbols");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v59 = v45;
        v60 = 2114;
        v61 = v49;
        _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v42)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v59 = v44;
      _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoCacheNode nodeByReplayingAgainstCache:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 882, CFSTR("Invalid parameter not satisfying: %s"), v50, v51, v52, v53, (uint64_t)"error != NULL");
  }
  v10 = v9;
  if (objc_msgSend(v9, "evaluationMode") == 1)
  {
    -[NUCacheNode inputNode](self, "inputNode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v10, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

    goto LABEL_20;
  }
  if (objc_msgSend(v10, "evaluationMode") == 3)
  {
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v11, "setEvaluationMode:", 2);
    v57.receiver = self;
    v57.super_class = (Class)NUVideoCacheNode;
    -[NUCacheNode nodeByReplayingAgainstCache:pipelineState:error:](&v57, sel_nodeByReplayingAgainstCache_pipelineState_error_, v8, v11, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "resolvedSourceNode:", a5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "resolvedNodeWithCachedInputs:settings:pipelineState:error:", MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70], v10, a5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          -[NUCacheNode inputNode](self, "inputNode");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "outputImageGeometry:", a5);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            v20 = objc_msgSend(v10, "scale");
            v22 = v21;
            v23 = objc_msgSend(v19, "renderScale");
            v25 = NUScaleDivide(v20, v22, v23, v24);
            v27 = NUScaleDivide(v25, v26, 1, objc_msgSend(v14, "subsampleFactor"));
            v54 = v28;
            v55 = v27;
            v29 = [NUScaleNode alloc];
            v30 = v19;
            v31 = objc_msgSend(v10, "scale");
            v33 = v32;
            v34 = objc_msgSend(v10, "sampleMode");
            v35 = v31;
            v19 = v30;
            v36 = -[NUScaleNode initWithTargetScale:effectiveScale:sampleMode:input:](v29, "initWithTargetScale:effectiveScale:sampleMode:input:", v35, v33, v55, v54, v34, v17);
            -[NURenderNode setEvaluatedForMode:](v36, "setEvaluatedForMode:", objc_msgSend(v10, "evaluationMode"));
            +[NURenderNode nodeFromCache:cache:](NURenderNode, "nodeFromCache:cache:", v36, v8);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("failed to get self.inputNode geometry"), v16, *a5);
            v12 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }

        }
        else
        {
          +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to resolve video frame node"), v16, *a5);
          v12 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

    goto LABEL_19;
  }
  v56.receiver = self;
  v56.super_class = (Class)NUVideoCacheNode;
  -[NUCacheNode nodeByReplayingAgainstCache:pipelineState:error:](&v56, sel_nodeByReplayingAgainstCache_pipelineState_error_, v8, v10, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v12;
}

- (BOOL)tryLoadPersistentURL:(id)a3 error:(id *)a4
{
  id v6;
  NUVideoSourceNode *v7;
  _BOOL4 v8;

  v6 = a3;
  v7 = -[NUVideoSourceNode initWithURL:identifier:options:]([NUVideoSourceNode alloc], "initWithURL:identifier:options:", v6, CFSTR("cache"), 0);

  v8 = -[NUVideoSourceNode load:](v7, "load:", a4);
  if (v8)
    -[NUCacheNode resolveWithSourceNode:error:](self, "resolveWithSourceNode:error:", v7, 0);

  return v8;
}

- (id)outputSettings:(id *)a3
{
  return objc_alloc_init(MEMORY[0x1E0C99E08]);
}

- (id)persistentURL
{
  void *v2;
  void *v3;

  -[NUCacheNode persistentURLPrefix](self, "persistentURLPrefix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathExtension:", CFSTR("mov"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)newRenderRequestWithOriginalRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NUVideoExportRequest *v10;
  void *v11;
  NUVideoExportRequest *v12;
  void *v13;
  void *v14;
  void *v15;
  NUVideoExportRequest *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  NSObject *v20;
  void *v21;
  void *specific;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[5];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_12502();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "originalRequest != nil");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v21;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12502();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v28 = (void *)MEMORY[0x1E0CB3978];
        v29 = v27;
        objc_msgSend(v28, "callStackSymbols");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v27;
        v39 = 2114;
        v40 = v31;
        _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v26;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoCacheNode newRenderRequestWithOriginalRequest:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 962, CFSTR("Invalid parameter not satisfying: %s"), v32, v33, v34, v35, (uint64_t)"originalRequest != nil");
  }
  v7 = v6;
  -[NUCacheNode temporaryURLPrefix](self, "temporaryURLPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathExtension:", CFSTR("mov"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [NUVideoExportRequest alloc];
  objc_msgSend(v7, "composition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NUExportRequest initWithComposition:destinationURL:](v10, "initWithComposition:destinationURL:", v11, v9);

  -[NUVideoCacheNode outputSettings:](self, "outputSettings:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[NUVideoExportRequest setOutputSettings:](v12, "setOutputSettings:", v13);
    -[NUVideoExportRequest setApplyOrientationAsMetadata:](v12, "setApplyOrientationAsMetadata:", 0);
    objc_msgSend(v7, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
    {
      objc_msgSend(v7, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NURenderRequest setName:](v12, "setName:", v15);

    }
    else
    {
      -[NURenderRequest setName:](v12, "setName:", CFSTR("NUVideoCacheNode-new"));
    }

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("NUVideoCacheNode", v17);
    -[NURenderRequest setResponseQueue:](v12, "setResponseQueue:", v18);

    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __62__NUVideoCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke;
    v36[3] = &unk_1E5063F70;
    v36[4] = self;
    -[NURenderRequest setCompletionBlock:](v12, "setCompletionBlock:", v36);
    v16 = v12;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t __62__NUVideoCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "resolveSourceWithResponse:", a2);
}

@end
