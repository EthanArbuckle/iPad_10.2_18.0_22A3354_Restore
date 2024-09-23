@implementation BRCLocalItem(LegacyAdditions)

- (void)updateLocationAndMetaFromFSAtPath:()LegacyAdditions parentGlobalID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Unable to refresh xattrs from FS due to error (%@).%@");
  OUTLINED_FUNCTION_2();
}

- (void)updateLocationAndMetaFromFSAtPath:()LegacyAdditions parentGlobalID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Preventing parent zone change on non top-level item%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateFromFSAtPath:()LegacyAdditions parentGlobalID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_9_0();
  v3 = v2;
  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v2, "diffAgainstOriginalItem");
  BRCItemFieldsPrettyPrint();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412802;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = v1;
  _os_log_debug_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] updated item from FS: %@\ndiffs:(%@)%@", (uint8_t *)&v5, 0x20u);

}

- (void)updateFromFSAtPath:()LegacyAdditions parentGlobalID:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Failed to load xattrs from disk but continuing anyway (%@).%@");
  OUTLINED_FUNCTION_2();
}

+ (void)newItemWithPath:()LegacyAdditions parentGlobalID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  id v2;
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_9_0();
  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = objc_msgSend(v2, "type");
  v4 = 2112;
  v5 = v1;
  _os_log_fault_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: creating an item from a non supported path 0x%x%@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_3_0();
}

- (void)_initWithRelativePath:()LegacyAdditions parentGlobalID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Unable to pursue update from FS due to error (%@).%@");
  OUTLINED_FUNCTION_2();
}

- (void)_initWithRelativePath:()LegacyAdditions parentGlobalID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _appLibrary%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_initWithRelativePath:()LegacyAdditions parentGlobalID:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  uint64_t v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  v2 = 138412546;
  v3 = v0;
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_1CBD43000, v1, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Can't find client zone for %@%@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_initWithRelativePath:()LegacyAdditions parentGlobalID:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Not good... We have 2 of the same item on disk.  Duplicating locally%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_initWithRelativePath:()LegacyAdditions parentGlobalID:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Found share alias pointing to %@%@", (_QWORD)v3, DWORD2(v3));
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
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Item is marked needs-reading, so it must have changed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)changedAtRelativePath:()LegacyAdditions scanPackage:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] unknown fileID/generationID on %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)changedAtRelativePath:()LegacyAdditions scanPackage:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] path not on disk at %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)changedAtRelativePath:()LegacyAdditions scanPackage:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !scanPackage || !readOnlyDB%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)markReserved
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] reserved %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)fixupStagedItemAtStartup
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] item is no longer in stage %@%@");
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
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: can't mark live from stage%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_computedUserVisibleStatusAtPath:()LegacyAdditions .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] item %@ is missing a doc id%@");
  OUTLINED_FUNCTION_2();
}

- (void)_updatePropagatedInfoFromFSAtPath:()LegacyAdditions .cold.1()
{
  NSObject *v0;
  int *v1;
  uint8_t v2[24];
  uint64_t v3;

  OUTLINED_FUNCTION_9_0();
  v3 = *MEMORY[0x1E0C80C00];
  strerror(*v1);
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_1CBD43000, v0, (os_log_type_t)0x90u, "[ERROR] Failed to chmod the file - %s%@", v2, 0x16u);
  OUTLINED_FUNCTION_3_0();
}

- (void)_updatePropagatedInfoFromFSAtPath:()LegacyAdditions .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Item changed read-onlyness.  Updaing the path with the new mode%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_updatePropagatedInfoFromFSAtPath:()LegacyAdditions .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: (_sharingOptions & BRCSharingItemHasShareID) == 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)applyMetadataOnFileID:()LegacyAdditions liveFD:sharingOptions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: fileID != 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)bounceReservedItemWithBounceNumber:()LegacyAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.isReserved%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)bounceSourceItemWithServerLogicalName:()LegacyAdditions bounceNumber:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: bounceNumber && serverLogicalName%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)clearFromStage
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _st.stagedFileID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
