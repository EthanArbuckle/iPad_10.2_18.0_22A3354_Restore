@implementation BRCXPCRegularIPCsClient(LegacyAdditions)

- (void)createSharingInfoForURL:()LegacyAdditions reply:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Creating share for URL %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)copyBulkShareIDsAtURLs:()LegacyAdditions reply:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Bulk copying shareIDs at urls %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_listBatchedFilesIngested:()LegacyAdditions batchSize:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: [fileIDs count] <= batchSize%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)waitForFileSystemChangeProcessingWithReply:()LegacyAdditions .cold.1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] ┣%llx waiting for the lost scan%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)waitForFileSystemChangeProcessingWithReply:()LegacyAdditions .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] wait for the lost scan%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)waitForFileSystemChangeProcessingWithReply:()LegacyAdditions .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] wait for fsevents%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)resolveFileObjectIDToURL:()LegacyAdditions reply:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] fileObjectID: %@%@");
  OUTLINED_FUNCTION_2();
}

@end
