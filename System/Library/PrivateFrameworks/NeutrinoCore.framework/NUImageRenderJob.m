@implementation NUImageRenderJob

- (NUImageRenderJob)initWithImageRequest:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NUImageRenderJob;
  return -[NURenderJob initWithRequest:](&v4, sel_initWithRequest_, a3);
}

- (NUImageRenderJob)initWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *specific;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  objc_class *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_9681);
  v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = v5;
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v11;
    _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_9681);
      goto LABEL_8;
    }
    if (v12 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_9681);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v14 = (void *)MEMORY[0x1E0CB3978];
    v15 = v13;
    objc_msgSend(v14, "callStackSymbols");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v17;
    _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v18 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v20 = (void *)MEMORY[0x1E0CB3978];
  v21 = specific;
  v15 = v18;
  objc_msgSend(v20, "callStackSymbols");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v31 = specific;
  v32 = 2114;
  v33 = v23;
  _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v24 = (objc_class *)objc_opt_class();
  NSStringFromClass(v24);
  v25 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUImageRenderJob initWithRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageRenderJob.m", 84, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v26, v27, v28, v29, v25);
}

- (id)imageAccumulationNodeWithImageSize:(id)a3 tileSize:(id)a4 borderSize:(id)a5 format:(id)a6 colorSpace:(id)a7
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
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
  v7 = a6;
  v8 = a7;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_9681);
  v9 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = v9;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v34 = v14;
    _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v15 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v15 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_9681);
      goto LABEL_8;
    }
    if (v15 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_9681);
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
  _NUAssertFailHandler((uint64_t)"-[NUImageRenderJob imageAccumulationNodeWithImageSize:tileSize:borderSize:format:colorSpace:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageRenderJob.m", 89, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v29, v30, v31, v32, v28);
}

- (id)scalePolicy
{
  void *v2;
  void *v3;

  -[NUImageRenderJob imageRequest](self, "imageRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scalePolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)extentPolicy
{
  void *v2;
  void *v3;

  -[NUImageRenderJob imageRequest](self, "imageRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extentPolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (id)newRenderPipelineStateForEvaluationMode:(int64_t)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUImageRenderJob;
  v4 = -[NURenderJob newRenderPipelineStateForEvaluationMode:](&v7, sel_newRenderPipelineStateForEvaluationMode_, a3);
  -[NUImageRenderJob imageRequest](self, "imageRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAuxiliaryImageType:", objc_msgSend(v5, "auxiliaryImageType"));

  return v4;
}

- (id)_HDRPixelFormatForColorSpace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v11;
  void *v12;
  void *specific;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[5];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isHDR"))
  {
    +[NUPixelFormat A2RGB10](NUPixelFormat, "A2RGB10");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v5;
    +[NUPixelFormat RGBAh](NUPixelFormat, "RGBAh");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __49__NUImageRenderJob__HDRPixelFormatForColorSpace___block_invoke;
    v28[3] = &unk_1E5061B30;
    v28[4] = self;
    v8 = objc_msgSend(v7, "indexOfObjectPassingTest:", v28);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      NUAssertLogger_9655();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not find supported HDR pixel format!"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v30 = v12;
        _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_9655();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v15)
        {
          v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v19 = (void *)MEMORY[0x1E0CB3978];
          v20 = v18;
          objc_msgSend(v19, "callStackSymbols");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v30 = v18;
          v31 = 2114;
          v32 = v22;
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
        v30 = v17;
        _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"-[NUImageRenderJob _HDRPixelFormatForColorSpace:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageRenderJob.m", 138, CFSTR("Could not find supported HDR pixel format!"), v23, v24, v25, v26, v27);
    }
    objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[NUPixelFormat RGBAh](NUPixelFormat, "RGBAh");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)prepareNodeWithPipelineState:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  NUHDRGainMapNode *v15;
  uint64_t v16;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NUImageRenderJob;
  -[NURenderJob prepareNodeWithPipelineState:error:](&v18, sel_prepareNodeWithPipelineState_error_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (+[NUGlobalSettings enableHDRSupport](NUGlobalSettings, "enableHDRSupport"))
    {
      if (+[NUGlobalSettings renderMeteorPlusAsHDR](NUGlobalSettings, "renderMeteorPlusAsHDR"))
      {
        -[NUImageRenderJob imageRequest](self, "imageRequest");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "maxEDRHeadroom");
        v10 = v9;

        if (objc_msgSend(v6, "auxiliaryImageType") == 1)
        {
          +[NUGlobalSettings thresholdDisplayHeadroom](NUGlobalSettings, "thresholdDisplayHeadroom");
          if (v10 > v11)
          {
            objc_msgSend(v7, "imageProperties:", a4);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v12, "hasGainMap"))
            {
              objc_msgSend(v12, "gainMapHeadroom");
              if (v13 > 1.0)
              {
                -[NUImageRenderJob imageRequest](self, "imageRequest");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "currentEDRHeadroom");

                v15 = [NUHDRGainMapNode alloc];
                objc_msgSend(v12, "gainMapHeadroom");
                v16 = -[NUHDRGainMapNode initWithInput:contentHeadroom:displayHeadroom:](v15, "initWithInput:contentHeadroom:displayHeadroom:", v7);

                v7 = (void *)v16;
              }
            }

          }
        }
      }
    }
  }

  return v7;
}

- (BOOL)prepare:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NURegion *v9;
  NURegion *regionToRender;
  void *v11;
  void *v12;
  BOOL v13;
  NURegion *v14;
  int64x2_t v15;
  int64x2_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  uint64_t v42;
  double v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  void *v62;
  void *v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NUMutablePurgeableImage *v69;
  void *targetImage;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  NUMutablePurgeableImage *v74;
  NUMutablePurgeableImage *v75;
  const __CFString *v76;
  double v78;
  void *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  void *specific;
  NSObject *v85;
  _BOOL4 v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  NSObject *v98;
  void *v99;
  void *v100;
  NSObject *v101;
  _BOOL4 v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  int64x2_t v116;
  int64x2_t v117;
  int64x2_t v118;
  int64x2_t v119;
  objc_super v120;
  int64x2_t v121;
  int64x2_t v122;
  _BYTE buf[32];
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_9655();
    v82 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v83;
      _os_log_error_impl(&dword_1A6553000, v82, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_9655();
    v85 = objc_claimAutoreleasedReturnValue();
    v86 = os_log_type_enabled(v85, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v86)
      {
        v89 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v90 = (void *)MEMORY[0x1E0CB3978];
        v91 = v89;
        objc_msgSend(v90, "callStackSymbols");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "componentsJoinedByString:", CFSTR("\n"));
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v89;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v93;
        _os_log_error_impl(&dword_1A6553000, v85, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v86)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "componentsJoinedByString:", CFSTR("\n"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v88;
      _os_log_error_impl(&dword_1A6553000, v85, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageRenderJob prepare:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageRenderJob.m", 170, CFSTR("Invalid parameter not satisfying: %s"), v94, v95, v96, v97, (uint64_t)"error != NULL");
  }
  v120.receiver = self;
  v120.super_class = (Class)NUImageRenderJob;
  if (!-[NURenderJob prepare:](&v120, sel_prepare_))
    return 0;
  -[NURenderJob outputImage](self, "outputImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NUImageRenderJob imageRequest](self, "imageRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "regionPolicy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[NURenderJob outputGeometry](self, "outputGeometry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "regionForGeometry:", v8);
    v9 = (NURegion *)objc_claimAutoreleasedReturnValue();
    regionToRender = self->_regionToRender;
    self->_regionToRender = v9;

    if (!self->_regionToRender)
    {
      NUAssertLogger_9655();
      v98 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No region to render"));
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v99;
        _os_log_error_impl(&dword_1A6553000, v98, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v100 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_9655();
      v101 = objc_claimAutoreleasedReturnValue();
      v102 = os_log_type_enabled(v101, OS_LOG_TYPE_ERROR);
      if (v100)
      {
        if (v102)
        {
          v105 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v106 = (void *)MEMORY[0x1E0CB3978];
          v107 = v105;
          objc_msgSend(v106, "callStackSymbols");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "componentsJoinedByString:", CFSTR("\n"));
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v105;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v109;
          _os_log_error_impl(&dword_1A6553000, v101, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v102)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "componentsJoinedByString:", CFSTR("\n"));
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v104;
        _os_log_error_impl(&dword_1A6553000, v101, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"-[NUImageRenderJob prepare:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageRenderJob.m", 181, CFSTR("No region to render"), v110, v111, v112, v113, v114);
    }
    v118 = 0u;
    v119 = 0u;
    -[NURenderJob outputGeometry](self, "outputGeometry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "physicalScaledExtent");
    }
    else
    {
      v118 = 0u;
      v119 = 0u;
    }

    v14 = self->_regionToRender;
    if (v14)
    {
      -[NURegion bounds](v14, "bounds");
      v16 = v116;
      v15 = v117;
    }
    else
    {
      v15 = 0uLL;
      v16 = 0uLL;
    }
    *(int64x2_t *)buf = v118;
    *(int64x2_t *)&buf[16] = v119;
    v121 = v16;
    v122 = v15;
    NU::RectT<long>::add(v121.i64, (uint64_t *)buf);
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v118, v121), (int32x4_t)vceqq_s64(v119, v122))), 0xFuLL))) & 1) != 0)
    {
LABEL_28:
      -[NUImageRenderJob imageRequest](self, "imageRequest");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "colorSpace");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      -[NUImageRenderJob imageRequest](self, "imageRequest");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "pixelFormat");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      -[NUImageRenderJob imageRequest](self, "imageRequest");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "maxEDRHeadroom");
      v40 = v39;

      -[NUImageRenderJob imageRequest](self, "imageRequest");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "auxiliaryImageType");

      v115 = v37;
      if (v42 != 1
        || !+[NUGlobalSettings enableHDRSupport](NUGlobalSettings, "enableHDRSupport")
        || (+[NUGlobalSettings thresholdDisplayHeadroom](NUGlobalSettings, "thresholdDisplayHeadroom"),
            v40 <= v43))
      {
        v49 = v7;
        goto LABEL_35;
      }
      -[NURenderJob prepareNode](self, "prepareNode");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "imageProperties:", a3);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v45, "isHDR"))
      {
        objc_msgSend(v45, "colorSpace");
        v46 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!+[NUGlobalSettings renderMeteorPlusAsHDR](NUGlobalSettings, "renderMeteorPlusAsHDR"))
          goto LABEL_57;
        if (!objc_msgSend(v45, "hasGainMap"))
          goto LABEL_57;
        objc_msgSend(v45, "gainMapHeadroom");
        if (v78 <= 1.0)
          goto LABEL_57;
        if (+[NUGlobalSettings renderEDRAsPQ](NUGlobalSettings, "renderEDRAsPQ"))
          +[NUColorSpace itur2100PQColorSpace](NUColorSpace, "itur2100PQColorSpace");
        else
          +[NUColorSpace extendedSRGBLinearColorSpace](NUColorSpace, "extendedSRGBLinearColorSpace");
        v46 = objc_claimAutoreleasedReturnValue();
      }
      v47 = (void *)v46;

      -[NUImageRenderJob _HDRPixelFormatForColorSpace:](self, "_HDRPixelFormatForColorSpace:", v47);
      v48 = objc_claimAutoreleasedReturnValue();

      v35 = v47;
      v115 = (void *)v48;
LABEL_57:
      v49 = v7;

LABEL_35:
      -[NUImageRenderJob imageRequest](self, "imageRequest");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "tileSize");
      v53 = v52;

      -[NUImageRenderJob imageRequest](self, "imageRequest");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "borderSize");
      v57 = v56;

      -[NUImageRenderJob imageRequest](self, "imageRequest");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "targetImage");
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (v59)
      {
        objc_msgSend(v59, "colorSpace");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "isEqual:", v35);

        if ((v61 & 1) == 0)
        {
          +[NUError mismatchError:object:](NUError, "mismatchError:object:", CFSTR("Incompatible target image color space"), v59);
          v13 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
          v63 = v115;
          goto LABEL_49;
        }
        objc_msgSend(v59, "format");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = v115;
        v64 = objc_msgSend(v62, "isEqual:", v115);

        if ((v64 & 1) != 0)
        {
          v65 = objc_msgSend(v59, "size");
          v67 = v66;
          if (v65 == -[NURenderJob imageSize](self, "imageSize") && v67 == v68)
          {
            v69 = v59;
            targetImage = self->_targetImage;
            self->_targetImage = v69;
LABEL_44:

            -[NUImageRenderJob setColorSpace:](self, "setColorSpace:", v35);
            -[NUImageRenderJob setPixelFormat:](self, "setPixelFormat:", v63);
            v13 = 1;
LABEL_49:

            return v13;
          }
          v76 = CFSTR("Incompatible target image size");
        }
        else
        {
          v76 = CFSTR("Incompatible target image format");
        }
        +[NUError mismatchError:object:](NUError, "mismatchError:object:", v76, v59);
        v13 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_49;
      }
      v71 = -[NURenderJob imageSize](self, "imageSize");
      -[NUImageRenderJob imageAccumulationNodeWithImageSize:tileSize:borderSize:format:colorSpace:](self, "imageAccumulationNodeWithImageSize:tileSize:borderSize:format:colorSpace:", v71, v72, v51, v53, v55, v57, v115, v35);
      targetImage = (void *)objc_claimAutoreleasedReturnValue();
      if (targetImage)
      {
        +[NURenderNode nodeFromCache:](NURenderNode, "nodeFromCache:", targetImage);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[NURenderJob setRenderNode:](self, "setRenderNode:", v73);
        objc_msgSend(v73, "image");
        v74 = (NUMutablePurgeableImage *)objc_claimAutoreleasedReturnValue();
        v75 = self->_targetImage;
        self->_targetImage = v74;

      }
      v63 = v115;
      goto LABEL_44;
    }
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_9681);
    v17 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      v19 = v17;
      objc_msgSend(v18, "stringWithFormat:", CFSTR("Render region extends beyond valid extent"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v20;
      _os_log_impl(&dword_1A6553000, v19, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      v21 = _NULogOnceToken;
    }
    else
    {
      v21 = -1;
    }
    if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v21 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_9681);
      v22 = (void *)_NUAssertLogger;
      if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        goto LABEL_27;
      v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v28 = (void *)MEMORY[0x1E0CB3978];
      v29 = v27;
      v30 = v22;
      objc_msgSend(v28, "callStackSymbols");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v32;
      _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    else
    {
      if (v21 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_9681);
      v33 = (void *)_NUAssertLogger;
      if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        goto LABEL_27;
      v79 = (void *)MEMORY[0x1E0CB3978];
      v30 = v33;
      objc_msgSend(v79, "callStackSymbols");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "componentsJoinedByString:", CFSTR("\n"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v81;
      _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
LABEL_27:
    _NUAssertContinueHandler((uint64_t)"-[NUImageRenderJob prepare:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageRenderJob.m", 183, CFSTR("Render region extends beyond valid extent"), v23, v24, v25, v26, v114);
    goto LABEL_28;
  }
  return 1;
}

- (NUPurgeableStoragePool)storagePool
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (-[NURenderJob rendererType](self, "rendererType") == 1 || -[NURenderJob rendererType](self, "rendererType") == 2)
  {
    +[NUFactory sharedFactory](NUFactory, "sharedFactory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "surfaceStoragePool");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[NUFactory sharedFactory](NUFactory, "sharedFactory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bufferStoragePool");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return (NUPurgeableStoragePool *)v5;
}

- (id)renderBufferOfSize:(id)a3 format:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NUStorageImageBuffer *v11;
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
  _BYTE v29[12];
  __int16 v30;
  void *v31;
  uint64_t v32;

  var1 = a3.var1;
  var0 = a3.var0;
  v32 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[NUImageRenderJob storagePool](self, "storagePool");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "newStorageWithMinimumSize:format:", var0, var1, v7);
  if (!v9)
  {
    NUAssertLogger_9655();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No storage allocated"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v29 = 138543362;
      *(_QWORD *)&v29[4] = v14;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v29, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_9655();
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
        *(_DWORD *)v29 = 138543618;
        *(_QWORD *)&v29[4] = v20;
        v30 = 2114;
        v31 = v24;
        _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v29, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v29 = 138543362;
      *(_QWORD *)&v29[4] = v19;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v29, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageRenderJob renderBufferOfSize:format:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageRenderJob.m", 268, CFSTR("No storage allocated"), v25, v26, v27, v28, *(uint64_t *)v29);
  }
  v10 = (void *)v9;
  v11 = -[NUStorageImageBuffer initWithStorage:fromPool:]([NUStorageImageBuffer alloc], "initWithStorage:fromPool:", v9, v8);

  return v11;
}

- (BOOL)render:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  NUPurgeableImageAccessGuard *v8;
  NUPurgeableImageAccessGuard *accessRegionGuard;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NUStorageImageBuffer *v15;
  NUStorageImageBuffer *renderBuffer;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  BOOL v53;
  NSObject *v55;
  void *v56;
  void *specific;
  NSObject *v58;
  _BOOL4 v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id *v71;
  void *v72;
  void *v73;
  uint8_t buf[40];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_9655();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v56;
      _os_log_error_impl(&dword_1A6553000, v55, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_9655();
    v58 = objc_claimAutoreleasedReturnValue();
    v59 = os_log_type_enabled(v58, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v59)
      {
        v62 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v63 = (void *)MEMORY[0x1E0CB3978];
        v64 = v62;
        objc_msgSend(v63, "callStackSymbols");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "componentsJoinedByString:", CFSTR("\n"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v62;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v66;
        _os_log_error_impl(&dword_1A6553000, v58, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v59)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "componentsJoinedByString:", CFSTR("\n"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v61;
      _os_log_error_impl(&dword_1A6553000, v58, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageRenderJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageRenderJob.m", 275, CFSTR("Invalid parameter not satisfying: %s"), v67, v68, v69, v70, (uint64_t)"error != NULL");
  }
  -[NUImageRenderJob pixelFormat](self, "pixelFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUImageRenderJob colorSpace](self, "colorSpace");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUImageRenderJob regionToRender](self, "regionToRender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUImageRenderJob targetImage](self, "targetImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[NUPurgeableImageAccessGuard initWithRegion:image:]([NUPurgeableImageAccessGuard alloc], "initWithRegion:image:", v6, v7);
    accessRegionGuard = self->_accessRegionGuard;
    self->_accessRegionGuard = v8;

    objc_msgSend(v7, "validRegion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "regionByRemovingRegion:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }
  if ((objc_msgSend(v6, "isEmpty") & 1) != 0)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_203_9667);
    v12 = _NURenderLogger;
    if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = self;
      _os_log_debug_impl(&dword_1A6553000, v12, OS_LOG_TYPE_DEBUG, "job %p region to render is empty", buf, 0xCu);
    }
  }
  else
  {
    memset(buf, 0, 32);
    if (v6)
    {
      objc_msgSend(v6, "bounds");
      v14 = *(_QWORD *)&buf[24];
      v13 = *(_QWORD *)&buf[16];
    }
    else
    {
      v14 = 0;
      v13 = 0;
    }
    v71 = a3;
    -[NUImageRenderJob renderBufferOfSize:format:](self, "renderBufferOfSize:format:", v13, v14, v5);
    v15 = (NUStorageImageBuffer *)objc_claimAutoreleasedReturnValue();
    renderBuffer = self->_renderBuffer;
    self->_renderBuffer = v15;

    +[NUGlobalSettings debugRenderBlue](NUGlobalSettings, "debugRenderBlue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[NURenderJob request](self, "request");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUGlobalSettings debugRenderBlue](NUGlobalSettings, "debugRenderBlue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "containsString:", v20);

      if (v21)
      {
        objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 1.0, 0.5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
    }
    v72 = v5;
    +[NUGlobalSettings debugRenderPurple](NUGlobalSettings, "debugRenderPurple");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)v22;
      -[NURenderJob request](self, "request");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUGlobalSettings debugRenderPurple](NUGlobalSettings, "debugRenderPurple");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "containsString:", v26);

      if (v27)
      {
        objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:alpha:", 0.8, 0.0, 0.8, 0.5);
        v28 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v28;
      }
    }
    +[NUGlobalSettings debugRenderYellow](NUGlobalSettings, "debugRenderYellow");
    v29 = objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = (void *)v29;
      -[NURenderJob request](self, "request");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "name");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUGlobalSettings debugRenderYellow](NUGlobalSettings, "debugRenderYellow");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v32, "containsString:", v33);

      if (v34)
      {
        objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 0.0, 0.5);
        v35 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v35;
      }
    }
    if (v17)
    {
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithColor:", v17);
      -[NURenderJob outputImage](self, "outputImage");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "imageByCompositingOverImage:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C9DDB8], "textImageGeneratorFilter");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lli"), -[NURenderJob jobNumber](self, "jobNumber"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setText:", v40);

      LODWORD(v41) = 6.0;
      objc_msgSend(v39, "setScaleFactor:", v41);
      objc_msgSend(v39, "outputImage");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "imageByClampingToExtent");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v43, "imageByCroppingToRect:", 0.0, 0.0, 350.0, 150.0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "imageByApplyingFilter:", CFSTR("CIAffineTile"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "imageByCompositingOverImage:", v38);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[NURenderJob setOutputImage:](self, "setOutputImage:", v46);

    }
    -[NURenderJob outputImage](self, "outputImage");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUStorageImageBuffer storage](self->_renderBuffer, "storage");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = -[NURenderJob imageSize](self, "imageSize");
    -[NURenderJob renderImage:into:colorSpace:roi:imageSize:error:](self, "renderImage:into:colorSpace:roi:imageSize:error:", v47, v48, v73, v6, v49, v50, v71);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUImageRenderJob setRenderTask:](self, "setRenderTask:", v51);

    -[NUImageRenderJob renderTask](self, "renderTask");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v72;
    if (!v52)
    {
      v53 = 0;
      goto LABEL_26;
    }
  }
  objc_storeStrong((id *)&self->_renderedRegion, v6);
  v53 = 1;
LABEL_26:

  return v53;
}

- (BOOL)complete:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;
  NUPurgeableImage *v13;
  NUPurgeableImage *renderedImage;
  NUPurgeableImage *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v20;
  double v21;
  NSObject *v22;
  void *v23;
  void *specific;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[5];
  id v54;
  _BYTE *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t v59[4];
  void *v60;
  __int16 v61;
  void *v62;
  _BYTE buf[28];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_9655();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v23;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_9655();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v30 = (void *)MEMORY[0x1E0CB3978];
        v31 = v29;
        objc_msgSend(v30, "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v29;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v33;
        _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v28;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageRenderJob complete:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageRenderJob.m", 339, CFSTR("Invalid parameter not satisfying: %s"), v34, v35, v36, v37, (uint64_t)"error != NULL");
  }
  -[NUImageRenderJob renderTask](self, "renderTask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "waitUntilCompletedAndReturnError:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      -[NURenderJob request](self, "request");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "copy");
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("failed to render"), v18, *a3);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v11 = 0;
      goto LABEL_20;
    }
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_203_9667);
    v8 = (void *)_NURenderLogger;
    if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_DEBUG))
    {
      v20 = v8;
      objc_msgSend(v7, "kernelExecutionTime");
      *(_DWORD *)buf = 134218496;
      *(double *)&buf[4] = v21 * 1000.0;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = objc_msgSend(v7, "passCount");
      *(_WORD *)&buf[18] = 2048;
      *(double *)&buf[20] = (float)((float)objc_msgSend(v7, "pixelsProcessed") * 0.00000095367);
      _os_log_debug_impl(&dword_1A6553000, v20, OS_LOG_TYPE_DEBUG, "CIRenderInfo: exec=%0.3fms pass=%d pixels=%0.3fMpix", buf, 0x1Cu);

    }
  }
  -[NUImageRenderJob renderedRegion](self, "renderedRegion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUImageRenderJob targetImage](self, "targetImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v9, "bounds");
  }
  else
  {
    v57 = 0u;
    v58 = 0u;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v11 = 1;
  buf[24] = 1;
  if (v10)
  {
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __29__NUImageRenderJob_complete___block_invoke;
    v53[3] = &unk_1E5061B58;
    v56 = v57;
    v55 = buf;
    v53[4] = self;
    v12 = v10;
    v54 = v12;
    objc_msgSend(v9, "enumerateRects:", v53);
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      objc_msgSend(v12, "purgeableImageCopy");
      v13 = (NUPurgeableImage *)objc_claimAutoreleasedReturnValue();
      renderedImage = self->_renderedImage;
      self->_renderedImage = v13;

      v15 = self->_renderedImage;
      if (!v15)
      {
        NUAssertLogger_9655();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Couldn't make purgeable image copy"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v59 = 138543362;
          v60 = v39;
          _os_log_error_impl(&dword_1A6553000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v59, 0xCu);

        }
        v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        NUAssertLogger_9655();
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
        if (v40)
        {
          if (v42)
          {
            v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "componentsJoinedByString:", CFSTR("\n"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v59 = 138543618;
            v60 = v45;
            v61 = 2114;
            v62 = v47;
            _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v59, 0x16u);

          }
        }
        else if (v42)
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v59 = 138543362;
          v60 = v44;
          _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v59, 0xCu);

        }
        _NUAssertFailHandler((uint64_t)"-[NUImageRenderJob complete:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageRenderJob.m", 368, CFSTR("Couldn't make purgeable image copy"), v48, v49, v50, v51, v52);
      }
      -[NUImageRenderJob regionToRender](self, "regionToRender");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUPurgeableImage beginAccessRegion:](v15, "beginAccessRegion:", v16);
    }
    else
    {
      -[NUImageRenderJob renderBuffer](self, "renderBuffer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("Failed to copy image"), v16);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    v11 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
  }
  _Block_object_dispose(buf, 8);

LABEL_20:
  return v11;
}

- (BOOL)copyStorage:(id)a3 fromRect:(id *)a4 toImage:(id)a5 atPoint:(id)a6
{
  int64_t var1;
  int64_t var0;
  id v11;
  id v12;
  void *v13;
  $0AC6E346AE4835514AAA8AC86D8F4844 v14;
  char v15;
  $0AC6E346AE4835514AAA8AC86D8F4844 v16;
  $0AC6E346AE4835514AAA8AC86D8F4844 v18;
  $0AC6E346AE4835514AAA8AC86D8F4844 v19;

  var1 = a6.var1;
  var0 = a6.var0;
  v11 = a3;
  v12 = a5;
  if (-[NURenderJob rendererType](self, "rendererType") == 1 || -[NURenderJob rendererType](self, "rendererType") == 2)
  {
    -[NURenderJob device](self, "device");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = a4->var1;
    v18 = a4->var0;
    v19 = v14;
    v15 = objc_msgSend(v12, "copySurfaceStorage:fromRect:toPoint:device:", v11, &v18, var0, var1, v13);

  }
  else
  {
    v16 = a4->var1;
    v18 = a4->var0;
    v19 = v16;
    v15 = objc_msgSend(v12, "copyBufferStorage:fromRect:toPoint:", v11, &v18, var0, var1);
  }

  return v15;
}

- (void)cleanUp
{
  NUPurgeableImageAccessGuard *accessRegionGuard;
  NUPurgeableImage *renderedImage;
  NUStorageImageBuffer *renderBuffer;

  accessRegionGuard = self->_accessRegionGuard;
  self->_accessRegionGuard = 0;

  renderedImage = self->_renderedImage;
  self->_renderedImage = 0;

  renderBuffer = self->_renderBuffer;
  self->_renderBuffer = 0;

}

- (NUPixelFormat)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(id)a3
{
  objc_storeStrong((id *)&self->_pixelFormat, a3);
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(id)a3
{
  objc_storeStrong((id *)&self->_colorSpace, a3);
}

- (NURegion)regionToRender
{
  return self->_regionToRender;
}

- (NUMutablePurgeableImage)targetImage
{
  return self->_targetImage;
}

- (NURegion)renderedRegion
{
  return self->_renderedRegion;
}

- (NUPurgeableImage)renderedImage
{
  return self->_renderedImage;
}

- (NUStorageImageBuffer)renderBuffer
{
  return self->_renderBuffer;
}

- (CIRenderTask)renderTask
{
  return self->_renderTask;
}

- (void)setRenderTask:(id)a3
{
  objc_storeStrong((id *)&self->_renderTask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderTask, 0);
  objc_storeStrong((id *)&self->_renderBuffer, 0);
  objc_storeStrong((id *)&self->_renderedImage, 0);
  objc_storeStrong((id *)&self->_renderedRegion, 0);
  objc_storeStrong((id *)&self->_targetImage, 0);
  objc_storeStrong((id *)&self->_regionToRender, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_pixelFormat, 0);
  objc_storeStrong((id *)&self->_accessRegionGuard, 0);
}

void __29__NUImageRenderJob_complete___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  _QWORD v12[2];
  __int128 v13;

  v2 = *(_QWORD *)(a1[6] + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    v5 = *(_QWORD *)(a2 + 8) - a1[8];
    v6 = *(_QWORD *)a2 - a1[7];
    v11 = *(_OWORD *)(a2 + 16);
    v7 = (void *)a1[4];
    objc_msgSend(v7, "renderBuffer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = a1[5];
    v12[0] = v6;
    v12[1] = v5;
    v13 = v11;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v7, "copyStorage:fromRect:toImage:atPoint:", v9, v12, v10, *(_QWORD *)a2, *(_QWORD *)(a2 + 8));

  }
  else
  {
    *(_BYTE *)(v2 + 24) = 0;
  }
}

uint64_t __49__NUImageRenderJob__HDRPixelFormatForColorSpace___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsPixelFormat:", v3);

  return v5;
}

@end
