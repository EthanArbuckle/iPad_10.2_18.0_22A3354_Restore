@implementation NUSlowMotionNode

- (NUSlowMotionNode)initWithSettings:(id)a3 inputs:(id)a4
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_4557);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_4557);
      goto LABEL_8;
    }
    if (v15 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_4557);
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
  _NUAssertFailHandler((uint64_t)"-[NUSlowMotionNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Time.m", 215, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v29, v30, v31, v32, v28);
}

- (NUSlowMotionNode)initWithTimeRange:(id *)a3 rate:(float)a4 input:(id)a5
{
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  char *v17;
  __int128 v18;
  __int128 v19;
  objc_super v21;
  CMTimeRange duration;
  CMTimeRange otherRange;
  CMTimeRange start;
  uint64_t v25;
  id v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&start.start.value = *MEMORY[0x1E0CA2E68];
  start.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  *(_OWORD *)&duration.start.value = *MEMORY[0x1E0CA2E30];
  duration.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
  v8 = a5;
  CMTimeRangeMake(&otherRange, &start.start, &duration.start);
  v9 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&duration.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&duration.start.epoch = v9;
  *(_OWORD *)&duration.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetIntersection(&start, &duration, &otherRange);
  v10 = *(_OWORD *)&start.start.epoch;
  *(_OWORD *)&a3->var0.var0 = *(_OWORD *)&start.start.value;
  *(_OWORD *)&a3->var0.var3 = v10;
  *(_OWORD *)&a3->var1.var1 = *(_OWORD *)&start.duration.timescale;
  v11 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&start.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&start.start.epoch = v11;
  *(_OWORD *)&start.duration.timescale = *(_OWORD *)&a3->var1.var1;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTimeRange:", &start);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v13 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = CFSTR("range");
  v27[1] = CFSTR("rate");
  v28[0] = v12;
  v28[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *MEMORY[0x1E0C9E1F8];
  v26 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)NUSlowMotionNode;
  v17 = -[NURenderNode initWithSettings:inputs:](&v21, sel_initWithSettings_inputs_, v15, v16);

  v19 = *(_OWORD *)&a3->var0.var3;
  v18 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)(v17 + 184) = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)(v17 + 200) = v19;
  *(_OWORD *)(v17 + 216) = v18;
  *((float *)v17 + 42) = a4;

  return (NUSlowMotionNode *)v17;
}

- (id)_transformWithError:(id *)a3
{
  __int128 v5;
  __int128 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double Seconds;
  NUTimeTransformSlowMo *v12;
  double v13;
  NUTimeTransformSlowMo *v14;
  NUTimeTransformSlowMo *v15;
  NUGeometryTransform *v16;
  NUGeometryTransform *v17;
  NUGeometryTransform *geomTransform;
  CMTime v20;
  CMTime time;
  CMTimeRange range;
  CMTime v23;
  CMTime v24;

  v5 = *(_OWORD *)&self->_range.start.epoch;
  *(_OWORD *)&v24.value = *(_OWORD *)&self->_range.start.value;
  v6 = *(_OWORD *)&self->_range.duration.timescale;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_range.start.value;
  *(_OWORD *)&range.start.epoch = v5;
  v24.epoch = self->_range.start.epoch;
  memset(&v23, 0, sizeof(v23));
  *(_OWORD *)&range.duration.timescale = v6;
  CMTimeRangeGetEnd(&v23, &range);
  -[NURenderNode inputs](self, "inputs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1F8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "_evaluateVideo:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    memset(&range, 0, 24);
    objc_msgSend(v9, "duration");
    time = range.start;
    Seconds = CMTimeGetSeconds(&time);
    v12 = [NUTimeTransformSlowMo alloc];
    *(float *)&v13 = self->_rate;
    time = v24;
    v20 = v23;
    v14 = -[NUTimeTransformSlowMo initWithSlowMoBeginTime:endTime:rate:assetDuration:](v12, "initWithSlowMoBeginTime:endTime:rate:assetDuration:", &time, &v20, v13, Seconds);
    v15 = v14;
    if (v14)
      v16 = v14;
    else
      v16 = objc_alloc_init(NUGeometryTransform);
    geomTransform = self->_geomTransform;
    self->_geomTransform = v16;

    v17 = self->_geomTransform;
  }
  else
  {
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("[NUSlowMotionNode _transformWithError] input's _evaluateVideo failed."), 0, *a3);
    v17 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return (objc_msgSend(a3, "evaluationMode") & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NUSlowMotionNode;
  -[NURenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v11, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = *(_OWORD *)&self->_range.start.epoch;
    v8 = *(_OWORD *)&self->_range.duration.timescale;
    *(_OWORD *)(v7 + 184) = *(_OWORD *)&self->_range.start.value;
    *(_OWORD *)(v7 + 200) = v9;
    *(_OWORD *)(v7 + 216) = v8;
    *(float *)(v7 + 168) = self->_rate;
  }
  return (id)v7;
}

- (id)_evaluateImage:(id *)a3
{
  void *v4;
  void *v5;

  -[NURenderNode inputForKey:](self, "inputForKey:", *MEMORY[0x1E0C9E1F8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_evaluateImage:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)requiresVideoComposition
{
  void *v2;
  char v3;

  -[NURenderNode inputForKey:](self, "inputForKey:", *MEMORY[0x1E0C9E1F8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requiresVideoComposition");

  return v3;
}

- (id)_evaluateVideoComposition:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  __int128 v36;
  uint64_t v37;
  uint8_t buf[32];
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_4540();
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
    NUAssertLogger_4540();
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
    _NUAssertFailHandler((uint64_t)"-[NUSlowMotionNode _evaluateVideoComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Time.m", 308, CFSTR("Invalid parameter not satisfying: %s"), v32, v33, v34, v35, (uint64_t)"error != NULL");
  }
  -[NURenderNode outputVideo:](self, "outputVideo:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NURenderNode inputs](self, "inputs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1F8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "outputVideoComposition:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "instructions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v11 == 1)
      {
        +[NUVideoUtilities firstEnabledVideoTrackInAsset:error:](NUVideoUtilities, "firstEnabledVideoTrackInAsset:error:", v5, a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v7, "videoProperties:", a3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v9, "mutableCopy");
          +[NUVideoCompositionInstruction instructionForVideoTrack:](NUVideoCompositionInstruction, "instructionForVideoTrack:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v39[0] = v15;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setInstructions:", v16);

          memset(buf, 0, 24);
          v17 = (void *)MEMORY[0x1E0D75308];
          objc_msgSend(v13, "nominalFrameRate");
          objc_msgSend(v17, "minFrameDurationForNominalFrameRate:");
          objc_msgSend(v14, "setSourceTrackIDForFrameTiming:", 0);
          v36 = *(_OWORD *)buf;
          v37 = *(_QWORD *)&buf[16];
          objc_msgSend(v14, "setFrameDuration:", &v36);

        }
        else
        {
          v14 = 0;
        }

        goto LABEL_12;
      }
      objc_msgSend(v9, "instructions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError unsupportedError:object:](NUError, "unsupportedError:object:", CFSTR("Unsupported video configuration"), v18);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    v14 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v14 = 0;
LABEL_13:

  return v14;
}

- (id)_evaluateVideo:(id *)a3
{
  void *v5;
  void *v6;
  int v7;
  int v8;
  double v9;
  void *v10;
  NSObject *v12;
  void *v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v28[48];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_4540();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4540();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E0CB3978];
        v21 = v19;
        objc_msgSend(v20, "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v19;
        v31 = 2114;
        v32 = v23;
        _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSlowMotionNode _evaluateVideo:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Time.m", 352, CFSTR("Invalid parameter not satisfying: %s"), v24, v25, v26, v27, (uint64_t)"error != nil");
  }
  -[NURenderNode inputForKey:](self, "inputForKey:", *MEMORY[0x1E0C9E1F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputVideo:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUSlowMotionNode rate](self, "rate");
  v8 = v7;
  -[NUSlowMotionNode range](self, "range");
  LODWORD(v9) = v8;
  +[NUSlowMotionUtilities slowMotionVideoFromAsset:rate:range:error:](NUSlowMotionUtilities, "slowMotionVideoFromAsset:rate:range:error:", v6, v28, a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)requiresAudioMix
{
  return 1;
}

- (id)_evaluateAudioMix:(id *)a3
{
  void *v5;
  void *v6;
  int v7;
  int v8;
  double v9;
  void *v10;
  NSObject *v12;
  void *v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v28[48];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_4540();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4540();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E0CB3978];
        v21 = v19;
        objc_msgSend(v20, "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v19;
        v31 = 2114;
        v32 = v23;
        _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSlowMotionNode _evaluateAudioMix:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Time.m", 369, CFSTR("Invalid parameter not satisfying: %s"), v24, v25, v26, v27, (uint64_t)"error != nil");
  }
  -[NURenderNode inputForKey:](self, "inputForKey:", *MEMORY[0x1E0C9E1F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputVideo:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUSlowMotionNode rate](self, "rate");
  v8 = v7;
  -[NUSlowMotionNode range](self, "range");
  LODWORD(v9) = v8;
  +[NUSlowMotionUtilities slowMotionAudioMixFromAsset:rate:range:error:](NUSlowMotionUtilities, "slowMotionAudioMixFromAsset:rate:range:error:", v6, v28, a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NUGeometryTransform)geomTransform
{
  return (NUGeometryTransform *)objc_getProperty(self, a2, 176, 1);
}

- ($D3A4C128BFADF90F63068A1E85A19F01)range
{
  $D3A4C128BFADF90F63068A1E85A19F01 *result;

  objc_copyStruct(retstr, &self->_range, 48, 1, 0);
  return result;
}

- (float)rate
{
  return self->_rate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geomTransform, 0);
}

@end
