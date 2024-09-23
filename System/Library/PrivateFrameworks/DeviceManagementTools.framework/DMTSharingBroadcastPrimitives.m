@implementation DMTSharingBroadcastPrimitives

- (DMTSharingBroadcastPrimitives)initWithLoggingIdentifier:(id)a3
{
  id v4;
  DMTSharingBroadcastPrimitives *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *broadcastCallbackQueue;
  uint64_t v8;
  NSMutableArray *receivedObjectQueue;
  uint64_t v10;
  SFService *sharingService;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMTSharingBroadcastPrimitives;
  v5 = -[DMTSharingBroadcastPrimitives init](&v13, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.devicemanagementtools.broadcast", 0);
    broadcastCallbackQueue = v5->_broadcastCallbackQueue;
    v5->_broadcastCallbackQueue = (OS_dispatch_queue *)v6;

    v8 = objc_opt_new();
    receivedObjectQueue = v5->_receivedObjectQueue;
    v5->_receivedObjectQueue = (NSMutableArray *)v8;

    v10 = objc_opt_new();
    sharingService = v5->_sharingService;
    v5->_sharingService = (SFService *)v10;

    -[SFService setLabel:](v5->_sharingService, "setLabel:", v4);
    -[SFService setIdentifier:](v5->_sharingService, "setIdentifier:", *MEMORY[0x24BE90388]);
    -[SFService setDeviceActionType:](v5->_sharingService, "setDeviceActionType:", 21);
    -[SFService setNeedsSetup:](v5->_sharingService, "setNeedsSetup:", 1);
    -[SFService setDispatchQueue:](v5->_sharingService, "setDispatchQueue:", v5->_broadcastCallbackQueue);
  }

  return v5;
}

- (void)setMessageReceivedHandler:(id)a3
{
  id v4;
  void *v5;
  id messageReceivedHandler;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  v5 = (void *)MEMORY[0x2207D2FDC]();
  messageReceivedHandler = self->_messageReceivedHandler;
  self->_messageReceivedHandler = v5;

  if (self->_messageReceivedHandler)
  {
    objc_initWeak(&location, self);
    -[DMTSharingBroadcastPrimitives broadcastCallbackQueue](self, "broadcastCallbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __59__DMTSharingBroadcastPrimitives_setMessageReceivedHandler___block_invoke;
    v8[3] = &unk_24E5A0240;
    objc_copyWeak(&v9, &location);
    dispatch_async(v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __59__DMTSharingBroadcastPrimitives_setMessageReceivedHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "serviceReceivedObjectQueue");
    WeakRetained = v2;
  }

}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  -[DMTSharingBroadcastPrimitives addDependencyHandlers](self, "addDependencyHandlers");
  objc_initWeak(&location, self);
  -[DMTSharingBroadcastPrimitives sharingService](self, "sharingService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__DMTSharingBroadcastPrimitives_activateWithCompletion___block_invoke;
  v7[3] = &unk_24E5A0218;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "activateWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __56__DMTSharingBroadcastPrimitives_activateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setActivated:", v4 == 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)deactivate
{
  id v2;

  -[DMTSharingBroadcastPrimitives sharingService](self, "sharingService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)sendMessageToPairedDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = a3;
  -[DMTSharingBroadcastPrimitives remoteDevice](self, "remoteDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DMTSharingBroadcastPrimitives sharingService](self, "sharingService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMTSharingBroadcastPrimitives remoteDevice](self, "remoteDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendToPeer:flags:object:", v8, 1, v4);

  }
  else
  {
    _DMTLogGeneral_1();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[DMTSharingBroadcastPrimitives sendMessageToPairedDevice:].cold.1();

  }
}

- (void)addDependencyHandlers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location[2];

  objc_initWeak(location, self);
  v3 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke;
  v29[3] = &unk_24E5A0240;
  objc_copyWeak(&v30, location);
  -[DMTSharingBroadcastPrimitives sharingService](self, "sharingService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInvalidationHandler:", v29);

  v27[0] = v3;
  v27[1] = 3221225472;
  v27[2] = __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_2;
  v27[3] = &unk_24E5A0240;
  objc_copyWeak(&v28, location);
  -[DMTSharingBroadcastPrimitives sharingService](self, "sharingService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterruptionHandler:", v27);

  v25[0] = v3;
  v25[1] = 3221225472;
  v25[2] = __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_5;
  v25[3] = &unk_24E5A01D0;
  objc_copyWeak(&v26, location);
  -[DMTSharingBroadcastPrimitives sharingService](self, "sharingService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setErrorHandler:", v25);

  v23[0] = v3;
  v23[1] = 3221225472;
  v23[2] = __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_6;
  v23[3] = &unk_24E5A03F8;
  objc_copyWeak(&v24, location);
  -[DMTSharingBroadcastPrimitives sharingService](self, "sharingService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShowPINHandlerEx:", v23);

  v21[0] = v3;
  v21[1] = 3221225472;
  v21[2] = __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_2_8;
  v21[3] = &unk_24E5A0240;
  objc_copyWeak(&v22, location);
  -[DMTSharingBroadcastPrimitives sharingService](self, "sharingService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidePINHandler:", v21);

  v19[0] = v3;
  v19[1] = 3221225472;
  v19[2] = __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_3;
  v19[3] = &unk_24E5A0420;
  objc_copyWeak(&v20, location);
  -[DMTSharingBroadcastPrimitives sharingService](self, "sharingService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSessionStartedHandler:", v19);

  v17[0] = v3;
  v17[1] = 3221225472;
  v17[2] = __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_10;
  v17[3] = &unk_24E5A0420;
  objc_copyWeak(&v18, location);
  -[DMTSharingBroadcastPrimitives sharingService](self, "sharingService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSessionSecuredHandler:", v17);

  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_11;
  v15[3] = &unk_24E5A0448;
  objc_copyWeak(&v16, location);
  -[DMTSharingBroadcastPrimitives sharingService](self, "sharingService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSessionEndedHandler:", v15);

  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_13;
  v13[3] = &unk_24E5A0470;
  objc_copyWeak(&v14, location);
  -[DMTSharingBroadcastPrimitives sharingService](self, "sharingService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setReceivedObjectHandler:", v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(location);
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    DMTErrorWithCodeAndUserInfo(30, 0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "invalidateWithError:", v1);

  }
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _DMTLogGeneral_1();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_2_cold_1();

    if (objc_msgSend(WeakRetained, "isInvalidated"))
    {
      _DMTLogGeneral_1();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_21FD69000, v3, OS_LOG_TYPE_INFO, "Interrupted after invalidation, no-op", v4, 2u);
      }
    }
    else
    {
      DMTErrorWithCodeAndUserInfo(31, 0);
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "invalidateWithError:", v3);
    }

  }
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _DMTLogGeneral_1();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_5_cold_1((uint64_t)WeakRetained, (uint64_t)v3, v5);

  }
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "showPinHandler");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v8);

  }
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_2_8(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "dismissPinHandler");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v2;
    if (v2)
      (*(void (**)(uint64_t))(v2 + 16))(v2);

    WeakRetained = v4;
  }

}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _DMTLogGeneral_1();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_3_cold_1(v3);

    objc_msgSend(WeakRetained, "updateRemoteDeviceWithSession:", v3);
  }

}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "broadcastCallbackQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x2207D2CA0]();

    _DMTLogGeneral_1();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_10_cold_1(v3);

    objc_msgSend(v5, "setPaired:", 1);
    objc_msgSend(v5, "updateRemoteDeviceWithSession:", v3);
    objc_msgSend(v5, "sessionPairedHandler");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      (*(void (**)(uint64_t))(v8 + 16))(v8);
    objc_msgSend(v5, "serviceReceivedObjectQueue");

  }
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = objc_msgSend(WeakRetained, "isInvalidated");
    _DMTLogGeneral_1();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v9)
    {
      if (v11)
        __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_11_cold_1();
LABEL_5:

      goto LABEL_11;
    }
    if (v11)
      __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_11_cold_2(v5, (uint64_t)v6, v10);

    objc_msgSend(v8, "setRemoteDevice:", 0);
    if (objc_msgSend(v8, "isPaired"))
    {
      if (v6)
      {
        objc_msgSend(v8, "invalidateWithError:", v6);
        goto LABEL_11;
      }
      DMTErrorWithCodeAndUserInfo(91, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "invalidateWithError:", v10);
      goto LABEL_5;
    }
  }
LABEL_11:

}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_13(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "broadcastCallbackQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x2207D2CA0]();

    objc_msgSend(v9, "updateRemoteDeviceWithSession:", v6);
    _DMTLogGeneral_1();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13 = 138543362;
      v14 = v7;
      _os_log_impl(&dword_21FD69000, v11, OS_LOG_TYPE_INFO, "Received object: %{public}@", (uint8_t *)&v13, 0xCu);
    }

    objc_msgSend(v9, "receivedObjectQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v7);

    objc_msgSend(v9, "serviceReceivedObjectQueue");
  }

}

- (void)removeDependencyHandlers:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[DMTSharingBroadcastPrimitives broadcastCallbackQueue](self, "broadcastCallbackQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2207D2CA0]();

  -[DMTSharingBroadcastPrimitives sharingService](self, "sharingService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSessionStartedHandler:", 0);

  -[DMTSharingBroadcastPrimitives sharingService](self, "sharingService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShowPINHandler:", 0);

  -[DMTSharingBroadcastPrimitives sharingService](self, "sharingService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSessionSecuredHandler:", 0);

  if (!a3)
  {
    -[DMTSharingBroadcastPrimitives sharingService](self, "sharingService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setInvalidationHandler:", 0);

    -[DMTSharingBroadcastPrimitives sharingService](self, "sharingService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setInterruptionHandler:", 0);

    -[DMTSharingBroadcastPrimitives sharingService](self, "sharingService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidePINHandler:", 0);

    -[DMTSharingBroadcastPrimitives sharingService](self, "sharingService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSessionEndedHandler:", 0);

    -[DMTSharingBroadcastPrimitives sharingService](self, "sharingService");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setReceivedObjectHandler:", 0);

  }
}

- (void)invalidateWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _DMTLogGeneral_1();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[DMTSharingBroadcastPrimitives invalidateWithError:].cold.1();

  -[DMTSharingBroadcastPrimitives broadcastCallbackQueue](self, "broadcastCallbackQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2207D2CA0]();

  -[DMTSharingBroadcastPrimitives setInvalidated:](self, "setInvalidated:", 1);
  -[DMTSharingBroadcastPrimitives invalidationHandler](self, "invalidationHandler");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v10 = *MEMORY[0x24BDD1398];
    v11[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    DMTErrorWithCodeAndUserInfo(30, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v9);

  }
  -[DMTSharingBroadcastPrimitives removeDependencyHandlers:](self, "removeDependencyHandlers:", 0);

}

- (void)updateRemoteDeviceWithSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  DMTSharingDevice *v7;
  NSObject *v8;

  v4 = a3;
  -[DMTSharingBroadcastPrimitives broadcastCallbackQueue](self, "broadcastCallbackQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2207D2CA0]();

  objc_msgSend(v4, "peerDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = -[DMTSharingDevice initWithDevice:]([DMTSharingDevice alloc], "initWithDevice:", v6);
  else
    v7 = 0;
  _DMTLogGeneral_1();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DMTSharingBroadcastPrimitives updateRemoteDeviceWithSession:].cold.1();

  -[DMTSharingBroadcastPrimitives performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_setRemoteDevice_, v7, 0);
}

- (void)serviceReceivedObjectQueue
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21FD69000, v0, v1, "Not Servicing ReceivedObject Queue because we are not yet paired", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)showPinHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setShowPinHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (id)dismissPinHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setDismissPinHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (id)sessionPairedHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setSessionPairedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (id)messageReceivedHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (CATSharingDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDevice, a3);
}

- (OS_dispatch_queue)broadcastCallbackQueue
{
  return self->_broadcastCallbackQueue;
}

- (NSMutableArray)receivedObjectQueue
{
  return self->_receivedObjectQueue;
}

- (SFService)sharingService
{
  return self->_sharingService;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BOOL)isPaired
{
  return self->_paired;
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingService, 0);
  objc_storeStrong((id *)&self->_receivedObjectQueue, 0);
  objc_storeStrong((id *)&self->_broadcastCallbackQueue, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong(&self->_messageReceivedHandler, 0);
  objc_storeStrong(&self->_sessionPairedHandler, 0);
  objc_storeStrong(&self->_dismissPinHandler, 0);
  objc_storeStrong(&self->_showPinHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

- (void)sendMessageToPairedDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_21FD69000, v0, v1, "Remove device is nil while trying to send message, bailing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_21FD69000, v0, v1, "[DMT] Sharing service interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_5_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v4;
  void *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_21FD69000, a3, OS_LOG_TYPE_ERROR, "%{public}@, sharing error: %{public}@", v6, 0x16u);

  OUTLINED_FUNCTION_1_0();
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_3_cold_1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "peerDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_21FD69000, v4, v5, "Session Started for %{public}@.", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_10_cold_1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "peerDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_21FD69000, v4, v5, "Session Secured for %{public}@.", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_11_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21FD69000, v0, v1, "Session ended after invalidation, no-op", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __54__DMTSharingBroadcastPrimitives_addDependencyHandlers__block_invoke_11_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  void *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "peerDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_21FD69000, a3, OS_LOG_TYPE_DEBUG, "Session Ended for %{public}@, due to: %{public}@", v6, 0x16u);

  OUTLINED_FUNCTION_1_0();
}

- (void)invalidateWithError:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_21FD69000, v0, OS_LOG_TYPE_ERROR, "[DMT] Primitives invalidated with error: %{public}@", v1, 0xCu);
}

- (void)updateRemoteDeviceWithSession:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_21FD69000, v0, OS_LOG_TYPE_DEBUG, "Updating remoteDevice with %{public}@", v1, 0xCu);
}

@end
