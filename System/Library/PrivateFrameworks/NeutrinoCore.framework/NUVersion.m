@implementation NUVersion

- (NUVersion)init
{
  return -[NUVersion initWithMajor:minor:](self, "initWithMajor:minor:", 1, 0);
}

- (NUVersion)initWithMajor:(int64_t)a3 minor:(int64_t)a4
{
  NSObject *v4;
  void *v5;
  void *specific;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 > 0x3B9AC9FF)
  {
    NUAssertLogger_25274();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "major >= 0 && major <= kMajorVersionLimit");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v5;
      _os_log_error_impl(&dword_1A6553000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_25274();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v19 = (void *)MEMORY[0x1E0CB3978];
        v20 = v18;
        objc_msgSend(v19, "callStackSymbols");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v18;
        v38 = 2114;
        v39 = v22;
        _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v10;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVersion initWithMajor:minor:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUVersion.m", 32, CFSTR("Invalid parameter not satisfying: %s"), v23, v24, v25, v26, (uint64_t)"major >= 0 && major <= kMajorVersionLimit");
  }
  if ((unint64_t)a4 > 0x3B9AC9FF)
  {
    NUAssertLogger_25274();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "minor >= 0 && minor <= kMinorVersionLimit");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_25274();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (v13)
    {
      if (v15)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v28 = (void *)MEMORY[0x1E0CB3978];
        v29 = v27;
        objc_msgSend(v28, "callStackSymbols");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v27;
        v38 = 2114;
        v39 = v31;
        _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVersion initWithMajor:minor:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUVersion.m", 33, CFSTR("Invalid parameter not satisfying: %s"), v32, v33, v34, v35, (uint64_t)"minor >= 0 && minor <= kMinorVersionLimit");
  }
  self->_major = a3;
  self->_minor = a4;
  return self;
}

- (NSString)stringRepresentation
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d.%d"), -[NUVersion major](self, "major"), -[NUVersion minor](self, "minor"));
}

- (int64_t)compare:(id)a3
{
  id v4;
  int64_t major;
  int64_t minor;
  int64_t v7;
  int64_t v8;
  uint64_t v9;

  v4 = a3;
  major = self->_major;
  if (major == objc_msgSend(v4, "major"))
  {
    minor = self->_minor;
    if (minor == objc_msgSend(v4, "minor"))
    {
      v7 = 0;
      goto LABEL_9;
    }
    v8 = self->_minor;
    v9 = objc_msgSend(v4, "minor");
  }
  else
  {
    v8 = self->_major;
    v9 = objc_msgSend(v4, "major");
  }
  if (v8 > v9)
    v7 = 1;
  else
    v7 = -1;
LABEL_9:

  return v7;
}

- (BOOL)atLeastMajor:(int64_t)a3 minor:(int64_t)a4
{
  NUVersion *v5;
  BOOL v6;

  v5 = -[NUVersion initWithMajor:minor:]([NUVersion alloc], "initWithMajor:minor:", a3, a4);
  v6 = -[NUVersion compare:](self, "compare:", v5) != -1;

  return v6;
}

- (unint64_t)hash
{
  return (0x519FB2067FF05 * self->_minor) ^ (0x1BF7361969823BLL * self->_major);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[NUVersion isEqualToVersion:](self, "isEqualToVersion:", v4);

  return v5;
}

- (BOOL)isEqualToVersion:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  BOOL v7;

  v4 = a3;
  v5 = -[NUVersion major](self, "major");
  if (v5 == objc_msgSend(v4, "major"))
  {
    v6 = -[NUVersion minor](self, "minor");
    v7 = v6 == objc_msgSend(v4, "minor");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p major:%d minor:%d>"), objc_opt_class(), self, -[NUVersion major](self, "major"), -[NUVersion minor](self, "minor"));
}

- (int64_t)major
{
  return self->_major;
}

- (int64_t)minor
{
  return self->_minor;
}

+ (id)versionZero
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMajor:minor:", 0, 0);
}

+ (id)versionOne
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMajor:minor:", 1, 0);
}

+ (NUVersion)versionWithPackedUInt32:(unsigned int)a3
{
  return (NUVersion *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithMajor:minor:", HIWORD(a3), (unsigned __int16)a3);
}

+ (NUVersion)versionWithString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
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
  uint64_t v25;
  _BYTE buf[12];
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_25274();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "string != nil");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v10;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_25274();
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
        *(_QWORD *)&buf[4] = v16;
        v27 = 2114;
        v28 = v20;
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
      *(_QWORD *)&buf[4] = v15;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVersion versionWithString:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUVersion.m", 48, CFSTR("Invalid parameter not satisfying: %s"), v21, v22, v23, v24, (uint64_t)"string != nil");
  }
  v5 = v4;
  v25 = 0;
  *(_QWORD *)buf = 0;
  v6 = 0;
  if (objc_msgSend(a1, "validateVersionString:major:minor:", v4, buf, &v25))
  {
    v7 = objc_alloc((Class)a1);
    v6 = (void *)objc_msgSend(v7, "initWithMajor:minor:", *(_QWORD *)buf, v25);
  }

  return (NUVersion *)v6;
}

+ (BOOL)validateVersionString:(id)a3
{
  return objc_msgSend(a1, "validateVersionString:major:minor:", a3, 0, 0);
}

+ (BOOL)validateVersionString:(id)a3 major:(int64_t *)a4 minor:(int64_t *)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v7 = a3;
  v8 = objc_msgSend(v7, "length");
  +[NUVersion regularExpression](NUVersion, "regularExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstMatchInString:options:range:", v7, 0, 0, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && (objc_msgSend(v10, "rangeAtIndex:", 0), v8 == v11))
  {
    v12 = 1;
    if (a4 && a5)
    {
      v12 = 1;
      v13 = objc_msgSend(v10, "rangeAtIndex:", 1);
      objc_msgSend(v7, "substringWithRange:", v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = objc_msgSend(v15, "integerValue");

      v16 = objc_msgSend(v10, "rangeAtIndex:", 2);
      objc_msgSend(v7, "substringWithRange:", v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *a5 = objc_msgSend(v18, "integerValue");

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)regularExpression
{
  if (regularExpression_onceToken != -1)
    dispatch_once(&regularExpression_onceToken, &__block_literal_global_25301);
  return (id)regularExpression_formatVersionRegex;
}

void __30__NUVersion_regularExpression__block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  NSObject *v3;
  void *v4;
  void *specific;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^([0-9]|[1-9][0-9]{0,8})\\.([0-9]|[1-9][0-9]{0,8})$"), 0, &v19);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v19;
  v2 = (void *)regularExpression_formatVersionRegex;
  regularExpression_formatVersionRegex = v0;

  if (!regularExpression_formatVersionRegex)
  {
    NUAssertLogger_25274();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to create regex for pattern: %@"), CFSTR("^([0-9]|[1-9][0-9]{0,8})\\.([0-9]|[1-9][0-9]{0,8})$"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v4;
      _os_log_error_impl(&dword_1A6553000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_25274();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v11 = (void *)MEMORY[0x1E0CB3978];
        v12 = v10;
        objc_msgSend(v11, "callStackSymbols");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v10;
        v22 = 2114;
        v23 = v14;
        _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v9;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVersion regularExpression]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUVersion.m", 171, CFSTR("unable to create regex for pattern: %@"), v15, v16, v17, v18, (uint64_t)CFSTR("^([0-9]|[1-9][0-9]{0,8})\\.([0-9]|[1-9][0-9]{0,8})$"));
  }

}

@end
