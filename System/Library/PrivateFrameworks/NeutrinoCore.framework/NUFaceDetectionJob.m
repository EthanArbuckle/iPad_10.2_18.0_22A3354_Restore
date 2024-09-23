@implementation NUFaceDetectionJob

- (NUFaceDetectionJob)initWithFaceDetectionRequest:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NUFaceDetectionJob;
  return -[NURenderJob initWithRequest:](&v4, sel_initWithRequest_, a3);
}

- (NUFaceDetectionJob)initWithRequest:(id)a3
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_14668);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_14668);
      goto LABEL_8;
    }
    if (v12 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_14668);
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
  _NUAssertFailHandler((uint64_t)"-[NUFaceDetectionJob initWithRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUFaceDetectionRequest.m", 114, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v26, v27, v28, v29, v25);
}

- (id)scalePolicy
{
  void *v2;
  void *v3;

  -[NUFaceDetectionJob faceDetectionRequest](self, "faceDetectionRequest");
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

- (id)detectFaceRectsInBuffer:(__CVBuffer *)a3 maxResultCount:(unint64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
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
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  if (!a5)
  {
    NUAssertLogger_14643();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v23;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14643();
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
        v57 = v29;
        v58 = 2114;
        v59 = v33;
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
      v57 = v28;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUFaceDetectionJob detectFaceRectsInBuffer:maxResultCount:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUFaceDetectionRequest.m", 153, CFSTR("Invalid parameter not satisfying: %s"), v34, v35, v36, v37, (uint64_t)"error != NULL");
  }
  v8 = objc_alloc_init(MEMORY[0x1E0CEDE90]);
  objc_msgSend(v8, "setRevision:", 2);
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0CEDF70]);
    +[NUFactory sharedFactory](NUFactory, "sharedFactory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "visionSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithCVPixelBuffer:options:session:", a3, MEMORY[0x1E0C9AA70], v11);

    v55 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "performRequests:error:", v13, a5);

    if (v14)
    {
      objc_msgSend(v8, "results");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        NUAssertLogger_14643();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("successful face rect request has nil results"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v57 = v39;
          _os_log_error_impl(&dword_1A6553000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

        }
        v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        NUAssertLogger_14643();
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
        if (v40)
        {
          if (v42)
          {
            v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v46 = (void *)MEMORY[0x1E0CB3978];
            v47 = v45;
            objc_msgSend(v46, "callStackSymbols");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v57 = v45;
            v58 = 2114;
            v59 = v49;
            _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

          }
        }
        else if (v42)
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v57 = v44;
          _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

        }
        _NUAssertFailHandler((uint64_t)"-[NUFaceDetectionJob detectFaceRectsInBuffer:maxResultCount:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUFaceDetectionRequest.m", 168, CFSTR("successful face rect request has nil results"), v50, v51, v52, v53, v54);
      }
      objc_msgSend(v8, "results");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v17 < a4)
        a4 = v17;
      objc_msgSend(v8, "results");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "subarrayWithRange:", 0, a4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("unable to create face rect request"), v20);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v19 = 0;
  }

  return v19;
}

- (id)detectFaceLandmarksInBuffer:(__CVBuffer *)a3 withFaceRects:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
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
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!a5)
  {
    NUAssertLogger_14643();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v55 = v21;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14643();
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
        v55 = v27;
        v56 = 2114;
        v57 = v31;
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
      v55 = v26;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUFaceDetectionJob detectFaceLandmarksInBuffer:withFaceRects:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUFaceDetectionRequest.m", 178, CFSTR("Invalid parameter not satisfying: %s"), v32, v33, v34, v35, (uint64_t)"error != NULL");
  }
  v8 = v7;
  v9 = objc_alloc_init(MEMORY[0x1E0CEDE80]);
  objc_msgSend(v9, "setRevision:", 2);
  objc_msgSend(v9, "setInputFaceObservations:", v8);
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0CEDF70]);
    +[NUFactory sharedFactory](NUFactory, "sharedFactory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "visionSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithCVPixelBuffer:options:session:", a3, MEMORY[0x1E0C9AA70], v12);

    v53 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "performRequests:error:", v14, a5);

    if (v15)
    {
      objc_msgSend(v9, "results");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        NUAssertLogger_14643();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("successful face landmark request has nil results"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v55 = v37;
          _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

        }
        v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        NUAssertLogger_14643();
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
        if (v38)
        {
          if (v40)
          {
            v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            v44 = (void *)MEMORY[0x1E0CB3978];
            v45 = v43;
            objc_msgSend(v44, "callStackSymbols");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "componentsJoinedByString:", CFSTR("\n"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v55 = v43;
            v56 = 2114;
            v57 = v47;
            _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

          }
        }
        else if (v40)
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v55 = v42;
          _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

        }
        _NUAssertFailHandler((uint64_t)"-[NUFaceDetectionJob detectFaceLandmarksInBuffer:withFaceRects:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUFaceDetectionRequest.m", 194, CFSTR("successful face landmark request has nil results"), v48, v49, v50, v51, v52);
      }
      objc_msgSend(v9, "results");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("unable to create face landmark request"), v18);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v17 = 0;
  }

  return v17;
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
  void *v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  NSArray *faces;
  id v27;
  const __CFString *v28;
  void *v29;
  int64_t v30;
  NSObject *v32;
  void *v33;
  void *specific;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  CGSize v49;
  CGPoint v50;
  NSArray *v51;
  CGPoint v52;
  CGSize v53;
  CGRect buf;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_14643();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.origin.x) = 138543362;
      *(_QWORD *)((char *)&buf.origin.x + 4) = v33;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14643();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v36)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = (void *)MEMORY[0x1E0CB3978];
        v41 = v39;
        objc_msgSend(v40, "callStackSymbols");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.origin.x) = 138543618;
        *(_QWORD *)((char *)&buf.origin.x + 4) = v39;
        WORD2(buf.origin.y) = 2114;
        *(_QWORD *)((char *)&buf.origin.y + 6) = v43;
        _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else if (v36)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.origin.x) = 138543362;
      *(_QWORD *)((char *)&buf.origin.x + 4) = v38;
      _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUFaceDetectionJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUFaceDetectionRequest.m", 201, CFSTR("Invalid parameter not satisfying: %s"), v44, v45, v46, v47, (uint64_t)"error != nil");
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
    NU::RectT<long>::RectT(&v52, &buf, 0);
    v49 = v53;
    v50 = v52;
    v11 = +[NUVideoUtilities newPixelBufferOfSize:format:](NUVideoUtilities, "newPixelBufferOfSize:format:", v53, 1111970369);
    if (!v11)
    {
      +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("failed to allocate buffer for image"), v6);
      v25 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

      goto LABEL_19;
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
    buf.origin = v50;
    buf.size = v49;
    objc_msgSend(v5, "renderImage:rect:toDestination:atPoint:error:", v19, &buf, v14, 0, 0, a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = v12;
    if (v20)
    {
      objc_msgSend(v20, "nu_waitUntilCompletedAndReturnError:", a3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[NUFaceDetectionJob faceDetectionRequest](self, "faceDetectionRequest");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NUFaceDetectionJob detectFaceRectsInBuffer:maxResultCount:error:](self, "detectFaceRectsInBuffer:maxResultCount:error:", objc_msgSend(v11, "CVPixelBuffer"), objc_msgSend(v22, "maxFaceCount"), a3);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "count"))
        {
          -[NUFaceDetectionJob detectFaceLandmarksInBuffer:withFaceRects:error:](self, "detectFaceLandmarksInBuffer:withFaceRects:error:", objc_msgSend(v11, "CVPixelBuffer"), v23, a3);
          v51 = (NSArray *)objc_claimAutoreleasedReturnValue();
          v24 = -[NSArray count](v51, "count");
          v25 = v24 == objc_msgSend(v23, "count");
          if (!v25)
          {
            +[NUError mismatchError:object:](NUError, "mismatchError:object:", CFSTR("detected face rects but not an equal number of face landmarks"), v23);
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
          faces = self->_faces;
          self->_faces = v51;
        }
        else
        {
          faces = self->_faces;
          self->_faces = (NSArray *)MEMORY[0x1E0C9AA60];
          v25 = 1;
        }

        -[NURenderJob outputGeometry](self, "outputGeometry");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        self->_imageSize.width = objc_msgSend(v29, "size");
        self->_imageSize.height = v30;

        goto LABEL_17;
      }
      -[NURenderJob request](self, "request");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v22, "copy");
      v27 = *a3;
      v28 = CFSTR("failed to render for face detection. Error completing task.");
    }
    else
    {
      -[NURenderJob request](self, "request");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v22, "copy");
      v27 = *a3;
      v28 = CFSTR("failed to render for face detection. Task creation failed.");
    }
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, v28, v23, v27);
    v25 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

    goto LABEL_18;
  }
  v25 = 0;
LABEL_19:

  return v25;
}

- (id)result
{
  _NUFaceDetectionResult *v3;

  v3 = objc_alloc_init(_NUFaceDetectionResult);
  -[_NUFaceDetectionResult setFaces:](v3, "setFaces:", self->_faces);
  -[_NUFaceDetectionResult setImageSize:](v3, "setImageSize:", self->_imageSize.width, self->_imageSize.height);
  return v3;
}

- (void)cleanUp
{
  NSArray *faces;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NUFaceDetectionJob;
  -[NURenderJob cleanUp](&v4, sel_cleanUp);
  faces = self->_faces;
  self->_faces = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faces, 0);
}

@end
