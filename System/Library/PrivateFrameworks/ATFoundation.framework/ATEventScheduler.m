@implementation ATEventScheduler

- (ATEventScheduler)init
{
  ATEventScheduler *v2;
  uint64_t v3;
  NSMutableDictionary *events;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  dispatch_queue_t v7;
  OS_dispatch_queue *eventAccessQueue;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *v12;
  NSObject *v13;
  NSMutableDictionary *v14;
  objc_super v16;
  uint8_t buf[4];
  NSMutableDictionary *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)ATEventScheduler;
  v2 = -[ATEventScheduler init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    events = v2->_events;
    v2->_events = (NSMutableDictionary *)v3;

    v5 = dispatch_queue_create("ATNotificationScheduler", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("ATNotificationScheduler - access", 0);
    eventAccessQueue = v2->_eventAccessQueue;
    v2->_eventAccessQueue = (OS_dispatch_queue *)v7;

    v2->_started = 0;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("ScheduledEvents"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = objc_msgSend(v10, "mutableCopy");
      v12 = v2->_events;
      v2->_events = (NSMutableDictionary *)v11;

      _ATLogCategoryFramework();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v2->_events;
        *(_DWORD *)buf = 138543362;
        v18 = v14;
        _os_log_impl(&dword_1D19F1000, v13, OS_LOG_TYPE_DEFAULT, "loaded saved events %{public}@", buf, 0xCu);
      }

    }
  }
  return v2;
}

- (void)start
{
  self->_started = 1;
  -[ATEventScheduler _scheduleNextEvent](self, "_scheduleNextEvent");
}

- (void)scheduleEvent:(id)a3 afterDelay:(double)a4 withUserData:(id)a5
{
  id v8;
  id v9;
  NSObject *eventAccessQueue;
  double v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  ATEventScheduler *v17;
  double v18;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  eventAccessQueue = self->_eventAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ATEventScheduler_scheduleEvent_afterDelay_withUserData___block_invoke;
  block[3] = &unk_1E928C6B8;
  v18 = v11 + a4;
  v15 = v8;
  v16 = v9;
  v17 = self;
  v12 = v9;
  v13 = v8;
  dispatch_sync(eventAccessQueue, block);

}

- (void)scheduleRecurringEvent:(id)a3 withInterval:(double)a4 afterDelay:(double)a5 withUserData:(id)a6
{
  id v10;
  id v11;
  NSObject *eventAccessQueue;
  double v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  ATEventScheduler *v19;
  double v20;
  double v21;

  v10 = a3;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  eventAccessQueue = self->_eventAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__ATEventScheduler_scheduleRecurringEvent_withInterval_afterDelay_withUserData___block_invoke;
  block[3] = &unk_1E928C448;
  v20 = v13 + a5;
  v21 = a4;
  v17 = v10;
  v18 = v11;
  v19 = self;
  v14 = v11;
  v15 = v10;
  dispatch_sync(eventAccessQueue, block);

}

- (void)removeEvent:(id)a3
{
  id v4;
  NSObject *eventAccessQueue;
  id v6;
  _QWORD block[4];
  id v8;
  ATEventScheduler *v9;

  v4 = a3;
  eventAccessQueue = self->_eventAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__ATEventScheduler_removeEvent___block_invoke;
  block[3] = &unk_1E928CDD8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(eventAccessQueue, block);

}

- (BOOL)hasScheduledEvent:(id)a3
{
  id v4;
  NSObject *eventAccessQueue;
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
  eventAccessQueue = self->_eventAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__ATEventScheduler_hasScheduledEvent___block_invoke;
  block[3] = &unk_1E928CD60;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(eventAccessQueue, block);
  LOBYTE(eventAccessQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)eventAccessQueue;
}

- (void)_scheduleNextEvent
{
  NSObject *queue;
  _QWORD block[5];

  if (self->_started)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__ATEventScheduler__scheduleNextEvent__block_invoke;
    block[3] = &unk_1E928CC80;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)_postExpiredEvents
{
  NSObject *queue;
  _QWORD v3[6];

  queue = self->_queue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__ATEventScheduler__postExpiredEvents__block_invoke;
  v3[3] = &unk_1E928C9B8;
  v3[4] = self;
  v3[5] = a2;
  dispatch_async(queue, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventAccessQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

void __38__ATEventScheduler__postExpiredEvents__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD block[7];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = (id)objc_opt_new();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(NSObject **)(v2 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__ATEventScheduler__postExpiredEvents__block_invoke_2;
  block[3] = &unk_1E928C498;
  block[4] = v2;
  block[5] = &v21;
  block[6] = v3;
  dispatch_sync(v4, block);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (id)v22[5];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v29, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v17;
    *(_QWORD *)&v7 = 138543362;
    v15 = v7;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKey:", CFSTR("name"), v15, (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", CFSTR("userData"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "postNotificationName:object:userInfo:", v11, 0, v12);

        _ATLogCategoryFramework();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v15;
          v28 = v11;
          _os_log_impl(&dword_1D19F1000, v14, OS_LOG_TYPE_DEFAULT, "Firing notification %{public}@", buf, 0xCu);
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v29, 16);
    }
    while (v6);
  }

  _Block_object_dispose(&v21, 8);
}

uint64_t __38__ATEventScheduler__postExpiredEvents__block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v3 = v2;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v39 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKey:", CFSTR("time"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "doubleValue");
        v12 = v11;

        if (v12 <= v3)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v6);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v13 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        objc_msgSend(v18, "objectForKey:", CFSTR("name"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", CFSTR("isRecurring"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "BOOLValue");

        if ((v21 & 1) != 0)
        {
          v22 = (void *)objc_msgSend(v18, "mutableCopy");
          objc_msgSend(v18, "objectForKey:", CFSTR("time"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "doubleValue");
          v25 = v24;

          objc_msgSend(v18, "objectForKey:", CFSTR("interval"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "doubleValue");
          v28 = v27;

          if (v28 <= 0.0)
          {
            objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setObject:forKey:", 0, CFSTR("ScheduledEvents"));
            objc_msgSend(v29, "synchronize");
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v33 = v18;
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("ATEventScheduler.m"), 201, CFSTR("found invalid recurrence interval in event %@"), v33);

          }
          do
            v25 = v28 + v25;
          while (v25 < v3);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setValue:forKey:", v30, CFSTR("time"));

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", v22, v19);
        }
        else
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", v19);
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v15);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_scheduleNextEvent");
}

void __38__ATEventScheduler__scheduleNextEvent__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  double v12;
  int64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  xpc_object_t v17;
  _QWORD handler[5];
  _QWORD block[5];
  NSObject *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  double *v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  NSObject *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  int64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v29 = 0;
  v30 = (double *)&v29;
  v31 = 0x2020000000;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 24);
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__ATEventScheduler__scheduleNextEvent__block_invoke_19;
  block[3] = &unk_1E928C618;
  block[4] = v3;
  v21 = &v29;
  v22 = &v23;
  v6 = v2;
  v20 = v6;
  dispatch_sync(v4, block);
  _ATLogCategoryFramework_Oversize();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v34 = v6;
    _os_log_impl(&dword_1D19F1000, v7, OS_LOG_TYPE_DEFAULT, "Scheduling next event from events: %{public}@", buf, 0xCu);
  }

  if (v24[5])
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    v10 = v9;

    objc_msgSend((id)v24[5], "objectForKey:", CFSTR("name"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v30[3];
    if (v12 >= v10)
      v13 = (uint64_t)v12 - (uint64_t)v10;
    else
      v13 = 0;
    _ATLogCategoryFramework();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v30[3]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (uint64_t)v30[3];
      *(_DWORD *)buf = 138544386;
      v34 = v11;
      v35 = 2114;
      v36 = v15;
      v37 = 2048;
      v38 = v13;
      v39 = 2048;
      v40 = (uint64_t)v10;
      v41 = 2048;
      v42 = v16;
      _os_log_impl(&dword_1D19F1000, v14, OS_LOG_TYPE_DEFAULT, "scheduling next event '%{public}@' for %{public}@ (%llds from now) timeIntervalForNow %lld, timeIntervalForNextEvent %lld", buf, 0x34u);

    }
    if (v13)
    {
      v17 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v17, (const char *)*MEMORY[0x1E0C80760], v13);
      xpc_dictionary_set_string(v17, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
      xpc_dictionary_set_BOOL(v17, (const char *)*MEMORY[0x1E0C80738], 1);
      xpc_dictionary_set_BOOL(v17, (const char *)*MEMORY[0x1E0C808D8], 0);
      xpc_dictionary_set_BOOL(v17, (const char *)*MEMORY[0x1E0C80898], 0);
      handler[0] = v5;
      handler[1] = 3221225472;
      handler[2] = __38__ATEventScheduler__scheduleNextEvent__block_invoke_21;
      handler[3] = &unk_1E928C470;
      handler[4] = *(_QWORD *)(a1 + 32);
      xpc_activity_register("com.apple.atc.events", v17, handler);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_postExpiredEvents");
    }
  }
  else
  {
    xpc_activity_unregister("com.apple.atc.events");
    _ATLogCategoryFramework();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D19F1000, v11, OS_LOG_TYPE_DEFAULT, "no more events to schedule", buf, 2u);
    }
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
}

void __38__ATEventScheduler__scheduleNextEvent__block_invoke_19(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1[4] + 8), CFSTR("ScheduledEvents"));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1[4] + 8), "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKey:", CFSTR("time"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "doubleValue");
        v10 = v9;

        v11 = *(double *)(*(_QWORD *)(a1[6] + 8) + 24);
        if (v11 == 0.0 || v10 < v11)
        {
          objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v7);
          *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = v10;
          v11 = *(double *)(*(_QWORD *)(a1[6] + 8) + 24);
        }
        v13 = (void *)a1[5];
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", CFSTR("name"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v14, v15);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

}

uint64_t __38__ATEventScheduler__scheduleNextEvent__block_invoke_21(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postExpiredEvents");
}

void __38__ATEventScheduler_hasScheduledEvent___block_invoke(_QWORD *a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v2 != 0;

}

uint64_t __32__ATEventScheduler_removeEvent___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1D19F1000, v2, OS_LOG_TYPE_DEFAULT, "removing event '%{public}@'", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "_scheduleNextEvent");
}

void __80__ATEventScheduler_scheduleRecurringEvent_withInterval_afterDelay_withUserData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("name"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("time"));

  objc_msgSend(v2, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isRecurring"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("interval"));

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("userData"));
  _ATLogCategoryFramework();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v2;
    _os_log_impl(&dword_1D19F1000, v6, OS_LOG_TYPE_DEFAULT, "scheduling recurring event %{public}@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "setObject:forKey:", v2, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 48), "_scheduleNextEvent");

}

void __58__ATEventScheduler_scheduleEvent_afterDelay_withUserData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("name"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("time"));

  objc_msgSend(v2, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("isRecurring"));
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("userData"));
  _ATLogCategoryFramework();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v2;
    _os_log_impl(&dword_1D19F1000, v5, OS_LOG_TYPE_DEFAULT, "scheduling event %{public}@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "setObject:forKey:", v2, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 48), "_scheduleNextEvent");

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_392);
  return (id)sharedInstance__scheduler;
}

void __34__ATEventScheduler_sharedInstance__block_invoke()
{
  ATEventScheduler *v0;
  void *v1;

  v0 = objc_alloc_init(ATEventScheduler);
  v1 = (void *)sharedInstance__scheduler;
  sharedInstance__scheduler = (uint64_t)v0;

}

@end
