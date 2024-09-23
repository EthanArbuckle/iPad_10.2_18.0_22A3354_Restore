@implementation NSURL(BackingStores)

+ (id)dnds_rootDirectoryURL
{
  if (dnds_rootDirectoryURL_onceToken != -1)
    dispatch_once(&dnds_rootDirectoryURL_onceToken, &__block_literal_global_6);
  return (id)dnds_rootDirectoryURL_directoryURL;
}

+ (id)dnds_backingStoreRootDirectoryURL
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__NSURL_BackingStores__dnds_backingStoreRootDirectoryURL__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (dnds_backingStoreRootDirectoryURL_onceToken != -1)
    dispatch_once(&dnds_backingStoreRootDirectoryURL_onceToken, block);
  return (id)dnds_backingStoreRootDirectoryURL_directoryURL;
}

+ (id)dnds_localAssertionBackingStoreFileURL
{
  if (dnds_localAssertionBackingStoreFileURL_onceToken != -1)
    dispatch_once(&dnds_localAssertionBackingStoreFileURL_onceToken, &__block_literal_global_7);
  return (id)dnds_localAssertionBackingStoreFileURL_fileURL;
}

+ (id)dnds_settingsBackingStoreFileURL
{
  if (dnds_settingsBackingStoreFileURL_onceToken != -1)
    dispatch_once(&dnds_settingsBackingStoreFileURL_onceToken, &__block_literal_global_10);
  return (id)dnds_settingsBackingStoreFileURL_fileURL;
}

+ (id)dnds_metricsBackingStoreFileURL
{
  if (dnds_metricsBackingStoreFileURL_onceToken != -1)
    dispatch_once(&dnds_metricsBackingStoreFileURL_onceToken, &__block_literal_global_13);
  return (id)dnds_metricsBackingStoreFileURL_fileURL;
}

+ (id)dnds_legacySettingsFileURL
{
  if (dnds_legacySettingsFileURL_onceToken != -1)
    dispatch_once(&dnds_legacySettingsFileURL_onceToken, &__block_literal_global_16);
  return (id)dnds_legacySettingsFileURL_fileURL;
}

+ (id)dnds_locationAssertionUntilExitRegionFileURL
{
  if (dnds_locationAssertionUntilExitRegionFileURL_onceToken != -1)
    dispatch_once(&dnds_locationAssertionUntilExitRegionFileURL_onceToken, &__block_literal_global_21);
  return (id)dnds_locationAssertionUntilExitRegionFileURL_fileURL;
}

+ (id)dnds_locationAssertionExplicitRegionFileURL
{
  if (dnds_locationAssertionExplicitRegionFileURL_onceToken != -1)
    dispatch_once(&dnds_locationAssertionExplicitRegionFileURL_onceToken, &__block_literal_global_24);
  return (id)dnds_locationAssertionExplicitRegionFileURL_fileURL;
}

+ (id)dnds_modeConfigurationsBackingStoreFileURL
{
  if (dnds_modeConfigurationsBackingStoreFileURL_onceToken != -1)
    dispatch_once(&dnds_modeConfigurationsBackingStoreFileURL_onceToken, &__block_literal_global_27);
  return (id)dnds_modeConfigurationsBackingStoreFileURL_fileURL;
}

+ (id)dnds_modeConfigurationsSecureBackingStoreFileURL
{
  if (dnds_modeConfigurationsSecureBackingStoreFileURL_onceToken != -1)
    dispatch_once(&dnds_modeConfigurationsSecureBackingStoreFileURL_onceToken, &__block_literal_global_30);
  return (id)dnds_modeConfigurationsSecureBackingStoreFileURL_fileURL;
}

+ (id)dnds_globalConfigurationBackingStoreFileURL
{
  if (dnds_globalConfigurationBackingStoreFileURL_onceToken != -1)
    dispatch_once(&dnds_globalConfigurationBackingStoreFileURL_onceToken, &__block_literal_global_33);
  return (id)dnds_globalConfigurationBackingStoreFileURL_fileURL;
}

+ (id)dnds_placeholderModesLocalBackingStoreFileURL
{
  if (dnds_placeholderModesLocalBackingStoreFileURL_onceToken != -1)
    dispatch_once(&dnds_placeholderModesLocalBackingStoreFileURL_onceToken, &__block_literal_global_36);
  return (id)dnds_placeholderModesLocalBackingStoreFileURL_fileURL;
}

+ (id)dnds_syncEngineMetadataFileURL
{
  if (dnds_syncEngineMetadataFileURL_onceToken != -1)
    dispatch_once(&dnds_syncEngineMetadataFileURL_onceToken, &__block_literal_global_41);
  return (id)dnds_syncEngineMetadataFileURL_fileURL;
}

+ (id)dnds_syncEngineLastChanceFileURL
{
  if (dnds_syncEngineLastChanceFileURL_onceToken != -1)
    dispatch_once(&dnds_syncEngineLastChanceFileURL_onceToken, &__block_literal_global_44);
  return (id)dnds_syncEngineLastChanceFileURL_fileURL;
}

+ (id)dnds_idsSyncEngineMetadataFileURL
{
  if (dnds_idsSyncEngineMetadataFileURL_onceToken != -1)
    dispatch_once(&dnds_idsSyncEngineMetadataFileURL_onceToken, &__block_literal_global_47);
  return (id)dnds_idsSyncEngineMetadataFileURL_fileURL;
}

+ (id)dnds_assertionSyncMetadataFileURL
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E98];
  BSCurrentUserDirectory();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  v6[1] = CFSTR("Library");
  v6[2] = CFSTR("DoNotDisturb");
  v6[3] = CFSTR("DB");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPathComponents:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("AssertionSyncMetadata.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)dnds_meDeviceStoreFileURL
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E98];
  BSCurrentUserDirectory();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  v6[1] = CFSTR("Library");
  v6[2] = CFSTR("DoNotDisturb");
  v6[3] = CFSTR("DB");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPathComponents:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("MeDeviceStatus.json"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
