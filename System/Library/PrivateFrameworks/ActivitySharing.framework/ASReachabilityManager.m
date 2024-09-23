@implementation ASReachabilityManager

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

uint64_t __75__ASReachabilityManager_queryDestinations_updateHandler_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __60__ASReachabilityManager_sharedInstanceForServiceIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstanceForServiceIdentifier__sharedInstanceByServiceIdentifier;
  sharedInstanceForServiceIdentifier__sharedInstanceByServiceIdentifier = v0;

}

- (void)queryDestinations:(id)a3 updateHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a4;
  v12 = a5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __75__ASReachabilityManager_queryDestinations_updateHandler_completionHandler___block_invoke;
  v13[3] = &unk_24D057340;
  v14 = v8;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __75__ASReachabilityManager_queryDestinations_updateHandler_completionHandler___block_invoke_3;
  v11[3] = &unk_24D057340;
  v9 = v12;
  v10 = v8;
  -[ASReachabilityManager _addDestinationsToQuery:updateHandler:completionHandler:](self, "_addDestinationsToQuery:updateHandler:completionHandler:", a3, v13, v11);

}

+ (id)sharedInstanceForServiceIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (sharedInstanceForServiceIdentifier__once != -1)
    dispatch_once(&sharedInstanceForServiceIdentifier__once, &__block_literal_global_0);
  objc_msgSend((id)sharedInstanceForServiceIdentifier__sharedInstanceByServiceIdentifier, "objectForKey:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[ASReachabilityManager _initWithServiceIdentifier:]([ASReachabilityManager alloc], "_initWithServiceIdentifier:", v3);
    objc_msgSend((id)sharedInstanceForServiceIdentifier__sharedInstanceByServiceIdentifier, "setObject:forKey:", v4, v3);
  }

  return v4;
}

- (void)_addDestinationsToQuery:(id)a3 updateHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  ASReachabilityQueryOperation *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  uint8_t v38[128];
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, void *))a4;
  v10 = a5;
  ASLoggingInitialize();
  v11 = (void *)ASLogDefault;
  if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    *(_DWORD *)buf = 134217984;
    v40 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_21381F000, v12, OS_LOG_TYPE_DEFAULT, "Reachability: Request for %lu destinations", buf, 0xCu);

  }
  -[ASReachabilityStatusCache statusesForDestinations:](self->_statusCache, "statusesForDestinations:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    ASLoggingInitialize();
    v14 = (void *)ASLogDefault;
    if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 134217984;
      v40 = v16;
      _os_log_impl(&dword_21381F000, v15, OS_LOG_TYPE_DEFAULT, "Reachability: Hit %lu destinations in cache first pass", buf, 0xCu);

    }
    v9[2](v9, v13);
  }
  v17 = (void *)MEMORY[0x24BDD1758];
  v18 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __81__ASReachabilityManager__addDestinationsToQuery_updateHandler_completionHandler___block_invoke;
  v36[3] = &unk_24D0572C8;
  v19 = v13;
  v37 = v19;
  objc_msgSend(v17, "predicateWithBlock:", v36);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredSetUsingPredicate:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "count"))
  {
    v22 = objc_alloc_init(ASReachabilityQueryOperation);
    -[ASReachabilityQueryOperation setUpdateHandler:](v22, "setUpdateHandler:", v9);
    v33[0] = v18;
    v33[1] = 3221225472;
    v33[2] = __81__ASReachabilityManager__addDestinationsToQuery_updateHandler_completionHandler___block_invoke_2;
    v33[3] = &unk_24D0572F0;
    v34 = v19;
    v28 = v10;
    v35 = v10;
    -[ASReachabilityQueryOperation setCompletionHandler:](v22, "setCompletionHandler:", v33);
    -[ASReachabilityQueryOperation setDestinations:](v22, "setDestinations:", v21);
    -[ASReachabilityQueryOperation setStatusCache:](v22, "setStatusCache:", self->_statusCache);
    -[ASReachabilityQueryOperation setServiceIdentifier:](v22, "setServiceIdentifier:", self->_serviceIdentifier);
    -[ASReachabilityQueryOperation setQueuePriority:](v22, "setQueuePriority:", 8);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[NSOperationQueue operations](self->_queryOperationQueue, "operations");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v30;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v30 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v27++), "setQueuePriority:", -4);
        }
        while (v25 != v27);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v25);
    }

    -[NSOperationQueue addOperation:](self->_queryOperationQueue, "addOperation:", v22);
    v10 = v28;
  }
  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v19);
  }

}

void __75__ASReachabilityManager_queryDestinations_updateHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __75__ASReachabilityManager_queryDestinations_updateHandler_completionHandler___block_invoke_4;
    v4[3] = &unk_24D057318;
    v6 = *(id *)(a1 + 32);
    v5 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v4);

  }
}

- (ASReachabilityManager)init
{

  return 0;
}

- (id)_initWithServiceIdentifier:(id)a3
{
  id v5;
  ASReachabilityManager *v6;
  ASReachabilityManager *v7;
  ASReachabilityStatusCache *v8;
  ASReachabilityStatusCache *statusCache;
  NSOperationQueue *v10;
  NSOperationQueue *queryOperationQueue;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ASReachabilityManager;
  v6 = -[ASReachabilityManager init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceIdentifier, a3);
    v8 = objc_alloc_init(ASReachabilityStatusCache);
    statusCache = v7->_statusCache;
    v7->_statusCache = v8;

    v10 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    queryOperationQueue = v7->_queryOperationQueue;
    v7->_queryOperationQueue = v10;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_queryOperationQueue, "setMaxConcurrentOperationCount:", 1);
    HKCreateSerialDispatchQueue();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setUnderlyingQueue:](v7->_queryOperationQueue, "setUnderlyingQueue:", v12);

  }
  return v7;
}

BOOL __81__ASReachabilityManager__addDestinationsToQuery_updateHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

void __81__ASReachabilityManager__addDestinationsToQuery_updateHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (id)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v5, "addEntriesFromDictionary:", v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __75__ASReachabilityManager_queryDestinations_updateHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __75__ASReachabilityManager_queryDestinations_updateHandler_completionHandler___block_invoke_2;
    v4[3] = &unk_24D057318;
    v6 = *(id *)(a1 + 32);
    v5 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v4);

  }
}

uint64_t __75__ASReachabilityManager_queryDestinations_updateHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (int64_t)numberOfScheduledQueries
{
  return -[NSOperationQueue operationCount](self->_queryOperationQueue, "operationCount");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_queryOperationQueue, 0);
  objc_storeStrong((id *)&self->_statusCache, 0);
}

@end
