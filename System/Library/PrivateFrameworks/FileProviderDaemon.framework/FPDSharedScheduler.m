@implementation FPDSharedScheduler

- (id)forceRunningWithReason:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  SEL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__22;
  v18 = __Block_byref_object_dispose__23;
  v19 = 0;
  +[FPDSharedScheduler queue](FPDSharedScheduler, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__FPDSharedScheduler_forceRunningWithReason___block_invoke;
  v10[3] = &unk_1E8C76978;
  v10[4] = self;
  v11 = v5;
  v12 = &v14;
  v13 = a2;
  v7 = v5;
  dispatch_sync(v6, v10);

  v8 = (void *)MEMORY[0x1D17D1C84](v15[5]);
  _Block_object_dispose(&v14, 8);

  return v8;
}

+ (OS_dispatch_queue)queue
{
  if (queue_onceToken != -1)
    dispatch_once(&queue_onceToken, &__block_literal_global_8);
  return (OS_dispatch_queue *)(id)queue_schedulerQueue;
}

void __45__FPDSharedScheduler_forceRunningWithReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15[2];
  _QWORD v16[5];
  _BYTE buf[12];
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v4;
    v18 = 2114;
    v19 = v3;
    _os_log_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_INFO, "[INFO] ⏱  %{public}@: force running for %{public}@", buf, 0x16u);
  }

  v5 = MEMORY[0x1E0C809B0];
  v6 = *(void **)(a1 + 32);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __45__FPDSharedScheduler_forceRunningWithReason___block_invoke_24;
  v16[3] = &unk_1E8C75E48;
  v16[4] = v6;
  objc_msgSend(v6, "withReevaluationOfSchedulingState:", v16);
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __45__FPDSharedScheduler_forceRunningWithReason___block_invoke_2;
  v12[3] = &unk_1E8C76950;
  objc_copyWeak(v15, (id *)buf);
  v7 = *(id *)(a1 + 40);
  v15[1] = *(id *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 32);
  v13 = v7;
  v14 = v8;
  v9 = MEMORY[0x1D17D1C84](v12);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  objc_destroyWeak(v15);
  objc_destroyWeak((id *)buf);
}

void __27__FPDSharedScheduler_queue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.fileproviderd.background-scheduler", v2);
  v1 = (void *)queue_schedulerQueue;
  queue_schedulerQueue = (uint64_t)v0;

}

+ (BOOL)disableDelayedUnregistration
{
  void *v2;
  char v3;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  v3 = disableDelayedUnregistrationStorage;
  objc_sync_exit(v2);

  return v3;
}

+ (void)setDisableDelayedUnregistration:(BOOL)a3
{
  id obj;

  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  disableDelayedUnregistrationStorage = a3;
  objc_sync_exit(obj);

}

+ (void)checkIn
{
  NSObject *v2;

  +[FPDSharedScheduler queue](FPDSharedScheduler, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v2, &__block_literal_global_2);

}

void __29__FPDSharedScheduler_checkIn__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _BYTE v9[128];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  allowedToCheckIn = 1;
  v5 = 0u;
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  schedulers();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v6;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v6 != v3)
          objc_enumerationMutation(v0);
        objc_msgSend(*(id *)(*((_QWORD *)&v5 + 1) + 8 * v4++), "checkIn", (_QWORD)v5);
      }
      while (v2 != v4);
      v2 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
    }
    while (v2);
  }

}

+ (id)schedulerWithLabel:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  v16 = 0;
  +[FPDSharedScheduler queue](FPDSharedScheduler, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__FPDSharedScheduler_schedulerWithLabel___block_invoke;
  v8[3] = &unk_1E8C768B0;
  v9 = v3;
  v10 = &v11;
  v5 = v3;
  dispatch_sync(v4, v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __41__FPDSharedScheduler_schedulerWithLabel___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  schedulers();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(id **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7[5], "isEqualToString:", *(_QWORD *)(a1 + 32), (_QWORD)v8))
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (FPDSharedScheduler)initWithLabel:(id)a3 options:(int64_t)a4 criteriaBuilder:(id)a5
{
  id v9;
  id v10;
  FPDSharedScheduler *v11;
  FPDSharedScheduler *v12;
  uint64_t v13;
  id criteriaBuilder;
  uint64_t v15;
  NSMapTable *watchers;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD block[4];
  FPDSharedScheduler *v22;
  objc_super v23;

  v9 = a3;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)FPDSharedScheduler;
  v11 = -[FPDSharedScheduler init](&v23, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_label, a3);
    v13 = MEMORY[0x1D17D1C84](v10);
    criteriaBuilder = v12->_criteriaBuilder;
    v12->_criteriaBuilder = (id)v13;

    v12->_options = a4;
    v12->_registered = 0;
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 10);
    watchers = v12->_watchers;
    v12->_watchers = (NSMapTable *)v15;

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.fileproviderd"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bypass.%@"), v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "BOOLForKey:", v18))
      ++v12->_alwaysRunnableCount;
    +[FPDSharedScheduler queue](FPDSharedScheduler, "queue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__FPDSharedScheduler_initWithLabel_options_criteriaBuilder___block_invoke;
    block[3] = &unk_1E8C75E48;
    v22 = v12;
    dispatch_sync(v19, block);

  }
  return v12;
}

uint64_t __60__FPDSharedScheduler_initWithLabel_options_criteriaBuilder___block_invoke(uint64_t a1)
{
  void *v2;

  schedulers();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 32), "registerActivity");
}

- (FPDSharedScheduler)initWithLabel:(id)a3 criteriaBuilder:(id)a4
{
  return -[FPDSharedScheduler initWithLabel:options:criteriaBuilder:](self, "initWithLabel:options:criteriaBuilder:", a3, 0, a4);
}

- (FPDSharedScheduler)initWithLabel:(id)a3 options:(int64_t)a4 criteria:(id)a5
{
  id v8;
  id v9;
  FPDSharedScheduler *v10;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__FPDSharedScheduler_initWithLabel_options_criteria___block_invoke;
  v12[3] = &unk_1E8C768D8;
  v13 = v8;
  v9 = v8;
  v10 = -[FPDSharedScheduler initWithLabel:options:criteriaBuilder:](self, "initWithLabel:options:criteriaBuilder:", a3, a4, v12);

  return v10;
}

id __53__FPDSharedScheduler_initWithLabel_options_criteria___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (FPDSharedScheduler)initWithLabel:(id)a3 criteria:(id)a4
{
  return -[FPDSharedScheduler initWithLabel:options:criteria:](self, "initWithLabel:options:criteria:", a3, 0, a4);
}

- (BOOL)canRunCheckingDeferral:(BOOL)a3 reason:(id *)a4
{
  BOOL result;
  __CFString *v6;
  OS_xpc_object *activity;

  if (self->_unregistrationTimer)
  {
    if (a4)
    {
      result = 0;
      v6 = CFSTR("unregistration timer is running");
LABEL_4:
      *a4 = v6;
      return result;
    }
  }
  else
  {
    activity = self->_activity;
    if (activity)
    {
      if (!a3 || !xpc_activity_should_defer(activity))
        return 1;
      if (a4)
        *a4 = CFSTR("activity should be deferred");
      -[FPDSharedScheduler defer](self, "defer");
    }
    else if (a4)
    {
      result = 0;
      v6 = CFSTR("activity is not running");
      goto LABEL_4;
    }
  }
  return 0;
}

- (BOOL)canOrIsForcedToRunCheckingDeferral:(BOOL)a3 reason:(id *)a4
{
  _BOOL4 preventRunning;

  if (-[FPDSharedScheduler canRunCheckingDeferral:reason:](self, "canRunCheckingDeferral:reason:", a3))
  {
    preventRunning = self->_preventRunning;
    if (!a4 || !self->_preventRunning)
      return !preventRunning;
    *a4 = CFSTR("prevent running");
LABEL_6:
    preventRunning = self->_preventRunning;
    return !preventRunning;
  }
  if (self->_alwaysRunnableCount >= 1)
    goto LABEL_6;
  return 0;
}

- (BOOL)shouldPause
{
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  +[FPDSharedScheduler queue](FPDSharedScheduler, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__FPDSharedScheduler_shouldPause__block_invoke;
  v5[3] = &unk_1E8C768B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __33__FPDSharedScheduler_shouldPause__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "unregisterActivityWithDelayIfNeeded");
  result = objc_msgSend(*(id *)(a1 + 32), "canOrIsForcedToRunCheckingDeferral:reason:", 1, 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result ^ 1;
  return result;
}

- (void)markWatcherDone:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[FPDSharedScheduler queue](FPDSharedScheduler, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__FPDSharedScheduler_markWatcherDone___block_invoke;
  v7[3] = &unk_1E8C75850;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __38__FPDSharedScheduler_markWatcherDone___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKey:", MEMORY[0x1E0C9AAB0], *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "keyEnumerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "BOOLValue");

        if (!v11)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      fp_current_or_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
        *(_DWORD *)buf = 138543362;
        v30 = v13;
        _os_log_impl(&dword_1CF55F000, v12, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: all watchers done", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "completeActivityWithState:", 5);
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v14 = v5;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v21;
        v18 = MEMORY[0x1E0C9AAA0];
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v21 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKey:", v18, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++), (_QWORD)v20);
          }
          while (v16 != v19);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        }
        while (v16);
      }
    }

  }
}

- (void)checkIn
{
  if (allowedToCheckIn == 1 && !self->_wasCheckedIn)
    -[FPDSharedScheduler registerActivity](self, "registerActivity");
}

- (void)notifyCanRun
{
  NSObject *v3;
  NSMapTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[FPDSharedScheduler queue](FPDSharedScheduler, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[FPDSharedScheduler unregisterActivityWithDelayIfNeeded](self, "unregisterActivityWithDelayIfNeeded");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_watchers;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
      if (!-[FPDSharedScheduler canOrIsForcedToRunCheckingDeferral:reason:](self, "canOrIsForcedToRunCheckingDeferral:reason:", 1, 0, (_QWORD)v11))break;
      -[NSMapTable objectForKey:](self->_watchers, "objectForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "BOOLValue") & 1) == 0)
        objc_msgSend(v9, "sharedSchedulerCanRun:", self);

      if (v6 == ++v8)
      {
        v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)notifyIsDeferred
{
  NSObject *v3;
  NSMapTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[FPDSharedScheduler queue](FPDSharedScheduler, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[FPDSharedScheduler unregisterActivityWithDelayIfNeeded](self, "unregisterActivityWithDelayIfNeeded");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_watchers;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_watchers, "objectForKey:", v9, (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "BOOLValue") & 1) == 0)
          objc_msgSend(v9, "sharedSchedulerIsDeferred:", self);

      }
      v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)completeActivityWithState:(int64_t)a3
{
  NSObject *v5;
  NSString *label;
  const char *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  NSString *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_changeHandler)
  {
    xpc_activity_remove_eligibility_changed_handler();
    self->_changeHandler = 0;
  }
  if (self->_activity)
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      label = self->_label;
      if ((unint64_t)a3 > 5)
        v7 = "<unknown>";
      else
        v7 = off_1E8C76A08[a3];
      *(_DWORD *)buf = 138543618;
      v10 = label;
      v11 = 2082;
      v12 = v7;
      _os_log_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: transitioning activity to %{public}s", buf, 0x16u);
    }

    xpc_activity_set_state(self->_activity, a3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__FPDSharedScheduler_completeActivityWithState___block_invoke;
    v8[3] = &unk_1E8C75E48;
    v8[4] = self;
    -[FPDSharedScheduler withReevaluationOfSchedulingState:](self, "withReevaluationOfSchedulingState:", v8);
  }
}

void __48__FPDSharedScheduler_completeActivityWithState___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

- (void)defer
{
  NSObject *v3;
  OS_xpc_object *activity;
  NSObject *v5;
  NSString *label;
  FPDSharedScheduler *v7;
  uint64_t v8;
  NSDate *lastDeferralDate;
  int v10;
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[FPDSharedScheduler queue](FPDSharedScheduler, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  activity = self->_activity;
  if (activity && xpc_activity_get_state(activity) != 3)
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      label = self->_label;
      v10 = 138543362;
      v11 = label;
      _os_log_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: deferring xpc_activity", (uint8_t *)&v10, 0xCu);
    }

    v7 = self;
    objc_sync_enter(v7);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v8 = objc_claimAutoreleasedReturnValue();
    lastDeferralDate = v7->_lastDeferralDate;
    v7->_lastDeferralDate = (NSDate *)v8;

    objc_sync_exit(v7);
    -[FPDSharedScheduler completeActivityWithState:](v7, "completeActivityWithState:", 3);
  }
}

- (void)registerActivity
{
  FPDSharedScheduler *v3;
  uint64_t v4;
  NSDate *lastRegistrationDate;
  id v6;
  NSObject *v7;
  NSString *label;
  const char *v9;
  NSString *v10;
  const char *v11;
  _QWORD v12[4];
  id v13;
  id location;
  uint8_t buf[4];
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_manualScheduling && !-[FPDSharedScheduler isRegistered](self, "isRegistered") && allowedToCheckIn == 1)
  {
    v3 = self;
    objc_sync_enter(v3);
    v3->_registered = 1;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v4 = objc_claimAutoreleasedReturnValue();
    lastRegistrationDate = v3->_lastRegistrationDate;
    v3->_lastRegistrationDate = (NSDate *)v4;

    objc_sync_exit(v3);
    location = 0;
    objc_initWeak(&location, v3);
    if (v3->_wasCheckedIn)
    {
      (*((void (**)(void))v3->_criteriaBuilder + 2))();
      v6 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        label = v3->_label;
        *(_DWORD *)buf = 138543362;
        v16 = label;
        v9 = "[NOTICE] ⏱  %{public}@: registering xpc_activity";
LABEL_9:
        _os_log_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
      }
    }
    else
    {
      v6 = (id)*MEMORY[0x1E0C80748];
      fp_current_or_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v3->_label;
        *(_DWORD *)buf = 138543362;
        v16 = v10;
        v9 = "[NOTICE] ⏱  %{public}@: checking-in xpc_activity";
        goto LABEL_9;
      }
    }

    ++v3->_registrationCount;
    v11 = -[NSString UTF8String](v3->_label, "UTF8String");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __38__FPDSharedScheduler_registerActivity__block_invoke;
    v12[3] = &unk_1E8C76900;
    objc_copyWeak(&v13, &location);
    xpc_activity_register(v11, v6, v12);
    objc_destroyWeak(&v13);

    objc_destroyWeak(&location);
  }
}

void __38__FPDSharedScheduler_registerActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  _QWORD *v13;
  id v14;
  _QWORD block[4];
  _QWORD *v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (xpc_activity_get_state((xpc_activity_t)v3))
  {
    if (xpc_activity_get_state((xpc_activity_t)v3) == 2)
    {
      if (WeakRetained)
      {
        fp_current_or_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v6 = WeakRetained[5];
          *(_DWORD *)buf = 138543362;
          v19 = v6;
          _os_log_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: xpc_activity called", buf, 0xCu);
        }

        v7 = WeakRetained;
        objc_sync_enter(v7);
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v7[12];
        v7[12] = v8;

        objc_sync_exit(v7);
        +[FPDSharedScheduler queue](FPDSharedScheduler, "queue");
        v10 = objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __38__FPDSharedScheduler_registerActivity__block_invoke_19;
        v12[3] = &unk_1E8C75850;
        v13 = v7;
        v14 = v3;
        dispatch_sync(v10, v12);

      }
      else
      {
        xpc_activity_set_state((xpc_activity_t)v3, 5);
      }
    }
  }
  else if (WeakRetained)
  {
    +[FPDSharedScheduler queue](FPDSharedScheduler, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__FPDSharedScheduler_registerActivity__block_invoke_2;
    block[3] = &unk_1E8C75850;
    v16 = WeakRetained;
    v17 = v3;
    dispatch_sync(v11, block);

  }
}

void __38__FPDSharedScheduler_registerActivity__block_invoke_2(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  _xpc_activity_s *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 122) = 1;
  v2 = xpc_activity_copy_criteria(*(xpc_activity_t *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (v2)
    {
      v5 = *(_QWORD *)(a1 + 32);
      if ((*(_BYTE *)(v5 + 24) & 1) != 0)
      {
        (*(void (**)(void))(*(_QWORD *)(v5 + 16) + 16))();
        v6 = objc_claimAutoreleasedReturnValue();
        if (!xpc_equal(v2, v6))
        {
          fp_current_or_default_log();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
            v19 = 138543362;
            v20 = v18;
            _os_log_impl(&dword_1CF55F000, v17, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: xpc_activity update criteria at check in", (uint8_t *)&v19, 0xCu);
          }

          xpc_activity_set_criteria(*(xpc_activity_t *)(a1 + 40), v6);
        }
      }
      else
      {
        fp_current_or_default_log();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
          v19 = 138543362;
          v20 = v7;
          _os_log_impl(&dword_1CF55F000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: xpc_activity existing at check in", (uint8_t *)&v19, 0xCu);
        }
      }
      goto LABEL_20;
    }
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      v19 = 138543362;
      v20 = v14;
      _os_log_impl(&dword_1CF55F000, v13, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: xpc_activity creation at check in", (uint8_t *)&v19, 0xCu);
    }

    v15 = *(_xpc_activity_s **)(a1 + 40);
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_activity_set_criteria(v15, v16);

  }
  else
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      v19 = 138543362;
      v20 = v9;
      _os_log_impl(&dword_1CF55F000, v8, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: xpc_activity has no executors at check in", (uint8_t *)&v19, 0xCu);
    }

    v10 = *(_QWORD **)(a1 + 32);
    if (v2)
    {
      (*(void (**)(void))(v10[2] + 16))();
      v6 = objc_claimAutoreleasedReturnValue();
      v11 = xpc_equal(v2, v6);
      v12 = *(void **)(a1 + 32);
      if (v11)
        objc_msgSend(v12, "unregisterActivityWithDelay");
      else
        objc_msgSend(v12, "unregisterActivityImmediately");
LABEL_20:

      goto LABEL_21;
    }
    objc_msgSend(v10, "unregisterActivityImmediately");
  }
LABEL_21:

}

void __38__FPDSharedScheduler_registerActivity__block_invoke_19(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _xpc_activity_s *v6;
  xpc_activity_state_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, xpc_activity_t);
  void *v14;
  id v15;

  v2 = MEMORY[0x1E0C809B0];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __38__FPDSharedScheduler_registerActivity__block_invoke_2_20;
  v14 = &unk_1E8C76448;
  v15 = *(id *)(a1 + 32);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = xpc_activity_add_eligibility_changed_handler();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    v8[0] = v2;
    v8[1] = 3221225472;
    v8[2] = __38__FPDSharedScheduler_registerActivity__block_invoke_4;
    v8[3] = &unk_1E8C75850;
    v9 = v5;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v9, "withReevaluationOfSchedulingState:", v8);
    if (objc_msgSend(*(id *)(a1 + 32), "canRunCheckingDeferral:reason:", 1, 0))
      xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 4);

  }
  else
  {
    objc_msgSend(v5, "unregisterActivityWithDelay");
    if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 40)))
    {
      v6 = *(_xpc_activity_s **)(a1 + 40);
      v7 = 3;
    }
    else
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
      v6 = *(_xpc_activity_s **)(a1 + 40);
      v7 = 4;
    }
    xpc_activity_set_state(v6, v7);
  }

}

void __38__FPDSharedScheduler_registerActivity__block_invoke_2_20(uint64_t a1, xpc_activity_t activity)
{
  NSObject *v3;
  _QWORD block[4];
  id v5;

  if (xpc_activity_should_defer(activity))
  {
    +[FPDSharedScheduler queue](FPDSharedScheduler, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__FPDSharedScheduler_registerActivity__block_invoke_3;
    block[3] = &unk_1E8C75E48;
    v5 = *(id *)(a1 + 32);
    dispatch_async(v3, block);

  }
}

uint64_t __38__FPDSharedScheduler_registerActivity__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "defer");
}

void __38__FPDSharedScheduler_registerActivity__block_invoke_4(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (void)registerActivityIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;

  +[FPDSharedScheduler queue](FPDSharedScheduler, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!self->_registered)
  {
    -[NSMapTable keyEnumerator](self->_watchers, "keyEnumerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nextObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[FPDSharedScheduler registerActivity](self, "registerActivity");
  }
}

- (void)cancelDelayedUnregistration
{
  NSObject *v3;
  NSObject *v4;
  NSString *label;
  OS_dispatch_source *unregistrationTimer;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[FPDSharedScheduler queue](FPDSharedScheduler, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (self->_unregistrationTimer)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      label = self->_label;
      v7 = 138543362;
      v8 = label;
      _os_log_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: canceling delayed unregistration", (uint8_t *)&v7, 0xCu);
    }

    dispatch_activate((dispatch_object_t)self->_unregistrationTimer);
    dispatch_source_cancel((dispatch_source_t)self->_unregistrationTimer);
    unregistrationTimer = self->_unregistrationTimer;
    self->_unregistrationTimer = 0;

  }
}

- (void)unregisterActivityImmediately
{
  NSObject *v3;
  FPDSharedScheduler *v4;
  NSObject *v5;
  NSString *label;
  FPDSharedScheduler *v7;
  uint64_t v8;
  NSDate *lastUnregistrationDate;
  int v10;
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[FPDSharedScheduler queue](FPDSharedScheduler, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[FPDSharedScheduler completeActivityWithState:](self, "completeActivityWithState:", 5);
  v4 = self;
  objc_sync_enter(v4);
  LODWORD(v3) = v4->_registered;
  objc_sync_exit(v4);

  if ((_DWORD)v3)
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      label = v4->_label;
      v10 = 138543362;
      v11 = label;
      _os_log_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: unregistering xpc_activity", (uint8_t *)&v10, 0xCu);
    }

    xpc_activity_unregister(-[NSString UTF8String](v4->_label, "UTF8String"));
    -[FPDSharedScheduler cancelDelayedUnregistration](v4, "cancelDelayedUnregistration");
    v7 = v4;
    objc_sync_enter(v7);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v8 = objc_claimAutoreleasedReturnValue();
    lastUnregistrationDate = v7->_lastUnregistrationDate;
    v7->_lastUnregistrationDate = (NSDate *)v8;

    v4->_registered = 0;
    objc_sync_exit(v7);

  }
}

- (void)unregisterActivityWithDelay
{
  NSObject *v3;
  NSObject *v4;
  NSString *label;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  OS_dispatch_source *unregistrationTimer;
  NSObject *v10;
  _QWORD handler[5];
  uint8_t buf[4];
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[FPDSharedScheduler queue](FPDSharedScheduler, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (+[FPDSharedScheduler disableDelayedUnregistration](FPDSharedScheduler, "disableDelayedUnregistration")|| (self->_options & 2) != 0)
  {
    -[FPDSharedScheduler unregisterActivityImmediately](self, "unregisterActivityImmediately");
  }
  else if (!self->_unregistrationTimer)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      label = self->_label;
      *(_DWORD *)buf = 138543362;
      v13 = label;
      _os_log_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: delaying unregistration", buf, 0xCu);
    }

    +[FPDSharedScheduler queue](FPDSharedScheduler, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v6);

    v8 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x6FC23AC00uLL);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __49__FPDSharedScheduler_unregisterActivityWithDelay__block_invoke;
    handler[3] = &unk_1E8C75E48;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_activate(v7);
    unregistrationTimer = self->_unregistrationTimer;
    self->_unregistrationTimer = (OS_dispatch_source *)v7;
    v10 = v7;

  }
}

uint64_t __49__FPDSharedScheduler_unregisterActivityWithDelay__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unregisterActivityImmediately");
}

- (void)unregisterActivityWithDelayIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;

  +[FPDSharedScheduler queue](FPDSharedScheduler, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (self->_registered)
  {
    -[NSMapTable keyEnumerator](self->_watchers, "keyEnumerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nextObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      -[FPDSharedScheduler unregisterActivityWithDelay](self, "unregisterActivityWithDelay");
  }
}

- (void)addWatcher:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  +[FPDSharedScheduler queue](FPDSharedScheduler, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__FPDSharedScheduler_addWatcher___block_invoke;
  block[3] = &unk_1E8C75850;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __33__FPDSharedScheduler_addWatcher___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKey:", MEMORY[0x1E0C9AAA0], *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "cancelDelayedUnregistration");
    objc_msgSend(*(id *)(a1 + 32), "registerActivityIfNeeded");
    v3 = *(void **)(a1 + 32);
    v16 = 0;
    v4 = objc_msgSend(v3, "canOrIsForcedToRunCheckingDeferral:reason:", 1, &v16);
    v5 = v16;
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v7)
      {
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
        objc_msgSend(*(id *)(a1 + 40), "watcherLabel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "fp_obfuscatedProviderDomainID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v18 = v8;
        v19 = 2114;
        v20 = v10;
        v21 = 2048;
        v22 = v11;
        _os_log_impl(&dword_1CF55F000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: new watcher registered for %{public}@[%p] and called immediately", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 40), "sharedSchedulerCanRun:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      if (v7)
      {
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
        objc_msgSend(*(id *)(a1 + 40), "watcherLabel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "fp_obfuscatedProviderDomainID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        v18 = v12;
        v19 = 2114;
        v20 = v14;
        v21 = 2048;
        v22 = v15;
        v23 = 2114;
        v24 = v5;
        _os_log_impl(&dword_1CF55F000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: new watcher registered for %{public}@[%p] and waiting: %{public}@", buf, 0x2Au);

      }
    }

  }
}

- (void)removeWatcher:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[FPDSharedScheduler queue](FPDSharedScheduler, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__FPDSharedScheduler_removeWatcher___block_invoke;
  v7[3] = &unk_1E8C75850;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __36__FPDSharedScheduler_removeWatcher___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  if (v2)
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      objc_msgSend(*(id *)(a1 + 40), "watcherLabel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fp_obfuscatedProviderDomainID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138543874;
      v9 = v4;
      v10 = 2114;
      v11 = v6;
      v12 = 2048;
      v13 = v7;
      _os_log_impl(&dword_1CF55F000, v3, OS_LOG_TYPE_DEFAULT, "[NOTICE] ⏱  %{public}@: watcher unregistered for %{public}@[%p]", (uint8_t *)&v8, 0x20u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "unregisterActivityWithDelayIfNeeded");

}

- (BOOL)runIfPossible:(id)a3
{
  id v4;
  NSObject *v5;
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
  +[FPDSharedScheduler queue](FPDSharedScheduler, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__FPDSharedScheduler_runIfPossible___block_invoke;
  block[3] = &unk_1E8C76928;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __36__FPDSharedScheduler_runIfPossible___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "unregisterActivityWithDelayIfNeeded");
  result = objc_msgSend(*(id *)(a1 + 32), "canOrIsForcedToRunCheckingDeferral:reason:", 1, 0);
  if ((_DWORD)result)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 104);
    *(_QWORD *)(v4 + 104) = v3;

    result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (void)withReevaluationOfSchedulingState:(id)a3
{
  void (**v4)(_QWORD);
  _BOOL4 v5;
  _BOOL4 v6;

  v4 = (void (**)(_QWORD))a3;
  v5 = -[FPDSharedScheduler canOrIsForcedToRunCheckingDeferral:reason:](self, "canOrIsForcedToRunCheckingDeferral:reason:", 0, 0);
  v4[2](v4);

  v6 = -[FPDSharedScheduler canOrIsForcedToRunCheckingDeferral:reason:](self, "canOrIsForcedToRunCheckingDeferral:reason:", 0, 0);
  if (v5 || !v6)
  {
    if (v5 && !v6)
      -[FPDSharedScheduler notifyIsDeferred](self, "notifyIsDeferred");
  }
  else
  {
    -[FPDSharedScheduler notifyCanRun](self, "notifyCanRun");
  }
}

uint64_t __45__FPDSharedScheduler_forceRunningWithReason___block_invoke_24(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 64);
  return result;
}

void __45__FPDSharedScheduler_forceRunningWithReason___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8[2];

  +[FPDSharedScheduler queue](FPDSharedScheduler, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__FPDSharedScheduler_forceRunningWithReason___block_invoke_3;
  v5[3] = &unk_1E8C76950;
  objc_copyWeak(v8, (id *)(a1 + 48));
  v3 = *(id *)(a1 + 32);
  v8[1] = *(id *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  dispatch_sync(v2, v5);

  objc_destroyWeak(v8);
}

void __45__FPDSharedScheduler_forceRunningWithReason___block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  _QWORD *v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = WeakRetained[5];
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v11 = v4;
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_1CF55F000, v3, OS_LOG_TYPE_INFO, "[INFO] ⏱  %{public}@: stop force running for %{public}@", buf, 0x16u);
    }

    if ((uint64_t)WeakRetained[8] <= 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ over-released forceRunning"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        __45__FPDSharedScheduler_forceRunningWithReason___block_invoke_3_cold_1((uint64_t)v6, v7);

      __assert_rtn("-[FPDSharedScheduler forceRunningWithReason:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDSharedScheduler.m", 628, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
    }
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__FPDSharedScheduler_forceRunningWithReason___block_invoke_2_28;
    v8[3] = &unk_1E8C75E48;
    v9 = WeakRetained;
    objc_msgSend(v9, "withReevaluationOfSchedulingState:", v8);

  }
}

uint64_t __45__FPDSharedScheduler_forceRunningWithReason___block_invoke_2_28(uint64_t result)
{
  --*(_QWORD *)(*(_QWORD *)(result + 32) + 64);
  return result;
}

- (BOOL)preventRunning
{
  return self->_preventRunning;
}

- (void)setPreventRunning:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  +[FPDSharedScheduler queue](FPDSharedScheduler, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__FPDSharedScheduler_setPreventRunning___block_invoke;
  v6[3] = &unk_1E8C769A0;
  v7 = a3;
  v6[4] = self;
  dispatch_sync(v5, v6);

}

unsigned __int8 *__40__FPDSharedScheduler_setPreventRunning___block_invoke(uint64_t a1)
{
  int v1;
  unsigned __int8 *result;
  _QWORD v3[5];
  char v4;

  v1 = *(unsigned __int8 *)(a1 + 40);
  result = *(unsigned __int8 **)(a1 + 32);
  if (v1 != result[120])
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __40__FPDSharedScheduler_setPreventRunning___block_invoke_2;
    v3[3] = &unk_1E8C769A0;
    v3[4] = result;
    v4 = v1;
    return (unsigned __int8 *)objc_msgSend(result, "withReevaluationOfSchedulingState:", v3);
  }
  return result;
}

uint64_t __40__FPDSharedScheduler_setPreventRunning___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 120) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)useManualScheduling
{
  return self->_manualScheduling;
}

- (void)setManualScheduling:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  +[FPDSharedScheduler queue](FPDSharedScheduler, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__FPDSharedScheduler_setManualScheduling___block_invoke;
  v6[3] = &unk_1E8C769A0;
  v7 = a3;
  v6[4] = self;
  dispatch_sync(v5, v6);

}

void __42__FPDSharedScheduler_setManualScheduling___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v4;
  id *v5;
  void *v6;
  void *v7;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 121))
  {
    *(_BYTE *)(v2 + 121) = v1;
    v4 = *(unsigned __int8 *)(a1 + 40);
    v5 = *(id **)(a1 + 32);
    if (v4)
    {
      objc_msgSend(v5, "unregisterActivityImmediately");
    }
    else
    {
      objc_msgSend(v5[6], "keyEnumerator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "nextObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        objc_msgSend(*(id *)(a1 + 32), "registerActivity");
    }
  }
}

- (BOOL)hasRegisteredExecutors
{
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  +[FPDSharedScheduler queue](FPDSharedScheduler, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__FPDSharedScheduler_hasRegisteredExecutors__block_invoke;
  v5[3] = &unk_1E8C769C8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

void __44__FPDSharedScheduler_hasRegisteredExecutors__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "keyEnumerator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 != 0;

}

- (NSString)label
{
  return self->_label;
}

- (id)description
{
  NSObject *v3;
  id v4;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<l:%@"), self->_label);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  +[FPDSharedScheduler queue](FPDSharedScheduler, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__FPDSharedScheduler_description__block_invoke;
  block[3] = &unk_1E8C768B0;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(v3, block);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __33__FPDSharedScheduler_description__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  const __CFString *v8;
  int v9;
  id v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 64);
  v4 = *(unsigned __int8 *)(v2 + 120);
  if (v3 < 1)
  {
    if (v4)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendString:", CFSTR(" 🌑 "));
  }
  else
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v4)
      objc_msgSend(v5, "appendFormat:", CFSTR(" 🌑 %d"), v3);
    else
      objc_msgSend(v5, "appendFormat:", CFSTR(" 🌕 %d"), v3);
  }
  v6 = *(_QWORD **)(a1 + 32);
  if (v6[1])
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = CFSTR(" ▶️ ");
  }
  else if (v6[9])
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = CFSTR(" ⏲️ ");
  }
  else
  {
    v9 = objc_msgSend(v6, "isRegistered");
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v9)
      v8 = CFSTR(" ⏳ ");
    else
      v8 = CFSTR(" 🛏 ");
  }
  objc_msgSend(v7, "appendString:", v8);
  v10 = *(id *)(a1 + 32);
  objc_sync_enter(v10);
  v11 = *(_QWORD **)(a1 + 32);
  v12 = v11[10];
  if (v12)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendFormat:", CFSTR(" registration:<from:%@ count:%d"), v12, v11[16]);
    v13 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v13 + 56))
    {
      v14 = *(_QWORD *)(v13 + 88);
      if (v14)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendFormat:", CFSTR(" to:%@"), v14);
        v13 = *(_QWORD *)(a1 + 32);
      }
    }
    if (*(_QWORD *)(v13 + 72))
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendString:", CFSTR(" to:<pending>"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendString:", CFSTR(">"));
    v11 = *(_QWORD **)(a1 + 32);
  }
  v15 = v11[12];
  if (v15)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendFormat:", CFSTR(" trigger:<from:%@"), v15);
    v16 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v16 + 8))
    {
      v17 = *(_QWORD *)(v16 + 112);
      if (v17)
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendFormat:", CFSTR(" to:%@"), v17);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendString:", CFSTR(">"));
  }
  objc_sync_exit(v10);

  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(_QWORD *)(v18 + 104);
  if (v19)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendFormat:", CFSTR(" usage:%@"), v19);
    v20 = a1;
    v18 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v20 = a1;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = *(id *)(v18 + 48);
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v33;
    v23 = 1;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(v20 + 40) + 8) + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v24), "watcherLabel");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "fp_obfuscatedProviderDomainID");
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = (void *)v27;
        if ((v23 & 1) != 0)
          v29 = CFSTR(" watchers=%@");
        else
          v29 = CFSTR(",%@");
        objc_msgSend(v25, "appendFormat:", v29, v27);

        v23 = 0;
        ++v24;
      }
      while (v21 != v24);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      v23 = 0;
    }
    while (v21);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v20 + 40) + 8) + 40), "appendString:", CFSTR(">"));
}

- (BOOL)isRunning
{
  FPDSharedScheduler *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activity != 0;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isRegistered
{
  FPDSharedScheduler *v2;
  BOOL registered;

  v2 = self;
  objc_sync_enter(v2);
  registered = v2->_registered;
  objc_sync_exit(v2);

  return registered;
}

- (NSDate)lastRegistrationDate
{
  FPDSharedScheduler *v2;
  NSDate *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_lastRegistrationDate;
  objc_sync_exit(v2);

  return v3;
}

- (NSDate)lastTriggerDate
{
  FPDSharedScheduler *v2;
  NSDate *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_lastTriggerDate;
  objc_sync_exit(v2);

  return v3;
}

- (NSDate)lastUsageDate
{
  FPDSharedScheduler *v2;
  NSDate *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_lastUsageDate;
  objc_sync_exit(v2);

  return v3;
}

- (NSDate)lastDeferralDate
{
  FPDSharedScheduler *v2;
  NSDate *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_lastDeferralDate;
  objc_sync_exit(v2);

  return v3;
}

- (int64_t)_contextForActivity:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  int v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "schedulingPriority");
  if (v4 == *MEMORY[0x1E0D1D9E0])
  {
    v5 = 1;
  }
  else if (v4 == *MEMORY[0x1E0D1D9C8])
  {
    v5 = 2;
  }
  else if (v4 == *MEMORY[0x1E0D1DA18])
  {
    v5 = 4;
  }
  else if (v4 == *MEMORY[0x1E0D1D9D8])
  {
    v5 = 8;
  }
  else if (v4 == *MEMORY[0x1E0D1D9F8])
  {
    v5 = 16;
  }
  else
  {
    v5 = 32 * (v4 == *MEMORY[0x1E0D1DA08]);
  }
  if (objc_msgSend(v3, "delayedStart"))
    v5 |= 0x40uLL;
  if (objc_msgSend(v3, "cancelAfterDeadline"))
    v5 |= 0x80uLL;
  if (objc_msgSend(v3, "requiresNetwork"))
    v5 |= 0x100uLL;
  if (objc_msgSend(v3, "isUpload"))
    v5 |= 0x200uLL;
  if (objc_msgSend(v3, "cpuIntensive"))
    v5 |= 0x400uLL;
  if (objc_msgSend(v3, "memoryIntensive"))
    v6 = v5 | 0x800;
  else
    v6 = v5;
  v7 = objc_msgSend(v3, "preventDeviceSleep");

  if (v7)
    return v6 | 0x1000;
  else
    return v6;
}

- (int64_t)dasContext
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  int v10;
  int64_t v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1D928], "sharedScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "runningActivities");
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsString:", self->_label);

        if (v10)
        {
          v5 = v8;
          v12 = 0;
          v11 = 0x2000;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
  v12 = 1;
LABEL_11:

  objc_msgSend(v3, "submittedActivities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v15 = v13;
    v11 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v11)
    {
      v23 = v14;
      v24 = v3;
      v16 = *(_QWORD *)v26;
      while (2)
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v15);
          v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
          objc_msgSend(v18, "name", v23, v24, (_QWORD)v25);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "containsString:", self->_label);

          if (v20)
          {
            v21 = v18;

            v11 = 0x4000;
            v5 = v21;
            goto LABEL_22;
          }
        }
        v11 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v11)
          continue;
        break;
      }
LABEL_22:
      v14 = v23;
      v3 = v24;
    }

  }
  if (v5)
    v11 |= -[FPDSharedScheduler _contextForActivity:](self, "_contextForActivity:", v5);

  return v11;
}

- (int64_t)registrationCount
{
  return self->_registrationCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDeferralDate, 0);
  objc_storeStrong((id *)&self->_lastUsageDate, 0);
  objc_storeStrong((id *)&self->_lastTriggerDate, 0);
  objc_storeStrong((id *)&self->_lastUnregistrationDate, 0);
  objc_storeStrong((id *)&self->_lastRegistrationDate, 0);
  objc_storeStrong((id *)&self->_unregistrationTimer, 0);
  objc_storeStrong((id *)&self->_watchers, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_criteriaBuilder, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

void __45__FPDSharedScheduler_forceRunningWithReason___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
