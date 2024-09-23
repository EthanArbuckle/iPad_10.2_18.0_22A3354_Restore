@implementation DIDocUploadSessionClient

- (DIDocUploadSessionClient)init
{
  NSObject *v3;
  DIDocUploadSessionClient *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  DIV_LOG_CLIENT();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[DIDocUploadSessionClient init].cold.2();

  v16.receiver = self;
  v16.super_class = (Class)DIDocUploadSessionClient;
  v4 = -[DIDocUploadSessionClient init](&v16, sel_init);
  if (v4)
  {
    DIV_LOG_CLIENT();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[DIDocUploadSessionClient init].cold.1(v5);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.coreidvd.docUpload.xpc"), 4096);
    -[DIDocUploadSessionClient setServerConnection:](v4, "setServerConnection:", v6);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545F66A0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DIDocUploadSessionClient serverConnection](v4, "serverConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRemoteObjectInterface:", v7);

    v9 = (void *)MEMORY[0x24BDBCF20];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DIDocUploadSessionClient serverConnection](v4, "serverConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "remoteObjectInterface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_uploadDocData_uploadSettings_completion_, 0, 0);

    -[DIDocUploadSessionClient serverConnection](v4, "serverConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activate");

  }
  return v4;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A10F000, v0, v1, "DIDocUploadSessionClient dealloc", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)uploadDocData:(id)a3 uploadSettings:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  DIV_LOG_CLIENT();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[DIDocUploadSessionClient uploadDocData:uploadSettings:completion:].cold.1();

  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __68__DIDocUploadSessionClient_uploadDocData_uploadSettings_completion___block_invoke;
  v18[3] = &unk_24C2D27A8;
  v13 = v8;
  v19 = v13;
  -[DIDocUploadSessionClient remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __68__DIDocUploadSessionClient_uploadDocData_uploadSettings_completion___block_invoke_2;
  v16[3] = &unk_24C2D27D0;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "uploadDocData:uploadSettings:completion:", v10, v9, v16);

}

uint64_t __68__DIDocUploadSessionClient_uploadDocData_uploadSettings_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__DIDocUploadSessionClient_uploadDocData_uploadSettings_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    DIV_LOG_CLIENT();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __68__DIDocUploadSessionClient_uploadDocData_uploadSettings_completion___block_invoke_2_cold_2(v5, v7);

  }
  if (v6)
  {
    DIV_LOG_CLIENT();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __68__DIDocUploadSessionClient_uploadDocData_uploadSettings_completion___block_invoke_2_cold_1((uint64_t)v6, v8, v9);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)cancelUploads
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A10F000, v0, v1, "DIDocUploadSessionClient cancelUploads", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (id)createDaemonDisconnectedError
{
  return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DIDocUploadSession"), -8001, 0);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[DIDocUploadSessionClient serverConnection](self, "serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __62__DIDocUploadSessionClient_remoteObjectProxyWithErrorHandler___block_invoke;
  v9[3] = &unk_24C2D27F8;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __62__DIDocUploadSessionClient_remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  DIV_LOG_CLIENT();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__DIDocUploadSessionClient_remoteObjectProxyWithErrorHandler___block_invoke_cold_1((uint64_t)v3, v4);

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "createDaemonDisconnectedError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serverConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverConnection, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A10F000, v0, v1, "DIDocUploadSessionClient init called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)uploadDocData:uploadSettings:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A10F000, v0, v1, "DIDocUploadSessionClient uploadDocData", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__DIDocUploadSessionClient_uploadDocData_uploadSettings_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_4(&dword_20A10F000, a2, a3, "DIDocUploadSessionClient uploadDocData returned error = %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void __68__DIDocUploadSessionClient_uploadDocData_uploadSettings_completion___block_invoke_2_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_4(&dword_20A10F000, a2, v4, "DIDocUploadSessionClient uploadDocData returned data = %{public}@", (uint8_t *)&v5);

}

void __62__DIDocUploadSessionClient_remoteObjectProxyWithErrorHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_20A10F000, a2, OS_LOG_TYPE_ERROR, "DIDocUploadSessionClient remote object proxy error: %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
