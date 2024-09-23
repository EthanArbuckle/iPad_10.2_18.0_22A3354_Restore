@implementation AAController

- (AAController)init
{
  AAController *v2;
  AAController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AAController;
  v2 = -[AAController init](&v5, sel_init);
  if (v2)
  {
    v2->_clientID = AAXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v2->_coreBluetoothInternalFlag = 0x2000;
    v3 = v2;
  }

  return v2;
}

- (id)description
{
  NSAppendPrintF();
  return 0;
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  AAController *v5;
  uint64_t v6;
  id activateCompletion;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5->_activateCalled)
  {
    v5->_activateCalled = 1;
    v6 = MEMORY[0x23B7FD6BC](v4);
    activateCompletion = v5->_activateCompletion;
    v5->_activateCompletion = (id)v6;

    dispatchQueue = v5->_dispatchQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__AAController_activateWithCompletion___block_invoke;
    block[3] = &unk_25081CE30;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);

}

uint64_t __39__AAController_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  void (**v3)(_QWORD, _QWORD);
  id activateCompletion;
  id v5;

  if (self->_invalidateCalled)
  {
    NSErrorF();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_AAController <= 90 && (gLogCategory_AAController != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x23B7FD6BC](self->_activateCompletion);
    activateCompletion = self->_activateCompletion;
    self->_activateCompletion = 0;

    if (v3)
      ((void (**)(_QWORD, id))v3)[2](v3, v5);

  }
  else
  {
    -[AAController _activateXPC:](self, "_activateXPC:", 0);
  }
}

- (void)_activateXPC:(BOOL)a3
{
  xpc_object_t v4;
  void *v5;
  uint64_t coreBluetoothInternalFlag;
  _xpc_connection_s *v7;
  NSObject *dispatchQueue;
  _QWORD handler[5];

  if (a3)
  {
    if (gLogCategory_AAController <= 30 && (gLogCategory_AAController != -1 || _LogCategory_Initialize()))
LABEL_7:
      LogPrintF();
  }
  else if (gLogCategory_AAController <= 30
         && (gLogCategory_AAController != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = v4;
  coreBluetoothInternalFlag = self->_coreBluetoothInternalFlag;
  if ((_DWORD)coreBluetoothInternalFlag)
    xpc_dictionary_set_uint64(v4, "intF", coreBluetoothInternalFlag);
  xpc_dictionary_set_string(v5, "mTyp", "CtrA");
  -[AAController _ensureXPCStarted](self, "_ensureXPCStarted");
  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __29__AAController__activateXPC___block_invoke;
  handler[3] = &unk_25081CFD8;
  handler[4] = self;
  xpc_connection_send_message_with_reply(v7, v5, dispatchQueue, handler);

}

uint64_t __29__AAController__activateXPC___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateXPCCompleted:", a2);
}

- (void)_activateXPCCompleted:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void (**v6)(_QWORD, _QWORD);
  id activateCompletion;
  void (**v8)(_QWORD, _QWORD);
  id v9;
  void *v10;
  xpc_object_t xdict;
  _QWORD applier[5];

  xdict = a3;
  CUXPCDecodeNSErrorIfNeeded();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (gLogCategory_AAController <= 90 && (gLogCategory_AAController != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x23B7FD6BC](self->_activateCompletion);
    activateCompletion = self->_activateCompletion;
    self->_activateCompletion = 0;

    if (v6)
      ((void (**)(_QWORD, void *))v6)[2](v6, v4);
  }
  else
  {
    xpc_dictionary_get_array(xdict, "aaDD");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      applier[0] = MEMORY[0x24BDAC760];
      applier[1] = 3221225472;
      applier[2] = __38__AAController__activateXPCCompleted___block_invoke;
      applier[3] = &unk_25081D000;
      applier[4] = self;
      xpc_array_apply(v5, applier);
    }
    if (gLogCategory_AAController <= 30 && (gLogCategory_AAController != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x23B7FD6BC](self->_activateCompletion);
    v9 = self->_activateCompletion;
    self->_activateCompletion = 0;

    if (v8)
      v8[2](v8, 0);

  }
}

BOOL __38__AAController__activateXPCCompleted___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = MEMORY[0x23B7FD6BC](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v6 = (void *)v5;
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);

  return v6 != 0;
}

- (id)_ensureXPCStarted
{
  AAController *v2;
  OS_xpc_object *v3;
  xpc_connection_t mach_service;
  _QWORD v6[4];
  OS_xpc_object *v7;
  AAController *v8;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_xpcCnx;
  if (!v2->_xpcCnx)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.bluetooth.xpc", (dispatch_queue_t)v2->_dispatchQueue, 0);

    objc_storeStrong((id *)&v2->_xpcCnx, mach_service);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __33__AAController__ensureXPCStarted__block_invoke;
    v6[3] = &unk_25081D028;
    v3 = mach_service;
    v7 = v3;
    v8 = v2;
    xpc_connection_set_event_handler(v3, v6);
    xpc_connection_activate(v3);

  }
  objc_sync_exit(v2);

  return v3;
}

_QWORD *__33__AAController__ensureXPCStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[4])
    return (_QWORD *)objc_msgSend(result, "xpcReceivedMessage:", a2);
  return result;
}

- (void)_interrupted
{
  uint64_t v3;
  void *v4;

  if (!self->_invalidateCalled)
  {
    if (gLogCategory_AAController <= 30 && (gLogCategory_AAController != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v3 = MEMORY[0x23B7FD6BC](self->_interruptionHandler);
    v4 = (void *)v3;
    if (v3)
      (*(void (**)(uint64_t))(v3 + 16))(v3);

    if (self->_activateCalled)
      -[AAController _activateXPC:](self, "_activateXPC:", 1);
  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__AAController_invalidate__block_invoke;
  block[3] = &unk_25081CE30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__AAController_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  _xpc_connection_s *v4;
  _xpc_connection_s *v5;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    if (gLogCategory_AAController <= 30 && (gLogCategory_AAController != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v3 = *(id *)(v2 + 32);
    objc_sync_enter(v3);
    v4 = (_xpc_connection_s *)*(id *)(*(_QWORD *)(v2 + 32) + 32);
    v5 = v4;
    if (v4)
      xpc_connection_cancel(v4);

    objc_sync_exit(v3);
    return objc_msgSend(*(id *)(v2 + 32), "_invalidated");
  }
  return result;
}

- (void)_invalidated
{
  AAController *v3;
  OS_xpc_object *xpcCnx;
  id conversationDetectMessageHandler;
  id deviceInfoChangeHandler;
  id multimodalContextMessageHandler;
  id pmeConfigMessageHandler;
  id interruptionHandler;
  id invalidationHandler;
  void *v11;
  int v12;
  uint64_t v13;

  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    v3 = self;
    objc_sync_enter(v3);
    xpcCnx = v3->_xpcCnx;
    objc_sync_exit(v3);

    if (!xpcCnx)
    {
      conversationDetectMessageHandler = v3->_conversationDetectMessageHandler;
      v3->_conversationDetectMessageHandler = 0;

      deviceInfoChangeHandler = v3->_deviceInfoChangeHandler;
      v3->_deviceInfoChangeHandler = 0;

      multimodalContextMessageHandler = v3->_multimodalContextMessageHandler;
      v3->_multimodalContextMessageHandler = 0;

      pmeConfigMessageHandler = v3->_pmeConfigMessageHandler;
      v3->_pmeConfigMessageHandler = 0;

      interruptionHandler = v3->_interruptionHandler;
      v3->_interruptionHandler = 0;

      v13 = MEMORY[0x23B7FD6BC](v3->_invalidationHandler);
      invalidationHandler = v3->_invalidationHandler;
      v3->_invalidationHandler = 0;

      v11 = (void *)v13;
      if (v13)
      {
        (*(void (**)(uint64_t))(v13 + 16))(v13);
        v11 = (void *)v13;
      }
      self->_invalidateDone = 1;
      if (gLogCategory_AAController <= 30)
      {
        if (gLogCategory_AAController != -1 || (v12 = _LogCategory_Initialize(), v11 = (void *)v13, v12))
        {
          LogPrintF();
          v11 = (void *)v13;
        }
      }

    }
  }
}

- (void)sendConversationDetectMessage:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  AAController *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __86__AAController_sendConversationDetectMessage_destinationIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_25081D050;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(dispatchQueue, v15);

}

uint64_t __86__AAController_sendConversationDetectMessage_destinationIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  if (gLogCategory_AAController <= 30 && (gLogCategory_AAController != -1 || _LogCategory_Initialize()))
    LogPrintF();
  return objc_msgSend(*(id *)(a1 + 40), "_sendAccessoryEventMessage:eventType:destinationIdentifier:completionHandler:", *(_QWORD *)(a1 + 48), 2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

- (void)sendMultimodalContextMessage:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  AAController *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __85__AAController_sendMultimodalContextMessage_destinationIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_25081D050;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(dispatchQueue, v15);

}

uint64_t __85__AAController_sendMultimodalContextMessage_destinationIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  if (gLogCategory_AAController <= 30 && (gLogCategory_AAController != -1 || _LogCategory_Initialize()))
    LogPrintF();
  return objc_msgSend(*(id *)(a1 + 40), "_sendAccessoryEventMessage:eventType:destinationIdentifier:completionHandler:", *(_QWORD *)(a1 + 48), 4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

- (void)sendPMEConfigData:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  AAController *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __74__AAController_sendPMEConfigData_destinationIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_25081D050;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(dispatchQueue, v15);

}

uint64_t __74__AAController_sendPMEConfigData_destinationIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  if (gLogCategory_AAController <= 30 && (gLogCategory_AAController != -1 || _LogCategory_Initialize()))
    LogPrintF();
  return objc_msgSend(*(id *)(a1 + 40), "_sendAccessoryEventMessage:eventType:destinationIdentifier:completionHandler:", *(_QWORD *)(a1 + 48), 5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

- (void)sendDeviceConfig:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  AAController *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __73__AAController_sendDeviceConfig_destinationIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_25081D050;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(dispatchQueue, v15);

}

uint64_t __73__AAController_sendDeviceConfig_destinationIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  if (gLogCategory_AAController <= 30 && (gLogCategory_AAController != -1 || _LogCategory_Initialize()))
    LogPrintF();
  return objc_msgSend(*(id *)(a1 + 40), "_sendDeviceConfig:destinationIdentifier:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

- (void)sendGetTipiTableMessageToDestinationIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  AAController *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__AAController_sendGetTipiTableMessageToDestinationIdentifier_completionHandler___block_invoke;
  block[3] = &unk_25081D078;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __81__AAController_sendGetTipiTableMessageToDestinationIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(CFSTR("Send getTipiTable message"), "dataUsingEncoding:", 4);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_AAController <= 30 && (gLogCategory_AAController != -1 || _LogCategory_Initialize()))
  {
    v2 = *(_QWORD *)(a1 + 32);
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 40), "_sendAccessoryEventMessage:eventType:destinationIdentifier:completionHandler:", v3, 6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), v2);

}

- (void)_sendAccessoryEventMessage:(id)a3 eventType:(unsigned __int8)a4 destinationIdentifier:(id)a5 completionHandler:(id)a6
{
  unsigned int v8;
  id v10;
  id v11;
  void (**v12)(id, id);
  id v13;
  void *v14;
  xpc_object_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  const char *v20;
  id v21;
  void *v22;
  uint64_t v23;
  size_t v24;
  _xpc_connection_s *v25;
  NSObject *dispatchQueue;
  void *v27;
  const char *bytes;
  _QWORD handler[4];
  void (**v30)(id, id);

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, id))a6;
  if (self->_invalidateCalled)
  {
    NSErrorF();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_AAController > 90 || gLogCategory_AAController == -1 && !_LogCategory_Initialize())
      goto LABEL_16;
    goto LABEL_15;
  }
  if (!v11)
  {
    NSErrorF();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_AAController > 90 || gLogCategory_AAController == -1 && !_LogCategory_Initialize())
      goto LABEL_16;
LABEL_15:
    CUPrintNSError();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

LABEL_16:
    v12[2](v12, v13);
    goto LABEL_17;
  }
  v13 = objc_alloc_init(MEMORY[0x24BDBB240]);
  objc_msgSend(v13, "setIdentifier:", v11);
  objc_msgSend(v13, "dictionaryRepresentation");
  v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  v15 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v15, "mTyp", "SnAE");
  xpc_dictionary_set_uint64(v15, "acET", v8);
  if (v10)
  {
    v16 = objc_retainAutorelease(v10);
    v17 = v15;
    v18 = v16;
    v19 = objc_msgSend(v18, "bytes");
    v20 = "";
    if (v19)
      v20 = (const char *)v19;
    bytes = v20;
    v21 = v13;
    v22 = v14;
    v23 = objc_msgSend(v18, "length");

    v24 = v23;
    v14 = v22;
    v13 = v21;
    xpc_dictionary_set_data(v17, "acMd", bytes, v24);

  }
  xpc_dictionary_set_value(v15, "dstD", v14);
  -[AAController _ensureXPCStarted](self, "_ensureXPCStarted");
  v25 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __93__AAController__sendAccessoryEventMessage_eventType_destinationIdentifier_completionHandler___block_invoke;
  handler[3] = &unk_25081D0A0;
  v30 = v12;
  xpc_connection_send_message_with_reply(v25, v15, dispatchQueue, handler);

LABEL_17:
}

void __93__AAController__sendAccessoryEventMessage_eventType_destinationIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)_sendDeviceConfig:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  id v11;
  void *v12;
  void *v13;
  xpc_object_t v14;
  _xpc_connection_s *v15;
  NSObject *dispatchQueue;
  _QWORD handler[4];
  void (**v18)(id, id);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  if (self->_invalidateCalled)
  {
    NSErrorF();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_AAController > 90 || gLogCategory_AAController == -1 && !_LogCategory_Initialize())
      goto LABEL_11;
    goto LABEL_4;
  }
  if (!v9)
  {
    NSErrorF();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_AAController > 90 || gLogCategory_AAController == -1 && !_LogCategory_Initialize())
      goto LABEL_11;
LABEL_4:
    CUPrintNSError();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

LABEL_11:
    v10[2](v10, v11);
    goto LABEL_12;
  }
  v11 = objc_alloc_init(MEMORY[0x24BDBB240]);
  objc_msgSend(v11, "setIdentifier:", v9);
  objc_msgSend(v11, "dictionaryRepresentation");
  v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  v14 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v14, "mTyp", "SnAC");
  xpc_dictionary_set_value(v14, "acMd", v8);
  xpc_dictionary_set_value(v14, "dstD", v13);
  -[AAController _ensureXPCStarted](self, "_ensureXPCStarted");
  v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __74__AAController__sendDeviceConfig_destinationIdentifier_completionHandler___block_invoke;
  handler[3] = &unk_25081D0A0;
  v18 = v10;
  xpc_connection_send_message_with_reply(v15, v14, dispatchQueue, handler);

LABEL_12:
}

void __74__AAController__sendDeviceConfig_destinationIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)xpcReceivedMessage:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  AAController *v11;
  OS_xpc_object *xpcCnx;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v15 = v4;
  if (gLogCategory_AAController <= 10)
  {
    if (gLogCategory_AAController != -1 || (v5 = _LogCategory_Initialize(), v4 = v15, v5))
    {
      CUPrintXPC();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v4 = v15;
    }
  }
  if (MEMORY[0x23B7FD8CC](v4) == MEMORY[0x24BDACFA0])
  {
    -[AAController _xpcReceivedMessage:](self, "_xpcReceivedMessage:", v15);
  }
  else if (v15 == (id)MEMORY[0x24BDACF30])
  {
    -[AAController _interrupted](self, "_interrupted");
  }
  else if (v15 == (id)MEMORY[0x24BDACF38])
  {
    if (!self->_invalidateCalled
      && gLogCategory_AAController <= 90
      && (gLogCategory_AAController != -1 || _LogCategory_Initialize()))
    {
      xpc_connection_copy_invalidation_reason();
      LogPrintF();
    }
    v11 = self;
    objc_sync_enter(v11);
    xpcCnx = v11->_xpcCnx;
    v11->_xpcCnx = 0;

    objc_sync_exit(v11);
    -[AAController _invalidated](v11, "_invalidated");
  }
  else
  {
    CUXPCDecodeNSErrorIfNeeded();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      NSErrorF();
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

    if (gLogCategory_AAController <= 90 && (gLogCategory_AAController != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintXPC();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
  }

}

- (void)_xpcReceivedMessage:(id)a3
{
  const char *string;
  const char *v5;
  id v6;

  v6 = a3;
  string = xpc_dictionary_get_string(v6, "mTyp");
  if (!string)
  {
    if (gLogCategory_AAController > 90 || gLogCategory_AAController == -1 && !_LogCategory_Initialize())
      goto LABEL_15;
LABEL_9:
    LogPrintF();
    goto LABEL_15;
  }
  v5 = string;
  if (!strcmp(string, "AcRc"))
  {
    -[AAController _xpcReceivedAccessoryEvent:](self, "_xpcReceivedAccessoryEvent:", v6);
    goto LABEL_15;
  }
  if (!strcmp(v5, "AcIC"))
  {
    -[AAController _xpcReceivedAudioAccessoryDeviceInfoChange:](self, "_xpcReceivedAudioAccessoryDeviceInfoChange:", v6);
    goto LABEL_15;
  }
  if (gLogCategory_AAController <= 10 && (gLogCategory_AAController != -1 || _LogCategory_Initialize()))
    goto LABEL_9;
LABEL_15:

}

- (void)_xpcReceivedAccessoryEvent:(id)a3
{
  id v3;
  void (**v4)(_QWORD);
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __43__AAController__xpcReceivedAccessoryEvent___block_invoke;
  v9[3] = &unk_25081D0C8;
  v9[4] = &v10;
  v4 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](v9);
  if (MEMORY[0x23B7FD8CC](v3) == MEMORY[0x24BDACFA0])
  {
    objc_opt_class();
    CUXPCDecodeObject();
    v5 = 0;
    CUPrintNSError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSPrintF_safe();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v11[5];
    v11[5] = v6;

  }
  else
  {
    v5 = (id)v11[5];
    v11[5] = (uint64_t)CFSTR("non-dict message");
  }

  v4[2](v4);
  _Block_object_dispose(&v10, 8);

}

uint64_t __43__AAController__xpcReceivedAccessoryEvent___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40))
  {
    if (gLogCategory_AAController <= 90)
    {
      if (gLogCategory_AAController != -1)
        return LogPrintF();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF();
    }
  }
  return result;
}

- (void)_xpcReceivedAudioAccessoryDeviceInfoChange:(id)a3
{
  id v4;
  void (**v5)(_QWORD);
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __59__AAController__xpcReceivedAudioAccessoryDeviceInfoChange___block_invoke;
  v11[3] = &unk_25081D0C8;
  v11[4] = &v12;
  v5 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](v11);
  v6 = MEMORY[0x23B7FD8CC](v4);
  v7 = MEMORY[0x24BDACFA0];
  if (v6 == MEMORY[0x24BDACFA0])
  {
    xpc_dictionary_get_value(v4, "aaID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x23B7FD8CC]() == v7)
    {
      v9 = MEMORY[0x23B7FD6BC](self->_deviceInfoChangeHandler);
      v10 = (void *)v9;
      if (v9)
        (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v8);
    }
    else
    {
      v10 = (void *)v13[5];
      v13[5] = (uint64_t)CFSTR("missing key for AADeviceInfo");
    }

  }
  else
  {
    v8 = (void *)v13[5];
    v13[5] = (uint64_t)CFSTR("non-dict message");
  }

  v5[2](v5);
  _Block_object_dispose(&v12, 8);

}

uint64_t __59__AAController__xpcReceivedAudioAccessoryDeviceInfoChange___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40))
  {
    if (gLogCategory_AAController <= 90)
    {
      if (gLogCategory_AAController != -1)
        return LogPrintF();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF();
    }
  }
  return result;
}

- (void)_conversationDetectMessageReceived:(id)a3 fromDevice:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __62__AAController__conversationDetectMessageReceived_fromDevice___block_invoke;
  v15[3] = &unk_25081D0C8;
  v15[4] = &v16;
  v8 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](v15);
  if (gLogCategory_AAController <= 10 && (gLogCategory_AAController != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSDataHex();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x23B7FD6BC](self->_conversationDetectMessageHandler);
  if (v9)
  {
    objc_msgSend(v7, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      ((void (**)(_QWORD, void *, id))v9)[2](v9, v10, v6);
    }
    else
    {
      CUPrintNSError();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSPrintF_safe();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v17[5];
      v17[5] = v11;

    }
  }

  v8[2](v8);
  _Block_object_dispose(&v16, 8);

}

uint64_t __62__AAController__conversationDetectMessageReceived_fromDevice___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40))
  {
    if (gLogCategory_AAController <= 90)
    {
      if (gLogCategory_AAController != -1)
        return LogPrintF();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF();
    }
  }
  return result;
}

- (void)_multimodalContextMessageReceived:(id)a3 fromDevice:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __61__AAController__multimodalContextMessageReceived_fromDevice___block_invoke;
  v15[3] = &unk_25081D0C8;
  v15[4] = &v16;
  v8 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](v15);
  if (gLogCategory_AAController <= 10 && (gLogCategory_AAController != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSDataHex();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x23B7FD6BC](self->_multimodalContextMessageHandler);
  if (v9)
  {
    objc_msgSend(v7, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      ((void (**)(_QWORD, void *, id))v9)[2](v9, v10, v6);
    }
    else
    {
      CUPrintNSError();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSPrintF_safe();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v17[5];
      v17[5] = v11;

    }
  }

  v8[2](v8);
  _Block_object_dispose(&v16, 8);

}

uint64_t __61__AAController__multimodalContextMessageReceived_fromDevice___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40))
  {
    if (gLogCategory_AAController <= 90)
    {
      if (gLogCategory_AAController != -1)
        return LogPrintF();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF();
    }
  }
  return result;
}

- (void)_pmeConfigDataReceived:(id)a3 fromDevice:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __50__AAController__pmeConfigDataReceived_fromDevice___block_invoke;
  v15[3] = &unk_25081D0C8;
  v15[4] = &v16;
  v8 = (void (**)(_QWORD))MEMORY[0x23B7FD6BC](v15);
  if (gLogCategory_AAController <= 10 && (gLogCategory_AAController != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSDataHex();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x23B7FD6BC](self->_pmeConfigMessageHandler);
  if (v9)
  {
    objc_msgSend(v7, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      ((void (**)(_QWORD, void *, id))v9)[2](v9, v10, v6);
    }
    else
    {
      CUPrintNSError();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSPrintF_safe();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v17[5];
      v17[5] = v11;

    }
  }

  v8[2](v8);
  _Block_object_dispose(&v16, 8);

}

uint64_t __50__AAController__pmeConfigDataReceived_fromDevice___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40))
  {
    if (gLogCategory_AAController <= 90)
    {
      if (gLogCategory_AAController != -1)
        return LogPrintF();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF();
    }
  }
  return result;
}

- (id)conversationDetectMessageHandler
{
  return self->_conversationDetectMessageHandler;
}

- (void)setConversationDetectMessageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)deviceInfoChangeHandler
{
  return self->_deviceInfoChangeHandler;
}

- (void)setDeviceInfoChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)multimodalContextMessageHandler
{
  return self->_multimodalContextMessageHandler;
}

- (void)setMultimodalContextMessageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)pmeConfigMessageHandler
{
  return self->_pmeConfigMessageHandler;
}

- (void)setPmeConfigMessageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_clientID = a3;
}

- (unsigned)coreBluetoothInternalFlag
{
  return self->_coreBluetoothInternalFlag;
}

- (void)setCoreBluetoothInternalFlag:(unsigned int)a3
{
  self->_coreBluetoothInternalFlag = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pmeConfigMessageHandler, 0);
  objc_storeStrong(&self->_multimodalContextMessageHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_deviceInfoChangeHandler, 0);
  objc_storeStrong(&self->_conversationDetectMessageHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

@end
