@implementation HUHearingAidSettings

- (BOOL)shouldStoreLocally
{
  return 1;
}

- (id)preferenceDomainForPreferenceKey:(id)a3
{
  id v3;

  if (objc_msgSend(a3, "isEqualToString:", kAXSAvailableHearingDeviceNamePreference))
  {
    _AXSAccessibilityPreferenceDomain();
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (id)*MEMORY[0x1E0DDE118];
  }
  return v3;
}

- (NSArray)peripheralUUIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  -[HUHearingAidSettings pairedHearingAids](self, "pairedHearingAids");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("ax_hearing_device_left_peripheral_key"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("ax_hearing_device_uuid_key"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v3, "hcSafeAddObject:", v6);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("ax_hearing_device_right_peripheral_key"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("ax_hearing_device_uuid_key"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v3, "hcSafeAddObject:", v8);

    }
  }

  return (NSArray *)v3;
}

- (NSDictionary)pairedHearingAids
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  float v8;
  float v9;
  void *v10;

  -[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", kAXSPairedHearingUUIDsPreference, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ax_hearing_device_version_key"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("ax_hearing_device_version_key"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v9 = v8;

  }
  else
  {
    v9 = 1.0;
  }
  LODWORD(v6) = 2.0;
  *(float *)&v5 = v9;
  -[HUHearingAidSettings convertPersistentRepresentation:fromVersion:toVersion:](self, "convertPersistentRepresentation:fromVersion:toVersion:", v3, v5, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v10;
}

- (id)convertPersistentRepresentation:(id)a3 fromVersion:(float)a4 toVersion:(float)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v43[4];
  id v44;
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[4];

  v48[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (a4 != a5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (a4 == 1.0)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ax_hearing_device_name_key"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "length"))
        objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("ax_hearing_device_name_key"));
      objc_msgSend(v8, "objectForKey:", CFSTR("ax_hearing_device_model_key"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("ax_hearing_device_man_key"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "length") && objc_msgSend(v13, "length"))
      {
        objc_msgSend(&unk_1EA8FFBF0, "stringValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v46[1] = v13;
        v47[0] = v14;
        v46[0] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = v15;
        objc_msgSend(&unk_1EA8FFC08, "stringValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v47[1] = v16;
        v45[0] = v12;
        v45[1] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v48[1] = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v18, CFSTR("ax_hearing_device_man_model_key"));

      }
      objc_msgSend(v8, "objectForKey:", CFSTR("ax_hearing_device_lr_key"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
        objc_msgSend(v10, "setObject:forKey:", v19, CFSTR("ax_hearing_device_lr_key"));
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __78__HUHearingAidSettings_convertPersistentRepresentation_fromVersion_toVersion___block_invoke;
      v43[3] = &unk_1EA8E88B0;
      v10 = v10;
      v44 = v10;
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v43);

    }
    else if (a4 == 2.0)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v8);
      v20 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v20;
    }
    if ((unint64_t)objc_msgSend(v10, "count") < 4)
      goto LABEL_25;
    if (a5 == 1.0)
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("ax_hearing_device_left_peripheral_key"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("ax_hearing_device_right_peripheral_key"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("ax_hearing_device_man_model_key"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "count") == 4)
      {
        v24 = (void *)MEMORY[0x1E0C99D80];
        objc_msgSend(v21, "objectForKey:", CFSTR("ax_hearing_device_isleft_key"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKey:", CFSTR("ax_hearing_device_hiid_key"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKey:", CFSTR("ax_hearing_device_hiidother_key"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "dictionaryWithObjectsAndKeys:", v25, CFSTR("ax_hearing_device_isleft_key"), v26, CFSTR("ax_hearing_device_hiid_key"), v27, CFSTR("ax_hearing_device_hiidother_key"), 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "objectForKey:", CFSTR("ax_hearing_device_uuid_key"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v28, v29);

      }
      if (objc_msgSend(v22, "count") == 4)
      {
        v30 = (void *)MEMORY[0x1E0C99D80];
        objc_msgSend(v22, "objectForKey:", CFSTR("ax_hearing_device_isleft_key"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKey:", CFSTR("ax_hearing_device_hiid_key"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKey:", CFSTR("ax_hearing_device_hiidother_key"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "dictionaryWithObjectsAndKeys:", v31, CFSTR("ax_hearing_device_isleft_key"), v32, CFSTR("ax_hearing_device_hiid_key"), v33, CFSTR("ax_hearing_device_hiidother_key"), 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "objectForKey:", CFSTR("ax_hearing_device_uuid_key"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v34, v35);

      }
      if (objc_msgSend(v23, "count") == 2)
      {
        objc_msgSend(&unk_1EA8FFBF0, "stringValue");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKey:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "firstObject");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v38, CFSTR("ax_hearing_device_man_key"));

        objc_msgSend(&unk_1EA8FFC08, "stringValue");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKey:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "firstObject");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v41, CFSTR("ax_hearing_device_model_key"));

      }
      objc_msgSend(v10, "removeObjectForKey:", CFSTR("ax_hearing_device_left_peripheral_key"));
      objc_msgSend(v10, "removeObjectForKey:", CFSTR("ax_hearing_device_right_peripheral_key"));
      objc_msgSend(v10, "removeObjectForKey:", CFSTR("ax_hearing_device_man_model_key"));
      objc_msgSend(v10, "removeObjectForKey:", CFSTR("ax_hearing_device_version_key"));
      v9 = v10;

      goto LABEL_26;
    }
    if (a5 == 2.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v10);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_25:
      v9 = 0;
    }
LABEL_26:

    goto LABEL_27;
  }
  v9 = v7;
LABEL_27:

  return v9;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_10);
  return (id)sharedInstance_Settings_1;
}

void __38__HUHearingAidSettings_sharedInstance__block_invoke()
{
  HUHearingAidSettings *v0;
  void *v1;

  v0 = objc_alloc_init(HUHearingAidSettings);
  v1 = (void *)sharedInstance_Settings_1;
  sharedInstance_Settings_1 = (uint64_t)v0;

}

- (HUHearingAidSettings)init
{
  HUHearingAidSettings *v2;
  dispatch_queue_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD handler[4];
  id v16;
  _QWORD block[4];
  HUHearingAidSettings *v18;
  objc_super v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)HUHearingAidSettings;
  v2 = -[HCSettings init](&v19, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("hearing-icloud-initialization", 0);
    -[HUHearingAidSettings setIcloudInitializationQueue:](v2, "setIcloudInitializationQueue:", v3);

    if (objc_msgSend(MEMORY[0x1E0D2F990], "isProtectedDataAvailable"))
    {
      -[HUHearingAidSettings icloudInitializationQueue](v2, "icloudInitializationQueue");
      v4 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __28__HUHearingAidSettings_init__block_invoke;
      block[3] = &unk_1EA8E8220;
      v18 = v2;
      dispatch_async(v4, block);

    }
    else
    {
      HAInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Skipping iCloud setup. Device is locked"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUHearingAidSettings init]", 125, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)*MEMORY[0x1E0D2F928];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
      {
        v8 = objc_retainAutorelease(v6);
        v9 = v7;
        v10 = objc_msgSend(v8, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v21 = v10;
        _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      if (MKBDeviceFormattedForContentProtection())
      {
        objc_initWeak((id *)buf, v2);
        -[HUHearingAidSettings icloudInitializationQueue](v2, "icloudInitializationQueue");
        v11 = objc_claimAutoreleasedReturnValue();
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __28__HUHearingAidSettings_init__block_invoke_57;
        handler[3] = &unk_1EA8E9740;
        objc_copyWeak(&v16, (id *)buf);
        notify_register_dispatch((const char *)*MEMORY[0x1E0D4E600], &v2->_contentProtectionNotifyToken, v11, handler);

        objc_destroyWeak(&v16);
        objc_destroyWeak((id *)buf);
      }
    }
    if (objc_msgSend(MEMORY[0x1E0D2F990], "currentProcessIsHeard"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel_pairedWatchDidChange_, *MEMORY[0x1E0D517A8], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel_pairedWatchDidChange_, *MEMORY[0x1E0D517E0], 0);

    }
  }
  return v2;
}

uint64_t __28__HUHearingAidSettings_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_initializeICloudSetup");
}

void __28__HUHearingAidSettings_init__block_invoke_57(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_initializeICloudSetup");

}

- (void)_initializeICloudSetup
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  ACMonitoredAccountStore *v8;
  ACMonitoredAccountStore *accountStore;
  id v10;

  if (-[HUHearingAidSettings shouldUseiCloud](self, "shouldUseiCloud") && !self->_finishediCloudSetup)
  {
    self->_finishediCloudSetup = 1;
    -[HUHearingAidSettings pairedHearingAids](self, "pairedHearingAids");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x1E0CB3368];
    objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_icloudHearingSettingsDidChange_, v4, v5);

    objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "synchronize");

    if (v10)
      -[HUHearingAidSettings pushLocalHearingAidsToiCloud](self, "pushLocalHearingAidsToiCloud");
    -[HUHearingAidSettings icloudHearingSettingsDidChange:](self, "icloudHearingSettingsDidChange:", 0);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0C8F030], 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (ACMonitoredAccountStore *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8F2D8]), "initWithAccountTypes:delegate:", v7, self);
    accountStore = self->_accountStore;
    self->_accountStore = v8;

    -[ACMonitoredAccountStore registerWithCompletion:](self->_accountStore, "registerWithCompletion:", &__block_literal_global_68);
    if (-[HUHearingAidSettings isiCloudPaired](self, "isiCloudPaired"))
      _AXSHearingSetDevicePairedEars();

  }
}

void __46__HUHearingAidSettings__initializeICloudSetup__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HAInitializeLogging();
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_msgSend(v2, "count");

  objc_msgSend(v3, "stringWithFormat:", CFSTR("Account: %d"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUHearingAidSettings _initializeICloudSetup]_block_invoke", 178, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v6);
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    v11 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

- (void)accountWasAdded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[ACMonitoredAccountStore monitoredAccounts](self->_accountStore, "monitoredAccounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Account was added: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUHearingAidSettings accountWasAdded:]", 192, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v7);
    v10 = v8;
    *(_DWORD *)buf = 136446210;
    v12 = objc_msgSend(v9, "UTF8String");
    _os_log_impl(&dword_1DE311000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[HUHearingAidSettings iCloudAccountDidChange:](self, "iCloudAccountDidChange:", 0);
}

- (void)accountWasModified:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[ACMonitoredAccountStore monitoredAccounts](self->_accountStore, "monitoredAccounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Account was modified: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUHearingAidSettings accountWasModified:]", 199, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v7);
    v10 = v8;
    *(_DWORD *)buf = 136446210;
    v12 = objc_msgSend(v9, "UTF8String");
    _os_log_impl(&dword_1DE311000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[HUHearingAidSettings iCloudAccountDidChange:](self, "iCloudAccountDidChange:", 0);
}

- (void)accountWasRemoved:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[ACMonitoredAccountStore monitoredAccounts](self->_accountStore, "monitoredAccounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Account was removed: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUHearingAidSettings accountWasRemoved:]", 206, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v7);
    v10 = v8;
    *(_DWORD *)buf = 136446210;
    v12 = objc_msgSend(v9, "UTF8String");
    _os_log_impl(&dword_1DE311000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[HUHearingAidSettings iCloudAccountDidChange:](self, "iCloudAccountDidChange:", 0);
}

- (void)accountCredentialChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[ACMonitoredAccountStore monitoredAccounts](self->_accountStore, "monitoredAccounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Account credential has changed: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUHearingAidSettings accountCredentialChanged:]", 213, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v7);
    v10 = v8;
    *(_DWORD *)buf = 136446210;
    v12 = objc_msgSend(v9, "UTF8String");
    _os_log_impl(&dword_1DE311000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[HUHearingAidSettings iCloudAccountDidChange:](self, "iCloudAccountDidChange:", 0);
}

- (void)pairedWatchDidChange:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HUHearingAidSettings pairedHearingAids](self, "pairedHearingAids", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (v3)
  {
    cloudHearingAidDescriptionForDescription(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  +[HANanoSettings sharedInstance](HANanoSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forPreferenceKey:", v4, kAXSWatchSyncPairedUUIDsPreference);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HUHearingAidSettings;
  -[HCSettings dealloc](&v4, sel_dealloc);
}

- (BOOL)isPairedWithFakeHearingAids
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HUHearingAidSettings pairedHearingAids](self, "pairedHearingAids");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("ax_hearing_device_fake_type_key"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isiCloudPaired
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;

  -[HUHearingAidSettings pairedHearingAids](self, "pairedHearingAids");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("ax_hearing_device_left_peripheral_key"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("ax_hearing_device_right_peripheral_key"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("ax_hearing_device_uuid_key"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0D2F908];
    if ((objc_msgSend(v5, "hasPrefix:", *MEMORY[0x1E0D2F908]) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("ax_hearing_device_uuid_key"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "hasPrefix:", v6);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hearingAidsLEAVersionFromiCloud
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;

  -[HUHearingAidSettings pairedHearingAids](self, "pairedHearingAids");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("ax_hearing_device_left_peripheral_key"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("ax_hearing_device_right_peripheral_key"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("ax_hearing_device_lea_version_key"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

    }
    else
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("ax_hearing_device_lea_version_key"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v6 = 1;
LABEL_12:

        goto LABEL_13;
      }
    }
    objc_msgSend(v3, "objectForKey:", CFSTR("ax_hearing_device_lea_version_key"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("ax_hearing_device_lea_version_key"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    if (v11 == 1 || v9 == 1)
      v6 = 1;
    else
      v6 = v11 | v9;
    goto LABEL_12;
  }
  v6 = 1;
LABEL_13:

  return v6;
}

- (BOOL)isPairedWithRealHearingAids
{
  void *v3;
  _BOOL4 v4;

  -[HUHearingAidSettings pairedHearingAids](self, "pairedHearingAids");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !-[HUHearingAidSettings isPairedWithFakeHearingAids](self, "isPairedWithFakeHearingAids"))
    v4 = !-[HUHearingAidSettings isiCloudPaired](self, "isiCloudPaired");
  else
    LOBYTE(v4) = 0;

  return v4;
}

void __78__HUHearingAidSettings_convertPersistentRepresentation_fromVersion_toVersion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("ax_hearing_device_isleft_key"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v5, "objectForKey:", CFSTR("ax_hearing_device_hiid_key"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("ax_hearing_device_hiidother_key"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "length"))
      objc_msgSend(v10, "setObject:forKey:", v8, CFSTR("ax_hearing_device_hiid_key"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "length"))
      objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("ax_hearing_device_hiidother_key"));
    objc_msgSend(v10, "setObject:forKey:", v13, CFSTR("ax_hearing_device_uuid_key"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("ax_hearing_device_isleft_key"));

    if ((_DWORD)v7)
      v12 = CFSTR("ax_hearing_device_left_peripheral_key");
    else
      v12 = CFSTR("ax_hearing_device_right_peripheral_key");
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v10, v12);

  }
}

- (BOOL)shouldUseiCloud
{
  __SecTask *v2;
  __SecTask *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  CFTypeID v11;
  char v12;
  CFErrorRef error;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = SecTaskCreateFromSelf(0);
  if (!v2)
    return 0;
  v3 = v2;
  error = 0;
  v4 = (void *)SecTaskCopyValueForEntitlement(v2, CFSTR("application-identifier"), &error);
  if (error)
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to get entitlements for client task. Error: %@"), error);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUHearingAidSettings shouldUseiCloud]", 417, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_retainAutorelease(v6);
      v9 = v7;
      v10 = objc_msgSend(v8, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v16 = v10;
      _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    CFRelease(error);
  }
  if (v4)
  {
    v11 = CFGetTypeID(v4);
    if (v11 == CFStringGetTypeID())
      v12 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.accessibility.heard"));
    else
      v12 = 0;
    CFRelease(v4);
  }
  else
  {
    v12 = 0;
  }
  CFRelease(v3);
  return v12;
}

- (void)icloudHearingSettingsDidChange:(id)a3
{
  AXPerformBlockAsynchronouslyOnMainThread();
}

void __55__HUHearingAidSettings_icloudHearingSettingsDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", kAXSCloudHearingAidsPreference);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryForKey:", kAXSCloudHearingDevicesPreference);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "pairedHearingAids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("ax_hearing_device_fake_type_key"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      if (objc_msgSend(v4, "count"))
      {
        objc_msgSend(*(id *)(a1 + 32), "setLocalHearingAidsFromiCloud:", v4);
      }
      else if (objc_msgSend(v11, "count"))
      {
        v9 = *(void **)(a1 + 32);
        LODWORD(v7) = 1.0;
        LODWORD(v8) = 2.0;
        objc_msgSend(v9, "convertPersistentRepresentation:fromVersion:toVersion:", v11, v7, v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setLocalHearingAidsFromiCloud:", v10);

      }
    }
  }

}

- (void)iCloudAccountDidChange:(id)a3
{
  AXPerformBlockAsynchronouslyOnMainThread();
}

void __47__HUHearingAidSettings_iCloudAccountDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("New iCloud %d"), objc_msgSend(*(id *)(a1 + 32), "shouldUseiCloud"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUHearingAidSettings iCloudAccountDidChange:]_block_invoke", 455, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_retainAutorelease(v3);
    v6 = v4;
    *(_DWORD *)buf = 136446210;
    v12 = objc_msgSend(v5, "UTF8String");
    _os_log_impl(&dword_1DE311000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "shouldUseiCloud"))
  {
    objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "synchronize");

    objc_msgSend(*(id *)(a1 + 32), "pairedHearingAids");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(*(id *)(a1 + 32), "pushLocalHearingAidsToiCloud");
    objc_msgSend(*(id *)(a1 + 32), "icloudHearingSettingsDidChange:", 0);
  }
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 64);
  *(_QWORD *)(v9 + 64) = 0;

}

- (void)setLocalHearingAidsFromiCloud:(id)a3
{
  void *v4;
  BOOL v5;
  id v6;

  v6 = a3;
  -[HUHearingAidSettings deviceIDForPairingInformation:](self, "deviceIDForPairingInformation:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HUHearingAidSettings isDeviceIDOnCloudDenylist:](self, "isDeviceIDOnCloudDenylist:", v4);

  if (!v5)
    -[HUHearingAidSettings setPairedHearingAids:](self, "setPairedHearingAids:", v6);

}

- (BOOL)shouldPushLocalAidsToiCloud
{
  return objc_msgSend(MEMORY[0x1E0D2F990], "deviceIsWatch") ^ 1;
}

- (void)pushLocalHearingAidsToiCloud
{
  void *v3;
  void *v4;
  os_log_t *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  os_log_t v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  os_log_t v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Should we push local aids to cloud? should use cloud: %d, should local aids be pushed: %d, fake hearing aids %d"), -[HUHearingAidSettings shouldUseiCloud](self, "shouldUseiCloud"), -[HUHearingAidSettings shouldPushLocalAidsToiCloud](self, "shouldPushLocalAidsToiCloud"), -[HUHearingAidSettings isPairedWithFakeHearingAids](self, "isPairedWithFakeHearingAids"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUHearingAidSettings pushLocalHearingAidsToiCloud]", 493, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (os_log_t *)MEMORY[0x1E0D2F928];
  v6 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v4);
    v8 = v6;
    *(_DWORD *)buf = 136446210;
    v35 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if (-[HUHearingAidSettings shouldUseiCloud](self, "shouldUseiCloud")
    && -[HUHearingAidSettings shouldPushLocalAidsToiCloud](self, "shouldPushLocalAidsToiCloud")
    && !-[HUHearingAidSettings isPairedWithFakeHearingAids](self, "isPairedWithFakeHearingAids"))
  {
    HAInitializeLogging();
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[HUHearingAidSettings pairedHearingAids](self, "pairedHearingAids");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Pushing local aids to iCloud %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUHearingAidSettings pushLocalHearingAidsToiCloud]", 496, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_retainAutorelease(v12);
      v15 = v13;
      v16 = objc_msgSend(v14, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v35 = v16;
      _os_log_impl(&dword_1DE311000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "synchronize");

    objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObjectForKey:", kAXSCloudHearingAidsPreference);

    -[HUHearingAidSettings pairedHearingAids](self, "pairedHearingAids");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      cloudHearingAidDescriptionForDescription(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v22) = 2.0;
      LODWORD(v23) = 1.0;
      -[HUHearingAidSettings convertPersistentRepresentation:fromVersion:toVersion:](self, "convertPersistentRepresentation:fromVersion:toVersion:", v20, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setDictionary:forKey:", v24, kAXSCloudHearingAidsPreference);

      objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setDictionary:forKey:", v20, kAXSCloudHearingDevicesPreference);

      objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "synchronize");

    }
    else
    {
      if (v19)
      {
LABEL_15:

        return;
      }
      HAInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Removing from iCloud"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUHearingAidSettings pushLocalHearingAidsToiCloud]", 512, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        v30 = objc_retainAutorelease(v28);
        v31 = v29;
        v32 = objc_msgSend(v30, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v35 = v32;
        _os_log_impl(&dword_1DE311000, v31, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "removeObjectForKey:", kAXSCloudHearingAidsPreference);

      objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "synchronize");
    }

    goto LABEL_15;
  }
}

- (id)keysToSync
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (void)logMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUHearingAidSettings logMessage:]", 542, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v5);
    v8 = v6;
    *(_DWORD *)buf = 136446210;
    v10 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

- (id)preferenceKeyForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  if (preferenceKeyForSelector__onceToken_0 != -1)
    dispatch_once(&preferenceKeyForSelector__onceToken_0, &__block_literal_global_133);
  v4 = (void *)preferenceKeyForSelector__SelectorMap_0;
  NSStringFromSelector(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = CFSTR("UnknownKey");
  v8 = v7;

  return v8;
}

void __49__HUHearingAidSettings_preferenceKeyForSelector___block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  v33 = kAXSPairedHearingUUIDsPreference;
  v34 = v0;
  NSStringFromSelector(sel_pairedHearingAids);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = kAXSKnownPeripheralUUIDsPreference;
  NSStringFromSelector(sel_knownPeripheralUUIDs);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = kAXSHearingAidEarIndependencePreference;
  NSStringFromSelector(sel_independentHearingAidSettings);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = kAXSHearingAidsStreamToLeftPreference;
  NSStringFromSelector(sel_shouldStreamToLeftAid);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = kAXSHearingAidsStreamToRightPreference;
  NSStringFromSelector(sel_shouldStreamToRightAid);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = kAXSHearingAidsCallAudioRoutePreference;
  NSStringFromSelector(sel_callAudioRoute);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = kAXSHearingAidsMediaAudioRoutePreference;
  NSStringFromSelector(sel_mediaAudioRoute);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = kAXSHearingAidsLiveListenExportPreference;
  NSStringFromSelector(sel_exportsLiveListenToFile);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = kAXSHearingAidMultideviceSettingsPreference;
  NSStringFromSelector(sel_multideviceSettingsEnabled);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = kAXSHearingAidMultideviceAudioPreference;
  NSStringFromSelector(sel_multideviceAudioEnabled);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = kAXSHearingAidSystemSoundsStreamPreference;
  NSStringFromSelector(sel_shouldStreamSystemSounds);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = kAXSHearingAidComplicationPreferredDisplayModePreference;
  NSStringFromSelector(sel_complicationPreferredDisplayMode);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = kAXSClearPartialPairingPreference;
  NSStringFromSelector(sel_clearPartialPairing);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = kAXSHearingAidAvailableInputEarPreference;
  NSStringFromSelector(sel_availableInputEars);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = kAXSHearingAidEarsSupportingWatchPreference;
  NSStringFromSelector(sel_earsSupportingWatch);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = kAXSHearingAidInputEarPreference;
  NSStringFromSelector(sel_preferredInputEar);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = kAXSAvailableHearingDeviceNamePreference;
  NSStringFromSelector(sel_availableHearingDeviceName);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = kAXSHearingFeatureUsagePreference;
  NSStringFromSelector(sel_usedHearingFeatures);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = kAXSLiveHeadphoneLevelEnabledPreference;
  NSStringFromSelector(sel_liveHeadphoneLevelEnabled);
  v13 = v1;
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v34, "initWithObjectsAndKeys:", v33, v42, v30, v41, v32, v40, v31, v39, v29, v38, v28, v37, v26, v36, v23, v27, v24,
          v25,
          v21,
          v35,
          v19,
          v22,
          v17,
          v20,
          v16,
          v18,
          v13,
          v15,
          v2,
          v3,
          v4,
          v5,
          v6,
          v7,
          v8,
          v14,
          v9,
          v10,
          0);
  v12 = (void *)preferenceKeyForSelector__SelectorMap_0;
  preferenceKeyForSelector__SelectorMap_0 = v11;

}

- (void)_updateTripleClickOptionsForPairedAids:(id)a3
{
  void *v4;
  const void *v5;
  uint64_t v6;
  int v7;
  id v8;

  _AXSSetAccessibilityEnabled();
  v4 = (void *)_AXSTripleClickCopyOptions();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (id)v6;
  v7 = _AXSTripleClickContainsOption();
  if (a3)
  {
    if (!v7)
      objc_msgSend(v8, "addObject:", &unk_1EA8FFC20);
  }
  else if (v7)
  {
    objc_msgSend(v8, "removeObject:", &unk_1EA8FFC20);
  }
  _AXSSetTripleClickOptions();
  if (v5)
    CFRelease(v5);

}

- (void)updateStreamingPreference
{
  -[HUHearingAidSettings shouldStreamToLeftAid](self, "shouldStreamToLeftAid");
  -[HUHearingAidSettings shouldStreamToRightAid](self, "shouldStreamToRightAid");
  _AXSHearingSetDeviceStreamingEars();
}

- (id)deviceIDForPairingInformation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v3 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v23 = 0;
  objc_msgSend(v3, "objectForKey:", CFSTR("ax_hearing_device_left_peripheral_key"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ax_hearing_device_right_peripheral_key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("ax_hearing_device_hiid_key"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v25[5];
    v25[5] = v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("ax_hearing_device_hiidother_key"));
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v11 = (void *)v19[5];
    v19[5] = v8;

    goto LABEL_6;
  }
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("ax_hearing_device_hiidother_key"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v25[5];
    v25[5] = v9;

    objc_msgSend(v5, "objectForKey:", CFSTR("ax_hearing_device_hiid_key"));
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:
  if (!objc_msgSend((id)v25[5], "length") || !objc_msgSend((id)v19[5], "length"))
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __54__HUHearingAidSettings_deviceIDForPairingInformation___block_invoke;
    v17[3] = &unk_1EA8E97C8;
    v17[4] = &v24;
    v17[5] = &v18;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v17);
  }
  v12 = objc_msgSend((id)v25[5], "length");
  v13 = (void *)v19[5];
  if (!v12)
    goto LABEL_13;
  if (!objc_msgSend(v13, "length"))
  {
    v13 = (void *)v25[5];
LABEL_13:
    v14 = v13;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v25[5], v19[5]);
  v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
  v15 = v14;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v15;
}

void __54__HUHearingAidSettings_deviceIDForPairingInformation___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v16, "valueForKey:", CFSTR("ax_hearing_device_isleft_key"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v16, "valueForKey:", CFSTR("ax_hearing_device_hiid_key"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "valueForKey:", CFSTR("ax_hearing_device_hiidother_key"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "valueForKey:", CFSTR("ax_hearing_device_isleft_key"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "BOOLValue");

      if (v10)
        v11 = v7;
      else
        v11 = v8;
      if (v10)
        v12 = v8;
      else
        v12 = v7;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v11);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v14 = v12;
      v15 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v14;

      *a4 = 1;
    }
  }

}

- (void)setPairedHearingAids:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v55;
  void *v56;
  _BOOL4 v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint8_t buf[4];
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Changing paired hearing aids %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUHearingAidSettings setPairedHearingAids:]", 739, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v6);
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    v63 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v10 = hearingUIShouldBeAvailable();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(v4, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dictionaryWithDictionary:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
  }
  objc_msgSend(v11, "valueForKey:", CFSTR("ax_hearing_device_lr_key"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");

  if (-[HUHearingAidSettings isiCloudPaired](self, "isiCloudPaired") || v15 != _AXSHearingDevicePairedEars())
    _AXSHearingSetDevicePairedEars();
  objc_msgSend(v11, "objectForKey:", CFSTR("ax_hearing_device_left_peripheral_key"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("ax_hearing_device_right_peripheral_key"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("ax_hearing_device_uuid_key"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0D2F908];
  v58 = v17;
  if ((objc_msgSend(v18, "hasPrefix:", *MEMORY[0x1E0D2F908]) & 1) == 0)
  {

LABEL_15:
    v56 = v16;
    v57 = v10;
    objc_msgSend(v4, "valueForKey:", CFSTR("ax_hearing_device_man_model_key"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1EA8FFBF0, "stringValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "valueForKey:", CFSTR("ax_hearing_device_left_peripheral_key"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "valueForKey:", CFSTR("ax_hearing_device_uuid_key"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "valueForKey:", CFSTR("ax_hearing_device_right_peripheral_key"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "valueForKey:", CFSTR("ax_hearing_device_uuid_key"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "length"))
    {
      objc_msgSend(v24, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "lastObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isEqualToString:", v30);

      if (v31)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "hcSafeAddObject:", v59);
        objc_msgSend(v32, "hcSafeAddObject:", v27);
        if (!objc_msgSend(v32, "count"))
        {
          v34 = 0;
          goto LABEL_29;
        }
        objc_msgSend(v24, "firstObject");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v33;
        v61 = v32;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:

LABEL_29:
        _AXSHearingSetDevicePairedUUIDs();

        v10 = v57;
        v16 = v56;
        goto LABEL_30;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "hcSafeAddObject:", v59);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "hcSafeAddObject:", v27);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "length"))
    {
      v36 = objc_msgSend(v32, "count");

      if (!v36)
        goto LABEL_24;
      objc_msgSend(v24, "firstObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKey:", v32, v35);
    }

LABEL_24:
    objc_msgSend(v24, "lastObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v37, "length"))
    {
      v38 = objc_msgSend(v33, "count");

      if (!v38)
        goto LABEL_28;
      objc_msgSend(v24, "lastObject");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKey:", v33, v37);
    }

    goto LABEL_28;
  }
  objc_msgSend(v17, "objectForKey:", CFSTR("ax_hearing_device_uuid_key"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "hasPrefix:", v19);

  if ((v21 & 1) == 0)
    goto LABEL_15;
LABEL_30:
  -[HUHearingAidSettings updateStreamingPreference](self, "updateStreamingPreference");
  -[HUHearingAidSettings _updateTripleClickOptionsForPairedAids:](self, "_updateTripleClickOptionsForPairedAids:", v11);
  objc_msgSend(v11, "setObject:forKey:", &unk_1EA9006F8, CFSTR("ax_hearing_device_version_key"));
  if (!v11)
  {
    -[HUHearingAidSettings pairedHearingAids](self, "pairedHearingAids");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHearingAidSettings deviceIDForPairingInformation:](self, "deviceIDForPairingInformation:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHearingAidSettings addDeviceIDToCloudDenylist:](self, "addDeviceIDToCloudDenylist:", v40);

    -[HUHearingAidSettings setAvailableInputEars:](self, "setAvailableInputEars:", 0);
  }
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v11, kAXSPairedHearingUUIDsPreference);
  -[HUHearingAidSettings deviceIDForPairingInformation:](self, "deviceIDForPairingInformation:", v11);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHearingAidSettings removeDeviceIDFromCloudDenylist:](self, "removeDeviceIDFromCloudDenylist:", v41);

  v42 = objc_msgSend(v11, "count");
  _AXSHearingAidsSetPaired();
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "announceNotificationsOnHearingAidsSupported");

    if ((v42 != 0) != v44)
    {
      HAInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Setting Announce Notifications on Hearing Aids Supported: %d"), v42 != 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUHearingAidSettings setPairedHearingAids:]", 836, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)*MEMORY[0x1E0D2F928];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
      {
        v48 = objc_retainAutorelease(v46);
        v49 = v47;
        v50 = objc_msgSend(v48, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v63 = v50;
        _os_log_impl(&dword_1DE311000, v49, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setAnnounceNotificationsOnHearingAidsSupported:", v42 != 0);

    }
  }
  -[HUHearingAidSettings pushLocalHearingAidsToiCloud](self, "pushLocalHearingAidsToiCloud");
  if (v11)
  {
    cloudHearingAidDescriptionForDescription(v11);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v52 = 0;
  }
  +[HANanoSettings sharedInstance](HANanoSettings, "sharedInstance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setValue:forPreferenceKey:", v52, kAXSWatchSyncPairedUUIDsPreference);

  if (v10 != hearingUIShouldBeAvailable())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.accessibility.hearing.ui.availability"), 0, 0, 1u);
  }
  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "updateHearingFeatureUsage");

}

- (BOOL)clearPartialPairing
{
  return -[HCSettings BOOLValueForPreferenceKey:withDefaultValue:](self, "BOOLValueForPreferenceKey:withDefaultValue:", kAXSClearPartialPairingPreference, 0);
}

- (void)setClearPartialPairing:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, kAXSClearPartialPairingPreference);

}

- (NSDictionary)knownPeripheralUUIDs
{
  return (NSDictionary *)-[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", kAXSKnownPeripheralUUIDsPreference, objc_opt_class(), 0);
}

- (void)setKnownPeripheralUUIDs:(id)a3
{
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, kAXSKnownPeripheralUUIDsPreference);
}

- (BOOL)independentHearingAidSettings
{
  return -[HCSettings BOOLValueForPreferenceKey:withDefaultValue:](self, "BOOLValueForPreferenceKey:withDefaultValue:", kAXSHearingAidEarIndependencePreference, 1);
}

- (void)setIndependentHearingAidSettings:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, kAXSHearingAidEarIndependencePreference);

}

- (BOOL)shouldStreamToLeftAid
{
  return -[HCSettings BOOLValueForPreferenceKey:withDefaultValue:](self, "BOOLValueForPreferenceKey:withDefaultValue:", kAXSHearingAidsStreamToLeftPreference, 1);
}

- (void)setShouldStreamToLeftAid:(BOOL)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, kAXSHearingAidsStreamToLeftPreference);

  -[HUHearingAidSettings updateStreamingPreference](self, "updateStreamingPreference");
}

- (BOOL)shouldStreamToRightAid
{
  return -[HCSettings BOOLValueForPreferenceKey:withDefaultValue:](self, "BOOLValueForPreferenceKey:withDefaultValue:", kAXSHearingAidsStreamToRightPreference, 1);
}

- (void)setShouldStreamToRightAid:(BOOL)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, kAXSHearingAidsStreamToRightPreference);

  -[HUHearingAidSettings updateStreamingPreference](self, "updateStreamingPreference");
}

- (int64_t)callAudioRoute
{
  return -[HCSettings integerValueForKey:withDefaultValue:](self, "integerValueForKey:withDefaultValue:", kAXSHearingAidsCallAudioRoutePreference, 2);
}

- (void)setCallAudioRoute:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, kAXSHearingAidsCallAudioRoutePreference);

}

- (int64_t)mediaAudioRoute
{
  return -[HCSettings integerValueForKey:withDefaultValue:](self, "integerValueForKey:withDefaultValue:", kAXSHearingAidsMediaAudioRoutePreference, 2);
}

- (void)setMediaAudioRoute:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, kAXSHearingAidsMediaAudioRoutePreference);

}

- (BOOL)exportsLiveListenToFile
{
  return -[HCSettings BOOLValueForPreferenceKey:withDefaultValue:](self, "BOOLValueForPreferenceKey:withDefaultValue:", kAXSHearingAidsLiveListenExportPreference, 0);
}

- (void)setExportsLiveListenToFile:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, kAXSHearingAidsLiveListenExportPreference);

}

- (BOOL)multideviceSettingsEnabled
{
  return -[HCSettings BOOLValueForPreferenceKey:withDefaultValue:](self, "BOOLValueForPreferenceKey:withDefaultValue:", kAXSHearingAidMultideviceSettingsPreference, 1);
}

- (void)setMultideviceSettingsEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, kAXSHearingAidMultideviceSettingsPreference);

}

- (BOOL)multideviceAudioEnabled
{
  return -[HCSettings BOOLValueForPreferenceKey:withDefaultValue:](self, "BOOLValueForPreferenceKey:withDefaultValue:", kAXSHearingAidMultideviceAudioPreference, 1);
}

- (void)setMultideviceAudioEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, kAXSHearingAidMultideviceAudioPreference);

}

- (BOOL)shouldStreamSystemSounds
{
  return -[HCSettings BOOLValueForPreferenceKey:withDefaultValue:](self, "BOOLValueForPreferenceKey:withDefaultValue:", kAXSHearingAidSystemSoundsStreamPreference, 0);
}

- (void)setShouldStreamSystemSounds:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, kAXSHearingAidSystemSoundsStreamPreference);

}

- (int64_t)complicationPreferredDisplayMode
{
  return -[HCSettings integerValueForKey:withDefaultValue:](self, "integerValueForKey:withDefaultValue:", kAXSHearingAidComplicationPreferredDisplayModePreference, 0);
}

- (void)setComplicationPreferredDisplayMode:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, kAXSHearingAidComplicationPreferredDisplayModePreference);

}

- (int)availableInputEars
{
  return -[HCSettings integerValueForKey:withDefaultValue:](self, "integerValueForKey:withDefaultValue:", kAXSHearingAidAvailableInputEarPreference, 0);
}

- (void)setAvailableInputEars:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, kAXSHearingAidAvailableInputEarPreference);

}

- (int)earsSupportingWatch
{
  return -[HCSettings integerValueForKey:withDefaultValue:](self, "integerValueForKey:withDefaultValue:", kAXSHearingAidEarsSupportingWatchPreference, 0);
}

- (void)setEarsSupportingWatch:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, kAXSHearingAidEarsSupportingWatchPreference);

}

- (int)preferredInputEar
{
  return -[HCSettings integerValueForKey:withDefaultValue:](self, "integerValueForKey:withDefaultValue:", kAXSHearingAidInputEarPreference, 6);
}

- (void)setPreferredInputEar:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, kAXSHearingAidInputEarPreference);

}

- (NSString)availableHearingDeviceName
{
  return (NSString *)-[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", kAXSAvailableHearingDeviceNamePreference, objc_opt_class(), 0);
}

- (void)setAvailableHearingDeviceName:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (unint64_t)a3;
  -[HUHearingAidSettings availableHearingDeviceName](self, "availableHearingDeviceName");
  v5 = objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)v5, "isEqualToString:", v4) & 1) == 0 && v4 | v5)
  {
    HCLogHearingHandoff();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1DE311000, v6, OS_LOG_TYPE_DEFAULT, "Set AvailableHearingDeviceName: %@", (uint8_t *)&v7, 0xCu);
    }

    -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, kAXSAvailableHearingDeviceNamePreference);
  }

}

- (unint64_t)usedHearingFeatures
{
  return -[HCSettings integerValueForKey:withDefaultValue:](self, "integerValueForKey:withDefaultValue:", kAXSHearingFeatureUsagePreference, 0);
}

- (void)setUsedHearingFeatures:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, kAXSHearingFeatureUsagePreference);

}

- (void)addDeviceIDToCloudDenylist:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  -[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", kAXSHearingAidsCloudDenylistPreference, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v6, "addObject:", v7);
    -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v6, kAXSHearingAidsCloudDenylistPreference);
  }

}

- (void)removeDeviceIDFromCloudDenylist:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, void *);
  void *v12;
  id v13;

  v8 = a3;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  -[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", kAXSHearingAidsCloudDenylistPreference, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v8, "length"))
  {
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __56__HUHearingAidSettings_removeDeviceIDFromCloudDenylist___block_invoke;
    v12 = &unk_1EA8E97F0;
    v13 = v8;
    v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", &v9);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v6, "removeObjectAtIndex:", v7);
    -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v6, kAXSHearingAidsCloudDenylistPreference, v8, v9, v10, v11, v12);

  }
}

uint64_t __56__HUHearingAidSettings_removeDeviceIDFromCloudDenylist___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32));
}

- (BOOL)isDeviceIDOnCloudDenylist:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", kAXSHearingAidsCloudDenylistPreference, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend(v4, "length"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__HUHearingAidSettings_isDeviceIDOnCloudDenylist___block_invoke;
    v8[3] = &unk_1EA8E97F0;
    v9 = v4;
    v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v8) != 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __50__HUHearingAidSettings_isDeviceIDOnCloudDenylist___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32));
}

- (BOOL)liveHeadphoneLevelEnabled
{
  return -[HCSettings BOOLValueForPreferenceKey:withDefaultValue:](self, "BOOLValueForPreferenceKey:withDefaultValue:", kAXSLiveHeadphoneLevelEnabledPreference, 1);
}

- (void)setLiveHeadphoneLevelEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, kAXSLiveHeadphoneLevelEnabledPreference);

}

- (BOOL)anyGizmoLiveHeadphoneLevelEnabled
{
  BOOL v3;

  v3 = -[HUHearingAidSettings gizmoLiveHeadphoneLevelEnabled](self, "gizmoLiveHeadphoneLevelEnabled");
  return v3 | -[HUHearingAidSettings gizmoLiveHeadphoneLevelNPEnabled](self, "gizmoLiveHeadphoneLevelNPEnabled");
}

- (BOOL)gizmoLiveHeadphoneLevelEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)gizmoLiveHeadphoneLevelNPEnabled
{
  return _os_feature_enabled_impl();
}

- (void)setAnyGizmoLiveHeadphoneLevelEnabled:(BOOL)a3
{
  self->_anyGizmoLiveHeadphoneLevelEnabled = a3;
}

- (void)setGizmoLiveHeadphoneLevelEnabled:(BOOL)a3
{
  self->_gizmoLiveHeadphoneLevelEnabled = a3;
}

- (void)setGizmoLiveHeadphoneLevelNPEnabled:(BOOL)a3
{
  self->_gizmoLiveHeadphoneLevelNPEnabled = a3;
}

- (OS_dispatch_queue)icloudInitializationQueue
{
  return self->_icloudInitializationQueue;
}

- (void)setIcloudInitializationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_icloudInitializationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icloudInitializationQueue, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
