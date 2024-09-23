@implementation AXDragEndpointClient

+ (BOOL)isValidServiceName:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = isValidServiceName__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isValidServiceName__onceToken, &__block_literal_global);
  v5 = objc_msgSend((id)isValidServiceName__AllowedServiceNames, "containsObject:", v4);

  return v5;
}

void __43__AXDragEndpointClient_isValidServiceName___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CF4D70];
  v6[0] = *MEMORY[0x1E0CF4D78];
  v6[1] = v1;
  v2 = *MEMORY[0x1E0CF4D68];
  v6[2] = *MEMORY[0x1E0CF4D60];
  v6[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)isValidServiceName__AllowedServiceNames;
  isValidServiceName__AllowedServiceNames = v4;

}

- (AXDragEndpointClient)initWithServiceName:(id)a3
{
  id v4;
  AXDragEndpointClient *v5;
  uint64_t v6;
  NSXPCConnection *connection;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AXDragEndpointClient;
  v5 = -[AXDragEndpointClient init](&v10, sel_init);
  if (v5 && objc_msgSend((id)objc_opt_class(), "isValidServiceName:", v4))
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v4, 0);
    connection = v5->_connection;
    v5->_connection = (NSXPCConnection *)v6;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF53E980);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5->_connection, "setRemoteObjectInterface:", v8);

    -[NSXPCConnection resume](v5->_connection, "resume");
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AXDragEndpointClient;
  -[AXDragEndpointClient dealloc](&v3, sel_dealloc);
}

- (void)getDragEndpoint:(id)a3
{
  id v4;
  NSXPCConnection *connection;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  connection = self->_connection;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__AXDragEndpointClient_getDragEndpoint___block_invoke;
  v12[3] = &unk_1E76AB268;
  v7 = v4;
  v13 = v7;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __40__AXDragEndpointClient_getDragEndpoint___block_invoke_226;
  v10[3] = &unk_1E76AB290;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "requestDragEndpoint:", v10);

}

void __40__AXDragEndpointClient_getDragEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  AXLogDragging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __40__AXDragEndpointClient_getDragEndpoint___block_invoke_cold_1((uint64_t)v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __40__AXDragEndpointClient_getDragEndpoint___block_invoke_226(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __40__AXDragEndpointClient_getDragEndpoint___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BD892000, a2, OS_LOG_TYPE_ERROR, "unable to get drag endpoint: %@", (uint8_t *)&v2, 0xCu);
}

@end
