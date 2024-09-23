@implementation SOConfigurationManager

+ (id)defaultManager
{
  void *v2;
  NSObject *v3;

  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_6);
  v2 = (void *)defaultManager_manager;
  if (!defaultManager_manager)
  {
    SO_LOG_SOConfigurationManager();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      +[SOConfigurationManager defaultManager].cold.1(v3);

    v2 = (void *)defaultManager_manager;
  }
  return v2;
}

void __40__SOConfigurationManager_defaultManager__block_invoke()
{
  SOConfigurationManager *v0;
  void *v1;

  v0 = objc_alloc_init(SOConfigurationManager);
  v1 = (void *)defaultManager_manager;
  defaultManager_manager = (uint64_t)v0;

}

- (SOConfigurationManager)init
{
  NSObject *v3;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  SOConfigurationManager *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOConfigurationManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[SOConfigurationManager init]";
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_20DABC000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v5.receiver = self;
  v5.super_class = (Class)SOConfigurationManager;
  return -[SOConfigurationManager init](&v5, sel_init);
}

- (void)saveConfigurationData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  SOConfigurationManager *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  SO_LOG_SOConfigurationManager();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[SOConfigurationManager saveConfigurationData:completion:]";
    v17 = 2112;
    v18 = self;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __59__SOConfigurationManager_saveConfigurationData_completion___block_invoke;
  v12[3] = &unk_24C80C2C8;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, v12);

}

void __59__SOConfigurationManager_saveConfigurationData_completion___block_invoke(uint64_t a1)
{
  SOConfigurationHost *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;

  v2 = objc_alloc_init(SOConfigurationHost);
  v3 = *(_QWORD *)(a1 + 32);
  v6 = 0;
  -[SOConfigurationHost saveConfiguration:error:](v2, "saveConfiguration:error:", v3, &v6);
  v4 = v6;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, BOOL, id))(v5 + 16))(v5, v4 == 0, v4);

}

+ (void)defaultManager
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20DABC000, log, OS_LOG_TYPE_ERROR, "no SOConfigurationManager!", v1, 2u);
}

@end
