@implementation CDPLocalDeviceSecretProxyImpl

- (BOOL)hasLocalSecret
{
  CDPDaemonConnection *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  _QWORD v7[5];
  uint8_t buf[8];
  uint8_t *v9;
  uint64_t v10;
  char v11;

  v2 = objc_alloc_init(CDPDaemonConnection);
  -[CDPDaemonConnection synchronousDaemonWithErrorHandler:](v2, "synchronousDaemonWithErrorHandler:", &__block_literal_global_13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7E6000, v4, OS_LOG_TYPE_DEFAULT, "\"Checking if the local device has a secret\", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v9 = buf;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__CDPLocalDeviceSecretProxyImpl_hasLocalSecret__block_invoke_12;
  v7[3] = &unk_24C7C18A8;
  v7[4] = buf;
  objc_msgSend(v3, "hasLocalSecretWithCompletion:", v7);
  -[CDPDaemonConnection connection](v2, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  LOBYTE(v5) = v9[24];
  _Block_object_dispose(buf, 8);

  return (char)v5;
}

void __47__CDPLocalDeviceSecretProxyImpl_hasLocalSecret__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __47__CDPLocalDeviceSecretProxyImpl_hasLocalSecret__block_invoke_cold_1();

}

void __47__CDPLocalDeviceSecretProxyImpl_hasLocalSecret__block_invoke_12(uint64_t a1, char a2)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  uint8_t *v6;
  __int16 v7;
  __int16 v8;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  v2 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v8 = 0;
      v5 = "\"Local device DOES have a secret\";
      v6 = (uint8_t *)&v8;
LABEL_6:
      _os_log_impl(&dword_20D7E6000, v3, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else if (v4)
  {
    v7 = 0;
    v5 = "\"Local device DOES NOT have a secret\";
    v6 = (uint8_t *)&v7;
    goto LABEL_6;
  }

}

void __47__CDPLocalDeviceSecretProxyImpl_hasLocalSecret__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, v0, v1, "\"XPC Error while checking if the local device has a secret: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
