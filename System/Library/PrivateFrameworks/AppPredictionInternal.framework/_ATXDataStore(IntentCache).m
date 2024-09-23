@implementation _ATXDataStore(IntentCache)

- (void)writeValidParameterCombinationsWithSchema:()IntentCache cacheKey:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_ERROR, "NSKeyedArchiver failed to archive parameterCombinationsWithSchema", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)validParameterCombinationsWithSchemaForCacheKey:()IntentCache .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "NSKeyedUnarchiver failed to unarchive parameterCombinationsWithSchema %@", (uint8_t *)&v2, 0xCu);
}

@end
