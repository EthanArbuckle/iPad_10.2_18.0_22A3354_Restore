@implementation MCMMigrationStatus

- (id)initForSystemMigration
{
  MCMMigrationStatus *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSURL *migrationFileURL;
  uint64_t v10;
  NSMutableDictionary *migrationInfo;
  id v12;
  int v13;
  id v14;
  int v15;
  NSObject *v16;
  const char *v17;
  MCMMigrationStatus *v18;
  void *v19;
  id v20;
  int v21;
  objc_super v23;
  uint8_t buf[8];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)MCMMigrationStatus;
  v2 = -[MCMMigrationStatus init](&v23, sel_init);
  if (!v2)
  {
LABEL_19:
    v18 = v2;
    goto LABEL_20;
  }
  v3 = containermanager_copy_global_configuration();
  objc_msgSend(v3, "managedPathRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containermanagerLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    container_log_handle_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v17 = "Failed to get library url.";
LABEL_22:
    _os_log_error_impl(&dword_1CF807000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_11;
  }
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("mcm_migration_status.plist"), 0);
  v8 = objc_claimAutoreleasedReturnValue();
  migrationFileURL = v2->_migrationFileURL;
  v2->_migrationFileURL = (NSURL *)v8;

  -[MCMMigrationStatus _readMigrationStatusFromDisk](v2, "_readMigrationStatusFromDisk");
  v10 = objc_claimAutoreleasedReturnValue();
  migrationInfo = v2->_migrationInfo;
  v2->_migrationInfo = (NSMutableDictionary *)v10;

  if (v2->_migrationInfo)
  {
    v12 = containermanager_copy_global_configuration();
    v13 = objc_msgSend(v12, "runmode");

    if (v13)
    {
      v14 = containermanager_copy_global_configuration();
      v15 = objc_msgSend(v14, "runmode");

      if (v15 == 2)
      {
        if (!-[NSMutableDictionary count](v2->_migrationInfo, "count"))
          -[MCMMigrationStatus _consolidateUserDaemonMigrationStatusWithLibraryURL:](v2, "_consolidateUserDaemonMigrationStatusWithLibraryURL:", v7);
      }
      else
      {
        v20 = containermanager_copy_global_configuration();
        v21 = objc_msgSend(v20, "runmode");

        if (v21 == 1 && !-[NSMutableDictionary count](v2->_migrationInfo, "count"))
          -[MCMMigrationStatus _consolidateUnifiedDaemonMigrationStatusWithLibraryURL:](v2, "_consolidateUnifiedDaemonMigrationStatusWithLibraryURL:", v7);
      }
    }
    else if (!-[NSMutableDictionary count](v2->_migrationInfo, "count")
           || (-[NSMutableDictionary objectForKeyedSubscript:](v2->_migrationInfo, "objectForKeyedSubscript:", CFSTR("MigrationStatusConsolidation")), v19 = (void *)objc_claimAutoreleasedReturnValue(), v19, !v19))
    {
      -[MCMMigrationStatus _consolidateSystemDaemonMigrationStatusWithLibraryURL:](v2, "_consolidateSystemDaemonMigrationStatusWithLibraryURL:", v7);
      -[MCMMigrationStatus setMigrationCompleteForType:](v2, "setMigrationCompleteForType:", CFSTR("MigrationStatusConsolidation"));
    }

    goto LABEL_19;
  }
  container_log_handle_for_category();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v17 = "Error reading system migration file from disk.  This is bad";
    goto LABEL_22;
  }
LABEL_11:

  v18 = 0;
LABEL_20:

  return v18;
}

- (id)initForMobileUserMigration
{
  MCMMigrationStatus *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSURL *migrationFileURL;
  uint64_t v10;
  NSMutableDictionary *migrationInfo;
  MCMMigrationStatus *v12;
  NSObject *v13;
  const char *v14;
  objc_super v16;
  uint8_t buf[8];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)MCMMigrationStatus;
  v2 = -[MCMMigrationStatus init](&v16, sel_init);
  if (!v2)
    goto LABEL_5;
  +[MCMUserIdentitySharedCache sharedInstance](MCMUserIdentitySharedCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedUserPathRegistryForUserIdentity:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containermanagerUserLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    container_log_handle_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v12 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v14 = "Failed to get library url.";
LABEL_12:
    _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
    goto LABEL_9;
  }
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("mcm_user_migration_status.plist"), 0);
  v8 = objc_claimAutoreleasedReturnValue();
  migrationFileURL = v2->_migrationFileURL;
  v2->_migrationFileURL = (NSURL *)v8;

  -[MCMMigrationStatus _readMigrationStatusFromDisk](v2, "_readMigrationStatusFromDisk");
  v10 = objc_claimAutoreleasedReturnValue();
  migrationInfo = v2->_migrationInfo;
  v2->_migrationInfo = (NSMutableDictionary *)v10;

  if (!v2->_migrationInfo)
  {
    container_log_handle_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v14 = "Error reading user migration file from disk.  This is bad";
    goto LABEL_12;
  }

LABEL_5:
  v12 = v2;
LABEL_10:

  return v12;
}

- (MCMMigrationStatus)init
{
  return (MCMMigrationStatus *)-[MCMMigrationStatus initForSystemMigration](self, "initForSystemMigration");
}

- (void)_consolidateSystemDaemonMigrationStatusWithLibraryURL:(id)a3
{
  id v4;
  NSObject *v5;
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
  int v20;
  uint8_t v21[8];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  container_log_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1CF807000, v5, OS_LOG_TYPE_DEFAULT, "Consolidating system session daemon migration status", v21, 2u);
  }

  objc_msgSend(v4, "URLByDeletingLastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("mcm_migration_status.plist"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMMigrationStatus _readMigrationStatusFromDiskAtURL:](self, "_readMigrationStatusFromDiskAtURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMMigrationStatus migrationInfo](self, "migrationInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BundleMigration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if (!v10)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BundleMigration"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BundleMigration"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMMigrationStatus migrationInfo](self, "migrationInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("BundleMigration"));

      v11 = 0;
    }
    else
    {
      -[MCMMigrationStatus _readStatusFromMarkerFileWithName:andSetAsType:libraryURL:](self, "_readStatusFromMarkerFileWithName:andSetAsType:libraryURL:", CFSTR("mcm_bundle_migration_complete.plist"), CFSTR("BundleMigration"), v6);
      v11 = 1;
    }
  }
  -[MCMMigrationStatus migrationInfo](self, "migrationInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ACLMigration"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    goto LABEL_10;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ACLMigration"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ACLMigration"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMMigrationStatus migrationInfo](self, "migrationInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("ACLMigration"));

LABEL_10:
    v20 = 0;
    goto LABEL_11;
  }
  -[MCMMigrationStatus _readStatusFromMarkerFileWithName:andSetAsType:libraryURL:](self, "_readStatusFromMarkerFileWithName:andSetAsType:libraryURL:", CFSTR("mcm_acl2_migration_complete.plist"), CFSTR("ACLMigration"), v6);
  v20 = 1;
LABEL_11:
  if (-[MCMMigrationStatus _writeMigrationStatusToDisk](self, "_writeMigrationStatusToDisk"))
  {
    if (v11)
      -[MCMMigrationStatus _removeMarkerFileWithName:libraryURL:](self, "_removeMarkerFileWithName:libraryURL:", CFSTR("mcm_bundle_migration_complete.plist"), v6);
    if (v20)
      -[MCMMigrationStatus _removeMarkerFileWithName:libraryURL:](self, "_removeMarkerFileWithName:libraryURL:", CFSTR("mcm_acl2_migration_complete.plist"), v6);
  }

}

- (void)_consolidateUserDaemonMigrationStatusWithLibraryURL:(id)a3
{
  -[MCMMigrationStatus _consolidateForUserDaemonFromManyMarkerFilesToOneWithLibraryURL:](self, "_consolidateForUserDaemonFromManyMarkerFilesToOneWithLibraryURL:", a3);
}

- (void)_consolidateUnifiedDaemonMigrationStatusWithLibraryURL:(id)a3
{
  -[MCMMigrationStatus _consolidateForUnifiedDaemonFromManyMarkerFilesToOneWithLibraryURL:](self, "_consolidateForUnifiedDaemonFromManyMarkerFilesToOneWithLibraryURL:", a3);
}

- (void)_consolidateForUserDaemonFromManyMarkerFilesToOneWithLibraryURL:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[8];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  container_log_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CF807000, v5, OS_LOG_TYPE_DEFAULT, "Migrating from many marker files down to one", v6, 2u);
  }

  -[MCMMigrationStatus _readStatusFromMarkerFileWithName:andSetAsType:libraryURL:](self, "_readStatusFromMarkerFileWithName:andSetAsType:libraryURL:", CFSTR("mcm_group_id_migration_complete.plist"), CFSTR("GroupIdMigration"), v4);
  -[MCMMigrationStatus _readStatusFromMarkerFileWithName:andSetAsType:libraryURL:](self, "_readStatusFromMarkerFileWithName:andSetAsType:libraryURL:", CFSTR("mcm_code_signing_migration_complete.plist"), CFSTR("CodeSigningMigration"), v4);
  if (-[MCMMigrationStatus _writeMigrationStatusToDisk](self, "_writeMigrationStatusToDisk"))
  {
    -[MCMMigrationStatus _removeMarkerFileWithName:libraryURL:](self, "_removeMarkerFileWithName:libraryURL:", CFSTR("mcm_group_id_migration_complete.plist"), v4);
    -[MCMMigrationStatus _removeMarkerFileWithName:libraryURL:](self, "_removeMarkerFileWithName:libraryURL:", CFSTR("mcm_code_signing_migration_complete.plist"), v4);
  }

}

- (void)_consolidateForUnifiedDaemonFromManyMarkerFilesToOneWithLibraryURL:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[8];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  container_log_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CF807000, v5, OS_LOG_TYPE_DEFAULT, "Migrating from many marker files down to one", v6, 2u);
  }

  -[MCMMigrationStatus _readStatusFromMarkerFileWithName:andSetAsType:libraryURL:](self, "_readStatusFromMarkerFileWithName:andSetAsType:libraryURL:", CFSTR("mcm_bundle_migration_complete.plist"), CFSTR("BundleMigration"), v4);
  -[MCMMigrationStatus _readStatusFromMarkerFileWithName:andSetAsType:libraryURL:](self, "_readStatusFromMarkerFileWithName:andSetAsType:libraryURL:", CFSTR("mcm_acl2_migration_complete.plist"), CFSTR("ACLMigration"), v4);
  -[MCMMigrationStatus _readStatusFromMarkerFileWithName:andSetAsType:libraryURL:](self, "_readStatusFromMarkerFileWithName:andSetAsType:libraryURL:", CFSTR("mcm_group_id_migration_complete.plist"), CFSTR("GroupIdMigration"), v4);
  -[MCMMigrationStatus _readStatusFromMarkerFileWithName:andSetAsType:libraryURL:](self, "_readStatusFromMarkerFileWithName:andSetAsType:libraryURL:", CFSTR("mcm_code_signing_migration_complete.plist"), CFSTR("CodeSigningMigration"), v4);
  if (-[MCMMigrationStatus _writeMigrationStatusToDisk](self, "_writeMigrationStatusToDisk"))
  {
    -[MCMMigrationStatus _removeMarkerFileWithName:libraryURL:](self, "_removeMarkerFileWithName:libraryURL:", CFSTR("mcm_bundle_migration_complete.plist"), v4);
    -[MCMMigrationStatus _removeMarkerFileWithName:libraryURL:](self, "_removeMarkerFileWithName:libraryURL:", CFSTR("mcm_acl2_migration_complete.plist"), v4);
    -[MCMMigrationStatus _removeMarkerFileWithName:libraryURL:](self, "_removeMarkerFileWithName:libraryURL:", CFSTR("mcm_group_id_migration_complete.plist"), v4);
    -[MCMMigrationStatus _removeMarkerFileWithName:libraryURL:](self, "_removeMarkerFileWithName:libraryURL:", CFSTR("mcm_code_signing_migration_complete.plist"), v4);
  }

}

- (void)_readStatusFromMarkerFileWithName:(id)a3 andSetAsType:(id)a4 libraryURL:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(a5, "URLByAppendingPathComponent:isDirectory:", a3, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "MCM_dictionaryWithContentsOfURL:options:error:", v9, 0, &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  v12 = v11;
  if (v10)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_migrationInfo, "setObject:forKeyedSubscript:", v10, v8);
  }
  else
  {
    objc_msgSend(v11, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v14 = objc_msgSend(v12, "code");

      if (v14 == 2)
        goto LABEL_10;
    }
    else
    {

    }
    container_log_handle_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v16;
      v20 = 2112;
      v21 = v12;
      _os_log_error_impl(&dword_1CF807000, v15, OS_LOG_TYPE_ERROR, "Failed to read migration marker file at %@ : %@", buf, 0x16u);

    }
  }
LABEL_10:

}

- (void)_removeMarkerFileWithName:(id)a3 libraryURL:(id)a4
{
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "URLByAppendingPathComponent:isDirectory:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v5, "removeItemAtURL:error:", v4, &v10);
  v7 = v10;

  if ((v6 & 1) == 0)
  {
    container_log_handle_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v7;
      _os_log_error_impl(&dword_1CF807000, v8, OS_LOG_TYPE_ERROR, "Failed to remove marker file at %@: %@", buf, 0x16u);

    }
  }

}

- (id)_readMigrationStatusFromDisk
{
  void *v3;
  void *v4;

  -[MCMMigrationStatus migrationFileURL](self, "migrationFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMMigrationStatus _readMigrationStatusFromDiskAtURL:](self, "_readMigrationStatusFromDiskAtURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_readMigrationStatusFromDiskAtURL:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "MCM_dictionaryWithContentsOfURL:options:error:", a3, 0, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  v6 = (void *)objc_msgSend(v4, "mutableCopy");

  if (!v6)
  {
    objc_msgSend(v5, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v8 = objc_msgSend(v5, "code");

      if (v8 == 2)
      {
        v6 = (void *)objc_opt_new();
        goto LABEL_9;
      }
    }
    else
    {

    }
    container_log_handle_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[MCMMigrationStatus migrationFileURL](self, "migrationFileURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v5;
      _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "Failed to read migration status file at %@ : %@", buf, 0x16u);

    }
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (BOOL)_writeMigrationStatusToDisk
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[MCMMigrationStatus migrationFileURL](self, "migrationFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "dataWritingOptionsForFileAtURL:", v3);

  -[MCMMigrationStatus migrationInfo](self, "migrationInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v7 = objc_msgSend(v6, "MCM_writeToURL:withOptions:error:", v3, v5, &v13);
  v8 = v13;

  if ((v7 & 1) == 0)
  {
    container_log_handle_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "currentBuildVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v8;
      _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "Failed to write migration status on %@ for %@ : %@", buf, 0x20u);

    }
  }

  return v7;
}

- (BOOL)hasMigrationOccurredForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCMMigrationStatus migrationInfo](self, "migrationInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (void)setMigrationCompleteForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMMigrationStatus _iso8601DateFormatter](self, "_iso8601DateFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "currentBuildVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = CFSTR("MCMMigrationVersionNumber");
  v17[1] = CFSTR("MCMMigrationTime");
  v18[0] = v8;
  v18[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMMigrationStatus migrationInfo](self, "migrationInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v4);

  if (-[MCMMigrationStatus _writeMigrationStatusToDisk](self, "_writeMigrationStatusToDisk"))
  {
    container_log_handle_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)objc_opt_class(), "currentBuildVersion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v12;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_1CF807000, v11, OS_LOG_TYPE_DEFAULT, "Migration completed on %@ for %@", (uint8_t *)&v13, 0x16u);

    }
  }

}

- (void)writeCurrentBuildInfoToDisk
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)_CFCopySystemVersionDictionary();
  -[MCMMigrationStatus migrationInfo](self, "migrationInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("LastBuildInfo"));

  if (-[MCMMigrationStatus _writeMigrationStatusToDisk](self, "_writeMigrationStatusToDisk"))
  {
    container_log_handle_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)objc_opt_class(), "currentBuildVersion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1CF807000, v5, OS_LOG_TYPE_DEFAULT, "Saved last build version of %@", (uint8_t *)&v7, 0xCu);

    }
  }

}

- (BOOL)isBuildUpgrade
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  char v15;
  int v17;
  NSObject *v18;
  __int16 v19;
  NSObject *v20;
  __int16 v21;
  NSObject *v22;
  __int16 v23;
  NSObject *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[MCMMigrationStatus migrationInfo](self, "migrationInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("LastBuildInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *MEMORY[0x1E0C9AB90];
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB90]);
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      container_log_handle_for_category();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v17) = 0;
        _os_log_error_impl(&dword_1CF807000, v7, OS_LOG_TYPE_ERROR, "Could not get build version from last build info dictionary; assuming this is an upgrade",
          (uint8_t *)&v17,
          2u);
      }
      v15 = 1;
      goto LABEL_26;
    }
    v6 = _CFCopySystemVersionDictionary();
    v7 = v6;
    if (!v6)
    {
      container_log_handle_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v17) = 0;
        _os_log_error_impl(&dword_1CF807000, v8, OS_LOG_TYPE_ERROR, "Could not get current build info; assuming this is an upgrade",
          (uint8_t *)&v17,
          2u);
      }
      v15 = 1;
      goto LABEL_25;
    }
    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      container_log_handle_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v17) = 0;
        _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "Could not get current build string; assuming this is an upgrade",
          (uint8_t *)&v17,
          2u);
      }
      v15 = 1;
      goto LABEL_24;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ReleaseType"));
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("ReleaseType"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[NSObject isEqual:](v5, "isEqual:", v8);
    container_log_handle_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        v17 = 138413058;
        v18 = v8;
        v19 = 2112;
        v20 = v10;
        v21 = 2112;
        v22 = v5;
        v23 = 2112;
        v24 = v9;
        v14 = "Current build version (%@ / %@) equal to last version recorded (%@ / %@); skipping upgrade";
LABEL_22:
        _os_log_impl(&dword_1CF807000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v17, 0x2Au);
      }
    }
    else if (v13)
    {
      v17 = 138413058;
      v18 = v5;
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = v8;
      v23 = 2112;
      v24 = v10;
      v14 = "Detected upgrade from %@ (%@) to %@ (%@)";
      goto LABEL_22;
    }

    v15 = v11 ^ 1;
LABEL_24:

LABEL_25:
LABEL_26:

    goto LABEL_27;
  }
  container_log_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_1CF807000, v5, OS_LOG_TYPE_DEFAULT, "Did not find last build info; we must be upgrading from pre-9.3.1 or upgrading for the first time to a build with "
      "split daemon configuration or this is an erase install.",
      (uint8_t *)&v17,
      2u);
  }
  v15 = 1;
LABEL_27:

  return v15;
}

- (id)_iso8601DateFormatter
{
  if (_iso8601DateFormatter_onceToken != -1)
    dispatch_once(&_iso8601DateFormatter_onceToken, &__block_literal_global_42);
  return (id)_iso8601DateFormatter_dateFormatter;
}

- (NSMutableDictionary)migrationInfo
{
  return self->_migrationInfo;
}

- (void)setMigrationInfo:(id)a3
{
  objc_storeStrong((id *)&self->_migrationInfo, a3);
}

- (NSURL)migrationFileURL
{
  return self->_migrationFileURL;
}

- (void)setMigrationFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_migrationFileURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationFileURL, 0);
  objc_storeStrong((id *)&self->_migrationInfo, 0);
}

uint64_t __43__MCMMigrationStatus__iso8601DateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_iso8601DateFormatter_dateFormatter;
  _iso8601DateFormatter_dateFormatter = v0;

  return objc_msgSend((id)_iso8601DateFormatter_dateFormatter, "setFormatOptions:", 1907);
}

+ (id)currentBuildVersion
{
  if (currentBuildVersion_onceToken != -1)
    dispatch_once(&currentBuildVersion_onceToken, &__block_literal_global_10524);
  return (id)currentBuildVersion_systemVersionNumber;
}

void __41__MCMMigrationStatus_currentBuildVersion__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)_CFCopySystemVersionDictionary();
  if (v0)
  {
    v2 = v0;
    objc_msgSend(v0, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB90]);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (v1)
      objc_storeStrong((id *)&currentBuildVersion_systemVersionNumber, v1);

    v0 = v2;
  }

}

@end
