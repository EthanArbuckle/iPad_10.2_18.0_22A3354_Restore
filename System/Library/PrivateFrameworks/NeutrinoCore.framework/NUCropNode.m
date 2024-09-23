@implementation NUCropNode

- (NUCropNode)initWithRect:(id *)a3 input:(id)a4 resetCleanAperture:(BOOL)a5 settings:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char *v17;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
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
  objc_super v36;
  uint64_t v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v7 = a5;
  v43 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  if (!v10)
  {
    NUAssertLogger_18335();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "input != nil");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v21;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18335();
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
        v40 = v27;
        v41 = 2114;
        v42 = v31;
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
      v40 = v26;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCropNode initWithRect:input:resetCleanAperture:settings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Crop.m", 33, CFSTR("Invalid parameter not satisfying: %s"), v32, v33, v34, v35, (uint64_t)"input != nil");
  }
  v12 = v11;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGRect:", (double)a3->var0.var0, (double)a3->var0.var1, (double)a3->var1.var0, (double)a3->var1.var1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("inputRectangle"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("resetCleanAperture"));

  if (v12)
    objc_msgSend(v13, "addEntriesFromDictionary:", v12);
  v37 = *MEMORY[0x1E0C9E1F8];
  v38 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36.receiver = self;
  v36.super_class = (Class)NUCropNode;
  v17 = -[NURenderNode initWithSettings:inputs:](&v36, sel_initWithSettings_inputs_, v13, v16);

  var1 = a3->var1;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)(v17 + 184) = a3->var0;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)(v17 + 200) = var1;
  v17[168] = v7;

  return (NUCropNode *)v17;
}

- (NUCropNode)initWithRect:(id *)a3 input:(id)a4
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  _OWORD v6[2];

  var1 = a3->var1;
  v6[0] = a3->var0;
  v6[1] = var1;
  return -[NUCropNode initWithRect:input:resetCleanAperture:settings:](self, "initWithRect:input:resetCleanAperture:settings:", v6, a4, 0, 0);
}

- (NUCropNode)initWithSettings:(id)a3 inputs:(id)a4
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_18348);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_18348);
      goto LABEL_8;
    }
    if (v15 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_18348);
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
  _NUAssertFailHandler((uint64_t)"-[NUCropNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Crop.m", 60, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v29, v30, v31, v32, v28);
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  _BYTE *v7;
  _OWORD v9[4];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NUCropNode;
  -[NURenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v10, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  v7 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NUCropNode cropRect](self, "cropRect");
    v9[0] = v9[2];
    v9[1] = v9[3];
    objc_msgSend(v7, "setCropRect:", v9);
    v7[168] = self->_resetCleanAperture;
  }
  return v7;
}

- (id)transformAffine
{
  void *v3;
  NUImageTransformAffine *v4;
  NUImageTransformAffine *v5;
  CGAffineTransform v7;
  CGAffineTransform v8;
  __int128 v9;
  __int128 v10;

  -[NUCropNode transform](self, "transform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v9 = 0u;
    v10 = 0u;
    -[NUCropNode cropRect](self, "cropRect");
    memset(&v8, 0, sizeof(v8));
    CGAffineTransformMakeTranslation(&v8, (double)-(uint64_t)v9, (double)(uint64_t)-*((_QWORD *)&v9 + 1));
    v4 = [NUImageTransformAffine alloc];
    v7 = v8;
    v5 = -[NUImageTransformAffine initWithAffineTransform:](v4, "initWithAffineTransform:", &v7);
    -[NUCropNode setTransform:](self, "setTransform:", v5);

    -[NUCropNode transform](self, "transform");
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
    NUAssertLogger_18335();
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
    NUAssertLogger_18335();
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
    _NUAssertFailHandler((uint64_t)"-[NUCropNode _transformWithError:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Crop.m", 94, CFSTR("Invalid parameter not satisfying: %s"), v16, v17, v18, v19, (uint64_t)"error != nil");
  }
  return -[NUCropNode transformAffine](self, "transformAffine");
}

- (CGPoint)scaleCropOriginForOriginalVideoSize:(CGSize)a3 originalCleanAperture:(CGRect)a4 renderScale:(double)a5 inputExtent:(id *)a6
{
  double height;
  double width;
  double v9;
  double v10;
  float64x2_t v12;
  double v13;
  int64x2_t v14;
  float64x2_t v15;
  double v16;
  float64x2_t v17;
  double v22;
  double v23;
  CGFloat x;
  CGFloat y;
  CGFloat v26;
  CGFloat v27;
  BOOL v28;
  double MaxX;
  BOOL v30;
  CGFloat v31;
  double v32;
  double v33;
  CGFloat v34;
  float64x2_t v35;
  double MinX;
  double v37;
  double MaxY;
  double v39;
  double v40;
  double MinY;
  double v42;
  float64_t v43;
  CGFloat rect;
  float64x2_t recta;
  CGFloat r2;
  CGPoint r2a;
  CGFloat r2_16a;
  CGPoint result;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  r2 = a4.origin.y;
  height = a4.size.height;
  width = a4.size.width;
  rect = a4.origin.x;
  v9 = a3.height;
  v10 = a3.width;
  -[NUCropNode cropRect](self, "cropRect");
  if (v10 == width && v9 == height)
  {
    v13 = a5;
    v14 = 0u;
    goto LABEL_8;
  }
  v12.f64[0] = rect;
  v13 = a5;
  if (width < 1.0)
  {
    v14 = 0u;
LABEL_8:
    v15 = vmulq_n_f64(vcvtq_f64_s64(v14), v13);
    goto LABEL_9;
  }
  v17 = vcvtq_f64_s64((int64x2_t)0);
  __asm { FMOV            V3.2D, #0.5 }
  v12.f64[1] = r2;
  recta = vmulq_n_f64(v17, a5);
  r2a = (CGPoint)vsubq_f64(vsubq_f64(vmulq_n_f64(vaddq_f64(vmulq_f64(v17, _Q3), v17), v10 / width * a5), vmulq_n_f64(vdivq_f64(v12, (float64x2_t)vdupq_lane_s64(COERCE__INT64(v10 / width * a5), 0)), a5)), vmulq_f64(recta, _Q3));
  v22 = (double)a6->var0.var0 * a5;
  v23 = (double)a6->var0.var1 * a5;
  v17.f64[0] = (double)a6->var1.var0 * a5;
  _Q3.f64[0] = (double)a6->var1.var1 * a5;
  v51 = CGRectStandardize(*(CGRect *)(&v17 - 1));
  x = v51.origin.x;
  y = v51.origin.y;
  v26 = v51.size.width;
  v27 = v51.size.height;
  v68.size.width = recta.f64[0];
  v68.origin = r2a;
  v68.size.height = recta.f64[1];
  v28 = CGRectContainsRect(v51, v68);
  v15 = (float64x2_t)r2a;
  if (!v28)
  {
    v52.size.width = recta.f64[0];
    v52.origin = r2a;
    v52.size.height = recta.f64[1];
    MaxX = CGRectGetMaxX(v52);
    v53.origin.x = x;
    v53.origin.y = y;
    v53.size.width = v26;
    v53.size.height = v27;
    v30 = MaxX <= CGRectGetMaxX(v53);
    v31 = r2a.x;
    v32 = r2a.x;
    if (!v30)
    {
      v54.size.width = recta.f64[0];
      v54.origin = r2a;
      v54.size.height = recta.f64[1];
      v33 = CGRectGetMaxX(v54);
      v55.origin.x = x;
      v55.origin.y = y;
      v55.size.width = v26;
      v55.size.height = v27;
      v32 = r2a.x - (v33 - CGRectGetMaxX(v55));
      v31 = r2a.x;
    }
    v34 = r2a.y;
    v35 = recta;
    MinX = CGRectGetMinX(*(CGRect *)&v31);
    v56.origin.x = x;
    v56.origin.y = y;
    v56.size.width = v26;
    v56.size.height = v27;
    if (MinX < CGRectGetMinX(v56))
    {
      v57.origin.x = x;
      v57.origin.y = y;
      v57.size.width = v26;
      v57.size.height = v27;
      v37 = CGRectGetMaxX(v57);
      v58.size.width = recta.f64[0];
      v58.origin = r2a;
      v58.size.height = recta.f64[1];
      v32 = v32 + v37 - CGRectGetMaxX(v58);
    }
    r2_16a = v32;
    v59.size.width = recta.f64[0];
    v59.origin = r2a;
    v59.size.height = recta.f64[1];
    MaxY = CGRectGetMaxY(v59);
    v60.origin.x = x;
    v60.origin.y = y;
    v60.size.width = v26;
    v60.size.height = v27;
    v30 = MaxY <= CGRectGetMaxY(v60);
    v39 = r2a.y;
    if (!v30)
    {
      v61.size.width = recta.f64[0];
      v61.origin = r2a;
      v61.size.height = recta.f64[1];
      v40 = CGRectGetMaxY(v61);
      v62.origin.x = x;
      v62.origin.y = y;
      v62.size.width = v26;
      v62.size.height = v27;
      v39 = r2a.y - (v40 - CGRectGetMaxY(v62));
    }
    v63.size.width = recta.f64[0];
    v63.origin = r2a;
    v63.size.height = recta.f64[1];
    MinY = CGRectGetMinY(v63);
    v64.origin.x = x;
    v64.origin.y = y;
    v64.size.width = v26;
    v64.size.height = v27;
    if (MinY < CGRectGetMinY(v64))
    {
      v65.origin.x = x;
      v65.origin.y = y;
      v65.size.width = v26;
      v65.size.height = v27;
      v42 = CGRectGetMinY(v65);
      v66.size.width = recta.f64[0];
      v66.origin = r2a;
      v66.size.height = recta.f64[1];
      v39 = v39 + v42 - CGRectGetMinY(v66);
    }
    v69.origin.x = r2_16a;
    v67.origin.x = x;
    v67.origin.y = y;
    v67.size.width = v26;
    v67.size.height = v27;
    v69.origin.y = v39;
    v69.size = (CGSize)recta;
    *(CGRect *)v15.f64 = CGRectIntersection(v67, v69);
    v15.f64[1] = v43;
  }
LABEL_9:
  v16 = v15.f64[1];
  result.x = v15.f64[0];
  result.y = v16;
  return result;
}

- (BOOL)scaledCropOrigin:(CGPoint *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
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
  void *v30;
  void *v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  NSObject *v37;
  void *v38;
  void *specific;
  NSObject *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  double v69;
  _BYTE v70[32];
  int64x2_t buf[2];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_18335();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "origin != nil");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      buf[0].i32[0] = 138543362;
      *(uint64_t *)((char *)buf[0].i64 + 4) = (uint64_t)v38;
      _os_log_error_impl(&dword_1A6553000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18335();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v41)
      {
        v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v52 = (void *)MEMORY[0x1E0CB3978];
        v53 = v51;
        objc_msgSend(v52, "callStackSymbols");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        buf[0].i32[0] = 138543618;
        *(uint64_t *)((char *)buf[0].i64 + 4) = (uint64_t)v51;
        buf[0].i16[6] = 2114;
        *(uint64_t *)((char *)&buf[0].i64[1] + 6) = (uint64_t)v55;
        _os_log_error_impl(&dword_1A6553000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);

      }
    }
    else if (v41)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      buf[0].i32[0] = 138543362;
      *(uint64_t *)((char *)buf[0].i64 + 4) = (uint64_t)v43;
      _os_log_error_impl(&dword_1A6553000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCropNode scaledCropOrigin:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Crop.m", 172, CFSTR("Invalid parameter not satisfying: %s"), v56, v57, v58, v59, (uint64_t)"origin != nil");
  }
  if (!a4)
  {
    NUAssertLogger_18335();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      buf[0].i32[0] = 138543362;
      *(uint64_t *)((char *)buf[0].i64 + 4) = (uint64_t)v45;
      _os_log_error_impl(&dword_1A6553000, v44, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);

    }
    v46 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18335();
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
    if (v46)
    {
      if (v48)
      {
        v60 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v61 = (void *)MEMORY[0x1E0CB3978];
        v62 = v60;
        objc_msgSend(v61, "callStackSymbols");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "componentsJoinedByString:", CFSTR("\n"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        buf[0].i32[0] = 138543618;
        *(uint64_t *)((char *)buf[0].i64 + 4) = (uint64_t)v60;
        buf[0].i16[6] = 2114;
        *(uint64_t *)((char *)&buf[0].i64[1] + 6) = (uint64_t)v64;
        _os_log_error_impl(&dword_1A6553000, v47, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);

      }
    }
    else if (v48)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "componentsJoinedByString:", CFSTR("\n"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      buf[0].i32[0] = 138543362;
      *(uint64_t *)((char *)buf[0].i64 + 4) = (uint64_t)v50;
      _os_log_error_impl(&dword_1A6553000, v47, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCropNode scaledCropOrigin:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Crop.m", 173, CFSTR("Invalid parameter not satisfying: %s"), v65, v66, v67, v68, (uint64_t)"error != nil");
  }
  memset(buf, 0, sizeof(buf));
  -[NUCropNode cropRect](self, "cropRect");
  -[NURenderNode outputImageGeometry:](self, "outputImageGeometry:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "renderScale");
    v69 = NUScaleToDouble(v9, v10);
    *(float64x2_t *)a3 = vmulq_n_f64(vcvtq_f64_s64(buf[0]), v69);
    -[NURenderNode settings](self, "settings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("projectUsingCleanAperture"));
    v12 = objc_claimAutoreleasedReturnValue();

    -[NURenderNode settings](self, "settings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("projectUsingOriginalSize"));
    v14 = objc_claimAutoreleasedReturnValue();

    if (!(v12 | v14))
    {
      v17 = 1;
      goto LABEL_14;
    }
    -[NURenderNode inputForKey:](self, "inputForKey:", *MEMORY[0x1E0C9E1F8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "outputImageGeometry:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16 != 0;
    if (v16)
    {
      objc_msgSend((id)v14, "X");
      v19 = v18;
      objc_msgSend((id)v14, "Y");
      v21 = v20;
      objc_msgSend((id)v12, "CGRectValue");
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v29 = v22;
      if (v19 != v27 || v21 != v22)
        goto LABEL_10;
      -[NURenderNode settings](self, "settings");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("projectUsingEstimatedCleanAperture"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "doubleValue");
      v33 = v32;

      if (v33 > 0.0)
      {
        v19 = v19 * (v33 + 1.0);
        v21 = v21 * (v33 + 1.0);
LABEL_10:
        objc_msgSend(v16, "extent");
        -[NUCropNode scaleCropOriginForOriginalVideoSize:originalCleanAperture:renderScale:inputExtent:](self, "scaleCropOriginForOriginalVideoSize:originalCleanAperture:renderScale:inputExtent:", v70, v19, v21, v24, v26, v28, v29, v69);
        a3->x = v34;
        a3->y = v35;
      }
    }

LABEL_14:
    goto LABEL_15;
  }
  v17 = 0;
LABEL_15:

  return v17;
}

- (id)_evaluateImage:(id *)a3
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v41;
  void *v42;
  void *specific;
  NSObject *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  _BOOL4 v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  _OWORD v75[3];
  id v76;
  id v77;
  uint8_t buf[32];
  float64x2_t v79;
  uint64_t v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;

  v80 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_18335();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v42;
      _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18335();
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v45)
      {
        v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v49 = (void *)MEMORY[0x1E0CB3978];
        v50 = v48;
        objc_msgSend(v49, "callStackSymbols");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "componentsJoinedByString:", CFSTR("\n"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v48;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v52;
        _os_log_error_impl(&dword_1A6553000, v44, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v45)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "componentsJoinedByString:", CFSTR("\n"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v47;
      _os_log_error_impl(&dword_1A6553000, v44, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCropNode _evaluateImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Crop.m", 230, CFSTR("Invalid parameter not satisfying: %s"), v53, v54, v55, v56, (uint64_t)"error != nil");
  }
  -[NURenderNode inputForKey:](self, "inputForKey:", *MEMORY[0x1E0C9E1F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0;
  objc_msgSend(v5, "outputImage:", &v77);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v77;
  if (v6)
  {
    v76 = 0;
    -[NURenderNode outputImageGeometry:](self, "outputImageGeometry:", &v76);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v76;

    if (v8)
    {
      if (objc_msgSend(v8, "renderScale") < 1 || v10 <= 0)
      {
        NUAssertLogger_18335();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid render scale"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v58;
          _os_log_error_impl(&dword_1A6553000, v57, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

        }
        v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        NUAssertLogger_18335();
        v60 = objc_claimAutoreleasedReturnValue();
        v61 = os_log_type_enabled(v60, OS_LOG_TYPE_ERROR);
        if (v59)
        {
          if (v61)
          {
            v64 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v65 = (void *)MEMORY[0x1E0CB3978];
            v66 = v64;
            objc_msgSend(v65, "callStackSymbols");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "componentsJoinedByString:", CFSTR("\n"));
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v64;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v68;
            _os_log_error_impl(&dword_1A6553000, v60, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

          }
        }
        else if (v61)
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "componentsJoinedByString:", CFSTR("\n"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v63;
          _os_log_error_impl(&dword_1A6553000, v60, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

        }
        _NUAssertFailHandler((uint64_t)"-[NUCropNode _evaluateImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Crop.m", 251, CFSTR("Invalid render scale"), v69, v70, v71, v72, v73);
      }
      -[NUCropNode transformAffine](self, "transformAffine");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = objc_msgSend(v8, "renderScale");
        v74 = NUScaleToDouble(v12, v13);
        v79 = 0u;
        memset(buf, 0, sizeof(buf));
        objc_msgSend(v11, "transform");
        v79 = vmulq_n_f64(v79, v74);
        v14 = objc_msgSend(v8, "scaledSize");
        v16 = v15;
        v75[0] = *(_OWORD *)buf;
        v75[1] = *(_OWORD *)&buf[16];
        v75[2] = v79;
        objc_msgSend(v6, "imageByApplyingTransform:", v75);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "extent");
        v19 = v18;
        v21 = v20;
        v23 = v22;
        v25 = v24;
        objc_msgSend(v8, "scaledExtent");
        v84.origin.x = v26;
        v84.origin.y = v27;
        v84.size.width = v28;
        v84.size.height = v29;
        v81.origin.x = v19;
        v81.origin.y = v21;
        v81.size.width = v23;
        v81.size.height = v25;
        v82 = CGRectIntersection(v81, v84);
        x = v82.origin.x;
        y = v82.origin.y;
        width = v82.size.width;
        height = v82.size.height;
        objc_msgSend(v8, "scaledExtent");
        v85.origin.x = x;
        v85.origin.y = y;
        v85.size.width = width;
        v85.size.height = height;
        if (!CGRectEqualToRect(v83, v85))
        {
          objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithColor:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "imageByCompositingOverImage:", v35);
          v36 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)v36;
        }
        objc_msgSend(v17, "imageByClampingToExtent");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v37, "imageByCroppingToRect:", 0.0, 0.0, (double)v14, (double)v16);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = v38;
        v39 = v6;
      }
      else
      {
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Could not get the input geometry"), self, v9);
        v39 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Could not get the output geometry"), self, v9);
      v39 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Could not get the input image"), self, v7);
    v39 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v7;
  }

  return v39;
}

- (BOOL)canPropagateOriginalLivePhotoMetadataTrack
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;
  objc_super v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  objc_super v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)NUCropNode;
  v22 = 0;
  -[NURenderNode _evaluateImageGeometry:](&v21, sel__evaluateImageGeometry_, &v22);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v22;
  if (v3)
  {
    v20 = 0;
    -[NUCropNode _evaluateImageGeometry:](self, "_evaluateImageGeometry:", &v20);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v20;

    if (v5)
    {
      objc_msgSend(v3, "extent");
      objc_msgSend(v5, "extent");
      v7 = 0;
      if (v12 != v16 || v13 != v17 || v14 != v18)
        goto LABEL_18;
      if (v15 == v19)
      {
        v11.receiver = self;
        v11.super_class = (Class)NUCropNode;
        v7 = -[NUTransformNode canPropagateOriginalLivePhotoMetadataTrack](&v11, sel_canPropagateOriginalLivePhotoMetadataTrack);
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_95);
      v9 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v6;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "[NUCropNode] could not evaluate output geometry: %@", buf, 0xCu);
      }
    }
    v7 = 0;
    goto LABEL_18;
  }
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_95);
  v8 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "[NUCropNode] could not evaluate input geometry: %@", buf, 0xCu);
  }
  v7 = 0;
  v6 = v4;
LABEL_19:

  return v7;
}

- (id)debugQuickLookObject
{
  void *v3;
  objc_super v5;
  uint64_t v6;

  if (-[NURenderNode isCached](self, "isCached"))
  {
    v5.receiver = self;
    v5.super_class = (Class)NUCropNode;
    -[NURenderNode debugQuickLookObject](&v5, sel_debugQuickLookObject);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
    -[NUCropNode _evaluateImage:](self, "_evaluateImage:", &v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  void *v5;
  id v6;
  NUImageGeometry *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NUImageGeometry *v12;
  id v13;
  id v14;
  _OWORD v16[2];
  __int128 v17;
  __int128 v18;
  objc_super v19;
  id v20;

  v20 = 0;
  v19.receiver = self;
  v19.super_class = (Class)NUCropNode;
  -[NURenderNode _evaluateImageGeometry:](&v19, sel__evaluateImageGeometry_, &v20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v17 = 0u;
    v18 = 0u;
    v6 = v20;
    -[NUCropNode cropRect](self, "cropRect");

    v17 = 0uLL;
    v7 = [NUImageGeometry alloc];
    v8 = objc_msgSend(v5, "renderScale");
    v10 = v9;
    v11 = objc_msgSend(v5, "orientation");
    v16[0] = v17;
    v16[1] = v18;
    v12 = -[NUImageGeometry initWithExtent:renderScale:orientation:](v7, "initWithExtent:renderScale:orientation:", v16, v8, v10, v11);
  }
  else
  {
    v13 = v20;
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Could not get the input geometry"), self, v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v12 = 0;
    *a3 = v14;
  }

  return v12;
}

- (id)_evaluateVideoProperties:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _NUVideoProperties *v17;
  __int128 v18;
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
  _QWORD v36[4];
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  _OWORD v40[2];
  _BYTE buf[32];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_18335();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v21;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18335();
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
        *(_QWORD *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v31;
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
      *(_QWORD *)&buf[4] = v26;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCropNode _evaluateVideoProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Crop.m", 358, CFSTR("Invalid parameter not satisfying: %s"), v32, v33, v34, v35, (uint64_t)"error != NULL");
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
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, "scaledSize");
      v12 = v11;
      if (-[NUCropNode resetCleanAperture](self, "resetCleanAperture"))
      {
        v13 = 0;
        v14 = 0;
        v15 = v10;
        v16 = v12;
      }
      else
      {
        objc_msgSend(v7, "cleanAperture");
        *(_QWORD *)&v18 = v10;
        *((_QWORD *)&v18 + 1) = v12;
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        *(_OWORD *)&buf[16] = v18;
        v40[0] = v37;
        v40[1] = v38;
        NU::RectT<long>::Intersection((uint64_t)v39, (uint64_t *)buf, (uint64_t *)v40);
        v14 = v39[1];
        v13 = v39[0];
        v16 = v39[3];
        v15 = v39[2];
      }
      v17 = -[_NUVideoProperties initWithProperties:]([_NUVideoProperties alloc], "initWithProperties:", v7);
      v36[0] = v13;
      v36[1] = v14;
      v36[2] = v15;
      v36[3] = v16;
      -[_NUVideoProperties setCleanAperture:](v17, "setCleanAperture:", v36);
      -[_NUVideoProperties setSize:](v17, "setSize:", v10, v12);
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NUCropNode;
  v4 = -[NURenderNode canPropagateOriginalAuxiliaryData:](&v6, sel_canPropagateOriginalAuxiliaryData_, a3);
  if (v4)
    LOBYTE(v4) = -[NUCropNode _canPropagateOriginalAuxiliaryData](self, "_canPropagateOriginalAuxiliaryData");
  return v4;
}

- (BOOL)_canPropagateOriginalAuxiliaryData
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  objc_super v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)NUCropNode;
  v21 = 0;
  -[NURenderNode _evaluateImageGeometry:](&v20, sel__evaluateImageGeometry_, &v21);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v21;
  if (v3)
  {
    v19 = 0;
    -[NUCropNode _evaluateImageGeometry:](self, "_evaluateImageGeometry:", &v19);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v19;

    if (v5)
    {
      objc_msgSend(v3, "extent");
      objc_msgSend(v5, "extent");
      v7 = 0;
      if (v11 == v15 && v12 == v16 && v13 == v17)
        v7 = v14 == v18;
    }
    else
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_95);
      v9 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v6;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "-[NUCropNode canPropagateOriginalAuxiliaryData] Unable to calculate output geometry: %@", buf, 0xCu);
      }
      v7 = 0;
    }

  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_95);
    v8 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v4;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "-[NUCropNode canPropagateOriginalAuxiliaryData] Unable to calculate input geometry: %@", buf, 0xCu);
    }
    v7 = 0;
    v6 = v4;
  }

  return v7;
}

- (id)_evaluateAuxiliaryImageForType:(int64_t)a3 error:(id *)a4
{
  void *v7;
  id v8;
  objc_super v10;

  if (-[NUCropNode _canPropagateOriginalAuxiliaryData](self, "_canPropagateOriginalAuxiliaryData"))
  {
    v10.receiver = self;
    v10.super_class = (Class)NUCropNode;
    -[NURenderNode _evaluateAuxiliaryImageForType:error:](&v10, sel__evaluateAuxiliaryImageForType_error_, a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("NUCropNode cannot propagate original auxiliary data"), self);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    *a4 = v8;
  }
  return v7;
}

- ($209B98C1CDF2DEBD503CBDE3C0ED7C90)cropRect
{
  $209B98C1CDF2DEBD503CBDE3C0ED7C90 *result;

  objc_copyStruct(retstr, &self->_cropRect, 32, 1, 0);
  return result;
}

- (void)setCropRect:(id *)a3
{
  objc_copyStruct(&self->_cropRect, a3, 32, 1, 0);
}

- (NUImageTransformAffine)transform
{
  return (NUImageTransformAffine *)objc_getProperty(self, a2, 176, 1);
}

- (void)setTransform:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (BOOL)resetCleanAperture
{
  return self->_resetCleanAperture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transform, 0);
}

@end
