@implementation EDUpdateThrottler

uint64_t __39__EDUpdateThrottler__registerInstance___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObject:", *(_QWORD *)(a1 + 32));
}

void __64__EDUpdateThrottler_updateWithBlock_unacknowledgedUpdatesCount___block_invoke(uint64_t a1)
{
  id v2;
  os_unfair_lock_s *v3;
  id v4;
  char *WeakRetained;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = (os_unfair_lock_s *)(WeakRetained + 8);
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
    objc_msgSend(*((id *)WeakRetained + 2), "removeObject:", v2);
    if (objc_msgSend(*((id *)WeakRetained + 2), "count"))
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99D68]);
      objc_msgSend(WeakRetained, "setLastAcknowledgementDate:", v4);

      os_unfair_lock_unlock(v3);
    }
    else
    {
      objc_msgSend(WeakRetained, "setLastAcknowledgementDate:", 0);
      objc_msgSend(WeakRetained, "hasChangesSinceLastUpdate");
      os_unfair_lock_unlock(v3);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }

}

- (void)setLastAcknowledgementDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastAcknowledgementDate, a3);
}

- (BOOL)hasChangesSinceLastUpdate
{
  return self->_hasChangesSinceLastUpdate;
}

- (id)updateWithBlock:(id)a3 unacknowledgedUpdatesCount:(unint64_t *)a4
{
  id v6;
  unint64_t v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  int64_t v18;
  void *v19;
  id v20;
  int64_t v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id from;
  id location;

  v6 = a3;
  os_unfair_lock_lock(&self->_updatesLock);
  v7 = -[NSMutableArray count](self->_unacknowledgedUpdates, "count");
  if (v7)
  {
    -[EDUpdateThrottler delayInterval](self, "delayInterval");
    v9 = v8 * pow((double)-[EDUpdateThrottler scalingFactor](self, "scalingFactor"), (double)v7 + -1.0);
  }
  else
  {
    v9 = 0.0;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  -[EDUpdateThrottler lastUpdateDate](self, "lastUpdateDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ef_timeIntervalSinceDate:", v11);
  v13 = v12;

  if (v13 >= v9)
  {
    -[EDUpdateThrottler name](self, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[EDUpdateThrottler name](self, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[EDUpdateThrottler updateCounter](self, "updateCounter");
      -[EDUpdateThrottler setUpdateCounter:](self, "setUpdateCounter:", v18 + 1);
      v19 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("%@ %ld"), v17, v18);

    }
    else
    {
      v20 = objc_alloc(MEMORY[0x1E0CB3940]);
      v21 = -[EDUpdateThrottler updateCounter](self, "updateCounter");
      -[EDUpdateThrottler setUpdateCounter:](self, "setUpdateCounter:", v21 + 1);
      v19 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("%ld"), v21);
    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EED0]), "initWithLabel:", v19);
    -[NSMutableArray addObject:](self->_unacknowledgedUpdates, "addObject:", v14);
    -[EDUpdateThrottler setLastUpdateDate:](self, "setLastUpdateDate:", v10);
    -[EDUpdateThrottler setHasChangesSinceLastUpdate:](self, "setHasChangesSinceLastUpdate:", 0);
    -[EDUpdateThrottler resumeClientDebouncer](self, "resumeClientDebouncer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "debounceResult:", v23);

  }
  else
  {
    -[EDUpdateThrottler setHasChangesSinceLastUpdate:](self, "setHasChangesSinceLastUpdate:", 1);
    v14 = 0;
  }

  os_unfair_lock_unlock(&self->_updatesLock);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, v14);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __64__EDUpdateThrottler_updateWithBlock_unacknowledgedUpdatesCount___block_invoke;
  v26[3] = &unk_1E94A3490;
  objc_copyWeak(&v28, &location);
  objc_copyWeak(&v29, &from);
  v24 = v6;
  v27 = v24;
  objc_msgSend(v14, "addInvocationBlock:", v26);
  if (a4)
    *a4 = v7;

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v14;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)updateCounter
{
  return self->_updateCounter;
}

- (void)setUpdateCounter:(int64_t)a3
{
  self->_updateCounter = a3;
}

- (void)setLastUpdateDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdateDate, a3);
}

- (void)setHasChangesSinceLastUpdate:(BOOL)a3
{
  self->_hasChangesSinceLastUpdate = a3;
}

- (EFDebouncer)resumeClientDebouncer
{
  return self->_resumeClientDebouncer;
}

- (NSDate)lastUpdateDate
{
  return self->_lastUpdateDate;
}

void __30__EDUpdateThrottler_instances__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0D1EEF0]);
  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithObject:");
  v2 = (void *)instances_instances;
  instances_instances = v1;

}

- (EDUpdateThrottler)initWithName:(id)a3 delayInterval:(double)a4 scalingFactor:(int64_t)a5
{
  id v8;
  EDUpdateThrottler *v9;
  uint64_t v10;
  NSString *name;
  NSMutableArray *v12;
  NSMutableArray *unacknowledgedUpdates;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EDUpdateThrottler;
  v9 = -[EDUpdateThrottler init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    name = v9->_name;
    v9->_name = (NSString *)v10;

    v9->_delayInterval = a4;
    v9->_scalingFactor = a5;
    v9->_updatesLock._os_unfair_lock_opaque = 0;
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    unacknowledgedUpdates = v9->_unacknowledgedUpdates;
    v9->_unacknowledgedUpdates = v12;

    objc_msgSend((id)objc_opt_class(), "_registerInstance:", v9);
  }

  return v9;
}

+ (void)_registerInstance:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "instances");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__EDUpdateThrottler__registerInstance___block_invoke;
  v7[3] = &unk_1E94A01D0;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performWhileLocked:", v7);

}

+ (void)resetAllInstances
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__42;
  v16 = __Block_byref_object_dispose__42;
  v17 = 0;
  objc_msgSend(a1, "instances");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __38__EDUpdateThrottler_resetAllInstances__block_invoke;
  v11[3] = &unk_1E94A3440;
  v11[4] = &v12;
  objc_msgSend(v2, "performWhileLocked:", v11);

  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v3 = (id)v13[5];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_reset", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v18, 16);
    }
    while (v4);
  }

  _Block_object_dispose(&v12, 8);
}

- (void)_reset
{
  os_unfair_lock_s *p_updatesLock;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_updatesLock = &self->_updatesLock;
  os_unfair_lock_lock(&self->_updatesLock);
  v4 = (void *)-[NSMutableArray copy](self->_unacknowledgedUpdates, "copy");
  os_unfair_lock_unlock(p_updatesLock);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "invoke", (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

+ (EFLocked)instances
{
  if (instances_onceToken != -1)
    dispatch_once(&instances_onceToken, &__block_literal_global_83);
  return (EFLocked *)(id)instances_instances;
}

void __38__EDUpdateThrottler_resetAllInstances__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "setRepresentation");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (EDUpdateThrottler)initWithName:(id)a3 delayInterval:(double)a4 resumable:(id)a5
{
  id v8;
  id v9;
  EDUpdateThrottler *v10;
  uint64_t v11;
  NSString *name;
  uint64_t v13;
  EFScheduler *resumeClientScheduler;
  id v15;
  EFScheduler *v16;
  uint64_t v17;
  EFDebouncer *resumeClientDebouncer;
  _QWORD v20[4];
  id v21;

  v8 = a3;
  v9 = a5;
  v10 = -[EDUpdateThrottler initWithDelayInterval:scalingFactor:](self, "initWithDelayInterval:scalingFactor:", 1, a4);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    name = v10->_name;
    v10->_name = (NSString *)v11;

    objc_storeStrong((id *)&v10->_resumable, a5);
    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:", CFSTR("com.apple.EmailDaemon.EDUpdateThrotller.resumeClientScheduler"));
    v13 = objc_claimAutoreleasedReturnValue();
    resumeClientScheduler = v10->_resumeClientScheduler;
    v10->_resumeClientScheduler = (EFScheduler *)v13;

    v15 = objc_alloc(MEMORY[0x1E0D1EEA0]);
    v16 = v10->_resumeClientScheduler;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __58__EDUpdateThrottler_initWithName_delayInterval_resumable___block_invoke;
    v20[3] = &unk_1E94A3468;
    v21 = v9;
    v17 = objc_msgSend(v15, "initWithTimeInterval:scheduler:startAfter:block:", v16, 0, v20, a4);
    resumeClientDebouncer = v10->_resumeClientDebouncer;
    v10->_resumeClientDebouncer = (EFDebouncer *)v17;

  }
  return v10;
}

- (EDUpdateThrottler)initWithDelayInterval:(double)a3 scalingFactor:(int64_t)a4
{
  return -[EDUpdateThrottler initWithName:delayInterval:scalingFactor:](self, "initWithName:delayInterval:scalingFactor:", 0, a4, a3);
}

- (void)dealloc
{
  objc_super v3;

  -[EFDebouncer cancel](self->_resumeClientDebouncer, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)EDUpdateThrottler;
  -[EDUpdateThrottler dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resumeClientScheduler, 0);
  objc_storeStrong((id *)&self->_resumeClientDebouncer, 0);
  objc_storeStrong((id *)&self->_resumable, 0);
  objc_storeStrong((id *)&self->_lastAcknowledgementDate, 0);
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_unacknowledgedUpdates, 0);
}

- (int64_t)scalingFactor
{
  return self->_scalingFactor;
}

- (double)delayInterval
{
  return self->_delayInterval;
}

uint64_t __58__EDUpdateThrottler_initWithName_delayInterval_resumable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resumeForUpdates");
}

- (unint64_t)unacknowledgedUpdatesCountAndTimeSinceLastAcknowledgement:(double *)a3
{
  os_unfair_lock_s *p_updatesLock;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;

  p_updatesLock = &self->_updatesLock;
  os_unfair_lock_lock(&self->_updatesLock);
  v6 = -[NSMutableArray count](self->_unacknowledgedUpdates, "count");
  -[EDUpdateThrottler lastAcknowledgementDate](self, "lastAcknowledgementDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[EDUpdateThrottler lastUpdateDate](self, "lastUpdateDate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  os_unfair_lock_unlock(p_updatesLock);
  if (a3)
  {
    if (v6)
    {
      objc_msgSend(v10, "timeIntervalSinceNow");
      v12 = -v11;
    }
    else
    {
      v12 = 0.0;
    }
    *a3 = v12;
  }

  return v6;
}

- (NSDate)lastAcknowledgementDate
{
  return self->_lastAcknowledgementDate;
}

- (EDResumable)resumable
{
  return self->_resumable;
}

- (void)setResumable:(id)a3
{
  objc_storeStrong((id *)&self->_resumable, a3);
}

- (void)setResumeClientDebouncer:(id)a3
{
  objc_storeStrong((id *)&self->_resumeClientDebouncer, a3);
}

- (EFScheduler)resumeClientScheduler
{
  return self->_resumeClientScheduler;
}

- (void)setResumeClientScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_resumeClientScheduler, a3);
}

@end
