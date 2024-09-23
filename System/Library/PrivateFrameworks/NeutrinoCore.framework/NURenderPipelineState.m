@implementation NURenderPipelineState

- (NURenderPipelineState)init
{
  NURenderPipelineState *v2;
  NURenderPipelineState *v3;
  unint64_t v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  NUDevice *device;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NURenderPipelineState;
  v2 = -[NURenderPipelineState init](&v12, sel_init);
  v3 = v2;
  do
    v4 = __ldaxr(&NURenderPipelineStateSerialNumber);
  while (__stlxr(v4 + 1, &NURenderPipelineStateSerialNumber));
  v2->_evaluationMode = 0;
  v2->_mediaComponentType = 0;
  v2->_serialNumber = v4;
  *(_OWORD *)&v2->_auxiliaryImageType = xmmword_1A671A280;
  v5 = NUScaleOne;
  v2->_roundingPolicy = 0;
  v6 = MEMORY[0x1E0CA2E18];
  v7 = *MEMORY[0x1E0CA2E18];
  v2->_scale = ($F9703ADC4DD3124DE91DE417D7636CC9)v5;
  *(_OWORD *)&v2->_time.value = v7;
  v2->_time.epoch = *(_QWORD *)(v6 + 16);
  +[NUPlatform currentPlatform](NUPlatform, "currentPlatform");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mainDevice");
  v9 = objc_claimAutoreleasedReturnValue();
  device = v3->_device;
  v3->_device = (NUDevice *)v9;

  -[NURenderPipelineState resetRenderTagGroups](v3, "resetRenderTagGroups");
  return v3;
}

- (void)resetRenderTagGroups
{
  NURenderTagGroup *v3;
  NURenderTagGroup *rootGroup;
  NSMutableArray *v5;
  NSMutableArray *groupStack;

  v3 = objc_alloc_init(NURenderTagGroup);
  rootGroup = self->_rootGroup;
  self->_rootGroup = v3;

  self->_groupCount = 1;
  objc_storeStrong((id *)&self->_currentGroup, self->_rootGroup);
  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  groupStack = self->_groupStack;
  self->_groupStack = v5;

}

- (id)initForCopy
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NURenderPipelineState;
  return -[NURenderPipelineState init](&v3, sel_init);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initForCopy");
  *(_QWORD *)(v4 + 24) = -[NURenderPipelineState serialNumber](self, "serialNumber");
  objc_msgSend((id)v4, "setEvaluationMode:", -[NURenderPipelineState evaluationMode](self, "evaluationMode"));
  objc_msgSend((id)v4, "setMediaComponentType:", -[NURenderPipelineState mediaComponentType](self, "mediaComponentType"));
  objc_msgSend((id)v4, "setAuxiliaryImageType:", -[NURenderPipelineState auxiliaryImageType](self, "auxiliaryImageType"));
  -[NURenderPipelineState time](self, "time");
  v12 = v14;
  v13 = v15;
  objc_msgSend((id)v4, "setTime:", &v12);
  objc_msgSend((id)v4, "setPlaybackDirection:", -[NURenderPipelineState playbackDirection](self, "playbackDirection"));
  objc_msgSend((id)v4, "setSampleMode:", -[NURenderPipelineState sampleMode](self, "sampleMode"));
  v5 = -[NURenderPipelineState scale](self, "scale");
  objc_msgSend((id)v4, "setScale:", v5, v6);
  objc_msgSend((id)v4, "setRoundingPolicy:", -[NURenderPipelineState roundingPolicy](self, "roundingPolicy"));
  objc_msgSend((id)v4, "setDisableIntermediateCaching:", -[NURenderPipelineState disableIntermediateCaching](self, "disableIntermediateCaching"));
  objc_msgSend((id)v4, "setEnableTransparency:", -[NURenderPipelineState enableTransparency](self, "enableTransparency"));
  objc_msgSend((id)v4, "setEnforceEvenDimensions:", -[NURenderPipelineState enforceEvenDimensions](self, "enforceEvenDimensions"));
  objc_msgSend((id)v4, "setDoNotOverride:", -[NURenderPipelineState doNotOverride](self, "doNotOverride"));
  -[NURenderPipelineState pipelineFilters](self, "pipelineFilters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "setPipelineFilters:", v7);

  -[NURenderPipelineState videoFrames](self, "videoFrames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "setVideoFrames:", v8);

  -[NURenderPipelineState videoMetadataSamples](self, "videoMetadataSamples");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "setVideoMetadataSamples:", v9);

  -[NURenderPipelineState videoSampleSlices](self, "videoSampleSlices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "setVideoSampleSlices:", v10);

  objc_storeStrong((id *)(v4 + 120), self->_rootGroup);
  *(_QWORD *)(v4 + 136) = self->_groupCount;
  objc_storeStrong((id *)(v4 + 128), self->_currentGroup);
  objc_storeStrong((id *)(v4 + 8), self->_groupStack);
  objc_storeStrong((id *)(v4 + 80), self->_device);
  return (id)v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  unint64_t mediaComponentType;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  unint64_t auxiliaryImageType;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  CMTime time;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[NURenderPipelineState evaluationMode](self, "evaluationMode") - 1;
  if (v5 > 2)
    v6 = CFSTR("Prepare");
  else
    v6 = off_1E5060A80[v5];
  -[NURenderPipelineState currentGroup](self, "currentGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  mediaComponentType = self->_mediaComponentType;
  if (mediaComponentType > 2)
    v9 = CFSTR("Invalid");
  else
    v9 = off_1E5060F70[mediaComponentType];
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld:%ld"), self->_scale.numerator, self->_scale.denominator);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  auxiliaryImageType = self->_auxiliaryImageType;
  if (auxiliaryImageType > 0xC)
    v13 = CFSTR("Invalid");
  else
    v13 = off_1E5060F88[auxiliaryImageType];
  v14 = v13;
  time = (CMTime)self->_time;
  v15 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &time);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> evaluationMode=%@ group=%@ componentType=%@ scale=%@ auxType=%@ time=%@"), v4, self, v6, v7, v10, v11, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)beginGroupWithName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v16;
  void *v17;
  void *specific;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
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
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_1305();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "name != nil");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v17;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1305();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v31 = (void *)MEMORY[0x1E0CB3978];
        v32 = v30;
        objc_msgSend(v31, "callStackSymbols");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v30;
        v50 = 2114;
        v51 = v34;
        _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v22;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineState beginGroupWithName:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 128, CFSTR("Invalid parameter not satisfying: %s"), v35, v36, v37, v38, (uint64_t)"name != nil");
  }
  if (!a4)
  {
    NUAssertLogger_1305();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v24;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1305();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v25)
    {
      if (v27)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = (void *)MEMORY[0x1E0CB3978];
        v41 = v39;
        objc_msgSend(v40, "callStackSymbols");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v39;
        v50 = 2114;
        v51 = v43;
        _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v29;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineState beginGroupWithName:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 129, CFSTR("Invalid parameter not satisfying: %s"), v44, v45, v46, v47, (uint64_t)"error != nil");
  }
  v7 = v6;
  if (+[NURenderTagNode validateName:error:](NURenderTagNode, "validateName:error:", v6, a4))
  {
    -[NURenderPipelineState currentGroup](self, "currentGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "childWithName:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("A group with name '%@' already exists on parent : '%@'"), v7, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 5, v12, v7);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v13 = 0;
    }
    else
    {
      v13 = (void *)objc_opt_new();
      -[NURenderPipelineState currentGroup](self, "currentGroup");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addChild:withName:", v13, v7);

      objc_storeStrong((id *)&self->_currentGroup, v13);
      ++self->_groupCount;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)endGroupWithName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  NURenderTagGroup *v13;
  NURenderTagGroup *currentGroup;
  void *v15;
  NSObject *v17;
  void *v18;
  void *specific;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_1305();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "name != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1305();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v32 = (void *)MEMORY[0x1E0CB3978];
        v33 = v31;
        objc_msgSend(v32, "callStackSymbols");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v31;
        v51 = 2114;
        v52 = v35;
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
      v50 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineState endGroupWithName:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 157, CFSTR("Invalid parameter not satisfying: %s"), v36, v37, v38, v39, (uint64_t)"name != nil");
  }
  if (!a4)
  {
    NUAssertLogger_1305();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v25;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1305();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v41 = (void *)MEMORY[0x1E0CB3978];
        v42 = v40;
        objc_msgSend(v41, "callStackSymbols");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v40;
        v51 = 2114;
        v52 = v44;
        _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v28)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v30;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineState endGroupWithName:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 158, CFSTR("Invalid parameter not satisfying: %s"), v45, v46, v47, v48, (uint64_t)"error != nil");
  }
  v7 = v6;
  -[NURenderPipelineState currentGroup](self, "currentGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v7, "isEqualToString:", v10);
  if ((v11 & 1) != 0)
  {
    -[NURenderPipelineState currentGroup](self, "currentGroup");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "parent");
    v13 = (NURenderTagGroup *)objc_claimAutoreleasedReturnValue();
    currentGroup = self->_currentGroup;
    self->_currentGroup = v13;

    --self->_groupCount;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end scoping (%@) does not match the start namespace (%@)"), v7, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 5, v15, v7);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (BOOL)applyPipelineSettings:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
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
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  char v34;
  char v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  char v40;
  _BYTE buf[22];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    NUAssertLogger_1305();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v15;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1305();
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
        *(_QWORD *)&buf[4] = v21;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v25;
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
      *(_QWORD *)&buf[4] = v20;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineState applyPipelineSettings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 179, CFSTR("Invalid parameter not satisfying: %s"), v26, v27, v28, v29, (uint64_t)"error != nil");
  }
  v7 = v6;
  if (-[NURenderPipelineState doNotOverride](self, "doNotOverride"))
    goto LABEL_3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("scale"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (*(_OWORD *)buf = NUScaleUnknown, objc_msgSend(v9, "getValue:", buf), *(uint64_t *)buf < 1)
      || *(uint64_t *)&buf[8] < 1)
    {
      +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("invalid scale in settings"), v9);
      v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
      v8 = 0;
      *a4 = v12;
LABEL_36:

      goto LABEL_37;
    }
    *(_OWORD *)buf = NUScaleUnknown;
    objc_msgSend(v9, "getValue:", buf);
    -[NURenderPipelineState setScale:](self, "setScale:", *(_QWORD *)buf, *(_QWORD *)&buf[8]);
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("frameTime"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v10, "CMTimeValue"), (v40 & 1) == 0))
    {
      +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("invalid time in settings"), v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    objc_msgSend(v10, "CMTimeValue");
    v36 = v38;
    v37 = v39;
    -[NURenderPipelineState setTime:](self, "setTime:", &v36);
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("defaultFrameTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NURenderPipelineState time](self, "time");
    if ((v35 & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v9, "CMTimeValue"), (v34 & 1) == 0))
      {
        +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("invalid time in settings"), v9);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      objc_msgSend(v9, "CMTimeValue");
      v30 = v32;
      v31 = v33;
      -[NURenderPipelineState setTime:](self, "setTime:", &v30);
    }
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("auxiliaryImageType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !NUAuxiliaryImageTypeFromString(v10))
    {
      +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("invalid auxiliaryImageType in settings"), v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    -[NURenderPipelineState setAuxiliaryImageType:](self, "setAuxiliaryImageType:", NUAuxiliaryImageTypeFromString(v10));
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mediaComponentType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !NUMediaComponentTypeFromString(v9))
    {
      +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("invalid mediaComponentType in settings"), v9);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    -[NURenderPipelineState setMediaComponentType:](self, "setMediaComponentType:", NUMediaComponentTypeFromString(v9));
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sampleMode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NURenderPipelineState setSampleMode:](self, "setSampleMode:", NUSampleModeFromString(v10));
      v8 = 1;
LABEL_35:
      v9 = v10;
      goto LABEL_36;
    }
    +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("invalid sampleMode in source settings"), v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_34:
    v8 = 0;
    *a4 = v11;
    goto LABEL_35;
  }
LABEL_3:
  v8 = 1;
LABEL_37:

  return v8;
}

- (id)pipelineSettingsFromSourceSettings:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scale"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("scale"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("frameTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("frameTime"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultFrameTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("defaultFrameTime"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("auxiliaryImageType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("auxiliaryImageType"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaComponentType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("mediaComponentType"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sampleMode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("sampleMode"));
  return v5;
}

- (BOOL)updatePipelineStateForWindowedSampleIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_videoSampleSlices, "count") <= a3)
  {
    NUAssertLogger_1305();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Out of bounds index for windowed samples"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_1305();
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
        *(_DWORD *)buf = 138543618;
        v31 = v17;
        v32 = 2114;
        v33 = v21;
        _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderPipelineState updatePipelineStateForWindowedSampleIndex:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderPipelineState.m", 267, CFSTR("Out of bounds index for windowed samples"), v22, v23, v24, v25, v26);
  }
  -[NSArray objectAtIndexedSubscript:](self->_videoSampleSlices, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "frameTime");
  }
  else
  {
    v28 = 0uLL;
    v29 = 0;
  }
  v26 = v28;
  v27 = v29;
  -[NURenderPipelineState setTime:](self, "setTime:", &v26);
  objc_msgSend(v6, "videoFrames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderPipelineState setVideoFrames:](self, "setVideoFrames:", v7);

  objc_msgSend(v6, "metadataSamples");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderPipelineState setVideoMetadataSamples:](self, "setVideoMetadataSamples:", v8);

  return 1;
}

- (int64_t)serialNumber
{
  return self->_serialNumber;
}

- (int64_t)evaluationMode
{
  return self->_evaluationMode;
}

- (void)setEvaluationMode:(int64_t)a3
{
  self->_evaluationMode = a3;
}

- (int64_t)mediaComponentType
{
  return self->_mediaComponentType;
}

- (void)setMediaComponentType:(int64_t)a3
{
  self->_mediaComponentType = a3;
}

- (int64_t)auxiliaryImageType
{
  return self->_auxiliaryImageType;
}

- (void)setAuxiliaryImageType:(int64_t)a3
{
  self->_auxiliaryImageType = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_time, 24, 1, 0);
  return result;
}

- (void)setTime:(id *)a3
{
  objc_copyStruct(&self->_time, a3, 24, 1, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)rawTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_rawTime, 24, 1, 0);
  return result;
}

- (void)setRawTime:(id *)a3
{
  objc_copyStruct(&self->_rawTime, a3, 24, 1, 0);
}

- (int64_t)sampleMode
{
  return self->_sampleMode;
}

- (void)setSampleMode:(int64_t)a3
{
  self->_sampleMode = a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)scale
{
  int64_t v2;
  int64_t v3;
  _QWORD v4[2];
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  objc_copyStruct(v4, &self->_scale, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setScale:(id)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3;

  v3 = a3;
  objc_copyStruct(&self->_scale, &v3, 16, 1, 0);
}

- (int64_t)roundingPolicy
{
  return self->_roundingPolicy;
}

- (void)setRoundingPolicy:(int64_t)a3
{
  self->_roundingPolicy = a3;
}

- (int64_t)playbackDirection
{
  return self->_playbackDirection;
}

- (void)setPlaybackDirection:(int64_t)a3
{
  self->_playbackDirection = a3;
}

- (BOOL)disableIntermediateCaching
{
  return self->_disableIntermediateCaching;
}

- (void)setDisableIntermediateCaching:(BOOL)a3
{
  self->_disableIntermediateCaching = a3;
}

- (BOOL)enableTransparency
{
  return self->_enableTransparency;
}

- (void)setEnableTransparency:(BOOL)a3
{
  self->_enableTransparency = a3;
}

- (BOOL)enforceEvenDimensions
{
  return self->_enforceEvenDimensions;
}

- (void)setEnforceEvenDimensions:(BOOL)a3
{
  self->_enforceEvenDimensions = a3;
}

- (BOOL)doNotOverride
{
  return self->_doNotOverride;
}

- (void)setDoNotOverride:(BOOL)a3
{
  self->_doNotOverride = a3;
}

- (NUDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (NSArray)pipelineFilters
{
  return self->_pipelineFilters;
}

- (void)setPipelineFilters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDictionary)videoFrames
{
  return self->_videoFrames;
}

- (void)setVideoFrames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDictionary)videoMetadataSamples
{
  return self->_videoMetadataSamples;
}

- (void)setVideoMetadataSamples:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)videoSampleSlices
{
  return self->_videoSampleSlices;
}

- (void)setVideoSampleSlices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NURenderTagGroup)rootGroup
{
  return (NURenderTagGroup *)objc_getProperty(self, a2, 120, 1);
}

- (NURenderTagGroup)currentGroup
{
  return (NURenderTagGroup *)objc_getProperty(self, a2, 128, 1);
}

- (unint64_t)groupCount
{
  return self->_groupCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentGroup, 0);
  objc_storeStrong((id *)&self->_rootGroup, 0);
  objc_storeStrong((id *)&self->_videoSampleSlices, 0);
  objc_storeStrong((id *)&self->_videoMetadataSamples, 0);
  objc_storeStrong((id *)&self->_videoFrames, 0);
  objc_storeStrong((id *)&self->_pipelineFilters, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_groupStack, 0);
}

@end
