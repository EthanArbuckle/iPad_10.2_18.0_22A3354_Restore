@implementation CalDatabasePerformMigrationIfNeeded

void __CalDatabasePerformMigrationIfNeeded_block_invoke()
{
  void *v0;
  char v1;
  NSObject *v2;
  void *v3;
  __CFString *IfNeeded;
  void *v5;
  id v6;
  int v7;
  int v8;
  id v9;
  int v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint32_t v15;
  const unsigned __int8 *v16;
  void *v17;
  uint64_t v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  uint64_t v29;
  const os_unfair_lock *Context;
  uint64_t Database;
  const os_unfair_lock *v32;
  uint64_t v33;
  const os_unfair_lock *v34;
  int v35;
  int v36;
  int v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  id v52;
  __CFString *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  void *v58;
  void *v59;
  void *v60;
  int shouldMigrateChinaTimezones;
  unsigned int IntegerProperty;
  int v63;
  uint64_t v64;
  NSObject *v65;
  void *v66;
  NSObject *v67;
  _BOOL4 v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t m;
  void *v74;
  NSObject *v75;
  void *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  const os_unfair_lock *v84;
  uint64_t v85;
  const os_unfair_lock *v86;
  uint64_t v87;
  const os_unfair_lock *v88;
  int v89;
  void *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  NSObject *v96;
  const char *v97;
  uint64_t v98;
  uint32_t v99;
  uint64_t v100;
  uint64_t v101;
  NSObject *v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  int v111;
  NSObject *v112;
  int v113;
  NSObject *v114;
  _BOOL4 v115;
  void *v116;
  objc_class *v117;
  void *v118;
  NSObject *v119;
  NSObject *v120;
  NSObject *v121;
  uint64_t v122;
  const char *v123;
  NSObject *v124;
  os_log_type_t v125;
  void *v126;
  NSObject *v127;
  void *v128;
  os_unfair_lock_t lock;
  uint64_t cf;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  uint8_t v135[16];
  sqlite3_stmt *ppStmt[2];
  __int128 v137;
  __int128 v138;
  __int128 v139;
  uint8_t buf[16];
  Class (*v141)(uint64_t);
  void *v142;
  uint8_t *v143;
  uint8_t v144[32];
  __int128 v145;
  __int128 v146;
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  +[CDBPreferences sharedReadWrite](CDBPreferences, "sharedReadWrite");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "get_migrationAttempts") <= 2)
  {

    goto LABEL_40;
  }
  v1 = objc_msgSend(v0, "get_allowUnlimitedMigrationAttempts");

  if ((v1 & 1) != 0)
    goto LABEL_40;
  v2 = CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = 3;
    _os_log_impl(&dword_1A5CCB000, v2, OS_LOG_TYPE_FAULT, "Migration has failed to complete %i consecutive times; deleting database and starting over.",
      buf,
      8u);
  }
  +[CDBPreferences sharedReadWrite](CDBPreferences, "sharedReadWrite");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IfNeeded = CalDatabaseCopyDirectoryPathForDatabaseCreateIfNeeded(0, 1);
  -[__CFString stringByAppendingPathComponent:](IfNeeded, "stringByAppendingPathComponent:", *MEMORY[0x1E0D0C470]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  v6 = objc_retainAutorelease(v5);
  v7 = sqlite3_open_v2((const char *)objc_msgSend(v6, "fileSystemRepresentation"), (sqlite3 **)buf, 1, 0);
  if (v7 || !*(_QWORD *)buf)
  {
    v21 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
    {
      LODWORD(ppStmt[0]) = 67109120;
      HIDWORD(ppStmt[0]) = v7;
      _os_log_impl(&dword_1A5CCB000, v21, OS_LOG_TYPE_ERROR, "Error opening database that couldn't be migrated to search for related databases. (%i)", (uint8_t *)ppStmt, 8u);
    }
    goto LABEL_31;
  }
  ppStmt[0] = 0;
  v8 = sqlite3_prepare_v2(*(sqlite3 **)buf, "SELECT path FROM AuxDatabase", -1, ppStmt, 0);
  if (v8 || !ppStmt[0])
  {
    v22 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v144 = 67109120;
      *(_DWORD *)&v144[4] = v8;
      _os_log_impl(&dword_1A5CCB000, v22, OS_LOG_TYPE_ERROR, "Error compiling statement to find aux database paths. (%i)", v144, 8u);
    }
    sqlite3_close(*(sqlite3 **)buf);
LABEL_31:
    v9 = 0;
    goto LABEL_32;
  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  while (1)
  {
    v10 = sqlite3_step(ppStmt[0]);
    v11 = v10;
    if (v10 != 100)
      break;
    v16 = sqlite3_column_text(ppStmt[0], 0);
    if (v16
      && (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v16),
          (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v9, "addObject:", v17);

    }
    else
    {
      v18 = CDBLogHandle;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v144 = 0;
        v13 = v18;
        v14 = "Invalid cstring returned by sqlite3_column_text loading aux database paths";
        v15 = 2;
        goto LABEL_21;
      }
    }
LABEL_22:
    if (v11 != 100)
      goto LABEL_23;
  }
  if (v10 && v10 != 101)
  {
    v12 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v144 = 67109120;
      *(_DWORD *)&v144[4] = v11;
      v13 = v12;
      v14 = "Error stepping. (%i)";
      v15 = 8;
LABEL_21:
      _os_log_impl(&dword_1A5CCB000, v13, OS_LOG_TYPE_ERROR, v14, v144, v15);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
LABEL_23:
  sqlite3_finalize(ppStmt[0]);
  v19 = sqlite3_close(*(sqlite3 **)buf);
  if (v19)
  {
    v20 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v144 = 67109120;
      *(_DWORD *)&v144[4] = v19;
      _os_log_impl(&dword_1A5CCB000, v20, OS_LOG_TYPE_ERROR, "Error closing database: %i", v144, 8u);
    }
  }
LABEL_32:
  _CalDatabaseDeleteDatabaseBecauseOfExcessiveFailedMigrationAttempts(IfNeeded);
  v138 = 0u;
  v139 = 0u;
  *(_OWORD *)ppStmt = 0u;
  v137 = 0u;
  v23 = v9;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", ppStmt, buf, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v137;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v137 != v25)
          objc_enumerationMutation(v23);
        _CalDatabaseDeleteDatabaseBecauseOfExcessiveFailedMigrationAttempts(*((void **)ppStmt[1] + i));
      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", ppStmt, buf, 16);
    }
    while (v24);
  }

  objc_msgSend(v3, "set_migrationAttempts:", 0);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0C230]), "initWithType:subtype:context:", CFSTR("Database"), CFSTR("MigrationFailure"), CFSTR("General"));
  objc_msgSend(v27, "setIgnoreRateLimiting:", 1);
  objc_msgSend(v27, "report");

LABEL_40:
  +[CDBPreferences sharedReadWrite](CDBPreferences, "sharedReadWrite");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "set_migrationAttempts:", objc_msgSend(v28, "get_migrationAttempts") + 1);

  v128 = (void *)os_transaction_create();
  v29 = CalDatabaseCreateWithOptionsAndDatabaseDirectoryURL(204, 0);
  os_unfair_lock_lock((os_unfair_lock_t)(v29 + 80));
  if (CDBLockingAssertionsEnabled)
  {
    if (*(_QWORD *)(v29 + 24))
    {
      Context = (const os_unfair_lock *)CPRecordStoreGetContext();
      if (Context)
        os_unfair_lock_assert_owner(Context + 20);
    }
  }
  Database = CPRecordStoreGetDatabase();
  if (CDBLockingAssertionsEnabled)
  {
    if (Database)
    {
      if (*(_QWORD *)(Database + 104))
      {
        v32 = (const os_unfair_lock *)CPRecordStoreGetContext();
        if (v32)
          os_unfair_lock_assert_owner(v32 + 20);
      }
    }
  }
  v33 = CPSqliteDatabaseConnectionForReading();
  if (CDBLockingAssertionsEnabled)
  {
    if (v33)
    {
      if (*(_QWORD *)v33)
      {
        if (*(_QWORD *)(*(_QWORD *)v33 + 104))
        {
          v34 = (const os_unfair_lock *)CPRecordStoreGetContext();
          if (v34)
            os_unfair_lock_assert_owner(v34 + 20);
        }
      }
    }
  }
  v35 = CPSqliteConnectionDatabaseVersion();
  if (v35 < 18010
    || !_CalDatabaseGetIntegerProperty(v29)
    || (v36 = _CalDatabaseTargetBirthdayMigrationState(),
        ((v36 ^ (_CalDatabaseGetIntegerProperty(v29) != 0)) & 1) != 0))
  {
    v37 = 1;
    goto LABEL_59;
  }
  if (v35 == 18010)
  {
    v76 = (void *)_CalDatabaseCopyAllAuxDatabases(v29);
    v138 = 0u;
    v139 = 0u;
    *(_OWORD *)ppStmt = 0u;
    v137 = 0u;
    v77 = v76;
    v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", ppStmt, buf, 16, v128);
    if (v78)
    {
      v79 = *(_QWORD *)v137;
LABEL_115:
      v80 = 0;
      while (1)
      {
        if (*(_QWORD *)v137 != v79)
          objc_enumerationMutation(v77);
        v81 = *((_QWORD *)ppStmt[1] + v80);
        _CalAuxDatabaseGetPath(v81);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = CalDatabaseCreateWithOptionsAndDatabaseDirectory(4300, (uint64_t)v82);
        if (v83)
          goto LABEL_119;
        _CalColorGetData(v81);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = CDBLogHandle;
        if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v144 = 138543618;
          *(_QWORD *)&v144[4] = v90;
          *(_WORD *)&v144[12] = 2114;
          *(_QWORD *)&v144[14] = v82;
          _os_log_impl(&dword_1A5CCB000, v91, OS_LOG_TYPE_DEFAULT, "Didn't find aux DB for persona %{public}@ at path %{public}@. Getting current path for persona", v144, 0x16u);
        }
        objc_msgSend(*(id *)(v29 + 288), "containerInfoForPersonaIdentifier:", v90);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "containerURL");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = v93;
        if (v92)
        {
          if (v93)
          {
            v83 = CalDatabaseCreateWithOptionsAndDatabaseDirectoryURL(4300, v93);
            if (v83)
            {

LABEL_119:
              os_unfair_lock_lock((os_unfair_lock_t)(v83 + 80));
              if (CDBLockingAssertionsEnabled)
              {
                if (*(_QWORD *)(v83 + 24))
                {
                  v84 = (const os_unfair_lock *)CPRecordStoreGetContext();
                  if (v84)
                    os_unfair_lock_assert_owner(v84 + 20);
                }
              }
              v85 = CPRecordStoreGetDatabase();
              if (CDBLockingAssertionsEnabled)
              {
                if (v85)
                {
                  if (*(_QWORD *)(v85 + 104))
                  {
                    v86 = (const os_unfair_lock *)CPRecordStoreGetContext();
                    if (v86)
                      os_unfair_lock_assert_owner(v86 + 20);
                  }
                }
              }
              v87 = CPSqliteDatabaseConnectionForReading();
              if (CDBLockingAssertionsEnabled)
              {
                if (v87)
                {
                  if (*(_QWORD *)v87)
                  {
                    if (*(_QWORD *)(*(_QWORD *)v87 + 104))
                    {
                      v88 = (const os_unfair_lock *)CPRecordStoreGetContext();
                      if (v88)
                        os_unfair_lock_assert_owner(v88 + 20);
                    }
                  }
                }
              }
              v89 = CPSqliteConnectionDatabaseVersion();
              if (v89 <= 18009)
              {
                v127 = CDBLogHandle;
                if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v144 = 67109376;
                  *(_DWORD *)&v144[4] = 18010;
                  *(_WORD *)&v144[8] = 1024;
                  *(_DWORD *)&v144[10] = v89;
                  _os_log_impl(&dword_1A5CCB000, v127, OS_LOG_TYPE_ERROR, "Main database schema is up-to-date (%i), but aux database schema is out-of-date. (%i)", v144, 0xEu);
                }
                CalDatabaseUnlockForThread((const os_unfair_lock *)v83);
                CFRelease((CFTypeRef)v83);

                v37 = 1;
                goto LABEL_199;
              }
              CalDatabaseUnlockForThread((const os_unfair_lock *)v83);
              CFRelease((CFTypeRef)v83);
              goto LABEL_149;
            }
            v100 = CDBLogHandle;
            if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v144 = 138543618;
              *(_QWORD *)&v144[4] = v90;
              *(_WORD *)&v144[12] = 2114;
              *(_QWORD *)&v144[14] = v94;
              v96 = v100;
              v97 = "Still couldn't open aux DB for persona %{public}@ after looking up current container URL %{public}@";
              v99 = 22;
              goto LABEL_147;
            }
          }
          else
          {
            v98 = CDBLogHandle;
            if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v144 = 138543362;
              *(_QWORD *)&v144[4] = v90;
              v96 = v98;
              v97 = "No container for persona %{public}@";
              goto LABEL_146;
            }
          }
        }
        else
        {
          v95 = CDBLogHandle;
          if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v144 = 138543362;
            *(_QWORD *)&v144[4] = v90;
            v96 = v95;
            v97 = "Couldn't look up persona %{public}@";
LABEL_146:
            v99 = 12;
LABEL_147:
            _os_log_impl(&dword_1A5CCB000, v96, OS_LOG_TYPE_ERROR, v97, v144, v99);
          }
        }

LABEL_149:
        if (v78 == ++v80)
        {
          v101 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", ppStmt, buf, 16);
          v78 = v101;
          if (v101)
            goto LABEL_115;
          break;
        }
      }
    }
    v37 = 0;
LABEL_199:

  }
  else
  {
    v37 = 0;
  }
LABEL_59:
  CalDatabaseUnlockForThread((const os_unfair_lock *)v29);
  CFRelease((CFTypeRef)v29);
  cf = CalDatabaseCreateWithOptionsAndDatabaseDirectoryURL(13, 0);
  os_unfair_lock_lock((os_unfair_lock_t)(cf + 80));
  *(_BYTE *)(cf + 376) = 1;
  CalDatabaseUnlockForThread((const os_unfair_lock *)cf);
  v38 = CDBLogHandle;
  lock = (os_unfair_lock_t)(cf + 80);
  if (v37)
  {
    v39 = (id)CDBLogHandle;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A5CCB000, v39, OS_LOG_TYPE_DEFAULT, "****** [CDB MIGRATION] Migration needed", buf, 2u);
    }

    CalDatabaseSetChangeLoggingEnabled((os_unfair_lock_s *)cf);
    _CalDatabasePerformSchemaMigrationIfNeededOnDatabase((os_unfair_lock_s *)cf);
    objc_msgSend(MEMORY[0x1E0D0C258], "legacyCalendarDataContainer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    CalDatabaseGetCalendarDataContainerProvider(cf);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDBAttachmentMigrator migrateWithLegacyCalendarDataContainer:calendarDataContainerProvider:database:](CDBAttachmentMigrator, "migrateWithLegacyCalendarDataContainer:calendarDataContainerProvider:database:", v40, v41, cf);
    if (_os_feature_enabled_impl())
    {
      os_unfair_lock_lock(lock);
      if (_CalDatabaseGetIntegerProperty(cf) || !_CalDatabaseMigrateToMultipleDatabases(cf))
      {
        if (CDBLockingAssertionsEnabled)
          os_unfair_lock_assert_owner(lock);
        os_unfair_lock_unlock(lock);
      }
      else
      {
        _CalDatabaseSetIntegerProperty(cf, (uint64_t)CFSTR("DataSeparationMigrationCompleted"), 1);
        CalDatabaseSaveWithOptions(cf, 2);
      }
    }

    v42 = (void *)CalDatabaseCopyAllAuxDatabases((os_unfair_lock_s *)cf);
    v43 = (id)CDBLogHandle;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = objc_msgSend(v42, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v44;
      _os_log_impl(&dword_1A5CCB000, v43, OS_LOG_TYPE_DEFAULT, "****** [CDB MIGRATION] %lu aux databases to migrate", buf, 0xCu);
    }

    v133 = 0u;
    v134 = 0u;
    v131 = 0u;
    v132 = 0u;
    v45 = v42;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v131, ppStmt, 16);
    if (v46)
    {
      v47 = *(_QWORD *)v132;
      do
      {
        for (j = 0; j != v46; ++j)
        {
          if (*(_QWORD *)v132 != v47)
            objc_enumerationMutation(v45);
          v49 = (void *)CalAuxDatabaseCopyPath(*(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * j));
          v50 = (id)CDBLogHandle;
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v49;
            _os_log_impl(&dword_1A5CCB000, v50, OS_LOG_TYPE_DEFAULT, "****** [CDB MIGRATION] migrating aux database at %@", buf, 0xCu);
          }

          v51 = CalDatabaseCreateWithOptionsAndDatabaseDirectory(2061, (uint64_t)v49);
          CalDatabaseSetChangeLoggingEnabled((os_unfair_lock_s *)v51);
          os_unfair_lock_lock((os_unfair_lock_t)(v51 + 80));
          *(_BYTE *)(v51 + 376) = 1;
          CalDatabaseUnlockForThread((const os_unfair_lock *)v51);
          *(_DWORD *)(v51 + 172) = CalAuxDatabaseGetUID();
          _CalDatabaseMigrateSchemaCheckIntegrityAndCleanUp(v51);
          CFRelease((CFTypeRef)v51);

        }
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v131, ppStmt, 16);
      }
      while (v46);
    }

    v52 = v45;
    if (os_variant_has_internal_diagnostics())
    {
      v53 = CalDatabaseCopyDirectoryPathForDatabaseCreateIfNeeded(0, 1);
      _CalDatabaseCleanUpMovedAsideDatabaseFilesInDirectory(v53);
      v145 = 0u;
      v146 = 0u;
      memset(v144, 0, sizeof(v144));
      v54 = v52;
      v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", v144, buf, 16);
      if (v55)
      {
        v56 = **(_QWORD **)&v144[16];
        do
        {
          for (k = 0; k != v55; ++k)
          {
            if (**(_QWORD **)&v144[16] != v56)
              objc_enumerationMutation(v54);
            v58 = (void *)CalAuxDatabaseCopyPath(*(_QWORD *)(*(_QWORD *)&v144[8] + 8 * k));
            _CalDatabaseCleanUpMovedAsideDatabaseFilesInDirectory(v58);

          }
          v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", v144, buf, 16);
        }
        while (v55);
      }

    }
  }
  else if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A5CCB000, v38, OS_LOG_TYPE_DEFAULT, "****** [CDB MIGRATION] Migration not needed", buf, 2u);
  }
  CalDatabaseGetPreferences(cf);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "preferences");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  shouldMigrateChinaTimezones = _shouldMigrateChinaTimezones(v60);
  _CalDatabasePerformPreferenceMigrationIfNeeded(v60, 0, shouldMigrateChinaTimezones);

  os_unfair_lock_lock(lock);
  IntegerProperty = _CalDatabaseGetIntegerProperty(cf);
  if (CDBLockingAssertionsEnabled)
    os_unfair_lock_assert_owner(lock);
  v63 = IntegerProperty != 0;
  os_unfair_lock_unlock(lock);
  v64 = _CalDatabaseTargetBirthdayMigrationState();
  if (v63 != (_DWORD)v64)
  {
    v65 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v63;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v64;
      _os_log_impl(&dword_1A5CCB000, v65, OS_LOG_TYPE_DEFAULT, "Need to migrate birthdays: current version %{BOOL}i target version %{BOOL}i", buf, 0xEu);
    }
    if ((v64 & 1) != 0)
    {
      v66 = (void *)CalDatabaseCopyBirthdayCalendar((os_unfair_lock_s *)cf, 0);
      v67 = CDBLogHandle;
      v68 = os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEFAULT);
      if (v66)
      {
        if (v68)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A5CCB000, v67, OS_LOG_TYPE_DEFAULT, "Deleting old birthday calendar", buf, 2u);
        }
        CalRemoveCalendar(v66);
      }
      else if (v68)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A5CCB000, v67, OS_LOG_TYPE_DEFAULT, "Migration did nothing because no old birthday calendar found", buf, 2u);
      }
    }
    else
    {
      v69 = (void *)CalDatabaseCopyOfAllStores((os_unfair_lock_s *)cf);
      v145 = 0u;
      v146 = 0u;
      memset(v144, 0, sizeof(v144));
      v70 = v69;
      v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", v144, buf, 16);
      if (v71)
      {
        v72 = **(_QWORD **)&v144[16];
        while (2)
        {
          for (m = 0; m != v71; ++m)
          {
            if (**(_QWORD **)&v144[16] != v72)
              objc_enumerationMutation(v70);
            v74 = (void *)CalStoreCopyAppGroupIdentifier(*(_QWORD *)(*(_QWORD *)&v144[8] + 8 * m));
            if (objc_msgSend(v74, "isEqualToString:", CFSTR("com.apple.contacts.ContactsCalendars")))
            {
              v102 = CDBLogHandle;
              if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v135 = 0;
                _os_log_impl(&dword_1A5CCB000, v102, OS_LOG_TYPE_DEFAULT, "Deleting ContactsCalendars store", v135, 2u);
              }
              CalRemoveStore();

              goto LABEL_158;
            }

          }
          v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", v144, buf, 16);
          if (v71)
            continue;
          break;
        }
      }

      v75 = CDBLogHandle;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v135 = 0;
        _os_log_impl(&dword_1A5CCB000, v75, OS_LOG_TYPE_DEFAULT, "Migration did nothing because the contacts store wasn't found.", v135, 2u);
      }
LABEL_158:

    }
    CalDatabaseSetIntegerProperty((os_unfair_lock_s *)cf, (uint64_t)CFSTR("BirthdayMigrationState"), v64);
    CalDatabaseSaveWithOptions(cf, 0);
  }
  CalDatabaseCleanupStoresWithoutIdentifiers((os_unfair_lock_s *)cf);
  if (!CalendarMigrationLibraryCore_frameworkLibrary)
  {
    *(_OWORD *)buf = xmmword_1E4F84058;
    v141 = 0;
    CalendarMigrationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (CalendarMigrationLibraryCore_frameworkLibrary)
  {
    *(_QWORD *)v144 = 0;
    *(_QWORD *)&v144[8] = v144;
    *(_QWORD *)&v144[16] = 0x2050000000;
    v103 = (void *)getCalDefaultReminderKitProviderClass_softClass;
    *(_QWORD *)&v144[24] = getCalDefaultReminderKitProviderClass_softClass;
    if (!getCalDefaultReminderKitProviderClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      v141 = __getCalDefaultReminderKitProviderClass_block_invoke;
      v142 = &unk_1E4F84078;
      v143 = v144;
      __getCalDefaultReminderKitProviderClass_block_invoke((uint64_t)buf);
      v103 = *(void **)(*(_QWORD *)&v144[8] + 24);
    }
    v104 = objc_retainAutorelease(v103);
    _Block_object_dispose(v144, 8);
    objc_msgSend(v104, "sharedInstance");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v105, "reminderKitAvailable") & 1) != 0)
    {
      *(_QWORD *)v144 = 0;
      *(_QWORD *)&v144[8] = v144;
      *(_QWORD *)&v144[16] = 0x2050000000;
      v106 = (void *)getCalDefaultReminderMigrationDefaultsProviderClass_softClass;
      *(_QWORD *)&v144[24] = getCalDefaultReminderMigrationDefaultsProviderClass_softClass;
      if (!getCalDefaultReminderMigrationDefaultsProviderClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        v141 = __getCalDefaultReminderMigrationDefaultsProviderClass_block_invoke;
        v142 = &unk_1E4F84078;
        v143 = v144;
        __getCalDefaultReminderMigrationDefaultsProviderClass_block_invoke((uint64_t)buf);
        v106 = *(void **)(*(_QWORD *)&v144[8] + 24);
      }
      v107 = objc_retainAutorelease(v106);
      _Block_object_dispose(v144, 8);
      objc_msgSend(v107, "sharedInstance");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = (void *)objc_msgSend(v105, "newDatabaseMigrationContext");
      v110 = v109;
      if (v109)
      {
        v111 = objc_msgSend(v109, "shouldPerformMigration");
        v112 = CDBLogHandle;
        if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v111;
          _os_log_impl(&dword_1A5CCB000, v112, OS_LOG_TYPE_DEFAULT, "ReminderKit wants migration = %d", buf, 8u);
        }
        v113 = objc_msgSend(v108, "havePerformedReminderMigrationCleanup", v128);
        v114 = CDBLogHandle;
        if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v113 ^ 1;
          _os_log_impl(&dword_1A5CCB000, v114, OS_LOG_TYPE_DEFAULT, "Needs reminder migration cleanup = %d", buf, 8u);
          v114 = CDBLogHandle;
        }
        v115 = os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT);
        if ((v111 | v113 ^ 1) == 1)
        {
          if (v115)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A5CCB000, v114, OS_LOG_TYPE_DEFAULT, "****** [CDB MIGRATION] Performing reminders migration", buf, 2u);
          }
          *(_QWORD *)v144 = 0;
          *(_QWORD *)&v144[8] = v144;
          *(_QWORD *)&v144[16] = 0x2050000000;
          v116 = (void *)getCalCalendarDatabaseReminderMigratorClass_softClass;
          *(_QWORD *)&v144[24] = getCalCalendarDatabaseReminderMigratorClass_softClass;
          if (!getCalCalendarDatabaseReminderMigratorClass_softClass)
          {
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3221225472;
            v141 = __getCalCalendarDatabaseReminderMigratorClass_block_invoke;
            v142 = &unk_1E4F84078;
            v143 = v144;
            __getCalCalendarDatabaseReminderMigratorClass_block_invoke((uint64_t)buf);
            v116 = *(void **)(*(_QWORD *)&v144[8] + 24);
          }
          v117 = objc_retainAutorelease(v116);
          _Block_object_dispose(v144, 8);
          v118 = (void *)objc_msgSend([v117 alloc], "initWithReminderKitProvider:defaultsProvider:", v105, v108);
          objc_msgSend(v118, "attemptMigrationWithCalendarDatabase:", cf);
          v119 = CDBLogHandle;
          if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A5CCB000, v119, OS_LOG_TYPE_DEFAULT, "****** [CDB MIGRATION] Finished reminders migration", buf, 2u);
          }

          goto LABEL_191;
        }
        if (v115)
        {
          *(_WORD *)buf = 0;
          v123 = "Skipping reminders migration because it is not needed";
          v124 = v114;
          v125 = OS_LOG_TYPE_DEFAULT;
          goto LABEL_190;
        }
      }
      else
      {
        v122 = CDBLogHandle;
        if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v123 = "Failed to get a CalReminderKitDatabaseMigrationContext. Skipping reminders migration";
          v124 = v122;
          v125 = OS_LOG_TYPE_ERROR;
LABEL_190:
          _os_log_impl(&dword_1A5CCB000, v124, v125, v123, buf, 2u);
        }
      }
LABEL_191:

      goto LABEL_192;
    }
    v121 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A5CCB000, v121, OS_LOG_TYPE_ERROR, "Skipping reminders migration because ReminderKit.framework is not available", buf, 2u);
    }

  }
  else
  {
    v120 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A5CCB000, v120, OS_LOG_TYPE_ERROR, "Skipping reminders migration because CalendarMigration.framework is not available", buf, 2u);
    }
  }
LABEL_192:
  CFRelease((CFTypeRef)cf);
  CalDatabaseDeleteFile(CFSTR("/var/mobile/Library/Calendar/Notifications.db"));
  CalDatabaseDeleteFile(CFSTR("/var/mobile/Library/Calendar/Notifications.db-wal"));
  CalDatabaseDeleteFile(CFSTR("/var/mobile/Library/Calendar/Notifications.db-shm"));

  +[CDBPreferences sharedReadWrite](CDBPreferences, "sharedReadWrite");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "set_migrationAttempts:", 0);

}

@end
