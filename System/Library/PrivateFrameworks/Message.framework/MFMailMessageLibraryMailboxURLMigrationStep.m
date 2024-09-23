@implementation MFMailMessageLibraryMailboxURLMigrationStep

- (MFMailMessageLibraryMailboxURLMigrationStep)initWithSQLiteConnection:(id)a3
{
  id v5;
  MFMailMessageLibraryMailboxURLMigrationStep *v6;
  MFMailMessageLibraryMailboxURLMigrationStep *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMailMessageLibraryMailboxURLMigrationStep;
  v6 = -[MFMailMessageLibraryMailboxURLMigrationStep init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sqliteConnection, a3);

  return v7;
}

- (BOOL)performMigrationStep
{
  return -[MFMailMessageLibraryMailboxURLMigrationStep _renameMailboxDataFolders:](self, "_renameMailboxDataFolders:", -[EDPersistenceDatabaseConnection sqlDB](self->_sqliteConnection, "sqlDB"));
}

- (BOOL)_renameMailboxDataFolders:(sqlite3 *)a3
{
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  id v33;
  id obj;
  id v37;
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  NSObject *v44;
  __int16 v45;
  NSObject *v46;
  __int16 v47;
  NSObject *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v33 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  +[MailAccount mailAccounts](MailAccount, "mailAccounts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v40;
    LOBYTE(v5) = 1;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v40 != v4)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v8 = (void *)objc_opt_class();
        objc_msgSend(v7, "uniqueID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "hostname");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "username");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "legacyPathForAccountIdentifier:withHostname:username:", v9, v10, v11);
        v12 = objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v7, "defaultPath");
          v13 = objc_claimAutoreleasedReturnValue();
          MFLogGeneral();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v7, "ef_publicDescription");
            v15 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v44 = v15;
            v45 = 2112;
            v46 = v12;
            v47 = 2112;
            v48 = v13;
            _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_DEFAULT, "#MobileMailMigrator: Start Migrating Mailbox FilePath for Account %{public}@ from %@ to %@...", buf, 0x20u);

          }
          v38 = 1;
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "fileExistsAtPath:isDirectory:", v12, &v38))
          {
            v37 = 0;
            v17 = objc_msgSend(v16, "moveItemAtPath:toPath:error:", v12, v13, &v37);
            v18 = v37;
            if ((v17 & 1) == 0)
            {
              MFLogGeneral();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v18, "ef_publicDescription");
                v29 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v44 = v12;
                v45 = 2112;
                v46 = v13;
                v47 = 2114;
                v48 = v29;
                _os_log_error_impl(&dword_1A4F90000, v19, OS_LOG_TYPE_ERROR, "#MobileMailMigrator Failed to Rename Path from %@ to %@ Due to Error %{public}@. Deleting the legacyMailboxPath.", buf, 0x20u);

              }
              objc_msgSend(v16, "removeItemAtPath:error:", v12, 0);
            }

          }
          MFLogGeneral();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v7, "ef_publicDescription");
            v21 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v44 = v21;
            _os_log_impl(&dword_1A4F90000, v20, OS_LOG_TYPE_DEFAULT, "#MobileMailMigrator: Finished Migrating Mailbox FilePath for Account: %{public}@", buf, 0xCu);

          }
          MFLogGeneral();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v7, "ef_publicDescription");
            v23 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v44 = v23;
            _os_log_impl(&dword_1A4F90000, v22, OS_LOG_TYPE_DEFAULT, "#MobileMailMigrator: Start Migrating Mailbox URLs for Account: %{public}@", buf, 0xCu);

          }
          v5 = -[MFMailMessageLibraryMailboxURLMigrationStep _renameMailboxURLsForMailAccount:inSQLiteDB:](self, "_renameMailboxURLsForMailAccount:inSQLiteDB:", v7, a3);
          MFLogGeneral();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v7, "ef_publicDescription");
            v25 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v44 = v25;
            v45 = 1024;
            LODWORD(v46) = v5;
            _os_log_impl(&dword_1A4F90000, v24, OS_LOG_TYPE_DEFAULT, "#MobileMailMigrator: Finish Migrating Mailbox URLs for Account: %{public}@ with result %d", buf, 0x12u);

          }
          objc_msgSend(v7, "username");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            objc_msgSend(v7, "username");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "addObject:", v27);

          }
        }
        else
        {
          MFLogGeneral();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v7, "ef_publicDescription");
            v28 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v44 = v28;
            _os_log_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_DEFAULT, "#MobileMailMigrator: No Legacy Path For Account %{public}@, skipping migration...", buf, 0xCu);

          }
        }

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    }
    while (v3);
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  MFLogGeneral();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4F90000, v30, OS_LOG_TYPE_DEFAULT, "#MobileMailMigrator: Starting Purge of Orphaned Mailboxes...", buf, 2u);
  }

  if (objc_msgSend(v33, "count"))
    -[MFMailMessageLibraryMailboxURLMigrationStep _purgeFoldersMatchingPatterns:](self, "_purgeFoldersMatchingPatterns:", v33);
  MFLogGeneral();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4F90000, v31, OS_LOG_TYPE_DEFAULT, "#MobileMailMigrator: Finished Purge of Orphaned Mailboxes...", buf, 2u);
  }

  return v5;
}

- (BOOL)_renameMailboxURLsForMailAccount:(id)a3 inSQLiteDB:(sqlite3 *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  const char *v11;
  int v12;
  int v13;
  NSObject *v14;
  int v15;
  int v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  BOOL v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "legacySQLExpressionToMatchAllMailboxes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "ef_SQLExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("SELECT url FROM mailboxes WHERE %@"), v9);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (const char *)objc_msgSend(v10, "UTF8String");

  ppStmt = (sqlite3_stmt *)0xAAAAAAAAAAAAAAAALL;
  v12 = sqlite3_prepare_v2(a4, v11, -1, &ppStmt, 0);
  v13 = v12;
  if (!ppStmt || v12)
  {
    MFLogGeneral();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v34) = v13;
      _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_DEFAULT, "#MobileMailMigrator Could not migrate Mailbox URLs due to sqlite error: (%d)", buf, 8u);
    }
    v22 = 0;
  }
  else
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    while (1)
    {
      v15 = sqlite3_step(ppStmt);
      v16 = v15;
      if (v15 != 100)
        break;
      v17 = objc_alloc(MEMORY[0x1E0CB3940]);
      v18 = (void *)objc_msgSend(v17, "initWithUTF8String:", sqlite3_column_text(ppStmt, 0));
      v19 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v6, "URLStringFromLegacyURLString:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v19, "initWithString:", v20);

      if (objc_msgSend(v18, "length"))
      {
        if (objc_msgSend(v21, "length"))
          -[NSObject setObject:forKey:](v14, "setObject:forKey:", v21, v18);
      }

    }
    v22 = v15 == 101;
    sqlite3_finalize(ppStmt);
    if (v16 != 101
      || (-[NSObject allKeys](v14, "allKeys"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          v24 = objc_msgSend(v23, "count") == 0,
          v23,
          v24))
    {
      MFLogGeneral();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "ef_publicDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v34 = v30;
        _os_log_impl(&dword_1A4F90000, v29, OS_LOG_TYPE_DEFAULT, "#MobileMailMigrator No Mailboxes found for account %{public}@ to migrate.", buf, 0xCu);

      }
    }
    else
    {
      MFLogGeneral();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "ef_publicDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject allKeys](v14, "allKeys");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject allValues](v14, "allValues");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v34 = v26;
        v35 = 2112;
        v36 = v27;
        v37 = 2112;
        v38 = v28;
        _os_log_impl(&dword_1A4F90000, v25, OS_LOG_TYPE_DEFAULT, "#MobileMailMigrator For Account %{public}@ Renaming Mailboxes From URL %@ To %@", buf, 0x20u);

      }
      v22 = -[MFMailMessageLibraryMailboxURLMigrationStep _updateMailboxURLsInSQLitedb:withOldURLToNewURLMap:](self, "_updateMailboxURLsInSQLitedb:withOldURLToNewURLMap:", a4, v14);
    }
  }

  return v22;
}

- (BOOL)_updateMailboxURLsInSQLitedb:(sqlite3 *)a3 withOldURLToNewURLMap:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  char *v13;
  int v14;
  NSObject *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  int v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v5, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v9);
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v11 = objc_msgSend(v10, "UTF8String");
        v12 = objc_retainAutorelease(v9);
        v13 = sqlite3_mprintf("UPDATE mailboxes SET url = '%q' WHERE url = '%q';", v11, objc_msgSend(v12, "UTF8String"));
        v14 = sqlite3_exec(a3, v13, 0, 0, 0);
        if (v14)
        {
          MFLogGeneral();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v23 = v12;
            v24 = 2112;
            v25 = v10;
            v26 = 1024;
            v27 = v14;
            _os_log_impl(&dword_1A4F90000, v15, OS_LOG_TYPE_DEFAULT, "#MobileMailMigrator Updating mailbox table from Old URL %@ to New URL %@ failed with sqlite code (%d).", buf, 0x1Cu);
          }

        }
        sqlite3_free(v13);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v6);
  }

  return 1;
}

- (void)_purgeFoldersMatchingPatterns:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  dispatch_get_global_queue(25, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__MFMailMessageLibraryMailboxURLMigrationStep__purgeFoldersMatchingPatterns___block_invoke;
  block[3] = &unk_1E4E88DC8;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __77__MFMailMessageLibraryMailboxURLMigrationStep__purgeFoldersMatchingPatterns___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  _QWORD v37[3];

  v37[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0C99E98];
  +[MailAccount defaultAccountDirectory](MailAccount, "defaultAccountDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x1E0C999D0];
  v37[0] = *MEMORY[0x1E0C999D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v21, v5, 5, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("|"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v22, 1, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v20;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v27 = 0;
        v11 = objc_msgSend(v10, "getResourceValue:forKey:error:", &v27, v4, 0);
        v12 = v27;
        v13 = v12;
        if (v11 && objc_msgSend(v12, "BOOLValue"))
        {
          objc_msgSend(v10, "absoluteString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "absoluteString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v24, "numberOfMatchesInString:options:range:", v15, 0, 0, objc_msgSend(v14, "length"));

          if (v16)
          {
            MFLogGeneral();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v33 = v10;
              _os_log_impl(&dword_1A4F90000, v17, OS_LOG_TYPE_DEFAULT, "#MobileMailMigrator Purging Orphaned Mailbox storage at Directory URL %@", buf, 0xCu);
            }

            v26 = 0;
            objc_msgSend(v23, "removeItemAtURL:error:", v10, &v26);
            v18 = v26;
            if (v18)
            {
              MFLogGeneral();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v33 = v10;
                v34 = 2112;
                v35 = v18;
                _os_log_impl(&dword_1A4F90000, v19, OS_LOG_TYPE_DEFAULT, "#MobileMailMigrator Unable to delete Orphaned Mailbox storage at Directory URL %@ due to Error: %@.", buf, 0x16u);
              }

            }
          }

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v7);
  }

}

- (EDPersistenceDatabaseConnection)sqliteConnection
{
  return self->_sqliteConnection;
}

- (void)setSqliteConnection:(id)a3
{
  objc_storeStrong((id *)&self->_sqliteConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sqliteConnection, 0);
}

@end
