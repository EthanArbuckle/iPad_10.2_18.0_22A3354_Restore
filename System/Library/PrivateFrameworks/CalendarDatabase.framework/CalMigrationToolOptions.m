@implementation CalMigrationToolOptions

- (id)initUsingCalendarDaemon
{
  return -[CalMigrationToolOptions _initWithHomeDirectory:sourceCalendarDirectory:destinationDirectory:migrateUsingCalendarDaemon:waitForRemindersOnly:performCalendarMigration:performReminderMigration:performCleanup:deleteMigratedData:backupBeforeCalendarMigration:backupBeforeReminderMigration:saveAccountsChangesToFile:accountsDatabaseFile:](self, "_initWithHomeDirectory:sourceCalendarDirectory:destinationDirectory:migrateUsingCalendarDaemon:waitForRemindersOnly:performCalendarMigration:performReminderMigration:performCleanup:deleteMigratedData:backupBeforeCalendarMigration:backupBeforeReminderMigration:saveAccountsChangesToFile:accountsDatabaseFile:", 0, 0, 0, 1, 0, -1, -1, -1, -1, -1, -1, 0, 0);
}

- (id)initUsingCalendarDaemonWaitingForRemindersOnly
{
  return -[CalMigrationToolOptions _initWithHomeDirectory:sourceCalendarDirectory:destinationDirectory:migrateUsingCalendarDaemon:waitForRemindersOnly:performCalendarMigration:performReminderMigration:performCleanup:deleteMigratedData:backupBeforeCalendarMigration:backupBeforeReminderMigration:saveAccountsChangesToFile:accountsDatabaseFile:](self, "_initWithHomeDirectory:sourceCalendarDirectory:destinationDirectory:migrateUsingCalendarDaemon:waitForRemindersOnly:performCalendarMigration:performReminderMigration:performCleanup:deleteMigratedData:backupBeforeCalendarMigration:backupBeforeReminderMigration:saveAccountsChangesToFile:accountsDatabaseFile:", 0, 0, 0, 1, 1, -1, -1, -1, -1, -1, -1, 0, 0);
}

- (CalMigrationToolOptions)initWithHomeDirectory:(id)a3
{
  return -[CalMigrationToolOptions initWithHomeDirectory:destinationDirectory:performCalendarMigration:performReminderMigration:performCleanup:deleteMigratedData:backupBeforeCalendarMigration:backupBeforeReminderMigration:saveAccountsChangesToFile:accountsDatabaseFile:](self, "initWithHomeDirectory:destinationDirectory:performCalendarMigration:performReminderMigration:performCleanup:deleteMigratedData:backupBeforeCalendarMigration:backupBeforeReminderMigration:saveAccountsChangesToFile:accountsDatabaseFile:", a3, 0, -1, -1, -1, -1, -1, -1, 0, 0);
}

- (CalMigrationToolOptions)initWithHomeDirectory:(id)a3 destinationDirectory:(id)a4 performCalendarMigration:(int64_t)a5 performReminderMigration:(int64_t)a6 performCleanup:(int64_t)a7 deleteMigratedData:(int64_t)a8 backupBeforeCalendarMigration:(int64_t)a9 backupBeforeReminderMigration:(int64_t)a10 saveAccountsChangesToFile:(id)a11 accountsDatabaseFile:(id)a12
{
  return (CalMigrationToolOptions *)-[CalMigrationToolOptions _initWithHomeDirectory:sourceCalendarDirectory:destinationDirectory:migrateUsingCalendarDaemon:waitForRemindersOnly:performCalendarMigration:performReminderMigration:performCleanup:deleteMigratedData:backupBeforeCalendarMigration:backupBeforeReminderMigration:saveAccountsChangesToFile:accountsDatabaseFile:](self, "_initWithHomeDirectory:sourceCalendarDirectory:destinationDirectory:migrateUsingCalendarDaemon:waitForRemindersOnly:performCalendarMigration:performReminderMigration:performCleanup:deleteMigratedData:backupBeforeCalendarMigration:backupBeforeReminderMigration:saveAccountsChangesToFile:accountsDatabaseFile:", a3, 0, a4, 0, 0, a5, a6, a7, a8, a9, a10, a11, a12);
}

- (CalMigrationToolOptions)initWithSourceCalendarDirectory:(id)a3 destinationDirectory:(id)a4 performCalendarMigration:(int64_t)a5 performReminderMigration:(int64_t)a6 performCleanup:(int64_t)a7 deleteMigratedData:(int64_t)a8 backupBeforeCalendarMigration:(int64_t)a9 backupBeforeReminderMigration:(int64_t)a10 saveAccountsChangesToFile:(id)a11 accountsDatabaseFile:(id)a12
{
  return (CalMigrationToolOptions *)-[CalMigrationToolOptions _initWithHomeDirectory:sourceCalendarDirectory:destinationDirectory:migrateUsingCalendarDaemon:waitForRemindersOnly:performCalendarMigration:performReminderMigration:performCleanup:deleteMigratedData:backupBeforeCalendarMigration:backupBeforeReminderMigration:saveAccountsChangesToFile:accountsDatabaseFile:](self, "_initWithHomeDirectory:sourceCalendarDirectory:destinationDirectory:migrateUsingCalendarDaemon:waitForRemindersOnly:performCalendarMigration:performReminderMigration:performCleanup:deleteMigratedData:backupBeforeCalendarMigration:backupBeforeReminderMigration:saveAccountsChangesToFile:accountsDatabaseFile:", 0, a3, a4, 0, 0, a5, a6, a7, a8, a9, a10, a11, a12);
}

- (id)_initWithHomeDirectory:(id)a3 sourceCalendarDirectory:(id)a4 destinationDirectory:(id)a5 migrateUsingCalendarDaemon:(BOOL)a6 waitForRemindersOnly:(BOOL)a7 performCalendarMigration:(int64_t)a8 performReminderMigration:(int64_t)a9 performCleanup:(int64_t)a10 deleteMigratedData:(int64_t)a11 backupBeforeCalendarMigration:(int64_t)a12 backupBeforeReminderMigration:(int64_t)a13 saveAccountsChangesToFile:(id)a14 accountsDatabaseFile:(id)a15
{
  id v20;
  id v21;
  id v22;
  CalMigrationToolOptions *v23;
  CalMigrationToolOptions *v24;
  id v28;
  id v29;
  objc_super v30;

  v20 = a3;
  v21 = a4;
  v22 = a5;
  v29 = a14;
  v28 = a15;
  v30.receiver = self;
  v30.super_class = (Class)CalMigrationToolOptions;
  v23 = -[CalMigrationToolOptions init](&v30, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_homeDirectory, a3);
    objc_storeStrong((id *)&v24->_sourceCalendarDirectory, a4);
    objc_storeStrong((id *)&v24->_destinationDirectory, a5);
    v24->_migrateUsingCalendarDaemon = a6;
    v24->_waitForRemindersOnly = a7;
    v24->_performCalendarMigration = a8;
    v24->_performReminderMigration = a9;
    v24->_performCleanup = a10;
    v24->_deleteMigratedData = a11;
    v24->_backupBeforeCalendarMigration = a12;
    v24->_backupBeforeReminderMigration = a13;
    objc_storeStrong((id *)&v24->_accountsChangesFile, a14);
    objc_storeStrong((id *)&v24->_accountsDatabaseFile, a15);
  }

  return v24;
}

+ (id)_stringForTriStateOption:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("default");
  if (a3 == 1)
    v3 = CFSTR("enable");
  if (a3)
    return (id)v3;
  else
    return CFSTR("disable");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  if (-[CalMigrationToolOptions migrateUsingCalendarDaemon](self, "migrateUsingCalendarDaemon"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = objc_opt_class();
    v5 = -[CalMigrationToolOptions waitForRemindersOnly](self, "waitForRemindersOnly");
    v6 = CFSTR("NO");
    if (v5)
      v6 = CFSTR("YES");
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>(\n migrateUsingCalendarDaemon = YES,\n waitForRemindersOnly = %@\n)"), v4, self, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CalMigrationToolOptions homeDirectory](self, "homeDirectory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[CalMigrationToolOptions homeDirectory](self, "homeDirectory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("homeDirectory");
    }
    else
    {
      -[CalMigrationToolOptions sourceCalendarDirectory](self, "sourceCalendarDirectory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("sourceCalendarDirectory");
    }
    v23 = v10;
    objc_msgSend(v9, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0CB3940];
    v20 = objc_opt_class();
    -[CalMigrationToolOptions destinationDirectory](self, "destinationDirectory");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_stringForTriStateOption:", -[CalMigrationToolOptions performCalendarMigration](self, "performCalendarMigration"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_stringForTriStateOption:", -[CalMigrationToolOptions performReminderMigration](self, "performReminderMigration"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_stringForTriStateOption:", -[CalMigrationToolOptions performCleanup](self, "performCleanup"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_stringForTriStateOption:", -[CalMigrationToolOptions deleteMigratedData](self, "deleteMigratedData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_stringForTriStateOption:", -[CalMigrationToolOptions backupBeforeCalendarMigration](self, "backupBeforeCalendarMigration"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_stringForTriStateOption:", -[CalMigrationToolOptions backupBeforeCalendarMigration](self, "backupBeforeCalendarMigration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalMigrationToolOptions accountsChangesFile](self, "accountsChangesFile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalMigrationToolOptions accountsDatabaseFile](self, "accountsDatabaseFile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("<%@: %p>(\n %@ = %@,\n destinationDirectory = %@,\n performCalendarMigration = %@,\n performReminderMigration = %@,\n performCleanup = %@,\n deleteMigratedData = %@,\n backupBeforeCalendarMigration = %@,\n backupBeforeReminderMigration = %@,\n accountChangesFile = %@,\n accountsDatabaseFile = %@,\n)"), v20, self, v23, v22, v27, v26, v25, v19, v11, v12, v13, v15, v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)migrateUsingCalendarDaemon
{
  return self->_migrateUsingCalendarDaemon;
}

- (BOOL)waitForRemindersOnly
{
  return self->_waitForRemindersOnly;
}

- (NSURL)homeDirectory
{
  return self->_homeDirectory;
}

- (NSURL)sourceCalendarDirectory
{
  return self->_sourceCalendarDirectory;
}

- (NSURL)destinationDirectory
{
  return self->_destinationDirectory;
}

- (int64_t)performCalendarMigration
{
  return self->_performCalendarMigration;
}

- (int64_t)performReminderMigration
{
  return self->_performReminderMigration;
}

- (int64_t)performCleanup
{
  return self->_performCleanup;
}

- (int64_t)deleteMigratedData
{
  return self->_deleteMigratedData;
}

- (int64_t)backupBeforeCalendarMigration
{
  return self->_backupBeforeCalendarMigration;
}

- (int64_t)backupBeforeReminderMigration
{
  return self->_backupBeforeReminderMigration;
}

- (NSURL)accountsChangesFile
{
  return self->_accountsChangesFile;
}

- (NSURL)accountsDatabaseFile
{
  return self->_accountsDatabaseFile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountsDatabaseFile, 0);
  objc_storeStrong((id *)&self->_accountsChangesFile, 0);
  objc_storeStrong((id *)&self->_destinationDirectory, 0);
  objc_storeStrong((id *)&self->_sourceCalendarDirectory, 0);
  objc_storeStrong((id *)&self->_homeDirectory, 0);
}

@end
