@implementation DDUICoreAgent

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__DDUICoreAgent_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

void __31__DDUICoreAgent_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

- (void)start
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  DDUICoreAgent *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_1C87B2000, v3, OS_LOG_TYPE_DEFAULT, "Starting up DDUICoreAgent {self: %@}", buf, 0xCu);
  }

  DDUICorePrimaryQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__DDUICoreAgent_start__block_invoke;
  block[3] = &unk_1E81B43C8;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __22__DDUICoreAgent_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startOnQueue");
}

- (void)_startOnQueue
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  _QWORD handler[5];
  uint8_t buf[4];
  DDUICoreAgent *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_started)
  {
    self->_started = 1;
    v3 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v8 = self;
      _os_log_impl(&dword_1C87B2000, v3, OS_LOG_TYPE_DEFAULT, "Setup event stream handler {self: %@}", buf, 0xCu);
    }

    DDUICorePrimaryQueue();
    v4 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __30__DDUICoreAgent__startOnQueue__block_invoke;
    handler[3] = &unk_1E81B4418;
    handler[4] = self;
    xpc_set_event_stream_handler("com.apple.rapport.matching", v4, handler);

    +[_DDUIRemoteDisplaySessionHandler sharedInstance](_DDUIRemoteDisplaySessionHandler, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activateWithCompletion:", &__block_literal_global_0);

  }
}

void __30__DDUICoreAgent__startOnQueue__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void (**v6)(_QWORD);
  const char *string;
  void *v8;
  _QWORD v9[4];
  void (**v10)(_QWORD);
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __30__DDUICoreAgent__startOnQueue__block_invoke_2;
  v11[3] = &unk_1E81B43C8;
  v5 = v3;
  v12 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1CAA33E80](v11);
  string = xpc_dictionary_get_string(v5, (const char *)*MEMORY[0x1E0C81298]);
  if (string)
  {
    if (!strcmp(string, "com.apple.devicediscoveryui.rapportwake"))
    {
      v8 = *(void **)(a1 + 32);
      v9[0] = v4;
      v9[1] = 3221225472;
      v9[2] = __30__DDUICoreAgent__startOnQueue__block_invoke_3;
      v9[3] = &unk_1E81B43F0;
      v10 = v6;
      objc_msgSend(v8, "_setupListenerIfNeededWithCompletion:", v9);

    }
    else
    {
      v6[2](v6);
    }
  }

}

void __30__DDUICoreAgent__startOnQueue__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  xpc_object_t reply;
  uint8_t v4[16];

  if (xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "replyRequired"))
  {
    v2 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1C87B2000, v2, OS_LOG_TYPE_DEFAULT, "configureXPC -- sending reply", v4, 2u);
    }

    reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    if (reply)
      xpc_dictionary_send_reply();

  }
}

uint64_t __30__DDUICoreAgent__startOnQueue__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_setupListenerIfNeededWithCompletion:(id)a3
{
  id v4;
  void *v5;
  DDUIEndpointPairingListener *v6;
  void *v7;
  DDUIEndpointPairingListener *v8;
  DDUIEndpointPairingListener *endpointPairingListener;
  NSObject *v10;
  DDUIEndpointPairingListener *v11;
  DDUIEndpointPairingListener *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  DDUIEndpointPairingListener *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_endpointPairingListener)
  {
    if (v4)
      (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy_;
    v16[4] = __Block_byref_object_dispose_;
    v17 = 0;
    v17 = (id)MEMORY[0x1CAA33E80](v4);
    v6 = [DDUIEndpointPairingListener alloc];
    DDUIEndpointPairingListeningTransportForOptions(-1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[DDUIEndpointPairingListener initWithTransport:](v6, "initWithTransport:", v7);
    endpointPairingListener = self->_endpointPairingListener;
    self->_endpointPairingListener = v8;

    v10 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_endpointPairingListener;
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl(&dword_1C87B2000, v10, OS_LOG_TYPE_DEFAULT, "setupDDUIListenerIfNeeded, created listener for all available transports {endpointPairingListener: %@}", buf, 0xCu);
    }

    v12 = self->_endpointPairingListener;
    v14[4] = self;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __54__DDUICoreAgent__setupListenerIfNeededWithCompletion___block_invoke;
    v15[3] = &unk_1E81B4480;
    v15[4] = v16;
    v13[4] = v16;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __54__DDUICoreAgent__setupListenerIfNeededWithCompletion___block_invoke_8;
    v14[3] = &unk_1E81B44A8;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __54__DDUICoreAgent__setupListenerIfNeededWithCompletion___block_invoke_10;
    v13[3] = &unk_1E81B44D0;
    -[DDUIEndpointPairingListener beginListeningWithErrorHandler:pairingHandler:completion:](v12, "beginListeningWithErrorHandler:pairingHandler:completion:", v15, v14, v13);
    _Block_object_dispose(v16, 8);

  }
}

void __54__DDUICoreAgent__setupListenerIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1C87B2000, v4, OS_LOG_TYPE_DEFAULT, "setupDDUIListenerIfNeeded, received an error {listenError: %@}", (uint8_t *)&v8, 0xCu);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(_QWORD *)(v5 + 40);
  if (v6)
  {
    (*(void (**)(void))(v6 + 16))();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v5 + 40);
  }
  else
  {
    v7 = 0;
  }
  *(_QWORD *)(v5 + 40) = 0;

}

void __54__DDUICoreAgent__setupListenerIfNeededWithCompletion___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "remoteDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v6;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1C87B2000, v7, OS_LOG_TYPE_DEFAULT, "setupDDUIListenerIfNeeded, incoming pairing session {pairInitiateMessage: %@, pairingSession: %@ remoteDevice %@}", (uint8_t *)&v11, 0x20u);

  }
  v9 = objc_msgSend(v5, "sessionType");
  v10 = *(void **)(a1 + 32);
  if (v9 == 1)
    objc_msgSend(v10, "_handleIncomingContinuityCameraConfirmation:", v5);
  else
    objc_msgSend(v10, "_handleIncomingPairingSession:pairingMessage:", v5, v6);

}

void __54__DDUICoreAgent__setupListenerIfNeededWithCompletion___block_invoke_10(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint8_t v6[16];

  v2 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1C87B2000, v2, OS_LOG_TYPE_DEFAULT, "setupDDUIListenerIfNeeded, began", v6, 2u);
  }

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(_QWORD *)(v3 + 40);
  if (v4)
  {
    (*(void (**)(void))(v4 + 16))();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v3 + 40);
  }
  else
  {
    v5 = 0;
  }
  *(_QWORD *)(v3 + 40) = 0;

}

- (void)_handleIncomingPairingSession:(id)a3 pairingMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  DDUIEndpointPairingListener *endpointPairingListener;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  DDUICoreAgent *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v6 = a3;
  v7 = a4;
  -[DDUICoreAgent notificationManager](self, "notificationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __62__DDUICoreAgent__handleIncomingPairingSession_pairingMessage___block_invoke;
  v24[3] = &unk_1E81B44F8;
  v25 = v6;
  v26 = v8;
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __62__DDUICoreAgent__handleIncomingPairingSession_pairingMessage___block_invoke_11;
  v21[3] = &unk_1E81B4520;
  v10 = v25;
  v22 = v10;
  v23 = v26;
  v11 = v26;
  objc_msgSend(v10, "activateWithErrorHandler:completionHandler:", v24, v21);
  objc_msgSend(v7, "applicationInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bundleIDPrefixedServiceIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  endpointPairingListener = self->_endpointPairingListener;
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __62__DDUICoreAgent__handleIncomingPairingSession_pairingMessage___block_invoke_13;
  v17[3] = &unk_1E81B4548;
  v18 = v10;
  v19 = self;
  v20 = v7;
  v15 = v7;
  v16 = v10;
  -[DDUIEndpointPairingListener checkIfUserNeedsReconfirmationForSession:withServiceIdentifier:completion:](endpointPairingListener, "checkIfUserNeedsReconfirmationForSession:withServiceIdentifier:completion:", v16, v13, v17);

}

void __62__DDUICoreAgent__handleIncomingPairingSession_pairingMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__DDUICoreAgent__handleIncomingPairingSession_pairingMessage___block_invoke_cold_1();

  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelMessageWithID:", v6);

}

void __62__DDUICoreAgent__handleIncomingPairingSession_pairingMessage___block_invoke_11(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 138412546;
    v9 = v5;
    v10 = 1024;
    v11 = a2;
    _os_log_impl(&dword_1C87B2000, v4, OS_LOG_TYPE_DEFAULT, "incoming pairingSession, finished pairing {pairingSession: %@, result %d}", (uint8_t *)&v8, 0x12u);
  }

  if (a2 == 1)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelMessageWithID:", v7);

  }
}

void __62__DDUICoreAgent__handleIncomingPairingSession_pairingMessage___block_invoke_13(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  DDUIPairCompleteMessage *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5 || (a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_showNotificationForPairingSession:pairingMessage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v6 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1C87B2000, v6, OS_LOG_TYPE_DEFAULT, "Responding with existing listener UUID %@", (uint8_t *)&v8, 0xCu);
    }

    v7 = -[DDUIPairCompleteMessage initWithNotificationResult:listenerUUID:]([DDUIPairCompleteMessage alloc], "initWithNotificationResult:listenerUUID:", 1, v5);
    objc_msgSend(*(id *)(a1 + 32), "pairWithMessage:", v7);

  }
}

- (void)_showNotificationForPairingSession:(id)a3 pairingMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  -[DDUICoreAgent notificationManager](self, "notificationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applicationInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    location = 0;
    objc_initWeak(&location, self);
    objc_msgSend(v6, "sessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__DDUICoreAgent__showNotificationForPairingSession_pairingMessage___block_invoke;
    v12[3] = &unk_1E81B4598;
    objc_copyWeak(&v15, &location);
    v13 = v6;
    v14 = v9;
    objc_msgSend(v8, "handleApplicationInfo:withID:fromDevice:completionHandler:", v14, v10, v11, v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

void __67__DDUICoreAgent__showNotificationForPairingSession_pairingMessage___block_invoke(id *a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  DDUIPairCompleteMessage *v9;
  _QWORD v10[4];
  id v11;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (a2 == 1)
  {
    v6 = (void *)*((_QWORD *)WeakRetained + 2);
    v7 = a1[4];
    objc_msgSend(a1[5], "bundleIDPrefixedServiceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __67__DDUICoreAgent__showNotificationForPairingSession_pairingMessage___block_invoke_2;
    v10[3] = &unk_1E81B4570;
    v11 = a1[4];
    objc_msgSend(v6, "createListenerMappingForSession:withServiceIdentifier:completion:", v7, v8, v10);

  }
  else
  {
    v9 = -[DDUIPairCompleteMessage initWithNotificationResult:]([DDUIPairCompleteMessage alloc], "initWithNotificationResult:", a2);
    objc_msgSend(a1[4], "pairWithMessage:", v9);

  }
}

void __67__DDUICoreAgent__showNotificationForPairingSession_pairingMessage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  DDUIPairCompleteMessage *v5;
  uint64_t v6;
  id v7;
  DDUIPairCompleteMessage *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1C87B2000, v4, OS_LOG_TYPE_DEFAULT, "Received listener uuid %@", (uint8_t *)&v9, 0xCu);
  }

  v5 = [DDUIPairCompleteMessage alloc];
  if (v3)
  {
    v6 = 1;
    v7 = v3;
  }
  else
  {
    v6 = 6;
    v7 = 0;
  }
  v8 = -[DDUIPairCompleteMessage initWithNotificationResult:listenerUUID:](v5, "initWithNotificationResult:listenerUUID:", v6, v7);
  objc_msgSend(*(id *)(a1 + 32), "pairWithMessage:", v8);

}

- (_DDUINotificationManager)notificationManager
{
  _DDUINotificationManager *notificationManager;
  _DDUINotificationManager *v4;
  _DDUINotificationManager *v5;

  notificationManager = self->_notificationManager;
  if (!notificationManager)
  {
    v4 = objc_alloc_init(_DDUINotificationManager);
    v5 = self->_notificationManager;
    self->_notificationManager = v4;

    notificationManager = self->_notificationManager;
  }
  return notificationManager;
}

- (void)_handleIncomingContinuityCameraConfirmation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  DDUIPairCompleteMessage *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  DDUIPairCompleteMessage *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  DDUIPairCompleteMessage *v34;
  DDUIPairCompleteMessage *v35;
  _QWORD v36[4];
  DDUIPairCompleteMessage *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[DDUICoreAgent notificationManager](self, "notificationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __61__DDUICoreAgent__handleIncomingContinuityCameraConfirmation___block_invoke;
  v41[3] = &unk_1E81B44F8;
  v42 = v4;
  v43 = v5;
  v38[0] = v6;
  v38[1] = 3221225472;
  v38[2] = __61__DDUICoreAgent__handleIncomingContinuityCameraConfirmation___block_invoke_18;
  v38[3] = &unk_1E81B4520;
  v7 = v42;
  v39 = v7;
  v8 = v43;
  v40 = v8;
  objc_msgSend(v7, "activateWithErrorHandler:completionHandler:", v41, v38);
  objc_msgSend(v7, "incomingMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("actionType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "unsignedIntValue") == 1)
  {
    +[_DDUIRemoteDisplaySessionHandler sharedInstance](_DDUIRemoteDisplaySessionHandler, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "shouldAutoAcceptCCConfirmation");

    v13 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "remoteDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v45 = v15;
      v46 = 1024;
      v47 = v12;
      _os_log_impl(&dword_1C87B2000, v13, OS_LOG_TYPE_DEFAULT, "Incoming continuity camera confirmation request from: %@, shouldByPassConfirmation: %d", buf, 0x12u);

    }
    if (v12)
    {
      +[_DDUIRemoteDisplaySessionHandler sharedInstance](_DDUIRemoteDisplaySessionHandler, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "remoteDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "enterSessionWithRemoteDeviceID:reason:", v18, CFSTR("Automatic Accept"));

      v19 = -[DDUIPairCompleteMessage initWithNotificationResult:]([DDUIPairCompleteMessage alloc], "initWithNotificationResult:", 1);
      objc_msgSend(v7, "pairWithMessage:", v19);
    }
    else
    {
      objc_msgSend(v7, "sessionID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "remoteDevice");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v6;
      v36[1] = 3221225472;
      v36[2] = __61__DDUICoreAgent__handleIncomingContinuityCameraConfirmation___block_invoke_22;
      v36[3] = &unk_1E81B45C0;
      v37 = (DDUIPairCompleteMessage *)v7;
      objc_msgSend(v8, "handleContinuityCameraConfirmationWithID:fromDevice:completionHandler:", v30, v31, v36);

      v19 = v37;
    }
  }
  else if (objc_msgSend(v10, "unsignedIntValue") == 3)
  {
    +[_DDUIRemoteDisplaySessionHandler sharedInstance](_DDUIRemoteDisplaySessionHandler, "sharedInstance");
    v19 = (DDUIPairCompleteMessage *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[DDUIPairCompleteMessage shouldByPassConfirmationForRemoteDeviceID:](v19, "shouldByPassConfirmationForRemoteDeviceID:", v21);

    v23 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "remoteDevice");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v45 = v25;
      v46 = 1024;
      v47 = v22;
      _os_log_impl(&dword_1C87B2000, v23, OS_LOG_TYPE_DEFAULT, "Incoming dedicated continuity camera confirmation request from: %@, shouldByPassConfirmation: %d", buf, 0x12u);

    }
    objc_msgSend(v7, "remoteDevice");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v22)
    {
      objc_msgSend(v26, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[DDUIPairCompleteMessage enterSessionWithRemoteDeviceID:reason:](v19, "enterSessionWithRemoteDeviceID:reason:", v28, CFSTR("Automatic Dedicated Accept"));

      v29 = -[DDUIPairCompleteMessage initWithNotificationResult:]([DDUIPairCompleteMessage alloc], "initWithNotificationResult:", 1);
      objc_msgSend(v7, "pairWithMessage:", v29);
    }
    else
    {
      v33[0] = v6;
      v33[1] = 3221225472;
      v33[2] = __61__DDUICoreAgent__handleIncomingContinuityCameraConfirmation___block_invoke_25;
      v33[3] = &unk_1E81B44F8;
      v34 = (DDUIPairCompleteMessage *)v7;
      v35 = v19;
      -[DDUIPairCompleteMessage presentProxCardForDevice:completion:](v35, "presentProxCardForDevice:completion:", v27, v33);

      v29 = v34;
    }

  }
  else
  {
    objc_msgSend(v7, "sessionID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancelMessageWithID:", v32);

    +[_DDUIRemoteDisplaySessionHandler sharedInstance](_DDUIRemoteDisplaySessionHandler, "sharedInstance");
    v19 = (DDUIPairCompleteMessage *)objc_claimAutoreleasedReturnValue();
    -[DDUIPairCompleteMessage cancelCurrentProxCard](v19, "cancelCurrentProxCard");
  }

}

void __61__DDUICoreAgent__handleIncomingContinuityCameraConfirmation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__DDUICoreAgent__handleIncomingPairingSession_pairingMessage___block_invoke_cold_1();

  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelMessageWithID:", v6);

}

void __61__DDUICoreAgent__handleIncomingContinuityCameraConfirmation___block_invoke_18(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 138412546;
    v9 = v5;
    v10 = 1024;
    v11 = a2;
    _os_log_impl(&dword_1C87B2000, v4, OS_LOG_TYPE_DEFAULT, "incoming pairingSession, finished pairing {pairingSession: %@, result %d}", (uint8_t *)&v8, 0x12u);
  }

  if (a2 == 1)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelMessageWithID:", v7);

  }
}

void __61__DDUICoreAgent__handleIncomingContinuityCameraConfirmation___block_invoke_22(uint64_t a1, uint64_t a2)
{
  void *v4;
  DDUIPairCompleteMessage *v5;

  if (a2 == 1)
  {
    +[_DDUIRemoteDisplaySessionHandler sharedInstance](_DDUIRemoteDisplaySessionHandler, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "saveDedicatedDeviceInformation:", 0);

  }
  v5 = -[DDUIPairCompleteMessage initWithNotificationResult:]([DDUIPairCompleteMessage alloc], "initWithNotificationResult:", a2);
  objc_msgSend(*(id *)(a1 + 32), "pairWithMessage:", v5);

}

void __61__DDUICoreAgent__handleIncomingContinuityCameraConfirmation___block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  DDUIPairCompleteMessage *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.DeviceDiscoveryUI", "agent");
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "remoteDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v7;
      v20 = 2112;
      v21 = v3;
      _os_log_impl(&dword_1C87B2000, v4, OS_LOG_TYPE_DEFAULT, "Dedicated camera request from: %@, declined prox card setup: %@", (uint8_t *)&v18, 0x16u);

    }
    v8 = -[DDUIPairCompleteMessage initWithNotificationResult:]([DDUIPairCompleteMessage alloc], "initWithNotificationResult:", 7);
    v9 = a1 + 32;
  }
  else
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "remoteDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v11;
      _os_log_impl(&dword_1C87B2000, v4, OS_LOG_TYPE_DEFAULT, "Dedicated camera request from: %@, accepted prox card setup", (uint8_t *)&v18, 0xCu);

    }
    v12 = *(void **)(a1 + 32);
    v13 = *(void **)(a1 + 40);
    v9 = a1 + 32;
    objc_msgSend(v12, "remoteDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "enterSessionWithRemoteDeviceID:reason:", v15, CFSTR("Prox Card Dedicated Accept"));

    v16 = *(void **)(v9 + 8);
    objc_msgSend(*(id *)v9, "remoteDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "saveDedicatedDeviceInformation:", v17);

    v8 = -[DDUIPairCompleteMessage initWithNotificationResult:]([DDUIPairCompleteMessage alloc], "initWithNotificationResult:", 1);
  }
  objc_msgSend(*(id *)v9, "pairWithMessage:", v8);

}

- (DDUIEndpointPairingListener)endpointPairingListener
{
  return self->_endpointPairingListener;
}

- (void)setEndpointPairingListener:(id)a3
{
  objc_storeStrong((id *)&self->_endpointPairingListener, a3);
}

- (void)setNotificationManager:(id)a3
{
  objc_storeStrong((id *)&self->_notificationManager, a3);
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_endpointPairingListener, 0);
}

void __62__DDUICoreAgent__handleIncomingPairingSession_pairingMessage___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1C87B2000, v0, v1, "incoming pairingSession, failed to pair {pairingSession: %@ error %@}");
}

@end
