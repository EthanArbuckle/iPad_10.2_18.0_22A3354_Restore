@implementation BRCAppLibrary(LegacyAdditions)

- (NSNumber)deepScanStamp
{
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  return self->_deepScanStamp;
}

- (void)markChildrenLostForItemID:()LegacyAdditions inZone:fileID:startingFromRow:hasMoreWork:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Shared zone root item %@ should not exist in client truth%@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)markChildrenLostForItemID:()LegacyAdditions inZone:fileID:startingFromRow:hasMoreWork:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: zone.dbRowID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)cancelFileCoordinators
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] cancelling file coordination requests %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)coordinatorForItem:()LegacyAdditions forRead:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] There's already a pending coordinated I/O for %@, not really scheduling it%@");
  OUTLINED_FUNCTION_2();
}

- (void)fsrootDidMoveToPath:()LegacyAdditions .cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_9_0();
  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "appLibraryID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: app library fs root was removed%@", v3, 0x16u);

  OUTLINED_FUNCTION_6();
}

- (void)fsrootDidMoveToPath:()LegacyAdditions .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.isiCloudDesktopAppLibrary%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)didFindLostItem:()LegacyAdditions oldAppLibrary:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  _os_log_debug_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Lost directory with dead children found, kick syncUp%@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)didFindLostItem:()LegacyAdditions oldAppLibrary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: oldAppLibrary.state & BRCAppLibraryStateNeedsLost%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)aliasByUnsaltedBookmarkData:()LegacyAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: unsaltedBookmarkData%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)removeClientUsingUbiquity:()LegacyAdditions .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Last ubiquity client exited, no longer greedy (container: %@)%@");
  OUTLINED_FUNCTION_2();
}

@end
