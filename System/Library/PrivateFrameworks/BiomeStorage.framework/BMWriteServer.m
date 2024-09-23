@implementation BMWriteServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  NSString *client;
  NSString *v15;
  NSString *v16;
  BOOL v17;
  BMWriteServerExported *v18;
  BOOL v19;
  NSString *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1AF4163D4]();
  objc_msgSend(MEMORY[0x1E0D01D18], "processWithXPCConnection:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __biome_log_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "executableName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v11;
    v26 = 1024;
    v27 = objc_msgSend(v9, "pid");
    _os_log_impl(&dword_1A95BD000, v10, OS_LOG_TYPE_DEFAULT, "Incoming connection from %{public}@(%d)", (uint8_t *)&v24, 0x12u);

  }
  objc_msgSend(MEMORY[0x1E0D01CD0], "policyForProcess:connectionFlags:useCase:", v9, 0, *MEMORY[0x1E0D01CA0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "allowsConnectionToWriteService") & 1) == 0)
  {
    __biome_log_for_category();
    v18 = (BMWriteServerExported *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v18->super, OS_LOG_TYPE_ERROR))
      -[BMWriteServer listener:shouldAcceptNewConnection:].cold.3(v9);
    goto LABEL_13;
  }
  v13 = objc_msgSend(v9, "uid");
  if (v13 != getuid())
  {
    __biome_log_for_category();
    v18 = (BMWriteServerExported *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v18->super, OS_LOG_TYPE_ERROR))
      -[BMWriteServer listener:shouldAcceptNewConnection:].cold.2(v9);
    goto LABEL_13;
  }
  client = self->_client;
  objc_msgSend(v9, "identifier");
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!client)
  {
    v21 = self->_client;
    self->_client = v15;

    goto LABEL_16;
  }
  v17 = -[NSString isEqualToString:](client, "isEqualToString:", v15);

  if (v17)
  {
LABEL_16:
    v18 = -[BMWriteServerExported initWithProcess:accessControlPolicy:]([BMWriteServerExported alloc], "initWithProcess:accessControlPolicy:", v9, v12);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEAF8650);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v22);

    objc_msgSend(v7, "setExportedObject:", v18);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEAF8130);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v23);

    objc_msgSend(v7, "resume");
    v19 = 1;
    goto LABEL_14;
  }
  __biome_log_for_category();
  v18 = (BMWriteServerExported *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v18->super, OS_LOG_TYPE_ERROR))
    -[BMWriteServer listener:shouldAcceptNewConnection:].cold.1(v9);
LABEL_13:
  v19 = 0;
LABEL_14:

  objc_autoreleasePoolPop(v8);
  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "executableName");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_1A95BD000, v2, v3, "Refusing connection from %{public}@(%d), client mismatch", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "executableName");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_1A95BD000, v2, v3, "Refusing connection from %{public}@(%d), wrong user", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "executableName");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_1A95BD000, v2, v3, "Refusing connection from %{public}@(%d), process not properly entitled", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

@end
