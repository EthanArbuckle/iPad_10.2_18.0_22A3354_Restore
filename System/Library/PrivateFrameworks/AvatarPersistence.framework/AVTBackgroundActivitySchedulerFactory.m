@implementation AVTBackgroundActivitySchedulerFactory

+ (id)schedulerForPostInstallMigrationActivity
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1470]), "initWithIdentifier:", CFSTR("com.apple.avatar.activity.PostInstallMigration"));
  objc_msgSend(v2, "setPreregistered:", 1);
  return v2;
}

+ (id)schedulerForUserRequestedBackupActivity
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1470]), "initWithIdentifier:", CFSTR("com.apple.avatar.activity.UserRequestedBackup"));
  objc_msgSend(v2, "setPreregistered:", 1);
  return v2;
}

@end
