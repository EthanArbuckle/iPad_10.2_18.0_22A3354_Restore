@implementation LSApplicationRecord(AppConduitAdditions)

- (uint64_t)ACX_isBuiltIn
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "typeForInstallMachinery");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CA5830]) ^ 1;

  return v2;
}

- (uint64_t)ACX_shouldBeTrackedByAppConduit
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v7;

  v2 = objc_alloc(MEMORY[0x1E0CA5870]);
  objc_msgSend(a1, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithBundleIdentifierOfSystemPlaceholder:error:", v3, 0);

  if (!v4)
  {
    if ((objc_msgSend(a1, "ACX_isHidden") & 1) != 0 || (objc_msgSend(a1, "isLaunchProhibited") & 1) != 0)
      return 0;
    if ((objc_msgSend(a1, "isDeletable") & 1) == 0)
    {
      objc_msgSend(a1, "ACX_watchKitAppExtensionBundleID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v7 != 0;

      return v5;
    }
  }
  return 1;
}

- (uint64_t)ACX_shouldBeTrackedByLaunchServicesWatcher
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x1E0CA5870]);
  objc_msgSend(a1, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithBundleIdentifierOfSystemPlaceholder:error:", v3, 0);

  if (v4)
    return 1;
  objc_msgSend(a1, "typeForInstallMachinery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "ACX_isHidden") & 1) != 0)
  {
    v5 = 0;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CA5820]) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CA5830]);
  }

  return v5;
}

- (uint64_t)ACX_isHidden
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "appTags");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "containsObject:", CFSTR("hidden"));

  return v2;
}

- (id)ACX_watchKitAppExtensionBundleID
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:ofClass:", CFSTR("WKPluginBundleIdKey"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)ACX_watchKitExtension
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1, "applicationExtensionRecords", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v6, "extensionPointRecord");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.watchkit"));

        if (v9)
        {
          v10 = v6;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v3)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (__CFString)ACX_wkTeamID
{
  void *v1;
  void *v2;
  __CFString *v3;

  objc_msgSend(a1, "teamIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1 && (objc_msgSend(v1, "isEqualToString:", CFSTR("0000000000")) & 1) == 0)
    v3 = v2;
  else
    v3 = &stru_1E9884358;

  return v3;
}

- (id)ACX_externalVersionIdentifier
{
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(a1, "iTunesMetadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "versionIdentifier");

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
