@implementation NUTransform3DNode

- (NUTransform3DNode)initWithSettings:(id)a3 inputs:(id)a4
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
  _NUAssertFailHandler((uint64_t)"-[NUTransform3DNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Transform.m", 294, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v29, v30, v31, v32, v28);
}

- (NUTransform3DNode)initWithTransform3D:(id)a3 input:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NUTransform3DNode *v11;
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
  v13.super_class = (Class)NUTransform3DNode;
  v11 = -[NURenderNode initWithSettings:inputs:](&v13, sel_initWithSettings_inputs_, v9, v10);

  return v11;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NUTransform3DNode;
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
  double v7;
  float64_t v8;
  double v9;
  float64_t v10;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  float64x2_t v24;
  CGPoint v25;
  float64x2_t v26;
  NUImageGeometry *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NUImageGeometry *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  CGSize v38;
  CGPoint v39;
  objc_super v40;
  id v41;
  _OWORD v42[2];
  CGRect v43;
  float64x2_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)NUTransform3DNode;
  v41 = 0;
  -[NURenderNode _evaluateImageGeometry:](&v40, sel__evaluateImageGeometry_, &v41);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v41;
    objc_msgSend(v5, "extent");
    -[NUImageTransform3D transformPoint:](self->_transform, "transformPoint:", (double)0, (double)0);
    v8 = v7;
    v10 = v9;
    -[NUImageTransform3D transformPoint:](self->_transform, "transformPoint:", (double)0, (double)0);
    v12 = v11;
    v14 = v13;
    -[NUImageTransform3D transformPoint:](self->_transform, "transformPoint:", (double)0, (double)0);
    v16 = v15;
    v18 = v17;
    -[NUImageTransform3D transformPoint:](self->_transform, "transformPoint:", vcvtq_f64_s64(vaddq_s64((int64x2_t)0, (int64x2_t)0)));
    v20 = v19;
    v22 = v21;

    v44.f64[0] = v8;
    v44.f64[1] = v10;
    v45 = v12;
    v46 = v14;
    v47 = v16;
    v48 = v18;
    v49 = v20;
    v50 = v22;
    v23 = 16;
    v24 = v44;
    v25 = (CGPoint)v44;
    do
    {
      v26 = *(float64x2_t *)((char *)&v44 + v23);
      v24 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v26, v24), (int8x16_t)v26, (int8x16_t)v24);
      v25 = (CGPoint)vbslq_s8((int8x16_t)vcgtq_f64(v26, (float64x2_t)v25), (int8x16_t)v25, (int8x16_t)v26);
      v23 += 16;
    }
    while (v23 != 64);
    v43.origin = v25;
    v43.size = (CGSize)vsubq_f64(v24, (float64x2_t)v25);
    NU::RectT<long>::RectT(v42, &v43, 0);
    v38 = (CGSize)v42[1];
    v39 = (CGPoint)v42[0];
    v27 = [NUImageGeometry alloc];
    v28 = objc_msgSend(v5, "renderScale");
    v30 = v29;
    v31 = objc_msgSend(v5, "orientation");
    v43.origin = v39;
    v43.size = v38;
    v32 = -[NUImageGeometry initWithExtent:renderScale:orientation:](v27, "initWithExtent:renderScale:orientation:", &v43, v28, v30, v31);
  }
  else
  {
    v33 = (void *)MEMORY[0x1E0C99E38];
    v34 = v41;
    objc_msgSend(v33, "null");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Cannot evaluate image geometry"), v35, v34);
    v36 = (id)objc_claimAutoreleasedReturnValue();

    *a3 = v36;
    v32 = 0;
  }

  return v32;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v50;
  void *v51;
  void *specific;
  NSObject *v53;
  _BOOL4 v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  _BOOL4 v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  id v89;
  _QWORD v90[5];
  _QWORD v91[5];
  int64x2_t buf[2];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_22007();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      buf[0].i32[0] = 138543362;
      *(uint64_t *)((char *)buf[0].i64 + 4) = (uint64_t)v51;
      _os_log_error_impl(&dword_1A6553000, v50, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_22007();
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v54)
      {
        v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v58 = (void *)MEMORY[0x1E0CB3978];
        v59 = v57;
        objc_msgSend(v58, "callStackSymbols");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "componentsJoinedByString:", CFSTR("\n"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        buf[0].i32[0] = 138543618;
        *(uint64_t *)((char *)buf[0].i64 + 4) = (uint64_t)v57;
        buf[0].i16[6] = 2114;
        *(uint64_t *)((char *)&buf[0].i64[1] + 6) = (uint64_t)v61;
        _os_log_error_impl(&dword_1A6553000, v53, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);

      }
    }
    else if (v54)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "componentsJoinedByString:", CFSTR("\n"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      buf[0].i32[0] = 138543362;
      *(uint64_t *)((char *)buf[0].i64 + 4) = (uint64_t)v56;
      _os_log_error_impl(&dword_1A6553000, v53, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUTransform3DNode _evaluateImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Transform.m", 349, CFSTR("Invalid parameter not satisfying: %s"), v62, v63, v64, v65, (uint64_t)"error != NULL");
  }
  v5 = *MEMORY[0x1E0C9E1F8];
  -[NURenderNode inputForKey:](self, "inputForKey:", *MEMORY[0x1E0C9E1F8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = 0;
  objc_msgSend(v6, "outputImage:", &v89);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v89;
  if (v7)
  {
    v88 = 0;
    objc_msgSend(v6, "outputImageGeometry:", &v88);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v88;

    if (v9)
    {
      if (objc_msgSend(v9, "renderScale") < 1 || v11 <= 0)
      {
        NUAssertLogger_22007();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid render scale"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          buf[0].i32[0] = 138543362;
          *(uint64_t *)((char *)buf[0].i64 + 4) = (uint64_t)v67;
          _os_log_error_impl(&dword_1A6553000, v66, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);

        }
        v68 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        NUAssertLogger_22007();
        v69 = objc_claimAutoreleasedReturnValue();
        v70 = os_log_type_enabled(v69, OS_LOG_TYPE_ERROR);
        if (v68)
        {
          if (v70)
          {
            v73 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v74 = (void *)MEMORY[0x1E0CB3978];
            v75 = v73;
            objc_msgSend(v74, "callStackSymbols");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "componentsJoinedByString:", CFSTR("\n"));
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            buf[0].i32[0] = 138543618;
            *(uint64_t *)((char *)buf[0].i64 + 4) = (uint64_t)v73;
            buf[0].i16[6] = 2114;
            *(uint64_t *)((char *)&buf[0].i64[1] + 6) = (uint64_t)v77;
            _os_log_error_impl(&dword_1A6553000, v69, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);

          }
        }
        else if (v70)
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "componentsJoinedByString:", CFSTR("\n"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          buf[0].i32[0] = 138543362;
          *(uint64_t *)((char *)buf[0].i64 + 4) = (uint64_t)v72;
          _os_log_error_impl(&dword_1A6553000, v69, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);

        }
        _NUAssertFailHandler((uint64_t)"-[NUTransform3DNode _evaluateImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Transform.m", 374, CFSTR("Invalid render scale"), v78, v79, v80, v81, v82);
      }
      v83 = a3;
      v87 = v10;
      v13 = objc_msgSend(v9, "renderScale");
      v15 = NUScaleToDouble(v13, v14);
      memset(buf, 0, sizeof(buf));
      v84 = v9;
      objc_msgSend(v9, "extent");
      -[NUImageTransform3D transformPoint:](self->_transform, "transformPoint:", (double)buf[0].i64[0], (double)buf[0].i64[1]);
      v17 = v16;
      v19 = v18;
      -[NUImageTransform3D transformPoint:](self->_transform, "transformPoint:", (double)(buf[1].i64[0] + buf[0].i64[0]), (double)buf[0].i64[1]);
      v21 = v20;
      v23 = v22;
      -[NUImageTransform3D transformPoint:](self->_transform, "transformPoint:", (double)buf[0].i64[0], (double)(buf[1].i64[1] + buf[0].i64[1]));
      v25 = v24;
      v27 = v26;
      -[NUImageTransform3D transformPoint:](self->_transform, "transformPoint:", vcvtq_f64_s64(vaddq_s64(buf[1], buf[0])));
      v28 = v15 * v17;
      v29 = v15 * v19;
      v30 = v15 * v21;
      v31 = v15 * v23;
      v32 = v15 * v25;
      v33 = v15 * v27;
      v35 = v15 * v34;
      v37 = v15 * v36;
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGPoint:", v32, v33);
      v38 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGPoint:", v35, v37);
      v39 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGPoint:", v30, v31);
      v40 = v7;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGPoint:", v28, v29);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)MEMORY[0x1E0C9DDB8];
      v90[0] = CFSTR("inputTopLeft");
      v90[1] = CFSTR("inputTopRight");
      v85 = (void *)v39;
      v86 = (void *)v38;
      v91[0] = v38;
      v91[1] = v39;
      v90[2] = CFSTR("inputBottomRight");
      v90[3] = CFSTR("inputBottomLeft");
      v91[2] = v41;
      v91[3] = v42;
      v90[4] = v5;
      v91[4] = v40;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 5);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "filterWithName:withInputParameters:", CFSTR("CIPerspectiveTransform"), v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        objc_msgSend(v45, "outputImage");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v46;
        if (v46)
        {
          v48 = v46;
        }
        else
        {
          +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 2, CFSTR("Core Image returned invalid output for filter"), v45);
          *v83 = (id)objc_claimAutoreleasedReturnValue();
        }
        v10 = v87;
        v9 = v84;

      }
      else
      {
        +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 1, CFSTR("Cannot create CIPerspectiveTransform filter"), self->_transform);
        v47 = 0;
        v9 = v84;
        *v83 = (id)objc_claimAutoreleasedReturnValue();
        v10 = v87;
      }

      v7 = v40;
    }
    else
    {
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 2, CFSTR("Cannot evaluate input geometry"), v6, v10);
      v47 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 2, CFSTR("Cannot evaluate input image"), v6, v8);
    v47 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v8;
  }

  return v47;
}

- (id)debugQuickLookObject
{
  void *v3;
  objc_super v5;
  uint64_t v6;

  if (-[NURenderNode isCached](self, "isCached"))
  {
    v5.receiver = self;
    v5.super_class = (Class)NUTransform3DNode;
    -[NURenderNode debugQuickLookObject](&v5, sel_debugQuickLookObject);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
    -[NUTransform3DNode _evaluateImage:](self, "_evaluateImage:", &v6);
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
    _NUAssertFailHandler((uint64_t)"-[NUTransform3DNode _transformWithError:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Transform.m", 433, CFSTR("Invalid parameter not satisfying: %s"), v16, v17, v18, v19, (uint64_t)"error != nil");
  }
  return self->_transform;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transform, 0);
}

@end
