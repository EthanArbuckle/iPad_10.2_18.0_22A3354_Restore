@implementation HFHomeKitSettingsAdapterManager

- (HFHomeKitSettingsAdapterManager)initWithHomeKitSettingsVendor:(id)a3
{
  HFHomeKitSettingsAdapterManager *v4;
  id v5;
  uint64_t v6;
  NSMutableDictionary *adaptersByID;
  objc_super v9;
  id location;

  objc_initWeak(&location, a3);
  v9.receiver = self;
  v9.super_class = (Class)HFHomeKitSettingsAdapterManager;
  v4 = -[HFHomeKitSettingsAdapterManager init](&v9, sel_init);
  if (v4)
  {
    v5 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v4->_homeKitSettingsVendor, v5);

    v6 = objc_opt_new();
    adaptersByID = v4->_adaptersByID;
    v4->_adaptersByID = (NSMutableDictionary *)v6;

  }
  objc_destroyWeak(&location);
  return v4;
}

- (HFHomeKitSettingsAdapterManager)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHomeKitSettingsVendor_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFHomeKitSettingsAdapterManager.m"), 59, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFHomeKitSettingsAdapterManager init]",
    v5);

  return 0;
}

- (id)adapterForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[HFHomeKitSettingsAdapterManager adaptersByID](self, "adaptersByID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__HFHomeKitSettingsAdapterManager_adapterForIdentifier___block_invoke;
  v9[3] = &unk_1EA7308C8;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_objectForKey:withDefaultValue:", v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __56__HFHomeKitSettingsAdapterManager_adapterForIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createAdapterForIdentifier:", *(_QWORD *)(a1 + 40));
}

- (id)_createAdapterForIdentifier:(id)a3
{
  id v4;
  __objc2_class *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("SiriLanguageAdapter")))
  {
    v5 = HFAccessorySettingSiriLanguageAdapter;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("ManagedConfigurationAdapter")))
  {
    v5 = HFAccessorySettingManagedConfigurationAdapter;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("MobileTimerAdapter")))
  {
    v5 = HFAccessorySettingMobileTimerAdapter;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("MusicAdapter")))
  {
    v5 = HFAccessorySettingMusicAdapter;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("DataAnalytics")))
  {
    v5 = HFAccessorySettingDataAnalyticsAdapter;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("DoorbellChimeAdapter")))
  {
    v5 = HFAccessorySettingDoorbellChimeAdapter;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("DeviceOptions")))
  {
    v5 = HFAccessorySettingDeviceOptionsAdapter;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("SiriHistoryAdapter")))
    {
      v8 = 0;
      goto LABEL_18;
    }
    v5 = HFAccessorySettingSiriHistoryAdapter;
  }
  v6 = [v5 alloc];
  -[HFHomeKitSettingsAdapterManager homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithHomeKitSettingsVendor:mode:", v7, 0);

LABEL_18:
  return v8;
}

- (HFHomeKitSettingsVendor)homeKitSettingsVendor
{
  return (HFHomeKitSettingsVendor *)objc_loadWeakRetained((id *)&self->_homeKitSettingsVendor);
}

- (NSMutableDictionary)adaptersByID
{
  return self->_adaptersByID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adaptersByID, 0);
  objc_destroyWeak((id *)&self->_homeKitSettingsVendor);
}

@end
