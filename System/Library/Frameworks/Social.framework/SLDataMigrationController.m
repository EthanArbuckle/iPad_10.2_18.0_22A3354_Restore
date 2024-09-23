@implementation SLDataMigrationController

+ (id)sharedController
{
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, &__block_literal_global_2);
  return (id)sharedController_sharedController;
}

void __45__SLDataMigrationController_sharedController__block_invoke()
{
  SLDataMigrationController *v0;
  void *v1;

  v0 = objc_alloc_init(SLDataMigrationController);
  v1 = (void *)sharedController_sharedController;
  sharedController_sharedController = (uint64_t)v0;

}

- (BOOL)needsMigrationForSocialDaemonBundleID:(id)a3 preferenceKey:(id)a4
{
  __CFString *v5;
  __CFString *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  BOOL v11;

  v5 = (__CFString *)a4;
  v6 = (__CFString *)a3;
  v7 = (void *)DMCopyCurrentBuildVersion();
  v8 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v9 = (const __CFString *)*MEMORY[0x1E0C9B250];
  CFPreferencesSynchronize(v6, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  v10 = (void *)CFPreferencesCopyValue(v5, v6, v8, v9);

  v11 = v7 && (!v10 || objc_msgSend(v7, "compare:options:", v10, 1));
  return v11;
}

- (void)didFinishMigrationForSocialDaemonBundleID:(id)a3 preferenceKey:(id)a4
{
  __CFString *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  __CFString *applicationID;

  applicationID = (__CFString *)a3;
  v5 = (__CFString *)a4;
  v6 = (void *)DMCopyCurrentBuildVersion();
  if (v6)
  {
    v7 = (const __CFString *)*MEMORY[0x1E0C9B260];
    v8 = (const __CFString *)*MEMORY[0x1E0C9B250];
    CFPreferencesSetValue(v5, v6, applicationID, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
    CFPreferencesSynchronize(applicationID, v7, v8);
  }

}

- (void)ensureSocialUserDataDirectory
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  SLUserDataDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "fileExistsAtPath:", v2) & 1) == 0)
    objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v2, 1, 0, 0);

}

- (BOOL)needsFileProtectionUpgradeForProfileImagesAtPath:(id)a3 serviceNameForLogging:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", v6, &v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v20;
  if (v10)
  {
    v11 = v10;
    _SLLog(v4, 3, CFSTR("Failed to get contents of %@ profile image directory with errror %@"));
    v12 = 0;
  }
  else
  {
    if (!objc_msgSend(v9, "count"))
    {
      v12 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v9, "lastObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/"), "stringByAppendingString:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    objc_msgSend(v8, "attributesOfItemAtPath:error:", v14, &v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v19;
    objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0CB2AD8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 1;
    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CB2AB0]) & 1) != 0)
        v12 = 0;
    }

  }
LABEL_11:
  _SLLog(v4, 3, CFSTR("%@ needs profile image file protection upgrade? %d"));

  return v12;
}

- (void)removeAncillarySocialDatabaseFilesWithPrefix:(id)a3 serviceNameForLogging:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SLUserDataDirectory();
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)v8;
  objc_msgSend(v9, "contentsOfDirectoryAtPath:error:", v8, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  _SLLog(v4, 7, CFSTR("%@ migration got contents of social directory %@"));
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v19;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16, v7, v19);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v16, "hasPrefix:", v6))
        {
          objc_msgSend(CFSTR("/"), "stringByAppendingString:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringByAppendingString:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          _SLLog(v4, 7, CFSTR("%@ migration trying to delete %@"));
          objc_msgSend(v9, "removeItemAtPath:error:", v18, 0, v10, v18);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

}

@end
