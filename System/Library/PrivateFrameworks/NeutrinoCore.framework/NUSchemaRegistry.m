@implementation NUSchemaRegistry

- (NUSchemaRegistry)init
{
  NUSchemaRegistry *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v6;
  NSMutableDictionary *schemas;
  NSMutableDictionary *v8;
  NSMutableDictionary *versions;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NUSchemaRegistry;
  v2 = -[NUSchemaRegistry init](&v11, sel_init);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("NUSchemaRegistry", v3);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v4;

  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  schemas = v2->_schemas;
  v2->_schemas = v6;

  v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  versions = v2->_versions;
  v2->_versions = v8;

  -[NUSchemaRegistry _registerBuiltInSchemas](v2, "_registerBuiltInSchemas");
  return v2;
}

- (void)_registerBuiltInSchemas
{
  void *v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  +[NUSourceSchema sharedSourceSchema](NUSourceSchema, "sharedSourceSchema");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v4 = -[NUSchemaRegistry _registerSchema:error:](self, "_registerSchema:error:", v3, &v22);
  v5 = v22;

  if (!v4)
  {
    NUAssertLogger_15953();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to register builtin schema, error: %@"), v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_15953();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v13;
        v25 = 2114;
        v26 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry _registerBuiltInSchemas]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 56, CFSTR("Failed to register builtin schema, error: %@"), v18, v19, v20, v21, (uint64_t)v5);
  }

}

- (BOOL)registerSchema:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  NSObject *queue;
  id v11;
  BOOL v12;
  id v13;
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
  _QWORD block[5];
  id v48;
  _BYTE *v49;
  id *v50;
  id v51;
  _BYTE buf[24];
  char v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_15953();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "schema != nil");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v16;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_15953();
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
        *(_QWORD *)&buf[4] = v29;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v33;
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
      *(_QWORD *)&buf[4] = v21;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry registerSchema:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 61, CFSTR("Invalid parameter not satisfying: %s"), v34, v35, v36, v37, (uint64_t)"schema != nil");
  }
  if (!a4)
  {
    NUAssertLogger_15953();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v23;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_15953();
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
        *(_QWORD *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v42;
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
      *(_QWORD *)&buf[4] = v28;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry registerSchema:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 62, CFSTR("Invalid parameter not satisfying: %s"), v43, v44, v45, v46, (uint64_t)"error != NULL");
  }
  v7 = v6;
  v51 = 0;
  v8 = objc_msgSend(v6, "isValid:", &v51);
  v9 = v51;
  if ((v8 & 1) != 0)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v53 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__NUSchemaRegistry_registerSchema_error___block_invoke;
    block[3] = &unk_1E5062950;
    v49 = buf;
    block[4] = self;
    v48 = v7;
    v50 = a4;
    v11 = v9;
    dispatch_sync(queue, block);
    v12 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v13 = v51;
    +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 2, CFSTR("Schema is not valid"), v7, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v12 = 0;
  }

  return v12;
}

- (BOOL)_registerSchema:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v16;
  void *v17;
  void *specific;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
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
    NUAssertLogger_15953();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "schema != nil");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v17;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_15953();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v31 = (void *)MEMORY[0x1E0CB3978];
        v32 = v30;
        objc_msgSend(v31, "callStackSymbols");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v30;
        v51 = 2114;
        v52 = v34;
        _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v22;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry _registerSchema:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 84, CFSTR("Invalid parameter not satisfying: %s"), v35, v36, v37, v38, (uint64_t)"schema != nil");
  }
  if (!a4)
  {
    NUAssertLogger_15953();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v24;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_15953();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v25)
    {
      if (v27)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = (void *)MEMORY[0x1E0CB3978];
        v41 = v39;
        objc_msgSend(v40, "callStackSymbols");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v39;
        v51 = 2114;
        v52 = v43;
        _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v29;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry _registerSchema:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 85, CFSTR("Invalid parameter not satisfying: %s"), v44, v45, v46, v47, (uint64_t)"error != NULL");
  }
  v7 = v6;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_schemas, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[NUError duplicateError:object:](NUError, "duplicateError:object:", CFSTR("Schema identifier already registered"), v8);
    LOBYTE(v10) = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "version");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUVersion versionZero](NUVersion, "versionZero");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifierWithVersion:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    v10 = -[NUSchemaRegistry _registerVersion:withOriginalIdentifier:error:](self, "_registerVersion:withOriginalIdentifier:error:", v11, v13, &v48);
    v14 = v48;

    if (v10)
    {
      -[NSMutableDictionary setObject:forKey:](self->_schemas, "setObject:forKey:", v7, v8);
    }
    else
    {
      +[NUError errorWithCode:reason:object:underlyingError:](NUError, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to register schema version"), v7, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v10;
}

- (BOOL)_registerVersion:(id)a3 withOriginalIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
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
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    NUAssertLogger_15953();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "version != nil");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v21;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_15953();
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
        v69 = v41;
        v70 = 2114;
        v71 = v45;
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
      v69 = v26;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry _registerVersion:withOriginalIdentifier:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 112, CFSTR("Invalid parameter not satisfying: %s"), v46, v47, v48, v49, (uint64_t)"version != nil");
  }
  v10 = v9;
  if (!v9)
  {
    NUAssertLogger_15953();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "identifier != nil");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v28;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_15953();
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
        v69 = v50;
        v70 = 2114;
        v71 = v54;
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
      v69 = v33;
      _os_log_error_impl(&dword_1A6553000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry _registerVersion:withOriginalIdentifier:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 113, CFSTR("Invalid parameter not satisfying: %s"), v55, v56, v57, v58, (uint64_t)"identifier != nil");
  }
  if (!a5)
  {
    NUAssertLogger_15953();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v69 = v35;
      _os_log_error_impl(&dword_1A6553000, v34, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_15953();
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
        v69 = v59;
        v70 = 2114;
        v71 = v63;
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
      v69 = v40;
      _os_log_error_impl(&dword_1A6553000, v37, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry _registerVersion:withOriginalIdentifier:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 114, CFSTR("Invalid parameter not satisfying: %s"), v64, v65, v66, v67, (uint64_t)"error != nil");
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_versions, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = v11;
    v13 = objc_msgSend(v11, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, objc_msgSend(v11, "count"), 1024, &__block_literal_global_16021);
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", v13 - 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v12, "insertObject:atIndex:", v8, v14);
    if (objc_msgSend(v8, "minor") <= 0)
      goto LABEL_14;
    if (v15)
    {
      v16 = objc_msgSend(v15, "major");
      if (v16 == objc_msgSend(v8, "major"))
      {
        v17 = objc_msgSend(v15, "minor");
        if (v17 == objc_msgSend(v8, "minor") - 1)
          goto LABEL_14;
      }
    }
LABEL_15:
    +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("Previous minor version is not registered"), v8);
    v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v12, "addObject:", v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_versions, "setObject:forKeyedSubscript:", v12, v10);
  v15 = 0;
  if (objc_msgSend(v8, "minor") > 0)
    goto LABEL_15;
LABEL_14:
  v18 = 1;
LABEL_16:

  return v18;
}

- (BOOL)registerSchemas:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v35;
  void *v36;
  void *specific;
  NSObject *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id *v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[4];
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  uint8_t v81[128];
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    NUAssertLogger_15953();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "schemas != nil");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v83 = v36;
      _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_15953();
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v39)
      {
        v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v50 = (void *)MEMORY[0x1E0CB3978];
        v51 = v49;
        objc_msgSend(v50, "callStackSymbols");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "componentsJoinedByString:", CFSTR("\n"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v83 = v49;
        v84 = 2114;
        v85 = v53;
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
      v83 = v41;
      _os_log_error_impl(&dword_1A6553000, v38, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry registerSchemas:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 153, CFSTR("Invalid parameter not satisfying: %s"), v54, v55, v56, v57, (uint64_t)"schemas != nil");
  }
  if (!a4)
  {
    NUAssertLogger_15953();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v83 = v43;
      _os_log_error_impl(&dword_1A6553000, v42, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_15953();
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
    if (v44)
    {
      if (v46)
      {
        v58 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v59 = (void *)MEMORY[0x1E0CB3978];
        v60 = v58;
        objc_msgSend(v59, "callStackSymbols");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "componentsJoinedByString:", CFSTR("\n"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v83 = v58;
        v84 = 2114;
        v85 = v62;
        _os_log_error_impl(&dword_1A6553000, v45, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v46)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v83 = v48;
      _os_log_error_impl(&dword_1A6553000, v45, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry registerSchemas:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 154, CFSTR("Invalid parameter not satisfying: %s"), v63, v64, v65, v66, (uint64_t)"error != NULL");
  }
  v6 = v5;
  v68 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v77 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v16);

        objc_msgSend(v15, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v17);

        objc_msgSend(v15, "schemaDependencies");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, v19);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
    }
    while (v12);
  }

  v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  if (objc_msgSend(v7, "count"))
  {
    v20 = 0x1E0C99000uLL;
    while (2)
    {
      objc_msgSend(v7, "anyObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(objc_alloc(*(Class *)(v20 + 3600)), "initWithObject:", v21);
      do
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v74[0] = MEMORY[0x1E0C809B0];
        v74[1] = 3221225472;
        v74[2] = __42__NUSchemaRegistry_registerSchemas_error___block_invoke;
        v74[3] = &unk_1E50629B8;
        v24 = v7;
        v75 = v24;
        v25 = objc_msgSend(v23, "indexOfObjectPassingTest:", v74);

        if (v25 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v69, "addObject:", v21);
          objc_msgSend(v24, "removeObject:", v21);
          objc_msgSend(v22, "removeObject:", v21);
          objc_msgSend(v22, "lastObject");
          v26 = objc_claimAutoreleasedReturnValue();

          v21 = (void *)v26;
        }
        else
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", v21);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectAtIndexedSubscript:", v25);
          v28 = (id)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v22, "containsObject:", v28) & 1) != 0)
          {
            +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("Cyclic schema dependency detected"), v28);
            *v68 = (id)objc_claimAutoreleasedReturnValue();

            LOBYTE(v22) = 0;
            goto LABEL_30;
          }
          objc_msgSend(v22, "addObject:", v28);
          v21 = v28;
        }

      }
      while (objc_msgSend(v22, "count"));

      v20 = 0x1E0C99000;
      if (objc_msgSend(v24, "count"))
        continue;
      break;
    }
  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v28 = v69;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v71;
LABEL_21:
    v32 = 0;
    while (1)
    {
      if (*(_QWORD *)v71 != v31)
        objc_enumerationMutation(v28);
      objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * v32));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v22) = -[NUSchemaRegistry registerSchema:error:](self, "registerSchema:error:", v33, v68);

      if (!(_DWORD)v22)
        break;
      if (v30 == ++v32)
      {
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
        LOBYTE(v22) = 1;
        if (v30)
          goto LABEL_21;
        break;
      }
    }
  }
  else
  {
    LOBYTE(v22) = 1;
  }
LABEL_30:

  return (char)v22;
}

- (id)schemaWithIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
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
  _QWORD block[5];
  id v26;
  _BYTE *v27;
  _BYTE buf[24];
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_15953();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "identifier != NULL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v10;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_15953();
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
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v20;
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
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry schemaWithIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 226, CFSTR("Invalid parameter not satisfying: %s"), v21, v22, v23, v24, (uint64_t)"identifier != NULL");
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v29 = __Block_byref_object_copy__15976;
  v30 = __Block_byref_object_dispose__15977;
  v31 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__NUSchemaRegistry_schemaWithIdentifier___block_invoke;
  block[3] = &unk_1E5063868;
  v26 = v4;
  v27 = buf;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v7;
}

- (id)_schemaWithIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_schemas, "objectForKey:", a3);
}

- (id)latestVersionWithNamespace:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NUIdentifier *v9;
  void *v10;
  NUIdentifier *v11;
  NSObject *queue;
  NUIdentifier *v13;
  id v14;
  NSObject *v16;
  void *v17;
  void *specific;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD block[5];
  NUIdentifier *v49;
  _BYTE *v50;
  _BYTE buf[24];
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    NUAssertLogger_15953();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "namespace != nil");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v17;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_15953();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v31 = (void *)MEMORY[0x1E0CB3978];
        v32 = v30;
        objc_msgSend(v31, "callStackSymbols");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v34;
        _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v22;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry latestVersionWithNamespace:name:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 245, CFSTR("Invalid parameter not satisfying: %s"), v35, v36, v37, v38, (uint64_t)"namespace != nil");
  }
  v8 = v7;
  if (!v7)
  {
    NUAssertLogger_15953();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "name != nil");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v24;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_15953();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v25)
    {
      if (v27)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = (void *)MEMORY[0x1E0CB3978];
        v41 = v39;
        objc_msgSend(v40, "callStackSymbols");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v39;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v43;
        _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v29;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry latestVersionWithNamespace:name:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 246, CFSTR("Invalid parameter not satisfying: %s"), v44, v45, v46, v47, (uint64_t)"name != nil");
  }
  v9 = [NUIdentifier alloc];
  +[NUVersion versionZero](NUVersion, "versionZero");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NUIdentifier initWithNamespace:name:version:](v9, "initWithNamespace:name:version:", v6, v8, v10);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v52 = __Block_byref_object_copy__15976;
  v53 = __Block_byref_object_dispose__15977;
  v54 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__NUSchemaRegistry_latestVersionWithNamespace_name___block_invoke;
  block[3] = &unk_1E5063868;
  v49 = v11;
  v50 = buf;
  block[4] = self;
  v13 = v11;
  dispatch_sync(queue, block);
  v14 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v14;
}

- (id)_latestVersionWithOriginalIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
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
    NUAssertLogger_15953();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "identifier != nil");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v10;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_15953();
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
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry _latestVersionWithOriginalIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 263, CFSTR("Invalid parameter not satisfying: %s"), v21, v22, v23, v24, (uint64_t)"identifier != nil");
  }
  v5 = v4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_versions, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)versionsCompatibleWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *queue;
  id v9;
  id v10;
  id v11;
  NSObject *v13;
  void *v14;
  void *specific;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD block[5];
  id v30;
  id v31;
  _BYTE *v32;
  _BYTE buf[24];
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_15953();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v14;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_15953();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v21 = (void *)MEMORY[0x1E0CB3978];
        v22 = v20;
        objc_msgSend(v21, "callStackSymbols");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v24;
        _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v19;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry versionsCompatibleWithIdentifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 274, CFSTR("Invalid parameter not satisfying: %s"), v25, v26, v27, v28, (uint64_t)"identifier");
  }
  v5 = v4;
  +[NUVersion versionZero](NUVersion, "versionZero");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifierWithVersion:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v34 = __Block_byref_object_copy__15976;
  v35 = __Block_byref_object_dispose__15977;
  v36 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__NUSchemaRegistry_versionsCompatibleWithIdentifier___block_invoke;
  block[3] = &unk_1E5064080;
  block[4] = self;
  v30 = v7;
  v31 = v5;
  v32 = buf;
  v9 = v5;
  v10 = v7;
  dispatch_sync(queue, block);
  v11 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v11;
}

- (id)_allVersionsWithOriginalIdentifier:(id)a3 upToVersion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v12;
  void *v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
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
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    NUAssertLogger_15953();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "identifier != nil");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_15953();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v27 = (void *)MEMORY[0x1E0CB3978];
        v28 = v26;
        objc_msgSend(v27, "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v26;
        v46 = 2114;
        v47 = v30;
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
      v45 = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry _allVersionsWithOriginalIdentifier:upToVersion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 291, CFSTR("Invalid parameter not satisfying: %s"), v31, v32, v33, v34, (uint64_t)"identifier != nil");
  }
  v8 = v7;
  if (!v7)
  {
    NUAssertLogger_15953();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "version != nil");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v20;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_15953();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v21)
    {
      if (v23)
      {
        v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E0CB3978];
        v37 = v35;
        objc_msgSend(v36, "callStackSymbols");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v35;
        v46 = 2114;
        v47 = v39;
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
      v45 = v25;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSchemaRegistry _allVersionsWithOriginalIdentifier:upToVersion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSchemaRegistry.m", 292, CFSTR("Invalid parameter not satisfying: %s"), v40, v41, v42, v43, (uint64_t)"version != nil");
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_versions, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subarrayWithRange:", 0, objc_msgSend(v9, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, objc_msgSend(v9, "count"), 1024, &__block_literal_global_40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versions, 0);
  objc_storeStrong((id *)&self->_schemas, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __67__NUSchemaRegistry__allVersionsWithOriginalIdentifier_upToVersion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __53__NUSchemaRegistry_versionsCompatibleWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "version");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_allVersionsWithOriginalIdentifier:upToVersion:", v3, v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __52__NUSchemaRegistry_latestVersionWithNamespace_name___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_latestVersionWithOriginalIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __41__NUSchemaRegistry_schemaWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_schemaWithIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __42__NUSchemaRegistry_registerSchemas_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

uint64_t __66__NUSchemaRegistry__registerVersion_withOriginalIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __41__NUSchemaRegistry_registerSchema_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_registerSchema:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

+ (id)sharedRegistry
{
  void *v2;
  void *v3;

  +[NUFactory sharedFactory](NUFactory, "sharedFactory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "schemaRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
