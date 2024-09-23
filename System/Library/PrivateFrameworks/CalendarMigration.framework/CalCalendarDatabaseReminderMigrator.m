@implementation CalCalendarDatabaseReminderMigrator

- (CalCalendarDatabaseReminderMigrator)initWithReminderKitProvider:(id)a3 defaultsProvider:(id)a4
{
  id v7;
  id v8;
  CalCalendarDatabaseReminderMigrator *v9;
  CalCalendarDatabaseReminderMigrator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CalCalendarDatabaseReminderMigrator;
  v9 = -[CalCalendarDatabaseReminderMigrator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_reminderKitProvider, a3);
    objc_storeStrong((id *)&v10->_defaultsProvider, a4);
  }

  return v10;
}

- (BOOL)attemptMigrationWithHomeDirectory:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  NSObject *v7;
  uint8_t v9[16];
  uint8_t buf[16];

  v4 = a3;
  +[CalMigrationLog reminders](CalMigrationLog, "reminders");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215A53000, v5, OS_LOG_TYPE_DEFAULT, "Beginning CalendarDatabase reminder migration", buf, 2u);
  }

  v6 = -[CalCalendarDatabaseReminderMigrator _attemptMigrationWithHomeDirectory:](self, "_attemptMigrationWithHomeDirectory:", v4);
  +[CalMigrationLog reminders](CalMigrationLog, "reminders");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_215A53000, v7, OS_LOG_TYPE_DEFAULT, "Finished CalendarDatabase reminder migration", v9, 2u);
  }

  return v6;
}

- (BOOL)attemptMigrationWithCalendarDatabase:(CalDatabase *)a3
{
  NSObject *v5;
  BOOL v6;
  NSObject *v7;
  uint8_t v9[16];
  uint8_t buf[16];

  +[CalMigrationLog reminders](CalMigrationLog, "reminders");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215A53000, v5, OS_LOG_TYPE_DEFAULT, "Beginning CalendarDatabase reminder migration", buf, 2u);
  }

  v6 = -[CalCalendarDatabaseReminderMigrator _attemptMigrationWithCalendarDatabase:](self, "_attemptMigrationWithCalendarDatabase:", a3);
  +[CalMigrationLog reminders](CalMigrationLog, "reminders");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_215A53000, v7, OS_LOG_TYPE_DEFAULT, "Finished CalendarDatabase reminder migration", v9, 2u);
  }

  return v6;
}

- (BOOL)_attemptMigrationWithHomeDirectory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const void *v14;
  BOOL v15;
  NSObject *v16;

  v4 = a3;
  -[CalCalendarDatabaseReminderMigrator reminderKitProvider](self, "reminderKitProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CalCalendarDatabaseReminderMigrationContext reminderMigrationContextWithReminderKitProvider:](CalCalendarDatabaseReminderMigrationContext, "reminderMigrationContextWithReminderKitProvider:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("Library/Calendar"));
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject path](v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("/"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc(MEMORY[0x24BE13D30]);
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithDirectoryURL:", v11);

    objc_msgSend(v12, "setOptions:", 13);
    v13 = CalDatabaseCreateWithConfiguration();
    if (v13)
    {
      v14 = (const void *)v13;
      v15 = -[CalCalendarDatabaseReminderMigrator _attemptMigrationForDatabase:inCalendarDirectory:withContext:](self, "_attemptMigrationForDatabase:inCalendarDirectory:withContext:", v13, v7, v6);
      CFRelease(v14);
    }
    else
    {
      +[CalMigrationLog reminders](CalMigrationLog, "reminders");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[CalCalendarDatabaseReminderMigrator _attemptMigrationWithHomeDirectory:].cold.2();

      objc_msgSend(v6, "recordMigrationFailureWithDescription:inStage:underlyingError:", CFSTR("Failed to open calendar database"), 1, 0);
      objc_msgSend(v6, "finishMigrationWithSave:", 0);
      v15 = 0;
    }

  }
  else
  {
    +[CalMigrationLog reminders](CalMigrationLog, "reminders");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[CalCalendarDatabaseReminderMigrator _attemptMigrationWithHomeDirectory:].cold.1();
    v15 = 0;
  }

  return v15;
}

- (BOOL)_attemptMigrationWithCalendarDatabase:(CalDatabase *)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;

  -[CalCalendarDatabaseReminderMigrator reminderKitProvider](self, "reminderKitProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CalCalendarDatabaseReminderMigrationContext reminderMigrationContextWithReminderKitProvider:](CalCalendarDatabaseReminderMigrationContext, "reminderMigrationContextWithReminderKitProvider:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = CalDatabaseCopyDirectoryPathForDatabase();
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[CalCalendarDatabaseReminderMigrator _attemptMigrationForDatabase:inCalendarDirectory:withContext:](self, "_attemptMigrationForDatabase:inCalendarDirectory:withContext:", a3, v8, v6);
    }
    else
    {
      +[CalMigrationLog reminders](CalMigrationLog, "reminders");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CalCalendarDatabaseReminderMigrator _attemptMigrationWithCalendarDatabase:].cold.2();

      objc_msgSend(v6, "recordMigrationFailureWithDescription:inStage:underlyingError:", CFSTR("Failed to get path for database"), 1, 0);
      objc_msgSend(v6, "finishMigrationWithSave:", 0);
      v9 = 0;
    }

  }
  else
  {
    +[CalMigrationLog reminders](CalMigrationLog, "reminders");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[CalCalendarDatabaseReminderMigrator _attemptMigrationWithHomeDirectory:].cold.1();
    v9 = 0;
  }

  return v9;
}

- (BOOL)_attemptMigrationForDatabase:(CalDatabase *)a3 inCalendarDirectory:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  BOOL v10;
  void *v11;

  v8 = a4;
  v9 = a5;
  -[CalCalendarDatabaseReminderMigrator _performPreMigrationTasksInCalendarDirectory:withContext:](self, "_performPreMigrationTasksInCalendarDirectory:withContext:", v8, v9);
  if (objc_msgSend(v9, "shouldPerformMigration"))
    v10 = -[CalCalendarDatabaseReminderMigrator _performMigrationForCalendarDatabase:inCalendarDirectory:withContext:](self, "_performMigrationForCalendarDatabase:inCalendarDirectory:withContext:", a3, v8, v9);
  else
    v10 = 0;
  -[CalCalendarDatabaseReminderMigrator defaultsProvider](self, "defaultsProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHavePerformedReminderMigrationCleanup:", 1);

  return v10;
}

- (void)_performPreMigrationTasksInCalendarDirectory:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  id v18;
  id v19;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  -[CalCalendarDatabaseReminderMigrator defaultsProvider](self, "defaultsProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldBackupBeforeMigration");

  +[CalMigrationLog reminders](CalMigrationLog, "reminders");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A53000, v10, OS_LOG_TYPE_INFO, "Defaults indicate to create a backup. Checking if the backup would be too large.", buf, 2u);
    }

    if (+[CalMigrationBackup shouldBackupCalendarDirectory:withPrivacySafePathProvider:](CalMigrationBackup, "shouldBackupCalendarDirectory:withPrivacySafePathProvider:", v6, v7))
    {
      v19 = 0;
      v12 = +[CalMigrationBackup backupCalendarDirectory:intoArchiveNamed:error:](CalMigrationBackup, "backupCalendarDirectory:intoArchiveNamed:error:", v6, CFSTR("ReminderMigrationBackup.zip"), &v19);
      v13 = v19;
      if (!v12)
      {
        +[CalMigrationLog reminders](CalMigrationLog, "reminders");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[CalCalendarDatabaseReminderMigrator _performPreMigrationTasksInCalendarDirectory:withContext:].cold.1(v6, (uint64_t)v13, v14);

        objc_msgSend(v6, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "recordMigrationFailureWithDescription:inStage:underlyingError:relatedTo:", CFSTR("Failed to back up calendar directory"), 6, v13, v15);
LABEL_16:

        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  else
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A53000, v10, OS_LOG_TYPE_INFO, "Defaults indicate not to create backup", buf, 2u);
    }

  }
  v18 = 0;
  v16 = +[CalMigrationBackup removeExistingBackupWithArchiveName:inCalendarDirectory:error:](CalMigrationBackup, "removeExistingBackupWithArchiveName:inCalendarDirectory:error:", CFSTR("ReminderMigrationBackup.zip"), v6, &v18);
  v13 = v18;
  if (!v16)
  {
    +[CalMigrationLog reminders](CalMigrationLog, "reminders");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CalCalendarDatabaseReminderMigrator _performPreMigrationTasksInCalendarDirectory:withContext:].cold.2(v6, (uint64_t)v13, v17);

    objc_msgSend(v6, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordMigrationFailureWithDescription:inStage:underlyingError:relatedTo:isFatal:", CFSTR("Failed to remove existing backup"), 6, v13, v15, 0);
    goto LABEL_16;
  }
LABEL_17:

}

- (BOOL)_performMigrationForCalendarDatabase:(CalDatabase *)a3 inCalendarDirectory:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  const void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _BOOL8 v22;
  NSObject *v23;
  BOOL v24;
  NSObject *v25;
  uint8_t v27[8];
  _QWORD v28[5];
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;

  v8 = a4;
  v9 = a5;
  v10 = CalDatabaseCopyDefaultCalendarForNewTasksForReminderMigration();
  if (v10)
  {
    v11 = (const void *)v10;
    v12 = (void *)CalCalendarCopyUUID();
    objc_msgSend(v9, "setDefaultListOriginalIdentifier:", v12);

    CFRelease(v11);
  }
  v13 = (void *)CalDatabaseCopyOfAllStores();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v14, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x24BDAC760];
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __108__CalCalendarDatabaseReminderMigrator__performMigrationForCalendarDatabase_inCalendarDirectory_withContext___block_invoke;
    v35[3] = &unk_24D3F4B78;
    v35[4] = self;
    v18 = v9;
    v36 = v18;
    v19 = v15;
    v37 = v19;
    v20 = v16;
    v38 = v20;
    objc_msgSend(v14, "enumerateCalStoreRefsUsingBlock:", v35);
    if ((objc_msgSend(v18, "ensureAccountsExist:", v20) & 1) != 0)
    {
      v31 = 0;
      v32 = &v31;
      v33 = 0x2020000000;
      v34 = 0;
      v28[0] = v17;
      v28[1] = 3221225472;
      v28[2] = __108__CalCalendarDatabaseReminderMigrator__performMigrationForCalendarDatabase_inCalendarDirectory_withContext___block_invoke_2;
      v28[3] = &unk_24D3F4BA0;
      v30 = &v31;
      v28[4] = self;
      v21 = v18;
      v29 = v21;
      objc_msgSend(v19, "enumerateCalStoreRefsUsingBlock:", v28);
      if (*((_BYTE *)v32 + 24))
      {
        v22 = 1;
      }
      else
      {
        +[CalMigrationLog reminders](CalMigrationLog, "reminders");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v27 = 0;
          _os_log_impl(&dword_215A53000, v25, OS_LOG_TYPE_DEFAULT, "No reminder data was migrated", v27, 2u);
        }

        v22 = *((_BYTE *)v32 + 24) != 0;
      }
      if (objc_msgSend(v21, "finishMigrationWithSave:", v22))
      {
        if (objc_msgSend(v21, "shouldDeleteMigratedData"))
          objc_msgSend((id)objc_opt_class(), "_removeRemindersDataAfterSuccessfulMigrationFromDatabase:withContext:", a3, v21);
        v24 = *((_BYTE *)v32 + 24) != 0;
      }
      else
      {
        v24 = 0;
      }

      _Block_object_dispose(&v31, 8);
    }
    else
    {
      objc_msgSend(v18, "finishMigrationWithSave:", 0);
      v24 = 0;
    }

  }
  else
  {
    +[CalMigrationLog reminders](CalMigrationLog, "reminders");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[CalCalendarDatabaseReminderMigrator _performMigrationForCalendarDatabase:inCalendarDirectory:withContext:].cold.1();

    objc_msgSend(v9, "recordMigrationFailureWithDescription:inStage:underlyingError:", CFSTR("Failed to get array of stores"), 1, 0);
    objc_msgSend(v9, "finishMigrationWithSave:", 0);
    v24 = 0;
  }

  return v24;
}

void __108__CalCalendarDatabaseReminderMigrator__performMigrationForCalendarDatabase_inCalendarDirectory_withContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v13 = 0;
  v6 = (void *)objc_opt_class();
  v7 = *(_QWORD *)(a1 + 40);
  v12 = 0;
  v8 = objc_msgSend(v6, "_preCheckStoreForPossibleMigrationDisablingRemindersIfNeeded:withContext:accountType:identifier:", a3, v7, &v13, &v12);
  v9 = v12;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
    if (v13 != 1)
    {
      v14[0] = CFSTR("identifier");
      v14[1] = CFSTR("type");
      v15[0] = v9;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15[1] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 56), "addObject:", v11);
    }
  }

}

uint64_t __108__CalCalendarDatabaseReminderMigrator__performMigrationForCalendarDatabase_inCalendarDirectory_withContext___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend((id)objc_opt_class(), "_attemptMigrationForStore:withContext:", a3, *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= result;
  return result;
}

+ (BOOL)_preCheckStoreForPossibleMigrationDisablingRemindersIfNeeded:(void *)a3 withContext:(id)a4 accountType:(int64_t *)a5 identifier:(id *)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  char v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  const char *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  *a5 = 0;
  *a6 = 0;
  objc_msgSend(a1, "_identifierForStore:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(a1, "_accountTypeForStore:", a3);
  if (!v12)
  {
    +[CalMigrationLog reminders](CalMigrationLog, "reminders");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138543362;
      v23 = v11;
      v20 = "Skipping store %{public}@ with unknown account type";
LABEL_11:
      _os_log_impl(&dword_215A53000, v19, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v22, 0xCu);
    }
LABEL_12:

    objc_msgSend(v10, "addStoreToDisableReminders:", a3);
LABEL_13:
    v18 = 0;
    goto LABEL_14;
  }
  v13 = v12;
  if ((CalStoreIsEnabled() & 1) == 0)
  {
    +[CalMigrationLog reminders](CalMigrationLog, "reminders");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138543362;
      v23 = v11;
      v20 = "Skipping store %{public}@ because it is disabled";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  objc_msgSend(a1, "_setWasMigratedAndClearSyncTokenInAllCalendarsForStore:withContext:", a3, v10);
  v14 = CalStoreAllowsTasksPrivate();
  +[CalMigrationLog reminders](CalMigrationLog, "reminders");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if ((v14 & 1) == 0)
  {
    if (v16)
    {
      v22 = 138543362;
      v23 = v11;
      _os_log_impl(&dword_215A53000, v15, OS_LOG_TYPE_DEFAULT, "Skipping store %{public}@ because it does not support reminders", (uint8_t *)&v22, 0xCu);
    }

    goto LABEL_13;
  }
  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v11;
    v24 = 2114;
    v25 = v17;
    _os_log_impl(&dword_215A53000, v15, OS_LOG_TYPE_DEFAULT, "Including store %{public}@ with type %{public}@", (uint8_t *)&v22, 0x16u);

  }
  *a5 = v13;
  *a6 = objc_retainAutorelease(v11);
  v18 = 1;
LABEL_14:

  return v18;
}

+ (BOOL)_attemptMigrationForStore:(void *)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  uint64_t v9;

  v6 = a4;
  v9 = 0;
  objc_msgSend(a1, "_attemptAccountMigrationForStore:withContext:accountType:", a3, v6, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "pushOrderedListItemsContext");
    objc_msgSend(a1, "_migrateReminderListsInStore:withContext:accountChangeItem:accountType:", a3, v6, v7, v9);
    objc_msgSend(v6, "popOrderedListItemsContextAndSortListsInAccountChangeItem:", v7);
  }

  return v7 != 0;
}

+ (id)_attemptAccountMigrationForStore:(void *)a3 withContext:(id)a4 accountType:(int64_t *)a5
{
  id v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  *a5 = 0;
  objc_msgSend(a1, "_identifierForStore:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "_accountTypeForStore:", a3);
  *a5 = v10;
  if (v10 == 1)
  {
    objc_msgSend(v8, "localAccountChangeItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "existingAccountChangeItemWithAccountIdentifier:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)CalStoreCopyName();
    objc_msgSend(v11, "setName:", v12);

    objc_msgSend(v11, "setDaWasMigrated:", 1);
  }
  v13 = CalStoreAllowsEvents();
  +[CalMigrationLog reminders](CalMigrationLog, "reminders");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v13)
  {
    if (v15)
    {
      v17 = 138543362;
      v18 = v9;
      _os_log_impl(&dword_215A53000, v14, OS_LOG_TYPE_INFO, "Adding %{public}@ to list of stores to disable reminders because has both data classes enabled", (uint8_t *)&v17, 0xCu);
    }

    objc_msgSend(v8, "addStoreToDisableReminders:", a3);
  }
  else
  {
    if (v15)
    {
      v17 = 138543362;
      v18 = v9;
      _os_log_impl(&dword_215A53000, v14, OS_LOG_TYPE_INFO, "Adding %{public}@ to list of stores to delete because only reminders are enabled", (uint8_t *)&v17, 0xCu);
    }

    objc_msgSend(v8, "addStoreToDelete:", a3);
  }

  return v11;
}

+ (int64_t)_accountTypeForStore:(void *)a3
{
  unsigned int Type;

  Type = CalStoreGetType();
  if (Type > 2)
    return 0;
  else
    return qword_215A65370[Type];
}

+ (void)_migrateReminderListsInStore:(void *)a3 withContext:(id)a4 accountChangeItem:(id)a5 accountType:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  int64_t v19;

  v10 = a4;
  v11 = a5;
  v12 = (void *)CalStoreCopyCalendars();
  if (v12)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __110__CalCalendarDatabaseReminderMigrator__migrateReminderListsInStore_withContext_accountChangeItem_accountType___block_invoke;
    v15[3] = &unk_24D3F4BC8;
    v18 = a1;
    v16 = v10;
    v17 = v11;
    v19 = a6;
    objc_msgSend(v12, "enumerateCalCalendarRefsUsingBlock:", v15);

  }
  else
  {
    objc_msgSend(a1, "_identifierForStore:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CalMigrationLog reminders](CalMigrationLog, "reminders");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[CalCalendarDatabaseReminderMigrator _migrateReminderListsInStore:withContext:accountChangeItem:accountType:].cold.1();

    objc_msgSend(v10, "recordMigrationFailureWithDescription:inStage:underlyingError:relatedTo:", CFSTR("Failed to get calendars from store"), 3, 0, v13);
  }

}

uint64_t __110__CalCalendarDatabaseReminderMigrator__migrateReminderListsInStore_withContext_accountChangeItem_accountType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 48), "_shouldMigrateCalendarAsReminderList:");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 48), "_visitCalendarForMigrationAsReminderList:withContext:accountChangeItem:accountType:", a3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  return result;
}

+ (BOOL)_shouldMigrateCalendarAsReminderList:(void *)a3
{
  NSObject *v5;
  void *v6;
  const char *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if ((CalCalendarCanContainEntityType() & 1) != 0)
  {
    if (CalCalendarIsHidden())
    {
      +[CalMigrationLog reminders](CalMigrationLog, "reminders");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(a1, "_identifierForCalendar:", a3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543362;
        v10 = v6;
        v7 = "Skipping calendar %{public}@ because it is hidden";
LABEL_19:
        _os_log_impl(&dword_215A53000, v5, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v9, 0xCu);

      }
    }
    else if (CalCalendarIsInbox())
    {
      +[CalMigrationLog reminders](CalMigrationLog, "reminders");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(a1, "_identifierForCalendar:", a3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543362;
        v10 = v6;
        v7 = "Skipping calendar %{public}@ because it is an inbox calendar";
        goto LABEL_19;
      }
    }
    else if (CalCalendarIsNotificationsCollection())
    {
      +[CalMigrationLog reminders](CalMigrationLog, "reminders");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(a1, "_identifierForCalendar:", a3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543362;
        v10 = v6;
        v7 = "Skipping calendar %{public}@ because it is a notification collection";
        goto LABEL_19;
      }
    }
    else if (CalCalendarIsSharingInvitation())
    {
      +[CalMigrationLog reminders](CalMigrationLog, "reminders");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(a1, "_identifierForCalendar:", a3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543362;
        v10 = v6;
        v7 = "Skipping calendar %{public}@ because it is a sharing invitation";
        goto LABEL_19;
      }
    }
    else
    {
      if (!CalCalendarIsSubscribed())
        return 1;
      +[CalMigrationLog reminders](CalMigrationLog, "reminders");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(a1, "_identifierForCalendar:", a3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543362;
        v10 = v6;
        v7 = "Skipping calendar %{public}@ because it is a subscribed calendar";
        goto LABEL_19;
      }
    }
  }
  else
  {
    +[CalMigrationLog reminders](CalMigrationLog, "reminders");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(a1, "_identifierForCalendar:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v6;
      v7 = "Skipping calendar %{public}@ because it doesn't support reminders";
      goto LABEL_19;
    }
  }

  return 0;
}

+ (void)_visitCalendarForMigrationAsReminderList:(void *)a3 withContext:(id)a4 accountChangeItem:(id)a5 accountType:(int64_t)a6
{
  id v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  objc_msgSend(a1, "_migrateCalendarAsReminderList:withContext:accountChangeItem:accountType:", a3, v10, a5, a6);
  objc_msgSend(a1, "_identifierForCalendar:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = CalCalendarCanContainEntityType();
  +[CalMigrationLog reminders](CalMigrationLog, "reminders");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if ((_DWORD)a1)
  {
    if (v13)
    {
      v14 = 138543362;
      v15 = v11;
      _os_log_impl(&dword_215A53000, v12, OS_LOG_TYPE_INFO, "Adding calendar %{public}@ to list of calendars to disable reminders because it supports both entity types", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(v10, "addCalendarToDisableReminders:", a3);
  }
  else
  {
    if (v13)
    {
      v14 = 138543362;
      v15 = v11;
      _os_log_impl(&dword_215A53000, v12, OS_LOG_TYPE_INFO, "Adding calendar %{public}@ to list of calendars to delete because it only supports reminders", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(v10, "addCalendarToDelete:", a3);
  }

}

+ (void)_migrateCalendarAsReminderList:(void *)a3 withContext:(id)a4 accountChangeItem:(id)a5 accountType:(int64_t)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t DisplayOrder;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE buf[24];
  void *v34;
  uint64_t *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v27 = a5;
  objc_msgSend(v8, "saveRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addListWithName:toAccountChangeItem:", CFSTR("Reminders"), v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)CalCalendarCopyTitle();
  if (v11)
    objc_msgSend(v10, "setName:", v11);
  objc_msgSend(a1, "_colorStringForCalendar:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2050000000;
    v13 = (void *)getREMColorClass_softClass;
    v32 = getREMColorClass_softClass;
    if (!getREMColorClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getREMColorClass_block_invoke;
      v34 = &unk_24D3F48C8;
      v35 = &v29;
      __getREMColorClass_block_invoke((uint64_t)buf);
      v13 = (void *)v30[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v29, 8);
    +[CalReminderMigrationReminderKitUtils hexColorStringByRemovingAlphaFromHexString:](CalReminderMigrationReminderKitUtils, "hexColorStringByRemovingAlphaFromHexString:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "colorWithHexString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setColor:", v16);

  }
  DisplayOrder = CalCalendarGetDisplayOrder();
  v18 = (void *)CalCalendarCopyUUID();
  +[CalMigrationLog reminders](CalMigrationLog, "reminders");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v20;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v21;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v34) = DisplayOrder;
    _os_log_impl(&dword_215A53000, v19, OS_LOG_TYPE_DEFAULT, "Recording migrated list \"%@\" (%{public}@) with old order %i", buf, 0x1Cu);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", DisplayOrder);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordAddedListChangeItem:withOriginalIdentifier:order:", v10, v18, v22);

  v23 = (void *)CalCalendarCopyExternalID();
  objc_msgSend(v10, "setExternalIdentifier:", v23);

  v24 = (void *)CalCalendarCopyPushKey();
  objc_msgSend(v10, "setDaPushKey:", v24);

  if (a6 == 4)
  {
    v25 = (void *)CalCalendarCopyExternalModificationTag();
    objc_msgSend(v10, "setExternalModificationTag:", v25);

  }
  objc_msgSend(a1, "_migrateRemindersInCalendar:withContext:listChangeItem:", a3, v8, v10);

}

+ (void)_migrateRemindersInCalendar:(void *)a3 withContext:(id)a4 listChangeItem:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v8 = a4;
  v9 = a5;
  v10 = (void *)CalCalendarCopyTasks();
  if (v10)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __94__CalCalendarDatabaseReminderMigrator__migrateRemindersInCalendar_withContext_listChangeItem___block_invoke;
    v13[3] = &unk_24D3F4BF0;
    v16 = a1;
    v14 = v8;
    v15 = v9;
    objc_msgSend(v10, "enumerateCalTaskRefsUsingBlock:", v13);

  }
  else
  {
    objc_msgSend(a1, "_identifierForCalendar:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CalMigrationLog reminders](CalMigrationLog, "reminders");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[CalCalendarDatabaseReminderMigrator _migrateRemindersInCalendar:withContext:listChangeItem:].cold.1();

    objc_msgSend(v8, "recordMigrationFailureWithDescription:inStage:underlyingError:relatedTo:", CFSTR("Failed to get reminders from calendar"), 3, 0, v11);
  }

}

uint64_t __94__CalCalendarDatabaseReminderMigrator__migrateRemindersInCalendar_withContext_listChangeItem___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 48), "_migrateReminder:withContext:listChangeItem:", a3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

+ (void)_migrateReminder:(void *)a3 withContext:(id)a4 listChangeItem:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v23[0] = a3;
  v9 = (void *)MEMORY[0x24BDBCE30];
  v10 = a5;
  objc_msgSend(v9, "arrayWithObjects:count:", v23, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)CalCreateiCalendarDataFromCalEntities();
  objc_msgSend(v8, "saveRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v13, "importRemindersFromICSData:insertIntoListChangeItem:error:", v12, v10, &v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v22;
  objc_msgSend(a1, "_identifierForReminder:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    +[CalMigrationLog reminders](CalMigrationLog, "reminders");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      +[CalCalendarDatabaseReminderMigrator _migrateReminder:withContext:listChangeItem:].cold.1((uint64_t)v16, (uint64_t)v15, v21);

    v18 = CFSTR("Failed to import ICS data");
    v19 = v8;
    v20 = v15;
    goto LABEL_9;
  }
  if (!objc_msgSend(v14, "count"))
  {
    +[CalMigrationLog reminders](CalMigrationLog, "reminders");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[CalCalendarDatabaseReminderMigrator _migrateReminder:withContext:listChangeItem:].cold.2();

    v18 = CFSTR("Imported 0 reminders from ICS data for a reminder");
    v19 = v8;
    v20 = 0;
LABEL_9:
    objc_msgSend(v19, "recordMigrationFailureWithDescription:inStage:underlyingError:relatedTo:", v18, 4, v20, v16);
  }

}

+ (void)_removeRemindersDataAfterSuccessfulMigrationFromDatabase:(CalDatabase *)a3 withContext:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  _QWORD v18[6];
  _QWORD v19[7];
  _QWORD v20[6];
  _QWORD v21[6];
  _QWORD v22[6];
  _QWORD v23[6];
  uint8_t buf[16];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v6 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  +[CalMigrationLog reminders](CalMigrationLog, "reminders");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215A53000, v7, OS_LOG_TYPE_INFO, "Removing reminders data from CalendarDatabase", buf, 2u);
  }

  objc_msgSend(v6, "storesToSetWasMigrated");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __108__CalCalendarDatabaseReminderMigrator__removeRemindersDataAfterSuccessfulMigrationFromDatabase_withContext___block_invoke;
  v23[3] = &unk_24D3F4C18;
  v23[4] = &v25;
  v23[5] = a1;
  objc_msgSend(v8, "enumerateCalStoreRefsUsingBlock:", v23);

  objc_msgSend(v6, "storesToDelete");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v9;
  v22[1] = 3221225472;
  v22[2] = __108__CalCalendarDatabaseReminderMigrator__removeRemindersDataAfterSuccessfulMigrationFromDatabase_withContext___block_invoke_34;
  v22[3] = &unk_24D3F4C18;
  v22[4] = &v25;
  v22[5] = a1;
  objc_msgSend(v10, "enumerateCalStoreRefsUsingBlock:", v22);

  objc_msgSend(v6, "calendarsToDelete");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __108__CalCalendarDatabaseReminderMigrator__removeRemindersDataAfterSuccessfulMigrationFromDatabase_withContext___block_invoke_35;
  v21[3] = &unk_24D3F4C18;
  v21[4] = &v25;
  v21[5] = a1;
  objc_msgSend(v11, "enumerateCalCalendarRefsUsingBlock:", v21);

  objc_msgSend(v6, "storesToDisableReminders");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __108__CalCalendarDatabaseReminderMigrator__removeRemindersDataAfterSuccessfulMigrationFromDatabase_withContext___block_invoke_36;
  v20[3] = &unk_24D3F4C18;
  v20[4] = &v25;
  v20[5] = a1;
  objc_msgSend(v12, "enumerateCalStoreRefsUsingBlock:", v20);

  objc_msgSend(v6, "calendarsToDisableReminders");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __108__CalCalendarDatabaseReminderMigrator__removeRemindersDataAfterSuccessfulMigrationFromDatabase_withContext___block_invoke_37;
  v19[3] = &unk_24D3F4C40;
  v19[5] = a1;
  v19[6] = a3;
  v19[4] = &v25;
  objc_msgSend(v13, "enumerateCalCalendarRefsUsingBlock:", v19);

  objc_msgSend(v6, "calendarsToClearSyncToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __108__CalCalendarDatabaseReminderMigrator__removeRemindersDataAfterSuccessfulMigrationFromDatabase_withContext___block_invoke_38;
  v18[3] = &unk_24D3F4C18;
  v18[4] = &v25;
  v18[5] = a1;
  objc_msgSend(v14, "enumerateCalCalendarRefsUsingBlock:", v18);

  if (!*((_BYTE *)v26 + 24))
  {
    +[CalMigrationLog reminders](CalMigrationLog, "reminders");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v16 = "No reminders data needed to be removed";
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_14;
  }
  if ((CalDatabaseSave() & 1) != 0)
  {
    CalDatabaseClearAllChangeHistoryForAllClients();
    +[CalMigrationLog reminders](CalMigrationLog, "reminders");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v16 = "Finished removing reminders data from CalendarDatabase";
LABEL_9:
      _os_log_impl(&dword_215A53000, v15, OS_LOG_TYPE_INFO, v16, buf, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  +[CalMigrationLog reminders](CalMigrationLog, "reminders");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    +[CalCalendarDatabaseReminderMigrator _removeRemindersDataAfterSuccessfulMigrationFromDatabase:withContext:].cold.1();

  objc_msgSend(v6, "recordMigrationFailureWithDescription:inStage:underlyingError:", CFSTR("Failed to save database after removing reminders data"), 6, 0);
LABEL_14:
  _Block_object_dispose(&v25, 8);

}

uint64_t __108__CalCalendarDatabaseReminderMigrator__removeRemindersDataAfterSuccessfulMigrationFromDatabase_withContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t result;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  +[CalMigrationLog reminders](CalMigrationLog, "reminders");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "_identifierForStore:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_215A53000, v5, OS_LOG_TYPE_INFO, "Setting WasMigrated on store %{public}@", (uint8_t *)&v8, 0xCu);

  }
  result = CalStoreSetWasMigrated();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __108__CalCalendarDatabaseReminderMigrator__removeRemindersDataAfterSuccessfulMigrationFromDatabase_withContext___block_invoke_34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t result;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  +[CalMigrationLog reminders](CalMigrationLog, "reminders");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "_identifierForStore:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_215A53000, v5, OS_LOG_TYPE_INFO, "Deleting store %{public}@", (uint8_t *)&v8, 0xCu);

  }
  result = CalRemoveStore();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __108__CalCalendarDatabaseReminderMigrator__removeRemindersDataAfterSuccessfulMigrationFromDatabase_withContext___block_invoke_35(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t result;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  +[CalMigrationLog reminders](CalMigrationLog, "reminders");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "_identifierForCalendar:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_215A53000, v5, OS_LOG_TYPE_INFO, "Deleting calendar %{public}@", (uint8_t *)&v8, 0xCu);

  }
  result = CalRemoveCalendar();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __108__CalCalendarDatabaseReminderMigrator__removeRemindersDataAfterSuccessfulMigrationFromDatabase_withContext___block_invoke_36(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t result;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  +[CalMigrationLog reminders](CalMigrationLog, "reminders");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "_identifierForStore:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_215A53000, v5, OS_LOG_TYPE_INFO, "Disabling reminders in store %{public}@", (uint8_t *)&v8, 0xCu);

  }
  result = CalStoreSetAllowsTasksPrivate();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __108__CalCalendarDatabaseReminderMigrator__removeRemindersDataAfterSuccessfulMigrationFromDatabase_withContext___block_invoke_37(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t result;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  +[CalMigrationLog reminders](CalMigrationLog, "reminders");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "_identifierForCalendar:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_215A53000, v5, OS_LOG_TYPE_INFO, "Disabling reminders in calendar %{public}@", (uint8_t *)&v10, 0xCu);

  }
  CalCalendarSetCanContainEntityType();
  +[CalMigrationLog reminders](CalMigrationLog, "reminders");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "_identifierForCalendar:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_215A53000, v7, OS_LOG_TYPE_INFO, "Removing existing reminders from calendar %{public}@", (uint8_t *)&v10, 0xCu);

  }
  result = CalDatabaseRemoveAllCalendarItemsWithCalendarAndEntityType();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __108__CalCalendarDatabaseReminderMigrator__removeRemindersDataAfterSuccessfulMigrationFromDatabase_withContext___block_invoke_38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t result;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  +[CalMigrationLog reminders](CalMigrationLog, "reminders");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "_identifierForCalendar:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_215A53000, v5, OS_LOG_TYPE_INFO, "Clearing sync token in calendar %{public}@", (uint8_t *)&v8, 0xCu);

  }
  result = CalCalendarSetSyncToken();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

+ (void)_setWasMigratedAndClearSyncTokenInAllCalendarsForStore:(void *)a3 withContext:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  +[CalMigrationLog reminders](CalMigrationLog, "reminders");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1, "_identifierForStore:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_impl(&dword_215A53000, v7, OS_LOG_TYPE_INFO, "Adding store %{public}@ to list of stores to set wasMigrated", buf, 0xCu);

  }
  objc_msgSend(v6, "addStoreToSetWasMigrated:", a3);
  v9 = (void *)CalStoreCopyCalendars();
  if (v9)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __106__CalCalendarDatabaseReminderMigrator__setWasMigratedAndClearSyncTokenInAllCalendarsForStore_withContext___block_invoke;
    v12[3] = &unk_24D3F4B30;
    v14 = a1;
    v13 = v6;
    objc_msgSend(v9, "enumerateCalCalendarRefsUsingBlock:", v12);
    v10 = v13;
  }
  else
  {
    objc_msgSend(a1, "_identifierForStore:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CalMigrationLog reminders](CalMigrationLog, "reminders");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[CalCalendarDatabaseReminderMigrator _migrateReminderListsInStore:withContext:accountChangeItem:accountType:].cold.1();

    objc_msgSend(v6, "recordMigrationFailureWithDescription:inStage:underlyingError:relatedTo:", CFSTR("Failed to get calendars from store"), 1, 0, v10);
  }

}

uint64_t __106__CalCalendarDatabaseReminderMigrator__setWasMigratedAndClearSyncTokenInAllCalendarsForStore_withContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  +[CalMigrationLog reminders](CalMigrationLog, "reminders");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "_identifierForCalendar:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_215A53000, v5, OS_LOG_TYPE_INFO, "Adding calendar %{public}@ to list of calendars to clear sync token", (uint8_t *)&v8, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "addCalendarToClearSyncToken:", a3);
}

+ (id)_identifierForStore:(void *)a3
{
  return (id)CalStoreCopyUUID();
}

+ (id)_identifierForCalendar:(void *)a3
{
  return (id)CalCalendarCopyUUID();
}

+ (id)_identifierForReminder:(void *)a3
{
  return (id)CalCalendarItemCopyUUID();
}

+ (id)_colorStringForCalendar:(void *)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)CalCalendarCopySymbolicColorName();
  if (!v3
    || (EKSymbolicColorToRGBMapping(),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "objectForKeyedSubscript:", v3),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    v5 = (void *)CalCalendarCopyColorStringForDisplay();
  }

  return v5;
}

- (CalReminderKitProvider)reminderKitProvider
{
  return self->_reminderKitProvider;
}

- (CalReminderMigrationDefaultsProvider)defaultsProvider
{
  return self->_defaultsProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsProvider, 0);
  objc_storeStrong((id *)&self->_reminderKitProvider, 0);
}

- (void)_attemptMigrationWithHomeDirectory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_9(&dword_215A53000, v0, v1, "Failed to get a migration context. Aborting migration.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_attemptMigrationWithHomeDirectory:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_215A53000, v0, v1, "Failed to open calendar database. Will not attempt migration.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_attemptMigrationWithCalendarDatabase:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_215A53000, v0, v1, "Failed to get path for database. Aborting migration.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_attemptMigrationForDatabase:inCalendarDirectory:withContext:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_215A53000, v0, OS_LOG_TYPE_FAULT, "Exception thrown during migration: %@", v1, 0xCu);
  OUTLINED_FUNCTION_3_0();
}

- (void)_performPreMigrationTasksInCalendarDirectory:(NSObject *)a3 withContext:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_2(&dword_215A53000, a3, v5, "Failed to back up calendar directory %@. error = %@", v6);

  OUTLINED_FUNCTION_2();
}

- (void)_performPreMigrationTasksInCalendarDirectory:(NSObject *)a3 withContext:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_2(&dword_215A53000, a3, v5, "Failed to remove existing backup in calendar directory %@. error = %@", v6);

  OUTLINED_FUNCTION_2();
}

- (void)_performMigrationForCalendarDatabase:inCalendarDirectory:withContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_215A53000, v0, v1, "Failed to get array of stores. Aborting migration.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

+ (void)_migrateReminderListsInStore:withContext:accountChangeItem:accountType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_215A53000, v0, v1, "Failed to get calendars from store %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

+ (void)_migrateRemindersInCalendar:withContext:listChangeItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_215A53000, v0, v1, "Failed to get reminders from calendar %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

+ (void)_migrateReminder:(uint64_t)a1 withContext:(uint64_t)a2 listChangeItem:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_4_2(&dword_215A53000, a3, (uint64_t)a3, "Failed to import ICS data for reminder %{public}@. error = %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3_0();
}

+ (void)_migrateReminder:withContext:listChangeItem:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_215A53000, v0, v1, "Imported 0 reminders from ICS data for reminder %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

+ (void)_removeRemindersDataAfterSuccessfulMigrationFromDatabase:withContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_215A53000, v0, v1, "Failed to save database after removing reminders data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

@end
