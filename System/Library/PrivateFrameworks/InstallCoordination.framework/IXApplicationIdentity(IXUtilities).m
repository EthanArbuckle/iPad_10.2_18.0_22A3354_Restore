@implementation IXApplicationIdentity(IXUtilities)

- (void)resolvePersonaUsingModuleSpecificLogicWithError:()IXUtilities .cold.1()
{
  os_log_t v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(&dword_1A4BF6000, v0, OS_LOG_TYPE_ERROR, "%s: Failed to retrieve application record for bundleID: %@ : %@", (uint8_t *)v1, 0x20u);
}

- (void)resolvePersonaUsingModuleSpecificLogicWithError:()IXUtilities .cold.2()
{
  os_log_t v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_3();
  _os_log_debug_impl(&dword_1A4BF6000, v0, OS_LOG_TYPE_DEBUG, "%s: Resolved persona %@ for bundleID %@", (uint8_t *)v1, 0x20u);
}

@end
