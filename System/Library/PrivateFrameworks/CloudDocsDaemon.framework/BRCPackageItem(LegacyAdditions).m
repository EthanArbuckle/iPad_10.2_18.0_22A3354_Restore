@implementation BRCPackageItem(LegacyAdditions)

+ (void)_rescanDirectoryInPackage:()LegacyAdditions error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ignoring excluded package item at %@%@");
  OUTLINED_FUNCTION_2();
}

+ (void)_rescanDirectoryInPackage:()LegacyAdditions error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] failed opening %@%@");
  OUTLINED_FUNCTION_2();
}

+ (void)_rescanDirectoryInPackage:()LegacyAdditions error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] updating package snapshot at %@%@");
  OUTLINED_FUNCTION_2();
}

+ (void)_rescanDirectoryInPackage:()LegacyAdditions error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: relpath.isPackageRoot || relpath.isInPackage%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)updateSnapshotAtPath:()LegacyAdditions error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: relpath.isDocument%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)changedAtRelpath:()LegacyAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: invalid type%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)changedAtRelpath:()LegacyAdditions .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: no BRCPackageItem should be a Tombstone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)packageChangedAtRelativePath:()LegacyAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: relpathInPackage.isInPackage%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)packageChangedAtRelativePath:()LegacyAdditions .cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  _os_log_debug_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] package snapshot matches%@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

+ (void)packageChangedAtRelativePath:()LegacyAdditions .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: relpath.isInPackage || relpath.isPackageRoot%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
