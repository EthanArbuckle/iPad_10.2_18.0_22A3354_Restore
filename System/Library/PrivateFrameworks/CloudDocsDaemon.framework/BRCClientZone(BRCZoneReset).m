@implementation BRCClientZone(BRCZoneReset)

- (void)_reset:()BRCZoneReset completionHandler:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_9_0();
  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "mangledID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_DEBUG, "[NOTIF] Can't reset %@ because its deactivated%@", v3, 0x16u);

  OUTLINED_FUNCTION_6();
}

- (void)_reset:()BRCZoneReset completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: not implemented%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_deleteRelevantPackageItemsWithDB:()BRCZoneReset error:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "lastError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_1CBD43000, v0, v3, "[ERROR] failed pruning client_pkg_items: %@%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)_performHardResetOnClientItemsAndWantsUnlink:()BRCZoneReset db:error:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "lastError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_1CBD43000, v0, v3, "[ERROR] failed pruning client_document_access: %@%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)_performHardResetOnClientItemsAndWantsUnlink:()BRCZoneReset db:error:.cold.2()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "lastError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_1CBD43000, v0, v3, "[ERROR] failed pruning client_items: %@%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)_performResetAndWantsUnlink:()BRCZoneReset clientTruthBlock:completionBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.isSharedZone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_performAfterResetServerAndClientPrivateTruthsAndUnlinkData:()BRCZoneReset .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┣%llx requesting coordinated deletions%@");
  OUTLINED_FUNCTION_2();
}

- (void)_cancelAllOperationsForReset
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] cancelling sync up operation %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

@end
