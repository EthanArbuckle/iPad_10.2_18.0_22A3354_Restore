@implementation NUTransformNode

- (BOOL)isGeometryNode
{
  return 1;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "evaluationMode");
  return (v3 < 4) & (0xBu >> (v3 & 0xF));
}

- (id)_transformWithError:(id *)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *specific;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  objc_class *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_22019);
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v8;
    _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v9 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v9 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_22019);
      goto LABEL_8;
    }
    if (v9 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_22019);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v10 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v11 = (void *)MEMORY[0x1E0CB3978];
    v12 = v10;
    objc_msgSend(v11, "callStackSymbols");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v14;
    _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v15 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v17 = (void *)MEMORY[0x1E0CB3978];
  v18 = specific;
  v12 = v15;
  objc_msgSend(v17, "callStackSymbols");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v28 = specific;
  v29 = 2114;
  v30 = v20;
  _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v21 = (objc_class *)objc_opt_class();
  NSStringFromClass(v21);
  v22 = objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUTransformNode _transformWithError:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Transform.m", 79, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v23, v24, v25, v26, v22);
}

- (id)_evaluateGeometrySpaceMap:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
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
  id v29;
  objc_super v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_22007();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v14;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_22007();
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
        v33 = v20;
        v34 = 2114;
        v35 = v24;
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
      v33 = v19;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUTransformNode _evaluateGeometrySpaceMap:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Transform.m", 84, CFSTR("Invalid parameter not satisfying: %s"), v25, v26, v27, v28, (uint64_t)"error != nil");
  }
  v30.receiver = self;
  v30.super_class = (Class)NUTransformNode;
  v31 = 0;
  -[NURenderNode _evaluateGeometrySpaceMap:](&v30, sel__evaluateGeometrySpaceMap_, &v31);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v31;
  if (v5)
  {
    v29 = 0;
    -[NUTransformNode _transformWithError:](self, "_transformWithError:", &v29);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v29;

    if (v7)
    {
      objc_msgSend(v5, "applyTransform:", v7);
      v9 = (void *)objc_opt_new();
      -[NURenderNode spaceMapKey](self, "spaceMapKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSpace:forKey:", v9, v10);

      v11 = v5;
    }
    else
    {
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Cannot get geometry transform"), self, v8);
      v11 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Cannot get geometry map for inputs"), self, v6);
    v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v6;
  }

  return v11;
}

- (id)descriptionSubClassHook
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v7 = 0;
  -[NUTransformNode _transformWithError:](self, "_transformWithError:", &v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    objc_msgSend(v3, "appendFormat:", CFSTR("%@ (T : %@)"), *MEMORY[0x1E0C9E1F8], v4);

  return v3;
}

- (BOOL)requiresVideoComposition
{
  return 1;
}

- (BOOL)canPropagateOriginalLivePhotoMetadataTrack
{
  void *v3;
  id v4;
  BOOL v5;
  NSObject *v6;
  objc_super v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  -[NUTransformNode _transformWithError:](self, "_transformWithError:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (!v3)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_101);
    v6 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "[NUTransformNode] could not evaluate transform: %@", buf, 0xCu);
    }
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v3, "isIdentityImageTransform"))
  {
LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  v8.receiver = self;
  v8.super_class = (Class)NUTransformNode;
  v5 = -[NURenderNode canPropagateOriginalLivePhotoMetadataTrack](&v8, sel_canPropagateOriginalLivePhotoMetadataTrack);
LABEL_10:

  return v5;
}

+ (id)transformNodeWithInput:(id)a3 transform:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NUAffineTransformNode *v11;
  NUAffineTransformNode *v12;
  NSObject *v14;
  void *v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    NUAssertLogger_22007();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "input != nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v15;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_22007();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E0CB3978];
        v37 = v35;
        objc_msgSend(v36, "callStackSymbols");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v63 = v35;
        v64 = 2114;
        v65 = v39;
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
      v63 = v20;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUTransformNode transformNodeWithInput:transform:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Transform.m", 25, CFSTR("Invalid parameter not satisfying: %s"), v40, v41, v42, v43, (uint64_t)"input != nil");
  }
  v9 = v8;
  if (!v8)
  {
    NUAssertLogger_22007();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "transform != nil");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v22;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_22007();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (v23)
    {
      if (v25)
      {
        v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v45 = (void *)MEMORY[0x1E0CB3978];
        v46 = v44;
        objc_msgSend(v45, "callStackSymbols");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v63 = v44;
        v64 = 2114;
        v65 = v48;
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
      v63 = v27;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUTransformNode transformNodeWithInput:transform:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Transform.m", 26, CFSTR("Invalid parameter not satisfying: %s"), v49, v50, v51, v52, (uint64_t)"transform != nil");
  }
  if (!a5)
  {
    NUAssertLogger_22007();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v29;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_22007();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        v53 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v54 = (void *)MEMORY[0x1E0CB3978];
        v55 = v53;
        objc_msgSend(v54, "callStackSymbols");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "componentsJoinedByString:", CFSTR("\n"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v63 = v53;
        v64 = 2114;
        v65 = v57;
        _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v32)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v34;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUTransformNode transformNodeWithInput:transform:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Transform.m", 27, CFSTR("Invalid parameter not satisfying: %s"), v58, v59, v60, v61, (uint64_t)"error != nil");
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    v11 = -[NUAffineTransformNode initWithAffineTransform:input:]([NUAffineTransformNode alloc], "initWithAffineTransform:input:", v10, v7);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("unsupported image transform type"), v9);
      v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    v10 = v9;
    v11 = -[NUTransform3DNode initWithTransform3D:input:]([NUTransform3DNode alloc], "initWithTransform3D:input:", v10, v7);
  }
  v12 = v11;

LABEL_10:
  return v12;
}

@end
