@implementation NUClassifyPipelineImageCorrectionJob

- (NUClassifyPipelineImageCorrectionJob)initWithClassifyPipelineImageCorrectionRequest:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NUClassifyPipelineImageCorrectionJob;
  return -[NURenderJob initWithRequest:](&v4, sel_initWithRequest_, a3);
}

- (NUClassifyPipelineImageCorrectionJob)initWithRequest:(id)a3
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_13457);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_13457);
      goto LABEL_8;
    }
    if (v12 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_13457);
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
  _NUAssertFailHandler((uint64_t)"-[NUClassifyPipelineImageCorrectionJob initWithRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUClassifyPipelineImageCorrectionRequest.m", 118, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v26, v27, v28, v29, v25);
}

- (id)scalePolicy
{
  void *v2;
  void *v3;

  -[NUClassifyPipelineImageCorrectionJob classifyPipelineImageCorrectionRequest](self, "classifyPipelineImageCorrectionRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scalePolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (BOOL)wantsCompleteStage
{
  return 0;
}

- (id)cacheKey
{
  NUDigest *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(NUDigest);
  -[NURenderJob renderNode](self, "renderNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nu_updateDigest:", v3);

  -[NUDigest finalize](v3, "finalize");
  -[NUDigest stringValue](v3, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)detectClassifyPipelineImageCorrectionInBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v18;
  void *v19;
  void *specific;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    NUAssertLogger_13434();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v19;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_13434();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v26 = (void *)MEMORY[0x1E0CB3978];
        v27 = v25;
        objc_msgSend(v26, "callStackSymbols");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v53 = v25;
        v54 = 2114;
        v55 = v29;
        _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v24;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUClassifyPipelineImageCorrectionJob detectClassifyPipelineImageCorrectionInBuffer:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUClassifyPipelineImageCorrectionRequest.m", 157, CFSTR("Invalid parameter not satisfying: %s"), v30, v31, v32, v33, (uint64_t)"error != NULL");
  }
  v6 = objc_alloc_init(NSClassFromString(CFSTR("VNClassifyPipelineImageCorrectionNeed1Request")));
  objc_msgSend(v6, "setRevision:", 1);
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0CEDF70]);
    +[NUFactory sharedFactory](NUFactory, "sharedFactory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "visionSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithCVPixelBuffer:options:session:", a3, MEMORY[0x1E0C9AA70], v9);

    v51 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "performRequests:error:", v11, a4);

    if (v12)
    {
      objc_msgSend(v6, "results");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        NUAssertLogger_13434();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("successful correction request has nil results"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v53 = v35;
          _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

        }
        v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        NUAssertLogger_13434();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
        if (v36)
        {
          if (v38)
          {
            v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v42 = (void *)MEMORY[0x1E0CB3978];
            v43 = v41;
            objc_msgSend(v42, "callStackSymbols");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v53 = v41;
            v54 = 2114;
            v55 = v45;
            _os_log_error_impl(&dword_1A6553000, v37, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

          }
        }
        else if (v38)
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v53 = v40;
          _os_log_error_impl(&dword_1A6553000, v37, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

        }
        _NUAssertFailHandler((uint64_t)"-[NUClassifyPipelineImageCorrectionJob detectClassifyPipelineImageCorrectionInBuffer:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUClassifyPipelineImageCorrectionRequest.m", 172, CFSTR("successful correction request has nil results"), v46, v47, v48, v49, v50);
      }
      objc_msgSend(v6, "results");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("unable to create correction request"), v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v15 = 0;
  }

  return v15;
}

- (BOOL)render:(id *)a3
{
  void *v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  id v11;
  void *v12;
  __CVBuffer *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  VNObservation *v22;
  void *observation;
  BOOL v24;
  void *v25;
  id v26;
  const __CFString *v27;
  NSObject *v29;
  void *v30;
  void *specific;
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
  CGSize v45;
  CGPoint v46;
  CGPoint v47;
  CGSize v48;
  CGRect buf;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_13434();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.origin.x) = 138543362;
      *(_QWORD *)((char *)&buf.origin.x + 4) = v30;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_13434();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v37 = (void *)MEMORY[0x1E0CB3978];
        v38 = v36;
        objc_msgSend(v37, "callStackSymbols");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.origin.x) = 138543618;
        *(_QWORD *)((char *)&buf.origin.x + 4) = v36;
        WORD2(buf.origin.y) = 2114;
        *(_QWORD *)((char *)&buf.origin.y + 6) = v40;
        _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else if (v33)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.origin.x) = 138543362;
      *(_QWORD *)((char *)&buf.origin.x + 4) = v35;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUClassifyPipelineImageCorrectionJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUClassifyPipelineImageCorrectionRequest.m", 179, CFSTR("Invalid parameter not satisfying: %s"), v41, v42, v43, v44, (uint64_t)"error != nil");
  }
  -[NURenderJob renderer:](self, "renderer:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NURenderJob outputImage](self, "outputImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extent");
    buf.origin.x = v7;
    buf.origin.y = v8;
    buf.size.width = v9;
    buf.size.height = v10;
    NU::RectT<long>::RectT(&v47, &buf, 0);
    v45 = v48;
    v46 = v47;
    v11 = +[NUVideoUtilities newPixelBufferOfSize:format:](NUVideoUtilities, "newPixelBufferOfSize:format:", v48, 1111970369);
    if (!v11)
    {
      +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("failed to allocate buffer for image"), v6);
      v24 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

      goto LABEL_14;
    }
    +[NUColorSpace sRGBColorSpace](NUColorSpace, "sRGBColorSpace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (__CVBuffer *)objc_msgSend(v11, "CVPixelBuffer");
    CVBufferSetAttachment(v13, (CFStringRef)*MEMORY[0x1E0CA8CD8], (CFTypeRef)objc_msgSend(v12, "CGColorSpace"), kCVAttachmentMode_ShouldPropagate);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDE8]), "initWithPixelBuffer:", objc_msgSend(v11, "CVPixelBuffer"));
    v15 = (void *)MEMORY[0x1E0CB3940];
    -[NURenderJob request](self, "request");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@-j%lld"), v17, -[NURenderJob jobNumber](self, "jobNumber"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLabel:", v18);

    -[NURenderJob outputImage](self, "outputImage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    buf.origin = v46;
    buf.size = v45;
    objc_msgSend(v5, "renderImage:rect:toDestination:atPoint:error:", v19, &buf, v14, 0, 0, a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v20, "nu_waitUntilCompletedAndReturnError:", a3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[NUClassifyPipelineImageCorrectionJob detectClassifyPipelineImageCorrectionInBuffer:error:](self, "detectClassifyPipelineImageCorrectionInBuffer:error:", objc_msgSend(v11, "CVPixelBuffer"), a3);
        v22 = (VNObservation *)objc_claimAutoreleasedReturnValue();
        observation = self->_observation;
        self->_observation = v22;
        v24 = 1;
LABEL_12:

        goto LABEL_13;
      }
      -[NURenderJob request](self, "request");
      observation = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(observation, "copy");
      v26 = *a3;
      v27 = CFSTR("failed to render for image correction detection. Error completing task.");
    }
    else
    {
      -[NURenderJob request](self, "request");
      observation = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(observation, "copy");
      v26 = *a3;
      v27 = CFSTR("failed to render for image correction detection. Error creating task.");
    }
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, v27, v25, v26);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    v24 = 0;
    goto LABEL_12;
  }
  v24 = 0;
LABEL_14:

  return v24;
}

- (id)result
{
  _NUClassifyPipelineImageCorrectionResult *v3;

  v3 = objc_alloc_init(_NUClassifyPipelineImageCorrectionResult);
  -[VNObservation confidence](self->_observation, "confidence");
  -[_NUClassifyPipelineImageCorrectionResult setConfidence:](v3, "setConfidence:");
  return v3;
}

- (void)cleanUp
{
  VNObservation *observation;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NUClassifyPipelineImageCorrectionJob;
  -[NURenderJob cleanUp](&v4, sel_cleanUp);
  observation = self->_observation;
  self->_observation = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observation, 0);
}

@end
