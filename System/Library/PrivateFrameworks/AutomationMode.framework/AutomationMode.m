void XAMEnableAutomationModeWithCompletion(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  +[XAMWriter sharedInstance](XAMWriter, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableAutomationModeWithCompletion:", v1);

}

uint64_t XAMEnableAutomationMode(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[XAMWriter sharedInstance](XAMWriter, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enableAutomationModeWithError:", a1);

  return v3;
}

void XAMDisableAutomationModeWithCompletion(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  +[XAMWriter sharedInstance](XAMWriter, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disableAutomationModeWithCompletion:", v1);

}

uint64_t XAMDisableAutomationMode(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[XAMWriter sharedInstance](XAMWriter, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "disableAutomationModeWithError:", a1);

  return v3;
}

void XAMCreateNoAuthenticationRequiredCookieWithCompletion(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  +[XAMWriter sharedInstance](XAMWriter, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createNoAuthenticationRequiredCookieWithCompletion:", v1);

}

uint64_t XAMCreateNoAuthenticationRequiredCookie(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[XAMWriter sharedInstance](XAMWriter, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "createNoAuthenticationRequiredCookieWithError:", a1);

  return v3;
}

void XAMRemoveNoAuthenticationRequiredCookieWithCompletion(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  +[XAMWriter sharedInstance](XAMWriter, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeNoAuthenticationRequiredCookieWithCompletion:", v1);

}

uint64_t XAMRemoveNoAuthenticationRequiredCookie(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[XAMWriter sharedInstance](XAMWriter, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "removeNoAuthenticationRequiredCookieWithError:", a1);

  return v3;
}

uint64_t XAMResetSharedWriter()
{
  return +[XAMWriter resetSharedWriter](XAMWriter, "resetSharedWriter");
}

void sub_22D1E126C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22D1E20CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_22D1E2240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D1E24A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D1E25A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D1E2698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id XAMLog()
{
  if (XAMLog_onceToken != -1)
    dispatch_once(&XAMLog_onceToken, &__block_literal_global_0);
  return (id)XAMLog_xamLog;
}

id XAMAutomationModeDataVaultPath()
{
  NSObject *v0;
  void *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  XAMLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    XAMAutomationModeDataVaultPath_cold_1();

  if (!AllowEnvOverrides())
    goto LABEL_8;
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AutomationModeDataVaultPath_Override"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    XAMLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "environment");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AutomationModeDataVaultPath_Override"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v7;
      _os_log_impl(&dword_22D1E0000, v4, OS_LOG_TYPE_DEFAULT, "Allowing override for XAMAutomationModeDataVaultPath: %{public}@", (uint8_t *)&v13, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "environment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AutomationModeDataVaultPath_Override"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_8:
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("/var/db/com.apple.dt.automationmode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

uint64_t AllowEnvOverrides()
{
  uint64_t v0;
  NSObject *v1;

  v0 = os_variant_allows_internal_security_policies();
  XAMLog();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    AllowEnvOverrides_cold_1(v0, v1);

  return v0;
}

id XAMAutomationModeStateFilePath()
{
  NSObject *v0;
  void *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  XAMLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    XAMAutomationModeStateFilePath_cold_1();

  if (!AllowEnvOverrides())
    goto LABEL_8;
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AutomationModeStateFilePath_Override"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    XAMLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "environment");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AutomationModeStateFilePath_Override"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v7;
      _os_log_impl(&dword_22D1E0000, v4, OS_LOG_TYPE_DEFAULT, "Allowing override for XAMAutomationModeStateFilePath: %{public}@", (uint8_t *)&v13, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "environment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AutomationModeStateFilePath_Override"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_8:
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("/var/db/com.apple.dt.automationmode/automation-enabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

id XAMAutomationModeDoesNotRequireAuthenticationFilePath()
{
  NSObject *v0;
  void *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  XAMLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    XAMAutomationModeDoesNotRequireAuthenticationFilePath_cold_1();

  if (!AllowEnvOverrides())
    goto LABEL_8;
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AutomationModeDoesNotRequireAuthenticationFilePath_Override"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    XAMLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "environment");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AutomationModeDoesNotRequireAuthenticationFilePath_Override"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v7;
      _os_log_impl(&dword_22D1E0000, v4, OS_LOG_TYPE_DEFAULT, "Allowing override for XAMAutomationModeDoesNotRequireAuthenticationFilePath: %{public}@", (uint8_t *)&v13, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "environment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AutomationModeDoesNotRequireAuthenticationFilePath_Override"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_8:
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("/var/db/com.apple.dt.automationmode/no-auth-required"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

__CFString *XAMAutomationModeWriterMachServiceName()
{
  void *v0;
  void *v1;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!AllowEnvOverrides())
    return CFSTR("com.apple.dt.automationmode.writer");
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "environment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("AutomationModeWriterMachServiceName_Override"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return CFSTR("com.apple.dt.automationmode.writer");
  XAMLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "environment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AutomationModeWriterMachServiceName_Override"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v6;
    _os_log_impl(&dword_22D1E0000, v3, OS_LOG_TYPE_DEFAULT, "Allowing override for XAMAutomationModeWriterMachServiceName: %{public}@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AutomationModeWriterMachServiceName_Override"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (__CFString *)v9;
}

__CFString *XAMAutomationModeReaderMachServiceName()
{
  void *v0;
  void *v1;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!AllowEnvOverrides())
    return CFSTR("com.apple.dt.automationmode.reader");
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "environment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("AutomationModeReaderMachServiceName_Override"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return CFSTR("com.apple.dt.automationmode.reader");
  XAMLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "environment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AutomationModeReaderMachServiceName_Override"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v6;
    _os_log_impl(&dword_22D1E0000, v3, OS_LOG_TYPE_DEFAULT, "Allowing override for XAMAutomationModeReaderMachServiceName: %{public}@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AutomationModeReaderMachServiceName_Override"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (__CFString *)v9;
}

__CFString *XAMAutomationModeStateChangedNotificationName()
{
  void *v0;
  void *v1;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!AllowEnvOverrides())
    return CFSTR("com.apple.dt.automationmode.state-changed");
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "environment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("AutomationModeStateChangedNotification_Override"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return CFSTR("com.apple.dt.automationmode.state-changed");
  XAMLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "environment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AutomationModeStateChangedNotification_Override"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v6;
    _os_log_impl(&dword_22D1E0000, v3, OS_LOG_TYPE_DEFAULT, "Allowing override for XAMAutomationModeStateChangedNotificationName: %{public}@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AutomationModeStateChangedNotification_Override"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (__CFString *)v9;
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id XAMRegisterAutomationModeChangeHandler(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = a1;
  +[XAMObserver sharedInstance](XAMObserver, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerAutomationModeChangeHandlerOnQueue:withBlock:", v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void XAMUnregisterAutomationModeChangeHandler(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  +[XAMObserver sharedInstance](XAMObserver, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unregisterAutomationModeChangeHandler:", v1);

}

uint64_t XAMIsAutomationModeEnabled()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  +[XAMObserver sharedInstance](XAMObserver, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isAutomationModeEnabled");

  XAMLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = v1;
    _os_log_impl(&dword_22D1E0000, v2, OS_LOG_TYPE_DEFAULT, "Returning %d for enabled state", (uint8_t *)v4, 8u);
  }

  return v1;
}

uint64_t XAMAutomationModeRequiresAuthentication()
{
  void *v0;
  uint64_t v1;

  +[XAMObserver sharedInstance](XAMObserver, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "automationModeRequiresAuthentication");

  return v1;
}

void XAMResetSharedObserver()
{
  +[XAMObserver resetSharedObserver]();
}

void sub_22D1E37CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22D1E3AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D1E3C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22D1E43CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void XAMAutomationModeDataVaultPath_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "environment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_22D1E0000, v2, v3, "XAMAutomationModeDataVaultPath: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

void AllowEnvOverrides_cold_1(char a1, NSObject *a2)
{
  const char *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = "false";
  if ((a1 & 1) != 0)
    v2 = "true";
  v3 = 136446210;
  v4 = v2;
  _os_log_debug_impl(&dword_22D1E0000, a2, OS_LOG_TYPE_DEBUG, "os_variant_allows_internal_security_policies: %{public}s", (uint8_t *)&v3, 0xCu);
}

void XAMAutomationModeStateFilePath_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "environment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_22D1E0000, v2, v3, "XAMAutomationModeStateFilePath: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

void XAMAutomationModeDoesNotRequireAuthenticationFilePath_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "environment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_22D1E0000, v2, v3, "XAMAutomationModeDoesNotRequireAuthenticationFilePath: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x24BDAF4B0]();
}

