@implementation NUHistogramRenderJob

- (NUHistogramRenderJob)initWithHistogramRequest:(id)a3
{
  id v3;
  NUHistogramRenderJob *v4;
  uint64_t v5;
  NUScalePolicy *scalePolicy;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NUHistogramRenderJob;
  v3 = a3;
  v4 = -[NURenderJob initWithRequest:](&v8, sel_initWithRequest_, v3);
  objc_msgSend(v3, "scalePolicy", v8.receiver, v8.super_class);
  v5 = objc_claimAutoreleasedReturnValue();

  scalePolicy = v4->_scalePolicy;
  v4->_scalePolicy = (NUScalePolicy *)v5;

  return v4;
}

- (NUHistogramRenderJob)initWithRequest:(id)a3
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_17653);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_17653);
      goto LABEL_8;
    }
    if (v12 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_17653);
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
  _NUAssertFailHandler((uint64_t)"-[NUHistogramRenderJob initWithRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUHistogramRenderJob.m", 42, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v26, v27, v28, v29, v25);
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (id)cacheKey
{
  NUDigest *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _OWORD v11[4];

  v3 = objc_alloc_init(NUDigest);
  -[NURenderJob renderNode](self, "renderNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nu_updateDigest:", v3);

  -[NUHistogramRenderJob histogramRequest](self, "histogramRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "histogramCalculationColorSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nu_updateDigest:", v3);

  objc_msgSend(v5, "parameters", 0, 0, 0, 0, 0, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "colorMatrix");
  else
    memset(v11, 0, sizeof(v11));

  -[NUDigest addBytes:length:](v3, "addBytes:length:", v11, 64);
  -[NUDigest finalize](v3, "finalize");
  -[NUDigest stringValue](v3, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)render:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NUPurgeableStoragePool *v11;
  NUPurgeableStoragePool *storagePool;
  NUPurgeableStoragePool *v13;
  uint64_t v14;
  uint64_t v15;
  NUPurgeableStorage *v16;
  NUPurgeableStorage *renderDestination;
  void *v18;
  NUPurgeableStorage *v19;
  uint64_t v20;
  uint64_t v21;
  CIRenderTask *v22;
  CIRenderTask *renderTask;
  BOOL v24;
  NSObject *v26;
  void *v27;
  void *specific;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _BYTE buf[24];
  uint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_17631();
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
    NUAssertLogger_17631();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v30)
      {
        v47 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v48 = (void *)MEMORY[0x1E0CB3978];
        v49 = v47;
        objc_msgSend(v48, "callStackSymbols");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "componentsJoinedByString:", CFSTR("\n"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v47;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v51;
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
    _NUAssertFailHandler((uint64_t)"-[NUHistogramRenderJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUHistogramRenderJob.m", 78, CFSTR("Invalid parameter not satisfying: %s"), v52, v53, v54, v55, (uint64_t)"error != NULL");
  }
  -[NUHistogramRenderJob histogramRequest](self, "histogramRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "histogramCalculationColorSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isHDR") & 1) != 0)
    +[NUPixelFormat RGBAh](NUPixelFormat, "RGBAh");
  else
    +[NUPixelFormat BGRA8](NUPixelFormat, "BGRA8");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = 0;
  *(_QWORD *)&buf[16] = -[NURenderJob imageSize](self, "imageSize");
  v76 = v8;
  +[NURegion regionWithRect:](NURegion, "regionWithRect:", buf);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUFactory sharedFactory](NUFactory, "sharedFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "surfaceStoragePool");
  v11 = (NUPurgeableStoragePool *)objc_claimAutoreleasedReturnValue();
  storagePool = self->_storagePool;
  self->_storagePool = v11;

  v13 = self->_storagePool;
  if (!v13)
  {
    NUAssertLogger_17631();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No storage pool"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v34;
      _os_log_error_impl(&dword_1A6553000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_17631();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (v35)
    {
      if (v37)
      {
        v56 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v57 = (void *)MEMORY[0x1E0CB3978];
        v58 = v56;
        objc_msgSend(v57, "callStackSymbols");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "componentsJoinedByString:", CFSTR("\n"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v56;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v60;
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
    _NUAssertFailHandler((uint64_t)"-[NUHistogramRenderJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUHistogramRenderJob.m", 88, CFSTR("No storage pool"), v61, v62, v63, v64, v74);
  }
  v14 = -[NURenderJob imageSize](self, "imageSize");
  v16 = -[NUPurgeableStoragePool newStorageWithSize:format:](v13, "newStorageWithSize:format:", v14, v15, v7);
  renderDestination = self->_renderDestination;
  self->_renderDestination = v16;

  if (!self->_renderDestination)
  {
    NUAssertLogger_17631();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No storage allocated"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v41;
      _os_log_error_impl(&dword_1A6553000, v40, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_17631();
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
    if (v42)
    {
      if (v44)
      {
        v65 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v66 = (void *)MEMORY[0x1E0CB3978];
        v67 = v65;
        objc_msgSend(v66, "callStackSymbols");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "componentsJoinedByString:", CFSTR("\n"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v65;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v69;
        _os_log_error_impl(&dword_1A6553000, v43, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v44)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v46;
      _os_log_error_impl(&dword_1A6553000, v43, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogramRenderJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUHistogramRenderJob.m", 94, CFSTR("No storage allocated"), v70, v71, v72, v73, v74);
  }
  -[NURenderJob outputImage](self, "outputImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = self->_renderDestination;
  v20 = -[NURenderJob imageSize](self, "imageSize");
  -[NURenderJob renderImage:into:colorSpace:roi:imageSize:error:](self, "renderImage:into:colorSpace:roi:imageSize:error:", v18, v19, v6, v9, v20, v21, a3);
  v22 = (CIRenderTask *)objc_claimAutoreleasedReturnValue();
  renderTask = self->_renderTask;
  self->_renderTask = v22;

  v24 = self->_renderTask != 0;
  return v24;
}

- (BOOL)complete:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  NUPurgeableStorage *renderDestination;
  NUImageHistogram *histogram;
  void *v16;
  void *v17;
  NSObject *v19;
  void *v20;
  void *specific;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[6];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint8_t buf[32];
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_17631();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v20;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_17631();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v27 = (void *)MEMORY[0x1E0CB3978];
        v28 = v26;
        objc_msgSend(v27, "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v26;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v30;
        _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v25;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUHistogramRenderJob complete:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUHistogramRenderJob.m", 108, CFSTR("Invalid parameter not satisfying: %s"), v31, v32, v33, v34, (uint64_t)"error != NULL");
  }
  -[CIRenderTask nu_waitUntilCompletedAndReturnError:](self->_renderTask, "nu_waitUntilCompletedAndReturnError:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    *(_QWORD *)&buf[16] = -[NURenderJob imageSize](self, "imageSize");
    *(_QWORD *)&buf[24] = v6;
    +[NURegion regionWithRect:](NURegion, "regionWithRect:", buf);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUHistogramRenderJob histogramRequest](self, "histogramRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    memset(buf, 0, sizeof(buf));
    objc_msgSend(v8, "parameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "colorMatrix");
    }
    else
    {
      v47 = 0u;
      v48 = 0u;
      memset(buf, 0, sizeof(buf));
    }

    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__17644;
    v44 = __Block_byref_object_dispose__17645;
    v45 = 0;
    renderDestination = self->_renderDestination;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __33__NUHistogramRenderJob_complete___block_invoke;
    v35[3] = &unk_1E5062DD8;
    v36 = *(_OWORD *)buf;
    v37 = *(_OWORD *)&buf[16];
    v38 = v47;
    v39 = v48;
    v35[4] = self;
    v35[5] = &v40;
    -[NUPurgeableStorage readBufferInRegion:block:](renderDestination, "readBufferInRegion:block:", v7, v35);
    histogram = self->_histogram;
    v13 = histogram != 0;
    if (!histogram)
    {
      -[NURenderJob request](self, "request");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "copy");
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to compute histogram"), v17, v41[5]);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    _Block_object_dispose(&v40, 8);

  }
  else
  {
    -[NURenderJob request](self, "request");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("failed to render for histogram"), v12, *a3);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    return 0;
  }
  return v13;
}

- (id)result
{
  return -[_NUHistogramRenderResult initWithHistogram:]([_NUHistogramRenderResult alloc], "initWithHistogram:", self->_histogram);
}

- (void)cleanUp
{
  NUPurgeableStorage *renderDestination;
  NUPurgeableStoragePool *storagePool;
  NUImageHistogram *histogram;

  if (self->_renderDestination)
  {
    -[NUPurgeableStoragePool returnStorage:](self->_storagePool, "returnStorage:");
    renderDestination = self->_renderDestination;
    self->_renderDestination = 0;

    storagePool = self->_storagePool;
    self->_storagePool = 0;

  }
  histogram = self->_histogram;
  self->_histogram = 0;

}

- (id)scalePolicy
{
  return objc_getProperty(self, a2, 264, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scalePolicy, 0);
  objc_storeStrong((id *)&self->_renderTask, 0);
  objc_storeStrong((id *)&self->_histogram, 0);
  objc_storeStrong((id *)&self->_renderDestination, 0);
  objc_storeStrong((id *)&self->_storagePool, 0);
}

void __33__NUHistogramRenderJob_complete___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NUHistogramCalculator *v4;
  __int128 v5;
  __int128 v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;
  _OWORD v12[4];

  v3 = a2;
  v4 = objc_alloc_init(NUHistogramCalculator);
  v5 = *(_OWORD *)(a1 + 64);
  v12[0] = *(_OWORD *)(a1 + 48);
  v12[1] = v5;
  v6 = *(_OWORD *)(a1 + 96);
  v12[2] = *(_OWORD *)(a1 + 80);
  v12[3] = v6;
  -[NUHistogramCalculator setColorMatrix:](v4, "setColorMatrix:", v12);
  v7 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  obj = 0;
  -[NUHistogramCalculator computeHistogramFromBuffer:error:](v4, "computeHistogramFromBuffer:error:", v3, &obj);
  v8 = objc_claimAutoreleasedReturnValue();

  objc_storeStrong(v7, obj);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 248);
  *(_QWORD *)(v9 + 248) = v8;

}

@end
