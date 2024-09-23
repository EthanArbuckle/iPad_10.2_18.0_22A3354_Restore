@implementation NUImageExportFormatGeneric

- (NUImageExportFormatGeneric)initWithFileType:(id)a3
{
  NSString *v4;
  NSString *v5;
  NUImageExportFormatGeneric *v6;
  NSString *fileType;
  NSString *v8;
  uint64_t v9;
  NUPixelFormat *pixelFormat;
  NSDictionary *v11;
  NSDictionary *options;
  NSObject *v14;
  void *v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  if (!v4)
  {
    NUAssertLogger_5535();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "fileType != nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v15;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_5535();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v22 = (void *)MEMORY[0x1E0CB3978];
        v23 = v21;
        objc_msgSend(v22, "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v21;
        v33 = 2114;
        v34 = v25;
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
      v32 = v20;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageExportFormatGeneric initWithFileType:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageExportFormat.m", 71, CFSTR("Invalid parameter not satisfying: %s"), v26, v27, v28, v29, (uint64_t)"fileType != nil");
  }
  v5 = v4;
  v30.receiver = self;
  v30.super_class = (Class)NUImageExportFormatGeneric;
  v6 = -[NUImageExportFormatGeneric init](&v30, sel_init);
  fileType = v6->_fileType;
  v6->_fileType = v5;
  v8 = v5;

  +[NUPixelFormat RGBA8](NUPixelFormat, "RGBA8");
  v9 = objc_claimAutoreleasedReturnValue();
  pixelFormat = v6->_pixelFormat;
  v6->_pixelFormat = (NUPixelFormat *)v9;

  v11 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
  options = v6->_options;
  v6->_options = v11;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  if (v4)
  {
    v5 = -[NSString copy](self->_fileType, "copy");
    v6 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v5;

    objc_storeStrong((id *)(v4 + 16), self->_pixelFormat);
    v7 = -[NSDictionary copy](self->_options, "copy");
    v8 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v7;

  }
  return (id)v4;
}

- (void)addImageDestinationOptionsToImageProperties:(id)a3
{
  id v4;
  NSDictionary *options;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  options = self->_options;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__NUImageExportFormatGeneric_addImageDestinationOptionsToImageProperties___block_invoke;
  v7[3] = &unk_1E50614F0;
  v8 = v4;
  v6 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](options, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (NSString)fileType
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFileType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NUPixelFormat)pixelFormat
{
  return (NUPixelFormat *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPixelFormat:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_pixelFormat, 0);
  objc_storeStrong((id *)&self->_fileType, 0);
}

uint64_t __74__NUImageExportFormatGeneric_addImageDestinationOptionsToImageProperties___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

@end
