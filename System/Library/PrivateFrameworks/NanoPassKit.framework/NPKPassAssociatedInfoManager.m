@implementation NPKPassAssociatedInfoManager

- (id)npkBankConnectedAccountForPass:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassAssociatedInfoManager passInfoForPassWithUniqueID:](self, "passInfoForPassWithUniqueID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bankConnectAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)npkBankConnectedDebitAccountForPass:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[NPKPassAssociatedInfoManager npkBankConnectedAccountForPass:](self, "npkBankConnectedAccountForPass:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authorizedFKAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "npkIsDebit"))
  {
    objc_msgSend(v5, "balance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "availableBalance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

    }
    else
    {
      objc_msgSend(v6, "bookedBalance");
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    v8 = v5;
    goto LABEL_8;
  }
  v8 = 0;
LABEL_9:

  return v8;
}

- (void)npkRefreshConnectedAccountDataForPassWithUniqueID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NPKPassAssociatedInfoManager bankConnectDataProvider](self, "bankConnectDataProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "refreshAccountDataForPassWithUniqueID:", v4);

}

- (NPKPassAssociatedInfoManager)init
{
  id v3;
  void *v4;
  NPKPrecursorPassUpgradeRequestsManager *v5;
  NPKPassAssociatedInfoManager *v6;

  v3 = objc_alloc_init(MEMORY[0x24BE6ED30]);
  objc_msgSend(MEMORY[0x24BE6E970], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(NPKPrecursorPassUpgradeRequestsManager);
  v6 = -[NPKPassAssociatedInfoManager initWithPaymentService:accountService:precursorPassManager:](self, "initWithPaymentService:accountService:precursorPassManager:", v3, v4, v5);

  return v6;
}

- (NPKPassAssociatedInfoManager)initWithPaymentService:(id)a3 accountService:(id)a4 precursorPassManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  NPKPassAssociatedInfoManager *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *internalQueue;
  NSMutableDictionary *v15;
  NSMutableDictionary *passAssociatedInfoModelsByPassUniqueID;
  uint64_t v17;
  NSHashTable *observers;
  const char *v19;
  NSObject *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id location;
  objc_super v28;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)NPKPassAssociatedInfoManager;
  v12 = -[NPKPassAssociatedInfoManager init](&v28, sel_init);
  if (v12)
  {
    v13 = dispatch_queue_create("com.apple.NanoPasskit.PassesAssociatedInfoManager", 0);
    internalQueue = v12->_internalQueue;
    v12->_internalQueue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v12->_observerQueue, MEMORY[0x24BDAC9B8]);
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    passAssociatedInfoModelsByPassUniqueID = v12->_passAssociatedInfoModelsByPassUniqueID;
    v12->_passAssociatedInfoModelsByPassUniqueID = v15;

    objc_storeStrong((id *)&v12->_paymentService, a3);
    objc_msgSend(v9, "setDelegate:", v12);
    objc_storeStrong((id *)&v12->_accountService, a4);
    objc_msgSend(MEMORY[0x24BDD15C0], "pk_weakObjectsHashTableUsingPointerPersonality");
    v17 = objc_claimAutoreleasedReturnValue();
    observers = v12->_observers;
    v12->_observers = (NSHashTable *)v17;

    objc_storeStrong((id *)&v12->_precursorPassManager, a5);
    objc_initWeak(&location, v12);
    v19 = (const char *)objc_msgSend(CFSTR("com.apple.nanopasskit.transitpassinformationmanager.pendingaddvalueupdated"), "UTF8String");
    v20 = v12->_internalQueue;
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __91__NPKPassAssociatedInfoManager_initWithPaymentService_accountService_precursorPassManager___block_invoke;
    v25 = &unk_24CFE78F0;
    objc_copyWeak(&v26, &location);
    notify_register_dispatch(v19, &v12->_pendingAddValueUpdatedNotifyToken, v20, &v22);
    -[PKAccountService registerObserver:](v12->_accountService, "registerObserver:", v12, v22, v23, v24, v25);
    -[NPKPrecursorPassUpgradeRequestsManager addObserver:](v12->_precursorPassManager, "addObserver:", v12);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __91__NPKPassAssociatedInfoManager_initWithPaymentService_accountService_precursorPassManager___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  id v5;
  id to;
  uint8_t buf[16];

  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: received pending add value updated notification", buf, 2u);
    }

  }
  objc_copyWeak(&to, (id *)(a1 + 32));
  v5 = objc_loadWeakRetained(&to);
  objc_msgSend(v5, "_updateAllPassesItemsFieldsPendingUpdateStatus");

  objc_destroyWeak(&to);
}

- (void)registerObserver:(id)a3
{
  id v4;
  NSObject *observerQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NPKPassAssociatedInfoManager *v9;

  v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__NPKPassAssociatedInfoManager_registerObserver___block_invoke;
  v7[3] = &unk_24CFE7E40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(observerQueue, v7);

}

uint64_t __49__NPKPassAssociatedInfoManager_registerObserver___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(*(_QWORD *)(result + 40) + 64), "containsObject:");
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 64), "addObject:", *(_QWORD *)(v1 + 32));
  }
  return result;
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  NSObject *observerQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NPKPassAssociatedInfoManager *v9;

  v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__NPKPassAssociatedInfoManager_unregisterObserver___block_invoke;
  v7[3] = &unk_24CFE7E40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(observerQueue, v7);

}

uint64_t __51__NPKPassAssociatedInfoManager_unregisterObserver___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(*(_QWORD *)(result + 40) + 64), "containsObject:");
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 64), "removeObject:", *(_QWORD *)(v1 + 32));
  }
  return result;
}

- (void)_notifyObservers:(id)a3
{
  id v4;
  NSObject *observerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__NPKPassAssociatedInfoManager__notifyObservers___block_invoke;
  v7[3] = &unk_24CFE7E90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(observerQueue, v7);

}

void __49__NPKPassAssociatedInfoManager__notifyObservers___block_invoke(uint64_t a1)
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

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
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
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)setPasses:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *internalQueue;
  id v10;
  _QWORD block[4];
  id v12;
  NPKPassAssociatedInfoManager *v13;
  _QWORD v14[5];

  v4 = MEMORY[0x24BDAC760];
  v5 = (void *)MEMORY[0x24BDD1758];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __42__NPKPassAssociatedInfoManager_setPasses___block_invoke;
  v14[3] = &unk_24CFEC7B0;
  v14[4] = self;
  v6 = a3;
  objc_msgSend(v5, "predicateWithBlock:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredSetUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  internalQueue = self->_internalQueue;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __42__NPKPassAssociatedInfoManager_setPasses___block_invoke_2;
  block[3] = &unk_24CFE7E40;
  v12 = v8;
  v13 = self;
  v10 = v8;
  dispatch_async(internalQueue, block);

}

uint64_t __42__NPKPassAssociatedInfoManager_setPasses___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isPassEligible:", a2);
}

void __42__NPKPassAssociatedInfoManager_setPasses___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "pk_setByApplyingBlock:", &__block_literal_global_26);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v20 = v2;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: setting Passes:%@ to:%@", buf, 0x16u);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minusSet:", v2);
  objc_msgSend(*(id *)(a1 + 40), "_internalQueue_removePassWithUniqueIDs:", v8);
  v9 = *(_QWORD **)(a1 + 40);
  if (v9[9])
  {
    objc_msgSend(v9, "passUniqueIDsByAccountIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAllObjects");

  }
  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __42__NPKPassAssociatedInfoManager_setPasses___block_invoke_44;
  v17[3] = &unk_24CFEC818;
  v12 = *(void **)(a1 + 32);
  v17[4] = *(_QWORD *)(a1 + 40);
  v13 = v11;
  v18 = v13;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v17);
  v14 = *(_QWORD *)(a1 + 40);
  v15 = *(void **)(v14 + 24);
  *(_QWORD *)(v14 + 24) = v13;
  v16 = v13;

}

uint64_t __42__NPKPassAssociatedInfoManager_setPasses___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueID");
}

uint64_t __42__NPKPassAssociatedInfoManager_setPasses___block_invoke_44(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_regenerateAssociatedInfoModelForPass:inModelsByID:", a2, *(_QWORD *)(a1 + 40));
}

- (void)addPass:(id)a3
{
  id v4;
  NSObject *internalQueue;
  _QWORD v6[4];
  id v7;
  NPKPassAssociatedInfoManager *v8;

  v4 = a3;
  if (-[NPKPassAssociatedInfoManager _isPassEligible:](self, "_isPassEligible:", v4))
  {
    internalQueue = self->_internalQueue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __40__NPKPassAssociatedInfoManager_addPass___block_invoke;
    v6[3] = &unk_24CFE7E40;
    v7 = v4;
    v8 = self;
    dispatch_async(internalQueue, v6);

  }
}

uint64_t __40__NPKPassAssociatedInfoManager_addPass___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "uniqueID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Adding pass with uniqueID:%@ to:%@", (uint8_t *)&v8, 0x16u);

    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "_internalQueue_regenerateAssociatedInfoModelForPass:inModelsByID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
}

- (NSSet)passes
{
  id v3;
  NSObject *internalQueue;
  id v5;
  void *v6;
  NSSet *v7;
  _QWORD v9[5];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __38__NPKPassAssociatedInfoManager_passes__block_invoke;
  v9[3] = &unk_24CFE7E40;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(internalQueue, v9);
  v6 = v10;
  v7 = (NSSet *)v5;

  return v7;
}

void __38__NPKPassAssociatedInfoManager_passes__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __38__NPKPassAssociatedInfoManager_passes__block_invoke_2;
  v3[3] = &unk_24CFEC840;
  v4 = v1;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void __38__NPKPassAssociatedInfoManager_passes__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "pass");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

- (void)removePassWithUniqueID:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__NPKPassAssociatedInfoManager_removePassWithUniqueID___block_invoke;
  v7[3] = &unk_24CFE7E40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __55__NPKPassAssociatedInfoManager_removePassWithUniqueID___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_internalQueue_removePassWithUniqueIDs:", v2);

}

- (void)_internalQueue_removePassWithUniqueIDs:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __71__NPKPassAssociatedInfoManager__internalQueue_removePassWithUniqueIDs___block_invoke;
  v3[3] = &unk_24CFEBC28;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

void __71__NPKPassAssociatedInfoManager__internalQueue_removePassWithUniqueIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t, _BYTE *);
  void *v14;
  id v15;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Removing model for pass with unique ID %@", (uint8_t *)&buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", 0, v3);
  v7 = *(_QWORD **)(a1 + 32);
  if (v7[9])
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__21;
    v20 = __Block_byref_object_dispose__21;
    v21 = 0;
    objc_msgSend(v7, "passUniqueIDsByAccountIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __71__NPKPassAssociatedInfoManager__internalQueue_removePassWithUniqueIDs___block_invoke_48;
    v14 = &unk_24CFEC868;
    v15 = v3;
    p_buf = &buf;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v11);

    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "passUniqueIDsByAccountIdentifier", v11, v12, v13, v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));

    }
    _Block_object_dispose(&buf, 8);

    v7 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v7, "precursorPassManager", v11, v12, v13, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidateUpgradeControllerForPassWithUniqueID:", v3);

}

void __71__NPKPassAssociatedInfoManager__internalQueue_removePassWithUniqueIDs___block_invoke_48(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", a3))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)setPendingAmount:(id)a3 forBalanceField:(id)a4 passWithUniqueID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  NPKPassAssociatedInfoManager *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __82__NPKPassAssociatedInfoManager_setPendingAmount_forBalanceField_passWithUniqueID___block_invoke;
  v15[3] = &unk_24CFE8D78;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v19 = self;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(internalQueue, v15);

}

void __82__NPKPassAssociatedInfoManager_setPendingAmount_forBalanceField_passWithUniqueID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v11 = 138412802;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: setPendingAmount:%@ forBalanceField:%@ passWithUniqueID:%@", (uint8_t *)&v11, 0x20u);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x24BE6EBD8];
    objc_msgSend(*(id *)(a1 + 32), "amount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "npkHandleTransitValuePendingAmount:forBalanceField:passWithUniqueID:", v10, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

    objc_msgSend(v8, "updateItemFields");
    objc_msgSend(*(id *)(a1 + 56), "_notifyObserversOfUpdatedTransitPassInfoForModel:", v8);
    notify_post((const char *)objc_msgSend(CFSTR("com.apple.nanopasskit.transitpassinformationmanager.pendingaddvalueupdated"), "UTF8String"));
  }

}

- (void)setPendingExpirationDate:(id)a3 forCommutePlanField:(id)a4 passWithUniqueID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  NPKPassAssociatedInfoManager *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __94__NPKPassAssociatedInfoManager_setPendingExpirationDate_forCommutePlanField_passWithUniqueID___block_invoke;
  v15[3] = &unk_24CFE8D78;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v19 = self;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(internalQueue, v15);

}

void __94__NPKPassAssociatedInfoManager_setPendingExpirationDate_forCommutePlanField_passWithUniqueID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: setExpirationDate:%@ forCommutePlanField:%@ passWithUniqueID:%@", (uint8_t *)&v9, 0x20u);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BE6EBD8], "npkHandleTransitValuePendingExpiryDate:forCommutePlanField:passWithUniqueID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(v8, "updateItemFields");
    objc_msgSend(*(id *)(a1 + 56), "_notifyObserversOfUpdatedTransitPassInfoForModel:", v8);
    notify_post((const char *)objc_msgSend(CFSTR("com.apple.nanopasskit.transitpassinformationmanager.pendingaddvalueupdated"), "UTF8String"));
  }

}

- (void)refreshAllPasses
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *internalQueue;
  _QWORD block[5];
  uint8_t buf[16];

  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Requested refresh all pass Balance", buf, 2u);
    }

  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__NPKPassAssociatedInfoManager_refreshAllPasses__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __48__NPKPassAssociatedInfoManager_refreshAllPasses__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__NPKPassAssociatedInfoManager_refreshAllPasses__block_invoke_2;
  v4[3] = &unk_24CFEC840;
  v4[4] = v1;
  return objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);
}

void __48__NPKPassAssociatedInfoManager_refreshAllPasses__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pk_General_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Updating refresh balance for with uniqueID:%@", (uint8_t *)&v12, 0xCu);
    }

  }
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v6, "pass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_fetchMostRecentInfoForPass:", v11);

}

- (void)refreshInfoForPass:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *internalQueue;
  id v11;
  _QWORD v12[4];
  id v13;
  NPKPassAssociatedInfoManager *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "uniqueID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Requested refresh for pass with uniqueID %@", buf, 0xCu);

    }
  }
  objc_msgSend(v4, "paymentPass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __51__NPKPassAssociatedInfoManager_refreshInfoForPass___block_invoke;
  v12[3] = &unk_24CFE7E40;
  v13 = v9;
  v14 = self;
  v11 = v9;
  dispatch_async(internalQueue, v12);

}

uint64_t __51__NPKPassAssociatedInfoManager_refreshInfoForPass___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(result + 40), "_fetchMostRecentInfoForPass:");
  return result;
}

- (id)passInfoForPassWithUniqueID:(id)a3
{
  id v4;
  void *v5;
  NSObject *internalQueue;
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
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__21;
    v16 = __Block_byref_object_dispose__21;
    v17 = 0;
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__NPKPassAssociatedInfoManager_passInfoForPassWithUniqueID___block_invoke;
    block[3] = &unk_24CFEB0F8;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(internalQueue, block);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __60__NPKPassAssociatedInfoManager_passInfoForPassWithUniqueID___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NPKPassAssociatedInfo *v16;
  id v17;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", a1[5]);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v16 = [NPKPassAssociatedInfo alloc];
    objc_msgSend(v17, "transitPassProperties");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "transitAppletState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "balanceFields");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "commutePlanFields");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tiles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v17, "rangingSuspensionReason");
    objc_msgSend(v17, "accessories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v17, "isHomeAccessRestricted");
    objc_msgSend(v17, "precursorPassDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v15) = objc_msgSend(v17, "hasDeviceBoundCommutePlans");
    LOBYTE(v14) = v9;
    v11 = -[NPKPassAssociatedInfo initWithTransitProperties:appletState:balanceFields:commutePlanFields:tiles:rangingSuspensionReason:accessories:isHomeAccessRestricted:precursorPassDescription:hasDeviceBoundCommutePlans:](v16, "initWithTransitProperties:appletState:balanceFields:commutePlanFields:tiles:rangingSuspensionReason:accessories:isHomeAccessRestricted:precursorPassDescription:hasDeviceBoundCommutePlans:", v2, v3, v4, v5, v6, v7, v8, v14, v10, v15);
    v12 = *(_QWORD *)(a1[6] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
}

- (void)fetchHomeAccessoryForPass:(id)a3 withReaderIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  NPKPassAssociatedInfoManager *v20;
  id v21;
  id v22;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  pk_General_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_General_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Creating home manager for initial fetch of accessory.", buf, 2u);
    }

  }
  dispatch_get_global_queue(25, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __90__NPKPassAssociatedInfoManager_fetchHomeAccessoryForPass_withReaderIdentifier_completion___block_invoke;
  v18[3] = &unk_24CFE86A0;
  v19 = v9;
  v20 = self;
  v21 = v8;
  v22 = v10;
  v15 = v10;
  v16 = v8;
  v17 = v9;
  dispatch_async(v14, v18);

}

void __90__NPKPassAssociatedInfoManager_fetchHomeAccessoryForPass_withReaderIdentifier_completion___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  uint8_t buf[16];

  v2 = objc_alloc_init(MEMORY[0x24BE6EB38]);
  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Finished creating home manager. Now fetching lock for reader.", buf, 2u);
    }

  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __90__NPKPassAssociatedInfoManager_fetchHomeAccessoryForPass_withReaderIdentifier_completion___block_invoke_54;
  v7[3] = &unk_24CFEC890;
  v6 = *(_QWORD *)(a1 + 32);
  v7[4] = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v2, "fetchLockAccessoryWithTerminalReaderIdentifier:withCompletion:", v6, v7);

}

void __90__NPKPassAssociatedInfoManager_fetchHomeAccessoryForPass_withReaderIdentifier_completion___block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Found lock: %@", buf, 0xCu);
    }

  }
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_updateModelWithAccessory:forPassID:withReaderID:", v3, v8, *(_QWORD *)(a1 + 48));

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __90__NPKPassAssociatedInfoManager_fetchHomeAccessoryForPass_withReaderIdentifier_completion___block_invoke_55;
  v11[3] = &unk_24CFE9188;
  v9 = *(id *)(a1 + 56);
  v12 = v3;
  v13 = v9;
  v10 = v3;
  NPKGuaranteeMainThread(v11);

}

uint64_t __90__NPKPassAssociatedInfoManager_fetchHomeAccessoryForPass_withReaderIdentifier_completion___block_invoke_55(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)_updateModelWithAccessory:(id)a3 forPassID:(id)a4 withReaderID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __81__NPKPassAssociatedInfoManager__updateModelWithAccessory_forPassID_withReaderID___block_invoke;
  v14[3] = &unk_24CFEC8B8;
  v15 = v8;
  v16 = v10;
  v17 = v9;
  v11 = v9;
  v12 = v10;
  v13 = v8;
  -[NPKPassAssociatedInfoManager _updatePassInfoManagerForPassUniqueID:updateBlock:](self, "_updatePassInfoManagerForPassUniqueID:updateBlock:", v11, v14);

}

BOOL __81__NPKPassAssociatedInfoManager__updateModelWithAccessory_forPassID_withReaderID___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessories");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc(MEMORY[0x24BDBCED8]);
    v7 = v6;
    if (v5)
    {
      objc_msgSend(v4, "accessories");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "initWithDictionary:", v8);

    }
    else
    {
      v9 = objc_msgSend(v6, "initWithCapacity:", 1);
    }
    v13 = a1[4];
    if (v13)
      -[NSObject setObject:forKey:](v9, "setObject:forKey:", v13, a1[5]);
    else
      -[NSObject removeObjectForKey:](v9, "removeObjectForKey:", a1[5]);
    objc_msgSend(v4, "setAccessories:", v9);
LABEL_12:

    goto LABEL_13;
  }
  pk_General_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = a1[6];
      v15 = 138412290;
      v16 = v12;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Warning: No existing model found for pass with ID %@", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_12;
  }
LABEL_13:

  return v4 != 0;
}

- (id)homeAccessoryForPass:(id)a3 withReaderIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassAssociatedInfoManager passInfoForPassWithUniqueID:](self, "passInfoForPassWithUniqueID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "accessories");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
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
          v16 = 138412290;
          v17 = v11;
          _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Found existing accessory %@", (uint8_t *)&v16, 0xCu);
        }

      }
      -[NPKPassAssociatedInfoManager fetchHomeAccessoryForPass:withReaderIdentifier:completion:](self, "fetchHomeAccessoryForPass:withReaderIdentifier:completion:", v6, v7, &__block_literal_global_58);
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __74__NPKPassAssociatedInfoManager_homeAccessoryForPass_withReaderIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v2;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: updated accessory %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)_fetchHomeAccessStatusForPass:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  NPKPassAssociatedInfoManager *v9;

  v4 = a3;
  dispatch_get_global_queue(21, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__NPKPassAssociatedInfoManager__fetchHomeAccessStatusForPass___block_invoke;
  v7[3] = &unk_24CFE7E40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __62__NPKPassAssociatedInfoManager__fetchHomeAccessStatusForPass___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;

  v2 = objc_alloc_init(MEMORY[0x24BE6EB38]);
  objc_msgSend(*(id *)(a1 + 32), "serialNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__NPKPassAssociatedInfoManager__fetchHomeAccessStatusForPass___block_invoke_2;
  v6[3] = &unk_24CFE8FD0;
  v5 = *(int8x16_t *)(a1 + 32);
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  objc_msgSend(v2, "isHomeAccessRestrictedForPassSerialNumber:withCompletion:", v3, v6);

}

void __62__NPKPassAssociatedInfoManager__fetchHomeAccessStatusForPass___block_invoke_2(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  char v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__NPKPassAssociatedInfoManager__fetchHomeAccessStatusForPass___block_invoke_3;
  v5[3] = &__block_descriptor_33_e36_B16__0__NPKPassAssociatedInfoModel_8l;
  v6 = a2;
  objc_msgSend(v3, "_updatePassInfoManagerForPassUniqueID:updateBlock:", v4, v5);

}

uint64_t __62__NPKPassAssociatedInfoManager__fetchHomeAccessStatusForPass___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3 && *(unsigned __int8 *)(a1 + 32) != objc_msgSend(v3, "isHomeAccessRestricted"))
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      pk_General_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromBOOL();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v9;
        _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Access status fetched. Is restricted: %@", (uint8_t *)&v11, 0xCu);

      }
    }
    objc_msgSend(v4, "setIsHomeAccessRestricted:", *(unsigned __int8 *)(a1 + 32));
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isHomeAccessRestrictedForPass:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassAssociatedInfoManager passInfoForPassWithUniqueID:](self, "passInfoForPassWithUniqueID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isHomeAccessRestricted");
  return (char)v4;
}

- (BOOL)canPerformRKEActionsForPassWithUniqueID:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__NPKPassAssociatedInfoManager_canPerformRKEActionsForPassWithUniqueID___block_invoke;
  block[3] = &unk_24CFEB0F8;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

void __72__NPKPassAssociatedInfoManager_canPerformRKEActionsForPassWithUniqueID___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v2, "tiles", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "state");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "action");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "type");

        if (v10 == 4)
        {
          *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

- (unint64_t)rangingSuspensionReasonForPassWithUniqueID:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  unint64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__NPKPassAssociatedInfoManager_rangingSuspensionReasonForPassWithUniqueID___block_invoke;
  block[3] = &unk_24CFEB0F8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __75__NPKPassAssociatedInfoManager_rangingSuspensionReasonForPassWithUniqueID___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v2, "rangingSuspensionReason");

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v7;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: didReceiveBalanceUpdate %@ for pass uniqueID %@", buf, 0x16u);
    }

  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __88__NPKPassAssociatedInfoManager_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
  v13[3] = &unk_24CFEC940;
  v14 = v7;
  v15 = v6;
  v11 = v6;
  v12 = v7;
  -[NPKPassAssociatedInfoManager _updatePassInfoManagerForPassUniqueID:updateBlock:](self, "_updatePassInfoManagerForPassUniqueID:updateBlock:", v11, v13);

}

uint64_t __88__NPKPassAssociatedInfoManager_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "balances");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = NPKIsEqual(v4, *(void **)(a1 + 32));

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "pass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "npkIsAddValuePending");

    if (!v7)
    {
      v12 = 0;
      goto LABEL_11;
    }
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 40);
        v14 = 138412290;
        v15 = v11;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: pass with uniqueID:%@ has add value pending", (uint8_t *)&v14, 0xCu);
      }

    }
    objc_msgSend(v3, "updateItemFields");
  }
  else
  {
    objc_msgSend(v3, "setBalances:", *(_QWORD *)(a1 + 32));
  }
  v12 = 1;
LABEL_11:

  return v12;
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v7;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: didReceivePlanUpdate %@ for pass uniqueID %@", buf, 0x16u);
    }

  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __85__NPKPassAssociatedInfoManager_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke;
  v13[3] = &unk_24CFEC940;
  v14 = v7;
  v15 = v6;
  v11 = v6;
  v12 = v7;
  -[NPKPassAssociatedInfoManager _updatePassInfoManagerForPassUniqueID:updateBlock:](self, "_updatePassInfoManagerForPassUniqueID:updateBlock:", v11, v13);

}

uint64_t __85__NPKPassAssociatedInfoManager_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "dynamicPlans");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = NPKIsEqual(v4, *(void **)(a1 + 32));

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "pass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "npkIsAddValuePending");

    if (!v7)
    {
      v12 = 0;
      goto LABEL_11;
    }
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 40);
        v14 = 138412290;
        v15 = v11;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: pass with uniqueID:%@ has add value pending", (uint8_t *)&v14, 0xCu);
      }

    }
    objc_msgSend(v3, "updateItemFields");
  }
  else
  {
    objc_msgSend(v3, "setDynamicPlans:", *(_QWORD *)(a1 + 32));
  }
  v12 = 1;
LABEL_11:

  return v12;
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v7;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: didUpdateWithTransitPassProperties:%@ for pass uniqueID:%@", buf, 0x16u);
    }

  }
  -[NSMutableDictionary objectForKey:](self->_passAssociatedInfoModelsByPassUniqueID, "objectForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "paymentPass");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[NPKPassAssociatedInfoManager _fetchMostRecentTransitPropertiesAndAppletStateForPass:](self, "_fetchMostRecentTransitPropertiesAndAppletStateForPass:", v13);
  }
  else
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __99__NPKPassAssociatedInfoManager_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
    v14[3] = &unk_24CFEC940;
    v15 = v7;
    v16 = v6;
    -[NPKPassAssociatedInfoManager _updatePassInfoManagerForPassUniqueID:updateBlock:](self, "_updatePassInfoManagerForPassUniqueID:updateBlock:", v16, v14);

  }
}

uint64_t __99__NPKPassAssociatedInfoManager_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "transitPassProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = NPKIsEqual(v4, *(void **)(a1 + 32));

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "pass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "npkIsAddValuePending");

    if (!v7)
    {
      v12 = 0;
      goto LABEL_11;
    }
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 40);
        v14 = 138412290;
        v15 = v11;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: pass with uniqueID:%@ has add value pending", (uint8_t *)&v14, 0xCu);
      }

    }
    objc_msgSend(v3, "updateItemFields");
  }
  else
  {
    objc_msgSend(v3, "setTransitPassProperties:", *(_QWORD *)(a1 + 32));
  }
  v12 = 1;
LABEL_11:

  return v12;
}

- (void)passWithUniqueIdentifier:(id)a3 didUpdateTiles:(id)a4 forContext:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  pk_General_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_General_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v17 = v9;
      v18 = 2112;
      v19 = v8;
      v20 = 2048;
      v21 = a5;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: didUpdateTiles %@ for pass uniqueID %@ for context %ld", buf, 0x20u);
    }

  }
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __83__NPKPassAssociatedInfoManager_passWithUniqueIdentifier_didUpdateTiles_forContext___block_invoke;
  v14[3] = &unk_24CFEC968;
  v15 = v9;
  v13 = v9;
  -[NPKPassAssociatedInfoManager _updatePassInfoManagerForPassUniqueID:updateBlock:](self, "_updatePassInfoManagerForPassUniqueID:updateBlock:", v8, v14);

}

uint64_t __83__NPKPassAssociatedInfoManager_passWithUniqueIdentifier_didUpdateTiles_forContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;

  v3 = a2;
  objc_msgSend(v3, "tiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = NPKIsEqual(v4, *(void **)(a1 + 32));

  if ((v5 & 1) == 0)
    objc_msgSend(v3, "setTiles:", *(_QWORD *)(a1 + 32));

  return v5 ^ 1u;
}

- (void)credential:(id)a3 forPaymentApplication:(id)a4 didUpdateRangingSuspensionReasons:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  NSObject *internalQueue;
  id v13;
  _QWORD block[5];
  id v15;
  unint64_t v16;
  uint8_t buf[4];
  unint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v18 = a5;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: didUpdateRangingSuspensionReasons (%lu) for pass with subcredential identifier %@", buf, 0x16u);

    }
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __99__NPKPassAssociatedInfoManager_credential_forPaymentApplication_didUpdateRangingSuspensionReasons___block_invoke;
  block[3] = &unk_24CFE83A8;
  block[4] = self;
  v15 = v7;
  v16 = a5;
  v13 = v7;
  dispatch_async(internalQueue, block);

}

void __99__NPKPassAssociatedInfoManager_credential_forPaymentApplication_didUpdateRangingSuspensionReasons___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__21;
  v15 = __Block_byref_object_dispose__21;
  v16 = 0;
  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 24);
  v8[2] = __99__NPKPassAssociatedInfoManager_credential_forPaymentApplication_didUpdateRangingSuspensionReasons___block_invoke_2;
  v8[3] = &unk_24CFEC990;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v9 = v2;
  v10 = &v11;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v8);
  v5 = (void *)a1[4];
  v6 = v12[5];
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __99__NPKPassAssociatedInfoManager_credential_forPaymentApplication_didUpdateRangingSuspensionReasons___block_invoke_3;
  v7[3] = &__block_descriptor_40_e36_B16__0__NPKPassAssociatedInfoModel_8l;
  v7[4] = a1[6];
  objc_msgSend(v5, "_updatePassInfoManagerForPassUniqueID:updateBlock:", v6, v7);

  _Block_object_dispose(&v11, 8);
}

void __99__NPKPassAssociatedInfoManager_credential_forPaymentApplication_didUpdateRangingSuspensionReasons___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  objc_msgSend(a3, "pass");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "devicePrimaryContactlessPaymentApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subcredentials");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if (v11)
  {
    objc_msgSend(v15, "uniqueID");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    *a4 = 1;
  }

}

BOOL __99__NPKPassAssociatedInfoManager_credential_forPaymentApplication_didUpdateRangingSuspensionReasons___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  v4 = objc_msgSend(v3, "rangingSuspensionReason");
  v5 = *(_QWORD *)(a1 + 32);
  if (v4 != v5)
    objc_msgSend(v3, "setRangingSuspensionReason:", v5);

  return v4 != v5;
}

- (void)paymentServiceReceivedInterruption
{
  self->_paymentServiceWasInterrupted = 1;
}

- (void)paymentServiceEstablishedConnection
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint8_t v6[16];

  if (self->_paymentServiceWasInterrupted)
  {
    self->_paymentServiceWasInterrupted = 0;
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Refreshing all associated pass info following re-establishment of connection", v6, 2u);
      }

    }
    -[NPKPassAssociatedInfoManager refreshAllPasses](self, "refreshAllPasses");
  }
}

- (void)accountChanged:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "accountIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: received accountChanged for account with identifier %@", (uint8_t *)&v9, 0xCu);

    }
  }
  -[NPKPassAssociatedInfoManager _handleReceivedAccountUpdateWithAccount:](self, "_handleReceivedAccountUpdateWithAccount:", v4);

}

- (void)precursorPassRequestsManager:(id)a3 didUpdateUpgradePrequestDescription:(id)a4 forPassUniqueID:(id)a5
{
  id v7;
  id v8;
  NSObject *internalQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __113__NPKPassAssociatedInfoManager_precursorPassRequestsManager_didUpdateUpgradePrequestDescription_forPassUniqueID___block_invoke;
  block[3] = &unk_24CFE8288;
  block[4] = self;
  v13 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(internalQueue, block);

}

void __113__NPKPassAssociatedInfoManager_precursorPassRequestsManager_didUpdateUpgradePrequestDescription_forPassUniqueID___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __113__NPKPassAssociatedInfoManager_precursorPassRequestsManager_didUpdateUpgradePrequestDescription_forPassUniqueID___block_invoke_2;
  v3[3] = &unk_24CFEC968;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_updatePassInfoManagerForPassUniqueID:updateBlock:", v2, v3);

}

uint64_t __113__NPKPassAssociatedInfoManager_precursorPassRequestsManager_didUpdateUpgradePrequestDescription_forPassUniqueID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;

  v3 = a2;
  objc_msgSend(v3, "precursorPassDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = NPKIsEqual(v4, *(void **)(a1 + 32));

  if ((v5 & 1) == 0)
    objc_msgSend(v3, "setPrecursorPassDescription:", *(_QWORD *)(a1 + 32));

  return v5 ^ 1u;
}

- (id)_transitPassBalanceModelWithPass:(id)a3 currentModel:(id)a4
{
  id v6;
  id v7;
  NPKPassAssociatedInfoModel *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v8 = -[NPKPassAssociatedInfoModel initWithPass:]([NPKPassAssociatedInfoModel alloc], "initWithPass:", v6);
  objc_msgSend(v7, "balances");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassAssociatedInfoModel setBalances:](v8, "setBalances:", v9);

  objc_msgSend(v7, "transitPassProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[NPKPassAssociatedInfoModel setTransitPassProperties:](v8, "setTransitPassProperties:", v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6EF50], "passPropertiesForPass:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassAssociatedInfoModel setTransitPassProperties:](v8, "setTransitPassProperties:", v11);

  }
  objc_msgSend(v7, "transitAppletState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassAssociatedInfoModel setTransitAppletState:](v8, "setTransitAppletState:", v12);

  objc_msgSend(v7, "tiles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassAssociatedInfoModel setTiles:](v8, "setTiles:", v13);

  -[NPKPassAssociatedInfoModel setRangingSuspensionReason:](v8, "setRangingSuspensionReason:", objc_msgSend(v7, "rangingSuspensionReason"));
  objc_msgSend(v7, "accessories");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassAssociatedInfoModel setAccessories:](v8, "setAccessories:", v14);

  return v8;
}

- (void)_fetchMostRecentInfoForPass:(id)a3
{
  id v4;

  v4 = a3;
  -[NPKPassAssociatedInfoManager _fetchMostRecentBalancesForPass:](self, "_fetchMostRecentBalancesForPass:", v4);
  if (NPKIsTruthOnCardTransitPass(v4))
  {
    -[NPKPassAssociatedInfoManager _fetchMostRecentTransitPropertiesAndAppletStateForPass:](self, "_fetchMostRecentTransitPropertiesAndAppletStateForPass:", v4);
    -[NPKPassAssociatedInfoManager _fetchMostRecentCommutePlansForPass:](self, "_fetchMostRecentCommutePlansForPass:", v4);
  }
  if (objc_msgSend(v4, "isAccessPass"))
    -[NPKPassAssociatedInfoManager _fetchMostRecentTilesForPass:](self, "_fetchMostRecentTilesForPass:", v4);
  if (objc_msgSend(v4, "npkSupportsBluetooth"))
    -[NPKPassAssociatedInfoManager _fetchMostRecentRangingSuspensionReasonForPass:](self, "_fetchMostRecentRangingSuspensionReasonForPass:", v4);
  if (objc_msgSend(v4, "isHomeKeyPass"))
    -[NPKPassAssociatedInfoManager _fetchHomeAccessStatusForPass:](self, "_fetchHomeAccessStatusForPass:", v4);
  if (objc_msgSend(v4, "npkIsPrecursorPass"))
    -[NPKPassAssociatedInfoManager _fetchPrecursorPassDescriptionForPass:](self, "_fetchPrecursorPassDescriptionForPass:", v4);

}

- (void)_loadPassContentIfNeeded:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isContentLoaded") & 1) == 0)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __57__NPKPassAssociatedInfoManager__loadPassContentIfNeeded___block_invoke;
    v5[3] = &unk_24CFE7E40;
    v5[4] = self;
    v6 = v4;
    objc_msgSend(v6, "loadContentAsyncWithCompletion:", v5);

  }
}

void __57__NPKPassAssociatedInfoManager__loadPassContentIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 8);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__NPKPassAssociatedInfoManager__loadPassContentIfNeeded___block_invoke_2;
  v4[3] = &unk_24CFE7E40;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

void __57__NPKPassAssociatedInfoManager__loadPassContentIfNeeded___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_transitPassBalanceModelWithPass:currentModel:", *(_QWORD *)(a1 + 40), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((NPKIsEqual(v4, v5) & 1) == 0)
    {
      pk_General_log();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

      if (v7)
      {
        pk_General_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v11 = 138412546;
          v12 = v4;
          v13 = 2112;
          v14 = v5;
          _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: transit pass model did change from:%@ to:%@", (uint8_t *)&v11, 0x16u);
        }

      }
      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
      objc_msgSend(*(id *)(a1 + 40), "uniqueID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, v10);

      objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfUpdatedTransitPassInfoForModel:", v5);
    }

  }
}

- (void)_fetchMostRecentBalancesForPass:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  NPKPassAssociatedInfoManager *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[NPKPassAssociatedInfoManager _isPassWithAccountBalanceForPass:](self, "_isPassWithAccountBalanceForPass:", v4))
  {
    -[NPKPassAssociatedInfoManager _fetchMostRecentAccountBalanceForPass:](self, "_fetchMostRecentAccountBalanceForPass:", v4);
  }
  else
  {
    objc_msgSend(v4, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      pk_General_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v5;
        _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Requested fetch most recent balances for pass with unique ID %@", buf, 0xCu);
      }

    }
    -[NPKPassAssociatedInfoManager paymentService](self, "paymentService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __64__NPKPassAssociatedInfoManager__fetchMostRecentBalancesForPass___block_invoke;
    v10[3] = &unk_24CFEAB88;
    v11 = v5;
    v12 = self;
    v4 = v5;
    objc_msgSend(v9, "balancesForPaymentPassWithUniqueIdentifier:completion:", v4, v10);

  }
}

void __64__NPKPassAssociatedInfoManager__fetchMostRecentBalancesForPass___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v15 = v3;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: received most recent balances %@ for pass with unique ID %@", buf, 0x16u);
    }

  }
  v10 = a1 + 32;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v10 + 8);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __64__NPKPassAssociatedInfoManager__fetchMostRecentBalancesForPass___block_invoke_63;
  v12[3] = &unk_24CFEC968;
  v13 = v3;
  v11 = v3;
  objc_msgSend(v9, "_updatePassInfoManagerForPassUniqueID:updateBlock:", v8, v12);

}

uint64_t __64__NPKPassAssociatedInfoManager__fetchMostRecentBalancesForPass___block_invoke_63(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;

  v3 = a2;
  objc_msgSend(v3, "balances");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = NPKIsEqual(v4, *(void **)(a1 + 32));

  if ((v5 & 1) == 0)
    objc_msgSend(v3, "setBalances:", *(_QWORD *)(a1 + 32));

  return v5 ^ 1u;
}

- (void)_fetchMostRecentCommutePlansForPass:(id)a3
{
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  NPKPassAssociatedInfoManager *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Requested fetch most recent commute plans for pass with unique ID %@", buf, 0xCu);
    }

  }
  -[NPKPassAssociatedInfoManager paymentService](self, "paymentService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__NPKPassAssociatedInfoManager__fetchMostRecentCommutePlansForPass___block_invoke;
  v10[3] = &unk_24CFEC9D8;
  v11 = v4;
  v12 = self;
  v9 = v4;
  objc_msgSend(v8, "plansForPaymentPassWithUniqueIdentifier:completion:", v9, v10);

}

void __68__NPKPassAssociatedInfoManager__fetchMostRecentCommutePlansForPass___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v15 = v3;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: received most recent commute plans %@ for pass with unique ID %@", buf, 0x16u);
    }

  }
  v10 = a1 + 32;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v10 + 8);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68__NPKPassAssociatedInfoManager__fetchMostRecentCommutePlansForPass___block_invoke_65;
  v12[3] = &unk_24CFEC968;
  v13 = v3;
  v11 = v3;
  objc_msgSend(v9, "_updatePassInfoManagerForPassUniqueID:updateBlock:", v8, v12);

}

uint64_t __68__NPKPassAssociatedInfoManager__fetchMostRecentCommutePlansForPass___block_invoke_65(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "commutePlanFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDynamicPlans:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "commutePlanFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = NPKIsEqual(v5, v4) ^ 1;
  return v6;
}

- (BOOL)_isPassWithAccountBalanceForPass:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "associatedAccountFeatureIdentifier");
  return v3 > 5 || (v3 & 0x3F) == 4;
}

- (void)_fetchMostRecentAccountBalanceForPass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9[2];
  id location;

  v4 = a3;
  if (-[NPKPassAssociatedInfoManager _isPassWithAccountBalanceForPass:](self, "_isPassWithAccountBalanceForPass:", v4))
  {
    objc_initWeak(&location, self);
    v5 = (void *)objc_msgSend(v4, "associatedAccountFeatureIdentifier");
    -[NPKPassAssociatedInfoManager accountService](self, "accountService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __70__NPKPassAssociatedInfoManager__fetchMostRecentAccountBalanceForPass___block_invoke;
    v7[3] = &unk_24CFECA00;
    objc_copyWeak(v9, &location);
    v9[1] = v5;
    v8 = v4;
    objc_msgSend(v6, "defaultAccountForFeature:completion:", v5, v7);

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }

}

void __70__NPKPassAssociatedInfoManager__fetchMostRecentAccountBalanceForPass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;
  id v14;
  NSObject **v15;
  id v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[1];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__NPKPassAssociatedInfoManager__fetchMostRecentAccountBalanceForPass___block_invoke_2;
    block[3] = &unk_24CFE7E18;
    v10 = v5;
    v11 = *(_QWORD *)(a1 + 48);
    v13 = v10;
    v17 = v11;
    v14 = v6;
    v15 = v8;
    v16 = *(id *)(a1 + 32);
    dispatch_async(v9, block);

  }
}

void __70__NPKPassAssociatedInfoManager__fetchMostRecentAccountBalanceForPass___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 32);
      if (v5)
        v6 = &stru_24CFF06D8;
      else
        v6 = CFSTR("not ");
      objc_msgSend(v5, "accountIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKFeatureIdentifierToString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v13 = 138413058;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Did %@receive account with identifier %@ for feature identifier %@. Error?: %@", (uint8_t *)&v13, 0x2Au);

    }
  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 48), "passUniqueIDsByAccountIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "uniqueID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "accountIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v11, v12);

    objc_msgSend(*(id *)(a1 + 48), "_internalQueue_processReceivedAccountUpdateWithAccount:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 48), "_refreshAccountBalanceIfApplicableForPass:withAccount:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
  }
}

- (void)_refreshAccountBalanceIfApplicableForPass:(id)a3 withAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  _BOOL4 v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastUpdated");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v9);
    v11 = v10 > 300.0;

  }
  else
  {
    v11 = 0;
  }
  pk_General_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    pk_General_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (v11)
        v15 = &stru_24CFF06D8;
      else
        v15 = CFSTR("not ");
      objc_msgSend(v7, "accountIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "associatedAccountFeatureIdentifier");
      PKFeatureIdentifierToString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v24 = v15;
      v25 = 2112;
      v26 = v16;
      v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Will %@request refreshed account with identifier %@ for feature identifier %@.", buf, 0x20u);

    }
  }
  if (v11)
  {
    objc_initWeak((id *)buf, self);
    objc_msgSend(MEMORY[0x24BE6E970], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __86__NPKPassAssociatedInfoManager__refreshAccountBalanceIfApplicableForPass_withAccount___block_invoke;
    v20[3] = &unk_24CFECA28;
    objc_copyWeak(&v22, (id *)buf);
    v21 = v6;
    objc_msgSend(v18, "updateAccountWithIdentifier:extended:completion:", v19, 0, v20);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }

}

void __86__NPKPassAssociatedInfoManager__refreshAccountBalanceIfApplicableForPass_withAccount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  NSObject **v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[1];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __86__NPKPassAssociatedInfoManager__refreshAccountBalanceIfApplicableForPass_withAccount___block_invoke_2;
    v10[3] = &unk_24CFE8D78;
    v11 = v5;
    v12 = *(id *)(a1 + 32);
    v13 = v6;
    v14 = v8;
    dispatch_async(v9, v10);

  }
}

void __86__NPKPassAssociatedInfoManager__refreshAccountBalanceIfApplicableForPass_withAccount___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "accountIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "associatedAccountFeatureIdentifier");
      PKFeatureIdentifierToString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 48);
      v11 = 138412802;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: received refreshed account with identifier %@ for feature identifier %@. Error?: %@", (uint8_t *)&v11, 0x20u);

    }
  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 56), "passUniqueIDsByAccountIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "accountIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, v10);

    objc_msgSend(*(id *)(a1 + 56), "_internalQueue_processReceivedAccountUpdateWithAccount:", *(_QWORD *)(a1 + 32));
  }
}

- (void)_handleReceivedAccountUpdateWithAccount:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__NPKPassAssociatedInfoManager__handleReceivedAccountUpdateWithAccount___block_invoke;
  v7[3] = &unk_24CFE7E40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __72__NPKPassAssociatedInfoManager__handleReceivedAccountUpdateWithAccount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_processReceivedAccountUpdateWithAccount:", *(_QWORD *)(a1 + 40));
}

- (void)_internalQueue_processReceivedAccountUpdateWithAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_passUniqueIDsByAccountIdentifier)
  {
    -[NPKPassAssociatedInfoManager passUniqueIDsByAccountIdentifier](self, "passUniqueIDsByAccountIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(v7, "length"))
  {
    -[NPKPassAssociatedInfoManager _processAccountBalancesForPassWithUniqueID:withAccount:](self, "_processAccountBalancesForPassWithUniqueID:withAccount:", v7, v4);
  }
  else
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "accountIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v11;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Not processing balances for not-tracked account with identifier %@ ", (uint8_t *)&v12, 0xCu);

      }
    }
  }

}

- (void)_processAccountBalancesForPassWithUniqueID:(id)a3 withAccount:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Processing account balances for pass with uniqueID %@ with account %@", buf, 0x16u);
    }

  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __87__NPKPassAssociatedInfoManager__processAccountBalancesForPassWithUniqueID_withAccount___block_invoke;
  v13[3] = &unk_24CFEC8B8;
  v13[4] = self;
  v14 = v7;
  v15 = v6;
  v11 = v6;
  v12 = v7;
  -[NPKPassAssociatedInfoManager _updatePassInfoManagerForPassUniqueID:updateBlock:](self, "_updatePassInfoManagerForPassUniqueID:updateBlock:", v11, v13);

}

uint64_t __87__NPKPassAssociatedInfoManager__processAccountBalancesForPassWithUniqueID_withAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldUseBalanceForAccount:", *(_QWORD *)(a1 + 40)))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "feature") == 4)
    {
      objc_msgSend((id)objc_opt_class(), "accountBalanceForAccount:", *(_QWORD *)(a1 + 40));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }

      goto LABEL_12;
    }
  }
  else
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      pk_General_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 40), "accountIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "state");
        PKAccountStateToString();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412802;
        v16 = v9;
        v17 = 2112;
        v18 = v10;
        v19 = 2112;
        v20 = v11;
        _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Not using account balance for pass with unique ID %@. Account identifier %@ state %@", (uint8_t *)&v15, 0x20u);

      }
    }
  }
  v5 = 0;
LABEL_12:
  objc_msgSend(v3, "balances");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = NPKIsEqual(v12, v5);

  if ((v13 & 1) == 0)
    objc_msgSend(v3, "setBalances:", v5);

  return v13 ^ 1u;
}

- (void)_fetchMostRecentTransitPropertiesAndAppletStateForPass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  NPKPassAssociatedInfoManager *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "devicePrimaryPaymentApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  pk_General_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "applicationIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v6;
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Requested fetch most recent transit pass properties for pass with unique ID %@ payment application %@", buf, 0x16u);

    }
  }
  -[NPKPassAssociatedInfoManager paymentService](self, "paymentService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __87__NPKPassAssociatedInfoManager__fetchMostRecentTransitPropertiesAndAppletStateForPass___block_invoke;
  v15[3] = &unk_24CFECA50;
  v16 = v5;
  v17 = v4;
  v18 = v6;
  v19 = self;
  v12 = v6;
  v13 = v4;
  v14 = v5;
  objc_msgSend(v11, "transitStateWithPassUniqueIdentifier:paymentApplication:completion:", v12, v14, v15);

}

void __87__NPKPassAssociatedInfoManager__fetchMostRecentTransitPropertiesAndAppletStateForPass___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "transitPassPropertiesWithPaymentApplication:pass:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v19 = v4;
      v20 = 2112;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Received most recent transit pass properties: %@ for pass with unique ID %@ payment application %@", buf, 0x20u);

    }
  }
  v12 = a1 + 48;
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(void **)(v12 + 8);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __87__NPKPassAssociatedInfoManager__fetchMostRecentTransitPropertiesAndAppletStateForPass___block_invoke_73;
  v15[3] = &unk_24CFEC940;
  v16 = v3;
  v17 = v4;
  v13 = v4;
  v14 = v3;
  objc_msgSend(v11, "_updatePassInfoManagerForPassUniqueID:updateBlock:", v10, v15);

}

uint64_t __87__NPKPassAssociatedInfoManager__fetchMostRecentTransitPropertiesAndAppletStateForPass___block_invoke_73(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "transitAppletState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((NPKIsEqual(v4, *(void **)(a1 + 32)) & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(v3, "transitPassProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = NPKIsEqual(v5, *(void **)(a1 + 40));

  if ((v6 & 1) == 0)
  {
LABEL_5:
    objc_msgSend(v3, "setTransitAppletState:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "setTransitPassProperties:", *(_QWORD *)(a1 + 40));
    v7 = 1;
    goto LABEL_6;
  }
  v7 = 0;
LABEL_6:

  return v7;
}

- (void)_fetchMostRecentTilesForPass:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  pk_General_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v5;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Requested fetch most recent tiles for pass with unique ID %@", buf, 0xCu);
    }

  }
  objc_initWeak((id *)buf, self);
  -[NPKPassAssociatedInfoManager paymentService](self, "paymentService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__NPKPassAssociatedInfoManager__fetchMostRecentTilesForPass___block_invoke;
  v11[3] = &unk_24CFECA78;
  objc_copyWeak(&v13, (id *)buf);
  v10 = v5;
  v12 = v10;
  objc_msgSend(v9, "tilesForPassWithUniqueIdentifier:context:completion:", v10, 1, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

void __61__NPKPassAssociatedInfoManager__fetchMostRecentTilesForPass___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v14 = v3;
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Received most recent tiles: %@ for pass with unique ID %@", buf, 0x16u);
    }

  }
  v9 = *(_QWORD *)(a1 + 32);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__NPKPassAssociatedInfoManager__fetchMostRecentTilesForPass___block_invoke_75;
  v11[3] = &unk_24CFEC968;
  v12 = v3;
  v10 = v3;
  objc_msgSend(WeakRetained, "_updatePassInfoManagerForPassUniqueID:updateBlock:", v9, v11);

}

uint64_t __61__NPKPassAssociatedInfoManager__fetchMostRecentTilesForPass___block_invoke_75(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;

  v3 = a2;
  objc_msgSend(v3, "tiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = NPKIsEqual(v4, *(void **)(a1 + 32));

  if ((v5 & 1) == 0)
    objc_msgSend(v3, "setTiles:", *(_QWORD *)(a1 + 32));

  return v5 ^ 1u;
}

- (void)_fetchMostRecentRangingSuspensionReasonForPass:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  pk_General_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v5;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Requested fetch most recent secure ranging suspension reason for pass with unique ID %@", buf, 0xCu);
    }

  }
  objc_msgSend(v4, "devicePrimaryContactlessPaymentApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subcredentials");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "anyObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKPassAssociatedInfoManager paymentService](self, "paymentService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applicationIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __79__NPKPassAssociatedInfoManager__fetchMostRecentRangingSuspensionReasonForPass___block_invoke;
  v15[3] = &unk_24CFECAA0;
  v15[4] = self;
  v16 = v5;
  v14 = v5;
  objc_msgSend(v12, "rangingSuspensionReasonForAppletSubcredential:forPaymentApplicationID:completion:", v11, v13, v15);

}

uint64_t __79__NPKPassAssociatedInfoManager__fetchMostRecentRangingSuspensionReasonForPass___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __79__NPKPassAssociatedInfoManager__fetchMostRecentRangingSuspensionReasonForPass___block_invoke_2;
  v5[3] = &__block_descriptor_40_e36_B16__0__NPKPassAssociatedInfoModel_8l;
  v5[4] = a2;
  return objc_msgSend(v3, "_updatePassInfoManagerForPassUniqueID:updateBlock:", v2, v5);
}

BOOL __79__NPKPassAssociatedInfoManager__fetchMostRecentRangingSuspensionReasonForPass___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  v4 = objc_msgSend(v3, "rangingSuspensionReason");
  v5 = *(_QWORD *)(a1 + 32);
  if (v4 != v5)
    objc_msgSend(v3, "setRangingSuspensionReason:", v5);

  return v4 != v5;
}

- (void)_fetchPrecursorPassDescriptionForPass:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NPKPassAssociatedInfoManager precursorPassManager](self, "precursorPassManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadUpgradeControllerForPass:", v4);

}

- (void)_updatePassInfoManagerForPassUniqueID:(id)a3 updateBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  NPKPassAssociatedInfoManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__NPKPassAssociatedInfoManager__updatePassInfoManagerForPassUniqueID_updateBlock___block_invoke;
  block[3] = &unk_24CFE84E8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

void __82__NPKPassAssociatedInfoManager__updatePassInfoManagerForPassUniqueID_updateBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Requested to update associated info model for pass unique ID %@", (uint8_t *)&v11, 0xCu);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
  {
    objc_msgSend(*(id *)(a1 + 40), "_notifyObserversOfUpdatedTransitPassInfoForModel:", v6);
  }
  else
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      pk_General_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v11 = 138412290;
        v12 = v10;
        _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: did not update associated info model for pass uniqueID:%@.", (uint8_t *)&v11, 0xCu);
      }

    }
  }

}

- (void)_updateAllPassesItemsFieldsPendingUpdateStatus
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id obj;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMutableDictionary allValues](self->_passAssociatedInfoModelsByPassUniqueID, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v22;
    v5 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v22 != v4)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v17 = 0;
        v18 = &v17;
        v19 = 0x2020000000;
        v20 = 0;
        objc_msgSend(v7, "balanceFields");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = v5;
        v16[1] = 3221225472;
        v16[2] = __78__NPKPassAssociatedInfoManager__updateAllPassesItemsFieldsPendingUpdateStatus__block_invoke;
        v16[3] = &unk_24CFECAC8;
        v16[4] = &v17;
        objc_msgSend(v8, "enumerateObjectsUsingBlock:", v16);

        objc_msgSend(v7, "updateItemFields");
        v12 = 0;
        v13 = &v12;
        v14 = 0x2020000000;
        v15 = 0;
        objc_msgSend(v7, "balanceFields");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = v5;
        v11[1] = 3221225472;
        v11[2] = __78__NPKPassAssociatedInfoManager__updateAllPassesItemsFieldsPendingUpdateStatus__block_invoke_2;
        v11[3] = &unk_24CFECAC8;
        v11[4] = &v12;
        objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);

        if (*((unsigned __int8 *)v18 + 24) != *((unsigned __int8 *)v13 + 24))
          -[NPKPassAssociatedInfoManager _notifyObserversOfUpdatedTransitPassInfoForModel:](self, "_notifyObserversOfUpdatedTransitPassInfoForModel:", v7);
        _Block_object_dispose(&v12, 8);
        _Block_object_dispose(&v17, 8);
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v3);
  }

}

uint64_t __78__NPKPassAssociatedInfoManager__updateAllPassesItemsFieldsPendingUpdateStatus__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "hasPendingUpdate");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __78__NPKPassAssociatedInfoManager__updateAllPassesItemsFieldsPendingUpdateStatus__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "hasPendingUpdate");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

- (void)_notifyObserversOfUpdatedTransitPassInfoForModel:(id)a3
{
  NSObject *internalQueue;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  NPKPassAssociatedInfo *v14;
  NSObject *observerQueue;
  id v16;
  NPKPassAssociatedInfo *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NPKPassAssociatedInfo *v21;
  void *v22;
  _QWORD block[5];
  NPKPassAssociatedInfo *v25;
  id v26;

  internalQueue = self->_internalQueue;
  v4 = a3;
  dispatch_assert_queue_V2(internalQueue);
  objc_msgSend(v4, "pass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = [NPKPassAssociatedInfo alloc];
  objc_msgSend(v4, "transitPassProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitAppletState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "balanceFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commutePlanFields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tiles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "rangingSuspensionReason");
  objc_msgSend(v4, "accessories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "isHomeAccessRestricted");
  objc_msgSend(v4, "precursorPassDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v4, "hasDeviceBoundCommutePlans");

  LOBYTE(v19) = (_BYTE)v5;
  LOBYTE(v18) = v12;
  v14 = -[NPKPassAssociatedInfo initWithTransitProperties:appletState:balanceFields:commutePlanFields:tiles:rangingSuspensionReason:accessories:isHomeAccessRestricted:precursorPassDescription:hasDeviceBoundCommutePlans:](v21, "initWithTransitProperties:appletState:balanceFields:commutePlanFields:tiles:rangingSuspensionReason:accessories:isHomeAccessRestricted:precursorPassDescription:hasDeviceBoundCommutePlans:", v20, v6, v7, v8, v9, v10, v11, v18, v13, v19);

  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__NPKPassAssociatedInfoManager__notifyObserversOfUpdatedTransitPassInfoForModel___block_invoke;
  block[3] = &unk_24CFE8288;
  block[4] = self;
  v25 = v14;
  v26 = v22;
  v16 = v22;
  v17 = v14;
  dispatch_async(observerQueue, block);

}

void __81__NPKPassAssociatedInfoManager__notifyObserversOfUpdatedTransitPassInfoForModel___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __81__NPKPassAssociatedInfoManager__notifyObserversOfUpdatedTransitPassInfoForModel___block_invoke_2;
  v3[3] = &unk_24CFECAF0;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_notifyObservers:", v3);

}

uint64_t __81__NPKPassAssociatedInfoManager__notifyObserversOfUpdatedTransitPassInfoForModel___block_invoke_2(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "passAssociatedInfoManager:didUpdatePassInfo:withPassUniqueID:", a1[4], a1[5], a1[6]);
}

- (void)_internalQueue_regenerateAssociatedInfoModelForPass:(id)a3 inModelsByID:(id)a4
{
  NSObject *internalQueue;
  id v7;
  id v8;
  NSMutableDictionary *passAssociatedInfoModelsByPassUniqueID;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  internalQueue = self->_internalQueue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(internalQueue);
  passAssociatedInfoModelsByPassUniqueID = self->_passAssociatedInfoModelsByPassUniqueID;
  objc_msgSend(v8, "uniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](passAssociatedInfoModelsByPassUniqueID, "objectForKeyedSubscript:", v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[NPKPassAssociatedInfoManager _transitPassBalanceModelWithPass:currentModel:](self, "_transitPassBalanceModelWithPass:currentModel:", v8, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v12);

  -[NPKPassAssociatedInfoManager _loadPassContentIfNeeded:](self, "_loadPassContentIfNeeded:", v8);
  -[NPKPassAssociatedInfoManager _fetchMostRecentInfoForPass:](self, "_fetchMostRecentInfoForPass:", v8);

  if ((NPKIsEqual(v13, v11) & 1) == 0)
    -[NPKPassAssociatedInfoManager _notifyObserversOfUpdatedTransitPassInfoForModel:](self, "_notifyObserversOfUpdatedTransitPassInfoForModel:", v11);

}

- (BOOL)_isPassEligible:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "isStoredValuePass") & 1) != 0
    || (objc_msgSend(v4, "isAccessPass") & 1) != 0
    || -[NPKPassAssociatedInfoManager _isPassWithAccountBalanceForPass:](self, "_isPassWithAccountBalanceForPass:", v4)
    || (objc_msgSend(v4, "npkIsPrecursorPass") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    v5 = 0;
    if (v8)
    {
      pk_General_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "uniqueID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v10;
        _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Pass is not eligible (non-transit, non-eMoney, non-Access, non-Apple Balance) with uniqueID:%@", (uint8_t *)&v11, 0xCu);

      }
      v5 = 0;
    }
  }

  return v5;
}

- (BOOL)_shouldUseBalanceForAccount:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  unsigned int v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "state");
    if (v5 <= 5)
      v6 = (0x23u >> v5) & 1;
    else
      LOBYTE(v6) = 0;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (NSMutableDictionary)passUniqueIDsByAccountIdentifier
{
  NSMutableDictionary *passUniqueIDsByAccountIdentifier;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  passUniqueIDsByAccountIdentifier = self->_passUniqueIDsByAccountIdentifier;
  if (!passUniqueIDsByAccountIdentifier)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v5 = self->_passUniqueIDsByAccountIdentifier;
    self->_passUniqueIDsByAccountIdentifier = v4;

    passUniqueIDsByAccountIdentifier = self->_passUniqueIDsByAccountIdentifier;
  }
  return passUniqueIDsByAccountIdentifier;
}

- (PKPaymentService)paymentService
{
  return self->_paymentService;
}

- (PKAccountService)accountService
{
  return self->_accountService;
}

- (NPKPrecursorPassUpgradeRequestsManager)precursorPassManager
{
  return self->_precursorPassManager;
}

- (BOOL)paymentServiceWasInterrupted
{
  return self->_paymentServiceWasInterrupted;
}

- (void)setPaymentServiceWasInterrupted:(BOOL)a3
{
  self->_paymentServiceWasInterrupted = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void)setPassUniqueIDsByAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_passUniqueIDsByAccountIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passUniqueIDsByAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_precursorPassManager, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_passAssociatedInfoModelsByPassUniqueID, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
