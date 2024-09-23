@implementation NUScheduledQueue

- (NUScheduledQueue)init
{
  id v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  dispatch_source_t v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NUScheduledQueue;
  v2 = -[NUScheduledQueue init](&v15, sel_init);
  *((_OWORD *)v2 + 2) = xmmword_1A671A4D0;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("NUScheduledQueue", v3);
  v5 = (void *)*((_QWORD *)v2 + 1);
  *((_QWORD *)v2 + 1) = v4;

  v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v2 + 1));
  v7 = (void *)*((_QWORD *)v2 + 2);
  *((_QWORD *)v2 + 2) = v6;

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = (void *)*((_QWORD *)v2 + 3);
  *((_QWORD *)v2 + 3) = v8;

  objc_initWeak(&location, v2);
  v10 = *((_QWORD *)v2 + 2);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __24__NUScheduledQueue_init__block_invoke;
  v12[3] = &unk_1E5063BE0;
  objc_copyWeak(&v13, &location);
  dispatch_source_set_event_handler(v10, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return (NUScheduledQueue *)v2;
}

- (void)dealloc
{
  objc_super v3;

  if (!-[NSMutableArray count](self->_items, "count"))
    dispatch_resume((dispatch_object_t)self->_timer);
  v3.receiver = self;
  v3.super_class = (Class)NUScheduledQueue;
  -[NUScheduledQueue dealloc](&v3, sel_dealloc);
}

- (void)_scheduleTimer:(unint64_t)a3
{
  NSObject *timer;
  double v5;

  timer = self->_timer;
  -[NUScheduledQueue timerLeeway](self, "timerLeeway");
  dispatch_source_set_timer(timer, a3, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v5 * 1000000000.0));
}

- (void)_startTimer
{
  dispatch_resume((dispatch_object_t)self->_timer);
}

- (void)_stopTimer
{
  dispatch_suspend((dispatch_object_t)self->_timer);
}

- (void)_timerFired
{
  double v3;

  -[NUScheduledQueue timerCoalesce](self, "timerCoalesce");
  -[NUScheduledQueue _dispatchItemsThrough:](self, "_dispatchItemsThrough:", NUDispatchSeconds(v3));
}

- (void)_dispatchItemsThrough:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (-[NSMutableArray count](self->_items, "count"))
  {
    -[NSMutableArray firstObject](self->_items, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dispatch");

    v6 = -[NSMutableArray count](self->_items, "count");
    if (v6 < 2)
    {
      v8 = 1;
    }
    else
    {
      v7 = v6;
      v8 = 1;
      while (1)
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "scheduledTime") > a3)
          break;
        ++v8;
        objc_msgSend(v9, "dispatch");

        if (v7 == v8)
        {
          v8 = v7;
          goto LABEL_9;
        }
      }

    }
LABEL_9:
    -[NSMutableArray removeObjectsInRange:](self->_items, "removeObjectsInRange:", 0, v8);
  }
  -[NSMutableArray firstObject](self->_items, "firstObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
    -[NUScheduledQueue _scheduleTimer:](self, "_scheduleTimer:", objc_msgSend(v10, "scheduledTime"));
  else
    -[NUScheduledQueue _stopTimer](self, "_stopTimer");

}

- (void)dispatchAfter:(double)a3 queue:(id)a4 block:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a4;
  -[NUScheduledQueue dispatchAt:queue:block:](self, "dispatchAt:queue:block:", NUDispatchSeconds(a3), v9, v8);

}

- (void)dispatchAt:(unint64_t)a3 queue:(id)a4 block:(id)a5
{
  id v8;
  NUScheduledItem *v9;
  NSObject *queue;
  NUScheduledItem *v11;
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
  id v44;
  _QWORD block[5];
  NUScheduledItem *v46;
  unint64_t v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v44 = a4;
  v8 = a5;
  if (!v44)
  {
    NUAssertLogger_24216();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "queue != nil");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v13;
      _os_log_error_impl(&dword_1A6553000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24216();
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
        v49 = v26;
        v50 = 2114;
        v51 = v30;
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
      v49 = v18;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUScheduledQueue dispatchAt:queue:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUScheduledQueue.m", 152, CFSTR("Invalid parameter not satisfying: %s"), v31, v32, v33, v34, (uint64_t)"queue != nil");
  }
  if (!v8)
  {
    NUAssertLogger_24216();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "block != nil");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v20;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_24216();
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
        v49 = v35;
        v50 = 2114;
        v51 = v39;
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
      v49 = v25;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUScheduledQueue dispatchAt:queue:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUScheduledQueue.m", 153, CFSTR("Invalid parameter not satisfying: %s"), v40, v41, v42, v43, (uint64_t)"block != nil");
  }
  v9 = -[NUScheduledItem initWithScheduledTime:queue:block:]([NUScheduledItem alloc], "initWithScheduledTime:queue:block:", a3, v44, v8);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__NUScheduledQueue_dispatchAt_queue_block___block_invoke;
  block[3] = &unk_1E5063C48;
  block[4] = self;
  v46 = v9;
  v47 = a3;
  v11 = v9;
  dispatch_sync(queue, block);

}

- (double)timerLeeway
{
  return self->_timerLeeway;
}

- (void)setTimerLeeway:(double)a3
{
  self->_timerLeeway = a3;
}

- (double)timerCoalesce
{
  return self->_timerCoalesce;
}

- (void)setTimerCoalesce:(double)a3
{
  self->_timerCoalesce = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __43__NUScheduledQueue_dispatchAt_queue_block___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v2 = objc_msgSend(v3, "indexOfObject:inSortedRange:options:usingComparator:", *(_QWORD *)(a1 + 40), 0, objc_msgSend(v3, "count"), 1024, &__block_literal_global_24231);
  objc_msgSend(v3, "insertObject:atIndex:", *(_QWORD *)(a1 + 40), v2);
  if (!v2)
    objc_msgSend(*(id *)(a1 + 32), "_scheduleTimer:", *(_QWORD *)(a1 + 48));
  if (objc_msgSend(v3, "count") == 1)
    objc_msgSend(*(id *)(a1 + 32), "_startTimer");

}

uint64_t __43__NUScheduledQueue_dispatchAt_queue_block___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __24__NUScheduledQueue_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_timerFired");

}

@end
