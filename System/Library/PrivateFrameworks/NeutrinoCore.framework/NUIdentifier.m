@implementation NUIdentifier

- (NUIdentifier)init
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_108);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_108);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_108);
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
  _NUAssertFailHandler((uint64_t)"-[NUIdentifier init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 28, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (NUIdentifier)initWithName:(id)a3
{
  id v4;
  void *v5;
  NUIdentifier *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NUIdentifier initWithName:version:](self, "initWithName:version:", v4, v5);

  return v6;
}

- (NUIdentifier)initWithName:(id)a3 version:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NUIdentifier *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultNamespace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NUIdentifier initWithNamespace:name:version:](self, "initWithNamespace:name:version:", v8, v7, v6);

  return v9;
}

- (NUIdentifier)initWithNamespace:(id)a3 name:(id)a4 version:(id)a5
{
  id v8;
  id v9;
  NUVersion *v10;
  NUVersion *v11;
  NUIdentifier *v12;
  uint64_t v13;
  NSString *v14;
  uint64_t v15;
  NSString *name;
  NUVersion *version;
  NSObject *v19;
  void *v20;
  void *specific;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  _BOOL4 v51;
  void *v52;
  void *v53;
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
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  objc_super v99;
  uint8_t buf[4];
  void *v101;
  __int16 v102;
  void *v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (NUVersion *)a5;
  if (!v8)
  {
    NUAssertLogger_18492();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "namespace != nil");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v101 = v20;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18492();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v54 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v55 = (void *)MEMORY[0x1E0CB3978];
        v56 = v54;
        objc_msgSend(v55, "callStackSymbols");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "componentsJoinedByString:", CFSTR("\n"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v101 = v54;
        v102 = 2114;
        v103 = v58;
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
      v101 = v25;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUIdentifier initWithNamespace:name:version:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 43, CFSTR("Invalid parameter not satisfying: %s"), v59, v60, v61, v62, (uint64_t)"namespace != nil");
  }
  if (!v9)
  {
    NUAssertLogger_18492();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "name != nil");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v101 = v27;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18492();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v30)
      {
        v63 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v64 = (void *)MEMORY[0x1E0CB3978];
        v65 = v63;
        objc_msgSend(v64, "callStackSymbols");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "componentsJoinedByString:", CFSTR("\n"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v101 = v63;
        v102 = 2114;
        v103 = v67;
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
      v101 = v32;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUIdentifier initWithNamespace:name:version:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 44, CFSTR("Invalid parameter not satisfying: %s"), v68, v69, v70, v71, (uint64_t)"name != nil");
  }
  v11 = v10;
  if (!v10)
  {
    NUAssertLogger_18492();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "version != nil");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v101 = v34;
      _os_log_error_impl(&dword_1A6553000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18492();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (v35)
    {
      if (v37)
      {
        v72 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v73 = (void *)MEMORY[0x1E0CB3978];
        v74 = v72;
        objc_msgSend(v73, "callStackSymbols");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "componentsJoinedByString:", CFSTR("\n"));
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v101 = v72;
        v102 = 2114;
        v103 = v76;
        _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v37)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v101 = v39;
      _os_log_error_impl(&dword_1A6553000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUIdentifier initWithNamespace:name:version:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 45, CFSTR("Invalid parameter not satisfying: %s"), v77, v78, v79, v80, (uint64_t)"version != nil");
  }
  if ((objc_msgSend((id)objc_opt_class(), "validateNamespace:", v8) & 1) == 0)
  {
    NUAssertLogger_18492();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid namespace: %@"), v8);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v101 = v41;
      _os_log_error_impl(&dword_1A6553000, v40, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18492();
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
    if (v42)
    {
      if (v44)
      {
        v81 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v82 = (void *)MEMORY[0x1E0CB3978];
        v83 = v81;
        objc_msgSend(v82, "callStackSymbols");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "componentsJoinedByString:", CFSTR("\n"));
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v101 = v81;
        v102 = 2114;
        v103 = v85;
        _os_log_error_impl(&dword_1A6553000, v43, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v44)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v101 = v46;
      _os_log_error_impl(&dword_1A6553000, v43, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUIdentifier initWithNamespace:name:version:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 48, CFSTR("Invalid namespace: %@"), v86, v87, v88, v89, (uint64_t)v8);
  }
  if ((objc_msgSend((id)objc_opt_class(), "validateName:", v9) & 1) == 0)
  {
    NUAssertLogger_18492();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid name: %@"), v9);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v101 = v48;
      _os_log_error_impl(&dword_1A6553000, v47, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18492();
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);
    if (v49)
    {
      if (v51)
      {
        v90 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v91 = (void *)MEMORY[0x1E0CB3978];
        v92 = v90;
        objc_msgSend(v91, "callStackSymbols");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "componentsJoinedByString:", CFSTR("\n"));
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v101 = v90;
        v102 = 2114;
        v103 = v94;
        _os_log_error_impl(&dword_1A6553000, v50, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v51)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "componentsJoinedByString:", CFSTR("\n"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v101 = v53;
      _os_log_error_impl(&dword_1A6553000, v50, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUIdentifier initWithNamespace:name:version:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 49, CFSTR("Invalid name: %@"), v95, v96, v97, v98, (uint64_t)v9);
  }
  v99.receiver = self;
  v99.super_class = (Class)NUIdentifier;
  v12 = -[NUIdentifier init](&v99, sel_init);
  v13 = objc_msgSend(v8, "copy");
  v14 = v12->_namespace;
  v12->_namespace = (NSString *)v13;

  v15 = objc_msgSend(v9, "copy");
  name = v12->_name;
  v12->_name = (NSString *)v15;

  version = v12->_version;
  v12->_version = v11;

  return v12;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NUIdentifier namespace](self, "namespace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUIdentifier name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUIdentifier version](self, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ ns:%@ name:%@ version:%@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)stringRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NUIdentifier namespace](self, "namespace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUIdentifier name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUIdentifier version](self, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@~%@"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NUIdentifier)identifierWithVersion:(id)a3
{
  id v4;
  void *v5;
  NUIdentifier *v6;
  void *v7;
  void *v8;
  NUIdentifier *v9;
  NSObject *v11;
  void *v12;
  void *specific;
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
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_18492();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "version != nil");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18492();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v19 = (void *)MEMORY[0x1E0CB3978];
        v20 = v18;
        objc_msgSend(v19, "callStackSymbols");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v18;
        v29 = 2114;
        v30 = v22;
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
      v28 = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUIdentifier identifierWithVersion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 78, CFSTR("Invalid parameter not satisfying: %s"), v23, v24, v25, v26, (uint64_t)"version != nil");
  }
  v5 = v4;
  v6 = [NUIdentifier alloc];
  -[NUIdentifier namespace](self, "namespace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUIdentifier name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NUIdentifier initWithNamespace:name:version:](v6, "initWithNamespace:name:version:", v7, v8, v5);

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = 0x1891E4D530AE31 * -[NSString hash](self->_namespace, "hash");
  v4 = 0x10E270B8F4A859 * -[NSString hash](self->_name, "hash");
  return v4 ^ v3 ^ (0x17A9B71420B2E9 * -[NUVersion hash](self->_version, "hash"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[NUIdentifier isEqualToIdentifier:](self, "isEqualToIdentifier:", v4);

  return v5;
}

- (BOOL)isEqualToIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  -[NUIdentifier namespace](self, "namespace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "namespace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7
    && (-[NUIdentifier name](self, "name"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "name"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "isEqualToString:", v9),
        v9,
        v8,
        v10))
  {
    -[NUIdentifier version](self, "version");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "version");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToVersion:", v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)namespace
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NUVersion)version
{
  return (NUVersion *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_namespace, 0);
}

+ (id)defaultNamespace
{
  void *v2;
  void *v3;

  +[NUFactory sharedFactory](NUFactory, "sharedFactory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultNamespace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)defaultVersion
{
  return +[NUVersion versionOne](NUVersion, "versionOne");
}

+ (id)latestIdentifierWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "defaultNamespace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "latestIdentifierWithNamespace:name:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)latestIdentifierWithNamespace:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  +[NUSchemaRegistry sharedRegistry](NUSchemaRegistry, "sharedRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "latestVersionWithNamespace:name:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNamespace:name:version:", v6, v7, v9);
  else
    v10 = 0;

  return v10;
}

+ (NUIdentifier)identifierWithString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  const __CFString *v13;
  id v14;
  void *v15;
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
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_18492();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "string != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18492();
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
        v37 = v24;
        v38 = 2114;
        v39 = v28;
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
      v37 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUIdentifier identifierWithString:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 105, CFSTR("Invalid parameter not satisfying: %s"), v29, v30, v31, v32, (uint64_t)"string != nil");
  }
  v7 = v6;
  v34 = 0;
  v35 = 0;
  v33 = 0;
  v8 = objc_msgSend(a1, "validateIdentifierString:namespace:name:version:", v6, &v35, &v34, &v33);
  v9 = v35;
  v10 = v34;
  v11 = v33;
  if ((v8 & 1) == 0)
  {
    v13 = CFSTR("Invalid identifier string");
    v14 = v7;
    goto LABEL_13;
  }
  if (v9 && (objc_msgSend(a1, "validateNamespace:", v9) & 1) == 0)
  {
    v13 = CFSTR("Invalid identifier namespace");
    v14 = v9;
    goto LABEL_13;
  }
  if (!v10 || (objc_msgSend(a1, "validateName:", v10) & 1) == 0)
  {
    v13 = CFSTR("Invalid identifier name");
    v14 = v10;
    goto LABEL_13;
  }
  if (v11)
  {
    +[NUVersion versionWithString:](NUVersion, "versionWithString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v13 = CFSTR("Invalid identifier version");
      v14 = v11;
LABEL_13:
      +[NUError invalidError:object:](NUError, "invalidError:object:", v13, v14);
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
  }
  else
  {
    v12 = 0;
  }
  if (!v9)
  {
    objc_msgSend(a1, "defaultNamespace");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!v12)
  {
    objc_msgSend(a1, "defaultVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNamespace:name:version:", v9, v10, v12);

LABEL_14:
  return (NUIdentifier *)v15;
}

+ (BOOL)validateIdentifierString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  id v10;
  id v11;
  BOOL v12;
  const __CFString *v13;
  id v14;
  void *v15;
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
  id v49;
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
    NUAssertLogger_18492();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "string != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v18;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18492();
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
        v53 = v31;
        v54 = 2114;
        v55 = v35;
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
      v53 = v23;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUIdentifier validateIdentifierString:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 155, CFSTR("Invalid parameter not satisfying: %s"), v36, v37, v38, v39, (uint64_t)"string != nil");
  }
  if (!a4)
  {
    NUAssertLogger_18492();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v25;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18492();
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
        v53 = v40;
        v54 = 2114;
        v55 = v44;
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
      v53 = v30;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUIdentifier validateIdentifierString:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 156, CFSTR("Invalid parameter not satisfying: %s"), v45, v46, v47, v48, (uint64_t)"error != NULL");
  }
  v7 = v6;
  v50 = 0;
  v51 = 0;
  v49 = 0;
  v8 = objc_msgSend(a1, "validateIdentifierString:namespace:name:version:", v6, &v51, &v50, &v49);
  v9 = v51;
  v10 = v50;
  v11 = v49;
  if ((v8 & 1) == 0)
  {
    v13 = CFSTR("Malformed identifier string");
    v14 = v7;
LABEL_13:
    +[NUError invalidError:object:](NUError, "invalidError:object:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
    v12 = 0;
    *a4 = v15;
    goto LABEL_15;
  }
  if (v9 && (objc_msgSend(a1, "validateNamespace:", v9) & 1) == 0)
  {
    v13 = CFSTR("Malformed identifier namespace");
    v14 = v9;
    goto LABEL_13;
  }
  if (!v10)
  {
    +[NUError missingError:object:](NUError, "missingError:object:", CFSTR("Missing identifier name"), v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if ((objc_msgSend(a1, "validateName:", v10) & 1) == 0)
  {
    +[NUError mismatchError:object:](NUError, "mismatchError:object:", CFSTR("Malformed identifier name"), v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (v11 && !+[NUVersion validateVersionString:](NUVersion, "validateVersionString:", v11))
  {
    v13 = CFSTR("Malformed identifier version");
    v14 = v11;
    goto LABEL_13;
  }
  v12 = 1;
LABEL_15:

  return v12;
}

+ (BOOL)validateIdentifierString:(id)a3 namespace:(id *)a4 name:(id *)a5 version:(id *)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  NSObject *v24;
  void *v25;
  void *specific;
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
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (!v10)
  {
    NUAssertLogger_18492();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "string != nil");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v25;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18492();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v32 = (void *)MEMORY[0x1E0CB3978];
        v33 = v31;
        objc_msgSend(v32, "callStackSymbols");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v31;
        v42 = 2114;
        v43 = v35;
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
      v41 = v30;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUIdentifier validateIdentifierString:namespace:name:version:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 189, CFSTR("Invalid parameter not satisfying: %s"), v36, v37, v38, v39, (uint64_t)"string != nil");
  }
  v11 = v10;
  v12 = objc_msgSend(v10, "length");
  objc_msgSend(a1, "identifierRegularExpression");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstMatchInString:options:range:", v11, 0, 0, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && (objc_msgSend(v14, "range"), v12 == v15) && objc_msgSend(v14, "numberOfRanges") == 4)
  {
    v16 = objc_msgSend(v14, "rangeAtIndex:", 1);
    if (a4 && v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v11, "substringWithRange:", v16, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = objc_msgSend(v14, "rangeAtIndex:", 2);
    if (a5 && v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v11, "substringWithRange:", v18, v19);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v20 = objc_msgSend(v14, "rangeAtIndex:", 3);
    v22 = 1;
    if (a6 && v20 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v11, "substringWithRange:", v20, v21);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)identifierRegularExpression
{
  if (identifierRegularExpression_onceToken != -1)
    dispatch_once(&identifierRegularExpression_onceToken, &__block_literal_global_18572);
  return (id)identifierRegularExpression_regex;
}

+ (BOOL)validateNamespace:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  BOOL v12;
  NSObject *v14;
  void *v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_18492();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "string != nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v15;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18492();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v22 = (void *)MEMORY[0x1E0CB3978];
        v23 = v21;
        objc_msgSend(v22, "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v21;
        v32 = 2114;
        v33 = v25;
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
      v31 = v20;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUIdentifier validateNamespace:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 237, CFSTR("Invalid parameter not satisfying: %s"), v26, v27, v28, v29, (uint64_t)"string != nil");
  }
  v5 = v4;
  v6 = objc_msgSend(v4, "length");
  objc_msgSend(a1, "validNameSpaceRegularExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "rangeOfFirstMatchInString:options:range:", v5, 4, 0, v6);
  v10 = v9;

  if (v8)
    v11 = 0;
  else
    v11 = v10 == v6;
  v12 = v11;

  return v12;
}

+ (id)validNameSpaceRegularExpression
{
  if (validNameSpaceRegularExpression_onceToken != -1)
    dispatch_once(&validNameSpaceRegularExpression_onceToken, &__block_literal_global_51);
  return (id)validNameSpaceRegularExpression_regex;
}

+ (BOOL)validateName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  BOOL v12;
  NSObject *v14;
  void *v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_18492();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "string != nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v15;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18492();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v22 = (void *)MEMORY[0x1E0CB3978];
        v23 = v21;
        objc_msgSend(v22, "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v21;
        v32 = 2114;
        v33 = v25;
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
      v31 = v20;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUIdentifier validateName:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 259, CFSTR("Invalid parameter not satisfying: %s"), v26, v27, v28, v29, (uint64_t)"string != nil");
  }
  v5 = v4;
  v6 = objc_msgSend(v4, "length");
  objc_msgSend(a1, "validNameRegularExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "rangeOfFirstMatchInString:options:range:", v5, 4, 0, v6);
  v10 = v9;

  if (v8)
    v11 = 0;
  else
    v11 = v10 == v6;
  v12 = v11;

  return v12;
}

+ (id)validNameRegularExpression
{
  if (validNameRegularExpression_onceToken != -1)
    dispatch_once(&validNameRegularExpression_onceToken, &__block_literal_global_54);
  return (id)validNameRegularExpression_regex;
}

void __42__NUIdentifier_validNameRegularExpression__block_invoke()
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
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("[a-zA-Z][a-zA-Z0-9_]*"), 0, &v19);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v19;
  v2 = (void *)validNameRegularExpression_regex;
  validNameRegularExpression_regex = v0;

  if (!validNameRegularExpression_regex)
  {
    NUAssertLogger_18492();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create regular expression: %@"), v1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v4;
      _os_log_error_impl(&dword_1A6553000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18492();
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
    _NUAssertFailHandler((uint64_t)"+[NUIdentifier validNameRegularExpression]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 275, CFSTR("Failed to create regular expression: %@"), v15, v16, v17, v18, (uint64_t)v1);
  }

}

void __47__NUIdentifier_validNameSpaceRegularExpression__block_invoke()
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
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("[a-zA-Z][a-zA-Z0-9\\-]*(?:\\.[a-zA-Z][a-zA-Z0-9\\-]*){2,}"), 0, &v19);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v19;
  v2 = (void *)validNameSpaceRegularExpression_regex;
  validNameSpaceRegularExpression_regex = v0;

  if (!validNameSpaceRegularExpression_regex)
  {
    NUAssertLogger_18492();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create regular expression: %@"), v1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v4;
      _os_log_error_impl(&dword_1A6553000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18492();
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
    _NUAssertFailHandler((uint64_t)"+[NUIdentifier validNameSpaceRegularExpression]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 252, CFSTR("Failed to create regular expression: %@"), v15, v16, v17, v18, (uint64_t)v1);
  }

}

void __43__NUIdentifier_identifierRegularExpression__block_invoke()
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
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^(?:([A-Za-z.0-9]+):)?([A-Za-z0-9_]+)(?:~([0-9.]+))?"), 0, &v19);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v19;
  v2 = (void *)identifierRegularExpression_regex;
  identifierRegularExpression_regex = v0;

  if (!identifierRegularExpression_regex)
  {
    NUAssertLogger_18492();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create regular expression: %@"), v1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v4;
      _os_log_error_impl(&dword_1A6553000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18492();
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
    _NUAssertFailHandler((uint64_t)"+[NUIdentifier identifierRegularExpression]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUIdentifier.m", 230, CFSTR("Failed to create regular expression: %@"), v15, v16, v17, v18, (uint64_t)v1);
  }

}

@end
