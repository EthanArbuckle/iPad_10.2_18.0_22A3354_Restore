@implementation FPDActionOperationEngine

- (id)inFlightOperations
{
  return -[NSOperationQueue operations](self->_operationQueue, "operations");
}

- (FPDActionOperationEngine)init
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("should not call this"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_fault_impl(&dword_1CF55F000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v4, 0xCu);
  }

  __assert_rtn("-[FPDActionOperationEngine init]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/FPDActionOperationEngine.m", 62, (const char *)objc_msgSend(objc_retainAutorelease(v2), "UTF8String"));
}

- (FPDActionOperationEngine)initWithServer:(id)a3
{
  id v4;
  FPDActionOperationEngine *v5;
  FPDActionOperationEngine *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  NSOperationQueue *operationQueue;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FPDActionOperationEngine;
  v5 = -[FPDActionOperationEngine init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_server, v4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("FileProvider.action-operation-engine", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    v10 = objc_opt_new();
    operationQueue = v6->_operationQueue;
    v6->_operationQueue = (NSOperationQueue *)v10;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v6->_operationQueue, "setMaxConcurrentOperationCount:", 8);
  }

  return v6;
}

- (void)scheduleActionOperationWithInfo:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  FPDActionOperationEngine *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__FPDActionOperationEngine_scheduleActionOperationWithInfo_request_completionHandler___block_invoke;
  block[3] = &unk_1E8C75710;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(queue, block);

}

void __86__FPDActionOperationEngine_scheduleActionOperationWithInfo_request_completionHandler___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  __CFString *v3;
  objc_class *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  id v10;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __86__FPDActionOperationEngine_scheduleActionOperationWithInfo_request_completionHandler___block_invoke_cold_1(v2);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = CFSTR("FPDMoveOperation");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return;
    v3 = CFSTR("FPDDownloadOperation");
  }
  NSClassFromString(&v3->isa);
  v4 = (objc_class *)objc_claimAutoreleasedReturnValue();
  v5 = [v4 alloc];
  v6 = a1[4];
  v7 = a1[5];
  WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 8));
  v9 = (void *)objc_msgSend(v5, "initWithActionInfo:request:server:", v6, v7, WeakRetained);

  if (v9)
  {
    objc_msgSend(*(id *)(a1[6] + 24), "addOperation:", v9);
    (*(void (**)(void))(a1[7] + 16))();
    objc_msgSend(CFSTR("com.apple.fileprovider.daemon-op-created"), "fp_libnotifyPerUserNotificationName");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    notify_post((const char *)objc_msgSend(v10, "UTF8String"));

  }
}

- (void)dumpStateTo:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  FPDActionOperationEngine *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__FPDActionOperationEngine_dumpStateTo___block_invoke;
  block[3] = &unk_1E8C75850;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __40__FPDActionOperationEngine_dumpStateTo___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("== action operation engine ==\n"));
  objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("=================\n"));
  objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("%lu operations\n"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "operationCount"));
  objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("\n"));
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "operations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "dumpStateTo:", *(_QWORD *)(a1 + 32));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_server);
}

void __86__FPDActionOperationEngine_scheduleActionOperationWithInfo_request_completionHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1CF55F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] enqueueing action operation", v1, 2u);
}

@end
