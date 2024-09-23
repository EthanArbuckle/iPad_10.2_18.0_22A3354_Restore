@implementation NSUserDefaults(FIUIBackupSupport)

+ (uint64_t)fu_backupStandardUserDefaultsKey:()FIUIBackupSupport
{
  return objc_msgSend(a1, "fu_backupStandardUserDefaultsKey:useContainer:", a3, 0);
}

+ (id)fu_npsManager
{
  if (fu_npsManager_onceToken != -1)
    dispatch_once(&fu_npsManager_onceToken, &__block_literal_global_14);
  return (id)fu_npsManager_npsManager;
}

+ (void)fu_backupAndSetObject:()FIUIBackupSupport forKey:
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDBCF50];
  v9 = a4;
  v7 = a3;
  objc_msgSend(v6, "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v9);

  objc_msgSend(a1, "fu_backupStandardUserDefaultsKey:", v9);
}

+ (void)fu_backupAndSetInteger:()FIUIBackupSupport forKey:
{
  void *v6;
  void *v7;
  id v8;

  v6 = (void *)MEMORY[0x24BDBCF50];
  v8 = a4;
  objc_msgSend(v6, "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInteger:forKey:", a3, v8);

  objc_msgSend(a1, "fu_backupStandardUserDefaultsKey:", v8);
}

+ (void)fu_backupAndSetFloat:()FIUIBackupSupport forKey:
{
  void *v6;
  void *v7;
  double v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDBCF50];
  v9 = a4;
  objc_msgSend(v6, "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a2;
  objc_msgSend(v7, "setFloat:forKey:", v9, v8);

  objc_msgSend(a1, "fu_backupStandardUserDefaultsKey:", v9);
}

+ (void)fu_backupAndSetDouble:()FIUIBackupSupport forKey:
{
  void *v6;
  void *v7;
  id v8;

  v6 = (void *)MEMORY[0x24BDBCF50];
  v8 = a4;
  objc_msgSend(v6, "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDouble:forKey:", v8, a2);

  objc_msgSend(a1, "fu_backupStandardUserDefaultsKey:", v8);
}

+ (void)fu_backupAndSetBool:()FIUIBackupSupport forKey:
{
  void *v6;
  void *v7;
  id v8;

  v6 = (void *)MEMORY[0x24BDBCF50];
  v8 = a4;
  objc_msgSend(v6, "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBool:forKey:", a3, v8);

  objc_msgSend(a1, "fu_backupStandardUserDefaultsKey:", v8);
}

+ (void)fu_backupAndSetURL:()FIUIBackupSupport forKey:
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDBCF50];
  v9 = a4;
  v7 = a3;
  objc_msgSend(v6, "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setURL:forKey:", v7, v9);

  objc_msgSend(a1, "fu_backupStandardUserDefaultsKey:", v9);
}

+ (void)fu_backupStandardUserDefaultsKey:()FIUIBackupSupport useContainer:
{
  NSObject *v0;

  _HKInitializeLogging();
  v0 = *MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_ERROR))
    +[NSUserDefaults(FIUIBackupSupport) fu_backupStandardUserDefaultsKey:useContainer:].cold.1(v0);
}

+ (uint64_t)fu_synchronizeStandardUserDefaultsKey:()FIUIBackupSupport
{
  return objc_msgSend(a1, "fu_synchronizeStandardUserDefaultsKey:useContainer:", a3, 0);
}

+ (void)fu_synchronizeStandardUserDefaultsKey:()FIUIBackupSupport useContainer:
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _HKInitializeLogging();
  v7 = *MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v6;
    _os_log_impl(&dword_21307C000, v7, OS_LOG_TYPE_DEFAULT, "Synchronizing default with key: %@", (uint8_t *)&v13, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fu_npsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
    v12 = v9;
  else
    v12 = 0;
  objc_msgSend(v10, "synchronizeUserDefaultsDomain:keys:container:", v9, v11, v12);

}

+ (void)fu_backupStandardUserDefaultsKey:()FIUIBackupSupport useContainer:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21307C000, log, OS_LOG_TYPE_ERROR, "NPS user defaults backup only supported on nano", v1, 2u);
}

@end
