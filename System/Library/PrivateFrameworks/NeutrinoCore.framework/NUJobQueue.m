@implementation NUJobQueue

- (NUJobQueue)initWithStage:(int64_t)a3 name:(id)a4
{
  NSString *v6;
  NUJobQueue *v7;
  NSString *name;
  NSString *v9;
  id v10;
  const char *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  void *v15;
  unint64_t v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  NUJobPriorityQueue *v20;
  NUJobPriorityQueue *interactiveQueue;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  NUJobPriorityQueue *v26;
  NUJobPriorityQueue *initiatedQueue;
  objc_super v29;

  v6 = (NSString *)a4;
  v29.receiver = self;
  v29.super_class = (Class)NUJobQueue;
  v7 = -[NUJobQueue init](&v29, sel_init);
  name = v7->_name;
  v7->_name = v6;
  v9 = v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NUJobQueue-%@"), v9);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (const char *)objc_msgSend(v10, "cStringUsingEncoding:", 1);

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_queue_create(v11, v12);
  queue = v7->_queue;
  v7->_queue = (OS_dispatch_queue *)v13;

  v15 = (void *)MEMORY[0x1E0CB3940];
  v16 = a3 - 1;
  if ((unint64_t)(a3 - 1) > 5)
    v17 = CFSTR("None");
  else
    v17 = off_1E50632C0[v16];
  v18 = v17;
  objc_msgSend(v15, "stringWithFormat:", CFSTR("Interactive_%@"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[NUJobPriorityQueue initWithName:owner:qos:]([NUJobPriorityQueue alloc], "initWithName:owner:qos:", v19, v7, 33);
  interactiveQueue = v7->_interactiveQueue;
  v7->_interactiveQueue = v20;

  v22 = (void *)MEMORY[0x1E0CB3940];
  if (v16 > 5)
    v23 = CFSTR("None");
  else
    v23 = off_1E50632C0[v16];
  v24 = v23;
  objc_msgSend(v22, "stringWithFormat:", CFSTR("Initiated_%@"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = -[NUJobPriorityQueue initWithName:owner:qos:]([NUJobPriorityQueue alloc], "initWithName:owner:qos:", v25, v7, 25);
  initiatedQueue = v7->_initiatedQueue;
  v7->_initiatedQueue = v26;

  v7->_stage = a3;
  return v7;
}

- (NUJobQueue)init
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_11497);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_11497);
      goto LABEL_8;
    }
    if (v8 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_11497);
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
  _NUAssertFailHandler((uint64_t)"-[NUJobQueue init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUJobQueue.m", 49, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v22, v23, v24, v25, v21);
}

- (id)description
{
  unint64_t v3;
  __CFString *v4;
  __CFString *v5;
  int64_t v6;
  int64_t v7;
  void *v8;

  v3 = self->_stage - 1;
  if (v3 > 5)
    v4 = CFSTR("None");
  else
    v4 = off_1E50632C0[v3];
  v5 = v4;
  v6 = -[NUJobPriorityQueue count](self->_interactiveQueue, "count");
  v7 = -[NUJobPriorityQueue count](self->_initiatedQueue, "count");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> - name: %@ stage: %@ interactive: %ld jobs, initiated: %ld jobs"), objc_opt_class(), self, self->_name, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  NSString *name;
  unint64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  name = self->_name;
  v6 = self->_stage - 1;
  if (v6 > 5)
    v7 = CFSTR("None");
  else
    v7 = off_1E50632C0[v6];
  v8 = v7;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> name: %@, stage %@, interactive queue: %@, initiated queue: %@"), v4, self, name, v8, self->_interactiveQueue, self->_initiatedQueue);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)addJob:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__NUJobQueue_addJob___block_invoke;
  block[3] = &unk_1E5063FB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)addJobs:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__NUJobQueue_addJobs___block_invoke;
  block[3] = &unk_1E5063FB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)_addJob:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  _QWORD v16[2];
  _QWORD v17[4];
  _QWORD v18[2];

  v4 = a3;
  -[NUJobQueue _incrementGroupLevel](self, "_incrementGroupLevel");
  objc_msgSend(v4, "priority");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "level") == 3)
  {

  }
  else
  {
    objc_msgSend(v4, "priority");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "level");

    if (v7 != 2)
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_53_11502);
      if (!os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
      {
        v11 = 16;
        goto LABEL_15;
      }
      objc_msgSend(v4, "request");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "voucher");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __22__NUJobQueue__addJob___block_invoke_18;
      v15 = &unk_1E5063FB8;
      v10 = (id *)v16;
      v16[0] = v4;
      v16[1] = self;
      NULogAdoptVoucher(v9, &v12);
      v11 = 16;
      goto LABEL_13;
    }
  }
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_53_11502);
  if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "voucher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __22__NUJobQueue__addJob___block_invoke;
    v17[3] = &unk_1E5063FB8;
    v10 = (id *)v18;
    v18[0] = v4;
    v18[1] = self;
    NULogAdoptVoucher(v9, v17);
    v11 = 24;
LABEL_13:

    goto LABEL_15;
  }
  v11 = 24;
LABEL_15:
  objc_msgSend(*(id *)((char *)&self->super.isa + v11), "addJob:", v4, v12, v13, v14, v15);
  -[NUJobQueue _decrementGroupLevel](self, "_decrementGroupLevel");

}

- (void)_removeJob:(id)a3
{
  NUJobPriorityQueue *interactiveQueue;
  id v5;

  interactiveQueue = self->_interactiveQueue;
  v5 = a3;
  -[NUJobPriorityQueue removeJob:](interactiveQueue, "removeJob:", v5);
  -[NUJobPriorityQueue removeJob:](self->_initiatedQueue, "removeJob:", v5);

}

- (void)removeJob:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__NUJobQueue_removeJob___block_invoke;
  block[3] = &unk_1E5063FB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)_addJobs:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NUJobQueue _incrementGroupLevel](self, "_incrementGroupLevel");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[NUJobQueue _addJob:](self, "_addJob:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[NUJobQueue _decrementGroupLevel](self, "_decrementGroupLevel");
}

- (void)_incrementGroupLevel
{
  int64_t updateGroupLevel;
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
  _BYTE v19[12];
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  updateGroupLevel = self->_updateGroupLevel;
  self->_updateGroupLevel = updateGroupLevel + 1;
  if (updateGroupLevel <= -2)
  {
    NUAssertLogger_11486();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unbalanced transaction begin/commit pairs"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v19 = 138543362;
      *(_QWORD *)&v19[4] = v4;
      _os_log_error_impl(&dword_1A6553000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v19, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_11486();
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
        *(_DWORD *)v19 = 138543618;
        *(_QWORD *)&v19[4] = v10;
        v20 = 2114;
        v21 = v14;
        _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v19, 0x16u);

      }
    }
    else if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v19 = 138543362;
      *(_QWORD *)&v19[4] = v9;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v19, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUJobQueue _incrementGroupLevel]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUJobQueue.m", 130, CFSTR("Unbalanced transaction begin/commit pairs"), v15, v16, v17, v18, *(uint64_t *)v19);
  }
}

- (void)_decrementGroupLevel
{
  int64_t updateGroupLevel;
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
  _BYTE v19[12];
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  updateGroupLevel = self->_updateGroupLevel;
  self->_updateGroupLevel = updateGroupLevel - 1;
  if (updateGroupLevel <= 0)
  {
    NUAssertLogger_11486();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unbalanced transaction begin/commit pairs"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v19 = 138543362;
      *(_QWORD *)&v19[4] = v4;
      _os_log_error_impl(&dword_1A6553000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v19, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_11486();
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
        *(_DWORD *)v19 = 138543618;
        *(_QWORD *)&v19[4] = v10;
        v20 = 2114;
        v21 = v14;
        _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v19, 0x16u);

      }
    }
    else if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v19 = 138543362;
      *(_QWORD *)&v19[4] = v9;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v19, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUJobQueue _decrementGroupLevel]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUJobQueue.m", 136, CFSTR("Unbalanced transaction begin/commit pairs"), v15, v16, v17, v18, *(uint64_t *)v19);
  }
  if (updateGroupLevel == 1)
    -[NUJobQueue _startRunningIfNeeded](self, "_startRunningIfNeeded");
}

- (void)_startRunningIfNeeded
{
  if (!-[NUJobPriorityQueue start](self->_interactiveQueue, "start"))
    -[NUJobPriorityQueue start](self->_initiatedQueue, "start");
}

- (void)finishedPriorityQueue:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__NUJobQueue_finishedPriorityQueue___block_invoke;
  block[3] = &unk_1E5063FB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)_finishedPriorityQueue:(id)a3
{
  NUJobPriorityQueue *v4;
  NUJobPriorityQueue *v5;

  v4 = (NUJobPriorityQueue *)a3;
  if (self->_interactiveQueue == v4 && !self->_updateGroupLevel)
  {
    v5 = v4;
    -[NUJobPriorityQueue start](self->_initiatedQueue, "start");
    v4 = v5;
  }

}

- (int64_t)stage
{
  return self->_stage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_initiatedQueue, 0);
  objc_storeStrong((id *)&self->_interactiveQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __36__NUJobQueue_finishedPriorityQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishedPriorityQueue:", *(_QWORD *)(a1 + 40));
}

uint64_t __24__NUJobQueue_removeJob___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeJob:", *(_QWORD *)(a1 + 40));
}

void __22__NUJobQueue__addJob___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  __CFString *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_53_11502);
  v2 = (void *)_NUScheduleLogger;
  if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    v6 = objc_msgSend(v3, "stage");
    if ((unint64_t)(v6 - 1) > 5)
      v7 = CFSTR("None");
    else
      v7 = off_1E50632C0[v6 - 1];
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 32), "priority");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "order");
    v11 = 134218498;
    v12 = v4;
    v13 = 2114;
    v14 = v8;
    v15 = 2048;
    v16 = v10;
    _os_log_debug_impl(&dword_1A6553000, v5, OS_LOG_TYPE_DEBUG, "job %p stage %{public}@ schedule low, %f", (uint8_t *)&v11, 0x20u);

  }
}

void __22__NUJobQueue__addJob___block_invoke_18(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  __CFString *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_53_11502);
  v2 = (void *)_NUScheduleLogger;
  if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    v6 = objc_msgSend(v3, "stage");
    if ((unint64_t)(v6 - 1) > 5)
      v7 = CFSTR("None");
    else
      v7 = off_1E50632C0[v6 - 1];
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 32), "priority");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "order");
    v11 = 134218498;
    v12 = v4;
    v13 = 2114;
    v14 = v8;
    v15 = 2048;
    v16 = v10;
    _os_log_debug_impl(&dword_1A6553000, v5, OS_LOG_TYPE_DEBUG, "job %p stage %{public}@ schedule high, %f", (uint8_t *)&v11, 0x20u);

  }
}

uint64_t __22__NUJobQueue_addJobs___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addJobs:", *(_QWORD *)(a1 + 40));
}

uint64_t __21__NUJobQueue_addJob___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addJob:", *(_QWORD *)(a1 + 40));
}

@end
