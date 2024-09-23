@implementation FPDDownloadOperation

+ (BOOL)_validateInfo:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (FPDDownloadOperation)initWithActionInfo:(id)a3 request:(id)a4 server:(id)a5
{
  id v8;
  id v9;
  id v10;
  FPDDownloadOperation *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  FPDCoordinator *v15;
  void *v16;
  uint64_t v17;
  FPDCoordinator *coordinator;
  FPDDownloadOperation *v19;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (+[FPDDownloadOperation _validateInfo:](FPDDownloadOperation, "_validateInfo:", v8))
  {
    v21.receiver = self;
    v21.super_class = (Class)FPDDownloadOperation;
    v11 = -[FPDActionOperation initWithActionInfo:request:server:](&v21, sel_initWithActionInfo_request_server_, v8, v9, v10);
    if (v11)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = dispatch_queue_create("FileProvider.download-operation", v12);
      queue = v11->_queue;
      v11->_queue = (OS_dispatch_queue *)v13;

      v15 = [FPDCoordinator alloc];
      -[FPDActionOperation manager](v11, "manager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[FPDCoordinator initWithExtensionManager:callbackQueue:](v15, "initWithExtensionManager:callbackQueue:", v16, v11->_queue);
      coordinator = v11->_coordinator;
      v11->_coordinator = (FPDCoordinator *)v17;

    }
    self = v11;
    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  -[FPOperation callbackQueue](self, "callbackQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[FPDActionOperation setError:](self, "setError:", v6);
  fp_current_or_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[FPDDownloadOperation finishWithResult:error:].cold.1(self, v9);

  v10.receiver = self;
  v10.super_class = (Class)FPDDownloadOperation;
  -[FPDActionOperation finishWithResult:error:](&v10, sel_finishWithResult_error_, v7, v6);

}

- (void)sendPastUpdatesToClient:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t section;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  -[FPOperation callbackQueue](self, "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  section = __fp_create_section();
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FPDDownloadOperation sendPastUpdatesToClient:].cold.3();

  if (-[FPOperation isFinished](self, "isFinished"))
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[FPDDownloadOperation sendPastUpdatesToClient:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    -[FPDActionOperation unregisterClientsAfterCompletion](self, "unregisterClientsAfterCompletion");
  }
  else
  {
    if (-[FPDActionOperation hasFinishedPreflight](self, "hasFinishedPreflight"))
    {
      objc_msgSend(v34, "remoteOperationProgressesAreReady");
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      -[FPDActionOperation createdItemByRoot](self, "createdItemByRoot");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "allKeys");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v36;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v36 != v17)
              objc_enumerationMutation(v15);
            v19 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v18);
            -[FPDActionOperation createdItemByRoot](self, "createdItemByRoot");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            -[FPDActionOperation completedRoots](self, "completedRoots");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "containsObject:", v19);

            -[FPDActionOperation errorsByRoot](self, "errorsByRoot");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", v19);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              objc_msgSend(v34, "remoteOperationCompletedRoot:resultingItem:error:completion:", v19, v21, v25, &__block_literal_global_9);
            }
            else if (v21)
            {
              objc_msgSend(v34, "remoteOperationCreatedRoot:resultingItem:completion:", v19, v21, &__block_literal_global_6);
            }

            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v16);
      }

    }
    fp_current_or_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[FPDDownloadOperation sendPastUpdatesToClient:].cold.2(v26, v27, v28, v29, v30, v31, v32, v33);

    objc_msgSend(v34, "remoteOperationFinishedSendingPastUpdates");
  }
  __fp_leave_section_Debug();

}

- (void)_setupCreatedItemForRoot:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  FPDDownloadOperation *v9;

  v4 = a3;
  -[FPOperation callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__FPDDownloadOperation__setupCreatedItemForRoot___block_invoke;
  v7[3] = &unk_1E8C75850;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __49__FPDDownloadOperation__setupCreatedItemForRoot___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __49__FPDDownloadOperation__setupCreatedItemForRoot___block_invoke_cold_1(a1, v2, v3);

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "createdItemByRoot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 32));

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__FPDDownloadOperation__setupCreatedItemForRoot___block_invoke_7;
  v7[3] = &unk_1E8C76AA0;
  v6 = *(void **)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v6, "forAllClients:", v7);

}

uint64_t __49__FPDDownloadOperation__setupCreatedItemForRoot___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remoteOperationCreatedRoot:resultingItem:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 32), &__block_literal_global_8);
}

- (void)_finishedDownloadingLocator:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  FPDDownloadOperation *v14;

  v6 = a3;
  v7 = a4;
  -[FPOperation callbackQueue](self, "callbackQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__FPDDownloadOperation__finishedDownloadingLocator_withError___block_invoke;
  block[3] = &unk_1E8C75240;
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __62__FPDDownloadOperation__finishedDownloadingLocator_withError___block_invoke(id *a1)
{
  id *v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v2 = a1 + 4;
  v3 = a1[4];
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __62__FPDDownloadOperation__finishedDownloadingLocator_withError___block_invoke_cold_2((uint64_t)a1, v2, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __62__FPDDownloadOperation__finishedDownloadingLocator_withError___block_invoke_cold_1((uint64_t)a1, v5, v6);
  }

  objc_msgSend(a1[6], "completedRoots");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", a1[5]);

  v8 = a1[4];
  objc_msgSend(a1[6], "errorsByRoot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, a1[5]);

  objc_msgSend(a1[6], "createdItemByRoot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", a1[5]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__FPDDownloadOperation__finishedDownloadingLocator_withError___block_invoke_10;
  v14[3] = &unk_1E8C76018;
  v12 = a1[6];
  v15 = a1[5];
  v16 = v11;
  v17 = a1[4];
  v13 = v11;
  objc_msgSend(v12, "forAllClients:", v14);

}

uint64_t __62__FPDDownloadOperation__finishedDownloadingLocator_withError___block_invoke_10(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remoteOperationCompletedRoot:resultingItem:error:completion:", a1[4], a1[5], a1[6], &__block_literal_global_11);
}

- (void)main
{
  const __CFString *v4;

  v4 = CFSTR("no");
  if ((a1 & 1) != 0)
    v4 = CFSTR("yes");
  *(_DWORD *)a2 = 134218242;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = v4;
  OUTLINED_FUNCTION_6(&dword_1CF55F000, a4, a3, "[DEBUG] download-operation: Request to download %lu roots; recursively ? %@",
    (uint8_t *)a2);
}

void __28__FPDDownloadOperation_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD);

  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = a4;
  objc_msgSend(v6, "_finishedDownloadingLocator:withError:", v7, a3);
  v8[2](v8);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __28__FPDDownloadOperation_main__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "setHasFinishedPreflight:", 1);
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __28__FPDDownloadOperation_main__block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  return objc_msgSend(*(id *)(a1 + 32), "forAllClients:", &__block_literal_global_18_0);
}

uint64_t __28__FPDDownloadOperation_main__block_invoke_17(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remoteOperationProgressesAreReady");
}

void __28__FPDDownloadOperation_main__block_invoke_2_19(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  dispatch_group_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[6];
  _QWORD v12[4];
  dispatch_group_t v13;
  uint64_t v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __28__FPDDownloadOperation_main__block_invoke_2_19_cold_1(a1, v3);

    v4 = dispatch_group_create();
    objc_msgSend(*(id *)(a1 + 32), "createdItemByRoot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __28__FPDDownloadOperation_main__block_invoke_20;
    v12[3] = &unk_1E8C76B58;
    v7 = *(_QWORD *)(a1 + 32);
    v13 = v4;
    v14 = v7;
    v8 = v4;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v12);

    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __28__FPDDownloadOperation_main__block_invoke_30;
    v11[3] = &unk_1E8C75850;
    v10 = *(_QWORD *)(a1 + 32);
    v11[4] = WeakRetained;
    v11[5] = v10;
    dispatch_group_notify(v8, v9, v11);

  }
}

void __28__FPDDownloadOperation_main__block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  _QWORD v23[2];
  id v24;
  id v25;
  _QWORD v26[4];
  void *v27;
  id v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(NSObject **)(a1 + 32);
  v7 = a3;
  dispatch_group_enter(v6);
  LOBYTE(v6) = objc_msgSend(v7, "isProviderItem");

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v5, "asFPItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "manager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemID");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "domainFromItemID:reason:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "defaultBackend");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = objc_opt_respondsToSelector();

    objc_msgSend(v11, "defaultBackend");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v10 & 1) != 0)
    {
      v29[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __28__FPDDownloadOperation_main__block_invoke_2_24;
      v26[3] = &unk_1E8C763B8;
      v15 = &v27;
      v27 = v8;
      v28 = *(id *)(a1 + 32);
      v16 = v8;
      objc_msgSend(v13, "decorateItems:completionHandler:", v14, v26);

      v17 = v28;
    }
    else
    {
      objc_msgSend(v8, "itemID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "request");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __28__FPDDownloadOperation_main__block_invoke_26;
      v22[3] = &unk_1E8C76B30;
      v15 = (id *)v23;
      v20 = *(_QWORD *)(a1 + 40);
      v23[0] = v8;
      v23[1] = v20;
      v24 = v5;
      v25 = *(id *)(a1 + 32);
      v21 = v8;
      objc_msgSend(v13, "itemForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:request:completionHandler:", v18, 0, 1, v19, v22);

      v17 = v24;
    }

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __28__FPDDownloadOperation_main__block_invoke_2_24(uint64_t a1)
{
  NSObject *v2;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __28__FPDDownloadOperation_main__block_invoke_2_24_cold_1(a1);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __28__FPDDownloadOperation_main__block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __28__FPDDownloadOperation_main__block_invoke_26_cold_2();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __28__FPDDownloadOperation_main__block_invoke_26_cold_1(v5);

    objc_msgSend(MEMORY[0x1E0CAABF0], "locatorForItem:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "createdItemByRoot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 48));

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

uint64_t __28__FPDDownloadOperation_main__block_invoke_30(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "createdItemByRoot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "completedWithResult:error:", v3, 0);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 424), "stopAccessingAllURLs");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)finishWithResult:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint8_t v9[14];
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "createdItemByRoot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorsByRoot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  v10 = v5;
  v11 = v7;
  v12 = v8;
  _os_log_debug_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] download operation finished with downloaded-roots:%@ errors-by-root:%@; %@",
    v9,
    0x20u);

}

- (void)sendPastUpdatesToClient:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CF55F000, a1, a3, "[DEBUG] remote download operation has already finished", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)sendPastUpdatesToClient:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CF55F000, a1, a3, "[DEBUG] finished sending past updates", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)sendPastUpdatesToClient:.cold.3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_6(&dword_1CF55F000, v0, (uint64_t)v0, "[DEBUG] ┏%llx download-op sending past updates to %@", v1);
  OUTLINED_FUNCTION_8_0();
}

void __49__FPDDownloadOperation__setupCreatedItemForRoot___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, a3, "[DEBUG] Calling client with created root %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8_0();
}

void __62__FPDDownloadOperation__finishedDownloadingLocator_withError___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, a3, "[DEBUG] Download root successfully completed: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8_0();
}

void __62__FPDDownloadOperation__finishedDownloadingLocator_withError___block_invoke_cold_2(uint64_t a1, id *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a2, "fp_prettyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  v8 = v5;
  OUTLINED_FUNCTION_10(&dword_1CF55F000, a3, v6, "[ERROR] Download root %@ failed with error: %@", v7);

  OUTLINED_FUNCTION_2();
}

void __28__FPDDownloadOperation_main__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CF55F000, a1, a3, "[DEBUG] download-operation: Completed root creation, remote progresses can be retrieved from URLs.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __28__FPDDownloadOperation_main__block_invoke_2_19_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "createdItemByRoot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v5, "[DEBUG] download-operation: Completed downloading roots %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_2();
}

void __28__FPDDownloadOperation_main__block_invoke_2_24_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(*(id *)(a1 + 32), "isDownloaded");
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_3(&dword_1CF55F000, v1, v2, "[DEBUG] Finished decorating item %@ isDownloaded ? %{BOOL}d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_0();
}

void __28__FPDDownloadOperation_main__block_invoke_26_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "isDownloaded");
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_3(&dword_1CF55F000, v1, v2, "[DEBUG] Finished fetching item %@ isDownloaded ? %{BOOL}d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_0();
}

void __28__FPDDownloadOperation_main__block_invoke_26_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v0, (uint64_t)v0, "[ERROR] Unable to fetch item %@, ignoring error: %@", v1);
  OUTLINED_FUNCTION_8_0();
}

@end
