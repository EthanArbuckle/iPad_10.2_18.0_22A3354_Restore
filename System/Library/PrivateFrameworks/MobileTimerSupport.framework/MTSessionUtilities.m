@implementation MTSessionUtilities

+ (void)logInfo:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = a1;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1B8D7F000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ INFO: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

+ (void)logError:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  MTLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    +[MTSessionUtilities logError:].cold.1();

}

+ (void)logDebug:(id)a3
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;

  v3 = a3;
  MTLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    MTLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      +[MTSessionUtilities logDebug:].cold.1();

  }
}

+ (BOOL)mtSBUIIsSystemApertureEnabled
{
  return objc_msgSend(MEMORY[0x1E0D4FAB8], "mtSBUIIsSystemApertureEnabled");
}

+ (void)logError:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1B8D7F000, v0, OS_LOG_TYPE_ERROR, "%{public}@ ERROR: %{public}@", v1, 0x16u);
}

+ (void)logDebug:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1B8D7F000, v0, OS_LOG_TYPE_DEBUG, "%{public}@ DEBUG: %{public}@", v1, 0x16u);
}

@end
