@implementation CARSessionRequestAgent

- (CARSessionRequestAgent)initWithRequestHandler:(id)a3
{
  id v4;
  CARSessionRequestAgent *v5;
  CARSessionRequestHandlerProxy *v6;
  CARSessionRequestHandlerProxy *handlerProxy;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CARSessionRequestAgent;
  v5 = -[CARSessionRequestAgent init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(CARSessionRequestHandlerProxy);
    handlerProxy = v5->_handlerProxy;
    v5->_handlerProxy = v6;

    -[CARSessionRequestAgent handlerProxy](v5, "handlerProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRequestHandler:", v4);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.carkit.sessionRequestHandler"));
    objc_msgSend(v9, "setDelegate:", v5);
    objc_msgSend(v9, "resume");
    -[CARSessionRequestAgent setListener:](v5, "setListener:", v9);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CARSessionRequestAgent listener](self, "listener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)CARSessionRequestAgent;
  -[CARSessionRequestAgent dealloc](&v4, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.carkit.sessionRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  CarGeneralLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v12[0] = 67109120;
      v12[1] = objc_msgSend(v5, "processIdentifier");
      _os_log_impl(&dword_1A83A2000, v9, OS_LOG_TYPE_INFO, "Received CARSessionRequest connection from pid %d", (uint8_t *)v12, 8u);
    }

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE9A0D38);
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject setClass:forSelector:argumentIndex:ofReply:](v9, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_service_startSessionWithHost_requestIdentifier_reply_, 0, 0);
    -[NSObject setClass:forSelector:argumentIndex:ofReply:](v9, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_service_startSessionWithHost_requestIdentifier_reply_, 1, 0);
    objc_msgSend(v5, "setExportedInterface:", v9);
    -[CARSessionRequestAgent handlerProxy](self, "handlerProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedObject:", v10);

    objc_msgSend(v5, "resume");
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[CARSessionRequestAgent listener:shouldAcceptNewConnection:].cold.1(v5, v9);
  }

  return v7;
}

- (CARSessionRequestHandling)requestHandler
{
  void *v2;
  void *v3;

  -[CARSessionRequestAgent handlerProxy](self, "handlerProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CARSessionRequestHandling *)v3;
}

- (BOOL)wantsCarPlayControlAdvertisingForUSB
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForUSB__block_invoke;
  v4[3] = &unk_1E5427EF0;
  v4[4] = &v5;
  CRServiceConnectionSynchronousPerform(v4, &__block_literal_global_11);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __62__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForUSB__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForUSB__block_invoke_2;
  v3[3] = &unk_1E5427EC8;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "wantsCarPlayControlAdvertisingForUSBWithReply:", v3);
}

void __62__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForUSB__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    CarGeneralLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __62__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForUSB__block_invoke_2_cold_1();

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  }

}

void __62__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForUSB__block_invoke_37(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __62__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForUSB__block_invoke_37_cold_1();

}

- (BOOL)wantsCarPlayControlAdvertisingForWiFiUUID:(id)a3
{
  id v3;
  id v4;
  char v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForWiFiUUID___block_invoke;
  v7[3] = &unk_1E5427FE0;
  v4 = v3;
  v8 = v4;
  v9 = &v10;
  CRServiceConnectionSynchronousPerform(v7, &__block_literal_global_40_0);
  v5 = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __68__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForWiFiUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForWiFiUUID___block_invoke_2;
  v4[3] = &unk_1E5427EC8;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "wantsCarPlayControlAdvertisingForWiFiUUID:reply:", v2, v4);
}

void __68__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForWiFiUUID___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    CarGeneralLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __68__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForWiFiUUID___block_invoke_2_cold_1();

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  }

}

void __68__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForWiFiUUID___block_invoke_39(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __68__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForWiFiUUID___block_invoke_39_cold_1();

}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (CARSessionRequestHandlerProxy)handlerProxy
{
  return self->_handlerProxy;
}

- (void)setHandlerProxy:(id)a3
{
  objc_storeStrong((id *)&self->_handlerProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerProxy, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  _DWORD v3[2];
  __int16 v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = objc_msgSend(a1, "processIdentifier");
  v4 = 2112;
  v5 = CFSTR("com.apple.private.carkit.sessionRequest");
  _os_log_error_impl(&dword_1A83A2000, a2, OS_LOG_TYPE_ERROR, "Process %i does not have the %@ entitlement", (uint8_t *)v3, 0x12u);
}

void __62__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForUSB__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "Error from wantsCarPlayControlAdvertisingForUSB: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForUSB__block_invoke_37_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "Error calling wantsCarPlayControlAdvertisingForUSB: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForWiFiUUID___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "Error from wantsCarPlayControlAdvertisingForWiFiUUID: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__CARSessionRequestAgent_wantsCarPlayControlAdvertisingForWiFiUUID___block_invoke_39_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "Error calling wantsCarPlayControlAdvertisingForWiFiUUID: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
