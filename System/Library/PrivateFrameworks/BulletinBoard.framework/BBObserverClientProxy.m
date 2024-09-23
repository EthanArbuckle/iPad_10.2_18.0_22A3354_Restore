@implementation BBObserverClientProxy

void __62__BBObserverClientProxy_updateSectionParameters_forSectionID___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 8), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateSectionParameters:forSectionID:", a1[5], a1[6]);

}

void __43__BBObserverClientProxy_updateSectionInfo___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateSectionInfo:", *(_QWORD *)(a1 + 40));

}

void __57__BBObserverClientProxy_noteBulletinsLoadedForSectionID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteBulletinsLoadedForSectionID:", *(_QWORD *)(a1 + 40));

}

- (void)updateSectionParameters:(id)a3 forSectionID:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__BBObserverClientProxy_updateSectionParameters_forSectionID___block_invoke;
  block[3] = &unk_24C563438;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)updateSectionInfo:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__BBObserverClientProxy_updateSectionInfo___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)noteBulletinsLoadedForSectionID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__BBObserverClientProxy_noteBulletinsLoadedForSectionID___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

+ (id)xpcInterface
{
  if (xpcInterface_onceToken_126 != -1)
    dispatch_once(&xpcInterface_onceToken_126, &__block_literal_global_128);
  return (id)xpcInterface___interface_127;
}

void __37__BBObserverClientProxy_xpcInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549A52F8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)xpcInterface___interface_127;
  xpcInterface___interface_127 = v0;

}

- (BBObserverClientProxy)initWithServer:(id)a3 connection:(id)a4 calloutQueue:(id)a5
{
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  dispatch_queue_t v13;
  BBObserverClientProxy *v14;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = dispatch_queue_create("com.apple.bulletinboard.BBObserverClientProxy", v9);

  v14 = -[BBObserverClientProxy initWithServer:connection:queue:calloutQueue:](self, "initWithServer:connection:queue:calloutQueue:", v12, v11, v13, v10);
  return v14;
}

- (BBObserverClientProxy)initWithServer:(id)a3 connection:(id)a4 queue:(id)a5 calloutQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BBObserverClientProxy *v14;
  BBObserverClientProxy *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *bulletinIDsToTransaction;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)BBObserverClientProxy;
  v14 = -[BBObserverClientProxy init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_queue, a5);
    objc_storeStrong((id *)&v15->_calloutQueue, a6);
    -[BBObserverClientProxy setConnection:](v15, "setConnection:", v11);
    -[BBObserverClientProxy setServer:](v15, "setServer:", v10);
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    bulletinIDsToTransaction = v15->_bulletinIDsToTransaction;
    v15->_bulletinIDsToTransaction = v16;

  }
  return v15;
}

- (void)dealloc
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[BBObserverClientProxy server](self, "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_bulletinIDsToTransaction;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "clearBulletinIDIfPossible:rescheduleExpirationTimer:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++), 1);
      }
      while (v6 != v8);
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v9.receiver = self;
  v9.super_class = (Class)BBObserverClientProxy;
  -[BBObserverClientProxy dealloc](&v9, sel_dealloc);
}

- (NSString)clientBundleIdentifier
{
  NSString *clientBundleIdentifier;
  void *v4;

  clientBundleIdentifier = self->_clientBundleIdentifier;
  if (!clientBundleIdentifier)
  {
    -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier");
    BSBundleIDForPID();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBObserverClientProxy setClientBundleIdentifier:](self, "setClientBundleIdentifier:", v4);

    clientBundleIdentifier = self->_clientBundleIdentifier;
  }
  return clientBundleIdentifier;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[BBObserverClientProxy clientBundleIdentifier](self, "clientBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p [%@]>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)removeTransaction:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *bulletinIDsToTransaction;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_bulletinIDsToTransaction;
  objc_sync_enter(v5);
  objc_msgSend(v4, "bulletinID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBObserverClientProxy currentTransactionForBulletinID:](self, "currentTransactionForBulletinID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "transactionID");
  if (v8 == objc_msgSend(v4, "transactionID"))
  {
    bulletinIDsToTransaction = self->_bulletinIDsToTransaction;
    objc_msgSend(v4, "bulletinID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](bulletinIDsToTransaction, "removeObjectForKey:", v10);

  }
  else if (v7)
  {
    v11 = BBLogBulletinLife;
    if (os_log_type_enabled((os_log_t)BBLogBulletinLife, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543618;
      v13 = v4;
      v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_20CCB9000, v11, OS_LOG_TYPE_DEFAULT, "asked to remove a transaction (%{public}@) but our transaction (%{public}@) doesn't match IDs", (uint8_t *)&v12, 0x16u);
    }
  }

  objc_sync_exit(v5);
}

- (id)transactionBulletinIDs
{
  NSMutableDictionary *v3;
  void *v4;

  v3 = self->_bulletinIDsToTransaction;
  objc_sync_enter(v3);
  -[NSMutableDictionary allKeys](self->_bulletinIDsToTransaction, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return v4;
}

- (id)currentTransactionForBulletinID:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;

  v4 = a3;
  v5 = self->_bulletinIDsToTransaction;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKey:](self->_bulletinIDsToTransaction, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (unint64_t)incrementedTransactionIDForBulletinID:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  BBBulletinTransaction *v6;
  BBBulletinTransaction *v7;
  unint64_t v8;

  v4 = a3;
  v5 = self->_bulletinIDsToTransaction;
  objc_sync_enter(v5);
  -[BBObserverClientProxy currentTransactionForBulletinID:](self, "currentTransactionForBulletinID:", v4);
  v6 = (BBBulletinTransaction *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    -[BBBulletinTransaction incrementTransactionID](v6, "incrementTransactionID");
  }
  else
  {
    v7 = -[BBBulletinTransaction initWithBulletinID:]([BBBulletinTransaction alloc], "initWithBulletinID:", v4);
    -[NSMutableDictionary setObject:forKey:](self->_bulletinIDsToTransaction, "setObject:forKey:", v7, v4);
  }
  v8 = -[BBBulletinTransaction transactionID](v7, "transactionID");

  objc_sync_exit(v5);
  return v8;
}

- (void)updateBulletin:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__BBObserverClientProxy_updateBulletin_withHandler___block_invoke;
  block[3] = &unk_24C563280;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __52__BBObserverClientProxy_updateBulletin_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__BBObserverClientProxy_updateBulletin_withHandler___block_invoke_2;
  v5[3] = &unk_24C565810;
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v2, "updateBulletin:withHandler:", v3, v5);

}

void __52__BBObserverClientProxy_updateBulletin_withHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__BBObserverClientProxy_updateBulletin_withHandler___block_invoke_3;
    block[3] = &unk_24C565748;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __52__BBObserverClientProxy_updateBulletin_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)removeSection:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  id v5;

  connection = self->_connection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeSection:", v4);

}

- (void)updateGlobalSettings:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__BBObserverClientProxy_updateGlobalSettings___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __46__BBObserverClientProxy_updateGlobalSettings___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateGlobalSettings:", *(_QWORD *)(a1 + 40));

}

- (void)noteServerReceivedResponseForBulletin:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__BBObserverClientProxy_noteServerReceivedResponseForBulletin___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __63__BBObserverClientProxy_noteServerReceivedResponseForBulletin___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteServerReceivedResponseForBulletin:", *(_QWORD *)(a1 + 40));

}

- (void)getObserverDebugInfo:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__BBObserverClientProxy_getObserverDebugInfo___block_invoke;
  v7[3] = &unk_24C563518;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __46__BBObserverClientProxy_getObserverDebugInfo___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getObserverDebugInfo:", *(_QWORD *)(a1 + 40));

}

- (void)setObserverFeed:(unint64_t)a3 attachToLightsAndSirensGateway:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__BBObserverClientProxy_setObserverFeed_attachToLightsAndSirensGateway___block_invoke;
  block[3] = &unk_24C5632D0;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

void __72__BBObserverClientProxy_setObserverFeed_attachToLightsAndSirensGateway___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observer:setObserverFeed:attachToLightsAndSirensGateway:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)setObserverFeed:(unint64_t)a3 asLightsAndSirensGateway:(id)a4 priority:(unint64_t)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  unint64_t v14;

  v8 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __75__BBObserverClientProxy_setObserverFeed_asLightsAndSirensGateway_priority___block_invoke;
  v11[3] = &unk_24C565720;
  v11[4] = self;
  v12 = v8;
  v13 = a3;
  v14 = a5;
  v10 = v8;
  dispatch_async(queue, v11);

}

void __75__BBObserverClientProxy_setObserverFeed_asLightsAndSirensGateway_priority___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observer:setObserverFeed:asLightsAndSirensGateway:priority:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

}

- (void)handleResponse:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__BBObserverClientProxy_handleResponse_withCompletion___block_invoke;
  block[3] = &unk_24C563280;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __55__BBObserverClientProxy_handleResponse_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = v2;
    objc_msgSend(v3, "server");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v3;
    v10 = 2114;
    v11 = v4;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ handling response %{public}@ with server %{public}@", (uint8_t *)&v8, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "server");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "observer:handleResponse:withCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)finishedWithBulletinID:(id)a3 transactionID:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__BBObserverClientProxy_finishedWithBulletinID_transactionID___block_invoke;
  block[3] = &unk_24C5632D0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

void __62__BBObserverClientProxy_finishedWithBulletinID_transactionID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observer:finishedWithBulletinID:transactionID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)clearSection:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__BBObserverClientProxy_clearSection___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __38__BBObserverClientProxy_clearSection___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observer:clearSection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)clearBulletinsFromDate:(id)a3 toDate:(id)a4 inSections:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __66__BBObserverClientProxy_clearBulletinsFromDate_toDate_inSections___block_invoke;
  v15[3] = &unk_24C5636F8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __66__BBObserverClientProxy_clearBulletinsFromDate_toDate_inSections___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observer:clearBulletinsFromDate:toDate:inSections:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)clearBulletinIDs:(id)a3 inSection:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__BBObserverClientProxy_clearBulletinIDs_inSection___block_invoke;
  block[3] = &unk_24C563438;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __52__BBObserverClientProxy_clearBulletinIDs_inSection___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observer:clearBulletinIDs:inSection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)removeBulletins:(id)a3 inSection:(id)a4 fromFeeds:(unint64_t)a5
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

  v8 = a3;
  v9 = a4;
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61__BBObserverClientProxy_removeBulletins_inSection_fromFeeds___block_invoke;
  v13[3] = &unk_24C5635B8;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

void __61__BBObserverClientProxy_removeBulletins_inSection_fromFeeds___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observer:removeBulletins:inSection:fromFeeds:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)requestNoticesBulletinsForSectionID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__BBObserverClientProxy_requestNoticesBulletinsForSectionID___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __61__BBObserverClientProxy_requestNoticesBulletinsForSectionID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observer:requestNoticesBulletinsForSectionID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)requestNoticesBulletinsForAllSections
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__BBObserverClientProxy_requestNoticesBulletinsForAllSections__block_invoke;
  block[3] = &unk_24C562E28;
  block[4] = self;
  dispatch_async(queue, block);
}

void __62__BBObserverClientProxy_requestNoticesBulletinsForAllSections__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestNoticesBulletinsForAllSections:", *(_QWORD *)(a1 + 32));

}

- (void)getSectionInfoWithHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__BBObserverClientProxy_getSectionInfoWithHandler___block_invoke;
  v7[3] = &unk_24C563518;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __51__BBObserverClientProxy_getSectionInfoWithHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observer:getSectionInfoWithHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)getSectionInfoForActiveSectionsWithHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__BBObserverClientProxy_getSectionInfoForActiveSectionsWithHandler___block_invoke;
  v7[3] = &unk_24C563518;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __68__BBObserverClientProxy_getSectionInfoForActiveSectionsWithHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observer:getSectionInfoForActiveSectionsWithHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)getSectionInfoForSectionIDs:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__BBObserverClientProxy_getSectionInfoForSectionIDs_withHandler___block_invoke;
  block[3] = &unk_24C563280;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __65__BBObserverClientProxy_getSectionInfoForSectionIDs_withHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observer:getSectionInfoForSectionIDs:withHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)getSectionParametersForSectionID:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__BBObserverClientProxy_getSectionParametersForSectionID_withHandler___block_invoke;
  block[3] = &unk_24C563280;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __70__BBObserverClientProxy_getSectionParametersForSectionID_withHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getSectionParametersForSectionID:withHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)getUniversalSectionIDForSectionID:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__BBObserverClientProxy_getUniversalSectionIDForSectionID_withHandler___block_invoke;
  block[3] = &unk_24C563280;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __71__BBObserverClientProxy_getUniversalSectionIDForSectionID_withHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getUniversalSectionIDForSectionID:withHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)getBulletinsWithHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__BBObserverClientProxy_getBulletinsWithHandler___block_invoke;
  v7[3] = &unk_24C563518;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __49__BBObserverClientProxy_getBulletinsWithHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getBulletinsWithHandler:", *(_QWORD *)(a1 + 40));

}

- (void)getPublisherMatchIDsOfBulletinsPublishedAfterDate:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__BBObserverClientProxy_getPublisherMatchIDsOfBulletinsPublishedAfterDate_withHandler___block_invoke;
  block[3] = &unk_24C563280;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __87__BBObserverClientProxy_getPublisherMatchIDsOfBulletinsPublishedAfterDate_withHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getPublisherMatchIDsOfBulletinsPublishedAfterDate:withHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)getBulletinsForPublisherMatchIDs:(id)a3 sectionID:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __80__BBObserverClientProxy_getBulletinsForPublisherMatchIDs_sectionID_withHandler___block_invoke;
  v15[3] = &unk_24C563230;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __80__BBObserverClientProxy_getBulletinsForPublisherMatchIDs_sectionID_withHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getBulletinsForPublisherMatchIDs:sectionID:withHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (BBServer)server
{
  return (BBServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (void)setServer:(id)a3
{
  objc_storeWeak((id *)&self->_server, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (void)setCalloutQueue:(id)a3
{
  objc_storeStrong((id *)&self->_calloutQueue, a3);
}

- (NSMutableDictionary)bulletinIDsToTransaction
{
  return self->_bulletinIDsToTransaction;
}

- (void)setBulletinIDsToTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_bulletinIDsToTransaction, a3);
}

- (void)setClientBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bulletinIDsToTransaction, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
