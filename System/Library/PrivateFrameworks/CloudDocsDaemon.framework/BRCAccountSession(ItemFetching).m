@implementation BRCAccountSession(ItemFetching)

- (void)newLocalItemFromPQLResultSet:()ItemFetching db:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_14_0(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: unknown item type %d%@");
  OUTLINED_FUNCTION_2();
}

- (void)itemByFileObjectID:()ItemFetching db:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Can't compute a BRCLocalItem for a nil BRFileObjectID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)itemByFileObjectID:()ItemFetching db:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_14_0(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Unrecognized item type %d%@");
  OUTLINED_FUNCTION_2();
}

- (void)itemByFileObjectID:()ItemFetching db:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: fileobjectID has an invalid type%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)itemByFileObjectID:()ItemFetching db:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: There is no local item for BRFileObjectIDTypeRootContainer%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)itemByFileObjectID:()ItemFetching db:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: appLibrary.includesDataScope%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)serverAliasItemForSharedItem:()ItemFetching inZone:db:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: item.serverZone.isSharedZone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)enumerateContainersWithDB:()ItemFetching handler:.cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134218242;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_1CBD43000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx enumerating containers%@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2();
}

@end
