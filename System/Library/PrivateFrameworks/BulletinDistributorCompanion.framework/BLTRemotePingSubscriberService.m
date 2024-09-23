@implementation BLTRemotePingSubscriberService

- (BLTRemotePingSubscriberService)initWithMachServiceName:(id)a3
{
  id v4;
  BLTRemotePingSubscriberService *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v7;
  NSString *machServiceName;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BLTRemotePingSubscriberService;
  v5 = -[BLTRemotePingSubscriberService init](&v10, sel_init);
  if (v5)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)BLTDaemonRestarted, CFSTR("BLTDaemonRestartedNotification"), 0, (CFNotificationSuspensionBehavior)0);
    v7 = objc_msgSend(v4, "copy");
    machServiceName = v5->_machServiceName;
    v5->_machServiceName = (NSString *)v7;

    -[BLTRemotePingSubscriberService _createXPCService](v5, "_createXPCService");
    -[BLTRemotePingSubscriberService _connect](v5, "_connect");
  }

  return v5;
}

- (void)_createXPCService
{
  NSXPCListener *v3;
  NSXPCListener *listener;

  if (self->_machServiceName)
  {
    -[NSXPCListener invalidate](self->_listener, "invalidate");
    v3 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", self->_machServiceName);
    listener = self->_listener;
    self->_listener = v3;

    -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
    -[NSXPCListener resume](self->_listener, "resume");
  }
}

- (void)_connect
{
  NSXPCConnection *v3;
  NSXPCConnection *connectionToServer;
  NSXPCConnection *v5;
  void *v6;
  NSXPCConnection *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[NSXPCConnection invalidate](self->_connectionToServer, "invalidate");
  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.bulletindistributord.server"), 4096);
  connectionToServer = self->_connectionToServer;
  self->_connectionToServer = v3;

  v5 = self->_connectionToServer;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254EFCDA0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](v5, "setExportedInterface:", v6);

  v7 = self->_connectionToServer;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254EF6888);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](v7, "setRemoteObjectInterface:", v8);

  -[NSXPCConnection setExportedObject:](self->_connectionToServer, "setExportedObject:", self);
  -[NSXPCConnection resume](self->_connectionToServer, "resume");
  if (self->_machServiceName)
  {
    -[NSXPCConnection exportedObject](self->_connectionToServer, "exportedObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subscribeWithMachServiceName:", self->_machServiceName);

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "subscriptionInfos");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[NSXPCConnection remoteObjectProxy](self->_connectionToServer, "remoteObjectProxy");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "sectionID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "subscribeToSectionID:forFullBulletins:withAck:ackAllowedOnLocalConnection:", v18, objc_msgSend(v16, "forBulletin"), objc_msgSend(v16, "canAck"), objc_msgSend(v16, "canAckOnLocalConnection"));

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  v19 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v19, "pingSubscriberDidLoad");

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)subscribeToSectionID:(id)a3 forFullBulletins:(BOOL)a4 withAck:(BOOL)a5 ackAllowedOnLocalConnection:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  NSXPCConnection *connectionToServer;
  id v10;
  id v11;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  connectionToServer = self->_connectionToServer;
  v10 = a3;
  -[NSXPCConnection remoteObjectProxy](connectionToServer, "remoteObjectProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "subscribeToSectionID:forFullBulletins:withAck:ackAllowedOnLocalConnection:", v10, v8, v7, v6);

}

- (BLTRemotePingSubscriberService)init
{
  return -[BLTRemotePingSubscriberService initWithMachServiceName:](self, "initWithMachServiceName:", 0);
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSXPCConnection *connectionToServer;
  NSXPCConnection *connectionFromServer;
  objc_super v6;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("BLTDaemonRestartedNotification"), 0);
  -[NSXPCConnection invalidate](self->_connectionToServer, "invalidate");
  connectionToServer = self->_connectionToServer;
  self->_connectionToServer = 0;

  -[NSXPCConnection invalidate](self->_connectionFromServer, "invalidate");
  connectionFromServer = self->_connectionFromServer;
  self->_connectionFromServer = 0;

  v6.receiver = self;
  v6.super_class = (Class)BLTRemotePingSubscriberService;
  -[BLTRemotePingSubscriberService dealloc](&v6, sel_dealloc);
}

- (void)unsubscribeFromSectionID:(id)a3
{
  NSXPCConnection *connectionToServer;
  id v4;
  id v5;

  connectionToServer = self->_connectionToServer;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](connectionToServer, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unsubscribeFromSectionID:", v4);

}

- (void)pingWithBulletin:(id)a3
{
  BLTPingSubscribing **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "pingWithBulletin:", v4);

}

- (void)pingWithBulletin:(id)a3 ack:(id)a4
{
  BLTPingSubscribing **p_delegate;
  id v6;
  id v7;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "pingWithBulletin:ack:", v7, v6);

}

- (void)pingWithRecordID:(id)a3 forSectionID:(id)a4
{
  BLTPingSubscribing **p_delegate;
  id v6;
  id v7;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "pingWithRecordID:forSectionID:", v7, v6);

}

- (void)pingWithRecordID:(id)a3 forSectionID:(id)a4 ack:(id)a5
{
  BLTPingSubscribing **p_delegate;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "pingWithRecordID:forSectionID:ack:", v10, v9, v8);

}

- (void)sendBulletinSummary:(id)a3
{
  NSXPCConnection *connectionToServer;
  id v4;
  id v5;

  connectionToServer = self->_connectionToServer;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](connectionToServer, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendBulletinSummary:", v4);

}

- (void)getWillNanoPresentNotificationForSectionID:(id)a3 completion:(id)a4
{
  NSXPCConnection *connectionToServer;
  id v6;
  id v7;
  id v8;

  connectionToServer = self->_connectionToServer;
  v6 = a4;
  v7 = a3;
  -[NSXPCConnection remoteObjectProxy](connectionToServer, "remoteObjectProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getWillNanoPresentNotificationForSectionID:completion:", v7, v6);

}

- (void)getWillNanoPresentNotificationForSectionID:(id)a3 subsectionIDs:(id)a4 completion:(id)a5
{
  NSXPCConnection *connectionToServer;
  id v8;
  id v9;
  id v10;
  id v11;

  connectionToServer = self->_connectionToServer;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[NSXPCConnection remoteObjectProxy](connectionToServer, "remoteObjectProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getWillNanoPresentNotificationForSectionID:subsectionIDs:completion:", v10, v9, v8);

}

- (void)subscribeWithMachServiceName:(id)a3
{
  NSString *v4;
  NSString *machServiceName;
  id v6;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  machServiceName = self->_machServiceName;
  self->_machServiceName = v4;

  -[BLTRemotePingSubscriberService _createXPCService](self, "_createXPCService");
  -[NSXPCConnection remoteObjectProxy](self->_connectionToServer, "remoteObjectProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subscribeWithMachServiceName:", self->_machServiceName);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSXPCConnection *connectionFromServer;
  void *v10;
  NSXPCConnection *v11;
  void *v12;
  NSXPCConnection *v13;
  uint64_t v14;
  NSXPCConnection *v15;
  BOOL v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.bulletindistributor.remotepingsubscriber"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v8, "BOOLValue") & 1) != 0)
  {
    objc_storeStrong((id *)&self->_connectionFromServer, a4);
    -[NSXPCConnection setExportedObject:](self->_connectionFromServer, "setExportedObject:", self);
    connectionFromServer = self->_connectionFromServer;
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254EFCDA0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](connectionFromServer, "setExportedInterface:", v10);

    v11 = self->_connectionFromServer;
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254EF6888);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v11, "setRemoteObjectInterface:", v12);

    objc_initWeak(&location, self);
    v13 = self->_connectionFromServer;
    v14 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __69__BLTRemotePingSubscriberService_listener_shouldAcceptNewConnection___block_invoke;
    v21[3] = &unk_24D761DC0;
    objc_copyWeak(&v22, &location);
    -[NSXPCConnection setInvalidationHandler:](v13, "setInvalidationHandler:", v21);
    v15 = self->_connectionFromServer;
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __69__BLTRemotePingSubscriberService_listener_shouldAcceptNewConnection___block_invoke_2;
    v19[3] = &unk_24D761DC0;
    objc_copyWeak(&v20, &location);
    -[NSXPCConnection setInterruptionHandler:](v15, "setInterruptionHandler:", v19);
    -[NSXPCConnection resume](self->_connectionFromServer, "resume");
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    v16 = 1;
  }
  else
  {
    blt_general_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[BLTRemotePingSubscriberService listener:shouldAcceptNewConnection:].cold.1((uint64_t)CFSTR("com.apple.bulletindistributor.remotepingsubscriber"), v17);

    v16 = 0;
  }

  return v16;
}

void __69__BLTRemotePingSubscriberService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setConnectionFromServer:", 0);

}

void __69__BLTRemotePingSubscriberService_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setConnectionFromServer:", 0);

}

- (BLTPingSubscribing)delegate
{
  return (BLTPingSubscribing *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSXPCConnection)connectionToServer
{
  return self->_connectionToServer;
}

- (void)setConnectionToServer:(id)a3
{
  objc_storeStrong((id *)&self->_connectionToServer, a3);
}

- (NSXPCConnection)connectionFromServer
{
  return self->_connectionFromServer;
}

- (void)setConnectionFromServer:(id)a3
{
  objc_storeStrong((id *)&self->_connectionFromServer, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (void)setMachServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connectionFromServer, 0);
  objc_storeStrong((id *)&self->_connectionToServer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)listener:(uint64_t)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2173D9000, a2, OS_LOG_TYPE_ERROR, "No entitlement %@", (uint8_t *)&v2, 0xCu);
}

@end
