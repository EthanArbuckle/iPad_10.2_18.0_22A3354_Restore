@implementation IXDisplayUserPresentableErrorForAppsWithIdentitites

void __IXDisplayUserPresentableErrorForAppsWithIdentitites_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __IXDisplayUserPresentableErrorForAppsWithIdentitites_block_invoke_cold_1();

}

void __IXDisplayUserPresentableErrorForAppsWithIdentitites_block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_4(&dword_1A4BF6000, v0, v1, "%s: Failed to contact installcoordinationd to present error %lu : %@", v2);
  OUTLINED_FUNCTION_10();
}

@end
