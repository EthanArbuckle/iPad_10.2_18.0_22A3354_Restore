@implementation NURepeatPattern

- (NURepeatPattern)init
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_4256);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_4256);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_4256);
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
  _NUAssertFailHandler((uint64_t)"-[NURepeatPattern init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 751, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (NURepeatPattern)initWithPattern:(id)a3 count:(int64_t)a4
{
  return -[NURepeatPattern initWithPattern:minCount:maxCount:](self, "initWithPattern:minCount:maxCount:", a3, a4, a4);
}

- (NURepeatPattern)initWithPattern:(id)a3 minCount:(int64_t)a4
{
  return -[NURepeatPattern initWithPattern:minCount:maxCount:](self, "initWithPattern:minCount:maxCount:", a3, a4, 0x7FFFFFFFFFFFFFFFLL);
}

- (NURepeatPattern)initWithPattern:(id)a3 minCount:(int64_t)a4 maxCount:(int64_t)a5
{
  id v9;
  void *v10;
  NURepeatPattern *v11;
  NURepeatPattern *v12;
  NSObject *v14;
  void *v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  objc_super v78;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  void *v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    NUAssertLogger_4244();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "pattern != nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v80 = v15;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4244();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v43 = (void *)MEMORY[0x1E0CB3978];
        v44 = v42;
        objc_msgSend(v43, "callStackSymbols");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v80 = v42;
        v81 = 2114;
        v82 = v46;
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
      v80 = v20;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURepeatPattern initWithPattern:minCount:maxCount:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 766, CFSTR("Invalid parameter not satisfying: %s"), v47, v48, v49, v50, (uint64_t)"pattern != nil");
  }
  if (a4 < 0)
  {
    NUAssertLogger_4244();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "min >= 0");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v80 = v22;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4244();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (v23)
    {
      if (v25)
      {
        v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v52 = (void *)MEMORY[0x1E0CB3978];
        v53 = v51;
        objc_msgSend(v52, "callStackSymbols");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v80 = v51;
        v81 = 2114;
        v82 = v55;
        _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v80 = v27;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURepeatPattern initWithPattern:minCount:maxCount:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 767, CFSTR("Invalid parameter not satisfying: %s"), v56, v57, v58, v59, (uint64_t)"min >= 0");
  }
  if (a5 < 0)
  {
    NUAssertLogger_4244();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "max >= 0");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v80 = v29;
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
        v60 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v61 = (void *)MEMORY[0x1E0CB3978];
        v62 = v60;
        objc_msgSend(v61, "callStackSymbols");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "componentsJoinedByString:", CFSTR("\n"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v80 = v60;
        v81 = 2114;
        v82 = v64;
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
      v80 = v34;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURepeatPattern initWithPattern:minCount:maxCount:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 768, CFSTR("Invalid parameter not satisfying: %s"), v65, v66, v67, v68, (uint64_t)"max >= 0");
  }
  if (a4 > (unint64_t)a5)
  {
    NUAssertLogger_4244();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "min <= max");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v80 = v36;
      _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4244();
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
    if (v37)
    {
      if (v39)
      {
        v69 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v70 = (void *)MEMORY[0x1E0CB3978];
        v71 = v69;
        objc_msgSend(v70, "callStackSymbols");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "componentsJoinedByString:", CFSTR("\n"));
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v80 = v69;
        v81 = 2114;
        v82 = v73;
        _os_log_error_impl(&dword_1A6553000, v38, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v39)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v80 = v41;
      _os_log_error_impl(&dword_1A6553000, v38, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURepeatPattern initWithPattern:minCount:maxCount:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUPattern.m", 769, CFSTR("Invalid parameter not satisfying: %s"), v74, v75, v76, v77, (uint64_t)"min <= max");
  }
  v10 = v9;
  v78.receiver = self;
  v78.super_class = (Class)NURepeatPattern;
  v11 = -[NURepeatPattern init](&v78, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_pattern, a3);
    v12->_minCount = a4;
    v12->_maxCount = a5;
  }

  return v12;
}

- (id)tokens
{
  return -[NUPattern tokens](self->_pattern, "tokens");
}

- (BOOL)isFixedOrder
{
  return !self->_minCount || -[NUPattern isFixedOrder](self->_pattern, "isFixedOrder");
}

- (id)shortestMatch
{
  void *v3;
  void *v4;
  int64_t v5;

  if (self->_minCount)
  {
    -[NUPattern shortestMatch](self->_pattern, "shortestMatch");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", LODWORD(self->_minCount) * objc_msgSend(v3, "count"));
      if (self->_minCount >= 1)
      {
        v5 = 0;
        do
        {
          objc_msgSend(v4, "addObjectsFromArray:", v3);
          ++v5;
        }
        while (v5 < self->_minCount);
      }
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v4;
}

- (id)optimizedPattern
{
  void *v3;
  NURepeatPattern *v4;
  NURepeatPattern *v5;

  -[NUPattern optimizedPattern](self->_pattern, "optimizedPattern");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEmpty") || self->_minCount == 1 && self->_maxCount == 1)
    v4 = v3;
  else
    v4 = -[NURepeatPattern initWithPattern:minCount:maxCount:]([NURepeatPattern alloc], "initWithPattern:minCount:maxCount:", v3, self->_minCount, self->_maxCount);
  v5 = v4;

  return v5;
}

- (id)stringRepresentation
{
  int64_t minCount;
  int64_t maxCount;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;

  minCount = self->_minCount;
  if (minCount)
  {
    if (minCount == 1)
    {
      maxCount = self->_maxCount;
      if (maxCount == 0x7FFFFFFFFFFFFFFFLL)
      {
        v5 = (void *)MEMORY[0x1E0CB3940];
        -[NUPattern stringRepresentation](self->_pattern, "stringRepresentation");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringWithFormat:", CFSTR("%@+"), v6, v12, v13);
        goto LABEL_13;
      }
    }
    else
    {
      maxCount = self->_maxCount;
    }
  }
  else
  {
    maxCount = self->_maxCount;
    if (maxCount == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      -[NUPattern stringRepresentation](self->_pattern, "stringRepresentation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@*"), v6, v12, v13);
      goto LABEL_13;
    }
    if (maxCount == 1)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      -[NUPattern stringRepresentation](self->_pattern, "stringRepresentation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@?"), v6, v12, v13);
      goto LABEL_13;
    }
  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  if (minCount == maxCount)
  {
    -[NUPattern stringRepresentation](self->_pattern, "stringRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@<%d>"), v6, self->_minCount, v13);
  }
  else
  {
    -[NUPattern stringRepresentation](self->_pattern, "stringRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@<%d,%d>"), v6, self->_minCount, self->_maxCount);
  }
LABEL_13:
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqualToPattern:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[NURepeatPattern isEqualToRepeatPattern:](self, "isEqualToRepeatPattern:", v4);

  return v5;
}

- (BOOL)isEqualToRepeatPattern:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  v5 = -[NURepeatPattern minCount](self, "minCount");
  if (v5 == objc_msgSend(v4, "minCount")
    && (v6 = -[NURepeatPattern maxCount](self, "maxCount"), v6 == objc_msgSend(v4, "maxCount")))
  {
    -[NURepeatPattern pattern](self, "pattern");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pattern");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToPattern:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)match:(id)a3 location:(unint64_t *)a4 count:(unint64_t *)a5
{
  id v8;
  int64_t minCount;
  unint64_t v10;
  int64_t i;
  _BOOL4 v12;
  int64_t v13;
  uint64_t v15;

  v8 = a3;
  v15 = 0;
  minCount = self->_minCount;
  if (minCount < 1)
  {
    i = 0;
    v10 = 0;
  }
  else
  {
    v10 = 0;
    for (i = 0; i < minCount; ++i)
    {
      v12 = -[NUPattern match:location:count:](self->_pattern, "match:location:count:", v8, a4, &v15);
      minCount = self->_minCount;
      if (!v12)
        break;
      v10 += v15;
    }
  }
  if (i == minCount)
  {
    if (minCount < self->_maxCount)
    {
      v13 = minCount;
      do
      {
        if (!-[NUPattern match:location:count:](self->_pattern, "match:location:count:", v8, a4, &v15))
          break;
        ++v13;
        v10 += v15;
      }
      while (v13 < self->_maxCount);
    }
    *a5 = v10;
  }

  return i == minCount;
}

- (NUPattern)pattern
{
  return (NUPattern *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)minCount
{
  return self->_minCount;
}

- (int64_t)maxCount
{
  return self->_maxCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pattern, 0);
}

@end
