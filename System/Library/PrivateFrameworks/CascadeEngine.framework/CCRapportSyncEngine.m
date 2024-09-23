@implementation CCRapportSyncEngine

- (CCRapportSyncEngine)initWithQueue:(id)a3
{
  id v4;
  CCRapportManager *v5;
  CCRapportFileTransferManager *v6;
  void *v7;
  CCRapportSyncEngine *v8;

  v4 = a3;
  v5 = -[CCRapportManager initWithQueue:forSharedUse:]([CCRapportManager alloc], "initWithQueue:forSharedUse:", v4, 0);
  v6 = objc_alloc_init(CCRapportFileTransferManager);
  objc_msgSend(MEMORY[0x24BE15640], "defaultInstanceWithUseCase:", *MEMORY[0x24BE0C060]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CCRapportSyncEngine initWithQueue:rapportManager:rapportFileTransferManager:readAccess:donateServiceProvider:](self, "initWithQueue:rapportManager:rapportFileTransferManager:readAccess:donateServiceProvider:", v4, v5, v6, v7, 0);

  return v8;
}

- (CCRapportSyncEngine)initWithQueue:(id)a3 rapportManager:(id)a4 rapportFileTransferManager:(id)a5 readAccess:(id)a6 donateServiceProvider:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CCRapportSyncEngine *v17;
  CCRapportSyncEngine *v18;
  uint64_t v19;
  NSOperationQueue *operationQueue;
  id v22;
  objc_super v23;

  v22 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CCRapportSyncEngine;
  v17 = -[CCRapportSyncEngine init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_queue, a3);
    objc_storeStrong((id *)&v18->_rapportManager, a4);
    -[CCRapportManager setDelegate:](v18->_rapportManager, "setDelegate:", v18);
    objc_storeStrong((id *)&v18->_fileTransferSessionManager, a5);
    objc_storeStrong((id *)&v18->_readAcccess, a6);
    objc_storeStrong((id *)&v18->_donateServiceProvider, a7);
    v19 = objc_opt_new();
    operationQueue = v18->_operationQueue;
    v18->_operationQueue = (NSOperationQueue *)v19;

    -[NSOperationQueue setUnderlyingQueue:](v18->_operationQueue, "setUnderlyingQueue:", v18->_queue);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v18->_operationQueue, "setMaxConcurrentOperationCount:", 1);
  }

  return v18;
}

- (id)buildVersionedMergeableForSet:(id)a3
{
  id v4;
  CCSetVersionedMergeable *v5;
  void *v6;
  CCSetVersionedMergeable *v7;

  v4 = a3;
  v5 = [CCSetVersionedMergeable alloc];
  -[CCDataResourceReadAccess databaseReadAccessForSet:](self->_readAcccess, "databaseReadAccessForSet:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CCSetVersionedMergeable initWithSet:readAccess:donateServiceProvider:](v5, "initWithSet:readAccess:donateServiceProvider:", v4, v6, self->_donateServiceProvider);

  return v7;
}

- (id)itemTypesSupportingSync
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "addObjectsFromArray:", &unk_25098F860);
  return v2;
}

- (id)setsWithItemType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15650]), "initWithReadAccess:", self->_readAcccess);
  v22 = 0;
  objc_msgSend(v6, "allSets:", &v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v22;

  __biome_log_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[CCRapportSyncEngine setsWithItemType:].cold.1(self, (uint64_t)v7, v9);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "itemType", (_QWORD)v18);
        if (v16 == objc_msgSend(v4, "unsignedShortValue"))
          objc_msgSend(v5, "addObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v12);
  }

  return v5;
}

- (void)startClient
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__CCRapportSyncEngine_startClient__block_invoke;
  block[3] = &unk_25098A6F0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __34__CCRapportSyncEngine_startClient__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerRequests");
}

- (void)startServer
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__CCRapportSyncEngine_startServer__block_invoke;
  block[3] = &unk_25098A6F0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __34__CCRapportSyncEngine_startServer__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "registerRequests");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "start");
}

- (void)registerRequests
{
  CCRapportManager *rapportManager;
  id v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CCRapportManager start](self->_rapportManager, "start");
  rapportManager = self->_rapportManager;
  -[CCRapportSyncEngine fetchMergeableDeltasRequestHandler](self, "fetchMergeableDeltasRequestHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CCRapportManager registerRequestID:requestHandler:](rapportManager, "registerRequestID:requestHandler:", CFSTR("com.apple.biomesyncd.cascade.fetchMergeableDeltas"), v4);

}

- (void)syncNowWithReason:(unint64_t)a3 activity:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a4;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __68__CCRapportSyncEngine_syncNowWithReason_activity_completionHandler___block_invoke;
  v13[3] = &unk_25098A9B0;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

uint64_t __68__CCRapportSyncEngine_syncNowWithReason_activity_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchMergeableDeltasIsReciprocal:reason:activity:completionHandler:", 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)fetchMergeableDeltasIsReciprocal:(BOOL)a3 reason:(unint64_t)a4 activity:(id)a5 completionHandler:(id)a6
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  void *v11;
  NSOperationQueue *v12;
  NSOperationQueue *operationQueue;
  NSObject *v14;
  void *v15;
  CCRapportRequest *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  id *v27;
  CCRapportRequest *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  id v34;
  id location;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  _QWORD v41[4];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = (void (**)(id, _QWORD, void *))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_currentRequest)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CCRapportErrorDomain"), 8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, MEMORY[0x24BDBD1A8], v11);

  }
  else
  {
    v12 = (NSOperationQueue *)objc_opt_new();
    operationQueue = self->_operationQueue;
    self->_operationQueue = v12;

    -[NSOperationQueue setUnderlyingQueue:](self->_operationQueue, "setUnderlyingQueue:", self->_queue);
    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    -[CCRapportSyncEngine itemTypesSupportingSync](self, "itemTypesSupportingSync");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __biome_log_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[CCRapportSyncEngine siteSuffix](self, "siteSuffix");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v38 = v15;
      v39 = 2112;
      v40 = v10;
      _os_log_impl(&dword_237B02000, v14, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: sets: %@", buf, 0x16u);

    }
    if (objc_msgSend(v10, "count"))
    {
      v16 = [CCRapportRequest alloc];
      v17 = (void *)objc_opt_new();
      v28 = -[CCRapportRequest initWithUUID:activity:itemTypesSupportingSync:queue:completionHandler:](v16, "initWithUUID:activity:itemTypesSupportingSync:queue:completionHandler:", v17, v8, v10, self->_queue, v9);

      objc_initWeak(&location, self);
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __90__CCRapportSyncEngine_fetchMergeableDeltasIsReciprocal_reason_activity_completionHandler___block_invoke;
      v33[3] = &unk_25098A9D8;
      v27 = &v34;
      objc_copyWeak(&v34, &location);
      v33[4] = self;
      -[CCRapportRequest setRequestTimeoutHandler:](v28, "setRequestTimeoutHandler:", v33);
      objc_storeStrong((id *)&self->_currentRequest, v28);
      -[CCRapportRequest setState:](self->_currentRequest, "setState:", 1);
      __biome_log_for_category();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        -[CCRapportSyncEngine siteSuffix](self, "siteSuffix", &v34);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CCRapportManager discoveredDevices](self->_rapportManager, "discoveredDevices");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v38 = v19;
        v39 = 2112;
        v40 = v20;
        _os_log_impl(&dword_237B02000, v18, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: discovered devices: %@", buf, 0x16u);

      }
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      -[CCRapportManager discoveredDevices](self->_rapportManager, "discoveredDevices");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v30 != v23)
              objc_enumerationMutation(v21);
            v25 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
            v26 = (void *)MEMORY[0x23B820268]();
            -[CCRapportSyncEngine addOperationsToFetchMergeableDeltasFromDevice:](self, "addOperationsToFetchMergeableDeltasFromDevice:", v25);
            objc_autoreleasePoolPop(v26);
          }
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
        }
        while (v22);
      }

      -[CCRapportManager start](self->_rapportManager, "start");
      objc_destroyWeak(v27);
      objc_destroyWeak(&location);

    }
    else
    {
      v9[2](v9, MEMORY[0x24BDBD1A8], (void *)MEMORY[0x24BDBD1A8]);
    }
  }

}

void __90__CCRapportSyncEngine_fetchMergeableDeltasIsReciprocal_reason_activity_completionHandler___block_invoke(uint64_t a1)
{
  dispatch_queue_t *WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_assert_queue_V2(WeakRetained[4]);
  __biome_log_for_category();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "siteSuffix");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl(&dword_237B02000, v3, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: request timed out because no devices are nearby", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CCRapportErrorDomain"), 6, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[dispatch_queue_t completeRequestAsDeliveredToDevices:withErrors:](WeakRetained, "completeRequestAsDeliveredToDevices:withErrors:", MEMORY[0x24BDBD1A8], v6);

}

- (void)addOperationsToFetchMergeableDeltasFromDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  CCAsyncBlockOperation *v7;
  uint64_t v8;
  CCAsyncBlockOperation *v9;
  CCAsyncBlockOperation *v10;
  id v11;
  CCAsyncBlockOperation *v12;
  CCAsyncBlockOperation *v13;
  CCAsyncBlockOperation *v14;
  id v15;
  CCAsyncBlockOperation *v16;
  NSOperationQueue *operationQueue;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  CCRapportSyncEngine *v24;
  CCAsyncBlockOperation *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[2];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[CCRapportSyncEngine siteSuffix](self, "siteSuffix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v31 = v6;
    v32 = 2112;
    v33 = v4;
    _os_log_impl(&dword_237B02000, v5, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: engaging with device: %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  v7 = [CCAsyncBlockOperation alloc];
  v8 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __69__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice___block_invoke;
  v27[3] = &unk_25098AA28;
  objc_copyWeak(&v28, (id *)buf);
  v27[4] = self;
  v9 = -[CCAsyncBlockOperation initWithAsyncOperationBlock:](v7, "initWithAsyncOperationBlock:", v27);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v9);
  v10 = [CCAsyncBlockOperation alloc];
  v22[0] = v8;
  v22[1] = 3221225472;
  v22[2] = __69__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice___block_invoke_102;
  v22[3] = &unk_25098AAA0;
  objc_copyWeak(&v26, (id *)buf);
  v11 = v4;
  v23 = v11;
  v24 = self;
  v12 = v9;
  v25 = v12;
  v13 = -[CCAsyncBlockOperation initWithAsyncOperationBlock:](v10, "initWithAsyncOperationBlock:", v22);
  v14 = [CCAsyncBlockOperation alloc];
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __69__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice___block_invoke_106;
  v19[3] = &unk_25098AAC8;
  objc_copyWeak(&v21, (id *)buf);
  v19[4] = self;
  v15 = v11;
  v20 = v15;
  v16 = -[CCAsyncBlockOperation initWithAsyncOperationBlock:](v14, "initWithAsyncOperationBlock:", v19);
  -[CCAsyncBlockOperation addDependency:](v16, "addDependency:", v13);
  operationQueue = self->_operationQueue;
  v29[0] = v13;
  v29[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOperationQueue addOperations:waitUntilFinished:](operationQueue, "addOperations:waitUntilFinished:", v18, 0);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v26);

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);

}

void __69__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  id *WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  void (**v12)(_QWORD);
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "siteSuffix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[1], "localDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_237B02000, v5, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: local device %@", buf, 0x16u);

  }
  objc_msgSend(WeakRetained[1], "localDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rapportIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v3[2](v3);
  }
  else
  {
    v10 = WeakRetained[1];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __69__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice___block_invoke_99;
    v11[3] = &unk_25098AA00;
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v3;
    objc_msgSend(v10, "registerLocalDeviceUpdatedHandler:", v11);

  }
}

void __69__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice___block_invoke_99(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    __biome_log_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "siteSuffix");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_237B02000, v5, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: discovered local device %@", (uint8_t *)&v7, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __69__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice___block_invoke_102(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CCAsyncBlockOperation *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CCAsyncBlockOperation *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  CCAsyncBlockOperation *v21;
  id v22;
  uint64_t v23;
  CCAsyncBlockOperation *v24;
  CCAsyncBlockOperation *v25;
  CCAsyncBlockOperation *v26;
  id v27;
  CCAsyncBlockOperation *v28;
  CCAsyncBlockOperation *v29;
  id v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  _QWORD v39[6];
  id v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v30 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setUnderlyingQueue:", *((_QWORD *)WeakRetained + 4));
  objc_msgSend(v4, "setMaxConcurrentOperationCount:", 1);
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  v35 = WeakRetained;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "siteSuffix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)WeakRetained + 7), "itemTypesSupportingSync");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v53 = v6;
    v54 = 2112;
    v55 = v7;
    v56 = 2112;
    v57 = v8;
    _os_log_impl(&dword_237B02000, v5, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: creating operations for syncing sets %@ with device %@", buf, 0x20u);

    WeakRetained = v35;
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(*((id *)WeakRetained + 7), "itemTypesSupportingSync");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  v9 = 0;
  if (v33)
  {
    v32 = *(_QWORD *)v47;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v47 != v32)
          objc_enumerationMutation(obj);
        v34 = v10;
        objc_msgSend(*(id *)(a1 + 40), "setsWithItemType:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v43;
          do
          {
            v15 = 0;
            v16 = v9;
            do
            {
              if (*(_QWORD *)v43 != v14)
                objc_enumerationMutation(v11);
              v17 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v15);
              __biome_log_for_category();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(*(id *)(a1 + 40), "siteSuffix");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = *(_QWORD *)(a1 + 32);
                *(_DWORD *)buf = 138412802;
                v53 = v19;
                v54 = 2112;
                v55 = v17;
                v56 = 2112;
                v57 = v20;
                _os_log_impl(&dword_237B02000, v18, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: beginning to fetch deltas for set %@ from device %@", buf, 0x20u);

                WeakRetained = v35;
              }

              v21 = [CCAsyncBlockOperation alloc];
              v39[0] = MEMORY[0x24BDAC760];
              v39[1] = 3221225472;
              v39[2] = __69__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice___block_invoke_103;
              v39[3] = &unk_25098AA50;
              v39[4] = WeakRetained;
              v39[5] = v17;
              v22 = *(id *)(a1 + 32);
              v23 = *(_QWORD *)(a1 + 40);
              v40 = v22;
              v41 = v23;
              v24 = -[CCAsyncBlockOperation initWithAsyncOperationBlock:](v21, "initWithAsyncOperationBlock:", v39);
              v9 = v24;
              if (v16)
                v25 = v16;
              else
                v25 = *(CCAsyncBlockOperation **)(a1 + 48);
              -[CCAsyncBlockOperation addDependency:](v24, "addDependency:", v25);
              objc_msgSend(v4, "addOperation:", v9);

              ++v15;
              v16 = v9;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
          }
          while (v13);
        }

        v10 = v34 + 1;
      }
      while (v34 + 1 != v33);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v33);
  }

  v26 = [CCAsyncBlockOperation alloc];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __69__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice___block_invoke_105;
  v36[3] = &unk_25098AA78;
  v36[4] = WeakRetained;
  v37 = *(id *)(a1 + 32);
  v27 = v30;
  v38 = v27;
  v28 = -[CCAsyncBlockOperation initWithAsyncOperationBlock:](v26, "initWithAsyncOperationBlock:", v36);
  v29 = v28;
  if (v9)
    -[CCAsyncBlockOperation addDependency:](v28, "addDependency:", v9);
  objc_msgSend(v4, "addOperation:", v29);

}

void __69__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice___block_invoke_103(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  __int128 v12;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "siteSuffix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_237B02000, v4, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: sending request for set: %@ to device %@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 56), "buildMergeableDeltasRequestForSet:withIsReciprocal:device:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "markAsInFlightToDevice:", *(_QWORD *)(a1 + 48));
  v9 = *(void **)(a1 + 48);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __69__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice___block_invoke_104;
  v11[3] = &unk_25098A960;
  v12 = *(_OWORD *)(a1 + 32);
  v13 = v9;
  v14 = v3;
  v10 = v3;
  objc_msgSend((id)v12, "sendFetchMergeableDeltasRequest:toDevice:completionHandler:", v8, v13, v11);

}

uint64_t __69__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice___block_invoke_104(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 32));
  __biome_log_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "siteSuffix");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_237B02000, v2, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: done fetching deltas for set %@ from device %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __69__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice___block_invoke_105(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "siteSuffix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_237B02000, v4, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: barrier hit, all deltas fetched for device %@", (uint8_t *)&v7, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v3[2](v3);

}

void __69__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice___block_invoke_106(id *a1, void *a2)
{
  id *v3;
  void (**v4)(_QWORD);
  id WeakRetained;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a1 + 6;
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[4], "siteSuffix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = a1[5];
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_237B02000, v6, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: done fetching all deltas from device %@", (uint8_t *)&v11, 0x16u);

  }
  v9 = (void *)*((_QWORD *)WeakRetained + 5);
  objc_msgSend(a1[5], "rapportIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "closeFileTransferSessionWithDeviceIdentifier:", v10);

  objc_msgSend(*((id *)WeakRetained + 7), "markAsDeliveredToDevice:withError:", a1[5], 0);
  objc_msgSend(WeakRetained, "completeRequestIfDeliveredToAllNearbyDevices");
  v4[2](v4);

}

- (void)completeRequestIfDeliveredToAllNearbyDevices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)MEMORY[0x24BDBCF20];
  -[CCRapportManager discoveredDevices](self->_rapportManager, "discoveredDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        -[CCRapportRequest deliveredToDevices](self->_currentRequest, "deliveredToDevices");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "containsObject:", v12);

        if (v14)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v7, "isSubsetOfSet:", v6))
  {
    -[CCRapportRequest deliveredToDevices](self->_currentRequest, "deliveredToDevices");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v15);

    v16 = (void *)objc_opt_new();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v17 = v6;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
          objc_msgSend(v22, "ccDeviceIdentifier", (_QWORD)v31);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            objc_msgSend(v22, "ccDeviceIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v24);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      }
      while (v19);
    }

    __biome_log_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      -[CCRapportSyncEngine siteSuffix](self, "siteSuffix");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCRapportRequest inFlightToDevices](self->_currentRequest, "inFlightToDevices");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v40 = v26;
      v41 = 2112;
      v42 = v27;
      _os_log_impl(&dword_237B02000, v25, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: completing request, still inflight: %@", buf, 0x16u);

    }
    objc_msgSend(v16, "allObjects");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCRapportRequest errorFromDevice](self->_currentRequest, "errorFromDevice");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "allValues");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCRapportSyncEngine completeRequestAsDeliveredToDevices:withErrors:](self, "completeRequestAsDeliveredToDevices:withErrors:", v28, v30);

  }
}

- (void)completeRequestAsDeliveredToDevices:(id)a3 withErrors:(id)a4
{
  CCRapportRequest *v6;
  id v7;
  NSObject *v8;
  void *v9;
  CCRapportRequest *currentRequest;
  void *v11;
  NSObject *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  CCRapportRequest *v15;
  int v16;
  void *v17;
  __int16 v18;
  CCRapportRequest *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = (CCRapportRequest *)a3;
  v7 = a4;
  if (-[CCRapportRequest state](self->_currentRequest, "state") == 2)
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[CCRapportSyncEngine siteSuffix](self, "siteSuffix");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      currentRequest = self->_currentRequest;
      v16 = 138412546;
      v17 = v9;
      v18 = 2112;
      v19 = currentRequest;
      _os_log_impl(&dword_237B02000, v8, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: request %@ already finished running", (uint8_t *)&v16, 0x16u);

    }
  }
  else
  {
    -[CCRapportRequest setState:](self->_currentRequest, "setState:", 2);
    -[CCRapportRequest completionHandler](self->_currentRequest, "completionHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      __biome_log_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        -[CCRapportSyncEngine siteSuffix](self, "siteSuffix");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412802;
        v17 = v13;
        v18 = 2112;
        v19 = v6;
        v20 = 2112;
        v21 = v7;
        _os_log_impl(&dword_237B02000, v12, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: completeRequest:deliveredToDevices %@ withErrors:%@", (uint8_t *)&v16, 0x20u);

      }
      -[CCRapportRequest completionHandler](self->_currentRequest, "completionHandler");
      v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, CCRapportRequest *, id))v14)[2](v14, v6, v7);

    }
    v15 = self->_currentRequest;
    self->_currentRequest = 0;

    -[CCRapportFileTransferManager closeAllFileTransferSessions](self->_fileTransferSessionManager, "closeAllFileTransferSessions");
    -[NSOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
  }

}

- (void)sendFetchMergeableDeltasRequest:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  CCRapportFileTransferManager *fileTransferSessionManager;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  CCRapportManager *rapportManager;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id location;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  fileTransferSessionManager = self->_fileTransferSessionManager;
  -[CCRapportManager localDevice](self->_rapportManager, "localDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rapportIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCRapportFileTransferManager buildFileTransferSessionWithTargetDeviceIdentifier:](fileTransferSessionManager, "buildFileTransferSessionWithTargetDeviceIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "selfPublicKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v16 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __82__CCRapportSyncEngine_sendFetchMergeableDeltasRequest_toDevice_completionHandler___block_invoke;
  v29[3] = &unk_25098AB18;
  objc_copyWeak(&v32, &location);
  v17 = v9;
  v30 = v17;
  v18 = v10;
  v31 = v18;
  objc_msgSend(v14, "setReceivedItemHandler:", v29);
  __biome_log_for_category();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v15;
    _os_log_impl(&dword_237B02000, v19, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine: registering to receive incoming files with peer key %@", buf, 0xCu);
  }

  objc_msgSend(v8, "setPeerPublicKey:", v15);
  objc_msgSend(v8, "dictionaryRepresentation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  rapportManager = self->_rapportManager;
  v25[0] = v16;
  v25[1] = 3221225472;
  v25[2] = __82__CCRapportSyncEngine_sendFetchMergeableDeltasRequest_toDevice_completionHandler___block_invoke_110;
  v25[3] = &unk_25098AB40;
  v22 = v17;
  v26 = v22;
  v23 = v18;
  v28 = v23;
  v24 = v14;
  v27 = v24;
  -[CCRapportManager sendRequest:request:toDevice:responseHandler:](rapportManager, "sendRequest:request:toDevice:responseHandler:", CFSTR("com.apple.biomesyncd.cascade.fetchMergeableDeltas"), v20, v22, v25);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

}

void __82__CCRapportSyncEngine_sendFetchMergeableDeltasRequest_toDevice_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, _QWORD);
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*((id *)WeakRetained + 5), "fileTransferQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  __biome_log_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl(&dword_237B02000, v9, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine: received item over file transfer session %@", buf, 0xCu);
  }

  objc_msgSend(WeakRetained, "handleIncomingMergeableDeltaFileTransfer:fromDevice:", v5, *(_QWORD *)(a1 + 32));
  v6[2](v6, 0);

  v10 = *((_QWORD *)WeakRetained + 4);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__CCRapportSyncEngine_sendFetchMergeableDeltasRequest_toDevice_completionHandler___block_invoke_108;
  block[3] = &unk_25098AAF0;
  v12 = *(id *)(a1 + 40);
  dispatch_async(v10, block);

}

uint64_t __82__CCRapportSyncEngine_sendFetchMergeableDeltasRequest_toDevice_completionHandler___block_invoke_108(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__CCRapportSyncEngine_sendFetchMergeableDeltasRequest_toDevice_completionHandler___block_invoke_110(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "domain");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 == CFSTR("CCRapportErrorDomain"))
    {
      v18 = objc_msgSend(v8, "code");

      if (v18 == 4)
      {
        v19 = -[CCFetchMergeableDeltasResponse initFromDictionary:]([CCFetchMergeableDeltasResponse alloc], "initFromDictionary:", v6);
        __biome_log_for_category();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          __82__CCRapportSyncEngine_sendFetchMergeableDeltasRequest_toDevice_completionHandler___block_invoke_110_cold_1();

        goto LABEL_15;
      }
    }
    else
    {

    }
    __biome_log_for_category();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __82__CCRapportSyncEngine_sendFetchMergeableDeltasRequest_toDevice_completionHandler___block_invoke_110_cold_2();
LABEL_15:

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_16;
  }
  __biome_log_for_category();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412546;
    v22 = v6;
    v23 = 2112;
    v24 = 0;
    _os_log_impl(&dword_237B02000, v11, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine: received response from initating file transfer %@ with error %@", (uint8_t *)&v21, 0x16u);
  }

  v12 = -[CCPeerToPeerMessage initFromDictionary:]([CCFileTransferSessionInitiatedResponse alloc], "initFromDictionary:", v6);
  objc_msgSend(v12, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCcDeviceIdentifier:", v14);

  __biome_log_for_category();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(void **)(a1 + 40);
    v21 = 138412290;
    v22 = v16;
    _os_log_impl(&dword_237B02000, v15, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine: activating file transfer session %@", (uint8_t *)&v21, 0xCu);
  }

  objc_msgSend(v12, "peerPublicKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setPeerPublicKey:", v17);

  objc_msgSend(*(id *)(a1 + 40), "activate");
LABEL_16:

}

- (void)handleIncomingMergeableDeltaFileTransfer:(id)a3 fromDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  CCMergeableDeltaFileTransferMessageMetadata *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "itemURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __biome_log_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v24 = v8;
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_237B02000, v9, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine: received file transfer item with url %@ from device %@", buf, 0x16u);
  }

  v10 = [CCMergeableDeltaFileTransferMessageMetadata alloc];
  objc_msgSend(v6, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CCMergeableDeltaFileTransferMessageMetadata initFromDictionary:](v10, "initFromDictionary:", v11);

  objc_msgSend(v12, "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "device");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v13 && v14)
  {
    if (objc_msgSend(v12, "fileFormatVersion") == 1)
    {
      -[CCRapportSyncEngine buildVersionedMergeableForSet:](self, "buildVersionedMergeableForSet:", v13);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x24BDB9130];
      objc_msgSend(v12, "mergeableDeltaMetadataVectors");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      objc_msgSend(v17, "decodeMergeableDeltaMetadata:withError:", v18, &v22);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v22;

      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9128]), "initWithFileURL:metadata:", v8, v19);
      -[NSObject mergeDelta:fromDevice:](v16, "mergeDelta:fromDevice:", v21, v15);

    }
    else
    {
      __biome_log_for_category();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[CCRapportSyncEngine handleIncomingMergeableDeltaFileTransfer:fromDevice:].cold.1(v12, v16);
    }
  }
  else
  {
    __biome_log_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CCRapportSyncEngine handleIncomingMergeableDeltaFileTransfer:fromDevice:].cold.2(v6, v16);
  }

}

- (id)buildMergeableDeltasRequestForSet:(id)a3 withIsReciprocal:(BOOL)a4 device:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  CCPeerToPeerMessage *v11;
  void *v12;
  CCPeerToPeerMessage *v13;
  void *v14;

  v5 = a4;
  v7 = a3;
  -[CCRapportSyncEngine buildVersionedMergeableForSet:](self, "buildVersionedMergeableForSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stateVector");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCDataResourceReadAccess localDeviceIdForSet:](self->_readAcccess, "localDeviceIdForSet:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [CCPeerToPeerMessage alloc];
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15668]), "initWithIdentifier:options:", v10, 1);
  v13 = -[CCPeerToPeerMessage initWithSet:device:protocolVersion:wallTime:peerPublicKey:](v11, "initWithSet:device:protocolVersion:wallTime:peerPublicKey:", v7, v12, -[CCRapportSyncEngine protocolVersion](self, "protocolVersion"), 0, CFAbsoluteTimeGetCurrent());

  +[CCFetchMergeableDeltasRequest fetchMergableDeltasRequestFromPeerToPeerMessage:stateVector:atomBatchVersion:isReciprocalRequest:](CCFetchMergeableDeltasRequest, "fetchMergableDeltasRequestFromPeerToPeerMessage:stateVector:atomBatchVersion:isReciprocalRequest:", v13, v9, 3, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)fetchMergeableDeltasRequestHandler
{
  void *v3;
  _QWORD v5[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__CCRapportSyncEngine_fetchMergeableDeltasRequestHandler__block_invoke;
  v5[3] = &unk_25098AB90;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  v3 = (void *)MEMORY[0x23B8203DC](v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __57__CCRapportSyncEngine_fetchMergeableDeltasRequestHandler__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(_QWORD);
  dispatch_queue_t *WeakRetained;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  CCPeerToPeerMessage *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  dispatch_queue_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  dispatch_queue_t *v62;
  id v63;
  id v64;
  void *v65;
  uint64_t v66;
  int v67;
  void *v68;
  _QWORD v69[4];
  id v70;
  id v71;
  uint64_t v72;
  const __CFString *v73;
  uint8_t buf[4];
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_assert_queue_V2(WeakRetained[4]);
  __biome_log_for_category();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "siteSuffix");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v75 = (uint64_t)v12;
    v76 = 2112;
    v77 = (uint64_t)v7;
    v78 = 2112;
    v79 = v8;
    _os_log_impl(&dword_237B02000, v11, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: received request %@ %@", buf, 0x20u);

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("senderModelID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v64 = v8;
      v62 = WeakRetained;
      v67 = objc_msgSend(*(id *)(a1 + 32), "protocolVersion");
      v14 = -[CCPeerToPeerMessage initFromDictionary:]([CCPeerToPeerMessage alloc], "initFromDictionary:", v7);
      v63 = v7;
      v15 = -[CCFetchMergeableDeltasRequest initFromDictionary:]([CCFetchMergeableDeltasRequest alloc], "initFromDictionary:", v7);
      objc_msgSend(v15, "set");
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "localDeviceIdForSet:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = [CCPeerToPeerMessage alloc];
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15668]), "initWithIdentifier:options:", v17, 1);
      v65 = (void *)v16;
      v66 = -[CCPeerToPeerMessage initWithSet:device:protocolVersion:wallTime:peerPublicKey:](v18, "initWithSet:device:protocolVersion:wallTime:peerPublicKey:", v16, v19, objc_msgSend(*(id *)(a1 + 32), "protocolVersion"), 0, CFAbsoluteTimeGetCurrent());

      v61 = v14;
      if (objc_msgSend(v14, "protocolVersion") == 2)
      {
        WeakRetained = v62;
        if (v17)
        {
          v59 = v17;
          objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE7CD00]);
          v20 = objc_claimAutoreleasedReturnValue();
          __biome_log_for_category();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v75 = v20;
            _os_log_impl(&dword_237B02000, v21, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine: initiating file transfer session with device %@", buf, 0xCu);
          }

          v22 = v62[5];
          objc_msgSend(v15, "peerPublicKey");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = (void *)v20;
          -[NSObject initiateFileTransferSesionBackToTargetDeviceWithIdentifier:withExchangedPeerPublicKey:](v22, "initiateFileTransferSesionBackToTargetDeviceWithIdentifier:withExchangedPeerPublicKey:", v20, v23);
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          __biome_log_for_category();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v75 = v20;
            v76 = 2112;
            v77 = (uint64_t)v68;
            _os_log_impl(&dword_237B02000, v24, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine: initiated file transfer session with device %@ fileTransferSession %@", buf, 0x16u);
          }

          objc_msgSend(v68, "selfPublicKey");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[CCFileTransferSessionInitiatedResponse fileTransferSessionInitiatedResponseFromPeerToPeerMessage:peerPublicKey:](CCFileTransferSessionInitiatedResponse, "fileTransferSessionInitiatedResponseFromPeerToPeerMessage:peerPublicKey:", v66, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v58 = v26;
          objc_msgSend(v26, "dictionaryRepresentation");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v9[2](v9);
          objc_msgSend(v15, "stateVector");
          v27 = objc_claimAutoreleasedReturnValue();
          LOBYTE(v26) = objc_msgSend(v15, "atomBatchVersion");
          objc_msgSend(*(id *)(a1 + 32), "buildVersionedMergeableForSet:", v65);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = (void *)v27;
          objc_msgSend(v55, "mergeableDeltaAfterStateVector:atomBatchVersion:", v27, v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)MEMORY[0x24BDB9130];
          objc_msgSend(v28, "metadata");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = 0;
          objc_msgSend(v29, "encodeMergeableDeltaMetadata:withError:", v30, &v71);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v71;

          v32 = (void *)objc_opt_new();
          objc_msgSend(v28, "fileURL");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "lastPathComponent");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setFilename:", v34);

          objc_msgSend(v28, "fileURL");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setItemURL:", v35);

          v69[0] = MEMORY[0x24BDAC760];
          v69[1] = 3221225472;
          v69[2] = __57__CCRapportSyncEngine_fetchMergeableDeltasRequestHandler__block_invoke_128;
          v69[3] = &unk_25098AB68;
          v53 = v28;
          v70 = v53;
          objc_msgSend(v32, "setCompletionHandler:", v69);
          objc_msgSend(v68, "selfPublicKey");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          +[CCMergeableDeltaFileTransferMessageMetadata mergeableDeltaFileTransferMessageMetadataFromPeerToPeerMessage:mergeableDeltaMetadataVectors:fileFormatVersion:peerPublicKey:](CCMergeableDeltaFileTransferMessageMetadata, "mergeableDeltaFileTransferMessageMetadataFromPeerToPeerMessage:mergeableDeltaMetadataVectors:fileFormatVersion:peerPublicKey:", v66, v31, 1, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v37, "dictionaryRepresentation");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setMetadata:", v38);

          __biome_log_for_category();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v75 = (uint64_t)v32;
            v76 = 2112;
            v77 = (uint64_t)v68;
            _os_log_impl(&dword_237B02000, v39, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine: adding items %@ to file transfer session %@", buf, 0x16u);
          }

          objc_msgSend(v68, "addItem:", v32);
          objc_msgSend(v68, "activate");

          v7 = v63;
          v8 = v64;
          v17 = v59;
          v40 = v60;
          v41 = (void *)v66;
          v42 = v58;
          goto LABEL_24;
        }
        __biome_log_for_category();
        v50 = objc_claimAutoreleasedReturnValue();
        v7 = v63;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "siteSuffix");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v75 = (uint64_t)v51;
          v76 = 2112;
          v77 = (uint64_t)v65;
          _os_log_impl(&dword_237B02000, v50, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: set does not exist on device %@", buf, 0x16u);

        }
        v41 = (void *)v66;
        +[CCFetchMergeableDeltasResponse fetchMergeableDeltasResponseFromPeerToPeerMessage:mergeableDelta:mergeableDeltaMetadataVectors:](CCFetchMergeableDeltasResponse, "fetchMergeableDeltasResponseFromPeerToPeerMessage:mergeableDelta:mergeableDeltaMetadataVectors:", v66, 0, 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "dictionaryRepresentation");
        v52 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CCRapportErrorDomain"), 1, 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = (void *)v52;
        ((void (*)(void (**)(_QWORD), uint64_t, _QWORD, void *))v9[2])(v9, v52, 0, v42);
      }
      else
      {
        __biome_log_for_category();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "siteSuffix");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v14, "protocolVersion");
          *(_DWORD *)buf = 138412802;
          v75 = (uint64_t)v47;
          v76 = 2048;
          v77 = v48;
          v78 = 1024;
          LODWORD(v79) = v67;
          _os_log_impl(&dword_237B02000, v46, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: mismatched protocol version %lu, expected %d", buf, 0x1Cu);

        }
        v41 = (void *)v66;
        +[CCFetchMergeableDeltasResponse fetchMergeableDeltasResponseFromPeerToPeerMessage:mergeableDelta:mergeableDeltaMetadataVectors:](CCFetchMergeableDeltasResponse, "fetchMergeableDeltasResponseFromPeerToPeerMessage:mergeableDelta:mergeableDeltaMetadataVectors:", v66, 0, 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "dictionaryRepresentation");
        v49 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CCRapportErrorDomain"), 4, 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = (void *)v49;
        ((void (*)(void (**)(_QWORD), uint64_t, _QWORD, void *))v9[2])(v9, v49, 0, v42);
        WeakRetained = v62;
        v7 = v63;
      }
      v8 = v64;
LABEL_24:

      v45 = v61;
      goto LABEL_25;
    }
  }
  __biome_log_for_category();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    __57__CCRapportSyncEngine_fetchMergeableDeltasRequestHandler__block_invoke_cold_1(a1, (uint64_t)v8, v43);

  v44 = (void *)MEMORY[0x24BDD1540];
  v72 = *MEMORY[0x24BDD0FC8];
  v73 = CFSTR("Unable to determine sender model info");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "errorWithDomain:code:userInfo:", CFSTR("CCRapportErrorDomain"), 5, v45);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  ((void (*)(void (**)(_QWORD), _QWORD, _QWORD, id))v9[2])(v9, 0, 0, v15);
LABEL_25:

}

void __57__CCRapportSyncEngine_fetchMergeableDeltasRequestHandler__block_invoke_128(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_237B02000, v4, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine: item completion handler invoked with error %@", (uint8_t *)&v7, 0xCu);
  }

  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_237B02000, v5, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine: holding onto mergeableDelta %@", (uint8_t *)&v7, 0xCu);
  }

}

- (unsigned)protocolVersion
{
  return 2;
}

- (void)setSiteSuffix:(id)a3
{
  objc_storeStrong((id *)&self->_siteSuffix, a3);
}

- (NSString)siteSuffix
{
  return (NSString *)&stru_25098AF68;
}

- (BOOL)rapportManager:(id)a3 isDeviceSupported:(id)a4
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x24BE0C090];
  v5 = a4;
  v6 = objc_msgSend(v4, "platform");
  v7 = objc_msgSend(v5, "platform");

  return (unint64_t)(v6 - 8) < 0xFFFFFFFFFFFFFFFDLL && (unint64_t)(v7 - 1) < 4;
}

- (void)rapportManager:(id)a3 didDiscoverCCRapportDevice:(id)a4
{
  void *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CCRapportRequest deliveredToDevices](self->_currentRequest, "deliveredToDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsObject:", v8))
  {

  }
  else
  {
    -[CCRapportRequest inFlightToDevices](self->_currentRequest, "inFlightToDevices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v8);

    if ((v7 & 1) == 0 && -[CCRapportRequest state](self->_currentRequest, "state") == 1)
      -[CCRapportSyncEngine addOperationsToFetchMergeableDeltasFromDevice:](self, "addOperationsToFetchMergeableDeltasFromDevice:", v8);
  }

}

- (void)rapportManagerDiscoveryTimedOut:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  CCRapportRequest *currentRequest;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CCRapportErrorDomain"), 3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCRapportRequest completionHandler](self->_currentRequest, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CCRapportRequest completionHandler](self->_currentRequest, "completionHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v6)[2](v6, MEMORY[0x24BDBD1A8], v7);

  }
  currentRequest = self->_currentRequest;
  self->_currentRequest = 0;

  -[CCRapportManager stop](self->_rapportManager, "stop");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_siteSuffix, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_fileTransferSessionManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_donateServiceProvider, 0);
  objc_storeStrong((id *)&self->_readAcccess, 0);
  objc_storeStrong((id *)&self->_rapportManager, 0);
}

- (void)setsWithItemType:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "siteSuffix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_237B02000, a3, OS_LOG_TYPE_DEBUG, "CCRapportSyncEngine%@: all sets %@", v5, 0x16u);

  OUTLINED_FUNCTION_1_0();
}

void __82__CCRapportSyncEngine_sendFetchMergeableDeltasRequest_toDevice_completionHandler___block_invoke_110_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_9();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_4_0(&dword_237B02000, v1, (uint64_t)v1, "CCRapportSyncEngine: protocol version mismatch %@, cannot initiate file transfer with device %@", v2);
}

void __82__CCRapportSyncEngine_sendFetchMergeableDeltasRequest_toDevice_completionHandler___block_invoke_110_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_237B02000, v0, v1, "CCRapportSyncEngine: encountered rapport messaging error %@", v2);
}

- (void)handleIncomingMergeableDeltaFileTransfer:(void *)a1 fromDevice:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a1, "fileFormatVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_237B02000, a2, v4, "CCRapportSyncEngine: unsupported file format version %@", v5);

  OUTLINED_FUNCTION_7();
}

- (void)handleIncomingMergeableDeltaFileTransfer:(void *)a1 fromDevice:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_237B02000, a2, v4, "CCRapportSyncEngine: cannot determine set or device from incoming file transfer metadata %@", v5);

  OUTLINED_FUNCTION_7();
}

void __57__CCRapportSyncEngine_fetchMergeableDeltasRequestHandler__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "siteSuffix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_0(&dword_237B02000, a3, v5, "CCRapportSyncEngine%@: unable to determine sender model info: %@", v6);

  OUTLINED_FUNCTION_1_0();
}

@end
