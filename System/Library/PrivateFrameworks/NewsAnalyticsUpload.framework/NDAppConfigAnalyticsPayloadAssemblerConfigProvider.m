@implementation NDAppConfigAnalyticsPayloadAssemblerConfigProvider

- (NDAppConfigAnalyticsPayloadAssemblerConfigProvider)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[NDAppConfigAnalyticsPayloadAssemblerConfigProvider init]";
    v9 = 2080;
    v10 = "NDAppConfigAnalyticsPayloadAssemblerConfigProvider.m";
    v11 = 1024;
    v12 = 24;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_214674000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NDAppConfigAnalyticsPayloadAssemblerConfigProvider init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NDAppConfigAnalyticsPayloadAssemblerConfigProvider)initWithAppConfigurationManager:(id)a3
{
  id v5;
  NDAppConfigAnalyticsPayloadAssemblerConfigProvider *v6;
  NDAppConfigAnalyticsPayloadAssemblerConfigProvider *v7;
  objc_super v9;

  v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAppConfigAnalyticsPayloadAssemblerConfigProvider initWithAppConfigurationManager:].cold.1();
  v9.receiver = self;
  v9.super_class = (Class)NDAppConfigAnalyticsPayloadAssemblerConfigProvider;
  v6 = -[NDAppConfigAnalyticsPayloadAssemblerConfigProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_appConfigurationManager, a3);

  return v7;
}

- (void)fetchConfigWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAppConfigAnalyticsPayloadAssemblerConfigProvider fetchConfigWithCompletion:].cold.1();
  -[NDAppConfigAnalyticsPayloadAssemblerConfigProvider appConfigurationManager](self, "appConfigurationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__NDAppConfigAnalyticsPayloadAssemblerConfigProvider_fetchConfigWithCompletion___block_invoke;
  v7[3] = &unk_24D1DF0E0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchAppConfigurationIfNeededWithCompletion:", v7);

}

void __80__NDAppConfigAnalyticsPayloadAssemblerConfigProvider_fetchConfigWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(v6, "analyticsEnvelopeContentTypeConfigsForEnvironment:", FCDefaultsReadEndpointEnvironment());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, void *, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v5, objc_msgSend(v6, "analyticsEndpointMaxPayloadSize"), 0);

  }
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

- (void)setAppConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_appConfigurationManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
}

- (void)initWithAppConfigurationManager:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"appConfigurationManager", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)fetchConfigWithCompletion:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);

  OUTLINED_FUNCTION_3();
}

@end
