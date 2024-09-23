@implementation NUImageHistogram

- (NUImageHistogram)init
{
  return -[NUImageHistogram initWithBinCount:range:](self, "initWithBinCount:range:", 256, 0.0, 1.0);
}

- (NUImageHistogram)initWithBinCount:(int64_t)a3 range:(id)a4
{
  double var0;
  double var1;
  NUImageHistogram *v7;
  objc_class *v8;
  uint64_t v9;
  NUHistogram *red;
  uint64_t v11;
  NUHistogram *green;
  uint64_t v13;
  NUHistogram *blue;
  uint64_t v15;
  NUHistogram *luminance;
  NSObject *v18;
  void *v19;
  void *specific;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  objc_super v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  if (a3 <= 0)
  {
    NUAssertLogger_16814();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "count > 0");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v19;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_16814();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = (void *)MEMORY[0x1E0CB3978];
        v41 = v39;
        objc_msgSend(v40, "callStackSymbols");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v68 = v39;
        v69 = 2114;
        v70 = v43;
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
      v68 = v24;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageHistogram initWithBinCount:range:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUImageHistogram.m", 54, CFSTR("Invalid parameter not satisfying: %s"), v44, v45, v46, v47, (uint64_t)"count > 0");
  }
  var0 = a4.var0;
  if (a4.var0 > 0.0)
  {
    NUAssertLogger_16814();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "range.min <= 0.0");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v26;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_16814();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v49 = (void *)MEMORY[0x1E0CB3978];
        v50 = v48;
        objc_msgSend(v49, "callStackSymbols");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "componentsJoinedByString:", CFSTR("\n"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v68 = v48;
        v69 = 2114;
        v70 = v52;
        _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v31;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageHistogram initWithBinCount:range:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUImageHistogram.m", 55, CFSTR("Invalid parameter not satisfying: %s"), v53, v54, v55, v56, (uint64_t)"range.min <= 0.0");
  }
  var1 = a4.var1;
  if (a4.var1 < 1.0)
  {
    NUAssertLogger_16814();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "range.max >= 1.0");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v33;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_16814();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (v34)
    {
      if (v36)
      {
        v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v58 = (void *)MEMORY[0x1E0CB3978];
        v59 = v57;
        objc_msgSend(v58, "callStackSymbols");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "componentsJoinedByString:", CFSTR("\n"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v68 = v57;
        v69 = 2114;
        v70 = v61;
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
      v68 = v38;
      _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageHistogram initWithBinCount:range:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Histogram/NUImageHistogram.m", 56, CFSTR("Invalid parameter not satisfying: %s"), v62, v63, v64, v65, (uint64_t)"range.max >= 1.0");
  }
  v66.receiver = self;
  v66.super_class = (Class)NUImageHistogram;
  v7 = -[NUImageHistogram init](&v66, sel_init);
  v7->_binCount = a3;
  v7->_range.min = var0;
  v7->_range.max = var1;
  v8 = (objc_class *)objc_msgSend((id)objc_opt_class(), "_histogramClass");
  v9 = objc_msgSend([v8 alloc], "initWithBinCount:range:", a3, var0, var1);
  red = v7->_red;
  v7->_red = (NUHistogram *)v9;

  v11 = objc_msgSend([v8 alloc], "initWithBinCount:range:", a3, var0, var1);
  green = v7->_green;
  v7->_green = (NUHistogram *)v11;

  v13 = objc_msgSend([v8 alloc], "initWithBinCount:range:", a3, var0, var1);
  blue = v7->_blue;
  v7->_blue = (NUHistogram *)v13;

  v15 = objc_msgSend([v8 alloc], "initWithBinCount:range:", a3, var0, var1);
  luminance = v7->_luminance;
  v7->_luminance = (NUHistogram *)v15;

  return v7;
}

- (id)immutableCopyWithZone:(_NSZone *)a3
{
  NUImageHistogram *v5;
  NUHistogram *v6;
  NUHistogram *red;
  NUHistogram *v8;
  NUHistogram *green;
  NUHistogram *v10;
  NUHistogram *blue;
  NUHistogram *v12;
  NUHistogram *luminance;

  v5 = +[NUImageHistogram allocWithZone:](NUImageHistogram, "allocWithZone:");
  v6 = -[NUHistogram copyWithZone:](self->_red, "copyWithZone:", a3);
  red = v5->_red;
  v5->_red = v6;

  v8 = -[NUHistogram copyWithZone:](self->_green, "copyWithZone:", a3);
  green = v5->_green;
  v5->_green = v8;

  v10 = -[NUHistogram copyWithZone:](self->_blue, "copyWithZone:", a3);
  blue = v5->_blue;
  v5->_blue = v10;

  v12 = -[NUHistogram copyWithZone:](self->_luminance, "copyWithZone:", a3);
  luminance = v5->_luminance;
  v5->_luminance = v12;

  v5->_binCount = self->_binCount;
  v5->_range = self->_range;
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NUMutableImageHistogram *v5;
  NUHistogram *v6;
  NUHistogram *red;
  NUHistogram *v8;
  NUHistogram *green;
  NUHistogram *v10;
  NUHistogram *blue;
  NUHistogram *v12;
  NUHistogram *luminance;

  v5 = +[NUMutableImageHistogram allocWithZone:](NUMutableImageHistogram, "allocWithZone:");
  v6 = -[NUHistogram mutableCopyWithZone:](self->_red, "mutableCopyWithZone:", a3);
  red = v5->super._red;
  v5->super._red = v6;

  v8 = -[NUHistogram mutableCopyWithZone:](self->_green, "mutableCopyWithZone:", a3);
  green = v5->super._green;
  v5->super._green = v8;

  v10 = -[NUHistogram mutableCopyWithZone:](self->_blue, "mutableCopyWithZone:", a3);
  blue = v5->super._blue;
  v5->super._blue = v10;

  v12 = -[NUHistogram mutableCopyWithZone:](self->_luminance, "mutableCopyWithZone:", a3);
  luminance = v5->super._luminance;
  v5->super._luminance = v12;

  v5->super._binCount = self->_binCount;
  v5->super._range = self->_range;
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[NUImageHistogram binCount](self, "binCount");
  -[NUImageHistogram range](self, "range");
  v7 = v6;
  -[NUImageHistogram range](self, "range");
  v9 = v8;
  -[NUImageHistogram red](self, "red");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUImageHistogram green](self, "green");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUImageHistogram blue](self, "blue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUImageHistogram luminance](self, "luminance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> count=%ld, range: [%0.3f..%0.3f], red=%@, green=%@, blue=%@, luminance=%@"), v4, self, v5, v7, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (int64_t)binCount
{
  return self->_binCount;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)range
{
  double min;
  double max;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  min = self->_range.min;
  max = self->_range.max;
  result.var1 = max;
  result.var0 = min;
  return result;
}

- (int64_t)sampleCount
{
  return self->_sampleCount;
}

- (NUHistogram)red
{
  return self->_red;
}

- (NUHistogram)green
{
  return self->_green;
}

- (NUHistogram)blue
{
  return self->_blue;
}

- (NUHistogram)luminance
{
  return self->_luminance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_luminance, 0);
  objc_storeStrong((id *)&self->_blue, 0);
  objc_storeStrong((id *)&self->_green, 0);
  objc_storeStrong((id *)&self->_red, 0);
}

+ (Class)_histogramClass
{
  return (Class)objc_opt_class();
}

@end
