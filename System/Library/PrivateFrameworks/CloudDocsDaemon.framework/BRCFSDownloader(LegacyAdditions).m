@implementation BRCFSDownloader(LegacyAdditions)

- (void)applyLosersToItem:()LegacyAdditions serverItem:atURL:applySchedulerState:addedLosers:removedLosers:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_3();
  v3 = v0;
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v1, (uint64_t)v1, "[DEBUG] live losers: %@%@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)applyLosersToItem:()LegacyAdditions serverItem:atURL:applySchedulerState:addedLosers:removedLosers:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: removedLosers%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)applyLosersToItem:()LegacyAdditions serverItem:atURL:applySchedulerState:addedLosers:removedLosers:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: addedLosers%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_sendThumbnailsBatch:()LegacyAdditions sizeHint:maxRecordsCount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: ![[BRCAccountsManager sharedManager] isInSyncBubble]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)scheduleThumbnailDownloadForItem:()LegacyAdditions serverItem:applySchedulerState:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  _os_log_debug_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] no thumbnail, cancelling thumbnail download%@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
