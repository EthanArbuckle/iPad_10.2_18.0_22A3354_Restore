@implementation NURenderer

- (NURenderer)init
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_18765);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_18765);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_18765);
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
  _NUAssertFailHandler((uint64_t)"-[NURenderer init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 118, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (NURenderer)initWithCIContext:(id)a3 priority:(int64_t)a4
{
  CIContext *v6;
  CIContext *v7;
  NURenderer *v8;
  CIContext *context;
  CIContext *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_qos_class_t v13;
  NSObject *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  id v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *queue;
  NSObject *v23;
  void *v24;
  void *specific;
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
  objc_super v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = (CIContext *)a3;
  if (!v6)
  {
    NUAssertLogger_18745();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "context != nil");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v24;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18745();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v31 = (void *)MEMORY[0x1E0CB3978];
        v32 = v30;
        objc_msgSend(v31, "callStackSymbols");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v30;
        v42 = 2114;
        v43 = v34;
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
      v41 = v29;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderer initWithCIContext:priority:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 123, CFSTR("Invalid parameter not satisfying: %s"), v35, v36, v37, v38, (uint64_t)"context != nil");
  }
  v7 = v6;
  v39.receiver = self;
  v39.super_class = (Class)NURenderer;
  v8 = -[NURenderer init](&v39, sel_init);
  context = v8->_context;
  v8->_context = v7;
  v10 = v7;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((unint64_t)a4 > 3)
    v13 = QOS_CLASS_UNSPECIFIED;
  else
    v13 = dword_1A671A4E0[a4];
  dispatch_queue_attr_make_with_qos_class(v11, v13, 0);
  v14 = objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB3940];
  if ((unint64_t)a4 > 3)
    v16 = 0;
  else
    v16 = off_1E50610B0[a4];
  v17 = v16;
  objc_msgSend(v15, "stringWithFormat:", CFSTR("NURendererQueue-%@"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_retainAutorelease(v18);
  v20 = dispatch_queue_create((const char *)objc_msgSend(v19, "UTF8String"), v14);
  queue = v8->_queue;
  v8->_queue = (OS_dispatch_queue *)v20;

  return v8;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NURenderer name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderer context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "workingFormat");
  -[NURenderer context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - fmt=%d, spc=%@"), v4, v6, objc_msgSend(v7, "workingColorSpace"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)name
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_18765);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_18765);
      goto LABEL_8;
    }
    if (v8 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_18765);
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
  _NUAssertFailHandler((uint64_t)"-[NURenderer name]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 145, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v22, v23, v24, v25, v21);
}

- (id)renderImage:(id)a3 rect:(id *)a4 toDestination:(id)a5 atPoint:(id)a6 error:(id *)a7
{
  int64_t var1;
  int64_t var0;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *queue;
  $0AC6E346AE4835514AAA8AC86D8F4844 v21;
  void *v22;
  id v23;
  NSObject *v25;
  void *v26;
  void *specific;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  _BOOL4 v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  _BOOL4 v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  _QWORD block[5];
  id v122;
  id v123;
  _BYTE *v124;
  uint64_t *v125;
  $0AC6E346AE4835514AAA8AC86D8F4844 v126;
  $0AC6E346AE4835514AAA8AC86D8F4844 v127;
  int64_t v128;
  int64_t v129;
  uint64_t v130;
  uint64_t *v131;
  uint64_t v132;
  uint64_t (*v133)(uint64_t, uint64_t);
  void (*v134)(uint64_t);
  id v135;
  _BYTE buf[24];
  uint64_t (*v137)(uint64_t, uint64_t);
  void (*v138)(uint64_t);
  id v139;
  uint64_t v140;

  var1 = a6.var1;
  var0 = a6.var0;
  v140 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  if (!a7)
  {
    NUAssertLogger_18745();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v26;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18745();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        v67 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v68 = (void *)MEMORY[0x1E0CB3978];
        v69 = v67;
        objc_msgSend(v68, "callStackSymbols");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "componentsJoinedByString:", CFSTR("\n"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v67;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v71;
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
      *(_QWORD *)&buf[4] = v31;
      _os_log_error_impl(&dword_1A6553000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderer renderImage:rect:toDestination:atPoint:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 150, CFSTR("Invalid parameter not satisfying: %s"), v72, v73, v74, v75, (uint64_t)"error != NULL");
  }
  if (!v13)
  {
    NUAssertLogger_18745();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "image != nil");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v33;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v34 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18745();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (v34)
    {
      if (v36)
      {
        v76 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v77 = (void *)MEMORY[0x1E0CB3978];
        v78 = v76;
        objc_msgSend(v77, "callStackSymbols");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "componentsJoinedByString:", CFSTR("\n"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v76;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v80;
        _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v36)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v38;
      _os_log_error_impl(&dword_1A6553000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderer renderImage:rect:toDestination:atPoint:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 151, CFSTR("Invalid parameter not satisfying: %s"), v81, v82, v83, v84, (uint64_t)"image != nil");
  }
  if (var0 < 0)
  {
    NUAssertLogger_18745();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "point.x >= 0");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v40;
      _os_log_error_impl(&dword_1A6553000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18745();
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
    if (v41)
    {
      if (v43)
      {
        v85 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v86 = (void *)MEMORY[0x1E0CB3978];
        v87 = v85;
        objc_msgSend(v86, "callStackSymbols");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "componentsJoinedByString:", CFSTR("\n"));
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v85;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v89;
        _os_log_error_impl(&dword_1A6553000, v42, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v43)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v45;
      _os_log_error_impl(&dword_1A6553000, v42, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderer renderImage:rect:toDestination:atPoint:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 152, CFSTR("Invalid parameter not satisfying: %s"), v90, v91, v92, v93, (uint64_t)"point.x >= 0");
  }
  if (var1 < 0)
  {
    NUAssertLogger_18745();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "point.y >= 0");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v47;
      _os_log_error_impl(&dword_1A6553000, v46, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18745();
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
    if (v48)
    {
      if (v50)
      {
        v94 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v95 = (void *)MEMORY[0x1E0CB3978];
        v96 = v94;
        objc_msgSend(v95, "callStackSymbols");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "componentsJoinedByString:", CFSTR("\n"));
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v94;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v98;
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
      *(_QWORD *)&buf[4] = v52;
      _os_log_error_impl(&dword_1A6553000, v49, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderer renderImage:rect:toDestination:atPoint:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 153, CFSTR("Invalid parameter not satisfying: %s"), v99, v100, v101, v102, (uint64_t)"point.y >= 0");
  }
  v15 = v14;
  v16 = a4->var1.var0 + var0;
  if (v16 > objc_msgSend(v14, "width"))
  {
    NUAssertLogger_18745();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "point.x + rect.size.width <= (NSInteger)destination.width");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v54;
      _os_log_error_impl(&dword_1A6553000, v53, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v55 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18745();
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = os_log_type_enabled(v56, OS_LOG_TYPE_ERROR);
    if (v55)
    {
      if (v57)
      {
        v103 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v104 = (void *)MEMORY[0x1E0CB3978];
        v105 = v103;
        objc_msgSend(v104, "callStackSymbols");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "componentsJoinedByString:", CFSTR("\n"));
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v103;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v107;
        _os_log_error_impl(&dword_1A6553000, v56, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v57)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "componentsJoinedByString:", CFSTR("\n"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v59;
      _os_log_error_impl(&dword_1A6553000, v56, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderer renderImage:rect:toDestination:atPoint:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 154, CFSTR("Invalid parameter not satisfying: %s"), v108, v109, v110, v111, (uint64_t)"point.x + rect.size.width <= (NSInteger)destination.width");
  }
  v17 = a4->var1.var1 + var1;
  if (v17 > objc_msgSend(v15, "height"))
  {
    NUAssertLogger_18745();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "point.y + rect.size.height <= (NSInteger)destination.height");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v61;
      _os_log_error_impl(&dword_1A6553000, v60, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v62 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18745();
    v63 = objc_claimAutoreleasedReturnValue();
    v64 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);
    if (v62)
    {
      if (v64)
      {
        v112 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v113 = (void *)MEMORY[0x1E0CB3978];
        v114 = v112;
        objc_msgSend(v113, "callStackSymbols");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "componentsJoinedByString:", CFSTR("\n"));
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v112;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v116;
        _os_log_error_impl(&dword_1A6553000, v63, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v64)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "componentsJoinedByString:", CFSTR("\n"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v66;
      _os_log_error_impl(&dword_1A6553000, v63, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderer renderImage:rect:toDestination:atPoint:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 155, CFSTR("Invalid parameter not satisfying: %s"), v117, v118, v119, v120, (uint64_t)"point.y + rect.size.height <= (NSInteger)destination.height");
  }
  if (v15)
  {
    objc_msgSend(v15, "label");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");

    if (!v19)
      objc_msgSend(v15, "setLabel:", CFSTR("NURenderer-unnamed"));
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v137 = __Block_byref_object_copy__18844;
    v138 = __Block_byref_object_dispose__18845;
    v139 = 0;
    v130 = 0;
    v131 = &v130;
    v132 = 0x3032000000;
    v133 = __Block_byref_object_copy__18844;
    v134 = __Block_byref_object_dispose__18845;
    v135 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__NURenderer_renderImage_rect_toDestination_atPoint_error___block_invoke;
    block[3] = &unk_1E5063118;
    v124 = buf;
    block[4] = self;
    v122 = v13;
    v21 = a4->var1;
    v126 = a4->var0;
    v127 = v21;
    v128 = var0;
    v129 = var1;
    v123 = v15;
    v125 = &v130;
    dispatch_sync(queue, block);
    v22 = (void *)v131[5];
    if (v22)
      *a7 = objc_retainAutorelease(v22);
    v23 = *(id *)(*(_QWORD *)&buf[8] + 40);

    _Block_object_dispose(&v130, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    +[NUError failureError:object:](NUError, "failureError:object:", CFSTR("nil CIRenderDestination"), 0);
    v23 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

- (id)imageForSurface:(id)a3 options:(id)a4
{
  id v5;
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
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
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
  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    NUAssertLogger_18745();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "surface != nil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18745();
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
        v27 = v17;
        v28 = 2114;
        v29 = v21;
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
      v27 = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderer imageForSurface:options:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 197, CFSTR("Invalid parameter not satisfying: %s"), v22, v23, v24, v25, (uint64_t)"surface != nil");
  }
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithIOSurface:options:", objc_msgSend(v5, "IOSurfaceRef"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)renderDestinationForSurface:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v7;
  void *v8;
  void *specific;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    NUAssertLogger_18745();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "surface != nil");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v8;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18745();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v15 = (void *)MEMORY[0x1E0CB3978];
        v16 = v14;
        objc_msgSend(v15, "callStackSymbols");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v14;
        v25 = 2114;
        v26 = v18;
        _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v13;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderer renderDestinationForSurface:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderer.m", 207, CFSTR("Invalid parameter not satisfying: %s"), v19, v20, v21, v22, (uint64_t)"surface != nil");
  }
  v4 = v3;
  v5 = (void *)objc_msgSend(v3, "newRenderDestination");
  objc_msgSend(v5, "setLabel:", CFSTR("NURenderer-surface"));

  return v5;
}

- (CIContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __59__NURenderer_renderImage_rect_toDestination_atPoint_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  id obj;
  uint8_t buf[4];
  double v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!+[NUGlobalSettings logPeakRenderCIUsuage](NUGlobalSettings, "logPeakRenderCIUsuage"))
  {
    v20 = a1[5];
    v21 = *(void **)(a1[4] + 16);
    v22 = (double)(uint64_t)a1[9];
    v23 = (double)(uint64_t)a1[10];
    v24 = (double)(uint64_t)a1[11];
    v25 = (double)(uint64_t)a1[12];
    v26 = a1[6];
    v27 = (double)(uint64_t)a1[13];
    v28 = (double)(uint64_t)a1[14];
    v29 = *(_QWORD *)(a1[8] + 8);
    v34 = *(id *)(v29 + 40);
    objc_msgSend(v21, "startTaskToRender:fromRect:toDestination:atPoint:error:", v20, v26, &v34, v22, v23, v24, v25, v27, v28);
    v30 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v29 + 40), v34);
    v31 = *(_QWORD *)(a1[7] + 8);
    v32 = *(void **)(v31 + 40);
    *(_QWORD *)(v31 + 40) = v30;
LABEL_9:

    return;
  }
  objc_msgSend(MEMORY[0x1E0C9DD98], "resetStatistics");
  v2 = a1[5];
  v3 = *(void **)(a1[4] + 16);
  v4 = (double)(uint64_t)a1[9];
  v5 = (double)(uint64_t)a1[10];
  v6 = (double)(uint64_t)a1[11];
  v7 = (double)(uint64_t)a1[12];
  v8 = a1[6];
  v9 = (double)(uint64_t)a1[13];
  v10 = (double)(uint64_t)a1[14];
  v11 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v11 + 40);
  objc_msgSend(v3, "startTaskToRender:fromRect:toDestination:atPoint:error:", v2, v8, &obj, v4, v5, v6, v7, v9, v10);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v11 + 40), obj);
  v13 = *(_QWORD *)(a1[7] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  v15 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
  if (!v15)
    return;
  v16 = (id *)(*(_QWORD *)(a1[8] + 8) + 40);
  v35 = 0;
  objc_msgSend(v15, "nu_waitUntilCompletedAndReturnError:", &v35);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v16, v35);

  if (!v17)
  {
    v33 = *(_QWORD *)(a1[7] + 8);
    v32 = *(void **)(v33 + 40);
    *(_QWORD *)(v33 + 40) = 0;
    goto LABEL_9;
  }
  v18 = objc_msgSend(MEMORY[0x1E0C9DD98], "peakNonVolatileSize");
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_165_18849);
  v19 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v38 = (double)v18 * 0.0009765625 * 0.0009765625;
    _os_log_impl(&dword_1A6553000, v19, OS_LOG_TYPE_INFO, "++++ PEAK +++ %f Mb", buf, 0xCu);
  }
}

+ (NURenderer)rendererWithMetalDevice:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  NUMetalRenderer *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[NUMetalRenderer initWithMetalDevice:options:]([NUMetalRenderer alloc], "initWithMetalDevice:options:", v6, v5);

  return (NURenderer *)v7;
}

+ (id)defaultRenderContextOptions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7[0] = *MEMORY[0x1E0C9DFC0];
  v8[0] = objc_msgSend(a1, "workingColorSpace");
  v7[1] = *MEMORY[0x1E0C9DFC8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a1, "workingFormat"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = *MEMORY[0x1E0C9DF48];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "allowClampToAlpha"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (CGColorSpace)workingColorSpace
{
  void *v2;
  CGColorSpace *v3;

  if (+[NUGlobalSettings rendererUseP3Linear](NUGlobalSettings, "rendererUseP3Linear"))
    +[NUColorSpace displayP3LinearColorSpace](NUColorSpace, "displayP3LinearColorSpace");
  else
    +[NUColorSpace sRGBLinearColorSpace](NUColorSpace, "sRGBLinearColorSpace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (CGColorSpace *)objc_msgSend(v2, "CGColorSpace");

  return v3;
}

+ (int)workingFormat
{
  _BOOL4 v2;
  int *v3;

  v2 = +[NUGlobalSettings rendererUseHalfFloat](NUGlobalSettings, "rendererUseHalfFloat");
  v3 = (int *)MEMORY[0x1E0C9E080];
  if (!v2)
    v3 = (int *)MEMORY[0x1E0C9E000];
  return *v3;
}

+ (BOOL)defaultUseHalfFloat
{
  return 1;
}

+ (BOOL)allowClampToAlpha
{
  return +[NUGlobalSettings rendererClampToAlpha](NUGlobalSettings, "rendererClampToAlpha");
}

+ (id)_renderContextOptionsWithOptions:(id)a3 nameSuffix:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "defaultRenderContextOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(0, "objectForKeyedSubscript:", *MEMORY[0x1E0C9DFA8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = CFSTR("NULow%@");
  else
    v11 = CFSTR("NUHigh%@");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("kCIContextName"));
  v13 = (void *)MEMORY[0x1E0CB37E8];
  +[NUGlobalSettings HLGOpticalScale](NUGlobalSettings, "HLGOpticalScale");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("kCIContextHLGOpticalScale"));

  if (v6)
    objc_msgSend(v9, "addEntriesFromDictionary:", v6);

  return v9;
}

@end
