@implementation ADAttributionService

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  ADAttributionService *v16;
  void *v17;
  ADAttributionRequester *v18;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v22 = 0u;
  v23 = 0u;
  if (v7)
    objc_msgSend(v7, "auditToken");
  if (!ba_is_process_extension())
  {
    v11 = (void *)MEMORY[0x24BE80C78];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v8, "processIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v11, "handleForIdentifier:error:", v12, &v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v21;
    objc_msgSend(v13, "bundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleInfoValueForKey:", *MEMORY[0x24BDBD288]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] Error %@ getting bundleID from RunningBoardServices."), objc_opt_class(), v9);
    }
    else
    {
      if (objc_msgSend(v15, "length"))
      {
        v16 = self;
        objc_sync_enter(v16);
        ++_requestTokenCount;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[ADAttributionRequester initWithConnection:bundleID:transactionID:]([ADAttributionRequester alloc], "initWithConnection:bundleID:transactionID:", v8, v15, v17);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v16->_clients, "setObject:forKeyedSubscript:", v18, v17);

        objc_sync_exit(v16);
        v10 = 1;
        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: Received a connection from an app with no bundleID: %@"), v15, v20);
    }
    v16 = (ADAttributionService *)objc_claimAutoreleasedReturnValue();
    _ADLog();
    v10 = 0;
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Calls from background extensions are not supported"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  _ADLog();
  v10 = 0;
LABEL_11:

  return v10;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__ADAttributionService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken != -1)
    dispatch_once(&sharedInstance__onceToken, block);
  return (id)sharedInstance__instance;
}

void __38__ADAttributionService_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance__instance;
  sharedInstance__instance = (uint64_t)v0;

}

- (ADAttributionService)init
{
  ADAttributionService *v2;
  uint64_t v3;
  NSMutableDictionary *clients;
  uint64_t v5;
  NSXPCListener *listener;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ADAttributionService;
  v2 = -[ADAttributionService init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    clients = v2->_clients;
    v2->_clients = (NSMutableDictionary *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.ap.adprivacyd.attribution"));
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v5;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
  }
  return v2;
}

- (void)removeClientForToken:(id)a3
{
  ADAttributionService *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v6)
  {
    -[NSMutableDictionary removeObjectForKey:](v4->_clients, "removeObjectForKey:");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: We tried to remove a nil Attribution token from the list of clients."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  objc_sync_exit(v4);

}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 8, 1);
}

- (void)setListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_storeStrong((id *)&self->_clients, a3);
}

- (NSNumber)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(id)a3
{
  objc_storeStrong((id *)&self->_transactionID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionID, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
