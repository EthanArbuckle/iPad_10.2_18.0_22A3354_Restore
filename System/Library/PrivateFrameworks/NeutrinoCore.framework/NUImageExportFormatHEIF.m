@implementation NUImageExportFormatHEIF

- (NUImageExportFormatHEIF)init
{
  return -[NUImageExportFormatHEIF initWithBitDepth:](self, "initWithBitDepth:", 8);
}

- (NUImageExportFormatHEIF)initWithBitDepth:(int64_t)a3
{
  NUImageExportFormatHEIF *result;
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
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 8)
  {
    NUAssertLogger_5535();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "bitDepth == 8 || bitDepth == 10");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v6;
      _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_5535();
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
        *(_DWORD *)buf = 138543618;
        v23 = v12;
        v24 = 2114;
        v25 = v16;
        _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v11;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageExportFormatHEIF initWithBitDepth:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageExportFormat.m", 169, CFSTR("Invalid parameter not satisfying: %s"), v17, v18, v19, v20, (uint64_t)"bitDepth == 8 || bitDepth == 10");
  }
  v21.receiver = self;
  v21.super_class = (Class)NUImageExportFormatHEIF;
  result = -[NUImageExportFormatHEIF init](&v21, sel_init);
  result->_bitDepth = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  *((_QWORD *)result + 1) = self->_bitDepth;
  return result;
}

- (id)fileType
{
  return (id)objc_msgSend((id)*MEMORY[0x1E0CEC508], "identifier");
}

- (id)pixelFormat
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
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[NUImageExportFormatHEIF bitDepth](self, "bitDepth") == 8)
  {
    +[NUPixelFormat RGBA8](NUPixelFormat, "RGBA8");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[NUImageExportFormatHEIF bitDepth](self, "bitDepth") != 10)
    {
      NUAssertLogger_5535();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported bit depth: %ld"), -[NUImageExportFormatHEIF bitDepth](self, "bitDepth"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v23 = v6;
        _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      NUAssertLogger_5535();
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
          *(_DWORD *)buf = 138543618;
          v23 = v12;
          v24 = 2114;
          v25 = v16;
          _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v23 = v11;
        _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      v17 = -[NUImageExportFormatHEIF bitDepth](self, "bitDepth");
      _NUAssertFailHandler((uint64_t)"-[NUImageExportFormatHEIF pixelFormat]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageExportFormat.m", 199, CFSTR("Unsupported bit depth: %ld"), v18, v19, v20, v21, v17);
    }
    +[NUPixelFormat X2RGB10](NUPixelFormat, "X2RGB10");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)supportsHDR
{
  return -[NUImageExportFormatHEIF bitDepth](self, "bitDepth") > 9;
}

- (void)addImageDestinationOptionsToImageProperties:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", -[NUImageExportFormatHEIF bitDepth](self, "bitDepth"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CBCA08]);

}

- (int64_t)bitDepth
{
  return self->_bitDepth;
}

- (void)setBitDepth:(int64_t)a3
{
  self->_bitDepth = a3;
}

@end
