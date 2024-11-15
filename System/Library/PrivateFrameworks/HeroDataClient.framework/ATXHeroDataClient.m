@implementation ATXHeroDataClient

- (ATXHeroDataClient)init
{
  ATXHeroDataClient *v2;
  uint64_t v3;
  NSXPCConnection *xpcConnection;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXHeroDataClient;
  v2 = -[ATXHeroDataClient init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.proactive.hero.AppPrediction.predictions"), 0);
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    ATXHeroDataXPCInterface();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_xpcConnection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection setInterruptionHandler:](v2->_xpcConnection, "setInterruptionHandler:", &__block_literal_global);
    -[NSXPCConnection resume](v2->_xpcConnection, "resume");
  }
  return v2;
}

void __25__ATXHeroDataClient_init__block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __25__ATXHeroDataClient_init__block_invoke_cold_1();
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ATXHeroDataClient;
  -[ATXHeroDataClient dealloc](&v3, sel_dealloc);
}

- (void)donateHeroAppPredictions:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSXPCConnection *xpcConnection;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = &__block_literal_global_4;
  if (v6)
    v7 = v6;
  xpcConnection = self->_xpcConnection;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __57__ATXHeroDataClient_donateHeroAppPredictions_completion___block_invoke_2;
  v12[3] = &unk_24C3C65B8;
  v13 = v7;
  v9 = v7;
  v10 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "donateHeroAppPredictions:completion:", v10, v9);

}

void __57__ATXHeroDataClient_donateHeroAppPredictions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __57__ATXHeroDataClient_donateHeroAppPredictions_completion___block_invoke_2_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)addConfirmForAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSXPCConnection *xpcConnection;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = &__block_literal_global_5;
  if (v6)
    v7 = v6;
  xpcConnection = self->_xpcConnection;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__ATXHeroDataClient_addConfirmForAppClipWithHeroAppPrediction_completion___block_invoke_2;
  v12[3] = &unk_24C3C65B8;
  v13 = v7;
  v9 = v7;
  v10 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addConfirmForAppClipWithHeroAppPrediction:completion:", v10, v9);

}

void __74__ATXHeroDataClient_addConfirmForAppClipWithHeroAppPrediction_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __57__ATXHeroDataClient_donateHeroAppPredictions_completion___block_invoke_2_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)addSoftRejectForAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSXPCConnection *xpcConnection;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = &__block_literal_global_6;
  if (v6)
    v7 = v6;
  xpcConnection = self->_xpcConnection;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __77__ATXHeroDataClient_addSoftRejectForAppClipWithHeroAppPrediction_completion___block_invoke_2;
  v12[3] = &unk_24C3C65B8;
  v13 = v7;
  v9 = v7;
  v10 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSoftRejectForAppClipWithHeroAppPrediction:completion:", v10, v9);

}

void __77__ATXHeroDataClient_addSoftRejectForAppClipWithHeroAppPrediction_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __57__ATXHeroDataClient_donateHeroAppPredictions_completion___block_invoke_2_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)addHardRejectForAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSXPCConnection *xpcConnection;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = &__block_literal_global_7;
  if (v6)
    v7 = v6;
  xpcConnection = self->_xpcConnection;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __77__ATXHeroDataClient_addHardRejectForAppClipWithHeroAppPrediction_completion___block_invoke_2;
  v12[3] = &unk_24C3C65B8;
  v13 = v7;
  v9 = v7;
  v10 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addHardRejectForAppClipWithHeroAppPrediction:completion:", v10, v9);

}

void __77__ATXHeroDataClient_addHardRejectForAppClipWithHeroAppPrediction_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __57__ATXHeroDataClient_donateHeroAppPredictions_completion___block_invoke_2_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)feedbackScoreForAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSXPCConnection *xpcConnection;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = &__block_literal_global_9;
  if (v6)
    v7 = v6;
  xpcConnection = self->_xpcConnection;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __77__ATXHeroDataClient_feedbackScoreForAppClipWithHeroAppPrediction_completion___block_invoke_2;
  v12[3] = &unk_24C3C65B8;
  v13 = v7;
  v9 = v7;
  v10 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "feedbackScoreForAppClipWithHeroAppPrediction:completion:", v10, v9);

}

void __77__ATXHeroDataClient_feedbackScoreForAppClipWithHeroAppPrediction_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __57__ATXHeroDataClient_donateHeroAppPredictions_completion___block_invoke_2_cold_1();
  (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(0.0);

}

- (void)openAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSXPCConnection *xpcConnection;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = &__block_literal_global_10;
  if (v6)
    v7 = v6;
  xpcConnection = self->_xpcConnection;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __65__ATXHeroDataClient_openAppClipWithHeroAppPrediction_completion___block_invoke_2;
  v12[3] = &unk_24C3C65B8;
  v13 = v7;
  v9 = v7;
  v10 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "openAppClipWithHeroAppPrediction:completion:", v10, v9);

}

void __65__ATXHeroDataClient_openAppClipWithHeroAppPrediction_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __57__ATXHeroDataClient_donateHeroAppPredictions_completion___block_invoke_2_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getCurrentHeroPoiCategoryWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSXPCConnection *xpcConnection;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = &__block_literal_global_12;
  if (v4)
    v5 = v4;
  xpcConnection = self->_xpcConnection;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__ATXHeroDataClient_getCurrentHeroPoiCategoryWithCompletion___block_invoke_2;
  v9[3] = &unk_24C3C65B8;
  v10 = v5;
  v7 = v5;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getCurrentHeroPoiCategoryWithCompletion:", v7);

}

void __61__ATXHeroDataClient_getCurrentHeroPoiCategoryWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __57__ATXHeroDataClient_donateHeroAppPredictions_completion___block_invoke_2_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __25__ATXHeroDataClient_init__block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_20AD98000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Connection to Hero App Prediction server interrupted", v0, 2u);
}

void __57__ATXHeroDataClient_donateHeroAppPredictions_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_20AD98000, MEMORY[0x24BDACB70], v0, "Error: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

@end
