@implementation NUCompositionSchema

- (int64_t)type
{
  return 4;
}

- (NUCompositionSchema)initWithIdentifier:(id)a3 attributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *specific;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  objc_class *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_14893);
  v8 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = v8;
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v34 = v14;
    _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v15 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v15 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_14893);
      goto LABEL_8;
    }
    if (v15 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_14893);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v16 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v17 = (void *)MEMORY[0x1E0CB3978];
    v18 = v16;
    objc_msgSend(v17, "callStackSymbols");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v34 = v20;
    _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v21 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v23 = (void *)MEMORY[0x1E0CB3978];
  v24 = specific;
  v18 = v21;
  objc_msgSend(v23, "callStackSymbols");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v34 = specific;
  v35 = 2114;
  v36 = v26;
  _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v27 = (objc_class *)objc_opt_class();
  NSStringFromClass(v27);
  v28 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema initWithIdentifier:attributes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1906, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v29, v30, v31, v32, v28);
}

- (NUCompositionSchema)initWithIdentifier:(id)a3 contents:(id)a4 attributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NUCompositionSchema *v12;
  uint64_t v13;
  NSDictionary *contents;
  void *v15;
  uint64_t v16;
  NSSet *requiredContents;
  NSObject *v19;
  void *v20;
  void *specific;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  objc_super v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    NUAssertLogger_14916();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "contents != nil");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v20;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v27 = (void *)MEMORY[0x1E0CB3978];
        v28 = v26;
        objc_msgSend(v27, "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v26;
        v38 = 2114;
        v39 = v30;
        _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v25;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema initWithIdentifier:contents:attributes:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1911, CFSTR("Invalid parameter not satisfying: %s"), v31, v32, v33, v34, (uint64_t)"contents != nil");
  }
  v11 = v10;
  v35.receiver = self;
  v35.super_class = (Class)NUCompositionSchema;
  v12 = -[NUSchema initWithIdentifier:attributes:](&v35, sel_initWithIdentifier_attributes_, v8, v10);
  v13 = objc_msgSend(v9, "copy");
  contents = v12->_contents;
  v12->_contents = (NSDictionary *)v13;

  -[NSDictionary objectForKeyedSubscript:](v12->super.super._attributes, "objectForKeyedSubscript:", CFSTR("required"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
  v16 = objc_claimAutoreleasedReturnValue();
  requiredContents = v12->_requiredContents;
  v12->_requiredContents = (NSSet *)v16;

  return v12;
}

- (NSSet)requiredContents
{
  return self->_requiredContents;
}

- (BOOL)isValid:(id *)a3
{
  BOOL v5;
  id v6;
  BOOL v7;
  id v8;
  BOOL v9;
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
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_14916();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
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
        v31 = v19;
        v32 = 2114;
        v33 = v23;
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
      v31 = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema isValid:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1930, CFSTR("Invalid parameter not satisfying: %s"), v24, v25, v26, v27, (uint64_t)"error != NULL");
  }
  v29 = 0;
  v5 = -[NUModel validateAttributes:](self, "validateAttributes:", &v29);
  v6 = v29;
  if (!v5)
  {
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 2, CFSTR("Invalid attributes"), self, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
LABEL_7:
    v9 = 0;
    *a3 = v10;
    goto LABEL_8;
  }
  v28 = 0;
  v7 = -[NUCompositionSchema validateContents:](self, "validateContents:", &v28);
  v8 = v28;

  if (!v7)
  {
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 2, CFSTR("Invalid contents"), self, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v9 = 1;
LABEL_8:

  return v9;
}

- (BOOL)validateAttribute:(id)a3 value:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  unsigned __int8 v10;
  BOOL v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("required")))
  {
    v10 = -[NUCompositionSchema validatePropertyArray:error:](self, "validatePropertyArray:error:", v9, a5);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)NUCompositionSchema;
    v10 = -[NUModel validateAttribute:value:error:](&v13, sel_validateAttribute_value_error_, v8, v9, a5);
  }
  v11 = v10;

  return v11;
}

- (BOOL)validatePropertyArray:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  BOOL v15;
  NSObject *v17;
  void *v18;
  void *specific;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_14916();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "object != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v55 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v32 = (void *)MEMORY[0x1E0CB3978];
        v33 = v31;
        objc_msgSend(v32, "callStackSymbols");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v55 = v31;
        v56 = 2114;
        v57 = v35;
        _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v55 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema validatePropertyArray:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1968, CFSTR("Invalid parameter not satisfying: %s"), v36, v37, v38, v39, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    NUAssertLogger_14916();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v55 = v25;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v41 = (void *)MEMORY[0x1E0CB3978];
        v42 = v40;
        objc_msgSend(v41, "callStackSymbols");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v55 = v40;
        v56 = 2114;
        v57 = v44;
        _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v28)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v55 = v30;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema validatePropertyArray:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 1969, CFSTR("Invalid parameter not satisfying: %s"), v45, v46, v47, v48, (uint64_t)"error != NULL");
  }
  v7 = v6;
  if (+[NUModel validateStringArray:error:](NUSchema, "validateStringArray:error:", v6, a4))
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v50;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v50 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
          -[NSDictionary objectForKey:](self->_contents, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Unknown required property"), v13);
            v15 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_15;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
        if (v10)
          continue;
        break;
      }
    }
    v15 = 1;
LABEL_15:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)validateContents:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  BOOL v10;
  id v11;
  void *v12;
  BOOL v13;
  id v14;
  BOOL v15;
  id *v17;
  NSDictionary *obj;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_contents;
  v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v5)
  {
    v15 = 1;
    goto LABEL_15;
  }
  v6 = v5;
  v17 = a3;
  v7 = *(_QWORD *)v22;
  while (2)
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v22 != v7)
        objc_enumerationMutation(obj);
      v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
      v20 = 0;
      v10 = +[NUModel validatePropertyName:error:](NUSchema, "validatePropertyName:error:", v9, &v20, v17);
      v11 = v20;
      if (!v10)
      {
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 2, CFSTR("Invalid property name"), v9, v11);
        *v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

        v15 = 0;
        goto LABEL_15;
      }
      -[NSDictionary objectForKeyedSubscript:](self->_contents, "objectForKeyedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v13 = +[NUSchema validateSchemaIdentifier:type:error:](NUSchema, "validateSchemaIdentifier:type:error:", v12, 0, &v19);
      v14 = v19;

      if (!v13)
      {
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 2, CFSTR("Invalid schema identifier"), v12, v14);
        *v17 = (id)objc_claimAutoreleasedReturnValue();

        v11 = v14;
        goto LABEL_14;
      }

    }
    v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    v15 = 1;
    if (v6)
      continue;
    break;
  }
LABEL_15:

  return v15;
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v10;
  void *v11;
  void *specific;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_14916();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "object != nil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = (void *)MEMORY[0x1E0CB3978];
        v26 = v24;
        objc_msgSend(v25, "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v24;
        v44 = 2114;
        v45 = v28;
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
      v43 = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema validate:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2015, CFSTR("Invalid parameter not satisfying: %s"), v29, v30, v31, v32, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    NUAssertLogger_14916();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v21)
      {
        v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v34 = (void *)MEMORY[0x1E0CB3978];
        v35 = v33;
        objc_msgSend(v34, "callStackSymbols");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v33;
        v44 = 2114;
        v45 = v37;
        _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema validate:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2016, CFSTR("Invalid parameter not satisfying: %s"), v38, v39, v40, v41, (uint64_t)"error != NULL");
  }
  v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = -[NUCompositionSchema validateComposition:error:](self, "validateComposition:error:", v7, a4);
  }
  else
  {
    +[NUError mismatchError:object:](NUError, "mismatchError:object:", CFSTR("Not a composition"), v7);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)validateComposition:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;
  BOOL v12;
  id v13;
  BOOL v14;
  void *v15;
  void *v16;
  NSObject *v18;
  void *v19;
  void *specific;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_14916();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "composition != nil");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v19;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v33 = (void *)MEMORY[0x1E0CB3978];
        v34 = v32;
        objc_msgSend(v33, "callStackSymbols");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v53 = v32;
        v54 = 2114;
        v55 = v36;
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
      v53 = v24;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema validateComposition:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2029, CFSTR("Invalid parameter not satisfying: %s"), v37, v38, v39, v40, (uint64_t)"composition != nil");
  }
  if (!a4)
  {
    NUAssertLogger_14916();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v26;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v42 = (void *)MEMORY[0x1E0CB3978];
        v43 = v41;
        objc_msgSend(v42, "callStackSymbols");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v53 = v41;
        v54 = 2114;
        v55 = v45;
        _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v31;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema validateComposition:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2030, CFSTR("Invalid parameter not satisfying: %s"), v46, v47, v48, v49, (uint64_t)"error != NULL");
  }
  v7 = v6;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  v9 = -[NUSchema validateIdentifier:error:](self, "validateIdentifier:error:", v8, &v51);
  v10 = v51;

  if (!v9)
  {
    objc_msgSend(v7, "debugDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 2, CFSTR("Invalid composition identifier"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v10;
LABEL_8:
    *a4 = v16;

    v14 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v7, "contents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  v12 = -[NUCompositionSchema validateContents:error:](self, "validateContents:error:", v11, &v50);
  v13 = v50;

  if (!v12)
  {
    objc_msgSend(v7, "debugDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 2, CFSTR("Invalid composition contents"), v15, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v14 = 1;
LABEL_9:

  return v14;
}

- (BOOL)validateContents:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  int v18;
  BOOL v19;
  NSObject *v21;
  void *v22;
  void *specific;
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
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id *v53;
  NSDictionary *obj;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t v62[128];
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  if (!v56)
  {
    NUAssertLogger_14916();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "contents != nil");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v64 = v22;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E0CB3978];
        v37 = v35;
        objc_msgSend(v36, "callStackSymbols");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v64 = v35;
        v65 = 2114;
        v66 = v39;
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
      v64 = v27;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema validateContents:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2050, CFSTR("Invalid parameter not satisfying: %s"), v40, v41, v42, v43, (uint64_t)"contents != nil");
  }
  if (!a4)
  {
    NUAssertLogger_14916();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v64 = v29;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v45 = (void *)MEMORY[0x1E0CB3978];
        v46 = v44;
        objc_msgSend(v45, "callStackSymbols");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v64 = v44;
        v65 = 2114;
        v66 = v48;
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
      v64 = v34;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema validateContents:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2051, CFSTR("Invalid parameter not satisfying: %s"), v49, v50, v51, v52, (uint64_t)"error != NULL");
  }
  v53 = a4;
  v5 = (void *)objc_msgSend(v56, "mutableCopy");
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = self->_contents;
  v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v59;
LABEL_5:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v59 != v8)
        objc_enumerationMutation(obj);
      v10 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v9);
      objc_msgSend(v56, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[NSDictionary objectForKeyedSubscript:](self->_contents, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[NUSchemaRegistry sharedRegistry](NUSchemaRegistry, "sharedRegistry");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "schemaWithIdentifier:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v57 = 0;
        v15 = objc_msgSend(v14, "validate:error:", v11, &v57);
        v16 = v57;
        if ((v15 & 1) == 0)
        {
          +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 2, CFSTR("Invalid property"), v10, v16);
          *v53 = (id)objc_claimAutoreleasedReturnValue();

LABEL_18:
          v19 = 0;
          goto LABEL_19;
        }

      }
      else
      {
        -[NUCompositionSchema requiredContents](self, "requiredContents");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "containsObject:", v10);

        if (v18)
        {
          +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("Missing required property"), v10);
          v11 = 0;
          *v53 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_18;
        }
      }
      objc_msgSend(v5, "removeObjectForKey:", v10);

      if (v7 == ++v9)
      {
        v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
        if (v7)
          goto LABEL_5;
        break;
      }
    }
  }

  if (objc_msgSend(v5, "count"))
  {
    +[NUError invalidError:object:](NUError, "invalidError:object:", CFSTR("Extra contents"), v5);
    v19 = 0;
    *v53 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 1;
  }
LABEL_19:

  return v19;
}

- (id)copy:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
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
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_14916();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "object != nil");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v10;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
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
        v26 = v16;
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
      v26 = v15;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema copy:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2093, CFSTR("Invalid parameter not satisfying: %s"), v21, v22, v23, v24, (uint64_t)"object != nil");
  }
  v5 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[NUCompositionSchema copyComposition:](self, "copyComposition:", v5);
  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_446);
    v7 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v5;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "failure in [NUCompositionSchema copy]. object is not a NUComposition: %@", buf, 0xCu);
    }
    v6 = 0;
  }

  return v6;
}

- (id)copyComposition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NUGenericComposition *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  NUCompositionSchema *v17;
  void *v18;
  id v19;
  void *v20;
  NUGenericComposition *v21;
  void *v22;
  NSObject *v23;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *specific;
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
  NSDictionary *obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_14916();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "composition != nil");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v29;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (specific)
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
        v51 = v35;
        v52 = 2114;
        v53 = v39;
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
      v51 = v34;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema copyComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2106, CFSTR("Invalid parameter not satisfying: %s"), v40, v41, v42, v43, (uint64_t)"composition != nil");
  }
  v5 = v4;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUSchema identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToIdentifier:", v7);

  if ((v8 & 1) != 0)
  {
    v9 = -[NUGenericComposition initWithCompositionSchema:]([NUGenericComposition alloc], "initWithCompositionSchema:", self);
    -[NUComposition setMediaType:](v9, "setMediaType:", objc_msgSend(v5, "mediaType"));
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = self->_contents;
    v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v46;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v46 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v5, "valueForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = v5;
            v17 = self;
            -[NSDictionary objectForKeyedSubscript:](self->_contents, "objectForKeyedSubscript:", v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = +[NUSchema copyItem:schemaIdentifier:](NUSchema, "copyItem:schemaIdentifier:", v15, v18);
            if (!v19)
            {
              if (_NULogOnceToken != -1)
                dispatch_once(&_NULogOnceToken, &__block_literal_global_446);
              v5 = v16;
              v23 = _NULogger;
              if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v51 = v18;
                v52 = 2112;
                v53 = v15;
                _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "failure in [NUCompositionSchema copyComposition]. cannot copy item with identifier \"%@\". item: %@", buf, 0x16u);
              }

              v21 = 0;
              goto LABEL_25;
            }
            v20 = v19;

            self = v17;
            v5 = v16;
          }
          else
          {
            v20 = 0;
          }
          -[NUGenericComposition setValue:forKey:](v9, "setValue:forKey:", v20, v14);

        }
        v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        if (v11)
          continue;
        break;
      }
    }

    v21 = v9;
LABEL_25:

  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_446);
    v22 = (void *)_NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      v25 = v22;
      objc_msgSend(v5, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUSchema identifier](self, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v51 = v26;
      v52 = 2112;
      v53 = v27;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "failure in [NUCompositionSchema copyComposition]. composition.identifier \"%@\" is not equal to self.identifier \"%@\", buf, 0x16u);

    }
    v21 = 0;
  }

  return v21;
}

- (id)modelForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSDictionary *contents;
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
  NSDictionary *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  NSDictionary *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_14916();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "name != nil");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
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
        v23 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v19;
        v30 = 2114;
        v31 = v23;
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
      v29 = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema modelForProperty:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2146, CFSTR("Invalid parameter not satisfying: %s"), v24, v25, v26, v27, (uint64_t)"name != nil");
  }
  v5 = v4;
  -[NSDictionary objectForKeyedSubscript:](self->_contents, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[NUSchemaRegistry sharedRegistry](NUSchemaRegistry, "sharedRegistry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "schemaWithIdentifier:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_446);
    v9 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      contents = self->_contents;
      *(_DWORD *)buf = 138412546;
      v29 = v5;
      v30 = 2112;
      v31 = contents;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "failure in [NUCompositionSchema modelForProperty]. name \"%@\" does not exist in _contents: %@", buf, 0x16u);
    }
    v8 = 0;
  }

  return v8;
}

- (id)serialize:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v10;
  void *v11;
  void *specific;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_14916();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "object != nil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = (void *)MEMORY[0x1E0CB3978];
        v26 = v24;
        objc_msgSend(v25, "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v24;
        v44 = 2114;
        v45 = v28;
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
      v43 = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema serialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2160, CFSTR("Invalid parameter not satisfying: %s"), v29, v30, v31, v32, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    NUAssertLogger_14916();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v21)
      {
        v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v34 = (void *)MEMORY[0x1E0CB3978];
        v35 = v33;
        objc_msgSend(v34, "callStackSymbols");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v33;
        v44 = 2114;
        v45 = v37;
        _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema serialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2161, CFSTR("Invalid parameter not satisfying: %s"), v38, v39, v40, v41, (uint64_t)"error != NULL");
  }
  v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NUCompositionSchema serializeComposition:error:](self, "serializeComposition:error:", v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[NUError mismatchError:object:](NUError, "mismatchError:object:", CFSTR("Not a composition"), v7);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)deserialize:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v10;
  void *v11;
  void *specific;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_14916();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "object != nil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = (void *)MEMORY[0x1E0CB3978];
        v26 = v24;
        objc_msgSend(v25, "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v24;
        v44 = 2114;
        v45 = v28;
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
      v43 = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema deserialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2174, CFSTR("Invalid parameter not satisfying: %s"), v29, v30, v31, v32, (uint64_t)"object != nil");
  }
  if (!a4)
  {
    NUAssertLogger_14916();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v21)
      {
        v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v34 = (void *)MEMORY[0x1E0CB3978];
        v35 = v33;
        objc_msgSend(v34, "callStackSymbols");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v33;
        v44 = 2114;
        v45 = v37;
        _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema deserialize:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2175, CFSTR("Invalid parameter not satisfying: %s"), v38, v39, v40, v41, (uint64_t)"error != NULL");
  }
  v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NUCompositionSchema deserializeComposition:error:](self, "deserializeComposition:error:", v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[NUError mismatchError:object:](NUError, "mismatchError:object:", CFSTR("Not a composition"), v7);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)serializeComposition:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v11;
  BOOL v12;
  id v13;
  void *v14;
  BOOL v15;
  id v16;
  id v17;
  void *v18;
  unint64_t v19;
  __CFString *v20;
  void *v21;
  __CFString *v22;
  NSObject *v24;
  void *v25;
  void *specific;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
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
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  id v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_14916();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "composition != nil");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v25;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v39 = (void *)MEMORY[0x1E0CB3978];
        v40 = v38;
        objc_msgSend(v39, "callStackSymbols");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = v38;
        v61 = 2114;
        v62 = v42;
        _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v28)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v30;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema serializeComposition:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2188, CFSTR("Invalid parameter not satisfying: %s"), v43, v44, v45, v46, (uint64_t)"composition != nil");
  }
  if (!a4)
  {
    NUAssertLogger_14916();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v32;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (v33)
    {
      if (v35)
      {
        v47 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v48 = (void *)MEMORY[0x1E0CB3978];
        v49 = v47;
        objc_msgSend(v48, "callStackSymbols");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "componentsJoinedByString:", CFSTR("\n"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = v47;
        v61 = 2114;
        v62 = v51;
        _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v35)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v37;
      _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema serializeComposition:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2189, CFSTR("Invalid parameter not satisfying: %s"), v52, v53, v54, v55, (uint64_t)"error != NULL");
  }
  v7 = v6;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSDictionary count](self->_contents, "count") + 1);
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  v10 = -[NUSchema serializeIdentifier:intoDictionary:error:](self, "serializeIdentifier:intoDictionary:error:", v9, v8, &v58);
  v11 = v58;

  if (v10)
  {
    v57 = 0;
    v12 = +[NUSchema serializeMediaType:intoDictionary:error:](NUSchema, "serializeMediaType:intoDictionary:error:", objc_msgSend(v7, "mediaType"), v8, &v57);
    v13 = v57;

    if (v12)
    {
      objc_msgSend(v7, "contents");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = 0;
      v15 = -[NUCompositionSchema serializeContents:intoDictionary:error:](self, "serializeContents:intoDictionary:error:", v14, v8, &v56);
      v16 = v56;

      if (v15)
      {
        v17 = v8;
      }
      else
      {
        objc_msgSend(v7, "contents");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to serialize contents"), v21, v16);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        v17 = 0;
      }
      v13 = v16;
    }
    else
    {
      v19 = objc_msgSend(v7, "mediaType");
      if (v19 > 3)
        v20 = CFSTR("Invalid");
      else
        v20 = off_1E5060F50[v19];
      v22 = v20;
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to serialize mediaType"), v22, v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v17 = 0;
    }
  }
  else
  {
    objc_msgSend(v7, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to serialize identifier"), v18, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v17 = 0;
    v13 = v11;
  }

  return v17;
}

- (id)deserializeComposition:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  NUGenericComposition *v10;
  BOOL v11;
  id v12;
  NUGenericComposition *v13;
  NSObject *v15;
  void *v16;
  void *specific;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
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
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_14916();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "dictionary != nil");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v16;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v30 = (void *)MEMORY[0x1E0CB3978];
        v31 = v29;
        objc_msgSend(v30, "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v29;
        v51 = 2114;
        v52 = v33;
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
      v50 = v21;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema deserializeComposition:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2217, CFSTR("Invalid parameter not satisfying: %s"), v34, v35, v36, v37, (uint64_t)"dictionary != nil");
  }
  if (!a4)
  {
    NUAssertLogger_14916();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v23;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v24)
    {
      if (v26)
      {
        v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v39 = (void *)MEMORY[0x1E0CB3978];
        v40 = v38;
        objc_msgSend(v39, "callStackSymbols");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v38;
        v51 = 2114;
        v52 = v42;
        _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v28;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema deserializeComposition:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2218, CFSTR("Invalid parameter not satisfying: %s"), v43, v44, v45, v46, (uint64_t)"error != NULL");
  }
  v7 = v6;
  v48 = 0;
  v8 = -[NUSchema deserializeIdentifierFromDictionary:error:](self, "deserializeIdentifierFromDictionary:error:", v6, &v48);
  v9 = v48;
  if (v8)
  {
    v10 = -[NUGenericComposition initWithCompositionSchema:]([NUGenericComposition alloc], "initWithCompositionSchema:", self);
    -[NUComposition setMediaType:](v10, "setMediaType:", +[NUSchema deserializeMediaTypeFromDictionary:](NUSchema, "deserializeMediaTypeFromDictionary:", v7));
    v47 = 0;
    v11 = -[NUCompositionSchema deserializeContents:fromDictionary:error:](self, "deserializeContents:fromDictionary:error:", v10, v7, &v47);
    v12 = v47;

    if (v11)
    {
      v13 = v10;
    }
    else
    {
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to deserialize contents"), v7, v12);
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to deserialize identifier"), v7, v9);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v9;
  }

  return v13;
}

- (BOOL)serializeContents:(id)a3 intoDictionary:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  BOOL v22;
  NSObject *v24;
  void *v25;
  void *specific;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id *v72;
  NSDictionary *obj;
  void *v74;
  void *v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t v81[128];
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v75 = v8;
  if (!v8)
  {
    NUAssertLogger_14916();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "contents != nil");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v83 = v25;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v46 = (void *)MEMORY[0x1E0CB3978];
        v47 = v45;
        objc_msgSend(v46, "callStackSymbols");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v83 = v45;
        v84 = 2114;
        v85 = v49;
        _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v28)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v83 = v30;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema serializeContents:intoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2248, CFSTR("Invalid parameter not satisfying: %s"), v50, v51, v52, v53, (uint64_t)"contents != nil");
  }
  v10 = v9;
  if (!v9)
  {
    NUAssertLogger_14916();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "dictionary != nil");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v83 = v32;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (v33)
    {
      if (v35)
      {
        v54 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v55 = (void *)MEMORY[0x1E0CB3978];
        v56 = v54;
        objc_msgSend(v55, "callStackSymbols");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "componentsJoinedByString:", CFSTR("\n"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v83 = v54;
        v84 = 2114;
        v85 = v58;
        _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v35)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v83 = v37;
      _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema serializeContents:intoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2249, CFSTR("Invalid parameter not satisfying: %s"), v59, v60, v61, v62, (uint64_t)"dictionary != nil");
  }
  if (!a5)
  {
    NUAssertLogger_14916();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v83 = v39;
      _os_log_error_impl(&dword_1A6553000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
    if (v40)
    {
      if (v42)
      {
        v63 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v64 = (void *)MEMORY[0x1E0CB3978];
        v65 = v63;
        objc_msgSend(v64, "callStackSymbols");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "componentsJoinedByString:", CFSTR("\n"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v83 = v63;
        v84 = 2114;
        v85 = v67;
        _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v42)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v83 = v44;
      _os_log_error_impl(&dword_1A6553000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema serializeContents:intoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2250, CFSTR("Invalid parameter not satisfying: %s"), v68, v69, v70, v71, (uint64_t)"error != NULL");
  }
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  obj = self->_contents;
  v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
  if (!v11)
  {
    v22 = 1;
    goto LABEL_21;
  }
  v12 = v11;
  v72 = a5;
  v74 = v10;
  v13 = *(_QWORD *)v78;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v78 != v13)
        objc_enumerationMutation(obj);
      v15 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i);
      -[NSDictionary objectForKeyedSubscript:](self->_contents, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "objectForKeyedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v76 = 0;
        +[NUSchema serializeItem:schemaIdentifier:error:](NUSchema, "serializeItem:schemaIdentifier:error:", v17, v16, &v76);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v76;
        if (v18)
        {
          objc_msgSend(v74, "setObject:forKeyedSubscript:", v18, v15);

          goto LABEL_13;
        }
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to serialize content"), v15, v19);
        *v72 = (id)objc_claimAutoreleasedReturnValue();

LABEL_19:
        v22 = 0;
        goto LABEL_20;
      }
      -[NUCompositionSchema requiredContents](self, "requiredContents");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "containsObject:", v15);

      if (v21)
      {
        +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("Missing required content"), v15);
        v17 = 0;
        *v72 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
LABEL_13:

    }
    v12 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
    if (v12)
      continue;
    break;
  }
  v22 = 1;
LABEL_20:
  v10 = v74;
LABEL_21:

  return v22;
}

- (BOOL)deserializeContents:(id)a3 fromDictionary:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v20;
  void *v21;
  void *specific;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id *v68;
  NSDictionary *obj;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t v76[128];
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  void *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    NUAssertLogger_14916();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "composition != nil");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v78 = v21;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v42 = (void *)MEMORY[0x1E0CB3978];
        v43 = v41;
        objc_msgSend(v42, "callStackSymbols");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v78 = v41;
        v79 = 2114;
        v80 = v45;
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
      v78 = v26;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema deserializeContents:fromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2280, CFSTR("Invalid parameter not satisfying: %s"), v46, v47, v48, v49, (uint64_t)"composition != nil");
  }
  v9 = v8;
  if (!v8)
  {
    NUAssertLogger_14916();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "dictionary != nil");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v78 = v28;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (v29)
    {
      if (v31)
      {
        v50 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v51 = (void *)MEMORY[0x1E0CB3978];
        v52 = v50;
        objc_msgSend(v51, "callStackSymbols");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v78 = v50;
        v79 = 2114;
        v80 = v54;
        _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v31)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v78 = v33;
      _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema deserializeContents:fromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2281, CFSTR("Invalid parameter not satisfying: %s"), v55, v56, v57, v58, (uint64_t)"dictionary != nil");
  }
  if (!a5)
  {
    NUAssertLogger_14916();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v78 = v35;
      _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
    if (v36)
    {
      if (v38)
      {
        v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v60 = (void *)MEMORY[0x1E0CB3978];
        v61 = v59;
        objc_msgSend(v60, "callStackSymbols");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "componentsJoinedByString:", CFSTR("\n"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v78 = v59;
        v79 = 2114;
        v80 = v63;
        _os_log_error_impl(&dword_1A6553000, v37, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v38)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v78 = v40;
      _os_log_error_impl(&dword_1A6553000, v37, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema deserializeContents:fromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2282, CFSTR("Invalid parameter not satisfying: %s"), v64, v65, v66, v67, (uint64_t)"error != NULL");
  }
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = self->_contents;
  v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
  if (v10)
  {
    v11 = v10;
    v68 = a5;
    v12 = *(_QWORD *)v73;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v73 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_contents, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v71 = 0;
          +[NUSchema deserializeItem:schemaIdentifier:error:](NUSchema, "deserializeItem:schemaIdentifier:error:", v16, v15, &v71);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v71;
          if (!v17)
          {
            +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to deserialize content"), v14, v18);
            *v68 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_16;
          }
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v14);

        }
      }
      v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
      if (v11)
        continue;
      break;
    }
  }
  LOBYTE(v17) = 1;
LABEL_16:

  return (char)v17;
}

- (BOOL)serializeIntoDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  NSObject *v19;
  void *v20;
  void *specific;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id *v35;
  void *v36;
  objc_super v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    NUAssertLogger_14916();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v20;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v27 = (void *)MEMORY[0x1E0CB3978];
        v28 = v26;
        objc_msgSend(v27, "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v26;
        v45 = 2114;
        v46 = v30;
        _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v25;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema serializeIntoDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2306, CFSTR("Invalid parameter not satisfying: %s"), v31, v32, v33, v34, (uint64_t)"error != NULL");
  }
  v35 = a4;
  v36 = v6;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Composition"), CFSTR("isa"));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSDictionary count](self->_contents, "count"));
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v8 = self->_contents;
  v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_contents, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringRepresentation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v13);

      }
      v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v10);
  }

  objc_msgSend(v36, "setObject:forKeyedSubscript:", v7, CFSTR("contents"));
  -[NSDictionary objectForKeyedSubscript:](self->super.super._attributes, "objectForKeyedSubscript:", CFSTR("required"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v16, CFSTR("required"));

  v37.receiver = self;
  v37.super_class = (Class)NUCompositionSchema;
  v17 = -[NUSchema serializeIntoDictionary:error:](&v37, sel_serializeIntoDictionary_error_, v36, v35);

  return v17;
}

- (id)schemaDependencies
{
  return -[NSDictionary allValues](self->_contents, "allValues");
}

- (BOOL)itemIsResolved:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  NSObject *v17;
  void *v18;
  void *specific;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSDictionary *obj;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NUAssertLogger_14916();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "[object isKindOfClass:NUComposition.class]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v25 = (void *)MEMORY[0x1E0CB3978];
        v26 = v24;
        objc_msgSend(v25, "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v24;
        v42 = 2114;
        v43 = v28;
        _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema itemIsResolved:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2371, CFSTR("Invalid parameter not satisfying: %s"), v29, v30, v31, v32, (uint64_t)"[object isKindOfClass:NUComposition.class]");
  }
  v5 = v4;
  +[NUSchemaRegistry sharedRegistry](NUSchemaRegistry, "sharedRegistry");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = self->_contents;
  v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          -[NSDictionary objectForKeyedSubscript:](self->_contents, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "schemaWithIdentifier:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "itemIsResolved:", v11);

          if ((v14 & 1) == 0)
          {

            v15 = 0;
            goto LABEL_13;
          }
        }

      }
      v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v7)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_13:

  return v15;
}

- (BOOL)resolveItem:(id)a3 resolver:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NUCompositionSchema *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  BOOL v23;
  NSObject *v25;
  void *v26;
  void *specific;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id *v41;
  NSDictionary *obj;
  void *v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v44 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NUAssertLogger_14916();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "[object isKindOfClass:NUComposition.class]");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v26;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v33 = (void *)MEMORY[0x1E0CB3978];
        v34 = v32;
        objc_msgSend(v33, "callStackSymbols");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v32;
        v53 = 2114;
        v54 = v36;
        _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v31;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUCompositionSchema resolveItem:resolver:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2391, CFSTR("Invalid parameter not satisfying: %s"), v37, v38, v39, v40, (uint64_t)"[object isKindOfClass:NUComposition.class]");
  }
  v9 = v8;
  +[NUSchemaRegistry sharedRegistry](NUSchemaRegistry, "sharedRegistry");
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  obj = self->_contents;
  v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v10)
  {
    v11 = v10;
    v41 = a5;
    v12 = *(_QWORD *)v47;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v47 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          v17 = self;
          -[NSDictionary objectForKeyedSubscript:](self->_contents, "objectForKeyedSubscript:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "schemaWithIdentifier:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = 0;
          v20 = objc_msgSend(v19, "resolveItem:resolver:error:", v16, v44, &v45);
          v21 = v45;
          v22 = v21;
          if ((v20 & 1) == 0)
          {
            +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to resolve composition contents"), v16, v21);
            *v41 = (id)objc_claimAutoreleasedReturnValue();

            v23 = 0;
            goto LABEL_14;
          }

          self = v17;
        }
      }
      v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      if (v11)
        continue;
      break;
    }
  }
  v23 = 1;
LABEL_14:

  return v23;
}

- (NSDictionary)contents
{
  return self->_contents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_requiredContents, 0);
}

+ (id)supportedAttributes
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NUCompositionSchema;
  objc_msgSendSuper2(&v6, sel_supportedAttributes);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("required");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)deserializeFromDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v18;
  void *v19;
  void *specific;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_14916();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "dictionary != nil");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v19;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v33 = (void *)MEMORY[0x1E0CB3978];
        v34 = v32;
        objc_msgSend(v33, "callStackSymbols");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v32;
        v55 = 2114;
        v56 = v36;
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
      v54 = v24;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUCompositionSchema deserializeFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2328, CFSTR("Invalid parameter not satisfying: %s"), v37, v38, v39, v40, (uint64_t)"dictionary != nil");
  }
  if (!a4)
  {
    NUAssertLogger_14916();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v26;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14916();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v42 = (void *)MEMORY[0x1E0CB3978];
        v43 = v41;
        objc_msgSend(v42, "callStackSymbols");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v41;
        v55 = 2114;
        v56 = v45;
        _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v31;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUCompositionSchema deserializeFromDictionary:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchema.m", 2329, CFSTR("Invalid parameter not satisfying: %s"), v46, v47, v48, v49, (uint64_t)"error != NULL");
  }
  v7 = v6;
  v52 = 0;
  objc_msgSend(a1, "deserializeIdentifierFromDictionary:error:", v6, &v52);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v52;
  if (v8)
  {
    v51 = 0;
    objc_msgSend(a1, "deserializeContentsFromDictionary:error:", v7, &v51);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v51;

    if (!v10)
    {
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to deserialize composition contents"), v7, v11);
      v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

      v9 = v11;
      goto LABEL_15;
    }
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("required"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v50 = 0;
      objc_msgSend(a1, "deserializeArrayFromDictionary:key:error:", v7, CFSTR("required"), &v50);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v50;

      if (!v14)
      {
        +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to deserialize required contents"), v7, v15);
        v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("required"));

    }
    else
    {
      v15 = v11;
    }
    v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:contents:attributes:", v8, v10, v12);
LABEL_13:

    v11 = v15;
    goto LABEL_14;
  }
  +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to deserialize composition identifier"), v7, v9);
  v16 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v16;
}

@end
