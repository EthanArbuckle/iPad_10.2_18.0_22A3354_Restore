@implementation DNDSLegacySettingsSyncManager

+ (void)cleanupState
{
  NSObject *v2;
  void *v3;
  id v4;
  uint8_t v5[16];

  v2 = DNDSLogLegacySettingsSync;
  if (os_log_type_enabled((os_log_t)DNDSLogLegacySettingsSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CB895000, v2, OS_LOG_TYPE_DEFAULT, "Cleaning up state", v5, 2u);
  }
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D51610]), "initWithDomain:", CFSTR("com.apple.nano"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("dndEffectiveOverrides"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("dndPrivilegedSenderTypes"));
  v4 = (id)objc_msgSend(v3, "synchronize");

}

+ (id)sendManagerForPairedDevice:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithListen:send:pairedDevice:", 0, 1, v4);

  return v5;
}

+ (id)receiveManagerForPairedDevice:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithListen:send:pairedDevice:", 1, 0, v4);

  return v5;
}

- (id)_initWithListen:(BOOL)a3 send:(BOOL)a4 pairedDevice:(id)a5
{
  id v8;
  DNDSLegacySettingsSyncManager *v9;
  DNDSLegacySettingsSyncManager *v10;
  NPSManager *v11;
  NPSManager *npsManager;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NPSDomainAccessor *accessor;
  objc_super v19;

  v8 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DNDSLegacySettingsSyncManager;
  v9 = -[DNDSLegacySettingsSyncManager init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_listen = a3;
    v9->_send = a4;
    v11 = (NPSManager *)objc_alloc_init(MEMORY[0x1E0D51618]);
    npsManager = v10->_npsManager;
    v10->_npsManager = v11;

    v13 = objc_alloc(MEMORY[0x1E0D51610]);
    objc_msgSend(v8, "pairingIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pairingDataStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "initWithDomain:pairingID:pairingDataStore:", CFSTR("com.apple.nano"), v14, v15);
    accessor = v10->_accessor;
    v10->_accessor = (NPSDomainAccessor *)v16;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_listen)
    -[DNDSLegacySettingsSyncManager _endMonitoringForChanges](self, "_endMonitoringForChanges");
  v3.receiver = self;
  v3.super_class = (Class)DNDSLegacySettingsSyncManager;
  -[DNDSLegacySettingsSyncManager dealloc](&v3, sel_dealloc);
}

- (void)resume
{
  if (self->_listen)
  {
    -[DNDSLegacySettingsSyncManager _beginMonitoringForChanges](self, "_beginMonitoringForChanges");
    -[DNDSLegacySettingsSyncManager _updateBypassSettings](self, "_updateBypassSettings");
    -[DNDSLegacySettingsSyncManager _updateScheduleSettingsWithDate:](self, "_updateScheduleSettingsWithDate:", 0);
  }
  -[DNDSLegacySettingsSyncManager update](self, "update");
}

- (void)update
{
  void *v3;
  void *v4;
  id v5;

  if (self->_send)
  {
    -[DNDSLegacySettingsSyncManager dataSource](self, "dataSource");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "phoneCallBypassSettingsForSyncManager:", self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheduleSettingsForSyncManager:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSLegacySettingsSyncManager _propagateBypassSettings:](self, "_propagateBypassSettings:", v3);
    -[DNDSLegacySettingsSyncManager _propagateScheduleSettings:](self, "_propagateScheduleSettings:", v4);

  }
}

- (void)_beginMonitoringForChanges
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)DNDEffectiveOverridesChanged, CFSTR("DNDEffectiveOverridesChangedNotification"), 0, (CFNotificationSuspensionBehavior)0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)DNDPrivilegedSenderChanged, CFSTR("DNDPrivilegedSenderChangedNotification"), 0, (CFNotificationSuspensionBehavior)0);
}

- (void)_endMonitoringForChanges
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("DNDEffectiveOverridesChangedNotification"), 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, CFSTR("DNDPrivilegedSenderChangedNotification"), 0);
}

- (void)_propagateScheduleSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NPSDomainAccessor *accessor;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v5, "scheduleEnabledSetting");
  objc_msgSend(v5, "setScheduleEnabledSetting:", DNDResolvedScheduleEnabledSetting());
  objc_msgSend(v5, "setBedtimeBehaviorEnabledSetting:", 0);
  objc_msgSend(v4, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[DNDSScheduleSettings settingsWithClientSettings:creationDate:](DNDSScheduleSettings, "settingsWithClientSettings:creationDate:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (id)-[NPSDomainAccessor synchronize](self->_accessor, "synchronize");
  accessor = self->_accessor;
  objc_msgSend(v4, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPSDomainAccessor dnds_scheduleSettingsWithLastUpdated:](accessor, "dnds_scheduleSettingsWithLastUpdated:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v11 && (!v7 || !v11 || (objc_msgSend(v7, "isEqual:", v11) & 1) == 0))
  {
    v12 = DNDSLogLegacySettingsSync;
    if (os_log_type_enabled((os_log_t)DNDSLogLegacySettingsSync, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543618;
      v16 = v4;
      v17 = 2114;
      v18 = v11;
      _os_log_impl(&dword_1CB895000, v12, OS_LOG_TYPE_DEFAULT, "Got new schedule settings: settings=%{public}@, oldSettings=%{public}@", (uint8_t *)&v15, 0x16u);
    }
    -[NPSDomainAccessor dnds_setScheduleSettings:](self->_accessor, "dnds_setScheduleSettings:", v4);
    v13 = (id)-[NPSDomainAccessor synchronize](self->_accessor, "synchronize");
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("dndEffectiveOverrides"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPSManager synchronizeNanoDomain:keys:](self->_npsManager, "synchronizeNanoDomain:keys:", CFSTR("com.apple.nano"), v14);

  }
}

- (void)_updateScheduleSettingsWithDate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id)-[NPSDomainAccessor synchronize](self->_accessor, "synchronize");
  -[DNDSLegacySettingsSyncManager dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheduleSettingsForSyncManager:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v8 = v4;
  }
  else
  {
    objc_msgSend(v7, "creationDate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  -[NPSDomainAccessor dnds_scheduleSettingsWithLastUpdated:](self->_accessor, "dnds_scheduleSettingsWithLastUpdated:", v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10 && v7 != (void *)v10 && (!v7 || (objc_msgSend(v7, "isEqual:", v10) & 1) == 0))
  {
    if (v4)
    {
      v12 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
    +[DNDSScheduleSettings settingsWithClientSettings:creationDate:](DNDSScheduleSettings, "settingsWithClientSettings:creationDate:", v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = DNDSLogLegacySettingsSync;
    if (os_log_type_enabled((os_log_t)DNDSLogLegacySettingsSync, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543362;
      v18 = v14;
      _os_log_impl(&dword_1CB895000, v15, OS_LOG_TYPE_DEFAULT, "Got new schedule settings: settings=%{public}@", (uint8_t *)&v17, 0xCu);
    }
    -[DNDSLegacySettingsSyncManager delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "syncManager:didReceiveUpdatedScheduleSettings:", self, v14);

  }
}

- (void)_propagateBypassSettings:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v5, "immediateBypassEventSourceType");
  objc_msgSend(v5, "setImmediateBypassEventSourceType:", DNDResolvedImmediateBypassEventSourceType());
  objc_msgSend(v5, "setImmediateBypassCNGroupIdentifier:", 0);
  objc_msgSend(v5, "repeatEventSourceBehaviorEnabledSetting");
  objc_msgSend(v5, "setRepeatEventSourceBehaviorEnabledSetting:", DNDResolvedRepeatEventSourceBehaviorEnabledSetting());
  v6 = (id)-[NPSDomainAccessor synchronize](self->_accessor, "synchronize");
  -[NPSDomainAccessor dnds_bypassSettings](self->_accessor, "dnds_bypassSettings");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5 != (void *)v7 && (!v5 || !v7 || (objc_msgSend(v5, "isEqual:", v7) & 1) == 0))
  {
    v9 = DNDSLogLegacySettingsSync;
    if (os_log_type_enabled((os_log_t)DNDSLogLegacySettingsSync, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543618;
      v13 = v4;
      v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_1CB895000, v9, OS_LOG_TYPE_DEFAULT, "Got new bypass settings: settings=%{public}@, oldSettings=%{public}@", (uint8_t *)&v12, 0x16u);
    }
    -[NPSDomainAccessor dnds_setBypassSettings:](self->_accessor, "dnds_setBypassSettings:", v4);
    v10 = (id)-[NPSDomainAccessor synchronize](self->_accessor, "synchronize");
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("dndPrivilegedSenderTypes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPSManager synchronizeNanoDomain:keys:](self->_npsManager, "synchronizeNanoDomain:keys:", CFSTR("com.apple.nano"), v11);

  }
}

- (void)_updateBypassSettings
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (id)-[NPSDomainAccessor synchronize](self->_accessor, "synchronize");
  -[DNDSLegacySettingsSyncManager dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneCallBypassSettingsForSyncManager:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPSDomainAccessor dnds_bypassSettings](self->_accessor, "dnds_bypassSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v6 == v5;
  else
    v8 = 1;
  if (!v8 && (!v5 || (objc_msgSend(v6, "isEqual:", v5) & 1) == 0))
  {
    v9 = DNDSLogLegacySettingsSync;
    if (os_log_type_enabled((os_log_t)DNDSLogLegacySettingsSync, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v7;
      _os_log_impl(&dword_1CB895000, v9, OS_LOG_TYPE_DEFAULT, "Got new bypass settings: settings=%{public}@", (uint8_t *)&v11, 0xCu);
    }
    -[DNDSLegacySettingsSyncManager delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "syncManager:didReceiveUpdatedPhoneCallBypassSettings:", self, v7);

  }
}

- (DNDSSettingsSyncManagerDataSource)dataSource
{
  return (DNDSSettingsSyncManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (DNDSSettingsSyncManagerDelegate)delegate
{
  return (DNDSSettingsSyncManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_accessor, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
}

@end
