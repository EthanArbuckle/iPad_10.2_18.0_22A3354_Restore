@implementation HMServiceDaemon

+ (id)sharedHMServiceDaemon
{
  if (sharedHMServiceDaemon_sOnce != -1)
    dispatch_once(&sharedHMServiceDaemon_sOnce, &__block_literal_global_1);
  return (id)sharedHMServiceDaemon_sSelf;
}

void __40__HMServiceDaemon_sharedHMServiceDaemon__block_invoke()
{
  HMServiceDaemon *v0;
  void *v1;

  v0 = objc_alloc_init(HMServiceDaemon);
  v1 = (void *)sharedHMServiceDaemon_sSelf;
  sharedHMServiceDaemon_sSelf = (uint64_t)v0;

}

- (HMServiceDaemon)init
{
  HMServiceDaemon *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *dispatchQueue;
  HMServiceDaemon *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMServiceDaemon;
  v2 = -[HMServiceDaemon init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.HMService.daemon.queue", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }

  return v2;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__HMServiceDaemon_activate__block_invoke;
  block[3] = &unk_250EBAE60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __27__HMServiceDaemon_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_HMServiceDaemon <= 30
    && (gLogCategory_HMServiceDaemon != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  NSXPCListener *v3;
  NSXPCListener *xpcListener;
  void *v5;
  id v6;

  if (!self->_xpcListener)
  {
    v3 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.HearingModeService"));
    xpcListener = self->_xpcListener;
    self->_xpcListener = v3;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    -[NSXPCListener resume](self->_xpcListener, "resume");
  }
  +[HMDeviceManager sharedInstance](HMDeviceManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDispatchQueue:", self->_dispatchQueue);

  +[HMDeviceManager sharedInstance](HMDeviceManager, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activate");

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__HMServiceDaemon_invalidate__block_invoke;
  block[3] = &unk_250EBAE60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __29__HMServiceDaemon_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  +[HMDeviceManager sharedInstance](HMDeviceManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  HMServiceXPCConnection *v7;
  NSMutableSet *xpcConnections;
  NSMutableSet *v9;
  NSMutableSet *v10;
  void *v11;
  _QWORD v13[6];

  v5 = a4;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256D1B4B0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(HMServiceXPCConnection);
  -[HMServiceXPCConnection setDaemon:](v7, "setDaemon:", self);
  -[HMServiceXPCConnection setDispatchQueue:](v7, "setDispatchQueue:", self->_dispatchQueue);
  -[HMServiceXPCConnection setXpcCnx:](v7, "setXpcCnx:", v5);
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v10 = self->_xpcConnections;
    self->_xpcConnections = v9;

    xpcConnections = self->_xpcConnections;
  }
  -[NSMutableSet addObject:](xpcConnections, "addObject:", v7);
  objc_msgSend(v5, "_setQueue:", self->_dispatchQueue);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256D1A900);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v11);

  objc_msgSend(v5, "setExportedObject:", v7);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __54__HMServiceDaemon_listener_shouldAcceptNewConnection___block_invoke;
  v13[3] = &unk_250EBAE38;
  v13[4] = self;
  v13[5] = v7;
  objc_msgSend(v5, "setInvalidationHandler:", v13);
  objc_msgSend(v5, "setRemoteObjectInterface:", v6);
  objc_msgSend(v5, "resume");
  if (gLogCategory_HMServiceDaemon <= 20
    && (gLogCategory_HMServiceDaemon != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v5, "processIdentifier");
    LogPrintF();
  }

  return 1;
}

uint64_t __54__HMServiceDaemon_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_xpcConnectionInvalidated:", *(_QWORD *)(a1 + 40));
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (gLogCategory_HMServiceDaemon <= 20)
  {
    if (gLogCategory_HMServiceDaemon != -1 || (v6 = _LogCategory_Initialize(), v4 = v8, v6))
    {
      objc_msgSend(v4, "xpcCnx");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "processIdentifier");
      LogPrintF();

      v4 = v8;
    }
  }
  objc_msgSend(v4, "xpcConnectionInvalidated", v7);
  -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v8);
  -[HMServiceDaemon _update](self, "_update");

}

- (void)_modifyDeviceConfig:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[HMDeviceManager sharedInstance](HMDeviceManager, "sharedInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_modifyDeviceConfiguration:identifier:completion:", v9, v8, v7);

}

- (void)reportDeviceRecordChange:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__HMServiceDaemon_reportDeviceRecordChange___block_invoke;
  v7[3] = &unk_250EBAE38;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __44__HMServiceDaemon_reportDeviceRecordChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reportDeviceRecordChange:", *(_QWORD *)(a1 + 40));
}

- (void)_reportDeviceRecordChange:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_xpcConnections;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v10, "hearingModeClient", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v10, "clientReportHMDeviceRecordChanged:", v4);

      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)reportDeviceRecordLost:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__HMServiceDaemon_reportDeviceRecordLost___block_invoke;
  v7[3] = &unk_250EBAE38;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __42__HMServiceDaemon_reportDeviceRecordLost___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reportDeviceRecordLost:", *(_QWORD *)(a1 + 40));
}

- (void)_reportDeviceRecordLost:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_xpcConnections;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "clientReportHMDeviceRecordLost:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)reportDiagnosticRecordChange:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_xpcConnections;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "hearingModeClient", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "internalFlags");

        if ((v12 & 1) != 0)
          objc_msgSend(v10, "clientReportDiagnosticRecord:", v4);
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)_triggerDiagnosticCheckForIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[HMDeviceManager sharedInstance](HMDeviceManager, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_triggerDiagnosticCheckForIdentifier:completion:", v6, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
