@implementation DSXPCServer

- (DSXPCServer)init
{
  DSXPCServer *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DSXPCServer;
  v2 = -[DSXPCServer init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.distributedsensingd", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

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
  block[2] = __23__DSXPCServer_activate__block_invoke;
  block[3] = &unk_24D9109C0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __23__DSXPCServer_activate__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    *(_BYTE *)(v1 + 8) = 1;
    return objc_msgSend(*(id *)(result + 32), "_activate");
  }
  return result;
}

- (void)_activate
{
  NSObject *v3;
  OS_xpc_object *mach_service;
  OS_xpc_object *xpcListener;
  OS_xpc_object *v6;
  DSDeviceContext *v7;
  DSDeviceContext *myDeviceContext;
  DSCohortManager *v9;
  DSCohortManager *cohortManager;
  _QWORD handler[5];
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (onceTokenDSXPCServer != -1)
    dispatch_once(&onceTokenDSXPCServer, &__block_literal_global_0);
  v3 = logObjDSXPCServer;
  if (os_log_type_enabled((os_log_t)logObjDSXPCServer, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217E3C000, v3, OS_LOG_TYPE_DEFAULT, "Activate", buf, 2u);
  }
  if (!self->_xpcListener)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.distributedsensingd", (dispatch_queue_t)self->_dispatchQueue, 1uLL);
    xpcListener = self->_xpcListener;
    self->_xpcListener = mach_service;

    v6 = self->_xpcListener;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __24__DSXPCServer__activate__block_invoke;
    handler[3] = &unk_24D9109E8;
    handler[4] = self;
    xpc_connection_set_event_handler(v6, handler);
    xpc_connection_activate(self->_xpcListener);
  }
  if (!self->_myDeviceContext)
  {
    v7 = objc_alloc_init(DSDeviceContext);
    myDeviceContext = self->_myDeviceContext;
    self->_myDeviceContext = v7;

    -[DSDeviceContext setIsMe:](self->_myDeviceContext, "setIsMe:", 1);
  }
  if (!self->_cohortManager)
  {
    v9 = objc_alloc_init(DSCohortManager);
    cohortManager = self->_cohortManager;
    self->_cohortManager = v9;

    -[DSCohortManager setDispatchQueue:](self->_cohortManager, "setDispatchQueue:", self->_dispatchQueue);
    -[DSCohortManager setXpcDaemonServer:](self->_cohortManager, "setXpcDaemonServer:", self);
  }
}

uint64_t __24__DSXPCServer__activate__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receivedXPCObject:", a2);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__DSXPCServer_invalidate__block_invoke;
  block[3] = &unk_24D9109C0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __25__DSXPCServer_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  NSObject *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  DSDeviceContext *myDeviceContext;
  DSCohortManager *cohortManager;
  NSMutableSet *xpcConnections;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (onceTokenDSXPCServer != -1)
    dispatch_once(&onceTokenDSXPCServer, &__block_literal_global_0);
  v3 = logObjDSXPCServer;
  if (os_log_type_enabled((os_log_t)logObjDSXPCServer, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217E3C000, v3, OS_LOG_TYPE_DEFAULT, "Invalidate", buf, 2u);
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_xpcConnections;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "invalidate", (_QWORD)v12);
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v6);
  }

  myDeviceContext = self->_myDeviceContext;
  if (myDeviceContext)
  {
    self->_myDeviceContext = 0;

  }
  cohortManager = self->_cohortManager;
  if (cohortManager)
  {
    self->_cohortManager = 0;

  }
  -[DSXPCServer _ensureScannerStopped](self, "_ensureScannerStopped", (_QWORD)v12);
  -[DSXPCServer _ensureAdvertiserStopped](self, "_ensureAdvertiserStopped");
  -[NSMutableSet removeAllObjects](self->_xpcConnections, "removeAllObjects");
  xpcConnections = self->_xpcConnections;
  self->_xpcConnections = 0;

}

- (void)_receivedXPCObject:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (MEMORY[0x219A18A58]() == MEMORY[0x24BDACF88])
  {
    -[DSXPCServer _handleXPCConnection:](self, "_handleXPCConnection:", v4);
  }
  else if (v4 == (id)MEMORY[0x24BDACF38])
  {
    if (onceTokenDSXPCServer != -1)
      dispatch_once(&onceTokenDSXPCServer, &__block_literal_global_0);
    v7 = logObjDSXPCServer;
    if (os_log_type_enabled((os_log_t)logObjDSXPCServer, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_217E3C000, v7, OS_LOG_TYPE_ERROR, "XPC Listener invalidated", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    if (onceTokenDSXPCServer != -1)
      dispatch_once(&onceTokenDSXPCServer, &__block_literal_global_0);
    v5 = (void *)logObjDSXPCServer;
    if (os_log_type_enabled((os_log_t)logObjDSXPCServer, OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      v8 = 136315138;
      v9 = MEMORY[0x219A18998](v4);
      _os_log_impl(&dword_217E3C000, v6, OS_LOG_TYPE_ERROR, "XPC Listener error, received XPC object :%s", (uint8_t *)&v8, 0xCu);

    }
  }

}

- (void)_handleXPCConnection:(id)a3
{
  NSObject *dispatchQueue;
  _xpc_connection_s *v5;
  NSMutableSet *xpcConnections;
  NSMutableSet *v7;
  NSMutableSet *v8;
  DSXPCConnection *v9;

  dispatchQueue = self->_dispatchQueue;
  v5 = (_xpc_connection_s *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  v9 = objc_alloc_init(DSXPCConnection);
  -[DSXPCConnection setXpcDaemonServer:](v9, "setXpcDaemonServer:", self);
  -[DSXPCConnection setDispatchQueue:](v9, "setDispatchQueue:", self->_dispatchQueue);
  -[DSXPCConnection setPid:](v9, "setPid:", xpc_connection_get_pid(v5));
  -[DSXPCConnection setXpcConnection:](v9, "setXpcConnection:", v5);

  -[DSXPCConnection activate](v9, "activate");
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v8 = self->_xpcConnections;
    self->_xpcConnections = v7;

    xpcConnections = self->_xpcConnections;
  }
  -[NSMutableSet addObject:](xpcConnections, "addObject:", v9);

}

- (void)removeXPCConnection:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v4);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_xpcConnections;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v6)
  {

    -[DSDeviceContext setCoordinationStatus:](self->_myDeviceContext, "setCoordinationStatus:", 0, (_QWORD)v15);
    -[DSDeviceContext setTiebreaker:](self->_myDeviceContext, "setTiebreaker:", 0);
LABEL_16:
    -[DSDeviceContext setVehicleState:](self->_myDeviceContext, "setVehicleState:", 0);
    -[DSDeviceContext setVehicleConfidence:](self->_myDeviceContext, "setVehicleConfidence:", 0);
    goto LABEL_17;
  }
  v7 = v6;
  v8 = *(_QWORD *)v16;
  v9 = 1;
  v10 = 1;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
      objc_msgSend(v12, "kappaSession", (_QWORD)v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v9 = 0;
      }
      else
      {
        objc_msgSend(v12, "motionSession");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v10 &= v14 == 0;
      }
    }
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v7);

  if ((v9 & 1) != 0)
  {
    -[DSDeviceContext setCoordinationStatus:](self->_myDeviceContext, "setCoordinationStatus:", 0);
    -[DSDeviceContext setTiebreaker:](self->_myDeviceContext, "setTiebreaker:", 0);
  }
  if ((v10 & 1) != 0)
    goto LABEL_16;
LABEL_17:
  -[DSXPCServer updateScanner](self, "updateScanner");
  -[DSXPCServer updateAdvertiser](self, "updateAdvertiser");

}

- (void)updateAdvertiser
{
  DSDeviceContext *v3;
  int v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  *(_WORD *)&self->_shouldAdvertiseDSInfo = 0;
  v3 = self->_myDeviceContext;
  if (-[DSDeviceContext coordinationStatus](v3, "coordinationStatus"))
    self->_shouldAdvertiseDSAction = 1;
  v4 = -[DSDeviceContext vehicleState](v3, "vehicleState");

  if (v4 == 1)
    self->_shouldAdvertiseDSInfo = 1;
  if (self->_shouldAdvertiseDSAction || self->_shouldAdvertiseDSInfo)
    -[DSXPCServer _ensureAdvertiserStarted](self, "_ensureAdvertiserStarted");
  else
    -[DSXPCServer _ensureAdvertiserStopped](self, "_ensureAdvertiserStopped");
}

- (void)_ensureAdvertiserStarted
{
  NSObject *v3;
  DSAdvertiseManager *v4;
  uint64_t v5;
  uint8_t v6[16];

  if (onceTokenDSXPCServer != -1)
    dispatch_once(&onceTokenDSXPCServer, &__block_literal_global_0);
  v3 = logObjDSXPCServer;
  if (os_log_type_enabled((os_log_t)logObjDSXPCServer, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_217E3C000, v3, OS_LOG_TYPE_DEFAULT, "Ensure Advertiser Started", v6, 2u);
  }
  v4 = self->_advertiseManager;
  if (!v4)
  {
    v4 = objc_alloc_init(DSAdvertiseManager);
    -[DSAdvertiseManager setDispatchQueue:](v4, "setDispatchQueue:", self->_dispatchQueue);
    -[DSAdvertiseManager setXpcDaemonServer:](v4, "setXpcDaemonServer:", self);
    objc_storeStrong((id *)&self->_advertiseManager, v4);
  }
  if (self->_shouldAdvertiseDSAction)
    v5 = (2 * self->_shouldAdvertiseDSInfo) | 4;
  else
    v5 = 2 * self->_shouldAdvertiseDSInfo;
  -[DSAdvertiseManager setDsAdvertiseFlags:](v4, "setDsAdvertiseFlags:", v5);
  -[DSAdvertiseManager startAdvertising](v4, "startAdvertising");

}

- (void)_ensureAdvertiserStopped
{
  NSObject *v3;
  DSAdvertiseManager *advertiseManager;
  DSAdvertiseManager *v5;
  uint8_t v6[16];

  if (onceTokenDSXPCServer != -1)
    dispatch_once(&onceTokenDSXPCServer, &__block_literal_global_0);
  v3 = logObjDSXPCServer;
  if (os_log_type_enabled((os_log_t)logObjDSXPCServer, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_217E3C000, v3, OS_LOG_TYPE_DEFAULT, "Ensure Advertiser Stopped", v6, 2u);
  }
  advertiseManager = self->_advertiseManager;
  if (advertiseManager)
  {
    -[DSAdvertiseManager stopAdvertising](advertiseManager, "stopAdvertising");
    v5 = self->_advertiseManager;
    self->_advertiseManager = 0;

  }
}

- (void)updateScanner
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  BOOL *p_shouldScanDSAction;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  *(_WORD *)&self->_shouldScanDSInfo = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_xpcConnections;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "kappaSession", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        p_shouldScanDSAction = &self->_shouldScanDSAction;
        if (!v9)
        {
          objc_msgSend(v8, "motionSession");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          p_shouldScanDSAction = &self->_shouldScanDSInfo;
          if (!v11)
            continue;
        }
        *p_shouldScanDSAction = 1;
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  if (self->_shouldScanDSAction || self->_shouldScanDSInfo)
    -[DSXPCServer _ensureScannerStarted](self, "_ensureScannerStarted", (_QWORD)v12);
  else
    -[DSXPCServer _ensureScannerStopped](self, "_ensureScannerStopped");
}

- (void)_ensureScannerStarted
{
  NSObject *v3;
  DSScanManager *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[5];
  uint8_t buf[16];

  if (onceTokenDSXPCServer != -1)
    dispatch_once(&onceTokenDSXPCServer, &__block_literal_global_0);
  v3 = logObjDSXPCServer;
  if (os_log_type_enabled((os_log_t)logObjDSXPCServer, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217E3C000, v3, OS_LOG_TYPE_DEFAULT, "Ensure Scanner Started", buf, 2u);
  }
  v4 = self->_scanManager;
  if (!v4)
  {
    v4 = objc_alloc_init(DSScanManager);
    -[DSScanManager setDispatchQueue:](v4, "setDispatchQueue:", self->_dispatchQueue);
    v5 = MEMORY[0x24BDAC760];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __36__DSXPCServer__ensureScannerStarted__block_invoke;
    v8[3] = &unk_24D910A10;
    v8[4] = self;
    -[DSScanManager setDeviceFoundHandler:](v4, "setDeviceFoundHandler:", v8);
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __36__DSXPCServer__ensureScannerStarted__block_invoke_2;
    v7[3] = &unk_24D910A10;
    v7[4] = self;
    -[DSScanManager setDeviceLostHandler:](v4, "setDeviceLostHandler:", v7);
    objc_storeStrong((id *)&self->_scanManager, v4);
  }
  if (self->_shouldScanDSAction)
    v6 = (2 * self->_shouldScanDSInfo) | 4;
  else
    v6 = 2 * self->_shouldScanDSInfo;
  -[DSScanManager setDsScanFlags:](v4, "setDsScanFlags:", v6);
  -[DSScanManager startScanning](v4, "startScanning");

}

uint64_t __36__DSXPCServer__ensureScannerStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deviceFoundHandler:", a2);
}

uint64_t __36__DSXPCServer__ensureScannerStarted__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deviceLostHandler:", a2);
}

- (void)_ensureScannerStopped
{
  NSObject *v3;
  DSScanManager *scanManager;
  DSScanManager *v5;
  uint8_t v6[16];

  if (onceTokenDSXPCServer != -1)
    dispatch_once(&onceTokenDSXPCServer, &__block_literal_global_0);
  v3 = logObjDSXPCServer;
  if (os_log_type_enabled((os_log_t)logObjDSXPCServer, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_217E3C000, v3, OS_LOG_TYPE_DEFAULT, "Ensure Scanner Stopped", v6, 2u);
  }
  scanManager = self->_scanManager;
  if (scanManager)
  {
    -[DSScanManager stopScanning](scanManager, "stopScanning");
    v5 = self->_scanManager;
    self->_scanManager = 0;

  }
}

- (void)_deviceFoundHandler:(id)a3
{
  DSCohortManager *cohortManager;

  cohortManager = self->_cohortManager;
  if (cohortManager)
    -[DSCohortManager deviceFound:](cohortManager, "deviceFound:", a3);
}

- (void)_deviceLostHandler:(id)a3
{
  DSCohortManager *cohortManager;

  cohortManager = self->_cohortManager;
  if (cohortManager)
    -[DSCohortManager deviceLost:](cohortManager, "deviceLost:", a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSMutableSet)xpcConnections
{
  return self->_xpcConnections;
}

- (DSDeviceContext)myDeviceContext
{
  return self->_myDeviceContext;
}

- (void)setMyDeviceContext:(id)a3
{
  objc_storeStrong((id *)&self->_myDeviceContext, a3);
}

- (DSCohortManager)cohortManager
{
  return self->_cohortManager;
}

- (void)setCohortManager:(id)a3
{
  objc_storeStrong((id *)&self->_cohortManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cohortManager, 0);
  objc_storeStrong((id *)&self->_myDeviceContext, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_advertiseManager, 0);
  objc_storeStrong((id *)&self->_scanManager, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

@end
