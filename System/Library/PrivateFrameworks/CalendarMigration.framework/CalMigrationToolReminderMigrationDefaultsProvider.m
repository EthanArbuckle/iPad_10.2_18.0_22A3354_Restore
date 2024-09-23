@implementation CalMigrationToolReminderMigrationDefaultsProvider

- (CalMigrationToolReminderMigrationDefaultsProvider)initWithToolOptions:(id)a3 reminderDefaultsProvider:(id)a4 calendarDefaultsProvider:(id)a5 calendarMigrationController:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CalMigrationToolReminderMigrationDefaultsProvider *v15;
  CalMigrationToolReminderMigrationDefaultsProvider *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CalMigrationToolReminderMigrationDefaultsProvider;
  v15 = -[CalMigrationToolReminderMigrationDefaultsProvider init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_toolOptions, a3);
    objc_storeStrong((id *)&v16->_reminderDefaultsProvider, a4);
    objc_storeStrong((id *)&v16->_calendarDefaultsProvider, a5);
    objc_storeStrong((id *)&v16->_calendarMigrationController, a6);
  }

  return v16;
}

- (BOOL)shouldBackupBeforeMigration
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;

  -[CalMigrationToolReminderMigrationDefaultsProvider toolOptions](self, "toolOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "backupBeforeReminderMigration");

  if (v4 == 1)
    return 1;
  if (v4 != -1)
    return 0;
  -[CalMigrationToolReminderMigrationDefaultsProvider reminderDefaultsProvider](self, "reminderDefaultsProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldBackupBeforeMigration");

  return v6;
}

- (BOOL)havePerformedReminderMigrationCleanup
{
  void *v3;
  uint64_t v4;
  void *v6;
  char v7;

  -[CalMigrationToolReminderMigrationDefaultsProvider toolOptions](self, "toolOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "performCleanup");

  if (v4 != -1)
    return v4 == 0;
  -[CalMigrationToolReminderMigrationDefaultsProvider reminderDefaultsProvider](self, "reminderDefaultsProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "havePerformedReminderMigrationCleanup");

  return v7;
}

- (void)setHavePerformedReminderMigrationCleanup:(BOOL)a3
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("This method should not be called in CalendarMigrationTool"), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise");

}

- (CalMigrationToolOptions)toolOptions
{
  return self->_toolOptions;
}

- (CalReminderMigrationDefaultsProvider)reminderDefaultsProvider
{
  return self->_reminderDefaultsProvider;
}

- (CalCalendarMigrationDefaultsProvider)calendarDefaultsProvider
{
  return self->_calendarDefaultsProvider;
}

- (CalMigrationController)calendarMigrationController
{
  return self->_calendarMigrationController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarMigrationController, 0);
  objc_storeStrong((id *)&self->_calendarDefaultsProvider, 0);
  objc_storeStrong((id *)&self->_reminderDefaultsProvider, 0);
  objc_storeStrong((id *)&self->_toolOptions, 0);
}

@end
