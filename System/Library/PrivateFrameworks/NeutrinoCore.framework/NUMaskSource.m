@implementation NUMaskSource

- (id)_initWithDefinition:(id)a3 identifier:(id)a4 extent:(id *)a5 scale:(id)a6
{
  int64_t var1;
  int64_t var0;
  id v11;
  id v12;
  void *v13;
  NUMaskSource *v14;
  void *v15;
  $0AC6E346AE4835514AAA8AC86D8F4844 v16;
  void *v17;
  void *v18;
  _OWORD v20[2];
  objc_super v21;

  var1 = a6.var1;
  var0 = a6.var0;
  v11 = a3;
  v12 = a4;
  +[NUSourceSchema sharedSourceSchema](NUSourceSchema, "sharedSourceSchema");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)NUMaskSource;
  v14 = -[NUSource initWithSourceSchema:](&v21, sel_initWithSourceSchema_, v13);

  if (v14)
  {
    -[NUSource setAssetIdentifier:](v14, "setAssetIdentifier:", v12);
    -[NUSource setDefinition:](v14, "setDefinition:", v11);
    v15 = (void *)objc_opt_new();
    v16 = a5->var1;
    v20[0] = a5->var0;
    v20[1] = v16;
    objc_msgSend(MEMORY[0x1E0CB3B18], "nu_valueWithPixelRect:", v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("extent"));

    NUScaleToValue(var0, var1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("scale"));

    -[NUSource setSettings:](v14, "setSettings:", v15);
  }

  return v14;
}

- (NUMaskSource)initWithImageBuffer:(id)a3 identifier:(id)a4 extent:(id *)a5 scale:(id)a6
{
  int64_t var1;
  int64_t var0;
  id v11;
  uint64_t v12;
  void *v13;
  $0AC6E346AE4835514AAA8AC86D8F4844 v14;
  NUMaskSource *v15;
  _OWORD v17[2];

  var1 = a6.var1;
  var0 = a6.var0;
  v11 = a4;
  v12 = objc_msgSend(a3, "CVPixelBuffer");
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = a5->var1;
  v17[0] = a5->var0;
  v17[1] = v14;
  v15 = -[NUMaskSource initWithImage:identifier:extent:scale:](self, "initWithImage:identifier:extent:scale:", v13, v11, v17, var0, var1);

  return v15;
}

- (NUMaskSource)initWithImage:(id)a3 identifier:(id)a4 extent:(id *)a5 scale:(id)a6
{
  int64_t var1;
  int64_t var0;
  id v11;
  id v12;
  NUMaskSourceDefinition *v13;
  $0AC6E346AE4835514AAA8AC86D8F4844 v14;
  NUMaskSourceDefinition *v15;
  $0AC6E346AE4835514AAA8AC86D8F4844 v16;
  NUMaskSource *v17;
  $0AC6E346AE4835514AAA8AC86D8F4844 v19;
  $0AC6E346AE4835514AAA8AC86D8F4844 v20;

  var1 = a6.var1;
  var0 = a6.var0;
  v11 = a4;
  v12 = a3;
  v13 = [NUMaskSourceDefinition alloc];
  v14 = a5->var1;
  v19 = a5->var0;
  v20 = v14;
  v15 = -[NUMaskSourceDefinition initWithCIImage:croppedExtent:scale:orientation:](v13, "initWithCIImage:croppedExtent:scale:orientation:", v12, &v19, var0, var1, 1);

  v16 = a5->var1;
  v19 = a5->var0;
  v20 = v16;
  v17 = -[NUMaskSource _initWithDefinition:identifier:extent:scale:](self, "_initWithDefinition:identifier:extent:scale:", v15, v11, &v19, var0, var1);

  return v17;
}

- (NUMaskSource)initWithContentsOfURL:(id)a3 identifier:(id)a4 extent:(id *)a5 scale:(id)a6
{
  int64_t var1;
  int64_t var0;
  id v11;
  id v12;
  NUFileSourceDefinition *v13;
  $0AC6E346AE4835514AAA8AC86D8F4844 v14;
  NUMaskSource *v15;
  _OWORD v17[2];

  var1 = a6.var1;
  var0 = a6.var0;
  v11 = a4;
  v12 = a3;
  v13 = -[NUFileSourceDefinition initWithURL:UTI:]([NUFileSourceDefinition alloc], "initWithURL:UTI:", v12, 0);

  v14 = a5->var1;
  v17[0] = a5->var0;
  v17[1] = v14;
  v15 = -[NUMaskSource _initWithDefinition:identifier:extent:scale:](self, "_initWithDefinition:identifier:extent:scale:", v13, v11, v17, var0, var1);

  return v15;
}

- ($209B98C1CDF2DEBD503CBDE3C0ED7C90)extent
{
  void *v3;
  void *v4;
  $209B98C1CDF2DEBD503CBDE3C0ED7C90 *result;
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
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[NUSource settings](self, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("extent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    NUAssertLogger_20995();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing extent"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_20995();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v21 = (void *)MEMORY[0x1E0CB3978];
        v22 = v20;
        objc_msgSend(v21, "callStackSymbols");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v20;
        v42 = 2114;
        v43 = v24;
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
      v41 = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUMaskSource extent]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUMaskSource.m", 188, CFSTR("missing extent"), v25, v26, v27, v28, v38);
  }
  v39 = objc_retainAutorelease(v4);
  if (strncmp((const char *)objc_msgSend(v39, "objCType"), "{?={?=qq}{?=qq}}", 0x10uLL))
  {
    NUAssertLogger_20995();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wrong value type"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v14;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_20995();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v15)
    {
      if (v17)
      {
        v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v30 = (void *)MEMORY[0x1E0CB3978];
        v31 = v29;
        objc_msgSend(v30, "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v29;
        v42 = 2114;
        v43 = v33;
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
      v41 = v19;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUMaskSource extent]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUMaskSource.m", 189, CFSTR("wrong value type"), v34, v35, v36, v37, v38);
  }
  objc_msgSend(v39, "nu_pixelRect");

  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)scale
{
  void *v2;
  void *v3;
  id v4;
  unsigned __int128 v5;
  int64_t v6;
  int64_t v7;
  NSObject *v8;
  void *v9;
  void *specific;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE v40[22];
  uint64_t v41;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v41 = *MEMORY[0x1E0C80C00];
  -[NUSource settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("scale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    NUAssertLogger_20995();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing scale"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v40 = 138543362;
      *(_QWORD *)&v40[4] = v9;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v40, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_20995();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v23 = (void *)MEMORY[0x1E0CB3978];
        v24 = v22;
        objc_msgSend(v23, "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v40 = 138543618;
        *(_QWORD *)&v40[4] = v22;
        *(_WORD *)&v40[12] = 2114;
        *(_QWORD *)&v40[14] = v26;
        _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v40, 0x16u);

      }
    }
    else if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v40 = 138543362;
      *(_QWORD *)&v40[4] = v14;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v40, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUMaskSource scale]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUMaskSource.m", 197, CFSTR("missing scale"), v27, v28, v29, v30, *(uint64_t *)v40);
  }
  v4 = objc_retainAutorelease(v3);
  if (strncmp((const char *)objc_msgSend(v4, "objCType"), "{?=qq}", 6uLL))
  {
    NUAssertLogger_20995();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wrong value type"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v40 = 138543362;
      *(_QWORD *)&v40[4] = v16;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v40, 0xCu);

    }
    v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_20995();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v17)
    {
      if (v19)
      {
        v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v32 = (void *)MEMORY[0x1E0CB3978];
        v33 = v31;
        objc_msgSend(v32, "callStackSymbols");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v40 = 138543618;
        *(_QWORD *)&v40[4] = v31;
        *(_WORD *)&v40[12] = 2114;
        *(_QWORD *)&v40[14] = v35;
        _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v40, 0x16u);

      }
    }
    else if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v40 = 138543362;
      *(_QWORD *)&v40[4] = v21;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v40, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUMaskSource scale]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUMaskSource.m", 198, CFSTR("wrong value type"), v36, v37, v38, v39, *(uint64_t *)v40);
  }
  *(_OWORD *)v40 = NUScaleUnknown;
  objc_msgSend(v4, "getValue:", v40);
  v5 = *(_OWORD *)v40;

  v7 = v5 >> 64;
  v6 = v5;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (id)newSourceNode:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
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
  if (!a3)
  {
    NUAssertLogger_20995();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_20995();
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
    _NUAssertFailHandler((uint64_t)"-[NUMaskSource(MaskEvaluation) newSourceNode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUMaskSource.m", 209, CFSTR("Invalid parameter not satisfying: %s"), v23, v24, v25, v26, (uint64_t)"error != NULL");
  }
  -[NUSource definition](self, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("Missing source"), self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v7 = 0;
    *a3 = v9;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("Unexpected source definition kind"), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  -[NUSource assetIdentifier](self, "assetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generateSourceNodeWithIdentifier:error:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = v7;

LABEL_10:
  return v7;
}

- (id)sourceImage:(id *)a3
{
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  char v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *specific;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
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
  if (!a3)
  {
    NUAssertLogger_20995();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v16;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_20995();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v23 = (void *)MEMORY[0x1E0CB3978];
        v24 = v22;
        objc_msgSend(v23, "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v22;
        v33 = 2114;
        v34 = v26;
        _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v21;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUMaskSource(MaskEvaluation) sourceImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUMaskSource.m", 232, CFSTR("Invalid parameter not satisfying: %s"), v27, v28, v29, v30, (uint64_t)"error != NULL");
  }
  -[NUSource definition](self, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NUSource definition](self, "definition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[NUSource definition](self, "definition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v8, "image");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      v12 = objc_opt_isKindOfClass();

      -[NUSource definition](self, "definition");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v12 & 1) != 0)
      {
        v13 = objc_alloc(MEMORY[0x1E0C9DDC8]);
        objc_msgSend(v9, "url");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v13, "initWithContentsOfURL:", v14);

      }
      else
      {
        +[NUError unsupportedError:object:](NUError, "unsupportedError:object:", CFSTR("Unexpected source definition kind"), v9);
        v10 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    return v10;
  }
  else
  {
    +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("Missing source"), self);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return 0;
  }
}

@end
