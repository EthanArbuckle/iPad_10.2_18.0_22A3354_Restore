@implementation LACDTOServiceXPCClient

- (LACDTOServiceXPCClient)initWithEndpointProvider:(id)a3
{
  id v5;
  LACDTOServiceXPCClient *v6;
  LACDTOServiceXPCClient *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACDTOServiceXPCClient;
  v6 = -[LACDTOServiceXPCClient init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpointProvider, a3);
    v7->_connectionLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)LACDTOServiceXPCClient;
  -[LACDTOServiceXPCClient dealloc](&v3, sel_dealloc);
}

- (id)ratchetState
{
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__3;
  v12 = __Block_byref_object_dispose__3;
  v2 = MEMORY[0x24BDAC760];
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__LACDTOServiceXPCClient_ratchetState__block_invoke;
  v7[3] = &unk_2510C1FF0;
  v7[4] = &v8;
  -[LACDTOServiceXPCClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __38__LACDTOServiceXPCClient_ratchetState__block_invoke_3;
  v6[3] = &unk_2510C2018;
  v6[4] = &v8;
  objc_msgSend(v3, "ratchetStateWithCompletion:", v6);

  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __38__LACDTOServiceXPCClient_ratchetState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  LACLogDTO();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __38__LACDTOServiceXPCClient_ratchetState__block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

void __38__LACDTOServiceXPCClient_ratchetState__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    LACLogDTO();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __38__LACDTOServiceXPCClient_ratchetState__block_invoke_3_cold_1();

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

}

- (BOOL)isFeatureEnabled
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = MEMORY[0x24BDAC760];
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__LACDTOServiceXPCClient_isFeatureEnabled__block_invoke;
  v6[3] = &unk_2510C1FF0;
  v6[4] = &v7;
  -[LACDTOServiceXPCClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __42__LACDTOServiceXPCClient_isFeatureEnabled__block_invoke_5;
  v5[3] = &unk_2510C2040;
  v5[4] = &v7;
  objc_msgSend(v3, "checkIsFeatureEnabledWithCompletion:", v5);

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __42__LACDTOServiceXPCClient_isFeatureEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  LACLogDTO();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __38__LACDTOServiceXPCClient_ratchetState__block_invoke_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

void __42__LACDTOServiceXPCClient_isFeatureEnabled__block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    LACLogDTO();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __42__LACDTOServiceXPCClient_isFeatureEnabled__block_invoke_5_cold_1();

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;

}

- (BOOL)isFeatureSupported
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = MEMORY[0x24BDAC760];
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__LACDTOServiceXPCClient_isFeatureSupported__block_invoke;
  v6[3] = &unk_2510C1FF0;
  v6[4] = &v7;
  -[LACDTOServiceXPCClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __44__LACDTOServiceXPCClient_isFeatureSupported__block_invoke_7;
  v5[3] = &unk_2510C2040;
  v5[4] = &v7;
  objc_msgSend(v3, "checkIsFeatureSupportedWithCompletion:", v5);

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __44__LACDTOServiceXPCClient_isFeatureSupported__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  LACLogDTO();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __38__LACDTOServiceXPCClient_ratchetState__block_invoke_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

void __44__LACDTOServiceXPCClient_isFeatureSupported__block_invoke_7(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    LACLogDTO();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __44__LACDTOServiceXPCClient_isFeatureSupported__block_invoke_7_cold_1();

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;

}

- (BOOL)isFeatureAvailable
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = MEMORY[0x24BDAC760];
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__LACDTOServiceXPCClient_isFeatureAvailable__block_invoke;
  v6[3] = &unk_2510C1FF0;
  v6[4] = &v7;
  -[LACDTOServiceXPCClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __44__LACDTOServiceXPCClient_isFeatureAvailable__block_invoke_8;
  v5[3] = &unk_2510C2040;
  v5[4] = &v7;
  objc_msgSend(v3, "checkIsFeatureAvailableWithCompletion:", v5);

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __44__LACDTOServiceXPCClient_isFeatureAvailable__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  LACLogDTO();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __38__LACDTOServiceXPCClient_ratchetState__block_invoke_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

void __44__LACDTOServiceXPCClient_isFeatureAvailable__block_invoke_8(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    LACLogDTO();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __44__LACDTOServiceXPCClient_isFeatureAvailable__block_invoke_8_cold_1();

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;

}

- (BOOL)isFeatureStrictModeEnabled
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = MEMORY[0x24BDAC760];
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__LACDTOServiceXPCClient_isFeatureStrictModeEnabled__block_invoke;
  v6[3] = &unk_2510C1FF0;
  v6[4] = &v7;
  -[LACDTOServiceXPCClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __52__LACDTOServiceXPCClient_isFeatureStrictModeEnabled__block_invoke_9;
  v5[3] = &unk_2510C2040;
  v5[4] = &v7;
  objc_msgSend(v3, "checkIsFeatureStrictModeEnabledWithCompletion:", v5);

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __52__LACDTOServiceXPCClient_isFeatureStrictModeEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  LACLogDTO();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __38__LACDTOServiceXPCClient_ratchetState__block_invoke_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

void __52__LACDTOServiceXPCClient_isFeatureStrictModeEnabled__block_invoke_9(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    LACLogDTO();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __52__LACDTOServiceXPCClient_isFeatureStrictModeEnabled__block_invoke_9_cold_1();

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;

}

- (BOOL)isSensorTrusted
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = MEMORY[0x24BDAC760];
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__LACDTOServiceXPCClient_isSensorTrusted__block_invoke;
  v6[3] = &unk_2510C1FF0;
  v6[4] = &v7;
  -[LACDTOServiceXPCClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __41__LACDTOServiceXPCClient_isSensorTrusted__block_invoke_10;
  v5[3] = &unk_2510C2040;
  v5[4] = &v7;
  objc_msgSend(v3, "checkIsSensorTrustedWithCompletion:", v5);

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __41__LACDTOServiceXPCClient_isSensorTrusted__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  LACLogDTO();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __38__LACDTOServiceXPCClient_ratchetState__block_invoke_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

void __41__LACDTOServiceXPCClient_isSensorTrusted__block_invoke_10(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    LACLogDTO();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __41__LACDTOServiceXPCClient_isSensorTrusted__block_invoke_10_cold_1();

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;

}

- (void)ratchetStateWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__LACDTOServiceXPCClient_ratchetStateWithCompletion___block_invoke;
  v7[3] = &unk_2510C0D20;
  v8 = v4;
  v5 = v4;
  -[LACDTOServiceXPCClient _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ratchetStateWithCompletion:", v5);

}

uint64_t __53__LACDTOServiceXPCClient_ratchetStateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)ratchetStateCompositeWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__LACDTOServiceXPCClient_ratchetStateCompositeWithCompletion___block_invoke;
  v7[3] = &unk_2510C0D20;
  v8 = v4;
  v5 = v4;
  -[LACDTOServiceXPCClient _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ratchetStateCompositeWithCompletion:", v5);

}

uint64_t __62__LACDTOServiceXPCClient_ratchetStateCompositeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)checkIsFeatureEnabledWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__LACDTOServiceXPCClient_checkIsFeatureEnabledWithCompletion___block_invoke;
  v7[3] = &unk_2510C0D20;
  v8 = v4;
  v5 = v4;
  -[LACDTOServiceXPCClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "checkIsFeatureEnabledWithCompletion:", v5);

}

uint64_t __62__LACDTOServiceXPCClient_checkIsFeatureEnabledWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)checkIsFeatureSupportedWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__LACDTOServiceXPCClient_checkIsFeatureSupportedWithCompletion___block_invoke;
  v7[3] = &unk_2510C0D20;
  v8 = v4;
  v5 = v4;
  -[LACDTOServiceXPCClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "checkIsFeatureSupportedWithCompletion:", v5);

}

uint64_t __64__LACDTOServiceXPCClient_checkIsFeatureSupportedWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)checkIsFeatureAvailableWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__LACDTOServiceXPCClient_checkIsFeatureAvailableWithCompletion___block_invoke;
  v7[3] = &unk_2510C0D20;
  v8 = v4;
  v5 = v4;
  -[LACDTOServiceXPCClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "checkIsFeatureAvailableWithCompletion:", v5);

}

uint64_t __64__LACDTOServiceXPCClient_checkIsFeatureAvailableWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)checkIsFeatureStrictModeEnabledWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__LACDTOServiceXPCClient_checkIsFeatureStrictModeEnabledWithCompletion___block_invoke;
  v7[3] = &unk_2510C0D20;
  v8 = v4;
  v5 = v4;
  -[LACDTOServiceXPCClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "checkIsFeatureStrictModeEnabledWithCompletion:", v5);

}

uint64_t __72__LACDTOServiceXPCClient_checkIsFeatureStrictModeEnabledWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)disableFeatureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[LACDTOServiceXPCClient _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "disableFeatureWithContext:completion:", v7, v6);

}

- (void)checkCanEnableFeatureWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__LACDTOServiceXPCClient_checkCanEnableFeatureWithCompletion___block_invoke;
  v7[3] = &unk_2510C0D20;
  v8 = v4;
  v5 = v4;
  -[LACDTOServiceXPCClient _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "checkCanEnableFeatureWithCompletion:", v5);

}

uint64_t __62__LACDTOServiceXPCClient_checkCanEnableFeatureWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enableFeatureWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__LACDTOServiceXPCClient_enableFeatureWithCompletion___block_invoke;
  v7[3] = &unk_2510C0D20;
  v8 = v4;
  v5 = v4;
  -[LACDTOServiceXPCClient _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enableFeatureWithCompletion:", v5);

}

uint64_t __54__LACDTOServiceXPCClient_enableFeatureWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enableFeatureStrictModeWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__LACDTOServiceXPCClient_enableFeatureStrictModeWithCompletion___block_invoke;
  v7[3] = &unk_2510C0D20;
  v8 = v4;
  v5 = v4;
  -[LACDTOServiceXPCClient _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enableFeatureStrictModeWithCompletion:", v5);

}

uint64_t __64__LACDTOServiceXPCClient_enableFeatureStrictModeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)disableFeatureStrictModeWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __73__LACDTOServiceXPCClient_disableFeatureStrictModeWithContext_completion___block_invoke;
  v10[3] = &unk_2510C0D20;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[LACDTOServiceXPCClient _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "disableFeatureStrictModeWithContext:completion:", v8, v7);

}

uint64_t __73__LACDTOServiceXPCClient_disableFeatureStrictModeWithContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cancelPendingEvaluationWithRatchetIdentifier:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __89__LACDTOServiceXPCClient_cancelPendingEvaluationWithRatchetIdentifier_reason_completion___block_invoke;
  v13[3] = &unk_2510C0D20;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[LACDTOServiceXPCClient _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cancelPendingEvaluationWithRatchetIdentifier:reason:completion:", v11, v10, v9);

}

uint64_t __89__LACDTOServiceXPCClient_cancelPendingEvaluationWithRatchetIdentifier_reason_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[LACDTOServiceXPCClient _connectionWithErrorHandler:](self, "_connectionWithErrorHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[LACDTOServiceXPCClient _connectionWithErrorHandler:](self, "_connectionWithErrorHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_connectionWithErrorHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  uint64_t v5;
  LACDTOServiceXPCEndpointProvider *endpointProvider;
  void *v7;
  NSXPCConnection *v8;
  NSXPCConnection *connection;
  void *v10;
  void *v11;
  NSXPCConnection *v12;
  _QWORD aBlock[4];
  id v15;
  id location;
  id v17;

  v4 = (void (**)(id, uint64_t))a3;
  os_unfair_lock_lock(&self->_connectionLock);
  if (self->_connection)
  {
    v5 = 0;
  }
  else
  {
    endpointProvider = self->_endpointProvider;
    v17 = 0;
    -[LACDTOServiceXPCEndpointProvider endpoint:](endpointProvider, "endpoint:", &v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (uint64_t)v17;
    if (v7)
    {
      v8 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithListenerEndpoint:", v7);
      connection = self->_connection;
      self->_connection = v8;

      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_257085C60);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v10);

      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __54__LACDTOServiceXPCClient__connectionWithErrorHandler___block_invoke;
      aBlock[3] = &unk_2510C0EB0;
      objc_copyWeak(&v15, &location);
      v11 = _Block_copy(aBlock);
      -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v11);
      -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v11);
      -[NSXPCConnection resume](self->_connection, "resume");

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }

    if (!((uint64_t)self->_connection | v5))
    {
      +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1000, CFSTR("XPC connection to LACDTOServiceXPC could not be created"));
      v5 = objc_claimAutoreleasedReturnValue();
    }
    if (v5)
      v4[2](v4, v5);
  }
  os_unfair_lock_unlock(&self->_connectionLock);
  v12 = self->_connection;

  return v12;
}

void __54__LACDTOServiceXPCClient__connectionWithErrorHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleConnectionClose");

}

- (void)_handleConnectionClose
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2409DC000, log, OS_LOG_TYPE_ERROR, "XPC connection to LACDTOServiceXPC endpoint closed", v1, 2u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_endpointProvider, 0);
}

void __38__LACDTOServiceXPCClient_ratchetState__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, v0, v1, "Could not get synchronous remote object proxy (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __38__LACDTOServiceXPCClient_ratchetState__block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, v0, v1, "Could not fetch ratchet state (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __42__LACDTOServiceXPCClient_isFeatureEnabled__block_invoke_5_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, v0, v1, "Could not fetch feature enabled status (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __44__LACDTOServiceXPCClient_isFeatureSupported__block_invoke_7_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, v0, v1, "Could not fetch feature supported status (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __44__LACDTOServiceXPCClient_isFeatureAvailable__block_invoke_8_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, v0, v1, "Could not fetch feature available status (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __52__LACDTOServiceXPCClient_isFeatureStrictModeEnabled__block_invoke_9_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, v0, v1, "Could not fetch feature strict mode status (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __41__LACDTOServiceXPCClient_isSensorTrusted__block_invoke_10_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, v0, v1, "Could not fetch sensor trust status (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
