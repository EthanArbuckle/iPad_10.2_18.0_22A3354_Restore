@implementation IAPClientPortManager

- (IAPClientPortManager)init
{
  IAPClientPortManager *v2;
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IAPClientPortManager;
  v2 = -[IAPClientPortManager init](&v6, sel_init);
  if (v2)
  {
    v2->_portList = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_iaptransportdIsRunning = iaptransportdHasLaunched();
    v2->_portListQueue = (OS_dispatch_queue *)dispatch_queue_create("IAPClientPortManagerQueue", 0);
    v2->_iaptransportdXPCConnection = 0;
    v2->_iaptransportdXPCConnection = (OS_xpc_object *)RetainConnectionToIAPTransportDaemon();
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)__iaptransportdDied, CFSTR("kIAPTransportServerDiedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__iaptransportdLaunched, CFSTR("kIAPTransportServerLaunchedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *DarwinNotifyCenter;
  OS_xpc_object *iaptransportdXPCConnection;
  objc_super v6;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, 0, CFSTR("kIAPTransportServerDiedNotification"), 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0, CFSTR("kIAPTransportServerLaunchedNotification"), 0);
  iaptransportdXPCConnection = self->_iaptransportdXPCConnection;
  if (iaptransportdXPCConnection)
  {
    xpc_release(iaptransportdXPCConnection);
    self->_iaptransportdXPCConnection = 0;
  }
  dispatch_sync((dispatch_queue_t)self->_portListQueue, &__block_literal_global_30);
  dispatch_release((dispatch_object_t)self->_portListQueue);
  -[NSMutableDictionary removeAllObjects](self->_portList, "removeAllObjects");

  v6.receiver = self;
  v6.super_class = (Class)IAPClientPortManager;
  -[IAPClientPortManager dealloc](&v6, sel_dealloc);
}

- (BOOL)iaptransportdIsRunning
{
  NSObject *portListQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = -86;
  portListQueue = self->_portListQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__IAPClientPortManager_iaptransportdIsRunning__block_invoke;
  v5[3] = &unk_1E6931528;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(portListQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__IAPClientPortManager_iaptransportdIsRunning__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

- (void)setIaptransportdIsRunning:(BOOL)a3
{
  NSObject *portListQueue;
  _QWORD v4[5];
  BOOL v5;

  portListQueue = self->_portListQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__IAPClientPortManager_setIaptransportdIsRunning___block_invoke;
  v4[3] = &unk_1E6931550;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(portListQueue, v4);
}

uint64_t __50__IAPClientPortManager_setIaptransportdIsRunning___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  NSLog(CFSTR("_iaptransportdIsRunning %d -> %d"), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 24), *(unsigned __int8 *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = *(_BYTE *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  if (*(_BYTE *)(v2 + 24))
  {
    if (v3)
    {
      xpc_release(v3);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
    }
    result = RetainConnectionToIAPTransportDaemon();
  }
  else
  {
    xpc_release(v3);
    result = 0;
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = result;
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global_32);
  return (id)sharedInstance_sharedInstance;
}

IAPClientPortManager *__38__IAPClientPortManager_sharedInstance__block_invoke()
{
  IAPClientPortManager *result;

  result = objc_alloc_init(IAPClientPortManager);
  sharedInstance_sharedInstance = (uint64_t)result;
  return result;
}

- (void)sendData:(id)a3 data:(char *)a4 length:(unsigned __int16)a5
{
  NSObject *portListQueue;
  _QWORD v6[7];
  unsigned __int16 v7;

  portListQueue = self->_portListQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__IAPClientPortManager_sendData_data_length___block_invoke;
  v6[3] = &unk_1E69315A0;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v7 = a5;
  dispatch_sync(portListQueue, v6);
}

void __45__IAPClientPortManager_sendData_data_length___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD block[7];

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", *(_QWORD *)(a1 + 40));
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *(_QWORD *)(a1 + 48), *(unsigned __int16 *)(a1 + 56));
    v5 = v4;
    v6 = objc_msgSend(v3, "clientPortEventQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__IAPClientPortManager_sendData_data_length___block_invoke_2;
    block[3] = &unk_1E6931578;
    v7 = *(_QWORD *)(a1 + 40);
    block[4] = v3;
    block[5] = v7;
    block[6] = v4;
    dispatch_async(v6, block);

  }
}

void __45__IAPClientPortManager_sendData_data_length___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  __int128 v4;
  uint64_t v5;

  if (objc_msgSend(*(id *)(a1 + 32), "sendDataHandlerQueue"))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "sendDataHandlerQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__IAPClientPortManager_sendData_data_length___block_invoke_3;
    block[3] = &unk_1E6931578;
    v4 = *(_OWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 48);
    dispatch_async(v2, block);
  }
}

uint64_t __45__IAPClientPortManager_sendData_data_length___block_invoke_3(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "sendDataHandler");
  if (result)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "sendDataHandler");
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "bytes"), (unsigned __int16)objc_msgSend(*(id *)(a1 + 48), "length"));
  }
  return result;
}

- (int)registerSendDataHandler:(id)a3 queue:(id)a4 sendBlock:(id)a5
{
  NSObject *portListQueue;
  int v6;
  _QWORD block[9];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (a3 && a4 && a5)
  {
    portListQueue = self->_portListQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__IAPClientPortManager_registerSendDataHandler_queue_sendBlock___block_invoke;
    block[3] = &unk_1E69315C8;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    block[7] = a5;
    block[8] = &v9;
    dispatch_sync(portListQueue, block);
  }
  else if (!a3 || a4 || a5)
  {
    v12 = -536870206;
  }
  else
  {
    -[IAPClientPortManager unregisterSendDataHandler:](self, "unregisterSendDataHandler:");
  }
  v6 = *((_DWORD *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __64__IAPClientPortManager_registerSendDataHandler_queue_sendBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  IAPClientPort *v3;
  xpc_object_t v4;
  uint64_t v5;
  int v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 24))
  {
    if (*(_QWORD *)(v2 + 32))
    {
      v3 = -[IAPClientPort initWithUUID:queue:sendHandler:]([IAPClientPort alloc], "initWithUUID:queue:sendHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));

      v4 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v4, "requestType", "IAPClientPortRegisterStr");
      xpc_dictionary_set_string(v4, "IAPClientPortUUIDStr", (const char *)objc_msgSend(*(id *)(a1 + 40), "UTF8String"));
      xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 32), v4);
      xpc_release(v4);
      return;
    }
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v6 = -536870209;
  }
  else
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v6 = -536870185;
  }
  *(_DWORD *)(v5 + 24) = v6;
}

- (int)unregisterSendDataHandler:(id)a3
{
  NSObject *portListQueue;
  int v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  portListQueue = self->_portListQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__IAPClientPortManager_unregisterSendDataHandler___block_invoke;
  block[3] = &unk_1E69315F0;
  block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  dispatch_sync(portListQueue, block);
  v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __50__IAPClientPortManager_unregisterSendDataHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  xpc_object_t v3;
  uint64_t v4;
  int v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 24))
  {
    if (*(_QWORD *)(v2 + 32))
    {
      objc_msgSend(*(id *)(v2 + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
      v3 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v3, "requestType", "IAPClientPortUnregisterStr");
      xpc_dictionary_set_string(v3, "IAPClientPortUUIDStr", (const char *)objc_msgSend(*(id *)(a1 + 40), "UTF8String"));
      xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 32), v3);
      xpc_release(v3);
      return;
    }
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = -536870209;
  }
  else
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = -536870185;
  }
  *(_DWORD *)(v4 + 24) = v5;
}

- (int)forwardAccessoryDataToIAP:(id)a3 data:(const char *)a4 length:(unsigned __int16)a5
{
  NSObject *portListQueue;
  int v6;
  _QWORD block[8];
  unsigned __int16 v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  portListQueue = self->_portListQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__IAPClientPortManager_forwardAccessoryDataToIAP_data_length___block_invoke;
  block[3] = &unk_1E6931618;
  block[4] = self;
  block[5] = a3;
  v9 = a5;
  block[6] = &v10;
  block[7] = a4;
  dispatch_sync(portListQueue, block);
  v6 = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v6;
}

void __62__IAPClientPortManager_forwardAccessoryDataToIAP_data_length___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _QWORD block[7];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 24))
  {
    v3 = objc_msgSend(*(id *)(v2 + 8), "objectForKey:", *(_QWORD *)(a1 + 40));
    if (v3)
    {
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
      {
        v4 = (void *)v3;
        v5 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *(_QWORD *)(a1 + 56), *(unsigned __int16 *)(a1 + 64));
        v6 = v5;
        v7 = *(id *)(a1 + 40);
        v8 = objc_msgSend(v4, "clientPortEventQueue");
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __62__IAPClientPortManager_forwardAccessoryDataToIAP_data_length___block_invoke_2;
        block[3] = &unk_1E6931578;
        v9 = *(_QWORD *)(a1 + 32);
        block[4] = *(_QWORD *)(a1 + 40);
        block[5] = v5;
        block[6] = v9;
        dispatch_async(v8, block);
        return;
      }
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = -536870209;
    }
    else
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = -536870206;
    }
  }
  else
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = -536870185;
  }
  *(_DWORD *)(v10 + 24) = v11;
}

void __62__IAPClientPortManager_forwardAccessoryDataToIAP_data_length___block_invoke_2(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "requestType", "dataArrived");
  xpc_dictionary_set_string(v2, "IAPClientPortUUIDStr", (const char *)objc_msgSend(*(id *)(a1 + 32), "UTF8String"));
  xpc_dictionary_set_data(v2, "data", (const void *)objc_msgSend(*(id *)(a1 + 40), "bytes"), objc_msgSend(*(id *)(a1 + 40), "length"));
  xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 48) + 32), v2);
  xpc_release(v2);

}

- (void)reRegisterHandlers
{
  NSObject *portListQueue;
  _QWORD block[5];

  portListQueue = self->_portListQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__IAPClientPortManager_reRegisterHandlers__block_invoke;
  block[3] = &unk_1E6931228;
  block[4] = self;
  dispatch_sync(portListQueue, block);
}

uint64_t __42__IAPClientPortManager_reRegisterHandlers__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[6];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allValues");
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v12;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        v9 = objc_msgSend(v8, "clientPortEventQueue");
        v10[0] = v6;
        v10[1] = 3221225472;
        v10[2] = __42__IAPClientPortManager_reRegisterHandlers__block_invoke_2;
        v10[3] = &unk_1E6931250;
        v10[4] = *(_QWORD *)(a1 + 32);
        v10[5] = v8;
        dispatch_async(v9, v10);
        ++v7;
      }
      while (v4 != v7);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

void __42__IAPClientPortManager_reRegisterHandlers__block_invoke_2(uint64_t a1)
{
  void *v2;
  xpc_object_t v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v2)
  {
    xpc_release(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = RetainConnectionToIAPTransportDaemon();
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v3, "requestType", "IAPClientPortRegisterStr");
    xpc_dictionary_set_string(v3, "IAPClientPortUUIDStr", (const char *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "uuid"), "UTF8String"));
    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 32), v3);
    xpc_release(v3);
  }
}

@end
