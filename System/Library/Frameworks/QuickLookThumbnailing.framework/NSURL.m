@implementation NSURL

uint64_t __37__NSURL__QLUtilities___QLUrlFileSize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a2;
  v5 = a3;
  _log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __37__NSURL__QLUtilities___QLUrlFileSize__block_invoke_cold_1();

  return 1;
}

void __37__NSURL__QLUtilities___QLUrlFileSize__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v0, v1, "Failed to enumerate the url(%@) error: %@");
  OUTLINED_FUNCTION_2();
}

@end
