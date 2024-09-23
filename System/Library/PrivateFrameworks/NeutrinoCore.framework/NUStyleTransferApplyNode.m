@implementation NUStyleTransferApplyNode

- (NUStyleTransferApplyNode)initWithInput:(id)a3 thumbnail:(id)a4 target:(id)a5 settings:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NUStyleTransferApplyNode *v17;
  NSObject *v19;
  void *v20;
  void *specific;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[3];
  _QWORD v68[3];
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    NUAssertLogger_24413();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "input != nil");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v70 = v20;
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
        v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v41 = (void *)MEMORY[0x1E0CB3978];
        v42 = v40;
        objc_msgSend(v41, "callStackSymbols");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v70 = v40;
        v71 = 2114;
        v72 = v44;
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
      v70 = v25;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferApplyNode initWithInput:thumbnail:target:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1372, CFSTR("Invalid parameter not satisfying: %s"), v45, v46, v47, v48, (uint64_t)"input != nil");
  }
  if (!v11)
  {
    NUAssertLogger_24413();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "thumbnail != nil");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v70 = v27;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v50 = (void *)MEMORY[0x1E0CB3978];
        v51 = v49;
        objc_msgSend(v50, "callStackSymbols");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "componentsJoinedByString:", CFSTR("\n"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v70 = v49;
        v71 = 2114;
        v72 = v53;
        _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v30)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v70 = v32;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferApplyNode initWithInput:thumbnail:target:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1373, CFSTR("Invalid parameter not satisfying: %s"), v54, v55, v56, v57, (uint64_t)"thumbnail != nil");
  }
  if (!v12)
  {
    NUAssertLogger_24413();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "target != nil");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v70 = v34;
      _os_log_error_impl(&dword_1A6553000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24413();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (v35)
    {
      if (v37)
      {
        v58 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v59 = (void *)MEMORY[0x1E0CB3978];
        v60 = v58;
        objc_msgSend(v59, "callStackSymbols");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "componentsJoinedByString:", CFSTR("\n"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v70 = v58;
        v71 = 2114;
        v72 = v62;
        _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v37)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v70 = v39;
      _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUStyleTransferApplyNode initWithInput:thumbnail:target:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 1374, CFSTR("Invalid parameter not satisfying: %s"), v63, v64, v65, v66, (uint64_t)"target != nil");
  }
  v14 = v13;
  v15 = (void *)objc_msgSend(v13, "mutableCopy");
  objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("input"), CFSTR("__dominantInputSettingsKey"));
  v67[0] = CFSTR("input");
  v67[1] = CFSTR("target");
  v68[0] = v10;
  v68[1] = v12;
  v67[2] = CFSTR("thumbnail");
  v68[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[NURenderNode initWithSettings:inputs:](self, "initWithSettings:inputs:", v15, v16);

  return v17;
}

- (id)styleNode
{
  return -[NURenderNode inputForKey:](self, "inputForKey:", CFSTR("target"));
}

- (id)thumbnailNode
{
  return -[NURenderNode inputForKey:](self, "inputForKey:", CFSTR("thumbnail"));
}

- (id)targetColorSpace
{
  void *v2;
  void *v3;

  -[NUStyleTransferApplyNode styleNode](self, "styleNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetColorSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)tuningParameters
{
  void *v2;
  void *v3;

  -[NUStyleTransferApplyNode styleNode](self, "styleNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tuningParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)configuration
{
  void *v2;
  void *v3;

  -[NUStyleTransferApplyNode styleNode](self, "styleNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NUStyleTransferThumbnailNode *v20;
  void *v21;
  NUStyleTransferThumbnailNode *v22;
  void *v23;

  v8 = a3;
  v9 = a4;
  -[NUStyleTransferNode inputNode](self, "inputNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (objc_msgSend(v9, "auxiliaryImageType") == 1)
    {
      -[NUStyleTransferNode targetNode](self, "targetNode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v9, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v9, "evaluationMode") == 2)
          {
            v14 = v13;
          }
          else
          {
            v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, CFSTR("input"));
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, CFSTR("target"));
            -[NUStyleTransferApplyNode thumbnailNode](self, "thumbnailNode");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (v16)
            {
              v18 = v16;
            }
            else
            {
              -[NUStyleTransferNode inputNode](self, "inputNode");
              v18 = (id)objc_claimAutoreleasedReturnValue();
            }
            v19 = v18;

            v20 = [NUStyleTransferThumbnailNode alloc];
            objc_msgSend(v13, "settings");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = -[NUStyleTransferThumbnailNode initWithInput:settings:](v20, "initWithInput:settings:", v19, v21);

            -[NUStyleTransferThumbnailNode nodeByReplayingAgainstCache:pipelineState:error:](v22, "nodeByReplayingAgainstCache:pipelineState:error:", v8, v9, a5);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, CFSTR("thumbnail"));
              -[NURenderNode resolvedNodeWithCachedInputs:cache:pipelineState:error:](self, "resolvedNodeWithCachedInputs:cache:pipelineState:error:", v15, v8, v9, a5);
              v14 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v14 = 0;
            }

          }
        }
        else
        {
          +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("Invalid style node"), v13);
          v14 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = v11;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void (**v23)(_QWORD, _QWORD);
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v37;
  void *v38;
  id *v39;
  objc_super v40;
  _QWORD v41[4];
  id v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = (void *)objc_msgSend(a4, "mutableCopy");
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("target"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("applySyntheticNoise"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  if (!v16)
  {
LABEL_12:
    v40.receiver = self;
    v40.super_class = (Class)NUStyleTransferApplyNode;
    -[NUStyleTransferNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v40, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, v10, v12, v11, a6, v37);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  -[NUStyleTransferNode inputNode](self, "inputNode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "imageProperties:", a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v18, "metadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("90"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = v20;
      v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __86__NUStyleTransferApplyNode_resolvedNodeWithCachedInputs_settings_pipelineState_error___block_invoke;
      v41[3] = &unk_1E5063D50;
      v42 = v11;
      v23 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85C1564](v41);
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("0"));
      v38 = v18;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("Version"));

      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("1"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v23)[2](v23, v25);
      v39 = a6;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v26, CFSTR("ReadNoise"));

      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("2"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v23)[2](v23, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v28, CFSTR("ShotNoise"));

      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("3"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v23)[2](v23, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v30, CFSTR("SquaredNoise"));

      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("4"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v23)[2](v23, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v32, CFSTR("SpatialSigma"));

      v18 = v38;
      v33 = (void *)objc_msgSend(v22, "copy");
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v33, NUStyleTransferNodeNoiseModelKey);

      a6 = v39;
      v20 = v37;
    }
    else if (v21)
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
      v35 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v44 = v21;
        _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Invalid noise model from makernote, ignored: %{public}@", buf, 0xCu);
      }
    }

    goto LABEL_12;
  }
  v34 = 0;
LABEL_13:

  return v34;
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
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  float v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[NUStyleTransferNode inputNode](self, "inputNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v5, "outputImage:", &v41);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v41;

  if (v6)
  {
    -[NUStyleTransferApplyNode thumbnailNode](self, "thumbnailNode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    objc_msgSend(v8, "outputImage:", &v40);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v40;

    if (!v9)
    {
      -[NUStyleTransferApplyNode thumbnailNode](self, "thumbnailNode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to get input thumbnail image"), v13, v10);
      v23 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_35:

      v7 = v10;
      goto LABEL_36;
    }
    -[NUStyleTransferApplyNode styleNode](self, "styleNode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
    {
      -[NUStyleTransferNode targetNode](self, "targetNode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v39 = 0;
    objc_msgSend(v12, "outputImage:", &v39);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v39;

    if (!v11)
    if (!v13)
    {
      -[NUStyleTransferApplyNode styleNode](self, "styleNode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to obtain style image"), v16, v14);
      v23 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_34:

      v10 = v14;
      goto LABEL_35;
    }
    -[NUStyleTransferApplyNode configuration](self, "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E50A2AC0, CFSTR("useFloat16"));
    -[NUStyleTransferApplyNode tuningParameters](self, "tuningParameters");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUStyleTransferApplyNode targetColorSpace](self, "targetColorSpace");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ResidualScaleFactor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    v20 = v19;

    if (v20 <= 0.0)
      goto LABEL_14;
    if (+[NUGlobalSettings semanticStyleDisableResiduals](NUGlobalSettings, "semanticStyleDisableResiduals"))
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
      v21 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6553000, v21, OS_LOG_TYPE_INFO, "NUStyleTransferApplyNode: not applying residuals, disabled", buf, 2u);
      }
LABEL_14:
      v22 = 0;
LABEL_33:
      -[NUStyleTransferNode noiseModel](self, "noiseModel");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[_NUStyleTransferApplyProcessor applyStyle:toImage:thumbnail:target:deltaMap:colorSpace:configuration:tuningParameters:noiseModel:error:](_NUStyleTransferApplyProcessor, "applyStyle:toImage:thumbnail:target:deltaMap:colorSpace:configuration:tuningParameters:noiseModel:error:", v13, v6, v9, v22, 0, v37, v16, v17, v32, a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_34;
    }
    -[NUStyleTransferApplyNode styleNode](self, "styleNode");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "targetNode");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    -[NUStyleTransferApplyNode styleNode](self, "styleNode");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "thumbnailNode");
    v26 = objc_claimAutoreleasedReturnValue();

    -[NUStyleTransferApplyNode thumbnailNode](self, "thumbnailNode");
    v36 = (void *)v26;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if ((void *)v26 == v34
      || +[NUGlobalSettings semanticStyleAllowResidualsMismatch](NUGlobalSettings, "semanticStyleAllowResidualsMismatch"))
    {
      -[NUStyleTransferApplyNode thumbnailNode](self, "thumbnailNode");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if ((void *)v26 != v27)
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_623);
        v28 = _NULogger;
        if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A6553000, v28, OS_LOG_TYPE_INFO, "NUStyleTransferApplyNode: applying residuals even though thumbnails do not match", buf, 2u);
        }
      }
      v38 = 0;
      objc_msgSend(v35, "outputImage:", &v38);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v38;

      if (v22)
      {
        v14 = v29;
        v30 = v35;
LABEL_32:

        goto LABEL_33;
      }
      NULogger_24828();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v14 = v29;
        v43 = v29;
        _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "NUStyleTransferApplyNode: not applying residuals because of error: %{public}@", buf, 0xCu);
      }
      else
      {
        v14 = v29;
      }
    }
    else
    {
      NULogger_24828();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6553000, v31, OS_LOG_TYPE_INFO, "NUStyleTransferApplyNode: not applying residuals because thumbnails do not match", buf, 2u);
      }
    }
    v30 = v35;

    v22 = 0;
    goto LABEL_32;
  }
  -[NUStyleTransferNode inputNode](self, "inputNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to get input image"), v9, v7);
  v23 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:

  return v23;
}

id __86__NUStyleTransferApplyNode_resolvedNodeWithCachedInputs_settings_pipelineState_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "doubleValue");
    v6 = v5;
    v7 = objc_msgSend(*(id *)(a1 + 32), "scale");
    objc_msgSend(v4, "numberWithDouble:", v6 * NUScaleToDouble(v7, v8));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
