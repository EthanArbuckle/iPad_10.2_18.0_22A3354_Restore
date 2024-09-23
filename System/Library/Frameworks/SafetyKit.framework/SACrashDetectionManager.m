@implementation SACrashDetectionManager

+ (BOOL)isAvailable
{
  void *v5;

  if (!+[SAEntitlement currentProcessHasEntitlement:](SAEntitlement, "currentProcessHasEntitlement:", CFSTR("com.apple.developer.severe-vehicular-crash-event")))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SACrashDetectionManager.m"), 42, CFSTR("SafetyKit Crash Detection entitlement is required for this API"));

  }
  return !+[SAGestalt isProductionFused](SAGestalt, "isProductionFused")
      && +[SAGestalt isInternalBuild](SAGestalt, "isInternalBuild")
      && (objc_msgSend((id)objc_opt_class(), "availableOverrideSetting") & 1) != 0
      || +[SAGestalt deviceSupportsKappa](SAGestalt, "deviceSupportsKappa");
}

- (SACrashDetectionManager)init
{
  SACrashDetectionManager *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SACrashDetectionManager;
  v2 = -[SACrashDetectionManager init](&v21, sel_init);
  if (v2)
  {
    sa_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[SACrashDetectionManager init].cold.2(v3, v4, v5, v6, v7, v8, v9, v10);

    if (objc_msgSend((id)objc_opt_class(), "isAvailable"))
    {
      -[SACrashDetectionManager client](v2, "client");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCrashDetectionClientDelegate:", v2);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject addObserver:selector:name:object:](v12, "addObserver:selector:name:object:", v2, sel__appDidBecomeActive_, CFSTR("UIApplicationDidBecomeActiveNotification"), 0);
    }
    else
    {
      sa_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SACrashDetectionManager init].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    }

  }
  return v2;
}

- (SAAuthorizationStatus)authorizationStatus
{
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!+[SAEntitlement currentProcessHasEntitlement:](SAEntitlement, "currentProcessHasEntitlement:", CFSTR("com.apple.developer.severe-vehicular-crash-event")))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SACrashDetectionManager.m"), 73, CFSTR("SafetyKit Crash Detection entitlement is required for this API"));

  }
  if ((objc_msgSend((id)objc_opt_class(), "isAvailable") & 1) != 0)
    return +[SAAuthorization authorizationStatusWithTCCPreflightResult:](SAAuthorization, "authorizationStatusWithTCCPreflightResult:", TCCAccessPreflight());
  sa_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[SACrashDetectionManager authorizationStatus]";
    _os_log_impl(&dword_23457A000, v5, OS_LOG_TYPE_DEFAULT, "%s - Manager is unavailable, returning SAAuthorizationStatusDenied", (uint8_t *)&v7, 0xCu);
  }

  return 1;
}

- (void)setDelegate:(id)delegate
{
  id v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  id WeakRetained;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v5 = delegate;
  if (!+[SAEntitlement currentProcessHasEntitlement:](SAEntitlement, "currentProcessHasEntitlement:", CFSTR("com.apple.developer.severe-vehicular-crash-event")))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SACrashDetectionManager.m"), 87, CFSTR("SafetyKit Crash Detection entitlement is required to use this API"));

  }
  v6 = objc_msgSend((id)objc_opt_class(), "isAvailable");
  sa_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) == 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SACrashDetectionManager setDelegate:].cold.2(v8, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_10;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SACrashDetectionManager setDelegate:].cold.1();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained != v5)
  {
    objc_storeWeak((id *)&self->_delegate, v5);
    -[SACrashDetectionManager client](self, "client");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject requestMostRecentCrashDetectionEvent](v8, "requestMostRecentCrashDetectionEvent");
LABEL_10:

  }
}

- (void)requestAuthorizationWithCompletionHandler:(void *)handler
{
  void (**v5)(void *, uint64_t, _QWORD);
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
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
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  void (**v39)(void *, uint64_t, _QWORD);

  v5 = handler;
  if (!+[SAEntitlement currentProcessHasEntitlement:](SAEntitlement, "currentProcessHasEntitlement:", CFSTR("com.apple.developer.severe-vehicular-crash-event")))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SACrashDetectionManager.m"), 102, CFSTR("SafetyKit Crash Detection entitlement is required to use this API"));

  }
  sa_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[SACrashDetectionManager requestAuthorizationWithCompletionHandler:].cold.5(v6, v7, v8, v9, v10, v11, v12, v13);

  if ((objc_msgSend((id)objc_opt_class(), "isAvailable") & 1) != 0)
  {
    v14 = +[SAAuthorization authorizationStatusWithTCCPreflightResult:](SAAuthorization, "authorizationStatusWithTCCPreflightResult:", TCCAccessPreflight());
    if (v14 == 2)
    {
      v5[2](v5, 2, 0);
      sa_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[SACrashDetectionManager requestAuthorizationWithCompletionHandler:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
LABEL_16:

      goto LABEL_20;
    }
    v31 = v14;
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "applicationState");

    sa_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v33 == 2)
    {
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[SACrashDetectionManager requestAuthorizationWithCompletionHandler:].cold.2(v31, v35);

      +[SAError errorWithCode:](SAError, "errorWithCode:", 4);
      v15 = objc_claimAutoreleasedReturnValue();
      ((void (**)(void *, uint64_t, NSObject *))v5)[2](v5, v31, v15);
      goto LABEL_16;
    }
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      -[SACrashDetectionManager requestAuthorizationWithCompletionHandler:].cold.3();

    -[SACrashDetectionManager client](self, "client");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __69__SACrashDetectionManager_requestAuthorizationWithCompletionHandler___block_invoke;
    v38[3] = &unk_2505B39F0;
    v38[4] = self;
    v39 = v5;
    objc_msgSend(v36, "requestCrashDetectionAuthorization:", v38);

  }
  else
  {
    sa_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[SACrashDetectionManager requestAuthorizationWithCompletionHandler:].cold.4(v23, v24, v25, v26, v27, v28, v29, v30);

    v5[2](v5, 1, 0);
  }
LABEL_20:

}

void __69__SACrashDetectionManager_requestAuthorizationWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;

  v5 = a3;
  sa_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __69__SACrashDetectionManager_requestAuthorizationWithCompletionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (a2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requestMostRecentCrashDetectionEvent");

  }
}

+ (BOOL)availableOverrideSetting
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("SACrashDetectionManagerAvailable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (SAClient)client
{
  return +[SAClient sharedInstance](SAClient, "sharedInstance");
}

- (void)_appDidBecomeActive:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  sa_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[SACrashDetectionManager _appDidBecomeActive:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  -[SACrashDetectionManager client](self, "client");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "requestMostRecentCrashDetectionEvent");

}

- (void)_callDelegateWithCrashEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  sa_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SACrashDetectionManager _callDelegateWithCrashEvent:].cold.1();

  -[SACrashDetectionManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "crashDetectionManager:didDetectEvent:", self, v4);

}

- (void)updateMostRecentCrashDetectionEvent:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  sa_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SACrashDetectionManager updateMostRecentCrashDetectionEvent:].cold.1();

  -[SACrashDetectionManager _callDelegateWithCrashEvent:](self, "_callDelegateWithCrashEvent:", v4);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)init
{
  OUTLINED_FUNCTION_0_0(&dword_23457A000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)setDelegate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_23457A000, v0, v1, "%s, %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)setDelegate:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_23457A000, a1, a3, "%s - Manager is unavailable, not setting delegate.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)requestAuthorizationWithCompletionHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_23457A000, a1, a3, "%s - Authorization already granted, status: %lu", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)requestAuthorizationWithCompletionHandler:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315650;
  v6 = "-[SACrashDetectionManager requestAuthorizationWithCompletionHandler:]";
  v7 = 2048;
  v8 = a1;
  v9 = 2048;
  v10 = objc_msgSend(v4, "applicationState");
  _os_log_error_impl(&dword_23457A000, a2, OS_LOG_TYPE_ERROR, "%s - Application not in foreground, not requesting authorization, status: %lu, application: %lu", (uint8_t *)&v5, 0x20u);

}

- (void)requestAuthorizationWithCompletionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_23457A000, v0, v1, "%s - Requesting authorization from server, currentStatus: %lu", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)requestAuthorizationWithCompletionHandler:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_23457A000, a1, a3, "%s - Manager is unavailable, responding with SAAuthorizationStatusDenied", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)requestAuthorizationWithCompletionHandler:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_23457A000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __69__SACrashDetectionManager_requestAuthorizationWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_23457A000, v0, v1, "%s - Authorization requested from server, newStatus: %lu", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_appDidBecomeActive:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_23457A000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_callDelegateWithCrashEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_23457A000, v0, v1, "%s, crashEvent: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)updateMostRecentCrashDetectionEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_23457A000, v0, v1, "%s, event: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
