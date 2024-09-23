@implementation NUImageExportFormatJPEG

- (NUImageExportFormatJPEG)init
{
  NUImageExportFormatJPEG *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NUImageExportFormatJPEG;
  result = -[NUImageExportFormatJPEG init](&v3, sel_init);
  result->_compressionQuality = 0.75;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  if (result)
    *((_QWORD *)result + 1) = *(_QWORD *)&self->_compressionQuality;
  return result;
}

- (double)compressionQuality
{
  return self->_compressionQuality;
}

- (void)setCompressionQuality:(double)a3
{
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *specific;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BYTE v26[12];
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a3 < 0.0 || a3 > 1.0)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_5501);
    v6 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = v6;
      objc_msgSend(v7, "stringWithFormat:", CFSTR("Compression quality should be between 0 and 1"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v26 = 138543362;
      *(_QWORD *)&v26[4] = v9;
      _os_log_impl(&dword_1A6553000, v8, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", v26, 0xCu);

      v10 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v10 != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_5501);
LABEL_13:
        v11 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v17 = (void *)MEMORY[0x1E0CB3978];
          v18 = specific;
          v19 = v11;
          objc_msgSend(v17, "callStackSymbols");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v26 = 138543618;
          *(_QWORD *)&v26[4] = specific;
          v27 = 2114;
          v28 = v21;
          _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v26, 0x16u);

LABEL_21:
          goto LABEL_18;
        }
        goto LABEL_18;
      }
      if (v10 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_5501);
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_13;
    }
    v22 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      v23 = (void *)MEMORY[0x1E0CB3978];
      v19 = v22;
      objc_msgSend(v23, "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v26 = 138543362;
      *(_QWORD *)&v26[4] = v25;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v26, 0xCu);

      goto LABEL_21;
    }
LABEL_18:
    _NUAssertContinueHandler((uint64_t)"-[NUImageExportFormatJPEG setCompressionQuality:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageExportFormat.m", 139, CFSTR("Compression quality should be between 0 and 1"), v12, v13, v14, v15, *(uint64_t *)v26);
  }
  self->_compressionQuality = fmax(fmin(a3, 1.0), 0.0);
}

- (id)fileType
{
  return (id)objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
}

- (id)pixelFormat
{
  return +[NUPixelFormat RGBA8](NUPixelFormat, "RGBA8");
}

- (void)addImageDestinationOptionsToImageProperties:(id)a3
{
  uint64_t v3;
  void *v4;
  double compressionQuality;
  id v6;
  id v7;

  v3 = *MEMORY[0x1E0CBC780];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  compressionQuality = self->_compressionQuality;
  v6 = a3;
  objc_msgSend(v4, "numberWithDouble:", compressionQuality);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v3);

}

@end
