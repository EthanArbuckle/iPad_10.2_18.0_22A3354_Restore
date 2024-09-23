@implementation MDMMigrator

+ (id)sharedMigrator
{
  void *v2;
  MDMMigrator *v3;
  void *v4;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  if (!sharedMigrator_obj)
  {
    v3 = objc_alloc_init(MDMMigrator);
    v4 = (void *)sharedMigrator_obj;
    sharedMigrator_obj = (uint64_t)v3;

  }
  objc_sync_exit(v2);

  return (id)sharedMigrator_obj;
}

- (void)migrateMDMWithContext:(int)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  char v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2A868]), "initWithReason:", CFSTR("mdmd-MigrateMDM"));
  v6 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v6, OS_LOG_TYPE_DEFAULT, "MDM migrating...", buf, 2u);
  }
  if (a3)
  {
    MDMManagedNonStoreBooksSystemGroupContainer();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("Managed"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v8, &v17);

    if (v10 && v17)
    {
      v11 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222CB9000, v11, OS_LOG_TYPE_DEFAULT, "Found non-store managed books in seed-only system location. Migrating...", buf, 2u);
      }
      -[MDMMigrator _moveNonStoreManagedBooksToSystemGroupContainerFromLegacyPath:](self, "_moveNonStoreManagedBooksToSystemGroupContainerFromLegacyPath:", v8);
    }
    -[MDMMigrator _moveNonStoreManagedBooksToSystemGroupContainer](self, "_moveNonStoreManagedBooksToSystemGroupContainer");
    -[MDMMigrator _updateNonStoreBooksManifestForSystemGroupContainer](self, "_updateNonStoreBooksManifestForSystemGroupContainer");
    -[MDMMigrator _updateSkipBackupKeyForNonStoreBooksDirectory](self, "_updateSkipBackupKeyForNonStoreBooksDirectory");
    -[MDMMigrator _updateUnlockTokenSecretToClassDIfNeeded](self, "_updateUnlockTokenSecretToClassDIfNeeded");
    -[MDMMigrator _updateUserEnrollmentToUseRMAccount](self, "_updateUserEnrollmentToUseRMAccount");
    -[MDMMigrator _updateToMDMPropertiesForDDMActiveState](self, "_updateToMDMPropertiesForDDMActiveState");

    if (a3 == 2)
    {
      -[MDMMigrator _resetManagedAppRemovability](self, "_resetManagedAppRemovability");
      -[MDMMigrator _resetManagedAppTapToPayScreenLock](self, "_resetManagedAppTapToPayScreenLock");
    }
  }
  else
  {
    v18 = 0;
    v12 = MDMKeybagCreateMDMEscrowWithPasscode(&stru_24EB6A400, &v18);
    v13 = v18;
    if (!v12)
    {
      v14 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v13;
        _os_log_impl(&dword_222CB9000, v14, OS_LOG_TYPE_ERROR, "Unable to create unlock escrow during erase-context migration: %{public}@", buf, 0xCu);
      }
    }
    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "migrateAllFiles");

  }
  v16 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v16, OS_LOG_TYPE_DEFAULT, "MDM completed migration.", buf, 2u);
  }

}

- (void)_moveNonStoreManagedBooksToSystemGroupContainer
{
  id v3;

  MDMLegacyManagedNonStoreBooksDirectory();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MDMMigrator _moveNonStoreManagedBooksToSystemGroupContainerFromLegacyPath:](self, "_moveNonStoreManagedBooksToSystemGroupContainerFromLegacyPath:", v3);

}

- (void)_moveNonStoreManagedBooksToSystemGroupContainerFromLegacyPath:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  int v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  int v18;
  id v19;
  NSObject *v20;
  const char *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  int v33;
  void *v34;
  char v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  id v40;
  id v41[2];
  id v42;
  char v43;
  uint64_t v44;
  void *v45;
  uint8_t buf[4];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_DEFAULT, "Migrating non-store managed books to system group container...", buf, 2u);
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v6 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v3, &v43);
  objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userMode");

  if (v8 == 1)
  {
    objc_msgSend(v5, "removeItemAtPath:error:", v3, 0);
    goto LABEL_58;
  }
  if (v43)
    v9 = v6;
  else
    v9 = 0;
  if (v9 != 1)
  {
    v14 = 0;
    goto LABEL_49;
  }
  v42 = 0;
  objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v3, &v42);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v42;
  if (!objc_msgSend(v10, "count"))
  {
    v15 = v11 != 0;
    v13 = 1;
    goto LABEL_23;
  }
  if (objc_msgSend(v10, "count") == 1)
  {
    objc_msgSend(v10, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR(".Managed.plist.lock"));

  }
  else
  {
    v13 = 0;
  }
  v15 = v11 != 0;
  if (v11 || (v13 & 1) != 0)
  {
LABEL_23:
    v14 = 0;
    if (v15)
      v22 = v11;
    else
      v22 = 0;
    if (!v15 && v13)
    {
      v23 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222CB9000, v23, OS_LOG_TYPE_DEFAULT, "Removing empty legacy non-store managed books...", buf, 2u);
      }
      v39 = 0;
      objc_msgSend(v5, "removeItemAtPath:error:", v3, &v39);
      v22 = v39;
      if (v22)
      {
        v24 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v47 = v22;
          _os_log_impl(&dword_222CB9000, v24, OS_LOG_TYPE_ERROR, "Failed to delete empty legacy non-store managed books with error %{public}@", buf, 0xCu);
        }
      }
      v14 = 0;
    }
    goto LABEL_48;
  }
  v16 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v16, OS_LOG_TYPE_DEFAULT, "Moving legacy non-store managed books directory...", buf, 2u);
  }
  MDMManagedNonStoreBooksDirectory();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = 0;
  v18 = DMCSafelyCopyItemAtPathToDestinationPath();
  v19 = 0;

  if (v19)
  {
    v20 = *(NSObject **)DMCLogObjects();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_42;
    *(_DWORD *)buf = 138543362;
    v47 = v19;
    v21 = "Failed to move legacy non-store managed books with error %{public}@";
    goto LABEL_22;
  }
  if (!v18)
  {
    v25 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v25, OS_LOG_TYPE_ERROR, "Failed to move legacy non-store managed books with no error", buf, 2u);
    }
    goto LABEL_41;
  }
  if (!objc_msgSend(v5, "fileExistsAtPath:", v3))
  {
LABEL_41:
    v19 = 0;
    goto LABEL_42;
  }
  v41[0] = 0;
  objc_msgSend(v5, "removeItemAtPath:error:", v3, v41);
  v19 = v41[0];
  if (v19)
  {
    v20 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v47 = v19;
      v21 = "Failed to delete legacy non-store managed books with error %{public}@";
LABEL_22:
      _os_log_impl(&dword_222CB9000, v20, OS_LOG_TYPE_ERROR, v21, buf, 0xCu);
    }
  }
LABEL_42:
  MDMManagedNonStoreBooksDirectory();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v5, "fileExistsAtPath:", v26);

  if (v27)
  {
    v44 = *MEMORY[0x24BDD0CC8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", 511);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v28;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    MDMManagedNonStoreBooksDirectory();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v19;
    objc_msgSend(v5, "setAttributes:ofItemAtPath:error:", v29, v30, &v40);
    v22 = v40;

    if (v22)
    {
      v31 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v47 = v22;
        _os_log_impl(&dword_222CB9000, v31, OS_LOG_TYPE_ERROR, "Failed to set permissions on new non-store managed books directory with error %{public}@", buf, 0xCu);
      }
    }

    v14 = 1;
  }
  else
  {
    v14 = 0;
    v22 = v19;
  }
LABEL_48:

LABEL_49:
  MDMManagedNonStoreBooksDirectory();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v5, "fileExistsAtPath:", v32);

  if (!v33)
  {
    if (!v14)
      goto LABEL_58;
    goto LABEL_57;
  }
  MDMManagedNonStoreBooksDirectory();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = DMCFixPermissionsOfSystemGroupContainerDirectoryAndContents();
  v36 = 0;

  if ((v35 & 1) == 0)
  {
    if (objc_msgSend(v36, "count"))
    {
      v37 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v47 = v36;
        _os_log_impl(&dword_222CB9000, v37, OS_LOG_TYPE_ERROR, "Failed to fix permissions of device's MDM managed non-store books with errors %{public}@", buf, 0xCu);
      }
    }
  }

  if ((v14 & 1) != 0)
LABEL_57:
    MDMSendManagedBooksChangedNotification();
LABEL_58:
  v38 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v38, OS_LOG_TYPE_DEFAULT, "Completed non-store managed books system group container migration.", buf, 2u);
  }

}

- (void)_updateNonStoreBooksManifestForSystemGroupContainer
{
  NSObject *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[16];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v2, OS_LOG_TYPE_DEFAULT, "Beginning update of non-store managed books manifest...", buf, 2u);
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MDMManagedNonStoreBooksManifestPath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = (void *)MEMORY[0x24BDBCE70];
    MDMManagedNonStoreBooksManifestPath();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithContentsOfFile:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v39 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222CB9000, v39, OS_LOG_TYPE_DEFAULT, "Completed non-store managed books manifest update with empty manifest.", buf, 2u);
      }
      goto LABEL_38;
    }
    v9 = *MEMORY[0x24BE61038];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE61038]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v40 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222CB9000, v40, OS_LOG_TYPE_DEFAULT, "Completed non-store managed books manifest update with no books.", buf, 2u);
      }
      goto LABEL_37;
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v12)
    {
      v13 = v12;
      v41 = v9;
      v42 = v3;
      v43 = v10;
      v44 = v8;
      v45 = 0;
      v14 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v52 != v14)
            objc_enumerationMutation(v11);
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE60D58]), "initWithManifestDictionary:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i));
          objc_msgSend(v16, "persistentID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v16, "fullPath");
            v18 = objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              v19 = (void *)v18;
              objc_msgSend(v16, "fullPath");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              MDMManagedNonStoreBooksDirectory();
              v21 = v11;
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v20, "hasPrefix:", v22);

              v11 = v21;
              if ((v23 & 1) == 0)
              {
                MDMManagedNonStoreBooksDirectory();
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "fullPath");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "lastPathComponent");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "stringByAppendingPathComponent:", v26);
                v27 = (void *)objc_claimAutoreleasedReturnValue();

                v11 = v21;
                objc_msgSend(v16, "setFullPath:", v27);

                v45 = 1;
              }
            }
            objc_msgSend(v16, "persistentID", v41);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "setObject:forKeyedSubscript:", v16, v28);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      }
      while (v13);

      v3 = v42;
      v10 = v43;
      if ((v45 & 1) == 0)
        goto LABEL_28;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v46, "count"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      objc_msgSend(v46, "allValues");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v48;
        do
        {
          for (j = 0; j != v32; ++j)
          {
            if (*(_QWORD *)v48 != v33)
              objc_enumerationMutation(v30);
            objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * j), "manifestDictionary", v41);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObject:", v35);

          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
        }
        while (v32);
      }

      objc_msgSend(v11, "setObject:forKeyedSubscript:", v29, v41);
      MDMManagedNonStoreBooksManifestPath();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "writeToFile:atomically:", v36, 1);

      MDMSendManagedBooksChangedNotification();
      v10 = v43;
      v8 = v44;
    }

LABEL_28:
    v37 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v37, OS_LOG_TYPE_DEFAULT, "Completed non-store managed books manifest update.", buf, 2u);
    }

LABEL_37:
LABEL_38:

    goto LABEL_39;
  }
  v38 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v38, OS_LOG_TYPE_DEFAULT, "Completed non-store managed books manifest update with no manifest.", buf, 2u);
  }
LABEL_39:

}

- (void)_updateSkipBackupKeyForNonStoreBooksDirectory
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  int v6;
  void *v7;
  char v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  _DWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MDMManagedNonStoreBooksDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  if (v4)
  {
    v5 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl(&dword_222CB9000, v5, OS_LOG_TYPE_DEFAULT, "Migrating enterprise book backup flag...", (uint8_t *)v14, 2u);
    }
    v6 = !+[MDMMCInterface isEnterpriseBookBackupAllowed](MDMMCInterface, "isEnterpriseBookBackupAllowed");
    MDMManagedNonStoreBooksDirectory();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = DMCSetSkipBackupAttributeToItemAtPath();

    v9 = *(NSObject **)DMCLogObjects();
    if ((v8 & 1) != 0)
    {
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        return;
      v14[0] = 67109120;
      v14[1] = v6;
      v10 = "Set backup exclusion on enterprise books directory to %d";
      v11 = v9;
      v12 = OS_LOG_TYPE_DEFAULT;
      v13 = 8;
    }
    else
    {
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        return;
      LOWORD(v14[0]) = 0;
      v10 = "Failed to set backup exclusion on enterprise books directory";
      v11 = v9;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 2;
    }
    _os_log_impl(&dword_222CB9000, v11, v12, v10, (uint8_t *)v14, v13);
  }
}

- (void)_updateUnlockTokenSecretToClassDIfNeeded
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BE2A810];
  v3 = *MEMORY[0x24BE613F0];
  v4 = *MEMORY[0x24BE61048];
  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personaID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  LOBYTE(v31) = v6 != 0;
  v35 = v4;
  objc_msgSend(v2, "dataFromService:account:label:description:group:useSystemKeychain:enforcePersonalPersona:outError:", v3, v4, 0, 0, 0, 0, v31, &v39);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v39;

  objc_msgSend(MEMORY[0x24BE2A810], "stringFromServiceData:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BE2A810];
  v11 = *MEMORY[0x24BE60F38];
  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "personaID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v8;
  LOBYTE(v32) = v13 != 0;
  objc_msgSend(v10, "dataFromService:account:label:description:group:useSystemKeychain:enforcePersonalPersona:outError:", v3, v11, 0, 0, 0, 0, v32, &v38);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v38;

  v36 = (void *)v14;
  objc_msgSend(MEMORY[0x24BE2A810], "stringFromServiceData:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v34 = v7;
    v17 = (void *)MEMORY[0x24BE2A810];
    objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "personaID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeItemForService:account:label:description:useSystemKeychain:enforcePersonalPersona:group:", v3, v35, 0, 0, 0, v19 != 0, 0);

    if (v16)
    {
      v20 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222CB9000, v20, OS_LOG_TYPE_DEFAULT, "Not migrating old MDM secret because we already have a new one!", buf, 2u);
      }
      +[MDMEvents sharedInstance](MDMEvents, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "recordDateForEvent:", CFSTR("UnlockTokenSuperseded"));

    }
    else
    {
      v23 = (void *)MEMORY[0x24BE2A810];
      objc_msgSend(MEMORY[0x24BE2A810], "dataFromString:", v9);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *MEMORY[0x24BDE8F88];
      objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "personaID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v15;
      BYTE2(v33) = v27 != 0;
      LOWORD(v33) = 256;
      LOBYTE(v23) = objc_msgSend(v23, "setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:enforcePersonalPersona:outError:", v24, v3, v11, 0, 0, v25, 0, v33, &v37);
      v28 = v37;

      if ((v23 & 1) != 0)
      {
        +[MDMEvents sharedInstance](MDMEvents, "sharedInstance");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "recordDateForEvent:", CFSTR("UnlockTokenMigrationDate"));

      }
      else
      {
        v30 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v41 = v28;
          _os_log_impl(&dword_222CB9000, v30, OS_LOG_TYPE_ERROR, "Could not set unlock token item: %{public}@", buf, 0xCu);
        }
      }
      v15 = v28;
    }
    v7 = v34;
LABEL_15:

    goto LABEL_16;
  }
  if (v15)
  {
    v22 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v41 = v15;
      _os_log_impl(&dword_222CB9000, v22, OS_LOG_TYPE_ERROR, "Could not get unlock token item: %{public}@", buf, 0xCu);
    }
    goto LABEL_15;
  }
LABEL_16:

}

- (void)_resetManagedAppRemovability
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = (void *)MEMORY[0x24BDBCE70];
  MDMAppManagementFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE60FE0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v6 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_222CB9000, v6, OS_LOG_TYPE_DEFAULT, "Cleaning up managed app removability...", v7, 2u);
      }
      objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_1);
    }

  }
}

void __43__MDMMigrator__resetManagedAppRemovability__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BE60FD8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE60FC0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && (objc_msgSend(v6, "BOOLValue") & 1) == 0)
    {
      v8 = (void *)MEMORY[0x24BE51F70];
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __43__MDMMigrator__resetManagedAppRemovability__block_invoke_2;
      v9[3] = &unk_24EB68580;
      v10 = v4;
      objc_msgSend(v8, "setRemovability:forAppWithBundleID:completion:", 2, v10, v9);

    }
  }

}

void __43__MDMMigrator__resetManagedAppRemovability__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_ERROR, "Could not set removability for bundle identifier: %{bundleIdentifier}@, error: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }

}

- (void)_resetManagedAppTapToPayScreenLock
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = (void *)MEMORY[0x24BDBCE70];
  MDMAppManagementFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE60FE0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v6 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_222CB9000, v6, OS_LOG_TYPE_DEFAULT, "Cleaning up managed app tapToPayScreenLock...", v7, 2u);
      }
      objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_25);
    }

  }
}

void __49__MDMMigrator__resetManagedAppTapToPayScreenLock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 buf;
  Class (*v17)(uint64_t);
  void *v18;
  uint64_t *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE60FD8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE60FC8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && objc_msgSend(v7, "BOOLValue"))
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2050000000;
      v9 = (void *)getPRSettingsProviderClass_softClass;
      v15 = getPRSettingsProviderClass_softClass;
      if (!getPRSettingsProviderClass_softClass)
      {
        *(_QWORD *)&buf = MEMORY[0x24BDAC760];
        *((_QWORD *)&buf + 1) = 3221225472;
        v17 = __getPRSettingsProviderClass_block_invoke;
        v18 = &unk_24EB685F0;
        v19 = &v12;
        __getPRSettingsProviderClass_block_invoke((uint64_t)&buf);
        v9 = (void *)v13[3];
      }
      v10 = objc_retainAutorelease(v9);
      _Block_object_dispose(&v12, 8);
      objc_msgSend(v10, "setMDMAppAttribute:withValue:forBundleID:", 0, objc_msgSend(v8, "BOOLValue", v12), v4);
      v11 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_222CB9000, v11, OS_LOG_TYPE_DEBUG, "Called [PRSettingsProvider setMDMAppAttribute] enabled=%@", (uint8_t *)&buf, 0xCu);
      }
    }

  }
}

- (void)_updateUserEnrollmentToUseRMAccount
{
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  uint8_t *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  __int16 v28;
  __int16 v29;
  uint8_t v30[16];
  uint8_t v31[16];
  uint8_t v32[2];
  __int16 v33;
  uint8_t buf[16];

  v3 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v3, OS_LOG_TYPE_DEFAULT, "MDM migration: beginning update of user enrollment to use RMAccount.", buf, 2u);
  }
  if (objc_msgSend(MEMORY[0x24BE2A820], "isSharediPad"))
  {
    v4 = *(NSObject **)DMCLogObjects();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      return;
    v33 = 0;
    v5 = "MDM migration: ending update of user enrollment: not required on Shared iPad.";
    v6 = (uint8_t *)&v33;
LABEL_13:
    _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    return;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MDMFilePath();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v8, 0);

  if ((v9 & 1) == 0)
  {
    v4 = *(NSObject **)DMCLogObjects();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)v32 = 0;
    v5 = "MDM migration: ending update of user enrollment: no MDM enrollment present.";
    v6 = v32;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isUserEnrollment"))
  {
    objc_msgSend(v10, "rmAccountID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(NSObject **)DMCLogObjects();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (!v11)
    {
      if (v13)
      {
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_222CB9000, v12, OS_LOG_TYPE_DEFAULT, "MDM migration: upgrading user enrollment to add an RMAccount", v31, 2u);
      }
      objc_msgSend(v10, "personaID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE2A7A0], "managedAppleIDNameWithPersonaID:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "memberQueueManagingProfileIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dmc_iCloudAccountWithUsername:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "accountDescription");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      if (v23)
        v25 = (void *)v23;
      else
        v25 = v19;
      v26 = v25;

      -[MDMMigrator _createRMAccountWithPersonaID:managedAppleID:profileIdentifier:organizationName:](self, "_createRMAccountWithPersonaID:managedAppleID:profileIdentifier:organizationName:", v18, v19, v20, v26);
      v27 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v30 = 0;
        _os_log_impl(&dword_222CB9000, v27, OS_LOG_TYPE_DEFAULT, "MDM migration: ending update of user enrollment: upgrade complete.", v30, 2u);
      }

      goto LABEL_25;
    }
    if (v13)
    {
      v29 = 0;
      v14 = "MDM migration: ending update of user enrollment: no need to upgrade.";
      v15 = (uint8_t *)&v29;
      v16 = v12;
LABEL_16:
      _os_log_impl(&dword_222CB9000, v16, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
    }
  }
  else
  {
    v17 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 0;
      v14 = "MDM migration: ending update of user enrollment: no MDM user enrollment present.";
      v15 = (uint8_t *)&v28;
      v16 = v17;
      goto LABEL_16;
    }
  }
LABEL_25:

}

- (void)_createRMAccountWithPersonaID:(id)a3 managedAppleID:(id)a4 profileIdentifier:(id)a5 organizationName:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, int, int, id);
  void *v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__4;
  v36 = __Block_byref_object_dispose__4;
  v37 = 0;
  v13 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE2A4D8], "enrollmentFlowController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = __95__MDMMigrator__createRMAccountWithPersonaID_managedAppleID_profileIdentifier_organizationName___block_invoke;
  v29 = &unk_24EB685C8;
  v31 = &v32;
  v15 = v13;
  v30 = v15;
  objc_msgSend(v14, "updateMDMUserEnrollmentWithManagedAppleID:profileIdentifier:organizationName:personaID:completionHandler:", v10, v11, v12, v9, &v26);
  objc_msgSend(v15, "waitForCompletion", v26, v27, v28, v29);
  if (v33[5])
  {
    v16 = *(id *)DMCLogObjects();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v33[5], "DMCVerboseDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v17;
      _os_log_impl(&dword_222CB9000, v16, OS_LOG_TYPE_ERROR, "Failed to create RMAccount: %{public}@", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dmc_remoteManagementAccountForManagementProfileIdentifier:", v11);
    v16 = objc_claimAutoreleasedReturnValue();

    -[NSObject identifier](v16, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)MEMORY[0x24BDBCED8];
      MDMFilePath();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dictionaryWithContentsOfFile:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE613B8]);
        MDMFilePath();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "DMCWriteToBinaryFile:", v23);

        objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "refreshDetailsFromDisk");

      }
      v25 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v39 = v19;
        _os_log_impl(&dword_222CB9000, v25, OS_LOG_TYPE_DEBUG, "Created RMAccount: %{public}@", buf, 0xCu);
      }

    }
  }

  _Block_object_dispose(&v32, 8);
}

void __95__MDMMigrator__createRMAccountWithPersonaID_managedAppleID_profileIdentifier_organizationName___block_invoke(uint64_t a1, int a2, int a3, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v6 = obj;
  objc_msgSend(*(id *)(a1 + 32), "complete");

}

- (void)_updateToMDMPropertiesForDDMActiveState
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("RMDMActive"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = objc_msgSend(v3, "BOOLValue");
    v5 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = (void *)MEMORY[0x24BDD16E0];
      v7 = v5;
      objc_msgSend(v6, "numberWithBool:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v8;
      _os_log_impl(&dword_222CB9000, v7, OS_LOG_TYPE_DEBUG, "MDM migration: Got old DDM active state: %{public}@", (uint8_t *)&v14, 0xCu);

    }
    if ((_DWORD)v4)
    {
      objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v9, "setPropertyForKey:value:channelType:", CFSTR("RMDMActive"), MEMORY[0x24BDBD1C8], 0);
      v11 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_222CB9000, v11, OS_LOG_TYPE_DEBUG, "MDM migration: Wrote new DDM active state", (uint8_t *)&v14, 2u);
      }

    }
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", CFSTR("RMDMActive"));

  }
  else
  {
    v13 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_222CB9000, v13, OS_LOG_TYPE_DEBUG, "MDM migration: No DDM active state", (uint8_t *)&v14, 2u);
    }
  }

}

@end
