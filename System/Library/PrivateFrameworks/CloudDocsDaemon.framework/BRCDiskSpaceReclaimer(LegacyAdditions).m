@implementation BRCDiskSpaceReclaimer(LegacyAdditions)

- (void)_requestPurgeSpace
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1CBD43000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Already have an outstanding purge request%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
