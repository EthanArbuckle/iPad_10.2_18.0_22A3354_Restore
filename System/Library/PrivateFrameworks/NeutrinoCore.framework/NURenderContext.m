@implementation NURenderContext

- (NURenderContext)init
{
  return -[NURenderContext initWithPurpose:](self, "initWithPurpose:", 0);
}

- (NURenderContext)initWithPurpose:(int64_t)a3
{
  NURenderContext *v4;
  uint64_t v5;
  NSPointerArray *jobs;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NURenderContext;
  v4 = -[NURenderContext init](&v10, sel_init);
  objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
  v5 = objc_claimAutoreleasedReturnValue();
  jobs = v4->_jobs;
  v4->_jobs = (NSPointerArray *)v5;

  v7 = dispatch_queue_create("NURenderContextNotification", 0);
  queue = v4->_queue;
  v4->_queue = (OS_dispatch_queue *)v7;

  v4->_purpose = a3;
  return v4;
}

- (NSArray)jobs
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__8275;
  v10 = __Block_byref_object_dispose__8276;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __23__NURenderContext_jobs__block_invoke;
  v5[3] = &unk_1E5063FE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (int64_t)jobCount
{
  NSObject *queue;
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
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__NURenderContext_jobCount__block_invoke;
  v5[3] = &unk_1E5063FE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_removeJob:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  if (-[NSPointerArray count](self->_jobs, "count"))
  {
    v4 = 0;
    while (-[NSPointerArray pointerAtIndex:](self->_jobs, "pointerAtIndex:", v4) != v5)
    {
      if (++v4 >= -[NSPointerArray count](self->_jobs, "count"))
        goto LABEL_7;
    }
    -[NSPointerArray removePointerAtIndex:](self->_jobs, "removePointerAtIndex:", v4);
  }
LABEL_7:
  -[NSMutableArray removeObject:](self->_rateLimitedJobs, "removeObject:", v5);
  objc_msgSend(v5, "removeObserver:", self);

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
  block[2] = __29__NURenderContext_removeJob___block_invoke;
  block[3] = &unk_1E5063FB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)addJob:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *queue;
  id v7;
  OS_dispatch_queue *v8;
  _QWORD v9[4];
  id v10;
  id location;
  _QWORD block[5];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__NURenderContext_addJob___block_invoke;
  block[3] = &unk_1E5063FB8;
  block[4] = self;
  v7 = v4;
  v13 = v7;
  dispatch_sync(queue, block);
  objc_initWeak(&location, self);
  v8 = self->_queue;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __26__NURenderContext_addJob___block_invoke_2;
  v9[3] = &unk_1E50617F8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v7, "addStageObserver:queue:block:", self, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)_cancelAllJobs
{
  NSPointerArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_jobs;
  v3 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "cancel", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)cancelAllJobs
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__NURenderContext_cancelAllJobs__block_invoke;
  block[3] = &unk_1E5064008;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)cancelAllRequests
{
  id v3;

  +[NUScheduler sharedScheduler](NUScheduler, "sharedScheduler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelJobsForRenderContext:", self);

}

- (void)enqueueRateLimitedJob:(id)a3
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
  block[2] = __41__NURenderContext_enqueueRateLimitedJob___block_invoke;
  block[3] = &unk_1E5063FB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)_enqueueRateLimitedJob:(id)a3
{
  id v4;
  NSMutableArray *rateLimitedJobs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  rateLimitedJobs = self->_rateLimitedJobs;
  v8 = v4;
  if (!rateLimitedJobs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_rateLimitedJobs;
    self->_rateLimitedJobs = v6;

    v4 = v8;
    rateLimitedJobs = self->_rateLimitedJobs;
  }
  -[NSMutableArray addObject:](rateLimitedJobs, "addObject:", v4);

}

- (id)dequeueRateLimitedJob
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__8275;
  v10 = __Block_byref_object_dispose__8276;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__NURenderContext_dequeueRateLimitedJob__block_invoke;
  v5[3] = &unk_1E5063FE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_dequeueRateLimitedJob
{
  void *v3;

  -[NSMutableArray firstObject](self->_rateLimitedJobs, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[NSMutableArray removeObjectAtIndex:](self->_rateLimitedJobs, "removeObjectAtIndex:", 0);
  return v3;
}

- (void)updateNextRenderTimeFromTime:(unint64_t)a3
{
  double v5;

  -[NURenderContext minimumRenderInterval](self, "minimumRenderInterval");
  -[NURenderContext setNextRenderTime:](self, "setNextRenderTime:", dispatch_time(a3, (uint64_t)(v5 * 1000000000.0)));
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = objc_opt_class();
  v5 = -[NURenderContext shouldCoalesceUpdates](self, "shouldCoalesceUpdates");
  -[NURenderContext minimumRenderInterval](self, "minimumRenderInterval");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> coalescing=%d minimumRenderInterval=%0.3f rateLimitJobs=%lu\n"), v4, self, v5, v6, -[NSMutableArray count](self->_rateLimitedJobs, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NURenderContext jobs](self, "jobs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "appendFormat:", CFSTR("\t%@\n"), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  return v7;
}

- (double)minimumRenderInterval
{
  return self->_minimumRenderInterval;
}

- (void)setMinimumRenderInterval:(double)a3
{
  self->_minimumRenderInterval = a3;
}

- (BOOL)shouldCoalesceUpdates
{
  return self->_shouldCoalesceUpdates;
}

- (void)setShouldCoalesceUpdates:(BOOL)a3
{
  self->_shouldCoalesceUpdates = a3;
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (NURenderNode)lastPrepareNode
{
  return (NURenderNode *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLastPrepareNode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NURenderNode)lastRenderNode
{
  return (NURenderNode *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLastRenderNode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (unint64_t)nextRenderTime
{
  return self->_nextRenderTime;
}

- (void)setNextRenderTime:(unint64_t)a3
{
  self->_nextRenderTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRenderNode, 0);
  objc_storeStrong((id *)&self->_lastPrepareNode, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_rateLimitedJobs, 0);
  objc_storeStrong((id *)&self->_jobs, 0);
}

void __40__NURenderContext_dequeueRateLimitedJob__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_dequeueRateLimitedJob");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __41__NURenderContext_enqueueRateLimitedJob___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enqueueRateLimitedJob:", *(_QWORD *)(a1 + 40));
}

uint64_t __32__NURenderContext_cancelAllJobs__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelAllJobs");
}

uint64_t __26__NURenderContext_addJob___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "compact");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addPointer:", *(_QWORD *)(a1 + 40));
}

void __26__NURenderContext_addJob___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  if (a3 == 6)
  {
    v3 = (id *)(a1 + 32);
    v4 = a2;
    WeakRetained = objc_loadWeakRetained(v3);
    objc_msgSend(WeakRetained, "_jobFinished:", v4);

  }
}

uint64_t __29__NURenderContext_removeJob___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeJob:", *(_QWORD *)(a1 + 40));
}

uint64_t __27__NURenderContext_jobCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __23__NURenderContext_jobs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
