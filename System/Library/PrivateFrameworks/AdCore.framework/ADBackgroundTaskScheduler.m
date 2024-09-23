@implementation ADBackgroundTaskScheduler

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__ADBackgroundTaskScheduler_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken_0 != -1)
    dispatch_once(&sharedInstance__onceToken_0, block);
  return (id)sharedInstance__instance_0;
}

void __43__ADBackgroundTaskScheduler_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance__instance_0;
  sharedInstance__instance_0 = (uint64_t)v0;

}

+ (void)registerTaskDelegate:(id)a3 forRequestID:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (registerTaskDelegate_forRequestID__onceToken != -1)
    dispatch_once(&registerTaskDelegate_forRequestID__onceToken, &__block_literal_global_7);
  v6 = (id)_lockableObject;
  objc_sync_enter(v6);
  objc_msgSend((id)_delegates, "objectForKeyedSubscript:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend((id)_delegates, "setObject:forKeyedSubscript:", v7, v5);
  }
  if ((objc_msgSend(v7, "containsObject:", v8) & 1) == 0)
    objc_msgSend(v7, "addObject:", v8);

  objc_sync_exit(v6);
}

void __63__ADBackgroundTaskScheduler_registerTaskDelegate_forRequestID___block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_delegates;
  _delegates = (uint64_t)v0;

  v2 = (void *)_lockableObject;
  _lockableObject = (uint64_t)CFSTR("lock");

}

+ (void)unregisterTaskDelegate:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v9 = a3;
  v3 = (id)_lockableObject;
  objc_sync_enter(v3);
  if (_delegates)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = (void *)_delegates;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__ADBackgroundTaskScheduler_unregisterTaskDelegate___block_invoke;
    v10[3] = &unk_1E82B1EF0;
    v11 = v9;
    v6 = v4;
    v12 = v6;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);
    v7 = (void *)_delegates;
    _delegates = (uint64_t)v6;
    v8 = v6;

  }
  objc_sync_exit(v3);

}

void __52__ADBackgroundTaskScheduler_unregisterTaskDelegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v9 = a2;
  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__ADBackgroundTaskScheduler_unregisterTaskDelegate___block_invoke_2;
  v10[3] = &unk_1E82B1EC8;
  v11 = *(id *)(a1 + 32);
  v8 = v7;
  v12 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  if (objc_msgSend(v8, "count"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v9);

}

uint64_t __52__ADBackgroundTaskScheduler_unregisterTaskDelegate___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(result + 32) != a2)
    return objc_msgSend(*(id *)(result + 40), "addObject:", a2);
  return result;
}

- (ADBackgroundTaskScheduler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ADBackgroundTaskScheduler;
  return -[ADBackgroundTaskScheduler init](&v3, sel_init);
}

- (void)handleXPCActivity:(id)a3 withID:(id)a4
{
  _xpc_activity_s *v5;
  id v6;
  xpc_activity_state_t state;
  id v8;
  void *v9;
  void *v10;
  xpc_object_t v11;
  ADBackgroundTaskRequest *v12;
  ADBackgroundTaskRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _xpc_activity_s *v20;
  _QWORD v21[4];
  ADBackgroundTaskRequest *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v5 = (_xpc_activity_s *)a3;
  v6 = a4;
  state = xpc_activity_get_state(v5);
  if ((state | 2) == 2)
  {
    v8 = (id)_lockableObject;
    objc_sync_enter(v8);
    objc_msgSend((id)_delegates, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (state)
      {
        if (state == 2)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]: Request to run activity %@ (state: %ld)"), objc_opt_class(), v6, 2);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          _ADLog(CFSTR("LATDLogging"), v10, 0);

          v11 = xpc_activity_copy_criteria(v5);
          v12 = -[ADBackgroundTaskRequest initWithCriteria:ID:activity:]([ADBackgroundTaskRequest alloc], "initWithCriteria:ID:activity:", v11, v6, v5);
          v24 = 0;
          v25 = &v24;
          v26 = 0x2020000000;
          v27 = 0;
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __54__ADBackgroundTaskScheduler_handleXPCActivity_withID___block_invoke;
          v21[3] = &unk_1E82B1F18;
          v23 = &v24;
          v13 = v12;
          v22 = v13;
          objc_msgSend(v9, "enumerateObjectsUsingBlock:", v21);
          if (!*((_BYTE *)v25 + 24))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]: No registered handler for task %@ successfully returned."), objc_opt_class(), v6);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            _ADLog(CFSTR("LATDLogging"), v14, 16);

          }
          _Block_object_dispose(&v24, 8);

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]: Checking in on activity %@ (state: %ld)"), objc_opt_class(), v6, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog(CFSTR("LATDLogging"), v17, 0);

        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __54__ADBackgroundTaskScheduler_handleXPCActivity_withID___block_invoke_2;
        v18[3] = &unk_1E82B1EC8;
        v19 = v6;
        v20 = v5;
        objc_msgSend(v9, "enumerateObjectsUsingBlock:", v18);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]: No receiver registered for XPC job with ID %@"), objc_opt_class(), v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog(CFSTR("LATDLogging"), v16, 0);

    }
    objc_sync_exit(v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]: Unexpected XPC_ACTIVITY_STATE - %ld"), objc_opt_class(), state);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("LATDLogging"), v15, 0);

  }
}

uint64_t __54__ADBackgroundTaskScheduler_handleXPCActivity_withID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "runTask:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= result;
  return result;
}

void __54__ADBackgroundTaskScheduler_handleXPCActivity_withID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "checkOnTask:activity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)addBackgroundTask:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  ADBackgroundTaskScheduler *v15;
  id v16;

  v4 = a3;
  objc_msgSend(v4, "requestIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (id)_lockableObject;
    objc_sync_enter(v6);
    objc_msgSend((id)_delegates, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7
      || (objc_msgSend((id)_delegates, "objectForKeyedSubscript:", v5),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "count"),
          v8,
          v7,
          !v9))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]: No delegate is registered to handle request %@."), objc_opt_class(), v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog(CFSTR("LATDLogging"), v10, 0);

    }
    objc_sync_exit(v6);

    +[ADServer workQueue](ADServer, "workQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __47__ADBackgroundTaskScheduler_addBackgroundTask___block_invoke;
    v13[3] = &unk_1E82B1F68;
    v14 = v4;
    v15 = self;
    v16 = v5;
    objc_msgSend(v11, "addOperationWithBlock:", v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]: No identifier specified for background task activity. Ignoring request."), objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("LATDLogging"), v12, 0);

  }
}

void __47__ADBackgroundTaskScheduler_addBackgroundTask___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  _QWORD handler[4];
  id v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "AD_jsonString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)objc_msgSend(*(id *)(a1 + 32), "delay"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  v7 = objc_msgSend(*(id *)(a1 + 32), "delay");
  objc_msgSend(v4, "timeIntervalSince1970");
  v9 = v8;
  objc_msgSend(v4, "AD_localDateTimeAsString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("[%@]: Scheduling XPC activity request to run in %lld seconds (%.0f - %@): %@"), v6, v7, v9, v10, v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog(CFSTR("LATDLogging"), v11, 0);

  v12 = (void *)objc_msgSend(*(id *)(a1 + 32), "copyBackgroundTaskAgentCriteria");
  if (v12)
  {
    v13 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String");
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __47__ADBackgroundTaskScheduler_addBackgroundTask___block_invoke_2;
    handler[3] = &unk_1E82B1F40;
    v16 = *(id *)(a1 + 32);
    v17 = *(id *)(a1 + 48);
    xpc_activity_register(v13, v12, handler);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]: No criteria for background task activity: %@"), objc_opt_class(), *(_QWORD *)(a1 + 48));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("LATDLogging"), v14, 0);

  }
}

void __47__ADBackgroundTaskScheduler_addBackgroundTask___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _xpc_activity_s *activity;

  activity = a2;
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "requestIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.adprivacyd Background task %@ starting"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  takeXPCTransaction(v5);
  if (xpc_activity_get_state(activity) == 2)
  {
    +[ADBackgroundTaskScheduler sharedInstance](ADBackgroundTaskScheduler, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleXPCActivity:withID:", activity, *(_QWORD *)(a1 + 40));

  }
  releaseXPCTransaction(v5);

}

- (void)cancelBackgroundTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  ADBackgroundTaskScheduler *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]: Canceling XPC activity: %@"), objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog(CFSTR("LATDLogging"), v5, 0);

  +[ADServer workQueue](ADServer, "workQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__ADBackgroundTaskScheduler_cancelBackgroundTask___block_invoke;
  v8[3] = &unk_1E82B1F90;
  v9 = v4;
  v10 = self;
  v7 = v4;
  objc_msgSend(v6, "addOperationWithBlock:", v8);

}

void __50__ADBackgroundTaskScheduler_cancelBackgroundTask___block_invoke(uint64_t a1)
{
  id v2;

  xpc_activity_unregister((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]: Cancelled XPC activity: %@"), objc_opt_class(), *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  _ADLog(CFSTR("LATDLogging"), v2, 0);

}

- (void)checkOnTask:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD handler[4];
  id v10;
  id v11;

  v3 = objc_retainAutorelease(a3);
  v4 = (const char *)objc_msgSend(v3, "UTF8String");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.adprivacyd Checking on background task %@"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0C80748];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __41__ADBackgroundTaskScheduler_checkOnTask___block_invoke;
  handler[3] = &unk_1E82B1F40;
  v10 = v5;
  v11 = v3;
  v7 = v3;
  v8 = v5;
  xpc_activity_register(v4, v6, handler);

}

void __41__ADBackgroundTaskScheduler_checkOnTask___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _xpc_activity_s *activity;

  activity = a2;
  takeXPCTransaction(*(void **)(a1 + 32));
  if ((xpc_activity_get_state(activity) & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    +[ADBackgroundTaskScheduler sharedInstance](ADBackgroundTaskScheduler, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleXPCActivity:withID:", activity, *(_QWORD *)(a1 + 40));

  }
  releaseXPCTransaction(*(void **)(a1 + 32));

}

@end
