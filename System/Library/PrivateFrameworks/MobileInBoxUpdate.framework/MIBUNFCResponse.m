@implementation MIBUNFCResponse

- (MIBUNFCResponse)init
{
  MIBUNFCResponse *v2;
  MIBUNFCResponse *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIBUNFCResponse;
  v2 = -[MIBUNFCResponse init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MIBUNFCResponse setRejected:](v2, "setRejected:", 0);
    -[MIBUNFCResponse setError:](v3, "setError:", 0);
  }
  return v3;
}

- (MIBUNFCResponse)initWithResponsePayload:(id)a3
{
  id v4;
  MIBUNFCResponse *v5;
  MIBUNFCResponse *v6;
  MIBUNFCResponse *v7;

  v4 = a3;
  v5 = -[MIBUNFCResponse init](self, "init");
  v6 = v5;
  if (v5 && !-[MIBUNFCResponse _deserialize:](v5, "_deserialize:", v4))
    v7 = 0;
  else
    v7 = v6;

  return v7;
}

- (id)serialize
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v8;

  v3 = (void *)objc_opt_new();
  -[MIBUNFCResponse error](self, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "serializeResponseError:", v4);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "serializedData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_11);
    v8 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCResponse serialize].cold.1(v8, self);
    v6 = 0;
  }

  return v6;
}

void __28__MIBUNFCResponse_serialize__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (BOOL)_deserialize:(id)a3
{
  id v4;
  MIBUDeserializer *v5;
  void *v6;
  BOOL v7;
  id v8;
  BOOL v9;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;

  v4 = a3;
  v5 = -[MIBUDeserializer initWithData:]([MIBUDeserializer alloc], "initWithData:", v4);

  -[MIBUDeserializer deserialize](v5, "deserialize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_4_3);
    v11 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCResponse _deserialize:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_14;
  }
  v27 = 0;
  v7 = -[MIBUDeserializer deserializeResponseError:](v5, "deserializeResponseError:", &v27);
  v8 = v27;
  if (!v7)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_6_2);
    v19 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCResponse _deserialize:].cold.2(v19, v20, v21, v22, v23, v24, v25, v26);

LABEL_14:
    v9 = 0;
    goto LABEL_4;
  }
  -[MIBUNFCResponse setError:](self, "setError:", v8);

  v9 = 1;
LABEL_4:

  return v9;
}

void __32__MIBUNFCResponse__deserialize___block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __32__MIBUNFCResponse__deserialize___block_invoke_5()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (BOOL)rejected
{
  return self->_rejected;
}

- (void)setRejected:(BOOL)a3
{
  self->_rejected = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)serialize
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_222C3F000, v3, OS_LOG_TYPE_ERROR, "Failed to serialize responseerror: %{public}@", (uint8_t *)&v5, 0xCu);

}

- (void)_deserialize:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_222C3F000, a1, a3, "Failed to deserialize APDU payload", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_deserialize:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_222C3F000, a1, a3, "Failed to deserialize response error", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
