@implementation CalMigratorProvider

+ (id)reminderMigrator
{
  void *v3;
  void *v4;

  +[CalDefaultReminderMigrationDefaultsProvider sharedInstance](CalDefaultReminderMigrationDefaultsProvider, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "reminderMigratorWithDefaultsProvider:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)reminderMigratorWithDefaultsProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[CalDefaultReminderKitProvider sharedInstance](CalDefaultReminderKitProvider, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "reminderMigratorWithReminderKitProvider:defaultsProvider:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)reminderMigratorWithReminderKitProvider:(id)a3 defaultsProvider:(id)a4
{
  id v5;
  id v6;
  CalCalendarDatabaseReminderMigrator *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CalCalendarDatabaseReminderMigrator initWithReminderKitProvider:defaultsProvider:]([CalCalendarDatabaseReminderMigrator alloc], "initWithReminderKitProvider:defaultsProvider:", v6, v5);

  return v7;
}

@end
