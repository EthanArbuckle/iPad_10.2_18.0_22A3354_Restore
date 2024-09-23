@implementation ASDAppQueryExecutor

void __82__ASDAppQueryExecutor_executeQueryWithPredicate_onPairedDevice_withResultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  ASDPromise *v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  NSObject *v30;
  uint64_t v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "predicateFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pairingID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "UUIDString");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("LOCAL");
  if (v7)
    v9 = (const __CFString *)v7;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@>-<%@>"), v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "objectForKeyedSubscript:", v10);
  v11 = (ASDPromise *)objc_claimAutoreleasedReturnValue();
  ASDLogHandleForCategory(12);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  v14 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      v33 = v10;
      _os_log_debug_impl(&dword_19A03B000, v12, OS_LOG_TYPE_DEBUG, "(AppQueryExecutor) Joining request: %@", buf, 0xCu);
    }
  }
  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      v33 = v10;
      _os_log_debug_impl(&dword_19A03B000, v12, OS_LOG_TYPE_DEBUG, "(AppQueryExecutor) Starting request: %@", buf, 0xCu);
    }

    v11 = objc_alloc_init(ASDPromise);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "setObject:forKeyedSubscript:", v11, v10);
    v29[0] = v14;
    v29[1] = 3221225472;
    v29[2] = __82__ASDAppQueryExecutor_executeQueryWithPredicate_onPairedDevice_withResultHandler___block_invoke_3;
    v29[3] = &unk_1E37BDE78;
    v15 = v10;
    v16 = *(_QWORD *)(a1 + 48);
    v30 = v15;
    v31 = v16;
    -[ASDPromise alwaysPerform:onScheduler:](v11, "alwaysPerform:onScheduler:", v29, *(_QWORD *)(v16 + 8));
    v17 = *(void **)(a1 + 32);
    v18 = *(void **)(a1 + 40);
    v19 = *(void **)(*(_QWORD *)(a1 + 48) + 24);
    -[ASDPromise completionHandlerAdapter](v11, "completionHandlerAdapter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASDAppQueryExecutor _executeQueryWithPredicate:isForUpdates:reloadingFromServer:onPairedDevice:usingServiceBroker:withResultHandler:]((uint64_t)ASDAppQueryExecutor, v17, 0, 0, v18, v19, v20);

    v12 = v30;
  }

  v26[0] = v14;
  v26[1] = 3221225472;
  v26[2] = __82__ASDAppQueryExecutor_executeQueryWithPredicate_onPairedDevice_withResultHandler___block_invoke_6;
  v26[3] = &unk_1E37BEEC8;
  v27 = v10;
  v28 = *(id *)(a1 + 56);
  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = __82__ASDAppQueryExecutor_executeQueryWithPredicate_onPairedDevice_withResultHandler___block_invoke_8;
  v23[3] = &unk_1E37BDEE8;
  v24 = v27;
  v25 = *(id *)(a1 + 56);
  v21 = v27;
  +[ASDDispatchQueue defaultQueue](ASDDispatchQueue, "defaultQueue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDPromise thenPerform:orCatchError:onScheduler:](v11, "thenPerform:orCatchError:onScheduler:", v26, v23, v22);

}

+ (void)_executeQueryWithPredicate:(char)a3 isForUpdates:(char)a4 reloadingFromServer:(void *)a5 onPairedDevice:(void *)a6 usingServiceBroker:(void *)a7 withResultHandler:
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD *v24;
  uint64_t v25;
  char v26;
  char v27;
  _QWORD v28[3];
  char v29;

  v12 = a2;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = objc_opt_self();
  if (v14)
  {
    v17 = v16;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v29 = 1;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke;
    v19[3] = &unk_1E37BEFB8;
    v20 = v12;
    v24 = v28;
    v25 = v17;
    v26 = a3;
    v27 = a4;
    v21 = v13;
    v22 = v14;
    v23 = v15;
    objc_msgSend(v22, "getLibraryServiceWithCompletionHandler:", v19);

    _Block_object_dispose(v28, 8);
  }
  else
  {
    __ErrorWithUnderlyingErrorAndPredicate(0, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v15 + 2))(v15, 0, v18);

  }
}

- (void)executeQueryWithPredicate:(id)a3 onPairedDevice:(id)a4 withResultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  ASDDispatchQueue *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  ASDAppQueryExecutor *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__ASDAppQueryExecutor_executeQueryWithPredicate_onPairedDevice_withResultHandler___block_invoke;
  v15[3] = &unk_1E37BEEF0;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[ASDDispatchQueue syncUsingBlock:](dispatchQueue, "syncUsingBlock:", v15);

}

void __82__ASDAppQueryExecutor_executeQueryWithPredicate_onPairedDevice_withResultHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = objc_msgSend(v3, "count");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 134218242;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_debug_impl(&dword_19A03B000, v4, OS_LOG_TYPE_DEBUG, "(AppQueryExecutor) Dispatching %lu results: %@", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __82__ASDAppQueryExecutor_executeQueryWithPredicate_onPairedDevice_withResultHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  ASDLogHandleForCategory(12);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_debug_impl(&dword_19A03B000, v2, OS_LOG_TYPE_DEBUG, "(AppQueryExecutor) Completing request: %@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));
}

- (ASDAppQueryExecutor)initWithServiceBroker:(id)a3
{
  id v5;
  ASDAppQueryExecutor *v6;
  ASDAppQueryExecutor *v7;
  ASDDispatchQueue *v8;
  ASDDispatchQueue *dispatchQueue;
  NSMutableDictionary *v10;
  NSMutableDictionary *queryPromises;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASDAppQueryExecutor;
  v6 = -[ASDAppQueryExecutor init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceBroker, a3);
    v8 = -[ASDDispatchQueue initWithName:]([ASDDispatchQueue alloc], "initWithName:", CFSTR("com.apple.AppStoreDaemon.ASDAppQuery.executor"));
    dispatchQueue = v7->_dispatchQueue;
    v7->_dispatchQueue = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queryPromises = v7->_queryPromises;
    v7->_queryPromises = v10;

  }
  return v7;
}

void __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id *v11;
  _QWORD *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  __int16 v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int16 v40;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_2;
    v34[3] = &unk_1E37BEF90;
    v35 = *(id *)(a1 + 32);
    v39 = *(_OWORD *)(a1 + 64);
    v40 = *(_WORD *)(a1 + 80);
    v36 = *(id *)(a1 + 40);
    v37 = *(id *)(a1 + 48);
    v38 = *(id *)(a1 + 56);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v34);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 40);
    if (v9)
    {
      if (!*(_BYTE *)(a1 + 80))
      {
        v15 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v9, "pairingID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v7;
        v26[1] = 3221225472;
        v26[2] = __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_4;
        v26[3] = &unk_1E37BDBD8;
        v11 = &v27;
        v27 = *(id *)(a1 + 56);
        objc_msgSend(v8, "executeQueryWithPredicate:onPairedDevice:withReplyHandler:", v15, v16, v26);

        goto LABEL_14;
      }
      v10 = *(unsigned __int8 *)(a1 + 81);
      v28[0] = v7;
      v28[1] = 3221225472;
      v28[2] = __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_3_18;
      v28[3] = &unk_1E37BDBD8;
      v11 = &v29;
      v29 = *(id *)(a1 + 56);
      v12 = v28;
    }
    else
    {
      if (!*(_BYTE *)(a1 + 80))
      {
        v17 = *(_QWORD *)(a1 + 32);
        v30[0] = v7;
        v30[1] = 3221225472;
        v30[2] = __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_2_17;
        v30[3] = &unk_1E37BDBD8;
        v11 = &v31;
        v31 = *(id *)(a1 + 56);
        objc_msgSend(v8, "executeQueryWithPredicate:withReplyHandler:", v17, v30);
        goto LABEL_14;
      }
      v10 = *(unsigned __int8 *)(a1 + 81);
      v32[0] = v7;
      v32[1] = 3221225472;
      v32[2] = __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_16;
      v32[3] = &unk_1E37BDBD8;
      v11 = &v33;
      v33 = *(id *)(a1 + 56);
      v12 = v32;
    }
    objc_msgSend(v8, "executeQueryForUpdatesReloadingFromServer:withReplyHandler:", v10, v12);
LABEL_14:

    v13 = v35;
    goto LABEL_15;
  }
  __ErrorWithUnderlyingErrorAndPredicate(v5, *(void **)(a1 + 32));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
    && ASDErrorIsEqual(v6, (void *)*MEMORY[0x1E0CB28A8], 4097))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    dispatch_get_global_queue(21, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_5;
    v18[3] = &unk_1E37BEF68;
    v24 = *(_QWORD *)(a1 + 72);
    v13 = v13;
    v19 = v13;
    v20 = *(id *)(a1 + 32);
    v25 = *(_WORD *)(a1 + 80);
    v21 = *(id *)(a1 + 40);
    v22 = *(id *)(a1 + 48);
    v23 = *(id *)(a1 + 56);
    dispatch_async(v14, v18);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
LABEL_15:

}

- (ASDAppQueryExecutor)init
{
  return -[ASDAppQueryExecutor initWithServiceBroker:](self, "initWithServiceBroker:", 0);
}

void __82__ASDAppQueryExecutor_executeQueryWithPredicate_onPairedDevice_withResultHandler___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v5;
    _os_log_debug_impl(&dword_19A03B000, v4, OS_LOG_TYPE_DEBUG, "(AppQueryExecutor) Dispatching error: %@", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)executeUpdatesQueryWithPredicateReloadingFromServer:(BOOL)a3 onPairedDevice:(id)a4 withResultHandler:(id)a5
{
  id v8;
  id v9;
  ASDDispatchQueue *dispatchQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a4;
  v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __108__ASDAppQueryExecutor_executeUpdatesQueryWithPredicateReloadingFromServer_onPairedDevice_withResultHandler___block_invoke;
  v13[3] = &unk_1E37BEF40;
  v16 = a3;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  -[ASDDispatchQueue syncUsingBlock:](dispatchQueue, "syncUsingBlock:", v13);

}

void __108__ASDAppQueryExecutor_executeUpdatesQueryWithPredicateReloadingFromServer_onPairedDevice_withResultHandler___block_invoke(uint64_t a1)
{
  ASDPromise *v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  uint64_t v16;
  __CFString *v17;
  uint8_t buf[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", CFSTR("Updates"));
  v2 = (ASDPromise *)objc_claimAutoreleasedReturnValue();
  ASDLogHandleForCategory(12);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  v5 = MEMORY[0x1E0C809B0];
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19A03B000, v3, OS_LOG_TYPE_DEBUG, "(AppQueryExecutor) Joining updates request", buf, 2u);
    }

  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19A03B000, v3, OS_LOG_TYPE_DEBUG, "(AppQueryExecutor) Starting updates request", buf, 2u);
    }

    v2 = objc_alloc_init(ASDPromise);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v2, CFSTR("Updates"));
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __108__ASDAppQueryExecutor_executeUpdatesQueryWithPredicateReloadingFromServer_onPairedDevice_withResultHandler___block_invoke_13;
    v15[3] = &unk_1E37BDE78;
    v16 = *(_QWORD *)(a1 + 32);
    v17 = CFSTR("Updates");
    -[ASDPromise alwaysPerform:onScheduler:](v2, "alwaysPerform:onScheduler:", v15, *(_QWORD *)(v16 + 8));
    v6 = *(_BYTE *)(a1 + 56);
    v7 = *(void **)(a1 + 40);
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    -[ASDPromise completionHandlerAdapter](v2, "completionHandlerAdapter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASDAppQueryExecutor _executeQueryWithPredicate:isForUpdates:reloadingFromServer:onPairedDevice:usingServiceBroker:withResultHandler:]((uint64_t)ASDAppQueryExecutor, 0, 1, v6, v7, v8, v9);

  }
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __108__ASDAppQueryExecutor_executeUpdatesQueryWithPredicateReloadingFromServer_onPairedDevice_withResultHandler___block_invoke_14;
  v13[3] = &unk_1E37BEF18;
  v14 = *(id *)(a1 + 48);
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __108__ASDAppQueryExecutor_executeUpdatesQueryWithPredicateReloadingFromServer_onPairedDevice_withResultHandler___block_invoke_15;
  v11[3] = &unk_1E37BDB60;
  v12 = *(id *)(a1 + 48);
  +[ASDDispatchQueue defaultQueue](ASDDispatchQueue, "defaultQueue", v5, 3221225472, __108__ASDAppQueryExecutor_executeUpdatesQueryWithPredicateReloadingFromServer_onPairedDevice_withResultHandler___block_invoke_15, &unk_1E37BDB60);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDPromise thenPerform:orCatchError:onScheduler:](v2, "thenPerform:orCatchError:onScheduler:", v13, v11, v10);

}

uint64_t __108__ASDAppQueryExecutor_executeUpdatesQueryWithPredicateReloadingFromServer_onPairedDevice_withResultHandler___block_invoke_13(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  ASDLogHandleForCategory(12);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_19A03B000, v2, OS_LOG_TYPE_DEBUG, "(AppQueryExecutor) Completing updates request", v4, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
}

void __108__ASDAppQueryExecutor_executeUpdatesQueryWithPredicateReloadingFromServer_onPairedDevice_withResultHandler___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = 134217984;
    v6 = objc_msgSend(v3, "count");
    _os_log_debug_impl(&dword_19A03B000, v4, OS_LOG_TYPE_DEBUG, "(AppQueryExecutor) Dispatching %lu results for updates", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __108__ASDAppQueryExecutor_executeUpdatesQueryWithPredicateReloadingFromServer_onPairedDevice_withResultHandler___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_debug_impl(&dword_19A03B000, v4, OS_LOG_TYPE_DEBUG, "(AppQueryExecutor) Dispatching error for updates", v5, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  __int16 v13;

  v3 = a2;
  __ErrorWithUnderlyingErrorAndPredicate(v3, *(void **)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
    && ASDErrorIsEqual(v3, (void *)*MEMORY[0x1E0CB28A8], 4097))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    dispatch_get_global_queue(21, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_3;
    block[3] = &unk_1E37BEF68;
    v12 = *(_QWORD *)(a1 + 72);
    v7 = v4;
    v8 = *(id *)(a1 + 32);
    v13 = *(_WORD *)(a1 + 80);
    v9 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    v11 = *(id *)(a1 + 56);
    dispatch_async(v5, block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v4;
  uint64_t v5;
  id v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  ASDLogHandleForCategory(12);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_opt_class();
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    v6 = v4;
    _os_log_error_impl(&dword_19A03B000, v2, OS_LOG_TYPE_ERROR, "[%{public}@]: Making second attempt to execute query after error: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  return +[ASDAppQueryExecutor _executeQueryWithPredicate:isForUpdates:reloadingFromServer:onPairedDevice:usingServiceBroker:withResultHandler:](*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 80), *(unsigned __int8 *)(a1 + 81), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_2_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_3_18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  void *v4;
  uint64_t v5;
  id v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  ASDLogHandleForCategory(12);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_opt_class();
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    v6 = v4;
    _os_log_error_impl(&dword_19A03B000, v2, OS_LOG_TYPE_ERROR, "[%{public}@]: Making second attempt to request service after error: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  return +[ASDAppQueryExecutor _executeQueryWithPredicate:isForUpdates:reloadingFromServer:onPairedDevice:usingServiceBroker:withResultHandler:](*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 80), *(unsigned __int8 *)(a1 + 81), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (int64_t)queryOptions
{
  return self->_queryOptions;
}

- (void)setQueryOptions:(int64_t)a3
{
  self->_queryOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBroker, 0);
  objc_storeStrong((id *)&self->_queryPromises, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
