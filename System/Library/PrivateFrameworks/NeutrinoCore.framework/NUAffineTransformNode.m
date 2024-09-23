@implementation NUAffineTransformNode

- (NUAffineTransformNode)initWithSettings:(id)a3 inputs:(id)a4
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_22019);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_22019);
      goto LABEL_8;
    }
    if (v15 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_22019);
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
  _NUAssertFailHandler((uint64_t)"-[NUAffineTransformNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Transform.m", 166, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v29, v30, v31, v32, v28);
}

- (NUAffineTransformNode)initWithAffineTransform:(id)a3 input:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NUAffineTransformNode *v11;
  objc_super v13;
  uint64_t v14;
  id v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)&self->_transform, a3);
  v7 = a3;
  v8 = a4;
  v16 = CFSTR("transform");
  v17[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0C9E1F8];
  v15 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)NUAffineTransformNode;
  v11 = -[NURenderNode initWithSettings:inputs:](&v13, sel_initWithSettings_inputs_, v9, v10);

  return v11;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NUAffineTransformNode;
  -[NURenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v10, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    objc_storeStrong((id *)(v7 + 168), self->_transform);
  return v8;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  void *v5;
  id v6;
  NUImageTransformAffine *transform;
  void *v8;
  NUImageGeometry *v9;
  NUImageGeometry *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CGSize v16;
  CGPoint v17;
  CGAffineTransform v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v23;
  id v24;
  _OWORD v25[2];
  CGRect v26;
  CGRect v27;

  v23.receiver = self;
  v23.super_class = (Class)NUAffineTransformNode;
  v24 = 0;
  -[NURenderNode _evaluateImageGeometry:](&v23, sel__evaluateImageGeometry_, &v24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v24;
  if (v5)
  {
    objc_msgSend(v5, "extent");
    transform = self->_transform;
    if (transform)
      -[NUImageTransformAffine transform](transform, "transform");
    else
      memset(&v18, 0, sizeof(v18));
    v27.origin.x = (double)v19;
    v27.origin.y = (double)v20;
    v27.size.width = (double)v21;
    v27.size.height = (double)v22;
    v26 = CGRectApplyAffineTransform(v27, &v18);
    NU::RectT<long>::RectT(v25, &v26, 0);
    v16 = (CGSize)v25[1];
    v17 = (CGPoint)v25[0];
    v10 = [NUImageGeometry alloc];
    v11 = objc_msgSend(v5, "renderScale");
    v13 = v12;
    v14 = objc_msgSend(v5, "orientation");
    v26.origin = v17;
    v26.size = v16;
    v9 = -[NUImageGeometry initWithExtent:renderScale:orientation:](v10, "initWithExtent:renderScale:orientation:", &v26, v11, v13, v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Cannot evaluate image geometry"), v8, v6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    v9 = 0;
  }

  return v9;
}

- (id)_evaluateImage:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  double v15;
  float64x2_t v16;
  NUImageTransformAffine *transform;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v26;
  void *v27;
  void *specific;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  id v60;
  id v61;
  _QWORD v62[2];
  _QWORD v63[2];
  uint8_t buf[32];
  float64x2_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_22007();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v27;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_22007();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v30)
      {
        v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v34 = (void *)MEMORY[0x1E0CB3978];
        v35 = v33;
        objc_msgSend(v34, "callStackSymbols");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v33;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v37;
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
      *(_QWORD *)&buf[4] = v32;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUAffineTransformNode _evaluateImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Transform.m", 212, CFSTR("Invalid parameter not satisfying: %s"), v38, v39, v40, v41, (uint64_t)"error != NULL");
  }
  v5 = *MEMORY[0x1E0C9E1F8];
  -[NURenderNode inputForKey:](self, "inputForKey:", *MEMORY[0x1E0C9E1F8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0;
  objc_msgSend(v6, "outputImage:", &v61);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v61;
  if (v7)
  {
    v60 = 0;
    objc_msgSend(v6, "outputImageGeometry:", &v60);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v60;

    if (v9)
    {
      if (objc_msgSend(v9, "renderScale") < 1 || v11 <= 0)
      {
        NUAssertLogger_22007();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid render scale"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v43;
          _os_log_error_impl(&dword_1A6553000, v42, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

        }
        v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        NUAssertLogger_22007();
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
        if (v44)
        {
          if (v46)
          {
            v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v50 = (void *)MEMORY[0x1E0CB3978];
            v51 = v49;
            objc_msgSend(v50, "callStackSymbols");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "componentsJoinedByString:", CFSTR("\n"));
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v49;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v53;
            _os_log_error_impl(&dword_1A6553000, v45, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

          }
        }
        else if (v46)
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v48;
          _os_log_error_impl(&dword_1A6553000, v45, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

        }
        _NUAssertFailHandler((uint64_t)"-[NUAffineTransformNode _evaluateImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Transform.m", 237, CFSTR("Invalid render scale"), v54, v55, v56, v57, v58);
      }
      v13 = objc_msgSend(v9, "renderScale");
      v15 = NUScaleToDouble(v13, v14);
      v16 = 0uLL;
      v65 = 0u;
      memset(buf, 0, sizeof(buf));
      transform = self->_transform;
      if (transform)
      {
        v59 = v15;
        -[NUImageTransformAffine transform](transform, "transform");
        v15 = v59;
        v16 = v65;
      }
      else
      {
        memset(buf, 0, sizeof(buf));
      }
      v65 = vmulq_n_f64(v16, v15);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", buf, "{CGAffineTransform=dddddd}");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0C9DDB8];
      v62[0] = *MEMORY[0x1E0C9E280];
      v62[1] = v5;
      v63[0] = v19;
      v63[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "filterWithName:withInputParameters:", CFSTR("CIAffineTransform"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v22, "outputImage");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v23;
        if (v23)
        {
          v24 = v23;
        }
        else
        {
          +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 2, CFSTR("Core Image returned invalid output for filter"), v22);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 1, CFSTR("Cannot create CIAffineTransform filter"), v19);
        v18 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 2, CFSTR("Cannot evaluate input geometry"), v6, v10);
      v18 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 2, CFSTR("Cannot evaluate input image"), v6, v8);
    v18 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v8;
  }

  return v18;
}

- (id)debugQuickLookObject
{
  void *v3;
  objc_super v5;
  uint64_t v6;

  if (-[NURenderNode isCached](self, "isCached"))
  {
    v5.receiver = self;
    v5.super_class = (Class)NUAffineTransformNode;
    -[NURenderNode debugQuickLookObject](&v5, sel_debugQuickLookObject);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
    -[NUAffineTransformNode _evaluateImage:](self, "_evaluateImage:", &v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_transformWithError:(id *)a3
{
  NSObject *v4;
  void *v5;
  void *specific;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_22007();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v5;
      _os_log_error_impl(&dword_1A6553000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_22007();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v12 = (void *)MEMORY[0x1E0CB3978];
        v13 = v11;
        objc_msgSend(v12, "callStackSymbols");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v11;
        v22 = 2114;
        v23 = v15;
        _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v10;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUAffineTransformNode _transformWithError:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Transform.m", 279, CFSTR("Invalid parameter not satisfying: %s"), v16, v17, v18, v19, (uint64_t)"error != nil");
  }
  return self->_transform;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transform, 0);
}

@end
