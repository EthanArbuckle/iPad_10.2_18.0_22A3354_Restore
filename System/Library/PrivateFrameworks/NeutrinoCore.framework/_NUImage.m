@implementation _NUImage

- (_NUImage)init
{
  NSObject *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_23066);
  v3 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v8;
    _os_log_error_impl(&dword_1A6553000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_23066);
    v9 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v12;
      v23 = 2114;
      v24 = v14;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_23066);
    v9 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v11;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
  }

  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[_NUImage init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 478, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v17, v18, v19, v20, v16);
}

- (_NUImage)initWithLayout:(id)a3 format:(id)a4 colorSpace:(id)a5 tileFactory:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _NUImage *v16;
  _NUImage *v17;
  uint64_t v18;
  NURegion *validRegion;
  size_t v20;
  uint64_t v21;
  NSPointerArray *tiles;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *queue;
  NSObject *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *writeQueue;
  char *begin;
  NSObject *v31;
  void *v32;
  void *specific;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  objc_super v66;
  _BYTE buf[24];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (!v11)
  {
    NUAssertLogger();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "layout != nil");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v32;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v35)
      {
        v50 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "componentsJoinedByString:", CFSTR("\n"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v50;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v52;
        _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v35)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v37;
      _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v53 = "layout != nil";
    v54 = 482;
LABEL_33:

    _NUAssertFailHandler((uint64_t)"-[_NUImage initWithLayout:format:colorSpace:tileFactory:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", v54, CFSTR("Invalid parameter not satisfying: %s"), v61, v62, v63, v64, (uint64_t)v53);
  }
  if (!v12)
  {
    NUAssertLogger();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "format != nil");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v39;
      _os_log_error_impl(&dword_1A6553000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v34 = objc_claimAutoreleasedReturnValue();
    v41 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (v40)
    {
      if (v41)
      {
        v55 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "componentsJoinedByString:", CFSTR("\n"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v55;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v57;
        _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v41)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v43;
      _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v53 = "format != nil";
    v54 = 483;
    goto LABEL_33;
  }
  if (!v14)
  {
    NUAssertLogger();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "tileFactory != nil");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v45;
      _os_log_error_impl(&dword_1A6553000, v44, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v46 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v34 = objc_claimAutoreleasedReturnValue();
    v47 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (v46)
    {
      if (v47)
      {
        v58 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "componentsJoinedByString:", CFSTR("\n"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v58;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v60;
        _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v47)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v49;
      _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v53 = "tileFactory != nil";
    v54 = 484;
    goto LABEL_33;
  }
  v66.receiver = self;
  v66.super_class = (Class)_NUImage;
  v16 = -[_NUImage init](&v66, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_layout, a3);
    objc_storeStrong((id *)&v17->_format, a4);
    objc_storeStrong((id *)&v17->_colorSpace, a5);
    +[NURegion region](NURegion, "region");
    v18 = objc_claimAutoreleasedReturnValue();
    validRegion = v17->_validRegion;
    v17->_validRegion = (NURegion *)v18;

    objc_storeStrong((id *)&v17->_tileFactory, a6);
    v20 = -[NUImageLayout tileCount](v17->_layout, "tileCount");
    objc_msgSend(MEMORY[0x1E0CB3868], "strongObjectsPointerArray");
    v21 = objc_claimAutoreleasedReturnValue();
    tiles = v17->_tiles;
    v17->_tiles = (NSPointerArray *)v21;

    -[NSPointerArray setCount:](v17->_tiles, "setCount:", v20);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = dispatch_queue_create("_NUImage", v23);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v24;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = dispatch_queue_create("_NUImage.write", v26);
    writeQueue = v17->_writeQueue;
    v17->_writeQueue = (OS_dispatch_queue *)v27;

    v65 = 0;
    std::vector<unsigned char>::vector(buf, v20, &v65);
    begin = v17->_accessCount.__begin_;
    if (begin)
    {
      v17->_accessCount.__end_ = begin;
      operator delete(begin);
      v17->_accessCount.__begin_ = 0;
      v17->_accessCount.__end_ = 0;
      v17->_accessCount.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v17->_accessCount.__begin_ = *(_OWORD *)buf;
    v17->_accessCount.__end_cap_.__value_ = *(char **)&buf[16];
  }

  return v17;
}

- (void)dealloc
{
  int64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  NSPointerArray *tiles;
  objc_super v8;

  v3 = -[NUImageLayout tileCount](self->_layout, "tileCount");
  if (v3)
  {
    for (i = 0; i != v3; ++i)
    {
      -[NSPointerArray pointerAtIndex:](self->_tiles, "pointerAtIndex:", i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        if (self->_accessCount.__begin_[i])
          objc_msgSend(v5, "decrementAccessCountButLeaveAccessedIfLastUse");
        objc_msgSend(v6, "returnToStorageFactory:", self->_tileFactory);
      }

    }
  }
  tiles = self->_tiles;
  self->_tiles = 0;

  v8.receiver = self;
  v8.super_class = (Class)_NUImage;
  -[_NUImage dealloc](&v8, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *queue;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  _QWORD block[5];
  id v20;
  uint64_t v21;

  -[_NUImage layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tileCount");

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23___NUImage_description__block_invoke;
  block[3] = &unk_1E5063C48;
  v21 = v4;
  block[4] = self;
  v7 = v5;
  v20 = v7;
  dispatch_sync(queue, block);
  v18 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_opt_class();
  v9 = -[_NUImage size](self, "size");
  -[_NUImage size](self, "size");
  v11 = v10;
  -[_NUImage format](self, "format");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUImage colorSpace](self, "colorSpace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@:%p> size: %dx%d, format: %@, space: %@, %d tiles:\n%@"), v8, self, v9, v11, v12, v14, v4, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t v2;
  int64_t v3;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v2 = -[NUImageLayout imageSize](self->_layout, "imageSize");
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (id)_tileAtIndex:(unint64_t)a3
{
  return -[NSPointerArray pointerAtIndex:](self->_tiles, "pointerAtIndex:", a3);
}

- (id)tileAtIndex:(unint64_t)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__23182;
  v11 = __Block_byref_object_dispose__23183;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24___NUImage_tileAtIndex___block_invoke;
  block[3] = &unk_1E5063750;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)readRegion:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NUImageLayout *layout;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _NUImage *v23;
  id v24;
  _OWORD v25[2];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEmpty"))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_23066);
    v8 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "![region isEmpty]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v9;
      _os_log_impl(&dword_1A6553000, v8, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

    }
    if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_23066);
      v10 = (id)_NUAssertLogger;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v11;
        v28 = 2114;
        v29 = v13;
        _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_23066);
      v10 = (id)_NUAssertLogger;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v20;
        _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
    }

    _NUAssertContinueHandler((uint64_t)"-[_NUImage readRegion:withBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 568, CFSTR("Invalid parameter not satisfying: %s"), v14, v15, v16, v17, (uint64_t)"![region isEmpty]");
  }
  if ((objc_msgSend(v6, "isEmpty") & 1) == 0)
  {
    layout = self->_layout;
    if (v6)
      objc_msgSend(v6, "bounds");
    else
      memset(v25, 0, sizeof(v25));
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __33___NUImage_readRegion_withBlock___block_invoke;
    v21[3] = &unk_1E50637A0;
    v22 = v6;
    v23 = self;
    v24 = v7;
    -[NUImageLayout enumerateTilesForReadingInRect:withBlock:](layout, "enumerateTilesForReadingInRect:withBlock:", v25, v21);

  }
}

- (id)_createOrCopyTile:(id)a3 tileInfo:(id)a4 writeRegion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _NUImageTile *v11;
  NUStorageFactory *tileFactory;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _NUImageTile *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *queue;
  _NUImageTile *v30;
  NSObject *v31;
  id v32;
  _NUImageTile *v33;
  void *v34;
  id v35;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *specific;
  NSObject *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  id v60;
  _QWORD v61[5];
  id v62;
  _NUImageTile *v63;
  uint8_t *v64;
  _BYTE *v65;
  uint64_t v66;
  _QWORD block[5];
  __int128 v68;
  __int128 v69;
  _OWORD v70[2];
  _BYTE buf[24];
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  _NUImageTile *v74;
  uint8_t v75[32];
  void (*v76)(uint64_t);
  id v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v60 = a5;
  v10 = objc_msgSend(v9, "index");
  v11 = [_NUImageTile alloc];
  tileFactory = self->_tileFactory;
  v13 = objc_msgSend(v9, "size");
  v15 = (void *)-[NUStorageFactory newStorageWithSize:format:](tileFactory, "newStorageWithSize:format:", v13, v14, self->_format);
  v16 = -[_NUImageTile initWithStorage:](v11, "initWithStorage:", v15);

  if (-[_NUImageTile accessCount](v16, "accessCount") != 1)
  {
    NUAssertLogger();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tile should have an access count"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v75 = 138543362;
      *(_QWORD *)&v75[4] = v40;
      _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v75, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v43)
      {
        v46 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v75 = 138543618;
        *(_QWORD *)&v75[4] = v46;
        *(_WORD *)&v75[12] = 2114;
        *(_QWORD *)&v75[14] = v48;
        _os_log_error_impl(&dword_1A6553000, v42, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v75, 0x16u);

      }
    }
    else if (v43)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v75 = 138543362;
      *(_QWORD *)&v75[4] = v45;
      _os_log_error_impl(&dword_1A6553000, v42, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v75, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUImage _createOrCopyTile:tileInfo:writeRegion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 600, CFSTR("Tile should have an access count"), v49, v50, v51, v52, v53);
  }
  if (v8)
  {
    memset(v75, 0, sizeof(v75));
    if (v9)
      objc_msgSend(v9, "frameRect");
    -[_NUImage validRegion](self, "validRegion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = *(_OWORD *)v75;
    v70[1] = *(_OWORD *)&v75[16];
    objc_msgSend(v17, "regionByClippingToRect:", v70);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "regionByRemovingRegion:", v60);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");

    objc_msgSend(v20, "translateBy:", -*(_QWORD *)v75, -*(_QWORD *)&v75[8]);
    if ((objc_msgSend(v20, "isEmpty") & 1) == 0)
    {
      v21 = -[_NUImageTile copyFromTile:region:](v16, "copyFromTile:region:", v8, v20);
      if (v21 != 1)
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_23066);
        v22 = (id)_NUAssertLogger;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: failed to copy tile %@ -> %@ result=%ld"), self, v8, v16, v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v23;
          _os_log_impl(&dword_1A6553000, v22, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

        }
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_23066);
          v58 = (id)_NUAssertLogger;
          v24 = v58;
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            v56 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "componentsJoinedByString:", CFSTR("\n"));
            v37 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v56;
            *(_WORD *)&buf[12] = 2114;
            v54 = (void *)v37;
            *(_QWORD *)&buf[14] = v37;
            _os_log_error_impl(&dword_1A6553000, v58, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

          }
        }
        else
        {
          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_23066);
          v24 = (id)_NUAssertLogger;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "componentsJoinedByString:", CFSTR("\n"));
            v38 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v57 = (void *)v38;
            *(_QWORD *)&buf[4] = v38;
            _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

          }
        }

        _NUAssertContinueHandler((uint64_t)"-[_NUImage _createOrCopyTile:tileInfo:writeRegion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 618, CFSTR("%@: failed to copy tile %@ -> %@ result=%ld"), v25, v26, v27, v28, (uint64_t)self);
        queue = self->_queue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __51___NUImage__createOrCopyTile_tileInfo_writeRegion___block_invoke;
        block[3] = &unk_1E50637C8;
        block[4] = self;
        v68 = *(_OWORD *)v75;
        v69 = *(_OWORD *)&v75[16];
        dispatch_sync(queue, block);
      }
    }

  }
  *(_QWORD *)v75 = 0;
  *(_QWORD *)&v75[8] = v75;
  *(_QWORD *)&v75[16] = 0x3032000000;
  *(_QWORD *)&v75[24] = __Block_byref_object_copy__23182;
  v76 = __Block_byref_object_dispose__23183;
  v77 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v72 = __Block_byref_object_copy__23182;
  v73 = __Block_byref_object_dispose__23183;
  v30 = v16;
  v74 = v30;
  v31 = self->_queue;
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __51___NUImage__createOrCopyTile_tileInfo_writeRegion___block_invoke_2;
  v61[3] = &unk_1E50637F0;
  v61[4] = self;
  v66 = v10;
  v32 = v8;
  v62 = v32;
  v64 = v75;
  v33 = v30;
  v63 = v33;
  v65 = buf;
  dispatch_sync(v31, v61);
  v34 = *(void **)(*(_QWORD *)&v75[8] + 40);
  if (v34)
    objc_msgSend(v34, "returnToStorageFactory:", self->_tileFactory);
  v35 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v75, 8);

  return v35;
}

- (void)writeRegion:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  NUImageLayout *layout;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  NSObject *v14;
  void *v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD block[5];
  id v29;
  _QWORD v30[4];
  id v31;
  _NUImage *v32;
  id v33;
  _OWORD v34[2];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEmpty"))
  {
    NUAssertLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "![region isEmpty]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v15;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v21;
        v37 = 2114;
        v38 = v23;
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
      v36 = v20;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUImage writeRegion:withBlock:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 696, CFSTR("Invalid parameter not satisfying: %s"), v24, v25, v26, v27, (uint64_t)"![region isEmpty]");
  }
  layout = self->_layout;
  if (v6)
    objc_msgSend(v6, "bounds");
  else
    memset(v34, 0, sizeof(v34));
  v9 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __34___NUImage_writeRegion_withBlock___block_invoke;
  v30[3] = &unk_1E50637A0;
  v10 = v6;
  v31 = v10;
  v32 = self;
  v11 = v7;
  v33 = v11;
  -[NUImageLayout enumerateTilesForWritingInRect:withBlock:](layout, "enumerateTilesForWritingInRect:withBlock:", v34, v30);
  queue = self->_queue;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __34___NUImage_writeRegion_withBlock___block_invoke_5;
  block[3] = &unk_1E5063FB8;
  block[4] = self;
  v29 = v10;
  v13 = v10;
  dispatch_sync(queue, block);

}

- (BOOL)beginAccess
{
  _NUImage *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[4];

  v2 = self;
  v3 = -[NUImageLayout imageSize](self->_layout, "imageSize");
  v7[0] = 0;
  v7[1] = 0;
  v7[2] = v3;
  v7[3] = v4;
  +[NURegion regionWithRect:](NURegion, "regionWithRect:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[_NUImage beginAccessRegion:](v2, "beginAccessRegion:", v5);

  return (char)v2;
}

- (BOOL)beginAccessRegion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30___NUImage_beginAccessRegion___block_invoke;
  block[3] = &unk_1E5063868;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (void)endAccess
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];

  v3 = -[NUImageLayout imageSize](self->_layout, "imageSize");
  v6[0] = 0;
  v6[1] = 0;
  v6[2] = v3;
  v6[3] = v4;
  +[NURegion regionWithRect:](NURegion, "regionWithRect:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUImage endAccessRegion:](self, "endAccessRegion:", v5);

}

- (void)endAccessRegion:(id)a3
{
  id v4;
  NSObject *queue;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  _QWORD block[5];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "region != nil");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v13;
        v25 = 2114;
        v26 = v15;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[_NUImage endAccessRegion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 805, CFSTR("Invalid parameter not satisfying: %s"), v16, v17, v18, v19, (uint64_t)"region != nil");
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28___NUImage_endAccessRegion___block_invoke;
  block[3] = &unk_1E5063FB8;
  block[4] = self;
  v22 = v4;
  v20 = v4;
  dispatch_sync(queue, block);

}

- (id)_purgeableCopy
{
  uint64_t v3;
  size_t v4;
  void *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[4];
  id v11;
  _NUImage *v12;
  char v13;
  __int128 v14;
  uint64_t v15;

  v3 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLayout:format:colorSpace:tileFactory:", self->_layout, self->_format, self->_colorSpace, self->_tileFactory);
  objc_storeStrong((id *)(v3 + 64), self->_tileFactory);
  v4 = -[NUImageLayout tileCount](self->_layout, "tileCount");
  v13 = 0;
  std::vector<unsigned char>::vector(&v14, v4, &v13);
  v5 = *(void **)(v3 + 72);
  if (v5)
  {
    *(_QWORD *)(v3 + 80) = v5;
    operator delete(v5);
    *(_QWORD *)(v3 + 72) = 0;
    *(_QWORD *)(v3 + 80) = 0;
    *(_QWORD *)(v3 + 88) = 0;
  }
  *(_OWORD *)(v3 + 72) = v14;
  *(_QWORD *)(v3 + 88) = v15;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26___NUImage__purgeableCopy__block_invoke;
  block[3] = &unk_1E5063FB8;
  v7 = (id)v3;
  v11 = v7;
  v12 = self;
  dispatch_sync(queue, block);
  v8 = v7;

  return v8;
}

- (id)_nonPurgeableCopy
{
  void *v2;

  -[_NUImage _purgeableCopy](self, "_purgeableCopy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginAccess");
  return v2;
}

- (BOOL)copySurfaceStorage:(id)a3 fromRect:(id *)a4 toPoint:(id)a5 device:(id)a6
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
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
  v7 = a3;
  v8 = a6;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_23066);
  v9 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v13;
    _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_23066);
    v14 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v17;
      v28 = 2114;
      v29 = v19;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_23066);
    v14 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v16;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
  }

  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[_NUImage copySurfaceStorage:fromRect:toPoint:device:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 870, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v22, v23, v24, v25, v21);
}

- (BOOL)copyBufferStorage:(id)a3 fromRect:(id *)a4 toPoint:(id)a5
{
  id v5;
  NSObject *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_23066);
  v6 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v10;
    _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_23066);
    v11 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v14;
      v25 = 2114;
      v26 = v16;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_23066);
    v11 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v13;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
  }

  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[_NUImage copyBufferStorage:fromRect:toPoint:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 875, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v19, v20, v21, v22, v18);
}

- (NUImageLayout)layout
{
  return (NUImageLayout *)objc_getProperty(self, a2, 24, 1);
}

- (NUPixelFormat)format
{
  return (NUPixelFormat *)objc_getProperty(self, a2, 32, 1);
}

- (NUColorSpace)colorSpace
{
  return (NUColorSpace *)objc_getProperty(self, a2, 40, 1);
}

- (NURegion)validRegion
{
  return (NURegion *)objc_getProperty(self, a2, 48, 1);
}

- (void)setValidRegion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  char *begin;

  begin = self->_accessCount.__begin_;
  if (begin)
  {
    self->_accessCount.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_tileFactory, 0);
  objc_storeStrong((id *)&self->_tiles, 0);
  objc_storeStrong((id *)&self->_validRegion, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  return self;
}

@end
