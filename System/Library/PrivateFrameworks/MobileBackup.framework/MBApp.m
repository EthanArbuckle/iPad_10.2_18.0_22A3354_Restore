@implementation MBApp

+ (id)appWithBundleID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = *MEMORY[0x1E0C9AE78];
  v8[1] = CFSTR("ContainerContentClass");
  v9[0] = a3;
  v9[1] = CFSTR("Data/Application");
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MBApp appWithPropertyList:](MBApp, "appWithPropertyList:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)appWithPropertyList:(id)a3
{
  id v3;
  MBApp *v4;

  v3 = a3;
  v4 = -[MBContainer initWithPropertyList:volumeMountPoint:]([MBApp alloc], "initWithPropertyList:volumeMountPoint:", v3, 0);

  return v4;
}

+ (id)safeHarborWithPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("Info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Info.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[MBApp appWithPropertyList:](MBApp, "appWithPropertyList:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)bundleVersion
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._plist, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE90]);
}

- (NSString)bundleDir
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._plist, "objectForKeyedSubscript:", CFSTR("Path"));
}

- (void)setBundleDir:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._plist, "setObject:forKeyedSubscript:", a3, CFSTR("Path"));
}

- (NSDictionary)entitlements
{
  return (NSDictionary *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._plist, "objectForKeyedSubscript:", CFSTR("Entitlements"));
}

- (NSString)entitlementsRelativePath
{
  void *v2;
  void *v3;

  -[MBApp bundleDir](self, "bundleDir");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MBEntitlementsRelativePathForBundleDir(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)groups
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  MBAppGroup *v10;
  void *v11;
  MBAppGroup *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary objectForKeyedSubscript:](self->super._plist, "objectForKeyedSubscript:", CFSTR("GroupContainers"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v10 = [MBAppGroup alloc];
        -[MBContainer volumeMountPoint](self, "volumeMountPoint");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[MBContainer initWithPropertyList:volumeMountPoint:](v10, "initWithPropertyList:volumeMountPoint:", v9, v11);
        objc_msgSend(v3, "addObject:", v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)plugins
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  MBAppPlugin *v10;
  void *v11;
  MBAppPlugin *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary objectForKeyedSubscript:](self->super._plist, "objectForKeyedSubscript:", CFSTR("Plugins"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v10 = [MBAppPlugin alloc];
        -[MBContainer volumeMountPoint](self, "volumeMountPoint");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[MBContainer initWithPropertyList:volumeMountPoint:](v10, "initWithPropertyList:volumeMountPoint:", v9, v11);
        objc_msgSend(v3, "addObject:", v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)containers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", self);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[MBApp groups](self, "groups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v6);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[MBApp plugins](self, "plugins");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
        objc_msgSend(v3, "addObject:", v14);
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v14, "groups", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v22;
          do
          {
            for (k = 0; k != v17; ++k)
            {
              if (*(_QWORD *)v22 != v18)
                objc_enumerationMutation(v15);
              objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * k));
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
          }
          while (v17);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v11);
  }

  return (NSArray *)v3;
}

- (BOOL)isAppUpdating
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._plist, "objectForKeyedSubscript:", CFSTR("IsUpdating"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isPlaceholder
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._plist, "objectForKeyedSubscript:", CFSTR("IsPlaceholder"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isSystemApp
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._plist, "objectForKeyedSubscript:", CFSTR("ApplicationType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("System")) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Internal"));

  return v3;
}

- (id)domain
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[MBApp bundleID](self, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBContainer volumeMountPoint](self, "volumeMountPoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBContainer containerDir](self, "containerDir");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MBDomain appDomainWithIdentifier:volumeMountPoint:rootPath:](MBDomain, "appDomainWithIdentifier:volumeMountPoint:rootPath:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  MBAppRelativePathsToBackupAndRestore();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRelativePathsToBackupAndRestore:", v7);

  MBAppRelativePathsNotToBackup();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRelativePathsNotToBackup:", v8);

  MBAppRelativePathsNotToRestore();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRelativePathsNotToRestore:", v9);

  objc_msgSend(v6, "setShouldDigest:", 0);
  return v6;
}

@end
