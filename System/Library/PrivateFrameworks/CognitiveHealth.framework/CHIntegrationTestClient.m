@implementation CHIntegrationTestClient

- (CHIntegrationTestClient)init
{
  CHIntegrationTestClient *v2;
  void *v3;
  void *v4;
  void *v5;
  CHXPCClientHelper *v6;
  CHXPCClientHelper *clientHelper;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CHIntegrationTestClient;
  v2 = -[CHIntegrationTestClient init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2568F17C0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x23B830284]();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", objc_opt_class(), 0);
    objc_autoreleasePoolPop(v4);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_populateSampleAppLaunchEmbeddingWithCompletion_, 0, 1);

    v6 = -[CHXPCClientHelper initWithServiceName:whitelistedServerInterface:clientExportedObject:interruptionHandler:invalidationHandler:]([CHXPCClientHelper alloc], "initWithServiceName:whitelistedServerInterface:clientExportedObject:interruptionHandler:invalidationHandler:", CFSTR("com.apple.cognitivehealth.integrationtest"), v3, v2, &__block_literal_global, &__block_literal_global_10);
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = v6;

  }
  return v2;
}

- (void)populateSampleAppLaunchEmbeddingWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  CHXPCClientHelper *clientHelper;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  ch_test_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_238250000, v5, OS_LOG_TYPE_DEFAULT, "CHIntegrationTestClient initiating call to cognitivehealthd - embeddingVectorForBundleId", buf, 2u);
  }

  clientHelper = self->_clientHelper;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __74__CHIntegrationTestClient_populateSampleAppLaunchEmbeddingWithCompletion___block_invoke;
  v9[3] = &unk_2509FEBA8;
  v10 = v4;
  v7 = v4;
  -[CHXPCClientHelper remoteObjectProxyWithErrorHandler:](clientHelper, "remoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "populateSampleAppLaunchEmbeddingWithCompletion:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

void __74__CHIntegrationTestClient_populateSampleAppLaunchEmbeddingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  ch_test_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_error_impl(&dword_238250000, v4, OS_LOG_TYPE_ERROR, "CHSensorDataClient remoteObjectProxy error: %@", (uint8_t *)&v6, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __31__CHIntegrationTestClient_init__block_invoke_9()
{
  NSObject *v0;
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  ch_xpc_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    v1 = 138412290;
    v2 = CFSTR("com.apple.cognitivehealth.integrationtest");
    _os_log_error_impl(&dword_238250000, v0, OS_LOG_TYPE_ERROR, "Connection to %@ invalidated.", (uint8_t *)&v1, 0xCu);
  }

}

void __31__CHIntegrationTestClient_init__block_invoke()
{
  NSObject *v0;
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  ch_xpc_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    v1 = 138412290;
    v2 = CFSTR("com.apple.cognitivehealth.integrationtest");
    _os_log_error_impl(&dword_238250000, v0, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v1, 0xCu);
  }

}

@end
