@implementation NUImageFactory

+ (id)bufferImageWithLayout:(id)a3 format:(id)a4 colorSpace:(id)a5
{
  id v7;
  id v8;
  id v9;
  _NUBufferImage *v10;
  void *v11;
  void *v12;
  _NUBufferImage *v13;
  NSObject *v15;
  void *v16;
  void *specific;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    NUAssertLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "layout != nil");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v16;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v28;
        v42 = 2114;
        v43 = v30;
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
      v41 = v21;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v31 = "layout != nil";
    v32 = 373;
LABEL_20:

    _NUAssertFailHandler((uint64_t)"+[NUImageFactory bufferImageWithLayout:format:colorSpace:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", v32, CFSTR("Invalid parameter not satisfying: %s"), v36, v37, v38, v39, (uint64_t)v31);
  }
  if (!v8)
  {
    NUAssertLogger();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "format != nil");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v23;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v24)
    {
      if (v25)
      {
        v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v33;
        v42 = 2114;
        v43 = v35;
        _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v27;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v31 = "format != nil";
    v32 = 374;
    goto LABEL_20;
  }
  v10 = [_NUBufferImage alloc];
  +[NUFactory sharedFactory](NUFactory, "sharedFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bufferFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[_NUImage initWithLayout:format:colorSpace:tileFactory:](v10, "initWithLayout:format:colorSpace:tileFactory:", v7, v8, v9, v12);

  -[_NUImage beginAccess](v13, "beginAccess");
  return v13;
}

+ (id)_newCIImageFromImage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _NUImageCIProvider *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v18;
  void *v19;
  void *specific;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    NUAssertLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "image != nil");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v19;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v25;
        v36 = 2114;
        v37 = v27;
        _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v24;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUImageFactory _newCIImageFromImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 387, CFSTR("Invalid parameter not satisfying: %s"), v28, v29, v30, v31, (uint64_t)"image != nil");
  }
  v4 = v3;
  v32 = *MEMORY[0x1E0C9E160];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "immutableImageCopy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[_NUImageCIProvider initWithImage:]([_NUImageCIProvider alloc], "initWithImage:", v7);
  v9 = objc_msgSend(v7, "size");
  v11 = v10;
  v12 = objc_alloc(MEMORY[0x1E0C9DDC8]);
  objc_msgSend(v7, "format");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "CIFormat");
  objc_msgSend(v7, "colorSpace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v12, "initWithImageProvider:size::format:colorSpace:options:", v8, v9, v11, v14, objc_msgSend(v15, "CGColorSpace"), v6);

  return v16;
}

+ (CGImage)newCGImageFromBufferImage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  size_t v7;
  size_t v8;
  size_t v9;
  void *v10;
  char v11;
  CGBitmapInfo v12;
  size_t v13;
  size_t v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  char v25;
  size_t v26;
  void *v27;
  uint64_t v28;
  __int128 *v29;
  __int128 v30;
  id v31;
  CGDataProvider *v32;
  void *v33;
  CGImage *v34;
  void *v35;
  char v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  const void *(__cdecl *v44)(void *);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v50;
  void *v51;
  void *specific;
  NSObject *v53;
  _BOOL4 v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  const void *(__cdecl *v59)(void *);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  CGDataProviderDirectCallbacks callbacks;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v66 = v3;
  if (!v3)
  {
    NUAssertLogger();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "image != nil");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      callbacks.version = 138543362;
      *(_QWORD *)(&callbacks.version + 1) = v51;
      _os_log_error_impl(&dword_1A6553000, v50, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&callbacks, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v54)
      {
        v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "componentsJoinedByString:", CFSTR("\n"));
        v59 = (const void *(__cdecl *)(void *))objc_claimAutoreleasedReturnValue();
        callbacks.version = 138543618;
        *(_QWORD *)(&callbacks.version + 1) = v57;
        WORD2(callbacks.getBytePointer) = 2114;
        *(CGDataProviderGetBytePointerCallback *)((char *)&callbacks.getBytePointer + 6) = v59;
        _os_log_error_impl(&dword_1A6553000, v53, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&callbacks, 0x16u);

      }
    }
    else if (v54)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "componentsJoinedByString:", CFSTR("\n"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      callbacks.version = 138543362;
      *(_QWORD *)(&callbacks.version + 1) = v56;
      _os_log_error_impl(&dword_1A6553000, v53, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&callbacks, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"CGImageRef newCGImageFromImage(__strong id<NUBufferImage>)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 237, CFSTR("Invalid parameter not satisfying: %s"), v60, v61, v62, v63, (uint64_t)"image != nil");
  }
  v4 = v3;
  objc_msgSend(v3, "immutableImageCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "format");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "size");
  v9 = v8;
  +[NUPixelFormat R8](NUPixelFormat, "R8");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "isEqualToPixelFormat:", v10);

  if ((v11 & 1) != 0)
  {
    v12 = 0;
    v13 = 8;
    v14 = 8;
    goto LABEL_17;
  }
  +[NUPixelFormat RGBAf](NUPixelFormat, "RGBAf");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v6, "isEqualToPixelFormat:", v15);

  if ((v16 & 1) != 0)
  {
    v12 = 8451;
    v14 = 128;
    v13 = 32;
    goto LABEL_17;
  }
  +[NUPixelFormat RGBAh](NUPixelFormat, "RGBAh");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v6, "isEqualToPixelFormat:", v17);

  if ((v18 & 1) != 0)
  {
    v12 = 4355;
    v14 = 64;
    v13 = 16;
    goto LABEL_17;
  }
  +[NUPixelFormat ARGB8](NUPixelFormat, "ARGB8");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v6, "isEqualToPixelFormat:", v19);

  if ((v20 & 1) != 0)
  {
    v12 = 4;
LABEL_16:
    v14 = 32;
    v13 = 8;
    goto LABEL_17;
  }
  +[NUPixelFormat BGRA8](NUPixelFormat, "BGRA8");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v6, "isEqualToPixelFormat:", v21);

  if ((v22 & 1) != 0)
  {
    v12 = 8194;
    goto LABEL_16;
  }
  +[NUPixelFormat RGBA8](NUPixelFormat, "RGBA8");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToPixelFormat:", v23))
  {

LABEL_15:
    v12 = 16385;
    goto LABEL_16;
  }
  +[NUPixelFormat sRGBA8](NUPixelFormat, "sRGBA8");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v6, "isEqualToPixelFormat:", v24);

  if ((v25 & 1) != 0)
    goto LABEL_15;
  +[NUPixelFormat A2RGB10](NUPixelFormat, "A2RGB10");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v6, "isEqualToPixelFormat:", v35);

  if ((v36 & 1) == 0)
  {
    NUAssertLogger();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("newCGImageFromImage unsupported format: %@"), v6);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      callbacks.version = 138543362;
      *(_QWORD *)(&callbacks.version + 1) = v38;
      _os_log_impl(&dword_1A6553000, v37, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", (uint8_t *)&callbacks, 0xCu);

    }
    v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
    if (v39)
    {
      if (v41)
      {
        v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
        v44 = (const void *(__cdecl *)(void *))objc_claimAutoreleasedReturnValue();
        callbacks.version = 138543618;
        *(_QWORD *)(&callbacks.version + 1) = v42;
        WORD2(callbacks.getBytePointer) = 2114;
        *(CGDataProviderGetBytePointerCallback *)((char *)&callbacks.getBytePointer + 6) = v44;
        _os_log_error_impl(&dword_1A6553000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&callbacks, 0x16u);

      }
    }
    else if (v41)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "componentsJoinedByString:", CFSTR("\n"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      callbacks.version = 138543362;
      *(_QWORD *)(&callbacks.version + 1) = v65;
      _os_log_error_impl(&dword_1A6553000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&callbacks, 0xCu);

    }
    _NUAssertContinueHandler((uint64_t)"CGImageRef newCGImageFromImage(__strong id<NUBufferImage>)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 322, CFSTR("newCGImageFromImage unsupported format: %@"), v45, v46, v47, v48, (uint64_t)v6);
    goto LABEL_32;
  }
  v12 = 204806;
  v14 = 32;
  v13 = 10;
LABEL_17:
  v26 = objc_msgSend(v6, "alignedRowBytesForWidth:", v7);
  objc_msgSend(v5, "layout");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "tileCount");

  if (v28 == 1)
    v29 = &xmmword_1E5063A10;
  else
    v29 = &xmmword_1E5063A38;
  v30 = v29[1];
  *(_OWORD *)&callbacks.version = *v29;
  *(_OWORD *)&callbacks.releaseBytePointer = v30;
  callbacks.releaseInfo = (CGDataProviderReleaseInfoCallback)*((_QWORD *)v29 + 4);
  v31 = v5;
  v32 = CGDataProviderCreateDirect(v31, v26 * v9, &callbacks);
  if (!v32)
  {
LABEL_32:
    v34 = 0;
    goto LABEL_33;
  }
  objc_msgSend(v31, "colorSpace");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = CGImageCreate(v7, v9, v13, v14, v26, (CGColorSpaceRef)objc_msgSend(v33, "CGColorSpace"), v12, v32, 0, 0, kCGRenderingIntentDefault);

  CGDataProviderRelease(v32);
LABEL_33:

  return v34;
}

+ (CGImage)newCGImageFromImageStorage:(id)a3 colorSpace:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NUBufferImageAdapter *v10;
  CGImage *v11;
  _QWORD v13[4];

  v6 = a3;
  v7 = a4;
  v13[0] = 0;
  v13[1] = 0;
  v13[2] = objc_msgSend(v6, "size");
  v13[3] = v8;
  +[NURegion regionWithRect:](NURegion, "regionWithRect:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NUBufferImageAdapter initWithBufferProvider:colorSpace:validRegion:]([NUBufferImageAdapter alloc], "initWithBufferProvider:colorSpace:validRegion:", v6, v7, v9);
  v11 = (CGImage *)objc_msgSend(a1, "newCGImageFromBufferImage:", v10);

  return v11;
}

+ (CGImage)newCGImageFromImageBuffer:(id)a3
{
  id v3;
  void *v4;
  __CVBuffer *v5;
  CGImage *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *specific;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  CGImageRef imageOut;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    NUAssertLogger();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "imageBuffer != nil");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v24;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v30;
        v40 = 2114;
        v41 = v32;
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
      v39 = v29;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUImageFactory newCGImageFromImageBuffer:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 417, CFSTR("Invalid parameter not satisfying: %s"), v33, v34, v35, v36, (uint64_t)"imageBuffer != nil");
  }
  v5 = (__CVBuffer *)objc_msgSend(v3, "CVPixelBuffer");
  if (!CVPixelBufferGetIOSurface(v5) || (v6 = (CGImage *)CGImageCreateFromIOSurface()) == 0)
  {
    imageOut = 0;
    if (VTCreateCGImageFromCVPixelBuffer(v5, 0, &imageOut))
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_23066);
      v7 = (id)_NUAssertLogger;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v4, "format");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("newCGImageFromImageBuffer: unsupported format: %@"), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v39 = v10;
        _os_log_impl(&dword_1A6553000, v7, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      }
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_23066);
        v11 = (id)_NUAssertLogger;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v39 = v12;
          v40 = 2114;
          v41 = v14;
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
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v39 = v22;
          _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

        }
      }

      objc_msgSend(v4, "format");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _NUAssertContinueHandler((uint64_t)"+[NUImageFactory newCGImageFromImageBuffer:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", 430, CFSTR("newCGImageFromImageBuffer: unsupported format: %@"), v16, v17, v18, v19, (uint64_t)v15);

      v6 = 0;
    }
    else
    {
      v6 = imageOut;
    }
  }

  return v6;
}

+ (id)surfaceImageWithLayout:(id)a3 format:(id)a4 colorSpace:(id)a5
{
  id v7;
  id v8;
  id v9;
  _NUSurfaceImage *v10;
  void *v11;
  void *v12;
  _NUSurfaceImage *v13;
  NSObject *v15;
  void *v16;
  void *specific;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    NUAssertLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "layout != nil");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v16;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v28;
        v42 = 2114;
        v43 = v30;
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
      v41 = v21;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v31 = "layout != nil";
    v32 = 443;
LABEL_20:

    _NUAssertFailHandler((uint64_t)"+[NUImageFactory(Private) surfaceImageWithLayout:format:colorSpace:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUImageFactory.mm", v32, CFSTR("Invalid parameter not satisfying: %s"), v36, v37, v38, v39, (uint64_t)v31);
  }
  if (!v8)
  {
    NUAssertLogger();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "format != nil");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v23;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v24)
    {
      if (v25)
      {
        v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v33;
        v42 = 2114;
        v43 = v35;
        _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v27;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v31 = "format != nil";
    v32 = 444;
    goto LABEL_20;
  }
  v10 = [_NUSurfaceImage alloc];
  +[NUFactory sharedFactory](NUFactory, "sharedFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "surfaceFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[_NUImage initWithLayout:format:colorSpace:tileFactory:](v10, "initWithLayout:format:colorSpace:tileFactory:", v7, v8, v9, v12);

  -[_NUImage beginAccess](v13, "beginAccess");
  return v13;
}

@end
