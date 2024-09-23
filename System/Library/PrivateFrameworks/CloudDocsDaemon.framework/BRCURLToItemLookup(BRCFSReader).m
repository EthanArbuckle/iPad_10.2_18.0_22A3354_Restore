@implementation BRCURLToItemLookup(BRCFSReader)

- (void)markPathMatchLostIfLocationDoesntMatch:()BRCFSReader .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] The item path doesn't exist%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)handleReservedPathMatchesIfNeeded
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Suspending apply of shared item until we complete initial scan %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)matchLookupItemsWithDisk
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Considering the live item%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
