@implementation NetworkQualityClient

+ (id)getXpcConn
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.network-quality.NetworkQualityXPC"));
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_257220788);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);

  objc_msgSend(v2, "resume");
  return v2;
}

+ (void)performMeasurementWithConfiguration:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "getXpcConn");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performMeasurementWithConfiguration:reply:", v7, v6);

}

void __66__NetworkQualityClient_performMeasurementWithConfiguration_reply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  netqual_log_init();
  v3 = (void *)os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    objc_msgSend(v2, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedFailureReason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315906;
    v8 = "+[NetworkQualityClient performMeasurementWithConfiguration:reply:]_block_invoke";
    v9 = 1024;
    v10 = 37;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_242A42000, v4, OS_LOG_TYPE_DEFAULT, "%s:%u - Error on remote object proxy: %@ %@\n", (uint8_t *)&v7, 0x26u);

  }
}

+ (void)findLocalMeasurementEndpoints:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "getXpcConn");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "findLocalMeasurementEndpoints:", v4);

}

void __54__NetworkQualityClient_findLocalMeasurementEndpoints___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  netqual_log_init();
  v3 = (void *)os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    objc_msgSend(v2, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedFailureReason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315906;
    v8 = "+[NetworkQualityClient findLocalMeasurementEndpoints:]_block_invoke";
    v9 = 1024;
    v10 = 48;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_242A42000, v4, OS_LOG_TYPE_DEFAULT, "%s:%u - Error on remote object proxy: %@ %@\n", (uint8_t *)&v7, 0x26u);

  }
}

@end
