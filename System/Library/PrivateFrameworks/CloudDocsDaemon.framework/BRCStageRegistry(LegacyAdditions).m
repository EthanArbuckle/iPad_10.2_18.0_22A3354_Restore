@implementation BRCStageRegistry(LegacyAdditions)

- (void)_watchLockedRelpath:()LegacyAdditions .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_15(&dword_1CBD43000, v0, v1, "[ERROR] could not open locked file, not watching it %{errno}d%@");
  OUTLINED_FUNCTION_2();
}

- (void)forgetWatchedLockedFileID:()LegacyAdditions .cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, (uint64_t)v0, "[DEBUG] forgetting locked file %@%@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)didFlushStagedFileID:()LegacyAdditions .cold.1()
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

- (void)applyMetadataOnFileDescriptor:()LegacyAdditions liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_15(&dword_1CBD43000, v0, v1, "[ERROR] fsetattrlist failed %{errno}d%@");
  OUTLINED_FUNCTION_2();
}

- (void)applyMetadataOnFileDescriptor:()LegacyAdditions liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] listing existing xattrs failed: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)applyMetadataOnFileDescriptor:()LegacyAdditions liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Unable to remove xattrs: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)applyMetadataOnFileDescriptor:()LegacyAdditions liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  OUTLINED_FUNCTION_10_2();
  v3 = *MEMORY[0x1E0C80C00];
  __error();
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_3_4(&dword_1CBD43000, v0, v1, "[ERROR] can't remove Spotlight last-used date xattrs %{errno}d%@", v2);
  OUTLINED_FUNCTION_3_0();
}

- (void)applyMetadataOnFileDescriptor:()LegacyAdditions liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  OUTLINED_FUNCTION_10_2();
  v3 = *MEMORY[0x1E0C80C00];
  __error();
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_3_4(&dword_1CBD43000, v0, v1, "[ERROR] can't to set Spotlight last-used date xattrs %{errno}d%@", v2);
  OUTLINED_FUNCTION_3_0();
}

- (void)applyMetadataOnFileDescriptor:()LegacyAdditions liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:.cold.6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_13_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_5_1(&dword_1CBD43000, v0, v1, "[ERROR] can't set xattr %s:  %{errno}d%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_6();
}

- (void)applyMetadataOnFileDescriptor:()LegacyAdditions liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:.cold.7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_13_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_5_1(&dword_1CBD43000, v0, v1, "[ERROR] can't set xattr %s:  %{errno}d%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_6();
}

- (void)applyMetadataOnFileDescriptor:()LegacyAdditions liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:.cold.8(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "trashPutBackPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v6, "[DEBUG] Preventing updating the put back info path from the server when parented by .Trash: %@%@", (uint8_t *)&v7);

}

- (void)applyMetadataOnFileDescriptor:()LegacyAdditions liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:.cold.9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_13_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_5_1(&dword_1CBD43000, v0, v1, "[ERROR] can't set xattr %s:  %{errno}d%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_6();
}

- (void)applyMetadataOnFileDescriptor:()LegacyAdditions liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:.cold.10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_13_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_5_1(&dword_1CBD43000, v0, v1, "[ERROR] can't set the xattr %s:  %{errno}d%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_6();
}

- (void)applyMetadataOnFileDescriptor:()LegacyAdditions liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:.cold.11()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_15(&dword_1CBD43000, v0, v1, "[ERROR] Can't set data protection %{errno}d%@");
  OUTLINED_FUNCTION_2();
}

- (void)applyMetadataOnFileDescriptor:()LegacyAdditions liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:.cold.12()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_15(&dword_1CBD43000, v0, v1, "[ERROR] Failed fstat on file %{errno}d%@");
  OUTLINED_FUNCTION_2();
}

- (void)applyMetadataOnFileDescriptor:()LegacyAdditions liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: invalid item type%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)applySharingReadonlyACLsToFD:()LegacyAdditions statInfo:version:clientZone:sharingOptions:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_15(&dword_1CBD43000, v0, v1, "[ERROR] Failed to strip the acls %{errno}d%@");
  OUTLINED_FUNCTION_2();
}

+ (void)applySharingReadonlyACLsToFD:()LegacyAdditions statInfo:version:clientZone:sharingOptions:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_15(&dword_1CBD43000, v0, v1, "[ERROR] Can't save immutable share permissions %{errno}d%@");
  OUTLINED_FUNCTION_2();
}

+ (void)applySharingReadonlyACLsToFD:()LegacyAdditions statInfo:version:clientZone:sharingOptions:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_15(&dword_1CBD43000, v0, v1, "[ERROR] Can't get the group for \"everyone\" in order to limit share permissions %{errno}d%@");
  OUTLINED_FUNCTION_2();
}

@end
