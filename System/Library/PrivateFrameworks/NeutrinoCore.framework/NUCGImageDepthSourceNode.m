@implementation NUCGImageDepthSourceNode

- (NUCGImageDepthSourceNode)initWithSourceNode:(id)a3 auxiliaryImageType:(int64_t)a4 auxiliaryImageProperties:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v22;
  double v23;
  _OWORD *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  NSObject *v30;
  void *v31;
  void *specific;
  NSObject *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
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
  objc_super v62;
  CGAffineTransform v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!v8)
  {
    NUAssertLogger_8396();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "sourceNode != nil");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v63.a) = 138543362;
      *(_QWORD *)((char *)&v63.a + 4) = v31;
      _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v63, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_8396();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v34)
      {
        v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v45 = (void *)MEMORY[0x1E0CB3978];
        v46 = v44;
        objc_msgSend(v45, "callStackSymbols");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v63.a) = 138543618;
        *(_QWORD *)((char *)&v63.a + 4) = v44;
        WORD2(v63.b) = 2114;
        *(_QWORD *)((char *)&v63.b + 6) = v48;
        _os_log_error_impl(&dword_1A6553000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v63, 0x16u);

      }
    }
    else if (v34)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v63.a) = 138543362;
      *(_QWORD *)((char *)&v63.a + 4) = v36;
      _os_log_error_impl(&dword_1A6553000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v63, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageDepthSourceNode initWithSourceNode:auxiliaryImageType:auxiliaryImageProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGAuxiliaryImage.m", 33, CFSTR("Invalid parameter not satisfying: %s"), v49, v50, v51, v52, (uint64_t)"sourceNode != nil");
  }
  v10 = v9;
  if (!v9)
  {
    NUAssertLogger_8396();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "auxiliaryImageProperties != nil");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v63.a) = 138543362;
      *(_QWORD *)((char *)&v63.a + 4) = v38;
      _os_log_error_impl(&dword_1A6553000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v63, 0xCu);

    }
    v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_8396();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
    if (v39)
    {
      if (v41)
      {
        v53 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v54 = (void *)MEMORY[0x1E0CB3978];
        v55 = v53;
        objc_msgSend(v54, "callStackSymbols");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "componentsJoinedByString:", CFSTR("\n"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v63.a) = 138543618;
        *(_QWORD *)((char *)&v63.a + 4) = v53;
        WORD2(v63.b) = 2114;
        *(_QWORD *)((char *)&v63.b + 6) = v57;
        _os_log_error_impl(&dword_1A6553000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v63, 0x16u);

      }
    }
    else if (v41)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v63.a) = 138543362;
      *(_QWORD *)((char *)&v63.a + 4) = v43;
      _os_log_error_impl(&dword_1A6553000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v63, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageDepthSourceNode initWithSourceNode:auxiliaryImageType:auxiliaryImageProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGAuxiliaryImage.m", 34, CFSTR("Invalid parameter not satisfying: %s"), v58, v59, v60, v61, (uint64_t)"auxiliaryImageProperties != nil");
  }
  v62.receiver = self;
  v62.super_class = (Class)NUCGImageDepthSourceNode;
  v11 = -[NUCGAuxiliaryImageSourceNode initWithSourceNode:auxiliaryImageType:auxiliaryImageProperties:](&v62, sel_initWithSourceNode_auxiliaryImageType_auxiliaryImageProperties_, v8, a4, v9);
  *((_QWORD *)v11 + 33) = objc_msgSend(v10, "size");
  *((_QWORD *)v11 + 34) = v12;
  v13 = v11 + 272;
  v14 = objc_msgSend(v8, "pixelSizeWithSourceOptions:", MEMORY[0x1E0C9AA70]);
  v16 = (double)*((uint64_t *)v11 + 33);
  v17 = (double)*((uint64_t *)v11 + 34);
  v18 = (double)v15 * v16 / (double)v14;
  v19 = (double)v14 * v17 / (double)v15;
  v20 = vabdd_f64(v19, v16);
  if (vabdd_f64(v18, v17) > 1.0 || v20 > 1.0)
  {
    v11[208] = 1;
    v22 = (double)v14 / (double)v15;
    v23 = v16 / v17;
    v24 = v11 + 216;
    if (v16 / v17 <= v22)
    {
      CGAffineTransformMakeScale(&v63, v22 / v23, 1.0);
      v27 = *(_OWORD *)&v63.a;
      v28 = *(_OWORD *)&v63.tx;
      *(_OWORD *)(v11 + 232) = *(_OWORD *)&v63.c;
      *(_OWORD *)(v11 + 248) = v28;
      *v24 = v27;
      v18 = v19;
      v13 = v11 + 264;
    }
    else
    {
      CGAffineTransformMakeScale(&v63, 1.0, v23 / v22);
      v25 = *(_OWORD *)&v63.a;
      v26 = *(_OWORD *)&v63.tx;
      *(_OWORD *)(v11 + 232) = *(_OWORD *)&v63.c;
      *(_OWORD *)(v11 + 248) = v26;
      *v24 = v25;
    }
    *v13 = llround(v18);
  }

  return (NUCGImageDepthSourceNode *)v11;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUCGImageDepthSourceNode;
  -[NUCGAuxiliaryImageSourceNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v7, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  uint64_t v20;
  NSObject *v22;
  void *v23;
  void *specific;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _BYTE buf[32];
  __int128 v55;
  _QWORD v56[2];
  _QWORD v57[3];

  v57[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!a5)
  {
    NUAssertLogger_8396();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v23;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_8396();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v37 = (void *)MEMORY[0x1E0CB3978];
        v38 = v36;
        objc_msgSend(v37, "callStackSymbols");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v36;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v40;
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
    _NUAssertFailHandler((uint64_t)"-[NUCGImageDepthSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGAuxiliaryImage.m", 76, CFSTR("Invalid parameter not satisfying: %s"), v41, v42, v43, v44, (uint64_t)"error != nil");
  }
  if (!a4)
  {
    NUAssertLogger_8396();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "subsampleFactor != NULL");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v30;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_8396();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (v31)
    {
      if (v33)
      {
        v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v46 = (void *)MEMORY[0x1E0CB3978];
        v47 = v45;
        objc_msgSend(v46, "callStackSymbols");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v45;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v49;
        _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v33)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v35;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageDepthSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGAuxiliaryImage.m", 78, CFSTR("Invalid parameter not satisfying: %s"), v50, v51, v52, v53, (uint64_t)"subsampleFactor != NULL");
  }
  v9 = v8;
  *a4 = 1;
  -[NUCGAuxiliaryImageSourceNode _evaluateAuxiliaryImageForType:error:](self, "_evaluateAuxiliaryImageForType:error:", -[NUCGAuxiliaryImageSourceNode auxiliaryImageType](self, "auxiliaryImageType"), a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "underlyingAVDepthData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = objc_retainAutorelease(v12);
      v15 = (void *)objc_msgSend(v14, "depthDataMap");
      if (v15)
      {
        v56[0] = *MEMORY[0x1E0C9E110];
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v56[1] = *MEMORY[0x1E0C9E0A0];
        v57[0] = v16;
        v57[1] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", v15, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v18;
        if (self->_needsAspectRatioCorrection)
        {
          v19 = *(_OWORD *)&self->_aspectTransform.c;
          *(_OWORD *)buf = *(_OWORD *)&self->_aspectTransform.a;
          *(_OWORD *)&buf[16] = v19;
          v55 = *(_OWORD *)&self->_aspectTransform.tx;
          objc_msgSend(v18, "imageByApplyingTransform:", buf);
          v20 = objc_claimAutoreleasedReturnValue();

          v15 = (void *)v20;
        }

      }
      else
      {
        +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Unable to convert AVDepthData to disparity"), self);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
