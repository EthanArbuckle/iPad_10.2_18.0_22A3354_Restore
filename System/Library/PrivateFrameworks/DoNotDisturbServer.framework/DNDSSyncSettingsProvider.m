@implementation DNDSSyncSettingsProvider

- (DNDSSyncSettingsProvider)init
{
  DNDSSyncSettingsProvider *v2;
  DNDSSyncSettingsProvider *v3;
  DNDSSyncSettings *v4;
  DNDSSyncSettings *syncSettings;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DNDSSyncSettingsProvider;
  v2 = -[DNDSSyncSettingsProvider init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = -[DNDSSyncSettings initWithPairSyncEnabled:cloudSyncEnabled:]([DNDSSyncSettings alloc], "initWithPairSyncEnabled:cloudSyncEnabled:", 1, -[DNDSSyncSettingsProvider _isCloudSyncPreferenceEnabled](v2, "_isCloudSyncPreferenceEnabled"));
    syncSettings = v3->_syncSettings;
    v3->_syncSettings = v4;

    -[DNDSSyncSettingsProvider _beginMonitoringForChanges](v3, "_beginMonitoringForChanges");
    -[DNDSSyncSettingsProvider _updatePairSyncPreferences](v3, "_updatePairSyncPreferences");
    -[DNDSSyncSettingsProvider _updateCloudSyncPreferences](v3, "_updateCloudSyncPreferences");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[DNDSSyncSettingsProvider _endMonitoringForChanges](self, "_endMonitoringForChanges");
  v3.receiver = self;
  v3.super_class = (Class)DNDSSyncSettingsProvider;
  -[DNDSSyncSettingsProvider dealloc](&v3, sel_dealloc);
}

- (void)setPairSyncEnabled:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  DNDSSyncSettings *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  NSObject *v13;
  void *v14;
  uint8_t v15[15];
  char v16;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = -[DNDSSyncSettings initWithPairSyncEnabled:cloudSyncEnabled:]([DNDSSyncSettings alloc], "initWithPairSyncEnabled:cloudSyncEnabled:", v3, -[DNDSSyncSettingsProvider _lock_isCloudSyncPreferenceEnabled](self, "_lock_isCloudSyncPreferenceEnabled"));
  -[DNDSSyncSettingsProvider _lock_accessor](self, "_lock_accessor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBool:forKey:", v3, CFSTR("mirrorDNDState"));
  v8 = (id)objc_msgSend(v7, "synchronize");
  v9 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("mirrorDNDState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "synchronizeNanoDomain:keys:", CFSTR("com.apple.nano"), v10);

  v16 = 0;
  v11 = objc_msgSend(v7, "BOOLForKey:keyExistsAndHasValidFormat:", CFSTR("mirrorDNDState"), &v16);
  if (v16)
  {
    v12 = v11;
    v13 = DNDSLogSettings;
    if (v11 == v3)
    {
      if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1CB895000, v13, OS_LOG_TYPE_DEFAULT, "Set Focus mirroring preference.", v15, 2u);
      }
    }
    else if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_FAULT))
    {
      -[DNDSSyncSettingsProvider setPairSyncEnabled:].cold.2(v13, v12, v3);
    }
  }
  else
  {
    v14 = (void *)DNDSLogSettings;
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_FAULT))
      -[DNDSSyncSettingsProvider setPairSyncEnabled:].cold.1(v14, v3);
  }
  -[DNDSSyncSettingsProvider _lock_updateSyncSettingsIfNewSettingsDiffer:](self, "_lock_updateSyncSettingsIfNewSettingsDiffer:", v6);
  os_unfair_lock_unlock(p_lock);

}

- (void)pairedDeviceDidChange
{
  os_unfair_lock_s *p_lock;
  NPSDomainAccessor *accessor;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  accessor = self->_accessor;
  self->_accessor = 0;

  -[DNDSSyncSettingsProvider _lock_updatePairSyncPreferences](self, "_lock_updatePairSyncPreferences");
  -[DNDSSyncSettingsProvider _lock_updateCompanionCloudSyncPreference](self, "_lock_updateCompanionCloudSyncPreference");
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_setCompanionCloudSyncPreferenceEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(MEMORY[0x1E0D1D5C8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "deviceClass");

  if (v5 == 1)
  {
    objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isPaired");

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBool:forKey:", !v3, CFSTR("dndCompanionCloudSyncDisabled"));

      v10 = (id)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("dndCompanionCloudSyncDisabled"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.donotdisturbd"), v9);

    }
  }
}

- (void)_lock_updateCompanionCloudSyncPreference
{
  id v3;

  os_unfair_lock_assert_owner(&self->_lock);
  -[DNDSSyncSettingsProvider syncSettings](self, "syncSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[DNDSSyncSettingsProvider _lock_setCompanionCloudSyncPreferenceEnabled:](self, "_lock_setCompanionCloudSyncPreferenceEnabled:", objc_msgSend(v3, "isCloudSyncEnabled"));

}

- (BOOL)_isCloudSyncPreferenceEnabled
{
  DNDSSyncSettingsProvider *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[DNDSSyncSettingsProvider _lock_isCloudSyncPreferenceEnabled](v2, "_lock_isCloudSyncPreferenceEnabled");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_lock_isCloudSyncPreferenceEnabled
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  char v7;

  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("disableCloudSync"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v2;
    v5 = CFSTR("disableCloudSync");
  }
  else
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("disableSync"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v5 = CFSTR("disableSync");
    else
      v5 = CFSTR("disableModeConfigurationsSync");
    v4 = v2;
  }
  v7 = objc_msgSend(v4, "BOOLForKey:", v5) ^ 1;

  return v7;
}

- (id)_lock_accessor
{
  NPSDomainAccessor *accessor;
  void *v4;
  NPSDomainAccessor *v5;
  NPSDomainAccessor *v6;
  void *v7;
  int v8;
  NSObject *v9;

  os_unfair_lock_assert_owner(&self->_lock);
  accessor = self->_accessor;
  if (!accessor)
  {
    objc_msgSend(MEMORY[0x1E0D1D5C8], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "deviceClass") == 1 || objc_msgSend(v4, "deviceClass") == 5)
    {
      v5 = (NPSDomainAccessor *)objc_msgSend(objc_alloc(MEMORY[0x1E0D51610]), "initWithDomain:", CFSTR("com.apple.nano"));
      v6 = self->_accessor;
      self->_accessor = v5;

      if (!self->_accessor)
      {
        objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isPaired");

        if (v8)
        {
          v9 = DNDSLogSettings;
          if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_FAULT))
            -[DNDSSyncSettingsProvider _lock_accessor].cold.1(v9);
        }
      }
    }

    accessor = self->_accessor;
  }
  return accessor;
}

- (BOOL)_lock_isPairSyncPreferenceEnabled
{
  void *v2;
  id v3;
  char v4;
  BOOL v5;
  char v7;

  -[DNDSSyncSettingsProvider _lock_accessor](self, "_lock_accessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "synchronize");
  v7 = 0;
  v4 = objc_msgSend(v2, "BOOLForKey:keyExistsAndHasValidFormat:", CFSTR("mirrorDNDState"), &v7);
  if (v7)
    v5 = v4;
  else
    v5 = 1;

  return v5;
}

- (void)_beginMonitoringForChanges
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("disableCloudSync"), 1, 0);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)DNDMirrorStateChanged, CFSTR("MirrorDNDStateChangedNotification"), 0, (CFNotificationSuspensionBehavior)0);
}

- (void)_endMonitoringForChanges
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("MirrorDNDStateChangedNotification"), 0);
}

- (void)_updatePairSyncPreferences
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[DNDSSyncSettingsProvider _lock_updatePairSyncPreferences](self, "_lock_updatePairSyncPreferences");
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_updatePairSyncPreferences
{
  _BOOL8 v3;
  void *v4;
  id v5;

  os_unfair_lock_assert_owner(&self->_lock);
  v3 = -[DNDSSyncSettingsProvider _lock_isPairSyncPreferenceEnabled](self, "_lock_isPairSyncPreferenceEnabled");
  -[DNDSSyncSettingsProvider syncSettings](self, "syncSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setPairSyncEnabled:", v3);
  -[DNDSSyncSettingsProvider _lock_updateSyncSettingsIfNewSettingsDiffer:](self, "_lock_updateSyncSettingsIfNewSettingsDiffer:", v5);

}

- (void)_updateCloudSyncPreferences
{
  os_unfair_lock_s *p_lock;
  _BOOL8 v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[DNDSSyncSettingsProvider _lock_isCloudSyncPreferenceEnabled](self, "_lock_isCloudSyncPreferenceEnabled");
  -[DNDSSyncSettingsProvider syncSettings](self, "syncSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCloudSyncEnabled");

  if (v4 != v6)
    -[DNDSSyncSettingsProvider _lock_setCompanionCloudSyncPreferenceEnabled:](self, "_lock_setCompanionCloudSyncPreferenceEnabled:", v4);
  -[DNDSSyncSettingsProvider syncSettings](self, "syncSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "setCloudSyncEnabled:", v4);
  -[DNDSSyncSettingsProvider _lock_updateSyncSettingsIfNewSettingsDiffer:](self, "_lock_updateSyncSettingsIfNewSettingsDiffer:", v8);
  os_unfair_lock_unlock(p_lock);

}

- (void)_lock_updateSyncSettingsIfNewSettingsDiffer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  void *v11;
  _BYTE v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[DNDSSyncSettingsProvider syncSettings](self, "syncSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqual:", v4))
  {
    if (self->_initialized)
    {
      v6 = DNDSLogSettings;
      if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v12 = 138412546;
        *(_QWORD *)&v12[4] = v4;
        *(_WORD *)&v12[12] = 2112;
        *(_QWORD *)&v12[14] = v5;
        v7 = "New sync settings: %@. Old: %@";
        v8 = v6;
        v9 = 22;
LABEL_9:
        _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, v7, v12, v9);
      }
LABEL_10:
      -[DNDSSyncSettingsProvider setSyncSettings:](self, "setSyncSettings:", v4, *(_OWORD *)v12, *(_QWORD *)&v12[16], v13);
      -[DNDSSyncSettingsProvider delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "syncSettingsProvider:didReceiveUpdatedSyncSettings:", self, v4);

      goto LABEL_11;
    }
LABEL_7:
    self->_initialized = 1;
    v10 = DNDSLogSettings;
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v12 = 138412290;
      *(_QWORD *)&v12[4] = v4;
      v7 = "Initialized sync settings to %@";
      v8 = v10;
      v9 = 12;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  if (!self->_initialized)
    goto LABEL_7;
LABEL_11:

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("disableCloudSync"), a4, a5, a6))
    -[DNDSSyncSettingsProvider _updateCloudSyncPreferences](self, "_updateCloudSyncPreferences");
}

- (DNDSSyncSettings)syncSettings
{
  return (DNDSSyncSettings *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSyncSettings:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (DNDSSyncSettingsProviderDelegate)delegate
{
  return (DNDSSyncSettingsProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_syncSettings, 0);
  objc_storeStrong((id *)&self->_accessor, 0);
}

- (void)setPairSyncEnabled:(void *)a1 .cold.1(void *a1, char a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a1;
  objc_msgSend(v3, "numberWithBool:", a2 & 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v5;
  _os_log_fault_impl(&dword_1CB895000, v4, OS_LOG_TYPE_FAULT, "Failed to set Focus mirroring preference. Key does not exist or is invalid format. Expected %@.", (uint8_t *)&v6, 0xCu);

}

- (void)setPairSyncEnabled:(char)a3 .cold.2(void *a1, char a2, char a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a1;
  objc_msgSend(v5, "numberWithBool:", a2 & 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3 & 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = v7;
  v11 = 2112;
  v12 = v8;
  _os_log_fault_impl(&dword_1CB895000, v6, OS_LOG_TYPE_FAULT, "Failed to set Focus mirroring preference. Accessor returned %@. Expected %@.", (uint8_t *)&v9, 0x16u);

}

- (void)_lock_accessor
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1CB895000, log, OS_LOG_TYPE_FAULT, "Failed to get NPS accessor on paired device.", v1, 2u);
}

@end
