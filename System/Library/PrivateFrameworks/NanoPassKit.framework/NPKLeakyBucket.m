@implementation NPKLeakyBucket

- (NPKLeakyBucket)initWithEventsTimeInterval:(double)a3 maxBucketSize:(unint64_t)a4 description:(id)a5
{
  id v8;
  NPKLeakyBucket *v9;
  uint64_t v10;
  NSString *description;
  NSMutableArray *v12;
  NSMutableArray *events;
  objc_super v15;

  v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NPKLeakyBucket;
  v9 = -[NPKLeakyBucket init](&v15, sel_init);
  if (v9)
  {
    if (a3 <= 0.0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Leak time interval must be bigger than 0.0"));
    v9->_lock._os_unfair_lock_opaque = 0;
    v9->_eventsTimeInterval = a3;
    v9->_maxBucketSize = a4;
    v10 = objc_msgSend(v8, "copy");
    description = v9->_description;
    v9->_description = (NSString *)v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    events = v9->_events;
    v9->_events = v12;

  }
  return v9;
}

+ (id)throttleWithEventsTimeInterval:(double)a3 description:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEventsTimeInterval:maxBucketSize:description:", 0, v5, a3);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_eventTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)NPKLeakyBucket;
  -[NPKLeakyBucket dealloc](&v3, sel_dealloc);
}

- (BOOL)addEvent:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  id v6;
  _QWORD *v7;
  _QWORD v9[2];
  void (*v10)(uint64_t);
  void *v11;
  NPKLeakyBucket *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  p_lock = &self->_lock;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v10 = __27__NPKLeakyBucket_addEvent___block_invoke;
  v11 = &unk_24CFEA460;
  v12 = self;
  v6 = v4;
  v13 = v6;
  v14 = &v15;
  v7 = v9;
  os_unfair_lock_lock(p_lock);
  v10((uint64_t)v7);

  os_unfair_lock_unlock(p_lock);
  LOBYTE(p_lock) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)p_lock;
}

void __27__NPKLeakyBucket_addEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  v3 = *(_QWORD *)(a1 + 32);
  if (v2
    || (v10 = *(void **)(v3 + 24)) != 0
    && (objc_msgSend(v10, "timeIntervalSinceNow"), v3 = *(_QWORD *)(a1 + 32), *(double *)(v3 + 48) >= -v11))
  {
    if ((unint64_t)objc_msgSend(*(id *)(v3 + 8), "count") >= *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      pk_General_log();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

      if (v20)
      {
        pk_General_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = *(_QWORD *)(a1 + 32);
          v23 = *(_QWORD *)(v22 + 56);
          v24 = *(_QWORD *)(v22 + 16);
          v25 = 134218242;
          v26 = v23;
          v27 = 2112;
          v28 = v24;
          _os_log_impl(&dword_213518000, v21, OS_LOG_TYPE_DEFAULT, "Notice: Reach size limit of:%lu, dropping income event, bucket:%@", (uint8_t *)&v25, 0x16u);
        }

      }
    }
    else
    {
      pk_General_log();
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

      if (v5)
      {
        pk_General_log();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
          v25 = 138412290;
          v26 = v7;
          _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Added event to bucket: %@", (uint8_t *)&v25, 0xCu);
        }

      }
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      v9 = (void *)MEMORY[0x2199B6780](*(_QWORD *)(a1 + 40));
      objc_msgSend(v8, "addObject:", v9);

      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count") == 1)
        objc_msgSend(*(id *)(a1 + 32), "_insideLock_scheduleNextEventLeakFromReferenceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    }
  }
  else
  {
    pk_General_log();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      pk_General_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
        v25 = 138412290;
        v26 = v15;
        _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Leaking event immediately bucket: %@", (uint8_t *)&v25, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 24);
    *(_QWORD *)(v17 + 24) = v16;

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)flush
{
  os_unfair_lock_s *p_lock;
  _QWORD v3[5];

  p_lock = &self->_lock;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __23__NPKLeakyBucket_flush__block_invoke;
  v3[3] = &unk_24CFE7998;
  v3[4] = self;
  os_unfair_lock_lock(&self->_lock);
  __23__NPKLeakyBucket_flush__block_invoke((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __23__NPKLeakyBucket_flush__block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 24))
  {
    v1 = result;
    pk_General_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      pk_General_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(*(_QWORD *)(v1 + 32) + 16);
        v10 = 138412290;
        v11 = v5;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Flush bucket:%@", (uint8_t *)&v10, 0xCu);
      }

    }
    v6 = *(_QWORD *)(v1 + 32);
    v7 = *(void **)(v6 + 24);
    *(_QWORD *)(v6 + 24) = 0;

    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 32), "invalidate");
    v8 = *(_QWORD *)(v1 + 32);
    v9 = *(void **)(v8 + 32);
    *(_QWORD *)(v8 + 32) = 0;

    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 8), "removeAllObjects");
  }
  return result;
}

- (void)_insideLock_scheduleNextEventLeakFromReferenceDate:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSString *v9;
  NSObject *v10;
  uint64_t v11;
  NSString *description;
  void *v13;
  double v14;
  double v15;
  void *v16;
  NSTimer *v17;
  NSTimer *eventTimer;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  NSString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_eventTimer == 0;
  pk_General_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    if (v7)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = -[NSMutableArray count](self->_events, "count");
        description = self->_description;
        *(_DWORD *)buf = 134218242;
        v22 = v11;
        v23 = 2112;
        v24 = description;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Scheduling event, pending events:%lu at bucket: %@", buf, 0x16u);
      }

    }
    objc_initWeak((id *)buf, self);
    objc_msgSend(v4, "dateByAddingTimeInterval:", self->_eventsTimeInterval);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceNow");
    v15 = v14;
    v16 = (void *)MEMORY[0x24BDBCF40];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __69__NPKLeakyBucket__insideLock_scheduleNextEventLeakFromReferenceDate___block_invoke;
    v19[3] = &unk_24CFEBEB8;
    objc_copyWeak(&v20, (id *)buf);
    v19[4] = self;
    objc_msgSend(v16, "scheduledTimerWithTimeInterval:repeats:block:", 0, v19, v15);
    v17 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    eventTimer = self->_eventTimer;
    self->_eventTimer = v17;

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else if (v7)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_description;
      *(_DWORD *)buf = 138412290;
      v22 = (uint64_t)v9;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Warning: events timer exist, we will not schedule a new one at bucket:%@", buf, 0xCu);
    }

  }
}

void __69__NPKLeakyBucket__insideLock_scheduleNextEventLeakFromReferenceDate___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(void **)&WeakRetained[8]._os_unfair_lock_opaque;
    *(_QWORD *)&WeakRetained[8]._os_unfair_lock_opaque = 0;

    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      pk_General_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
        *(_DWORD *)buf = 134218242;
        v12 = v8;
        v13 = 2112;
        v14 = v9;
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Scheduled eventfire, pending events:%lu at bucket: %@", buf, 0x16u);
      }

    }
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __69__NPKLeakyBucket__insideLock_scheduleNextEventLeakFromReferenceDate___block_invoke_7;
    v10[3] = &unk_24CFE7998;
    v10[4] = v3;
    os_unfair_lock_lock(v3 + 10);
    __69__NPKLeakyBucket__insideLock_scheduleNextEventLeakFromReferenceDate___block_invoke_7((uint64_t)v10);
    os_unfair_lock_unlock(v3 + 10);
  }

}

void __69__NPKLeakyBucket__insideLock_scheduleNextEventLeakFromReferenceDate___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void (**v5)(void);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "firstObject");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 24);
    *(_QWORD *)(v3 + 24) = v2;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectAtIndex:", 0);
    v5[2]();
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count"))
    objc_msgSend(*(id *)(a1 + 32), "_insideLock_scheduleNextEventLeakFromReferenceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

}

- (double)eventsTimeInterval
{
  return self->_eventsTimeInterval;
}

- (unint64_t)maxBucketSize
{
  return self->_maxBucketSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventTimer, 0);
  objc_storeStrong((id *)&self->_lastLeakedEventDate, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end
