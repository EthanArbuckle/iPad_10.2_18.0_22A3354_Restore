@implementation NUAuxiliaryImageRenderJob

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (BOOL)wantsPrepareNodeCached
{
  return 0;
}

- (BOOL)wantsRenderNodeCached
{
  return 0;
}

- (BOOL)wantsRenderScaleClampedToNativeScale
{
  return 1;
}

- (id)scalePolicy
{
  uint64_t v3;
  uint64_t v4;
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
  NUFixedScalePolicy *v15;
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
  _BYTE v33[12];
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = *((_QWORD *)&NUScaleOne + 1);
  v3 = NUScaleOne;
  -[NUAuxiliaryImageRenderJob imageProperties](self, "imageProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    NUAssertLogger_1008();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing image properties"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v33 = 138543362;
      *(_QWORD *)&v33[4] = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v33, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1008();
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
        *(_DWORD *)v33 = 138543618;
        *(_QWORD *)&v33[4] = v24;
        v34 = 2114;
        v35 = v28;
        _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v33, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v33 = 138543362;
      *(_QWORD *)&v33[4] = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v33, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUAuxiliaryImageRenderJob scalePolicy]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUAuxiliaryImageRenderRequest.m", 124, CFSTR("Missing image properties"), v29, v30, v31, v32, *(uint64_t *)v33);
  }
  -[NUAuxiliaryImageRenderJob imageProperties](self, "imageProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auxiliaryImagePropertiesForType:", -[NUAuxiliaryImageRenderJob auxiliaryImageType](self, "auxiliaryImageType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NUAuxiliaryImageRenderJob imageProperties](self, "imageProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "size");
    v11 = v10;

    v12 = objc_msgSend(v7, "size");
    v3 = NUScaleToFitSizeInSize(v9, v11, v12, v13);
    v4 = v14;
  }
  v15 = -[NUFixedScalePolicy initWithScale:]([NUFixedScalePolicy alloc], "initWithScale:", v3, v4);

  return v15;
}

- (id)newRenderPipelineStateForEvaluationMode:(int64_t)a3
{
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NUAuxiliaryImageRenderJob;
  v5 = -[NURenderJob newRenderPipelineStateForEvaluationMode:](&v8, sel_newRenderPipelineStateForEvaluationMode_);
  v6 = v5;
  if (a3)
    objc_msgSend(v5, "setAuxiliaryImageType:", self->_auxiliaryImageType);
  return v6;
}

- (id)evaluateOutputGeometry:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[NURenderJob prepareNode](self, "prepareNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    NUAssertLogger_1008();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing prepare node"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1008();
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
        v29 = v18;
        v30 = 2114;
        v31 = v22;
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
      v29 = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUAuxiliaryImageRenderJob evaluateOutputGeometry:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUAuxiliaryImageRenderRequest.m", 147, CFSTR("Missing prepare node"), v23, v24, v25, v26, (uint64_t)v27.receiver);
  }
  -[NURenderJob prepareNode](self, "prepareNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageProperties:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUAuxiliaryImageRenderJob setImageProperties:](self, "setImageProperties:", v7);

  -[NUAuxiliaryImageRenderJob imageProperties](self, "imageProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v27.receiver = self;
    v27.super_class = (Class)NUAuxiliaryImageRenderJob;
    -[NURenderJob evaluateOutputGeometry:](&v27, sel_evaluateOutputGeometry_, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)prepare:(id *)a3
{
  id *v3;
  void *v5;
  NSObject *v7;
  void *v8;
  void *specific;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_1008();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v8;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1008();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v15 = (void *)MEMORY[0x1E0CB3978];
        v16 = v14;
        objc_msgSend(v15, "callStackSymbols");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v14;
        v26 = 2114;
        v27 = v18;
        _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v13;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUAuxiliaryImageRenderJob prepare:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUAuxiliaryImageRenderRequest.m", 160, CFSTR("Invalid parameter not satisfying: %s"), v19, v20, v21, v22, (uint64_t)"error != nil");
  }
  v3 = a3;
  -[NURenderJob request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUAuxiliaryImageRenderJob setAuxiliaryImageType:](self, "setAuxiliaryImageType:", objc_msgSend(v5, "auxiliaryImageType"));
  v23.receiver = self;
  v23.super_class = (Class)NUAuxiliaryImageRenderJob;
  LOBYTE(v3) = -[NURenderJob prepare:](&v23, sel_prepare_, v3);

  return (char)v3;
}

- (unsigned)targetPixelFormat
{
  int64_t v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v3 = -[NUAuxiliaryImageRenderJob auxiliaryImageType](self, "auxiliaryImageType");
  if ((unint64_t)(v3 - 10) < 3)
    return 1111970369;
  if (v3 == 2)
    return 1751411059;
  v4 = 1278226488;
  if (v3 == 7)
  {
    -[NUAuxiliaryImageRenderJob imageProperties](self, "imageProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "auxiliaryImagePropertiesForType:", 7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 0;
    objc_msgSend(v6, "auxiliaryImage:", &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v4 = objc_msgSend(v7, "pixelFormatType");

  }
  return v4;
}

- (BOOL)render:(id *)a3
{
  void *v5;
  int v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NUCVPixelBuffer *v15;
  NUCVPixelBuffer *pixelBuffer;
  NUCVPixelBuffer *v17;
  void *v18;
  unint64_t auxiliaryImageType;
  __CVBuffer *v20;
  __CVBuffer *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  OSType PixelFormatType;
  CFDictionaryRef v27;
  void *v28;
  char v29;
  void *v30;
  int v31;
  __CVBuffer *v32;
  const __CFString *v33;
  __CVBuffer *v34;
  __CVBuffer *v35;
  __CVBuffer *v36;
  uint64_t v37;
  void *v38;
  __CVBuffer *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  CIRenderTask *v46;
  CIRenderTask *renderTask;
  void *v48;
  void *v49;
  NSObject *v51;
  void *v52;
  void *specific;
  NSObject *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  _BYTE buf[24];
  uint64_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_1008();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v52;
      _os_log_error_impl(&dword_1A6553000, v51, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1008();
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v55)
      {
        v58 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v59 = (void *)MEMORY[0x1E0CB3978];
        v60 = v58;
        objc_msgSend(v59, "callStackSymbols");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "componentsJoinedByString:", CFSTR("\n"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v58;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v62;
        _os_log_error_impl(&dword_1A6553000, v54, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v55)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "componentsJoinedByString:", CFSTR("\n"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v57;
      _os_log_error_impl(&dword_1A6553000, v54, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUAuxiliaryImageRenderJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUAuxiliaryImageRenderRequest.m", 201, CFSTR("Invalid parameter not satisfying: %s"), v63, v64, v65, v66, (uint64_t)"error != nil");
  }
  -[NURenderJob renderNode](self, "renderNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canPropagateOriginalAuxiliaryData:", -[NUAuxiliaryImageRenderJob auxiliaryImageType](self, "auxiliaryImageType"));

  if (v6)
  {
    -[NURenderJob request](self, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "skipRenderIfNotRequired"))
    {
      +[NUError skippedError:object:](NUError, "skippedError:object:", CFSTR("Original auxiliary data can be propagated, skipping render"), v7);
      v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[NURenderJob renderNode](self, "renderNode");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "originalAuxiliaryImageForType:error:", -[NUAuxiliaryImageRenderJob auxiliaryImageType](self, "auxiliaryImageType"), a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v23 != 0;
      if (v23)
        -[NUAuxiliaryImageRenderJob setAuxiliaryImage:](self, "setAuxiliaryImage:", v23);

    }
    return v8;
  }
  -[NURenderJob renderer:](self, "renderer:", a3);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    return 0;
  v10 = (void *)v9;
  -[NURenderJob outputGeometry](self, "outputGeometry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "scaledSize");
  v14 = v13;
  v15 = +[NUVideoUtilities newPixelBufferOfSize:format:](NUVideoUtilities, "newPixelBufferOfSize:format:", v12, v13, -[NUAuxiliaryImageRenderJob targetPixelFormat](self, "targetPixelFormat"));
  pixelBuffer = self->_pixelBuffer;
  self->_pixelBuffer = v15;

  v17 = self->_pixelBuffer;
  if (!v17)
  {
    -[NURenderJob request](self, "request");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");
    +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("failed to allocate buffer for depth"), v25);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    return 0;
  }
  v18 = 0;
  auxiliaryImageType = self->_auxiliaryImageType;
  v68 = v11;
  if (auxiliaryImageType <= 0xC)
  {
    if (((1 << auxiliaryImageType) & 0x378) != 0)
    {
      v20 = -[NUCVPixelBuffer CVPixelBuffer](v17, "CVPixelBuffer");
      CVBufferSetAttachment(v20, (CFStringRef)*MEMORY[0x1E0CA8E98], (CFTypeRef)*MEMORY[0x1E0CA8EB8], kCVAttachmentMode_ShouldPropagate);
      v21 = -[NUCVPixelBuffer CVPixelBuffer](self->_pixelBuffer, "CVPixelBuffer");
      CVBufferSetAttachment(v21, (CFStringRef)*MEMORY[0x1E0CA8D68], (CFTypeRef)*MEMORY[0x1E0CA8D88], kCVAttachmentMode_ShouldPropagate);
      v18 = 0;
      goto LABEL_29;
    }
    if (((1 << auxiliaryImageType) & 0x1C00) != 0)
    {
      +[NUColorSpace displayP3ColorSpace](NUColorSpace, "displayP3ColorSpace");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "applyAttachmentsToCVPixelBuffer:", -[NUCVPixelBuffer CVPixelBuffer](self->_pixelBuffer, "CVPixelBuffer"));
      goto LABEL_29;
    }
    if (auxiliaryImageType != 7)
      goto LABEL_29;
    PixelFormatType = CVPixelBufferGetPixelFormatType(-[NUCVPixelBuffer CVPixelBuffer](v17, "CVPixelBuffer"));
    v27 = CVPixelFormatDescriptionCreateWithPixelFormatType(0, PixelFormatType);
    -[__CFDictionary objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9180]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "BOOLValue");

    -[__CFDictionary objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9188]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "BOOLValue");

    if ((v29 & 1) != 0 || v31)
    {
      v34 = -[NUCVPixelBuffer CVPixelBuffer](self->_pixelBuffer, "CVPixelBuffer");
      v33 = (const __CFString *)*MEMORY[0x1E0CA8CD8];
      CVBufferRemoveAttachment(v34, (CFStringRef)*MEMORY[0x1E0CA8CD8]);
      v35 = -[NUCVPixelBuffer CVPixelBuffer](self->_pixelBuffer, "CVPixelBuffer");
      CVBufferSetAttachment(v35, (CFStringRef)*MEMORY[0x1E0CA8E98], (CFTypeRef)*MEMORY[0x1E0CA8EB8], kCVAttachmentMode_ShouldPropagate);
      v36 = -[NUCVPixelBuffer CVPixelBuffer](self->_pixelBuffer, "CVPixelBuffer");
      CVBufferSetAttachment(v36, (CFStringRef)*MEMORY[0x1E0CA8EE8], (CFTypeRef)*MEMORY[0x1E0CA8F10], kCVAttachmentMode_ShouldPropagate);
      v18 = 0;
    }
    else
    {
      +[NUColorSpace linearGrayColorSpace](NUColorSpace, "linearGrayColorSpace");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[NUCVPixelBuffer CVPixelBuffer](self->_pixelBuffer, "CVPixelBuffer");
      v33 = (const __CFString *)*MEMORY[0x1E0CA8CD8];
      CVBufferSetAttachment(v32, (CFStringRef)*MEMORY[0x1E0CA8CD8], (CFTypeRef)objc_msgSend(v18, "CGColorSpace"), kCVAttachmentMode_ShouldPropagate);
    }
    -[NUImageProperties flexRangeProperties](self->_imageProperties, "flexRangeProperties");
    v37 = objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      v38 = (void *)v37;
    }
    else
    {
      if (+[NUGlobalSettings forceMeteorPlusLinear](NUGlobalSettings, "forceMeteorPlusLinear"))
      {
LABEL_28:

        goto LABEL_29;
      }
      +[NUColorSpace genericGrayGamma2_2ColorSpace](NUColorSpace, "genericGrayGamma2_2ColorSpace");
      v67 = objc_claimAutoreleasedReturnValue();

      v39 = -[NUCVPixelBuffer CVPixelBuffer](self->_pixelBuffer, "CVPixelBuffer");
      +[NUColorSpace linearGrayColorSpace](NUColorSpace, "linearGrayColorSpace");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      CVBufferSetAttachment(v39, v33, (CFTypeRef)objc_msgSend(v38, "CGColorSpace"), kCVAttachmentMode_ShouldPropagate);
      v18 = (void *)v67;
    }

    goto LABEL_28;
  }
LABEL_29:
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDE8]), "initWithPixelBuffer:", -[NUCVPixelBuffer CVPixelBuffer](self->_pixelBuffer, "CVPixelBuffer"));
  v41 = (void *)MEMORY[0x1E0CB3940];
  -[NURenderJob request](self, "request");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "name");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "stringWithFormat:", CFSTR("%@-j%lld"), v43, -[NURenderJob jobNumber](self, "jobNumber"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setLabel:", v44);

  objc_msgSend(v40, "setColorSpace:", objc_msgSend(v18, "CGColorSpace"));
  -[NURenderJob outputImage](self, "outputImage");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = 0;
  *(_QWORD *)&buf[16] = v12;
  v70 = v14;
  objc_msgSend(v10, "renderImage:rect:toDestination:atPoint:error:", v45, buf, v40, 0, 0, a3);
  v46 = (CIRenderTask *)objc_claimAutoreleasedReturnValue();
  renderTask = self->_renderTask;
  self->_renderTask = v46;

  if (!self->_renderTask)
  {
    -[NURenderJob request](self, "request");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v48, "copy");
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("failed to prepare render auxiliaryImage"), v49, *a3);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return self->_renderTask != 0;
}

- (BOOL)complete:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CVBuffer *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v16;
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
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_1008();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1008();
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
        v34 = v24;
        v35 = 2114;
        v36 = v28;
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
      v34 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUAuxiliaryImageRenderJob complete:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUAuxiliaryImageRenderRequest.m", 306, CFSTR("Invalid parameter not satisfying: %s"), v29, v30, v31, v32, (uint64_t)"error != NULL");
  }
  -[NUAuxiliaryImageRenderJob auxiliaryImage](self, "auxiliaryImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[CIRenderTask nu_waitUntilCompletedAndReturnError:](self->_renderTask, "nu_waitUntilCompletedAndReturnError:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[NURenderJob request](self, "request");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v13, "copy");
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("failed to render auxiliaryImage"), v16, *a3);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v14 = 0;
      goto LABEL_6;
    }
    -[NUAuxiliaryImageRenderJob imageProperties](self, "imageProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "auxiliaryImagePropertiesForType:", -[NUAuxiliaryImageRenderJob auxiliaryImageType](self, "auxiliaryImageType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[NUCVPixelBuffer CVPixelBuffer](self->_pixelBuffer, "CVPixelBuffer");
    v10 = -[NUAuxiliaryImageRenderJob auxiliaryImageType](self, "auxiliaryImageType");
    objc_msgSend(v8, "auxiliaryImageTypeCGIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUAuxiliaryImageFactory auxiliaryImageWithPixelBuffer:auxiliaryImageType:identifier:originalProperties:error:](NUAuxiliaryImageFactory, "auxiliaryImageWithPixelBuffer:auxiliaryImageType:identifier:originalProperties:error:", v9, v10, v11, v8, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUAuxiliaryImageRenderJob setAuxiliaryImage:](self, "setAuxiliaryImage:", v12);

  }
  -[NUAuxiliaryImageRenderJob auxiliaryImage](self, "auxiliaryImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 != 0;
LABEL_6:

  return v14;
}

- (void)cleanUp
{
  CIRenderTask *renderTask;
  NUCVPixelBuffer *pixelBuffer;

  renderTask = self->_renderTask;
  self->_renderTask = 0;

  pixelBuffer = self->_pixelBuffer;
  self->_pixelBuffer = 0;

}

- (id)result
{
  _NUAuxiliaryImageRenderResult *v3;
  void *v4;

  v3 = objc_alloc_init(_NUAuxiliaryImageRenderResult);
  -[NUAuxiliaryImageRenderJob auxiliaryImage](self, "auxiliaryImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUAuxiliaryImageRenderResult setAuxiliaryImage:](v3, "setAuxiliaryImage:", v4);

  return v3;
}

- (NUImageProperties)imageProperties
{
  return (NUImageProperties *)objc_getProperty(self, a2, 248, 1);
}

- (void)setImageProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NUAuxiliaryImage)auxiliaryImage
{
  return (NUAuxiliaryImage *)objc_getProperty(self, a2, 256, 1);
}

- (void)setAuxiliaryImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (int64_t)auxiliaryImageType
{
  return self->_auxiliaryImageType;
}

- (void)setAuxiliaryImageType:(int64_t)a3
{
  self->_auxiliaryImageType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryImage, 0);
  objc_storeStrong((id *)&self->_imageProperties, 0);
  objc_storeStrong((id *)&self->_pixelBuffer, 0);
  objc_storeStrong((id *)&self->_renderTask, 0);
}

@end
