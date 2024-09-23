@implementation BRCAliasItem(LegacyAdditions)

- (void)changedAtRelativePath:()LegacyAdditions scanPackage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] item matches disk%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)changedAtRelativePath:()LegacyAdditions scanPackage:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] item isn't an alias anymore%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)learnTarget:()LegacyAdditions .cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  _os_log_fault_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: self.appLibrary != item.appLibrary || item.isSharedToMe%@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)updateOnDiskWithAliasTarget:()LegacyAdditions forServerEdit:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Kept the path of the newest alias for oldest item, updating fileID and mark lost%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateOnDiskWithAliasTarget:()LegacyAdditions forServerEdit:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] clash path doesn't seem to exist anymore, mark the item lost%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
