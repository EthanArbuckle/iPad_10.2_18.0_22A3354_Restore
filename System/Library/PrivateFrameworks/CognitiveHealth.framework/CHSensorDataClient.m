@implementation CHSensorDataClient

- (CHSensorDataClient)init
{
  CHSensorDataClient *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  CHXPCClientHelper *v15;
  CHXPCClientHelper *clientHelper;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CHSensorDataClient;
  v2 = -[CHSensorDataClient init](&v18, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2568F18A0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x23B830284]();
    v5 = objc_alloc(MEMORY[0x24BDBCF20]);
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = (void *)objc_msgSend(v5, "initWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v4);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_aggregatedMotionAndAppLaunchDataFromDate_toDate_completion_, 0, 1);

    v11 = (void *)MEMORY[0x23B830284]();
    v12 = objc_alloc(MEMORY[0x24BDBCF20]);
    v13 = objc_opt_class();
    v14 = (void *)objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_embeddingVectorForBundleId_completion_, 0, 1);

    v15 = -[CHXPCClientHelper initWithServiceName:whitelistedServerInterface:clientExportedObject:interruptionHandler:invalidationHandler:]([CHXPCClientHelper alloc], "initWithServiceName:whitelistedServerInterface:clientExportedObject:interruptionHandler:invalidationHandler:", CFSTR("com.apple.cognitivehealth.sensordata"), v3, v2, &__block_literal_global_35, &__block_literal_global_19_36);
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = v15;

  }
  return v2;
}

- (void)aggregatedMotionAndAppLaunchDataFromDate:(id)a3 toDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  CHXPCClientHelper *clientHelper;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[16];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  ch_sensor_data_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_238250000, v11, OS_LOG_TYPE_DEFAULT, "CHSensorDataClient initiating call to cognitivehealthd - aggregatedMotionAndAppLaunchData", buf, 2u);
  }

  clientHelper = self->_clientHelper;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __81__CHSensorDataClient_aggregatedMotionAndAppLaunchDataFromDate_toDate_completion___block_invoke;
  v15[3] = &unk_2509FEBA8;
  v16 = v8;
  v13 = v8;
  -[CHXPCClientHelper remoteObjectProxyWithErrorHandler:](clientHelper, "remoteObjectProxyWithErrorHandler:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "aggregatedMotionAndAppLaunchDataFromDate:toDate:completion:", v10, v9, v13);

}

- (void)embeddingVectorForBundleId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CHXPCClientHelper *clientHelper;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  ch_sensor_data_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_238250000, v8, OS_LOG_TYPE_DEFAULT, "CHSensorDataClient initiating call to cognitivehealthd - embeddingVectorForBundleId", buf, 2u);
  }

  clientHelper = self->_clientHelper;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__CHSensorDataClient_embeddingVectorForBundleId_completion___block_invoke;
  v12[3] = &unk_2509FEBA8;
  v13 = v6;
  v10 = v6;
  -[CHXPCClientHelper remoteObjectProxyWithErrorHandler:](clientHelper, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "embeddingVectorForBundleId:completion:", v7, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

void __60__CHSensorDataClient_embeddingVectorForBundleId_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  ch_xpc_handle();
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

void __81__CHSensorDataClient_aggregatedMotionAndAppLaunchDataFromDate_toDate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  ch_xpc_handle();
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

void __26__CHSensorDataClient_init__block_invoke_18()
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
    v2 = CFSTR("com.apple.cognitivehealth.sensordata");
    _os_log_error_impl(&dword_238250000, v0, OS_LOG_TYPE_ERROR, "Connection to %@ invalidated.", (uint8_t *)&v1, 0xCu);
  }

}

void __26__CHSensorDataClient_init__block_invoke()
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
    v2 = CFSTR("com.apple.cognitivehealth.sensordata");
    _os_log_error_impl(&dword_238250000, v0, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v1, 0xCu);
  }

}

@end
