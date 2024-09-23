@implementation CXAbstractProvider

- (CXAbstractProvider)init
{
  CXAbstractProvider *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSMutableArray *mutablePendingTransactions;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CXAbstractProvider;
  v2 = -[CXAbstractProvider init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.callkit.callprovider", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    mutablePendingTransactions = v2->_mutablePendingTransactions;
    v2->_mutablePendingTransactions = (NSMutableArray *)v6;

  }
  return v2;
}

- (void)actionCompleted:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXAbstractProvider queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__CXAbstractProvider_actionCompleted___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __38__CXAbstractProvider_actionCompleted___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v15 = 138412546;
    v16 = v3;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Provider %@ was notified that action %@ completed", (uint8_t *)&v15, 0x16u);
  }

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_pendingActionWithUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (objc_msgSend(v7, "isComplete") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "updateCopy:withZone:", v7, 0);
    objc_msgSend(*(id *)(a1 + 32), "internalActionDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hostProtocolDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v13, "actionCompleted:completionHandler:", v14, &__block_literal_global_2);

    objc_msgSend(*(id *)(a1 + 32), "_updatePendingTransactions");
  }
  else
  {
    CXDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "mutablePendingTransactions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] No incomplete pending action could be found with UUID %@. All pending transactions: %@", (uint8_t *)&v15, 0x16u);

    }
  }

}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[CXAbstractProvider queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CXAbstractProvider_setDelegate_queue___block_invoke;
  block[3] = &unk_1E4B88AC0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __40__CXAbstractProvider_setDelegate_queue___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48))
    v2 = *(_QWORD *)(a1 + 48);
  else
    v2 = MEMORY[0x1E0C80D38];
  return objc_msgSend(*(id *)(a1 + 32), "setDelegateQueue:", v2);
}

- (void)_syncSetDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[CXAbstractProvider queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CXAbstractProvider__syncSetDelegate_queue___block_invoke;
  block[3] = &unk_1E4B88AC0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

uint64_t __45__CXAbstractProvider__syncSetDelegate_queue___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48))
    v2 = *(_QWORD *)(a1 + 48);
  else
    v2 = MEMORY[0x1E0C80D38];
  return objc_msgSend(*(id *)(a1 + 32), "setDelegateQueue:", v2);
}

- (void)invalidate
{
  NSObject *v3;
  int v4;
  CXAbstractProvider *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_1A402D000, v3, OS_LOG_TYPE_DEFAULT, "Asked to invalidate provider %@ (this is a no-op)", (uint8_t *)&v4, 0xCu);
  }

}

- (NSArray)pendingTransactions
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[CXAbstractProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__CXAbstractProvider_pendingTransactions__block_invoke;
  v6[3] = &unk_1E4B88C60;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __41__CXAbstractProvider_pendingTransactions__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = objc_alloc(MEMORY[0x1E0C99D20]);
  objc_msgSend(*(id *)(a1 + 32), "mutablePendingTransactions");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "initWithArray:copyItems:", v6, 1);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_updatePendingTransactions
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[CXAbstractProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[CXAbstractProvider mutablePendingTransactions](self, "mutablePendingTransactions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  -[CXAbstractProvider mutablePendingTransactions](self, "mutablePendingTransactions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v17;
    *(_QWORD *)&v9 = 138412290;
    v15 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isComplete", v15, (_QWORD)v16) & 1) != 0)
        {
          CXDefaultLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v15;
            v21 = v13;
            _os_log_impl(&dword_1A402D000, v14, OS_LOG_TYPE_DEFAULT, "Removing transaction from list of pending transactions because it is now complete: %@", buf, 0xCu);
          }
        }
        else
        {
          -[CXAbstractProvider mutablePendingTransactions](self, "mutablePendingTransactions");
          v14 = objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v14, "addObject:", v13);
        }

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v10);
  }

}

- (id)_pendingActionWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  id obj;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CXAbstractProvider queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[CXAbstractProvider mutablePendingTransactions](self, "mutablePendingTransactions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v21 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v9, "actions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v11)
        {
          v12 = v11;
          v13 = 0;
          v14 = *(_QWORD *)v23;
LABEL_8:
          v15 = 0;
          v16 = v13;
          while (1)
          {
            if (*(_QWORD *)v23 != v14)
              objc_enumerationMutation(v10);
            v13 = *(id *)(*((_QWORD *)&v22 + 1) + 8 * v15);

            objc_msgSend(v13, "UUID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isEqual:", v4);

            if ((v18 & 1) != 0)
              break;
            ++v15;
            v16 = v13;
            if (v12 == v15)
            {
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              if (v12)
                goto LABEL_8;

              goto LABEL_15;
            }
          }

          if (v13)
            goto LABEL_20;
        }
        else
        {
LABEL_15:

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v7);
  }
  v13 = 0;
LABEL_20:

  return v13;
}

- (void)performDelegateCallback:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXAbstractProvider queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__CXAbstractProvider_performDelegateCallback___block_invoke;
  v7[3] = &unk_1E4B88B30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __46__CXAbstractProvider_performDelegateCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performDelegateCallback:", *(_QWORD *)(a1 + 40));
}

- (void)_performDelegateCallback:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  -[CXAbstractProvider queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[CXAbstractProvider delegateQueue](self, "delegateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    dispatch_async(v6, v4);
  }
  else
  {
    CXDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Asked to perform a delegate callback but no delegate queue exists", v9, 2u);
    }

  }
}

- (void)sendDidBeginForProvider:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__CXAbstractProvider_sendDidBeginForProvider___block_invoke;
  v6[3] = &unk_1E4B88A20;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CXAbstractProvider performDelegateCallback:](self, "performDelegateCallback:", v6);

}

void __46__CXAbstractProvider_sendDidBeginForProvider___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "providerDidBegin:", *(_QWORD *)(a1 + 40));

}

- (void)handleConnectionInterruptionForProvider:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__CXAbstractProvider_handleConnectionInterruptionForProvider___block_invoke;
  v6[3] = &unk_1E4B88A20;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CXAbstractProvider performDelegateCallback:](self, "performDelegateCallback:", v6);

}

void __62__CXAbstractProvider_handleConnectionInterruptionForProvider___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(void);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "providerDidReset:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "connectionInterruptionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "connectionInterruptionHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)provider:(id)a3 commitTransaction:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CXAbstractProvider *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[CXAbstractProvider queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CXAbstractProvider_provider_commitTransaction___block_invoke;
  block[3] = &unk_1E4B88AC0;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __49__CXAbstractProvider_provider_commitTransaction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v22 = v3;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Received request to commit transaction %@", buf, 0xCu);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8++), "setDelegate:", *(_QWORD *)(a1 + 40));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 40), "mutablePendingTransactions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v9, "addObject:", v10);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__CXAbstractProvider_provider_commitTransaction___block_invoke_7;
  v12[3] = &unk_1E4B88AC0;
  v11 = *(void **)(a1 + 48);
  v13 = *(id *)(a1 + 40);
  v14 = v11;
  v15 = *(id *)(a1 + 32);
  objc_msgSend(v13, "_performDelegateCallback:", v12);

}

void __49__CXAbstractProvider_provider_commitTransaction___block_invoke_7(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v2, "provider:executeTransaction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)) & 1) != 0)
  {
    CXDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A402D000, v3, OS_LOG_TYPE_DEFAULT, "Delegate indicated that the transaction was executed", buf, 2u);
    }
  }
  else
  {
    CXDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A402D000, v4, OS_LOG_TYPE_DEFAULT, "Delegate did not execute transaction. Performing actions individually", buf, 2u);
    }

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(*(id *)(a1 + 48), "actions");
    v3 = objc_claimAutoreleasedReturnValue();
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v3);
          v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          CXDefaultLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v17 = v9;
            _os_log_impl(&dword_1A402D000, v10, OS_LOG_TYPE_DEFAULT, "Asking delegate to perform action %@", buf, 0xCu);
          }

          objc_msgSend(*(id *)(a1 + 32), "internalActionDelegate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "performAction:", v9);

        }
        v6 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
      }
      while (v6);
    }
  }

}

- (void)provider:(id)a3 handleTimeoutForAction:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CXAbstractProvider *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[CXAbstractProvider queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CXAbstractProvider_provider_handleTimeoutForAction___block_invoke;
  block[3] = &unk_1E4B88AC0;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __54__CXAbstractProvider_provider_handleTimeoutForAction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v13 = v3;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Notified that action timed out: %@", buf, 0xCu);
  }

  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_pendingActionWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateAsFailedWithReason:", 2);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__CXAbstractProvider_provider_handleTimeoutForAction___block_invoke_10;
  v8[3] = &unk_1E4B88AC0;
  v7 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = v7;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v9, "_performDelegateCallback:", v8);

}

void __54__CXAbstractProvider_provider_handleTimeoutForAction___block_invoke_10(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    CXDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1A402D000, v3, OS_LOG_TYPE_DEFAULT, "Notifying delegate that action timed out: %@", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(v2, "provider:timedOutPerformingAction:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }

}

- (id)connectionInterruptionHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setConnectionInterruptionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (CXActionDelegateInternal)internalActionDelegate
{
  return (CXActionDelegateInternal *)objc_loadWeakRetained((id *)&self->_internalActionDelegate);
}

- (void)setInternalActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_internalActionDelegate, a3);
}

- (CXAbstractProviderDelegate)delegate
{
  return (CXAbstractProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableArray)mutablePendingTransactions
{
  return self->_mutablePendingTransactions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutablePendingTransactions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_internalActionDelegate);
  objc_storeStrong(&self->_connectionInterruptionHandler, 0);
}

@end
