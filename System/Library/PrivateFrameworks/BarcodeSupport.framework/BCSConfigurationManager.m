@implementation BCSConfigurationManager

- (void)setUpQRCodeControlCenterModuleWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[BCSConfigurationManager serviceConnection](self, "serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __79__BCSConfigurationManager_setUpQRCodeControlCenterModuleWithCompletionHandler___block_invoke;
  v12[3] = &unk_24D787850;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __79__BCSConfigurationManager_setUpQRCodeControlCenterModuleWithCompletionHandler___block_invoke_1;
  v10[3] = &unk_24D787878;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "setUpQRCodeControlCenterModuleWithReply:", v10);

}

void __79__BCSConfigurationManager_setUpQRCodeControlCenterModuleWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __79__BCSConfigurationManager_setUpQRCodeControlCenterModuleWithCompletionHandler___block_invoke_cold_1(v3);
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v3);

}

uint64_t __79__BCSConfigurationManager_setUpQRCodeControlCenterModuleWithCompletionHandler___block_invoke_1(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (NSXPCConnection)serviceConnection
{
  NSXPCConnection *serviceConnection;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  serviceConnection = self->_serviceConnection;
  if (serviceConnection)
    return serviceConnection;
  v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.BarcodeSupport.Helper"));
  v6 = self->_serviceConnection;
  self->_serviceConnection = v5;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254F00AE8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_serviceConnection, "setRemoteObjectInterface:", v7);

  objc_initWeak(&location, self);
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __44__BCSConfigurationManager_serviceConnection__block_invoke;
  v12 = &unk_24D787578;
  objc_copyWeak(&v13, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_serviceConnection, "setInvalidationHandler:", &v9);
  -[NSXPCConnection resume](self->_serviceConnection, "resume", v9, v10, v11, v12);
  v8 = self->_serviceConnection;
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v8;
}

void __44__BCSConfigurationManager_serviceConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setServiceConnection:", 0);

}

- (void)processAppClipImageWithURL:(id)a3 scale:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  v9 = a3;
  -[BCSConfigurationManager serviceConnection](self, "serviceConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __71__BCSConfigurationManager_processAppClipImageWithURL_scale_completion___block_invoke;
  v17[3] = &unk_24D787850;
  v12 = v8;
  v18 = v12;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __71__BCSConfigurationManager_processAppClipImageWithURL_scale_completion___block_invoke_52;
  v15[3] = &unk_24D7878A0;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "processAppClipImageWithURL:scale:reply:", v9, v15, a4);

}

void __71__BCSConfigurationManager_processAppClipImageWithURL_scale_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __71__BCSConfigurationManager_processAppClipImageWithURL_scale_completion___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);

}

uint64_t __71__BCSConfigurationManager_processAppClipImageWithURL_scale_completion___block_invoke_52(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setServiceConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serviceConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

void __79__BCSConfigurationManager_setUpQRCodeControlCenterModuleWithCompletionHandler___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], v2, "BCSConfigurationManager: Error getting remote object proxy: %{public}@", v3, v4, v5, v6, 2u);

}

void __71__BCSConfigurationManager_processAppClipImageWithURL_scale_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSConfigurationManager: Error getting remote object proxy: %{public}@", a5, a6, a7, a8, 2u);
}

@end
