@implementation NSURL

void __45__NSURL_BackingStores__dnds_rootDirectoryURL__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E98];
  BSCurrentUserDirectory();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  v5[1] = CFSTR("Library");
  v5[2] = CFSTR("DoNotDisturb");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPathComponents:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)dnds_rootDirectoryURL_directoryURL;
  dnds_rootDirectoryURL_directoryURL = v3;

}

void __57__NSURL_BackingStores__dnds_backingStoreRootDirectoryURL__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "dnds_rootDirectoryURL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("DB"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)dnds_backingStoreRootDirectoryURL_directoryURL;
  dnds_backingStoreRootDirectoryURL_directoryURL = v1;

}

void __62__NSURL_BackingStores__dnds_localAssertionBackingStoreFileURL__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
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

  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("Assertions.json"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)dnds_localAssertionBackingStoreFileURL_fileURL;
  dnds_localAssertionBackingStoreFileURL_fileURL = v4;

}

void __56__NSURL_BackingStores__dnds_settingsBackingStoreFileURL__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
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

  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("Settings.json"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)dnds_settingsBackingStoreFileURL_fileURL;
  dnds_settingsBackingStoreFileURL_fileURL = v4;

}

void __55__NSURL_BackingStores__dnds_metricsBackingStoreFileURL__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
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

  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("Metrics.json"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)dnds_metricsBackingStoreFileURL_fileURL;
  dnds_metricsBackingStoreFileURL_fileURL = v4;

}

void __50__NSURL_BackingStores__dnds_legacySettingsFileURL__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E98];
  BSCurrentUserDirectory();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  v6[1] = CFSTR("Library");
  v6[2] = CFSTR("BulletinBoard");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPathComponents:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("BehaviorOverrides.plist"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)dnds_legacySettingsFileURL_fileURL;
  dnds_legacySettingsFileURL_fileURL = v4;

}

void __68__NSURL_BackingStores__dnds_locationAssertionUntilExitRegionFileURL__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
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

  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("UntilExitRegion.json"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)dnds_locationAssertionUntilExitRegionFileURL_fileURL;
  dnds_locationAssertionUntilExitRegionFileURL_fileURL = v4;

}

void __67__NSURL_BackingStores__dnds_locationAssertionExplicitRegionFileURL__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
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

  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("ExplicitRegion.json"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)dnds_locationAssertionExplicitRegionFileURL_fileURL;
  dnds_locationAssertionExplicitRegionFileURL_fileURL = v4;

}

void __66__NSURL_BackingStores__dnds_modeConfigurationsBackingStoreFileURL__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
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

  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("ModeConfigurations.json"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)dnds_modeConfigurationsBackingStoreFileURL_fileURL;
  dnds_modeConfigurationsBackingStoreFileURL_fileURL = v4;

}

void __72__NSURL_BackingStores__dnds_modeConfigurationsSecureBackingStoreFileURL__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
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

  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("ModeConfigurationsSecure.json"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)dnds_modeConfigurationsSecureBackingStoreFileURL_fileURL;
  dnds_modeConfigurationsSecureBackingStoreFileURL_fileURL = v4;

}

void __67__NSURL_BackingStores__dnds_globalConfigurationBackingStoreFileURL__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
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

  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("GlobalConfiguration.json"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)dnds_globalConfigurationBackingStoreFileURL_fileURL;
  dnds_globalConfigurationBackingStoreFileURL_fileURL = v4;

}

void __69__NSURL_BackingStores__dnds_placeholderModesLocalBackingStoreFileURL__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E98];
  BSSystemRootDirectory();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  v6[1] = CFSTR("System");
  v6[2] = CFSTR("Library");
  v6[3] = CFSTR("DoNotDisturb");
  v6[4] = CFSTR("DB");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPathComponents:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("PlaceholderModes.json"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)dnds_placeholderModesLocalBackingStoreFileURL_fileURL;
  dnds_placeholderModesLocalBackingStoreFileURL_fileURL = v4;

}

void __54__NSURL_BackingStores__dnds_syncEngineMetadataFileURL__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
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

  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("SyncEngineMetadata.plist"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)dnds_syncEngineMetadataFileURL_fileURL;
  dnds_syncEngineMetadataFileURL_fileURL = v4;

}

void __56__NSURL_BackingStores__dnds_syncEngineLastChanceFileURL__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
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

  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("SyncEngineLastChance.plist"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)dnds_syncEngineLastChanceFileURL_fileURL;
  dnds_syncEngineLastChanceFileURL_fileURL = v4;

}

void __57__NSURL_BackingStores__dnds_idsSyncEngineMetadataFileURL__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
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

  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("IDSSyncEngineMetadata.plist"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)dnds_idsSyncEngineMetadataFileURL_fileURL;
  dnds_idsSyncEngineMetadataFileURL_fileURL = v4;

}

@end
