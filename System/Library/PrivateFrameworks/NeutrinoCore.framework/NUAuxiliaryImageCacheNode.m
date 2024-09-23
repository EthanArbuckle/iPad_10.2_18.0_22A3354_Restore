@implementation NUAuxiliaryImageCacheNode

- (NUAuxiliaryImageCacheNode)initWithInput:(id)a3 auxiliaryImageType:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NUAuxiliaryImageCacheNode *v10;
  objc_super v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = CFSTR("auxiliaryImageType");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)NUAuxiliaryImageCacheNode;
  v10 = -[NUCacheNode initWithInput:settings:](&v12, sel_initWithInput_settings_, v7, v9);

  return v10;
}

- (int64_t)subsampleFactorForScale:(id)a3
{
  return 2;
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
  objc_msgSend(v4, "stringWithFormat:", CFSTR("x-auxiliary-image-cache-node://%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithString:", v6);

  return v7;
}

- (BOOL)tryLoadPersistentURL:(id)a3 error:(id *)a4
{
  return 0;
}

- (int64_t)auxiliaryImageType
{
  void *v2;
  void *v3;
  int64_t v4;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[12];
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[NURenderNode settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("auxiliaryImageType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    NUAssertLogger_25494();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Require a auxImageTypeValue setting"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_25494();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v22 = 138543618;
        *(_QWORD *)&v22[4] = v13;
        v23 = 2114;
        v24 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUAuxiliaryImageCacheNode auxiliaryImageType]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUAuxiliaryImageCacheNode.m", 61, CFSTR("Require a auxImageTypeValue setting"), v18, v19, v20, v21, *(uint64_t *)v22);
  }
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (BOOL)sourceSupportsAuxiliaryImage
{
  void *v2;
  void *v3;
  char v4;

  -[NURenderNode settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sourceSupportsAuxiliaryImage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  uint64_t v15;

  v8 = a3;
  v9 = a4;
  if (+[NUGlobalSettings disableAuxiliaryImageCacheFromSource](NUGlobalSettings, "disableAuxiliaryImageCacheFromSource"))
  {
    goto LABEL_3;
  }
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v10, "setAuxiliaryImageType:", -[NUAuxiliaryImageCacheNode auxiliaryImageType](self, "auxiliaryImageType"));
  -[NUCacheNode inputNode](self, "inputNode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v11, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v10, &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_3:
    v14.receiver = self;
    v14.super_class = (Class)NUAuxiliaryImageCacheNode;
    -[NUCacheNode nodeByReplayingAgainstCache:pipelineState:error:](&v14, sel_nodeByReplayingAgainstCache_pipelineState_error_, v8, v9, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)evaluateSettings:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;

  v7 = a4;
  v8 = (void *)objc_msgSend(a3, "mutableCopy");
  v9 = objc_msgSend(v7, "auxiliaryImageType");

  if (v9 == -[NUAuxiliaryImageCacheNode auxiliaryImageType](self, "auxiliaryImageType"))
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("sourceSupportsAuxiliaryImage"));
  return v8;
}

- (id)newRenderRequestWithOriginalRequest:(id)a3 error:(id *)a4
{
  id v5;
  int64_t v6;
  NUAuxiliaryImageRenderRequest *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];

  v5 = a3;
  v6 = -[NUAuxiliaryImageCacheNode auxiliaryImageType](self, "auxiliaryImageType");
  if (-[NUAuxiliaryImageCacheNode sourceSupportsAuxiliaryImage](self, "sourceSupportsAuxiliaryImage"))
  {
    v7 = -[NURenderRequest initWithRequest:]([NUAuxiliaryImageRenderRequest alloc], "initWithRequest:", v5);
    -[NUAuxiliaryImageRenderRequest setAuxiliaryImageType:](v7, "setAuxiliaryImageType:", v6);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __71__NUAuxiliaryImageCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke;
    v13[3] = &unk_1E5063F70;
    v13[4] = self;
    v8 = v13;
  }
  else
  {
    if ((unint64_t)(v6 - 3) >= 2)
    {
      if (v6 != 9)
      {
        v7 = -[NURenderRequest initWithRequest:]([NUAuxiliaryImageRenderRequest alloc], "initWithRequest:", v5);
        -[NUAuxiliaryImageRenderRequest setAuxiliaryImageType:](v7, "setAuxiliaryImageType:", v6);
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __71__NUAuxiliaryImageCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke_3;
        v11[3] = &unk_1E5063F70;
        v11[4] = self;
        v8 = v11;
        goto LABEL_9;
      }
      v9 = 3;
    }
    else
    {
      v9 = 1;
    }
    v7 = -[NURenderRequest initWithRequest:]([NUVisionSegmentationRequest alloc], "initWithRequest:", v5);
    -[NUAuxiliaryImageRenderRequest setSegmentationType:](v7, "setSegmentationType:", v9);
    -[NUAuxiliaryImageRenderRequest setProduceConfidenceMap:](v7, "setProduceConfidenceMap:", 0);
    -[NUAuxiliaryImageRenderRequest setVisionSegmentationPolicy:](v7, "setVisionSegmentationPolicy:", 3);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__NUAuxiliaryImageCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke_2;
    v12[3] = &unk_1E5063F70;
    v12[4] = self;
    v8 = v12;
  }
LABEL_9:
  -[NURenderRequest setCompletionBlock:](v7, "setCompletionBlock:", v8);

  return v7;
}

- (void)resolveSourceWithPixelBuffer:(__CVBuffer *)a3
{
  void *v4;
  void *v5;
  NUCISourceNode *v6;
  id v7;

  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCVPixelBuffer:", a3);
  -[NUAuxiliaryImageCacheNode persistentURL](self, "persistentURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[NUCISourceNode initWithImage:identifier:orientation:]([NUCISourceNode alloc], "initWithImage:identifier:orientation:", v7, v5, 1);
  -[NUCacheNode resolveWithSourceNode:error:](self, "resolveWithSourceNode:error:", v6, 0);

}

void __71__NUAuxiliaryImageCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = 0;
  objc_msgSend(a2, "result:", &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  v5 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "auxiliaryImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resolveSourceWithPixelBuffer:", objc_msgSend(v6, "cvPixelBufferRef"));

  }
  else
  {
    objc_msgSend(v5, "resolveWithSourceNode:error:", 0, v4);
  }

}

void __71__NUAuxiliaryImageCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = 0;
  objc_msgSend(a2, "result:", &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  v5 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "matteImageBuffer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resolveSourceWithPixelBuffer:", objc_msgSend(v6, "CVPixelBuffer"));

  }
  else
  {
    objc_msgSend(v5, "resolveWithSourceNode:error:", 0, v4);
  }

}

void __71__NUAuxiliaryImageCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = 0;
  objc_msgSend(a2, "result:", &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  v5 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "auxiliaryImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resolveSourceWithPixelBuffer:", objc_msgSend(v6, "cvPixelBufferRef"));

  }
  else
  {
    objc_msgSend(v5, "resolveWithSourceNode:error:", 0, v4);
  }

}

@end
