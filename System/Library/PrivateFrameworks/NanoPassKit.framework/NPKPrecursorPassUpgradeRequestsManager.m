@implementation NPKPrecursorPassUpgradeRequestsManager

- (NPKPrecursorPassUpgradeRequestsManager)init
{
  NPKPrecursorPassUpgradeRequestsManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *internalQueue;
  NPKObserverManager *v5;
  NPKObserverManager *observerManager;
  NSMutableDictionary *v7;
  NSMutableDictionary *upgradeControllerMap;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NPKPrecursorPassUpgradeRequestsManager;
  v2 = -[NPKPrecursorPassUpgradeRequestsManager init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.NanoPasskit.NPKPrecursorPassUpgradeRequestsManager", MEMORY[0x24BDAC9C0]);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v3;

    objc_storeStrong((id *)&v2->_observerQueue, MEMORY[0x24BDAC9B8]);
    v5 = objc_alloc_init(NPKObserverManager);
    observerManager = v2->_observerManager;
    v2->_observerManager = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    upgradeControllerMap = v2->_upgradeControllerMap;
    v2->_upgradeControllerMap = v7;

  }
  return v2;
}

- (void)loadUpgradeControllerForPass:(id)a3
{
  id v4;
  void *v5;
  NSObject *internalQueue;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD);
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  NPKPrecursorPassUpgradeRequestController *v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  __int128 *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD block[4];
  id v31;
  __int128 *p_buf;
  id v33;
  id location;
  _QWORD v35[4];
  id v36;
  id v37;
  uint8_t v38[4];
  id v39;
  __int128 buf;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "npkIsPrecursorPass") & 1) != 0)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__16;
    v43 = __Block_byref_object_dispose__16;
    v44 = 0;
    objc_initWeak(&location, self);
    internalQueue = self->_internalQueue;
    v7 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__NPKPrecursorPassUpgradeRequestsManager_loadUpgradeControllerForPass___block_invoke_34;
    block[3] = &unk_24CFEBCD0;
    objc_copyWeak(&v33, &location);
    p_buf = &buf;
    v8 = v5;
    v31 = v8;
    dispatch_sync(internalQueue, block);
    v27[0] = v7;
    v27[1] = 3221225472;
    v27[2] = __71__NPKPrecursorPassUpgradeRequestsManager_loadUpgradeControllerForPass___block_invoke_2;
    v27[3] = &unk_24CFEBD48;
    objc_copyWeak(&v29, &location);
    v9 = v8;
    v28 = v9;
    v10 = MEMORY[0x2199B6780](v27);
    v11 = (void (**)(_QWORD, _QWORD))v10;
    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      (*(void (**)(uint64_t))(v10 + 16))(v10);
    }
    else
    {
      pk_General_log();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

      if (v17)
      {
        pk_General_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v38 = 138412290;
          v39 = v9;
          _os_log_impl(&dword_213518000, v18, OS_LOG_TYPE_DEFAULT, "Notice: NPKPrecursorPassUpgradeRequestsManager: Creating upgradeController for pass: %@", v38, 0xCu);
        }

      }
      v19 = -[NPKPrecursorPassUpgradeRequestController initWithPass:]([NPKPrecursorPassUpgradeRequestController alloc], "initWithPass:", v4);
      v20 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v19;

      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "setDelegate:", self);
      v21 = self->_internalQueue;
      v22[0] = v7;
      v22[1] = 3221225472;
      v22[2] = __71__NPKPrecursorPassUpgradeRequestsManager_loadUpgradeControllerForPass___block_invoke_38;
      v22[3] = &unk_24CFEBD70;
      objc_copyWeak(&v26, &location);
      v25 = &buf;
      v23 = v4;
      v24 = v9;
      dispatch_barrier_async(v21, v22);
      v11[2](v11, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));

      objc_destroyWeak(&v26);
    }

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    pk_General_log();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      pk_General_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v5;
        _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: NPKPrecursorPassUpgradeRequestsManager: Unable to load data; pass (%@) is not a precursor pass.",
          (uint8_t *)&buf,
          0xCu);
      }

    }
    objc_initWeak((id *)&buf, self);
    v15 = self->_internalQueue;
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __71__NPKPrecursorPassUpgradeRequestsManager_loadUpgradeControllerForPass___block_invoke;
    v35[3] = &unk_24CFE7BA8;
    objc_copyWeak(&v37, (id *)&buf);
    v36 = v5;
    dispatch_async(v15, v35);

    objc_destroyWeak(&v37);
    objc_destroyWeak((id *)&buf);
  }

}

void __71__NPKPrecursorPassUpgradeRequestsManager_loadUpgradeControllerForPass___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_notifyObserversDidChangeUpgradeRequestDescription:forPassWithUniqueID:", 0, *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_invalidateUpgradeControllerForPassWithUniqueID:", *(_QWORD *)(a1 + 32));

}

void __71__NPKPrecursorPassUpgradeRequestsManager_loadUpgradeControllerForPass___block_invoke_34(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained[4], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __71__NPKPrecursorPassUpgradeRequestsManager_loadUpgradeControllerForPass___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(25, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__NPKPrecursorPassUpgradeRequestsManager_loadUpgradeControllerForPass___block_invoke_3;
  block[3] = &unk_24CFEBD20;
  v7 = v3;
  v5 = v3;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v8 = *(id *)(a1 + 32);
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
}

void __71__NPKPrecursorPassUpgradeRequestsManager_loadUpgradeControllerForPass___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __71__NPKPrecursorPassUpgradeRequestsManager_loadUpgradeControllerForPass___block_invoke_4;
  v3[3] = &unk_24CFEBCF8;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "fetchUpgradeRequestsWithCompletion:", v3);

  objc_destroyWeak(&v5);
}

void __71__NPKPrecursorPassUpgradeRequestsManager_loadUpgradeControllerForPass___block_invoke_4(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "notifyObserversDidChangeUpgradeRequestDescription:forPassWithUniqueID:", v4, *(_QWORD *)(a1 + 32));

}

void __71__NPKPrecursorPassUpgradeRequestsManager_loadUpgradeControllerForPass___block_invoke_38(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 32), "uniqueID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKPrecursorPassUpgradeRequestsManager: Created upgradeController (%@) for pass: %@", (uint8_t *)&v8, 0x16u);

    }
  }
  objc_msgSend(WeakRetained[4], "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));

}

- (void)invalidateUpgradeControllerForPassWithUniqueID:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__NPKPrecursorPassUpgradeRequestsManager_invalidateUpgradeControllerForPassWithUniqueID___block_invoke;
  block[3] = &unk_24CFE7BA8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(internalQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __89__NPKPrecursorPassUpgradeRequestsManager_invalidateUpgradeControllerForPassWithUniqueID___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_invalidateUpgradeControllerForPassWithUniqueID:", *(_QWORD *)(a1 + 32));

}

- (id)descriptionForPassWithUniqueID:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__16;
  v16 = __Block_byref_object_dispose__16;
  v17 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__NPKPrecursorPassUpgradeRequestsManager_descriptionForPassWithUniqueID___block_invoke;
  block[3] = &unk_24CFEB0F8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __73__NPKPrecursorPassUpgradeRequestsManager_descriptionForPassWithUniqueID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "upgradeRequestDescription");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *observerQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__NPKPrecursorPassUpgradeRequestsManager_addObserver___block_invoke;
  block[3] = &unk_24CFE7BA8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(observerQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __54__NPKPrecursorPassUpgradeRequestsManager_addObserver___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_addObserver:", *(_QWORD *)(a1 + 32));

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *observerQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__NPKPrecursorPassUpgradeRequestsManager_removeObserver___block_invoke;
  block[3] = &unk_24CFE7BA8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(observerQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __57__NPKPrecursorPassUpgradeRequestsManager_removeObserver___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_removeObserver:", *(_QWORD *)(a1 + 32));

}

- (void)precursorPassUpgradeRequestsDidChangeForUpgradeController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "upgradeRequestDescription");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPrecursorPassUpgradeRequestsManager notifyObserversDidChangeUpgradeRequestDescription:forPassWithUniqueID:](self, "notifyObserversDidChangeUpgradeRequestDescription:forPassWithUniqueID:", v7, v6);

}

- (void)notifyObserversDidChangeUpgradeRequestDescription:(id)a3 forPassWithUniqueID:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __112__NPKPrecursorPassUpgradeRequestsManager_notifyObserversDidChangeUpgradeRequestDescription_forPassWithUniqueID___block_invoke;
  v11[3] = &unk_24CFE8650;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __112__NPKPrecursorPassUpgradeRequestsManager_notifyObserversDidChangeUpgradeRequestDescription_forPassWithUniqueID___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_queue_notifyObserversDidChangeUpgradeRequestDescription:forPassWithUniqueID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_queue_invalidateUpgradeControllerForPassWithUniqueID:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKPrecursorPassUpgradeRequestsManager: Invalidating upgradeController for pass: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  -[NSMutableDictionary removeObjectForKey:](self->_upgradeControllerMap, "removeObjectForKey:", v4);

}

- (void)_queue_addObserver:(id)a3
{
  NSObject *observerQueue;
  id v5;

  observerQueue = self->_observerQueue;
  v5 = a3;
  dispatch_assert_queue_V2(observerQueue);
  -[NPKObserverManager registerObserver:](self->_observerManager, "registerObserver:", v5);

}

- (void)_queue_removeObserver:(id)a3
{
  NSObject *observerQueue;
  id v5;

  observerQueue = self->_observerQueue;
  v5 = a3;
  dispatch_assert_queue_V2(observerQueue);
  -[NPKObserverManager unregisterObserver:](self->_observerManager, "unregisterObserver:", v5);

}

- (void)_queue_notifyObserversDidChangeUpgradeRequestDescription:(id)a3 forPassWithUniqueID:(id)a4
{
  id v6;
  id v7;
  NPKObserverManager *observerManager;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  objc_initWeak(&location, self);
  observerManager = self->_observerManager;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __119__NPKPrecursorPassUpgradeRequestsManager__queue_notifyObserversDidChangeUpgradeRequestDescription_forPassWithUniqueID___block_invoke;
  v11[3] = &unk_24CFEBD98;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  -[NPKObserverManager enumerateObserversUsingBlock:](observerManager, "enumerateObserversUsingBlock:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __119__NPKPrecursorPassUpgradeRequestsManager__queue_notifyObserversDidChangeUpgradeRequestDescription_forPassWithUniqueID___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "precursorPassRequestsManager:didUpdateUpgradePrequestDescription:forPassUniqueID:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upgradeControllerMap, 0);
  objc_storeStrong((id *)&self->_observerManager, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
