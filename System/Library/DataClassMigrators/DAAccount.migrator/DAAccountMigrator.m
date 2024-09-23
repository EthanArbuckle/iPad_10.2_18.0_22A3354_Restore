@implementation DAAccountMigrator

- (id)dataClassName
{
  return CFSTR("da_accounts");
}

- (BOOL)performMigration
{
  NSObject *v3;
  os_log_type_t v4;
  _BOOL8 v5;
  uint8_t v7[16];

  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_22DE4B000, v3, v4, "DataAccess DAAccountMigrator reporting for duty.  Heh.  Duty.", v7, 2u);
  }

  v5 = -[DataClassMigrator didUpgrade](self, "didUpgrade")
    || -[DataClassMigrator didRestoreFromBackup](self, "didRestoreFromBackup")
    || -[DataClassMigrator didMigrateBackupFromDifferentDevice](self, "didMigrateBackupFromDifferentDevice");
  objc_msgSend(MEMORY[0x24BE2AA80], "upgradeAccounts:", v5);
  return 1;
}

- (float)estimatedDuration
{
  return 0.1;
}

- (float)migrationProgress
{
  return 1.0;
}

@end
