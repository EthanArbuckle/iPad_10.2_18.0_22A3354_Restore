@implementation SOConfigurationClient

void __38__SOConfigurationClient__reloadConfig__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  SO_LOG_SOConfigurationClient();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __38__SOConfigurationClient__reloadConfig__block_invoke_cold_1(v5, (uint64_t)v6, v7);

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

}

void __38__SOConfigurationClient_defaultClient__block_invoke()
{
  SOConfigurationClient *v0;
  void *v1;

  v0 = objc_alloc_init(SOConfigurationClient);
  v1 = (void *)defaultClient_client;
  defaultClient_client = (uint64_t)v0;

}

- (SOConfigurationClient)init
{
  NSObject *v3;
  SOConfigurationClient *v4;
  SOClient *v5;
  SOClient *client;
  SOConfigurationVersion *v7;
  SOConfigurationVersion *configurationVersion;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  SOConfigurationClient *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  SO_LOG_SOConfigurationClient();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[SOConfigurationClient init]";
    v13 = 2112;
    v14 = self;
    _os_log_impl(&dword_1CF39B000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v10.receiver = self;
  v10.super_class = (Class)SOConfigurationClient;
  v4 = -[SOConfigurationClient init](&v10, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(SOClient);
    client = v4->_client;
    v4->_client = v5;

    v7 = -[SOConfigurationVersion initWithMode:]([SOConfigurationVersion alloc], "initWithMode:", 1);
    configurationVersion = v4->_configurationVersion;
    v4->_configurationVersion = v7;

  }
  return v4;
}

- (BOOL)willHandleURL:(id)a3 responseCode:(int64_t)a4 callerBundleIdentifier:(id)a5
{
  id v8;
  id v9;
  SOConfigurationClient *v10;

  v8 = a3;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  -[SOConfigurationClient _checkNewVersion](v10, "_checkNewVersion");
  LOBYTE(a4) = -[SOConfiguration willHandleURL:responseCode:callerBundleIdentifier:](v10->_configuration, "willHandleURL:responseCode:callerBundleIdentifier:", v8, a4, v9);
  objc_sync_exit(v10);

  return a4;
}

- (void)_checkNewVersion
{
  int64_t v3;
  SOConfiguration *configuration;

  v3 = -[SOConfigurationVersion checkVersion](self->_configurationVersion, "checkVersion");
  if (v3 == 1)
  {
    -[SOConfigurationClient _reloadConfig](self, "_reloadConfig");
  }
  else if (v3 == 2)
  {
    configuration = self->_configuration;
    self->_configuration = 0;

  }
}

+ (id)defaultClient
{
  void *v2;
  NSObject *v3;

  if (defaultClient_onceToken != -1)
    dispatch_once(&defaultClient_onceToken, &__block_literal_global_4);
  v2 = (void *)defaultClient_client;
  if (!defaultClient_client)
  {
    SO_LOG_SOConfigurationClient();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      +[SOConfigurationClient defaultClient].cold.1(v3);

    v2 = (void *)defaultClient_client;
  }
  return v2;
}

- (void)_reloadConfig
{
  NSObject *v3;
  SOClient *client;
  _QWORD v5[5];
  _BYTE buf[24];
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SO_LOG_SOConfigurationClient();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SOConfigurationClient _reloadConfig]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_1CF39B000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v7 = __Block_byref_object_copy_;
  v8 = __Block_byref_object_dispose_;
  v9 = 0;
  client = self->_client;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__SOConfigurationClient__reloadConfig__block_invoke;
  v5[3] = &unk_1E8C5C5F0;
  v5[4] = buf;
  -[SOClient configurationWithCompletion:](client, "configurationWithCompletion:", v5);
  objc_storeStrong((id *)&self->_configuration, *(id *)(*(_QWORD *)&buf[8] + 40));
  _Block_object_dispose(buf, 8);

}

- (id)profileForURL:(id)a3 responseCode:(int64_t)a4
{
  id v6;
  SOConfigurationClient *v7;
  void *v8;
  NSObject *v9;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  -[SOConfigurationClient _checkNewVersion](v7, "_checkNewVersion");
  -[SOConfiguration profileForURL:responseCode:](v7->_configuration, "profileForURL:responseCode:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 && v7->_configuration)
  {
    SO_LOG_SOConfigurationClient();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SOConfigurationClient profileForURL:responseCode:].cold.1((uint64_t)v6, (uint64_t *)&v7->_configuration, v9);

  }
  objc_sync_exit(v7);

  return v8;
}

- (SOConfiguration)configuration
{
  SOConfigurationClient *v2;
  SOConfiguration *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[SOConfigurationClient _checkNewVersion](v2, "_checkNewVersion");
  v3 = v2->_configuration;
  objc_sync_exit(v2);

  return v3;
}

- (int64_t)configVersion
{
  SOConfigurationClient *v2;
  int64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[SOConfigurationVersion version](v2->_configurationVersion, "version");
  objc_sync_exit(v2);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationVersion, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

+ (void)defaultClient
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CF39B000, log, OS_LOG_TYPE_ERROR, "no SOConfigurationClient!", v1, 2u);
}

- (void)profileForURL:(os_log_t)log responseCode:.cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 141558531;
  v5 = 1752392040;
  v6 = 2117;
  v7 = a1;
  v8 = 2114;
  v9 = v3;
  _os_log_error_impl(&dword_1CF39B000, log, OS_LOG_TYPE_ERROR, "not AppSSO URL: %{sensitive, mask.hash}@ in %{public}@", (uint8_t *)&v4, 0x20u);
}

void __38__SOConfigurationClient__reloadConfig__block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  _DWORD v6[2];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "profiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 67109378;
  v6[1] = objc_msgSend(v5, "count");
  v7 = 2114;
  v8 = a2;
  _os_log_debug_impl(&dword_1CF39B000, a3, OS_LOG_TYPE_DEBUG, "got new configuration with %d profile(s), error = %{public}@", (uint8_t *)v6, 0x12u);

}

@end
