@implementation MIBUSelectResponse

- (MIBUSelectResponse)init
{
  MIBUSelectResponse *v2;
  MIBUSelectResponse *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIBUSelectResponse;
  v2 = -[MIBUNFCResponse init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MIBUSelectResponse setProtocolVersion:](v2, "setProtocolVersion:", 0);
  return v3;
}

- (id)serialize
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  if (-[MIBUNFCResponse rejected](self, "rejected"))
  {
LABEL_14:
    v9 = 0;
    goto LABEL_5;
  }
  -[MIBUSelectResponse protocolVersion](self, "protocolVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "serialize:withValue:", &unk_24EB5C538, v5);

  if ((v6 & 1) == 0)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_5);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUSelectResponse serialize].cold.2();
    goto LABEL_14;
  }
  -[MIBUNFCResponse error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "serializeResponseError:", v7);

  if ((v8 & 1) == 0)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_6_0);
    v11 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUDeviceInfoResponse serialize].cold.1(v11, self);
    goto LABEL_14;
  }
  objc_msgSend(v3, "serializedData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

  return v9;
}

void __31__MIBUSelectResponse_serialize__block_invoke()
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

void __31__MIBUSelectResponse_serialize__block_invoke_5()
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
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  id v14;

  v4 = a3;
  v5 = -[MIBUDeserializer initWithData:]([MIBUDeserializer alloc], "initWithData:", v4);

  -[MIBUDeserializer deserialize](v5, "deserialize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_8_0);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUSelectResponse _deserialize:].cold.1();
    goto LABEL_22;
  }
  v14 = 0;
  v7 = -[MIBUDeserializer deserializeResponseError:](v5, "deserializeResponseError:", &v14);
  v8 = v14;
  v9 = v8;
  if (!v7)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_10_0);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUStatusResponse _deserialize:].cold.7();
    v11 = 0;
    goto LABEL_23;
  }
  if (v8)
  {
    v11 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v6, "objectForKey:", &unk_24EB5C090);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_12_1);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUSelectResponse _deserialize:].cold.2();
LABEL_22:
    v11 = 0;
    v9 = 0;
LABEL_23:
    v12 = 0;
    goto LABEL_7;
  }
  v11 = (void *)v10;
  -[MIBUSelectResponse setProtocolVersion:](self, "setProtocolVersion:", v10);
  v9 = 0;
LABEL_6:
  v12 = 1;
LABEL_7:
  -[MIBUNFCResponse setError:](self, "setError:", v9);

  return v12;
}

void __35__MIBUSelectResponse__deserialize___block_invoke()
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

void __35__MIBUSelectResponse__deserialize___block_invoke_9()
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

void __35__MIBUSelectResponse__deserialize___block_invoke_11()
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

- (NSNumber)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(id)a3
{
  objc_storeStrong((id *)&self->_protocolVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocolVersion, 0);
}

- (void)serialize
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to serialize protocol version", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deserialize:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to deserialize payload for Select command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deserialize:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to deserialize protocol version", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
