@implementation ACCAudioClient

- (ACCAudioClient)initWithDelegate:(id)a3
{
  id v4;
  ACCAudioClient *v5;
  ACCAudioClient *v6;
  NSXPCConnection *serverConnection;
  ACCAudioXPCServerProtocol *remoteObject;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, int);
  void *v13;
  id v14;
  id location;
  objc_super v16;

  v4 = a3;
  init_logging();
  v16.receiver = self;
  v16.super_class = (Class)ACCAudioClient;
  v5 = -[ACCAudioClient init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    serverConnection = v6->_serverConnection;
    v6->_serverConnection = 0;

    remoteObject = v6->_remoteObject;
    v6->_remoteObject = 0;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v6);
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __35__ACCAudioClient_initWithDelegate___block_invoke;
    v13 = &unk_24DE4FCB8;
    objc_copyWeak(&v14, &location);
    accessoryServer_registerAvailabilityChangedHandler("com.apple.accessories.audio.availability-changed", &v10);
    -[ACCAudioClient connectToServer](v6, "connectToServer", v10, v11, v12, v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __35__ACCAudioClient_initWithDelegate___block_invoke(uint64_t a1, int a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  id WeakRetained;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = a2;
    _os_log_impl(&dword_21B14B000, v6, OS_LOG_TYPE_DEFAULT, "Server availability changed! State: %d", (uint8_t *)v10, 8u);
  }

  if (a2)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v7 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_21B14B000, v7, OS_LOG_TYPE_DEFAULT, "Trying to connect to server...", (uint8_t *)v10, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "connectToServer");

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  accessoryServer_unregisterAvailabilityChangedHandler();
  -[ACCAudioClient serverConnection](self, "serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)ACCAudioClient;
  -[ACCAudioClient dealloc](&v4, sel_dealloc);
}

- (void)connectToServer
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21B14B000, log, OS_LOG_TYPE_DEBUG, "Getting remote object...", v1, 2u);
}

void __33__ACCAudioClient_connectToServer__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t v8[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInvalidationHandler:", 0);

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "setRemoteObject:", 0);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "setServerConnection:", 0);

  accessoryServer_serverIsUnreachable();
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21B14B000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated!", v8, 2u);
  }

}

void __33__ACCAudioClient_connectToServer__block_invoke_63(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t v8[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setRemoteObject:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "serverConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "setServerConnection:", 0);

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21B14B000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted!", v8, 2u);
  }

}

void __33__ACCAudioClient_connectToServer__block_invoke_64(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __33__ACCAudioClient_connectToServer__block_invoke_64_cold_1();

}

void __33__ACCAudioClient_connectToServer__block_invoke_66(uint64_t a1, int a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = a2;
    _os_log_impl(&dword_21B14B000, v6, OS_LOG_TYPE_DEFAULT, "shouldStayConnected: %d", (uint8_t *)v9, 8u);
  }

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "serverConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

  }
}

- (void)registerForAccessoryDigitalAudioNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)AccessoryDigitalAudioNotificationCallBack, CFSTR("com.apple.accessories.audio.stateChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)unregisterForAccessoryDigitalAudioNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0, CFSTR("com.apple.accessories.audio.stateChanged"), 0);
}

- (BOOL)setDigitalAudioSampleRate:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  int v8;
  char v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v3 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[ACCAudioClient serverConnection](self, "serverConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_69);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __44__ACCAudioClient_setDigitalAudioSampleRate___block_invoke_70;
  v11[3] = &unk_24DE4FD68;
  v11[4] = &v12;
  objc_msgSend(v5, "setDigitalAudioSampleRate:withReply:", v3, v11);

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = *((unsigned __int8 *)v13 + 24);
    *(_DWORD *)buf = 67109120;
    v17 = v8;
    _os_log_impl(&dword_21B14B000, v6, OS_LOG_TYPE_INFO, "retValue: %d", buf, 8u);
  }

  v9 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v9;
}

void __44__ACCAudioClient_setDigitalAudioSampleRate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __33__ACCAudioClient_connectToServer__block_invoke_64_cold_1();

}

uint64_t __44__ACCAudioClient_setDigitalAudioSampleRate___block_invoke_70(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (unsigned)supportedDigitalAudioSampleRate:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  int v8;
  unsigned int v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v3 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[ACCAudioClient serverConnection](self, "serverConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_71);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__ACCAudioClient_supportedDigitalAudioSampleRate___block_invoke_72;
  v11[3] = &unk_24DE4FDB0;
  v11[4] = &v12;
  objc_msgSend(v5, "supportedDigitalAudioSampleRate:withReply:", v3, v11);

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = *((_DWORD *)v13 + 6);
    *(_DWORD *)buf = 67109376;
    v17 = v3;
    v18 = 1024;
    v19 = v8;
    _os_log_impl(&dword_21B14B000, v6, OS_LOG_TYPE_INFO, "inputRate: %d, supportedRate: %d", buf, 0xEu);
  }

  v9 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v9;
}

void __50__ACCAudioClient_supportedDigitalAudioSampleRate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __33__ACCAudioClient_connectToServer__block_invoke_64_cold_1();

}

uint64_t __50__ACCAudioClient_supportedDigitalAudioSampleRate___block_invoke_72(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)supportedDigitalAudioSampleRates
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  -[ACCAudioClient serverConnection](self, "serverConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_74);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__ACCAudioClient_supportedDigitalAudioSampleRates__block_invoke_75;
  v9[3] = &unk_24DE4FDF8;
  v9[4] = &v10;
  objc_msgSend(v3, "supportedDigitalAudioSampleRatesWithReply:", v9);

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v4 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v4 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = v11[5];
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_21B14B000, v4, OS_LOG_TYPE_INFO, "ratesArray: %@", buf, 0xCu);
  }

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __50__ACCAudioClient_supportedDigitalAudioSampleRates__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __33__ACCAudioClient_connectToServer__block_invoke_64_cold_1();

}

void __50__ACCAudioClient_supportedDigitalAudioSampleRates__block_invoke_75(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)deviceAudioStates
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  -[ACCAudioClient serverConnection](self, "serverConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_77);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __35__ACCAudioClient_deviceAudioStates__block_invoke_78;
  v9[3] = &unk_24DE4FDF8;
  v9[4] = &v10;
  objc_msgSend(v3, "deviceAudioStatesWithReply:", v9);

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v4 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v4 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = v11[5];
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_21B14B000, v4, OS_LOG_TYPE_INFO, "audioStates: %@", buf, 0xCu);
  }

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __35__ACCAudioClient_deviceAudioStates__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __33__ACCAudioClient_connectToServer__block_invoke_64_cold_1();

}

void __35__ACCAudioClient_deviceAudioStates__block_invoke_78(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)allowBackgroundAudioForClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  int v12;
  id v13;
  BOOL v14;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  -[ACCAudioClient serverConnection](self, "serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ACCAudioClient serverConnection](self, "serverConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_79);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __48__ACCAudioClient_allowBackgroundAudioForClient___block_invoke_80;
    v16[3] = &unk_24DE4FE60;
    v8 = v4;
    v17 = v8;
    v18 = &v19;
    objc_msgSend(v7, "allowBackgroundAudioForClient:withReply:", v8, v16);

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v9 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *((unsigned __int8 *)v20 + 24);
      *(_DWORD *)buf = 67109378;
      v24 = v12;
      v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_21B14B000, v9, OS_LOG_TYPE_DEFAULT, "allowBackgroundAudio: %d for client %@", buf, 0x12u);
    }

    v10 = v17;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
      v10 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B14B000, v10, OS_LOG_TYPE_DEFAULT, "no server connection when checking background audio state, won't allow background audio!", buf, 2u);
    }
  }

  v14 = *((_BYTE *)v20 + 24) != 0;
  _Block_object_dispose(&v19, 8);

  return v14;
}

void __48__ACCAudioClient_allowBackgroundAudioForClient___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __33__ACCAudioClient_connectToServer__block_invoke_64_cold_1();

}

void __48__ACCAudioClient_allowBackgroundAudioForClient___block_invoke_80(uint64_t a1, int a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  _DWORD v8[2];
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8[0] = 67109378;
    v8[1] = a2;
    v9 = 2112;
    v10 = v7;
    _os_log_impl(&dword_21B14B000, v6, OS_LOG_TYPE_INFO, "allowBackgroundAudioForClient reply: %d for client %@", (uint8_t *)v8, 0x12u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
}

- (ACCAudioClientProtocol)delegate
{
  return (ACCAudioClientProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serverConnection, a3);
}

- (ACCAudioXPCServerProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __33__ACCAudioClient_connectToServer__block_invoke_64_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_21B14B000, v0, v1, "XPC connection error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
