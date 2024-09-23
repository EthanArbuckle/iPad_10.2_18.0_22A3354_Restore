@implementation AXUIDaemonApplicationDelegate

- (AXUIDaemonApplicationDelegate)init
{
  AXUIDaemonApplicationDelegate *v2;
  AXUIDaemonApplicationDelegate *v3;
  void *v4;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXUIDaemonApplicationDelegate;
  v2 = -[AXUIDaemonApplicationDelegate init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[AXUIDaemonApplicationDelegate _exitIfNotEnabled](v2, "_exitIfNotEnabled");
    -[AXUIDaemonApplicationDelegate setKeepAlive:](v3, "setKeepAlive:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "featureEnabledStatusDidChangeNotification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__enabledPreferenceDidChange_, v5, 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_systemAppDidBecomeReady, (CFStringRef)*MEMORY[0x1E0CF4DE0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v6;

  -[FBSOrientationObserver invalidate](self->_orientationObserver, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "featureEnabledStatusDidChangeNotification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, 0);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0CF4DE0], 0);
  v6.receiver = self;
  v6.super_class = (Class)AXUIDaemonApplicationDelegate;
  -[AXUIDaemonApplicationDelegate dealloc](&v6, sel_dealloc);
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  FBSOrientationObserver *v11;
  FBSOrientationObserver *orientationObserver;
  _QWORD aBlock[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "loggingFacility");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "debugFeatureName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    _os_log_impl(&dword_1BD892000, v8, OS_LOG_TYPE_DEFAULT, "Launched %@.", buf, 0xCu);

  }
  -[AXUIDaemonApplicationDelegate didFinishLaunching](self, "didFinishLaunching");
  objc_initWeak((id *)buf, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__AXUIDaemonApplicationDelegate_application_didFinishLaunchingWithOptions___block_invoke;
  aBlock[3] = &unk_1E76AB438;
  objc_copyWeak(&v15, (id *)buf);
  v10 = _Block_copy(aBlock);
  v11 = (FBSOrientationObserver *)objc_alloc_init(MEMORY[0x1E0D23188]);
  orientationObserver = self->_orientationObserver;
  self->_orientationObserver = v11;

  -[FBSOrientationObserver setHandler:](self->_orientationObserver, "setHandler:", v10);
  -[AXUIDaemonApplicationDelegate _didUpdateToOrientation:duration:](self, "_didUpdateToOrientation:duration:", -[FBSOrientationObserver activeInterfaceOrientation](self->_orientationObserver, "activeInterfaceOrientation"), 0.0);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

  return 1;
}

void __75__AXUIDaemonApplicationDelegate_application_didFinishLaunchingWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__AXUIDaemonApplicationDelegate_application_didFinishLaunchingWithOptions___block_invoke_2;
  v6[3] = &unk_1E76AB410;
  v6[4] = WeakRetained;
  v7 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __75__AXUIDaemonApplicationDelegate_application_didFinishLaunchingWithOptions___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 40), "orientation");
  objc_msgSend(*(id *)(a1 + 40), "duration");
  return objc_msgSend(v2, "_didUpdateToOrientation:duration:", v3);
}

- (void)applicationWillTerminate:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "loggingFacility");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "debugFeatureName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1BD892000, v4, OS_LOG_TYPE_DEFAULT, "Will terminate %@.", (uint8_t *)&v6, 0xCu);

  }
  -[AXUIDaemonApplicationDelegate willTerminate](self, "willTerminate");
}

- (void)_didUpdateToOrientation:(int64_t)a3 duration:(double)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint8_t buf[4];
  int64_t v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "loggingFacility");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v15 = a3;
    v16 = 2048;
    v17 = a4;
    _os_log_impl(&dword_1BD892000, v7, OS_LOG_TYPE_DEFAULT, "Update orientation to %ld with duration %g", buf, 0x16u);
  }

  AXPerformSafeBlock();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOrientation:animated:", a3, a4 > 0.0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("Duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("AXUIDaemonOrientationDidUpdateNotification"), 0, v11);

  -[AXUIDaemonApplicationDelegate didUpdateOrientation](self, "didUpdateOrientation");
}

void __66__AXUIDaemonApplicationDelegate__didUpdateToOrientation_duration___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setInterfaceOrientation:", *(_QWORD *)(a1 + 32));

}

- (void)_exitIfNotEnabled
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend((id)objc_opt_class(), "isFeatureEnabled") & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "loggingFacility");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)objc_opt_class(), "debugFeatureName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1BD892000, v3, OS_LOG_TYPE_DEFAULT, "Exiting %@.", (uint8_t *)&v6, 0xCu);

    }
    -[AXUIDaemonApplicationDelegate setKeepAlive:](self, "setKeepAlive:", 0);
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "terminateWithSuccess");

  }
}

- (void)_systemAppDidBecomeReady
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (!+[AXUIDaemonApplication usesScenes](AXUIDaemonApplication, "usesScenes"))
  {
    objc_msgSend((id)objc_opt_class(), "loggingFacility");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1BD892000, v2, OS_LOG_TYPE_DEFAULT, "Restarting because SpringBoard just became active.", v4, 2u);
    }

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "terminateWithSuccess");

  }
}

- (void)setKeepAlive:(BOOL)a3
{
  NSObject *v4;

  if (vproc_swap_integer())
  {
    objc_msgSend((id)objc_opt_class(), "loggingFacility");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[AXUIDaemonApplicationDelegate setKeepAlive:].cold.1(a3, v4);

  }
}

- (UIWindow)window
{
  return self->window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->window, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->window, 0);
  objc_storeStrong((id *)&self->_orientationObserver, 0);
}

+ (OS_os_log)loggingFacility
{
  id v2;
  OS_os_log *result;

  OUTLINED_FUNCTION_2();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  v2 = MEMORY[0x1E0C81028];
  OUTLINED_FUNCTION_1();
  return result;
}

+ (NSString)debugFeatureName
{
  NSString *result;

  OUTLINED_FUNCTION_2();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

+ (BOOL)isFeatureEnabled
{
  OUTLINED_FUNCTION_2();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  return 0;
}

+ (NSString)featureEnabledStatusDidChangeNotification
{
  NSString *result;

  OUTLINED_FUNCTION_2();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (void)setKeepAlive:(char)a1 .cold.1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_error_impl(&dword_1BD892000, a2, OS_LOG_TYPE_ERROR, "Unable to set keep alive to %i.", (uint8_t *)v2, 8u);
}

@end
