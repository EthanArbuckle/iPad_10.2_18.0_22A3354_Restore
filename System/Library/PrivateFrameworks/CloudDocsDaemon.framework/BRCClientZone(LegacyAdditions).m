@implementation BRCClientZone(LegacyAdditions)

- (void)_removeItemFromCZMProcessingIfNotAssociated:()LegacyAdditions .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Item finished CZM procesing and now is done %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_removeItemAndProcessForCrossZoneMove:()LegacyAdditions .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Not processing item which is already almost dead %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_startDownloadingItemForCrossZoneMoveIfNecessary:()LegacyAdditions .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Sync: Starting downloading all children under %@ due to changing shares%@");
  OUTLINED_FUNCTION_2();
}

- (void)_startDownloadingItemForCrossZoneMoveIfNecessary:()LegacyAdditions .cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Sync: Starting downloading %@ due to changing shares%@");
  OUTLINED_FUNCTION_2();
}

- (void)_startDownloadingItemForCrossZoneMoveIfNecessary:()LegacyAdditions .cold.3(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138412546;
  v4 = v1;
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1CBD43000, v2, (os_log_type_t)0x90u, "[ERROR] Failed starting download for CZM - %@%@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)itemCrossZoneMoved:()LegacyAdditions withLookup:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: [item.clientZone isEqualToClientZone:self]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)itemCrossZoneMoved:()LegacyAdditions withLookup:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: parentItemID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)reservedItemByParentID:()LegacyAdditions andLogicalName:db:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !_CFURLIsPromiseName((__bridge CFStringRef)name)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)faultByParentID:()LegacyAdditions andPhysicalName:db:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _CFURLIsPromiseName((__bridge CFStringRef)name)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
