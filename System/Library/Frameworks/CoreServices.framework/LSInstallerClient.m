@implementation LSInstallerClient

void __51___LSInstallerClient_makeServerInstallerConnection__block_invoke()
{
  NSObject *v0;

  _LSDefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __51___LSInstallerClient_makeServerInstallerConnection__block_invoke_cold_1();

}

void __51___LSInstallerClient_makeServerInstallerConnection__block_invoke_2()
{
  NSObject *v0;

  _LSDefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __51___LSInstallerClient_makeServerInstallerConnection__block_invoke_2_cold_1();

}

void __53___LSInstallerClient_syncServerInstallerProxyForShim__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _LSInstallLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __53___LSInstallerClient_syncServerInstallerProxyForShim__block_invoke_cold_1((uint64_t)v2, v3);

}

void __51___LSInstallerClient_makeServerInstallerConnection__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_4(&dword_182882000, v0, v1, "Connection interrupted to installationCallbackInterface", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

void __51___LSInstallerClient_makeServerInstallerConnection__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_4(&dword_182882000, v0, v1, "Connection invalidated to installationCallbackInterface", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

void __53___LSInstallerClient_syncServerInstallerProxyForShim__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "error on sync server connection for install shimming: %@", (uint8_t *)&v2, 0xCu);
}

@end
