@implementation NUOrientationNode

- (NUOrientationNode)initWithOrientation:(int64_t)a3 input:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NUOrientationNode *v11;
  NSObject *v13;
  void *v14;
  void *specific;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  objc_super v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((unint64_t)(a3 - 1) >= 8)
  {
    NUAssertLogger_11707();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "NUOrientationIsValid(orientation)");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v14;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_11707();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v21 = (void *)MEMORY[0x1E0CB3978];
        v22 = v20;
        objc_msgSend(v21, "callStackSymbols");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v20;
        v36 = 2114;
        v37 = v24;
        _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v19;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUOrientationNode initWithOrientation:input:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Orientation.m", 44, CFSTR("Invalid parameter not satisfying: %s"), v25, v26, v27, v28, (uint64_t)"NUOrientationIsValid(orientation)");
  }
  v7 = v6;
  v32 = CFSTR("orientation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = *MEMORY[0x1E0C9E1F8];
  v31 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29.receiver = self;
  v29.super_class = (Class)NUOrientationNode;
  v11 = -[NURenderNode initWithSettings:inputs:](&v29, sel_initWithSettings_inputs_, v9, v10);

  v11->_orientation = a3;
  return v11;
}

- (NUOrientationNode)initWithSettings:(id)a3 inputs:(id)a4
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11725);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_11725);
      goto LABEL_8;
    }
    if (v15 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11725);
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
  _NUAssertFailHandler((uint64_t)"-[NUOrientationNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Orientation.m", 55, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v29, v30, v31, v32, v28);
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return 1;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  _QWORD *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NUOrientationNode;
  -[NURenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v9, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v7[21] = self->_orientation;
  return v7;
}

- (BOOL)isGeometryNode
{
  return 1;
}

- (id)_evaluateImage:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  -[NURenderNode inputForKey:](self, "inputForKey:", *MEMORY[0x1E0C9E1F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputImage:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && -[NUOrientationNode orientation](self, "orientation") != 1)
  {
    objc_msgSend(v5, "outputImageGeometry:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      v9 = objc_msgSend(v7, "scaledSize");
      v11 = v10;
      objc_msgSend(v8, "physicalScaledExtent");
      v16 = 0u;
      v17 = 0u;
      v15 = 0u;
      NUOrientationMakeTransformWithSizeAndOrigin(-[NUOrientationNode orientation](self, "orientation"), v9, v11, v18, v19, (uint64_t)&v15);
      v14[0] = v15;
      v14[1] = v16;
      v14[2] = v17;
      objc_msgSend(v6, "imageByApplyingTransform:", v14);
      v12 = objc_claimAutoreleasedReturnValue();

      v6 = v8;
    }
    else
    {
      v12 = 0;
    }

    v6 = (void *)v12;
  }

  return v6;
}

- (int64_t)outputImageOrientation:(int64_t)a3
{
  int64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = -[NUOrientationNode orientation](self, "orientation");
  v5 = 6;
  if (v4 != 8)
    v5 = v4;
  if (v4 == 6)
    v6 = 8;
  else
    v6 = v5;
  return NUOrientationConcat(a3, v6);
}

- (id)_evaluateImageGeometry:(id *)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  NUImageGeometry *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NUImageGeometry *v12;
  _OWORD v14[2];
  int8x16_t v15;
  int8x16_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)NUOrientationNode;
  -[NURenderNode _evaluateImageGeometry:](&v17, sel__evaluateImageGeometry_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v4, "extent");
    if ((unint64_t)(-[NUOrientationNode orientation](self, "orientation") - 5) <= 3)
    {
      v15 = vextq_s8(v15, v15, 8uLL);
      v16 = vextq_s8(v16, v16, 8uLL);
    }
    v6 = -[NUOrientationNode outputImageOrientation:](self, "outputImageOrientation:", objc_msgSend(v5, "orientation"));
    v7 = [NUImageGeometry alloc];
    v8 = objc_msgSend(v5, "renderScale");
    v10 = v9;
    v11 = objc_msgSend(v5, "roundingPolicy");
    v14[0] = v15;
    v14[1] = v16;
    v12 = -[NUImageGeometry initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:](v7, "initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:", v14, v8, v10, v6, 0, v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_transformWithError:(id *)a3
{
  NUImageTransformOrientation *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NUImageTransformOrientation *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
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
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_11707();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_11707();
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
        v37 = v24;
        v38 = 2114;
        v39 = v28;
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
      v37 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUOrientationNode _transformWithError:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Orientation.m", 173, CFSTR("Invalid parameter not satisfying: %s"), v29, v30, v31, v32, (uint64_t)"error != nil");
  }
  -[NUOrientationNode transform](self, "transform");
  v5 = (NUImageTransformOrientation *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[NURenderNode inputForKey:](self, "inputForKey:", *MEMORY[0x1E0C9E1F8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    objc_msgSend(v6, "outputImageGeometry:", &v35);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = [NUImageTransformOrientation alloc];
      v10 = -[NUOrientationNode orientation](self, "orientation");
      v11 = objc_msgSend(v8, "size");
      v13 = v12;
      objc_msgSend(v8, "extent");
      v5 = -[NUImageTransformOrientation initWithOrientation:imageSize:imageOrigin:](v9, "initWithOrientation:imageSize:imageOrigin:", v10, v11, v13, v33, v34);
      -[NUOrientationNode setTransform:](self, "setTransform:", v5);

    }
    else
    {
      v14 = v35;
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Cannot obtain input image geometry"), v6, v14);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      v5 = 0;
      *a3 = v15;
    }

  }
  return v5;
}

- (id)_evaluateVideoProperties:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _NUVideoProperties *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v33;
  void *v34;
  void *specific;
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
  _OWORD v51[2];
  _OWORD v52[2];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE buf[32];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_11707();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v34;
      _os_log_error_impl(&dword_1A6553000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_11707();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v37)
      {
        v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v41 = (void *)MEMORY[0x1E0CB3978];
        v42 = v40;
        objc_msgSend(v41, "callStackSymbols");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v40;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v44;
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
      *(_QWORD *)&buf[4] = v39;
      _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUOrientationNode _evaluateVideoProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Orientation.m", 198, CFSTR("Invalid parameter not satisfying: %s"), v45, v46, v47, v48, (uint64_t)"error != NULL");
  }
  -[NURenderNode inputs](self, "inputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1F8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "videoProperties:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NURenderNode outputImageGeometry:](self, "outputImageGeometry:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v55 = 0u;
      v56 = 0u;
      objc_msgSend(v7, "cleanAperture");
      v9 = -[NUOrientationNode orientation](self, "orientation");
      v10 = objc_msgSend(v7, "size");
      *(_OWORD *)buf = v55;
      *(_OWORD *)&buf[16] = v56;
      NU::RectT<long>::applyOrientation((uint64_t *)buf, v9, v10, v11);
      v55 = *(_OWORD *)buf;
      v56 = *(_OWORD *)&buf[16];
      v53 = 0u;
      v54 = 0u;
      objc_msgSend(v7, "originalCleanAperture");
      v12 = -[NUOrientationNode orientation](self, "orientation");
      v13 = objc_msgSend(v7, "originalSize");
      *(_OWORD *)buf = v53;
      *(_OWORD *)&buf[16] = v54;
      NU::RectT<long>::applyOrientation((uint64_t *)buf, v12, v13, v14);
      v53 = *(_OWORD *)buf;
      v54 = *(_OWORD *)&buf[16];
      v15 = -[NUOrientationNode orientation](self, "orientation");
      v16 = objc_msgSend(v7, "originalSize");
      v18 = NUOrientationTransformImageSize(v15, v16, v17);
      v20 = v19;
      v21 = -[_NUVideoProperties initWithProperties:]([_NUVideoProperties alloc], "initWithProperties:", v7);
      v52[0] = v55;
      v52[1] = v56;
      -[_NUVideoProperties setCleanAperture:](v21, "setCleanAperture:", v52);
      v51[0] = v53;
      v51[1] = v54;
      -[_NUVideoProperties setOriginalCleanAperture:](v21, "setOriginalCleanAperture:", v51);
      v22 = objc_msgSend(v8, "scaledSize");
      -[_NUVideoProperties setSize:](v21, "setSize:", v22, v23);
      v24 = -[NUOrientationNode orientation](self, "orientation");
      v25 = objc_msgSend(v7, "size");
      v27 = NUOrientationTransformImageSize(v24, v25, v26);
      v29 = v28;
      v30 = -[_NUVideoProperties size](v21, "size");
      if (v30 < v27)
        v27 = v30;
      -[_NUVideoProperties size](v21, "size");
      if (v31 < v29)
        v29 = v31;
      if ((v29 | v27) < 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, CFSTR("NUGeometryPrimitives.h"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(width >= 0) && (height >= 0)"));

      }
      -[_NUVideoProperties setSize:](v21, "setSize:", v27, v29);
      -[_NUVideoProperties setOriginalSize:](v21, "setOriginalSize:", v18, v20);
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

- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NUOrientationNode;
  return -[NURenderNode canPropagateOriginalAuxiliaryData:](&v4, sel_canPropagateOriginalAuxiliaryData_, a3);
}

- (id)_evaluateAuxiliaryImageForType:(int64_t)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NUOrientationNode;
  -[NURenderNode _evaluateAuxiliaryImageForType:error:](&v8, sel__evaluateAuxiliaryImageForType_error_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NUOrientationNode orientation](self, "orientation") != 1)
  {
    objc_msgSend(v5, "auxiliaryImageByApplyingExifOrientation:", -[NUOrientationNode orientation](self, "orientation"));
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

- (BOOL)requiresVideoComposition
{
  void *v2;
  char v3;

  -[NURenderNode inputForKey:](self, "inputForKey:", *MEMORY[0x1E0C9E1F8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requiresVideoComposition");

  return v3;
}

- (id)_evaluateVideo:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  id v19;
  NSObject *v21;
  void *v22;
  void *specific;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD v37[3];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  uint8_t buf[32];
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_11707();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v22;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_11707();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v29 = (void *)MEMORY[0x1E0CB3978];
        v30 = v28;
        objc_msgSend(v29, "callStackSymbols");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v28;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v32;
        _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v27;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUOrientationNode _evaluateVideo:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Orientation.m", 262, CFSTR("Invalid parameter not satisfying: %s"), v33, v34, v35, v36, (uint64_t)"error != nil");
  }
  v45.receiver = self;
  v45.super_class = (Class)NUOrientationNode;
  -[NURenderNode _evaluateVideo:](&v45, sel__evaluateVideo_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    v8 = v7;
    if (v7)
    {
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      objc_msgSend(v7, "tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v42 != v11)
              objc_enumerationMutation(v9);
            v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            objc_msgSend(v13, "naturalSize");
            v15 = v14;
            v17 = v16;
            v47 = 0u;
            memset(buf, 0, sizeof(buf));
            if (v13)
              objc_msgSend(v13, "preferredTransform");
            v38 = *(_OWORD *)buf;
            v39 = *(_OWORD *)&buf[16];
            v40 = v47;
            v18 = NUOrientationConcat(+[NUVideoUtilities videoOrientationForAssetPreferredTransform:](NUVideoUtilities, "videoOrientationForAssetPreferredTransform:", &v38), -[NUOrientationNode orientation](self, "orientation"));
            v39 = 0u;
            v40 = 0u;
            v38 = 0u;
            +[NUVideoUtilities preferredTransformFromOrientation:size:](NUVideoUtilities, "preferredTransformFromOrientation:size:", v18, (uint64_t)v15, (uint64_t)v17);
            v37[0] = v38;
            v37[1] = v39;
            v37[2] = v40;
            objc_msgSend(v13, "setPreferredTransform:", v37);
          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
        }
        while (v10);
      }

      v19 = v8;
    }
    else
    {
      +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 1, CFSTR("[NUOrientationNode _evaluateVideo] failed to get mutableCopy"), v6);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (NUImageTransform)transform
{
  return (NUImageTransform *)objc_getProperty(self, a2, 176, 1);
}

- (void)setTransform:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transform, 0);
}

+ (id)applyOrientation:(int64_t)a3 to:(id)a4
{
  id v6;
  uint64_t v7;

  v6 = a4;
  if (a3 != 1)
  {
    v7 = objc_msgSend(objc_alloc((Class)a1), "initWithOrientation:input:", a3, v6);

    v6 = (id)v7;
  }
  return v6;
}

@end
