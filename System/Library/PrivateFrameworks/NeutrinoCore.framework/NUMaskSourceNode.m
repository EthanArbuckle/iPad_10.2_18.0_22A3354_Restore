@implementation NUMaskSourceNode

- (NUMaskSourceNode)initWithImage:(id)a3 croppedExtent:(id *)a4 scale:(id)a5 identifier:(id)a6 orientation:(int64_t)a7
{
  int64_t var1;
  int64_t var0;
  void *v12;
  $0AC6E346AE4835514AAA8AC86D8F4844 v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NUMaskSourceNode *v19;
  objc_super v21;
  _OWORD v22[2];
  _QWORD v23[3];
  _QWORD v24[4];

  var1 = a5.var1;
  var0 = a5.var0;
  v24[3] = *MEMORY[0x1E0C80C00];
  v24[0] = a6;
  v23[0] = CFSTR("identifier");
  v23[1] = CFSTR("croppedExtent");
  v12 = (void *)MEMORY[0x1E0CB3B18];
  v13 = a4->var1;
  v22[0] = a4->var0;
  v22[1] = v13;
  v14 = a6;
  v15 = a3;
  objc_msgSend(v12, "nu_valueWithPixelRect:", v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v16;
  v23[2] = CFSTR("scale");
  NUScaleToValue(var0, var1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v21.receiver = self;
  v21.super_class = (Class)NUMaskSourceNode;
  v19 = -[NUCISourceNode initWithImage:settings:orientation:](&v21, sel_initWithImage_settings_orientation_, v15, v18, a7);

  return v19;
}

- ($209B98C1CDF2DEBD503CBDE3C0ED7C90)croppedExtent
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
  -[NURenderNode settings](self, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("croppedExtent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    NUAssertLogger_20995();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing croppedExtent"));
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
    _NUAssertFailHandler((uint64_t)"-[NUMaskSourceNode croppedExtent]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUMaskSource.m", 51, CFSTR("missing croppedExtent"), v25, v26, v27, v28, v38);
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
    _NUAssertFailHandler((uint64_t)"-[NUMaskSourceNode croppedExtent]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUMaskSource.m", 52, CFSTR("wrong value type"), v34, v35, v36, v37, v38);
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
  -[NURenderNode settings](self, "settings");
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
    _NUAssertFailHandler((uint64_t)"-[NUMaskSourceNode scale]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUMaskSource.m", 59, CFSTR("missing scale"), v27, v28, v29, v30, *(uint64_t *)v40);
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
    _NUAssertFailHandler((uint64_t)"-[NUMaskSourceNode scale]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUMaskSource.m", 60, CFSTR("wrong value type"), v36, v37, v38, v39, *(uint64_t *)v40);
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

- (BOOL)supportsPipelineState:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
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
  v5 = a3;
  if (!a4)
  {
    NUAssertLogger_20995();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v10;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_20995();
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
    _NUAssertFailHandler((uint64_t)"-[NUMaskSourceNode supportsPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUMaskSource.m", 66, CFSTR("Invalid parameter not satisfying: %s"), v21, v22, v23, v24, (uint64_t)"error != NULL");
  }
  v6 = v5;
  v7 = objc_msgSend(v5, "mediaComponentType");
  if (v7 != 1)
  {
    +[NUError mismatchError:object:](NUError, "mismatchError:object:", CFSTR("expected an image mediaComponentType"), v6);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7 == 1;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUMaskSourceNode;
  -[NUCISourceNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v7, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sourceImage:(id *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NUMaskSourceNode;
  -[NUSourceNode _evaluateImage:](&v4, sel__evaluateImage_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_evaluateImage:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  CGAffineTransform v16;
  __int128 v17;
  __int128 v18;
  CGAffineTransform v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)NUMaskSourceNode;
  -[NUSourceNode _evaluateImage:](&v24, sel__evaluateImage_, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[NUMaskSourceNode croppedExtent](self, "croppedExtent");
    objc_msgSend(v5, "imageByCroppingToRect:", (double)v20, (double)v21, (double)v22, (double)v23);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[NUMaskSourceNode scale](self, "scale");
    v9 = NUScaleToDouble(v7, v8);
    memset(&v19, 0, sizeof(v19));
    CGAffineTransformMakeScale(&v19, v9, v9);
    -[NUMaskSourceNode croppedExtent](self, "croppedExtent");
    *(_OWORD *)&v16.a = v17;
    *(_OWORD *)&v16.c = v18;
    NU::RectT<long>::scale((uint64_t *)&v16, 3, v9, v9);
    v14 = *(_OWORD *)&v16.a;
    v15 = *(_OWORD *)&v16.c;
    objc_msgSend(v6, "imageByClampingToExtent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v19;
    objc_msgSend(v10, "imageByApplyingTransform:", &v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "imageByCroppingToRect:", (double)(uint64_t)v14, (double)*((uint64_t *)&v14 + 1), (double)(uint64_t)v15, (double)*((uint64_t *)&v15 + 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)_evaluateImageGeometryWithSourceOptions:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  NUImageGeometry *v7;
  int64_t v8;
  _OWORD v10[2];
  int64x2_t v11[2];
  int64x2_t v12;
  __int128 v13;

  v12 = 0u;
  v13 = 0u;
  -[NUMaskSourceNode croppedExtent](self, "croppedExtent", a3, a4);
  v5 = -[NUMaskSourceNode scale](self, "scale");
  NUPixelRectScaleRational(v11, v5, v6, 0, &v12);
  v7 = [NUImageGeometry alloc];
  v8 = -[NUCISourceNode sourceOrientation](self, "sourceOrientation");
  v10[0] = v12;
  v10[1] = v13;
  return -[NUImageGeometry initWithExtent:renderScale:orientation:](v7, "initWithExtent:renderScale:orientation:", v10, NUScaleOne, v8);
}

@end
