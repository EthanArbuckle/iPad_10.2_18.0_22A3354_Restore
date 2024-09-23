@implementation NUJobPriorityQueue

- (NUJobPriorityQueue)initWithName:(id)a3 owner:(id)a4 qos:(unsigned int)a5
{
  id v9;
  id v10;
  NUJobPriorityQueue *v11;
  NUJobPriorityQueue *v12;
  uint64_t v13;
  NSMutableArray *jobs;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *runQueue;
  id v21;
  const char *v22;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *stateQueue;
  objc_super v27;

  v9 = a3;
  v10 = a4;
  v27.receiver = self;
  v27.super_class = (Class)NUJobPriorityQueue;
  v11 = -[NUJobPriorityQueue init](&v27, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 256);
    jobs = v12->_jobs;
    v12->_jobs = (NSMutableArray *)v13;

    objc_storeWeak((id *)&v12->_owner, v10);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NUJobQueue.%@.run"), v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v16, (dispatch_qos_class_t)a5, 0);
    v17 = objc_claimAutoreleasedReturnValue();

    v18 = objc_retainAutorelease(v15);
    v19 = dispatch_queue_create((const char *)objc_msgSend(v18, "UTF8String"), v17);
    runQueue = v12->_runQueue;
    v12->_runQueue = (OS_dispatch_queue *)v19;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NUJobQueue.%@.state"), v9);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = (const char *)objc_msgSend(v21, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = dispatch_queue_create(v22, v23);
    stateQueue = v12->_stateQueue;
    v12->_stateQueue = (OS_dispatch_queue *)v24;

  }
  return v12;
}

- (NUJobPriorityQueue)init
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_61);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_61);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_61);
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
  _NUAssertFailHandler((uint64_t)"-[NUJobPriorityQueue init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUJobPriorityQueue.m", 43, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (id)description
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1717;
  v10 = __Block_byref_object_dispose__1718;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__NUJobPriorityQueue_description__block_invoke;
  v5[3] = &unk_1E5063FE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)addJob:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__NUJobPriorityQueue_addJob___block_invoke;
  block[3] = &unk_1E5063FB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

- (void)_addJob:(id)a3
{
  -[NSMutableArray addObject:](self->_jobs, "addObject:", a3);
  self->_needSort = 1;
}

- (BOOL)removeJob:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__NUJobPriorityQueue_removeJob___block_invoke;
  block[3] = &unk_1E5063868;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(stateQueue, block);
  LOBYTE(stateQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)stateQueue;
}

- (BOOL)_removeJob:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = -[NSMutableArray containsObject:](self->_jobs, "containsObject:", v4);
  if (v5)
    -[NSMutableArray removeObject:](self->_jobs, "removeObject:", v4);

  return v5;
}

- (id)popJob
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1717;
  v10 = __Block_byref_object_dispose__1718;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__NUJobPriorityQueue_popJob__block_invoke;
  v5[3] = &unk_1E5063FE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_popJob
{
  void *v3;

  -[NUJobPriorityQueue _sortIfNeeded](self, "_sortIfNeeded");
  -[NSMutableArray lastObject](self->_jobs, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeLastObject](self->_jobs, "removeLastObject");
  return v3;
}

- (int64_t)count
{
  NSObject *stateQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__NUJobPriorityQueue_count__block_invoke;
  v5[3] = &unk_1E5063FE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_sortIfNeeded
{
  if (self->_needSort)
  {
    -[NUJobPriorityQueue _sort](self, "_sort");
    self->_needSort = 0;
  }
}

- (void)_sort
{
  -[NSMutableArray sortUsingComparator:](self->_jobs, "sortUsingComparator:", &__block_literal_global_1715);
}

- (BOOL)start
{
  NSObject *stateQueue;
  BOOL v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__NUJobPriorityQueue_start__block_invoke;
  block[3] = &unk_1E50631E8;
  block[4] = self;
  block[5] = &v11;
  block[6] = &v7;
  dispatch_sync(stateQueue, block);
  if (*((_BYTE *)v8 + 24))
    -[NUJobPriorityQueue _startRunning](self, "_startRunning");
  if (*((_BYTE *)v12 + 24))
    v4 = 1;
  else
    v4 = *((_BYTE *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v4;
}

- (void)_startRunning
{
  NSObject *runQueue;
  _QWORD block[5];

  runQueue = self->_runQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__NUJobPriorityQueue__startRunning__block_invoke;
  block[3] = &unk_1E5064008;
  block[4] = self;
  dispatch_async(runQueue, block);
}

- (void)_run
{
  NSObject *stateQueue;
  id WeakRetained;
  _QWORD block[5];

  while (-[NUJobPriorityQueue _runNextJob](self, "_runNextJob"))
    ;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__NUJobPriorityQueue__run__block_invoke;
  block[3] = &unk_1E5064008;
  block[4] = self;
  dispatch_sync(stateQueue, block);
  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  objc_msgSend(WeakRetained, "finishedPriorityQueue:", self);

}

- (BOOL)_runNextJob
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *currentlyExecutingJobName;
  NSString *v11;

  v3 = (void *)MEMORY[0x1A85C1390](self, a2);
  -[NUJobPriorityQueue popJob](self, "popJob");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
    if (WeakRetained)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "request");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-j%llu"), v8, objc_msgSend(v4, "jobNumber"));
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      currentlyExecutingJobName = self->_currentlyExecutingJobName;
      self->_currentlyExecutingJobName = v9;

      dispatch_queue_set_specific((dispatch_queue_t)self->_runQueue, (const void *)NUCurrentlyExecutingJobNameKey, self->_currentlyExecutingJobName, 0);
      objc_msgSend(v4, "run:", objc_msgSend(WeakRetained, "stage"));
      v11 = self->_currentlyExecutingJobName;
      self->_currentlyExecutingJobName = 0;

      dispatch_queue_set_specific((dispatch_queue_t)self->_runQueue, (const void *)NUCurrentlyExecutingJobNameKey, 0, 0);
    }

  }
  objc_autoreleasePoolPop(v3);
  return v4 != 0;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_currentlyExecutingJobName, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_runQueue, 0);
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_jobs, 0);
}

uint64_t __26__NUJobPriorityQueue__run__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 56) = 0;
  return result;
}

uint64_t __35__NUJobPriorityQueue__startRunning__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

uint64_t __27__NUJobPriorityQueue_start__block_invoke(_QWORD *a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_BYTE *)(a1[4] + 56);
  result = objc_msgSend(*(id *)(a1[4] + 8), "count");
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result != 0;
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    *(_BYTE *)(a1[4] + 56) = 1;
  return result;
}

uint64_t __27__NUJobPriorityQueue__sort__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "priority");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "priority");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  if (!v8)
  {
    v9 = objc_msgSend(v4, "jobNumber");
    if (v9 < objc_msgSend(v5, "jobNumber"))
      v8 = 1;
    else
      v8 = -1;
  }

  return v8;
}

uint64_t __27__NUJobPriorityQueue_count__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __28__NUJobPriorityQueue_popJob__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_popJob");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __32__NUJobPriorityQueue_removeJob___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_removeJob:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __29__NUJobPriorityQueue_addJob___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addJob:", *(_QWORD *)(a1 + 40));
}

void __33__NUJobPriorityQueue_description__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 56))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@:%p> running = %@, jobCount = %ld"), v3, v4, v5, objc_msgSend(*(id *)(v4 + 8), "count"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

@end
