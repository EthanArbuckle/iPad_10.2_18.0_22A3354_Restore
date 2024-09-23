@implementation NULivePhotoSourceContainerNode

- (NULivePhotoSourceContainerNode)initWithAssetIdentifier:(id)a3
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_6563);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_6563);
      goto LABEL_8;
    }
    if (v12 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_6563);
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
  _NUAssertFailHandler((uint64_t)"-[NULivePhotoSourceContainerNode initWithAssetIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 376, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v26, v27, v28, v29, v25);
}

- (NULivePhotoSourceContainerNode)initWithImageContainerNode:(id)a3 videoContainerNode:(id)a4 assetIdentifier:(id)a5
{
  NUSourceContainerNode *v8;
  NUSourceContainerNode *v9;
  id v10;
  void *v11;
  NULivePhotoSourceContainerNode *v12;
  NUSourceContainerNode *image;
  NUSourceContainerNode *v14;
  NUSourceContainerNode *video;
  NUSourceContainerNode *v16;
  void *v17;
  void *v18;
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
  v8 = (NUSourceContainerNode *)a3;
  v9 = (NUSourceContainerNode *)a4;
  v10 = a5;
  if (!v8)
  {
    NUAssertLogger_6578();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "image != nil");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v21;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_6578();
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
    _NUAssertFailHandler((uint64_t)"-[NULivePhotoSourceContainerNode initWithImageContainerNode:videoContainerNode:assetIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 381, CFSTR("Invalid parameter not satisfying: %s"), v39, v40, v41, v42, (uint64_t)"image != nil");
  }
  if (!v9)
  {
    NUAssertLogger_6578();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "video != nil");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v28;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_6578();
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
    _NUAssertFailHandler((uint64_t)"-[NULivePhotoSourceContainerNode initWithImageContainerNode:videoContainerNode:assetIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 382, CFSTR("Invalid parameter not satisfying: %s"), v48, v49, v50, v51, (uint64_t)"video != nil");
  }
  v11 = v10;
  v52.receiver = self;
  v52.super_class = (Class)NULivePhotoSourceContainerNode;
  v12 = -[NUSourceContainerNode initWithAssetIdentifier:](&v52, sel_initWithAssetIdentifier_, v10);
  image = v12->_image;
  v12->_image = v8;
  v14 = v8;

  video = v12->_video;
  v12->_video = v9;
  v16 = v9;

  -[NUSourceContainerNode primarySourceNode](v16, "primarySourceNode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[NUSourceContainerNode primarySourceNode](v14, "primarySourceNode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setOriginalNode:", v18);
  return v12;
}

- (id)primarySourceNode
{
  return (id)-[NUSourceContainerNode primarySourceNode](self->_image, "primarySourceNode");
}

- (id)containerNodeForPipelineState:(id)a3
{
  id v3;
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *specific;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  int *v14;
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
  v5 = a3;
  v6 = objc_msgSend(v5, "mediaComponentType");
  switch(v6)
  {
    case 1:
      v14 = &OBJC_IVAR___NULivePhotoSourceContainerNode__image;
LABEL_11:
      v3 = *(id *)((char *)&self->super.super.super.isa + *v14);
      break;
    case 2:
      v14 = &OBJC_IVAR___NULivePhotoSourceContainerNode__video;
      goto LABEL_11;
    case 0:
      NUAssertLogger_6578();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ asked for NUMediaComponentTypeUnknown"), self);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v26 = v8;
        _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_6578();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v11)
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
        v26 = v13;
        _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"-[NULivePhotoSourceContainerNode containerNodeForPipelineState:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode.m", 412, CFSTR("%@ asked for NUMediaComponentTypeUnknown"), v21, v22, v23, v24, (uint64_t)self);
  }

  return v3;
}

- (id)resolveSourceNodeForPipelineState:(id)a3 foundScale:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  -[NULivePhotoSourceContainerNode containerNodeForPipelineState:](self, "containerNodeForPipelineState:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resolveSourceNodeForPipelineState:foundScale:error:", v8, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)sourceNodeForPipelineState:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[NULivePhotoSourceContainerNode containerNodeForPipelineState:](self, "containerNodeForPipelineState:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sourceNodeForPipelineState:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_video, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
