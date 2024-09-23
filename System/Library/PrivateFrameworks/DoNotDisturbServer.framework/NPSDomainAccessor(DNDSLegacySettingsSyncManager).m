@implementation NPSDomainAccessor(DNDSLegacySettingsSyncManager)

- (id)dnds_bypassSettings
{
  uint64_t v1;
  void *v2;
  void *v3;
  char v5;

  v5 = 0;
  v1 = objc_msgSend(a1, "integerForKey:keyExistsAndHasValidFormat:", CFSTR("dndPrivilegedSenderTypes"), &v5);
  if (!v5)
    return 0;
  +[DNDSBypassSettingsRecord recordForLegacyPrivilegedSenderType:legacyAddressBookID:](DNDSBypassSettingsRecord, "recordForLegacyPrivilegedSenderType:legacyAddressBookID:", v1, 0xFFFFFFFFLL);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1D5A8], "settingsForRecord:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dnds_setBypassSettings:()DNDSLegacySettingsSyncManager
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a3, "makeRecord");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v6, "legacyPrivilegedSenderType");
  if (v4 == 2)
    v5 = 4;
  else
    v5 = v4;
  objc_msgSend(a1, "setInteger:forKey:", v5, CFSTR("dndPrivilegedSenderTypes"));

}

- (id)dnds_scheduleSettingsWithLastUpdated:()DNDSLegacySettingsSyncManager
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v17;

  v4 = a3;
  objc_msgSend(a1, "objectForKey:", CFSTR("dndEffectiveOverrides"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "dnds_secureLegacyUnarchiverForReadingFromData:error:", v5, &v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v10, *MEMORY[0x1E0CB2CD0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      +[DNDSScheduleSettingsRecord recordForLegacyBehaviorOverride:lastUpdated:](DNDSScheduleSettingsRecord, "recordForLegacyBehaviorOverride:lastUpdated:", v12, v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[DNDSScheduleSettings settingsForRecord:](DNDSScheduleSettings, "settingsForRecord:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = DNDSLogLegacySettingsSync;
      if (os_log_type_enabled((os_log_t)DNDSLogLegacySettingsSync, OS_LOG_TYPE_ERROR))
        -[NPSDomainAccessor(DNDSLegacySettingsSyncManager) dnds_scheduleSettingsWithLastUpdated:].cold.1((uint64_t)v7, v15);
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)dnds_setScheduleSettings:()DNDSLegacySettingsSyncManager
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v11[16];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "makeRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "legacyBehaviorOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "dnds_secureLegacyArchiver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v7, *MEMORY[0x1E0CB2CD0]);

    objc_msgSend(v6, "encodedData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(a1, "setObject:forKey:", v8, CFSTR("dndEffectiveOverrides"));
    }
    else
    {
      v10 = DNDSLogLegacySettingsSync;
      if (os_log_type_enabled((os_log_t)DNDSLogLegacySettingsSync, OS_LOG_TYPE_ERROR))
        -[NPSDomainAccessor(DNDSLegacySettingsSyncManager) dnds_setScheduleSettings:].cold.1(v10);
    }

  }
  else
  {
    v9 = DNDSLogLegacySettingsSync;
    if (os_log_type_enabled((os_log_t)DNDSLogLegacySettingsSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1CB895000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring schedule settings with no override", v11, 2u);
    }
  }

}

- (void)dnds_scheduleSettingsWithLastUpdated:()DNDSLegacySettingsSyncManager .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1CB895000, a2, OS_LOG_TYPE_ERROR, "Error decoding behavior overrides: error=%{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)dnds_setScheduleSettings:()DNDSLegacySettingsSyncManager .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CB895000, log, OS_LOG_TYPE_ERROR, "Error encoding behavior overrides", v1, 2u);
}

@end
