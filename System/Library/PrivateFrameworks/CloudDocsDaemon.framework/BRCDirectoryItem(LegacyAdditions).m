@implementation BRCDirectoryItem(LegacyAdditions)

- (void)updateFromFSAtPath:()LegacyAdditions parentGlobalID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: there is still a fsroot item!%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateFromFSAtPath:()LegacyAdditions parentGlobalID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: appLibrary.isiCloudDesktopAppLibrary%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_markLostDirectoryAsAlmostDead
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.isLost%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)markRemovedFromFilesystemForServerEdit:()LegacyAdditions .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[12];
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 16), "changeState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptionWithContext:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  v9 = 2112;
  v10 = a2;
  _os_log_debug_impl(&dword_1CBD43000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Setting deletion change token to %@ because item contains a dir faults%@", v8, 0x16u);

}

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
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] item isn't a directory anymore%@", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] item matches disk%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)startDownloadInTask:()LegacyAdditions options:etagIfLoser:stageFileName:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: a task tracker is required to download a directory%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)startDownloadInTask:()LegacyAdditions options:etagIfLoser:stageFileName:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !stageFileName%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
