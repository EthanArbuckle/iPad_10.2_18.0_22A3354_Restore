@implementation NUChannelMatching

- (BOOL)match:(id)a3
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3589);
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
  _NUAssertFailHandler((uint64_t)"-[NUChannelMatching match:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 717, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v24, v25, v26, v27, v23);
}

+ (id)name:(id)a3
{
  id v3;
  NUChannelNameMatching *v4;

  v3 = a3;
  v4 = -[NUChannelNameMatching initWithName:]([NUChannelNameMatching alloc], "initWithName:", v3);

  return v4;
}

+ (id)type:(int64_t)a3
{
  return -[NUChannelTypeMatching initWithType:]([NUChannelTypeMatching alloc], "initWithType:", a3);
}

+ (id)media:(int64_t)a3
{
  NUChannelMediaFormat *v3;
  NUChannelFormatMatching *v4;

  v3 = -[NUChannelMediaFormat initWithMediaType:]([NUChannelMediaFormat alloc], "initWithMediaType:", a3);
  v4 = -[NUChannelFormatMatching initWithFormat:]([NUChannelFormatMatching alloc], "initWithFormat:", v3);

  return v4;
}

+ (id)channel:(id)a3
{
  id v3;
  void *v4;
  NUChannelNameMatching *v5;
  void *v6;
  NUChannelNameMatching *v7;
  NUChannelFormatMatching *v8;
  void *v9;
  NUChannelFormatMatching *v10;
  NUChannelAllMatching *v11;
  void *v12;
  NUChannelAllMatching *v13;
  NSObject *v15;
  void *v16;
  void *specific;
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
  _QWORD v31[2];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    NUAssertLogger_3656();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "channel != nil");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v16;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3656();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v23 = (void *)MEMORY[0x1E0CB3978];
        v24 = v22;
        objc_msgSend(v23, "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v22;
        v34 = 2114;
        v35 = v26;
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
      v33 = v21;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUChannelMatching channel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 700, CFSTR("Invalid parameter not satisfying: %s"), v27, v28, v29, v30, (uint64_t)"channel != nil");
  }
  v4 = v3;
  v5 = [NUChannelNameMatching alloc];
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NUChannelNameMatching initWithName:](v5, "initWithName:", v6);

  v8 = [NUChannelFormatMatching alloc];
  objc_msgSend(v4, "format");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NUChannelFormatMatching initWithFormat:](v8, "initWithFormat:", v9);

  v11 = [NUChannelAllMatching alloc];
  v31[0] = v7;
  v31[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NUChannelAnyMatching initWithPredicates:](v11, "initWithPredicates:", v12);

  return v13;
}

+ (NUChannelMatching)primary
{
  NUChannelNameMatching *v2;
  void *v3;
  void *v4;
  NUChannelNameMatching *v5;
  NUChannelNameMatching *v6;
  NUChannelNameMatching *v7;
  NUChannelAnyMatching *v8;
  void *v9;
  NUChannelAnyMatching *v10;
  NUChannelFormatMatching *v11;
  void *v12;
  void *v13;
  NUChannelFormatMatching *v14;
  NUChannelAllMatching *v15;
  void *v16;
  NUChannelAllMatching *v17;
  _QWORD v19[2];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v2 = [NUChannelNameMatching alloc];
  +[NUChannel primary](NUChannel, "primary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NUChannelNameMatching initWithName:](v2, "initWithName:", v4);

  v6 = -[NUChannelNameMatching initWithName:]([NUChannelNameMatching alloc], "initWithName:", CFSTR("inputImage"));
  v7 = -[NUChannelNameMatching initWithName:]([NUChannelNameMatching alloc], "initWithName:", CFSTR("outputImage"));
  v8 = [NUChannelAnyMatching alloc];
  v20[0] = v5;
  v20[1] = v6;
  v20[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NUChannelAnyMatching initWithPredicates:](v8, "initWithPredicates:", v9);

  v11 = [NUChannelFormatMatching alloc];
  +[NUChannel primary](NUChannel, "primary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "format");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[NUChannelFormatMatching initWithFormat:](v11, "initWithFormat:", v13);

  v15 = [NUChannelAllMatching alloc];
  v19[0] = v10;
  v19[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[NUChannelAnyMatching initWithPredicates:](v15, "initWithPredicates:", v16);

  return (NUChannelMatching *)v17;
}

@end
