@implementation CXCallDirectoryManager

- (CXCallDirectoryManager)init
{
  CXCallDirectoryManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CXCallDirectoryManager;
  v2 = -[CXCallDirectoryManager init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.callkit.calldirectorymanager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (id)defaultConnectionRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CXCallDirectoryManager defaultConnection](self, "defaultConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.CallKit.CallDirectory"));
    v5 = self->_defaultConnection;
    self->_defaultConnection = v4;

    objc_msgSend(MEMORY[0x1E0CB3B50], "cx_callDirectoryManagerDefaultHostInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_defaultConnection, "setRemoteObjectInterface:", v6);

    objc_initWeak(&location, self);
    v7 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __43__CXCallDirectoryManager_defaultConnection__block_invoke;
    v11[3] = &unk_1E4B88CA8;
    objc_copyWeak(&v12, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_defaultConnection, "setInterruptionHandler:", v11);
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __43__CXCallDirectoryManager_defaultConnection__block_invoke_2;
    v9[3] = &unk_1E4B88CA8;
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

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

+ (CXCallDirectoryManager)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CXCallDirectoryManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (CXCallDirectoryManager *)(id)sharedInstance_sharedInstance;
}

void __40__CXCallDirectoryManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_defaultConnection, "invalidate");
  -[NSXPCConnection invalidate](self->_maintenanceConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CXCallDirectoryManager;
  -[CXCallDirectoryManager dealloc](&v3, sel_dealloc);
}

void __43__CXCallDirectoryManager_defaultConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = WeakRetained;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Default connection interrupted for call directory manager %@", buf, 0xCu);
  }

  objc_msgSend(WeakRetained, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(WeakRetained, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__CXCallDirectoryManager_defaultConnection__block_invoke_6;
    block[3] = &unk_1E4B88AE8;
    block[4] = WeakRetained;
    dispatch_async(v4, block);

  }
}

uint64_t __43__CXCallDirectoryManager_defaultConnection__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
}

void __43__CXCallDirectoryManager_defaultConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = WeakRetained;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Default connection invalidated for call directory manager %@", buf, 0xCu);
  }

  objc_msgSend(WeakRetained, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(WeakRetained, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__CXCallDirectoryManager_defaultConnection__block_invoke_7;
    block[3] = &unk_1E4B88AE8;
    block[4] = WeakRetained;
    dispatch_async(v4, block);

  }
}

void __43__CXCallDirectoryManager_defaultConnection__block_invoke_7(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;

}

- (NSXPCConnection)maintenanceConnection
{
  NSXPCConnection *maintenanceConnection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  maintenanceConnection = self->_maintenanceConnection;
  if (!maintenanceConnection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.CallKit.CallDirectoryMaintenance"));
    v5 = self->_maintenanceConnection;
    self->_maintenanceConnection = v4;

    objc_msgSend(MEMORY[0x1E0CB3B50], "cx_callDirectoryManagerMaintenanceHostInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_maintenanceConnection, "setRemoteObjectInterface:", v6);

    objc_initWeak(&location, self);
    v7 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __47__CXCallDirectoryManager_maintenanceConnection__block_invoke;
    v11[3] = &unk_1E4B88CA8;
    objc_copyWeak(&v12, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_maintenanceConnection, "setInterruptionHandler:", v11);
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __47__CXCallDirectoryManager_maintenanceConnection__block_invoke_2;
    v9[3] = &unk_1E4B88CA8;
    objc_copyWeak(&v10, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_maintenanceConnection, "setInvalidationHandler:", v9);
    -[NSXPCConnection resume](self->_maintenanceConnection, "resume");
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    maintenanceConnection = self->_maintenanceConnection;
  }
  return maintenanceConnection;
}

void __47__CXCallDirectoryManager_maintenanceConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = WeakRetained;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Maintenance connection interrupted for call directory manager %@", buf, 0xCu);
  }

  objc_msgSend(WeakRetained, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(WeakRetained, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__CXCallDirectoryManager_maintenanceConnection__block_invoke_8;
    block[3] = &unk_1E4B88AE8;
    block[4] = WeakRetained;
    dispatch_async(v4, block);

  }
}

uint64_t __47__CXCallDirectoryManager_maintenanceConnection__block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
}

void __47__CXCallDirectoryManager_maintenanceConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = WeakRetained;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Maintenance connection invalidated for call directory manager %@", buf, 0xCu);
  }

  objc_msgSend(WeakRetained, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(WeakRetained, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__CXCallDirectoryManager_maintenanceConnection__block_invoke_9;
    block[3] = &unk_1E4B88AE8;
    block[4] = WeakRetained;
    dispatch_async(v4, block);

  }
}

void __47__CXCallDirectoryManager_maintenanceConnection__block_invoke_9(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;

}

- (id)maintenanceConnectionRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CXCallDirectoryManager maintenanceConnection](self, "maintenanceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)reloadExtensionWithIdentifier:(NSString *)identifier completionHandler:(void *)completion
{
  NSString *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  NSObject *v9;
  void *v10;
  _QWORD block[5];
  NSString *v12;
  void (**v13)(_QWORD, _QWORD);

  v6 = identifier;
  v7 = completion;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (v6)
  {
    -[CXCallDirectoryManager queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke;
    block[3] = &unk_1E4B89598;
    block[4] = self;
    v13 = v8;
    v12 = v6;
    dispatch_async(v9, block);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "cx_callDirectoryManagerErrorWithCode:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v8)[2](v8, v10);

  }
}

void __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2;
  v8[3] = &unk_1E4B89080;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v3, "defaultConnectionRemoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_11;
  v6[3] = &unk_1E4B89080;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "reloadExtensionWithIdentifier:reply:", v5, v6);

}

void __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_11(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)getEnabledStatusForExtensionWithIdentifier:(NSString *)identifier completionHandler:(void *)completion
{
  NSString *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  NSObject *v9;
  void *v10;
  _QWORD block[5];
  NSString *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);

  v6 = identifier;
  v7 = completion;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    -[CXCallDirectoryManager queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__CXCallDirectoryManager_getEnabledStatusForExtensionWithIdentifier_completionHandler___block_invoke;
    block[3] = &unk_1E4B89598;
    block[4] = self;
    v13 = v8;
    v12 = v6;
    dispatch_async(v9, block);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "cx_callDirectoryManagerErrorWithCode:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v10);

  }
}

void __87__CXCallDirectoryManager_getEnabledStatusForExtensionWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__CXCallDirectoryManager_getEnabledStatusForExtensionWithIdentifier_completionHandler___block_invoke_2;
  v8[3] = &unk_1E4B89080;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v3, "defaultConnectionRemoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __87__CXCallDirectoryManager_getEnabledStatusForExtensionWithIdentifier_completionHandler___block_invoke_13;
  v6[3] = &unk_1E4B895C0;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "getEnabledStatusForExtensionWithIdentifier:reply:", v5, v6);

}

void __87__CXCallDirectoryManager_getEnabledStatusForExtensionWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

uint64_t __87__CXCallDirectoryManager_getEnabledStatusForExtensionWithIdentifier_completionHandler___block_invoke_13(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setEnabled:(BOOL)a3 forExtensionWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a4;
  v9 = a5;
  -[CXCallDirectoryManager queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__CXCallDirectoryManager_setEnabled_forExtensionWithIdentifier_completionHandler___block_invoke;
  v13[3] = &unk_1E4B895E8;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v13[4] = self;
  v11 = v8;
  v12 = v9;
  dispatch_async(v10, v13);

}

void __82__CXCallDirectoryManager_setEnabled_forExtensionWithIdentifier_completionHandler___block_invoke(uint64_t a1)
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

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__CXCallDirectoryManager_setEnabled_forExtensionWithIdentifier_completionHandler___block_invoke_2;
  v9[3] = &unk_1E4B89080;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v3, "defaultConnectionRemoteObjectProxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(unsigned __int8 *)(a1 + 56);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __82__CXCallDirectoryManager_setEnabled_forExtensionWithIdentifier_completionHandler___block_invoke_15;
  v7[3] = &unk_1E4B89080;
  v6 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v4, "setEnabled:forExtensionWithIdentifier:reply:", v5, v6, v7);

}

void __82__CXCallDirectoryManager_setEnabled_forExtensionWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __82__CXCallDirectoryManager_setEnabled_forExtensionWithIdentifier_completionHandler___block_invoke_15(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)firstIdentificationEntryForEnabledExtensionWithPhoneNumber:(id)a3 cacheOnly:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[2];

  v6 = a4;
  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v16[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __113__CXCallDirectoryManager_firstIdentificationEntryForEnabledExtensionWithPhoneNumber_cacheOnly_completionHandler___block_invoke;
  v13[3] = &unk_1E4B89610;
  v14 = v8;
  v15 = v9;
  v11 = v8;
  v12 = v9;
  -[CXCallDirectoryManager firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:cacheOnly:completionHandler:](self, "firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:cacheOnly:completionHandler:", v10, v6, v13);

}

void __113__CXCallDirectoryManager_firstIdentificationEntryForEnabledExtensionWithPhoneNumber_cacheOnly_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);

}

- (void)firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:(id)a3 cacheOnly:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  -[CXCallDirectoryManager queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __117__CXCallDirectoryManager_firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers_cacheOnly_completionHandler___block_invoke;
  v13[3] = &unk_1E4B895E8;
  v14 = v8;
  v15 = v9;
  v13[4] = self;
  v16 = a4;
  v11 = v8;
  v12 = v9;
  dispatch_async(v10, v13);

}

void __117__CXCallDirectoryManager_firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers_cacheOnly_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __117__CXCallDirectoryManager_firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers_cacheOnly_completionHandler___block_invoke_2;
  v4[3] = &unk_1E4B89080;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "defaultConnectionRemoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:cacheOnly:reply:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

void __117__CXCallDirectoryManager_firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers_cacheOnly_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)synchronizeExtensionsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXCallDirectoryManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__CXCallDirectoryManager_synchronizeExtensionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B88B30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __69__CXCallDirectoryManager_synchronizeExtensionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__CXCallDirectoryManager_synchronizeExtensionsWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E4B89080;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "maintenanceConnectionRemoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronizeExtensionsWithReply:", *(_QWORD *)(a1 + 40));

}

void __69__CXCallDirectoryManager_synchronizeExtensionsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)fetchLiveBlockingInfoForHandle:(id)a3 timeout:(double)a4
{
  id v6;
  NSObject *v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  _QWORD v22[5];
  NSObject *v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  if (_os_feature_enabled_impl())
  {
    CXDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v6;
      _os_log_impl(&dword_1A402D000, v7, OS_LOG_TYPE_DEFAULT, "fetchLiveBlockingInfoForHandle: %@", buf, 0xCu);
    }

    v8 = dispatch_semaphore_create(0);
    -[CXCallDirectoryManager queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __65__CXCallDirectoryManager_fetchLiveBlockingInfoForHandle_timeout___block_invoke;
    v22[3] = &unk_1E4B89688;
    v22[4] = self;
    v10 = v8;
    v23 = v10;
    v24 = v6;
    v25 = &v26;
    dispatch_sync(v9, v22);

    v11 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    if (dispatch_semaphore_wait(v10, v11))
    {
      CXDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CXCallDirectoryManager fetchLiveBlockingInfoForHandle:timeout:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    }
  }
  v20 = *((_BYTE *)v27 + 24) != 0;
  _Block_object_dispose(&v26, 8);

  return v20;
}

void __65__CXCallDirectoryManager_fetchLiveBlockingInfoForHandle_timeout___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v2 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__CXCallDirectoryManager_fetchLiveBlockingInfoForHandle_timeout___block_invoke_2;
  v9[3] = &unk_1E4B89638;
  v3 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v3, "defaultConnectionRemoteObjectProxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __65__CXCallDirectoryManager_fetchLiveBlockingInfoForHandle_timeout___block_invoke_20;
  v6[3] = &unk_1E4B89660;
  v5 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "fetchLiveBlockingInfoForHandle:reply:", v5, v6);

}

void __65__CXCallDirectoryManager_fetchLiveBlockingInfoForHandle_timeout___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1();

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __65__CXCallDirectoryManager_fetchLiveBlockingInfoForHandle_timeout___block_invoke_20(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  CXDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __65__CXCallDirectoryManager_fetchLiveBlockingInfoForHandle_timeout___block_invoke_20_cold_1();

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = a2;
      _os_log_impl(&dword_1A402D000, v7, OS_LOG_TYPE_DEFAULT, "fetchLiveBlockingInfoForHandle blocked=%d", (uint8_t *)v8, 8u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber:(id)a3 timeout:(double)a4
{
  id v6;
  NSObject *v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  _QWORD v22[5];
  NSObject *v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__4;
  v30 = __Block_byref_object_dispose__4;
  v31 = 0;
  if (_os_feature_enabled_impl())
  {
    CXDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v6;
      _os_log_impl(&dword_1A402D000, v7, OS_LOG_TYPE_DEFAULT, "firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber: %@", buf, 0xCu);
    }

    v8 = dispatch_semaphore_create(0);
    -[CXCallDirectoryManager queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __92__CXCallDirectoryManager_firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber_timeout___block_invoke;
    v22[3] = &unk_1E4B89688;
    v22[4] = self;
    v10 = v8;
    v23 = v10;
    v24 = v6;
    v25 = &v26;
    dispatch_sync(v9, v22);

    v11 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    if (dispatch_semaphore_wait(v10, v11))
    {
      CXDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CXCallDirectoryManager firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber:timeout:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    }
  }
  v20 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v20;
}

void __92__CXCallDirectoryManager_firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber_timeout___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v2 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __92__CXCallDirectoryManager_firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber_timeout___block_invoke_2;
  v9[3] = &unk_1E4B89638;
  v3 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v3, "defaultConnectionRemoteObjectProxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __92__CXCallDirectoryManager_firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber_timeout___block_invoke_22;
  v6[3] = &unk_1E4B896B0;
  v5 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber:reply:", v5, v6);

}

void __92__CXCallDirectoryManager_firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber_timeout___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1();

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __92__CXCallDirectoryManager_firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber_timeout___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  CXDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __92__CXCallDirectoryManager_firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber_timeout___block_invoke_22_cold_1();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber blocked=%@", (uint8_t *)&v11, 0xCu);
    }

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = v5;
    v8 = *(NSObject **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)openSettingsWithCompletionHandler:(void *)completion
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = completion;
  -[CXCallDirectoryManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__CXCallDirectoryManager_openSettingsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B88B30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __60__CXCallDirectoryManager_openSettingsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__CXCallDirectoryManager_openSettingsWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E4B89080;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "defaultConnectionRemoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "launchCallDirectorySettingsWithReply:", *(_QWORD *)(a1 + 40));

}

void __60__CXCallDirectoryManager_openSettingsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)compactStoreWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXCallDirectoryManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__CXCallDirectoryManager_compactStoreWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B88B30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __60__CXCallDirectoryManager_compactStoreWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__CXCallDirectoryManager_compactStoreWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E4B89080;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "maintenanceConnectionRemoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "compactStoreWithReply:", *(_QWORD *)(a1 + 40));

}

void __60__CXCallDirectoryManager_compactStoreWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cleanUpLiveLookupDataWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXCallDirectoryManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__CXCallDirectoryManager_cleanUpLiveLookupDataWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B88B30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __69__CXCallDirectoryManager_cleanUpLiveLookupDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__CXCallDirectoryManager_cleanUpLiveLookupDataWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E4B89080;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "maintenanceConnectionRemoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cleanUpLiveLookupDataWithReply:", *(_QWORD *)(a1 + 40));

}

void __69__CXCallDirectoryManager_cleanUpLiveLookupDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getExtensionsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXCallDirectoryManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__CXCallDirectoryManager_getExtensionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B88B30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __61__CXCallDirectoryManager_getExtensionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__CXCallDirectoryManager_getExtensionsWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E4B89080;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "defaultConnectionRemoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getExtensionsWithReply:", *(_QWORD *)(a1 + 40));

}

void __61__CXCallDirectoryManager_getExtensionsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setPrioritizedExtensionIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[CXCallDirectoryManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__CXCallDirectoryManager_setPrioritizedExtensionIdentifiers_completionHandler___block_invoke;
  block[3] = &unk_1E4B89598;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __79__CXCallDirectoryManager_setPrioritizedExtensionIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__CXCallDirectoryManager_setPrioritizedExtensionIdentifiers_completionHandler___block_invoke_2;
  v8[3] = &unk_1E4B89080;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v3, "defaultConnectionRemoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __79__CXCallDirectoryManager_setPrioritizedExtensionIdentifiers_completionHandler___block_invoke_24;
  v6[3] = &unk_1E4B89080;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "setPrioritizedExtensionIdentifiers:reply:", v5, v6);

}

void __79__CXCallDirectoryManager_setPrioritizedExtensionIdentifiers_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __79__CXCallDirectoryManager_setPrioritizedExtensionIdentifiers_completionHandler___block_invoke_24(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)getLastUpdatedCallDirectoryInfoWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXCallDirectoryManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__CXCallDirectoryManager_getLastUpdatedCallDirectoryInfoWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B88B30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __79__CXCallDirectoryManager_getLastUpdatedCallDirectoryInfoWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__CXCallDirectoryManager_getLastUpdatedCallDirectoryInfoWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E4B89080;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "defaultConnectionRemoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getLastUpdatedCallDirectoryInfoWithReply:", *(_QWORD *)(a1 + 40));

}

void __79__CXCallDirectoryManager_getLastUpdatedCallDirectoryInfoWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setDefaultConnection:(id)a3
{
  objc_storeStrong((id *)&self->_defaultConnection, a3);
}

- (void)setMaintenanceConnection:(id)a3
{
  objc_storeStrong((id *)&self->_maintenanceConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maintenanceConnection, 0);
  objc_storeStrong((id *)&self->_defaultConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_1A402D000, v0, v1, "error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)fetchLiveBlockingInfoForHandle:(uint64_t)a3 timeout:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A402D000, a1, a3, "Timeout occured waiting for LiveLookup Blocking information", a5, a6, a7, a8, 0);
}

void __65__CXCallDirectoryManager_fetchLiveBlockingInfoForHandle_timeout___block_invoke_20_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_1A402D000, v0, v1, "fetchLiveBlockingInfoForHandle error=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber:(uint64_t)a3 timeout:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A402D000, a1, a3, "Timeout occured waiting for LiveLookup BlockedBy information", a5, a6, a7, a8, 0);
}

void __92__CXCallDirectoryManager_firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber_timeout___block_invoke_22_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_1A402D000, v0, v1, "firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber error=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
