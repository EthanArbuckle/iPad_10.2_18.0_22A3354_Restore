@implementation NURenderTransaction

- (NURenderTransaction)init
{
  NURenderTransaction *v2;
  NSMutableArray *v3;
  NSMutableArray *requests;
  dispatch_group_t v5;
  OS_dispatch_group *group;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NURenderTransaction;
  v2 = -[NURenderTransaction init](&v8, sel_init);
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  requests = v2->_requests;
  v2->_requests = v3;

  v5 = dispatch_group_create();
  group = v2->_group;
  v2->_group = (OS_dispatch_group *)v5;

  return v2;
}

- (BOOL)begin
{
  int64_t nestingLevel;
  NSObject *v4;
  void *v5;
  void *specific;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[12];
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  nestingLevel = self->_nestingLevel;
  if (nestingLevel < 0)
  {
    NUAssertLogger_18647();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unbalanced transaction begin/commit pairs"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v20 = 138543362;
      *(_QWORD *)&v20[4] = v5;
      _os_log_error_impl(&dword_1A6553000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v20, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18647();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v12 = (void *)MEMORY[0x1E0CB3978];
        v13 = v11;
        objc_msgSend(v12, "callStackSymbols");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v20 = 138543618;
        *(_QWORD *)&v20[4] = v11;
        v21 = 2114;
        v22 = v15;
        _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v20, 0x16u);

      }
    }
    else if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v20 = 138543362;
      *(_QWORD *)&v20[4] = v10;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v20, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderTransaction begin]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderTransaction.m", 132, CFSTR("Unbalanced transaction begin/commit pairs"), v16, v17, v18, v19, *(uint64_t *)v20);
  }
  self->_nestingLevel = nestingLevel + 1;
  if (!nestingLevel)
    dispatch_group_enter((dispatch_group_t)self->_group);
  return nestingLevel == 0;
}

- (BOOL)commit
{
  int64_t nestingLevel;
  int64_t v4;
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
  _BYTE v22[12];
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  nestingLevel = self->_nestingLevel;
  if (nestingLevel <= 0)
  {
    NUAssertLogger_18647();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unbalanced transaction begin/commit pairs"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18647();
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
        *(_DWORD *)v22 = 138543618;
        *(_QWORD *)&v22[4] = v13;
        v23 = 2114;
        v24 = v17;
        _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderTransaction commit]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderTransaction.m", 147, CFSTR("Unbalanced transaction begin/commit pairs"), v18, v19, v20, v21, *(uint64_t *)v22);
  }
  v4 = nestingLevel - 1;
  self->_nestingLevel = nestingLevel - 1;
  if (nestingLevel == 1)
  {
    -[NURenderTransaction flush](self, "flush");
    dispatch_group_leave((dispatch_group_t)self->_group);
  }
  return v4 == 0;
}

- (void)notifyCompletion:(id)a3 block:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *specific;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
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
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *queue;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  queue = a3;
  v6 = a4;
  if (!queue)
  {
    NUAssertLogger_18647();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "queue != nil");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v9;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18647();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v23 = (void *)MEMORY[0x1E0CB3978];
        v24 = v22;
        objc_msgSend(v23, "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v22;
        v43 = 2114;
        v44 = v26;
        _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v14;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderTransaction notifyCompletion:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderTransaction.m", 165, CFSTR("Invalid parameter not satisfying: %s"), v27, v28, v29, v30, (uint64_t)"queue != nil");
  }
  v7 = v6;
  if (!v6)
  {
    NUAssertLogger_18647();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "block != nil");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v16;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18647();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v17)
    {
      if (v19)
      {
        v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v32 = (void *)MEMORY[0x1E0CB3978];
        v33 = v31;
        objc_msgSend(v32, "callStackSymbols");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v31;
        v43 = 2114;
        v44 = v35;
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
      v42 = v21;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderTransaction notifyCompletion:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderTransaction.m", 166, CFSTR("Invalid parameter not satisfying: %s"), v36, v37, v38, v39, (uint64_t)"block != nil");
  }
  dispatch_group_notify((dispatch_group_t)self->_group, queue, v6);

}

- (void)submitRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *specific;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
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
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  objc_msgSend(v56, "responseQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    NUAssertLogger_18647();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot render without a response queue"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v8;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18647();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v29 = (void *)MEMORY[0x1E0CB3978];
        v30 = v28;
        objc_msgSend(v29, "callStackSymbols");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v58 = v28;
        v59 = 2114;
        v60 = v32;
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
      v58 = v13;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderTransaction submitRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderTransaction.m", 173, CFSTR("Cannot render without a response queue"), v33, v34, v35, v36, v55);
  }
  objc_msgSend(v56, "renderContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    NUAssertLogger_18647();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot render without a context"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v15;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18647();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (v16)
    {
      if (v18)
      {
        v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v38 = (void *)MEMORY[0x1E0CB3978];
        v39 = v37;
        objc_msgSend(v38, "callStackSymbols");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v58 = v37;
        v59 = 2114;
        v60 = v41;
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
      v58 = v20;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderTransaction submitRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderTransaction.m", 174, CFSTR("Cannot render without a context"), v42, v43, v44, v45, v55);
  }
  objc_msgSend(v56, "completionBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    NUAssertLogger_18647();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot render without a completion block"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v22;
      _os_log_error_impl(&dword_1A6553000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18647();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (v23)
    {
      if (v25)
      {
        v46 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v47 = (void *)MEMORY[0x1E0CB3978];
        v48 = v46;
        objc_msgSend(v47, "callStackSymbols");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "componentsJoinedByString:", CFSTR("\n"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v58 = v46;
        v59 = 2114;
        v60 = v50;
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
      v58 = v27;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NURenderTransaction submitRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderTransaction.m", 175, CFSTR("Cannot render without a completion block"), v51, v52, v53, v54, v55);
  }
  -[NSMutableArray addObject:](self->_requests, "addObject:", v56);

}

- (NSArray)pendingRequests
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_requests, "copy");
}

- (void)flush
{
  -[NURenderTransaction submitPendingRequests](self, "submitPendingRequests");
  -[NURenderTransaction resetPendingRequests](self, "resetPendingRequests");
}

- (void)submitPendingRequests
{
  void *v3;
  id v4;

  -[NURenderTransaction pendingRequests](self, "pendingRequests");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    +[NUScheduler sharedScheduler](NUScheduler, "sharedScheduler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "submitRequests:withGroup:", v4, self->_group);

  }
}

- (void)resetPendingRequests
{
  -[NSMutableArray removeAllObjects](self->_requests, "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

+ (id)currentTransaction
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("NURenderTransaction.current"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)setCurrentTransaction:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("NURenderTransaction.current"));
  else
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("NURenderTransaction.current"));

}

+ (id)ensureCurrentTransaction
{
  NURenderTransaction *v3;

  objc_msgSend(a1, "currentTransaction");
  v3 = (NURenderTransaction *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = objc_alloc_init(NURenderTransaction);
    objc_msgSend(a1, "setCurrentTransaction:", v3);
  }
  return v3;
}

+ (id)assertCurrentTransaction
{
  void *v2;
  NSObject *v4;
  void *v5;
  void *specific;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[12];
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "currentTransaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    NUAssertLogger_18647();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No current transaction"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v20 = 138543362;
      *(_QWORD *)&v20[4] = v5;
      _os_log_error_impl(&dword_1A6553000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v20, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18647();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v12 = (void *)MEMORY[0x1E0CB3978];
        v13 = v11;
        objc_msgSend(v12, "callStackSymbols");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v20 = 138543618;
        *(_QWORD *)&v20[4] = v11;
        v21 = 2114;
        v22 = v15;
        _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v20, 0x16u);

      }
    }
    else if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v20 = 138543362;
      *(_QWORD *)&v20[4] = v10;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v20, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NURenderTransaction assertCurrentTransaction]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderTransaction.m", 61, CFSTR("No current transaction"), v16, v17, v18, v19, *(uint64_t *)v20);
  }
  return v2;
}

+ (void)begin
{
  id v2;

  objc_msgSend(a1, "ensureCurrentTransaction");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "begin");

}

+ (void)commit
{
  id v3;

  objc_msgSend(a1, "assertCurrentTransaction");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_commit:", v3);

}

+ (void)_commit:(id)a3
{
  if (objc_msgSend(a3, "commit"))
    objc_msgSend(a1, "setCurrentTransaction:", 0);
}

+ (void)commitAndNotifyOnQueue:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "assertCurrentTransaction");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notifyCompletion:block:", v7, v6);

  objc_msgSend(a1, "_commit:", v8);
}

+ (void)group:(id)a3
{
  id v4;
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
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_18647();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "block != nil");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18647();
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
        v25 = v13;
        v26 = 2114;
        v27 = v17;
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
      v25 = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NURenderTransaction group:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderTransaction.m", 99, CFSTR("Invalid parameter not satisfying: %s"), v18, v19, v20, v21, (uint64_t)"block != nil");
  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __29__NURenderTransaction_group___block_invoke;
  v22[3] = &unk_1E50630D0;
  v23 = v4;
  v5 = v4;
  objc_msgSend(a1, "withCurrentTransaction:", v22);

}

+ (void)withCurrentTransaction:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
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
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_18647();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "block != nil");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v8;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_18647();
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
    _NUAssertFailHandler((uint64_t)"+[NURenderTransaction withCurrentTransaction:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderTransaction.m", 108, CFSTR("Invalid parameter not satisfying: %s"), v19, v20, v21, v22, (uint64_t)"block != nil");
  }
  v5 = (void (**)(_QWORD, _QWORD))v4;
  objc_msgSend(a1, "ensureCurrentTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "begin");
  ((void (**)(_QWORD, void *))v5)[2](v5, v6);
  objc_msgSend(a1, "_commit:", v6);

}

uint64_t __29__NURenderTransaction_group___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
