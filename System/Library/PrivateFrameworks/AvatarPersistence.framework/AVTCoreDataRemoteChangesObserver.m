@implementation AVTCoreDataRemoteChangesObserver

- (AVTCoreDataRemoteChangesObserver)initWithConfiguration:(id)a3 workQueue:(id)a4 coalescer:(id)a5 environment:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AVTCoreDataRemoteChangesObserver *v15;
  AVTCoreDataRemoteChangesObserver *v16;
  uint64_t v17;
  AVTUILogger *logger;
  uint64_t v19;
  NSMutableArray *changeHandlers;
  uint64_t v21;
  NSMutableArray *transactionsForPendingChanges;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)AVTCoreDataRemoteChangesObserver;
  v15 = -[AVTCoreDataRemoteChangesObserver init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_configuration, a3);
    objc_msgSend(v14, "logger");
    v17 = objc_claimAutoreleasedReturnValue();
    logger = v16->_logger;
    v16->_logger = (AVTUILogger *)v17;

    objc_storeStrong((id *)&v16->_workQueue, a4);
    objc_storeStrong((id *)&v16->_coalescer, a5);
    objc_storeStrong((id *)&v16->_environment, a6);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    changeHandlers = v16->_changeHandlers;
    v16->_changeHandlers = (NSMutableArray *)v19;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v21 = objc_claimAutoreleasedReturnValue();
    transactionsForPendingChanges = v16->_transactionsForPendingChanges;
    v16->_transactionsForPendingChanges = (NSMutableArray *)v21;

  }
  return v16;
}

- (void)addChangesHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[AVTCoreDataRemoteChangesObserver observationToken](self, "observationToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Add handler before starting to observe!"));
  -[AVTCoreDataRemoteChangesObserver changeHandlers](self, "changeHandlers");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "copy");

  v7 = (void *)MEMORY[0x22074B1E8](v6);
  objc_msgSend(v8, "addObject:", v7);

}

- (void)registerCoalescerEventHandler
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[AVTCoreDataRemoteChangesObserver coalescer](self, "coalescer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __65__AVTCoreDataRemoteChangesObserver_registerCoalescerEventHandler__block_invoke;
  v4[3] = &unk_24DD31C18;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerEventForCoalescingWithLabel:handler:", CFSTR("NSPersistentStoreRemoteChangeNotification"), v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __65__AVTCoreDataRemoteChangesObserver_registerCoalescerEventHandler__block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD v2[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __65__AVTCoreDataRemoteChangesObserver_registerCoalescerEventHandler__block_invoke_2;
  v2[3] = &unk_24DD31F58;
  v2[4] = WeakRetained;
  objc_msgSend(WeakRetained, "performManagedObjectContextWork:", v2);

}

void __65__AVTCoreDataRemoteChangesObserver_registerCoalescerEventHandler__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "transactionsForPendingChanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(*(id *)(a1 + 32), "transactionsForPendingChanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "count");
  objc_msgSend(*(id *)(a1 + 32), "changeHandlers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logDispatchingRemoteChangeWithTransactionCount:handlersCount:", v8, objc_msgSend(v9, "count"));

  objc_msgSend(*(id *)(a1 + 32), "changeHandlers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __65__AVTCoreDataRemoteChangesObserver_registerCoalescerEventHandler__block_invoke_3;
  v13[3] = &unk_24DD31F30;
  v14 = v3;
  v15 = v5;
  v11 = v5;
  v12 = v3;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);

}

uint64_t __65__AVTCoreDataRemoteChangesObserver_registerCoalescerEventHandler__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)startObservingChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id location;

  -[AVTCoreDataRemoteChangesObserver observationToken](self, "observationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Already observing!"));
  -[AVTCoreDataRemoteChangesObserver registerCoalescerEventHandler](self, "registerCoalescerEventHandler");
  -[AVTCoreDataRemoteChangesObserver configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentStoreCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTCoreDataRemoteChangesObserver logger](self, "logger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logStartObservingRemoteChangeNotificationFrom:", v7);

  objc_initWeak(&location, self);
  -[AVTCoreDataRemoteChangesObserver environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BDBB510];
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __57__AVTCoreDataRemoteChangesObserver_startObservingChanges__block_invoke;
  v15 = &unk_24DD318E0;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", v10, v5, 0, &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCoreDataRemoteChangesObserver setObservationToken:](self, "setObservationToken:", v11, v12, v13, v14, v15);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __57__AVTCoreDataRemoteChangesObserver_startObservingChanges__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = (void *)os_transaction_create();
    objc_msgSend(WeakRetained, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__AVTCoreDataRemoteChangesObserver_startObservingChanges__block_invoke_2;
    block[3] = &unk_24DD31FA8;
    block[4] = WeakRetained;
    v9 = v3;
    v10 = v5;
    v7 = v5;
    dispatch_async(v6, block);

  }
}

void __57__AVTCoreDataRemoteChangesObserver_startObservingChanges__block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__AVTCoreDataRemoteChangesObserver_startObservingChanges__block_invoke_3;
  v3[3] = &unk_24DD31F80;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "processRemoteChangeNotification:completion:", v2, v3);

}

- (BOOL)isObservingChanges
{
  void *v2;
  BOOL v3;

  -[AVTCoreDataRemoteChangesObserver observationToken](self, "observationToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)processRemoteChangeNotification:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[AVTCoreDataRemoteChangesObserver logger](self, "logger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __79__AVTCoreDataRemoteChangesObserver_processRemoteChangeNotification_completion___block_invoke;
  v11[3] = &unk_24DD32020;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "processingRemoteChangeNotification:", v11);

}

void __79__AVTCoreDataRemoteChangesObserver_processRemoteChangeNotification_completion___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  objc_msgSend(a1[4], "logger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" object:%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logReceivedRemoteChange:", v5);

  objc_msgSend(a1[5], "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDBB4B0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = a1[4];
  if (v7)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __79__AVTCoreDataRemoteChangesObserver_processRemoteChangeNotification_completion___block_invoke_2;
    v10[3] = &unk_24DD31FF8;
    v10[4] = v8;
    v11 = v7;
    v12 = a1[6];
    objc_msgSend(v8, "performManagedObjectContextWork:", v10);

  }
  else
  {
    objc_msgSend(a1[4], "logger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logNotificationDoesntContainChangeHistoryToken");

    (*((void (**)(void))a1[6] + 2))();
  }

}

void __79__AVTCoreDataRemoteChangesObserver_processRemoteChangeNotification_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "changeTransactionsForToken:managedObjectContext:", *(_QWORD *)(a1 + 40), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transactionsForPendingChanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v3);

  objc_msgSend(*(id *)(a1 + 32), "coalescer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __79__AVTCoreDataRemoteChangesObserver_processRemoteChangeNotification_completion___block_invoke_3;
  v6[3] = &unk_24DD31FD0;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v5, "eventDidOccur:", v6);

}

uint64_t __79__AVTCoreDataRemoteChangesObserver_processRemoteChangeNotification_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)changeTransactionsForToken:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;

  v6 = a4;
  v7 = a3;
  -[AVTCoreDataRemoteChangesObserver logger](self, "logger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logInspectingChangesForExportAfterToken:", v9);

  objc_msgSend(MEMORY[0x24BDBB710], "fetchHistoryTransactionForToken:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setResultType:", 5);
  v17 = 0;
  objc_msgSend(v6, "executeRequest:error:", v10, &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v17;
  if (v11)
  {
    objc_msgSend(v11, "result");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AVTCoreDataRemoteChangesObserver logger](self, "logger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logErrorFetchingChangeHistory:", v15);

    v13 = 0;
  }

  return v13;
}

- (void)performManagedObjectContextWork:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  AVTCoreDataRemoteChangesObserver *v11;
  id v12;

  v4 = a3;
  -[AVTCoreDataRemoteChangesObserver configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createManagedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __68__AVTCoreDataRemoteChangesObserver_performManagedObjectContextWork___block_invoke;
  v9[3] = &unk_24DD31E40;
  v10 = v6;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = v6;
  objc_msgSend(v8, "performBlockAndWait:", v9);

}

void __68__AVTCoreDataRemoteChangesObserver_performManagedObjectContextWork___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBB758], "currentQueryGenerationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v4 = objc_msgSend(v2, "setQueryGenerationFromToken:error:", v3, &v8);
  v5 = v8;

  if ((v4 & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "logger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logErrorPinningContextToCurrentQueryGenerationToken:", v7);

  }
}

- (AVTCoreDataPersistentStoreConfiguration)configuration
{
  return self->_configuration;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (AVTEventCoalescer)coalescer
{
  return self->_coalescer;
}

- (AVTCoreEnvironment)environment
{
  return self->_environment;
}

- (NSObject)observationToken
{
  return self->_observationToken;
}

- (void)setObservationToken:(id)a3
{
  objc_storeStrong((id *)&self->_observationToken, a3);
}

- (NSMutableArray)changeHandlers
{
  return self->_changeHandlers;
}

- (NSMutableArray)transactionsForPendingChanges
{
  return self->_transactionsForPendingChanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionsForPendingChanges, 0);
  objc_storeStrong((id *)&self->_changeHandlers, 0);
  objc_storeStrong((id *)&self->_observationToken, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_coalescer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
