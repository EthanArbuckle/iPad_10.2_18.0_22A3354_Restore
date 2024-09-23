@implementation CalDefaultReminderKitDatabaseMigrationContext

- (CalDefaultReminderKitDatabaseMigrationContext)init
{
  CalDefaultReminderKitDatabaseMigrationContext *v2;
  void *v3;
  id v4;
  uint64_t v5;
  REMDatabaseMigrationContext *remDatabaseMigrationContext;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)CalDefaultReminderKitDatabaseMigrationContext;
  v2 = -[CalDefaultReminderKitDatabaseMigrationContext init](&v8, sel_init);
  if (v2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v3 = (void *)getREMDatabaseMigrationContextClass_softClass;
    v13 = getREMDatabaseMigrationContextClass_softClass;
    if (!getREMDatabaseMigrationContextClass_softClass)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __getREMDatabaseMigrationContextClass_block_invoke;
      v9[3] = &unk_24D3F48C8;
      v9[4] = &v10;
      __getREMDatabaseMigrationContextClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v10, 8);
    v5 = objc_opt_new();
    remDatabaseMigrationContext = v2->_remDatabaseMigrationContext;
    v2->_remDatabaseMigrationContext = (REMDatabaseMigrationContext *)v5;

  }
  return v2;
}

- (void)willBeginMigration
{
  id v2;

  -[CalDefaultReminderKitDatabaseMigrationContext remDatabaseMigrationContext](self, "remDatabaseMigrationContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportMigrationWillBegin");

}

- (void)didEndMigrationWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CalDefaultReminderKitDatabaseMigrationContext remDatabaseMigrationContext](self, "remDatabaseMigrationContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportMigrationDidFinishWithSuccess:", v3);

}

- (void)recordMigrationFailure:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "remMigrationStageFromCalMigrationStage:", objc_msgSend(v4, "stage"));
  -[CalDefaultReminderKitDatabaseMigrationContext remDatabaseMigrationContext](self, "remDatabaseMigrationContext");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failureDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "underlyingError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relatedPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "reportMigrationErrorWithIdentifier:atStage:error:objectLocator:", v6, v5, v7, v8);
}

+ (unint64_t)remMigrationStageFromCalMigrationStage:(unint64_t)a3
{
  if (a3 > 7)
    return 1;
  else
    return qword_215A652C0[a3];
}

- (BOOL)ensureAccountsExist:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CalDefaultReminderKitDatabaseMigrationContext remDatabaseMigrationContext](self, "remDatabaseMigrationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "ensureAccountsExist:error:", v6, a4);

  return (char)a4;
}

- (REMStore)reminderStore
{
  void *v2;
  void *v3;

  -[CalDefaultReminderKitDatabaseMigrationContext remDatabaseMigrationContext](self, "remDatabaseMigrationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (REMStore *)v3;
}

- (BOOL)shouldPerformMigration
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[CalDefaultReminderKitDatabaseMigrationContext remDatabaseMigrationContext](self, "remDatabaseMigrationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDatabaseMigrated");

  +[CalMigrationLog reminders](CalMigrationLog, "reminders");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_215A53000, v4, OS_LOG_TYPE_INFO, "ReminderKit says isDatabaseMigrated = %{public}@", (uint8_t *)&v7, 0xCu);

  }
  return v3 ^ 1;
}

- (BOOL)shouldDeleteMigratedData
{
  void *v2;
  char v3;

  -[CalDefaultReminderKitDatabaseMigrationContext remDatabaseMigrationContext](self, "remDatabaseMigrationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldDeleteMigratedData");

  return v3;
}

- (void)migrationDidFinishWithResult:(unint64_t)a3
{
  if (!a3)
  {
    -[CalDefaultReminderKitDatabaseMigrationContext willBeginMigration](self, "willBeginMigration");
    -[CalDefaultReminderKitDatabaseMigrationContext didEndMigrationWithSuccess:](self, "didEndMigrationWithSuccess:", 1);
  }
}

- (REMDatabaseMigrationContext)remDatabaseMigrationContext
{
  return self->_remDatabaseMigrationContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remDatabaseMigrationContext, 0);
}

@end
