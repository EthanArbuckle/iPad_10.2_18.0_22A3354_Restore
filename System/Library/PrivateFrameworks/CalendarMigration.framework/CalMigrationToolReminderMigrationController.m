@implementation CalMigrationToolReminderMigrationController

- (CalMigrationToolReminderMigrationController)initWithToolOptions:(id)a3 defaultProvider:(id)a4
{
  id v7;
  id v8;
  CalMigrationToolReminderMigrationController *v9;
  CalMigrationToolReminderMigrationController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CalMigrationToolReminderMigrationController;
  v9 = -[CalMigrationToolReminderMigrationController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_toolOptions, a3);
    objc_storeStrong((id *)&v10->_defaultProvider, a4);
  }

  return v10;
}

- (BOOL)shouldPerformMigration
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;

  -[CalMigrationToolReminderMigrationController toolOptions](self, "toolOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "performReminderMigration");

  if (v4 == 1)
    return 1;
  if (v4 != -1)
    return 0;
  -[CalMigrationToolReminderMigrationController defaultProvider](self, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldPerformMigration");

  return v6;
}

- (void)migrationDidFinishWithResult:(unint64_t)a3
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

- (CalMigrationController)defaultProvider
{
  return self->_defaultProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultProvider, 0);
  objc_storeStrong((id *)&self->_toolOptions, 0);
}

@end
