@implementation NUDisplay_iOS

- (NUDisplay_iOS)init
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_9528);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_9528);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_9528);
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
  _NUAssertFailHandler((uint64_t)"-[NUDisplay_iOS init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUDisplay_iOS.m", 39, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (NUDisplay_iOS)initWithCADisplay:(id)a3
{
  CADisplay *v4;
  CADisplay *v5;
  NUDisplay_iOS *v6;
  CADisplay *display;
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
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (CADisplay *)a3;
  if (!v4)
  {
    NUAssertLogger_9515();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "display != nil");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v10;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_9515();
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
        v27 = v16;
        v28 = 2114;
        v29 = v20;
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
      v27 = v15;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUDisplay_iOS initWithCADisplay:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUDisplay_iOS.m", 44, CFSTR("Invalid parameter not satisfying: %s"), v21, v22, v23, v24, (uint64_t)"display != nil");
  }
  v5 = v4;
  v25.receiver = self;
  v25.super_class = (Class)NUDisplay_iOS;
  v6 = -[NUDisplay_iOS init](&v25, sel_init);
  display = v6->_display;
  v6->_display = v5;

  return v6;
}

- (NSString)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = -[NUDisplay_iOS size](self, "size");
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = objc_opt_class();
  -[NUDisplay_iOS identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUDisplay_iOS name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUDisplay_iOS pixelFormat](self, "pixelFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUDisplay_iOS colorSpace](self, "colorSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@:%p id=%@ name=%@ size=%dx%d format: %@ space: %@>"), v7, self, v8, v9, v3, v5, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (NSString)name
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CADisplay name](self->_display, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CADisplay deviceName](self->_display, "deviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)identifier
{
  return (id)-[CADisplay uniqueId](self->_display, "uniqueId");
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  -[CADisplay currentMode](self->_display, "currentMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "width");
  v4 = objc_msgSend(v2, "height");

  v5 = v3;
  v6 = v4;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (BOOL)wideColor
{
  char v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v6[16];
  uint8_t buf[16];

  v2 = -[CADisplay supportsExtendedColors](self->_display, "supportsExtendedColors");
  if (+[NUGlobalSettings displayDisableDeepColor](NUGlobalSettings, "displayDisableDeepColor"))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_92);
    v3 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6553000, v3, OS_LOG_TYPE_INFO, "Deep color is disabled", buf, 2u);
    }
    return 0;
  }
  else if (+[NUGlobalSettings displayForceDeepColor](NUGlobalSettings, "displayForceDeepColor"))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_92);
    v4 = _NULogger;
    v2 = 1;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A6553000, v4, OS_LOG_TYPE_INFO, "Deep color is forcibly enabled", v6, 2u);
    }
  }
  return v2;
}

- (NUPixelFormat)pixelFormat
{
  if (-[NUDisplay_iOS wideColor](self, "wideColor"))
    +[NUPixelFormat A2RGB10](NUPixelFormat, "A2RGB10");
  else
    +[NUPixelFormat BGRA8](NUPixelFormat, "BGRA8");
  return (NUPixelFormat *)(id)objc_claimAutoreleasedReturnValue();
}

- (NUColorSpace)colorSpace
{
  NSObject *v3;
  void *v4;
  uint8_t v6[16];

  if (+[NUGlobalSettings displayForceDeepColor](NUGlobalSettings, "displayForceDeepColor"))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_92);
    v3 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A6553000, v3, OS_LOG_TYPE_INFO, "Deep color is forcibly enabled", v6, 2u);
    }
    +[NUColorSpace itur2100HLGColorSpace](NUColorSpace, "itur2100HLGColorSpace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[NUDisplay_iOS wideColor](self, "wideColor"))
      +[NUColorSpace displayP3ColorSpace](NUColorSpace, "displayP3ColorSpace");
    else
      +[NUColorSpace sRGBColorSpace](NUColorSpace, "sRGBColorSpace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NUColorSpace *)v4;
}

- (CADisplay)display
{
  return self->_display;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_display, 0);
}

+ (id)displays
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NUDisplay_iOS *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(MEMORY[0x1E0CD2728], "displays", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = -[NUDisplay_iOS initWithCADisplay:]([NUDisplay_iOS alloc], "initWithCADisplay:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7));
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

+ (id)mainDisplay
{
  NUDisplay_iOS *v2;
  void *v3;
  NUDisplay_iOS *v4;

  v2 = [NUDisplay_iOS alloc];
  objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NUDisplay_iOS initWithCADisplay:](v2, "initWithCADisplay:", v3);

  return v4;
}

@end
