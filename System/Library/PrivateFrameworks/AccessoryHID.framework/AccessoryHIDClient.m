@implementation AccessoryHIDClient

- (AccessoryHIDClient)initWithDelegate:(id)a3
{
  id v4;
  AccessoryHIDClient *v5;
  AccessoryHIDClient *v6;
  NSXPCConnection *serverConnection;
  AccessoryHIDXPCServerProtocol *remoteObject;
  NSMutableDictionary *registeredHIDDescriptors;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, int);
  void *v14;
  id v15;
  id location;
  objc_super v17;

  v4 = a3;
  init_logging();
  v17.receiver = self;
  v17.super_class = (Class)AccessoryHIDClient;
  v5 = -[AccessoryHIDClient init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    serverConnection = v6->_serverConnection;
    v6->_serverConnection = 0;

    remoteObject = v6->_remoteObject;
    v6->_remoteObject = 0;

    registeredHIDDescriptors = v6->_registeredHIDDescriptors;
    v6->_registeredHIDDescriptors = 0;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v6);
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __39__AccessoryHIDClient_initWithDelegate___block_invoke;
    v14 = &unk_24D749D08;
    objc_copyWeak(&v15, &location);
    accessoryServer_registerAvailabilityChangedHandler("com.apple.accessories.hid.availability-changed", &v11);
    -[AccessoryHIDClient connectToServer](v6, "connectToServer", v11, v12, v13, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __39__AccessoryHIDClient_initWithDelegate___block_invoke(uint64_t a1, int a2)
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
      __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1();
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
    _os_log_impl(&dword_217365000, v6, OS_LOG_TYPE_DEFAULT, "Server availability changed! State: %d", (uint8_t *)v10, 8u);
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
        __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1();
      v7 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_217365000, v7, OS_LOG_TYPE_DEFAULT, "Trying to connect to server...", (uint8_t *)v10, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "connectToServer");

  }
}

- (void)dealloc
{
  NSMutableDictionary *registeredHIDDescriptors;
  void *v4;
  objc_super v5;

  accessoryServer_unregisterAvailabilityChangedHandler();
  registeredHIDDescriptors = self->_registeredHIDDescriptors;
  self->_registeredHIDDescriptors = 0;

  -[AccessoryHIDClient serverConnection](self, "serverConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  v5.receiver = self;
  v5.super_class = (Class)AccessoryHIDClient;
  -[AccessoryHIDClient dealloc](&v5, sel_dealloc);
}

- (void)connectToServer
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_217365000, log, OS_LOG_TYPE_DEBUG, "Getting remote object...", v1, 2u);
  OUTLINED_FUNCTION_4();
}

void __37__AccessoryHIDClient_connectToServer__block_invoke(uint64_t a1)
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
      __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_217365000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated!", v8, 2u);
  }

}

void __37__AccessoryHIDClient_connectToServer__block_invoke_75(uint64_t a1)
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
      __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_217365000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted!", v8, 2u);
  }

}

void __37__AccessoryHIDClient_connectToServer__block_invoke_76(uint64_t a1, void *a2)
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
      __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __37__AccessoryHIDClient_connectToServer__block_invoke_76_cold_1((uint64_t)v2, v5);

}

void __37__AccessoryHIDClient_connectToServer__block_invoke_78(uint64_t a1, int a2)
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
      __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1();
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
    _os_log_impl(&dword_217365000, v6, OS_LOG_TYPE_DEFAULT, "shouldStayConnected: %d", (uint8_t *)v9, 8u);
  }

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "serverConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

  }
}

- (void)sendOutReport:(id)a3 fromUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[AccessoryHIDClient registeredHIDDescriptors](self, "registeredHIDDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v24)
  {
    v9 = *(_QWORD *)v30;
    v22 = *(_QWORD *)v30;
    v23 = v6;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v8);
        v11 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        -[AccessoryHIDClient registeredHIDDescriptors](self, "registeredHIDDescriptors");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v26;
          while (2)
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v26 != v17)
                objc_enumerationMutation(v14);
              v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
              objc_msgSend(v14, "objectForKey:", v19);
              v20 = (id)objc_claimAutoreleasedReturnValue();
              if (v20 == v7)
              {
                -[AccessoryHIDClient remoteObject](self, "remoteObject");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v6 = v23;
                objc_msgSend(v21, "outReport:componentID:report:withReply:", v11, v19, v23, &__block_literal_global_79);

                goto LABEL_18;
              }

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            if (v16)
              continue;
            break;
          }
        }

        v9 = v22;
      }
      v6 = v23;
      v24 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v24);
  }
LABEL_18:

}

void __45__AccessoryHIDClient_sendOutReport_fromUUID___block_invoke()
{
  BOOL v0;
  id v1;
  NSObject *v2;

  if (gLogObjects)
    v0 = gNumLogObjects < 1;
  else
    v0 = 1;
  if (v0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1();
    v2 = MEMORY[0x24BDACB70];
    v1 = MEMORY[0x24BDACB70];
  }
  else
  {
    v2 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __45__AccessoryHIDClient_sendOutReport_fromUUID___block_invoke_cold_1();

}

- (void)sendGetReportForType:(id)a3 andID:(id)a4 fromUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[AccessoryHIDClient registeredHIDDescriptors](self, "registeredHIDDescriptors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v27)
  {
    v12 = *(_QWORD *)v34;
    v25 = *(_QWORD *)v34;
    v26 = v8;
    v28 = v9;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v11);
        v14 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[AccessoryHIDClient registeredHIDDescriptors](self, "registeredHIDDescriptors", v25);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v30;
          while (2)
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v30 != v20)
                objc_enumerationMutation(v17);
              v22 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
              objc_msgSend(v17, "objectForKey:", v22);
              v23 = (id)objc_claimAutoreleasedReturnValue();
              if (v23 == v10)
              {
                -[AccessoryHIDClient remoteObject](self, "remoteObject");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v8 = v26;
                v9 = v28;
                objc_msgSend(v24, "getReport:componentID:reportType:reportID:withReply:", v14, v22, v26, v28, &__block_literal_global_80);

                goto LABEL_18;
              }

            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            if (v19)
              continue;
            break;
          }
        }

        v9 = v28;
        v12 = v25;
      }
      v8 = v26;
      v27 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v27);
  }
LABEL_18:

}

void __58__AccessoryHIDClient_sendGetReportForType_andID_fromUUID___block_invoke()
{
  BOOL v0;
  id v1;
  NSObject *v2;

  if (gLogObjects)
    v0 = gNumLogObjects < 1;
  else
    v0 = 1;
  if (v0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1();
    v2 = MEMORY[0x24BDACB70];
    v1 = MEMORY[0x24BDACB70];
  }
  else
  {
    v2 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __58__AccessoryHIDClient_sendGetReportForType_andID_fromUUID___block_invoke_cold_1();

}

- (void)hidDescriptor:(id)a3 active:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  _BOOL4 v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v4 = a4;
  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[AccessoryHIDClient registeredHIDDescriptors](self, "registeredHIDDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v23)
  {
    v8 = *(_QWORD *)v29;
    v22 = v4;
    v21 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v7);
        v10 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        -[AccessoryHIDClient registeredHIDDescriptors](self, "registeredHIDDescriptors");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v25;
          while (2)
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v25 != v16)
                objc_enumerationMutation(v13);
              v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
              objc_msgSend(v13, "objectForKey:", v18);
              v19 = (id)objc_claimAutoreleasedReturnValue();
              if (v19 == v6)
              {
                -[AccessoryHIDClient remoteObject](self, "remoteObject");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "componentUpdate:componentID:enabled:withReply:", v10, v18, v22, &__block_literal_global_81);

                goto LABEL_18;
              }

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v15)
              continue;
            break;
          }
        }

        v8 = v21;
      }
      v23 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v23);
  }
LABEL_18:

}

void __43__AccessoryHIDClient_hidDescriptor_active___block_invoke()
{
  BOOL v0;
  id v1;
  NSObject *v2;

  if (gLogObjects)
    v0 = gNumLogObjects < 1;
  else
    v0 = 1;
  if (v0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1();
    v2 = MEMORY[0x24BDACB70];
    v1 = MEMORY[0x24BDACB70];
  }
  else
  {
    v2 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __43__AccessoryHIDClient_hidDescriptor_active___block_invoke_cold_1();

}

- (void)registerHIDDescriptor:(id)a3 componentID:(unsigned __int16)a4 dictionary:(id)a5 withReply:(id)a6
{
  unsigned int v8;
  id v10;
  void (**v11)(id, void *);
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  v8 = a4;
  v23 = a3;
  v10 = a5;
  v11 = (void (**)(id, void *))a6;
  -[AccessoryHIDClient delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
LABEL_9:
    if (!v11)
      goto LABEL_11;
LABEL_10:
    v11[2](v11, v12);
    goto LABEL_11;
  }
  -[AccessoryHIDClient delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) == 0)
  {
    v12 = 0;
    goto LABEL_9;
  }
  -[AccessoryHIDClient delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "createHIDDescriptor:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_9;
  -[AccessoryHIDClient registeredHIDDescriptors](self, "registeredHIDDescriptors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[AccessoryHIDClient setRegisteredHIDDescriptors:](self, "setRegisteredHIDDescriptors:", v17);

  }
  -[AccessoryHIDClient registeredHIDDescriptors](self, "registeredHIDDescriptors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v12, v20);
  }
  else
  {
    v20 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v12, v21);

    -[AccessoryHIDClient registeredHIDDescriptors](self, "registeredHIDDescriptors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v20, v23);

  }
  if (v11)
    goto LABEL_10;
LABEL_11:

}

- (void)unregisterHIDDescriptor:(id)a3 componentID:(unsigned __int16)a4 withReply:(id)a5
{
  uint64_t v6;
  void (**v8)(id, uint64_t);
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v6 = a4;
  v20 = a3;
  v8 = (void (**)(id, uint64_t))a5;
  -[AccessoryHIDClient delegate](self, "delegate");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_8;
  v10 = (void *)v9;
  -[AccessoryHIDClient delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) == 0
    || (-[AccessoryHIDClient registeredHIDDescriptors](self, "registeredHIDDescriptors"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
LABEL_8:
    v19 = 0;
    if (!v8)
      goto LABEL_10;
LABEL_9:
    v8[2](v8, v19);
    goto LABEL_10;
  }
  -[AccessoryHIDClient registeredHIDDescriptors](self, "registeredHIDDescriptors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", v6);
    if (v16)
    {
      objc_msgSend(v15, "objectForKey:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        -[AccessoryHIDClient delegate](self, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "deleteHIDDescriptor:", v17);

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  if (v8)
    goto LABEL_9;
LABEL_10:

}

- (void)unregisterAllDescriptors:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[AccessoryHIDClient delegate](self, "delegate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_12;
  v9 = (void *)v8;
  -[AccessoryHIDClient delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) == 0
    || (-[AccessoryHIDClient registeredHIDDescriptors](self, "registeredHIDDescriptors"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        !v12))
  {
LABEL_12:
    LOBYTE(v18) = 0;
    if (!v7)
      goto LABEL_14;
LABEL_13:
    v7[2](v7, v18 & 1);
    goto LABEL_14;
  }
  -[AccessoryHIDClient registeredHIDDescriptors](self, "registeredHIDDescriptors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v16)
  {
    v17 = v16;
    v25 = v6;
    v18 = 0;
    v19 = 0;
    v20 = *(_QWORD *)v27;
    do
    {
      v21 = 0;
      v22 = v19;
      do
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v15);
        v19 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * v21);

        -[AccessoryHIDClient delegate](self, "delegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v18 |= objc_msgSend(v23, "deleteHIDDescriptor:", v24);

        ++v21;
        v22 = v19;
      }
      while (v17 != v21);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v17);

    v6 = v25;
  }
  else
  {
    LOBYTE(v18) = 0;
  }

  if (v7)
    goto LABEL_13;
LABEL_14:

}

- (void)inReport:(id)a3 componentID:(unsigned __int16)a4 report:(id)a5 withReply:(id)a6
{
  uint64_t v8;
  id v10;
  void (**v11)(id, uint64_t);
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;

  v8 = a4;
  v23 = a3;
  v10 = a5;
  v11 = (void (**)(id, uint64_t))a6;
  -[AccessoryHIDClient delegate](self, "delegate");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_8;
  v13 = (void *)v12;
  -[AccessoryHIDClient delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) == 0
    || (-[AccessoryHIDClient registeredHIDDescriptors](self, "registeredHIDDescriptors"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v16,
        !v16))
  {
LABEL_8:
    v22 = 0;
    if (!v11)
      goto LABEL_10;
LABEL_9:
    v11[2](v11, v22);
    goto LABEL_10;
  }
  -[AccessoryHIDClient registeredHIDDescriptors](self, "registeredHIDDescriptors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", v8);
    if (v19)
    {
      objc_msgSend(v18, "objectForKey:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        -[AccessoryHIDClient delegate](self, "delegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "processInReport:forUUID:", v10, v20);

      }
      else
      {
        v22 = 0;
      }

    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  if (v11)
    goto LABEL_9;
LABEL_10:

}

- (void)getReportResponse:(id)a3 componentID:(unsigned __int16)a4 reportType:(unsigned __int8)a5 reportID:(unsigned __int8)a6 report:(id)a7 withReply:(id)a8
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;
  void (**v15)(id, uint64_t);
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v27 = a3;
  v14 = a7;
  v15 = (void (**)(id, uint64_t))a8;
  -[AccessoryHIDClient delegate](self, "delegate");
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_8;
  v17 = (void *)v16;
  -[AccessoryHIDClient delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) == 0
    || (-[AccessoryHIDClient registeredHIDDescriptors](self, "registeredHIDDescriptors"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v20,
        !v20))
  {
LABEL_8:
    v26 = 0;
    if (!v15)
      goto LABEL_10;
LABEL_9:
    v15[2](v15, v26);
    goto LABEL_10;
  }
  -[AccessoryHIDClient registeredHIDDescriptors](self, "registeredHIDDescriptors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKey:", v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", v12);
    if (v23)
    {
      objc_msgSend(v22, "objectForKey:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        -[AccessoryHIDClient delegate](self, "delegate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "processGetReportResponse:reportType:reportID:forUUID:", v14, v11, v10, v24);

      }
      else
      {
        v26 = 0;
      }

    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    v26 = 0;
  }

  if (v15)
    goto LABEL_9;
LABEL_10:

}

- (AccessoryHIDClientProtocol)delegate
{
  return (AccessoryHIDClientProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (AccessoryHIDXPCServerProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObject, a3);
}

- (NSMutableDictionary)registeredHIDDescriptors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRegisteredHIDDescriptors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredHIDDescriptors, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_217365000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __37__AccessoryHIDClient_connectToServer__block_invoke_76_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_217365000, a2, OS_LOG_TYPE_ERROR, "XPC connection error: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __45__AccessoryHIDClient_sendOutReport_fromUUID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_217365000, v0, v1, "sendOutReport result: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __58__AccessoryHIDClient_sendGetReportForType_andID_fromUUID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_217365000, v0, v1, "getReport result: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __43__AccessoryHIDClient_hidDescriptor_active___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_217365000, v0, v1, "componentUpdate result: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
