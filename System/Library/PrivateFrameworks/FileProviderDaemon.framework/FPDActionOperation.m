@implementation FPDActionOperation

- (FPDActionOperation)initWithActionInfo:(id)a3 request:(id)a4 server:(id)a5
{
  id v9;
  id v10;
  id v11;
  FPDActionOperation *v12;
  void *v13;
  uint64_t v14;
  NSMutableArray *clients;
  uint64_t v16;
  NSMutableArray *clientCompletions;
  uint64_t v18;
  NSMutableDictionary *progressByRoot;
  uint64_t v20;
  NSMutableDictionary *errorsByRoot;
  uint64_t v22;
  NSMutableSet *completedRoots;
  uint64_t v24;
  NSMutableDictionary *progressCompletionsByRoot;
  uint64_t v26;
  NSMutableDictionary *createdItemByRoot;
  NSObject *v28;
  id location;
  objc_super v31;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v31.receiver = self;
  v31.super_class = (Class)FPDActionOperation;
  v12 = -[FPOperation init](&v31, sel_init);
  if (v12)
  {
    objc_msgSend(v11, "extensionManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v12->_manager, v13);

    objc_storeStrong((id *)&v12->_info, a3);
    objc_storeStrong((id *)&v12->_request, a4);
    v14 = objc_opt_new();
    clients = v12->_clients;
    v12->_clients = (NSMutableArray *)v14;

    v16 = objc_opt_new();
    clientCompletions = v12->_clientCompletions;
    v12->_clientCompletions = (NSMutableArray *)v16;

    location = 0;
    objc_initWeak(&location, v12);
    v18 = objc_opt_new();
    progressByRoot = v12->_progressByRoot;
    v12->_progressByRoot = (NSMutableDictionary *)v18;

    v20 = objc_opt_new();
    errorsByRoot = v12->_errorsByRoot;
    v12->_errorsByRoot = (NSMutableDictionary *)v20;

    v22 = objc_opt_new();
    completedRoots = v12->_completedRoots;
    v12->_completedRoots = (NSMutableSet *)v22;

    v24 = objc_opt_new();
    progressCompletionsByRoot = v12->_progressCompletionsByRoot;
    v12->_progressCompletionsByRoot = (NSMutableDictionary *)v24;

    v26 = objc_opt_new();
    createdItemByRoot = v12->_createdItemByRoot;
    v12->_createdItemByRoot = (NSMutableDictionary *)v26;

    -[FPOperation callbackQueue](v12, "callbackQueue");
    v28 = objc_claimAutoreleasedReturnValue();
    dispatch_activate(v28);

    objc_destroyWeak(&location);
  }

  return v12;
}

- (id)progressForRoot:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
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
  v20 = __Block_byref_object_copy__7;
  v21 = __Block_byref_object_dispose__7;
  v22 = 0;
  -[FPOperation callbackQueue](self, "callbackQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__FPDActionOperation_progressForRoot_completion___block_invoke;
  v13[3] = &unk_1E8C76BA8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __49__FPDActionOperation_progressForRoot_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 360), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_new();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCompletedUnitCount:", objc_msgSend(v2, "completedUnitCount"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setTotalUnitCount:", objc_msgSend(v2, "totalUnitCount"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCancellable:", 1);
  objc_msgSend(v2, "cancellationHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCancellationHandler:", v6);

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 376), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 392), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 392), "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 40));
    }
    objc_msgSend(MEMORY[0x1E0CB3800], "keyPathWithRootObject:path:", v2, "fractionCompleted");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __49__FPDActionOperation_progressForRoot_completion___block_invoke_2;
    v19[3] = &unk_1E8C76B80;
    v21 = *(_QWORD *)(a1 + 56);
    v20 = v2;
    objc_msgSend(v8, "addObserverBlock:", v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v9;
    v14 = 3221225472;
    v15 = __49__FPDActionOperation_progressForRoot_completion___block_invoke_3;
    v16 = &unk_1E8C75698;
    v17 = v10;
    v18 = *(id *)(a1 + 48);
    v11 = v10;
    v12 = (void *)MEMORY[0x1D17D1C84](&v13);
    objc_msgSend(v7, "addObject:", v12, v13, v14, v15, v16);

  }
}

uint64_t __49__FPDActionOperation_progressForRoot_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount"));
}

uint64_t __49__FPDActionOperation_progressForRoot_completion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "finishObserving");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)forAllClients:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  -[FPOperation callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_clients;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  objc_super v11;

  v7 = a4;
  v8 = a3;
  -[FPOperation callbackQueue](self, "callbackQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  objc_storeStrong((id *)&self->_error, a4);
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[FPDActionOperation finishWithResult:error:].cold.1((uint64_t)self, (uint64_t)v7, v10);

  -[FPDActionOperation unregisterClientsAfterCompletion](self, "unregisterClientsAfterCompletion");
  v11.receiver = self;
  v11.super_class = (Class)FPDActionOperation;
  -[FPOperation finishWithResult:error:](&v11, sel_finishWithResult_error_, v8, v7);

}

- (void)cancelRoot:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[FPOperation callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__FPDActionOperation_cancelRoot___block_invoke;
  block[3] = &unk_1E8C75E48;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __33__FPDActionOperation_cancelRoot___block_invoke(uint64_t a1)
{
  NSObject *v2;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __33__FPDActionOperation_cancelRoot___block_invoke_cold_1(a1, v2);

}

- (void)cancel
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FPDActionOperation;
  -[FPOperation cancel](&v2, sel_cancel);
}

- (void)unregisterClientsAfterCompletion
{
  void *v7;

  v7 = (void *)MEMORY[0x1D17D1C84](a2);
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1CF55F000, a4, OS_LOG_TYPE_DEBUG, "[DEBUG] unregisterClientsAfterCompletion calling completion %@", a1, 0xCu);

}

- (void)sendPastUpdatesToClient:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ UNREACHABLE: should be overriden"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_fault_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v6, 0xCu);
  }

  __assert_rtn("-[FPDActionOperation sendPastUpdatesToClient:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/FPDActionOperation.m", 165, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
}

- (void)registerFrameworkClient:(id)a3 operationCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  FPDActionOperation *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[FPOperation callbackQueue](self, "callbackQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_activate(v8);

  -[FPOperation callbackQueue](self, "callbackQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__FPDActionOperation_registerFrameworkClient_operationCompletion___block_invoke;
  block[3] = &unk_1E8C75C50;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __66__FPDActionOperation_registerFrameworkClient_operationCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setCancellationHandler:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_10);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 344), "addObject:", v4);
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 352);
  v3 = (void *)MEMORY[0x1D17D1C84](*(_QWORD *)(a1 + 48));
  objc_msgSend(v2, "addObject:", v3);

  objc_msgSend(*(id *)(a1 + 40), "sendPastUpdatesToClient:", v4);
}

- (void)dumpStateTo:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  FPDActionOperation *v10;

  v4 = a3;
  -[FPOperation callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_activate(v5);

  -[FPOperation callbackQueue](self, "callbackQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__FPDActionOperation_dumpStateTo___block_invoke;
  block[3] = &unk_1E8C75850;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_sync(v6, block);

}

uint64_t __34__FPDActionOperation_dumpStateTo___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("************************\n"));
  objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("info=[[%@]]\n\n"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 336));
  objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("+ clients: %@\n\n"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 344));
  objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("+ progress by root: %@\n\n"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 360));
  objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("+ created items by root: %@\n\n"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 384));
  objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("+ errors by root: %@\n"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 368));
  objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("+ completed roots: %@\n"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 376));
  objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("\n"));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 400))
  {
    objc_msgSend(*(id *)(a1 + 32), "startFgColor:", 1);
    objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("+ error: %@\n"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 400));
    objc_msgSend(*(id *)(a1 + 32), "reset");
  }
  return objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("************************\n"));
}

- (NSProgress)progress
{
  return self->_progress;
}

- (FPDExtensionManager)manager
{
  return (FPDExtensionManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (FPDRequest)request
{
  return self->_request;
}

- (FPActionOperationInfo)info
{
  return self->_info;
}

- (NSMutableArray)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_storeStrong((id *)&self->_clients, a3);
}

- (NSMutableArray)clientCompletions
{
  return self->_clientCompletions;
}

- (void)setClientCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_clientCompletions, a3);
}

- (BOOL)hasFinishedPreflight
{
  return self->_hasFinishedPreflight;
}

- (void)setHasFinishedPreflight:(BOOL)a3
{
  self->_hasFinishedPreflight = a3;
}

- (NSMutableDictionary)progressByRoot
{
  return self->_progressByRoot;
}

- (void)setProgressByRoot:(id)a3
{
  objc_storeStrong((id *)&self->_progressByRoot, a3);
}

- (NSMutableDictionary)errorsByRoot
{
  return self->_errorsByRoot;
}

- (void)setErrorsByRoot:(id)a3
{
  objc_storeStrong((id *)&self->_errorsByRoot, a3);
}

- (NSMutableSet)completedRoots
{
  return self->_completedRoots;
}

- (void)setCompletedRoots:(id)a3
{
  objc_storeStrong((id *)&self->_completedRoots, a3);
}

- (NSMutableDictionary)createdItemByRoot
{
  return self->_createdItemByRoot;
}

- (void)setCreatedItemByRoot:(id)a3
{
  objc_storeStrong((id *)&self->_createdItemByRoot, a3);
}

- (NSMutableDictionary)progressCompletionsByRoot
{
  return self->_progressCompletionsByRoot;
}

- (void)setProgressCompletionsByRoot:(id)a3
{
  objc_storeStrong((id *)&self->_progressCompletionsByRoot, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (unint64_t)logSection
{
  return self->_logSection;
}

- (void)setLogSection:(unint64_t)a3
{
  self->_logSection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_progressCompletionsByRoot, 0);
  objc_storeStrong((id *)&self->_createdItemByRoot, 0);
  objc_storeStrong((id *)&self->_completedRoots, 0);
  objc_storeStrong((id *)&self->_errorsByRoot, 0);
  objc_storeStrong((id *)&self->_progressByRoot, 0);
  objc_storeStrong((id *)&self->_clientCompletions, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_progress, 0);
}

- (void)finishWithResult:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 368);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_1CF55F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] action operation finished with errors-by-root:%@; %@",
    (uint8_t *)&v4,
    0x16u);
}

void __33__FPDActionOperation_cancelRoot___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] cancelling root: %@", (uint8_t *)&v3, 0xCu);
}

@end
