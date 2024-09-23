@implementation AAFAnalyticsTransportRTC

- (AAFAnalyticsTransportRTC)initWithClientType:(id)a3 clientBundleId:(id)a4 clientName:(id)a5
{
  id v9;
  id v10;
  id v11;
  AAFAnalyticsTransportRTC *v12;
  AAFAnalyticsTransportRTC *v13;
  AAFXPCSessionConfig *v14;
  AAFXPCSession *v15;
  AAFXPCSession *remoteService;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)AAFAnalyticsTransportRTC;
  v12 = -[AAFAnalyticsTransportRTC init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientType, a3);
    objc_storeStrong((id *)&v13->_clientBundleId, a4);
    objc_storeStrong((id *)&v13->_clientName, a5);
    v14 = -[AAFXPCSessionConfig initWithServiceName:remoteProtocol:options:]([AAFXPCSessionConfig alloc], "initWithServiceName:remoteProtocol:options:", CFSTR("com.apple.cdp.daemon"), &unk_1EFF11670, 0);
    v15 = -[AAFXPCSession initWithRemoteServiceConfig:delegate:]([AAFXPCSession alloc], "initWithRemoteServiceConfig:delegate:", v14, v13);
    remoteService = v13->_remoteService;
    v13->_remoteService = v15;

    -[AAFXPCSession resume](v13->_remoteService, "resume");
  }

  return v13;
}

- (void)sendEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;

  v4 = a3;
  -[AAFXPCSession remoteServiceProxyWithErrorHandler:](self->_remoteService, "remoteServiceProxyWithErrorHandler:", &__block_literal_global_5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    _AAFLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[AAFAnalyticsTransportRTC sendEvent:].cold.3();

    -[AAFAnalyticsTransportRTC clientName](self, "clientName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClientName:", v8);

  }
  objc_msgSend(v4, "clientBundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    _AAFLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[AAFAnalyticsTransportRTC sendEvent:].cold.2();

    -[AAFAnalyticsTransportRTC clientBundleId](self, "clientBundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClientBundleId:", v11);

  }
  objc_msgSend(v4, "clientType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    _AAFLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[AAFAnalyticsTransportRTC sendEvent:].cold.1();

    -[AAFAnalyticsTransportRTC clientType](self, "clientType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClientType:", v14);

  }
  objc_msgSend(v5, "sendEvent:", v4);

}

void __38__AAFAnalyticsTransportRTC_sendEvent___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _AAFLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __38__AAFAnalyticsTransportRTC_sendEvent___block_invoke_cold_1((uint64_t)v2, v3);

}

- (void)dealloc
{
  AAFXPCSession *remoteService;
  objc_super v4;

  -[AAFXPCSession invalidate](self->_remoteService, "invalidate");
  remoteService = self->_remoteService;
  self->_remoteService = 0;

  v4.receiver = self;
  v4.super_class = (Class)AAFAnalyticsTransportRTC;
  -[AAFAnalyticsTransportRTC dealloc](&v4, sel_dealloc);
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[AAFAnalyticsTransportRTC clientType](self, "clientType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAFAnalyticsTransportRTC clientBundleId](self, "clientBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAFAnalyticsTransportRTC clientName](self, "clientName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> ClientType: [%@], ClientBundleId: [%@], ClientName: [%@]"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

+ (id)analyticsTransportRTCWithClientType:(id)a3 clientBundleId:(id)a4 clientName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8 && v9 && v10)
  {
    v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithClientType:clientBundleId:clientName:", v8, v9, v10);
  }
  else
  {
    _AAFLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[AAFAnalyticsTransportRTC analyticsTransportRTCWithClientType:clientBundleId:clientName:].cold.1(v13);

    v12 = 0;
  }

  return v12;
}

- (NSNumber)clientType
{
  return self->_clientType;
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (AAFXPCSession)remoteService
{
  return self->_remoteService;
}

- (void)setRemoteService:(id)a3
{
  objc_storeStrong((id *)&self->_remoteService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteService, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_clientBundleId, 0);
  objc_storeStrong((id *)&self->_clientType, 0);
}

- (void)sendEvent:.cold.1()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_3();
  objc_msgSend(v2, "eventName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "clientType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clientType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_4(&dword_1D51A2000, v6, v7, "Overriding event [%@] clientType to [%@] from [%@]", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2_1();
}

- (void)sendEvent:.cold.2()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_3();
  objc_msgSend(v2, "eventName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "clientBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clientBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_4(&dword_1D51A2000, v6, v7, "Overriding event [%@] clientBundleId to [%@] from [%@]", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2_1();
}

- (void)sendEvent:.cold.3()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_3();
  objc_msgSend(v2, "eventName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "clientName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clientName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_4(&dword_1D51A2000, v6, v7, "Overriding event [%@] clientName to [%@] from [%@]", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2_1();
}

void __38__AAFAnalyticsTransportRTC_sendEvent___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D51A2000, a2, OS_LOG_TYPE_ERROR, "Error sending report for event. XPC error: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)analyticsTransportRTCWithClientType:(os_log_t)log clientBundleId:clientName:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D51A2000, log, OS_LOG_TYPE_ERROR, "Failed to initialize AAFAnalyticsTransportRTC. Please check if all required parameters are provided.", v1, 2u);
}

@end
