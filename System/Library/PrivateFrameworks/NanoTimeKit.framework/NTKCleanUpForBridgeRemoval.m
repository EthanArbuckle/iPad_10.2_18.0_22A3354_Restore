@implementation NTKCleanUpForBridgeRemoval

uint64_t __NTKCleanUpForBridgeRemoval_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __NTKCleanUpForBridgeRemoval_block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  return 1;
}

void __NTKCleanUpForBridgeRemoval_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "error enumerating mapped image cache: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
