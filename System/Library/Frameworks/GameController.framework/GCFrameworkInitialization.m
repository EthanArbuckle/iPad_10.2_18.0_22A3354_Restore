@implementation GCFrameworkInitialization

+ (void)listenForObservers
{
  NSObject *v2;
  uint8_t v3[16];

  if ((currentProcessIsGameControllerDaemon() & 1) == 0)
  {
    if (gc_isInternalBuild())
    {
      getGCInitLogger();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v3 = 0;
        _os_log_impl(&dword_215181000, v2, OS_LOG_TYPE_DEFAULT, "Listening for observers to dependent notifications", v3, 2u);
      }

    }
    _CFNotificationCenterRegisterDependentNotificationList();
  }
}

+ (void)controllerManagerDidOpen
{
  NSObject *v2;

  +[GCFrameworkInitialization initQueue](GCFrameworkInitialization, "initQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_5);

}

uint64_t __53__GCFrameworkInitialization_controllerManagerDidOpen__block_invoke()
{
  NSObject *v1;
  uint8_t v2[16];

  if (gc_isInternalBuild())
  {
    getGCInitLogger();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_215181000, v1, OS_LOG_TYPE_DEFAULT, "GCControllerManager did open", v2, 2u);
    }

  }
  return currentProcessIsGameControllerDaemon();
}

+ (id)initQueue
{
  if (initQueue_onceToken != -1)
    dispatch_once(&initQueue_onceToken, &__block_literal_global_64);
  return (id)initQueue_queue;
}

void __38__GCFrameworkInitialization_initQueue__block_invoke()
{
  objc_storeStrong((id *)&initQueue_queue, MEMORY[0x24BDAC9B8]);
}

+ (id)initOperationQueue
{
  if (initOperationQueue_onceToken != -1)
    dispatch_once(&initOperationQueue_onceToken, &__block_literal_global_65);
  return (id)initOperationQueue_queue;
}

void __47__GCFrameworkInitialization_initOperationQueue__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[NSOperationQueue mainQueue](&off_254DF3620, "mainQueue");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)initOperationQueue_queue;
  initOperationQueue_queue = v0;

}

+ (void)enableControllerSupportWithReason:(int64_t)a3
{
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCInitLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)(a3 - 1) > 2)
        v5 = CFSTR("Unknown");
      else
        v5 = off_24D2B3578[a3 - 1];
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_215181000, v4, OS_LOG_TYPE_INFO, "enableControllerSupportWithReason: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  if (enableControllerSupportWithReason__onceToken != -1)
    dispatch_once(&enableControllerSupportWithReason__onceToken, &__block_literal_global_67);
}

void __63__GCFrameworkInitialization_enableControllerSupportWithReason___block_invoke()
{
  NSObject *v0;

  if ((currentProcessIsGameControllerDaemon() & 1) == 0)
  {
    +[GCFrameworkInitialization initQueue](GCFrameworkInitialization, "initQueue");
    v0 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v0, &__block_literal_global_68_0);

  }
}

uint64_t __63__GCFrameworkInitialization_enableControllerSupportWithReason___block_invoke_2()
{
  return +[GCFrameworkInitialization initializeFramework](GCFrameworkInitialization, "initializeFramework");
}

+ (void)enableMouseSupportWithReason:(int64_t)a3
{
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCInitLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)(a3 - 1) > 2)
        v5 = CFSTR("Unknown");
      else
        v5 = off_24D2B3578[a3 - 1];
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_215181000, v4, OS_LOG_TYPE_INFO, "enableMouseSupportWithReason: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  if (enableMouseSupportWithReason__onceToken != -1)
    dispatch_once(&enableMouseSupportWithReason__onceToken, &__block_literal_global_69);
}

void __58__GCFrameworkInitialization_enableMouseSupportWithReason___block_invoke()
{
  NSObject *v0;

  if ((currentProcessIsGameControllerDaemon() & 1) == 0)
  {
    +[GCFrameworkInitialization initQueue](GCFrameworkInitialization, "initQueue");
    v0 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v0, &__block_literal_global_70_0);

  }
}

uint64_t __58__GCFrameworkInitialization_enableMouseSupportWithReason___block_invoke_2()
{
  return +[GCFrameworkInitialization initializeFramework](GCFrameworkInitialization, "initializeFramework");
}

+ (void)enableKeyboardSupportWithReason:(int64_t)a3
{
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCInitLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)(a3 - 1) > 2)
        v5 = CFSTR("Unknown");
      else
        v5 = off_24D2B3578[a3 - 1];
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_215181000, v4, OS_LOG_TYPE_INFO, "enableKeyboardSupportWithReason: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  if (enableKeyboardSupportWithReason__onceToken != -1)
    dispatch_once(&enableKeyboardSupportWithReason__onceToken, &__block_literal_global_71);
}

void __61__GCFrameworkInitialization_enableKeyboardSupportWithReason___block_invoke()
{
  NSObject *v0;

  if ((currentProcessIsGameControllerDaemon() & 1) == 0)
  {
    +[GCFrameworkInitialization initQueue](GCFrameworkInitialization, "initQueue");
    v0 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v0, &__block_literal_global_72);

  }
}

uint64_t __61__GCFrameworkInitialization_enableKeyboardSupportWithReason___block_invoke_2()
{
  return +[GCFrameworkInitialization initializeFramework](GCFrameworkInitialization, "initializeFramework");
}

+ (void)initializeFramework
{
  NSObject *v2;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  __int16 v15;
  uint8_t v16[16];
  __int16 v17;
  uint8_t buf[16];

  +[GCFrameworkInitialization initQueue](GCFrameworkInitialization, "initQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  if ((currentProcessIsGameControllerDaemon() & 1) == 0)
  {
    if (gc_isInternalBuild())
    {
      getGCInitLogger();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215181000, v13, OS_LOG_TYPE_INFO, "Attempting to initialize framework...", buf, 2u);
      }

    }
    if (_initializedFramework == 1)
    {
      if (gc_isInternalBuild())
      {
        getGCInitLogger();
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
        {
          v17 = 0;
          v4 = "Framework has already been initialized or is already being initialized, skipping.";
          v5 = (uint8_t *)&v17;
          v6 = v3;
          v7 = OS_LOG_TYPE_INFO;
LABEL_22:
          _os_log_impl(&dword_215181000, v6, v7, v4, v5, 2u);
          goto LABEL_23;
        }
        goto LABEL_23;
      }
    }
    else
    {
      _initializedFramework = 1;
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl(&dword_215181000, v14, OS_LOG_TYPE_INFO, "GCControllerManagerInit begin", v16, 2u);
        }

      }
      v8 = (void *)MEMORY[0x2199DE97C]();
      v9 = +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
      if (GCApplicationIsAlmond())
        dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_74);
      +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "open");

      if ((currentProcessIsGameControllerDaemon() & 1) == 0)
      {
        +[_GCCurrentApplicationForegroundMonitor sharedInstance]();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_GCCurrentApplicationForegroundMonitor addObserver:notifyCurrent:](v11, v12, 1);

      }
      objc_autoreleasePoolPop(v8);
      if (gc_isInternalBuild())
      {
        getGCInitLogger();
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          v15 = 0;
          v4 = "Framework initialized!";
          v5 = (uint8_t *)&v15;
          v6 = v3;
          v7 = OS_LOG_TYPE_DEFAULT;
          goto LABEL_22;
        }
LABEL_23:

      }
    }
  }
}

void __48__GCFrameworkInitialization_initializeFramework__block_invoke()
{
  id v0;

  +[NSUserDefaults standardUserDefaults](&off_254DEF040, "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "registerDefaults:", &unk_24D30F958);

}

@end
