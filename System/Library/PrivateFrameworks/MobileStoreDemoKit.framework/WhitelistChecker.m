@implementation WhitelistChecker

- (WhitelistChecker)init
{
  WhitelistChecker *v2;
  WhitelistChecker *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WhitelistChecker;
  v2 = -[WhitelistChecker init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[WhitelistChecker setDomainsPlistFilePath:](v2, "setDomainsPlistFilePath:", CFSTR("/System/Library/PrivateFrameworks/MobileBackup.framework/Domains.plist"));
  return v3;
}

- (BOOL)load
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[3];

  v37[2] = *MEMORY[0x24BDAC8D0];
  +[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "macOS");

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage"), "stringByStandardizingPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v6;
    v37[1] = CFSTR("/Library/Apple");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WhitelistChecker setBlackListedPaths:](self, "setBlackListedPaths:", v8);

    return 1;
  }
  +[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "iOS"))
  {

  }
  else
  {
    +[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "rOS");

    if (!v11)
    {
      generateCustomDomainsPlistForSecurityRulesCheck();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[WhitelistChecker setDomains:](self, "setDomains:", v18);

      -[WhitelistChecker domains](self, "domains");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        return 1;
      defaultLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[WhitelistChecker load].cold.3(v29, v30, v31, v32, v33, v34, v35, v36);

      return 0;
    }
  }
  -[WhitelistChecker domainsPlistFilePath](self, "domainsPlistFilePath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSDDomainsPlistPatcher patchDomainsPlist:](MSDDomainsPlistPatcher, "patchDomainsPlist:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v14 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(v13, "objectForKey:", CFSTR("SystemDomains"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryWithDictionary:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WhitelistChecker setDomains:](self, "setDomains:", v16);

    -[WhitelistChecker domains](self, "domains");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {

      return 1;
    }
    defaultLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[WhitelistChecker load].cold.2(v21, v22, v23, v24, v25, v26, v27, v28);
  }
  else
  {
    defaultLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[WhitelistChecker load].cold.1((uint64_t)v12, v21);
  }

  return 0;
}

- (BOOL)loadFromFile:(id)a3
{
  -[WhitelistChecker setDomainsPlistFilePath:](self, "setDomainsPlistFilePath:", a3);
  return -[WhitelistChecker load](self, "load");
}

- (id)checkManifest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  __int128 v7;
  unint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  NSObject *v19;
  void *v20;
  __int128 v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = v4;
  v25 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (!v25)
    goto LABEL_20;
  v24 = *(_QWORD *)v27;
  v8 = 0x24D0AC000uLL;
  *(_QWORD *)&v7 = 136315394;
  v22 = v7;
  v23 = v6;
  do
  {
    for (i = 0; i != v25; ++i)
    {
      if (*(_QWORD *)v27 != v24)
        objc_enumerationMutation(v6);
      v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
      objc_msgSend(v6, "objectForKey:", v10, v22);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WhitelistChecker getRealPathForFile:withMetaData:](self, "getRealPathForFile:withMetaData:", v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v8 + 3896), "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "macOS");

      if (v14)
      {
        if (-[WhitelistChecker checkFile_macOS:withMetaData:](self, "checkFile_macOS:withMetaData:", v12, v11))
          goto LABEL_18;
        goto LABEL_15;
      }
      objc_msgSend(*(id *)(v8 + 3896), "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "iOS"))
      {

LABEL_12:
        v18 = -[WhitelistChecker checkFile_iOS:withMetaData:](self, "checkFile_iOS:withMetaData:", v12, v11);
        goto LABEL_14;
      }
      objc_msgSend(*(id *)(v8 + 3896), "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "rOS");

      if (v17)
        goto LABEL_12;
      v18 = -[WhitelistChecker checkFile_WatchAndTV:withMetaData:](self, "checkFile_WatchAndTV:withMetaData:", v12, v11);
LABEL_14:
      v6 = v23;
      v8 = 0x24D0AC000;
      if (v18)
        goto LABEL_18;
LABEL_15:
      defaultLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v22;
        v31 = "-[WhitelistChecker checkManifest:]";
        v32 = 2114;
        v33 = v10;
        _os_log_impl(&dword_213A7E000, v19, OS_LOG_TYPE_DEFAULT, "%s:%{public}@ failed the check.", buf, 0x16u);
      }

      objc_msgSend(v5, "addObject:", v10);
LABEL_18:

    }
    v25 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  }
  while (v25);
LABEL_20:

  if (objc_msgSend(v5, "count"))
    v20 = (void *)objc_msgSend(v5, "copy");
  else
    v20 = 0;

  return v20;
}

- (BOOL)checkFile_macOS:(id)a3 withMetaData:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a3;
  -[WhitelistChecker blackListedPaths](self, "blackListedPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  return v7 ^ 1;
}

- (BOOL)checkFile_iOS:(id)a3 withMetaData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  char v26;
  NSObject *v27;
  int v28;
  uint64_t v29;
  void *v31;
  id v32;
  WhitelistChecker *v33;
  id obj;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  char v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("/var/mobile/Media"), CFSTR("/var/mobile/Library/Backup/SystemContainers/"), CFSTR("/var/mobile/Library/IdentityServices/Persistence/DoNotBackup"), CFSTR("/var/root/Library/Backup/SystemContainers/"), CFSTR("/var/wireless/Library/Preferences/com.apple.awdd.persistent.plist"), CFSTR("/var/wireless/Library/Preferences/com.apple.awdd.plist"), CFSTR("/var/MobileSoftwareUpdate/.MAAMigrated.plist"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[WhitelistChecker file:whitelisted:](self, "file:whitelisted:", v6, v8)
    && !-[WhitelistChecker annotated:](self, "annotated:", v7))
  {
    v31 = v8;
    v32 = v7;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[WhitelistChecker domains](self, "domains");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (!v37)
    {
      v38 = 0;
      v10 = 0;
      v39 = 0;
      goto LABEL_33;
    }
    v39 = 0;
    v38 = 0;
    v10 = 0;
    v36 = *(_QWORD *)v42;
    v35 = v6;
    v33 = self;
    while (1)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v42 != v36)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x2199BB9B0]();
        -[WhitelistChecker domains](self, "domains");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "objectForKey:", CFSTR("RootPath"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          defaultLogHandle();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v46 = v12;
            _os_log_error_impl(&dword_213A7E000, v27, OS_LOG_TYPE_ERROR, "No root path find in domain %{public}@", buf, 0xCu);
          }
          v18 = 0;
          v26 = 0;
          goto LABEL_16;
        }
        v40 = v13;
        objc_msgSend(v15, "objectForKey:", CFSTR("RelativePathsToBackupAndRestore"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v17, "mutableCopy");

        objc_msgSend(v15, "objectForKey:", CFSTR("RelativePathsToOnlyBackupEncrypted"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObjectsFromArray:", v19);

        objc_msgSend(v15, "objectForKey:", CFSTR("RelativePathsToRestoreOnly"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObjectsFromArray:", v20);

        objc_msgSend(v15, "objectForKey:", CFSTR("RelativePathsToBackupToDriveAndStandardAccount"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObjectsFromArray:", v21);

        -[WhitelistChecker createFullPathList:rootPath:isAllowList:](self, "createFullPathList:rootPath:isAllowList:", v18, v16, 1);
        v22 = objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          defaultLogHandle();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v46 = v12;
            _os_log_error_impl(&dword_213A7E000, v27, OS_LOG_TYPE_ERROR, "Cannot create allow list for domain %{public}@", buf, 0xCu);
          }
          v26 = 0;
          v10 = 0;
          v13 = v40;
          goto LABEL_16;
        }
        if (-[WhitelistChecker file:whitelisted:](self, "file:whitelisted:", v6, v22))
        {
          objc_msgSend(v15, "objectForKey:", CFSTR("RelativePathsNotToRestore"));
          v23 = objc_claimAutoreleasedReturnValue();

          -[WhitelistChecker createFullPathList:rootPath:isAllowList:](self, "createFullPathList:rootPath:isAllowList:", v23, v16, 0);
          v24 = objc_claimAutoreleasedReturnValue();

          if (-[WhitelistChecker file:blacklisted:](self, "file:blacklisted:", v6, v24))
          {
            defaultLogHandle();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v46 = v6;
              v47 = 2114;
              v48 = v12;
              _os_log_impl(&dword_213A7E000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ is black listed in %{public}@", buf, 0x16u);
            }
            v39 = 1;
            v18 = (void *)v23;
            v26 = 1;
            v38 = (void *)v24;
            v10 = (void *)v22;
            v13 = v40;
            v27 = v25;
            self = v33;
LABEL_16:

            v28 = 0;
            goto LABEL_20;
          }
          v28 = 0;
          v39 = 1;
          v18 = (void *)v23;
          v26 = 1;
          v38 = (void *)v24;
        }
        else
        {
          v28 = 1;
          v26 = v39;
        }
        v10 = (void *)v22;
        v13 = v40;
LABEL_20:

        objc_autoreleasePoolPop(v13);
        if (!v28)
        {
          v39 = v26;
          v6 = v35;
          goto LABEL_33;
        }
        ++v11;
        v6 = v35;
      }
      while (v37 != v11);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      v37 = v29;
      if (!v29)
      {
LABEL_33:

        v8 = v31;
        v7 = v32;
        v9 = v38;
        goto LABEL_34;
      }
    }
  }
  v9 = 0;
  v10 = 0;
  v39 = 1;
LABEL_34:

  return v39 & 1;
}

- (BOOL)checkFile_WatchAndTV:(id)a3 withMetaData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDBCEB8];
  -[WhitelistChecker domains](self, "domains");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("ContentRootDomain"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("/var/mobile/Media"), CFSTR("/var/containers/"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", CFSTR("/var/mobile/Library/"));
  v13 = -[WhitelistChecker file:whitelisted:](self, "file:whitelisted:", v6, v12)
     || -[WhitelistChecker annotated:](self, "annotated:", v7)
     || -[WhitelistChecker file:whitelisted:](self, "file:whitelisted:", v6, v11);

  return v13;
}

- (BOOL)annotated:(id)a3
{
  id v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v3 = a3;
  +[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "iOS"))
  {

    v5 = CFSTR("MBRestoreAnnotation");
    v6 = &unk_24D0B8358;
  }
  else
  {
    +[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "rOS");

    if (v8)
      v6 = &unk_24D0B8358;
    else
      v6 = &unk_24D0B8370;
    if (v8)
      v5 = CFSTR("MBRestoreAnnotation");
    else
      v5 = CFSTR("MSDAnnotation");
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("MSDManifestFileExtendedAttributes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  if (v9)
  {
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "objectForKey:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v10, 4);
      v12 = objc_msgSend(v6, "containsObject:", v11);

      if ((v12 & 1) != 0)
        v13 = 1;
    }
  }

  return v13;
}

- (id)createFullPathList:(id)a3 rootPath:(id)a4 isAllowList:(BOOL)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v19;
  id obj;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v19 = a5;
  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v21 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x2199BB9B0]();
        objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("#"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v16, "length"))
        {
          objc_msgSend(v21, "stringByAppendingPathComponent:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v17);

        }
        objc_autoreleasePoolPop(v12);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

  if (v19 && !objc_msgSend(v22, "count"))
    objc_msgSend(v22, "addObject:", v21);

  return v22;
}

- (BOOL)file:(id)a3 whitelisted:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (!objc_msgSend(v5, "rangeOfString:", v11, (_QWORD)v14) || !objc_msgSend(v11, "rangeOfString:", v5))
        {
          v12 = 1;
          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v12 = 0;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_13:

  return v12;
}

- (BOOL)file:(id)a3 blacklisted:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  void *v17;
  char v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (!objc_msgSend(v5, "rangeOfString:", v11, (_QWORD)v20))
        {
          v13 = v12;
          v14 = objc_msgSend(v5, "length");
          if (v14 == objc_msgSend(v11, "length"))
          {
            v16 = 1;
            goto LABEL_14;
          }
          v15 = objc_msgSend(v5, "length");
          if (v15 > objc_msgSend(v11, "length"))
          {
            v16 = 1;
            objc_msgSend(v5, "substringWithRange:", v13, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("/"));

            if ((v18 & 1) != 0)
              goto LABEL_14;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v8)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_14:

  return v16;
}

- (id)getRealPathForFile:(id)a3 withMetaData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;

  v5 = a3;
  objc_msgSend(a4, "valueForKey:", CFSTR("MSDManifestFileAttributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("NSFileType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("NSFileTypeRegular")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("NSFileTypeDirectory")))
  {
    objc_msgSend(v5, "stringByStandardizingPath");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", v8) & 1) == 0)
    {
      defaultLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[WhitelistChecker getRealPathForFile:withMetaData:].cold.1((uint64_t)v5, (uint64_t)v8, v9);

    }
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (BOOL)shouldRestoreSystemContainer_iOS:(id)a3 shared:(BOOL)a4
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  id v15;
  id v16;
  char v17;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0;
  v17 = 0;
  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "cStringUsingEncoding:", 4);
  v5 = container_create_or_lookup_path_for_current_user();
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  if (v5)
    v10 = v17 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("file://%s"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v11 = *MEMORY[0x24BDBCC68];
    v15 = 0;
    v12 = objc_msgSend(v9, "getResourceValue:forKey:error:", &v16, v11, &v15);
    v6 = v16;
    v7 = v15;
    if (v12)
    {
      if (objc_msgSend(v6, "BOOLValue"))
      {
        defaultLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v20 = "-[WhitelistChecker shouldRestoreSystemContainer_iOS:shared:]";
          v21 = 2114;
          v22 = v4;
          _os_log_impl(&dword_213A7E000, v13, OS_LOG_TYPE_DEFAULT, "%s:Container check failed for %{public}@. But still restoring.", buf, 0x16u);
        }

      }
    }
  }

  return 1;
}

- (BOOL)shouldRestoreSystemContainer_WatchAndTV:(id)a3 shared:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[WhitelistChecker domains](self, "domains");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("SystemContainerDomain"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v7, "containsObject:", v5);
  return (char)v6;
}

- (BOOL)handleSystemContainerFiles:(id)a3 withMetadata:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  _BOOL8 v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int v30;
  NSObject *v32;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  +[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "iOS");

  v9 = v8 == 0;
  if (v8)
    v10 = &unk_24D0B8388;
  else
    v10 = &unk_24D0B83B8;
  if (v8)
    v11 = &unk_24D0B83A0;
  else
    v11 = &unk_24D0B83D0;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  if (v9)
    v12 = 6;
  else
    v12 = 8;
  v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16, self);
  v35 = v12;
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v41 != v15)
          objc_enumerationMutation(v10);
        v17 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        if (objc_msgSend(v5, "rangeOfString:", v17) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v18 = v6;
          objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", v17, &stru_24D0AE900);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 1;
          goto LABEL_20;
        }
      }
      v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v14)
        continue;
      break;
    }
  }
  v18 = v6;
  v19 = 0;
  v20 = 0;
LABEL_20:
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v21 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v37;
    while (2)
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v37 != v23)
          objc_enumerationMutation(v11);
        v25 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
        if (objc_msgSend(v5, "rangeOfString:", v25) != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", v25, &stru_24D0AE900);
          v28 = objc_claimAutoreleasedReturnValue();

          v26 = 0;
          v19 = (void *)v28;
          goto LABEL_31;
        }
      }
      v22 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      if (v22)
        continue;
      break;
    }
  }
  v26 = 1;
  if (!v20)
  {
    v27 = 0;
    goto LABEL_36;
  }
LABEL_31:
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("/"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "count") != v35 || (objc_msgSend(v34, "annotated:", v18) & 1) != 0)
  {
LABEL_35:
    LOBYTE(v26) = 1;
    goto LABEL_36;
  }
  +[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "iOS");

  if (v30)
  {
    if ((objc_msgSend(v34, "shouldRestoreSystemContainer_iOS:shared:", v19, v26) & 1) != 0)
      goto LABEL_35;
  }
  else if ((objc_msgSend(v34, "shouldRestoreSystemContainer_WatchAndTV:shared:", v19, v26) & 1) != 0)
  {
    goto LABEL_35;
  }
  defaultLogHandle();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    -[WhitelistChecker handleSystemContainerFiles:withMetadata:].cold.1((uint64_t)v5, v32);

  LOBYTE(v26) = 0;
LABEL_36:

  return v26;
}

- (NSSet)blackListedPaths
{
  return self->_blackListedPaths;
}

- (void)setBlackListedPaths:(id)a3
{
  objc_storeStrong((id *)&self->_blackListedPaths, a3);
}

- (NSDictionary)domains
{
  return self->_domains;
}

- (void)setDomains:(id)a3
{
  objc_storeStrong((id *)&self->_domains, a3);
}

- (NSString)domainsPlistFilePath
{
  return self->_domainsPlistFilePath;
}

- (void)setDomainsPlistFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_domainsPlistFilePath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainsPlistFilePath, 0);
  objc_storeStrong((id *)&self->_domains, 0);
  objc_storeStrong((id *)&self->_blackListedPaths, 0);
}

- (void)load
{
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, a1, a3, "Cannot generate custom domains.", a5, a6, a7, a8, 0);
}

- (void)getRealPathForFile:(os_log_t)log withMetaData:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_debug_impl(&dword_213A7E000, log, OS_LOG_TYPE_DEBUG, "Manifest file path %{public}@ is not same as real path: %{public}@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)handleSystemContainerFiles:(uint64_t)a1 withMetadata:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[WhitelistChecker handleSystemContainerFiles:withMetadata:]";
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_213A7E000, a2, OS_LOG_TYPE_ERROR, "%s:Container check failed for %{public}@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
