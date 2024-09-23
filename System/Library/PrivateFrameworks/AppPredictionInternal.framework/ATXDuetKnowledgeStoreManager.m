@implementation ATXDuetKnowledgeStoreManager

void __41__ATXDuetKnowledgeStoreManager_runBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  dispatch_source_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_source_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  NSObject *v18;
  int64_t v19;
  uint64_t v20;
  dispatch_time_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD handler[4];
  id v30;
  id location;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v2 = (void *)MEMORY[0x1CAA48B6C]();
    objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStoreWithDirectReadOnlyAccess");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    objc_initWeak(&location, *(id *)(a1 + 32));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = MEMORY[0x1E0C809B0];
    if (!*(_QWORD *)(v6 + 32))
    {
      v8 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 7uLL, *(dispatch_queue_t *)(v6 + 8));
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 32);
      *(_QWORD *)(v9 + 32) = v8;

      v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
      handler[0] = v7;
      handler[1] = 3221225472;
      handler[2] = __41__ATXDuetKnowledgeStoreManager_runBlock___block_invoke_2;
      handler[3] = &unk_1E82DB988;
      objc_copyWeak(&v30, &location);
      dispatch_source_set_event_handler(v11, handler);
      dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 32));
      objc_destroyWeak(&v30);
      v6 = *(_QWORD *)(a1 + 32);
    }
    v12 = *(NSObject **)(v6 + 48);
    if (v12)
    {
      dispatch_source_cancel(v12);
      v6 = *(_QWORD *)(a1 + 32);
    }
    v13 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(v6 + 8));
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 48);
    *(_QWORD *)(v14 + 48) = v13;

    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(_QWORD *)(v16 + 40);
    v18 = *(NSObject **)(v16 + 48);
    if (v17 <= 1)
      v19 = 600000000000;
    else
      v19 = 30000000000;
    if (v17 <= 1)
      v20 = 300000000000;
    else
      v20 = 30000000000;
    v21 = dispatch_time(0, v19);
    dispatch_source_set_timer(v18, v21, 0xFFFFFFFFFFFFFFFFLL, v20);
    v22 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
    v27[0] = v7;
    v27[1] = 3221225472;
    v27[2] = __41__ATXDuetKnowledgeStoreManager_runBlock___block_invoke_3;
    v27[3] = &unk_1E82DB988;
    objc_copyWeak(&v28, &location);
    dispatch_source_set_event_handler(v22, v27);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 48));
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
    objc_autoreleasePoolPop(v2);
  }
  v23 = (void *)MEMORY[0x1CAA48B6C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v23);
  v24 = objc_opt_new();
  v25 = *(_QWORD *)(a1 + 32);
  v26 = *(void **)(v25 + 24);
  *(_QWORD *)(v25 + 24) = v24;

}

- (void)runBlock:(id)a3
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
  block[2] = __41__ATXDuetKnowledgeStoreManager_runBlock___block_invoke;
  block[3] = &unk_1E82DA8E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__ATXDuetKnowledgeStoreManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2_2 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_2, block);
  return (id)sharedInstance__pasExprOnceResult_40;
}

void __46__ATXDuetKnowledgeStoreManager_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_40;
  sharedInstance__pasExprOnceResult_40 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXDuetKnowledgeStoreManager)init
{
  ATXDuetKnowledgeStoreManager *v2;
  objc_class *v3;
  id v4;
  const char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ATXDuetKnowledgeStoreManager;
  v2 = -[ATXDuetKnowledgeStoreManager init](&v10, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create(v5, v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v2->_previousPressure = 1;
  }
  return v2;
}

- (void)dealloc
{
  NSObject *pressureSource;
  objc_super v4;

  pressureSource = self->_pressureSource;
  if (pressureSource)
    dispatch_source_cancel(pressureSource);
  v4.receiver = self;
  v4.super_class = (Class)ATXDuetKnowledgeStoreManager;
  -[ATXDuetKnowledgeStoreManager dealloc](&v4, sel_dealloc);
}

void __41__ATXDuetKnowledgeStoreManager_runBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleMemoryPressure");

}

void __41__ATXDuetKnowledgeStoreManager_runBlock___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_clear");

}

- (void)_handleMemoryPressure
{
  uintptr_t data;
  unint64_t v5;
  NSObject *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  OS_dispatch_queue *queue;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[16];

  data = dispatch_source_get_data((dispatch_source_t)self->_pressureSource);
  v5 = data;
  if (self->_store && data > self->_previousPressure)
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "Evicting Duet store", buf, 2u);
    }

    -[NSDate timeIntervalSinceNow](self->_lastUsedDate, "timeIntervalSinceNow");
    v8 = v7;
    if (v7 <= -5.0)
    {
      -[ATXDuetKnowledgeStoreManager _clear](self, "_clear");
    }
    else
    {
      sel_getName(a2);
      v9 = (void *)os_transaction_create();
      v10 = (void *)MEMORY[0x1E0D81598];
      queue = self->_queue;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __53__ATXDuetKnowledgeStoreManager__handleMemoryPressure__block_invoke;
      v13[3] = &unk_1E82DACB0;
      v13[4] = self;
      v14 = v9;
      v12 = v9;
      objc_msgSend(v10, "runAsyncOnQueue:afterDelaySeconds:block:", queue, v13, v8 + 5.0);

    }
  }
  self->_previousPressure = v5;
}

id __53__ATXDuetKnowledgeStoreManager__handleMemoryPressure__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_clear");
  return (id)objc_opt_self();
}

- (void)_clear
{
  _DKKnowledgeQuerying *store;
  NSObject *expirationSource;
  OS_dispatch_source *v5;
  id v6;

  sel_getName(a2);
  v6 = (id)os_transaction_create();
  store = self->_store;
  self->_store = 0;

  expirationSource = self->_expirationSource;
  if (expirationSource)
  {
    dispatch_source_cancel(expirationSource);
    v5 = self->_expirationSource;
  }
  else
  {
    v5 = 0;
  }
  self->_expirationSource = 0;

}

- (void)saveEventsAsynchronously:(id)a3 responseQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__ATXDuetKnowledgeStoreManager_saveEventsAsynchronously_responseQueue_completion___block_invoke;
  v15[3] = &unk_1E82DF830;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

uint64_t __82__ATXDuetKnowledgeStoreManager_saveEventsAsynchronously_responseQueue_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(a1[4] + 56);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = a1[4];
    v5 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = v3;

    v2 = *(void **)(a1[4] + 56);
  }
  return objc_msgSend(v2, "saveObjects:responseQueue:withCompletion:", a1[5], a1[6], a1[7]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savingStore, 0);
  objc_storeStrong((id *)&self->_expirationSource, 0);
  objc_storeStrong((id *)&self->_pressureSource, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
