@implementation IKPreference

+ (BOOL)ignoreHTTPCache
{
  if (ignoreHTTPCache_onceToken != -1)
    dispatch_once(&ignoreHTTPCache_onceToken, &__block_literal_global_17);
  return ignoreHTTPCache_sIgnoreHTTPCache;
}

void __31__IKPreference_ignoreHTTPCache__block_invoke()
{
  int AppBooleanValue;
  void *v1;
  __SecTask *v2;
  void *v3;
  char v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("IgnoreHTTPCache"), CFSTR("com.apple.ITMLKit"), 0);
  ignoreHTTPCache_sIgnoreHTTPCache = AppBooleanValue != 0;
  if (!AppBooleanValue)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    ignoreHTTPCache_sIgnoreHTTPCache = objc_msgSend(v1, "BOOLForKey:", CFSTR("IgnoreLocalHTTPCache"));

    if (!ignoreHTTPCache_sIgnoreHTTPCache)
    {
      v2 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
      v3 = (void *)SecTaskCopyValueForEntitlement(v2, CFSTR("get-task-allow"), 0);
      CFRelease(v2);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = objc_msgSend(v3, "BOOLValue");
      else
        v4 = 0;
      ignoreHTTPCache_sIgnoreHTTPCache = v4;

    }
  }
  ITMLKitGetLogObject(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __31__IKPreference_ignoreHTTPCache__block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);

}

+ (BOOL)logDocumentXML
{
  if (logDocumentXML_onceToken != -1)
    dispatch_once(&logDocumentXML_onceToken, &__block_literal_global_8);
  return logDocumentXML_sLogDocumentXML;
}

void __30__IKPreference_logDocumentXML__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  logDocumentXML_sLogDocumentXML = CFPreferencesGetAppBooleanValue(CFSTR("LogDocumentXML"), CFSTR("com.apple.ITMLKit"), 0) != 0;
  ITMLKitGetLogObject(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __30__IKPreference_logDocumentXML__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

+ (void)setupJSCoreConsoleLogging
{
  if (setupJSCoreConsoleLogging_onceToken != -1)
    dispatch_once(&setupJSCoreConsoleLogging_onceToken, &__block_literal_global_11);
}

uint64_t __41__IKPreference_setupJSCoreConsoleLogging__block_invoke()
{
  uint64_t result;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("LogJSConsole"), CFSTR("com.apple.ITMLKit"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    return JSRemoteInspectorSetLogToSystemConsole();
  return result;
}

void __31__IKPreference_ignoreHTTPCache__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D95F2000, a1, a3, "ITML: Setting [%d] for Ignore HTTP Cache", a5, a6, a7, a8, 0);
}

void __30__IKPreference_logDocumentXML__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D95F2000, a1, a3, "ITML: Setting [%d] for Logging document XML", a5, a6, a7, a8, 0);
}

@end
