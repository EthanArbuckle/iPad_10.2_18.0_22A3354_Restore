@implementation AXMTaskDispatcher

- (AXMTaskDispatcher)initWithIdentifier:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  void *v14;
  dispatch_source_t v15;
  void *v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)AXMTaskDispatcher;
  v8 = -[AXMTaskDispatcher init](&v22, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v8 + 3);
    *((_QWORD *)v8 + 3) = v9;

    objc_storeWeak((id *)v8 + 5, v7);
    v11 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create(v11, v12);
    v14 = (void *)*((_QWORD *)v8 + 2);
    *((_QWORD *)v8 + 2) = v13;

    v15 = dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, *((dispatch_queue_t *)v8 + 2));
    v16 = (void *)*((_QWORD *)v8 + 1);
    *((_QWORD *)v8 + 1) = v15;

    objc_initWeak(&location, v8);
    v17 = *((_QWORD *)v8 + 1);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __49__AXMTaskDispatcher_initWithIdentifier_delegate___block_invoke;
    v19[3] = &unk_1E625C9D8;
    objc_copyWeak(&v20, &location);
    dispatch_source_set_event_handler(v17, v19);
    dispatch_activate(*((dispatch_object_t *)v8 + 1));
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return (AXMTaskDispatcher *)v8;
}

void __49__AXMTaskDispatcher_initWithIdentifier_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_processNextTask");

}

- (int64_t)count
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
  v5[2] = __26__AXMTaskDispatcher_count__block_invoke;
  v5[3] = &unk_1E625CA50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __26__AXMTaskDispatcher_count__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)_queue_count
{
  return -[NSMutableArray count](self->_queue_taskList, "count");
}

- (BOOL)isEmpty
{
  return -[AXMTaskDispatcher count](self, "count") == 0;
}

- (void)_queue_processNextTask
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "task should not be in the completed state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __43__AXMTaskDispatcher__queue_processNextTask__block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  NSObject *v6;
  _QWORD *WeakRetained;
  NSObject *v8;
  _QWORD block[5];

  v5 = a2;
  AXMediaLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __43__AXMTaskDispatcher__queue_processNextTask__block_invoke_cold_1((uint64_t)v5, a3, v6);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained[2];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AXMTaskDispatcher__queue_processNextTask__block_invoke_18;
  block[3] = &unk_1E625CCC0;
  block[4] = WeakRetained;
  dispatch_async(v8, block);

}

void __43__AXMTaskDispatcher__queue_processNextTask__block_invoke_18(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 32))
  {
    AXMediaLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __43__AXMTaskDispatcher__queue_processNextTask__block_invoke_18_cold_1();

    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v2 + 32) = 0;
  dispatch_source_merge_data(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 8), 1uLL);
}

- (void)scheduleTask:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    queue = self->_queue;
    block[1] = 3221225472;
    block[2] = __34__AXMTaskDispatcher_scheduleTask___block_invoke;
    block[3] = &unk_1E625CB18;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    dispatch_sync(queue, block);

    v4 = v6;
  }

}

uint64_t __34__AXMTaskDispatcher_scheduleTask___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleTask:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_scheduleTask:(id)a3
{
  -[NSMutableArray addObject:](self->_queue_taskList, "addObject:", a3);
  if (!self->_queue_taskIsBeingProcessed)
    dispatch_source_merge_data((dispatch_source_t)self->_processQueueSource, 1uLL);
}

- (id)unscheduleAllTasks
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
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__AXMTaskDispatcher_unscheduleAllTasks__block_invoke;
  v5[3] = &unk_1E625CA50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__AXMTaskDispatcher_unscheduleAllTasks__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleAllTasks");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_queue_unscheduleAllTasks
{
  void *v3;

  v3 = (void *)-[NSMutableArray copy](self->_queue_taskList, "copy");
  -[NSMutableArray removeAllObjects](self->_queue_taskList, "removeAllObjects");
  return v3;
}

- (id)_queue_dequeueTask
{
  void *v3;

  if (-[NSMutableArray count](self->_queue_taskList, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_queue_taskList, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_queue_taskList, "removeObjectAtIndex:", 0);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (AXMTaskDispatcherDelegate)delegate
{
  return (AXMTaskDispatcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue_taskList, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_processQueueSource, 0);
}

void __43__AXMTaskDispatcher__queue_processNextTask__block_invoke_cold_1(uint64_t a1, char a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2 & 1;
  _os_log_debug_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_DEBUG, "Task is marked complete: %@ -> %d", (uint8_t *)&v3, 0x12u);
}

void __43__AXMTaskDispatcher__queue_processNextTask__block_invoke_18_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "taskIsBeingProcessed should be YES", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
