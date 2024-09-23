@implementation CUBLEServer

- (CUBLEServer)init
{
  CUBLEServer *v2;
  CUBLEServer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUBLEServer;
  v2 = -[CUBLEServer init](&v5, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUBLEServer;
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  LogCategory *ucat;
  objc_super v4;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUBLEServer;
  -[CUBLEServer dealloc](&v4, sel_dealloc);
}

- (void)setLabel:(id)a3
{
  id v5;
  uint64_t *p_ucat;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  objc_storeStrong((id *)&self->_label, a3);
  v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  v7 = qword_1EE0667B8;
  v14 = objc_retainAutorelease(v5);
  objc_msgSend(v14, "UTF8String");
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);

}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__CUBLEServer_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E25DE600;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_activateWithCompletion:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  LogCategory *v17;
  CBPeripheralManager *v18;
  CBPeripheralManager *peripheralManager;
  LogCategory *ucat;
  void *v21;
  id activateCompletion;
  uint64_t v23;
  void (**aBlock)(void);

  aBlock = (void (**)(void))a3;
  if (self->_peripheralManager)
  {
    v10 = "Activate already called";
    v11 = 4294960575;
    goto LABEL_3;
  }
  v18 = (CBPeripheralManager *)objc_msgSend(objc_alloc(getCBPeripheralManagerClass_1578()), "initWithDelegate:queue:", self, self->_dispatchQueue);
  peripheralManager = self->_peripheralManager;
  self->_peripheralManager = v18;

  if (self->_peripheralManager)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          goto LABEL_16;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEServer _activateWithCompletion:]", 0x1Eu, (uint64_t)"Activate PSM 0x%04X\n", v6, v7, v8, v9, self->_listenPSM);
    }
LABEL_16:
    v21 = _Block_copy(aBlock);
    activateCompletion = self->_activateCompletion;
    self->_activateCompletion = v21;

    -[CUBLEServer _startIfNeeded](self, "_startIfNeeded");
    goto LABEL_17;
  }
  v10 = "Create CBPeripheralManager failed";
  v11 = 4294960596;
LABEL_3:
  NSErrorWithOSStatusF(v11, (uint64_t)v10, v4, v5, v6, v7, v8, v9, v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = self->_ucat;
  if (v17->var0 <= 90)
  {
    if (v17->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v17, 0x5Au))
        goto LABEL_11;
      v17 = self->_ucat;
    }
    LogPrintF((uint64_t)v17, (uint64_t)"-[CUBLEServer _activateWithCompletion:]", 0x5Au, (uint64_t)"### Activate failed: %{error}\n", v12, v13, v14, v15, (uint64_t)v16);
  }
LABEL_11:
  if (aBlock)
    aBlock[2]();

LABEL_17:
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__CUBLEServer_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  void (**v8)(void *, void *);
  id activateCompletion;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  CBPeripheralManager *peripheralManager;
  NSMutableSet *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void (**invalidationHandler)(void);
  id connectionStartedHandler;
  id connectionEndedHandler;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  LogCategory *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    ucat = self->_ucat;
    if (ucat->var0 > 30)
      goto LABEL_6;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
LABEL_6:
        v8 = (void (**)(void *, void *))_Block_copy(self->_activateCompletion);
        activateCompletion = self->_activateCompletion;
        self->_activateCompletion = 0;

        if (v8)
        {
          NSErrorWithOSStatusF(4294960573, (uint64_t)"Invalidated", v10, v11, v12, v13, v14, v15, v32);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v8[2](v8, v16);

        }
        if (self->_listeningPSM)
        {
          -[CBPeripheralManager unpublishL2CAPChannel:](self->_peripheralManager, "unpublishL2CAPChannel:");
          self->_listeningPSM = 0;
        }
        -[CBPeripheralManager setDelegate:](self->_peripheralManager, "setDelegate:", 0);
        peripheralManager = self->_peripheralManager;
        self->_peripheralManager = 0;

        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v18 = self->_connections;
        v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v33 != v21)
                objc_enumerationMutation(v18);
              objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "invalidate", (_QWORD)v32);
            }
            v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          }
          while (v20);
        }

        -[NSMutableSet removeAllObjects](self->_connections, "removeAllObjects");
        invalidationHandler = (void (**)(void))self->_invalidationHandler;
        if (invalidationHandler)
          invalidationHandler[2]();
        connectionStartedHandler = self->_connectionStartedHandler;
        self->_connectionStartedHandler = 0;

        connectionEndedHandler = self->_connectionEndedHandler;
        self->_connectionEndedHandler = 0;

        v26 = self->_invalidationHandler;
        self->_invalidationHandler = 0;

        v31 = self->_ucat;
        if (v31->var0 > 30)
          goto LABEL_23;
        if (v31->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v31, 0x1Eu))
            goto LABEL_23;
          v31 = self->_ucat;
        }
        LogPrintF((uint64_t)v31, (uint64_t)"-[CUBLEServer _invalidate]", 0x1Eu, (uint64_t)"Invalidated\n", v27, v28, v29, v30, v32);
LABEL_23:

        return;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEServer _invalidate]", 0x1Eu, (uint64_t)"Invalidate\n", v2, v3, v4, v5, v32);
    goto LABEL_6;
  }
}

- (void)_startIfNeeded
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  uint64_t v8;

  ucat = self->_ucat;
  if (ucat->var0 <= 9)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEServer _startIfNeeded]", 9u, (uint64_t)"StartIfNeeded\n", v2, v3, v4, v5, v8);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 9u))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  if (!self->_listeningPSM && -[CBPeripheralManager state](self->_peripheralManager, "state") == 5)
    -[CBPeripheralManager publishL2CAPChannel:requiresEncryption:](self->_peripheralManager, "publishL2CAPChannel:requiresEncryption:", self->_listenPSM, 0);
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  NSObject *dispatchQueue;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  LogCategory *ucat;
  const char *v12;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  v6 = objc_msgSend(v5, "state");

  ucat = self->_ucat;
  if (ucat->var0 > 30)
    goto LABEL_9;
  if (ucat->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      goto LABEL_9;
    ucat = self->_ucat;
  }
  if (v6 > 0xA)
    v12 = "?";
  else
    v12 = off_1E25DC628[v6];
  LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEServer peripheralManagerDidUpdateState:]", 0x1Eu, (uint64_t)"Bluetooth state changed: %s\n", v7, v8, v9, v10, (uint64_t)v12);
LABEL_9:
  if (v6 == 1)
  {
    self->_listeningPSM = 0;
  }
  else if (v6 == 5)
  {
    -[CUBLEServer _startIfNeeded](self, "_startIfNeeded");
  }
}

- (void)peripheralManager:(id)a3 didPublishL2CAPChannel:(unsigned __int16)a4 error:(id)a5
{
  unsigned int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  LogCategory *ucat;
  int var0;
  void (**v13)(void *, id);
  id activateCompletion;
  id v15;

  v5 = a4;
  v15 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  ucat = self->_ucat;
  var0 = ucat->var0;
  if (v15)
  {
    if (var0 > 90)
      goto LABEL_12;
    if (var0 != -1)
      goto LABEL_4;
    if (_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
    {
      ucat = self->_ucat;
LABEL_4:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEServer peripheralManager:didPublishL2CAPChannel:error:]", 0x5Au, (uint64_t)"### Publish L2CAP channel failed: %{error}\n", v7, v8, v9, v10, (uint64_t)v15);
    }
  }
  else
  {
    if (var0 > 30)
      goto LABEL_12;
    if (var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_12;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEServer peripheralManager:didPublishL2CAPChannel:error:]", 0x1Eu, (uint64_t)"Published L2CAP channel with PSM 0x%04X\n", v7, v8, v9, v10, v5);
  }
LABEL_12:
  self->_listeningPSM = v5;
  v13 = (void (**)(void *, id))_Block_copy(self->_activateCompletion);
  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  if (v13)
    v13[2](v13, v15);

}

- (void)peripheralManager:(id)a3 didUnpublishL2CAPChannel:(unsigned __int16)a4 error:(id)a5
{
  unsigned int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  LogCategory *ucat;
  id v12;

  v5 = a4;
  v12 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_5;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEServer peripheralManager:didUnpublishL2CAPChannel:error:]", 0x1Eu, (uint64_t)"Unpublished L2CAP channel with PSM 0x%04X: %{error}\n", v7, v8, v9, v10, v5);
  }
LABEL_5:

}

- (void)peripheralManager:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  LogCategory *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  LogCategory *ucat;
  int var0;
  unsigned int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CUBLEConnection *v27;
  CUBLEConnection *v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  NSMutableSet *connections;
  NSMutableSet *v36;
  NSMutableSet *v37;
  void (**connectionStartedHandler)(id, id);
  LogCategory *v39;
  uint64_t v40;
  void *v41;
  id v42;
  _QWORD v43[5];
  CUBLEConnection *v44;

  v7 = a4;
  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!v8)
  {
    v18 = v7;
    ucat = self->_ucat;
    var0 = ucat->var0;
    if (v18)
    {
      if (var0 > 30)
        goto LABEL_15;
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
        {
LABEL_15:
          v27 = objc_alloc_init(CUBLEConnection);
          -[CUBLEConnection setDispatchQueue:](v27, "setDispatchQueue:", self->_dispatchQueue);
          -[CUBLEConnection setL2capChannel:](v27, "setL2capChannel:", v18);
          if (self->_label)
            -[CUBLEConnection setLabel:](v27, "setLabel:");
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __59__CUBLEServer_peripheralManager_didOpenL2CAPChannel_error___block_invoke;
          v43[3] = &unk_1E25DE628;
          v43[4] = self;
          v28 = v27;
          v44 = v28;
          -[CUBLEConnection setServerInvalidationHandler:](v28, "setServerInvalidationHandler:", v43);
          v42 = 0;
          v29 = -[CUBLEConnection activateDirectAndReturnError:](v28, "activateDirectAndReturnError:", &v42);
          v34 = v42;
          if (v29)
          {
            connections = self->_connections;
            if (!connections)
            {
              v36 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
              v37 = self->_connections;
              self->_connections = v36;

              connections = self->_connections;
            }
            -[NSMutableSet addObject:](connections, "addObject:", v28);
            connectionStartedHandler = (void (**)(id, id))self->_connectionStartedHandler;
            if (connectionStartedHandler)
              connectionStartedHandler[2](connectionStartedHandler, v28);
            goto LABEL_29;
          }
          v39 = self->_ucat;
          if (v39->var0 <= 90)
          {
            if (v39->var0 == -1)
            {
              if (!_LogCategory_Initialize((uint64_t)v39, 0x5Au))
                goto LABEL_28;
              v39 = self->_ucat;
            }
            LogPrintF((uint64_t)v39, (uint64_t)"-[CUBLEServer peripheralManager:didOpenL2CAPChannel:error:]", 0x5Au, (uint64_t)"### Activate accepted connection failed: %{error}\n", v30, v31, v32, v33, (uint64_t)v34);
          }
LABEL_28:
          -[CUBLEConnection invalidate](v28, "invalidate");
LABEL_29:

          goto LABEL_30;
        }
        ucat = self->_ucat;
      }
      v21 = objc_msgSend(v18, "PSM");
      objc_msgSend(v18, "peer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "identifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEServer peripheralManager:didOpenL2CAPChannel:error:]", 0x1Eu, (uint64_t)"L2CAP channel opened PSM 0x%04X, peer %@: %{error}\n", v23, v24, v25, v26, v21);

      goto LABEL_15;
    }
    if (var0 <= 90)
    {
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au))
          goto LABEL_30;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEServer peripheralManager:didOpenL2CAPChannel:error:]", 0x5Au, (uint64_t)"### L2CAP open channel null\n", v14, v15, v16, v17, v40);
    }
LABEL_30:

    goto LABEL_31;
  }
  v13 = self->_ucat;
  if (v13->var0 <= 90)
  {
    if (v13->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v13, 0x5Au))
        goto LABEL_31;
      v13 = self->_ucat;
    }
    LogPrintF((uint64_t)v13, (uint64_t)"-[CUBLEServer peripheralManager:didOpenL2CAPChannel:error:]", 0x5Au, (uint64_t)"### L2CAP open channel failed: %{error}\n", v9, v10, v11, v12, (uint64_t)v8);
  }
LABEL_31:

}

- (void)_handleConnectionInvalidated:(id)a3
{
  void *v4;
  LogCategory *ucat;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (**connectionEndedHandler)(id, id, _QWORD);
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "l2capChannel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      v6 = objc_msgSend(v4, "PSM");
      objc_msgSend(v4, "peer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEServer _handleConnectionInvalidated:]", 0x1Eu, (uint64_t)"Connection ended PSM 0x%04X, peer %@\n", v8, v9, v10, v11, v6);

      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  -[NSMutableSet removeObject:](self->_connections, "removeObject:", v14);
  connectionEndedHandler = (void (**)(id, id, _QWORD))self->_connectionEndedHandler;
  if (connectionEndedHandler)
    connectionEndedHandler[2](connectionEndedHandler, v14, 0);

}

- (id)connectionStartedHandler
{
  return self->_connectionStartedHandler;
}

- (void)setConnectionStartedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)connectionEndedHandler
{
  return self->_connectionEndedHandler;
}

- (void)setConnectionEndedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)label
{
  return self->_label;
}

- (unsigned)listenPSM
{
  return self->_listenPSM;
}

- (void)setListenPSM:(unsigned __int16)a3
{
  self->_listenPSM = a3;
}

- (unsigned)listeningPSM
{
  return self->_listeningPSM;
}

- (void)setListeningPSM:(unsigned __int16)a3
{
  self->_listeningPSM = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_connectionEndedHandler, 0);
  objc_storeStrong(&self->_connectionStartedHandler, 0);
  objc_storeStrong((id *)&self->_peripheralManager, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

uint64_t __59__CUBLEServer_peripheralManager_didOpenL2CAPChannel_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleConnectionInvalidated:", *(_QWORD *)(a1 + 40));
}

uint64_t __25__CUBLEServer_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __38__CUBLEServer_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

@end
