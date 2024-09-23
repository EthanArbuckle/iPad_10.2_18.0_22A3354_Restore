@implementation CalDefaultCalendarMigrationController

- (CalDefaultCalendarMigrationController)initWithDefaultsProvider:(id)a3
{
  id v5;
  CalDefaultCalendarMigrationController *v6;
  CalDefaultCalendarMigrationController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CalDefaultCalendarMigrationController;
  v6 = -[CalDefaultCalendarMigrationController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_defaultsProvider, a3);

  return v7;
}

- (BOOL)shouldPerformMigration
{
  void *v3;
  int v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  void *v8;
  int v9;
  __int16 v11;
  __int16 v12;

  -[CalDefaultCalendarMigrationController defaultsProvider](self, "defaultsProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldPerformMigrationWithDestinationDirectory:", 0);

  if (v4)
  {
    +[CalMigrationLog calendar](CalMigrationLog, "calendar");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 0;
      v6 = "Should perform migration because the defaults provider says so.";
      v7 = (uint8_t *)&v12;
LABEL_7:
      _os_log_impl(&dword_215A53000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  -[CalDefaultCalendarMigrationController defaultsProvider](self, "defaultsProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "needsMigrationCleanupWithDestinationDirectory:", 0);

  if (v9)
  {
    +[CalMigrationLog calendar](CalMigrationLog, "calendar");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 0;
      v6 = "Should perform migration because the defaults provider says we need to run cleanup.";
      v7 = (uint8_t *)&v11;
      goto LABEL_7;
    }
LABEL_8:

    return 1;
  }
  return 0;
}

- (CalCalendarMigrationDefaultsProvider)defaultsProvider
{
  return self->_defaultsProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsProvider, 0);
}

@end
