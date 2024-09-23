@implementation BRCPackageItem(DatabaseMethods)

- (void)saveToDBWithSession:()DatabaseMethods .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] saved item %@ to DB%@");
  OUTLINED_FUNCTION_2();
}

- (void)saveToDBWithSession:()DatabaseMethods .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: saving package items should really always work%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)saveToDBWithSession:()DatabaseMethods .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: doInsert != nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)saveToDBWithSession:()DatabaseMethods .cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: should never attempt to save tombstones to db%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
