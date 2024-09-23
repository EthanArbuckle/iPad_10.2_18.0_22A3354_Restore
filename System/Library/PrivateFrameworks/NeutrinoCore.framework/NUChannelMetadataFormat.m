@implementation NUChannelMetadataFormat

- (NUChannelMetadataFormat)init
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *specific;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  objc_class *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3589);
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_3589);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_3589);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v12 = (void *)MEMORY[0x1E0CB3978];
    v13 = v11;
    objc_msgSend(v12, "callStackSymbols");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v18 = (void *)MEMORY[0x1E0CB3978];
  v19 = specific;
  v13 = v16;
  objc_msgSend(v18, "callStackSymbols");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  v23 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUChannelMetadataFormat init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 488, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (int64_t)channelType
{
  return 3;
}

- (NUChannelMetadataFormat)initWithMetadataType:(int64_t)a3
{
  NUChannelMetadataFormat *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NUChannelMetadataFormat;
  result = -[NUChannelMetadataFormat init](&v5, sel_init);
  result->_metadataType = a3;
  return result;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NUChannelMetadataFormat;
  return (0x7F34415F73 * self->_metadataType) ^ -[NUChannelFormat hash](&v3, sel_hash);
}

- (BOOL)isEqualToChannelFormat:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NUChannelMetadataFormat;
  if (-[NUChannelFormat isEqualToChannelFormat:](&v8, sel_isEqualToChannelFormat_, v4))
  {
    v5 = objc_msgSend(v4, "metadataType");
    v6 = v5 == -[NUChannelMetadataFormat metadataType](self, "metadataType");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  void *v2;
  int64_t v3;
  const __CFString *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = -[NUChannelMetadataFormat metadataType](self, "metadataType");
  v4 = CFSTR("???");
  if (v3 == 2)
    v4 = CFSTR("video");
  if (v3 == 1)
    v4 = CFSTR("image");
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("metadata:%@"), v4);
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[NUChannelMetadataFormat metadataType](self, "metadataType");
  v6 = CFSTR("???");
  if (v5 == 2)
    v6 = CFSTR("video");
  if (v5 == 1)
    v6 = CFSTR("image");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p type:%@>"), v4, self, v6);
}

- (int64_t)metadataType
{
  return self->_metadataType;
}

@end
