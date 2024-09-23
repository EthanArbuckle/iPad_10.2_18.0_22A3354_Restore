@implementation _EXRunningUIExtension

+ (id)sharedInstance
{
  void *v2;
  NSObject *v4;
  _EXRunningUIExtension *v5;
  SEL v6;

  objc_msgSend(MEMORY[0x24BDC7A00], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  _EXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    +[_EXRunningUIExtension sharedInstance].cold.1((uint64_t)v2, v4);

  v5 = (_EXRunningUIExtension *)abort_with_reason();
  return -[_EXRunningUIExtension sceneFactory](v5, v6);
}

- (_EXExtensionSceneFactory)sceneFactory
{
  return self->_sceneFactory;
}

- (void)setSceneFactory:(id)a3
{
  objc_storeStrong((id *)&self->_sceneFactory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneFactory, 0);
}

- (void)viewServiceSessionManager:(id)a3 didCreateViewController:(id)a4 contextToken:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  _EXRunningUIExtension *v17;
  SEL v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDC7A10], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sessionForIdentifier:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _EXDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[_EXRunningUIExtension(_UIViewServiceSessionManagerDelegate) viewServiceSessionManager:didCreateViewController:contextToken:].cold.4();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _EXDefaultLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[_EXRunningUIExtension(_UIViewServiceSessionManagerDelegate) viewServiceSessionManager:didCreateViewController:contextToken:].cold.3((uint64_t)v8, v16);

    goto LABEL_16;
  }
  v13 = v11;
  if (!v13)
  {
    _EXDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[_EXRunningUIExtension(_UIViewServiceSessionManagerDelegate) viewServiceSessionManager:didCreateViewController:contextToken:].cold.1((uint64_t)v9, v15);

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_12:
    objc_msgSend(v13, "setRootViewController:", v8);

    return;
  }
  _EXDefaultLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[_EXRunningUIExtension(_UIViewServiceSessionManagerDelegate) viewServiceSessionManager:didCreateViewController:contextToken:].cold.2((uint64_t)v13, v14);

LABEL_16:
  v17 = (_EXRunningUIExtension *)abort_with_reason();
  -[_EXRunningUIExtension isExtensionViewServiceSessionManager:](v17, v18, v19);
}

- (BOOL)isExtensionViewServiceSessionManager:(id)a3
{
  return 1;
}

- (BOOL)requiresExtensionContextForViewServiceSessionManager:(id)a3
{
  return 0;
}

- (id)viewControllerClassNameForViewServiceSessionManager:(id)a3
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v3);
}

- (id)containingViewControllerClassNameForViewServiceSessionManager:(id)a3
{
  return 0;
}

- (id)mainStoryboardNameForViewServiceSessionManager:(id)a3
{
  return 0;
}

- (void)installRunloopObserverToPingLaunchdAfterEvent
{
  CFRunLoopRef Main;
  __CFRunLoop *v3;

  Main = CFRunLoopGetMain();
  if (!Main)
    -[_EXRunningUIExtension(_UIViewServiceSessionManagerDelegate) installRunloopObserverToPingLaunchdAfterEvent].cold.1();
  v3 = Main;
  sPingLaunchdObserver = (uint64_t)CFRunLoopObserverCreate(0, 0xA0uLL, 0, 0, (CFRunLoopObserverCallBack)_EXExtensionPingLaunchdAfterEvent, 0);
  CFRunLoopAddObserver(v3, (CFRunLoopObserverRef)sPingLaunchdObserver, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
}

- (void)checkIn
{
  -[_EXRunningUIExtension installRunloopObserverToPingLaunchdAfterEvent](self, "installRunloopObserverToPingLaunchdAfterEvent");
  getpid();
  memorystatus_control();
}

+ (void)sharedInstance
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  int v6[10];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_1(&dword_20AE73000, a2, v5, "%s - %s:%d: Unexpected running extension class. Expected '_EXRunningUIExtension' got '%@'", (uint8_t *)v6);

  OUTLINED_FUNCTION_3();
}

@end
