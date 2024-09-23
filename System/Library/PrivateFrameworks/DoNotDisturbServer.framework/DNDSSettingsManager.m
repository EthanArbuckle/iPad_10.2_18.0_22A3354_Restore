@implementation DNDSSettingsManager

- (DNDSSettingsManager)initWithBackingStore:(id)a3 contactStore:(id)a4
{
  id v7;
  id v8;
  DNDSSettingsManager *v9;
  uint64_t v10;
  OS_dispatch_queue *queue;
  DNDSSyncSettingsProvider *v12;
  DNDSSyncSettingsProvider *syncSettingsProvider;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DNDSSettingsManager;
  v9 = -[DNDSSettingsManager init](&v15, sel_init);
  if (v9)
  {
    +[DNDSWorkloop serialQueueTargetingSharedWorkloop:](DNDSWorkloop, "serialQueueTargetingSharedWorkloop:", CFSTR("com.apple.donotdisturb.server.SettingsManager"));
    v10 = objc_claimAutoreleasedReturnValue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_backingStore, a3);
    objc_storeStrong((id *)&v9->_contactStore, a4);
    v12 = objc_alloc_init(DNDSSyncSettingsProvider);
    syncSettingsProvider = v9->_syncSettingsProvider;
    v9->_syncSettingsProvider = v12;

    -[DNDSSyncSettingsProvider setDelegate:](v9->_syncSettingsProvider, "setDelegate:", v9);
    DNDSRegisterSysdiagnoseDataProvider(v9);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  DNDSUnregisterSysdiagnoseDataProvider(self);
  v3.receiver = self;
  v3.super_class = (Class)DNDSSettingsManager;
  -[DNDSSettingsManager dealloc](&v3, sel_dealloc);
}

- (void)pairedDeviceDidChange
{
  -[DNDSSyncSettingsProvider pairedDeviceDidChange](self->_syncSettingsProvider, "pairedDeviceDidChange");
}

- (id)behaviorSettingsWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[DNDSSettingsManager _readSettingsReturningError:](self, "_readSettingsReturningError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0D1D5A0];
    objc_msgSend(v3, "behaviorSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "settingsForRecord:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)setBehaviorSettings:(id)a3 withError:(id *)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  BOOL v9;

  v6 = a3;
  v7 = -[DNDSSettingsManager _saveBehaviorSettings:scheduleSettings:error:](self, "_saveBehaviorSettings:scheduleSettings:error:", v6, 0, a4);
  if (v7 != 1)
  {
    if (v7 != 2)
    {
      v9 = 0;
      goto LABEL_6;
    }
    -[DNDSSettingsManager delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "settingsManager:didReceiveUpdatedBehaviorSettings:", self, v6);

  }
  v9 = 1;
LABEL_6:

  return v9;
}

- (id)phoneCallBypassSettingsWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[DNDSSettingsManager _readSettingsReturningError:](self, "_readSettingsReturningError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0D1D5A8];
    objc_msgSend(v3, "phoneCallBypassSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "settingsForRecord:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)scheduleSettingsWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[DNDSSettingsManager _readSettingsReturningError:](self, "_readSettingsReturningError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "scheduleSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSScheduleSettings settingsForRecord:](DNDSScheduleSettings, "settingsForRecord:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)setScheduleSettings:(id)a3 withError:(id *)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  BOOL v9;

  v6 = a3;
  v7 = -[DNDSSettingsManager _saveBehaviorSettings:scheduleSettings:error:](self, "_saveBehaviorSettings:scheduleSettings:error:", 0, v6, a4);
  if (v7 != 1)
  {
    if (v7 != 2)
    {
      v9 = 0;
      goto LABEL_6;
    }
    -[DNDSSettingsManager delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "settingsManager:didReceiveUpdatedScheduleSettings:", self, v6);

  }
  v9 = 1;
LABEL_6:

  return v9;
}

- (id)syncSettingsWithError:(id *)a3
{
  return -[DNDSSyncSettingsProvider syncSettings](self->_syncSettingsProvider, "syncSettings", a3);
}

- (void)setPairSyncEnabled:(BOOL)a3
{
  -[DNDSSyncSettingsProvider setPairSyncEnabled:](self->_syncSettingsProvider, "setPairSyncEnabled:", a3);
}

- (id)_readSettingsReturningError:(id *)a3
{
  DNDSBackingStore *backingStore;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v10;

  backingStore = self->_backingStore;
  v10 = 0;
  -[DNDSBackingStore readRecordWithError:](backingStore, "readRecordWithError:", &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v7 = v6;
  if (v6)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v6);
    v8 = DNDSLogSettings;
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR))
      -[DNDSSettingsManager _readSettingsReturningError:].cold.1((uint64_t)v7, v8);
    _DNDSRequestRadar(CFSTR("Failed to load settings"), v7, 0, CFSTR("/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSSettingsManager.m"), 163);
  }

  return v5;
}

- (unint64_t)_saveBehaviorSettings:(id)a3 scheduleSettings:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  DNDSMutableSettingsRecord *v13;
  DNDSMutableSettingsRecord *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  DNDSSettingsManager *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  DNDSSettingsManager *v29;
  id *v30;
  void *v31;
  unint64_t v32;
  char v34;
  char v35;
  void *v36;

  v8 = a3;
  v9 = a4;
  -[DNDSBackingStore readRecordWithError:](self->_backingStore, "readRecordWithError:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = objc_alloc_init(DNDSMutableSettingsRecord);
  v14 = v13;

  if (!v8)
  {
    if (!v9)
      goto LABEL_26;
    LOBYTE(v23) = 0;
    goto LABEL_17;
  }
  objc_msgSend(v8, "makeRecord");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSettingsRecord behaviorSettings](v14, "behaviorSettings");
  v16 = objc_claimAutoreleasedReturnValue();
  if ((void *)v16 == v15)
  {

    goto LABEL_13;
  }
  v17 = (void *)v16;
  -[DNDSSettingsRecord behaviorSettings](v14, "behaviorSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18 && v15)
  {
    -[DNDSSettingsRecord behaviorSettings](v14, "behaviorSettings");
    v20 = v10;
    v21 = self;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v22, "isEqual:", v15);

    self = v21;
    v10 = v20;

    if ((v35 & 1) == 0)
      goto LABEL_15;
LABEL_13:
    v23 = 0;
    goto LABEL_16;
  }

LABEL_15:
  -[DNDSMutableSettingsRecord setBehaviorSettings:](v14, "setBehaviorSettings:", v15);
  v23 = 1;
LABEL_16:

  if (!v9)
  {
    if (v23)
      goto LABEL_29;
    goto LABEL_26;
  }
LABEL_17:
  objc_msgSend(v9, "makeRecord");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSettingsRecord scheduleSettings](v14, "scheduleSettings");
  v25 = objc_claimAutoreleasedReturnValue();
  if ((void *)v25 == v24)
  {

  }
  else
  {
    v26 = (void *)v25;
    -[DNDSSettingsRecord scheduleSettings](v14, "scheduleSettings");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (!v27 || !v24)
    {

LABEL_28:
      -[DNDSMutableSettingsRecord setScheduleSettings:](v14, "setScheduleSettings:", v24);

      goto LABEL_29;
    }
    -[DNDSSettingsRecord scheduleSettings](v14, "scheduleSettings");
    v36 = v10;
    v29 = self;
    v30 = a5;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v31, "isEqual:", v24);

    a5 = v30;
    self = v29;
    v10 = v36;

    if ((v34 & 1) == 0)
      goto LABEL_28;
  }

  if ((v23 & 1) != 0)
  {
LABEL_29:
    v32 = -[DNDSSettingsManager _writeSettingsRecord:error:](self, "_writeSettingsRecord:error:", v14, a5);
    goto LABEL_30;
  }
LABEL_26:
  v32 = 1;
LABEL_30:

  return v32;
}

- (unint64_t)_saveConfiguration:(id)a3 forModeIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  DNDSMutableSettingsRecord *v13;
  DNDSMutableSettingsRecord *v14;
  void *v15;
  void *v16;
  void *v17;
  DNDSMutableConfigurationsRecord *v18;
  DNDSMutableConfigurationsRecord *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;

  v8 = a3;
  v9 = a4;
  -[DNDSBackingStore readRecordWithError:](self->_backingStore, "readRecordWithError:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = objc_alloc_init(DNDSMutableSettingsRecord);
  v14 = v13;

  objc_msgSend(v10, "configurations");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");
  v17 = v16;
  if (v16)
    v18 = v16;
  else
    v18 = objc_alloc_init(DNDSMutableConfigurationsRecord);
  v19 = v18;

  objc_msgSend(v15, "configurationForModeIdentifier:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "makeRecord");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v20 == (void *)v21 || v20 && v21 && (objc_msgSend(v20, "isEqual:", v21) & 1) != 0)
  {
    v23 = 1;
  }
  else
  {
    -[DNDSMutableConfigurationsRecord setConfiguration:forModeIdentifier:](v19, "setConfiguration:forModeIdentifier:", v8, v9);
    -[DNDSMutableSettingsRecord setConfigurations:](v14, "setConfigurations:", v19);
    v23 = -[DNDSSettingsManager _writeSettingsRecord:error:](self, "_writeSettingsRecord:error:", v14, a5);
  }

  return v23;
}

- (unint64_t)_writeSettingsRecord:(id)a3 error:(id *)a4
{
  id v6;
  DNDSBackingStore *backingStore;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  backingStore = self->_backingStore;
  v16 = 0;
  v8 = -[DNDSBackingStore writeRecord:error:](backingStore, "writeRecord:error:", v6, &v16);
  v9 = v16;
  v10 = v9;
  if (v8)
  {
    if (v8 == 1)
    {
      v14 = DNDSLogSettings;
      if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v10;
        _os_log_impl(&dword_1CB895000, v14, OS_LOG_TYPE_DEFAULT, "Failed to save settings, but error can be ignored; error=%{public}@",
          buf,
          0xCu);
      }
    }
    else if (v8 == 2)
    {
      v11 = DNDSLogSettings;
      if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v6;
        _os_log_impl(&dword_1CB895000, v11, OS_LOG_TYPE_DEFAULT, "Saved settings; settingsRecord=%{public}@", buf, 0xCu);
      }
      v12 = 2;
      goto LABEL_16;
    }
    v12 = 1;
    goto LABEL_16;
  }
  if (a4 && v9)
    *a4 = objc_retainAutorelease(v9);
  v13 = DNDSLogSettings;
  if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR))
    -[DNDSSettingsManager _writeSettingsRecord:error:].cold.1((uint64_t)v6, (uint64_t)v10, v13);
  _DNDSRequestRadar(CFSTR("Error saving settings"), v10, 0, CFSTR("/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSSettingsManager.m"), 239);
  v12 = 0;
LABEL_16:

  return v12;
}

- (void)syncSettingsProvider:(id)a3 didReceiveUpdatedSyncSettings:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[DNDSSettingsManager delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settingsManager:didReceiveUpdatedSyncSettings:", self, v5);

}

- (NSString)sysdiagnoseDataIdentifier
{
  return (NSString *)CFSTR("com.apple.donotdisturb.SettingsManager");
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  const __CFString *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  DNDSSettingsManager *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[6];
  _QWORD v53[6];
  const __CFString *v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSettingsManager behaviorSettingsWithError:](self, "behaviorSettingsWithError:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "interruptionBehaviorSetting");
    DNDStringFromInterruptionBehaviorSetting();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "interruptionBehaviorSetting");
    DNDResolvedInterruptionBehaviorSetting();
    DNDStringFromInterruptionBehaviorSetting();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = CFSTR("interruption-behavior");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("behavior-settings"));
  }
  -[DNDSSettingsManager scheduleSettingsWithError:](self, "scheduleSettingsWithError:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "scheduleEnabledSetting");
    DNDEnabledSettingToString();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scheduleEnabledSetting");
    DNDResolvedScheduleEnabledSetting();
    DNDEnabledSettingToString();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bedtimeBehaviorEnabledSetting");
    DNDEnabledSettingToString();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bedtimeBehaviorEnabledSetting");
    DNDResolvedBedtimeBehaviorEnabledSetting();
    DNDEnabledSettingToString();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = CFSTR("creation-date-local");
    v14 = (void *)MEMORY[0x1E0CB3578];
    objc_msgSend(v13, "creationDate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringFromDate:dateStyle:timeStyle:", v45, 1, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v42;
    v52[1] = CFSTR("creation-date-timestamp");
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v13, "creationDate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "timeIntervalSinceReferenceDate");
    objc_msgSend(v15, "numberWithDouble:");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v40;
    v52[2] = CFSTR("enabled");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), v44, v43);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v53[2] = v39;
    v52[3] = CFSTR("start-time");
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "timePeriod");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "startTime");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v37, "hour");
    objc_msgSend(v13, "timePeriod");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "startTime");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v7;
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%lu:%lu"), v17, objc_msgSend(v35, "minute"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v53[3] = v18;
    v52[4] = CFSTR("end-time");
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "timePeriod");
    v48 = v5;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "endTime");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "hour");
    objc_msgSend(v13, "timePeriod");
    v46 = self;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "endTime");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%lu:%lu"), v22, objc_msgSend(v24, "minute"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v53[4] = v25;
    v52[5] = CFSTR("bedtime-enabled");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), v49, v34);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v53[5] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    self = v46;
    v5 = v48;

    objc_msgSend(v48, "setObject:forKey:", v27, CFSTR("schedule-settings"));
    v7 = v47;

  }
  -[DNDSSettingsManager syncSettingsWithError:](self, "syncSettingsWithError:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    v50[0] = CFSTR("cloud-enabled");
    if (objc_msgSend(v28, "isCloudSyncEnabled"))
      v30 = CFSTR("YES");
    else
      v30 = CFSTR("NO");
    v50[1] = CFSTR("local-enabled");
    v51[0] = v30;
    if (objc_msgSend(v29, "isPairSyncEnabled"))
      v31 = CFSTR("YES");
    else
      v31 = CFSTR("NO");
    v51[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v32, CFSTR("sync-settings"));

  }
  return v5;
}

- (id)fallbackConfiguration
{
  return (id)objc_msgSend(MEMORY[0x1E0D1D6E0], "defaultConfiguration");
}

- (DNDSSettingsManagerDelegate)delegate
{
  return (DNDSSettingsManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_syncSettingsProvider, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_readSettingsReturningError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1CB895000, a2, OS_LOG_TYPE_ERROR, "Failed to load settings, will request a radar; error=%{public}@",
    (uint8_t *)&v2,
    0xCu);
}

- (void)_writeSettingsRecord:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1CB895000, log, OS_LOG_TYPE_ERROR, "Failed to save settings, will request a radar; settingsRecord=%{public}@, error=%{public}@",
    (uint8_t *)&v3,
    0x16u);
}

@end
