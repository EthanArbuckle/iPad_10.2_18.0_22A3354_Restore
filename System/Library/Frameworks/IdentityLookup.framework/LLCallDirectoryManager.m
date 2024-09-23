@implementation LLCallDirectoryManager

+ (LLCallDirectoryManager)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__LLCallDirectoryManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (LLCallDirectoryManager *)(id)sharedInstance_sharedInstance;
}

void __40__LLCallDirectoryManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (LLCallDirectoryManager)init
{
  LLCallDirectoryManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LLCallDirectoryManager;
  v2 = -[LLCallDirectoryManager init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.livelookup.calldirectorymanager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_defaultConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)LLCallDirectoryManager;
  -[LLCallDirectoryManager dealloc](&v3, sel_dealloc);
}

- (NSXPCConnection)defaultConnection
{
  NSXPCConnection *defaultConnection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  defaultConnection = self->_defaultConnection;
  if (!defaultConnection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.CallKit.CallDirectory"));
    v5 = self->_defaultConnection;
    self->_defaultConnection = v4;

    -[LLCallDirectoryManager callDirectoryManagerDefaultHostInterface](self, "callDirectoryManagerDefaultHostInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_defaultConnection, "setRemoteObjectInterface:", v6);

    objc_initWeak(&location, self);
    v7 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __43__LLCallDirectoryManager_defaultConnection__block_invoke;
    v11[3] = &unk_24CE06D60;
    objc_copyWeak(&v12, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_defaultConnection, "setInterruptionHandler:", v11);
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __43__LLCallDirectoryManager_defaultConnection__block_invoke_2;
    v9[3] = &unk_24CE06D60;
    objc_copyWeak(&v10, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_defaultConnection, "setInvalidationHandler:", v9);
    -[NSXPCConnection resume](self->_defaultConnection, "resume");
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    defaultConnection = self->_defaultConnection;
  }
  return defaultConnection;
}

void __43__LLCallDirectoryManager_defaultConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  ILDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = WeakRetained;
    _os_log_impl(&dword_2126D5000, v2, OS_LOG_TYPE_DEFAULT, "Default connection interrupted for call directory manager %@", buf, 0xCu);
  }

  objc_msgSend(WeakRetained, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(WeakRetained, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__LLCallDirectoryManager_defaultConnection__block_invoke_5;
    block[3] = &unk_24CE06D38;
    block[4] = WeakRetained;
    dispatch_async(v4, block);

  }
}

uint64_t __43__LLCallDirectoryManager_defaultConnection__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
}

void __43__LLCallDirectoryManager_defaultConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  ILDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = WeakRetained;
    _os_log_impl(&dword_2126D5000, v2, OS_LOG_TYPE_DEFAULT, "Default connection invalidated for call directory manager %@", buf, 0xCu);
  }

  objc_msgSend(WeakRetained, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(WeakRetained, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__LLCallDirectoryManager_defaultConnection__block_invoke_6;
    block[3] = &unk_24CE06D38;
    block[4] = WeakRetained;
    dispatch_async(v4, block);

  }
}

void __43__LLCallDirectoryManager_defaultConnection__block_invoke_6(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;

}

- (id)defaultConnectionRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[LLCallDirectoryManager defaultConnection](self, "defaultConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)callDirectoryManagerDefaultHostInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B5AC28);
}

- (void)resetExtensionWithIdentier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    -[LLCallDirectoryManager queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__LLCallDirectoryManager_resetExtensionWithIdentier_completionHandler___block_invoke;
    block[3] = &unk_24CE06D88;
    block[4] = self;
    v12 = v8;
    v11 = v6;
    dispatch_async(v9, block);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __71__LLCallDirectoryManager_resetExtensionWithIdentier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __71__LLCallDirectoryManager_resetExtensionWithIdentier_completionHandler___block_invoke_2;
  v8[3] = &unk_24CE06C30;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v3, "defaultConnectionRemoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __71__LLCallDirectoryManager_resetExtensionWithIdentier_completionHandler___block_invoke_63;
  v6[3] = &unk_24CE06C30;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "resetLiveLookupExtensionWithIdentifier:reply:", v5, v6);

}

void __71__LLCallDirectoryManager_resetExtensionWithIdentier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  ILDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__LLCallDirectoryManager_resetExtensionWithIdentier_completionHandler___block_invoke_2_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __71__LLCallDirectoryManager_resetExtensionWithIdentier_completionHandler___block_invoke_63(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)refreshPIRParametersForLiveLookupExtensionWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    -[LLCallDirectoryManager queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __101__LLCallDirectoryManager_refreshPIRParametersForLiveLookupExtensionWithIdentifier_completionHandler___block_invoke;
    block[3] = &unk_24CE06D88;
    block[4] = self;
    v12 = v8;
    v11 = v6;
    dispatch_async(v9, block);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __101__LLCallDirectoryManager_refreshPIRParametersForLiveLookupExtensionWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __101__LLCallDirectoryManager_refreshPIRParametersForLiveLookupExtensionWithIdentifier_completionHandler___block_invoke_2;
  v8[3] = &unk_24CE06C30;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v3, "defaultConnectionRemoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __101__LLCallDirectoryManager_refreshPIRParametersForLiveLookupExtensionWithIdentifier_completionHandler___block_invoke_64;
  v6[3] = &unk_24CE06C30;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "refreshPIRParametersForLiveLookupExtensionWithIdentifier:reply:", v5, v6);

}

void __101__LLCallDirectoryManager_refreshPIRParametersForLiveLookupExtensionWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  ILDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__LLCallDirectoryManager_resetExtensionWithIdentier_completionHandler___block_invoke_2_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __101__LLCallDirectoryManager_refreshPIRParametersForLiveLookupExtensionWithIdentifier_completionHandler___block_invoke_64(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)getEnabledForExtensionWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    -[LLCallDirectoryManager queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __81__LLCallDirectoryManager_getEnabledForExtensionWithIdentifier_completionHandler___block_invoke;
    block[3] = &unk_24CE06D88;
    block[4] = self;
    v12 = v8;
    v11 = v6;
    dispatch_async(v9, block);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

void __81__LLCallDirectoryManager_getEnabledForExtensionWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __81__LLCallDirectoryManager_getEnabledForExtensionWithIdentifier_completionHandler___block_invoke_2;
  v8[3] = &unk_24CE06C30;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v3, "defaultConnectionRemoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __81__LLCallDirectoryManager_getEnabledForExtensionWithIdentifier_completionHandler___block_invoke_65;
  v6[3] = &unk_24CE06DB0;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "getEnabledForLiveLookupExtensionWithIdentifier:reply:", v5, v6);

}

void __81__LLCallDirectoryManager_getEnabledForExtensionWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  ILDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__LLCallDirectoryManager_resetExtensionWithIdentier_completionHandler___block_invoke_2_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

uint64_t __81__LLCallDirectoryManager_getEnabledForExtensionWithIdentifier_completionHandler___block_invoke_65(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)openSettingsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[LLCallDirectoryManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__LLCallDirectoryManager_openSettingsWithCompletionHandler___block_invoke;
  v7[3] = &unk_24CE06DD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __60__LLCallDirectoryManager_openSettingsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__LLCallDirectoryManager_openSettingsWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_24CE06C30;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "defaultConnectionRemoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "launchCallDirectorySettingsWithReply:", *(_QWORD *)(a1 + 40));

}

void __60__LLCallDirectoryManager_openSettingsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  ILDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__LLCallDirectoryManager_resetExtensionWithIdentier_completionHandler___block_invoke_2_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)setEnabled:(BOOL)a3 forExtensionWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    -[LLCallDirectoryManager queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __82__LLCallDirectoryManager_setEnabled_forExtensionWithIdentifier_completionHandler___block_invoke;
    v12[3] = &unk_24CE06E00;
    v12[4] = self;
    v14 = v10;
    v15 = a3;
    v13 = v8;
    dispatch_async(v11, v12);

  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

void __82__LLCallDirectoryManager_setEnabled_forExtensionWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __82__LLCallDirectoryManager_setEnabled_forExtensionWithIdentifier_completionHandler___block_invoke_2;
  v9[3] = &unk_24CE06C30;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v3, "defaultConnectionRemoteObjectProxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(unsigned __int8 *)(a1 + 56);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __82__LLCallDirectoryManager_setEnabled_forExtensionWithIdentifier_completionHandler___block_invoke_67;
  v7[3] = &unk_24CE06C30;
  v6 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v4, "setEnabled:forLiveLookupExtensionWithIdentifier:reply:", v5, v6, v7);

}

void __82__LLCallDirectoryManager_setEnabled_forExtensionWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  ILDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__LLCallDirectoryManager_resetExtensionWithIdentier_completionHandler___block_invoke_2_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __82__LLCallDirectoryManager_setEnabled_forExtensionWithIdentifier_completionHandler___block_invoke_67(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setDefaultConnection:(id)a3
{
  objc_storeStrong((id *)&self->_defaultConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __71__LLCallDirectoryManager_resetExtensionWithIdentier_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2126D5000, v0, v1, "error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
