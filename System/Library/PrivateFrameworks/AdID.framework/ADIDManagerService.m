@implementation ADIDManagerService

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__ADIDManagerService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken != -1)
    dispatch_once(&sharedInstance__onceToken, block);
  return (id)sharedInstance__instance;
}

void __36__ADIDManagerService_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance__instance;
  sharedInstance__instance = (uint64_t)v0;

}

- (ADIDManagerService)init
{
  ADIDManagerService *v2;
  uint64_t v3;
  NSMutableArray *reconcileArray;
  dispatch_queue_t v5;
  OS_dispatch_queue *forceReconcileQueue;
  id v7;
  uint64_t v8;
  NSXPCListener *listener;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ADIDManagerService;
  v2 = -[ADIDManagerService init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    reconcileArray = v2->_reconcileArray;
    v2->_reconcileArray = (NSMutableArray *)v3;

    v5 = dispatch_queue_create("com.apple.ap.adprivacyd.forceReconcile", 0);
    forceReconcileQueue = v2->_forceReconcileQueue;
    v2->_forceReconcileQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc(MEMORY[0x24BDD1998]);
    v8 = objc_msgSend(v7, "initWithMachServiceName:", *MEMORY[0x24BE02120]);
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v8;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.ap.idmanager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) != 0)
  {
    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254EEA360);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v8);

    objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_1);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Accepted connection from ID manager client."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(v5, "resume");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Rejected ID manager client with PID %d lacking the appropriate entitlement (%@)."), objc_msgSend(v5, "processIdentifier"), CFSTR("com.apple.private.ap.idmanager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  return v7;
}

void __57__ADIDManagerService_listener_shouldAcceptNewConnection___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("XPC connection invalidated. Lost connection from ID manager client."));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _ADLog();

}

- (void)forceReconcile:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  dispatch_time_t v7;
  NSObject *forceReconcileQueue;
  id v9;
  _QWORD block[4];
  id v11;

  v4 = a3;
  v5 = -[ADIDManagerService delayForNewForceReconcileRequest](self, "delayForNewForceReconcileRequest");
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Delaying forceReconcile for %lu seconds."), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  v7 = dispatch_time(0, 1000000000 * v5);
  forceReconcileQueue = self->_forceReconcileQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__ADIDManagerService_forceReconcile___block_invoke;
  block[3] = &unk_24D710428;
  v11 = v4;
  v9 = v4;
  dispatch_after(v7, forceReconcileQueue, block);

}

void __37__ADIDManagerService_forceReconcile___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(MEMORY[0x24BE02228], "workQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __37__ADIDManagerService_forceReconcile___block_invoke_2;
  v3[3] = &unk_24D710428;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "addOperationWithBlock:", v3);

}

void __37__ADIDManagerService_forceReconcile___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __37__ADIDManagerService_forceReconcile___block_invoke_3;
  v3[3] = &unk_24D710400;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "reconcile:", v3);

}

void __37__ADIDManagerService_forceReconcile___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v3, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "code");
    v13 = CFSTR("Error Description");
    objc_msgSend(v4, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v10);

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);
  }

}

- (unint64_t)delayForNewForceReconcileRequest
{
  ADIDManagerService *v2;
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  double v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v2->_reconcileArray;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v3, "timeIntervalSinceDate:", v9);
        if (v10 > 30.0)
          objc_msgSend(v4, "addObject:", v9);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  -[NSMutableArray removeObjectsInArray:](v2->_reconcileArray, "removeObjectsInArray:", v4);
  -[NSMutableArray addObject:](v2->_reconcileArray, "addObject:", v3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Times that a forceReconcile have been requested: %@"), v2->_reconcileArray);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  v12 = -[NSMutableArray count](v2->_reconcileArray, "count");
  objc_sync_exit(v2);

  return v12 - 1;
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16, 1);
}

- (void)setListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableArray)reconcileArray
{
  return self->_reconcileArray;
}

- (void)setReconcileArray:(id)a3
{
  objc_storeStrong((id *)&self->_reconcileArray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reconcileArray, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_forceReconcileQueue, 0);
}

@end
