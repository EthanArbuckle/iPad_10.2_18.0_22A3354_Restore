@implementation NUImageAccumulationNode

- (NUImageAccumulationNode)initWithSettings:(id)a3 inputs:(id)a4
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_25123);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_25123);
      goto LABEL_8;
    }
    if (v15 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_25123);
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
  _NUAssertFailHandler((uint64_t)"-[NUImageAccumulationNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUImageAccumulationNode.m", 30, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v29, v30, v31, v32, v28);
}

- (NUImageAccumulationNode)initWithImageSize:(id)a3 tileSize:(id)a4 borderSize:(id)a5 pixelFormat:(id)a6 colorSpace:(id)a7 input:(id)a8
{
  int64_t var1;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  NUPixelFormat *v14;
  NUColorSpace *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NUImageAccumulationNode *v25;
  NUMutablePurgeableImage *image;
  uint64_t v27;
  NUImageLayout *layout;
  NUPixelFormat *pixelFormat;
  NUPixelFormat *v30;
  NUColorSpace *colorSpace;
  NUColorSpace *v32;
  NSObject *v33;
  dispatch_queue_t v34;
  OS_dispatch_queue *queue;
  NSObject *v37;
  void *v38;
  void *specific;
  NSObject *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  _BOOL4 v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  NUImageAccumulationNode *v101;
  void *v102;
  int64_t v103;
  int64_t v104;
  int64_t v105;
  int64_t v106;
  int64_t var0;
  objc_super v108;
  uint64_t v109;
  void *v110;
  _QWORD v111[8];
  _QWORD v112[8];
  uint8_t buf[4];
  void *v114;
  __int16 v115;
  void *v116;
  uint64_t v117;

  var1 = a5.var1;
  var0 = a5.var0;
  v9 = a4.var1;
  v10 = a4.var0;
  v11 = a3.var1;
  v12 = a3.var0;
  v117 = *MEMORY[0x1E0C80C00];
  v14 = (NUPixelFormat *)a6;
  v15 = (NUColorSpace *)a7;
  v16 = a8;
  if (v12 < 1 || v11 <= 0)
  {
    NUAssertLogger_25135();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "imageSize.width > 0 && imageSize.height > 0");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v114 = v38;
      _os_log_error_impl(&dword_1A6553000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_25135();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v41)
      {
        v65 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v66 = (void *)MEMORY[0x1E0CB3978];
        v67 = v65;
        objc_msgSend(v66, "callStackSymbols");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "componentsJoinedByString:", CFSTR("\n"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v114 = v65;
        v115 = 2114;
        v116 = v69;
        _os_log_error_impl(&dword_1A6553000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v41)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v114 = v43;
      _os_log_error_impl(&dword_1A6553000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageAccumulationNode initWithImageSize:tileSize:borderSize:pixelFormat:colorSpace:input:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUImageAccumulationNode.m", 36, CFSTR("Invalid parameter not satisfying: %s"), v70, v71, v72, v73, (uint64_t)"imageSize.width > 0 && imageSize.height > 0");
  }
  if (!v14)
  {
    NUAssertLogger_25135();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "format != nil");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v114 = v45;
      _os_log_error_impl(&dword_1A6553000, v44, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v46 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_25135();
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
    if (v46)
    {
      if (v48)
      {
        v74 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v75 = (void *)MEMORY[0x1E0CB3978];
        v76 = v74;
        objc_msgSend(v75, "callStackSymbols");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "componentsJoinedByString:", CFSTR("\n"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v114 = v74;
        v115 = 2114;
        v116 = v78;
        _os_log_error_impl(&dword_1A6553000, v47, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v48)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "componentsJoinedByString:", CFSTR("\n"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v114 = v50;
      _os_log_error_impl(&dword_1A6553000, v47, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageAccumulationNode initWithImageSize:tileSize:borderSize:pixelFormat:colorSpace:input:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUImageAccumulationNode.m", 37, CFSTR("Invalid parameter not satisfying: %s"), v79, v80, v81, v82, (uint64_t)"format != nil");
  }
  if (!v15)
  {
    NUAssertLogger_25135();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "space != nil");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v114 = v52;
      _os_log_error_impl(&dword_1A6553000, v51, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v53 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_25135();
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);
    if (v53)
    {
      if (v55)
      {
        v83 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v84 = (void *)MEMORY[0x1E0CB3978];
        v85 = v83;
        objc_msgSend(v84, "callStackSymbols");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "componentsJoinedByString:", CFSTR("\n"));
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v114 = v83;
        v115 = 2114;
        v116 = v87;
        _os_log_error_impl(&dword_1A6553000, v54, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v55)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "componentsJoinedByString:", CFSTR("\n"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v114 = v57;
      _os_log_error_impl(&dword_1A6553000, v54, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageAccumulationNode initWithImageSize:tileSize:borderSize:pixelFormat:colorSpace:input:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUImageAccumulationNode.m", 38, CFSTR("Invalid parameter not satisfying: %s"), v88, v89, v90, v91, (uint64_t)"space != nil");
  }
  if (!v16)
  {
    NUAssertLogger_25135();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "input != nil");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v114 = v59;
      _os_log_error_impl(&dword_1A6553000, v58, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v60 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_25135();
    v61 = objc_claimAutoreleasedReturnValue();
    v62 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);
    if (v60)
    {
      if (v62)
      {
        v92 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v93 = (void *)MEMORY[0x1E0CB3978];
        v94 = v92;
        objc_msgSend(v93, "callStackSymbols");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "componentsJoinedByString:", CFSTR("\n"));
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v114 = v92;
        v115 = 2114;
        v116 = v96;
        _os_log_error_impl(&dword_1A6553000, v61, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v62)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "componentsJoinedByString:", CFSTR("\n"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v114 = v64;
      _os_log_error_impl(&dword_1A6553000, v61, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageAccumulationNode initWithImageSize:tileSize:borderSize:pixelFormat:colorSpace:input:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUImageAccumulationNode.m", 39, CFSTR("Invalid parameter not satisfying: %s"), v97, v98, v99, v100, (uint64_t)"input != nil");
  }
  v111[0] = CFSTR("space");
  v111[1] = CFSTR("format");
  v112[0] = v15;
  v112[1] = v14;
  v111[2] = CFSTR("width");
  v101 = self;
  v102 = v16;
  v103 = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v112[2] = v17;
  v111[3] = CFSTR("height");
  v104 = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v112[3] = v18;
  v111[4] = CFSTR("tile_width");
  v105 = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v112[4] = v19;
  v111[5] = CFSTR("tile_height");
  v106 = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v112[5] = v20;
  v111[6] = CFSTR("border_width");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", var0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v112[6] = v21;
  v111[7] = CFSTR("border_height");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", var1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v112[7] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111, 8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v109 = *MEMORY[0x1E0C9E1F8];
  v110 = v102;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v108.receiver = v101;
  v108.super_class = (Class)NUImageAccumulationNode;
  v25 = -[NURenderNode initWithSettings:inputs:](&v108, sel_initWithSettings_inputs_, v23, v24);
  image = v25->_image;
  v25->_image = 0;

  if (var0 && var1)
  {
    +[NUImageLayout overlappingTiledLayoutForImageSize:tileSize:borderSize:](NUImageLayout, "overlappingTiledLayoutForImageSize:tileSize:borderSize:", v103, v104, v105, v106, var0, var1);
    v27 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[NUImageLayout tiledLayoutForImageSize:tileSize:](NUImageLayout, "tiledLayoutForImageSize:tileSize:", v103, v104, v105, v106);
    v27 = objc_claimAutoreleasedReturnValue();
  }
  layout = v25->_layout;
  v25->_layout = (NUImageLayout *)v27;

  pixelFormat = v25->_pixelFormat;
  v25->_pixelFormat = v14;
  v30 = v14;

  colorSpace = v25->_colorSpace;
  v25->_colorSpace = v15;
  v32 = v15;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = dispatch_queue_create("NUImageNode", v33);
  queue = v25->_queue;
  v25->_queue = (OS_dispatch_queue *)v34;

  return v25;
}

- (NUMutablePurgeableImage)image
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__25141;
  v10 = __Block_byref_object_dispose__25142;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__NUImageAccumulationNode_image__block_invoke;
  v5[3] = &unk_1E5063FE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NUMutablePurgeableImage *)v3;
}

- (id)_image
{
  NUMutablePurgeableImage *image;
  id v4;
  NUMutablePurgeableImage *v5;
  NUMutablePurgeableImage *v6;
  NSObject *v8;
  void *v9;
  void *specific;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[12];
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  image = self->_image;
  if (!image)
  {
    v4 = -[NUImageAccumulationNode _newImage](self, "_newImage");
    objc_msgSend(v4, "mutablePurgeableImageCopy");
    v5 = (NUMutablePurgeableImage *)objc_claimAutoreleasedReturnValue();
    v6 = self->_image;
    self->_image = v5;

    if (!self->_image)
    {
      NUAssertLogger_25135();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to allocate tiled image"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v24 = 138543362;
        *(_QWORD *)&v24[4] = v9;
        _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v24, 0xCu);

      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_25135();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v12)
        {
          v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v16 = (void *)MEMORY[0x1E0CB3978];
          v17 = v15;
          objc_msgSend(v16, "callStackSymbols");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v24 = 138543618;
          *(_QWORD *)&v24[4] = v15;
          v25 = 2114;
          v26 = v19;
          _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v24, 0x16u);

        }
      }
      else if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v24 = 138543362;
        *(_QWORD *)&v24[4] = v14;
        _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v24, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"-[NUImageAccumulationNode _image]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUImageAccumulationNode.m", 81, CFSTR("Failed to allocate tiled image"), v20, v21, v22, v23, *(uint64_t *)v24);
    }

    image = self->_image;
  }
  return image;
}

- (id)_newImage
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_25123);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_25123);
      goto LABEL_8;
    }
    if (v8 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_25123);
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
  _NUAssertFailHandler((uint64_t)"-[NUImageAccumulationNode _newImage]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUImageAccumulationNode.m", 89, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v22, v23, v24, v25, v21);
}

- (id)debugQuickLookObject
{
  void *v3;
  objc_super v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NUMutablePurgeableImage performSelector:](self->_image, "performSelector:", sel_debugQuickLookObject);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)NUImageAccumulationNode;
    -[NURenderNode debugQuickLookObject](&v5, sel_debugQuickLookObject);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)imageSize
{
  $5BB7312FFE32F1AB3F1F5957C99A58B3 *p_imageSize;
  int64_t width;
  int64_t height;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  p_imageSize = &self->_imageSize;
  width = self->_imageSize.width;
  height = p_imageSize->height;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (NUPixelFormat)pixelFormat
{
  return self->_pixelFormat;
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (NUImageLayout)layout
{
  return self->_layout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_pixelFormat, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

void __32__NUImageAccumulationNode_image__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_image");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
