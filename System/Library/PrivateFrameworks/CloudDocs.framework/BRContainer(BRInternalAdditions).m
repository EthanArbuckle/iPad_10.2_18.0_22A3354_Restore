@implementation BRContainer(BRInternalAdditions)

+ (void)versionOfBundle:()BRInternalAdditions changedFromVersion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_0(&dword_19CBF0000, v0, v1, "[ERROR] unable to retrieve properties without a bundle%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)postContainerListUpdateNotification
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: [BRContainerCache hasDaemonicParts]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)postContainerStatusChangeNotificationWithID:()BRInternalAdditions key:value:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: value != nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_updateMetadataOnDiskWithProperties:()BRInternalAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: !_mangledID.isCloudDocsMangledID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateMetadataWithExtractorProperties:()BRInternalAdditions iconPaths:bundleID:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] removed temporary path at '%@'%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)updateMetadataWithExtractorProperties:()BRInternalAdditions iconPaths:bundleID:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_17(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] metadata for container %@ are already up-to-date%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)updateMetadataWithExtractorProperties:()BRInternalAdditions iconPaths:bundleID:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_17(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] metadata for container %@ are equal except version number; perform local update only%@",
    (_QWORD)v3,
    DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)updateMetadataWithExtractorProperties:()BRInternalAdditions iconPaths:bundleID:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_17(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] metadata for container %@ are equal except version number but icons are different%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)updateMetadataWithExtractorProperties:()BRInternalAdditions iconPaths:bundleID:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: (!isEqual && !isEqualExceptVersionNumber) || (isEqual != isEqualExceptVersionNumber)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateMetadataWithExtractorProperties:()BRInternalAdditions iconPaths:bundleID:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: ![bundleID isEqualToString:BRDaemonBundleID]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateMetadataWithExtractorProperties:()BRInternalAdditions iconPaths:bundleID:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: bundleID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateMetadataWithExtractorProperties:()BRInternalAdditions iconPaths:bundleID:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: updatedProperties%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateMetadataWithRecordData:()BRInternalAdditions iconPaths:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] stripped plist from potential icon names%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateMetadataWithRecordData:()BRInternalAdditions iconPaths:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: recordData%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_generateiOSIconsForMangledID:()BRInternalAdditions usingBundle:generatedIcons:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] unable to retrieve app icon%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_generateiOSIconsForMangledID:()BRInternalAdditions usingBundle:generatedIcons:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] unable to find filenames that match the icons names.%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_generateiOSIconsForMangledID:()BRInternalAdditions usingBundle:generatedIcons:.cold.3(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19CBF0000, v1, v2, "[ERROR] unable to generate icons for %@ without icon metadata%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

+ (void)_generateiOSIconsForMangledID:()BRInternalAdditions usingBundle:generatedIcons:.cold.4(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] icon generated %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

+ (void)_generateiOSIconsForMangledID:()BRInternalAdditions usingBundle:generatedIcons:.cold.5(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] unable to retrieve app icon %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

+ (void)_generateiOSIconsForMangledID:()BRInternalAdditions usingBundle:generatedIcons:.cold.6(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] ┏%llx generate iOS icons%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)containsExcludedDocumentsOnTheFSWithExcludedButPreservedFilename:()BRInternalAdditions excludedButPreservedExtensions:andStampUploadedAppWithXattr:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] found an excluded file: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

@end
