@implementation NUVideoPlaybackFrameJob

- (NUVideoPlaybackFrameJob)initWithRequest:(id)a3
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_24021);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_24021);
      goto LABEL_8;
    }
    if (v12 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_24021);
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
  _NUAssertFailHandler((uint64_t)"-[NUVideoPlaybackFrameJob initWithRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoPlaybackFrameRequest.m", 75, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v26, v27, v28, v29, v25);
}

- (NUVideoPlaybackFrameJob)initWithVideoFrameRequest:(id)a3
{
  id v3;
  NUVideoPlaybackFrameJob *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *specific;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)NUVideoPlaybackFrameJob;
  v3 = a3;
  v4 = -[NURenderJob initWithRequest:](&v31, sel_initWithRequest_, v3);
  objc_msgSend(v3, "composition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderJob setComposition:](v4, "setComposition:", v5);

  v6 = objc_msgSend(v3, "renderScale");
  -[NURenderJob setRenderScale:](v4, "setRenderScale:", v6, v7);
  objc_msgSend(v3, "videoRenderPrepareNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NURenderJob setPrepareNode:](v4, "setPrepareNode:", v8);
  -[NURenderJob prepareNode](v4, "prepareNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_24021);
    v10 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = v10;
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Expected the PlaybackFrameRequest to have a prepareNode"), v31.receiver, v31.super_class);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v13;
      _os_log_impl(&dword_1A6553000, v12, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      v14 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v14 != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_24021);
LABEL_9:
        v15 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v21 = (void *)MEMORY[0x1E0CB3978];
          v22 = specific;
          v23 = v15;
          objc_msgSend(v21, "callStackSymbols");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v33 = specific;
          v34 = 2114;
          v35 = v25;
          _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_17:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v14 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_24021);
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_9;
    }
    v26 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      v28 = (void *)MEMORY[0x1E0CB3978];
      v23 = v26;
      objc_msgSend(v28, "callStackSymbols");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v30;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_17;
    }
LABEL_14:
    _NUAssertContinueHandler((uint64_t)"-[NUVideoPlaybackFrameJob initWithVideoFrameRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoPlaybackFrameRequest.m", 87, CFSTR("Expected the PlaybackFrameRequest to have a prepareNode"), v16, v17, v18, v19, (uint64_t)v31.receiver);
  }

  return v4;
}

- (id)scalePolicy
{
  NUFixedScalePolicy *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = [NUFixedScalePolicy alloc];
  v4 = -[NURenderJob renderScale](self, "renderScale");
  return -[NUFixedScalePolicy initWithScale:](v3, "initWithScale:", v4, v5);
}

- (BOOL)wantsOutputVideoFrame
{
  return 1;
}

- (BOOL)wantsRenderNodeCached
{
  return 0;
}

- (BOOL)wantsPrepareNodeCached
{
  return 0;
}

- (id)newRenderPipelineStateForEvaluationMode:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)NUVideoPlaybackFrameJob;
  v5 = -[NURenderJob newRenderPipelineStateForEvaluationMode:](&v20, sel_newRenderPipelineStateForEvaluationMode_);
  if (a3 == 3)
  {
    -[NUVideoPlaybackFrameJob frameRequest](self, "frameRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "evaluationTime");
    }
    else
    {
      v18 = 0uLL;
      v19 = 0;
    }
    v16 = v18;
    v17 = v19;
    objc_msgSend(v5, "setTime:", &v16);

    -[NUVideoPlaybackFrameJob frameRequest](self, "frameRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "videoFrames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setVideoFrames:", v9);

    -[NUVideoPlaybackFrameJob frameRequest](self, "frameRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "videoMetadataSamples");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setVideoMetadataSamples:", v11);

    -[NUVideoPlaybackFrameJob frameRequest](self, "frameRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "videoSampleSlices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setVideoSampleSlices:", v13);

    -[NUVideoPlaybackFrameJob frameRequest](self, "frameRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlaybackDirection:", objc_msgSend(v14, "playbackDirection"));

  }
  return v5;
}

- (id)renderer:(id *)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  -[NURenderJob priority](self, "priority");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLow");

  -[NURenderJob device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "lowPriorityRendererWithoutIntermediateCaching:", a3);
  else
    objc_msgSend(v7, "rendererWithoutIntermediateCaching:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)render:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CVBuffer *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  size_t Width;
  size_t Height;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  BOOL v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  const __CFString *v44;
  NSObject *v46;
  void *v47;
  void *specific;
  NSObject *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  CGRect v63;
  int64x2_t v64[2];
  CGPoint v65;
  CGSize v66;
  _OWORD v67[2];
  CGRect buf;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_24071();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.origin.x) = 138543362;
      *(_QWORD *)((char *)&buf.origin.x + 4) = v47;
      _os_log_error_impl(&dword_1A6553000, v46, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24071();
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v50)
      {
        v53 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v54 = (void *)MEMORY[0x1E0CB3978];
        v55 = v53;
        objc_msgSend(v54, "callStackSymbols");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "componentsJoinedByString:", CFSTR("\n"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.origin.x) = 138543618;
        *(_QWORD *)((char *)&buf.origin.x + 4) = v53;
        WORD2(buf.origin.y) = 2114;
        *(_QWORD *)((char *)&buf.origin.y + 6) = v57;
        _os_log_error_impl(&dword_1A6553000, v49, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else if (v50)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "componentsJoinedByString:", CFSTR("\n"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.origin.x) = 138543362;
      *(_QWORD *)((char *)&buf.origin.x + 4) = v52;
      _os_log_error_impl(&dword_1A6553000, v49, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoPlaybackFrameJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoPlaybackFrameRequest.m", 145, CFSTR("Invalid parameter not satisfying: %s"), v58, v59, v60, v61, (uint64_t)"error != NULL");
  }
  -[NUVideoPlaybackFrameJob renderer:](self, "renderer:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NUVideoPlaybackFrameJob frameRequest](self, "frameRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorSpace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "destinationBuffer");
    if (!v8)
    {
      +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 2, CFSTR("Non-existent destination buffer on request"), v6);
      v35 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

      goto LABEL_28;
    }
    v9 = (__CVBuffer *)v8;
    -[NURenderJob prepareNode](self, "prepareNode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "videoProperties:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      -[NURenderJob prepareNode](self, "prepareNode");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to get video properties"), v36, *a3);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v35 = 0;
LABEL_26:

      goto LABEL_27;
    }
    -[NURenderJob prepareNode](self, "prepareNode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "outputImageGeometry:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      -[NURenderJob prepareNode](self, "prepareNode");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to get output image geometry"), v37, *a3);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v35 = 0;
LABEL_25:

      goto LABEL_26;
    }
    v14 = -[NURenderJob renderScale](self, "renderScale");
    v16 = v15;
    v17 = objc_msgSend(v13, "renderScale");
    v19 = NUScaleDivide(v14, v16, v17, v18);
    v21 = v20;
    v65 = (CGPoint)0;
    v66 = (CGSize)0;
    objc_msgSend(v11, "cleanAperture");
    NUPixelRectScaleRational(v64, v19, v21, 1, (int64x2_t *)&v65);
    buf.origin = v65;
    buf.size = v66;
    NUCVImageBufferSetCleanRect(v9, (uint64_t *)&buf);
    objc_msgSend(v7, "applyAttachmentsToCVPixelBuffer:", v9);
    -[NURenderJob outputImage](self, "outputImage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "extent");
    buf.origin.x = v23;
    buf.origin.y = v24;
    buf.size.width = v25;
    buf.size.height = v26;
    NU::RectT<long>::RectT(v67, &buf, 0);
    v63.origin = (CGPoint)v67[0];
    v63.size = (CGSize)v67[1];

    Width = CVPixelBufferGetWidth(v9);
    Height = CVPixelBufferGetHeight(v9);
    if (*(_OWORD *)&v63.size != __PAIR128__(Height, Width))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Obsolete video frame request - bad bounds. buffer(%ld,%ld) CIExtent(%ld,%ld) buffer:%@"), Width, Height, *(_OWORD *)&v63.size, v9);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError invalidError:object:](NUError, "invalidError:object:", v29, v6);
      v35 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

      goto LABEL_25;
    }
    v62 = v13;
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDE8]), "initWithPixelBuffer:", v9);
    v30 = (void *)MEMORY[0x1E0CB3940];
    -[NURenderJob request](self, "request");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "name");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("%@-j%lld"), v32, -[NURenderJob jobNumber](self, "jobNumber"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setLabel:", v33);

    if (v7)
    {
      objc_msgSend(v29, "setColorSpace:", objc_msgSend(v7, "CGColorSpace"));
      v34 = objc_msgSend(v7, "isHDR") ^ 1;
    }
    else
    {
      if (!CGColorSpaceUsesITUR_2100TF((CGColorSpaceRef)objc_msgSend(v29, "colorSpace")))
        goto LABEL_17;
      v34 = 0;
    }
    objc_msgSend(v29, "setClamped:", v34);
LABEL_17:
    -[NURenderJob outputImage](self, "outputImage");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    buf = v63;
    objc_msgSend(v5, "renderImage:rect:toDestination:atPoint:error:", v38, &buf, v29, 0, 0, a3);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      objc_msgSend(v39, "nu_waitUntilCompletedAndReturnError:", a3);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
      {
        v35 = 1;
LABEL_23:
        v13 = v62;

        goto LABEL_24;
      }
      -[NURenderJob request](self, "request");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)objc_msgSend(v41, "copy");
      v43 = *a3;
      v44 = CFSTR("Failed to render playback frame. Error completing task.");
    }
    else
    {
      -[NURenderJob request](self, "request");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)objc_msgSend(v41, "copy");
      v43 = *a3;
      v44 = CFSTR("Failed to render playback frame. Task creation failed");
    }
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, v44, v42, v43);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    v35 = 0;
    goto LABEL_23;
  }
  v35 = 0;
LABEL_28:

  return v35;
}

- (id)result
{
  _NUVideoPlaybackFrameRequestResponse *v3;
  void *v4;

  v3 = objc_alloc_init(_NUVideoPlaybackFrameRequestResponse);
  -[NUVideoPlaybackFrameJob frameRequest](self, "frameRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUVideoPlaybackFrameRequestResponse setFrame:](v3, "setFrame:", objc_msgSend(v4, "destinationBuffer"));

  return v3;
}

- (BOOL)wantsCompleteStage
{
  return 0;
}

@end
