@implementation HFAccessorySettingDeviceOptionsAdapter

- (HFAccessorySettingDeviceOptionsAdapter)initWithHomeKitSettingsVendor:(id)a3 mode:(unint64_t)a4
{
  id v6;
  void *v7;
  HFAccessorySettingDeviceOptionsAdapter *v8;
  void *v9;
  HFAccessorySettingDeviceOptionsAdapter *v10;
  HFAccessorySettingDeviceOptionsAdapterUtility *v11;
  HFAccessorySettingDeviceOptionsAdapterUtility *adapterUtility;
  objc_super v14;

  v6 = a3;
  v7 = v6;
  if (a4 == 1 || (objc_msgSend(v6, "isItemGroup") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14.receiver = self;
    v14.super_class = (Class)HFAccessorySettingDeviceOptionsAdapter;
    v10 = -[HFAccessorySettingAdapter initWithHomeKitSettingsVendor:keyPaths:mode:updateHandler:](&v14, sel_initWithHomeKitSettingsVendor_keyPaths_mode_updateHandler_, v7, v9, a4, 0);
    if (v10)
    {
      v11 = -[HFAccessorySettingDeviceOptionsAdapterUtility initWithHomeKitSettingsVendor:mode:groupedAccessory:delegate:]([HFAccessorySettingDeviceOptionsAdapterUtility alloc], "initWithHomeKitSettingsVendor:mode:groupedAccessory:delegate:", v7, a4, 0, v10);
      adapterUtility = v10->_adapterUtility;
      v10->_adapterUtility = v11;

      v10->_isAccessoryReachableOverRapport = 0;
    }
    self = v10;

    v8 = self;
  }

  return v8;
}

- (id)identifyAccessory
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v7[16];

  HFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "identifyAccessory invoked", v7, 2u);
  }

  -[HFAccessorySettingDeviceOptionsAdapter adapterUtility](self, "adapterUtility");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifyAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)restartAccessory
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v7[16];

  HFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "restartAccessory invoked", v7, 2u);
  }

  -[HFAccessorySettingDeviceOptionsAdapter adapterUtility](self, "adapterUtility");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "restartAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)resetAccessory
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v7[16];

  HFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "resetAccessory invoked", v7, 2u);
  }

  -[HFAccessorySettingDeviceOptionsAdapter adapterUtility](self, "adapterUtility");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)restartAccessories
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v7[16];

  HFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "restartAccessories invoked", v7, 2u);
  }

  -[HFAccessorySettingDeviceOptionsAdapter adapterUtility](self, "adapterUtility");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "restartAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)airDropSysdiagnose:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v9[16];

  v4 = a3;
  HFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "airDrop invoked", v9, 2u);
  }

  -[HFAccessorySettingDeviceOptionsAdapter adapterUtility](self, "adapterUtility");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestAirDrop:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)extractWiFiInfo
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v7[16];

  HFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "extractWiFiInfo invoked", v7, 2u);
  }

  -[HFAccessorySettingDeviceOptionsAdapter adapterUtility](self, "adapterUtility");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extractWiFiInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NAFuture)inProgressSysdiagnoseCollectionFuture
{
  NAFuture *inProgressSysdiagnoseCollectionFuture;

  inProgressSysdiagnoseCollectionFuture = self->_inProgressSysdiagnoseCollectionFuture;
  if (inProgressSysdiagnoseCollectionFuture)
  {
    if ((-[NAFuture isFinished](inProgressSysdiagnoseCollectionFuture, "isFinished") & 1) != 0)
      inProgressSysdiagnoseCollectionFuture = 0;
    else
      inProgressSysdiagnoseCollectionFuture = self->_inProgressSysdiagnoseCollectionFuture;
  }
  return inProgressSysdiagnoseCollectionFuture;
}

- (BOOL)shouldShowSettingsEntity:(id)a3
{
  void *v3;
  int v4;

  objc_msgSend(a3, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("root.general.analytics.sysdiagnose"));

  return v4 && HFPreferencesBooleanValueForKey(CFSTR("EXPOSE_SYSDIAGNOSE_FOR_HOMEPOD")) == 2;
}

- (id)handleButtonPressForEntity:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = v5;
  if (v5
    && (objc_msgSend(v5, "keyPath"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("root.general.analytics.sysdiagnose")),
        v7,
        !v8))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingDeviceOptionsAdapter.m"), 112, CFSTR("Unhandled button press from entity '%@'  for adapter: %@"), self, v6);

    v11 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "futureWithError:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HFAccessorySettingDeviceOptionsAdapter _handleButtonPress](self, "_handleButtonPress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)supportButtonPressForEntity:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("root.general.analytics.sysdiagnose"));

  return v4;
}

- (id)inProgressButtonPressFutureForEntity:(id)a3
{
  void *v4;
  int v5;
  void *v6;

  objc_msgSend(a3, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("root.general.analytics.sysdiagnose"));

  if (v5)
  {
    -[HFAccessorySettingDeviceOptionsAdapter inProgressSysdiagnoseCollectionFuture](self, "inProgressSysdiagnoseCollectionFuture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)inProgressButtonPressFutureForKeyPath:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("root.general.analytics.sysdiagnose")))
  {
    -[HFAccessorySettingDeviceOptionsAdapter inProgressSysdiagnoseCollectionFuture](self, "inProgressSysdiagnoseCollectionFuture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_handleButtonPress
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  HFAccessorySettingDeviceOptionsAdapter *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  HFAccessorySettingDeviceOptionsAdapter *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HFAccessorySettingDeviceOptionsAdapter inProgressSysdiagnoseCollectionFuture](self, "inProgressSysdiagnoseCollectionFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    HFLogForCategory(0x37uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = self;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Ignoring because previous SysdiagnoseCollection future is active", buf, 0x16u);

    }
    -[HFAccessorySettingDeviceOptionsAdapter inProgressSysdiagnoseCollectionFuture](self, "inProgressSysdiagnoseCollectionFuture");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "date", CFSTR("com.apple.Home.RapportRequest"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    objc_msgSend(v8, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v11 = (HFAccessorySettingDeviceOptionsAdapter *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory(0x37uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "Sending Collect Sysdiagnose rapport message w/ request: %@", buf, 0xCu);
    }

    -[HFAccessorySettingDeviceOptionsAdapter adapterUtility](self, "adapterUtility");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "requestSysdiagnose:options:", v11, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessorySettingDeviceOptionsAdapter setInProgressSysdiagnoseCollectionFuture:](self, "setInProgressSysdiagnoseCollectionFuture:", v14);

    -[HFAccessorySettingDeviceOptionsAdapter inProgressSysdiagnoseCollectionFuture](self, "inProgressSysdiagnoseCollectionFuture");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    return v15;
  }
}

- (id)_home
{
  void *v2;
  void *v3;

  -[HFAccessorySettingAdapter homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAccessoryReachableOverRapport
{
  return self->_isAccessoryReachableOverRapport;
}

- (void)setIsAccessoryReachableOverRapport:(BOOL)a3
{
  self->_isAccessoryReachableOverRapport = a3;
}

- (void)setInProgressSysdiagnoseCollectionFuture:(id)a3
{
  objc_storeStrong((id *)&self->_inProgressSysdiagnoseCollectionFuture, a3);
}

- (HFAccessorySettingDeviceOptionsAdapterUtility)adapterUtility
{
  return self->_adapterUtility;
}

- (void)setAdapterUtility:(id)a3
{
  objc_storeStrong((id *)&self->_adapterUtility, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adapterUtility, 0);
  objc_storeStrong((id *)&self->_inProgressSysdiagnoseCollectionFuture, 0);
}

@end
