@implementation IRBackgroundActivitiesManager

- (IRBackgroundActivitiesManager)initWithServer:(id)a3
{
  id v4;
  IRBackgroundActivitiesManager *v5;
  IRBackgroundActivitiesManager *v6;
  IRAnalyticsManager *v7;
  IRCleanupManager *v8;
  IRMobileAssetManager *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IRBackgroundActivitiesManager;
  v5 = -[IRBackgroundActivitiesManager init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[IRBackgroundActivitiesManager setServer:](v5, "setServer:", v4);
    v7 = -[IRAnalyticsManager initWithBackgroundActivitiesManager:]([IRAnalyticsManager alloc], "initWithBackgroundActivitiesManager:", v6);
    -[IRBackgroundActivitiesManager setAnalyticsManager:](v6, "setAnalyticsManager:", v7);

    v8 = -[IRCleanupManager initWithBackgroundActivitiesManager:]([IRCleanupManager alloc], "initWithBackgroundActivitiesManager:", v6);
    -[IRBackgroundActivitiesManager setCleanupManager:](v6, "setCleanupManager:", v8);

    v9 = -[IRMobileAssetManager initWithBackgroundActivitiesManager:]([IRMobileAssetManager alloc], "initWithBackgroundActivitiesManager:", v6);
    -[IRBackgroundActivitiesManager setMobileAssetManager:](v6, "setMobileAssetManager:", v9);

  }
  return v6;
}

- (void)registerForRepeatingBackgroundXPCActivityWithIdentifier:(id)a3 interval:(int64_t)a4 isDiskIntensive:(BOOL)a5 isMemoryIntensive:(BOOL)a6 handler:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v11;
  id v12;
  xpc_object_t v13;
  int64_t v14;
  id v15;
  const char *v16;
  id v17;
  id v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v8 = a6;
  v9 = a5;
  v25 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a7;
  v13 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v13, (const char *)*MEMORY[0x24BDAC6B8], 1);
  xpc_dictionary_set_int64(v13, (const char *)*MEMORY[0x24BDAC5F0], a4);
  if (a4 >= 0)
    v14 = a4;
  else
    v14 = a4 + 1;
  xpc_dictionary_set_int64(v13, (const char *)*MEMORY[0x24BDAC5D8], v14 >> 1);
  xpc_dictionary_set_string(v13, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A0]);
  xpc_dictionary_set_BOOL(v13, (const char *)*MEMORY[0x24BDAC6E8], 1);
  if (v9)
    xpc_dictionary_set_BOOL(v13, (const char *)*MEMORY[0x24BDAC5C0], 1);
  if (v8)
    xpc_dictionary_set_BOOL(v13, (const char *)*MEMORY[0x24BDAC648], 1);
  v15 = objc_retainAutorelease(v11);
  v16 = (const char *)objc_msgSend(v15, "UTF8String");
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __140__IRBackgroundActivitiesManager_registerForRepeatingBackgroundXPCActivityWithIdentifier_interval_isDiskIntensive_isMemoryIntensive_handler___block_invoke;
  v20[3] = &unk_251045618;
  v17 = v15;
  v21 = v17;
  v18 = v12;
  v22 = v18;
  xpc_activity_register(v16, v13, v20);
  v19 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v17;
    _os_log_impl(&dword_23FFBA000, v19, OS_LOG_TYPE_DEFAULT, "#background-activity-manager, XPC activity registered: %@", buf, 0xCu);
  }

}

void __140__IRBackgroundActivitiesManager_registerForRepeatingBackgroundXPCActivityWithIdentifier_interval_isDiskIntensive_isMemoryIntensive_handler___block_invoke(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  xpc_activity_state_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  state = xpc_activity_get_state(activity);
  v4 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2048;
    v9 = state;
    _os_log_impl(&dword_23FFBA000, v4, OS_LOG_TYPE_DEFAULT, "#background-activity-manager, XPC activity %@, called with state = %ld", (uint8_t *)&v6, 0x16u);
  }
  if (state == 2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (IRSessionServer)server
{
  return (IRSessionServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (void)setServer:(id)a3
{
  objc_storeWeak((id *)&self->_server, a3);
}

- (int)userDefaultsRefreshToken
{
  return self->_userDefaultsRefreshToken;
}

- (void)setUserDefaultsRefreshToken:(int)a3
{
  self->_userDefaultsRefreshToken = a3;
}

- (IRAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (IRCleanupManager)cleanupManager
{
  return self->_cleanupManager;
}

- (void)setCleanupManager:(id)a3
{
  objc_storeStrong((id *)&self->_cleanupManager, a3);
}

- (IRMobileAssetManager)mobileAssetManager
{
  return self->_mobileAssetManager;
}

- (void)setMobileAssetManager:(id)a3
{
  objc_storeStrong((id *)&self->_mobileAssetManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetManager, 0);
  objc_storeStrong((id *)&self->_cleanupManager, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_destroyWeak((id *)&self->_server);
}

@end
