@implementation HDBackgroundTaskScheduler

- (id)taskWithName:(id)a3 forClientNamed:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__41;
  v21 = __Block_byref_object_dispose__41;
  v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__HDBackgroundTaskScheduler_taskWithName_forClientNamed___block_invoke;
  v13[3] = &unk_1E6CEF6D8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __57__HDBackgroundTaskScheduler_taskWithName_forClientNamed___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  v5 = v3;
  if (v2)
  {
    objc_msgSend(*(id *)(v2 + 8), "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[HDBackgroundTaskScheduler _queue_taskWithName:forClientNamed:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("HDBackgroundTaskScheduler.m"), 306, CFSTR("Attempt to get persistent task for unregistered client %@."), v5);

    }
    _JobNameFromClientAndTaskNames(v5, v4);
    v7 = (void *)BackgroundTaskAgentCopyJob();
    if (v7)
      v8 = -[HDBackgroundTask _initWithJob:]([HDBackgroundTask alloc], v7);
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (void)addTask:(id)a3 withName:(id)a4 forClientNamed:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDBackgroundTaskScheduler.m"), 241, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("task != nil"));

  }
  objc_msgSend(v9, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDBackgroundTaskScheduler.m"), 242, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("task.endDate != nil"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__HDBackgroundTaskScheduler_addTask_withName_forClientNamed___block_invoke;
  block[3] = &unk_1E6CECCA8;
  block[4] = self;
  v20 = v9;
  v21 = v10;
  v22 = v11;
  v14 = v11;
  v15 = v10;
  v16 = v9;
  dispatch_async(queue, block);

}

void __61__HDBackgroundTaskScheduler_addTask_withName_forClientNamed___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3 = *(void **)(a1 + 56);
  v11 = *(id *)(a1 + 48);
  v4 = v3;
  if (v2)
  {
    v5 = *(void **)(v2 + 8);
    v6 = v1;
    objc_msgSend(v5, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[HDBackgroundTaskScheduler _queue_addTask:withName:forClientNamed:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("HDBackgroundTaskScheduler.m"), 284, CFSTR("Attempt to add persistent task for unregistered client %@."), v4, v11);

    }
    _JobNameFromClientAndTaskNames(v4, v11);
    if (v6)
      v8 = v6[1];
    else
      v8 = 0;

    BackgroundTaskAgentAddJob();
  }

}

- (void)removeTaskWithName:(id)a3 forClientNamed:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__HDBackgroundTaskScheduler_removeTaskWithName_forClientNamed___block_invoke;
  block[3] = &unk_1E6CE7FB8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __63__HDBackgroundTaskScheduler_removeTaskWithName_forClientNamed___block_invoke(uint64_t a1)
{
  -[HDBackgroundTaskScheduler _queue_removeTaskWithName:forClientNamed:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
}

- (void)_queue_removeTaskWithName:(void *)a3 forClientNamed:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[HDBackgroundTaskScheduler _queue_removeTaskWithName:forClientNamed:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("HDBackgroundTaskScheduler.m"), 295, CFSTR("Attempt to remove persistent task for unregistered client %@."), v5, v9);

    }
    _JobNameFromClientAndTaskNames(v5, v9);
    BackgroundTaskAgentRemoveJob();
  }

}

void __33__HDBackgroundTaskScheduler_init__block_invoke(uint64_t a1, NSObject *a2, void *a3)
{
  id *v3;
  id v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  id v19;
  id v20;
  uint8_t buf[4];
  NSObject *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  _QWORD *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = *(id **)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    v6 = -[HDBackgroundTask _initWithJob:]([HDBackgroundTask alloc], v5);

    if (!v6)
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v22 = a2;
        _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "Unable to create HDBackgroundTask from job %{public}s", buf, 0xCu);
      }
      goto LABEL_27;
    }
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCharactersToBeSkipped:", 0);
    if (objc_msgSend(v8, "scanUpToString:intoString:", CFSTR("###"), &v20)
      && objc_msgSend(v8, "scanString:intoString:", CFSTR("###"), 0)
      && (objc_msgSend(v8, "isAtEnd") & 1) == 0)
    {
      objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v8, "scanLocation"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = 1;
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }

    v11 = v20;
    v12 = v9;
    if ((v10 & 1) != 0)
    {
      if ((objc_msgSend(v6, "taskValid") & 1) != 0)
      {
        if ((objc_msgSend(v6, "taskSatisfied") & 1) == 0)
        {
          _HKInitializeLogging();
          HKLogInfrastructure();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            v22 = v11;
            v23 = 2114;
            v24 = v12;
            v25 = 2114;
            v26 = v6;
            _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "Task not satisfied, but delivering anyway. Client: %{public}@, Task: %{public}@ %{public}@", buf, 0x20u);
          }

        }
        objc_msgSend(v3[1], "objectForKeyedSubscript:", v11);
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = v14;
          -[HDBackgroundTaskScheduler _queue_removeTaskWithName:forClientNamed:]((uint64_t)v3, v12, v11);
          -[HDBackgroundTaskClient deliverTask:taskName:onQueue:]((uint64_t)v15, v6, v12, v3[4]);
        }
        else
        {
          objc_msgSend(v3[2], "objectForKey:", v11);
          v19 = (id)objc_claimAutoreleasedReturnValue();
          if (!v19)
          {
            v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v3[2], "setObject:forKey:", v19, v11);
          }
          objc_msgSend(v19, "setObject:forKey:", v6, v12);

          v15 = 0;
        }
        goto LABEL_26;
      }
      _HKInitializeLogging();
      HKLogInfrastructure();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v22 = v11;
        v23 = 2114;
        v24 = v12;
        v25 = 2114;
        v26 = v6;
        v16 = "Invalid task; not delivering. Please file a Radar on PEP HealthKit. Client: %{public}@, Task: %{public}@ %{public}@";
        v17 = v15;
        v18 = 32;
        goto LABEL_21;
      }
    }
    else
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v22 = a2;
        v16 = "Unable to retrieve client and task names from job name %{public}s";
        v17 = v15;
        v18 = 12;
LABEL_21:
        _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
      }
    }
LABEL_26:

LABEL_27:
  }
}

- (void)registerClientWithName:(id)a3 taskHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *queue;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD block[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "rangeOfString:", CFSTR("###"));
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _ValidateClientName(NSString *__strong)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("HDBackgroundTaskScheduler.m"), 368, CFSTR("HDBackgroundTaskAgent client name cannot contain the string '%@'"), CFSTR("###"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__HDBackgroundTaskScheduler_registerClientWithName_taskHandler___block_invoke;
  block[3] = &unk_1E6CEA160;
  block[4] = self;
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, block);

}

void __64__HDBackgroundTaskScheduler_registerClientWithName_taskHandler___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id v4;
  HDBackgroundTaskClient *v5;
  id v6;
  uint64_t v7;
  id taskHandler;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v1 = *(id **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = v2;
  if (v1)
  {
    v5 = [HDBackgroundTaskClient alloc];
    v6 = v4;
    v17 = v4;
    if (v5)
    {
      v22.receiver = v5;
      v22.super_class = (Class)HDBackgroundTaskClient;
      v5 = (HDBackgroundTaskClient *)objc_msgSendSuper2(&v22, sel_init);
      if (v5)
      {
        v7 = objc_msgSend(v6, "copy");
        taskHandler = v5->_taskHandler;
        v5->_taskHandler = (id)v7;

      }
    }

    objc_msgSend(v1[1], "setObject:forKeyedSubscript:", v5, v3);
    objc_msgSend(v1[2], "objectForKey:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v9, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, &v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDBackgroundTaskClient deliverTask:taskName:onQueue:]((uint64_t)v5, v16, v15, v1[4]);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, &v22, 16);
      }
      while (v12);
    }

    objc_msgSend(v1[2], "removeObjectForKey:", v3);
    v4 = v17;
  }

}

- (HDBackgroundTaskScheduler)init
{
  HDBackgroundTaskScheduler *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *clients;
  NSMutableDictionary *v5;
  NSMutableDictionary *tasksQueuedForDelivery;
  uint64_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  OS_dispatch_queue *clientQueue;
  HDBackgroundTaskScheduler *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HDBackgroundTaskScheduler;
  v2 = -[HDBackgroundTaskScheduler init](&v13, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    clients = v2->_clients;
    v2->_clients = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    tasksQueuedForDelivery = v2->_tasksQueuedForDelivery;
    v2->_tasksQueuedForDelivery = v5;

    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    HKCreateSerialDispatchQueue();
    v9 = objc_claimAutoreleasedReturnValue();
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v9;

    v12 = v2;
    BackgroundTaskAgentInit();

  }
  return v2;
}

- (void)unregisterClientWithName:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__HDBackgroundTaskScheduler_unregisterClientWithName___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __54__HDBackgroundTaskScheduler_unregisterClientWithName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_tasksQueuedForDelivery, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end
