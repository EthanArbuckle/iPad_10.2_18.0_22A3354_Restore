@implementation BGSystemTaskScheduler

+ (BGSystemTaskScheduler)sharedScheduler
{
  if (sharedScheduler_onceToken != -1)
    dispatch_once(&sharedScheduler_onceToken, &__block_literal_global_1);
  return (BGSystemTaskScheduler *)(id)sharedScheduler_sharedScheduler;
}

void __40__BGSystemTaskScheduler_sharedScheduler__block_invoke()
{
  BGSystemTaskScheduler *v0;
  void *v1;

  v0 = objc_alloc_init(BGSystemTaskScheduler);
  v1 = (void *)sharedScheduler_sharedScheduler;
  sharedScheduler_sharedScheduler = (uint64_t)v0;

}

- (BGSystemTaskScheduler)init
{
  BGSystemTaskScheduler *v2;
  BGSystemTaskScheduler *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *registrations;
  NSMutableDictionary *v6;
  NSMutableDictionary *preRunningTasksMap;
  NSMutableDictionary *v8;
  NSMutableDictionary *runningTasksMap;
  NSMutableDictionary *v10;
  NSMutableDictionary *pendingTaskRegistrationsMap;
  uint64_t v12;
  _DASScheduler *scheduler;
  os_log_t v14;
  void *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *internalQueue;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)BGSystemTaskScheduler;
  v2 = -[BGSystemTaskScheduler init](&v20, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    registrations = v3->_registrations;
    v3->_registrations = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    preRunningTasksMap = v3->_preRunningTasksMap;
    v3->_preRunningTasksMap = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    runningTasksMap = v3->_runningTasksMap;
    v3->_runningTasksMap = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingTaskRegistrationsMap = v3->_pendingTaskRegistrationsMap;
    v3->_pendingTaskRegistrationsMap = v10;

    objc_msgSend(MEMORY[0x1E0D1D928], "schedulerWithClientName:", CFSTR("BGSTFramework"));
    v12 = objc_claimAutoreleasedReturnValue();
    scheduler = v3->_scheduler;
    v3->_scheduler = (_DASScheduler *)v12;

    v14 = os_log_create("com.apple.BackgroundSystemTasks", "BGSTFramework");
    v15 = (void *)_log;
    _log = (uint64_t)v14;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.bg.system.task.internal.queue", v16);
    internalQueue = v3->_internalQueue;
    v3->_internalQueue = (OS_dispatch_queue *)v17;

    -[BGSystemTaskScheduler installResubmissionHandler](v3, "installResubmissionHandler");
    -[BGSystemTaskScheduler installEventStreamHandler](v3, "installEventStreamHandler");
  }
  return v3;
}

- (BOOL)registerForTaskWithIdentifier:(id)a3 usingQueue:(id)a4 launchHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v18;
  BGSystemTaskScheduler *v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[BGSystemTaskScheduler internalQueue](self, "internalQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v11);

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 1;
  -[BGSystemTaskScheduler internalQueue](self, "internalQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__BGSystemTaskScheduler_registerForTaskWithIdentifier_usingQueue_launchHandler___block_invoke;
  block[3] = &unk_1E920F9B0;
  v18 = v8;
  v19 = self;
  v21 = v10;
  v22 = &v23;
  v20 = v9;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  dispatch_sync(v12, block);

  LOBYTE(v10) = *((_BYTE *)v24 + 24);
  _Block_object_dispose(&v23, 8);
  return (char)v10;
}

void __80__BGSystemTaskScheduler_registerForTaskWithIdentifier_usingQueue_launchHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  BGSystemTaskSchedulerRegistration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEBUG))
    __80__BGSystemTaskScheduler_registerForTaskWithIdentifier_usingQueue_launchHandler___block_invoke_cold_3();
  objc_msgSend(*(id *)(a1 + 40), "registrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __80__BGSystemTaskScheduler_registerForTaskWithIdentifier_usingQueue_launchHandler___block_invoke_cold_2();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }
  else
  {
    v4 = -[BGSystemTaskSchedulerRegistration initWithIdentifier:launchQueue:launchHandler:]([BGSystemTaskSchedulerRegistration alloc], "initWithIdentifier:launchQueue:launchHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 40), "registrations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 32));

    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
    v6 = (void *)xpc_copy_event();
    if (v6)
    {
      +[BGSystemTaskRequest taskRequestWithDescriptor:withIdentifier:](BGSystemTaskRequest, "taskRequestWithDescriptor:withIdentifier:", v6, *(_QWORD *)(a1 + 32));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "registrations");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTaskRequest:", v7);

      if (v7)
      {
        +[BGSystemTaskRequest descriptorWithTaskRequest:](BGSystemTaskRequest, "descriptorWithTaskRequest:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "registrations");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setDescriptor:", v10);

        objc_msgSend(*(id *)(a1 + 40), "pendingTaskRegistrationsMap");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v15 = _log;
          if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
          {
            v16 = *(_QWORD *)(a1 + 32);
            v23 = 138412290;
            v24 = v16;
            _os_log_impl(&dword_1D13A5000, v15, OS_LOG_TYPE_INFO, "Processing pending event for %@", (uint8_t *)&v23, 0xCu);
          }
          v17 = *(void **)(a1 + 40);
          objc_msgSend(v17, "pendingTaskRegistrationsMap");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "registrations");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "processEvent:forRegistration:", v19, v21);

          objc_msgSend(*(id *)(a1 + 40), "pendingTaskRegistrationsMap");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
          __80__BGSystemTaskScheduler_registerForTaskWithIdentifier_usingQueue_launchHandler___block_invoke_cold_1();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      }

    }
  }
}

- (void)installResubmissionHandler
{
  const char *v3;
  NSObject *internalQueue;
  _QWORD v5[5];
  int out_token;

  out_token = 0;
  v3 = (const char *)objc_msgSend(CFSTR("com.apple.bg.system.task.resubmission"), "UTF8String");
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__BGSystemTaskScheduler_installResubmissionHandler__block_invoke;
  v5[3] = &unk_1E920F9D8;
  v5[4] = self;
  notify_register_dispatch(v3, &out_token, internalQueue, v5);
}

void __51__BGSystemTaskScheduler_installResubmissionHandler__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "runningTasksMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    v4 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_1D13A5000, v4, OS_LOG_TYPE_DEFAULT, "Resubmitting running BGSTs %{public}@", (uint8_t *)&v6, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "scheduler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resubmitRunningTasks:", v3);

  }
}

- (void)installEventStreamHandler
{
  NSObject *v3;
  _QWORD handler[5];

  -[BGSystemTaskScheduler internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __50__BGSystemTaskScheduler_installEventStreamHandler__block_invoke;
  handler[3] = &unk_1E920FA50;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.bg.system.task", v3, handler);

}

void __50__BGSystemTaskScheduler_installEventStreamHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E0C81298]));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v7, "processEvent:forRegistration:", v3, v6);
  }
  else
  {
    objc_msgSend(v7, "pendingTaskRegistrationsMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v3, v4);

    v9 = dispatch_time(0, 3000000000);
    objc_msgSend(*(id *)(a1 + 32), "internalQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50__BGSystemTaskScheduler_installEventStreamHandler__block_invoke_2;
    v11[3] = &unk_1E920FA28;
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v4;
    dispatch_after(v9, v10, v11);

  }
}

void __50__BGSystemTaskScheduler_installEventStreamHandler__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "registrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __50__BGSystemTaskScheduler_installEventStreamHandler__block_invoke_2_cold_1();
    objc_msgSend(*(id *)(a1 + 32), "scheduler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__BGSystemTaskScheduler_installEventStreamHandler__block_invoke_67;
    v7[3] = &unk_1E920FA00;
    v8 = v5;
    objc_msgSend(v4, "unregisterSystemTaskWithIdentifier:completionHandler:", v8, v7);

    objc_msgSend(*(id *)(a1 + 32), "pendingTaskRegistrationsMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  }
}

uint64_t __50__BGSystemTaskScheduler_installEventStreamHandler__block_invoke_67(uint64_t result, char a2)
{
  uint64_t v2;
  uint64_t v3;

  if ((a2 & 1) == 0)
  {
    objc_msgSend(objc_retainAutorelease(*(id *)(result + 32)), "UTF8String", v2, v3);
    return xpc_set_event();
  }
  return result;
}

- (void)processEvent:(id)a3 forRegistration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int64_t int64;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  int64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "taskRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    xpc_dictionary_get_value(v6, "run");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 == (void *)MEMORY[0x1E0C81240])
    {
      v15 = (void *)_log;
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
      {
        v16 = v15;
        objc_msgSend(v7, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412290;
        v19 = v17;
        _os_log_impl(&dword_1D13A5000, v16, OS_LOG_TYPE_INFO, "Received run request for %@", (uint8_t *)&v18, 0xCu);

      }
      -[BGSystemTaskScheduler runTaskWithRegistration:](self, "runTaskWithRegistration:", v7);
    }
    else
    {
      int64 = xpc_dictionary_get_int64(v6, "expirationReason");
      v11 = (void *)_log;
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
      {
        v12 = v11;
        objc_msgSend(v7, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412546;
        v19 = v13;
        v20 = 2048;
        v21 = int64;
        _os_log_impl(&dword_1D13A5000, v12, OS_LOG_TYPE_INFO, "Received request to expire %@ with reason: %lu", (uint8_t *)&v18, 0x16u);

      }
      -[BGSystemTaskScheduler expireTaskWithRegistration:withReason:](self, "expireTaskWithRegistration:withReason:", v7, int64);
    }

  }
  else
  {
    v14 = (void *)_log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      -[BGSystemTaskScheduler processEvent:forRegistration:].cold.1(v14);
  }

}

- (BOOL)submitTaskRequest:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  int v10;
  BOOL v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  BGSystemTaskScheduler *v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v6 = a3;
  -[BGSystemTaskScheduler internalQueue](self, "internalQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  -[BGSystemTaskScheduler internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke;
  v16 = &unk_1E920FAA0;
  v17 = self;
  v9 = v6;
  v18 = v9;
  v19 = &v25;
  v20 = &v21;
  dispatch_sync(v8, &v13);

  v10 = *((unsigned __int8 *)v26 + 24);
  if (a4 && !*((_BYTE *)v26 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BGSystemTaskSchedulerErrorDomain"), v22[3], 0, v13, v14, v15, v16, v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v10 = *((unsigned __int8 *)v26 + 24);
  }
  v11 = v10 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v11;
}

void __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "registrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v10 = (void *)_log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_cold_1(a1 + 40, v10);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = 6;
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "preRunningTasksMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)_log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_cold_5(a1 + 40, v9);
LABEL_11:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = 8;
LABEL_12:
    *(_QWORD *)(v11 + 24) = v12;
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "runningTasksMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)_log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_cold_4(a1 + 40, v16);
    goto LABEL_11;
  }
  v17 = objc_msgSend(*v3, "isMemberOfClass:", objc_opt_class());
  objc_msgSend(v5, "taskRequest");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = (void *)_log;
    if ((v17 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
        __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_cold_3(a1 + 40, v19);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v12 = 5;
      goto LABEL_12;
    }
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *v3;
      v21 = v19;
      objc_msgSend(v20, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v22;
      _os_log_impl(&dword_1D13A5000, v21, OS_LOG_TYPE_DEFAULT, "submitTaskRequest: Redundant FastPass submission request for %{public}@", buf, 0xCu);

    }
  }
  +[BGSystemTaskRequest descriptorWithTaskRequest:](BGSystemTaskRequest, "descriptorWithTaskRequest:", *v3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(*(id *)(a1 + 32), "scheduler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_71;
    v27[3] = &unk_1E920FA78;
    v28 = v5;
    v29 = *(id *)(a1 + 40);
    v30 = v23;
    v31 = *(_OWORD *)(a1 + 48);
    objc_msgSend(v24, "submitTaskRequestWithIdentifier:descriptor:completionHandler:", v25, v30, v27);

  }
  else
  {
    v26 = (void *)_log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_cold_2(a1 + 40, v26);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 4;
  }

LABEL_13:
}

void __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_71(uint64_t a1, int a2)
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = a1 + 40;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setTaskRequest:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setDescriptor:", *(_QWORD *)(a1 + 48));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v4, "UTF8String");
    xpc_set_event();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 3;
    v5 = (void *)_log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_71_cold_1(v3, v5);
  }
}

- (BOOL)updateTaskRequest:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  int v10;
  BOOL v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  BGSystemTaskScheduler *v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v6 = a3;
  -[BGSystemTaskScheduler internalQueue](self, "internalQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  -[BGSystemTaskScheduler internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke;
  v16 = &unk_1E920FAA0;
  v17 = self;
  v9 = v6;
  v18 = v9;
  v19 = &v25;
  v20 = &v21;
  dispatch_sync(v8, &v13);

  v10 = *((unsigned __int8 *)v26 + 24);
  if (a4 && !*((_BYTE *)v26 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BGSystemTaskSchedulerErrorDomain"), v22[3], 0, v13, v14, v15, v16, v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v10 = *((unsigned __int8 *)v26 + 24);
  }
  v11 = v10 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v11;
}

void __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "registrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v13 = (void *)_log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_cold_1(a1 + 40, v13);
    goto LABEL_11;
  }
  objc_msgSend(v5, "taskRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v14 = (void *)_log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_cold_2(a1 + 40, v14);
LABEL_11:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = 6;
LABEL_12:
    *(_QWORD *)(v11 + 24) = v12;
    goto LABEL_13;
  }
  v7 = objc_opt_class();
  objc_msgSend(v5, "taskRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();

  if (v7 != v9)
  {
    v10 = (void *)_log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_cold_6(a1 + 40, v10);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = 4;
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "preRunningTasksMap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (void *)_log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_cold_5(a1 + 40, v18);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = 8;
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "runningTasksMap");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21 && (objc_msgSend(v21, "expiring") & 1) == 0)
  {
    v31 = (void *)_log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_cold_4(a1 + 40, v31);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 8;
  }
  else
  {
    +[BGSystemTaskRequest descriptorWithTaskRequest:](BGSystemTaskRequest, "descriptorWithTaskRequest:", *v3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v5, "descriptor");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23
        && (v24 = (void *)v23,
            objc_msgSend(v5, "descriptor"),
            v25 = (void *)objc_claimAutoreleasedReturnValue(),
            v26 = xpc_equal(v22, v25),
            v25,
            v24,
            v26))
      {
        v27 = (void *)_log;
        if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
        {
          v28 = (void *)*v3;
          v29 = v27;
          objc_msgSend(v28, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v48 = v30;
          _os_log_impl(&dword_1D13A5000, v29, OS_LOG_TYPE_INFO, "updateTaskRequest: No change in task request for %{public}@", buf, 0xCu);

        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "scheduler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_73;
        v39[3] = &unk_1E920FAC8;
        v40 = v5;
        v41 = *(id *)(a1 + 40);
        v34 = v22;
        v35 = *(_QWORD *)(a1 + 48);
        v42 = v34;
        v45 = v35;
        v36 = v21;
        v37 = *(_QWORD *)(a1 + 32);
        v43 = v36;
        v44 = v37;
        v46 = *(_QWORD *)(a1 + 56);
        objc_msgSend(v32, "updateTaskRequestWithIdentifier:descriptor:completionHandler:", v33, v34, v39);

      }
    }
    else
    {
      v38 = (void *)_log;
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
        __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_cold_3(a1 + 40, v38);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 4;
    }

  }
LABEL_13:

}

void __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_73(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setTaskRequest:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setDescriptor:", *(_QWORD *)(a1 + 48));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    v3 = *(void **)(a1 + 56);
    if (v3)
    {
      if (objc_msgSend(v3, "expiring"))
      {
        objc_msgSend(*(id *)(a1 + 64), "runningTasksMap");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "identifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "removeObjectForKey:", v5);

        objc_msgSend(*(id *)(a1 + 56), "clearLocked");
      }
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 3;
    v6 = (void *)_log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_73_cold_1(a1, v6);
  }
}

- (BOOL)cancelTaskRequestWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  int v10;
  BOOL v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  BGSystemTaskScheduler *v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v6 = a3;
  -[BGSystemTaskScheduler internalQueue](self, "internalQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  -[BGSystemTaskScheduler internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __63__BGSystemTaskScheduler_cancelTaskRequestWithIdentifier_error___block_invoke;
  v16 = &unk_1E920FAA0;
  v17 = self;
  v9 = v6;
  v18 = v9;
  v19 = &v25;
  v20 = &v21;
  dispatch_sync(v8, &v13);

  v10 = *((unsigned __int8 *)v26 + 24);
  if (a4 && !*((_BYTE *)v26 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BGSystemTaskSchedulerErrorDomain"), v22[3], 0, v13, v14, v15, v16, v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v10 = *((unsigned __int8 *)v26 + 24);
  }
  v11 = v10 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v11;
}

void __63__BGSystemTaskScheduler_cancelTaskRequestWithIdentifier_error___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "registrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (_QWORD *)(a1 + 40);
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "taskRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "runningTasksMap");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", *(_QWORD *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7 && (objc_msgSend(v7, "expiring") & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
          __63__BGSystemTaskScheduler_cancelTaskRequestWithIdentifier_error___block_invoke_cold_3();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 8;
        goto LABEL_25;
      }
      objc_msgSend(*(id *)(a1 + 32), "scheduler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(a1 + 40);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __63__BGSystemTaskScheduler_cancelTaskRequestWithIdentifier_error___block_invoke_74;
      v17[3] = &unk_1E920FA00;
      v18 = v9;
      objc_msgSend(v8, "unregisterSystemTaskWithIdentifier:completionHandler:", v18, v17);

      objc_msgSend(v4, "setTaskRequest:", 0);
      objc_msgSend(v4, "setDescriptor:", 0);
      if (v7 && objc_msgSend(v7, "expiring"))
      {
        v10 = _log;
        if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
        {
          v11 = *v3;
          *(_DWORD *)buf = 138543362;
          v20 = v11;
          _os_log_impl(&dword_1D13A5000, v10, OS_LOG_TYPE_DEFAULT, "Canceled expiring task %{public}@", buf, 0xCu);
        }
        objc_msgSend(*(id *)(a1 + 32), "runningTasksMap");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "preRunningTasksMap");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", *(_QWORD *)(a1 + 40));
        v14 = objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          v7 = 0;
          goto LABEL_24;
        }
        v15 = _log;
        if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
        {
          v16 = *v3;
          *(_DWORD *)buf = 138543362;
          v20 = v16;
          _os_log_impl(&dword_1D13A5000, v15, OS_LOG_TYPE_DEFAULT, "Canceled pre-running task %{public}@", buf, 0xCu);
        }
        objc_msgSend(*(id *)(a1 + 32), "preRunningTasksMap");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)v14;
      }
      objc_msgSend(v12, "removeObjectForKey:", *v3);

      objc_msgSend(v7, "clearLocked");
LABEL_24:

LABEL_25:
      goto LABEL_26;
    }
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __63__BGSystemTaskScheduler_cancelTaskRequestWithIdentifier_error___block_invoke_cold_2();
  }
  else if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
  {
    __63__BGSystemTaskScheduler_cancelTaskRequestWithIdentifier_error___block_invoke_cold_1();
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 6;
LABEL_26:

}

uint64_t __63__BGSystemTaskScheduler_cancelTaskRequestWithIdentifier_error___block_invoke_74(uint64_t result, char a2)
{
  uint64_t v2;
  uint64_t v3;

  if ((a2 & 1) == 0)
  {
    objc_msgSend(objc_retainAutorelease(*(id *)(result + 32)), "UTF8String", v2, v3);
    return xpc_set_event();
  }
  return result;
}

- (id)taskRequestForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  -[BGSystemTaskScheduler internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  -[BGSystemTaskScheduler internalQueue](self, "internalQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__BGSystemTaskScheduler_taskRequestForIdentifier___block_invoke;
  block[3] = &unk_1E920FAF0;
  block[4] = self;
  v11 = v4;
  v12 = &v13;
  v7 = v4;
  dispatch_sync(v6, block);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __50__BGSystemTaskScheduler_taskRequestForIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "registrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "taskRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "copy");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  else
  {
    v8 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1D13A5000, v8, OS_LOG_TYPE_DEFAULT, "taskRequestForIdentifier called before registering task %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }

}

- (BOOL)resumeScheduling:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  int v10;
  BOOL v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  BGSystemTaskScheduler *v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v6 = a3;
  -[BGSystemTaskScheduler internalQueue](self, "internalQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  -[BGSystemTaskScheduler internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke;
  v16 = &unk_1E920FAA0;
  v17 = self;
  v9 = v6;
  v18 = v9;
  v19 = &v25;
  v20 = &v21;
  dispatch_sync(v8, &v13);

  v10 = *((unsigned __int8 *)v26 + 24);
  if (a4 && !*((_BYTE *)v26 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BGSystemTaskSchedulerErrorDomain"), v22[3], 0, v13, v14, v15, v16, v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v10 = *((unsigned __int8 *)v26 + 24);
  }
  v11 = v10 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v11;
}

void __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  __int128 v15;

  objc_msgSend(*(id *)(a1 + 32), "registrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke_cold_1();
    goto LABEL_11;
  }
  objc_msgSend(v3, "taskRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke_cold_2();
LABEL_11:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = 6;
LABEL_12:
    *(_QWORD *)(v7 + 24) = v8;
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "preRunningTasksMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke_cold_4();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = 8;
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "runningTasksMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke_cold_3();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 8;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "scheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 40);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke_75;
    v13[3] = &unk_1E920FB18;
    v14 = v12;
    v15 = *(_OWORD *)(a1 + 48);
    objc_msgSend(v11, "resumeTaskSchedulingWithIdentifier:completionHandler:", v14, v13);

  }
LABEL_13:

}

void __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke_75(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke_75_cold_1();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 3;
  }
}

- (void)runTaskWithRegistration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  __objc2_class **v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  dispatch_qos_class_t qos_class;
  void *v27;
  uint64_t v28;
  dispatch_qos_class_t v29;
  id v30;
  const char *v31;
  NSObject *v32;
  NSObject *v33;
  dispatch_queue_t v34;
  NSObject *v35;
  _QWORD block[5];
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  BGSystemTaskScheduler *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  BGSystemTaskScheduler *v47;
  id v48;
  _QWORD v49[5];
  id v50;
  id v51;
  id v52;
  id location[2];

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_runningTasksMap, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      -[BGSystemTaskScheduler runTaskWithRegistration:].cold.3();
    -[BGSystemTaskScheduler scheduler](self, "scheduler");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "acknowledgeSystemTaskLaunchWithIdentifier:error:", v5, 0);
LABEL_22:

    goto LABEL_23;
  }
  objc_msgSend(v4, "taskRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isMemberOfClass:", objc_opt_class());

  if ((v9 & 1) != 0)
  {
    v10 = off_1E920F448;
LABEL_11:
    v15 = (void *)objc_msgSend(objc_alloc(*v10), "initWithIdentifier:", v5);
    objc_msgSend(v15, "prepareForRunning");
    objc_initWeak(location, v15);
    v16 = MEMORY[0x1E0C809B0];
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke;
    v49[3] = &unk_1E920FB40;
    objc_copyWeak(&v52, location);
    v49[4] = self;
    v17 = v5;
    v50 = v17;
    v18 = v4;
    v51 = v18;
    objc_msgSend(v15, "setCompletionHandler:", v49);
    v44[0] = v16;
    v44[1] = 3221225472;
    v44[2] = __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_81;
    v44[3] = &unk_1E920FB68;
    objc_copyWeak(&v48, location);
    v19 = v17;
    v45 = v19;
    v20 = v18;
    v46 = v20;
    v47 = self;
    objc_msgSend(v15, "setExpirationAckHandler:", v44);
    v40[0] = v16;
    v40[1] = 3221225472;
    v40[2] = __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_83;
    v40[3] = &unk_1E920FB90;
    objc_copyWeak(&v43, location);
    v21 = v19;
    v41 = v21;
    v42 = self;
    objc_msgSend(v15, "setClientLedExpirationHandler:", v40);
    -[BGSystemTaskScheduler preRunningTasksMap](self, "preRunningTasksMap");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v15, v21);

    objc_msgSend(v20, "launchQueue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v20, "taskRequest");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "priority") >= 3)
      {

      }
      else
      {
        objc_msgSend(v20, "launchQueue");
        v25 = objc_claimAutoreleasedReturnValue();
        qos_class = dispatch_queue_get_qos_class(v25, 0);

        v16 = MEMORY[0x1E0C809B0];
        if (qos_class >= 0xA && os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_FAULT))
          -[BGSystemTaskScheduler runTaskWithRegistration:].cold.1();
      }
    }
    else
    {
      objc_msgSend(v20, "taskRequest");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "priority");

      if (v28 == 3)
        v29 = QOS_CLASS_DEFAULT;
      else
        v29 = QOS_CLASS_BACKGROUND;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.BGSystemTaskScheduler.launchQ.(%@)"), v21);
      v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v31 = (const char *)objc_msgSend(v30, "cStringUsingEncoding:", 4);
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v32 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v32, v29, 0);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = dispatch_queue_create(v31, v33);
      objc_msgSend(v20, "setLaunchQueue:", v34);

      v16 = MEMORY[0x1E0C809B0];
    }
    objc_msgSend(v20, "launchQueue");
    v35 = objc_claimAutoreleasedReturnValue();
    block[0] = v16;
    block[1] = 3221225472;
    block[2] = __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_88;
    block[3] = &unk_1E920FBE0;
    block[4] = self;
    v37 = v21;
    v38 = v15;
    v39 = v20;
    v7 = v15;
    dispatch_async(v35, block);

    objc_destroyWeak(&v43);
    objc_destroyWeak(&v48);

    objc_destroyWeak(&v52);
    objc_destroyWeak(location);
    goto LABEL_22;
  }
  objc_msgSend(v4, "taskRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isMemberOfClass:", objc_opt_class());

  if ((v12 & 1) != 0)
  {
    v10 = off_1E920F438;
    goto LABEL_11;
  }
  objc_msgSend(v4, "taskRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isMemberOfClass:", objc_opt_class());

  if ((v14 & 1) != 0)
  {
    v10 = off_1E920F428;
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_FAULT))
    -[BGSystemTaskScheduler runTaskWithRegistration:].cold.2();
LABEL_23:

}

void __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = WeakRetained;
      _os_log_impl(&dword_1D13A5000, v3, OS_LOG_TYPE_DEFAULT, "Marking task %{public}@ complete", (uint8_t *)&v9, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "scheduler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "completeSystemTaskWithIdentifier:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 48), "taskRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "setTaskRequest:", 0);
      objc_msgSend(*(id *)(a1 + 48), "setDescriptor:", 0);
    }
    objc_msgSend(*(id *)(a1 + 32), "runningTasksMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

  }
}

void __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_81(uint64_t a1, double a2)
{
  id WeakRetained;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "isMemberOfClass:", objc_opt_class())
      && objc_msgSend(WeakRetained, "expirationReason") == 1)
    {
      objc_msgSend(*(id *)(a1 + 40), "setTaskRequest:", 0);
      objc_msgSend(*(id *)(a1 + 40), "setDescriptor:", 0);
      v5 = _log;
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138543362;
        v11 = WeakRetained;
        _os_log_impl(&dword_1D13A5000, v5, OS_LOG_TYPE_DEFAULT, "Completing FastPass task %{public}@ because it was expired due to runtime limitations", (uint8_t *)&v10, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 48), "scheduler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "completeSystemTaskWithIdentifier:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      v7 = _log;
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138543362;
        v11 = WeakRetained;
        _os_log_impl(&dword_1D13A5000, v7, OS_LOG_TYPE_DEFAULT, "Acking task %{public}@ expired", (uint8_t *)&v10, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 48), "scheduler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "acknowledgeSystemTaskSuspensionWithIdentifier:retryAfter:", *(_QWORD *)(a1 + 32), a2);
    }

    objc_msgSend(*(id *)(a1 + 48), "runningTasksMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v9);

  }
  else if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
  {
    __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_81_cold_1();
  }

}

BOOL __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_83(uint64_t a1, double a2)
{
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, char);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = _log;
  if (WeakRetained)
  {
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = WeakRetained;
      _os_log_impl(&dword_1D13A5000, v5, OS_LOG_TYPE_DEFAULT, "Client requested expiration of task %{public}@", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "scheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_84;
    v14 = &unk_1E920F928;
    v16 = &v17;
    v15 = v7;
    objc_msgSend(v6, "handleClientLedSystemTaskExpirationWithIdentifier:retryAfter:completionHandler:", v15, &v11, a2);

    objc_msgSend(*(id *)(a1 + 40), "runningTasksMap", v11, v12, v13, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

    v9 = *((unsigned __int8 *)v18 + 24);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_83_cold_1();
    v9 = *((unsigned __int8 *)v18 + 24);
  }

  _Block_object_dispose(&v17, 8);
  return v9 != 0;
}

void __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_84(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if ((a2 & 1) == 0 && os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
    __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_84_cold_1();
}

void __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_88(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD);
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  _QWORD block[5];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__0;
  v29 = __Block_byref_object_dispose__0;
  v30 = 0;
  objc_msgSend(*(id *)(a1 + 32), "internalQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_2;
  block[3] = &unk_1E920FBB8;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v20 = v4;
  v22 = &v31;
  v23 = &v25;
  v24 = &v35;
  v21 = *(id *)(a1 + 48);
  dispatch_sync(v2, block);

  if (*((_BYTE *)v32 + 24))
  {
    v5 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v40 = v6;
      v7 = "Tried to run a task that is already running; ignoring request for %{public}@";
LABEL_4:
      _os_log_impl(&dword_1D13A5000, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
    }
  }
  else
  {
    if (!*((_BYTE *)v36 + 24))
    {
      dispatch_get_global_queue(9, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      v16[0] = v3;
      v16[1] = 3221225472;
      v16[2] = __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_89;
      v16[3] = &unk_1E920FA28;
      v13 = *(id *)(a1 + 56);
      v14 = *(_QWORD *)(a1 + 32);
      v17 = v13;
      v18 = v14;
      dispatch_async(v12, v16);

      goto LABEL_13;
    }
    v8 = v26[5];
    v5 = _log;
    v9 = os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT);
    if (!v8)
    {
      if (!v9)
        goto LABEL_13;
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v40 = v15;
      v7 = "Not calling launch handler for %{public}@ since it doesn't exist anymore OR was canceled/resubmitted";
      goto LABEL_4;
    }
    if (v9)
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v40 = v10;
      _os_log_impl(&dword_1D13A5000, v5, OS_LOG_TYPE_DEFAULT, "Calling launch handler for %{public}@", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 56), "launchHandler");
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v11[2](v11, v26[5]);

  }
LABEL_13:

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
}

void __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "runningTasksMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "preRunningTasksMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *(_QWORD *)(a1 + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "scheduler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v14 = 0;
      v10 = objc_msgSend(v8, "acknowledgeSystemTaskLaunchWithIdentifier:error:", v9, &v14);
      v11 = v14;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v10;

      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      {
        objc_msgSend(*(id *)(a1 + 32), "runningTasksMap");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 40));

        objc_msgSend(*(id *)(a1 + 32), "preRunningTasksMap");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

      }
      else if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      {
        __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_2_cold_1(a1);
      }

    }
  }
}

uint64_t __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_89(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)_log;
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1D13A5000, v4, OS_LOG_TYPE_DEFAULT, "Cancelling and resubmitting %{public}@ due to a failed launch acknowledgment", (uint8_t *)&v7, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 40), "handleDeniedTaskLaunch:", *(_QWORD *)(a1 + 32));
}

- (void)handleDeniedTaskLaunch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "taskRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v8 = -[BGSystemTaskScheduler cancelTaskRequestWithIdentifier:error:](self, "cancelTaskRequestWithIdentifier:error:", v7, &v15);
  v9 = v15;

  if (v8)
  {
    v14 = v9;
    v10 = -[BGSystemTaskScheduler submitTaskRequest:error:](self, "submitTaskRequest:error:", v6, &v14);
    v11 = v14;

    if (!v10)
    {
      v12 = (void *)_log;
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
        -[BGSystemTaskScheduler handleDeniedTaskLaunch:].cold.1(v12, v4);
    }
    v9 = v11;
  }
  else
  {
    v13 = (void *)_log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      -[BGSystemTaskScheduler handleDeniedTaskLaunch:].cold.2(v13, v4);
  }

}

- (void)expireTaskWithRegistration:(id)a3 withReason:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *internalQueue;
  NSObject *v15;
  _QWORD block[5];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BGSystemTaskScheduler runningTasksMap](self, "runningTasksMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  if (v8)
  {
    objc_msgSend(v8, "completionHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if ((objc_msgSend(v8, "hasValidExpirationHandler") & 1) == 0)
      {
        v12 = _log;
        if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v20 = v6;
          _os_log_impl(&dword_1D13A5000, v12, OS_LOG_TYPE_DEFAULT, "Expiration handler not found for %{public}@, caching expiration request in task.", buf, 0xCu);
        }
      }
      objc_msgSend(v8, "handleExpirationWithReason:", a4);
      v13 = dispatch_time(0, 300000000000);
      internalQueue = self->_internalQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__BGSystemTaskScheduler_expireTaskWithRegistration_withReason___block_invoke;
      block[3] = &unk_1E920FC08;
      block[4] = self;
      v17 = v6;
      v18 = v10;
      dispatch_after(v13, internalQueue, block);

    }
    else
    {
      v15 = _log;
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v6;
        _os_log_impl(&dword_1D13A5000, v15, OS_LOG_TYPE_DEFAULT, "Not expiring, task %{public}@ already finished", buf, 0xCu);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
  {
    -[BGSystemTaskScheduler expireTaskWithRegistration:withReason:].cold.1();
  }

}

void __63__BGSystemTaskScheduler_expireTaskWithRegistration_withReason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  _BOOL4 v7;

  objc_msgSend(*(id *)(a1 + 32), "runningTasksMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "compare:", *(_QWORD *)(a1 + 48)))
    {

    }
    else
    {
      v5 = objc_msgSend(v3, "expiring");

      if (v5)
      {
        v6 = objc_msgSend(v3, "hasValidExpirationHandler");
        v7 = os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR);
        if (v6)
        {
          if (v7)
            __63__BGSystemTaskScheduler_expireTaskWithRegistration_withReason___block_invoke_cold_1();
        }
        else if (v7)
        {
          __63__BGSystemTaskScheduler_expireTaskWithRegistration_withReason___block_invoke_cold_2();
        }
      }
    }
  }

}

- (BOOL)deregisterTaskWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  -[BGSystemTaskScheduler internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  -[BGSystemTaskScheduler internalQueue](self, "internalQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__BGSystemTaskScheduler_deregisterTaskWithIdentifier___block_invoke;
  block[3] = &unk_1E920FAF0;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v7 = v4;
  dispatch_sync(v6, block);

  LOBYTE(v4) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

void __54__BGSystemTaskScheduler_deregisterTaskWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "registrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (uint64_t *)(a1 + 40);
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "runningTasksMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && (objc_msgSend(v6, "expiring") & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
        __54__BGSystemTaskScheduler_deregisterTaskWithIdentifier___block_invoke_cold_2();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      goto LABEL_24;
    }
    objc_msgSend(*(id *)(a1 + 32), "scheduler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 40);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __54__BGSystemTaskScheduler_deregisterTaskWithIdentifier___block_invoke_90;
    v21[3] = &unk_1E920FA00;
    v22 = v8;
    objc_msgSend(v7, "unregisterSystemTaskWithIdentifier:completionHandler:", v22, v21);

    objc_msgSend(*(id *)(a1 + 32), "pendingTaskRegistrationsMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "pendingTaskRegistrationsMap");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

    }
    objc_msgSend(v4, "setTaskRequest:", 0);
    objc_msgSend(v4, "setDescriptor:", 0);
    objc_msgSend(*(id *)(a1 + 32), "registrations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

    if (v6 && objc_msgSend(v6, "expiring"))
    {
      v13 = _log;
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *v3;
        *(_DWORD *)buf = 138543362;
        v24 = v14;
        _os_log_impl(&dword_1D13A5000, v13, OS_LOG_TYPE_DEFAULT, "Deregistered expiring task %{public}@", buf, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "runningTasksMap");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObjectForKey:", v16);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "preRunningTasksMap");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", *(_QWORD *)(a1 + 40));
      v18 = objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        v6 = 0;
        goto LABEL_23;
      }
      v19 = _log;
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *v3;
        *(_DWORD *)buf = 138543362;
        v24 = v20;
        _os_log_impl(&dword_1D13A5000, v19, OS_LOG_TYPE_DEFAULT, "Deregistered pre-running task %{public}@", buf, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "preRunningTasksMap");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
      v6 = (void *)v18;
    }

    objc_msgSend(v6, "clearLocked");
LABEL_23:

LABEL_24:
    goto LABEL_25;
  }
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
    __54__BGSystemTaskScheduler_deregisterTaskWithIdentifier___block_invoke_cold_1();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
LABEL_25:

}

uint64_t __54__BGSystemTaskScheduler_deregisterTaskWithIdentifier___block_invoke_90(uint64_t result, char a2)
{
  uint64_t v2;
  uint64_t v3;

  if ((a2 & 1) == 0)
  {
    objc_msgSend(objc_retainAutorelease(*(id *)(result + 32)), "UTF8String", v2, v3);
    return xpc_set_event();
  }
  return result;
}

- (BOOL)validateTaskIdentifier:(id)a3 resultProduction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  int v13;
  BOOL v14;
  _QWORD block[5];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v8 = a3;
  v9 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEBUG))
    -[BGSystemTaskScheduler validateTaskIdentifier:resultProduction:error:].cold.1((uint64_t)v8);
  -[BGSystemTaskScheduler internalQueue](self, "internalQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__BGSystemTaskScheduler_validateTaskIdentifier_resultProduction_error___block_invoke;
  block[3] = &unk_1E920FC58;
  block[4] = self;
  v11 = v8;
  v17 = v11;
  v19 = &v21;
  v20 = &v27;
  v12 = v9;
  v18 = v12;
  dispatch_sync(v10, block);

  v13 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((_BYTE *)v28 + 24))
  {
    *a5 = objc_retainAutorelease((id)v22[5]);
    v13 = *((unsigned __int8 *)v28 + 24);
  }
  v14 = v13 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

void __71__BGSystemTaskScheduler_validateTaskIdentifier_resultProduction_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[4];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _BYTE v37[128];
  const __CFString *v38;
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "registrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v5 = *(id *)(a1 + 48);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v32 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v11 = *(void **)(a1 + 32);
          objc_msgSend(v10, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v11) = objc_msgSend(v11, "canTaskRegistration:produceResultOfIdentifier:", v3, v12);

          if ((v11 & 1) == 0)
          {
            v15 = (void *)_log;
            if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
              __71__BGSystemTaskScheduler_validateTaskIdentifier_resultProduction_error___block_invoke_cold_2((uint64_t *)(a1 + 40), v15);
            v16 = (void *)MEMORY[0x1E0CB35C8];
            v17 = *(_QWORD *)(a1 + 40);
            v35[0] = CFSTR("taskIdentifier");
            v35[1] = CFSTR("resultIdentifier");
            v36[0] = v17;
            objc_msgSend(v10, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v36[1] = v18;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("BGSystemTaskSchedulerErrorDomain"), 7, v19);
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v22 = *(void **)(v21 + 40);
            *(_QWORD *)(v21 + 40) = v20;

            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
            goto LABEL_14;
          }
          objc_msgSend(v10, "asDASActivityResult");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        if (v7)
          continue;
        break;
      }
    }

    objc_msgSend(*(id *)(a1 + 32), "scheduler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __71__BGSystemTaskScheduler_validateTaskIdentifier_resultProduction_error___block_invoke_97;
    v29[3] = &unk_1E920FC30;
    v30 = *(_OWORD *)(a1 + 56);
    objc_msgSend(v5, "reportSystemTaskWithIdentifier:producedResults:completionHandler:", v14, v4, v29);
LABEL_14:

  }
  else
  {
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __71__BGSystemTaskScheduler_validateTaskIdentifier_resultProduction_error___block_invoke_cold_1();
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *(_QWORD *)(a1 + 40);
    v38 = CFSTR("taskIdentifier");
    v39[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("BGSystemTaskSchedulerErrorDomain"), 6, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }

}

void __71__BGSystemTaskScheduler_validateTaskIdentifier_resultProduction_error___block_invoke_97(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (BOOL)validateTaskIdentifier:(id)a3 resultConsumption:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  int v13;
  BOOL v14;
  _QWORD block[5];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v8 = a3;
  v9 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEBUG))
    -[BGSystemTaskScheduler validateTaskIdentifier:resultConsumption:error:].cold.1((uint64_t)v8);
  -[BGSystemTaskScheduler internalQueue](self, "internalQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__BGSystemTaskScheduler_validateTaskIdentifier_resultConsumption_error___block_invoke;
  block[3] = &unk_1E920FC58;
  block[4] = self;
  v11 = v8;
  v17 = v11;
  v19 = &v21;
  v20 = &v27;
  v12 = v9;
  v18 = v12;
  dispatch_sync(v10, block);

  v13 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((_BYTE *)v28 + 24))
  {
    *a5 = objc_retainAutorelease((id)v22[5]);
    v13 = *((unsigned __int8 *)v28 + 24);
  }
  v14 = v13 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

void __72__BGSystemTaskScheduler_validateTaskIdentifier_resultConsumption_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[2];
  _QWORD v50[2];
  _BYTE v51[128];
  _BYTE v52[128];
  const __CFString *v53;
  _QWORD v54[3];

  v54[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "registrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v38 = v3;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(v3, "taskRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dependencies");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v46 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
      }
      while (v9);
    }

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v13 = *(id *)(a1 + 48);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v42;
      while (2)
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v42 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
          objc_msgSend(v18, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v4, "containsObject:", v19);

          if ((v20 & 1) == 0)
          {
            v24 = (void *)_log;
            if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
              __72__BGSystemTaskScheduler_validateTaskIdentifier_resultConsumption_error___block_invoke_cold_2(v24, v18);
            v25 = (void *)MEMORY[0x1E0CB35C8];
            v26 = *(_QWORD *)(a1 + 40);
            v49[0] = CFSTR("taskIdentifier");
            v49[1] = CFSTR("resultIdentifier");
            v50[0] = v26;
            objc_msgSend(v18, "identifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v50[1] = v27;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("BGSystemTaskSchedulerErrorDomain"), 7, v28);
            v29 = objc_claimAutoreleasedReturnValue();
            v30 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v31 = *(void **)(v30 + 40);
            *(_QWORD *)(v30 + 40) = v29;

            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
            goto LABEL_21;
          }
          objc_msgSend(v18, "asDASActivityResult");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v21);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
        if (v15)
          continue;
        break;
      }
    }

    objc_msgSend(*(id *)(a1 + 32), "scheduler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(a1 + 40);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __72__BGSystemTaskScheduler_validateTaskIdentifier_resultConsumption_error___block_invoke_99;
    v39[3] = &unk_1E920FC30;
    v40 = *(_OWORD *)(a1 + 56);
    objc_msgSend(v22, "reportSystemTaskWithIdentifier:consumedResults:completionHandler:", v23, v5, v39);

LABEL_21:
    v3 = v38;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __72__BGSystemTaskScheduler_validateTaskIdentifier_resultConsumption_error___block_invoke_cold_1();
    v32 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *(_QWORD *)(a1 + 40);
    v53 = CFSTR("taskIdentifier");
    v54[0] = v33;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, &v53, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("BGSystemTaskSchedulerErrorDomain"), 6, v34);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v37 = *(void **)(v36 + 40);
    *(_QWORD *)(v36 + 40) = v35;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }

}

void __72__BGSystemTaskScheduler_validateTaskIdentifier_resultConsumption_error___block_invoke_99(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (BOOL)resetResultsForIdentifier:(id)a3 byTaskIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  int v13;
  BOOL v14;
  _QWORD block[5];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v8 = a3;
  v9 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  -[BGSystemTaskScheduler internalQueue](self, "internalQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__BGSystemTaskScheduler_resetResultsForIdentifier_byTaskIdentifier_error___block_invoke;
  block[3] = &unk_1E920FC80;
  block[4] = self;
  v11 = v9;
  v17 = v11;
  v12 = v8;
  v18 = v12;
  v19 = &v21;
  v20 = &v27;
  dispatch_sync(v10, block);

  v13 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((_BYTE *)v28 + 24))
  {
    *a5 = objc_retainAutorelease((id)v22[5]);
    v13 = *((unsigned __int8 *)v28 + 24);
  }
  v14 = v13 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

void __74__BGSystemTaskScheduler_resetResultsForIdentifier_byTaskIdentifier_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  int8x16_t v13;

  objc_msgSend(*(id *)(a1 + 32), "registrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __74__BGSystemTaskScheduler_resetResultsForIdentifier_byTaskIdentifier_error___block_invoke_cold_1();
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = 6;
    goto LABEL_10;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "canTaskRegistration:produceResultOfIdentifier:", v3, *(_QWORD *)(a1 + 48)) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __74__BGSystemTaskScheduler_resetResultsForIdentifier_byTaskIdentifier_error___block_invoke_cold_2();
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = 7;
LABEL_10:
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("BGSystemTaskSchedulerErrorDomain"), v8, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 32), "scheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__BGSystemTaskScheduler_resetResultsForIdentifier_byTaskIdentifier_error___block_invoke_100;
  v12[3] = &unk_1E920FC30;
  v13 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
  objc_msgSend(v4, "resetResultsForIdentifier:byTaskWithIdentifier:completionHandler:", v5, v6, v12);

LABEL_11:
}

void __74__BGSystemTaskScheduler_resetResultsForIdentifier_byTaskIdentifier_error___block_invoke_100(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)canTaskWithIdentifier:(id)a3 consumeResultOfIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[BGSystemTaskScheduler internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__BGSystemTaskScheduler_canTaskWithIdentifier_consumeResultOfIdentifier___block_invoke;
  v12[3] = &unk_1E920FCA8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = &v16;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v12);

  LOBYTE(v8) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)v8;
}

void __73__BGSystemTaskScheduler_canTaskWithIdentifier_consumeResultOfIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "registrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v3, "taskRequest", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dependencies");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(a1 + 48);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v10) = objc_msgSend(v10, "isEqualToString:", v11);

          if ((_DWORD)v10)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      __73__BGSystemTaskScheduler_canTaskWithIdentifier_consumeResultOfIdentifier___block_invoke_cold_1();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

- (BOOL)canTaskRegistration:(id)a3 produceResultOfIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "taskRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "producedResultIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v5, "taskRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "producedResultIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v6);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)taskStartedWithParameters:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  BGSystemTaskScheduler *v18;
  __int128 *p_buf;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 buf;
  uint64_t v26;
  char v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _log;
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1D13A5000, v7, OS_LOG_TYPE_DEFAULT, "Task started %@", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v26 = 0x2020000000;
  v27 = 1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  -[BGSystemTaskScheduler internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __57__BGSystemTaskScheduler_taskStartedWithParameters_error___block_invoke;
  v16 = &unk_1E920FCD0;
  v9 = v6;
  p_buf = &buf;
  v20 = &v21;
  v17 = v9;
  v18 = self;
  dispatch_sync(v8, &v13);

  if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
  {
    v10 = 1;
  }
  else
  {
    v11 = v22[3];
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BGSystemTaskSchedulerErrorDomain"), v11, 0, v13, v14, v15, v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v10 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
    }
    else
    {
      v10 = 0;
    }
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&buf, 8);

  return v10;
}

void __57__BGSystemTaskScheduler_taskStartedWithParameters_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void **v20;
  uint64_t *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("FeatureCode"), CFSTR("TaskName"), CFSTR("InvolvedProcesses"), CFSTR("Paused"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("FeatureCode"), CFSTR("TaskName"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "count"))
    goto LABEL_7;
  if ((objc_msgSend(v6, "isSubsetOfSet:", v2) & 1) == 0)
    goto LABEL_7;
  v7 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "isSubsetOfSet:", v9);

  if ((v10 & 1) == 0)
  {
LABEL_7:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 4;
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("FeatureCode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", &unk_1E9213798);

  if (!v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("FeatureCode"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqual:", &unk_1E92137B0);

    if (v17)
    {
      objc_msgSend(*(id *)(a1 + 40), "scheduler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *MEMORY[0x1E0D1DA68];
      v28 = &unk_1E92137E0;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = &v28;
      v21 = &v27;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("FeatureCode"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqual:", &unk_1E92137C8);

      if (!v23)
        goto LABEL_6;
      objc_msgSend(*(id *)(a1 + 40), "scheduler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *MEMORY[0x1E0D1DA58];
      v26 = &unk_1E92137E0;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = &v26;
      v21 = &v25;
    }
    objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "updateSystemConstraintsWithParameters:", v24);

    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 40), "scheduler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *MEMORY[0x1E0D1DA70];
  v30[0] = &unk_1E92137E0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateSystemConstraintsWithParameters:", v14);

LABEL_6:
  objc_msgSend(*(id *)(a1 + 40), "scheduler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activityStartedWithParameters:", *(_QWORD *)(a1 + 32));

LABEL_8:
}

- (BOOL)taskStoppedWithParameters:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  BGSystemTaskScheduler *v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = _log;
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl(&dword_1D13A5000, v6, OS_LOG_TYPE_DEFAULT, "Task stopped %@", buf, 0xCu);
  }
  -[BGSystemTaskScheduler internalQueue](self, "internalQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__BGSystemTaskScheduler_taskStoppedWithParameters_error___block_invoke;
  v10[3] = &unk_1E920FA28;
  v11 = v5;
  v12 = self;
  v8 = v5;
  dispatch_sync(v7, v10);

  return 1;
}

void __57__BGSystemTaskScheduler_taskStoppedWithParameters_error___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void **v10;
  uint64_t *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("FeatureCode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", &unk_1E9213798);

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "scheduler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x1E0D1DA70];
    v20[0] = &unk_1E92137F8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateSystemConstraintsWithParameters:", v5);

LABEL_8:
    objc_msgSend(*(id *)(a1 + 40), "scheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activityStoppedWithParameters:", *(_QWORD *)(a1 + 32));
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("FeatureCode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", &unk_1E92137B0);

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "scheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0D1DA68];
    v18 = &unk_1E92137F8;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = &v18;
    v11 = &v17;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("FeatureCode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", &unk_1E92137C8);

    if (!v13)
      goto LABEL_8;
    objc_msgSend(*(id *)(a1 + 40), "scheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0D1DA58];
    v16 = &unk_1E92137F8;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = &v16;
    v11 = &v15;
  }
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateSystemConstraintsWithParameters:", v14);

LABEL_9:
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSMutableDictionary)registrations
{
  return self->_registrations;
}

- (void)setRegistrations:(id)a3
{
  objc_storeStrong((id *)&self->_registrations, a3);
}

- (NSMutableDictionary)preRunningTasksMap
{
  return self->_preRunningTasksMap;
}

- (void)setPreRunningTasksMap:(id)a3
{
  objc_storeStrong((id *)&self->_preRunningTasksMap, a3);
}

- (NSMutableDictionary)runningTasksMap
{
  return self->_runningTasksMap;
}

- (void)setRunningTasksMap:(id)a3
{
  objc_storeStrong((id *)&self->_runningTasksMap, a3);
}

- (NSMutableDictionary)pendingTaskRegistrationsMap
{
  return self->_pendingTaskRegistrationsMap;
}

- (void)setPendingTaskRegistrationsMap:(id)a3
{
  objc_storeStrong((id *)&self->_pendingTaskRegistrationsMap, a3);
}

- (_DASScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_scheduler, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_pendingTaskRegistrationsMap, 0);
  objc_storeStrong((id *)&self->_runningTasksMap, 0);
  objc_storeStrong((id *)&self->_preRunningTasksMap, 0);
  objc_storeStrong((id *)&self->_registrations, 0);
}

void __80__BGSystemTaskScheduler_registerForTaskWithIdentifier_usingQueue_launchHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_6(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "Converting from XPC event descriptor to task request failed for: %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

void __80__BGSystemTaskScheduler_registerForTaskWithIdentifier_usingQueue_launchHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_6(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "Launch handler for task with identifier %@ has already been registered", v2);
  OUTLINED_FUNCTION_1();
}

void __80__BGSystemTaskScheduler_registerForTaskWithIdentifier_usingQueue_launchHandler___block_invoke_cold_3()
{
  os_log_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1D13A5000, v0, OS_LOG_TYPE_DEBUG, "registerForTaskWithIdentifier: %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __50__BGSystemTaskScheduler_installEventStreamHandler__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_6(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "No registration from client for: %{public}@. Unregistering!", v2);
  OUTLINED_FUNCTION_1();
}

- (void)processEvent:(void *)a1 forRegistration:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_11(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v1, v3, "Task request for %{public}@ was likely canceled before the signal from dasd arrived. Ignoring", v4);

  OUTLINED_FUNCTION_2();
}

void __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v2, v4, "submitTaskRequest for %{public}@ called before registering task", v5);

  OUTLINED_FUNCTION_2();
}

void __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_cold_2(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v2, v4, "submitTaskRequest Creating descriptor failed for %{public}@ likely due to invalid params", v5);

  OUTLINED_FUNCTION_2();
}

void __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_cold_3(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v2, v4, "submitTaskRequest for %{public}@ called for a task request already submitted (likely thru plist or before idle-exit)", v5);

  OUTLINED_FUNCTION_2();
}

void __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_cold_4(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v2, v4, "submitTaskRequest called for an already running task %{public}@", v5);

  OUTLINED_FUNCTION_2();
}

void __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_cold_5(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v2, v4, "submitTaskRequest called for a pre-running task %{public}@", v5);

  OUTLINED_FUNCTION_2();
}

void __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_71_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v2, v4, "submitTaskRequest failed for %{public}@", v5);

  OUTLINED_FUNCTION_2();
}

void __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v2, v4, "updateTaskRequest for %{public}@ called before registering task", v5);

  OUTLINED_FUNCTION_2();
}

void __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_cold_2(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v2, v4, "updateTaskRequest No task request found for %{public}@", v5);

  OUTLINED_FUNCTION_2();
}

void __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_cold_3(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v2, v4, "updateTaskRequest Creating descriptor failed for %{public}@ likely due to invalid params", v5);

  OUTLINED_FUNCTION_2();
}

void __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_cold_4(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v2, v4, "updateTaskRequest called for an already running/updated task %{public}@", v5);

  OUTLINED_FUNCTION_2();
}

void __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_cold_5(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v2, v4, "updateTaskRequest called for a pre-running task %{public}@", v5);

  OUTLINED_FUNCTION_2();
}

void __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_cold_6(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v2, v4, "updateTaskRequest called with a different task request type for %{public}@", v5);

  OUTLINED_FUNCTION_2();
}

void __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_73_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v2, v5, "updateTaskRequest failed for %{public}@", v6);

  OUTLINED_FUNCTION_2();
}

void __63__BGSystemTaskScheduler_cancelTaskRequestWithIdentifier_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_6(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "cancelTaskRequestWithIdentifier called before registering task %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

void __63__BGSystemTaskScheduler_cancelTaskRequestWithIdentifier_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_6(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "cancelTaskRequestWithIdentifier No task request found for %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

void __63__BGSystemTaskScheduler_cancelTaskRequestWithIdentifier_error___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_6(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "cancelTaskRequestWithIdentifier called for an already running task %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

void __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_6(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "resumeScheduling called before registering task %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

void __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_6(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "resumeScheduling: No task request found for %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

void __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_6(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "resumeScheduling called for an already running task %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

void __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_6(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "resumeScheduling called for a pre-running task %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

void __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke_75_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "resumeScheduling failed for %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)runTaskWithRegistration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13(&dword_1D13A5000, v0, v1, "%{public}@: launchQueue is of higher QoS than it should be", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)runTaskWithRegistration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13(&dword_1D13A5000, v0, v1, "Found registration of invalid type for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)runTaskWithRegistration:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "%{public}@ already running, did dasd crash?", v2);
  OUTLINED_FUNCTION_1();
}

void __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_81_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "Unable to ack task %{public}@ expiration; missing strong reference to BGSystemTask",
    v2);
  OUTLINED_FUNCTION_1();
}

void __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_83_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "Unable to ack task %{public}@ proactive deferral; missing strong reference to BGSystemTask",
    v2);
  OUTLINED_FUNCTION_1();
}

void __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_84_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "handleClientLedSystemTaskExpirationWithIdentifier failed for %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

void __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 48);
  v3 = 138543618;
  v4 = v1;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8(&dword_1D13A5000, v2, (uint64_t)v2, "System task launch acknowledgment failed for %{public}@ (error: %@)", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)handleDeniedTaskLaunch:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_11(a1);
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8(&dword_1D13A5000, v3, v5, "Failed to submit task request %{public}@ (%@)", v6);

  OUTLINED_FUNCTION_9();
}

- (void)handleDeniedTaskLaunch:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_11(a1);
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8(&dword_1D13A5000, v3, v5, "Failed to cancel currently existing task request for %{public}@ (%@)", v6);

  OUTLINED_FUNCTION_9();
}

- (void)expireTaskWithRegistration:withReason:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "Unable to expire %{public}@ since it wasn't found running", v2);
  OUTLINED_FUNCTION_1();
}

void __63__BGSystemTaskScheduler_expireTaskWithRegistration_withReason___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_6(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "%{public}@ was expired 300s ago, but hasn't responded yet", v2);
  OUTLINED_FUNCTION_1();
}

void __63__BGSystemTaskScheduler_expireTaskWithRegistration_withReason___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_6(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "%{public}@ was expired 300s ago, but hasn't responded yet (the task did not have an expiration handler)", v2);
  OUTLINED_FUNCTION_1();
}

void __54__BGSystemTaskScheduler_deregisterTaskWithIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_6(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "deregisterTaskWithIdentifier: No registration found for task with identifier %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

void __54__BGSystemTaskScheduler_deregisterTaskWithIdentifier___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_6(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "deregisterTaskWithIdentifier isn't supported for an already running task %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)validateTaskIdentifier:(uint64_t)a1 resultProduction:error:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10(&dword_1D13A5000, v1, v2, "Reporting result production for %{public}@: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __71__BGSystemTaskScheduler_validateTaskIdentifier_resultProduction_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_6(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "validateTaskIdentifier:resultProduction: No registration found for task with identifier %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

void __71__BGSystemTaskScheduler_validateTaskIdentifier_resultProduction_error___block_invoke_cold_2(uint64_t *a1, void *a2)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v3;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_8(&dword_1D13A5000, v2, v6, "Task %{public}@ is not registered to produce results for %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_9();
}

- (void)validateTaskIdentifier:(uint64_t)a1 resultConsumption:error:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10(&dword_1D13A5000, v1, v2, "Reporting result consumption for %{public}@: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __72__BGSystemTaskScheduler_validateTaskIdentifier_resultConsumption_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_6(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "validateTaskIdentifier:resultConsumption: No registration found for task with identifier %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

void __72__BGSystemTaskScheduler_validateTaskIdentifier_resultConsumption_error___block_invoke_cold_2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;

  v3 = OUTLINED_FUNCTION_11(a1);
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  v8 = 2114;
  v9 = v5;
  OUTLINED_FUNCTION_8(&dword_1D13A5000, v3, v6, "validateTaskIdentifier:resultConsumption: No dependency found for %@ on %{public}@", v7);

  OUTLINED_FUNCTION_9();
}

void __74__BGSystemTaskScheduler_resetResultsForIdentifier_byTaskIdentifier_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "resetResultsForIdentifier: No registration found for task with identifier %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

void __74__BGSystemTaskScheduler_resetResultsForIdentifier_byTaskIdentifier_error___block_invoke_cold_2()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6(*MEMORY[0x1E0C80C00]);
  v1 = *v0;
  v4 = 138543618;
  v5 = v2;
  v6 = 2112;
  v7 = v1;
  OUTLINED_FUNCTION_8(&dword_1D13A5000, v3, (uint64_t)v3, "resetResultsForIdentifier: Task with identifier %{public}@ is not registered to produce results for %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __73__BGSystemTaskScheduler_canTaskWithIdentifier_consumeResultOfIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_6(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "canTaskWithIdentifier:consumeResultOfIdentifier: No registration found for task with identifier %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

@end
