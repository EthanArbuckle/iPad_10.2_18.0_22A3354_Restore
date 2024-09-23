@implementation NUPlatform

+ (id)currentPlatform
{
  void *v2;
  void *v3;

  +[NUFactory sharedFactory](NUFactory, "sharedFactory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "platform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NUPlatform name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUPlatform devices](self, "devices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p name:%@ devices: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NUDevice)mainDevice
{
  void *v2;
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *specific;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  objc_class *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_13813);
  v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = v2;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v7;
    _os_log_error_impl(&dword_1A6553000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_13813);
      goto LABEL_8;
    }
    if (v8 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_13813);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v10 = (void *)MEMORY[0x1E0CB3978];
    v11 = v9;
    objc_msgSend(v10, "callStackSymbols");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v13;
    _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v16 = (void *)MEMORY[0x1E0CB3978];
  v17 = specific;
  v11 = v14;
  objc_msgSend(v16, "callStackSymbols");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v27 = specific;
  v28 = 2114;
  v29 = v19;
  _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUPlatform mainDevice]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUPlatform.m", 32, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v22, v23, v24, v25, v21);
}

- (id)currentDevice
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("NUPlatform.currentDevice"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)deviceForDisplay:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
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
  v3 = a3;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_13813);
  v4 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = v4;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_13813);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_13813);
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
  _NUAssertFailHandler((uint64_t)"-[NUPlatform deviceForDisplay:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUPlatform.m", 44, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v24, v25, v26, v27, v23);
}

- (void)clearCaches
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[NUCacheNode clearCacheDirectory](NUCacheNode, "clearCacheDirectory");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[NUPlatform devices](self, "devices", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "clearCaches");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (NSArray)displays
{
  void *v2;
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *specific;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  objc_class *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_13813);
  v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = v2;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v7;
    _os_log_error_impl(&dword_1A6553000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_13813);
      goto LABEL_8;
    }
    if (v8 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_13813);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v10 = (void *)MEMORY[0x1E0CB3978];
    v11 = v9;
    objc_msgSend(v10, "callStackSymbols");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v13;
    _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v16 = (void *)MEMORY[0x1E0CB3978];
  v17 = specific;
  v11 = v14;
  objc_msgSend(v16, "callStackSymbols");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v27 = specific;
  v28 = 2114;
  v29 = v19;
  _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUPlatform displays]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUPlatform.m", 57, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v22, v23, v24, v25, v21);
}

- (NUDisplay)mainDisplay
{
  void *v2;
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *specific;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  objc_class *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_13813);
  v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = v2;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v7;
    _os_log_error_impl(&dword_1A6553000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_13813);
      goto LABEL_8;
    }
    if (v8 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_13813);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v10 = (void *)MEMORY[0x1E0CB3978];
    v11 = v9;
    objc_msgSend(v10, "callStackSymbols");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v13;
    _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v16 = (void *)MEMORY[0x1E0CB3978];
  v17 = specific;
  v11 = v14;
  objc_msgSend(v16, "callStackSymbols");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v27 = specific;
  v28 = 2114;
  v29 = v19;
  _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUPlatform mainDisplay]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUPlatform.m", 62, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v22, v23, v24, v25, v21);
}

- (id)displayWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NUPlatform displays](self, "displays", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v10, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqual:", v4);

          if ((v12 & 1) != 0)
          {
            v13 = v10;

            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }

    v13 = 0;
  }
  else
  {
    -[NUPlatform mainDisplay](self, "mainDisplay");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:

  return v13;
}

- (BOOL)defaultSupportsLiveVideoRendering
{
  void *v2;
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *specific;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  objc_class *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_13813);
  v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = v2;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v7;
    _os_log_error_impl(&dword_1A6553000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_13813);
      goto LABEL_8;
    }
    if (v8 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_13813);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v10 = (void *)MEMORY[0x1E0CB3978];
    v11 = v9;
    objc_msgSend(v10, "callStackSymbols");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v13;
    _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v16 = (void *)MEMORY[0x1E0CB3978];
  v17 = specific;
  v11 = v14;
  objc_msgSend(v16, "callStackSymbols");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v27 = specific;
  v28 = 2114;
  v29 = v19;
  _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUPlatform defaultSupportsLiveVideoRendering]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Runtime/NUPlatform.m", 82, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v22, v23, v24, v25, v21);
}

- (BOOL)supportsLiveVideoRendering
{
  return +[NUGlobalSettings renderVideoLive](NUGlobalSettings, "renderVideoLive");
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)supportsAutomaticGraphicsSwitching
{
  return self->_supportsAutomaticGraphicsSwitching;
}

- (void)setSupportsAutomaticGraphicsSwitching:(BOOL)a3
{
  self->_supportsAutomaticGraphicsSwitching = a3;
}

- (NUDevice)integratedDevice
{
  return self->_integratedDevice;
}

- (void)setIntegratedDevice:(id)a3
{
  objc_storeStrong((id *)&self->_integratedDevice, a3);
}

- (NUDevice)discreteDevice
{
  return self->_discreteDevice;
}

- (void)setDiscreteDevice:(id)a3
{
  objc_storeStrong((id *)&self->_discreteDevice, a3);
}

- (BOOL)hasDiscreteGPU
{
  return self->_hasDiscreteGPU;
}

- (BOOL)hasHeadlessGPU
{
  return self->_hasHeadlessGPU;
}

- (void)setHasHeadlessGPU:(BOOL)a3
{
  self->_hasHeadlessGPU = a3;
}

- (NUDevice)headlessDevice
{
  return self->_headlessDevice;
}

- (void)setHeadlessDevice:(id)a3
{
  objc_storeStrong((id *)&self->_headlessDevice, a3);
}

- (NUDevice)cpuDevice
{
  return self->_cpuDevice;
}

- (void)setCpuDevice:(id)a3
{
  objc_storeStrong((id *)&self->_cpuDevice, a3);
}

- (BOOL)hasExtendedColorDisplay
{
  return self->_hasExtendedColorDisplay;
}

- (void)setHasExtendedColorDisplay:(BOOL)a3
{
  self->_hasExtendedColorDisplay = a3;
}

- (BOOL)supportsANE
{
  return self->_supportsANE;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cpuDevice, 0);
  objc_storeStrong((id *)&self->_headlessDevice, 0);
  objc_storeStrong((id *)&self->_discreteDevice, 0);
  objc_storeStrong((id *)&self->_integratedDevice, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __51__NUPlatform_iOS_defaultSupportsLiveVideoRendering__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "mainDevice");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  defaultSupportsLiveVideoRendering_canRenderLiveVideo = (unint64_t)objc_msgSend(v1, "family") > 2;

}

@end
