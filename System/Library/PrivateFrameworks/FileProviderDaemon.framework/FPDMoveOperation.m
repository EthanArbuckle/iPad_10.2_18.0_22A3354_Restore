@implementation FPDMoveOperation

+ (BOOL)_validateInfo:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (FPDMoveOperation)initWithActionInfo:(id)a3 request:(id)a4 server:(id)a5
{
  id v8;
  id v9;
  id v10;
  FPDMoveOperation *v11;
  FPDActionOperationQueue *v12;
  void *v13;
  uint64_t v14;
  FPDActionOperationQueue *queue;
  FPDMoveWriter *v16;
  FPDMoveWriter *writer;
  objc_class *v18;
  uint64_t v19;
  FPDMoveReader *reader;
  FPDMoveOperation *v21;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (+[FPDMoveOperation _validateInfo:](FPDMoveOperation, "_validateInfo:", v8))
  {
    v23.receiver = self;
    v23.super_class = (Class)FPDMoveOperation;
    v11 = -[FPDActionOperation initWithActionInfo:request:server:](&v23, sel_initWithActionInfo_request_server_, v8, v9, v10);
    if (v11)
    {
      v12 = [FPDActionOperationQueue alloc];
      -[FPDActionOperation info](v11, "info");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[FPDActionOperationQueue initWithMoveInfo:](v12, "initWithMoveInfo:", v13);
      queue = v11->_queue;
      v11->_queue = (FPDActionOperationQueue *)v14;

      v16 = -[FPDMoveWriter initWithOperation:queue:]([FPDMoveWriter alloc], "initWithOperation:queue:", v11, v11->_queue);
      writer = v11->_writer;
      v11->_writer = v16;

      NSClassFromString(CFSTR("FPDMoveReader"));
      v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend([v18 alloc], "initWithMoveWriter:operation:queue:", v11->_writer, v11, v11->_queue);
      reader = v11->_reader;
      v11->_reader = (FPDMoveReader *)v19;

    }
    self = v11;
    v21 = self;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)main
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] ┳%llx starting move operation!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __24__FPDMoveOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id *v10;
  id WeakRetained;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17[4];

  v9 = a2;
  v10 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v12 = objc_loadWeakRetained(v10);
    objc_msgSend(v12, "callbackQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __24__FPDMoveOperation_main__block_invoke_2;
    v14[3] = &unk_1E8C75DB8;
    v17[1] = a3;
    v17[2] = a4;
    v17[3] = a5;
    v15 = v9;
    objc_copyWeak(v17, v10);
    v16 = WeakRetained;
    dispatch_async(v13, v14);

    objc_destroyWeak(v17);
  }

}

void __24__FPDMoveOperation_main__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", *(_QWORD *)(a1 + 64) + 200 * *(_QWORD *)(a1 + 56) + *(_QWORD *)(a1 + 72));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCancellable:", 1);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __24__FPDMoveOperation_main__block_invoke_3;
  v7 = &unk_1E8C75D90;
  v8 = *(id *)(a1 + 32);
  objc_copyWeak(&v9, (id *)(a1 + 48));
  objc_msgSend(v2, "setCancellationHandler:", &v4);
  objc_msgSend(*(id *)(a1 + 40), "progressByRoot", v4, v5, v6, v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 32));

  objc_destroyWeak(&v9);
}

void __24__FPDMoveOperation_main__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __24__FPDMoveOperation_main__block_invoke_3_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "cancelRoot:", *(_QWORD *)(a1 + 32));

}

void __24__FPDMoveOperation_main__block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "callbackQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __24__FPDMoveOperation_main__block_invoke_2_8;
    block[3] = &unk_1E8C75E48;
    block[4] = v2;
    dispatch_async(v3, block);

  }
}

uint64_t __24__FPDMoveOperation_main__block_invoke_2_8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHasFinishedPreflight:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "forAllClients:", &__block_literal_global_2);
}

uint64_t __24__FPDMoveOperation_main__block_invoke_3_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remoteOperationProgressesAreReady");
}

void __24__FPDMoveOperation_main__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "startDownloadOfItem:shouldMaterializeRecursively:completionHandler:", v8, a3, v7);

}

void __24__FPDMoveOperation_main__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  void *v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "callbackQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __24__FPDMoveOperation_main__block_invoke_6;
    v7[3] = &unk_1E8C75850;
    v8 = v3;
    v9 = v5;
    dispatch_async(v6, v7);

  }
}

void __24__FPDMoveOperation_main__block_invoke_6(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__FPDMoveOperation_main__block_invoke_6_cold_1(a1);

  objc_msgSend(*(id *)(a1 + 40), "setHasFinishedPreflight:", 1);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "createdItemByRoot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "completedWithResult:error:", v4, *(_QWORD *)(a1 + 32));

}

void __24__FPDMoveOperation_main__block_invoke_13(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  uint64_t v11;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "callbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __24__FPDMoveOperation_main__block_invoke_2_14;
    block[3] = &unk_1E8C75EE8;
    block[4] = v7;
    v10 = v5;
    v11 = a3;
    dispatch_async(v8, block);

  }
}

void __24__FPDMoveOperation_main__block_invoke_2_14(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "progressByRoot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setCompletedUnitCount:", objc_msgSend(v3, "completedUnitCount") + *(_QWORD *)(a1 + 48));
}

void __24__FPDMoveOperation_main__block_invoke_3_16(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  char v15;

  v7 = a2;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "callbackQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __24__FPDMoveOperation_main__block_invoke_4_17;
    v12[3] = &unk_1E8C75F38;
    v12[4] = v10;
    v13 = v7;
    v15 = a4;
    v14 = v8;
    dispatch_async(v11, v12);

  }
}

void __24__FPDMoveOperation_main__block_invoke_4_17(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "progressByRoot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "size") * *(unsigned __int8 *)(a1 + 56)+ 200+ objc_msgSend(v3, "completedUnitCount"));
}

void __24__FPDMoveOperation_main__block_invoke_5_19(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "callbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __24__FPDMoveOperation_main__block_invoke_6_20;
    block[3] = &unk_1E8C75240;
    block[4] = v8;
    v11 = v5;
    v12 = v6;
    dispatch_async(v9, block);

  }
}

void __24__FPDMoveOperation_main__block_invoke_6_20(id *a1)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = a1[6];
  objc_msgSend(a1[4], "createdItemByRoot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, a1[5]);

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__FPDMoveOperation_main__block_invoke_7;
  v5[3] = &unk_1E8C75FA8;
  v4 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  objc_msgSend(v4, "forAllClients:", v5);

}

uint64_t __24__FPDMoveOperation_main__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remoteOperationCreatedRoot:resultingItem:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), &__block_literal_global_21);
}

void __24__FPDMoveOperation_main__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  id v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v9 = objc_loadWeakRetained(v7);
    objc_msgSend(v9, "callbackQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __24__FPDMoveOperation_main__block_invoke_10;
    block[3] = &unk_1E8C75240;
    v12 = v6;
    v13 = v5;
    v14 = WeakRetained;
    dispatch_async(v10, block);

  }
}

void __24__FPDMoveOperation_main__block_invoke_10(id *a1)
{
  id *v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 4;
  v3 = a1[4];
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __24__FPDMoveOperation_main__block_invoke_10_cold_2((uint64_t)a1, v2, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __24__FPDMoveOperation_main__block_invoke_10_cold_1();
  }

  objc_msgSend(a1[6], "progressByRoot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", a1[5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setCompletedUnitCount:", objc_msgSend(v7, "totalUnitCount"));
  objc_msgSend(a1[6], "completedRoots");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", a1[5]);

  v9 = a1[4];
  objc_msgSend(a1[6], "errorsByRoot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, a1[5]);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(a1[6], "progressCompletionsByRoot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", a1[5]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v16++) + 16))();
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v14);
  }

  objc_msgSend(a1[6], "progressCompletionsByRoot");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", a1[5]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeAllObjects");

  objc_msgSend(a1[6], "createdItemByRoot");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", a1[5]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __24__FPDMoveOperation_main__block_invoke_23;
  v23[3] = &unk_1E8C76018;
  v21 = a1[6];
  v24 = a1[5];
  v25 = v20;
  v26 = a1[4];
  v22 = v20;
  objc_msgSend(v21, "forAllClients:", v23);

}

uint64_t __24__FPDMoveOperation_main__block_invoke_23(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remoteOperationCompletedRoot:resultingItem:error:completion:", a1[4], a1[5], a1[6], &__block_literal_global_25);
}

void __24__FPDMoveOperation_main__block_invoke_3_27(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  void *v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "callbackQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __24__FPDMoveOperation_main__block_invoke_4_28;
    v7[3] = &unk_1E8C75850;
    v8 = v3;
    v9 = v5;
    dispatch_async(v6, v7);

  }
}

void __24__FPDMoveOperation_main__block_invoke_4_28(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  void *v4;
  void *v5;

  v2 = (id *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __24__FPDMoveOperation_main__block_invoke_4_28_cold_1(v2);

  }
  v4 = *(void **)(a1 + 40);
  objc_msgSend(v4, "createdItemByRoot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "completedWithResult:error:", v5, *(_QWORD *)(a1 + 32));

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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t section;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  -[FPOperation callbackQueue](self, "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  section = __fp_create_section();
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FPDMoveOperation sendPastUpdatesToClient:].cold.3();

  if (-[FPOperation isFinished](self, "isFinished"))
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[FPDMoveOperation sendPastUpdatesToClient:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    -[FPDActionOperation unregisterClientsAfterCompletion](self, "unregisterClientsAfterCompletion");
  }
  else
  {
    if (-[FPDActionOperation hasFinishedPreflight](self, "hasFinishedPreflight"))
    {
      objc_msgSend(v33, "remoteOperationProgressesAreReady");
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      -[FPDActionOperation progressByRoot](self, "progressByRoot");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v35;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v35 != v16)
              objc_enumerationMutation(v14);
            v18 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v17);
            -[FPDActionOperation createdItemByRoot](self, "createdItemByRoot");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKeyedSubscript:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            -[FPDActionOperation completedRoots](self, "completedRoots");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "containsObject:", v18);

            -[FPDActionOperation errorsByRoot](self, "errorsByRoot");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", v18);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              objc_msgSend(v33, "remoteOperationCompletedRoot:resultingItem:error:completion:", v18, v20, v24, &__block_literal_global_29);
            }
            else if (v20)
            {
              objc_msgSend(v33, "remoteOperationCreatedRoot:resultingItem:completion:", v18, v20, &__block_literal_global_30);
            }

            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        }
        while (v15);
      }

    }
    fp_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[FPDMoveOperation sendPastUpdatesToClient:].cold.2(v25, v26, v27, v28, v29, v30, v31, v32);

    objc_msgSend(v33, "remoteOperationFinishedSendingPastUpdates");
  }
  __fp_leave_section_Debug();

}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  FPDMoveReader *reader;
  FPDMoveWriter *writer;
  FPDActionOperationQueue *queue;
  NSObject *v12;
  objc_super v13;

  v6 = a4;
  v7 = a3;
  -[FPOperation callbackQueue](self, "callbackQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[FPDActionOperationQueue cancel](self->_queue, "cancel");
  -[FPDMoveReader cancel](self->_reader, "cancel");
  -[FPDMoveWriter cancel](self->_writer, "cancel");
  reader = self->_reader;
  self->_reader = 0;

  writer = self->_writer;
  self->_writer = 0;

  queue = self->_queue;
  self->_queue = 0;

  -[FPDActionOperation setError:](self, "setError:", v6);
  fp_current_or_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[FPDMoveOperation finishWithResult:error:].cold.1(self, v12);

  v13.receiver = self;
  v13.super_class = (Class)FPDMoveOperation;
  -[FPDActionOperation finishWithResult:error:](&v13, sel_finishWithResult_error_, v7, v6);

}

- (void)cancelRoot:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  FPDMoveOperation *v9;

  v4 = a3;
  -[FPOperation callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__FPDMoveOperation_cancelRoot___block_invoke;
  block[3] = &unk_1E8C75850;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __31__FPDMoveOperation_cancelRoot___block_invoke(uint64_t a1)
{
  NSObject *v2;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __31__FPDMoveOperation_cancelRoot___block_invoke_cold_1();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 416), "cancelRoot:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 424), "cancelRoot:", *(_QWORD *)(a1 + 32));
}

- (void)cancel
{
  NSObject *v3;
  objc_super v4;
  _QWORD block[5];

  -[FPOperation callbackQueue](self, "callbackQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__FPDMoveOperation_cancel__block_invoke;
  block[3] = &unk_1E8C75E48;
  block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)FPDMoveOperation;
  -[FPDActionOperation cancel](&v4, sel_cancel);
}

uint64_t __26__FPDMoveOperation_cancel__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "cancel");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "cancel");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "cancel");
}

- (void)dumpStateTo:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  FPDMoveOperation *v10;

  v4 = a3;
  -[FPOperation callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_activate(v5);

  -[FPOperation callbackQueue](self, "callbackQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__FPDMoveOperation_dumpStateTo___block_invoke;
  block[3] = &unk_1E8C75850;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_sync(v6, block);

}

uint64_t __32__FPDMoveOperation_dumpStateTo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
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
  void *v15;
  void *v16;

  objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("************************\n"));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "write:", CFSTR("move-info=[[%@]]\n\n"), v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "clients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "write:", CFSTR("+ clients: %@\n\n"), v5);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "progressByRoot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "write:", CFSTR("+ progress by root: %@\n\n"), v7);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "createdItemByRoot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "write:", CFSTR("+ moved items by root: %@\n\n"), v9);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "errorsByRoot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "write:", CFSTR("+ errors by root: %@\n"), v11);

  v12 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "completedRoots");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "write:", CFSTR("+ completed roots: %@\n"), v13);

  objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("\n"));
  objc_msgSend(*(id *)(a1 + 40), "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "startFgColor:", 1);
    v15 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "write:", CFSTR("+ error: %@\n"), v16);

    objc_msgSend(*(id *)(a1 + 32), "reset");
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 416), "dumpStateTo:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 432), "dumpStateTo:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 424), "dumpStateTo:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 32), "write:", CFSTR("************************\n"));
}

- (void)_t_unblockReader
{
  NSObject *v3;
  _QWORD block[5];

  -[FPOperation callbackQueue](self, "callbackQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__FPDMoveOperation__t_unblockReader__block_invoke;
  block[3] = &unk_1E8C75E48;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __36__FPDMoveOperation__t_unblockReader__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "_t_unblock");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

void __24__FPDMoveOperation_main__block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] root is being cancelled via its progress: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __24__FPDMoveOperation_main__block_invoke_6_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "fp_prettyDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v2, v3, "[ERROR] reader failed with error: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

void __24__FPDMoveOperation_main__block_invoke_10_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] root successfully completed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __24__FPDMoveOperation_main__block_invoke_10_cold_2(uint64_t a1, id *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[14];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a2, "fp_prettyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  v7 = v5;
  _os_log_error_impl(&dword_1CF55F000, a3, OS_LOG_TYPE_ERROR, "[ERROR] root failed with error: %@; %@", v6, 0x16u);

}

void __24__FPDMoveOperation_main__block_invoke_4_28_cold_1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*a1, "fp_prettyDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v2, v3, "[ERROR] writer failed with error: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)sendPastUpdatesToClient:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CF55F000, a1, a3, "[DEBUG] remote operation has already finished", a5, a6, a7, a8, 0);
}

- (void)sendPastUpdatesToClient:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CF55F000, a1, a3, "[DEBUG] finished sending past updates", a5, a6, a7, a8, 0);
}

- (void)sendPastUpdatesToClient:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_1();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_1CF55F000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx sending past updates to %@", v2, 0x16u);
  OUTLINED_FUNCTION_8_0();
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
  _os_log_debug_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] move operation finished with moved-roots:%@ errors-by-root:%@; %@",
    v9,
    0x20u);

}

void __31__FPDMoveOperation_cancelRoot___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] cancelling root: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

@end
