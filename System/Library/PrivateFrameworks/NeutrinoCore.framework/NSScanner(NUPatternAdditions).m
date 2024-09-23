@implementation NSScanner(NUPatternAdditions)

- (uint64_t)scanPattern:()NUPatternAdditions error:
{
  int v7;
  id v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
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
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  id v49;
  id v50;
  _BYTE v51[12];
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (!a3 || *a3)
  {
    NUAssertLogger_4244();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "pattern != NULL && *pattern == nil");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v51 = 138543362;
      *(_QWORD *)&v51[4] = v16;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v51, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4244();
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
        *(_DWORD *)v51 = 138543618;
        *(_QWORD *)&v51[4] = v22;
        v52 = 2114;
        v53 = v26;
        _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v51, 0x16u);

      }
    }
    else if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v51 = 138543362;
      *(_QWORD *)&v51[4] = v21;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v51, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanPattern:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 921, CFSTR("Invalid parameter not satisfying: %s"), v27, v28, v29, v30, (uint64_t)"pattern != NULL && *pattern == nil");
  }
  if (!a4)
  {
    NUAssertLogger_4244();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v51 = 138543362;
      *(_QWORD *)&v51[4] = v32;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v51, 0xCu);

    }
    v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4244();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (v33)
    {
      if (v35)
      {
        v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v39 = (void *)MEMORY[0x1E0CB3978];
        v40 = v38;
        objc_msgSend(v39, "callStackSymbols");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v51 = 138543618;
        *(_QWORD *)&v51[4] = v38;
        v52 = 2114;
        v53 = v42;
        _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v51, 0x16u);

      }
    }
    else if (v35)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v51 = 138543362;
      *(_QWORD *)&v51[4] = v37;
      _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v51, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanPattern:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 922, CFSTR("Invalid parameter not satisfying: %s"), v43, v44, v45, v46, (uint64_t)"error != NULL");
  }
  v50 = 0;
  v7 = objc_msgSend(a1, "scanListPattern:error:", &v50, a4);
  v8 = v50;
  *(_QWORD *)v51 = v8;
  if (!v7)
    goto LABEL_15;
  if (!v8)
  {
    v49 = 0;
    v11 = objc_msgSend(a1, "scanGroupPattern:error:", &v49, a4);
    v8 = v49;
    *(_QWORD *)v51 = v8;
    if (!v11)
      goto LABEL_15;
    if (!v8)
    {
      v48 = 0;
      v12 = objc_msgSend(a1, "scanChoicePattern:error:", &v48, a4);
      v8 = v48;
      *(_QWORD *)v51 = v8;
      if (!v12)
        goto LABEL_15;
      if (!v8)
      {
        v47 = 0;
        v13 = objc_msgSend(a1, "scanTokenPattern:error:", &v47, a4);
        v8 = v47;
        *(_QWORD *)v51 = v8;
        if (!v13)
          goto LABEL_15;
        if (!v8)
          goto LABEL_7;
      }
    }
  }
  v9 = objc_msgSend(a1, "scanRepeatPattern:error:", v51, a4);
  v8 = *(id *)v51;
  if (!v9)
  {
LABEL_15:
    v10 = 0;
    goto LABEL_16;
  }
LABEL_7:
  *a3 = objc_retainAutorelease(v8);
  v10 = 1;
  v8 = *(id *)v51;
LABEL_16:

  return v10;
}

- (uint64_t)scanTokenPattern:()NUPatternAdditions error:
{
  void *v6;
  int v7;
  id v8;
  NSObject *v10;
  void *v11;
  void *specific;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!a3 || *a3)
  {
    NUAssertLogger_4244();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "pattern != NULL && *pattern == nil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4244();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v18 = (void *)MEMORY[0x1E0CB3978];
        v19 = v17;
        objc_msgSend(v18, "callStackSymbols");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v17;
        v45 = 2114;
        v46 = v21;
        _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanTokenPattern:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 959, CFSTR("Invalid parameter not satisfying: %s"), v22, v23, v24, v25, (uint64_t)"pattern != NULL && *pattern == nil");
  }
  if (!a4)
  {
    NUAssertLogger_4244();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v27;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4244();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v34 = (void *)MEMORY[0x1E0CB3978];
        v35 = v33;
        objc_msgSend(v34, "callStackSymbols");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v33;
        v45 = 2114;
        v46 = v37;
        _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v30)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v32;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanTokenPattern:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 960, CFSTR("Invalid parameter not satisfying: %s"), v38, v39, v40, v41, (uint64_t)"error != NULL");
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v7 = objc_msgSend(a1, "scanCharactersFromSet:intoString:", v6, &v42);
  v8 = v42;

  if (v7)
    *a3 = -[NUTokenPattern initWithToken:]([NUTokenPattern alloc], "initWithToken:", v8);

  return 1;
}

- (uint64_t)scanListPattern:()NUPatternAdditions error:
{
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v12;
  void *v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (!a3 || *a3)
  {
    NUAssertLogger_4244();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "pattern != NULL && *pattern == nil");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4244();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E0CB3978];
        v21 = v19;
        objc_msgSend(v20, "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v19;
        v48 = 2114;
        v49 = v23;
        _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanListPattern:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 973, CFSTR("Invalid parameter not satisfying: %s"), v24, v25, v26, v27, (uint64_t)"pattern != NULL && *pattern == nil");
  }
  if (!a4)
  {
    NUAssertLogger_4244();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v29;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4244();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E0CB3978];
        v37 = v35;
        objc_msgSend(v36, "callStackSymbols");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v35;
        v48 = 2114;
        v49 = v39;
        _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v32)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v34;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanListPattern:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 974, CFSTR("Invalid parameter not satisfying: %s"), v40, v41, v42, v43, (uint64_t)"error != NULL");
  }
  v44 = 0;
  v45 = 0;
  v7 = objc_msgSend(a1, "scanPatterns:from:to:delimiter:error:", &v45, CFSTR("["), CFSTR("]"), CFSTR(","), &v44);
  v8 = v45;
  v9 = v44;
  if ((v7 & 1) != 0)
  {
    if (v8)
      *a3 = -[NUListPattern initWithList:]([NUListPattern alloc], "initWithList:", v8);
  }
  else
  {
    objc_msgSend(a1, "substringFromScanLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 2, CFSTR("Invalid list pattern"), v10, v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (uint64_t)scanGroupPattern:()NUPatternAdditions error:
{
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v12;
  void *v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (!a3 || *a3)
  {
    NUAssertLogger_4244();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "pattern != NULL && *pattern == nil");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4244();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E0CB3978];
        v21 = v19;
        objc_msgSend(v20, "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v19;
        v48 = 2114;
        v49 = v23;
        _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanGroupPattern:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 994, CFSTR("Invalid parameter not satisfying: %s"), v24, v25, v26, v27, (uint64_t)"pattern != NULL && *pattern == nil");
  }
  if (!a4)
  {
    NUAssertLogger_4244();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v29;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4244();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E0CB3978];
        v37 = v35;
        objc_msgSend(v36, "callStackSymbols");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v35;
        v48 = 2114;
        v49 = v39;
        _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v32)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v34;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanGroupPattern:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 995, CFSTR("Invalid parameter not satisfying: %s"), v40, v41, v42, v43, (uint64_t)"error != NULL");
  }
  v44 = 0;
  v45 = 0;
  v7 = objc_msgSend(a1, "scanPatterns:from:to:delimiter:error:", &v45, CFSTR("("), CFSTR(")"), CFSTR(","), &v44);
  v8 = v45;
  v9 = v44;
  if ((v7 & 1) != 0)
  {
    if (v8)
      *a3 = -[NUGroupPattern initWithGroup:]([NUGroupPattern alloc], "initWithGroup:", v8);
  }
  else
  {
    objc_msgSend(a1, "substringFromScanLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 2, CFSTR("Invalid group pattern"), v10, v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (uint64_t)scanChoicePattern:()NUPatternAdditions error:
{
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v12;
  void *v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (!a3 || *a3)
  {
    NUAssertLogger_4244();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "pattern != NULL && *pattern == nil");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4244();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E0CB3978];
        v21 = v19;
        objc_msgSend(v20, "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v19;
        v48 = 2114;
        v49 = v23;
        _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanChoicePattern:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 1016, CFSTR("Invalid parameter not satisfying: %s"), v24, v25, v26, v27, (uint64_t)"pattern != NULL && *pattern == nil");
  }
  if (!a4)
  {
    NUAssertLogger_4244();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v29;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4244();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E0CB3978];
        v37 = v35;
        objc_msgSend(v36, "callStackSymbols");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v35;
        v48 = 2114;
        v49 = v39;
        _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v32)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v34;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanChoicePattern:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 1017, CFSTR("Invalid parameter not satisfying: %s"), v40, v41, v42, v43, (uint64_t)"error != NULL");
  }
  v44 = 0;
  v45 = 0;
  v7 = objc_msgSend(a1, "scanPatterns:from:to:delimiter:error:", &v45, CFSTR("{"), CFSTR("}"), CFSTR(","), &v44);
  v8 = v45;
  v9 = v44;
  if ((v7 & 1) != 0)
  {
    if (v8)
      *a3 = -[NUChoicePattern initWithChoices:]([NUChoicePattern alloc], "initWithChoices:", v8);
  }
  else
  {
    objc_msgSend(a1, "substringFromScanLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 2, CFSTR("Invalid choice pattern"), v10, v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (uint64_t)scanPatterns:()NUPatternAdditions from:to:delimiter:error:
{
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  char v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *specific;
  NSObject *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  id v64;
  id v65;
  id v66;
  id v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!a3 || *a3)
  {
    NUAssertLogger_4244();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "patterns != NULL && *patterns == nil");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v31;
      _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4244();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v34)
      {
        v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v38 = (void *)MEMORY[0x1E0CB3978];
        v39 = v37;
        objc_msgSend(v38, "callStackSymbols");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v69 = v37;
        v70 = 2114;
        v71 = v41;
        _os_log_error_impl(&dword_1A6553000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v34)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v36;
      _os_log_error_impl(&dword_1A6553000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanPatterns:from:to:delimiter:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 1038, CFSTR("Invalid parameter not satisfying: %s"), v42, v43, v44, v45, (uint64_t)"patterns != NULL && *patterns == nil");
  }
  if (!a7)
  {
    NUAssertLogger_4244();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v47;
      _os_log_error_impl(&dword_1A6553000, v46, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4244();
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
    if (v48)
    {
      if (v50)
      {
        v53 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v54 = (void *)MEMORY[0x1E0CB3978];
        v55 = v53;
        objc_msgSend(v54, "callStackSymbols");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "componentsJoinedByString:", CFSTR("\n"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v69 = v53;
        v70 = 2114;
        v71 = v57;
        _os_log_error_impl(&dword_1A6553000, v49, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v50)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "componentsJoinedByString:", CFSTR("\n"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v52;
      _os_log_error_impl(&dword_1A6553000, v49, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanPatterns:from:to:delimiter:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 1039, CFSTR("Invalid parameter not satisfying: %s"), v58, v59, v60, v61, (uint64_t)"error != NULL");
  }
  v15 = v14;
  v16 = objc_msgSend(a1, "scanLocation");
  if (objc_msgSend(a1, "scanString:intoString:", v12, 0))
  {
    v63 = v16;
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v66 = 0;
    v67 = 0;
    v18 = objc_msgSend(a1, "scanPattern:error:", &v67, &v66);
    v19 = v67;
    v20 = v66;
    if ((v18 & 1) != 0)
    {
      v62 = v13;
      if (v19)
      {
        objc_msgSend(v17, "addObject:", v19);
        if (objc_msgSend(a1, "scanString:intoString:", v15, 0))
        {
          while (1)
          {
            v21 = v20;
            v22 = v19;
            v64 = 0;
            v65 = 0;
            v23 = objc_msgSend(a1, "scanPattern:error:", &v65, &v64);
            v19 = v65;

            v20 = v64;
            if ((v23 & 1) == 0)
            {
              objc_msgSend(a1, "substringFromScanLocation");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 2, CFSTR("Invalid nested pattern"), v28, v20);
              *a7 = (id)objc_claimAutoreleasedReturnValue();

              objc_msgSend(a1, "setScanLocation:", v63);
              goto LABEL_21;
            }
            if (!v19)
              break;
            objc_msgSend(v17, "addObject:", v19);
            if ((objc_msgSend(a1, "scanString:intoString:", v15, 0) & 1) == 0)
              goto LABEL_11;
          }
          objc_msgSend(a1, "substringFromScanLocation");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("Missing nested pattern after delimiter"), v29);
          *a7 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(a1, "setScanLocation:", v63);
LABEL_21:
          v24 = 0;
          v13 = v62;
          goto LABEL_17;
        }
      }
LABEL_11:
      v13 = v62;
      if ((objc_msgSend(a1, "scanString:intoString:", v62, 0) & 1) != 0)
      {
        *a3 = objc_retainAutorelease(v17);

        v24 = 1;
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(a1, "substringFromScanLocation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("Missing end delimiter"), v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "substringFromScanLocation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 2, CFSTR("Invalid nested pattern"), v25, v20);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    *a7 = v26;

    objc_msgSend(a1, "setScanLocation:", v63);
    v24 = 0;
    goto LABEL_17;
  }
  v24 = 1;
LABEL_18:

  return v24;
}

- (uint64_t)scanRepeatPattern:()NUPatternAdditions error:
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  NURepeatPattern *v10;
  id v11;
  NURepeatPattern *v12;
  id v13;
  NURepeatPattern *v14;
  id v15;
  NURepeatPattern *v16;
  NURepeatPattern *v17;
  void *v18;
  NSObject *v20;
  void *v21;
  void *specific;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _BYTE buf[12];
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (!a3 || !*a3)
  {
    NUAssertLogger_4244();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "pattern != NULL && *pattern != nil");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v21;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4244();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v28 = (void *)MEMORY[0x1E0CB3978];
        v29 = v27;
        objc_msgSend(v28, "callStackSymbols");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v27;
        v54 = 2114;
        v55 = v31;
        _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v26;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanRepeatPattern:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 1102, CFSTR("Invalid parameter not satisfying: %s"), v32, v33, v34, v35, (uint64_t)"pattern != NULL && *pattern != nil");
  }
  if (!a4)
  {
    NUAssertLogger_4244();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v37;
      _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4244();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    if (v38)
    {
      if (v40)
      {
        v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v44 = (void *)MEMORY[0x1E0CB3978];
        v45 = v43;
        objc_msgSend(v44, "callStackSymbols");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "componentsJoinedByString:", CFSTR("\n"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v43;
        v54 = 2114;
        v55 = v47;
        _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v40)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v42;
      _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NSScanner(NUPatternAdditions) scanRepeatPattern:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 1103, CFSTR("Invalid parameter not satisfying: %s"), v48, v49, v50, v51, (uint64_t)"error != NULL");
  }
  v7 = *a3;
  v8 = objc_msgSend(a1, "scanLocation");
  if (!objc_msgSend(a1, "scanString:intoString:", CFSTR("?"), 0))
  {
    if (objc_msgSend(a1, "scanString:intoString:", CFSTR("*"), 0))
    {
      v12 = -[NURepeatPattern initWithPattern:minCount:]([NURepeatPattern alloc], "initWithPattern:minCount:", v7, 0);
LABEL_8:
      v13 = *a3;
      *a3 = v12;

LABEL_9:
      v9 = 1;
      goto LABEL_21;
    }
    if (objc_msgSend(a1, "scanString:intoString:", CFSTR("+"), 0))
    {
      v9 = 1;
      v14 = -[NURepeatPattern initWithPattern:minCount:]([NURepeatPattern alloc], "initWithPattern:minCount:", v7, 1);
      v15 = *a3;
      *a3 = v14;

      goto LABEL_21;
    }
    if (!objc_msgSend(a1, "scanString:intoString:", CFSTR("<"), 0))
      goto LABEL_9;
    *(_QWORD *)buf = 0;
    if (objc_msgSend(a1, "scanInteger:", buf))
    {
      if (objc_msgSend(a1, "scanString:intoString:", CFSTR(","), 0))
      {
        v52 = 0;
        if (objc_msgSend(a1, "scanInteger:", &v52)
          && objc_msgSend(a1, "scanString:intoString:", CFSTR(">"), 0))
        {
          v16 = [NURepeatPattern alloc];
          v12 = -[NURepeatPattern initWithPattern:minCount:maxCount:](v16, "initWithPattern:minCount:maxCount:", v7, *(_QWORD *)buf, v52);
          goto LABEL_8;
        }
      }
      else if (objc_msgSend(a1, "scanString:intoString:", CFSTR(">"), 0))
      {
        v17 = [NURepeatPattern alloc];
        v12 = -[NURepeatPattern initWithPattern:count:](v17, "initWithPattern:count:", v7, *(_QWORD *)buf);
        goto LABEL_8;
      }
    }
    objc_msgSend(a1, "setScanLocation:", v8);
    objc_msgSend(a1, "substringFromScanLocation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("Malformed repeat pattern"), v18);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v9 = 0;
    goto LABEL_21;
  }
  v9 = 1;
  v10 = -[NURepeatPattern initWithPattern:minCount:maxCount:]([NURepeatPattern alloc], "initWithPattern:minCount:maxCount:", v7, 0, 1);
  v11 = *a3;
  *a3 = v10;

LABEL_21:
  return v9;
}

- (id)substringFromScanLocation
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = objc_msgSend(a1, "scanLocation");
  objc_msgSend(a1, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "substringFromIndex:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
