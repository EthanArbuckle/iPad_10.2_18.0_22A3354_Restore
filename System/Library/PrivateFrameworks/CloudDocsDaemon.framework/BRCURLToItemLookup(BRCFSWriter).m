@implementation BRCURLToItemLookup(BRCFSWriter)

- (void)_pathMatchInNamespace:()BRCFSWriter .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] API MISUSE: unknown namespace%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_moveMissingItemAsideInNamespace:()BRCFSWriter .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] moving aside missing item %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_moveMissingItemAsideInNamespace:()BRCFSWriter .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] API MISUSE: never move a reserved item aside%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_removeDirectory:()BRCFSWriter atPath:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: the dirpath is already open, so -openDirectoryForScan should work%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_removeDirectory:()BRCFSWriter atPath:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !dirpath.isDocument%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_removeDirectory:()BRCFSWriter atPath:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: dirpath.exists%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_removeDirectory:()BRCFSWriter atPath:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: dir.isDirectory%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_canUpdatePathMatch:()BRCFSWriter hasAdditionsToApply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: we shouldn't have asked coordination in the first place%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_canUpdatePathMatch:()BRCFSWriter hasAdditionsToApply:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Item has no desired version set: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_canUpdatePathMatch:()BRCFSWriter hasAdditionsToApply:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: li.isDocument && !li.isReserved%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_canUpdatePathMatch:()BRCFSWriter hasAdditionsToApply:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Stage tampering - item %@ is no longer staged%@");
  OUTLINED_FUNCTION_2();
}

- (void)_canUpdatePathMatch:()BRCFSWriter hasAdditionsToApply:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Item %@ staged fileID hasn't been flushed yet%@");
  OUTLINED_FUNCTION_2();
}

- (void)_canUpdatePathMatch:()BRCFSWriter hasAdditionsToApply:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Item isn't idle%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)tryToUpdateItemInNamespace:()BRCFSWriter withDstLookup:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_10(v0, v1, v2, 4.8151e-34);
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v5, v3, "[DEBUG] server item is dead, nothing to do for namespace '%s'%@", v4);
}

- (void)tryToUpdateItemInNamespace:()BRCFSWriter withDstLookup:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Item changed during apply to upload a readonly edit which is now readwrite%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)tryToUpdateItemInNamespace:()BRCFSWriter withDstLookup:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Item updated successfully: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)tryToUpdateItemInNamespace:()BRCFSWriter withDstLookup:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] updated %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)tryToUpdateItemInNamespace:()BRCFSWriter withDstLookup:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Failed to move item to the genstore for readonly edit %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)tryToUpdateItemInNamespace:()BRCFSWriter withDstLookup:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] inode doesn't match upload error inode so this must simply be a remote edit being applied%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)tryToUpdateItemInNamespace:()BRCFSWriter withDstLookup:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: [li diffAgainstOriginalItem] == 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)tryToUpdateItemInNamespace:()BRCFSWriter withDstLookup:.cold.8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_10(v0, v1, v2, 4.8151e-34);
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v5, v3, "[DEBUG] can't update path match in namespace '%s'%@", v4);
}

- (void)tryToUpdateItemInNamespace:()BRCFSWriter withDstLookup:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Cannot update pending-rename item because we don't hold coordination at the destination%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)tryToUpdateItemInNamespace:()BRCFSWriter withDstLookup:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Learning that server bounced the item in the same way we did%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)tryToUpdateItemInNamespace:()BRCFSWriter withDstLookup:.cold.11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_10(v0, v1, v2, 4.8151e-34);
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v5, v3, "[DEBUG] nothing to do for namespace '%s'%@", v4);
}

- (void)tryToUpdateItemInNamespace:()BRCFSWriter withDstLookup:.cold.12()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Only applying metadata diffs on %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)tryToUpdateItemInNamespace:()BRCFSWriter withDstLookup:.cold.13()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Only applying content diffs on %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)trashItemIfNecessary:()BRCFSWriter atURL:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Can't find root item for %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)trashItemIfNecessary:()BRCFSWriter atURL:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Found existing folder which already has trash bookmark set%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)tryToDeleteItemInNamespace:()BRCFSWriter .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] deleted %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)tryToDeleteItemInNamespace:()BRCFSWriter .cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Trashed item which has diffs to upload %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_appliedOrDownloadContentIfNecessary:()BRCFSWriter si:applySchedulerState:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: We don't have anything to download for %@, why do we need to apply still?%@");
  OUTLINED_FUNCTION_2();
}

- (void)_appliedOrDownloadContentIfNecessary:()BRCFSWriter si:applySchedulerState:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: We should have applied the content if the staged fileID was flushed for %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_appliedOrDownloadContentIfNecessary:()BRCFSWriter si:applySchedulerState:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: desired version should have been marked live earlier (markLiveAsFault)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)didApplyChangesAtPath:()BRCFSWriter filename:li:si:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Inserting a tombstone for the alias of %@ if necessary%@");
  OUTLINED_FUNCTION_2();
}

- (void)didApplyChangesAtPath:()BRCFSWriter filename:li:si:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] forcing sending update notification because we updated an addition%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)didApplyChangesAtPath:()BRCFSWriter filename:li:si:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !contentApplied%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)didApplyChangesAtPath:()BRCFSWriter filename:li:si:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] content not applied%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)didApplyChangesAtPath:()BRCFSWriter filename:li:si:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !losersApplied%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)didApplyChangesAtPath:()BRCFSWriter filename:li:si:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] losers are not applied%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)didApplyChangesAtPath:()BRCFSWriter filename:li:si:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !thumbnailApplied%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)didApplyChangesAtPath:()BRCFSWriter filename:li:si:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] thumbnail is not applied%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)didApplyChangesAtPath:()BRCFSWriter filename:li:si:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: desiredVersion.wantsContent || desiredVersion.wantsThumbnail%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
