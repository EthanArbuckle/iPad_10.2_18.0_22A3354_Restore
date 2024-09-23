@implementation BRCAccountSession(LegacyAdditions)

- (BRCFSReader)fsReader
{
  return self->_fsReader;
}

- (BRCFSWriter)fsWriter
{
  return self->_fsWriter;
}

- (void)computeDocumentEvictableSizesForLowTime:()LegacyAdditions medTime:highTime:lowSize:medSize:highSize:minRowID:minSize:batchSize:injection:db:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: lowTime <= medTime <= highTime%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fsEventsMonitorForSyncedFolderType:()LegacyAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: dictionary%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)hasFSEventsMonitorForSyncedFolderType:()LegacyAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _fsEventsMonitors%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setFSEventsMonitor:()LegacyAdditions forSyncedFolderType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !dictionary[@(folderType)]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)removeFSEventsMonitorForSyncedFolderType:()LegacyAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: dictionary[@(folderType)]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)createRootForSyncedFolderType:()LegacyAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: ![self hasRootForSyncedFolderType:folderType]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)hasRootForSyncedFolderType:()LegacyAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _rootsByFolderType%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)applySyncPolicy:()LegacyAdditions forSyncedFolderType:isInitialCreation:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Cannot disable sync for BRCSyncedFolderTypeDefault%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)applySyncPolicy:()LegacyAdditions forSyncedFolderType:isInitialCreation:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: syncPolicy == BRCSyncedFolderPolicyEnabled || syncPolicy == BRCSyncedFolderPolicyDisabled%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)enableSyncforSyncedFolderType:()LegacyAdditions isInitialCreation:error:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1CBD43000, v0, (os_log_type_t)0x90u, "[ERROR] Unable to add an FSEvents Monitor on '%@'%@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)enableSyncforSyncedFolderType:()LegacyAdditions isInitialCreation:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Bad folder type%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_recreateSymlinkIfNecessaryForDocumentsPath:()LegacyAdditions folderName:destinationPath:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, (uint64_t)v0, "[DEBUG] Made symlink live for %@%@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)availableDiskSpaceUsingCache:()LegacyAdditions schedulingPendingDiskItemsIfNeeded:.cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a4, a3, "[DEBUG] detected %@ of free space, scheduling pending-disk downloads%@", (uint8_t *)a3);

}

@end
