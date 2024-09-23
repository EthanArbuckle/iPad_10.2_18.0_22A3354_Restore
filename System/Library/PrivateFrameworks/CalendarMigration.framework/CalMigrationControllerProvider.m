@implementation CalMigrationControllerProvider

+ (id)reminderMigrationController
{
  void *v3;
  void *v4;

  +[CalDefaultReminderKitProvider sharedInstance](CalDefaultReminderKitProvider, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "reminderMigrationControllerWithReminderKitProvider:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)reminderMigrationControllerWithReminderKitProvider:(id)a3
{
  return (id)objc_msgSend(a3, "newDatabaseMigrationContext");
}

@end
