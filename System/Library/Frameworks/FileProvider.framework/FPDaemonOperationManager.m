@implementation FPDaemonOperationManager

uint64_t __34__FPDaemonOperationManager_wakeUp__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    *(_BYTE *)(v1 + 8) = 1;
    return objc_msgSend(*(id *)(result + 32), "_updateDaemonOperations");
  }
  return result;
}

void __42__FPDaemonOperationManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = v0;

}

- (FPDaemonOperationManager)init
{
  FPDaemonOperationManager *v2;
  uint64_t v3;
  NSMutableSet *localOperationIDs;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  void *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)FPDaemonOperationManager;
  v2 = -[FPDaemonOperationManager init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    localOperationIDs = v2->_localOperationIDs;
    v2->_localOperationIDs = (NSMutableSet *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("FileProvider.daemon-op-manager", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    objc_msgSend(CFSTR("com.apple.fileprovider.daemon-op-created"), "fp_libnotifyPerUserNotificationName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    location = 0;
    objc_initWeak(&location, v2);
    v9 = objc_retainAutorelease(v8);
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    v11 = v2->_queue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __32__FPDaemonOperationManager_init__block_invoke;
    v13[3] = &unk_1E4449998;
    objc_copyWeak(&v14, &location);
    notify_register_dispatch(v10, &v2->_notifToken, v11, v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global_41);
  return (id)sharedInstance_instance;
}

- (void)wakeUp
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__FPDaemonOperationManager_wakeUp__block_invoke;
  block[3] = &unk_1E444A308;
  block[4] = self;
  dispatch_async(queue, block);
}

void __69__FPDaemonOperationManager__enumerateNewDaemonOperationsWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __69__FPDaemonOperationManager__enumerateNewDaemonOperationsWithHandler___block_invoke_cold_1(v5, v6);

  }
  else
  {
    v7 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __69__FPDaemonOperationManager__enumerateNewDaemonOperationsWithHandler___block_invoke_14;
    v22[3] = &unk_1E444B2E0;
    v22[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(a2, "fp_filter:", v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
          fp_current_or_default_log();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v24 = v13;
            _os_log_debug_impl(&dword_1A0A34000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] fetching remote operationID %@", buf, 0xCu);
          }

          v16[0] = v7;
          v16[1] = 3221225472;
          v16[2] = __69__FPDaemonOperationManager__enumerateNewDaemonOperationsWithHandler___block_invoke_16;
          v16[3] = &unk_1E444E2B0;
          v16[4] = v13;
          v15 = *(void **)(a1 + 40);
          v17 = *(id *)(a1 + 48);
          objc_msgSend(v15, "fetchDaemonOperationWithID:completionHandler:", v13, v16);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
      }
      while (v10);
    }

    v5 = 0;
  }

}

- (void)_updateDaemonOperations
{
  _QWORD v3[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__FPDaemonOperationManager__updateDaemonOperations__block_invoke;
  v3[3] = &unk_1E444E288;
  v3[4] = self;
  -[FPDaemonOperationManager _enumerateNewDaemonOperationsWithHandler:](self, "_enumerateNewDaemonOperationsWithHandler:", v3);
}

- (void)_enumerateNewDaemonOperationsWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  +[FPDaemonConnection synchronousSharedConnectionProxy](FPDaemonConnection, "synchronousSharedConnectionProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__FPDaemonOperationManager__enumerateNewDaemonOperationsWithHandler___block_invoke;
  v8[3] = &unk_1E444E2D8;
  v8[4] = self;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  objc_msgSend(v7, "fetchDaemonOperationIDsWithCompletionHandler:", v8);

}

void __32__FPDaemonOperationManager_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __32__FPDaemonOperationManager_init__block_invoke_cold_1(v2);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateDaemonOperations");

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_notifToken);
  v3.receiver = self;
  v3.super_class = (Class)FPDaemonOperationManager;
  -[FPDaemonOperationManager dealloc](&v3, sel_dealloc);
}

- (id)generateLocalOperationID
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
  v9 = __Block_byref_object_copy__19;
  v10 = __Block_byref_object_dispose__19;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__FPDaemonOperationManager_generateLocalOperationID__block_invoke;
  v5[3] = &unk_1E444B600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __52__FPDaemonOperationManager_generateLocalOperationID__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)_receiveLongLivedOperation:(id)a3 info:(id)a4
{
  id v6;
  void *v7;
  id v8;
  int v9;
  __objc2_class **v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v6, "operationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSMutableSet containsObject:](self->_localOperationIDs, "containsObject:", v7) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_localOperationIDs, "addObject:", v7);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v6;
      v9 = objc_msgSend(v8, "byCopy");
      v10 = off_1E4447548;
      if (!v9)
        v10 = off_1E4447670;
      v11 = (void *)objc_msgSend(objc_alloc(*v10), "initWithRemoteOperation:info:", v13, v8);

      if (v11)
      {
        +[FPItemManager defaultManager](FPItemManager, "defaultManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "scheduleAction:", v11);

      }
    }
  }

}

uint64_t __51__FPDaemonOperationManager__updateDaemonOperations__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receiveLongLivedOperation:info:", a2, a3);
}

uint64_t __69__FPDaemonOperationManager__enumerateNewDaemonOperationsWithHandler___block_invoke_14(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsObject:", a2) ^ 1;
}

void __69__FPDaemonOperationManager__enumerateNewDaemonOperationsWithHandler___block_invoke_16(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __69__FPDaemonOperationManager__enumerateNewDaemonOperationsWithHandler___block_invoke_16_cold_1(a1, v9, v10);

  }
  else if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localOperationIDs, 0);
}

void __32__FPDaemonOperationManager_init__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A0A34000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] received notification that daemon operation was created", v1, 2u);
}

void __69__FPDaemonOperationManager__enumerateNewDaemonOperationsWithHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_ERROR, "[ERROR] couldn't fetch remote operation IDs: %@", (uint8_t *)&v4, 0xCu);

}

void __69__FPDaemonOperationManager__enumerateNewDaemonOperationsWithHandler___block_invoke_16_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_ERROR, "[ERROR] couldn't fetch operationID %@; %@",
    (uint8_t *)&v6,
    0x16u);

}

@end
