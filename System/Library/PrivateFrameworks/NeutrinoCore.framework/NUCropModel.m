@implementation NUCropModel

- (NUCropModel)init
{
  NSObject *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  uint64_t v14;
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
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_10081);
  v2 = (id)_NUAssertLogger;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v6;
    _os_log_error_impl(&dword_1A6553000, v2, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

  }
  if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_10081);
    v7 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v10;
      v21 = 2114;
      v22 = v12;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_10081);
    v7 = (id)_NUAssertLogger;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v9;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
  }

  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUCropModel init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUCropModel.mm", 114, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v15, v16, v17, v18, v14);
}

- (NUCropModel)initWithMasterImageSize:(CGSize)a3
{
  return -[NUCropModel initWithMasterImageRect:](self, "initWithMasterImageRect:", 0.0, 0.0, a3.width, a3.height);
}

- (NUCropModel)initWithMasterImageRect:(CGRect)a3
{
  CGFloat x;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  NUCropModel *v7;
  NUCropModel *v8;
  NSObject *v10;
  void *v11;
  void *specific;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  objc_super v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  x = a3.origin.x;
  v40 = *MEMORY[0x1E0C80C00];
  if (a3.size.width < 1.0)
  {
    NUAssertLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "masterImageRect.size.width >= 1");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v23;
        v38 = 2114;
        v39 = v25;
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
      v37 = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v26 = "masterImageRect.size.width >= 1";
    v27 = 123;
LABEL_22:

    _NUAssertFailHandler((uint64_t)"-[NUCropModel initWithMasterImageRect:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUCropModel.mm", v27, CFSTR("Invalid parameter not satisfying: %s"), v31, v32, v33, v34, (uint64_t)v26);
  }
  height = a3.size.height;
  if (a3.size.height < 1.0)
  {
    NUAssertLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "masterImageRect.size.height >= 1");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v20)
      {
        v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v28;
        v38 = 2114;
        v39 = v30;
        _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v22;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v26 = "masterImageRect.size.height >= 1";
    v27 = 124;
    goto LABEL_22;
  }
  width = a3.size.width;
  y = a3.origin.y;
  v35.receiver = self;
  v35.super_class = (Class)NUCropModel;
  v7 = -[NUCropModel init](&v35, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_masterImageRect.origin.x = x;
    v7->_masterImageRect.origin.y = y;
    v7->_masterImageRect.size.width = width;
    v7->_masterImageRect.size.height = height;
    v7->_fovRadians = 1.04719755;
    -[NUCropModel _setToDefaultValues](v7, "_setToDefaultValues");
  }
  return v8;
}

- (NUCropModel)initWithMasterImageSize:(CGSize)a3 fovRadians:(double)a4
{
  NUCropModel *result;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
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
  if (a4 >= 3.14159265)
  {
    NUAssertLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "fovRadians < M_PI");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v7;
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
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v19;
        v33 = 2114;
        v34 = v21;
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
      v32 = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v22 = "fovRadians < M_PI";
    v23 = 137;
LABEL_22:

    _NUAssertFailHandler((uint64_t)"-[NUCropModel initWithMasterImageSize:fovRadians:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUCropModel.mm", v23, CFSTR("Invalid parameter not satisfying: %s"), v27, v28, v29, v30, (uint64_t)v22);
  }
  if (a4 <= -3.14159265)
  {
    NUAssertLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "fovRadians > -M_PI");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v14;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v15)
    {
      if (v16)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v24;
        v33 = 2114;
        v34 = v26;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v18;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v22 = "fovRadians > -M_PI";
    v23 = 138;
    goto LABEL_22;
  }
  result = -[NUCropModel initWithMasterImageRect:](self, "initWithMasterImageRect:", 0.0, 0.0, a3.width, a3.height);
  if (result)
    result->_fovRadians = a4;
  return result;
}

- (NUCropModel)initWithMasterImageSize:(CGSize)a3 stitchedImageSize:(CGSize)a4
{
  double height;
  double width;
  double v6;
  double v7;
  double MidX;
  CGRect v11;
  CGRect v12;

  height = a4.height;
  width = a4.width;
  v6 = a3.height;
  v7 = a3.width;
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = v7;
  v11.size.height = v6;
  MidX = CGRectGetMidX(v11);
  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  v12.size.width = v7;
  v12.size.height = v6;
  return -[NUCropModel initWithMasterImageRect:stitchedImageRect:](self, "initWithMasterImageRect:stitchedImageRect:", 0.0, 0.0, v7, v6, MidX - width * 0.5, CGRectGetMidY(v12) - height * 0.5, width, height);
}

- (NUCropModel)initWithMasterImageRect:(CGRect)a3 stitchedImageRect:(CGRect)a4
{
  CGFloat x;
  CGFloat height;
  CGFloat v7;
  CGFloat width;
  CGFloat y;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  NUCropModel *v13;
  NUCropModel *v14;
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
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  objc_super v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;
  CGRect v57;
  CGRect v58;

  x = a3.origin.x;
  v56 = *MEMORY[0x1E0C80C00];
  if (a3.size.width < 1.0)
  {
    NUAssertLogger();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "masterImageRect.size.width >= 1");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v17;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v53 = v29;
        v54 = 2114;
        v55 = (uint64_t)v31;
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
      v53 = v22;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v32 = "masterImageRect.size.width >= 1";
    v33 = 156;
LABEL_32:

    _NUAssertFailHandler((uint64_t)"-[NUCropModel initWithMasterImageRect:stitchedImageRect:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUCropModel.mm", v33, CFSTR("Invalid parameter not satisfying: %s"), v47, v48, v49, v50, (uint64_t)v32);
  }
  height = a3.size.height;
  if (a3.size.height < 1.0)
  {
    NUAssertLogger();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "masterImageRect.size.height >= 1");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v24;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v19 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (v25)
    {
      if (v26)
      {
        v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v53 = v34;
        v54 = 2114;
        v55 = (uint64_t)v36;
        _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v28;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v32 = "masterImageRect.size.height >= 1";
    v33 = 157;
    goto LABEL_32;
  }
  v7 = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  v10 = a4.origin.x;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  if (!CGRectIsEmpty(a4))
  {
    v57.origin.x = v10;
    v57.origin.y = y;
    v57.size.width = width;
    v57.size.height = v7;
    v58.origin.x = x;
    v58.origin.y = v12;
    v58.size.width = v11;
    v58.size.height = height;
    if (!CGRectContainsRect(v57, v58))
    {
      NUAssertLogger();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "CGRectContainsRect(stitchedImageRect, masterImageRect)");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v53 = v38;
        _os_log_error_impl(&dword_1A6553000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger();
      v19 = objc_claimAutoreleasedReturnValue();
      v40 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
      if (v39)
      {
        if (v40)
        {
          v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
          v45 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v53 = v43;
          v54 = 2114;
          v46 = (void *)v45;
          v55 = v45;
          _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v40)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v53 = v42;
        _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      v32 = "CGRectContainsRect(stitchedImageRect, masterImageRect)";
      v33 = 160;
      goto LABEL_32;
    }
  }
  v51.receiver = self;
  v51.super_class = (Class)NUCropModel;
  v13 = -[NUCropModel init](&v51, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_masterImageRect.origin.x = x;
    v13->_masterImageRect.origin.y = v12;
    v13->_masterImageRect.size.width = v11;
    v13->_masterImageRect.size.height = height;
    v13->_fovRadians = 1.04719755;
    -[NUCropModel _setToDefaultValues](v13, "_setToDefaultValues");
  }
  return v14;
}

- (id)copyWithMasterImageSize:(CGSize)a3 fovRadians:(double)a4
{
  double width;
  double height;
  double *v8;
  double *v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  long double v17;
  NSObject *v19;
  void *v20;
  void *specific;
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
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  objc_super v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  width = a3.width;
  v52 = *MEMORY[0x1E0C80C00];
  if (a4 >= 3.14159265)
  {
    NUAssertLogger();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "fovRadians < M_PI");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v20;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v33;
        v50 = 2114;
        v51 = v35;
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
      v49 = v25;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCropModel copyWithMasterImageSize:fovRadians:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUCropModel.mm", 173, CFSTR("Invalid parameter not satisfying: %s"), v36, v37, v38, v39, (uint64_t)"fovRadians < M_PI");
  }
  if (a4 <= -3.14159265)
  {
    NUAssertLogger();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "fovRadians > -M_PI");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v27;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v40;
        v50 = 2114;
        v51 = v42;
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
      v49 = v32;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCropModel copyWithMasterImageSize:fovRadians:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUCropModel.mm", 174, CFSTR("Invalid parameter not satisfying: %s"), v43, v44, v45, v46, (uint64_t)"fovRadians > -M_PI");
  }
  height = a3.height;
  v47.receiver = self;
  v47.super_class = (Class)NUCropModel;
  v8 = (double *)-[NUCropModel copy](&v47, sel_copy);
  v9 = v8;
  if (v8)
  {
    v8[16] = 0.0;
    v8[17] = 0.0;
    v8[18] = width;
    v8[19] = height;
    v8[11] = a4;
    objc_msgSend(v8, "_setToDefaultValues");
    v10 = self->_masterImageRect.size.width;
    v11 = self->_masterImageRect.size.height;
    v12 = self->_cropRect.origin.x / v10 + -0.5;
    v13 = self->_cropRect.origin.y / v11 + -0.5;
    v14 = v12 + self->_cropRect.size.width / v10;
    v15 = v13 + self->_cropRect.size.height / v11;
    v16 = sin(self->_fovRadians);
    v17 = v16 / sin(a4);
    v9[4] = width * (v12 * v17 + 0.5);
    v9[5] = height * (v13 * v17 + 0.5);
    v9[6] = width * ((v14 - v12) * v17);
    v9[7] = height * ((v15 - v13) * v17);
  }
  return v9;
}

- (BOOL)hasCrop
{
  return !-[NUCropModel _hasDefaultValues](self, "_hasDefaultValues");
}

- (CGSize)masterImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_masterImageRect.size.width;
  height = self->_masterImageRect.size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NUCropModel;
  return -[NUCropModel hash](&v3, sel_hash);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[NUCropModel isEqualToCropModel:](self, "isEqualToCropModel:", v4);

  return v5;
}

- (BOOL)isEqualToCropModel:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  BOOL v43;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v4 = a3;
  -[NUCropModel masterImageRect](self, "masterImageRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "masterImageRect");
  v47.origin.x = v13;
  v47.origin.y = v14;
  v47.size.width = v15;
  v47.size.height = v16;
  v45.origin.x = v6;
  v45.origin.y = v8;
  v45.size.width = v10;
  v45.size.height = v12;
  if (!CGRectEqualToRect(v45, v47))
    goto LABEL_11;
  -[NUCropModel cropRect](self, "cropRect");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(v4, "cropRect");
  v48.origin.x = v25;
  v48.origin.y = v26;
  v48.size.width = v27;
  v48.size.height = v28;
  v46.origin.x = v18;
  v46.origin.y = v20;
  v46.size.width = v22;
  v46.size.height = v24;
  if (!CGRectEqualToRect(v46, v48))
    goto LABEL_11;
  v29 = -[NUCropModel aspectRatio](self, "aspectRatio");
  v31 = v30;
  v32 = objc_msgSend(v4, "aspectRatio");
  if (v29 | v31 && v32 | v33)
  {
    if (v33 * v29 != v32 * v31)
      goto LABEL_11;
  }
  else if ((v29 | v31) != 0 || (v32 | v33) != 0)
  {
    goto LABEL_11;
  }
  -[NUCropModel pitchDegreeUI](self, "pitchDegreeUI");
  v35 = v34;
  objc_msgSend(v4, "pitchDegreeUI");
  if (vabdd_f64(v35, v36) <= 0.05)
  {
    -[NUCropModel yawDegreeUI](self, "yawDegreeUI");
    v38 = v37;
    objc_msgSend(v4, "yawDegreeUI");
    if (vabdd_f64(v38, v39) <= 0.05)
    {
      -[NUCropModel rollDegreeUI](self, "rollDegreeUI");
      v41 = v40;
      objc_msgSend(v4, "rollDegreeUI");
      if (vabdd_f64(v41, v42) <= 0.05)
      {
        v43 = 1;
        goto LABEL_12;
      }
    }
  }
LABEL_11:
  v43 = 0;
LABEL_12:

  return v43;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  CGSize size;

  result = -[NUCropModel initWithMasterImageRect:](+[NUCropModel allocWithZone:](NUCropModel, "allocWithZone:", a3), "initWithMasterImageRect:", self->_masterImageRect.origin.x, self->_masterImageRect.origin.y, self->_masterImageRect.size.width, self->_masterImageRect.size.height);
  *((_OWORD *)result + 7) = self->_aspectRatio;
  size = self->_cropRect.size;
  *((_OWORD *)result + 2) = self->_cropRect.origin;
  *((CGSize *)result + 3) = size;
  *((_BYTE *)result + 96) = self->_isAutoCrop;
  *((_QWORD *)result + 8) = *(_QWORD *)&self->_pitchRadians;
  *((_QWORD *)result + 9) = *(_QWORD *)&self->_yawRadians;
  *((_QWORD *)result + 10) = *(_QWORD *)&self->_rollRadians;
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  CGSize size;
  void *v6;
  void *v7;
  _OWORD v9[2];

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  size = self->_masterImageRect.size;
  v9[0] = self->_masterImageRect.origin;
  v9[1] = size;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v9, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p image: %@ crop: %g,%g %gx%g ratio: %lu:%lu angles: [%g %g %g]>"), v4, self, v6, *(_QWORD *)&self->_cropRect.origin.x, *(_QWORD *)&self->_cropRect.origin.y, *(_QWORD *)&self->_cropRect.size.width, *(_QWORD *)&self->_cropRect.size.height, self->_aspectRatio.width, self->_aspectRatio.height, *(_QWORD *)&self->_pitchRadians, *(_QWORD *)&self->_yawRadians, *(_QWORD *)&self->_rollRadians);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGRect)_widestCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_masterImageRect.origin.x;
  y = self->_masterImageRect.origin.y;
  width = self->_masterImageRect.size.width;
  height = self->_masterImageRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)_defaultImageCenter
{
  double MidX;

  MidX = CGRectGetMidX(a1[4]);
  CGRectGetMidY(a1[4]);
  return MidX;
}

- (CGRect)_defaultCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_masterImageRect.origin.x;
  y = self->_masterImageRect.origin.y;
  width = self->_masterImageRect.size.width;
  height = self->_masterImageRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setToDefaultValues
{
  __int128 v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  int64_t v8;

  -[NUCropModel _defaultImageCenter](self, "_defaultImageCenter");
  *(_OWORD *)self->_imageCenter = v3;
  -[NUCropModel _defaultCropRect](self, "_defaultCropRect");
  self->_cropRect.origin.x = v4;
  self->_cropRect.origin.y = v5;
  self->_cropRect.size.width = v6;
  self->_cropRect.size.height = v7;
  self->_aspectRatio.width = objc_msgSend((id)objc_opt_class(), "freeFormAspectRatio");
  self->_aspectRatio.height = v8;
  self->_isAutoCrop = 0;
  -[NUCropModel setPitchRadians:](self, "setPitchRadians:", 0.0);
  -[NUCropModel setYawRadians:](self, "setYawRadians:", 0.0);
  -[NUCropModel setRollRadians:](self, "setRollRadians:", 0.0);
}

- (BOOL)_hasDefaultValues
{
  float64x2_t v3;
  float64x2_t v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  float64x2_t v14;
  CGRect v15;
  CGRect v16;

  if (fabs(self->_pitchRadians) > 0.000872664626)
    return 0;
  if (fabs(self->_yawRadians) > 0.000872664626)
    return 0;
  if (fabs(self->_rollRadians) > 0.000872664626)
    return 0;
  v14 = *(float64x2_t *)self->_imageCenter;
  -[NUCropModel _defaultImageCenter](self, "_defaultImageCenter");
  v4 = vsubq_f64(v14, v3);
  if (sqrt(vaddvq_f64(vmulq_f64(v4, v4))) >= 0.00001)
    return 0;
  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  -[NUCropModel _defaultCropRect](self, "_defaultCropRect");
  v16.origin.x = v9;
  v16.origin.y = v10;
  v16.size.width = v11;
  v16.size.height = v12;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  return CGRectEqualToRect(v15, v16) && -[NUCropModel aspectRatioIsFreeForm](self, "aspectRatioIsFreeForm");
}

- (uint64_t)_getBoundingQuad
{
  return objc_msgSend(a1, "_getBoundingQuadFromPitch:yaw:roll:", *((double *)a1 + 8), *((double *)a1 + 9), *((double *)a1 + 10));
}

- (uint64_t)_getBoundingQuadFromPitch:(double)a3 yaw:(double)a4 roll:(double)a5
{
  return objc_msgSend(a1, "_getBoundingQuadFromPitch:yaw:roll:withExpansionTol:", a3, a4, a5, 0.00001);
}

- (uint64_t)_getBoundingQuadFromPitch:(double)a3 yaw:(double)a4 roll:(double)a5 imageRect:(double)a6
{
  return objc_msgSend(a1, "_getBoundingQuadFromPitch:yaw:roll:withExpansionTol:imageRect:", a3, a4, a5, 0.00001, a6, a7, a8, a9);
}

- (uint64_t)_getBoundingQuadFromPitch:(double)a3 yaw:(double)a4 roll:(double)a5 withExpansionTol:
{
  double v10;
  double v11;
  double v12;
  double v13;

  objc_msgSend(a1, "masterImageRect");
  return objc_msgSend(a1, "_getBoundingQuadFromPitch:yaw:roll:withExpansionTol:imageRect:", a2, a3, a4, a5, v10, v11, v12, v13);
}

- (double)_getBoundingQuadFromPitch:(double)a3 yaw:(double)a4 roll:(CGFloat)a5 withExpansionTol:(CGFloat)a6 imageRect:(CGFloat)a7
{
  CGFloat v15;
  __int128 v16;
  CGFloat v17;
  __int128 v18;
  CGFloat v19;
  uint64_t i;
  uint64_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t *v24;
  uint64_t j;
  _OWORD v27[8];
  _OWORD v28[16];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  CGPoint origin;
  __int128 v34;
  CGSize size;
  __int128 v36;
  __int128 v37;
  CGRect v38;
  CGRect v39;

  v15 = -a4;
  v38.origin.x = a5;
  v38.origin.y = a6;
  v38.size.width = a7;
  v38.size.height = a8;
  v39 = CGRectInset(v38, v15, v15);
  v39.size.width = v39.origin.x + v39.size.width;
  *(CGFloat *)&v16 = v39.size.width;
  *((_QWORD *)&v16 + 1) = *(_QWORD *)&v39.origin.y;
  v17 = v39.origin.y + v39.size.height;
  *(CGFloat *)&v18 = v39.origin.x;
  *((_QWORD *)&v18 + 1) = *(_QWORD *)&v39.origin.y;
  v19 = v39.origin.y + v39.size.height;
  v29 = v18;
  v30 = 0u;
  v31 = v16;
  v32 = 0u;
  origin = v39.origin;
  v34 = 0u;
  size = v39.size;
  v36 = 0u;
  for (i = 24; i != 152; i += 32)
    *(_QWORD *)((char *)&v29 + i) = 0x3FF0000000000000;
  +[NUCropModel _imageTransformFromPitch:yaw:roll:imageRect:](NUCropModel, "_imageTransformFromPitch:yaw:roll:imageRect:", a1, a2, a3, a5, a6, a7, a8);
  v21 = 0;
  memset(v28, 0, sizeof(v28));
  v27[2] = v31;
  v27[3] = v32;
  v27[0] = v29;
  v27[1] = v30;
  v27[6] = size;
  v27[7] = v36;
  v27[4] = origin;
  v27[5] = v34;
  do
  {
    v23 = (float64x2_t)v27[v21];
    v22 = (float64x2_t)v27[v21 + 1];
    v24 = (float64x2_t *)&v28[v21];
    *v24 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)0, v23.f64[0]), (float64x2_t)0, v23, 1), (float64x2_t)0, v22.f64[0]), (float64x2_t)0, v22, 1);
    v24[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)0, v23.f64[0]), (float64x2_t)0, v23, 1), (float64x2_t)0, v22.f64[0]), (float64x2_t)0, v22, 1);
    v21 += 2;
  }
  while (v21 != 8);
  for (j = 0; j != 4; ++j)
    *(&v37 + j) = (__int128)vdivq_f64((float64x2_t)v28[2 * j], (float64x2_t)vdupq_laneq_s64((int64x2_t)v28[2 * j + 1], 1));
  return *(double *)&v37;
}

- (CGRect)integralCropRect:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[NUCropModel _integralCropRect:straightenAngle:anchorPoint:](self, "_integralCropRect:straightenAngle:anchorPoint:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, self->_rollRadians, a3.origin.x + a3.size.width * 0.5, a3.origin.y + a3.size.height * 0.5);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_integralCropRect:(CGRect)a3 straightenAngle:(double)a4 anchorPoint:(CGPoint)a5
{
  double height;
  double width;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  double v22;
  double v23;
  double v24;
  float64x2_t v25;
  float64x2_t v26;
  double v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  double v31;
  double v32;
  float64_t v33;
  double v34;
  double v35;
  double v36;
  double y;
  double v38;
  double v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45[4];
  CGPoint v46;
  CGPoint v47;
  CGPoint v48;
  CGRect v49;
  CGRect v50;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  x = a3.origin.x;
  v10 = 0.0;
  v11 = 0.0;
  if (a3.size.width != 0.0)
    v11 = (a5.x - a3.origin.x) / a3.size.width;
  if (a3.size.height != 0.0)
    v10 = (a5.y - a3.origin.y) / a3.size.height;
  y = a3.origin.y;
  v46.x = v11;
  v46.y = v10;
  v38 = _bestIntegralRectPreservingAspectRatioAndAnchor(a3, v46);
  v39 = v12;
  v14 = v13;
  v16 = v15;
  v17.f64[0] = v38;
  v17.f64[1] = v12;
  v40 = v17;
  -[NUCropModel _getBoundingQuadFromPitch:yaw:roll:](self, "_getBoundingQuadFromPitch:yaw:roll:", self->_pitchRadians, self->_yawRadians, a4);
  v45[0] = v18;
  v45[1] = v19;
  v45[2] = v20;
  v45[3] = v21;
  v18.f64[0] = v38 + v14;
  v19.f64[0] = v38 + v14;
  v19.f64[1] = v39;
  v41 = v40;
  v42 = v19;
  v20.f64[0] = v40.f64[0];
  v20.f64[1] = v39 + v16;
  v18.f64[1] = v39 + v16;
  v43 = v20;
  v44 = v18;
  if ((NU::Quad2d::simpleContains(v45, &v41) & 1) != 0)
    goto LABEL_7;
  v49.origin.x = x + v11;
  v49.origin.y = y + v10;
  v49.size.width = width + -1.0;
  v49.size.height = height + -1.0;
  v47.x = v11;
  v47.y = v10;
  v22 = _bestIntegralRectPreservingAspectRatioAndAnchor(v49, v47);
  v14 = v23;
  v16 = v24;
  v25.f64[0] = v22 + v23;
  v26.f64[0] = v22;
  v26.f64[1] = v27;
  v28.f64[0] = v25.f64[0];
  v28.f64[1] = v27;
  v41 = v26;
  v42 = v28;
  v28.f64[0] = v27 + v16;
  v40 = v26;
  v29.f64[0] = v26.f64[0];
  v29.f64[1] = v28.f64[0];
  v25.f64[1] = v28.f64[0];
  v43 = v29;
  v44 = v25;
  if ((NU::Quad2d::simpleContains(v45, &v41) & 1) != 0)
  {
LABEL_7:
    v30 = v40;
  }
  else
  {
    v50.origin.x = x + -v11 * -2.0;
    v50.origin.y = y + -v10 * -2.0;
    v50.size.width = width + -2.0;
    v50.size.height = height + -2.0;
    v48.x = v11;
    v48.y = v10;
    v30.f64[0] = _bestIntegralRectPreservingAspectRatioAndAnchor(v50, v48);
    v14 = v31;
    v16 = v32;
    v30.f64[1] = v33;
  }
  v34 = v30.f64[1];
  v35 = v14;
  v36 = v16;
  result.origin.x = v30.f64[0];
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  return result;
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setCropRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double MidX;
  CGRect v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  MidX = CGRectGetMidX(a3);
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  -[NUCropModel _setCropRect:anchor:](self, "_setCropRect:anchor:", x, y, width, height, MidX, CGRectGetMidY(v9));
}

- (void)_setCropRect:(CGRect)a3 anchor:(CGPoint)a4
{
  float64x2_t v5;
  float64x2_t v6;
  __int128 v7;
  __int128 v8;
  float64x2_t v9;
  double v10;
  double v11;
  float64x2_t v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat height;
  float64x2_t v20;
  CGFloat v21;
  CGFloat v22;
  CGSize size;
  NSObject *v24;
  void *v25;
  void *specific;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  CGFloat x;
  CGFloat y;
  CGPoint origin;
  double width;
  double rect2;
  double v57;
  float64x2_t v58[4];
  CGRect v59;
  _BYTE buf[32];
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  CGRect v64;
  CGRect v65;

  v63 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  if (a3.size.width < 1.0)
  {
    NUAssertLogger();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "cropRect.size.width >= 1");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v25;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v40;
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
      *(_QWORD *)&buf[4] = v30;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCropModel _setCropRect:anchor:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUCropModel.mm", 538, CFSTR("Invalid parameter not satisfying: %s"), v41, v42, v43, v44, (uint64_t)"cropRect.size.width >= 1");
  }
  if (a3.size.height < 1.0)
  {
    NUAssertLogger();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "cropRect.size.height >= 1");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v32;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (v33)
    {
      if (v35)
      {
        v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "componentsJoinedByString:", CFSTR("\n"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v45;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v47;
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
    _NUAssertFailHandler((uint64_t)"-[NUCropModel _setCropRect:anchor:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUCropModel.mm", 539, CFSTR("Invalid parameter not satisfying: %s"), v48, v49, v50, v51, (uint64_t)"cropRect.size.height >= 1");
  }
  x = a4.x;
  y = a4.y;
  width = a3.size.width;
  rect2 = a3.size.height;
  -[NUCropModel _getBoundingQuad](self, "_getBoundingQuad");
  *(float64x2_t *)buf = v5;
  *(float64x2_t *)&buf[16] = v6;
  v61 = v7;
  v62 = v8;
  v5.f64[0] = width;
  v5.f64[1] = rect2;
  origin = v59.origin;
  v9 = vaddq_f64(v5, (float64x2_t)v59.origin);
  v6.f64[0] = v59.origin.x;
  v6.f64[1] = v9.f64[1];
  v58[2] = v6;
  v58[3] = v9;
  v9.f64[1] = v59.origin.y;
  v58[0] = (float64x2_t)v59.origin;
  v58[1] = v9;
  v13 = v59.origin.y;
  if ((NU::Quad2d::simpleContains((float64x2_t *)buf, v58) & 1) != 0)
  {
    v14 = width;
    v15 = rect2;
  }
  else
  {
    v64.origin.x = NU::Quad2d::findInscribedUnscaledFitRect((NU::Quad2d *)buf, &v59, 1.0e-10, v10, v11, v12);
    v16 = v64.origin.x;
    v17 = v64.origin.y;
    v18 = v64.size.width;
    height = v64.size.height;
    v65.origin.x = origin.x;
    v65.size.width = width;
    v65.origin.y = origin.y;
    v65.size.height = rect2;
    if (CGRectEqualToRect(v64, v65))
    {
      v57 = width / rect2;
      v20.f64[0] = x;
      v20.f64[1] = y;
      v58[0] = v20;
      NU::Quad2d::findInscribedAxisAlignedAspectFitRectWithAnchor((float64x2_t *)buf, v58[0].f64, (uint64_t)&v59, (uint64_t)&v59, (uint64_t *)&v57, 0.000000953674316);
      v13 = v21;
      v59.origin.x = v22;
      v59.origin.y = v21;
      v59.size.width = v14;
      v59.size.height = v15;
    }
    else
    {
      v59.origin.x = v16;
      v59.origin.y = v17;
      v15 = height;
      v14 = v18;
      v13 = v17;
      v59.size.width = v18;
      v59.size.height = height;
    }
  }
  self->_hitVertexID = -[NUCropModel _hitMaskFromRect:](self, "_hitMaskFromRect:", v59.origin.x, v13, v14, v15);
  size = v59.size;
  self->_cropRect.origin = v59.origin;
  self->_cropRect.size = size;
  self->_isAutoCrop = 0;
}

- (void)_setCropRectWithConstantSize:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  double v12;
  double v13;
  CGPoint v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  double v27;
  double v28;
  CGPoint v29;
  float64_t v30;
  double v31;
  double v32;
  float64_t v33;
  CGPoint v34;
  float64_t v35;
  CGPoint v36;
  float64_t v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42[4];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[NUCropModel _getBoundingQuadFromPitch:yaw:roll:](self, "_getBoundingQuadFromPitch:yaw:roll:", self->_pitchRadians, self->_yawRadians, self->_rollRadians);
  v42[0] = v8;
  v42[1] = v9;
  v42[2] = v10;
  v42[3] = v11;
  v12 = floor(width);
  v13 = floor(height);
  v11.f64[0] = nearbyint(x);
  v11.f64[1] = nearbyint(y);
  v8.f64[0] = v11.f64[0] + v12;
  v10.f64[0] = v11.f64[0] + v12;
  v8.f64[1] = v11.f64[1];
  v38 = v11;
  v39 = v8;
  v36 = (CGPoint)v11;
  v9.f64[0] = v11.f64[0];
  v9.f64[1] = v11.f64[1] + v13;
  v10.f64[1] = v11.f64[1] + v13;
  v40 = v9;
  v41 = v10;
  if (!NU::Quad2d::simpleContains(v42, &v38))
  {
    v15.f64[0] = floor(x);
    v15.f64[1] = floor(y);
    v33 = v15.f64[1];
    v37 = v15.f64[0];
    v16.f64[0] = v15.f64[0] + v12;
    v16.f64[1] = v15.f64[1];
    v17.f64[0] = v15.f64[0];
    v17.f64[1] = v15.f64[1] + v13;
    v28 = v15.f64[0] + v12;
    v29 = (CGPoint)v15;
    v38 = v15;
    v39 = v16;
    v31 = v15.f64[1] + v13;
    v16.f64[1] = v15.f64[1] + v13;
    v40 = v17;
    v41 = v16;
    if (!NU::Quad2d::simpleContains(v42, &v38))
    {
      v18.f64[0] = ceil(x);
      v18.f64[1] = v33;
      v30 = v18.f64[0];
      v19.f64[0] = v18.f64[0] + v12;
      v19.f64[1] = v33;
      v20.f64[0] = v18.f64[0];
      v20.f64[1] = v31;
      v34 = (CGPoint)v18;
      v38 = v18;
      v39 = v19;
      v27 = v18.f64[0] + v12;
      v19.f64[1] = v31;
      v40 = v20;
      v41 = v19;
      if (NU::Quad2d::simpleContains(v42, &v38))
      {
        v14 = v34;
        goto LABEL_7;
      }
      v21.f64[0] = v37;
      v21.f64[1] = ceil(y);
      v22.f64[0] = v28;
      v23.f64[0] = v28;
      v23.f64[1] = v21.f64[1];
      v38 = v21;
      v39 = v23;
      v35 = v21.f64[1];
      v36 = (CGPoint)v21;
      v23.f64[0] = v21.f64[0];
      v23.f64[1] = v21.f64[1] + v13;
      v32 = v21.f64[1] + v13;
      v22.f64[1] = v21.f64[1] + v13;
      v40 = v23;
      v41 = v22;
      if (NU::Quad2d::simpleContains(v42, &v38))
        goto LABEL_2;
      v24.f64[0] = v30;
      v24.f64[1] = v35;
      v25.f64[0] = v27;
      v26.f64[0] = v27;
      v26.f64[1] = v35;
      v38 = v24;
      v39 = v26;
      v29 = (CGPoint)v24;
      v26.f64[0] = v24.f64[0];
      v26.f64[1] = v32;
      v25.f64[1] = v32;
      v40 = v26;
      v41 = v25;
      if (!NU::Quad2d::simpleContains(v42, &v38))
      {
        -[NUCropModel setCropRect:](self, "setCropRect:", x, y, v12, v13);
        goto LABEL_8;
      }
    }
    v14 = v29;
    goto LABEL_7;
  }
LABEL_2:
  v14 = v36;
LABEL_7:
  self->_cropRect.origin = v14;
  self->_cropRect.size.width = v12;
  self->_cropRect.size.height = v13;
LABEL_8:
  self->_isAutoCrop = 0;
}

- (unint64_t)_hitMaskFromRect:(CGRect)a3
{
  return -[NUCropModel _hitMaskFromRect:withTol:](self, "_hitMaskFromRect:withTol:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 2.0);
}

- (unint64_t)_hitMaskFromRect:(CGRect)a3 withTol:(double)a4
{
  __int128 v5;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  unint64_t v13;
  unint64_t result;
  unint64_t v15;
  float64x2_t v16;
  CGPoint origin;
  float64x2_t v18;
  CGSize size;
  float64x2_t v20[4];
  CGRect v21;

  v21 = CGRectInset(a3, -a4, -a4);
  v21.size.width = v21.origin.x + v21.size.width;
  *(CGFloat *)&v5 = v21.origin.x;
  *((_QWORD *)&v5 + 1) = *(_QWORD *)&v21.origin.y;
  v21.origin.x = v21.size.width;
  y = v21.origin.y;
  v16 = (float64x2_t)v5;
  origin = v21.origin;
  v21.origin.x = v21.origin.y + v21.size.height;
  *(_QWORD *)&v21.origin.y = v5;
  x = v21.origin.x;
  v8 = v21.origin.x;
  v18 = *(float64x2_t *)&v21.origin.y;
  size = v21.size;
  -[NUCropModel _getBoundingQuad](self, "_getBoundingQuad");
  v20[0] = v9;
  v20[1] = v10;
  v20[2] = v11;
  v20[3] = v12;
  v13 = NU::Quad2d::contains(v20, v16) ^ 1;
  if (!NU::Quad2d::contains(v20, (float64x2_t)origin))
    v13 |= 2uLL;
  if (!NU::Quad2d::contains(v20, v18))
    v13 |= 4uLL;
  if (NU::Quad2d::contains(v20, (float64x2_t)size))
    result = v13;
  else
    result = v13 | 8;
  if (self->_rollRadians == 0.0 && self->_pitchRadians == 0.0 && self->_yawRadians == 0.0)
  {
    if ((~(_BYTE)result & 3) != 0)
      v15 = result;
    else
      v15 = result | 0x10;
    if ((~(_BYTE)v15 & 5) == 0)
      v15 |= 0x40uLL;
    if ((~(_BYTE)v15 & 0xA) == 0)
      v15 |= 0x20uLL;
    if ((~(_BYTE)v15 & 0xC) != 0)
      return v15;
    else
      return v15 | 0x80;
  }
  return result;
}

- (void)_debugPrintHitMask
{
  -[NUCropModel _debugPrintHitMask:](self, "_debugPrintHitMask:", self->_hitVertexID);
}

- (void)_debugPrintHitMask:(unint64_t)a3
{
  char v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("Current crop rect intersect the image at : "));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((v3 & 1) != 0)
    objc_msgSend(v4, "appendFormat:", CFSTR(" BL"));
  if ((v3 & 2) != 0)
    objc_msgSend(v4, "appendFormat:", CFSTR(" BR"));
  if ((v3 & 4) != 0)
    objc_msgSend(v4, "appendFormat:", CFSTR(" TL"));
  if ((v3 & 8) != 0)
    objc_msgSend(v4, "appendFormat:", CFSTR(" TR"));
  if ((v3 & 0x10) != 0)
    objc_msgSend(v4, "appendFormat:", CFSTR(" B"));
  if ((v3 & 0x20) != 0)
    objc_msgSend(v4, "appendFormat:", CFSTR(" R"));
  if ((v3 & 0x40) != 0)
    objc_msgSend(v4, "appendFormat:", CFSTR(" L"));
  if (v3 < 0)
    objc_msgSend(v4, "appendFormat:", CFSTR(" T"));

}

- (CGRect)_anchorAlignedRectFromCandidate:(CGRect)a3 withAnchor:(CGPoint)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  int v8;
  CGFloat v9;
  double v10;
  double v11;
  float64x2_t v12;
  float64_t v13;
  float64x2_t v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = 0;
  v22 = a4.x;
  v23 = a4.y;
  v9 = a4.y;
  v25 = a3;
  if (a3.size.width >= a3.size.height)
    v10 = a3.size.height;
  else
    v10 = a3.size.width;
  v11 = v10 * 0.1;
  while (1)
  {
    v12.f64[0] = pointFromVertexID(&v25, v8);
    v12.f64[1] = v13;
    v14 = vsubq_f64((float64x2_t)a4, v12);
    if (sqrt(vaddvq_f64(vmulq_f64(v14, v14))) < v11)
      break;
    if (++v8 == 8)
      goto LABEL_9;
  }
  v16 = -(pointFromVertexID(&v25, v8) - v22);
  v17 = -(v15 - v23);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v27 = CGRectOffset(v26, v16, v17);
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;
LABEL_9:
  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)setAspectRatio:(id)a3
{
  self->_aspectRatio = ($5BB7312FFE32F1AB3F1F5957C99A58B3)a3;
  self->_isAutoCrop = 0;
}

- (BOOL)canGrowCropRect:(CGRect)a3 constrainWithAnchorPoint:(CGPoint)a4 strict:(BOOL)a5 withTol:(double)a6
{
  float64x2_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v19;
  double v20;
  double v21;
  float64x2_t v22[4];
  float64x2_t v23[4];

  -[NUCropModel _anchorAlignedRectFromCandidate:withAnchor:](self, "_anchorAlignedRectFromCandidate:withAnchor:", a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.x, a4.y);
  v20 = v8.f64[0];
  v21 = v9;
  v11 = v10;
  v13 = v12;
  v8.f64[1] = v9;
  v19 = v8;
  -[NUCropModel _getBoundingQuadFromPitch:yaw:roll:withExpansionTol:](self, "_getBoundingQuadFromPitch:yaw:roll:withExpansionTol:", self->_pitchRadians, self->_yawRadians, self->_rollRadians, a6);
  v23[0] = v14;
  v23[1] = v15;
  v23[2] = v16;
  v23[3] = v17;
  v14.f64[0] = v20 + v11;
  v15.f64[0] = v20 + v11;
  v15.f64[1] = v21;
  v16.f64[0] = v19.f64[0];
  v16.f64[1] = v21 + v13;
  v14.f64[1] = v21 + v13;
  v22[0] = v19;
  v22[1] = v15;
  v22[2] = v16;
  v22[3] = v14;
  return NU::Quad2d::simpleContains(v23, v22);
}

- (BOOL)imageContainsRect:(CGRect)a3 withTol:(double)a4
{
  double height;
  double width;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  double x;
  double y;
  float64x2_t v14;
  float64x2_t v15[4];
  float64x2_t v16[4];

  height = a3.size.height;
  width = a3.size.width;
  x = a3.origin.x;
  y = a3.origin.y;
  v6.f64[0] = a3.origin.x;
  v6.f64[1] = a3.origin.y;
  v14 = v6;
  -[NUCropModel _getBoundingQuadFromPitch:yaw:roll:withExpansionTol:](self, "_getBoundingQuadFromPitch:yaw:roll:withExpansionTol:", self->_pitchRadians, self->_yawRadians, self->_rollRadians, a4);
  v16[0] = v7;
  v16[1] = v8;
  v16[2] = v9;
  v16[3] = v10;
  v7.f64[0] = x + width;
  v8.f64[0] = x + width;
  v8.f64[1] = y;
  v9.f64[0] = v14.f64[0];
  v15[0] = v14;
  v15[1] = v8;
  v9.f64[1] = y + height;
  v7.f64[1] = y + height;
  v15[2] = v9;
  v15[3] = v7;
  return NU::Quad2d::simpleContains(v16, v15);
}

- (unint64_t)setCropRect:(CGRect)a3 constrainWithAnchorPoint:(CGPoint)a4
{
  return -[NUCropModel setCropRect:newCropRect:constrainWithAnchorPoint:](self, "setCropRect:newCropRect:constrainWithAnchorPoint:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *(_QWORD *)&a4.x, *(_QWORD *)&a4.y);
}

- (unint64_t)setCropRect:(CGRect)a3 newCropRect:(CGRect)a4 constrainWithAnchorPoint:(CGPoint)a5
{
  return -[NUCropModel setCropRect:newCropRect:constrainWithAnchorPoint:strict:](self, "setCropRect:newCropRect:constrainWithAnchorPoint:strict:", 1, *(_QWORD *)&a5.y, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (unint64_t)setCropRect:(CGRect)a3 newCropRect:(CGRect)a4 constrainWithAnchorPoint:(CGPoint)a5 strict:(BOOL)a6
{
  uint64_t v8;
  uint64_t v9;

  -[NUCropModel getCropRect:newCropRect:pitch:yaw:roll:constrainWithAnchorPoint:strict:aspectRatioIsFreeForm:hitVertexId:](self, "getCropRect:newCropRect:pitch:yaw:roll:constrainWithAnchorPoint:strict:aspectRatioIsFreeForm:hitVertexId:", *(_QWORD *)&a5.x, -[NUCropModel aspectRatioIsFreeForm](self, "aspectRatioIsFreeForm", *(_QWORD *)&a5.x, *(_QWORD *)&a5.y, a6), 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, *(_QWORD *)&self->_pitchRadians, *(_QWORD *)&self->_yawRadians, *(_QWORD *)&self->_rollRadians, v8, v9);
  -[NUCropModel _setCropRect:anchor:](self, "_setCropRect:anchor:");
  return self->_hitVertexID;
}

- (unint64_t)setForZoomCropRect:(CGRect)a3 newCropRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;
  CGFloat MidX;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  -[NUCropModel _widestCropRect](self, "_widestCropRect");
  if (v9 >= v13)
  {
    -[NUCropModel _widestCropRect](self, "_widestCropRect");
    if (v8 >= v14)
    {
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      v30.origin.x = v11;
      v30.origin.y = v10;
      v30.size.width = v9;
      v30.size.height = v8;
      if (CGRectContainsRect(v27, v30))
        return self->_hitVertexID;
    }
  }
  if (width < 2.0 || height < 2.0)
  {
    if (width >= height)
      v16 = height;
    else
      v16 = width;
    if (v16 < 0.01)
      return self->_hitVertexID;
    v17 = (width + width) / v16;
    v18 = (height + height) / v16;
    x = x - (v17 - width) * 0.5;
    v26 = y - (v18 - height) * 0.5;
    width = v17;
    height = v18;
  }
  else
  {
    v26 = y;
  }
  v28.origin.x = v11;
  v28.origin.y = v10;
  v28.size.width = v9;
  v28.size.height = v8;
  MidX = CGRectGetMidX(v28);
  v29.origin.x = v11;
  v29.origin.y = v10;
  v29.size.width = v9;
  v29.size.height = v8;
  -[NUCropModel getCropRect:newCropRect:pitch:yaw:roll:constrainWithAnchorPoint:strict:aspectRatioIsFreeForm:hitVertexId:](self, "getCropRect:newCropRect:pitch:yaw:roll:constrainWithAnchorPoint:strict:aspectRatioIsFreeForm:hitVertexId:", 1, 0, 0, v11, v10, v9, v8, x, v26, width, height, *(_QWORD *)&self->_pitchRadians, *(_QWORD *)&self->_yawRadians, *(_QWORD *)&self->_rollRadians, *(_QWORD *)&MidX, CGRectGetMidY(v29));
  v24 = vabdd_f64(v20, x);
  if (v24 >= 0.01 || vabdd_f64(v21, v26) >= 0.01 || vabdd_f64(v22, width) >= 0.01 || vabdd_f64(v23, height) >= 0.01)
  {
    -[NUCropModel _expandedCropRectForZoom:candidateRect:](self, "_expandedCropRectForZoom:candidateRect:");
    v24 = vabdd_f64(v20, x);
  }
  if (v24 >= 0.01 || vabdd_f64(v21, v26) >= 0.01 || vabdd_f64(v22, width) >= 0.01 || vabdd_f64(v23, height) >= 0.01)
    -[NUCropModel _expandedCropRectForZoom:candidateRect:](self, "_expandedCropRectForZoom:candidateRect:", v20, v21, v22, v23, x, v26, width, height);
  -[NUCropModel _setCropRect:anchor:](self, "_setCropRect:anchor:");
  return self->_hitVertexID;
}

- (CGRect)_expandedCropRectForZoom:(CGRect)a3 candidateRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat rect;
  CGPoint v37;
  float64x2_t v38[4];
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v39 = a3;
  v13 = -[NUCropModel _hitMaskFromRect:](self, "_hitMaskFromRect:");
  -[NUCropModel _getBoundingQuadFromPitch:yaw:roll:](self, "_getBoundingQuadFromPitch:yaw:roll:", self->_pitchRadians, self->_yawRadians, self->_rollRadians);
  v38[0] = v14;
  v38[1] = v15;
  v38[2] = v16;
  v38[3] = v17;
  v37.x = 0.0;
  v37.y = 0.0;
  if (canExpandWithAbsoluteAnchor(v13, v38, &v39, (float64x2_t *)&v37))
  {
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    rect = height;
    v18 = CGRectGetHeight(v40);
    v41.origin.x = v11;
    v41.origin.y = v10;
    v41.size.width = v9;
    v41.size.height = v8;
    v19 = CGRectGetHeight(v41);
    v42.size.width = width;
    v20 = v18 / v19;
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.height = rect;
    v21 = CGRectGetWidth(v42);
    v43.origin.x = v11;
    v43.origin.y = v10;
    v43.size.width = v9;
    v43.size.height = v8;
    v22 = v21 / CGRectGetWidth(v43);
    if (v20 < v22)
      v22 = v20;
    v23 = 0.0;
    v24 = 0.0;
    if (v9 != 0.0)
      v24 = (v37.x - v11) / v9;
    if (v8 != 0.0)
      v23 = (v37.y - v10) / v8;
    v25 = v11 + v24 * v9 - v24 * (v9 * v22);
    v26 = v10 + v23 * v8 - v23 * (v8 * v22);
    -[NUCropModel getCropRect:newCropRect:pitch:yaw:roll:constrainWithAnchorPoint:strict:aspectRatioIsFreeForm:hitVertexId:](self, "getCropRect:newCropRect:pitch:yaw:roll:constrainWithAnchorPoint:strict:aspectRatioIsFreeForm:hitVertexId:", 1, 0, 0, v25, v26, v9 * v22, v8 * v22, v25, v26, v9 * v22, v8 * v22, *(_QWORD *)&self->_pitchRadians, *(_QWORD *)&self->_yawRadians, *(_QWORD *)&self->_rollRadians, *(_QWORD *)&v37.x, *(_QWORD *)&v37.y);
    if (v29 >= v9 && v30 >= v8)
    {
      v10 = v28;
      v11 = v27;
      v8 = v30;
      v9 = v29;
    }
  }
  v32 = v11;
  v33 = v10;
  v34 = v9;
  v35 = v8;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (CGRect)getCropRect:(CGRect)a3 newCropRect:(CGRect)a4 pitch:(double)a5 yaw:(double)a6 roll:(double)a7 constrainWithAnchorPoint:(CGPoint)a8 strict:(BOOL)a9 aspectRatioIsFreeForm:(BOOL)a10 hitVertexId:(unint64_t *)a11
{
  _QWORD *v11;
  int y_low;
  char x_low;
  double height;
  double width;
  double y;
  double x;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  int64_t v36;
  int64_t v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  float64x2_t v44;
  float64x2_t v45;
  double v46;
  float64x2_t v47;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  int v66;
  float64x2_t v67;
  float64x2_t v68;
  float64x2_t v69;
  float64x2_t v70;
  float64x2_t v71;
  float64x2_t v72;
  int v73;
  float64x2_t i;
  float64x2_t v75;
  float64x2_t v76;
  int v77;
  _BOOL4 v78;
  int v79;
  float64x2_t v80;
  float64x2_t v81;
  float64x2_t v82;
  float64x2_t v83;
  float64x2_t v84;
  float64x2_t v85;
  int v86;
  float64x2_t j;
  float64x2_t v88;
  float64x2_t v89;
  int v90;
  _BOOL4 v91;
  NSObject *v92;
  void *v93;
  NSObject *v94;
  void *v95;
  void *v96;
  void *v97;
  float64x2_t v98;
  float64x2_t v99;
  NSObject *v100;
  void *v101;
  NSObject *v102;
  void *v103;
  void *v104;
  void *v105;
  NSObject *v106;
  void *v107;
  NSObject *v108;
  void *v109;
  void *v110;
  void *v111;
  float64x2_t v112;
  float64x2_t v113;
  NSObject *v114;
  void *v115;
  NSObject *v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  float64x2_t v149;
  float64x2_t v150;
  float64x2_t v151;
  double v152;
  double v153;
  double v154;
  double v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  uint64_t v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  CGVector v168;
  double v169;
  double v170;
  CGFloat v171;
  double v172;
  double v173;
  float64x2_t v174;
  float64x2_t v175;
  float64x2_t v176;
  __int128 v177;
  __int128 v178;
  double v179;
  double v180;
  float64x2_t v181;
  float64x2_t v182[4];
  float64x2_t v183;
  CGFloat v184;
  CGFloat v185;
  CGRect v186;
  __int128 v187;
  __int128 v188;
  float64x2_t origin;
  float64x2_t v190;
  float64x2_t v191;
  float64x2_t v192;
  float64x2_t v193;
  float64x2_t v194;
  _BYTE v195[32];
  _BYTE buf[32];
  uint64_t v197;
  float64x2_t v198;
  CGRect result;

  v11 = (_QWORD *)a9;
  y_low = LODWORD(a8.y);
  x_low = LOBYTE(a8.x);
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v197 = *MEMORY[0x1E0C80C00];
  v183.f64[0] = a3.origin.x;
  v183.f64[1] = a3.origin.y;
  v169 = a3.size.width;
  v170 = a3.size.height;
  v184 = a3.size.width;
  v185 = a3.size.height;
  v19 = 0.0;
  _ZF = a4.size.width == 0.0;
  v20 = 0.0;
  if (!_ZF)
    v20 = (v198.f64[0] - a4.origin.x) / width;
  if (a4.size.height != 0.0)
    v19 = (v198.f64[1] - y) / a4.size.height;
  v172 = v20;
  v173 = v19;
  v21 = a4.origin.x + v20 * (width + -2.0);
  v22 = y + v19 * (a4.size.height + -2.0);
  v23 = fmin(x, v21);
  v24 = fmin(y, v22);
  v25 = fmax(x + width, v21 + 2.0) - v23;
  v26 = fmax(y + a4.size.height, v22 + 2.0) - v24;
  -[NUCropModel _getBoundingQuadFromPitch:yaw:roll:](self, "_getBoundingQuadFromPitch:yaw:roll:", *(_QWORD *)&a8.x, *(_QWORD *)&a8.y, a9, a10, a11, a5, a6, a7);
  v167 = (__int128)v28;
  v168 = (CGVector)v27;
  v182[0] = v27;
  v182[1] = v28;
  v165 = (__int128)v30;
  v166 = (__int128)v29;
  v182[2] = v29;
  v182[3] = v30;
  -[NUCropModel _anchorAlignedRectFromCandidate:withAnchor:](self, "_anchorAlignedRectFromCandidate:withAnchor:", v23, v24, v25, v26, *(_OWORD *)&v198);
  v186.origin.x = v33;
  v186.origin.y = v34;
  v186.size.width = v31;
  v186.size.height = v32;
  if (self->_aspectRatio.width)
    _ZF = self->_aspectRatio.height == 0;
  else
    _ZF = 1;
  if (_ZF)
    v36 = (uint64_t)v169;
  else
    v36 = self->_aspectRatio.width;
  if (_ZF)
    v37 = (uint64_t)v170;
  else
    v37 = self->_aspectRatio.height;
  if ((y_low & 1) != 0)
  {
    v38 = v31;
    v39 = v32;
  }
  else
  {
    v40 = aspectRatioConstrainedFromRect(v36, v37, x, y, width, height, v198.f64[0], v198.f64[1], width * height);
    v38 = v41;
    v39 = v42;
    v186.origin.x = v40;
    v186.origin.y = v43;
    v186.size.width = v41;
    v186.size.height = v42;
  }
  v181 = v198;
  v44.f64[0] = v186.origin.x;
  v45.f64[0] = v38 + v186.origin.x;
  v46 = v186.origin.y;
  v47.f64[1] = v186.origin.y;
  v47.f64[0] = v38 + v186.origin.x;
  origin = (float64x2_t)v186.origin;
  v190 = v47;
  v171 = v186.origin.x;
  v44.f64[1] = v186.origin.y + v39;
  v45.f64[1] = v186.origin.y + v39;
  v191 = v44;
  v192 = v45;
  if ((NU::Quad2d::simpleContains(v182, &origin) & 1) == 0)
  {
    if (!y_low)
    {
      v64 = (double)v36 / (double)v37;
      v65 = INFINITY;
      if (!v36)
        v65 = NAN;
      if (!v37)
        v64 = v65;
      origin.f64[0] = v64;
      NU::Quad2d::findInscribedAxisAlignedAspectFitRectWithAnchor(v182, v181.f64, (uint64_t)&v183, (uint64_t)&v186, (uint64_t *)&origin, 0.000244140625);
      goto LABEL_116;
    }
    if (fabs(v172 + -0.5) < 0.01 && (fabs(v173 + -1.0) < 0.01 || fabs(v173) < 0.01))
    {
      NU::RectT<double>::RectT(v193.f64, &v186);
      v66 = 100;
      v67 = v193;
      while (1)
      {
        v174 = v194;
        v68 = vaddq_f64(v67, v194);
        v69.f64[0] = v68.f64[0];
        v69.f64[1] = v67.f64[1];
        origin = v67;
        v190 = v69;
        v67.f64[1] = v68.f64[1];
        v191 = v67;
        v192 = v68;
        if ((NU::Quad2d::simpleContains(v182, &origin) & 1) != 0 || !v66)
          break;
        v193 = vsubq_f64(v193, v198);
        NU::RectT<double>::scale(v193.f64, 1.0, 0.5);
        v67 = vaddq_f64(v198, v193);
        v193 = v67;
        --v66;
      }
      v70.f64[0] = v193.f64[0];
      v71 = vaddq_f64(v193, v174);
      v72.f64[0] = v71.f64[0];
      origin = v193;
      v72.f64[1] = v193.f64[1];
      v190 = v72;
      v70.f64[1] = v71.f64[1];
      v191 = v70;
      v192 = v71;
      if ((NU::Quad2d::simpleContains(v182, &origin) & 1) != 0)
      {
        NU::RectT<double>::RectT((double *)buf, &v186);
        v73 = 100;
        for (i = *(float64x2_t *)buf; ; *(float64x2_t *)buf = i)
        {
          v175 = *(float64x2_t *)&buf[16];
          v75 = vaddq_f64(i, *(float64x2_t *)&buf[16]);
          v76.f64[0] = v75.f64[0];
          v76.f64[1] = i.f64[1];
          origin = i;
          v190 = v76;
          i.f64[1] = v75.f64[1];
          v191 = i;
          v192 = v75;
          v77 = NU::Quad2d::simpleContains(v182, &origin);
          _CF = v73-- != 0;
          v78 = _CF;
          if (!v77 || !v78)
            break;
          *(float64x2_t *)buf = vsubq_f64(*(float64x2_t *)buf, v198);
          NU::RectT<double>::scale((double *)buf, 1.0, 2.0);
          i = vaddq_f64(v198, *(float64x2_t *)buf);
        }
        v98 = vaddq_f64(*(float64x2_t *)buf, v175);
        v99.f64[0] = *(float64_t *)buf;
        v99.f64[1] = v98.f64[1];
        v191 = v99;
        v192 = v98;
        v98.f64[1] = *(float64_t *)&buf[8];
        v177 = *(_OWORD *)buf;
        origin = *(float64x2_t *)buf;
        v190 = v98;
        if (!NU::Quad2d::simpleContains(v182, &origin))
        {
          *(_QWORD *)&origin.f64[0] = &off_1E505F5C0;
          v190 = v198;
          *(float64x2_t *)v195 = v193;
          *(float64x2_t *)&v195[16] = v194;
          v187 = v177;
          v188 = *(_OWORD *)&buf[16];
          v60 = NU::Quad2d::computeLimitRect(v182, (uint64_t)v195, (uint64_t)&v187, (uint64_t)&origin, 0.000000953674316);
          goto LABEL_116;
        }
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_10081);
        v100 = (id)_NUAssertLogger;
        if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("findInscribedAxisAlignedFitRectWithAnchorVert : Cannot find a valid initial seed for solver"));
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v195 = 138543362;
          *(_QWORD *)&v195[4] = v101;
          _os_log_impl(&dword_1A6553000, v100, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", v195, 0xCu);

        }
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_10081);
          v102 = (id)_NUAssertLogger;
          if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
          {
            v103 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "componentsJoinedByString:", CFSTR("\n"));
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v195 = 138543618;
            *(_QWORD *)&v195[4] = v103;
            *(_WORD *)&v195[12] = 2114;
            *(_QWORD *)&v195[14] = v105;
            _os_log_error_impl(&dword_1A6553000, v102, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v195, 0x16u);

          }
        }
        else
        {
          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_10081);
          v102 = (id)_NUAssertLogger;
          if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v160, "componentsJoinedByString:", CFSTR("\n"));
            v161 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v195 = 138543362;
            *(_QWORD *)&v195[4] = v161;
            _os_log_error_impl(&dword_1A6553000, v102, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v195, 0xCu);

          }
        }

        _NUAssertContinueHandler((uint64_t)"const CGRect NU::Quad2d::findInscribedAxisAlignedFitRectWithAnchorVert(const simd_double2 &, const CGRect &, const double) const", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUQuad2.h", 719, CFSTR("findInscribedAxisAlignedFitRectWithAnchorVert : Cannot find a valid initial seed for solver"), v128, v129, v130, v131, v164);
      }
      else
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_10081);
        v92 = (id)_NUAssertLogger;
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("findInscribedAxisAlignedFitRectWithAnchorVert : Cannot find a valid initial seed for solver"));
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v93;
          _os_log_impl(&dword_1A6553000, v92, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

        }
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_10081);
          v94 = (id)_NUAssertLogger;
          if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
          {
            v95 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "componentsJoinedByString:", CFSTR("\n"));
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v95;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v97;
            _os_log_error_impl(&dword_1A6553000, v94, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

          }
        }
        else
        {
          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_10081);
          v94 = (id)_NUAssertLogger;
          if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v156, "componentsJoinedByString:", CFSTR("\n"));
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v157;
            _os_log_error_impl(&dword_1A6553000, v94, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

          }
        }

        _NUAssertContinueHandler((uint64_t)"const CGRect NU::Quad2d::findInscribedAxisAlignedFitRectWithAnchorVert(const simd_double2 &, const CGRect &, const double) const", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUQuad2.h", 705, CFSTR("findInscribedAxisAlignedFitRectWithAnchorVert : Cannot find a valid initial seed for solver"), v120, v121, v122, v123, v164);
      }
    }
    else
    {
      if (fabs(v173 + -0.5) >= 0.01 || fabs(v172 + -1.0) >= 0.01 && fabs(v172) >= 0.01)
      {
        __asm { FMOV            V1.2D, #1.0 }
        origin = v183;
        v190 = _Q1;
        NU::Quad2d::findInscribedAxisAlignedFitRectWithAnchor(v182, &v181, (uint64_t)&origin, (uint64_t)&v186);
LABEL_116:
        if ((x_low & 1) == 0)
          deriveScaledRectFromConstrainedRect(v60, v61, v62, v63, v171, v46, v38, v39, v52, v53, v54, v55, v56, v57, v58, v59, v168, v167, v166,
            v165);
        v186.origin.x = v60;
        v38 = v62;
        v46 = v61;
        v39 = v63;
        goto LABEL_119;
      }
      NU::RectT<double>::RectT(v193.f64, &v186);
      v79 = 100;
      v80 = v193;
      while (1)
      {
        v176 = v194;
        v81 = vaddq_f64(v80, v194);
        v82.f64[0] = v81.f64[0];
        v82.f64[1] = v80.f64[1];
        origin = v80;
        v190 = v82;
        v80.f64[1] = v81.f64[1];
        v191 = v80;
        v192 = v81;
        if ((NU::Quad2d::simpleContains(v182, &origin) & 1) != 0 || !v79)
          break;
        v193 = vsubq_f64(v193, v198);
        NU::RectT<double>::scale(v193.f64, 0.5, 1.0);
        v80 = vaddq_f64(v198, v193);
        v193 = v80;
        --v79;
      }
      v83.f64[0] = v193.f64[0];
      v84 = vaddq_f64(v193, v176);
      v85.f64[0] = v84.f64[0];
      origin = v193;
      v85.f64[1] = v193.f64[1];
      v190 = v85;
      v83.f64[1] = v84.f64[1];
      v191 = v83;
      v192 = v84;
      if ((NU::Quad2d::simpleContains(v182, &origin) & 1) != 0)
      {
        NU::RectT<double>::RectT((double *)buf, &v186);
        v86 = 100;
        for (j = *(float64x2_t *)buf; ; *(float64x2_t *)buf = j)
        {
          v88 = vaddq_f64(j, *(float64x2_t *)&buf[16]);
          v89.f64[0] = v88.f64[0];
          v89.f64[1] = j.f64[1];
          origin = j;
          v190 = v89;
          j.f64[1] = v88.f64[1];
          v191 = j;
          v192 = v88;
          v90 = NU::Quad2d::contains(v182, &origin);
          _CF = v86-- != 0;
          v91 = _CF;
          if (!v90 || !v91)
            break;
          *(float64x2_t *)buf = vsubq_f64(*(float64x2_t *)buf, v198);
          NU::RectT<double>::scale((double *)buf, 2.0, 1.0);
          j = vaddq_f64(v198, *(float64x2_t *)buf);
        }
        v112 = vaddq_f64(*(float64x2_t *)buf, *(float64x2_t *)&buf[16]);
        v113.f64[0] = *(float64_t *)buf;
        v113.f64[1] = v112.f64[1];
        v191 = v113;
        v192 = v112;
        v112.f64[1] = *(float64_t *)&buf[8];
        v178 = *(_OWORD *)buf;
        origin = *(float64x2_t *)buf;
        v190 = v112;
        if (!NU::Quad2d::simpleContains(v182, &origin))
        {
          *(_QWORD *)&origin.f64[0] = &off_1E505F5F0;
          v190 = v198;
          *(float64x2_t *)v195 = v193;
          *(float64x2_t *)&v195[16] = v194;
          v187 = v178;
          v188 = *(_OWORD *)&buf[16];
          v60 = NU::Quad2d::computeLimitRect(v182, (uint64_t)v195, (uint64_t)&v187, (uint64_t)&origin, 0.000000953674316);
          goto LABEL_116;
        }
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_10081);
        v114 = (id)_NUAssertLogger;
        if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("findInscribedAxisAlignedFitRectWithAnchorVert : Cannot find a valid initial seed for solver"));
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v195 = 138543362;
          *(_QWORD *)&v195[4] = v115;
          _os_log_impl(&dword_1A6553000, v114, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", v195, 0xCu);

        }
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_10081);
          v116 = (id)_NUAssertLogger;
          if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
          {
            v117 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v118, "componentsJoinedByString:", CFSTR("\n"));
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v195 = 138543618;
            *(_QWORD *)&v195[4] = v117;
            *(_WORD *)&v195[12] = 2114;
            *(_QWORD *)&v195[14] = v119;
            _os_log_error_impl(&dword_1A6553000, v116, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v195, 0x16u);

          }
        }
        else
        {
          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_10081);
          v116 = (id)_NUAssertLogger;
          if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v162, "componentsJoinedByString:", CFSTR("\n"));
            v163 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v195 = 138543362;
            *(_QWORD *)&v195[4] = v163;
            _os_log_error_impl(&dword_1A6553000, v116, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v195, 0xCu);

          }
        }

        _NUAssertContinueHandler((uint64_t)"const CGRect NU::Quad2d::findInscribedAxisAlignedFitRectWithAnchorHorz(const simd_double2 &, const CGRect &, const double) const", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUQuad2.h", 758, CFSTR("findInscribedAxisAlignedFitRectWithAnchorVert : Cannot find a valid initial seed for solver"), v132, v133, v134, v135, v164);
      }
      else
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_10081);
        v106 = (id)_NUAssertLogger;
        if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("findInscribedAxisAlignedFitRectWithAnchorHorz : Cannot find a valid initial seed for solver"));
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v107;
          _os_log_impl(&dword_1A6553000, v106, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

        }
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_10081);
          v108 = (id)_NUAssertLogger;
          if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
          {
            v109 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "componentsJoinedByString:", CFSTR("\n"));
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v109;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v111;
            _os_log_error_impl(&dword_1A6553000, v108, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

          }
        }
        else
        {
          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_10081);
          v108 = (id)_NUAssertLogger;
          if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v158, "componentsJoinedByString:", CFSTR("\n"));
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v159;
            _os_log_error_impl(&dword_1A6553000, v108, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

          }
        }

        _NUAssertContinueHandler((uint64_t)"const CGRect NU::Quad2d::findInscribedAxisAlignedFitRectWithAnchorHorz(const simd_double2 &, const CGRect &, const double) const", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Crop/NUQuad2.h", 745, CFSTR("findInscribedAxisAlignedFitRectWithAnchorHorz : Cannot find a valid initial seed for solver"), v124, v125, v126, v127, v164);
      }
    }
    v63 = v39;
    v62 = v38;
    v61 = v46;
    v60 = v171;
    goto LABEL_116;
  }
LABEL_119:
  if (self->_rollRadians == 0.0 && self->_pitchRadians == 0.0 && self->_yawRadians == 0.0)
  {
    -[NUCropModel _widestCropRect](self, "_widestCropRect");
    if (v136 >= v186.origin.x)
      v137 = v136;
    else
      v137 = v186.origin.x;
    v186.origin.x = v137;
    -[NUCropModel _widestCropRect](self, "_widestCropRect");
    if (v138 >= v46)
      v46 = v138;
    -[NUCropModel _widestCropRect](self, "_widestCropRect");
    if (v139 - v137 < v38)
      v38 = v139 - v137;
    -[NUCropModel _widestCropRect](self, "_widestCropRect");
    if (v140 - v46 < v39)
      v39 = v140 - v46;
  }
  v141 = v186.origin.x;
  if (v11)
    *v11 = -[NUCropModel _hitMaskFromRect:](self, "_hitMaskFromRect:", v186.origin.x, v46, v38, v39);
  v142 = v141 + v172 * (v38 + -2.0);
  v143 = v46 + v173 * (v39 + -2.0);
  v144 = fmin(v141, v142);
  v145 = fmin(v46, v143);
  v146 = fmax(v141 + v38, v142 + 2.0);
  v147 = v146 - v144;
  v148 = fmax(v46 + v39, v143 + 2.0) - v145;
  v149.f64[0] = v144;
  v149.f64[1] = v145;
  v179 = v144;
  v180 = v145;
  v150.f64[0] = v144 + v146 - v144;
  v151.f64[0] = v150.f64[0];
  v151.f64[1] = v145;
  origin = v149;
  v190 = v151;
  v149.f64[1] = v145 + v148;
  v150.f64[1] = v145 + v148;
  v191 = v149;
  v192 = v150;
  if ((NU::Quad2d::simpleContains(v182, &origin) & 1) == 0)
  {
    v148 = v39;
    v147 = v38;
    v180 = v46;
    v179 = v141;
  }
  v152 = v179;
  v153 = v180;
  v154 = v147;
  v155 = v148;
  result.size.height = v155;
  result.size.width = v154;
  result.origin.y = v153;
  result.origin.x = v152;
  return result;
}

- (CGRect)getCropRectThatCompletelyContainsMasterImageForPitch:(double)a3 yaw:(double)a4 roll:(double)a5
{
  double v9;
  double v10;
  double v11;
  double v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  BOOL v37;
  double v38;
  double v39;
  double v40;
  float64x2_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  float64x2_t v46;
  float64x2_t v47;
  float64x2_t v48;
  float64x2_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGFloat MidX;
  double v56;
  double v57;
  double v58;
  double v59;
  float64x2_t v60;
  double v61;
  double v62;
  double v63;
  float64x2_t v64[4];
  float64x2_t v65[4];
  float64x2_t v66[4];
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect result;
  CGRect v73;

  -[NUCropModel masterImageRect](self, "masterImageRect");
  -[NUCropModel _getBoundingQuadFromPitch:yaw:roll:imageRect:](self, "_getBoundingQuadFromPitch:yaw:roll:imageRect:", a3, a4, a5, v9, v10, v11, v12);
  v66[0] = v13;
  v66[1] = v14;
  v66[2] = v15;
  v66[3] = v16;
  v17 = NU::Quad2d::boundingRect(v66);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[NUCropModel cropRect](self, "cropRect");
  v73.origin.x = v17;
  v73.origin.y = v19;
  v73.size.width = v21;
  v73.size.height = v23;
  if (CGRectContainsRect(v67, v73))
  {
    -[NUCropModel cropRect](self, "cropRect");
LABEL_13:
    v40 = v26;
    v31 = v27;
    goto LABEL_14;
  }
  v68.origin.x = v17;
  v68.origin.y = v19;
  v68.size.width = v21;
  v68.size.height = v23;
  v28 = round(CGRectGetMidX(v68));
  v69.origin.x = v17;
  v69.origin.y = v19;
  v69.size.width = v21;
  v69.size.height = v23;
  v29 = round(CGRectGetMidY(v69));
  v30 = round(v21);
  v31 = round(v23);
  v32 = v30 / v31;
  -[NUCropModel cropRect](self, "cropRect");
  v33 = -[NUCropModel _currentAspectRatio:](self, "_currentAspectRatio:");
  v35 = (double)v33 / (double)v34;
  v36 = INFINITY;
  if (!v33)
    v36 = NAN;
  if (!v34)
    v35 = v36;
  v37 = v32 < v35;
  v38 = round(v31 * v32 / v35);
  v39 = round(v30 * v35 / v32);
  if (v37)
  {
    v40 = v39;
  }
  else
  {
    v31 = v38;
    v40 = v30;
  }
  v41.f64[0] = v28 - v40 * 0.5;
  v62 = v41.f64[0];
  v63 = v29 - v31 * 0.5;
  v41.f64[1] = v63;
  v60 = v41;
  -[NUCropModel masterImageRect](self, "masterImageRect");
  -[NUCropModel _getBoundingQuadFromPitch:yaw:roll:imageRect:](self, "_getBoundingQuadFromPitch:yaw:roll:imageRect:", a3, a4, a5, v42, v43, v44, v45);
  v65[0] = v46;
  v65[1] = v47;
  v65[2] = v48;
  v65[3] = v49;
  v46.f64[0] = v40 + v62;
  v47.f64[0] = v40 + v62;
  v47.f64[1] = v63;
  v48.f64[0] = v60.f64[0];
  v64[0] = v60;
  v64[1] = v47;
  v48.f64[1] = v31 + v63;
  v46.f64[1] = v31 + v63;
  v64[2] = v48;
  v64[3] = v46;
  if ((NU::Quad2d::contains(v65, v64) & 1) == 0)
  {
    -[NUCropModel cropRect](self, "cropRect");
    v59 = v51;
    v61 = v50;
    v53 = v52;
    v58 = v54;
    -[NUCropModel cropRect](self, "cropRect");
    MidX = CGRectGetMidX(v70);
    -[NUCropModel cropRect](self, "cropRect");
    -[NUCropModel getCropRect:newCropRect:pitch:yaw:roll:constrainWithAnchorPoint:strict:aspectRatioIsFreeForm:hitVertexId:](self, "getCropRect:newCropRect:pitch:yaw:roll:constrainWithAnchorPoint:strict:aspectRatioIsFreeForm:hitVertexId:", 1, -[NUCropModel aspectRatioIsFreeForm](self, "aspectRatioIsFreeForm"), 0, v61, v59, v53, v58, v62, v63, v40, v31, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&MidX, CGRectGetMidY(v71));
    goto LABEL_13;
  }
  v24 = v28 - v40 * 0.5;
  v25 = v29 - v31 * 0.5;
LABEL_14:
  v56 = v40;
  v57 = v31;
  result.size.height = v57;
  result.size.width = v56;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (unint64_t)constrainedMoveCropRectBy:(CGVector)a3
{
  return -[NUCropModel constrainedMoveCropRectBy:strict:](self, "constrainedMoveCropRectBy:strict:", 1, a3.dx, a3.dy);
}

- (unint64_t)constrainedMoveCropRectBy:(CGVector)a3 strict:(BOOL)a4
{
  return -[NUCropModel constrainedMoveCropRectBy:strict:startRect:](self, "constrainedMoveCropRectBy:strict:startRect:", a4, a3.dx, a3.dy, self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height);
}

- (unint64_t)constrainedMoveCropRectBy:(CGVector)a3 strict:(BOOL)a4 startRect:(CGRect)a5
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  CGFloat dy;
  CGFloat dx;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  double v17;
  CGFloat v18;
  CGRect *p_cropRect;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  float64x2_t v23;
  double v24;
  float64x2_t v25;
  float64x2_t v26;
  CGSize v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  float64x2_t v36;
  double v37;
  double v38;
  double v39;
  float64x2_t v40;
  float64x2_t v41;
  float64_t v42;
  float64x2_t v43;
  double v44;
  CGSize v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat MidY;
  float64x2_t v54;
  float64x2_t v55;
  float64_t v56;
  double v57;
  float64_t v58;
  float64x2_t v66;
  CGSize v67;
  CGSize v68;
  float64x2_t v69;
  float64x2_t v70;
  CGPoint origin;
  CGPoint v72;
  double v73;
  __n128 v74;
  __n128 v75;
  __n128 v76;
  __n128 v77;
  float64x2_t v78;
  CGFloat rect2;
  CGSize rect2a;
  float64x2_t rect2b;
  CGFloat rect2c;
  double v83;
  float64x2_t v84[4];
  void (**v85)(NU::PathRectFinder *__hidden);
  float64x2_t v86[2];
  float64x2_t v87;
  CGSize v88;
  CGSize v89;
  float64x2_t v90;
  float64x2_t v91;
  CGSize size;
  CGSize v93;
  CGPoint v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  dy = a3.dy;
  dx = a3.dx;
  -[NUCropModel _getBoundingQuadFromPitch:yaw:roll:](self, "_getBoundingQuadFromPitch:yaw:roll:", self->_pitchRadians, self->_yawRadians, self->_rollRadians);
  v76 = (__n128)v14;
  v77 = (__n128)v13;
  v84[0] = v13;
  v84[1] = v14;
  v74 = (__n128)v16;
  v75 = (__n128)v15;
  v84[2] = v15;
  v84[3] = v16;
  v13.f64[0] = x;
  v14.f64[0] = y;
  v15.f64[0] = width;
  v16.f64[0] = height;
  v96 = CGRectOffset(*(CGRect *)((char *)&v14 - 8), dx, dy);
  v17 = v96.size.height;
  v96.size.height = v96.origin.x;
  v18 = v96.origin.y;
  p_cropRect = &self->_cropRect;
  origin = self->_cropRect.origin;
  v72 = v96.origin;
  v78 = *(float64x2_t *)&v96.size.height;
  rect2 = v96.size.width;
  v96.origin.x = v96.origin.x + v96.size.width;
  v96.size.width = v96.origin.x;
  v20 = v96.origin.y;
  v91 = *(float64x2_t *)&v96.size.height;
  size = v96.size;
  v73 = v96.origin.y;
  v96.size.width = v96.size.height;
  v21 = v96.origin.y + v17;
  v22 = v96.origin.y + v17;
  v93 = v96.size;
  v94 = v96.origin;
  if ((NU::Quad2d::contains(v84, &v91) & 1) == 0)
  {
    v83 = width / height;
    v25 = (float64x2_t)self->_cropRect.size;
    v95.origin = p_cropRect->origin;
    v95.size = (CGSize)v25;
    rect2a = (CGSize)v25;
    v26 = vaddq_f64(v25, (float64x2_t)v95.origin);
    v27.width = v26.f64[0];
    v27.height = v95.origin.y;
    v91 = (float64x2_t)v95.origin;
    size = v27;
    v68 = v27;
    v27.width = v95.origin.x;
    v27.height = v26.f64[1];
    v67 = v27;
    v93 = v27;
    v94 = (CGPoint)v26;
    v69 = v26;
    v70 = (float64x2_t)v95.origin;
    v28 = NU::Quad2d::equivalentWithTolerance(v84, &v91, 0.000244140625);
    v36.f64[0] = v70.f64[0];
    v17 = rect2a.height;
    v24 = rect2a.width;
    v37 = v70.f64[1];
    if ((v28 & 1) == 0)
    {
      v87 = v70;
      v88 = v68;
      v89 = v67;
      v90 = v69;
      if ((NU::Quad2d::contains(v84, &v87) & 1) != 0)
      {
        v41 = vsubq_f64(v78, (float64x2_t)origin);
        v87 = (float64x2_t)v95.origin;
        v88 = v95.size;
        rect2b = vmulq_n_f64(v41, 1.0 / sqrt(vaddvq_f64(vmulq_f64(v41, v41))));
        NU::Quad2d::boundingRect(v84);
        v43.f64[1] = v42;
        v44 = sqrt(vaddvq_f64(vmulq_f64(v43, v43)));
        v45 = self->_cropRect.size;
        v86[0] = (float64x2_t)p_cropRect->origin;
        v86[1] = (float64x2_t)v45;
        v86[0] = vmlaq_n_f64(v86[0], rect2b, v44);
        v85 = &off_1E505F530;
        v46 = NU::Quad2d::computeLimitRect(v84, (uint64_t)&v87, (uint64_t)v86, (uint64_t)&v85, 0.000244140625);
      }
      else
      {
        v97.origin.x = NU::Quad2d::findInscribedUnscaledFitRect((NU::Quad2d *)v84, &v95, 0.000000953674316, v38, v39, v40);
        v49 = v97.origin.x;
        v50 = v97.origin.y;
        v51 = v97.size.width;
        v52 = v97.size.height;
        v98.origin = (CGPoint)v70;
        v98.size = rect2a;
        v28 = CGRectEqualToRect(v97, v98);
        if (!(_DWORD)v28)
        {
          v17 = v52;
          v24 = v51;
          v37 = v50;
          v36.f64[0] = v49;
          if (a4)
            goto LABEL_10;
          goto LABEL_12;
        }
        rect2c = CGRectGetMidX(self->_cropRect);
        MidY = CGRectGetMidY(self->_cropRect);
        v54.f64[0] = rect2c;
        v54.f64[1] = MidY;
        v87 = v54;
        NU::Quad2d::findInscribedAxisAlignedAspectFitRectWithAnchor(v84, v87.f64, (uint64_t)&v95, (uint64_t)&v95, (uint64_t *)&v83, 0.000000953674316);
      }
      v36.f64[0] = v46;
      v37 = v47;
      v17 = v48;
    }
    if (a4)
    {
LABEL_10:
      v36.f64[1] = v37;
LABEL_13:
      __asm
      {
        FMOV            V0.2D, #8.0
        FMOV            V1.2D, #0.125
      }
      v23 = vmulq_f64(vrndaq_f64(vmulq_f64(v36, _Q0)), _Q1);
      goto LABEL_14;
    }
LABEL_12:
    v55.f64[1] = v72.y;
    v66.f64[0] = v72.x - v36.f64[0];
    v66.f64[1] = v73 - v37;
    v55.f64[0] = v36.f64[0];
    deriveTranslatedRectFromConstrainedRect(v28, v29, v30, v31, v32, v33, v34, v35, v55, v37, v24, v17, v77, v76, v75, v74, v66);
    v36.f64[0] = v56;
    v17 = v57;
    v36.f64[1] = v58;
    goto LABEL_13;
  }
  v23 = v78;
  v24 = rect2;
LABEL_14:
  -[NUCropModel _setCropRect:](self, "_setCropRect:", *(_OWORD *)&v23, v24, v17);
  return self->_hitVertexID;
}

- (unint64_t)setRollAngle:(double)a3 constrainCropRectWithTargetArea:(double)a4
{
  return -[NUCropModel setRollAngle:constrainCropRectWithTargetArea:startRect:startAngle:](self, "setRollAngle:constrainCropRectWithTargetArea:startRect:startAngle:", a3, a4, self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height, self->_rollRadians);
}

- (unint64_t)setPitchAngle:(double)a3 constrainCropRectWithTargetArea:(double)a4
{
  return -[NUCropModel setPitchAngle:constrainCropRectWithTargetArea:startRect:startAngle:](self, "setPitchAngle:constrainCropRectWithTargetArea:startRect:startAngle:", a3, a4, self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height, self->_pitchRadians);
}

- (unint64_t)setYawAngle:(double)a3 constrainCropRectWithTargetArea:(double)a4
{
  return -[NUCropModel setYawAngle:constrainCropRectWithTargetArea:startRect:startAngle:](self, "setYawAngle:constrainCropRectWithTargetArea:startRect:startAngle:", a3, a4, self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height, self->_yawRadians);
}

- (unint64_t)setRollAngle:(double)a3 constrainCropRectWithTargetArea:(double)a4 startRect:(CGRect)a5 startAngle:(double)a6
{
  CGFloat y;
  CGFloat x;
  double v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  CGFloat MidY;
  float64x2_t v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  float64x2_t v23;
  float64x2_t v24;
  __double2 v25;
  float64x2_t v26;
  double v27;
  float64x2_t v28;
  float64x2_t v29;
  double v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  float64_t v42;
  float64x2_t v43;
  double v44;
  float64x2_t v45;
  float64x2_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  CGFloat v53;
  float64x2_t v54;
  __n128 v55;
  CGFloat MidX;
  float64x2_t v57;
  double v58;
  double v59;
  double height;
  double v61;
  double width;
  double v63;
  float64x2_t v64[4];
  float64x2_t v65[4];
  CGRect v66;
  CGRect v67;
  CGRect v68;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3 - a6;
  -[NUCropModel _getBoundingQuadFromPitch:yaw:roll:](self, "_getBoundingQuadFromPitch:yaw:roll:", self->_pitchRadians, self->_yawRadians, a3);
  v65[0] = v12;
  v65[1] = v13;
  v65[2] = v14;
  v65[3] = v15;
  v12.f64[0] = x;
  v13.f64[0] = y;
  v15.f64[0] = height;
  v14.f64[0] = width;
  MidX = CGRectGetMidX(*(CGRect *)v12.f64);
  v66.origin.x = x;
  v66.origin.y = y;
  v66.size.height = height;
  v66.size.width = width;
  MidY = CGRectGetMidY(v66);
  v17.f64[0] = MidX;
  v17.f64[1] = MidY;
  v57 = v17;
  -[NUCropModel masterImageRect](self, "masterImageRect");
  v18 = v67.origin.x;
  v19 = v67.origin.y;
  v20 = v67.size.width;
  v21 = v67.size.height;
  v53 = CGRectGetMidX(v67);
  v68.origin.x = v18;
  v68.origin.y = v19;
  v68.size.width = v20;
  v68.size.height = v21;
  v22 = CGRectGetMidY(v68);
  v23.f64[0] = v53;
  v23.f64[1] = v22;
  v54 = v23;
  v25 = __sincos_stret(v11);
  v24.f64[0] = v25.__cosval;
  v26.f64[0] = -v25.__sinval;
  v26.f64[1] = v25.__cosval;
  v24.f64[1] = v25.__sinval;
  v27 = height;
  v28 = vsubq_f64(v57, v54);
  v29 = vmlaq_laneq_f64(vmulq_n_f64(v24, v28.f64[0]), v26, v28, 1);
  v30 = width;
  v31.f64[0] = width;
  v31.f64[1] = height;
  v32 = vaddq_f64(v54, v29);
  __asm { FMOV            V1.2D, #-0.5 }
  v55 = (__n128)v32;
  v38 = vmlaq_f64(v32, _Q1, v31);
  if (width * height < a4)
  {
    v39 = v38.f64[1];
    v58 = v38.f64[0];
    v40 = -[NUCropModel _currentAspectRatio:](self, "_currentAspectRatio:", *(_OWORD *)&v55);
    v38.f64[0] = _rectWithAspectRatio(v40, v41, v58, v39, width, height, a4 / (width * height));
    v38.f64[1] = v42;
  }
  v59 = v38.f64[0];
  v61 = v27;
  v63 = v30;
  v64[0] = v38;
  v43.f64[0] = v30 + v38.f64[0];
  v44 = v38.f64[1];
  v45.f64[1] = v38.f64[1];
  v45.f64[0] = v30 + v38.f64[0];
  v64[1] = v45;
  v46.f64[0] = v38.f64[0];
  v46.f64[1] = v27 + v38.f64[1];
  v43.f64[1] = v27 + v38.f64[1];
  v64[2] = v46;
  v64[3] = v43;
  if ((NU::Quad2d::simpleContains(v65, v64) & 1) == 0)
  {
    -[NUCropModel _currentAspectAsDouble:](self, "_currentAspectAsDouble:", v59, v44, v63, v61);
    NU::Quad2d::findInscribedAxisAlignedAspectFitRect(v65, v55, v47);
    v59 = v48;
    v61 = v49;
    v44 = v50;
    v63 = v51;
  }
  -[NUCropModel setRollRadians:](self, "setRollRadians:", a3, v55.n128_u64[0]);
  -[NUCropModel _setCropRect:](self, "_setCropRect:", v59, v44, v63, v61);
  return self->_hitVertexID;
}

- (unint64_t)setPitchAngle:(double)a3 constrainCropRectWithTargetArea:(double)a4 startRect:(CGRect)a5 startAngle:(double)a6
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  long double v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  double MidX;
  CGFloat MidY;
  double v18;
  double v19;
  double v20;
  float64x2_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  float64x2_t v27;
  double v28;
  float64x2_t v29;
  float64x2_t v30;
  __n128 v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v38;
  double v39;
  double v42;
  __n128 v43;
  __int128 v44;
  double v45;
  float64x2_t v46[4];
  float64x2_t v47[4];
  CGRect v48;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3 - a6;
  -[NUCropModel _getBoundingQuadFromPitch:yaw:roll:](self, "_getBoundingQuadFromPitch:yaw:roll:");
  v47[0] = v12;
  v47[1] = v13;
  v47[2] = v14;
  v47[3] = v15;
  v12.f64[0] = x;
  v13.f64[0] = y;
  v14.f64[0] = width;
  v15.f64[0] = height;
  MidX = CGRectGetMidX(*(CGRect *)v12.f64);
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  MidY = CGRectGetMidY(v48);
  v44 = *(_OWORD *)self->_imageCenter;
  v18 = *(double *)&self->_imageCenter[8];
  v19 = MidX - *(double *)&v44 + (MidY - *((double *)&v44 + 1)) * 0.0;
  v20 = v18 + cos(v11) * (MidY - *((double *)&v44 + 1)) + (MidX - *(double *)&v44) * 0.0;
  v42 = *(double *)&v44 + v19;
  v21.f64[0] = *(double *)&v44 + v19 - width * 0.5;
  v39 = v20;
  v22 = v20 - height * 0.5;
  if (width * height < a4)
  {
    v38 = v20 - height * 0.5;
    v23 = -[NUCropModel _currentAspectRatio:](self, "_currentAspectRatio:");
    v21.f64[0] = _rectWithAspectRatio(v23, v24, *(double *)&v44 + v19 - width * 0.5, v38, width, height, a4 / (width * height));
    width = v25;
    height = v26;
  }
  v21.f64[1] = v22;
  v45 = v21.f64[0];
  v46[0] = v21;
  v27.f64[0] = width + v21.f64[0];
  v28 = v22;
  v29.f64[1] = v22;
  v29.f64[0] = width + v21.f64[0];
  v46[1] = v29;
  v30.f64[0] = v21.f64[0];
  v30.f64[1] = height + v28;
  v27.f64[1] = height + v28;
  v46[2] = v30;
  v46[3] = v27;
  if ((NU::Quad2d::contains(v47, v46) & 1) == 0)
  {
    v31.n128_f64[0] = v42;
    v31.n128_f64[1] = v39;
    v43 = v31;
    -[NUCropModel _currentAspectAsDouble:](self, "_currentAspectAsDouble:", v45, v28, width, height);
    NU::Quad2d::findInscribedAxisAlignedAspectFitRect(v47, v43, v32);
    v45 = v33;
    v28 = v34;
    width = v35;
    height = v36;
  }
  -[NUCropModel setPitchRadians:](self, "setPitchRadians:", a3);
  -[NUCropModel _setCropRect:](self, "_setCropRect:", v45, v28, width, height);
  return self->_hitVertexID;
}

- (unint64_t)setYawAngle:(double)a3 constrainCropRectWithTargetArea:(double)a4 startRect:(CGRect)a5 startAngle:(double)a6
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  long double v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  double MidX;
  CGFloat MidY;
  float64x2_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  float64x2_t v26;
  double v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v37;
  double v38;
  __n128 v39;
  __int128 v40;
  double v41;
  float64x2_t v42[4];
  float64x2_t v43[4];
  CGRect v44;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a3 - a6;
  -[NUCropModel _getBoundingQuadFromPitch:yaw:roll:](self, "_getBoundingQuadFromPitch:yaw:roll:", self->_pitchRadians, a3, self->_rollRadians);
  v43[0] = v14;
  v43[1] = v15;
  v43[2] = v16;
  v43[3] = v17;
  v14.f64[0] = x;
  v15.f64[0] = y;
  v16.f64[0] = width;
  v17.f64[0] = height;
  MidX = CGRectGetMidX(*(CGRect *)v14.f64);
  v44.origin.x = x;
  v44.origin.y = y;
  v44.size.width = width;
  v44.size.height = height;
  MidY = CGRectGetMidY(v44);
  v40 = *(_OWORD *)self->_imageCenter;
  v37 = *(double *)&self->_imageCenter[8] + MidY - *((double *)&v40 + 1) + (MidX - *(double *)&v40) * 0.0;
  v38 = *(double *)&v40 + (MidY - *((double *)&v40 + 1)) * 0.0 + cos(v13) * (MidX - *(double *)&v40);
  v20.f64[0] = v38 - width * 0.5;
  v21 = v37 - height * 0.5;
  if (width * height < a4)
  {
    v22 = -[NUCropModel _currentAspectRatio:](self, "_currentAspectRatio:");
    v20.f64[0] = _rectWithAspectRatio(v22, v23, v38 - width * 0.5, v37 - height * 0.5, width, height, a4 / (width * height));
    width = v24;
    height = v25;
  }
  v20.f64[1] = v21;
  v26.f64[0] = width + v20.f64[0];
  v27 = v21;
  v28.f64[1] = v21;
  v28.f64[0] = width + v20.f64[0];
  v42[0] = v20;
  v42[1] = v28;
  v41 = v20.f64[0];
  v29.f64[0] = v20.f64[0];
  v29.f64[1] = height + v28.f64[1];
  v26.f64[1] = height + v28.f64[1];
  v42[2] = v29;
  v42[3] = v26;
  if ((NU::Quad2d::contains(v43, v42) & 1) == 0)
  {
    v30.f64[0] = v38;
    v30.f64[1] = v37;
    v39 = (__n128)v30;
    if (NU::Quad2d::contains(v43, v30))
    {
      -[NUCropModel _currentAspectAsDouble:](self, "_currentAspectAsDouble:", v41, v27, width, height);
      NU::Quad2d::findInscribedAxisAlignedAspectFitRect(v43, v39, v31);
      v41 = v32;
      v27 = v33;
      width = v34;
      height = v35;
    }
  }
  -[NUCropModel setYawRadians:](self, "setYawRadians:", a3);
  -[NUCropModel _setCropRect:](self, "_setCropRect:", v41, v27, width, height);
  return self->_hitVertexID;
}

- (unint64_t)setAspectRatio:(id)a3 constrainCropRect:(CGRect)a4 withTargetArea:(double)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  int64_t v11;
  double MidX;
  double MidY;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v21;
  CGRect v22;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (!a3.var0 && a3.var1 || !a3.var1 && a3.var0)
  {
    a3.var0 = objc_msgSend((id)objc_opt_class(), "freeFormAspectRatio");
    a3.var1 = v11;
  }
  -[NUCropModel setAspectRatio:](self, "setAspectRatio:", a3.var0, a3.var1);
  if (!-[NUCropModel aspectRatioIsFreeForm](self, "aspectRatioIsFreeForm"))
  {
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    MidX = CGRectGetMidX(v21);
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    MidY = CGRectGetMidY(v22);
    v14 = -[NUCropModel aspectRatio](self, "aspectRatio");
    v16 = aspectRatioConstrainedFromRect(v14, v15, x, y, width, height, MidX, MidY, a5);
    -[NUCropModel setCropRect:newCropRect:constrainWithAnchorPoint:](self, "setCropRect:newCropRect:constrainWithAnchorPoint:", v16, v17, v18, v19, v16, v17, v18, v19, *(_QWORD *)&MidX, *(_QWORD *)&MidY);
  }
  return self->_hitVertexID;
}

- (void)makeCurrentAspectRatioFreeForm
{
  int64_t v3;

  self->_aspectRatio.width = +[NUCropModel freeFormAspectRatio](NUCropModel, "freeFormAspectRatio");
  self->_aspectRatio.height = v3;
  self->_isAutoCrop = 0;
}

- (void)makeCurrentFreeFormAspectFixed
{
  self->_aspectRatio = ($5BB7312FFE32F1AB3F1F5957C99A58B3)vcvtq_s64_f64((float64x2_t)self->_cropRect.size);
  self->_isAutoCrop = 0;
}

- (double)_currentAspectAsDouble:(CGRect)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NUCropModel _currentAspectRatio:](self, "_currentAspectRatio:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return (double)v3 / (double)v4;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_currentAspectRatio:(CGRect)a3
{
  double height;
  double width;
  uint64_t v6;
  uint64_t v7;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  height = a3.size.height;
  width = a3.size.width;
  if (-[NUCropModel aspectRatioIsFreeForm](self, "aspectRatioIsFreeForm", a3.origin.x, a3.origin.y))
  {
    v6 = (uint64_t)width;
    v7 = (uint64_t)height;
  }
  else
  {
    v6 = self->_aspectRatio.width;
    v7 = self->_aspectRatio.height;
  }
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (BOOL)aspectRatioIsOriginal
{
  return self->_masterImageRect.size.width == (double)self->_aspectRatio.width
      && self->_masterImageRect.size.height == (double)self->_aspectRatio.height;
}

- (BOOL)aspectRatioIsFreeForm
{
  return !self->_aspectRatio.width || self->_aspectRatio.height == 0;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)originalAspectRatio
{
  double height;
  int64_t width;
  int64_t v4;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  height = self->_masterImageRect.size.height;
  width = (uint64_t)self->_masterImageRect.size.width;
  v4 = (uint64_t)height;
  result.var1 = v4;
  result.var0 = width;
  return result;
}

- (double)pitchRadians
{
  return self->_pitchRadians;
}

- (double)yawRadians
{
  return self->_yawRadians;
}

- (double)rollRadians
{
  return self->_rollRadians;
}

- (void)setPitchRadians:(double)a3
{
  self->_pitchRadians = a3;
}

- (void)setYawRadians:(double)a3
{
  self->_yawRadians = a3;
}

- (void)setRollRadians:(double)a3
{
  self->_rollRadians = a3;
}

- (double)pitchDegreeUI
{
  return self->_pitchRadians * 180.0 / 3.14159265;
}

- (double)yawDegreeUI
{
  return self->_yawRadians * 180.0 / 3.14159265;
}

- (double)rollDegreeUI
{
  return self->_rollRadians * 180.0 / 3.14159265;
}

- (CGRect)masterImageRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_masterImageRect.origin.x;
  y = self->_masterImageRect.origin.y;
  width = self->_masterImageRect.size.width;
  height = self->_masterImageRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)fovRadians
{
  return self->_fovRadians;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)aspectRatio
{
  int64_t height;
  int64_t width;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  height = self->_aspectRatio.height;
  width = self->_aspectRatio.width;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (unint64_t)hitVertexID
{
  return self->_hitVertexID;
}

- (BOOL)isAutoCrop
{
  return self->_isAutoCrop;
}

- (void)setIsAutoCrop:(BOOL)a3
{
  self->_isAutoCrop = a3;
}

+ (void)_imageTransformFromPitch:(double)a3@<D1> yaw:(double)a4@<D2> roll:(CGFloat)a5@<D3> imageRect:(CGFloat)a6@<D4>
{
  double v13;
  double v14;
  double v20;
  double v21;
  uint64_t v22;
  float64x2_t v23;
  __double2 v24;
  float64x2_t v25;
  __double2 v26;
  __double2 v27;
  float64x2_t v28;
  uint64_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v34;
  float64x2_t v36;
  float64x2_t v45;
  double v46;
  double v47;
  float64x2_t v48;
  float64x2_t v51;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  float64x2_t v56;
  float64x2_t *v57;
  uint64_t v58;
  float64x2_t v59;
  float64x2_t v60;
  float64x2_t v61;
  float64x2_t v62;
  __int128 v63;
  float64x2_t v64;
  float64x2_t v65;
  float64x2_t v66;
  float64x2_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  float64x2_t v71;
  float64x2_t v72;
  float64x2_t *v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  float64x2_t v85;
  float64x2_t v86;
  float64x2_t *v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  float64x2_t v93;
  float64x2_t v94;
  float64x2_t v95;
  float64x2_t v96;
  float64x2_t v97;
  float64x2_t v98;
  float64x2_t v99;
  float64x2_t v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  float64x2_t v107;
  float64x2_t v108;
  float64x2_t *v109;
  uint64_t v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  float64x2_t v121;
  float64x2_t v122;
  float64x2_t *v123;
  uint64_t v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  float64x2_t v135;
  float64x2_t v136;
  float64x2_t *v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 *v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  float64x2_t v147;
  float64x2_t v148;
  float64x2_t v149;
  float64x2_t v150;
  float64x2_t v151;
  float64x2_t v152;
  float64x2_t v153;
  float64x2_t v154;
  float64x2_t v155;
  float64x2_t v156;
  float64x2_t v157;
  CGFloat MidX;
  float64x2_t v159;
  CGFloat MidY;
  double v161;
  _OWORD v162[8];
  _OWORD v163[8];
  _OWORD v164[8];
  _OWORD v165[8];
  _OWORD v166[8];
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  _OWORD v175[3];
  float64x2_t v176;
  float64x2_t v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  float64x2_t v181;
  float64x2_t v182;
  float64x2_t v183;
  float64x2_t v184;
  float64x2_t v185;
  float64x2_t v186;
  float64x2_t v187;
  float64x2_t v188;
  CGRect v189;
  CGRect v190;

  v13 = fabs(a3);
  v14 = fabs(a4);
  if (fabs(a2) > 0.0000000037252903 || v13 > 0.0000000037252903 || v14 > 0.0000000037252903)
  {
    +[NUCropModel defaultFocalLength](NUCropModel, "defaultFocalLength", 0.0000000037252903, v13, v14);
    v21 = v20 / hypotf(36.0, 24.0);
    v161 = hypot(a8, a7) * v21;
    v189.origin.x = a5;
    v189.origin.y = a6;
    v189.size.width = a7;
    v189.size.height = a8;
    MidX = CGRectGetMidX(v189);
    v190.origin.x = a5;
    v190.origin.y = a6;
    v190.size.width = a7;
    v190.size.height = a8;
    MidY = CGRectGetMidY(v190);
    v22 = MEMORY[0x1E0C83FD8];
    v154 = *(float64x2_t *)MEMORY[0x1E0C83FD8];
    v155 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 16);
    v151 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 32);
    v152 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 48);
    v159 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 64);
    v157 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 112);
    v149 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 96);
    v150 = *(float64x2_t *)(MEMORY[0x1E0C83FD8] + 80);
    v24 = __sincos_stret(a2 * 0.5);
    v23.f64[0] = v24.__sinval;
    v156 = vmulq_n_f64((float64x2_t)xmmword_1A671A2A0, v24.__sinval);
    *(_QWORD *)&v23.f64[0] = *(_OWORD *)&vmulq_f64(v23, (float64x2_t)0);
    v23.f64[1] = v24.__cosval;
    v153 = v23;
    v26 = __sincos_stret(a3 * 0.5);
    v25.f64[0] = v26.__sinval;
    *(_QWORD *)&v25.f64[0] = *(_OWORD *)&vmulq_f64(v25, (float64x2_t)0);
    v25.f64[1] = v26.__cosval;
    v147 = v25;
    v148 = vmulq_n_f64((float64x2_t)xmmword_1A671A290, v26.__sinval);
    v27 = __sincos_stret(a4 * 0.5);
    v28.f64[0] = v150.f64[0];
    v29 = 0;
    v30 = vmulq_n_f64((float64x2_t)0, v27.__sinval);
    v31 = vnegq_f64(v148);
    v32 = (float64x2_t)vextq_s8((int8x16_t)v147, (int8x16_t)vnegq_f64(v147), 8uLL);
    _Q0 = vaddq_f64(vmlaq_n_f64(vmulq_n_f64(v147, v27.__cosval), v32, v27.__sinval), vmlaq_n_f64(vmulq_laneq_f64(v31, v30, 1), (float64x2_t)vextq_s8((int8x16_t)v148, (int8x16_t)v31, 8uLL), v30.f64[0]));
    v34 = vaddq_f64(vmlaq_n_f64(vmulq_n_f64(v148, v27.__cosval), (float64x2_t)vextq_s8((int8x16_t)v31, (int8x16_t)v148, 8uLL), v27.__sinval), vmlaq_n_f64(vmulq_laneq_f64(v147, v30, 1), v32, v30.f64[0]));
    _Q3 = vnegq_f64(v156);
    v36 = (float64x2_t)vextq_s8((int8x16_t)v153, (int8x16_t)vnegq_f64(v153), 8uLL);
    _Q6 = vmlaq_n_f64(vmulq_laneq_f64(v153, v34, 1), v36, v34.f64[0]);
    _Q2 = vaddq_f64(vmlaq_n_f64(vmulq_laneq_f64(_Q3, v34, 1), (float64x2_t)vextq_s8((int8x16_t)v156, (int8x16_t)_Q3, 8uLL), v34.f64[0]), vmlaq_n_f64(vmulq_laneq_f64(v153, _Q0, 1), v36, _Q0.f64[0]));
    _Q1 = (int64x2_t)vaddq_f64(_Q6, vmlaq_n_f64(vmulq_laneq_f64(v156, _Q0, 1), (float64x2_t)vextq_s8((int8x16_t)_Q3, (int8x16_t)v156, 8uLL), _Q0.f64[0]));
    *(_QWORD *)&_Q3.f64[0] = _Q1.i64[1];
    __asm { FMLS            D0, D2, V2.D[0] }
    _D7 = _Q2.f64[1];
    __asm { FMLA            D0, D7, V2.D[1] }
    v31.f64[0] = vmlad_n_f64(vmuld_lane_f64(_Q2.f64[0], _Q2, 1), *(double *)&_Q1.i64[1], *(double *)_Q1.i64);
    v45.f64[0] = vmuld_lane_f64(*(double *)&_Q1.i64[1], _Q2, 1);
    v46 = vmlad_n_f64(-(*(double *)&_Q1.i64[1] * _Q2.f64[1]), _Q2.f64[0], *(double *)_Q1.i64);
    _Q0.f64[1] = v31.f64[0] + v31.f64[0];
    v31.f64[0] = v46 + v46;
    v47 = vmlad_n_f64(-(_Q2.f64[0] * _Q2.f64[1]), *(double *)&_Q1.i64[1], *(double *)_Q1.i64);
    v48.f64[0] = v47 + v47;
    __asm
    {
      FMLA            D6, D3, V1.D[1]
      FMLA            D6, D7, V2.D[1]
      FMLS            D6, D1, V1.D[0]
      FMLA            D17, D2, V1.D[1]
    }
    v48.f64[1] = _Q6.f64[0];
    __asm { FMLS            D7, D1, V1.D[0] }
    *(_QWORD *)&v51.f64[1] = _Q1.i64[1];
    v51.f64[0] = _Q2.f64[0];
    v45.f64[1] = -(*(double *)_Q1.i64 * _Q2.f64[1]);
    __asm { FMLS            D7, D3, V1.D[1] }
    v53 = vmlaq_f64(v45, (float64x2_t)vzip1q_s64(_Q1, (int64x2_t)_Q2), v51);
    v187 = 0u;
    v188 = 0u;
    v185 = 0u;
    v186 = 0u;
    v183 = 0u;
    v184 = 0u;
    v181 = 0u;
    v182 = 0u;
    v175[1] = *(unint64_t *)&v31.f64[0];
    v175[0] = _Q0;
    v176 = (float64x2_t)COERCE_UNSIGNED_INT64(_D17 + _D17);
    v175[2] = v48;
    v177 = vaddq_f64(v53, v53);
    v178 = _D7;
    v54 = vdivq_f64(vnegq_f64(vaddq_f64(vaddq_f64(v177, vmlaq_f64(vmulq_f64(_Q0, (float64x2_t)0), (float64x2_t)0, v48)), (float64x2_t)0)), (float64x2_t)vdupq_lane_s64(*(_OWORD *)&vaddq_f64(vaddq_f64((float64x2_t)_D7, vmlaq_f64(vmulq_f64((float64x2_t)*(unint64_t *)&v31.f64[0], (float64x2_t)0), (float64x2_t)0, v176)), (float64x2_t)0), 0));
    v180 = xmmword_1A671A290;
    v179 = 0u;
    do
    {
      v56 = (float64x2_t)v175[v29];
      v55 = (float64x2_t)v175[v29 + 1];
      v57 = (float64x2_t *)((char *)&v181 + v29 * 16);
      *v57 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v154, v56.f64[0]), v151, v56, 1), v54, v55.f64[0]), v149, v55, 1);
      v57[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v155, v56.f64[0]), v152, v56, 1), v150, v55.f64[0]), v157, v55, 1);
      v29 += 2;
    }
    while (v29 != 8);
    v58 = 0;
    v59.f64[0] = MidX;
    v59.f64[1] = MidY;
    v60 = *(float64x2_t *)(v22 + 64);
    v61 = *(float64x2_t *)(v22 + 80);
    v63 = *(_OWORD *)(v22 + 96);
    v62 = *(float64x2_t *)(v22 + 112);
    v64.f64[1] = *(float64_t *)(v22 + 120);
    v64.f64[0] = 0.0;
    v65.f64[0] = MidX;
    v66 = vnegq_f64(v59);
    v67 = v61;
    v166[4] = v60;
    v166[5] = v61;
    v68 = *(_OWORD *)(v22 + 112);
    v166[6] = v63;
    v166[7] = v68;
    v69 = *(_OWORD *)(v22 + 16);
    v166[0] = *(_OWORD *)v22;
    v166[1] = v69;
    v70 = *(_OWORD *)(v22 + 48);
    v166[2] = *(_OWORD *)(v22 + 32);
    v166[3] = v70;
    do
    {
      v72 = (float64x2_t)v166[v58];
      v71 = (float64x2_t)v166[v58 + 1];
      v73 = (float64x2_t *)((char *)&v167 + v58 * 16);
      *v73 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v154, v72.f64[0]), v151, v72, 1), v60, v71.f64[0]), v66, v71, 1);
      v73[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v155, v72.f64[0]), v152, v72, 1), v67, v71.f64[0]), v64, v71, 1);
      v58 += 2;
    }
    while (v58 != 8);
    v74 = 0;
    v62.f64[0] = v161;
    v75 = v172;
    a1[4] = v171;
    a1[5] = v75;
    v76 = v174;
    a1[6] = v173;
    a1[7] = v76;
    v77 = v168;
    *a1 = v167;
    a1[1] = v77;
    v78 = v170;
    a1[2] = v169;
    a1[3] = v78;
    v79 = *a1;
    v80 = a1[1];
    v81 = a1[3];
    v165[2] = a1[2];
    v165[3] = v81;
    v165[0] = v79;
    v165[1] = v80;
    v82 = a1[4];
    v83 = a1[5];
    v84 = a1[7];
    v165[6] = a1[6];
    v165[7] = v84;
    v165[4] = v82;
    v165[5] = v83;
    do
    {
      v86 = (float64x2_t)v165[v74];
      v85 = (float64x2_t)v165[v74 + 1];
      v87 = (float64x2_t *)((char *)&v167 + v74 * 16);
      *v87 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v154, v86.f64[0]), v151, v86, 1), v60, v85.f64[0]), (float64x2_t)0, v85, 1);
      v87[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v155, v86.f64[0]), v152, v86, 1), v67, v85.f64[0]), v62, v85, 1);
      v74 += 2;
    }
    while (v74 != 8);
    v88 = 0;
    v89 = v172;
    a1[4] = v171;
    a1[5] = v89;
    v90 = v174;
    a1[6] = v173;
    a1[7] = v90;
    v91 = v168;
    *a1 = v167;
    a1[1] = v91;
    v92 = v170;
    a1[2] = v169;
    a1[3] = v92;
    v94 = v181;
    v93 = v182;
    v96 = v183;
    v95 = v184;
    v98 = v185;
    v97 = v186;
    v100 = v187;
    v99 = v188;
    v101 = *a1;
    v102 = a1[1];
    v103 = a1[3];
    v164[2] = a1[2];
    v164[3] = v103;
    v164[0] = v101;
    v164[1] = v102;
    v104 = a1[4];
    v105 = a1[5];
    v106 = a1[7];
    v164[6] = a1[6];
    v164[7] = v106;
    v164[4] = v104;
    v164[5] = v105;
    do
    {
      v108 = (float64x2_t)v164[v88];
      v107 = (float64x2_t)v164[v88 + 1];
      v109 = (float64x2_t *)((char *)&v167 + v88 * 16);
      *v109 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v94, v108.f64[0]), v96, v108, 1), v98, v107.f64[0]), v100, v107, 1);
      v109[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v93, v108.f64[0]), v95, v108, 1), v97, v107.f64[0]), v99, v107, 1);
      v88 += 2;
    }
    while (v88 != 8);
    v110 = 0;
    v111 = v172;
    a1[4] = v171;
    a1[5] = v111;
    v112 = v174;
    a1[6] = v173;
    a1[7] = v112;
    v113 = v168;
    *a1 = v167;
    a1[1] = v113;
    v114 = v170;
    a1[2] = v169;
    a1[3] = v114;
    v115 = *a1;
    v116 = a1[1];
    v117 = a1[3];
    v163[2] = a1[2];
    v163[3] = v117;
    v163[0] = v115;
    v163[1] = v116;
    v118 = a1[4];
    v119 = a1[5];
    v120 = a1[7];
    v163[6] = a1[6];
    v163[7] = v120;
    v163[4] = v118;
    v163[5] = v119;
    do
    {
      v122 = (float64x2_t)v163[v110];
      v121 = (float64x2_t)v163[v110 + 1];
      v123 = (float64x2_t *)((char *)&v167 + v110 * 16);
      *v123 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v154, v122.f64[0]), v151, v122, 1), v159, v121.f64[0]), v149, v121, 1);
      v28.f64[1] = 1.0 / v161;
      v123[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v155, v122.f64[0]), v152, v122, 1), v28, v121.f64[0]), (float64x2_t)xmmword_1A671A400, v121, 1);
      v110 += 2;
    }
    while (v110 != 8);
    v124 = 0;
    v65.f64[1] = MidY;
    v125 = v172;
    a1[4] = v171;
    a1[5] = v125;
    v126 = v174;
    a1[6] = v173;
    a1[7] = v126;
    v127 = v168;
    *a1 = v167;
    a1[1] = v127;
    v128 = v170;
    a1[2] = v169;
    a1[3] = v128;
    v129 = *a1;
    v130 = a1[1];
    v131 = a1[3];
    v162[2] = a1[2];
    v162[3] = v131;
    v162[0] = v129;
    v162[1] = v130;
    v132 = a1[4];
    v133 = a1[5];
    v134 = a1[7];
    v162[6] = a1[6];
    v162[7] = v134;
    v162[4] = v132;
    v162[5] = v133;
    do
    {
      v136 = (float64x2_t)v162[v124];
      v135 = (float64x2_t)v162[v124 + 1];
      v137 = (float64x2_t *)((char *)&v167 + v124 * 16);
      *v137 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v154, v136.f64[0]), v151, v136, 1), v60, v135.f64[0]), v65, v135, 1);
      v137[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v155, v136.f64[0]), v152, v136, 1), v67, v135.f64[0]), v64, v135, 1);
      v124 += 2;
    }
    while (v124 != 8);
    v138 = v172;
    a1[4] = v171;
    a1[5] = v138;
    v139 = v174;
    a1[6] = v173;
    a1[7] = v139;
    v140 = v168;
    *a1 = v167;
    a1[1] = v140;
    v145 = v169;
    v146 = v170;
  }
  else
  {
    v141 = (__int128 *)MEMORY[0x1E0C83FD8];
    v142 = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 80);
    a1[4] = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 64);
    a1[5] = v142;
    v143 = v141[7];
    a1[6] = v141[6];
    a1[7] = v143;
    v144 = v141[1];
    *a1 = *v141;
    a1[1] = v144;
    v145 = v141[2];
    v146 = v141[3];
  }
  a1[2] = v145;
  a1[3] = v146;
}

+ ($0AC6E346AE4835514AAA8AC86D8F4844)freeFormAspectRatio
{
  int64_t v2;
  int64_t v3;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v2 = 0;
  v3 = 0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

+ (double)defaultFocalLength
{
  return 28.0;
}

+ (CGRect)adjustCropRect:(CGRect)a3 inputExtent:(CGRect)a4 geometryTransform:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64_t v21;
  float64x2_t v22;
  float64x2_t v23;
  _BOOL4 v24;
  _BOOL4 v25;
  _BOOL4 v26;
  BOOL v27;
  CGFloat v29;
  float64x2_t v34;
  double v36;
  double v37;
  float64x2_t v38;
  double InscribedUnscaledFitRect;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  float64x2_t v47;
  float64x2_t v48;
  float64_t v49;
  float64x2_t v50;
  float64_t v51;
  float64x2_t v52;
  float64_t v53;
  CGPoint origin;
  float64_t v55;
  float64x2_t v56;
  float64_t v57;
  float64x2_t v58;
  CGFloat v59;
  CGFloat v60;
  float64_t v61;
  float64x2_t v62;
  float64x2_t v63;
  float64x2_t v64[4];
  CGRect v65;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v65 = a3;
  v59 = a3.size.width;
  v60 = a3.size.height;
  v9 = a5;
  objc_msgSend(v9, "transformPoint:", x, y);
  v61 = v10;
  v53 = v11;
  v12 = x + width;
  objc_msgSend(v9, "transformPoint:", v12, y);
  v57 = v13;
  v51 = v14;
  v15 = y + height;
  objc_msgSend(v9, "transformPoint:", x, v15);
  v55 = v16;
  v49 = v17;
  objc_msgSend(v9, "transformPoint:", v12, v15);
  v18.f64[0] = v61;
  v18.f64[1] = v53;
  v19.f64[0] = v57;
  v19.f64[1] = v51;
  v20.f64[0] = v55;
  v20.f64[1] = v49;
  v22.f64[1] = v21;
  v62 = v18;
  v64[0] = v18;
  v64[1] = v19;
  v56 = v20;
  v58 = v19;
  v64[2] = v20;
  v64[3] = v22;
  v47 = v22;
  v19.f64[0] = v59;
  v19.f64[1] = v60;
  v23 = vaddq_f64(v19, (float64x2_t)v65.origin);
  v19.f64[0] = v23.f64[0];
  v19.f64[1] = v65.origin.y;
  v50 = v19;
  v52 = v23;
  v19.f64[0] = v65.origin.x;
  v19.f64[1] = v23.f64[1];
  v48 = v19;
  origin = v65.origin;
  v24 = NU::Quad2d::simpleContains(v64, (float64x2_t)v65.origin);
  v25 = NU::Quad2d::simpleContains(v64, v50);
  v26 = NU::Quad2d::simpleContains(v64, v48);
  v27 = NU::Quad2d::simpleContains(v64, v52);
  if (v24 && (v25 ? (_ZF = !v26) : (_ZF = 1), !_ZF && v27))
  {
    v29 = origin.y;
  }
  else
  {
    __asm { FMOV            V1.2D, #0.25 }
    v34 = vaddq_f64(vmulq_f64(vaddq_f64(vaddq_f64(vaddq_f64(v62, v58), v56), v47), _Q1), vmulq_f64(vaddq_f64(vaddq_f64(vaddq_f64((float64x2_t)origin, v50), v48), v52), _Q1));
    __asm { FMOV            V1.2D, #0.5 }
    v63 = vmulq_f64(v34, _Q1);
    if (NU::Quad2d::simpleContains(v64, v63))
      NU::Quad2d::findInscribedAxisAlignedFitRectWithAnchor(v64, &v63, (uint64_t)&v65, (uint64_t)&v65);
    else
      InscribedUnscaledFitRect = NU::Quad2d::findInscribedUnscaledFitRect((NU::Quad2d *)v64, &v65, 0.000000953674316, v36, v37, v38);
    v59 = v41;
    v60 = v42;
    v29 = v40;
    origin.x = InscribedUnscaledFitRect;
  }

  v43 = origin.x;
  v44 = v29;
  v45 = v59;
  v46 = v60;
  result.size.height = v46;
  result.size.width = v45;
  result.origin.y = v44;
  result.origin.x = v43;
  return result;
}

@end
