@implementation NUKeyFrameSourceNode

- (NUKeyFrameSourceNode)initWithVideoSource:(id)a3 time:(id *)a4 settings:(id)a5 orientation:(int64_t)a6
{
  NUVideoSourceNode *v10;
  id v11;
  void *v12;
  NUKeyFrameSourceNode *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  NUVideoSourceNode *videoSourceNode;
  int64_t var3;
  NSObject *v20;
  void *v21;
  void *specific;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  objc_super v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v10 = (NUVideoSourceNode *)a3;
  v11 = a5;
  if (!v10)
  {
    NUAssertLogger_551();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "video != nil");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v21;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v35 = (void *)MEMORY[0x1E0CB3978];
        v36 = v34;
        objc_msgSend(v35, "callStackSymbols");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v34;
        v55 = 2114;
        v56 = v38;
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
      v54 = v26;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUKeyFrameSourceNode initWithVideoSource:time:settings:orientation:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 1185, CFSTR("Invalid parameter not satisfying: %s"), v39, v40, v41, v42, (uint64_t)"video != nil");
  }
  if ((a4->var2 & 1) == 0)
  {
    NUAssertLogger_551();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "CMTIME_IS_VALID(time)");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v28;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (v29)
    {
      if (v31)
      {
        v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v44 = (void *)MEMORY[0x1E0CB3978];
        v45 = v43;
        objc_msgSend(v44, "callStackSymbols");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "componentsJoinedByString:", CFSTR("\n"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v43;
        v55 = 2114;
        v56 = v47;
        _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v31)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v33;
      _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUKeyFrameSourceNode initWithVideoSource:time:settings:orientation:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 1186, CFSTR("Invalid parameter not satisfying: %s"), v48, v49, v50, v51, (uint64_t)"CMTIME_IS_VALID(time)");
  }
  v12 = v11;
  v52.receiver = self;
  v52.super_class = (Class)NUKeyFrameSourceNode;
  v13 = -[NUVideoFrameSourceNode initWithSettings:orientation:](&v52, sel_initWithSettings_orientation_, v11, a6);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = dispatch_queue_create("NUKeyFrameSourceNode", v14);
  queue = v13->_queue;
  v13->_queue = (OS_dispatch_queue *)v15;

  videoSourceNode = v13->_videoSourceNode;
  v13->_videoSourceNode = v10;

  var3 = a4->var3;
  *(_OWORD *)&v13->_frameTime.value = *(_OWORD *)&a4->var0;
  v13->_frameTime.epoch = var3;

  return v13;
}

- (NUKeyFrameSourceNode)initWithSettings:(id)a3 orientation:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *specific;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  objc_class *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_562);
  v6 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = v6;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v12;
    _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v13 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v13 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_562);
      goto LABEL_8;
    }
    if (v13 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_562);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v14 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v15 = (void *)MEMORY[0x1E0CB3978];
    v16 = v14;
    objc_msgSend(v15, "callStackSymbols");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v18;
    _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v19 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v21 = (void *)MEMORY[0x1E0CB3978];
  v22 = specific;
  v16 = v19;
  objc_msgSend(v21, "callStackSymbols");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v32 = specific;
  v33 = 2114;
  v34 = v24;
  _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v25 = (objc_class *)objc_opt_class();
  NSStringFromClass(v25);
  v26 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUKeyFrameSourceNode initWithSettings:orientation:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 1199, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v27, v28, v29, v30, v26);
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)NUKeyFrameSourceNode;
  -[NUKeyFrameSourceNode dealloc](&v3, sel_dealloc);
}

- (__CVBuffer)_pixelBufferWithAuxiliaryImageType:(int64_t)a3 error:(id *)a4
{
  __CVBuffer *result;
  __CVBuffer *v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  __CVBuffer *v22;
  id v23;
  __IOSurface *IOSurface;
  __IOSurface *v25;
  int v26;
  NSObject *v27;
  void *v28;
  void *specific;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  CMTime time2;
  CMTime time1;
  CMTime v50;
  CMTime rhs;
  CMTimeRange range;
  CMTime lhs;
  CMTime v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    NUAssertLogger_551();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v54.value) = 138543362;
      *(CMTimeValue *)((char *)&v54.value + 4) = (CMTimeValue)v28;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v54, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v35 = (void *)MEMORY[0x1E0CB3978];
        v36 = v34;
        objc_msgSend(v35, "callStackSymbols");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v54.value) = 138543618;
        *(CMTimeValue *)((char *)&v54.value + 4) = (CMTimeValue)v34;
        LOWORD(v54.flags) = 2114;
        *(_QWORD *)((char *)&v54.flags + 2) = v38;
        _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v54, 0x16u);

      }
    }
    else if (v31)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v54.value) = 138543362;
      *(CMTimeValue *)((char *)&v54.value + 4) = (CMTimeValue)v33;
      _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v54, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUKeyFrameSourceNode _pixelBufferWithAuxiliaryImageType:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 1209, CFSTR("Invalid parameter not satisfying: %s"), v39, v40, v41, v42, (uint64_t)"error != NULL");
  }
  result = self->_pixelBuffer;
  if (result)
    return result;
  -[NUVideoSourceNode asset:](self->_videoSourceNode, "asset:", a4);
  result = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
  if (!result)
    return result;
  v8 = result;
  +[NUVideoUtilities firstEnabledVideoTrackInAsset:error:](NUVideoUtilities, "firstEnabledVideoTrackInAsset:error:", result, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {

    return 0;
  }
  v10 = v9;
  memset(&v54, 0, sizeof(v54));
  objc_msgSend(v9, "timeRange");
  CMTimeRangeGetEnd(&lhs, &range);
  +[NUVideoUtilities minimumFrameDurationForAssetTrack:](NUVideoUtilities, "minimumFrameDurationForAssetTrack:", v10);
  CMTimeSubtract(&v54, &lhs, &rhs);
  memset(&v50, 0, sizeof(v50));
  time1 = (CMTime)self->_frameTime;
  time2 = v54;
  CMTimeMinimum(&v50, &time1, &time2);
  v11 = v10;
  if (a3 == 10)
    v12 = 1;
  else
    v12 = a3;
  +[NUVideoUtilities defaultVideoSettingsForAVAssetReaderWithHDR:forAuxiliaryImageType:](NUVideoUtilities, "defaultVideoSettingsForAVAssetReaderWithHDR:forAuxiliaryImageType:", -[NUVideoSourceNode isHDR](self->_videoSourceNode, "isHDR"), v12);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  if (v12 < 2)
    goto LABEL_15;
  -[NUVideoSourceNode auxiliaryVideoTrackProperties](self->_videoSourceNode, "auxiliaryVideoTrackProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 > 0xC)
    v15 = CFSTR("Invalid");
  else
    v15 = off_1E5060F88[v12];
  v16 = v15;
  objc_msgSend(v14, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0D75130], "trackWithTrackID:forAsset:", objc_msgSend(v17, "trackID"), v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
    v47 = 0;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFD0]), "initWithAsset:error:", v8, &v47);
    v19 = v47;
    if (v18)
    {
      v43 = v11;
      v46 = 0;
      +[NUVideoUtilities readerOutputForAssetTrack:outputSettings:error:](NUVideoUtilities, "readerOutputForAssetTrack:outputSettings:error:", v13, v44, &v46);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v46;

      if (v20)
      {
        v45 = 0;
        time1 = v50;
        v22 = +[NUVideoUtilities readVideoFrameAtTime:fromAsset:reader:readerOutput:error:](NUVideoUtilities, "readVideoFrameAtTime:fromAsset:reader:readerOutput:error:", &time1, v8, v18, v20, &v45);
        v23 = v45;

        self->_pixelBuffer = v22;
        if (v22)
        {
          IOSurface = CVPixelBufferGetIOSurface(v22);
          if (IOSurface)
          {
            v25 = IOSurface;
            IOSurfaceLock(IOSurface, 1u, 0);
            IOSurfaceUnlock(v25, 1u, 0);
          }
          v26 = 0;
        }
        else
        {
          v26 = 1;
          +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to read video frame"), v8, v23);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        v21 = v23;
      }
      else
      {
        v26 = 1;
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to create asset reader output"), v8, v21);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      v19 = v21;
      v11 = v43;
    }
    else
    {
      v26 = 1;
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to create asset reader"), v8, v19);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 3, CFSTR("Failed to find auxiliary video properties"), v19);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  v26 = 1;
  v13 = v11;
LABEL_28:

  if (v26)
    return 0;
  return self->_pixelBuffer;
}

- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  NSObject *queue;
  id v15;
  id v16;
  NSObject *v18;
  void *v19;
  void *specific;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD block[5];
  id v51;
  _BYTE *v52;
  uint64_t v53;
  id *v54;
  _BYTE buf[24];
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!a5)
  {
    NUAssertLogger_551();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v19;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v33 = (void *)MEMORY[0x1E0CB3978];
        v34 = v32;
        objc_msgSend(v33, "callStackSymbols");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v32;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v36;
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
      *(_QWORD *)&buf[4] = v24;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUKeyFrameSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 1280, CFSTR("Invalid parameter not satisfying: %s"), v37, v38, v39, v40, (uint64_t)"error != NULL");
  }
  if (!a4)
  {
    NUAssertLogger_551();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "subsampleFactor != NULL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v26;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v42 = (void *)MEMORY[0x1E0CB3978];
        v43 = v41;
        objc_msgSend(v42, "callStackSymbols");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v41;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v45;
        _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v31;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUKeyFrameSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 1282, CFSTR("Invalid parameter not satisfying: %s"), v46, v47, v48, v49, (uint64_t)"subsampleFactor != NULL");
  }
  v9 = v8;
  *a4 = 1;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v56 = __Block_byref_object_copy__586;
  v57 = __Block_byref_object_dispose__587;
  v58 = 0;
  v10 = -[NUSourceNode auxiliaryImageType](self, "auxiliaryImageType");
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("imageType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("Disparity"));

  v13 = 2;
  if (!v12)
    v13 = v10;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__NUKeyFrameSourceNode__evaluateImageWithSourceOptions_subsampleFactor_error___block_invoke;
  block[3] = &unk_1E505FEE0;
  v53 = v13;
  v54 = a5;
  v51 = v9;
  v52 = buf;
  block[4] = self;
  v15 = v9;
  dispatch_sync(queue, block);
  v16 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v16;
}

- (opaqueCMSampleBuffer)_sampleBufferWithAuxiliaryImageType:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  __CFString *v9;
  opaqueCMSampleBuffer *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __CFString *v19;
  __CFString *v20;
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
  id v54;
  _BYTE buf[24];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    NUAssertLogger_551();
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
    NUAssertLogger_551();
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
    _NUAssertFailHandler((uint64_t)"-[NUKeyFrameSourceNode _sampleBufferWithAuxiliaryImageType:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 1317, CFSTR("Invalid parameter not satisfying: %s"), v41, v42, v43, v44, (uint64_t)"error != NULL");
  }
  if ((unint64_t)a3 <= 1)
  {
    NUAssertLogger_551();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "auxiliaryImageType != NUAuxiliaryImageTypeNone && auxiliaryImageType != NUAuxiliaryImageTypeUnknown");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v30;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
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
    _NUAssertFailHandler((uint64_t)"-[NUKeyFrameSourceNode _sampleBufferWithAuxiliaryImageType:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 1318, CFSTR("Invalid parameter not satisfying: %s"), v50, v51, v52, v53, (uint64_t)"auxiliaryImageType != NUAuxiliaryImageTypeNone && auxiliaryImageType != NUAuxiliaryImageTypeUnknown");
  }
  -[NUVideoSourceNode asset:](self->_videoSourceNode, "asset:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NUVideoSourceNode auxiliaryVideoTrackProperties](self->_videoSourceNode, "auxiliaryVideoTrackProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)a3 > 0xC)
      v9 = CFSTR("Invalid");
    else
      v9 = off_1E5060F88[a3];
    v11 = v9;
    objc_msgSend(v8, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0D75130], "trackWithTrackID:forAsset:", objc_msgSend(v12, "trackID"), v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        *(_OWORD *)buf = *(_OWORD *)&self->_frameTime.value;
        *(_QWORD *)&buf[16] = self->_frameTime.epoch;
        objc_msgSend(v13, "makeSampleCursorWithPresentationTimeStamp:", buf);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B378]), "initWithAsset:timebase:", v7, 0);
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B388]), "initWithStartCursor:", v15);
        objc_msgSend(v17, "setDirection:", 0);
        v54 = 0;
        v10 = (opaqueCMSampleBuffer *)objc_msgSend(v16, "createSampleBufferForRequest:error:", v17, &v54);
        v18 = v54;
        if (!v10)
        {
          +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to read sample"), v7, v18);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("No such track"), v12);
        v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      if ((unint64_t)a3 > 0xC)
        v19 = CFSTR("Invalid");
      else
        v19 = off_1E5060F88[a3];
      v20 = v19;
      +[NUError notFoundError:object:](NUError, "notFoundError:object:", CFSTR("No auxiliary video properties"), v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_evaluateImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _NUImageProperties *v11;
  NUVideoSourceNode *videoSourceNode;
  void *v13;
  id v14;
  void *v15;
  opaqueCMSampleBuffer *v16;
  id v17;
  _NUImageProperties *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSObject *v23;
  void *v24;
  void *specific;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  CMTime buf;
  CMTime frameTime;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    NUAssertLogger_551();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(frameTime.value) = 138543362;
      *(CMTimeValue *)((char *)&frameTime.value + 4) = (CMTimeValue)v24;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&frameTime, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_551();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v31 = (void *)MEMORY[0x1E0CB3978];
        v32 = v30;
        objc_msgSend(v31, "callStackSymbols");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(frameTime.value) = 138543618;
        *(CMTimeValue *)((char *)&frameTime.value + 4) = (CMTimeValue)v30;
        LOWORD(frameTime.flags) = 2114;
        *(_QWORD *)((char *)&frameTime.flags + 2) = v34;
        _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&frameTime, 0x16u);

      }
    }
    else if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(frameTime.value) = 138543362;
      *(CMTimeValue *)((char *)&frameTime.value + 4) = (CMTimeValue)v29;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&frameTime, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUKeyFrameSourceNode _evaluateImagePropertiesWithSourceOptions:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 1353, CFSTR("Invalid parameter not satisfying: %s"), v35, v36, v37, v38, (uint64_t)"error != NULL");
  }
  v7 = v6;
  -[NUSourceNode originalNode](self, "originalNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "imageProperties:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v18 = 0;
LABEL_25:

      goto LABEL_26;
    }
    v11 = -[_NUImageProperties initWithProperties:]([_NUImageProperties alloc], "initWithProperties:", v10);
    -[_NUImageProperties resetAuxiliaryImageProperties](v11, "resetAuxiliaryImageProperties");
    videoSourceNode = self->_videoSourceNode;
    v40 = 0;
    frameTime = (CMTime)self->_frameTime;
    -[NURenderNode outputTimedMetadataSampleWithIdentifier:atTime:error:](videoSourceNode, "outputTimedMetadataSampleWithIdentifier:atTime:error:", kMetadataIdentifier_SmartStyleInfo, &frameTime, &v40);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v40;
    v15 = v14;
    if (v13)
    {
      frameTime = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
      v39 = 0;
      v16 = -[NUKeyFrameSourceNode _sampleBufferWithAuxiliaryImageType:error:](self, "_sampleBufferWithAuxiliaryImageType:error:", 3, &v39);
      v17 = v39;

      if (v16)
      {
        CMSampleBufferGetPresentationTimeStamp(&frameTime, v16);
        CFRelease(v16);
      }
      else
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_344);
        v20 = _NULogger;
        if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.value) = 138543362;
          *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v17;
          _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Failed to get style learn time: %{public}@", (uint8_t *)&buf, 0xCu);
        }
      }
      objc_msgSend(v13, "metadataGroup");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      buf = frameTime;
      +[NUVideoUtilities semanticStylePropertiesFromMetadataGroup:keyTime:error:](NUVideoUtilities, "semanticStylePropertiesFromMetadataGroup:keyTime:error:", v21, &buf, a4);
      v18 = (_NUImageProperties *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to get styles properties from video metadata"), v13, v17);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

        goto LABEL_25;
      }
      -[_NUImageProperties setSemanticStyleProperties:](v11, "setSemanticStyleProperties:", v18);

    }
    else if (v14)
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_344);
      v19 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        LODWORD(frameTime.value) = 138543362;
        *(CMTimeValue *)((char *)&frameTime.value + 4) = (CMTimeValue)v15;
        _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Failed to get style metadata: %{public}@", (uint8_t *)&frameTime, 0xCu);
      }
      v17 = v15;
    }
    else
    {
      v17 = 0;
    }
    v18 = v11;
    goto LABEL_24;
  }
  -[NUVideoSourceNode _evaluateImagePropertiesWithSourceOptions:error:](self->_videoSourceNode, "_evaluateImagePropertiesWithSourceOptions:error:", v7, a4);
  v18 = (_NUImageProperties *)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return v18;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)pixelSizeWithSourceOptions:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v4 = a3;
  v5 = -[NUSourceNode auxiliaryImageType](self, "auxiliaryImageType");
  if (v5 <= 0xA && ((1 << v5) & 0x403) != 0)
  {
    v6 = -[NUVideoSourceNode pixelSizeWithSourceOptions:](self->_videoSourceNode, "pixelSizeWithSourceOptions:", v4);
    v8 = v7;
  }
  else
  {
    -[NUVideoSourceNode auxiliaryVideoTrackProperties](self->_videoSourceNode, "auxiliaryVideoTrackProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUSourceNode auxiliaryImageTypeString](self, "auxiliaryImageTypeString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v11, "size");
    v8 = v12;

  }
  v13 = v6;
  v14 = v8;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoSourceNode, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __78__NUKeyFrameSourceNode__evaluateImageWithSourceOptions_subsampleFactor_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_pixelBufferWithAuxiliaryImageType:error:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  if (v2)
  {
    v3 = v2;
    if (*(_QWORD *)(a1 + 56) == 12)
    {
      v13 = *MEMORY[0x1E0C9E110];
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCVPixelBuffer:options:", v3, v5);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v9)
    {
      +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 3, CFSTR("Unable to produce CIImage from CVPixelBuffer"), *(_QWORD *)(a1 + 32));
      **(_QWORD **)(a1 + 64) = (id)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    objc_msgSend(*(id *)(a1 + 32), "applySourceOptions:image:", *(_QWORD *)(a1 + 40), v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

@end
