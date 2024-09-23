@implementation NUMemoryCacheNode

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NUScaleNode *v26;
  uint64_t v27;
  uint64_t v28;
  NUScaleNode *v29;
  void *v30;
  NSObject *v32;
  void *v33;
  void *specific;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  objc_super v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    NUAssertLogger_12502();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v33;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12502();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v36)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = (void *)MEMORY[0x1E0CB3978];
        v41 = v39;
        objc_msgSend(v40, "callStackSymbols");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v39;
        v52 = 2114;
        v53 = v43;
        _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v36)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v38;
      _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUMemoryCacheNode nodeByReplayingAgainstCache:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 783, CFSTR("Invalid parameter not satisfying: %s"), v44, v45, v46, v47, (uint64_t)"error != NULL");
  }
  v10 = v9;
  if (objc_msgSend(v9, "evaluationMode") == 1 || !objc_msgSend(v10, "evaluationMode"))
  {
    v49.receiver = self;
    v49.super_class = (Class)NUMemoryCacheNode;
    -[NUCacheNode nodeByReplayingAgainstCache:pipelineState:error:](&v49, sel_nodeByReplayingAgainstCache_pipelineState_error_, v8, v10, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[NUCacheNode inputNode](self, "inputNode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0;
      objc_msgSend(v13, "outputImageGeometry:", &v48);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v48;

      if (v14)
      {
        v16 = objc_msgSend(v14, "renderScale");
        v18 = NUScaleMultiply(v16, v17, 1, objc_msgSend(v12, "subsampleFactor"));
        v20 = v19;
        v21 = objc_msgSend(v10, "scale");
        v23 = NUScaleDivide(v21, v22, v18, v20);
        v25 = v24;
        v26 = [NUScaleNode alloc];
        v27 = objc_msgSend(v10, "scale");
        v29 = -[NUScaleNode initWithTargetScale:effectiveScale:sampleMode:input:](v26, "initWithTargetScale:effectiveScale:sampleMode:input:", v27, v28, v23, v25, objc_msgSend(v10, "sampleMode"), v12);
        +[NURenderNode nodeFromCache:cache:](NURenderNode, "nodeFromCache:cache:", v29, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "setEvaluatedForMode:", objc_msgSend(v10, "evaluationMode"));
      }
      else
      {
        -[NUCacheNode inputNode](self, "inputNode");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("failed to get self.inputNode geometry"), v30, v15);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v11 = 0;
      }

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

- (id)persistentURL
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0C99E98]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[NUCacheNode cacheIdentifier](self, "cacheIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("x-memory-cache-node://%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithString:", v6);

  return v7;
}

- (BOOL)tryLoadPersistentURL:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)newRenderRequestWithOriginalRequest:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NUBufferRenderRequest *v7;
  void *v8;
  NUBufferRenderRequest *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  dispatch_queue_t v15;
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
  _QWORD v33[5];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    NUAssertLogger_12502();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "originalRequest != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12502();
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
        v35 = v24;
        v36 = 2114;
        v37 = v28;
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
      v35 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUMemoryCacheNode newRenderRequestWithOriginalRequest:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 830, CFSTR("Invalid parameter not satisfying: %s"), v29, v30, v31, v32, (uint64_t)"originalRequest != nil");
  }
  v6 = v5;
  v7 = [NUBufferRenderRequest alloc];
  objc_msgSend(v6, "composition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NUImageRenderRequest initWithComposition:](v7, "initWithComposition:", v8);

  +[NUColorSpace workingColorSpace](NUColorSpace, "workingColorSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUImageRenderRequest setColorSpace:](v9, "setColorSpace:", v10);

  +[NUPixelFormat RGBAh](NUPixelFormat, "RGBAh");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUImageRenderRequest setPixelFormat:](v9, "setPixelFormat:", v11);

  objc_msgSend(v6, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
  {
    objc_msgSend(v6, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderRequest setName:](v9, "setName:", v13);

  }
  else
  {
    -[NURenderRequest setName:](v9, "setName:", CFSTR("NUMemoryCacheNode-new"));
  }

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = dispatch_queue_create("NUMemoryCacheNode", v14);
  -[NURenderRequest setResponseQueue:](v9, "setResponseQueue:", v15);

  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __63__NUMemoryCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke;
  v33[3] = &unk_1E5063F70;
  v33[4] = self;
  -[NURenderRequest setCompletionBlock:](v9, "setCompletionBlock:", v33);

  return v9;
}

- (void)resolveSourceWithResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NUBufferImage *v8;
  id v9;
  void *v10;
  void *v11;
  NUCISourceNode *v12;
  NUBufferImage *cachedImage;
  NSObject *v14;
  void *v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_12502();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "response != nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v15;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_12502();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v22 = (void *)MEMORY[0x1E0CB3978];
        v23 = v21;
        objc_msgSend(v22, "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v21;
        v33 = 2114;
        v34 = v25;
        _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v20;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUMemoryCacheNode resolveSourceWithResponse:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUCacheNode.m", 847, CFSTR("Invalid parameter not satisfying: %s"), v26, v27, v28, v29, (uint64_t)"response != nil");
  }
  v5 = v4;
  v30 = 0;
  objc_msgSend(v4, "result:", &v30);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v30;
  if (v6)
  {
    objc_msgSend(v6, "image");
    v8 = (NUBufferImage *)objc_claimAutoreleasedReturnValue();
    v9 = +[NUImageFactory newCIImageFromBufferImage:](NUImageFactory, "newCIImageFromBufferImage:", v8);
    -[NUMemoryCacheNode persistentURL](self, "persistentURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[NUCISourceNode initWithImage:identifier:orientation:]([NUCISourceNode alloc], "initWithImage:identifier:orientation:", v9, v11, 1);
    -[NUCacheNode resolveWithSourceNode:error:](self, "resolveWithSourceNode:error:", v12, 0);
    cachedImage = self->_cachedImage;
    self->_cachedImage = v8;

  }
  else
  {
    -[NUCacheNode resolveWithSourceNode:error:](self, "resolveWithSourceNode:error:", 0, v7);
  }

}

- (NUBufferImage)cachedImage
{
  return (NUBufferImage *)objc_getProperty(self, a2, 224, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedImage, 0);
}

uint64_t __63__NUMemoryCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "resolveSourceWithResponse:", a2);
}

@end
