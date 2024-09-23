@implementation NUPixelFormat

- (int64_t)alignedRowBytesForWidth:(int64_t)a3
{
  NSObject *v4;
  void *v5;
  void *specific;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3 <= 0)
  {
    NUAssertLogger_9222();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "width > 0");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v5;
      _os_log_error_impl(&dword_1A6553000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_9222();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v12 = (void *)MEMORY[0x1E0CB3978];
        v13 = v11;
        objc_msgSend(v12, "callStackSymbols");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v11;
        v22 = 2114;
        v23 = v15;
        _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v10;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUPixelFormat alignedRowBytesForWidth:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPixelFormat.m", 325, CFSTR("Invalid parameter not satisfying: %s"), v16, v17, v18, v19, (uint64_t)"width > 0");
  }
  return +[NUImageUtilities alignedRowBytesForWidth:bytesPerPixel:](NUImageUtilities, "alignedRowBytesForWidth:bytesPerPixel:", a3, -[NUPixelFormat bytesPerPixel](self, "bytesPerPixel"));
}

- (unint64_t)hash
{
  return 0x1A9B5EB30F2175 * -[NSString hash](self->_name, "hash");
}

- (BOOL)isEqualToPixelFormat:(id)a3
{
  return -[NSString isEqualToString:](self->_name, "isEqualToString:", *((_QWORD *)a3 + 6));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[NUPixelFormat isEqualToPixelFormat:](self, "isEqualToPixelFormat:", v4);

  return v5;
}

- (int64_t)bytesPerPixel
{
  return self->_bytesPerPixel;
}

- (int64_t)bitsPerComponent
{
  return self->_bitsPerComponent;
}

- (int)CIFormat
{
  return self->_CIFormat;
}

- (unsigned)CVPixelFormat
{
  return self->_CVPixelFormat;
}

- (unint64_t)metalFormat
{
  return self->_metalFormat;
}

- (BOOL)supportsExtendedRange
{
  return self->_supportsExtendedRange;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isYCC
{
  return self->_isYCC;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)chromaSubsampling
{
  int64_t height;
  int64_t width;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  height = self->_chromaSubsampling.height;
  width = self->_chromaSubsampling.width;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (int64_t)bytesPerLuma
{
  return self->_bytesPerLuma;
}

- (int64_t)bytesPerChroma
{
  return self->_bytesPerChroma;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)pixelFormatForCIFormat:(int)a3
{
  void *v3;
  NSObject *v5;
  void *v6;
  void *specific;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[12];
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C9DFF8] == a3)
  {
    objc_msgSend(a1, "ARGB8");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (*MEMORY[0x1E0C9E000] == a3)
  {
    objc_msgSend(a1, "BGRA8");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (*MEMORY[0x1E0C9E070] == a3)
  {
    objc_msgSend(a1, "RGBA8");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (*MEMORY[0x1E0C9E068] == a3)
  {
    objc_msgSend(a1, "RGBA16");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (*MEMORY[0x1E0C9E078] == a3)
  {
    objc_msgSend(a1, "RGBAf");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (*MEMORY[0x1E0C9E080] == a3)
  {
    objc_msgSend(a1, "RGBAh");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (*MEMORY[0x1E0C9E048] == a3)
  {
    objc_msgSend(a1, "RG16");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (*MEMORY[0x1E0C9DFE0] == a3)
  {
    objc_msgSend(a1, "R16");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (*MEMORY[0x1E0C9E008] != a3)
    {
      NUAssertLogger_9222();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown format passed to NUPixelFormat -pixelFormatForCIFormat"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v21 = 138543362;
        *(_QWORD *)&v21[4] = v6;
        _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v21, 0xCu);

      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_9222();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v9)
        {
          v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v13 = (void *)MEMORY[0x1E0CB3978];
          v14 = v12;
          objc_msgSend(v13, "callStackSymbols");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v21 = 138543618;
          *(_QWORD *)&v21[4] = v12;
          v22 = 2114;
          v23 = v16;
          _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v21, 0x16u);

        }
      }
      else if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v21 = 138543362;
        *(_QWORD *)&v21[4] = v11;
        _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v21, 0xCu);

      }
      _NUAssertFailHandler((uint64_t)"+[NUPixelFormat pixelFormatForCIFormat:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPixelFormat.m", 49, CFSTR("Unknown format passed to NUPixelFormat -pixelFormatForCIFormat"), v17, v18, v19, v20, *(uint64_t *)v21);
    }
    objc_msgSend(a1, "R8");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)pixelFormatForCVPixelFormat:(unsigned int)a3
{
  int v3;
  int v4;
  void *v5;
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
  if ((int)a3 <= 1278226487)
  {
    if ((int)a3 <= 826486887)
    {
      if (a3 == 32)
      {
        objc_msgSend(a1, "ARGB8");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        return v5;
      }
      if (a3 != 826486840)
      {
        v3 = 826486886;
LABEL_17:
        if (a3 == v3)
        {
          objc_msgSend(a1, "R32f");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          return v5;
        }
LABEL_36:
        NUAssertLogger_9222();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown format passed to NUPixelFormat -pixelFormatForCVPixelFormat"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v23 = 138543362;
          *(_QWORD *)&v23[4] = v8;
          _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v23, 0xCu);

        }
        specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        NUAssertLogger_9222();
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
        _NUAssertFailHandler((uint64_t)"+[NUPixelFormat pixelFormatForCVPixelFormat:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPixelFormat.m", 101, CFSTR("Unknown format passed to NUPixelFormat -pixelFormatForCVPixelFormat"), v19, v20, v21, v22, *(uint64_t *)v23);
      }
LABEL_29:
      objc_msgSend(a1, "R8");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    if ((int)a3 > 843264309)
    {
      if (a3 == 843264310)
      {
        objc_msgSend(a1, "RG16");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        return v5;
      }
      if (a3 == 1111970369)
      {
        objc_msgSend(a1, "BGRA8");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        return v5;
      }
      goto LABEL_36;
    }
    if (a3 != 826486888)
    {
      v4 = 826487094;
      goto LABEL_21;
    }
LABEL_30:
    objc_msgSend(a1, "R16h");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  if ((int)a3 <= 1380401728)
  {
    if ((int)a3 <= 1278226535)
    {
      if (a3 != 1278226488)
      {
        v3 = 1278226534;
        goto LABEL_17;
      }
      goto LABEL_29;
    }
    if (a3 != 1278226536)
    {
      v4 = 1278226742;
LABEL_21:
      if (a3 == v4)
      {
        objc_msgSend(a1, "R16");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        return v5;
      }
      goto LABEL_36;
    }
    goto LABEL_30;
  }
  if ((int)a3 > 1380411456)
  {
    if (a3 == 1380411457)
    {
      objc_msgSend(a1, "RGBAh");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    if (a3 == 1647719521)
    {
      objc_msgSend(a1, "RGBA16");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    goto LABEL_36;
  }
  if (a3 == 1380401729)
  {
    objc_msgSend(a1, "RGBA8");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  if (a3 != 1380410945)
    goto LABEL_36;
  objc_msgSend(a1, "RGBAf");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

+ (NUPixelFormat)ARGB8
{
  uint64_t v2;
  void *v3;

  v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E0C9DFF8];
  *(_DWORD *)(v2 + 16) = 32;
  *(_OWORD *)(v2 + 24) = xmmword_1A671A350;
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = CFSTR("ARGB8");

  *(_BYTE *)(v2 + 8) = 0;
  *(_QWORD *)(v2 + 40) = 0;
  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)BGRA8
{
  uint64_t v2;
  void *v3;

  v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E0C9E000];
  *(_DWORD *)(v2 + 16) = 1111970369;
  *(_OWORD *)(v2 + 24) = xmmword_1A671A350;
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = CFSTR("BGRA8");

  *(_BYTE *)(v2 + 8) = 0;
  *(_QWORD *)(v2 + 40) = 80;
  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)RGBA8
{
  uint64_t v2;
  void *v3;

  v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E0C9E070];
  *(_DWORD *)(v2 + 16) = 1380401729;
  *(_OWORD *)(v2 + 24) = xmmword_1A671A350;
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = CFSTR("RGBA8");

  *(_BYTE *)(v2 + 8) = 0;
  *(_QWORD *)(v2 + 40) = 70;
  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)sRGBA8
{
  uint64_t v2;
  void *v3;

  v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E0C9E070];
  *(_DWORD *)(v2 + 16) = 1380401729;
  *(_OWORD *)(v2 + 24) = xmmword_1A671A350;
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = CFSTR("sRGBA8");

  *(_BYTE *)(v2 + 8) = 0;
  *(_QWORD *)(v2 + 40) = 71;
  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)RGBA16
{
  uint64_t v2;
  void *v3;

  v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E0C9E068];
  *(_DWORD *)(v2 + 16) = 1647719521;
  *(_OWORD *)(v2 + 24) = xmmword_1A671A360;
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = CFSTR("RGBA16");

  *(_BYTE *)(v2 + 8) = 0;
  *(_QWORD *)(v2 + 40) = 110;
  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)RG16
{
  uint64_t v2;
  void *v3;

  v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E0C9E048];
  *(_DWORD *)(v2 + 16) = 843264310;
  *(_OWORD *)(v2 + 24) = xmmword_1A671A370;
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = CFSTR("RG16");

  *(_BYTE *)(v2 + 8) = 0;
  *(_QWORD *)(v2 + 40) = 60;
  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)RGBAf
{
  uint64_t v2;
  void *v3;

  v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E0C9E078];
  *(_DWORD *)(v2 + 16) = 1380410945;
  *(_OWORD *)(v2 + 24) = xmmword_1A671A380;
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = CFSTR("RGBAf");

  *(_BYTE *)(v2 + 8) = 1;
  *(_QWORD *)(v2 + 40) = 125;
  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)RGBAh
{
  uint64_t v2;
  void *v3;

  v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E0C9E080];
  *(_DWORD *)(v2 + 16) = 1380411457;
  *(_OWORD *)(v2 + 24) = xmmword_1A671A360;
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = CFSTR("RGBAh");

  *(_BYTE *)(v2 + 8) = 1;
  *(_QWORD *)(v2 + 40) = 115;
  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)R8
{
  uint64_t v2;
  void *v3;

  v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E0C9E040];
  *(_DWORD *)(v2 + 16) = 1278226488;
  *(_OWORD *)(v2 + 24) = xmmword_1A671A390;
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = CFSTR("R8");

  *(_BYTE *)(v2 + 8) = 0;
  *(_QWORD *)(v2 + 40) = 10;
  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)R16
{
  uint64_t v2;
  void *v3;

  v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E0C9E038];
  *(_DWORD *)(v2 + 16) = 1278226742;
  *(_OWORD *)(v2 + 24) = xmmword_1A671A3A0;
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = CFSTR("R16");

  *(_BYTE *)(v2 + 8) = 0;
  *(_QWORD *)(v2 + 40) = 20;
  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)R16h
{
  uint64_t v2;
  void *v3;

  v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E0C9E098];
  *(_DWORD *)(v2 + 16) = 1278226536;
  *(_OWORD *)(v2 + 24) = xmmword_1A671A3A0;
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = CFSTR("R16h");

  *(_BYTE *)(v2 + 8) = 0;
  *(_QWORD *)(v2 + 40) = 25;
  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)R32f
{
  uint64_t v2;
  void *v3;

  v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E0C9E090];
  *(_DWORD *)(v2 + 16) = 1278226534;
  *(_OWORD *)(v2 + 24) = xmmword_1A671A3B0;
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = CFSTR("R32f");

  *(_BYTE *)(v2 + 8) = 0;
  *(_QWORD *)(v2 + 40) = 55;
  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)X2RGB10
{
  uint64_t v2;
  void *v3;

  v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E0C9E058];
  *(_DWORD *)(v2 + 16) = 1815162994;
  *(_OWORD *)(v2 + 24) = xmmword_1A671A3C0;
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = CFSTR("RGB10");

  *(_BYTE *)(v2 + 8) = 0;
  *(_QWORD *)(v2 + 40) = 94;
  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)A2RGB10
{
  uint64_t v2;
  void *v3;

  v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E0C9DFE8];
  *(_DWORD *)(v2 + 16) = 1815162994;
  *(_OWORD *)(v2 + 24) = xmmword_1A671A3C0;
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = CFSTR("A2RGB10");

  *(_BYTE *)(v2 + 8) = 0;
  *(_QWORD *)(v2 + 40) = 94;
  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)sRGB10XR
{
  uint64_t v2;
  void *v3;

  v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E0C9E060];
  *(_DWORD *)(v2 + 16) = 1999843442;
  *(_OWORD *)(v2 + 24) = xmmword_1A671A3C0;
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = CFSTR("sRGB10XR");

  *(_BYTE *)(v2 + 8) = 1;
  *(_QWORD *)(v2 + 40) = 555;
  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)YCC10f420
{
  uint64_t v2;
  void *v3;

  v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E0C9DFD0];
  *(_DWORD *)(v2 + 16) = 2019963440;
  *(_OWORD *)(v2 + 24) = xmmword_1A671A3D0;
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = CFSTR("YCC10f420");

  *(_WORD *)(v2 + 8) = 256;
  *(_QWORD *)(v2 + 40) = 505;
  *(int64x2_t *)(v2 + 72) = vdupq_n_s64(2uLL);
  *(_OWORD *)(v2 + 56) = xmmword_1A671A3E0;
  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)YCC10f420p
{
  uint64_t v2;
  void *v3;

  v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E0C9DFD8];
  *(_DWORD *)(v2 + 16) = 1885745712;
  *(_OWORD *)(v2 + 24) = xmmword_1A671A3F0;
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = CFSTR("YCC10f420p");

  *(_WORD *)(v2 + 8) = 256;
  *(_QWORD *)(v2 + 40) = 508;
  *(int64x2_t *)(v2 + 72) = vdupq_n_s64(2uLL);
  *(_OWORD *)(v2 + 56) = xmmword_1A671A3E0;
  return (NUPixelFormat *)(id)v2;
}

@end
