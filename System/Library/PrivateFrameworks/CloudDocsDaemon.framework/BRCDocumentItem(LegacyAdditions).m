@implementation BRCDocumentItem(LegacyAdditions)

- (void)_initFromPQLResultSet:()LegacyAdditions session:db:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: %@ isn't a dictionary!%@");
  OUTLINED_FUNCTION_2();
}

- (void)learnItemID:()LegacyAdditions serverItem:path:markLost:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Marking %@ as edited since shared because we're learning the item id of an item that is%@");
  OUTLINED_FUNCTION_2();
}

- (void)updateLocationAndMetaFromFSAtPath:()LegacyAdditions parentGlobalID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] %@ is not a fault anymore, clearing the version%@");
  OUTLINED_FUNCTION_2();
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
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _st.documentID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)changedAtRelativePath:()LegacyAdditions scanPackage:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] item isn't a document anymore anymore%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)evictInTask:()LegacyAdditions options:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] nothing to do: already a fault%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)evictInTask:()LegacyAdditions options:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] %@ isn't evictable because has ubiquity clients connected%@");
  OUTLINED_FUNCTION_2();
}

- (void)evictInTask:()LegacyAdditions options:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] not evictable because it's locked%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)evictInTask:()LegacyAdditions options:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] not evicted because the item has a file presenter%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)evictInTask:()LegacyAdditions options:error:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: item %@ have an empty file id!%@");
  OUTLINED_FUNCTION_2();
}

- (void)evictInTask:()LegacyAdditions options:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] items not on disk are not evictable!%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)evictInTask:()LegacyAdditions options:error:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] nothing to do: eviction is already scheduled%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)markLiveFromStageWithPath:()LegacyAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: we're making a file live without a version%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)markLiveFromStageWithPath:()LegacyAdditions .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.isFault == _desiredVersion.isFault%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)markLiveFromStageWithPath:()LegacyAdditions .cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Marking %@ as edited since shared because the desired version differs in edit mask%@");
  OUTLINED_FUNCTION_2();
}

- (void)stageFaultForCreation:()LegacyAdditions name:size:isPackage:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(&dword_1CBD43000, v0, (os_log_type_t)0x90u, "[ERROR] name is nil%@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)stageFaultForCreation:()LegacyAdditions name:size:isPackage:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Unable to stage fault: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)updateDesiredVersionWithServerItem:()LegacyAdditions diffs:options:needsSave:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: No version on server item%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateDesiredVersionWithServerItem:()LegacyAdditions diffs:options:needsSave:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] No version to stage for %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)updateDesiredVersionWithServerItem:()LegacyAdditions diffs:options:needsSave:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: state != BRCJobStateSuspendApplyForDownload || (options & BRCDesiredVersionWantsContent)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateDesiredVersionWithServerItem:()LegacyAdditions diffs:options:needsSave:.cold.4(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_8_4(a1);
  OUTLINED_FUNCTION_7_1((uint64_t)v1, 5.778e-34);
  OUTLINED_FUNCTION_6_2(&dword_1CBD43000, v2, v3, "[DEBUG] Learn sharing and owner from server record for diffs: %@%@");

  OUTLINED_FUNCTION_11_1();
}

- (void)updateDesiredVersionWithServerItem:()LegacyAdditions diffs:options:needsSave:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Updating filename from server item because it matches the bounced name%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateDesiredVersionWithServerItem:()LegacyAdditions diffs:options:needsSave:.cold.6(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_8_4(a1);
  OUTLINED_FUNCTION_7_1((uint64_t)v1, 5.778e-34);
  OUTLINED_FUNCTION_6_2(&dword_1CBD43000, v2, v3, "[DEBUG] Version to make live has only metadata changes with current version: %@%@");

  OUTLINED_FUNCTION_11_1();
}

- (void)updateDesiredVersionWithServerItem:()LegacyAdditions diffs:options:needsSave:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Proceeding with apply changes for staged version to make live%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateDesiredVersionWithServerItem:()LegacyAdditions diffs:options:needsSave:.cold.8(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_8_4(a1);
  OUTLINED_FUNCTION_7_1((uint64_t)v1, 5.778e-34);
  OUTLINED_FUNCTION_6_2(&dword_1CBD43000, v2, v3, "[DEBUG] Version to make live has only metadata changes with previous one to make live: %@%@");

  OUTLINED_FUNCTION_11_1();
}

- (void)updateDesiredVersionWithServerItem:()LegacyAdditions diffs:options:needsSave:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Proceeding with apply changes since reserved items don't need to flush%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateDesiredVersionWithServerItem:()LegacyAdditions diffs:options:needsSave:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: options & BRCDesiredVersionWantsThumbnail%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateDesiredVersionWithServerItem:()LegacyAdditions diffs:options:needsSave:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !isSyncPaused || ((options & BRCDesiredVersionWantsContent) && !self.isFault)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateDesiredVersionWithServerItem:()LegacyAdditions diffs:options:needsSave:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] downloading the content because the latest version is small%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateDesiredVersionWithServerItem:()LegacyAdditions diffs:options:needsSave:.cold.14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: options%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)clearDesiredVersion
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] clearing desired version%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)autoResumeSyncPausedDocumentsOnTimeoutWithSession:()LegacyAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Auto resume paused sync documents%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
