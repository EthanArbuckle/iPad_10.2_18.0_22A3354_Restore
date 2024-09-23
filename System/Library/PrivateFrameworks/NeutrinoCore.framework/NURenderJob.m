@implementation NURenderJob

- (NURenderJob)init
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *specific;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  objc_class *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_845);
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_845);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_845);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v12 = (void *)MEMORY[0x1E0CB3978];
    v13 = v11;
    objc_msgSend(v12, "callStackSymbols");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v18 = (void *)MEMORY[0x1E0CB3978];
  v19 = specific;
  v13 = v16;
  objc_msgSend(v18, "callStackSymbols");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  v23 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NURenderJob init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 82, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (NURenderJob)initWithRequest:(id)a3
{
  id v5;
  void *v6;
  NURenderJob *v7;
  uint64_t v8;
  NSDate *jobCreationDate;
  unint64_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *stateQueue;
  NUObservatory *v14;
  NUObservatory *observatory;
  NURenderJobStatistics *v16;
  NURenderJobStatistics *stats;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  NUDevice *v22;
  void *device;
  uint64_t v24;
  NUDevice *v25;
  dispatch_group_t v26;
  OS_dispatch_group *replyGroup;
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
  objc_super v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    NUAssertLogger_19521();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "request != nil");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v30;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_19521();
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
        *(_DWORD *)buf = 138543618;
        v47 = v36;
        v48 = 2114;
        v49 = v40;
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
      v47 = v35;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob initWithRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 87, CFSTR("Invalid parameter not satisfying: %s"), v41, v42, v43, v44, (uint64_t)"request != nil");
  }
  v6 = v5;
  v45.receiver = self;
  v45.super_class = (Class)NURenderJob;
  v7 = -[NURenderJob init](&v45, sel_init);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = objc_claimAutoreleasedReturnValue();
  jobCreationDate = v7->_jobCreationDate;
  v7->_jobCreationDate = (NSDate *)v8;

  do
    v10 = __ldxr(&s_nextJobNumber);
  while (__stxr(v10 + 1, &s_nextJobNumber));
  v7->_jobNumber = v10;
  v7->_currentStage = 1;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = dispatch_queue_create("NURenderJob_State", v11);
  stateQueue = v7->_stateQueue;
  v7->_stateQueue = (OS_dispatch_queue *)v12;

  objc_storeStrong((id *)&v7->_request, a3);
  v14 = objc_alloc_init(NUObservatory);
  observatory = v7->_observatory;
  v7->_observatory = v14;

  v16 = objc_alloc_init(NURenderJobStatistics);
  stats = v7->_stats;
  v7->_stats = v16;

  objc_msgSend(v6, "submitTime");
  -[NURenderJobStatistics setRequestTime:](v7->_stats, "setRequestTime:");
  if (+[NUGlobalSettings renderJobDebug](NUGlobalSettings, "renderJobDebug"))
  {
    -[NURenderJob renderJobDebugInit](v7, "renderJobDebugInit");
    objc_msgSend(v6, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[NURenderJobStatistics recordJobCreatedToHistory:](NURenderJobStatistics, "recordJobCreatedToHistory:", v18);

  }
  if (+[NUGlobalSettings imageRenderJobUseSurfaceRenderer](NUGlobalSettings, "imageRenderJobUseSurfaceRenderer"))
  {
    v19 = 1;
LABEL_10:
    v7->_rendererType = v19;
    goto LABEL_12;
  }
  if (+[NUGlobalSettings imageRenderJobUseTextureRenderer](NUGlobalSettings, "imageRenderJobUseTextureRenderer"))
  {
    v19 = 2;
    goto LABEL_10;
  }
  v7->_rendererType = 0;
LABEL_12:
  objc_msgSend(v6, "device");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = v20;
    device = v7->_device;
    v7->_device = v22;
  }
  else
  {
    +[NUPlatform currentPlatform](NUPlatform, "currentPlatform");
    device = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(device, "mainDevice");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v7->_device;
    v7->_device = (NUDevice *)v24;

  }
  v26 = dispatch_group_create();
  replyGroup = v7->_replyGroup;
  v7->_replyGroup = (OS_dispatch_group *)v26;

  return v7;
}

- (void)runSynchronous
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_replySynchronous = 1;
  v3 = -[NURenderJob currentStage](self, "currentStage");
  if (!-[NURenderJob isFinished](self, "isFinished"))
  {
    do
    {
      -[NURenderJob run:](self, "run:", v3);
      v3 = -[NURenderJob currentStage](self, "currentStage");
      if (v3 == 3)
      {
        v11 = 0u;
        v12 = 0u;
        v9 = 0u;
        v10 = 0u;
        -[NURenderJob dependentJobs](self, "dependentJobs", 0);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v10;
          do
          {
            v8 = 0;
            do
            {
              if (*(_QWORD *)v10 != v7)
                objc_enumerationMutation(v4);
              objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "runSynchronous");
            }
            while (v6 != v8);
            v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
          }
          while (v6);
        }

        v3 = 1;
      }
    }
    while (!-[NURenderJob isFinished](self, "isFinished"));
  }
  self->_replySynchronous = 0;
}

- (void)runToPrepareSynchronous
{
  int64_t v3;

  self->_replySynchronous = 1;
  v3 = -[NURenderJob currentStage](self, "currentStage");
  if (!-[NURenderJob isFinished](self, "isFinished"))
  {
    do
    {
      -[NURenderJob run:](self, "run:", v3);
      if (v3 == 1)
        break;
      v3 = -[NURenderJob currentStage](self, "currentStage");
    }
    while (!-[NURenderJob isFinished](self, "isFinished"));
  }
  self->_replySynchronous = 0;
}

- (id)newRenderPipelineStateForEvaluationMode:(int64_t)a3
{
  void *v5;
  NURenderPipelineState *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
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
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  -[NURenderJob request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(NURenderPipelineState);
  -[NURenderPipelineState setEvaluationMode:](v6, "setEvaluationMode:", a3);
  objc_msgSend(v5, "pipelineFilters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderPipelineState setPipelineFilters:](v6, "setPipelineFilters:", v7);

  -[NURenderPipelineState setSampleMode:](v6, "setSampleMode:", -[NURenderJob resolvedSampleMode:](self, "resolvedSampleMode:", objc_msgSend(v5, "sampleMode")));
  if ((unint64_t)(a3 - 1) >= 3)
  {
    if (a3)
      goto LABEL_8;
    v11 = *((_QWORD *)&NUScaleUnknown + 1);
    v9 = NUScaleUnknown;
  }
  else
  {
    if (-[NURenderJob renderScale](self, "renderScale") < 1 || v8 <= 0)
    {
      NUAssertLogger_19521();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid render scale"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v43 = v20;
        _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_19521();
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
          v43 = v26;
          v44 = 2114;
          v45 = v30;
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
        v43 = v25;
        _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"-[NURenderJob newRenderPipelineStateForEvaluationMode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 183, CFSTR("Invalid render scale"), v31, v32, v33, v34, v35);
    }
    v9 = -[NURenderJob renderScale](self, "renderScale");
    v11 = v10;
  }
  -[NURenderPipelineState setScale:](v6, "setScale:", v9, v11);
LABEL_8:
  -[NURenderPipelineState setMediaComponentType:](v6, "setMediaComponentType:", objc_msgSend(v5, "mediaComponentType"));
  -[NURenderJob device](self, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderPipelineState setDevice:](v6, "setDevice:", v12);

  if (v5)
  {
    objc_msgSend(v5, "time");
    if ((v40 & 0x100000000) != 0)
    {
      objc_msgSend(v5, "time");
      v35 = v37;
      v36 = v38;
      -[NURenderPipelineState setTime:](v6, "setTime:", &v35);
    }
  }
  else
  {
    v39 = 0;
    v40 = 0;
    v41 = 0;
  }
  -[NURenderJob request](self, "request");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "composition");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "mediaType") == 2)
  {

  }
  else
  {
    v15 = objc_msgSend(v5, "mediaComponentType");

    if (v15 != 2)
      goto LABEL_16;
  }
  -[NURenderPipelineState setEnforceEvenDimensions:](v6, "setEnforceEvenDimensions:", 1);
LABEL_16:
  -[NURenderJob request](self, "request");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isOneShot");

  if (v17)
    -[NURenderPipelineState setDisableIntermediateCaching:](v6, "setDisableIntermediateCaching:", 1);

  return v6;
}

- (int64_t)resolvedSampleMode:(int64_t)a3
{
  void *v4;
  int64_t v5;

  if (a3)
    return a3;
  -[NURenderJob device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "defaultSampleMode");

  return v5;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)imageSize
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  NSObject *v10;
  void *v11;
  void *specific;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[12];
  __int16 v27;
  void *v28;
  uint64_t v29;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v29 = *MEMORY[0x1E0C80C00];
  -[NURenderJob outputGeometry](self, "outputGeometry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    NUAssertLogger_19521();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Output geometry is missing. Either the job's prepare stage has not been performed, or the job did not request output geometry."));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v26 = 138543362;
      *(_QWORD *)&v26[4] = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v26, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_19521();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v18 = (void *)MEMORY[0x1E0CB3978];
        v19 = v17;
        objc_msgSend(v18, "callStackSymbols");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v26 = 138543618;
        *(_QWORD *)&v26[4] = v17;
        v27 = 2114;
        v28 = v21;
        _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v26, 0x16u);

      }
    }
    else if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v26 = 138543362;
      *(_QWORD *)&v26[4] = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v26, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob imageSize]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 219, CFSTR("Output geometry is missing. Either the job's prepare stage has not been performed, or the job did not request output geometry."), v22, v23, v24, v25, *(uint64_t *)v26);
  }
  -[NURenderJob outputGeometry](self, "outputGeometry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "scaledSize");
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[NURenderJob currentStage](self, "currentStage") - 1;
  if (v5 > 5)
    v6 = CFSTR("None");
  else
    v6 = off_1E50632C0[v5];
  -[NURenderJob request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p - state: %@ request: %@>"), v4, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)run:(int64_t)a3
{
  void *v5;
  void *v6;
  _QWORD v7[6];

  -[NURenderJob request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "voucher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __19__NURenderJob_run___block_invoke;
  v7[3] = &unk_1E50631C0;
  v7[4] = self;
  v7[5] = a3;
  NULogAdoptVoucher(v6, v7);

}

- (void)_run:(int64_t)a3
{
  int64_t v4;
  int64_t v5;
  double Current;
  uint64_t v7;

  v4 = -[NURenderJob willRun](self, "willRun", a3);
  if (v4)
  {
    v5 = v4;
    -[NURenderJob _emitSignpostEventType:forStage:duration:](self, "_emitSignpostEventType:forStage:duration:", 1, v4, 0.0);
    Current = CFAbsoluteTimeGetCurrent();
    v7 = 0;
    if (!-[NURenderJob runStage:error:](self, "runStage:error:", v5, &v7))
      -[NURenderJob fail:](self, "fail:", v7);
    -[NURenderJob _emitSignpostEventType:forStage:duration:](self, "_emitSignpostEventType:forStage:duration:", 2, v5, CFAbsoluteTimeGetCurrent() - Current);
    -[NURenderJob didRun](self, "didRun");
  }
}

- (void)_emitSignpostEventType:(unsigned __int8)a3 forStage:(int64_t)a4 duration:(double)a5
{
  int v7;
  NSObject *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  const char *v23;
  NSObject *v24;
  unint64_t v25;
  NSObject *v26;
  unint64_t v27;
  NSObject *v28;
  unint64_t v29;
  NSObject *v30;
  unint64_t v31;
  NSObject *v32;
  unint64_t v33;
  NSObject *v34;
  unint64_t v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  unint64_t v39;
  uint64_t v40;

  v7 = a3;
  v40 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
  v9 = (id)_NUScheduleLogger;
  if (v7 == 2)
  {
    if (NUIsAppleInternal_onceToken != -1)
      dispatch_once(&NUIsAppleInternal_onceToken, &__block_literal_global_14);
    if (NUIsAppleInternal_isAppleInternal)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0x2000);
      objc_msgSend(v10, "appendFormat:", CFSTR("Duration = %.3f\n"), *(_QWORD *)&a5);
      if ((unint64_t)(a4 - 1) > 5)
        v11 = CFSTR("None");
      else
        v11 = off_1E50632C0[a4 - 1];
      objc_msgSend(v10, "appendFormat:", CFSTR("Stage = %@\n"), v11);
      -[NURenderJob request](self, "request");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendFormat:", CFSTR("Name=%@, Job=%llu\n\n"), v13, -[NURenderJob jobNumber](self, "jobNumber"));

      objc_msgSend(v10, "appendString:", CFSTR("----\n"));
      -[NURenderJob additionalDebugInfo](self, "additionalDebugInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendFormat:", CFSTR("jobDebugInfo = \n%@\n"), v14);

      objc_msgSend(v10, "appendString:", CFSTR("----\n"));
      -[NURenderJob request](self, "request");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "additionalDebugInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "appendFormat:", CFSTR("\nrequestDebugInfo = \n%@\n"), v16);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v10;
        _os_log_debug_impl(&dword_1A6553000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v17 = os_signpost_id_make_with_pointer(v9, self);
  switch(a4)
  {
    case 0:
      v18 = v9;
      if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_36;
      v19 = v18;
      if (!os_signpost_enabled(v18))
        goto LABEL_36;
      -[NURenderJob request](self, "request");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[NURenderJob jobNumber](self, "jobNumber");
      *(_DWORD *)buf = 138412546;
      v37 = v21;
      v38 = 2048;
      v39 = v22;
      v23 = "None";
      break;
    case 1:
      v30 = v9;
      if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_36;
      v19 = v30;
      if (!os_signpost_enabled(v30))
        goto LABEL_36;
      -[NURenderJob request](self, "request");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[NURenderJob jobNumber](self, "jobNumber");
      *(_DWORD *)buf = 138412546;
      v37 = v21;
      v38 = 2048;
      v39 = v31;
      v23 = "Prepare";
      break;
    case 2:
      v24 = v9;
      if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_36;
      v19 = v24;
      if (!os_signpost_enabled(v24))
        goto LABEL_36;
      -[NURenderJob request](self, "request");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[NURenderJob jobNumber](self, "jobNumber");
      *(_DWORD *)buf = 138412546;
      v37 = v21;
      v38 = 2048;
      v39 = v25;
      v23 = "WaitPause";
      break;
    case 3:
      v26 = v9;
      if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_36;
      v19 = v26;
      if (!os_signpost_enabled(v26))
        goto LABEL_36;
      -[NURenderJob request](self, "request");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[NURenderJob jobNumber](self, "jobNumber");
      *(_DWORD *)buf = 138412546;
      v37 = v21;
      v38 = 2048;
      v39 = v27;
      v23 = "WaitDependencies";
      break;
    case 4:
      v28 = v9;
      if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_36;
      v19 = v28;
      if (!os_signpost_enabled(v28))
        goto LABEL_36;
      -[NURenderJob request](self, "request");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[NURenderJob jobNumber](self, "jobNumber");
      *(_DWORD *)buf = 138412546;
      v37 = v21;
      v38 = 2048;
      v39 = v29;
      v23 = "Render";
      break;
    case 5:
      v32 = v9;
      if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_36;
      v19 = v32;
      if (!os_signpost_enabled(v32))
        goto LABEL_36;
      -[NURenderJob request](self, "request");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[NURenderJob jobNumber](self, "jobNumber");
      *(_DWORD *)buf = 138412546;
      v37 = v21;
      v38 = 2048;
      v39 = v33;
      v23 = "Complete";
      break;
    case 6:
      v34 = v9;
      if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_36;
      v19 = v34;
      if (!os_signpost_enabled(v34))
        goto LABEL_36;
      -[NURenderJob request](self, "request");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[NURenderJob jobNumber](self, "jobNumber");
      *(_DWORD *)buf = 138412546;
      v37 = v21;
      v38 = 2048;
      v39 = v35;
      v23 = "Done";
      break;
    default:
      goto LABEL_37;
  }
  _os_signpost_emit_with_name_impl(&dword_1A6553000, v19, (os_signpost_type_t)v7, v17, v23, "Name=%@, Job=%llu", buf, 0x16u);

LABEL_36:
LABEL_37:

}

- (NUPriority)priority
{
  return -[NURenderRequest priority](self->_request, "priority");
}

- (NUScalePolicy)scalePolicy
{
  void *v2;
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *specific;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  objc_class *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_845);
  v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = v2;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v7;
    _os_log_error_impl(&dword_1A6553000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_845);
      goto LABEL_8;
    }
    if (v8 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_845);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v10 = (void *)MEMORY[0x1E0CB3978];
    v11 = v9;
    objc_msgSend(v10, "callStackSymbols");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v13;
    _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v16 = (void *)MEMORY[0x1E0CB3978];
  v17 = specific;
  v11 = v14;
  objc_msgSend(v16, "callStackSymbols");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v27 = specific;
  v28 = 2114;
  v29 = v19;
  _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NURenderJob scalePolicy]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 300, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v22, v23, v24, v25, v21);
}

- (NUExtentPolicy)extentPolicy
{
  return 0;
}

- (id)renderer:(id *)a3
{
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;

  -[NURenderJob priority](self, "priority");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLow");

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[NURenderJob priority](self, "priority");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isHigh");

    if (v9)
      v7 = 2;
    else
      v7 = 0;
  }
  -[NURenderJob request](self, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "shouldUseLowMemoryMode");

  if (v11)
  {
    v7 |= 8uLL;
  }
  else
  {
    -[NURenderJob request](self, "request");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isOneShot");

    if (!v13)
      v7 |= 4uLL;
  }
  -[NURenderJob request](self, "request");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isOneShot");

  if (v15)
    v16 = v7 | 0x10;
  else
    v16 = v7;
  -[NURenderJob device](self, "device");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rendererWithOptions:error:", v16, a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)wantsOutputGeometry
{
  return 0;
}

- (BOOL)wantsOutputImage
{
  return 0;
}

- (BOOL)wantsOutputVideoFrame
{
  return 0;
}

- (BOOL)wantsOutputVideo
{
  return 0;
}

- (BOOL)wantsRenderStage
{
  return 1;
}

- (BOOL)wantsCompleteStage
{
  return 1;
}

- (BOOL)wantsPrepareNodeCached
{
  return 1;
}

- (BOOL)wantsRenderNodeCached
{
  return 1;
}

- (int64_t)willRun
{
  NSObject *stateQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __22__NURenderJob_willRun__block_invoke;
  v5[3] = &unk_1E5063FE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_didPrepare
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;

  -[NURenderJob prepareNode](self, "prepareNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[NURenderJob wantsPrepareNodeCached](self, "wantsPrepareNodeCached"))
  {
    -[NURenderJob request](self, "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "renderContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLastPrepareNode:", v3);

  }
  -[NURenderJob renderNode](self, "renderNode");
  v10 = objc_claimAutoreleasedReturnValue();

  v6 = (void *)v10;
  if (v10)
  {
    v7 = -[NURenderJob wantsRenderNodeCached](self, "wantsRenderNodeCached");
    v6 = (void *)v10;
    if (v7)
    {
      -[NURenderJob request](self, "request");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "renderContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLastRenderNode:", v10);

      v6 = (void *)v10;
    }
  }

}

- (void)didRun
{
  NSObject *stateQueue;
  _QWORD block[7];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__NURenderJob_didRun__block_invoke;
  block[3] = &unk_1E50631E8;
  block[4] = self;
  block[5] = &v9;
  block[6] = &v5;
  dispatch_sync(stateQueue, block);
  if (*((_BYTE *)v6 + 24))
    -[NURenderJob finalize:](self, "finalize:", *((unsigned __int8 *)v10 + 24));
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v9, 8);
}

- (BOOL)runStage:(int64_t)a3 error:(id *)a4
{
  NURenderJob *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const __CFString *v20;
  NURenderJob *v21;
  void *specific;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  NURenderJob *v26;
  NURenderJob *v27;
  void *v28;
  NURenderJob *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t buf[4];
  NURenderJob *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = self;
  switch(a3)
  {
    case 0:
    case 2:
    case 3:
    case 6:
      NUAssertLogger_19521();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        if ((unint64_t)(a3 - 1) > 5)
          v20 = CFSTR("None");
        else
          v20 = off_1E50632C0[a3 - 1];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot run stage: %@"), v20);
        v21 = (NURenderJob *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v21;
        _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_19521();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v24)
        {
          v27 = (NURenderJob *)dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v28 = (void *)MEMORY[0x1E0CB3978];
          v29 = v27;
          objc_msgSend(v28, "callStackSymbols");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v40 = v27;
          v41 = 2114;
          v42 = v31;
          _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v24)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v26 = (NURenderJob *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v26;
        _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      if ((unint64_t)(a3 - 1) > 5)
        v32 = CFSTR("None");
      else
        v32 = off_1E50632C0[a3 - 1];
      v33 = v32;
      _NUAssertFailHandler((uint64_t)"-[NURenderJob runStage:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 500, CFSTR("Cannot run stage: %@"), v34, v35, v36, v37, (uint64_t)v33);
    case 1:
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
      v6 = (void *)_NUScheduleLogger;
      if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
      {
        v10 = v6;
        -[NURenderJob request](v5, "request");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v40 = v5;
        v41 = 2114;
        v42 = v12;
        _os_log_debug_impl(&dword_1A6553000, v10, OS_LOG_TYPE_DEBUG, "job %p %{public}@ prepare", buf, 0x16u);

      }
      LOBYTE(self) = -[NURenderJob prepare:](v5, "prepare:", a4);
      break;
    case 4:
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
      v7 = (void *)_NUScheduleLogger;
      if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
      {
        v13 = v7;
        -[NURenderJob request](v5, "request");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v40 = v5;
        v41 = 2114;
        v42 = v15;
        _os_log_debug_impl(&dword_1A6553000, v13, OS_LOG_TYPE_DEBUG, "job %p %{public}@ render", buf, 0x16u);

      }
      LOBYTE(self) = -[NURenderJob _checkForMemoizedResult](v5, "_checkForMemoizedResult")
                  || -[NURenderJob render:](v5, "render:", a4);
      break;
    case 5:
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
      v8 = (void *)_NUScheduleLogger;
      if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
      {
        v16 = v8;
        -[NURenderJob request](v5, "request");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v40 = v5;
        v41 = 2114;
        v42 = v18;
        _os_log_debug_impl(&dword_1A6553000, v16, OS_LOG_TYPE_DEBUG, "job %p %{public}@ complete", buf, 0x16u);

      }
      LOBYTE(self) = -[NURenderJob complete:](v5, "complete:", a4);
      break;
    default:
      return self & 1;
  }
  return self & 1;
}

- (int64_t)_nextStageForStage:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t result;
  uint64_t v9;

  v9 = v3;
  switch(a3)
  {
    case 0:
    case 2:
    case 3:
      result = 1;
      break;
    case 1:
      if (-[NURenderJob _shouldWaitForDependentJobs](self, "_shouldWaitForDependentJobs"))
      {
        result = 3;
      }
      else
      {
        if (!-[NURenderJob wantsRenderStage](self, "wantsRenderStage"))
          goto LABEL_8;
        result = 4;
      }
      break;
    case 4:
LABEL_8:
      if (!-[NURenderJob wantsCompleteStage](self, "wantsCompleteStage", v4, v9, v5, v6))
        goto LABEL_10;
      result = 5;
      break;
    case 5:
    case 6:
LABEL_10:
      result = 6;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (BOOL)_shouldWaitForDependentJobs
{
  void *v2;
  BOOL v3;

  -[NURenderJob dependentJobs](self, "dependentJobs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (int64_t)currentStage
{
  NSObject *stateQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__NURenderJob_currentStage__block_invoke;
  v5[3] = &unk_1E5063FE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isCanceled
{
  NSObject *stateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__NURenderJob_isCanceled__block_invoke;
  v5[3] = &unk_1E5063FE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isFinished
{
  NSObject *stateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__NURenderJob_isFinished__block_invoke;
  v5[3] = &unk_1E5063FE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)cancel
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[NURenderJob request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "voucher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __21__NURenderJob_cancel__block_invoke;
  v5[3] = &unk_1E5064008;
  v5[4] = self;
  NULogAdoptVoucher(v4, v5);

}

- (void)_cancel
{
  NSObject *stateQueue;
  _QWORD v4[7];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  __int16 v13;
  char v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2810000000;
  v12 = &unk_1A674C0CB;
  v13 = 0;
  v14 = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __22__NURenderJob__cancel__block_invoke;
  v4[3] = &unk_1E50631E8;
  v4[4] = self;
  v4[5] = &v5;
  v4[6] = &v9;
  dispatch_sync(stateQueue, v4);
  if (+[NUGlobalSettings renderJobDebug](NUGlobalSettings, "renderJobDebug") && !*((_BYTE *)v6 + 24))
  {
    -[NURenderJob renderJobDebugCanceled](self, "renderJobDebugCanceled");
    +[NURenderJobStatistics addStatisticsToHistory:forJob:wasCanceled:](NURenderJobStatistics, "addStatisticsToHistory:forJob:wasCanceled:", self->_stats, self, 1);
  }
  if (*((_BYTE *)v10 + 33))
    -[NURenderJob finalize:](self, "finalize:", *((unsigned __int8 *)v10 + 32));
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v9, 8);
}

- (BOOL)_shouldCancelCoalescedJob
{
  unint64_t currentStage;

  if (self->_isCanceled)
    return 0;
  currentStage = self->_currentStage;
  if (currentStage < 4)
    return 1;
  if (currentStage != 4)
    return 0;
  return !self->_isExecuting;
}

- (BOOL)cancelCoalescedJob
{
  void *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[NURenderJob request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "voucher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__NURenderJob_cancelCoalescedJob__block_invoke;
  v6[3] = &unk_1E5063FE0;
  v6[4] = self;
  v6[5] = &v7;
  NULogAdoptVoucher(v4, v6);

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

- (BOOL)_cancelCoalescedJob
{
  NSObject *stateQueue;
  uint64_t *v4;
  char v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  __int16 v16;
  char v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2810000000;
  v15 = &unk_1A674C0CB;
  v16 = 1;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__NURenderJob__cancelCoalescedJob__block_invoke;
  v7[3] = &unk_1E50631E8;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = &v12;
  dispatch_sync(stateQueue, v7);
  if (+[NUGlobalSettings renderJobDebug](NUGlobalSettings, "renderJobDebug") && !*((_BYTE *)v9 + 24))
  {
    -[NURenderJob renderJobDebugCanceled](self, "renderJobDebugCanceled");
    +[NURenderJobStatistics addStatisticsToHistory:forJob:wasCanceled:](NURenderJobStatistics, "addStatisticsToHistory:forJob:wasCanceled:", self->_stats, self, 1);
  }
  v4 = v13;
  if (*((_BYTE *)v13 + 33))
  {
    -[NURenderJob finalize:](self, "finalize:", *((unsigned __int8 *)v13 + 32));
    v4 = v13;
  }
  v5 = *((_BYTE *)v4 + 34);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

- (void)pause
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[NURenderJob request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "voucher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __20__NURenderJob_pause__block_invoke;
  v5[3] = &unk_1E5064008;
  v5[4] = self;
  NULogAdoptVoucher(v4, v5);

}

- (void)_pause
{
  -[NURenderJob _setCurrentStage:](self, "_setCurrentStage:", 2);
}

- (void)resume
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[NURenderJob request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "voucher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __21__NURenderJob_resume__block_invoke;
  v5[3] = &unk_1E5064008;
  v5[4] = self;
  NULogAdoptVoucher(v4, v5);

}

- (void)_resume
{
  -[NURenderJob _setCurrentStage:](self, "_setCurrentStage:", 1);
}

- ($EB925890EBEBD6850280D1FB85A9BD43)_atomicCancel
{
  int v3;
  int v4;
  int v5;

  if (self->_isCanceled || self->_isFinished || self->_failed)
  {
    v3 = 0;
    v4 = 0;
  }
  else
  {
    v5 = 1;
    if (self->_currentStage == 6)
    {
      v3 = 0;
      v4 = 0;
      return ($EB925890EBEBD6850280D1FB85A9BD43)((v3 << 16) | (v4 << 8) | v5);
    }
    self->_isCanceled = 1;
    -[NURenderJob _notifyCanceled:](self, "_notifyCanceled:");
    if (!self->_isExecuting)
    {
      v5 = !-[NURenderRequest shouldCoalesceUpdates](self->_request, "shouldCoalesceUpdates");
      v3 = 1;
      v4 = 1;
      return ($EB925890EBEBD6850280D1FB85A9BD43)((v3 << 16) | (v4 << 8) | v5);
    }
    -[NURenderJob abortStage:](self, "abortStage:", self->_currentStage);
    v4 = 0;
    v3 = 1;
    self->_isAborted = 1;
  }
  v5 = 1;
  return ($EB925890EBEBD6850280D1FB85A9BD43)((v3 << 16) | (v4 << 8) | v5);
}

- (void)abortStage:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  NURenderJob *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 5:
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
      v5 = (void *)_NUScheduleLogger;
      if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
      {
        v10 = v5;
        -[NURenderJob request](self, "request");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 134218242;
        v17 = self;
        v18 = 2114;
        v19 = v12;
        _os_log_debug_impl(&dword_1A6553000, v10, OS_LOG_TYPE_DEBUG, "job %p %{public}@ abort complete", (uint8_t *)&v16, 0x16u);

      }
      -[NURenderJob abortComplete](self, "abortComplete");
      break;
    case 4:
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
      v6 = (void *)_NUScheduleLogger;
      if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
      {
        v13 = v6;
        -[NURenderJob request](self, "request");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 134218242;
        v17 = self;
        v18 = 2114;
        v19 = v15;
        _os_log_debug_impl(&dword_1A6553000, v13, OS_LOG_TYPE_DEBUG, "job %p %{public}@ abort render", (uint8_t *)&v16, 0x16u);

      }
      -[NURenderJob abortRender](self, "abortRender");
      break;
    case 1:
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
      v4 = (void *)_NUScheduleLogger;
      if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
      {
        v7 = v4;
        -[NURenderJob request](self, "request");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 134218242;
        v17 = self;
        v18 = 2114;
        v19 = v9;
        _os_log_debug_impl(&dword_1A6553000, v7, OS_LOG_TYPE_DEBUG, "job %p %{public}@ abort prepare", (uint8_t *)&v16, 0x16u);

      }
      -[NURenderJob abortPrepare](self, "abortPrepare");
      break;
  }
}

- (void)respond
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NUResponse *v9;
  void *v10;
  NUResponse *v11;
  NUResponse *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NURenderJob *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (-[NURenderJob failed](self, "failed"))
  {
    if (-[NURenderJob isCanceled](self, "isCanceled"))
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
      v3 = (void *)_NUScheduleLogger;
      if (!os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
        goto LABEL_15;
      v4 = v3;
      -[NURenderJob request](self, "request");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 134218242;
      v18 = self;
      v19 = 2114;
      v20 = v6;
      _os_log_debug_impl(&dword_1A6553000, v4, OS_LOG_TYPE_DEBUG, "respond job %p %{public}@: canceled", (uint8_t *)&v17, 0x16u);
    }
    else
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
      v10 = (void *)_NUScheduleLogger;
      if (!os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      v4 = v10;
      -[NURenderJob request](self, "request");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NURenderJob error](self, "error");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 134218498;
      v18 = self;
      v19 = 2114;
      v20 = v6;
      v21 = 2114;
      v22 = v16;
      _os_log_error_impl(&dword_1A6553000, v4, OS_LOG_TYPE_ERROR, "respond job %p %{public}@: error %{public}@", (uint8_t *)&v17, 0x20u);

    }
LABEL_15:
    v11 = [NUResponse alloc];
    -[NURenderJob error](self, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NUResponse initWithError:](v11, "initWithError:", v8);
    goto LABEL_16;
  }
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
  v7 = (void *)_NUScheduleLogger;
  if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
  {
    v13 = v7;
    -[NURenderJob request](self, "request");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 134218242;
    v18 = self;
    v19 = 2114;
    v20 = v15;
    _os_log_debug_impl(&dword_1A6553000, v13, OS_LOG_TYPE_DEBUG, "respond job %p %{public}@: success", (uint8_t *)&v17, 0x16u);

  }
  -[NURenderJob result](self, "result");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStatistics:", self->_stats);
  -[NURenderJob _memoizeResult:](self, "_memoizeResult:", v8);
  v9 = -[NUResponse initWithResult:]([NUResponse alloc], "initWithResult:", v8);
LABEL_16:
  v12 = v9;

  -[NURenderJob reply:](self, "reply:", v12);
  if (+[NUGlobalSettings renderJobDebug](NUGlobalSettings, "renderJobDebug"))
  {
    -[NURenderJob renderJobDebugResponded](self, "renderJobDebugResponded");
    +[NURenderJobStatistics addStatisticsToHistory:forJob:wasCanceled:](NURenderJobStatistics, "addStatisticsToHistory:forJob:wasCanceled:", self->_stats, self, 0);
  }

}

- (id)result
{
  void *v2;
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *specific;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  objc_class *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_845);
  v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = v2;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v7;
    _os_log_error_impl(&dword_1A6553000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_845);
      goto LABEL_8;
    }
    if (v8 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_845);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v10 = (void *)MEMORY[0x1E0CB3978];
    v11 = v9;
    objc_msgSend(v10, "callStackSymbols");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v13;
    _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v16 = (void *)MEMORY[0x1E0CB3978];
  v17 = specific;
  v11 = v14;
  objc_msgSend(v16, "callStackSymbols");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v27 = specific;
  v28 = 2114;
  v29 = v19;
  _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NURenderJob result]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 863, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v22, v23, v24, v25, v21);
}

- (void)finalize:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    if (-[NURenderJob isCanceled](self, "isCanceled"))
    {
      -[NURenderJob request](self, "request");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v4, "copy");
      +[NUError canceledError:object:](NUError, "canceledError:object:", CFSTR("Request was canceled"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[NURenderJob fail:](self, "fail:", v6);
    }
    -[NURenderJob respond](self, "respond");
  }
  -[NURenderJob cleanUp](self, "cleanUp");
  -[NURenderJob finish](self, "finish");
}

- (void)finish
{
  NSObject *stateQueue;
  _QWORD block[5];

  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__NURenderJob_finish__block_invoke;
  block[3] = &unk_1E5064008;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

- (void)_finish
{
  if (!self->_isFinished)
  {
    self->_isFinished = 1;
    self->_currentStage = 6;
    -[NURenderJob _notifyStageTransition:](self, "_notifyStageTransition:", 6);
  }
}

- (void)_setCurrentStage:(int64_t)a3
{
  NSObject *v3;
  void *v4;
  void *specific;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_19521();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "stage != NURenderJobStageNone");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v4;
      _os_log_error_impl(&dword_1A6553000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_19521();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v11 = (void *)MEMORY[0x1E0CB3978];
        v12 = v10;
        objc_msgSend(v11, "callStackSymbols");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v10;
        v21 = 2114;
        v22 = v14;
        _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v9;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob _setCurrentStage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 914, CFSTR("Invalid parameter not satisfying: %s"), v15, v16, v17, v18, (uint64_t)"stage != NURenderJobStageNone");
  }
  self->_currentStage = a3;
  if (a3 != 6)
    -[NURenderJob _notifyStageTransition:](self, "_notifyStageTransition:");
}

- (BOOL)succeeded
{
  NSObject *stateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__NURenderJob_succeeded__block_invoke;
  v5[3] = &unk_1E5063FE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)reply:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *stateQueue;
  void *v7;
  NSObject *replyGroup;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  _QWORD block[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__NURenderJob_reply___block_invoke;
  block[3] = &unk_1E5064008;
  block[4] = self;
  dispatch_sync(stateQueue, block);
  if (self->_replySynchronous)
  {
    v7 = (void *)MEMORY[0x1A85C1390]();
    -[NURenderJob _reply:](self, "_reply:", v4);
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    replyGroup = self->_replyGroup;
    -[NURenderRequest responseQueue](self->_request, "responseQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __21__NURenderJob_reply___block_invoke_2;
    v10[3] = &unk_1E5063FB8;
    v10[4] = self;
    v11 = v4;
    dispatch_group_async(replyGroup, v9, v10);

  }
}

- (void)_reply:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  NURenderRequest *request;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  NURenderJob *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NURenderJobStatistics setResponseTime:](self->_stats, "setResponseTime:", NUAbsoluteTime());
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
  v5 = (void *)_NUScheduleLogger;
  if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
  {
    request = self->_request;
    v8 = v5;
    -[NURenderRequest name](request, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderJobStatistics totalDuration](self->_stats, "totalDuration");
    v11 = 134218498;
    v12 = self;
    v13 = 2114;
    v14 = v9;
    v15 = 2048;
    v16 = v10;
    _os_log_debug_impl(&dword_1A6553000, v8, OS_LOG_TYPE_DEBUG, "job %p %{public}@ totalDuration %0.4f s", (uint8_t *)&v11, 0x20u);

  }
  -[NURenderRequest completionBlock](self->_request, "completionBlock");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v6)[2](v6, v4);

}

- (id)cacheKey
{
  return 0;
}

- (id)memoizationCacheKey
{
  NSString **p_memoizationCacheKey;
  NSString *v4;

  p_memoizationCacheKey = &self->_memoizationCacheKey;
  v4 = self->_memoizationCacheKey;
  if (!v4)
  {
    -[NURenderJob cacheKey](self, "cacheKey");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)p_memoizationCacheKey, v4);
  }
  return v4;
}

- (BOOL)_checkForMemoizedResult
{
  BOOL v3;
  void *v4;
  void *v5;
  NUResponse *v6;

  if (+[NUGlobalSettings renderJobDisableResultCache](NUGlobalSettings, "renderJobDisableResultCache"))
    return 0;
  +[NURenderResultCache shared](NURenderResultCache, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultForJob:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = v5 != 0;
  if (v5)
  {
    v6 = -[NUResponse initWithResult:]([NUResponse alloc], "initWithResult:", v5);
    -[NURenderJob reply:](self, "reply:", v6);
    -[NURenderJob finalize:](self, "finalize:", 0);

  }
  return v3;
}

- (void)_memoizeResult:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!+[NUGlobalSettings renderJobDisableResultCache](NUGlobalSettings, "renderJobDisableResultCache"))
  {
    +[NURenderResultCache shared](NURenderResultCache, "shared");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setResult:forJob:", v5, self);

  }
}

- (BOOL)prepare:(id *)a3
{
  id *v3;
  void *v5;
  _BOOL4 v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  BOOL v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  _BOOL4 v45;
  _BOOL4 v46;
  id *v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NUImageGeometry *v59;
  uint64_t v60;
  void *v61;
  NUImageGeometry *v62;
  void *v63;
  uint64_t v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  BOOL v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  int v87;
  void *v88;
  int v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  NSObject *v96;
  void *v97;
  void *v98;
  NSObject *v99;
  void *v100;
  NSObject *v101;
  void *v102;
  void *v103;
  NSObject *v104;
  void *v105;
  void *v106;
  NSObject *v107;
  void *v108;
  NSObject *v109;
  void *v110;
  NSObject *v111;
  void *v112;
  NSObject *v113;
  void *v114;
  NSObject *v115;
  void *v116;
  NSObject *v117;
  void *v118;
  void *specific;
  NSObject *v120;
  _BOOL4 v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  void *v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  NSObject *v133;
  void *v134;
  void *v135;
  NSObject *v136;
  _BOOL4 v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  id v142;
  void *v143;
  void *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  _BOOL4 v151;
  _BOOL4 v152;
  _BYTE v153[32];
  uint8_t buf[4];
  void *v155;
  __int16 v156;
  void *v157;
  uint64_t v158;

  v158 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_19521();
    v117 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v155 = v118;
      _os_log_error_impl(&dword_1A6553000, v117, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_19521();
    v120 = objc_claimAutoreleasedReturnValue();
    v121 = os_log_type_enabled(v120, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v121)
      {
        v124 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v125 = (void *)MEMORY[0x1E0CB3978];
        v126 = v124;
        objc_msgSend(v125, "callStackSymbols");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "componentsJoinedByString:", CFSTR("\n"));
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v155 = v124;
        v156 = 2114;
        v157 = v128;
        _os_log_error_impl(&dword_1A6553000, v120, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v121)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "componentsJoinedByString:", CFSTR("\n"));
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v155 = v123;
      _os_log_error_impl(&dword_1A6553000, v120, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob prepare:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1017, CFSTR("Invalid parameter not satisfying: %s"), v129, v130, v131, v132, (uint64_t)"error != nil");
  }
  v3 = a3;
  if (-[NURenderJob wantsOutputImage](self, "wantsOutputImage")
    || -[NURenderJob wantsOutputVideoFrame](self, "wantsOutputVideoFrame"))
  {
    -[NURenderJob outputImage](self, "outputImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == 0;

  }
  else
  {
    v6 = 0;
  }
  if (-[NURenderJob wantsOutputVideo](self, "wantsOutputVideo"))
  {
    -[NURenderJob outputVideo](self, "outputVideo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 == 0;

  }
  else
  {
    v8 = 0;
  }
  if (-[NURenderJob wantsOutputGeometry](self, "wantsOutputGeometry") || v8)
  {
    -[NURenderJob outputGeometry](self, "outputGeometry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10 == 0;

  }
  else
  {
    v9 = 0;
  }
  if (v6 || v8)
  {
    -[NURenderJob renderNode](self, "renderNode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == 0;

  }
  else
  {
    v12 = 0;
  }
  if (v9 || v6 || v8)
  {
    v14 = -[NURenderJob renderScale](self, "renderScale") < 1 || v13 < 1;
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }
  -[NURenderJob prepareNode](self, "prepareNode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (!v15)
      goto LABEL_54;
  }
  else
  {
    v37 = -[NURenderJob newRenderPipelineStateForEvaluationMode:](self, "newRenderPipelineStateForEvaluationMode:", 0);
    -[NURenderJob prepareNodeWithPipelineState:error:](self, "prepareNodeWithPipelineState:error:", v37, v3);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderJob setPrepareNode:](self, "setPrepareNode:", v38);

    -[NURenderJob prepareNode](self, "prepareNode");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v39)
      goto LABEL_44;
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
    v40 = (void *)_NUScheduleLogger;
    if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
    {
      v96 = v40;
      -[NURenderJob prepareNode](self, "prepareNode");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "debugDescription");
      v152 = v12;
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v155 = v98;
      _os_log_debug_impl(&dword_1A6553000, v96, OS_LOG_TYPE_DEBUG, "Prepare node:\n%@", buf, 0xCu);

      v12 = v152;
    }
    -[NURenderJob prepareNode](self, "prepareNode");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "outputGeometrySpaceMap:", v3);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v42)
    {
LABEL_44:

      return 0;
    }
    objc_msgSend(v37, "rootGroup");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "finalizeMap:", v42);
    v150 = v37;
    v44 = v9;
    v45 = v8;
    v46 = v6;
    v47 = v3;
    v48 = v12;
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderJob setResolvedSpaceMap:](self, "setResolvedSpaceMap:", v49);

    v12 = v48;
    v3 = v47;
    v6 = v46;
    v8 = v45;
    v9 = v44;

    if (!v15)
      goto LABEL_54;
  }
  -[NURenderJob evaluateOutputGeometry:](self, "evaluateOutputGeometry:", v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderJob setFullSizeGeometry:](self, "setFullSizeGeometry:", v17);

  -[NURenderJob fullSizeGeometry](self, "fullSizeGeometry");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    -[NURenderJob request](self, "request");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)objc_msgSend(v50, "copy");
    +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("Failure evaluating output geometry"), v51);
    *v3 = (id)objc_claimAutoreleasedReturnValue();

LABEL_49:
    return 0;
  }
  -[NURenderJob fullSizeGeometry](self, "fullSizeGeometry");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "size");
  v22 = v21;

  if (!v20 || !v22)
  {
    -[NURenderJob fullSizeGeometry](self, "fullSizeGeometry");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = CFSTR("Output geometry contains an empty size");
LABEL_48:
    +[NUError invalidError:object:](NUError, "invalidError:object:", v52, v50);
    *v3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_49;
  }
  v23 = v12;
  -[NURenderJob scalePolicy](self, "scalePolicy");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderJob fullSizeGeometry](self, "fullSizeGeometry");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "size");
  v28 = objc_msgSend(v24, "scaleForImageSize:", v26, v27);
  v30 = v29;

  if (v28 < 1 || v30 < 1)
  {
    -[NURenderJob scalePolicy](self, "scalePolicy");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = CFSTR("Scale policy produced invalid scale");
    goto LABEL_48;
  }
  if (NUScaleCompare(v28, v30, NUScaleOne, *((uint64_t *)&NUScaleOne + 1)) > 0)
  {
    v30 = *((_QWORD *)&NUScaleOne + 1);
    v28 = NUScaleOne;
  }
  if (-[NURenderJob wantsRenderScaleClampedToNativeScale](self, "wantsRenderScaleClampedToNativeScale"))
  {
    -[NURenderJob fullSizeGeometry](self, "fullSizeGeometry");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "renderScale");
    v34 = NUScaleCompare(v28, v30, v32, v33);

    v14 = v34 < 1;
    v12 = v23;
    if (!v14)
    {
      -[NURenderJob fullSizeGeometry](self, "fullSizeGeometry");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v35, "renderScale");
      v30 = v36;

    }
  }
  else
  {
    v12 = v23;
  }
  -[NURenderJob setRenderScale:](self, "setRenderScale:", v28, v30);
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
  v53 = (void *)_NUScheduleLogger;
  if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
  {
    v107 = v53;
    v149 = -[NURenderJob renderScale](self, "renderScale");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld:%ld"));
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v155 = v108;
    _os_log_debug_impl(&dword_1A6553000, v107, OS_LOG_TYPE_DEBUG, "Render scale: %@", buf, 0xCu);

    if (!v9)
      goto LABEL_61;
    goto LABEL_55;
  }
LABEL_54:
  if (!v9)
    goto LABEL_61;
LABEL_55:
  -[NURenderJob evaluateOutputGeometry:](self, "evaluateOutputGeometry:", v3);
  v54 = objc_claimAutoreleasedReturnValue();
  if (!v54)
    return 0;
  v55 = (void *)v54;
  v151 = v12;
  v56 = -[NURenderJob renderScale](self, "renderScale");
  v58 = v57;
  v59 = [NUImageGeometry alloc];
  objc_msgSend(v55, "extent");
  v60 = objc_msgSend(v55, "orientation");
  -[NURenderJob resolvedSpaceMap](self, "resolvedSpaceMap");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = -[NUImageGeometry initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:](v59, "initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:", v153, v56, v58, v60, v61, objc_msgSend(v55, "roundingPolicy"));
  -[NURenderJob setOutputGeometry:](self, "setOutputGeometry:", v62);

  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
  v63 = (void *)_NUScheduleLogger;
  v12 = v151;
  if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
  {
    v99 = v63;
    -[NURenderJob outputGeometry](self, "outputGeometry");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v155 = v100;
    _os_log_debug_impl(&dword_1A6553000, v99, OS_LOG_TYPE_DEBUG, "Output geometry: %@", buf, 0xCu);

  }
LABEL_61:
  if (!v12)
  {
LABEL_84:
    -[NURenderJob dependentJobs](self, "dependentJobs");
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (v74)
      -[NURenderJob setDependentJobs:](self, "setDependentJobs:", 0);
    if (!v6)
      goto LABEL_91;
    -[NURenderJob renderNode](self, "renderNode");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "outputImage:", v3);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderJob setOutputImage:](self, "setOutputImage:", v76);

    -[NURenderJob outputImage](self, "outputImage");
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v77)
      return 0;
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
    v78 = (void *)_NUScheduleLogger;
    if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
    {
      v104 = v78;
      -[NURenderJob outputImage](self, "outputImage");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "debugDescription");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v155 = v106;
      _os_log_debug_impl(&dword_1A6553000, v104, OS_LOG_TYPE_DEBUG, "Output image: %@", buf, 0xCu);

      if (v8)
        goto LABEL_92;
    }
    else
    {
LABEL_91:
      if (v8)
      {
LABEL_92:
        -[NURenderJob renderNode](self, "renderNode");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "outputVideo:", v3);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        -[NURenderJob setOutputVideo:](self, "setOutputVideo:", v80);

        -[NURenderJob outputVideo](self, "outputVideo");
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        if (v81)
        {
          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
          v82 = (void *)_NUScheduleLogger;
          if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
          {
            v109 = v82;
            -[NURenderJob outputVideo](self, "outputVideo");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v155 = v110;
            _os_log_debug_impl(&dword_1A6553000, v109, OS_LOG_TYPE_DEBUG, "Output video: %@", buf, 0xCu);

          }
          if (!-[NURenderJob requiresVideoComposition](self, "requiresVideoComposition")
            || (-[NURenderJob generateVideoComposition:](self, "generateVideoComposition:", v3),
                v83 = (void *)objc_claimAutoreleasedReturnValue(),
                -[NURenderJob setOutputVideoComposition:](self, "setOutputVideoComposition:", v83),
                v83,
                -[NURenderJob outputVideoComposition](self, "outputVideoComposition"),
                v84 = (void *)objc_claimAutoreleasedReturnValue(),
                v84,
                v84))
          {
            if (_NULogOnceToken != -1)
              dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
            v85 = (void *)_NUScheduleLogger;
            if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
            {
              v113 = v85;
              -[NURenderJob outputVideoComposition](self, "outputVideoComposition");
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v155 = v114;
              _os_log_debug_impl(&dword_1A6553000, v113, OS_LOG_TYPE_DEBUG, "Output video composition: %@", buf, 0xCu);

            }
            -[NURenderJob prepareNode](self, "prepareNode");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = objc_msgSend(v86, "requiresAudioMix");

            if (!v87)
              goto LABEL_107;
            -[NURenderJob renderNode](self, "renderNode");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = objc_msgSend(v88, "shouldInvalidateCachedAudioMix");

            if (v89)
            {
              -[NURenderJob renderNode](self, "renderNode");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "invalidateCachedAudioMix");

            }
            -[NURenderJob renderNode](self, "renderNode");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "outputAudioMix:", v3);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            -[NURenderJob setOutputAudioMix:](self, "setOutputAudioMix:", v92);

            -[NURenderJob outputAudioMix](self, "outputAudioMix");
            v93 = (void *)objc_claimAutoreleasedReturnValue();

            if (v93)
            {
LABEL_107:
              if (_NULogOnceToken != -1)
                dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
              v94 = (void *)_NUScheduleLogger;
              if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
              {
                v115 = v94;
                -[NURenderJob outputAudioMix](self, "outputAudioMix");
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v155 = v116;
                _os_log_debug_impl(&dword_1A6553000, v115, OS_LOG_TYPE_DEBUG, "Output audio mix: %@", buf, 0xCu);

              }
              goto LABEL_111;
            }
          }
        }
        return 0;
      }
    }
LABEL_111:
    -[NURenderJob _checkForMemoizedResult](self, "_checkForMemoizedResult");
    return 1;
  }
  if (v8)
  {
    v64 = 2;
  }
  else if (-[NURenderJob wantsOutputImage](self, "wantsOutputImage"))
  {
    v64 = 1;
  }
  else
  {
    if (!-[NURenderJob wantsOutputVideoFrame](self, "wantsOutputVideoFrame"))
    {
      NUAssertLogger_19521();
      v133 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("needsRenderNode but unable to compute renderMode"));
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v155 = v134;
        _os_log_error_impl(&dword_1A6553000, v133, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v135 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_19521();
      v136 = objc_claimAutoreleasedReturnValue();
      v137 = os_log_type_enabled(v136, OS_LOG_TYPE_ERROR);
      if (v135)
      {
        if (v137)
        {
          v140 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v141 = (void *)MEMORY[0x1E0CB3978];
          v142 = v140;
          objc_msgSend(v141, "callStackSymbols");
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v143, "componentsJoinedByString:", CFSTR("\n"));
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v155 = v140;
          v156 = 2114;
          v157 = v144;
          _os_log_error_impl(&dword_1A6553000, v136, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v137)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "componentsJoinedByString:", CFSTR("\n"));
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v155 = v139;
        _os_log_error_impl(&dword_1A6553000, v136, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"-[NURenderJob prepare:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1111, CFSTR("needsRenderNode but unable to compute renderMode"), v145, v146, v147, v148, v149);
    }
    v64 = 3;
  }
  v65 = -[NURenderJob newRenderPipelineStateForEvaluationMode:](self, "newRenderPipelineStateForEvaluationMode:", v64);
  -[NURenderJob renderNodeWithPipelineState:error:](self, "renderNodeWithPipelineState:error:", v65, v3);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderJob setRenderNode:](self, "setRenderNode:", v66);

  -[NURenderJob renderNode](self, "renderNode");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v67)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
    v68 = (void *)_NUScheduleLogger;
    if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
    {
      v101 = v68;
      -[NURenderJob renderNode](self, "renderNode");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "debugDescription");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v155 = v103;
      _os_log_debug_impl(&dword_1A6553000, v101, OS_LOG_TYPE_DEBUG, "Render node:\n%@", buf, 0xCu);

    }
    -[NURenderJob dependentJobs](self, "dependentJobs");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (v69
      || (-[NURenderJob evaluateRenderDependencies:](self, "evaluateRenderDependencies:", v3),
          v70 = (void *)objc_claimAutoreleasedReturnValue(),
          -[NURenderJob setDependentJobs:](self, "setDependentJobs:", v70),
          v70,
          -[NURenderJob dependentJobs](self, "dependentJobs"),
          v71 = (void *)objc_claimAutoreleasedReturnValue(),
          v71,
          v71))
    {
      if (-[NURenderJob _shouldWaitForDependentJobs](self, "_shouldWaitForDependentJobs"))
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
        v72 = (void *)_NUScheduleLogger;
        if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
        {
          v111 = v72;
          -[NURenderJob dependentJobs](self, "dependentJobs");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v155 = v112;
          _os_log_debug_impl(&dword_1A6553000, v111, OS_LOG_TYPE_DEBUG, "Render dependent jobs: %@", buf, 0xCu);

        }
        v73 = 1;
        goto LABEL_82;
      }

      goto LABEL_84;
    }
  }
  v73 = 0;
LABEL_82:

  return v73;
}

- (id)evaluateRenderDependencies:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[NURenderJob renderNode](self, "renderNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderJob request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "evaluateRenderDependenciesWithRequest:error:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)validateComposition:(id *)a3
{
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
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
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_19521();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v10;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_19521();
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
        *(_DWORD *)buf = 138543618;
        v26 = v16;
        v27 = 2114;
        v28 = v20;
        _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v15;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob validateComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1205, CFSTR("Invalid parameter not satisfying: %s"), v21, v22, v23, v24, (uint64_t)"error != nil");
  }
  v3 = a3;
  -[NURenderJob request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalComposition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "schema");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v6, "validateComposition:error:", v5, v3);

  if ((_DWORD)v3)
    v7 = v5;
  else
    v7 = 0;

  return v7;
}

- (id)pipelineForComposition:(id)a3 error:(id *)a4
{
  id v5;
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
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!a4)
  {
    NUAssertLogger_19521();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_19521();
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
        v28 = v18;
        v29 = 2114;
        v30 = v22;
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
      v28 = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob pipelineForComposition:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1221, CFSTR("Invalid parameter not satisfying: %s"), v23, v24, v25, v26, (uint64_t)"error != nil");
  }
  v6 = v5;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NURenderPipelineRegistry sharedRegistry](NURenderPipelineRegistry, "sharedRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "renderPipelineForIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("No NURenderPipeline registered"), v7);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)prepareNodeWithPipelineState:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v14;
  void *v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
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
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_19521();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "pipelineState != nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v15;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_19521();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v22 = (void *)MEMORY[0x1E0CB3978];
        v23 = v21;
        objc_msgSend(v22, "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v21;
        v32 = 2114;
        v33 = v25;
        _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v20;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob prepareNodeWithPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1235, CFSTR("Invalid parameter not satisfying: %s"), v26, v27, v28, v29, (uint64_t)"pipelineState != nil");
  }
  v7 = v6;
  -[NURenderJob composition](self, "composition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[NURenderJob validateComposition:](self, "validateComposition:", a4);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v12 = 0;
      goto LABEL_10;
    }
    v8 = (void *)v9;
    -[NURenderJob setComposition:](self, "setComposition:", v9);
  }
  -[NURenderJob renderPipeline](self, "renderPipeline");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    -[NURenderJob pipelineForComposition:error:](self, "pipelineForComposition:error:", v8, a4);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v12 = 0;
      goto LABEL_9;
    }
    v10 = (void *)v11;
    -[NURenderJob setRenderPipeline:](self, "setRenderPipeline:", v11);
  }
  -[NURenderJob evaluateComposition:pipeline:pipelineState:error:](self, "evaluateComposition:pipeline:pipelineState:error:", v8, v10, v7, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
LABEL_10:

  return v12;
}

- (id)evaluateComposition:(id)a3 pipeline:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[NURenderJob extentPolicy](self, "extentPolicy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "processedRenderNodeForComposition:pipelineState:extentPolicy:error:", v12, v10, v13, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)evaluateOutputGeometry:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
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
  _BYTE v25[12];
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[NURenderJob prepareNode](self, "prepareNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    NUAssertLogger_19521();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing prepare node"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v25 = 138543362;
      *(_QWORD *)&v25[4] = v10;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v25, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_19521();
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
        *(_DWORD *)v25 = 138543618;
        *(_QWORD *)&v25[4] = v16;
        v26 = 2114;
        v27 = v20;
        _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v25, 0x16u);

      }
    }
    else if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v25 = 138543362;
      *(_QWORD *)&v25[4] = v15;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v25, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob evaluateOutputGeometry:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1272, CFSTR("Missing prepare node"), v21, v22, v23, v24, *(uint64_t *)v25);
  }
  -[NURenderJob prepareNode](self, "prepareNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "outputImageGeometry:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)renderNodeWithPipelineState:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v12;
  void *v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
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
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_19521();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "pipelineState != nil");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v62 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_19521();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v34 = (void *)MEMORY[0x1E0CB3978];
        v35 = v33;
        objc_msgSend(v34, "callStackSymbols");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v62 = v33;
        v63 = 2114;
        v64 = v37;
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
      v62 = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob renderNodeWithPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1281, CFSTR("Invalid parameter not satisfying: %s"), v38, v39, v40, v41, (uint64_t)"pipelineState != nil");
  }
  if (!a4)
  {
    NUAssertLogger_19521();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v62 = v20;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_19521();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v21)
    {
      if (v23)
      {
        v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v43 = (void *)MEMORY[0x1E0CB3978];
        v44 = v42;
        objc_msgSend(v43, "callStackSymbols");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v62 = v42;
        v63 = 2114;
        v64 = v46;
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
      v62 = v25;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob renderNodeWithPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1282, CFSTR("Invalid parameter not satisfying: %s"), v47, v48, v49, v50, (uint64_t)"error != NULL");
  }
  v7 = v6;
  -[NURenderJob prepareNode](self, "prepareNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    NUAssertLogger_19521();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing prepare node"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v62 = v27;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_19521();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v52 = (void *)MEMORY[0x1E0CB3978];
        v53 = v51;
        objc_msgSend(v52, "callStackSymbols");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v62 = v51;
        v63 = 2114;
        v64 = v55;
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
      v62 = v32;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob renderNodeWithPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1285, CFSTR("Missing prepare node"), v56, v57, v58, v59, v60);
  }
  -[NURenderJob prepareNode](self, "prepareNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nodeByReplayingAgainstCache:error:", v7, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)requiresVideoComposition
{
  void *v3;
  void *v4;
  char v5;
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
  _BYTE v23[12];
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[NURenderJob prepareNode](self, "prepareNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    NUAssertLogger_19521();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing prepare node"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v23 = 138543362;
      *(_QWORD *)&v23[4] = v8;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v23, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_19521();
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
        *(_DWORD *)v23 = 138543618;
        *(_QWORD *)&v23[4] = v14;
        v24 = 2114;
        v25 = v18;
        _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v23, 0x16u);

      }
    }
    else if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v23 = 138543362;
      *(_QWORD *)&v23[4] = v13;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v23, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob requiresVideoComposition]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1294, CFSTR("Missing prepare node"), v19, v20, v21, v22, *(uint64_t *)v23);
  }
  -[NURenderJob prepareNode](self, "prepareNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "requiresVideoComposition");

  return v5;
}

- (id)generateVideoComposition:(id *)a3
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
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *specific;
  NSObject *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
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
  void *v63;
  id v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  -[NURenderJob renderNode](self, "renderNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    NUAssertLogger_19521();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing render node"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v74 = v40;
      _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_19521();
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v43)
      {
        v53 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v54 = (void *)MEMORY[0x1E0CB3978];
        v55 = v53;
        objc_msgSend(v54, "callStackSymbols");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "componentsJoinedByString:", CFSTR("\n"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v74 = v53;
        v75 = 2114;
        v76 = v57;
        _os_log_error_impl(&dword_1A6553000, v42, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v43)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v74 = v45;
      _os_log_error_impl(&dword_1A6553000, v42, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob generateVideoComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1304, CFSTR("Missing render node"), v58, v59, v60, v61, v71);
  }
  -[NURenderJob renderNode](self, "renderNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "outputVideoComposition:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NURenderJob outputGeometry](self, "outputGeometry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    NUAssertLogger_19521();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing output geometry"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v74 = v47;
      _os_log_error_impl(&dword_1A6553000, v46, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_19521();
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
    if (v48)
    {
      if (v50)
      {
        v62 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v63 = (void *)MEMORY[0x1E0CB3978];
        v64 = v62;
        objc_msgSend(v63, "callStackSymbols");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "componentsJoinedByString:", CFSTR("\n"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v74 = v62;
        v75 = 2114;
        v76 = v66;
        _os_log_error_impl(&dword_1A6553000, v49, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v50)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "componentsJoinedByString:", CFSTR("\n"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v74 = v52;
      _os_log_error_impl(&dword_1A6553000, v49, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob generateVideoComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1310, CFSTR("Missing output geometry"), v67, v68, v69, v70, v71);
  }
  v9 = (void *)objc_msgSend(v7, "mutableCopy");
  -[NURenderJob outputGeometry](self, "outputGeometry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "scaledSize");
  v13 = v12;

  if (((v11 | v13) & 1) != 0)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_845);
    v14 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = v14;
      -[NURenderJob outputGeometry](self, "outputGeometry");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NURenderJob prepareNode](self, "prepareNode");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("Expected even dimensions for the video composition. Geometry: %@ PrepareNode: %@"), v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v74 = v19;
      _os_log_impl(&dword_1A6553000, v16, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      v20 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v20 != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_845);
LABEL_11:
        v21 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v23 = (void *)MEMORY[0x1E0CB3978];
          v24 = v22;
          v25 = v21;
          objc_msgSend(v23, "callStackSymbols");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v74 = v22;
          v75 = 2114;
          v76 = v27;
          _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_19:
          goto LABEL_16;
        }
        goto LABEL_16;
      }
      if (v20 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_845);
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_11;
    }
    v28 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      v36 = (void *)MEMORY[0x1E0CB3978];
      v25 = v28;
      objc_msgSend(v36, "callStackSymbols");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v74 = v38;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_19;
    }
LABEL_16:
    -[NURenderJob outputGeometry](self, "outputGeometry");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderJob prepareNode](self, "prepareNode");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    _NUAssertContinueHandler((uint64_t)"-[NURenderJob generateVideoComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1317, CFSTR("Expected even dimensions for the video composition. Geometry: %@ PrepareNode: %@"), v30, v31, v32, v33, (uint64_t)v29);

    v11 = NUEvenPixelSize(v11, v13);
    v13 = v34;
  }
  objc_msgSend(v9, "setRenderSize:", (double)v11, (double)v13);

  return v9;
}

- (BOOL)render:(id *)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *specific;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  objc_class *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_845);
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v8;
    _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v9 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v9 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_845);
      goto LABEL_8;
    }
    if (v9 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_845);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v10 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v11 = (void *)MEMORY[0x1E0CB3978];
    v12 = v10;
    objc_msgSend(v11, "callStackSymbols");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v14;
    _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v15 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v17 = (void *)MEMORY[0x1E0CB3978];
  v18 = specific;
  v12 = v15;
  objc_msgSend(v17, "callStackSymbols");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v28 = specific;
  v29 = 2114;
  v30 = v20;
  _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v21 = (objc_class *)objc_opt_class();
  NSStringFromClass(v21);
  v22 = objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NURenderJob render:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1328, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v23, v24, v25, v26, v22);
}

- (BOOL)complete:(id *)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *specific;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  objc_class *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_845);
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v8;
    _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v9 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v9 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_845);
      goto LABEL_8;
    }
    if (v9 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_845);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v10 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v11 = (void *)MEMORY[0x1E0CB3978];
    v12 = v10;
    objc_msgSend(v11, "callStackSymbols");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v14;
    _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v15 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v17 = (void *)MEMORY[0x1E0CB3978];
  v18 = specific;
  v12 = v15;
  objc_msgSend(v17, "callStackSymbols");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v28 = specific;
  v29 = 2114;
  v30 = v20;
  _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v21 = (objc_class *)objc_opt_class();
  NSStringFromClass(v21);
  v22 = objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NURenderJob complete:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1333, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v23, v24, v25, v26, v22);
}

- (void)fail:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *stateQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    -[NURenderJob request](self, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("unknown error"), v6);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
  v7 = _NUScheduleLogger;
  if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Rendering failure, error %@", buf, 0xCu);
  }
  stateQueue = self->_stateQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __20__NURenderJob_fail___block_invoke;
  v10[3] = &unk_1E5063FB8;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_sync(stateQueue, v10);

}

- (BOOL)failed
{
  NSObject *stateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __21__NURenderJob_failed__block_invoke;
  v5[3] = &unk_1E5063FE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSError)error
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__19500;
  v10 = __Block_byref_object_dispose__19501;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __20__NURenderJob_error__block_invoke;
  v5[3] = &unk_1E5063FE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

- (void)addStageObserver:(id)a3 queue:(id)a4 block:(id)a5
{
  -[NUObservatory addObserver:forKey:queue:block:](self->_observatory, "addObserver:forKey:queue:block:", a3, -1, a4, a5);
}

- (void)addCancelObserver:(id)a3 queue:(id)a4 block:(id)a5
{
  -[NUObservatory addObserver:forKey:queue:block:](self->_observatory, "addObserver:forKey:queue:block:", a3, -2, a4, a5);
}

- (void)removeObserver:(id)a3
{
  -[NUObservatory removeObserver:](self->_observatory, "removeObserver:", a3);
}

- (void)_notifyStageTransition:(int64_t)a3
{
  NUObservatory *observatory;
  _QWORD v4[6];

  observatory = self->_observatory;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__NURenderJob__notifyStageTransition___block_invoke;
  v4[3] = &unk_1E5063210;
  v4[4] = self;
  v4[5] = a3;
  -[NUObservatory notifyAllObserversForKey:withBlock:](observatory, "notifyAllObserversForKey:withBlock:", -1, v4);
}

- (void)_notifyCanceled:(int64_t)a3
{
  NUObservatory *observatory;
  _QWORD v4[6];

  observatory = self->_observatory;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31__NURenderJob__notifyCanceled___block_invoke;
  v4[3] = &unk_1E5063210;
  v4[4] = self;
  v4[5] = a3;
  -[NUObservatory notifyAllObserversForKey:withBlock:](observatory, "notifyAllObserversForKey:withBlock:", -2, v4);
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (NURenderStatistics)statistics
{
  return (NURenderStatistics *)self->_stats;
}

- (NSDate)jobCreationDate
{
  return self->_jobCreationDate;
}

- (NURenderRequest)request
{
  return (NURenderRequest *)objc_getProperty(self, a2, 80, 1);
}

- (unint64_t)jobNumber
{
  return self->_jobNumber;
}

- (NSArray)dependentJobs
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDependentJobs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)isAborted
{
  return self->_isAborted;
}

- (NURenderNode)prepareNode
{
  return self->_prepareNode;
}

- (void)setPrepareNode:(id)a3
{
  objc_storeStrong((id *)&self->_prepareNode, a3);
}

- (NURenderNode)renderNode
{
  return self->_renderNode;
}

- (void)setRenderNode:(id)a3
{
  objc_storeStrong((id *)&self->_renderNode, a3);
}

- (NUImageGeometry)outputGeometry
{
  return self->_outputGeometry;
}

- (void)setOutputGeometry:(id)a3
{
  objc_storeStrong((id *)&self->_outputGeometry, a3);
}

- (OS_dispatch_group)replyGroup
{
  return self->_replyGroup;
}

- (void)setReplyGroup:(id)a3
{
  objc_storeStrong((id *)&self->_replyGroup, a3);
}

- (BOOL)shouldWriteJobDebugFile
{
  return self->_shouldWriteJobDebugFile;
}

- (void)setShouldWriteJobDebugFile:(BOOL)a3
{
  self->_shouldWriteJobDebugFile = a3;
}

- (NSString)nodeCacheAtStartOfJob
{
  return self->_nodeCacheAtStartOfJob;
}

- (void)setNodeCacheAtStartOfJob:(id)a3
{
  objc_storeStrong((id *)&self->_nodeCacheAtStartOfJob, a3);
}

- (NUDevice)device
{
  return self->_device;
}

- (int)rendererType
{
  return self->_rendererType;
}

- (NUComposition)composition
{
  return self->_composition;
}

- (void)setComposition:(id)a3
{
  objc_storeStrong((id *)&self->_composition, a3);
}

- (NURenderPipeline)renderPipeline
{
  return self->_renderPipeline;
}

- (void)setRenderPipeline:(id)a3
{
  objc_storeStrong((id *)&self->_renderPipeline, a3);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)renderScale
{
  int64_t denominator;
  int64_t numerator;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  denominator = self->_renderScale.denominator;
  numerator = self->_renderScale.numerator;
  result.var1 = denominator;
  result.var0 = numerator;
  return result;
}

- (void)setRenderScale:(id)a3
{
  self->_renderScale = ($F9703ADC4DD3124DE91DE417D7636CC9)a3;
}

- (NUGeometrySpaceMap)resolvedSpaceMap
{
  return self->_resolvedSpaceMap;
}

- (void)setResolvedSpaceMap:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedSpaceMap, a3);
}

- (NUImageGeometry)fullSizeGeometry
{
  return self->_fullSizeGeometry;
}

- (void)setFullSizeGeometry:(id)a3
{
  objc_storeStrong((id *)&self->_fullSizeGeometry, a3);
}

- (CIImage)outputImage
{
  return self->_outputImage;
}

- (void)setOutputImage:(id)a3
{
  objc_storeStrong((id *)&self->_outputImage, a3);
}

- (AVComposition)outputVideo
{
  return self->_outputVideo;
}

- (void)setOutputVideo:(id)a3
{
  objc_storeStrong((id *)&self->_outputVideo, a3);
}

- (AVVideoComposition)outputVideoComposition
{
  return self->_outputVideoComposition;
}

- (void)setOutputVideoComposition:(id)a3
{
  objc_storeStrong((id *)&self->_outputVideoComposition, a3);
}

- (AVAudioMix)outputAudioMix
{
  return self->_outputAudioMix;
}

- (void)setOutputAudioMix:(id)a3
{
  objc_storeStrong((id *)&self->_outputAudioMix, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputAudioMix, 0);
  objc_storeStrong((id *)&self->_outputVideoComposition, 0);
  objc_storeStrong((id *)&self->_outputVideo, 0);
  objc_storeStrong((id *)&self->_outputImage, 0);
  objc_storeStrong((id *)&self->_fullSizeGeometry, 0);
  objc_storeStrong((id *)&self->_resolvedSpaceMap, 0);
  objc_storeStrong((id *)&self->_renderPipeline, 0);
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_nodeCacheAtStartOfJob, 0);
  objc_storeStrong((id *)&self->_replyGroup, 0);
  objc_storeStrong((id *)&self->_outputGeometry, 0);
  objc_storeStrong((id *)&self->_renderNode, 0);
  objc_storeStrong((id *)&self->_prepareNode, 0);
  objc_storeStrong((id *)&self->_dependentJobs, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_memoizationCacheKey, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_jobCreationDate, 0);
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_observatory, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
}

uint64_t __31__NURenderJob__notifyCanceled___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __38__NURenderJob__notifyStageTransition___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __20__NURenderJob_error__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

uint64_t __21__NURenderJob_failed__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 49);
  return result;
}

void __20__NURenderJob_fail___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

uint64_t __21__NURenderJob_reply___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 51) = 1;
  return result;
}

void __21__NURenderJob_reply___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1A85C1390]();
  objc_msgSend(*(id *)(a1 + 32), "_reply:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

uint64_t __24__NURenderJob_succeeded__block_invoke(uint64_t result)
{
  _BYTE *v1;
  BOOL v2;

  v1 = *(_BYTE **)(result + 32);
  v2 = v1[66] && !v1[65] && v1[49] == 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  return result;
}

uint64_t __21__NURenderJob_finish__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finish");
}

void __21__NURenderJob_resume__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__NURenderJob_resume__block_invoke_2;
  block[3] = &unk_1E5064008;
  block[4] = v1;
  dispatch_sync(v2, block);
}

uint64_t __21__NURenderJob_resume__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resume");
}

void __20__NURenderJob_pause__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __20__NURenderJob_pause__block_invoke_2;
  block[3] = &unk_1E5064008;
  block[4] = v1;
  dispatch_sync(v2, block);
}

uint64_t __20__NURenderJob_pause__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pause");
}

uint64_t __34__NURenderJob__cancelCoalescedJob__block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 65);
  __dmb(0xBu);
  result = objc_msgSend(*(id *)(a1 + 32), "_shouldCancelCoalescedJob");
  if ((_DWORD)result)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
    v3 = (void *)_NUScheduleLogger;
    if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(void **)(a1 + 32);
      v6 = v3;
      objc_msgSend(v5, "request");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 134218242;
      v10 = v5;
      v11 = 2114;
      v12 = v8;
      _os_log_debug_impl(&dword_1A6553000, v6, OS_LOG_TYPE_DEBUG, "job %p %{public}@ cancel (coalesced)", (uint8_t *)&v9, 0x16u);

    }
    result = objc_msgSend(*(id *)(a1 + 32), "_atomicCancel");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    *(_BYTE *)(v4 + 34) = BYTE2(result);
    *(_WORD *)(v4 + 32) = result;
  }
  return result;
}

uint64_t __33__NURenderJob_cancelCoalescedJob__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_cancelCoalescedJob");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __22__NURenderJob__cancel__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
  v2 = (void *)_NUScheduleLogger;
  if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v2;
    objc_msgSend(v5, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134218242;
    v10 = v5;
    v11 = 2114;
    v12 = v8;
    _os_log_debug_impl(&dword_1A6553000, v6, OS_LOG_TYPE_DEBUG, "job %p %{public}@ cancel", (uint8_t *)&v9, 0x16u);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 65);
  __dmb(0xBu);
  result = objc_msgSend(*(id *)(a1 + 32), "_atomicCancel");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  *(_BYTE *)(v4 + 34) = BYTE2(result);
  *(_WORD *)(v4 + 32) = result;
  return result;
}

uint64_t __21__NURenderJob_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

uint64_t __25__NURenderJob_isFinished__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 66);
  return result;
}

uint64_t __25__NURenderJob_isCanceled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 65);
  return result;
}

uint64_t __27__NURenderJob_currentStage__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 72);
  return result;
}

uint64_t __21__NURenderJob_didRun__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 0;
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldWaitForDependentJobs") & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "renderJob:didRunStage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  result = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(result + 72) == 1)
  {
    objc_msgSend((id)result, "_didPrepare");
    result = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(result + 48))
  {
    result = objc_msgSend(*(id *)(result + 80), "shouldCoalesceUpdates");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result ^ 1;
LABEL_9:
    v3 = a1 + 48;
LABEL_10:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v3 + 8) + 24) = 1;
    goto LABEL_11;
  }
  if (*(_BYTE *)(result + 49))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    goto LABEL_9;
  }
  v4 = objc_msgSend((id)result, "_nextStageForStage:", *(_QWORD *)(result + 72));
  result = objc_msgSend(*(id *)(a1 + 32), "_setCurrentStage:", v4);
  if (v4 == 6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v3 = a1 + 40;
    goto LABEL_10;
  }
LABEL_11:
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 51))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

void __22__NURenderJob_willRun__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 66) || *(_BYTE *)(v2 + 65))
  {
    v3 = 0;
  }
  else
  {
    if (*(_QWORD *)(v2 + 72) == 3)
    {
      *(_QWORD *)(v2 + 72) = 1;
      v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend(*(id *)(a1 + 32), "dependentJobs");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "dependentJobs", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "statistics");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v12);

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v9);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDependencies:", v6);
    }
    else
    {
      objc_msgSend(*(id *)(v2 + 24), "renderJob:willRunStage:");
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 1;
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
}

uint64_t __19__NURenderJob_run___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_run:", *(_QWORD *)(a1 + 40));
}

+ (void)flushCache
{
  id v2;

  +[NURenderResultCache shared](NURenderResultCache, "shared");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flush");

}

- (BOOL)renderVideoFrames:(id)a3 videoMetadataSamples:(id)a4 videoSampleSlices:(id)a5 intoPixelBuffer:(__CVBuffer *)a6 time:(id *)a7 colorSpace:(id)a8 playbackDirection:(int64_t)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  unsigned int v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  id v53;
  NSObject *v54;
  void *v55;
  NSObject *v56;
  __CFString *v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  NSObject *v63;
  void *v64;
  void *specific;
  NSObject *v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  _BOOL4 v74;
  void *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  _BOOL4 v81;
  void *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  NSObject *v87;
  _BOOL4 v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  void *v119;
  id v120;
  void *v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  NURenderJob *v128;
  void *v129;
  id v130;
  id v131;
  id v132;
  __CVBuffer *allocator;
  const __CFAllocator *allocatora;
  id v135;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v136;
  os_signpost_id_t spid;
  void *v138;
  __int128 v139;
  __int128 v140;
  unint64_t v141;
  id v142;
  id v143;
  __int128 v144;
  int64_t var3;
  _OWORD v146[2];
  _BYTE buf[34];
  uint64_t v148;

  v148 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a8;
  if (!a6)
  {
    NUAssertLogger_19521();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "destination != NULL");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v64;
      _os_log_error_impl(&dword_1A6553000, v63, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_19521();
    v66 = objc_claimAutoreleasedReturnValue();
    v67 = os_log_type_enabled(v66, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v67)
      {
        v91 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v92 = (void *)MEMORY[0x1E0CB3978];
        v93 = v91;
        objc_msgSend(v92, "callStackSymbols");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "componentsJoinedByString:", CFSTR("\n"));
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v91;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v95;
        _os_log_error_impl(&dword_1A6553000, v66, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v67)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "componentsJoinedByString:", CFSTR("\n"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v69;
      _os_log_error_impl(&dword_1A6553000, v66, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob(VideoSupport) renderVideoFrames:videoMetadataSamples:videoSampleSlices:intoPixelBuffer:time:colorSpace:playbackDirection:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1482, CFSTR("Invalid parameter not satisfying: %s"), v96, v97, v98, v99, (uint64_t)"destination != NULL");
  }
  if (!a10)
  {
    NUAssertLogger_19521();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v71;
      _os_log_error_impl(&dword_1A6553000, v70, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v72 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_19521();
    v73 = objc_claimAutoreleasedReturnValue();
    v74 = os_log_type_enabled(v73, OS_LOG_TYPE_ERROR);
    if (v72)
    {
      if (v74)
      {
        v100 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v101 = (void *)MEMORY[0x1E0CB3978];
        v102 = v100;
        objc_msgSend(v101, "callStackSymbols");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "componentsJoinedByString:", CFSTR("\n"));
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v100;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v104;
        _os_log_error_impl(&dword_1A6553000, v73, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v74)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "componentsJoinedByString:", CFSTR("\n"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v76;
      _os_log_error_impl(&dword_1A6553000, v73, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob(VideoSupport) renderVideoFrames:videoMetadataSamples:videoSampleSlices:intoPixelBuffer:time:colorSpace:playbackDirection:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1483, CFSTR("Invalid parameter not satisfying: %s"), v105, v106, v107, v108, (uint64_t)"error != NULL");
  }
  if (!v16)
  {
    NUAssertLogger_19521();
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "videoFrames != nil");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v78;
      _os_log_error_impl(&dword_1A6553000, v77, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v79 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_19521();
    v80 = objc_claimAutoreleasedReturnValue();
    v81 = os_log_type_enabled(v80, OS_LOG_TYPE_ERROR);
    if (v79)
    {
      if (v81)
      {
        v109 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v110 = (void *)MEMORY[0x1E0CB3978];
        v111 = v109;
        objc_msgSend(v110, "callStackSymbols");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "componentsJoinedByString:", CFSTR("\n"));
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v109;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v113;
        _os_log_error_impl(&dword_1A6553000, v80, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v81)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "componentsJoinedByString:", CFSTR("\n"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v83;
      _os_log_error_impl(&dword_1A6553000, v80, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob(VideoSupport) renderVideoFrames:videoMetadataSamples:videoSampleSlices:intoPixelBuffer:time:colorSpace:playbackDirection:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1484, CFSTR("Invalid parameter not satisfying: %s"), v114, v115, v116, v117, (uint64_t)"videoFrames != nil");
  }
  if ((a7->var2 & 1) == 0)
  {
    NUAssertLogger_19521();
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "CMTIME_IS_VALID(time)");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v85;
      _os_log_error_impl(&dword_1A6553000, v84, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v86 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_19521();
    v87 = objc_claimAutoreleasedReturnValue();
    v88 = os_log_type_enabled(v87, OS_LOG_TYPE_ERROR);
    if (v86)
    {
      if (v88)
      {
        v118 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v119 = (void *)MEMORY[0x1E0CB3978];
        v120 = v118;
        objc_msgSend(v119, "callStackSymbols");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "componentsJoinedByString:", CFSTR("\n"));
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v118;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v122;
        _os_log_error_impl(&dword_1A6553000, v87, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v88)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "componentsJoinedByString:", CFSTR("\n"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v90;
      _os_log_error_impl(&dword_1A6553000, v87, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob(VideoSupport) renderVideoFrames:videoMetadataSamples:videoSampleSlices:intoPixelBuffer:time:colorSpace:playbackDirection:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1485, CFSTR("Invalid parameter not satisfying: %s"), v123, v124, v125, v126, (uint64_t)"CMTIME_IS_VALID(time)");
  }
  v20 = v19;
  allocator = a6;
  -[NURenderJob renderer:](self, "renderer:", a10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = v18;
    v136 = a7;
    v23 = v20;
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
    v24 = (id)_NUScheduleLogger;
    v25 = os_signpost_id_generate(v24);
    v26 = v24;
    v27 = v26;
    spid = v25;
    v141 = v25 - 1;
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6553000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "RenderVideoFrames", (const char *)&unk_1A6745721, buf, 2u);
    }

    v28 = -[NURenderJob newRenderPipelineStateForEvaluationMode:](self, "newRenderPipelineStateForEvaluationMode:", 3);
    v29 = -[NURenderJob renderScale](self, "renderScale");
    objc_msgSend(v28, "setScale:", v29, v30);
    objc_msgSend(v28, "setVideoFrames:", v16);
    objc_msgSend(v28, "setVideoMetadataSamples:", v17);
    v20 = v23;
    v18 = v22;
    if (v22)
      objc_msgSend(v28, "setVideoSampleSlices:", v22);
    v144 = *(_OWORD *)&v136->var0;
    var3 = v136->var3;
    objc_msgSend(v28, "setTime:", &v144);
    objc_msgSend(v28, "setPlaybackDirection:", a9);
    v135 = v28;
    -[NURenderJob renderNodeWithPipelineState:error:](self, "renderNodeWithPipelineState:error:", v28, a10);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (!v31)
    {
      LOBYTE(v33) = 0;
      v44 = v135;
LABEL_44:

      goto LABEL_45;
    }
    objc_msgSend(v31, "outputImage:", a10);
    v33 = objc_claimAutoreleasedReturnValue();
    v138 = (void *)v33;
    if (!v33)
    {
LABEL_43:
      v44 = v135;

      goto LABEL_44;
    }
    v131 = v17;
    v132 = v16;
    objc_msgSend(v20, "applyAttachmentsToCVPixelBuffer:", allocator);
    objc_msgSend((id)v33, "extent");
    *(_QWORD *)buf = v34;
    *(_QWORD *)&buf[8] = v35;
    *(_QWORD *)&buf[16] = v36;
    *(_QWORD *)&buf[24] = v37;
    NU::RectT<long>::RectT(v146, (CGRect *)buf, 0);
    v139 = v146[1];
    v140 = v146[0];
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDE8]), "initWithPixelBuffer:", allocator);
    v39 = (void *)MEMORY[0x1E0CB3940];
    -[NURenderJob request](self, "request");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "name");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringWithFormat:", CFSTR("%@-j%lld"), v41, -[NURenderJob jobNumber](self, "jobNumber"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setLabel:", v42);

    if (v20)
    {
      objc_msgSend(v38, "setColorSpace:", objc_msgSend(v20, "CGColorSpace"));
      v43 = objc_msgSend(v20, "isHDR") ^ 1;
    }
    else
    {
      if (!CGColorSpaceUsesITUR_2100TF((CGColorSpaceRef)objc_msgSend(v38, "colorSpace")))
        goto LABEL_22;
      v43 = 0;
    }
    objc_msgSend(v38, "setClamped:", v43);
LABEL_22:
    v127 = v32;
    v128 = self;
    v129 = v20;
    v130 = v18;
    v45 = 0;
    v46 = 0;
    allocatora = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v47 = v138;
    do
    {
      if (v45)
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
        v48 = (void *)_NUScheduleLogger;
        if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_ERROR))
        {
          *(_OWORD *)buf = *(_OWORD *)&v136->var0;
          *(_QWORD *)&buf[16] = v136->var3;
          v56 = v48;
          v57 = (__CFString *)CMTimeCopyDescription(allocatora, (CMTime *)buf);
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v57;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v45 + 1;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = 5;
          *(_WORD *)&buf[24] = 2112;
          *(_QWORD *)&buf[26] = v46;
          _os_log_error_impl(&dword_1A6553000, v56, OS_LOG_TYPE_ERROR, "Retrying video frame render at time %@: attempt %d of %d; previous error %@",
            buf,
            0x22u);

        }
        objc_msgSend(v21, "context");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "clearCaches");

      }
      v50 = v27;
      v51 = v50;
      if (v141 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6553000, v51, OS_SIGNPOST_EVENT, spid, "RenderVideoFrames", "StartingRender", buf, 2u);
      }

      v143 = 0;
      *(_OWORD *)buf = v140;
      *(_OWORD *)&buf[16] = v139;
      objc_msgSend(v21, "renderImage:rect:toDestination:atPoint:error:", v47, buf, v38, 0, 0, &v143);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v143;

      if (v52)
      {
        v142 = 0;
        objc_msgSend(v52, "nu_waitUntilCompletedAndReturnError:", &v142);
        v54 = v27;
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v142;

        LOBYTE(v33) = v55 != 0;
        v27 = v54;
        v47 = v138;
      }
      else
      {
        LOBYTE(v33) = 0;
        v46 = v53;
      }

      if (v45 > 3)
        break;
      ++v45;
    }
    while ((v33 & 1) == 0);
    v58 = v51;
    v59 = v58;
    if (v141 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v58))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6553000, v59, OS_SIGNPOST_INTERVAL_END, spid, "RenderVideoFrames", (const char *)&unk_1A6745721, buf, 2u);
    }

    v20 = v129;
    v32 = v127;
    if ((v33 & 1) == 0)
    {
      -[NURenderJob request](v128, "request");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = (void *)objc_msgSend(v60, "copy");
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to render frame. Task creation or completion failed"), v61, v46);
      *a10 = (id)objc_claimAutoreleasedReturnValue();

    }
    v17 = v131;
    v16 = v132;
    v18 = v130;
    goto LABEL_43;
  }
  LOBYTE(v33) = 0;
LABEL_45:

  return v33;
}

- (id)renderImage:(id)a3 into:(id)a4 colorSpace:(id)a5 roi:(id)a6 imageSize:(id)a7 error:(id *)a8
{
  return -[NURenderJob renderImage:into:colorSpace:roi:imageSize:alpha:error:](self, "renderImage:into:colorSpace:roi:imageSize:alpha:error:", a3, a4, a5, a6, a7.var0, a7.var1, 0, a8);
}

- (id)renderImage:(id)a3 into:(id)a4 colorSpace:(id)a5 roi:(id)a6 imageSize:(id)a7 alpha:(const unint64_t *)a8 error:(id *)a9
{
  int64_t var1;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v35;
  NSObject *v36;
  void *v37;
  void *specific;
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
  void *v52;
  NURenderJob *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  NURenderJob *v57;
  id v58;
  id v59;
  id v60;
  _BYTE *v61;
  uint64_t *v62;
  const unint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  __int128 v78;
  __int128 v79;
  uint8_t buf[4];
  NURenderJob *v81;
  __int16 v82;
  id v83;
  _BYTE v84[24];
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  uint64_t v88;

  var1 = a7.var1;
  v88 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (!a9)
  {
    NUAssertLogger_19521();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v84 = 138543362;
      *(_QWORD *)&v84[4] = v37;
      _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v84, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_19521();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    if (specific)
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
        *(_DWORD *)v84 = 138543618;
        *(_QWORD *)&v84[4] = v43;
        *(_WORD *)&v84[12] = 2114;
        *(_QWORD *)&v84[14] = v47;
        _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v84, 0x16u);

      }
    }
    else if (v40)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v84 = 138543362;
      *(_QWORD *)&v84[4] = v42;
      _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v84, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderJob(RendererSupport) renderImage:into:colorSpace:roi:imageSize:alpha:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1416, CFSTR("Invalid parameter not satisfying: %s"), v48, v49, v50, v51, (uint64_t)"error != NULL");
  }
  v18 = v17;
  v53 = self;
  -[NURenderJob renderer:](self, "renderer:", a9);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    v78 = 0u;
    v79 = 0u;
    if (v18)
    {
      objc_msgSend(v18, "bounds");
      v20 = *((_QWORD *)&v78 + 1);
      v19 = v78;
      v21 = *((_QWORD *)&v79 + 1);
      v22 = v79;
    }
    else
    {
      v21 = 0;
      v22 = 0;
      v20 = 0;
      v19 = 0;
    }
    objc_msgSend(v15, "size");
    v24 = v20 + v21;
    v25 = v15;
    v26 = var1 - v24;
    *(_QWORD *)v84 = 0;
    *(_QWORD *)&v84[8] = v84;
    v28 = v27 - v21;
    *(_QWORD *)&v84[16] = 0x3032000000;
    v85 = __Block_byref_object_copy__19500;
    v86 = __Block_byref_object_dispose__19501;
    v87 = 0;
    v72 = 0;
    v73 = &v72;
    v74 = 0x3032000000;
    v75 = __Block_byref_object_copy__19500;
    v76 = __Block_byref_object_dispose__19501;
    v77 = 0;
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __86__NURenderJob_RendererSupport__renderImage_into_colorSpace_roi_imageSize_alpha_error___block_invoke;
    v55[3] = &unk_1E5063238;
    v29 = v16;
    v56 = v29;
    v57 = v53;
    v52 = v25;
    v30 = v25;
    v63 = a8;
    v64 = v19;
    v65 = v26;
    v66 = v22;
    v67 = v21;
    v58 = v30;
    v61 = v84;
    v59 = v54;
    v68 = 0;
    v69 = v28;
    v70 = v22;
    v71 = v21;
    v60 = v14;
    v62 = &v72;
    objc_msgSend(v30, "useAsCIRenderDestinationWithRenderer:block:", v59, v55);
    if (*(_QWORD *)(*(_QWORD *)&v84[8] + 40))
    {
      objc_msgSend(v30, "setColorSpace:", v29);
      v23 = *(id *)(*(_QWORD *)&v84[8] + 40);
      v15 = v52;
    }
    else
    {
      -[NURenderJob request](v53, "request");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v31, "copy");
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("failed to prepare render"), v32, v73[5]);
      v15 = v52;
      *a9 = (id)objc_claimAutoreleasedReturnValue();

      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
      v33 = _NUScheduleLogger;
      if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_ERROR))
      {
        v35 = *a9;
        *(_DWORD *)buf = 134218242;
        v81 = v53;
        v82 = 2114;
        v83 = v35;
        _os_log_error_impl(&dword_1A6553000, v33, OS_LOG_TYPE_ERROR, "job %p render failed: %{public}@", buf, 0x16u);
      }
      v23 = 0;
    }

    _Block_object_dispose(&v72, 8);
    _Block_object_dispose(v84, 8);

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

BOOL __86__NURenderJob_RendererSupport__renderImage_into_colorSpace_roi_imageSize_alpha_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id *v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _BOOL8 v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *specific;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
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
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  id obj;
  _BYTE buf[32];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setColorSpace:", objc_msgSend(*(id *)(a1 + 32), "CGColorSpace"));
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 40), "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-j%lld"), v6, objc_msgSend(*(id *)(a1 + 40), "jobNumber"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLabel:", v7);

  v8 = objc_msgSend(*(id *)(a1 + 32), "isExtended");
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 48), "format");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "supportsExtendedRange");

    if ((v10 & 1) == 0)
    {
      NUAssertLogger_19521();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = (void *)MEMORY[0x1E0CB3940];
        v31 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 48), "format");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", CFSTR("XDR colorspace (%@) is incompatible with format (%@)"), v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v33;
        _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_19521();
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v36)
        {
          v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v50 = (void *)MEMORY[0x1E0CB3978];
          v51 = v49;
          objc_msgSend(v50, "callStackSymbols");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "componentsJoinedByString:", CFSTR("\n"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v49;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v53;
          _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v36)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v38;
        _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      v54 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 48), "format");
      objc_claimAutoreleasedReturnValue();
      _NUAssertFailHandler((uint64_t)"-[NURenderJob(RendererSupport) renderImage:into:colorSpace:roi:imageSize:alpha:error:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1446, CFSTR("XDR colorspace (%@) is incompatible with format (%@)"), v55, v56, v57, v58, v54);
    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isHDR"))
  {
    objc_msgSend(*(id *)(a1 + 48), "format");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "bitsPerComponent");

    if (v12 <= 9)
    {
      NUAssertLogger_19521();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v40 = (void *)MEMORY[0x1E0CB3940];
        v41 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 48), "format");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "stringWithFormat:", CFSTR("HDR colorspace (%@) is incompatible with format (%@)"), v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v43;
        _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_19521();
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
      if (v44)
      {
        if (v46)
        {
          v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v60 = (void *)MEMORY[0x1E0CB3978];
          v61 = v59;
          objc_msgSend(v60, "callStackSymbols");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "componentsJoinedByString:", CFSTR("\n"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v59;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v63;
          _os_log_error_impl(&dword_1A6553000, v45, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v46)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v48;
        _os_log_error_impl(&dword_1A6553000, v45, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      v64 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 48), "format");
      objc_claimAutoreleasedReturnValue();
      _NUAssertFailHandler((uint64_t)"-[NURenderJob(RendererSupport) renderImage:into:colorSpace:roi:imageSize:alpha:error:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderJob.m", 1447, CFSTR("HDR colorspace (%@) is incompatible with format (%@)"), v65, v66, v67, v68, v64);
    }
  }
  objc_msgSend(v3, "setClamped:", v8 ^ 1u);
  v13 = *(_QWORD **)(a1 + 88);
  if (v13)
    objc_msgSend(v3, "setAlphaMode:", *v13);
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_846);
  v14 = (void *)_NUScheduleLogger;
  if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
  {
    v24 = *(_QWORD *)(a1 + 40);
    v69 = *(_OWORD *)(a1 + 96);
    v25 = *(_QWORD *)(a1 + 112);
    v26 = *(_QWORD *)(a1 + 120);
    v27 = v14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{origin={%ld, %ld} size={%ld, %ld}}]"), v69, v25, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v24;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v3;
    *(_WORD *)&buf[22] = 2114;
    *(_QWORD *)&buf[24] = v28;
    _os_log_debug_impl(&dword_1A6553000, v27, OS_LOG_TYPE_DEBUG, "job %p %{public}@ render ROI %{public}@", buf, 0x20u);

  }
  v15 = *(void **)(a1 + 56);
  v16 = *(_QWORD *)(a1 + 64);
  v17 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  obj = 0;
  v18 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)buf = *(_OWORD *)(a1 + 96);
  *(_OWORD *)&buf[16] = v18;
  objc_msgSend(v15, "renderImage:rect:toDestination:atPoint:error:", v16, buf, v3, *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), &obj);
  v19 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v17, obj);
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

  v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) != 0;
  return v22;
}

- (NSMutableString)additionalDebugInfo
{
  id v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NURenderJob *v8;
  uint64_t v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Render Job Class = %@\n"), v5);

  -[NURenderJob outputGeometry](self, "outputGeometry");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    objc_msgSend(v3, "appendFormat:", CFSTR("outputGeometry = %@\n"), v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = self;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[NURenderJob renderedRegion](v8, "renderedRegion");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
        objc_msgSend(v3, "appendFormat:", CFSTR("renderedRegion = %@\n"), v9);

    }
  }

  return (NSMutableString *)v3;
}

- (id)debugFilePath
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  +[NUGlobalSettings tempDir](NUGlobalSettings, "tempDir");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUGlobalSettings tempDir](NUGlobalSettings, "tempDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v4, "length") - 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqual:", CFSTR("/")))
    v6 = &stru_1E5068958;
  else
    v6 = CFSTR("/");
  v7 = (void *)MEMORY[0x1E0CB3940];
  +[NUGlobalSettings tempDir](NUGlobalSettings, "tempDir");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = getpid();
  -[NURenderJob request](self, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@%i_%@-j%lld.txt"), v8, v6, v9, v11, -[NURenderJob jobNumber](self, "jobNumber"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)shouldWriteTombstone
{
  _BOOL4 v2;

  v2 = -[NURenderJob shouldWriteJobDebugFile](self, "shouldWriteJobDebugFile");
  if (v2)
    LOBYTE(v2) = !+[NUGlobalSettings renderJobDebugCaptureOnlyPerfStats](NUGlobalSettings, "renderJobDebugCaptureOnlyPerfStats");
  return v2;
}

- (BOOL)shouldWriteCanceledJob
{
  _BOOL4 v2;

  v2 = -[NURenderJob shouldWriteJobDebugFile](self, "shouldWriteJobDebugFile");
  if (v2)
    LOBYTE(v2) = +[NUGlobalSettings renderJobDebugCaptureCanceledJobs](NUGlobalSettings, "renderJobDebugCaptureCanceledJobs");
  return v2;
}

- (void)renderJobDebugInit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  id v17;

  if (renderJobDebugInit_once != -1)
    dispatch_once(&renderJobDebugInit_once, &__block_literal_global_20840);
  objc_opt_class();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[NURenderJob request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)jobCounts, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend((id)jobCounts, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedLongValue") + 1;

  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)jobCounts;
  -[NURenderJob request](self, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v12);

  objc_sync_exit(v3);
  if (+[NUGlobalSettings renderJobDebugCapture5PercentOfJobs](NUGlobalSettings, "renderJobDebugCapture5PercentOfJobs"))
  {
    v13 = __ROR8__(0xCCCCCCCCCCCCCCCDLL * v8, 2) < 0xCCCCCCCCCCCCCCDuLL;
  }
  else
  {
    v13 = 1;
  }
  -[NURenderJob setShouldWriteJobDebugFile:](self, "setShouldWriteJobDebugFile:", v13);
  if (-[NURenderJob shouldWriteTombstone](self, "shouldWriteTombstone"))
    -[NURenderJob writeRenderJobDebugTombstone](self, "writeRenderJobDebugTombstone");
  if (!+[NUGlobalSettings renderJobDebugCaptureOnlyPerfStats](NUGlobalSettings, "renderJobDebugCaptureOnlyPerfStats"))
  {
    v14 = +[NUGlobalSettings renderJobDebugCaptureNodeCache](NUGlobalSettings, "renderJobDebugCaptureNodeCache");
    +[NURenderNodeCache sharedInstance](NURenderNodeCache, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15;
    if (v14)
      objc_msgSend(v15, "debugDescription");
    else
      objc_msgSend(v15, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderJob setNodeCacheAtStartOfJob:](self, "setNodeCacheAtStartOfJob:", v16);

  }
}

- (void)renderJobDebugCanceled
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[NURenderJob shouldWriteCanceledJob](self, "shouldWriteCanceledJob"))
  {
    -[NURenderJob writeRenderDebugFileToDisk](self, "writeRenderDebugFileToDisk");
  }
  else if (-[NURenderJob shouldWriteTombstone](self, "shouldWriteTombstone"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderJob debugFilePath](self, "debugFilePath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v5 = objc_msgSend(v3, "removeItemAtPath:error:", v4, &v8);
    v6 = v8;

    if ((v5 & 1) == 0)
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_80);
      v7 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v6;
        _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "NU_RENDER_JOB_DEBUG could not remove tombstone. error: %@", buf, 0xCu);
      }
    }

  }
}

- (void)renderJobDebugResponded
{
  if (-[NURenderJob shouldWriteJobDebugFile](self, "shouldWriteJobDebugFile"))
    -[NURenderJob writeRenderDebugFileToDisk](self, "writeRenderDebugFileToDisk");
}

- (void)writeRenderJobDebugTombstone
{
  void *v2;
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NURenderJob debugFilePath](self, "debugFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n\n%@\n\nTombstone\n\n%@"), v2, v5, CFSTR("We write a simple debug file to disk when a job is created - a 'tombstone'.Then fill in that file with more execution details when it completes. If thejob never completes forwhatever reason then the tombstone is all that is left around."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  LOBYTE(v5) = objc_msgSend(v6, "writeToFile:atomically:encoding:error:", v2, 0, 4, &v9);
  v7 = v9;
  if ((v5 & 1) == 0)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_80);
    v8 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v2;
      v12 = 2112;
      v13 = v7;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "NU_RENDER_JOB_DEBUG failed to write to disk. path: %@ error: %@", buf, 0x16u);
    }
  }

}

- (void)writeRenderDebugFileToDisk
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  NSObject *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  NSObject *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  uint64_t v90;
  void *v91;
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  id v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  -[NURenderJob debugFilePath](self, "debugFilePath");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 512000);
  v86 = (void *)v3;
  objc_msgSend(v4, "appendString:", v3);
  -[NURenderJob request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v4;
  objc_msgSend(v4, "appendFormat:", CFSTR("%@name: %@\n"), CFSTR("\n\n"), v6);

  if (+[NUGlobalSettings renderJobDebugCaptureOnlyPerfStats](NUGlobalSettings, "renderJobDebugCaptureOnlyPerfStats"))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("%@\n"), v8);
  }
  else
  {
    -[NURenderJob request](self, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "additionalDebugInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("%@%@"), v10, CFSTR("\n\n"));

    -[NURenderJob additionalDebugInfo](self, "additionalDebugInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v8);
  }

  -[NURenderJob error](self, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NURenderJob error](self, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("\n\nError:\n%@"), v13);

  }
  if (-[NURenderJob isCanceled](self, "isCanceled"))
    objc_msgSend(v4, "appendString:", CFSTR("\n\nTHIS JOB WAS CANCELED / COALESCED"));
  if (-[NURenderJob isAborted](self, "isAborted"))
    objc_msgSend(v4, "appendString:", CFSTR("\nTHIS JOB WAS ABORTED IN THE MIDDLE OF EXECUTION"));
  -[NURenderJob statistics](self, "statistics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = CFSTR("\n\n");
  else
    v15 = &stru_1E5068958;
  -[NURenderJob statistics](self, "statistics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "description");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@Stats: %@%@"), CFSTR("\n\n"), v15, v17);

  if (+[NUGlobalSettings renderJobDebugCapturePerfStatHistory](NUGlobalSettings, "renderJobDebugCapturePerfStatHistory"))
  {
    +[NURenderJobStatistics history](NURenderJobStatistics, "history");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderJob request](self, "request");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      v20 = CFSTR("\n\n");
    else
      v20 = &stru_1E5068958;
    +[NURenderJobStatistics history](NURenderJobStatistics, "history");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderJob request](self, "request");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "description");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "appendFormat:", CFSTR("%@Historical Stats: %@%@"), CFSTR("\n\n"), v20, v25);

  }
  if (!+[NUGlobalSettings renderJobDebugCaptureOnlyPerfStats](NUGlobalSettings, "renderJobDebugCaptureOnlyPerfStats"))
  {
    -[NURenderJob nodeCacheAtStartOfJob](self, "nodeCacheAtStartOfJob");
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "appendFormat:", CFSTR("%@Render Node Cache (at job start): %@"), CFSTR("\n\n"), v26);

    LOBYTE(v26) = +[NUGlobalSettings renderJobDebugCaptureNodeCache](NUGlobalSettings, "renderJobDebugCaptureNodeCache");
    +[NURenderNodeCache sharedInstance](NURenderNodeCache, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if ((v26 & 1) != 0)
    {
      objc_msgSend(v27, "debugDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "appendFormat:", CFSTR("\n%@Render Node Cache (at job end): %@"), CFSTR("\n\n"), v29);

    }
    else
    {
      objc_msgSend(v87, "appendFormat:", CFSTR("\n%@Render Node Cache (at job end): %@"), CFSTR("\n\n"), v27);
    }

    -[NURenderJob request](self, "request");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "composition");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
      v32 = CFSTR("\n\n");
    else
      v32 = &stru_1E5068958;
    -[NURenderJob request](self, "request");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      -[NURenderJob request](self, "request");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "composition");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "debugDescription");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "appendFormat:", CFSTR("%@Composition: %@%@"), CFSTR("\n\n"), v32, v36);

    }
    else
    {
      objc_msgSend(v87, "appendFormat:", CFSTR("%@Composition: %@%@"), CFSTR("\n\n"), v32, &stru_1E5068958);
    }

    -[NURenderJob outputVideo](self, "outputVideo");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
      v38 = CFSTR("\n\n");
    else
      v38 = &stru_1E5068958;
    -[NURenderJob outputVideo](self, "outputVideo");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      -[NURenderJob outputVideo](self, "outputVideo");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "debugDescription");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "appendFormat:", CFSTR("%@OutputVideo: %@%@"), CFSTR("\n\n"), v38, v41);

    }
    else
    {
      objc_msgSend(v87, "appendFormat:", CFSTR("%@OutputVideo: %@%@"), CFSTR("\n\n"), v38, &stru_1E5068958);
    }

    -[NURenderJob outputVideoComposition](self, "outputVideoComposition");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
      v43 = CFSTR("\n\n");
    else
      v43 = &stru_1E5068958;
    -[NURenderJob outputVideoComposition](self, "outputVideoComposition");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      -[NURenderJob outputVideoComposition](self, "outputVideoComposition");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "debugDescription");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "appendFormat:", CFSTR("%@OutputVideoComposition: %@%@"), CFSTR("\n\n"), v43, v46);

    }
    else
    {
      objc_msgSend(v87, "appendFormat:", CFSTR("%@OutputVideoComposition: %@%@"), CFSTR("\n\n"), v43, &stru_1E5068958);
    }

    -[NURenderJob outputVideo](self, "outputVideo");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
      v48 = CFSTR("\n\n");
    else
      v48 = &stru_1E5068958;
    -[NURenderJob outputVideo](self, "outputVideo");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      -[NURenderJob outputVideo](self, "outputVideo");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "debugDescription");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "appendFormat:", CFSTR("%@OutputVideo: %@%@"), CFSTR("\n\n"), v48, v51);

    }
    else
    {
      objc_msgSend(v87, "appendFormat:", CFSTR("%@OutputVideo: %@%@"), CFSTR("\n\n"), v48, &stru_1E5068958);
    }

    -[NURenderJob outputAudioMix](self, "outputAudioMix");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
      v53 = CFSTR("\n\n");
    else
      v53 = &stru_1E5068958;
    -[NURenderJob outputAudioMix](self, "outputAudioMix");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "debugDescription");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "appendFormat:", CFSTR("%@OutputAudioMix: %@%@"), CFSTR("\n\n"), v53, v55);

  }
  if (+[NUGlobalSettings renderJobDebugCaptureNodeGraphs](NUGlobalSettings, "renderJobDebugCaptureNodeGraphs"))
  {
    -[NURenderJob prepareNode](self, "prepareNode");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
      v57 = CFSTR("\n\n");
    else
      v57 = &stru_1E5068958;
    -[NURenderJob prepareNode](self, "prepareNode");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "debugDescription");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "appendFormat:", CFSTR("%@PreparedNode: %@%@"), CFSTR("\n\n"), v57, v59);

    -[NURenderJob renderNode](self, "renderNode");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
      v61 = CFSTR("\n\n");
    else
      v61 = &stru_1E5068958;
    -[NURenderJob renderNode](self, "renderNode");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "debugDescription");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "appendFormat:", CFSTR("%@RenderNode: %@%@"), CFSTR("\n\n"), v61, v63);

    -[NURenderJob outputImage](self, "outputImage");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (v64)
      v65 = CFSTR("\n\n");
    else
      v65 = &stru_1E5068958;
    -[NURenderJob outputImage](self, "outputImage");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "debugDescription");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "appendFormat:", CFSTR("%@OutputImage: %@%@"), CFSTR("\n\n"), v65, v67);
    goto LABEL_70;
  }
  if (!+[NUGlobalSettings renderJobDebugCaptureOnlyPerfStats](NUGlobalSettings, "renderJobDebugCaptureOnlyPerfStats"))
  {
    -[NURenderJob prepareNode](self, "prepareNode");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (v68)
    {
      -[NURenderJob prepareNode](self, "prepareNode");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "description");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "appendFormat:", CFSTR("%@PreparedNode: %@"), CFSTR("\n\n"), v70);

    }
    else
    {
      objc_msgSend(v87, "appendFormat:", CFSTR("%@PreparedNode: %@"), CFSTR("\n\n"), &stru_1E5068958);
    }

    -[NURenderJob renderNode](self, "renderNode");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (v71)
    {
      -[NURenderJob renderNode](self, "renderNode");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "description");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "appendFormat:", CFSTR("%@RenderNode: %@"), CFSTR("\n\n"), v73);

    }
    else
    {
      objc_msgSend(v87, "appendFormat:", CFSTR("%@RenderNode: %@"), CFSTR("\n\n"), &stru_1E5068958);
    }

    -[NURenderJob outputImage](self, "outputImage");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v64)
    {
      objc_msgSend(v87, "appendFormat:", CFSTR("%@OutputImage: %@"), CFSTR("\n\n"), &stru_1E5068958);
      goto LABEL_71;
    }
    -[NURenderJob outputImage](self, "outputImage");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "description");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "appendFormat:", CFSTR("%@OutputImage: %@"), CFSTR("\n\n"), v67, v83);
LABEL_70:

LABEL_71:
  }
  v89 = 0;
  objc_msgSend(v87, "writeToFile:atomically:encoding:error:", v86, 0, 4, &v89);
  v74 = v89;
  v75 = v74;
  if (v87 && !v74 && v86)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_80);
    v76 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v93 = v86;
      _os_log_impl(&dword_1A6553000, v76, OS_LOG_TYPE_DEFAULT, "NU_RENDER_JOB_DEBUG wrote to %@", buf, 0xCu);
    }
  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_80);
    v77 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v93 = v86;
      v94 = 2112;
      v95 = v75;
      _os_log_error_impl(&dword_1A6553000, v77, OS_LOG_TYPE_ERROR, "NU_RENDER_JOB_DEBUG failed to write to disk. path: %@ error: %@", buf, 0x16u);
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = *MEMORY[0x1E0CB2A88];
  -[NURenderJob jobCreationDate](self, "jobCreationDate");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v79;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = 0;
  objc_msgSend(v78, "setAttributes:ofItemAtPath:error:", v80, v86, &v88);
  v81 = v88;

  if (v81)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_80);
    v82 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v93 = v86;
      v94 = 2112;
      v95 = v81;
      _os_log_error_impl(&dword_1A6553000, v82, OS_LOG_TYPE_ERROR, "NU_RENDER_JOB_DEBUG failed to update file modification time. path: %@ error: %@", buf, 0x16u);
    }
  }

}

void __49__NURenderJob_DebugAdditions__renderJobDebugInit__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)jobCounts;
  jobCounts = (uint64_t)v0;

}

@end
