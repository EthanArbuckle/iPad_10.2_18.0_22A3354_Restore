@implementation CalDefaultReminderMigrationDefaultsProvider

+ (CalDefaultReminderMigrationDefaultsProvider)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (CalDefaultReminderMigrationDefaultsProvider *)(id)sharedInstance_instance;
}

void __61__CalDefaultReminderMigrationDefaultsProvider_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = v0;

}

- (BOOL)shouldBackupBeforeMigration
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE13F88], "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ShouldBackupBeforeRemindersMigration"));

  return v3;
}

- (BOOL)havePerformedReminderMigrationCleanup
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BE13F88], "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("LastReminderMigrationCleanupVersion"));

  return v3 == 1;
}

- (void)setHavePerformedReminderMigrationCleanup:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  const __CFString *v5;
  id v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE13F88], "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setInteger:forKey:", 1, CFSTR("LastReminderMigrationCleanupVersion"));

    objc_msgSend(MEMORY[0x24BE13F88], "shared");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("LastReminderMigrationCleanupSystemVersion");
    v6 = v4;
  }
  else
  {
    v5 = CFSTR("LastReminderMigrationCleanupVersion");
  }
  objc_msgSend(v4, "removeObjectForKey:", v5);

}

@end
