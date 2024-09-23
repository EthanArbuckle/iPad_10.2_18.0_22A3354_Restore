@implementation NUScheduler

- (NUScheduler)initWithName:(id)a3
{
  NSString *v4;
  NUScheduler *v5;
  id v6;
  const char *v7;
  NSString *name;
  NSString *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  NUJobQueue *v13;
  NUJobQueue *prepareQueue;
  NUJobQueue *v15;
  NUJobQueue *renderQueue;
  NUJobQueue *v17;
  NUJobQueue *completeQueue;
  NSMutableSet *v19;
  NSMutableSet *scheduledContextWakeups;
  NUScheduledQueue *v21;
  NUScheduledQueue *rateLimiterQueue;
  objc_super v24;

  v4 = (NSString *)a3;
  v24.receiver = self;
  v24.super_class = (Class)NUScheduler;
  v5 = -[NUScheduler init](&v24, sel_init);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NUScheduler-%@"), v4);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (const char *)objc_msgSend(v6, "cStringUsingEncoding:", 1);

  name = v5->_name;
  v5->_name = v4;
  v9 = v4;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_queue_create(v7, v10);
  queue = v5->_queue;
  v5->_queue = (OS_dispatch_queue *)v11;

  v13 = -[NUJobQueue initWithStage:name:]([NUJobQueue alloc], "initWithStage:name:", 1, v9);
  prepareQueue = v5->_prepareQueue;
  v5->_prepareQueue = v13;

  v15 = -[NUJobQueue initWithStage:name:]([NUJobQueue alloc], "initWithStage:name:", 4, v9);
  renderQueue = v5->_renderQueue;
  v5->_renderQueue = v15;

  v17 = -[NUJobQueue initWithStage:name:]([NUJobQueue alloc], "initWithStage:name:", 5, v9);
  completeQueue = v5->_completeQueue;
  v5->_completeQueue = v17;

  v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  scheduledContextWakeups = v5->_scheduledContextWakeups;
  v5->_scheduledContextWakeups = v19;

  v21 = objc_alloc_init(NUScheduledQueue);
  rateLimiterQueue = v5->_rateLimiterQueue;
  v5->_rateLimiterQueue = v21;

  return v5;
}

- (void)submitRequests:(id)a3 withGroup:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__NUScheduler_submitRequests_withGroup___block_invoke;
  block[3] = &unk_1E5062E88;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_group_async(v9, queue, block);

}

- (id)_queueForStage:(int64_t)a3
{
  uint64_t v3;

  switch(a3)
  {
    case 1:
      v3 = 16;
      break;
    case 5:
      v3 = 32;
      break;
    case 4:
      v3 = 24;
      break;
    default:
      return 0;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (void)_enqueueJobsForRequests:(id)a3 withGroup:(id)a4
{
  id v6;
  id v7;
  dispatch_time_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = dispatch_time(0, 0);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "newRenderJob");
        -[NUScheduler _observeRenderJob:withGroup:](self, "_observeRenderJob:withGroup:", v14, v7);
        objc_msgSend(v14, "setReplyGroup:", v7);
        if (-[NUScheduler _prepareNewJob:at:](self, "_prepareNewJob:at:", v14, v8))
        {
          objc_msgSend(v17, "addObject:", v14);
        }
        else
        {
          objc_msgSend(v14, "pause");
          objc_msgSend(v14, "request");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "renderContext");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NUScheduler _scheduleRateLimitWakeupForContext:](self, "_scheduleRateLimitWakeupForContext:", v16);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  -[NUJobQueue addJobs:](self->_prepareQueue, "addJobs:", v17);
}

- (void)_wakeupRateLimitJobForContext:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSMutableSet removeObject:](self->_scheduledContextWakeups, "removeObject:", v6);
  objc_msgSend(v6, "dequeueRateLimitedJob");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "resume");
    objc_msgSend(v6, "updateNextRenderTimeFromTime:", objc_msgSend(v6, "nextRenderTime"));
    -[NUScheduler _scheduleRateLimitWakeupForContext:](self, "_scheduleRateLimitWakeupForContext:", v6);
  }
  else
  {
    objc_msgSend(v6, "setNextRenderTime:", 0);
  }

}

- (void)_scheduleRateLimitWakeupForContext:(id)a3
{
  id v4;
  NUScheduledQueue *rateLimiterQueue;
  uint64_t v6;
  OS_dispatch_queue *queue;
  _QWORD v8[4];
  id v9;
  id v10;
  id from;
  id location;

  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_scheduledContextWakeups, "containsObject:", v4) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_scheduledContextWakeups, "addObject:", v4);
    objc_initWeak(&location, self);
    objc_initWeak(&from, v4);
    rateLimiterQueue = self->_rateLimiterQueue;
    v6 = objc_msgSend(v4, "nextRenderTime");
    queue = self->_queue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__NUScheduler__scheduleRateLimitWakeupForContext___block_invoke;
    v8[3] = &unk_1E5062658;
    objc_copyWeak(&v9, &from);
    objc_copyWeak(&v10, &location);
    -[NUScheduledQueue dispatchAt:queue:block:](rateLimiterQueue, "dispatchAt:queue:block:", v6, queue, v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

}

- (void)_observeRenderJob:(id)a3 withGroup:(id)a4
{
  NSObject *v6;
  id v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  NSObject *v10;
  OS_dispatch_queue *v11;
  _QWORD v12[5];
  _QWORD v13[4];
  NSObject *v14;
  NUScheduler *v15;

  v6 = a4;
  v7 = a3;
  dispatch_group_enter(v6);
  queue = self->_queue;
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __43__NUScheduler__observeRenderJob_withGroup___block_invoke;
  v13[3] = &unk_1E5062680;
  v14 = v6;
  v15 = self;
  v10 = v6;
  objc_msgSend(v7, "addStageObserver:queue:block:", self, queue, v13);
  v11 = self->_queue;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __43__NUScheduler__observeRenderJob_withGroup___block_invoke_2;
  v12[3] = &unk_1E50626A8;
  v12[4] = self;
  objc_msgSend(v7, "addCancelObserver:queue:block:", self, v11, v12);

}

- (void)_enqueueDependentJobsForRenderJob:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *queue;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD block[4];
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  objc_msgSend(v17, "dependentJobs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = dispatch_group_create();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v10);
        dispatch_group_enter(v5);
        objc_msgSend(v11, "replyGroup");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NUScheduler _observeRenderJob:withGroup:](self, "_observeRenderJob:withGroup:", v11, v12);

        objc_msgSend(v11, "replyGroup");
        v13 = objc_claimAutoreleasedReturnValue();
        queue = self->_queue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __49__NUScheduler__enqueueDependentJobsForRenderJob___block_invoke;
        block[3] = &unk_1E5064008;
        v21 = v5;
        dispatch_group_notify(v13, queue, block);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

  v15 = self->_queue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __49__NUScheduler__enqueueDependentJobsForRenderJob___block_invoke_2;
  v18[3] = &unk_1E5063FB8;
  v18[4] = self;
  v19 = v17;
  v16 = v17;
  dispatch_group_notify(v5, v15, v18);
  -[NUJobQueue addJobs:](self->_prepareQueue, "addJobs:", v6);

}

- (void)_resumeRenderJob:(id)a3
{
  -[NUScheduler _enqueueRenderJob:toStage:](self, "_enqueueRenderJob:toStage:", a3, 1);
}

- (void)_enqueueRenderJob:(id)a3 toStage:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[NUScheduler _queueForStage:](self, "_queueForStage:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addJob:", v6);

}

- (void)cancelJobsForRenderContext:(id)a3
{
  id v4;
  NSObject *queue;
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
  _QWORD block[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_14463();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "context != nil");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v7;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14463();
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
        v26 = v13;
        v27 = 2114;
        v28 = v17;
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
      v26 = v12;
      _os_log_error_impl(&dword_1A6553000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUScheduler cancelJobsForRenderContext:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUScheduler.m", 228, CFSTR("Invalid parameter not satisfying: %s"), v18, v19, v20, v21, (uint64_t)"context != nil");
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__NUScheduler_cancelJobsForRenderContext___block_invoke;
  block[3] = &unk_1E5064008;
  v24 = v4;
  v22 = v4;
  dispatch_sync(queue, block);

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
  -[NUJobQueue debugDescription](self->_prepareQueue, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUJobQueue debugDescription](self->_renderQueue, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUJobQueue debugDescription](self->_completeQueue, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> prepare = %@\nrender = %@\ncomplete = %@"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_rateLimiterQueue, 0);
  objc_storeStrong((id *)&self->_scheduledContextWakeups, 0);
  objc_storeStrong((id *)&self->_completeQueue, 0);
  objc_storeStrong((id *)&self->_renderQueue, 0);
  objc_storeStrong((id *)&self->_prepareQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __42__NUScheduler_cancelJobsForRenderContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelAllJobs");
}

void __49__NUScheduler__enqueueDependentJobsForRenderJob___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __49__NUScheduler__enqueueDependentJobsForRenderJob___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resumeRenderJob:", *(_QWORD *)(a1 + 40));
}

void __43__NUScheduler__observeRenderJob_withGroup___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = v5;
  if (a3 == 3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_enqueueDependentJobsForRenderJob:", v5);
  }
  else
  {
    if (a3 == 6)
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
      v5 = v6;
    }
    objc_msgSend(*(id *)(a1 + 40), "_enqueueRenderJob:toStage:", v5, a3);
  }

}

void __43__NUScheduler__observeRenderJob_withGroup___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "_queueForStage:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeJob:", v5);

}

void __50__NUScheduler__scheduleRateLimitWakeupForContext___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v2, "_wakeupRateLimitJobForContext:", WeakRetained);

  }
}

uint64_t __40__NUScheduler_submitRequests_withGroup___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enqueueJobsForRequests:withGroup:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (id)sharedScheduler
{
  void *v2;
  void *v3;

  +[NUFactory sharedFactory](NUFactory, "sharedFactory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_prepareNewJob:(id)a3 at:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  int v11;
  void *v12;
  int v13;
  BOOL v15;

  v6 = a3;
  objc_msgSend(v6, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "renderContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "minimumRenderInterval");
  v10 = v9;
  v11 = v9 != 0.0;
  if (objc_msgSend(v8, "shouldCoalesceUpdates"))
  {
    objc_msgSend(v8, "jobs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NUScheduler _coalesceJobs:](self, "_coalesceJobs:", v12);

    v11 = (v10 != 0.0) & ~v13;
  }
  objc_msgSend(v8, "addJob:", v6);
  if (v10 == 0.0 || v11 == 0)
    goto LABEL_10;
  if (objc_msgSend(v8, "nextRenderTime") <= a4)
  {
    objc_msgSend(v8, "updateNextRenderTimeFromTime:", a4);
LABEL_10:
    v15 = 1;
    goto LABEL_11;
  }
  objc_msgSend(v8, "enqueueRateLimitedJob:", v6);
  v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)_coalesceJobs:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  int v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  int v11;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "currentStage");
      v11 = v7 | ((unint64_t)(v10 - 1) > 1);
      if ((v7 & 1) != 0 || (unint64_t)(v10 - 1) <= 1)
      {
        if (objc_msgSend(v9, "cancelCoalescedJob"))
          v6 |= v10 != 2;
        else
          v11 = 1;
      }

      v7 = v11;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6 & 1;
}

@end
