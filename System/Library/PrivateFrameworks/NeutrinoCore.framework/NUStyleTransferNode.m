@implementation NUStyleTransferNode

- (NUStyleTransferNode)initWithInput:(id)a3 target:(id)a4 settings:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NUStyleTransferNode *v14;
  NSObject *v16;
  void *v17;
  void *specific;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
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
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[2];
  _QWORD v49[2];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    NUAssertLogger_24413();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "input != nil");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v17;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v31 = (void *)MEMORY[0x1E0CB3978];
        v32 = v30;
        objc_msgSend(v31, "callStackSymbols");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v30;
        v52 = 2114;
        v53 = v34;
        _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v22;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferNode initWithInput:target:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 359, CFSTR("Invalid parameter not satisfying: %s"), v35, v36, v37, v38, (uint64_t)"input != nil");
  }
  if (!v9)
  {
    NUAssertLogger_24413();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "target != nil");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v24;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v25)
    {
      if (v27)
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
      v51 = v29;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferNode initWithInput:target:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 360, CFSTR("Invalid parameter not satisfying: %s"), v44, v45, v46, v47, (uint64_t)"target != nil");
  }
  v11 = v10;
  v12 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("input"), CFSTR("__dominantInputSettingsKey"));
  v48[0] = CFSTR("input");
  v48[1] = CFSTR("target");
  v49[0] = v8;
  v49[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[NURenderNode initWithSettings:inputs:](self, "initWithSettings:inputs:", v12, v13);

  return v14;
}

- (NUColorSpace)targetColorSpace
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  +[NUColorSpace displayP3ColorSpace](NUColorSpace, "displayP3ColorSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderNode settings](self, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", NUStyleTransferNodeTargetColorSpaceKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(v5, "isEqual:", CFSTR("sRGB")))
    {
      +[NUColorSpace sRGBColorSpace](NUColorSpace, "sRGBColorSpace");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v7 = (void *)v6;

      v3 = v7;
      goto LABEL_9;
    }
    if (objc_msgSend(v5, "isEqual:", CFSTR("sRGBLinear")))
    {
      +[NUColorSpace sRGBLinearColorSpace](NUColorSpace, "sRGBLinearColorSpace");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (objc_msgSend(v5, "isEqual:", CFSTR("displayP3Linear")))
    {
      +[NUColorSpace displayP3LinearColorSpace](NUColorSpace, "displayP3LinearColorSpace");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
LABEL_9:

  return (NUColorSpace *)v3;
}

- (NSDictionary)tuningParameters
{
  void *v2;
  void *v3;

  -[NURenderNode settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", NUStyleTransferNodeTuningParametersKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSDictionary)configuration
{
  void *v2;
  void *v3;

  -[NURenderNode settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", NUStyleTransferNodeConfigurationKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (BOOL)shouldCache
{
  void *v2;
  void *v3;
  char v4;

  -[NURenderNode settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", NUStyleTransferNodeShouldCacheKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)noiseModel
{
  void *v2;
  void *v3;

  -[NURenderNode settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", NUStyleTransferNodeNoiseModelKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NURenderNode)inputNode
{
  return (NURenderNode *)-[NURenderNode inputForKey:](self, "inputForKey:", CFSTR("input"));
}

- (NURenderNode)targetNode
{
  return (NURenderNode *)-[NURenderNode inputForKey:](self, "inputForKey:", CFSTR("target"));
}

- (id)thumbnailNode
{
  return -[NURenderNode inputForKey:](self, "inputForKey:", CFSTR("thumbnail"));
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  objc_super v30;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "evaluationMode"))
  {
    if (objc_msgSend(v9, "auxiliaryImageType") == 1 && objc_msgSend(v9, "evaluationMode") != 2)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
      -[NUStyleTransferNode inputNode](self, "inputNode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "outputImageGeometry:", a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = (void *)objc_msgSend(v9, "copy");
        -[NUStyleTransferNode configuration](self, "configuration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[NUStyleTransferNode thumbnailScalePolicyForConfiguration:](NUStyleTransferNode, "thumbnailScalePolicyForConfiguration:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_msgSend(v13, "size");
        v19 = objc_msgSend(v16, "scaleForImageSize:", v17, v18);
        objc_msgSend(v14, "setScale:", v19, v20);
        -[NUStyleTransferNode inputNode](self, "inputNode");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v14, a5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          v29 = v16;
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v22, CFSTR("thumbnail"));
          -[NUStyleTransferNode targetNode](self, "targetNode");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v14, a5);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v24, CFSTR("target"));
            -[NUStyleTransferNode inputNode](self, "inputNode");
            v28 = v10;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v9, a5);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26)
            {
              v10 = v28;
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v26, CFSTR("input"));
              -[NURenderNode resolvedNodeWithCachedInputs:cache:pipelineState:error:](self, "resolvedNodeWithCachedInputs:cache:pipelineState:error:", v28, v8, v9, a5);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v11 = 0;
              v10 = v28;
            }

          }
          else
          {
            v11 = 0;
          }

          v16 = v29;
        }
        else
        {
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
      -[NUStyleTransferNode targetNode](self, "targetNode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v9, a5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)NUStyleTransferNode;
    -[NURenderNode nodeByReplayingAgainstCache:pipelineState:error:](&v30, sel_nodeByReplayingAgainstCache_pipelineState_error_, v8, v9, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return objc_msgSend(a3, "auxiliaryImageType") == 1;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUStyleTransferNode;
  -[NURenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v7, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_evaluateImage:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  id v21;
  id v22;

  -[NUStyleTransferNode inputNode](self, "inputNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v5, "outputImage:", &v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v22;

  if (v6)
  {
    -[NUStyleTransferNode thumbnailNode](self, "thumbnailNode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v8, "outputImage:", &v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v21;

    if (v9)
    {
      -[NUStyleTransferNode targetNode](self, "targetNode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      objc_msgSend(v11, "outputImage:", &v20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v20;

      if (v12)
      {
        -[NUStyleTransferNode configuration](self, "configuration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v14, "mutableCopy");

        objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_1E50A2AC0, CFSTR("useFloat16"));
        -[NUStyleTransferNode tuningParameters](self, "tuningParameters");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NUStyleTransferNode targetColorSpace](self, "targetColorSpace");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[_NUStyleTransferProcessor applyStyleFromInputThumbnail:targetThumbnail:toImage:colorSpace:configuration:tuningParameters:error:](_NUStyleTransferProcessor, "applyStyleFromInputThumbnail:targetThumbnail:toImage:colorSpace:configuration:tuningParameters:error:", v9, v12, v6, v17, v15, v16, a3);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[NUStyleTransferNode targetNode](self, "targetNode");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to get input target thumbnail image"), v15, v13);
        v18 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      -[NUStyleTransferNode thumbnailNode](self, "thumbnailNode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to get input thumbnail image"), v12, v10);
      v18 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      v13 = v10;
    }

  }
  else
  {
    v13 = objc_retainAutorelease(v7);
    v18 = 0;
    *a3 = v13;
  }

  return v18;
}

+ (id)defaultVideoSettingsForScale:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = NUStyleTransferNodeConfigurationKey;
  objc_msgSend(a1, "defaultVideoConfiguration", a3.var0, a3.var1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v8[1] = NUStyleTransferNodeTuningParametersKey;
  objc_msgSend(a1, "defaultVideoTuningParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = NUStyleTransferNodeShouldCacheKey;
  v9[1] = v5;
  v9[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)defaultImageSettingsForScale:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = NUStyleTransferNodeConfigurationKey;
  objc_msgSend(a1, "defaultImageConfiguration", a3.var0, a3.var1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = NUStyleTransferNodeTuningParametersKey;
  v9[0] = v4;
  objc_msgSend(a1, "defaultImageTuningParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)semanticStyleVideoSettingsForScale:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = NUStyleTransferNodeConfigurationKey;
  objc_msgSend(a1, "semanticStyleVideoConfiguration", a3.var0, a3.var1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v8[1] = NUStyleTransferNodeTuningParametersKey;
  objc_msgSend(a1, "semanticStyleVideoTuningParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = NUStyleTransferNodeShouldCacheKey;
  v9[1] = v5;
  v9[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)semanticStyleImageSettingsForScale:(id)a3
{
  int64_t var1;
  int64_t var0;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[3];

  var1 = a3.var1;
  var0 = a3.var0;
  v21[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "semanticStyleImageConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(a1, "semanticStyleImageTuningParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (+[NUGlobalSettings semanticStyleUseDynamicConfig](NUGlobalSettings, "semanticStyleUseDynamicConfig"))
  {
    if (NUScaleCompare(var0, var1, 2, 3) < 0)
    {
      v10 = &unk_1E50A2988;
      if (NUScaleCompare(var0, var1, 1, 3) < 0)
      {
        v15 = NUScaleCompare(var0, var1, 1, 6);
        if (v15 < 0)
          v14 = CFSTR("semstyle-image@1:8");
        else
          v14 = CFSTR("semstyle-image@1:4");
        if (v15 < 0)
          v12 = &unk_1E50A29D0;
        else
          v12 = &unk_1E50A2988;
        if (v15 < 0)
          v11 = &unk_1E50A29E8;
        else
          v11 = &unk_1E50A29B8;
        if (v15 < 0)
          v10 = &unk_1E50A29D0;
        else
          v10 = &unk_1E50A29B8;
        v13 = &unk_1E50A29A0;
      }
      else
      {
        v11 = &unk_1E50A2970;
        v12 = &unk_1E50A2958;
        v13 = &unk_1E50A29A0;
        v14 = CFSTR("semstyle-image@1:2");
      }
    }
    else
    {
      v10 = &unk_1E50A2988;
      v11 = &unk_1E50A2970;
      v12 = &unk_1E50A2958;
      v13 = &unk_1E50A2940;
      v14 = CFSTR("semstyle-image@1:1");
    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("usage"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("linearSystemOrder"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("spotlightCountX"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("spotlightCountY"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("weightPlaneCount"));
  }
  if (+[NUGlobalSettings semanticStyleForceResiduals](NUGlobalSettings, "semanticStyleForceResiduals"))
    objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E50A3960, CFSTR("ResidualScaleFactor"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("SpotlightCount_X"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("SpotlightCount_Y"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("WeightPlaneCount"));
  v20[0] = NUStyleTransferNodeConfigurationKey;
  v16 = (void *)objc_msgSend(v7, "copy");
  v20[1] = NUStyleTransferNodeTuningParametersKey;
  v21[0] = v16;
  v17 = (void *)objc_msgSend(v9, "copy");
  v21[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (NSDictionary)defaultImageConfiguration
{
  return (NSDictionary *)&unk_1E50A3598;
}

+ (NSDictionary)defaultImageTuningParameters
{
  return (NSDictionary *)&unk_1E50A35C0;
}

+ (NSDictionary)defaultVideoConfiguration
{
  return (NSDictionary *)&unk_1E50A35E8;
}

+ (NSDictionary)defaultVideoTuningParameters
{
  return (NSDictionary *)&unk_1E50A3610;
}

+ (NSDictionary)semanticStyleVideoConfiguration
{
  void *v2;
  _NUStyleEngineConfiguration *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D08AE0], "configurationForUseCase:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[_NUStyleEngineConfiguration initWithStyleEngineConfiguration:]([_NUStyleEngineConfiguration alloc], "initWithStyleEngineConfiguration:", v2);
  -[_NUStyleEngineConfiguration setUsage:](v3, "setUsage:", CFSTR("semstyle-video"));
  -[_NUStyleEngineConfiguration configurationDictionary](v3, "configurationDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

+ (NSDictionary)semanticStyleVideoTuningParameters
{
  return (NSDictionary *)objc_msgSend(MEMORY[0x1E0D08AE0], "tuningParametersForUseCase:", 1);
}

+ (NSDictionary)semanticStyleImageConfiguration
{
  void *v2;
  _NUStyleEngineConfiguration *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D08AE0], "configurationForUseCase:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setApplySyntheticNoise:", +[NUGlobalSettings semanticStyleForceSyntheticNoise](NUGlobalSettings, "semanticStyleForceSyntheticNoise"));
  v3 = -[_NUStyleEngineConfiguration initWithStyleEngineConfiguration:]([_NUStyleEngineConfiguration alloc], "initWithStyleEngineConfiguration:", v2);
  -[_NUStyleEngineConfiguration setUsage:](v3, "setUsage:", CFSTR("semstyle-image"));
  -[_NUStyleEngineConfiguration configurationDictionary](v3, "configurationDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

+ (NSDictionary)semanticStyleImageTuningParameters
{
  return (NSDictionary *)objc_msgSend(MEMORY[0x1E0D08AE0], "tuningParametersForUseCase:", 0);
}

+ (id)thumbnailScalePolicyForConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NUFitScalePolicy *v9;
  NSObject *v11;
  void *v12;
  void *specific;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
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
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const __CFString *v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    NUAssertLogger_24413();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "config != nil");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v28 = (void *)MEMORY[0x1E0CB3978];
        v29 = v27;
        objc_msgSend(v28, "callStackSymbols");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v27;
        v48 = 2114;
        v49 = v31;
        _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUStyleTransferNode thumbnailScalePolicyForConfiguration:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 348, CFSTR("Invalid parameter not satisfying: %s"), v32, v33, v34, v35, (uint64_t)"config != nil");
  }
  v4 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("thumbnailWidth"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumbnailWidth"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if ((v8 | v6) < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = CFSTR("(width >= 0) && (height >= 0)");
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("NUGeometryPrimitives.h"), 38, CFSTR("Invalid parameter not satisfying: %@"));

    if (!v6)
    {
LABEL_12:
      NUAssertLogger_24413();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid thumbnail size"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v47 = v21;
        _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_24413();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
      if (v22)
      {
        if (v24)
        {
          v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v37 = (void *)MEMORY[0x1E0CB3978];
          v38 = v36;
          objc_msgSend(v37, "callStackSymbols");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v47 = v36;
          v48 = 2114;
          v49 = v40;
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
        v47 = v26;
        _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"+[NUStyleTransferNode thumbnailScalePolicyForConfiguration:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 353, CFSTR("Invalid thumbnail size"), v41, v42, v43, v44, (uint64_t)v45);
    }
  }
  else if (!v6)
  {
    goto LABEL_12;
  }
  if (!v8)
    goto LABEL_12;
  v9 = -[NUFitScalePolicy initWithTargetPixelSize:]([NUFitScalePolicy alloc], "initWithTargetPixelSize:", v6, v8);

  return v9;
}

@end
