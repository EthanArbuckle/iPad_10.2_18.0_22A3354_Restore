@implementation FIUIWorkoutActivityDefaultPaceMigrator

+ (void)migrateDefaultOutdoorRunningWalkingPaceFromCurrentToAverage
{
  void *v2;
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BE6B2C8]);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", CFSTR("com.apple.nanolifestyle.sessiontrackerapp"));
  objc_msgSend((id)objc_opt_class(), "migrateDefaultOutdoorRunningWalkingPaceFromCurrentToAverageWithSyncManager:domainAccessor:", v3, v2);

}

+ (void)migrateDefaultOutdoorRunningWalkingPaceFromCurrentToAverageWithSyncManager:(id)a3 domainAccessor:(id)a4
{
  id v5;
  id v6;
  os_log_t *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint8_t v22[8];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  _HKInitializeLogging();
  v7 = (os_log_t *)MEMORY[0x24BDD3078];
  v8 = *MEMORY[0x24BDD3078];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_21307C000, v8, OS_LOG_TYPE_DEFAULT, "[NanoHealthDataMigrator] Migrating activity pace setting if needed", v22, 2u);
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("ActivitySettingsFormatVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");
  _HKInitializeLogging();
  v11 = *v7;
  v12 = os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT);
  if (v10 < 1)
  {
    if (v12)
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_21307C000, v11, OS_LOG_TYPE_DEFAULT, "[NanoHealthDataMigrator] Will migrate activity pace setting...", v22, 2u);
    }
    v13 = (id)objc_msgSend(v6, "synchronize");
    objc_msgSend(v6, "objectForKey:", CFSTR("SettingsByActivityType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    _FIUIMigratedPaceSettings(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setObject:forKey:", v15, CFSTR("SettingsByActivityType"));
    objc_msgSend(v6, "setObject:forKey:", &unk_24CF4FE78, CFSTR("ActivitySettingsFormatVersion"));
    v16 = (id)objc_msgSend(v6, "synchronize");
    objc_msgSend(v6, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BDBCF20];
    v23[0] = CFSTR("ActivitySettingsFormatVersion");
    v23[1] = CFSTR("SettingsByActivityType");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronizeNanoDomain:keys:", v17, v20);

    _HKInitializeLogging();
    v21 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_21307C000, v21, OS_LOG_TYPE_DEFAULT, "[NanoHealthDataMigrator] Activity pace migration done.", v22, 2u);
    }

  }
  else if (v12)
  {
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_21307C000, v11, OS_LOG_TYPE_DEFAULT, "[NanoHealthDataMigrator] Migrating activity pace not needed, version is > 0", v22, 2u);
  }

}

@end
