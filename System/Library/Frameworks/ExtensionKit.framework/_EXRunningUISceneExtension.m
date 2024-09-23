@implementation _EXRunningUISceneExtension

- (_EXRunningUISceneExtension)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_EXRunningUISceneExtension;
  return -[_EXRunningUISceneExtension init](&v3, sel_init);
}

- (int)startWithArguments:(const char *)a3 count:(int)a4
{
  int result;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _EXRunningUISceneExtension *val;
  _QWORD v32[4];
  id v33;
  id location;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)_EXRunningUISceneExtension;
  result = -[_EXRunningExtension _startWithArguments:count:](&v35, sel__startWithArguments_count_, a3, *(_QWORD *)&a4);
  if (!result)
  {
    val = self;
    _EXDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[_EXRunningUISceneExtension startWithArguments:count:].cold.3(v6, v7, v8, v9, v10, v11, v12, v13);

    objc_initWeak(&location, val);
    v14 = (void *)MEMORY[0x24BE0FA20];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __55___EXRunningUISceneExtension_startWithArguments_count___block_invoke;
    v32[3] = &unk_24C3E3A38;
    objc_copyWeak(&v33, &location);
    objc_msgSend(v14, "listenerWithConfigurator:", v32);
    objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "activate");
    _EXDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[_EXRunningUISceneExtension startWithArguments:count:].cold.2(v15, v16, v17, v18, v19, v20, v21, v22);

    -[_EXRunningUIExtension checkIn](val, "checkIn");
    _EXDefaultLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[_EXRunningUISceneExtension startWithArguments:count:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

    result = objc_msgSend(MEMORY[0x24BE0FA48], "activateXPCService");
    __break(1u);
  }
  return result;
}

- (NSXPCListener)internalListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInternalListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalListener, 0);
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  -[_EXRunningExtension willFinishLaunching](self, "willFinishLaunching", a3, a4);
  return 1;
}

- (void)applicationWillResignActive:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;

  _EXDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[_EXRunningUISceneExtension(UIApplicationDelegate) applicationWillResignActive:].cold.1(v3, v4, v5);

}

- (void)applicationDidBecomeActive:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;

  _EXDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[_EXRunningUISceneExtension(UIApplicationDelegate) applicationDidBecomeActive:].cold.1(v3, v4, v5);

}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _EXFBSSceneSession *v13;
  void *v14;
  _EXFBSSceneSession *v15;
  void *v16;
  void *v17;

  v7 = a5;
  v8 = a4;
  _EXDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[_EXRunningUISceneExtension(UIApplicationDelegate) application:configurationForConnectingSceneSession:options:].cold.2(v9, v10, v11);

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  _EXDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[_EXRunningUISceneExtension(UIApplicationDelegate) application:configurationForConnectingSceneSession:options:].cold.1(v7, v12);

  v13 = [_EXFBSSceneSession alloc];
  -[_EXRunningExtension extension](self, "extension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[_EXSceneSession initWithExtension:](v13, "initWithExtension:", v14);

  objc_msgSend(v7, "_fbsScene");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EXFBSSceneSession connectWithFBSScene:](v15, "connectWithFBSScene:", v16);

  if (application_configurationForConnectingSceneSession_options__onceToken != -1)
    dispatch_once(&application_configurationForConnectingSceneSession_options__onceToken, &__block_literal_global_3);
  objc_msgSend(v8, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setDelegateClass:", 0);
  return v17;
}

- (void)startWithArguments:(uint64_t)a3 count:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_20AE73000, a1, a3, "Resuming service listener", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_0();
}

- (void)startWithArguments:(uint64_t)a3 count:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_20AE73000, a1, a3, "Checking in with launchd", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_0();
}

- (void)startWithArguments:(uint64_t)a3 count:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_20AE73000, a1, a3, "Configuring service listener", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_0();
}

@end
