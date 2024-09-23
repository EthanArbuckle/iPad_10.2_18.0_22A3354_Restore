@implementation NUTrimNode

- (NUTrimNode)initWithTimeRange:(id *)a3 input:(id)a4
{
  void *v6;
  __int128 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char *v12;
  __int128 v13;
  __int128 v14;
  objc_super v16;
  _OWORD v17[3];
  uint64_t v18;
  id v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3B18];
  v7 = *(_OWORD *)&a3->var0.var3;
  v17[0] = *(_OWORD *)&a3->var0.var0;
  v17[1] = v7;
  v17[2] = *(_OWORD *)&a3->var1.var1;
  v8 = a4;
  objc_msgSend(v6, "valueWithCMTimeRange:", v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = CFSTR("range");
  v21[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0C9E1F8];
  v19 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)NUTrimNode;
  v12 = -[NURenderNode initWithSettings:inputs:](&v16, sel_initWithSettings_inputs_, v10, v11);

  v14 = *(_OWORD *)&a3->var0.var3;
  v13 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)(v12 + 168) = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)(v12 + 184) = v14;
  *(_OWORD *)(v12 + 200) = v13;

  return (NUTrimNode *)v12;
}

- (NUTrimNode)initWithSettings:(id)a3 inputs:(id)a4
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
  _NUAssertFailHandler((uint64_t)"-[NUTrimNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Time.m", 37, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v29, v30, v31, v32, v28);
}

- (id)_transformWithError:(id *)a3
{
  NUTimeTransformTrim *v4;
  __int128 v6;
  int64_t epoch;

  v4 = [NUTimeTransformTrim alloc];
  v6 = *(_OWORD *)&self->_range.start.value;
  epoch = self->_range.start.epoch;
  return -[NUTimeTransformTrim initWithTrimBeginTime:](v4, "initWithTrimBeginTime:", &v6);
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "evaluationMode");
  return (v3 < 4) & (0xDu >> (v3 & 0xF));
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v13;
  CMTime v14;
  CMTime rhs;
  CMTime lhs;
  CMTime v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "evaluationMode") != 3)
    goto LABEL_7;
  if (!v9)
  {
    v10 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v9, "time");
  if ((BYTE4(v19) & 0x1D) == 1 && (self->_range.start.flags & 0x1D) == 1)
  {
    v10 = (void *)objc_msgSend(v9, "copy");

    if (v10)
      objc_msgSend(v10, "time");
    else
      memset(&lhs, 0, sizeof(lhs));
    rhs = (CMTime)self->_range.start;
    CMTimeAdd(&v17, &lhs, &rhs);
    v14 = v17;
    objc_msgSend(v10, "setTime:", &v14);
  }
  else
  {
LABEL_7:
    v10 = v9;
  }
LABEL_11:
  v13.receiver = self;
  v13.super_class = (Class)NUTrimNode;
  -[NURenderNode nodeByReplayingAgainstCache:pipelineState:error:](&v13, sel_nodeByReplayingAgainstCache_pipelineState_error_, v8, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NUTrimNode;
  -[NURenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v11, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = *(_OWORD *)&self->_range.start.epoch;
    v8 = *(_OWORD *)&self->_range.duration.timescale;
    *(_OWORD *)(v7 + 168) = *(_OWORD *)&self->_range.start.value;
    *(_OWORD *)(v7 + 184) = v9;
    *(_OWORD *)(v7 + 200) = v8;
  }
  return (id)v7;
}

- (id)_evaluateImage:(id *)a3
{
  void *v4;
  void *v5;

  -[NURenderNode inputForKey:](self, "inputForKey:", *MEMORY[0x1E0C9E1F8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputImage:", a3);
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char flags;
  NSObject *v17;
  CMTimeFlags v18;
  int v19;
  CMTimeEpoch epoch;
  CMTimeValue value;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *specific;
  NSObject *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  _OWORD v62[3];
  CMTime time2;
  _BYTE v64[48];
  _OWORD v65[3];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  CMTime time1;
  CMTime buf[2];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_4540();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf[0].value) = 138543362;
      *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v43;
      _os_log_error_impl(&dword_1A6553000, v42, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4540();
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v46)
      {
        v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v50 = (void *)MEMORY[0x1E0CB3978];
        v51 = v49;
        objc_msgSend(v50, "callStackSymbols");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "componentsJoinedByString:", CFSTR("\n"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf[0].value) = 138543618;
        *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v49;
        LOWORD(buf[0].flags) = 2114;
        *(_QWORD *)((char *)&buf[0].flags + 2) = v53;
        _os_log_error_impl(&dword_1A6553000, v45, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);

      }
    }
    else if (v46)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf[0].value) = 138543362;
      *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v48;
      _os_log_error_impl(&dword_1A6553000, v45, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUTrimNode _evaluateVideoComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Time.m", 105, CFSTR("Invalid parameter not satisfying: %s"), v54, v55, v56, v57, (uint64_t)"error != NULL");
  }
  -[NURenderNode outputVideo:](self, "outputVideo:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[NUVideoUtilities firstEnabledVideoTrackInAsset:error:](NUVideoUtilities, "firstEnabledVideoTrackInAsset:error:", v5, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NURenderNode inputs](self, "inputs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1F8]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "outputVideoComposition:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v60 = v5;
        v61 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        v59 = v9;
        objc_msgSend(v9, "instructions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
        if (!v11)
          goto LABEL_34;
        v12 = v11;
        v13 = *(_QWORD *)v67;
        while (1)
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v67 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (_NULogOnceToken != -1)
                dispatch_once(&_NULogOnceToken, &__block_literal_global_4557);
              v26 = (id)_NUAssertLogger;
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected instruction type"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(buf[0].value) = 138543362;
                *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v27;
                _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);

              }
              v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
              if (_NULogOnceToken != -1)
                dispatch_once(&_NULogOnceToken, &__block_literal_global_4557);
              v29 = (id)_NUAssertLogger;
              v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
              if (v28)
              {
                if (v30)
                {
                  v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
                  v34 = (void *)MEMORY[0x1E0CB3978];
                  v35 = v33;
                  objc_msgSend(v34, "callStackSymbols");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(buf[0].value) = 138543618;
                  *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v33;
                  LOWORD(buf[0].flags) = 2114;
                  *(_QWORD *)((char *)&buf[0].flags + 2) = v37;
                  _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);

                }
              }
              else if (v30)
              {
                objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(buf[0].value) = 138543362;
                *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v32;
                _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);

              }
              _NUAssertFailHandler((uint64_t)"-[NUTrimNode _evaluateVideoComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Time.m", 129, CFSTR("Unexpected instruction type"), v38, v39, v40, v41, v58);
            }
            memset(buf, 0, sizeof(buf));
            if (v15)
              objc_msgSend(v15, "timeRange");
            else
              memset(v65, 0, sizeof(v65));
            objc_msgSend(v6, "timeRange");
            +[NUVideoUtilities conformRange:inRange:](NUVideoUtilities, "conformRange:inRange:", v65, v64);
            flags = buf[0].flags;
            if ((buf[0].flags & 1) == 0)
              goto LABEL_15;
            v18 = buf[1].flags;
            v19 = buf[1].flags & 1;
            epoch = buf[1].epoch;
            value = buf[1].value;
            if ((buf[1].flags & 1) != 0 && !buf[1].epoch && (buf[1].value & 0x8000000000000000) == 0)
            {
              time1 = buf[1];
              time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
              if (!CMTimeCompare(&time1, &time2))
                goto LABEL_15;
              flags = buf[0].flags;
              if ((buf[0].flags & 1) == 0)
                goto LABEL_15;
              v18 = buf[1].flags;
              epoch = buf[1].epoch;
              value = buf[1].value;
              v19 = buf[1].flags & 1;
            }
            if ((~v18 & 0x11) != 0 && (flags & 0x11) != 0x11 && v19 && !epoch && (value & 0x8000000000000000) == 0)
            {
              v22 = (void *)objc_msgSend(v15, "copy");
              v62[0] = *(_OWORD *)&buf[0].value;
              v62[1] = *(_OWORD *)&buf[0].epoch;
              v62[2] = *(_OWORD *)&buf[1].timescale;
              objc_msgSend(v22, "setTimeRange:", v62);
              objc_msgSend(v61, "addObject:", v22);

              goto LABEL_19;
            }
LABEL_15:
            if (_NULogOnceToken != -1)
              dispatch_once(&_NULogOnceToken, &__block_literal_global_88_4577);
            v17 = _NULogger;
            if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
            {
              LODWORD(time1.value) = 138412290;
              *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v15;
              _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Instruction <%@> does not conform to trim range - skipping", (uint8_t *)&time1, 0xCu);
            }
LABEL_19:
            ++v14;
          }
          while (v12 != v14);
          v23 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
          v12 = v23;
          if (!v23)
          {
LABEL_34:

            v9 = v59;
            v24 = (void *)objc_msgSend(v59, "mutableCopy");
            objc_msgSend(v24, "setInstructions:", v61);

            v5 = v60;
            goto LABEL_38;
          }
        }
      }
      v24 = 0;
LABEL_38:

    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)_evaluateVideo:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  id v11;
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
  id v29;
  _BYTE v30[48];
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_4540();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v14;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4540();
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
        *(_DWORD *)buf = 138543618;
        v33 = v20;
        v34 = 2114;
        v35 = v24;
        _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v19;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUTrimNode _evaluateVideo:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Time.m", 153, CFSTR("Invalid parameter not satisfying: %s"), v25, v26, v27, v28, (uint64_t)"error != nil");
  }
  v31.receiver = self;
  v31.super_class = (Class)NUTrimNode;
  -[NURenderNode _evaluateVideo:](&v31, sel__evaluateVideo_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "tracks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUTrimNode range](self, "range");
    v29 = 0;
    v9 = +[NUVideoUtilities trimCompositionTracks:toRange:error:](NUVideoUtilities, "trimCompositionTracks:toRange:error:", v8, v30, &v29);
    v10 = v29;

    if (v9)
    {
      v11 = v7;
    }
    else
    {
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("failed to trim output video to range"), self, v10);
      v11 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 1, CFSTR("[NUTrimNode _evaluateVideo] failed to get new composition"), 0);
    v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_evaluateVideoProperties:(id *)a3
{
  void *v5;
  void *v6;
  _NUVideoProperties *v7;
  NSObject *v9;
  void *v10;
  void *specific;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CMTime v25;
  CMTime lhs;
  CMTime v27;
  CMTime rhs;
  CMTime time;
  CMTimeRange range;
  objc_super v31;
  CMTime buf;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_4540();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v10;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4540();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v17 = (void *)MEMORY[0x1E0CB3978];
        v18 = v16;
        objc_msgSend(v17, "callStackSymbols");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v16;
        LOWORD(buf.flags) = 2114;
        *(_QWORD *)((char *)&buf.flags + 2) = v20;
        _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v15;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUTrimNode _evaluateVideoProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode+Time.m", 175, CFSTR("Invalid parameter not satisfying: %s"), v21, v22, v23, v24, (uint64_t)"error != NULL");
  }
  v31.receiver = self;
  v31.super_class = (Class)NUTrimNode;
  -[NURenderNode _evaluateVideoProperties:](&v31, sel__evaluateVideoProperties_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    memset(&buf, 0, sizeof(buf));
    objc_msgSend(v5, "livePhotoKeyFrameTime");
    if ((buf.flags & 1) != 0)
    {
      -[NUTrimNode range](self, "range");
      time = buf;
      if (CMTimeRangeContainsTime(&range, &time))
      {
        memset(&time, 0, sizeof(time));
        -[NUTrimNode range](self, "range");
        rhs = v27;
        lhs = buf;
        CMTimeSubtract(&time, &lhs, &rhs);
        v7 = -[_NUVideoProperties initWithProperties:]([_NUVideoProperties alloc], "initWithProperties:", v6);
        v25 = time;
        -[_NUVideoProperties setLivePhotoKeyFrameTime:](v7, "setLivePhotoKeyFrameTime:", &v25);
      }
      else
      {
        +[NUError rangeError:object:](NUError, "rangeError:object:", CFSTR("keyframe time outside trim range"), self);
        v7 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = v6;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_evaluateVideoAttributes:(id *)a3
{
  NUVideoAttributes *v4;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v4 = [NUVideoAttributes alloc];
  -[NUTrimNode range](self, "range");
  v8 = v6;
  v9 = v7;
  return -[NUVideoAttributes initWithDuration:](v4, "initWithDuration:", &v8);
}

- ($D3A4C128BFADF90F63068A1E85A19F01)range
{
  $D3A4C128BFADF90F63068A1E85A19F01 *result;

  objc_copyStruct(retstr, &self->_range, 48, 1, 0);
  return result;
}

@end
