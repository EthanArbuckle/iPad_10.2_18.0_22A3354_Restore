@implementation NUError

+ (id)underlyingError:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)rootError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CB3388];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    do
    {
      v7 = (void *)v6;

      objc_msgSend(v7, "userInfo");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v3 = v7;
    }
    while (v6);
  }
  else
  {
    v7 = v3;
  }

  return v7;
}

+ (id)failureError:(id)a3 object:(id)a4
{
  return (id)objc_msgSend(a1, "errorWithCode:reason:object:", 1, a3, a4);
}

+ (id)invalidError:(id)a3 object:(id)a4
{
  return (id)objc_msgSend(a1, "errorWithCode:reason:object:", 2, a3, a4);
}

+ (id)missingError:(id)a3 object:(id)a4
{
  return (id)objc_msgSend(a1, "errorWithCode:reason:object:", 3, a3, a4);
}

+ (id)extraError:(id)a3 object:(id)a4
{
  return (id)objc_msgSend(a1, "errorWithCode:reason:object:", 4, a3, a4);
}

+ (id)mismatchError:(id)a3 object:(id)a4
{
  return (id)objc_msgSend(a1, "errorWithCode:reason:object:", 5, a3, a4);
}

+ (id)rangeError:(id)a3 object:(id)a4
{
  return (id)objc_msgSend(a1, "errorWithCode:reason:object:", 6, a3, a4);
}

+ (id)unknownError:(id)a3 object:(id)a4
{
  return (id)objc_msgSend(a1, "errorWithCode:reason:object:", 7, a3, a4);
}

+ (id)duplicateError:(id)a3 object:(id)a4
{
  return (id)objc_msgSend(a1, "errorWithCode:reason:object:", 8, a3, a4);
}

+ (id)unsupportedError:(id)a3 object:(id)a4
{
  return (id)objc_msgSend(a1, "errorWithCode:reason:object:", 9, a3, a4);
}

+ (id)canceledError:(id)a3 object:(id)a4
{
  return (id)objc_msgSend(a1, "errorWithCode:reason:object:", 10, a3, a4);
}

+ (id)timeoutError:(id)a3 object:(id)a4
{
  return (id)objc_msgSend(a1, "errorWithCode:reason:object:", 11, a3, a4);
}

+ (id)resourceUnavailableError:(id)a3 object:(id)a4
{
  return (id)objc_msgSend(a1, "errorWithCode:reason:object:", 12, a3, a4);
}

+ (id)skippedError:(id)a3 object:(id)a4
{
  return (id)objc_msgSend(a1, "errorWithCode:reason:object:", 13, a3, a4);
}

+ (id)notFoundError:(id)a3 object:(id)a4
{
  return (id)objc_msgSend(a1, "errorWithCode:reason:object:", 14, a3, a4);
}

+ (id)errorWithCode:(int64_t)a3 reason:(id)a4 object:(id)a5
{
  return (id)objc_msgSend(a1, "errorWithCode:reason:object:underlyingError:", a3, a4, a5, 0);
}

+ (id)errorWithCode:(int64_t)a3 reason:(id)a4 object:(id)a5 underlyingError:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v18;
  void *v19;
  void *specific;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v10)
  {
    NUAssertLogger_11803();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "reason != nil");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v19;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_11803();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v26 = (void *)MEMORY[0x1E0CB3978];
        v27 = v25;
        objc_msgSend(v26, "callStackSymbols");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v25;
        v36 = 2114;
        v37 = v29;
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
      v35 = v24;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUError errorWithCode:reason:object:underlyingError:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUError.m", 118, CFSTR("Invalid parameter not satisfying: %s"), v30, v31, v32, v33, (uint64_t)"reason != nil");
  }
  v13 = v12;
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("NUNonLocalizedFailureReason"));
  objc_msgSend(v11, "description");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("NURelatedObject"));

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CB3388]);
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDomain:code:userInfo:", CFSTR("NUError"), a3, v14);

  return v16;
}

- (id)description
{
  return -[NUError descriptionWithIndent:](self, "descriptionWithIndent:", 0);
}

- (id)descriptionWithIndent:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[NUError domain](self, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NUError code](self, "code");
  -[NUError errorCodeDescription](self, "errorCodeDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUError nonLocalizedFailureReason](self, "nonLocalizedFailureReason");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUError invalidObject](self, "invalidObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%*sError Domain=%@ Code=%d (%@) Reason=%@ Object=%@"), a3, ", v6, v7, v8, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NUError userInfo](self, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "descriptionWithIndent:", a3 + 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingFormat:", CFSTR("\n%@"), v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      v12 = v16;
    }
    else
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      -[NUError nonLocalizedFailureReason](self, "nonLocalizedFailureReason");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("ParentReason=%@\n%@"), v18, v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v12;
}

- (id)errorCodeDescription
{
  uint64_t v2;

  v2 = -[NUError code](self, "code");
  if ((unint64_t)(v2 - 1) > 0xD)
    return CFSTR("Unknown");
  else
    return off_1E5062058[v2 - 1];
}

- (NSString)nonLocalizedFailureReason
{
  void *v2;
  void *v3;

  -[NUError userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NUNonLocalizedFailureReason"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)invalidObject
{
  void *v2;
  void *v3;

  -[NUError userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NURelatedObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)replacementObjectForCoder:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  -[NUError domain](self, "domain", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NUError code](self, "code");
  -[NUError userInfo](self, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
