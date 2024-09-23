@implementation MBAppPlugin

- (NSString)ownerBundleID
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._plist, "objectForKeyedSubscript:", CFSTR("PluginOwnerBundleID"));
}

- (NSString)bundleDir
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._plist, "objectForKeyedSubscript:", CFSTR("Path"));
}

- (NSDictionary)entitlements
{
  return (NSDictionary *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._plist, "objectForKeyedSubscript:", CFSTR("Entitlements"));
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

- (id)domain
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[MBContainer identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBContainer volumeMountPoint](self, "volumeMountPoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBContainer containerDir](self, "containerDir");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MBDomain appPluginDomainWithIdentifier:volumeMountPoint:rootPath:](MBDomain, "appPluginDomainWithIdentifier:volumeMountPoint:rootPath:", v3, v4, v5);
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

- (NSString)entitlementsRelativePath
{
  void *v2;
  void *v3;

  -[MBAppPlugin bundleDir](self, "bundleDir");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MBEntitlementsRelativePathForBundleDir(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)allAppGroupContainers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[MBAppPlugin groups](self, "groups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "length");

        if (v11)
        {
          objc_msgSend(v3, "addObject:", v9);
        }
        else
        {
          MBGetDefaultLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            -[MBContainer identifier](self, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v27 = v9;
            v28 = 2112;
            v29 = v13;
            _os_log_impl(&dword_1D5213000, v12, OS_LOG_TYPE_DEFAULT, "Found empty app group container identifier for %@ (%@)", buf, 0x16u);

            -[MBContainer identifier](self, "identifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            _MBLog(CFSTR("DEFAULT"), (uint64_t)"Found empty app group container identifier for %@ (%@)", v14, v15, v16, v17, v18, v19, (uint64_t)v9);

          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

@end
