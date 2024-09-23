@implementation BTSDeviceConfigController

- (BTSDeviceConfigController)init
{
  BTSDeviceConfigController *v2;
  void *v3;
  void *v4;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _TtC16HeadphoneConfigs23ModernBatteryStatusView *batteryStatusView;
  NSString *findMyUrl;
  BTAirPodsControlServiceClient *airPodsServiceclient;
  HPSDeviceAnalytics *v30;
  HPSDeviceAnalytics *deviceAnalytics;
  uint64_t v32;
  NSNumber *adaptiveStrength;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)BTSDeviceConfigController;
  v2 = -[BTSDeviceConfigController init](&v35, sel_init);
  if (v2)
  {
    +[HPSHeadphoneManager sharedInstance](HPSHeadphoneManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addDelegate:", v2);

    *((_BYTE *)&v2->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80578]) = 0;
    *(_DWORD *)&v2->_syncSettings.supported = 0;
    v2->_syncSettings.userPermissionGranted = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_deviceRemoved_, *MEMORY[0x1E0D033E0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_deviceUpdated_, *MEMORY[0x1E0D033E8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_deviceConnectedHandler_, *MEMORY[0x1E0D033B0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel_deviceConnectedHandler_, *MEMORY[0x1E0D033A8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel_deviceSupportsSync_, *MEMORY[0x1E0D033D0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel_deviceSupportsMAP_, *MEMORY[0x1E0D033D8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel_deviceDisconnectedHandler_, *MEMORY[0x1E0D033C0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel_deviceDisconnectedHandler_, *MEMORY[0x1E0D033B8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel_settingsChangedHandler_, *MEMORY[0x1E0D03388], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel_deviceAccessDeviceLost_, CFSTR("DADeviceLost"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v2, sel_listeningModeUpdatedHandler_, CFSTR("BTAccessorySetListeningModeUpdated"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v2, sel_listeningModeUpdatedV2Handler_, CFSTR("HPSSetListeningModeUpdated"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v2, sel_pressAndHoldModeSelectedHandler_, CFSTR("BTAccessoryPressAndHoldModeSelected"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v2, sel_cycleBetweenLeftBudValueUpdated_, CFSTR("CycleBetweenLeftBudValue"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v2, sel_cycleBetweenRightBudValueUpdated_, CFSTR("CycleBetweenRightBudValue"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v2, sel_cycleBetweenV2LeftBudValueUpdated_, CFSTR("CycleBetweenV2LeftBudValue"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v2, sel_cycleBetweenV2RightBudValueUpdated_, CFSTR("CycleBetweenV2RightBudValue"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v2, sel_spatialProfileTappedHandler_, CFSTR("HPSSpatialAudioProfileTapped"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v2, sel_deviceUpdated_, CFSTR("BluetoothDeviceUpdatedNotificationConfig"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v2, sel_triggerSpatialProfileFeedback_, CFSTR("SpatialProfileEnrollmentNotCompleted"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v2, sel_caseSoundChangedHandler_, CFSTR("BTNotificationForSpeakerSettingChange"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v2, sel_updateHearingProtectionSpecifiers, CFSTR("HPSSoundProtectionUpdated"), 0);

    v2->_listeningModeConfigs = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v2, sel_findMyStatusUpdatedHandler_, CFSTR("FindMyStatusUpdated"), 0);

    v2->_findMySupport = 0;
    v2->_findMyEnable = 0;
    v2->_findMySetInProgress = 0;
    batteryStatusView = v2->_batteryStatusView;
    v2->_batteryStatusView = 0;

    findMyUrl = v2->_findMyUrl;
    v2->_findMyUrl = 0;

    v2->_enteredFromTopLevelEntry = 0;
    v2->_caseSoundRetrieved = 0;
    v2->_caseSoundRetrieveInProgress = 0;
    v2->_caseSoundEnable = 1;
    v2->_caseSilentMode = 0;
    v2->_caseSoundSupport = 0;
    v2->_setCaseSoundModeInProgress = 0;
    airPodsServiceclient = v2->_airPodsServiceclient;
    v2->_airPodsServiceclient = 0;

    v30 = objc_alloc_init(HPSDeviceAnalytics);
    deviceAnalytics = v2->_deviceAnalytics;
    v2->_deviceAnalytics = v30;

    v2->_adaptiveTransparencyRetrieved = 0;
    v2->_adaptiveTransparencyIndex = 0;
    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 50);
    adaptiveStrength = v2->_adaptiveStrength;
    v2->_adaptiveStrength = (NSNumber *)v32;

    v2->_findMyEnabledForPencil = 0;
    v2->_didFetchFindMyStatusForPencil = 0;
  }
  return v2;
}

- (void)dealloc
{
  BTSDeviceLE *ctkdLeDevice;
  BTAirPodsControlServiceClient *airPodsServiceclient;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  ctkdLeDevice = self->_ctkdLeDevice;
  self->_ctkdLeDevice = 0;

  airPodsServiceclient = self->_airPodsServiceclient;
  self->_airPodsServiceclient = 0;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  -[BTSDeviceConfigController carplayPreferences](self, "carplayPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferencesDelegate:", 0);

  v8.receiver = self;
  v8.super_class = (Class)BTSDeviceConfigController;
  -[BTSDeviceConfigController dealloc](&v8, sel_dealloc);
}

- (BOOL)canUnpair
{
  return (-[BluetoothDeviceProtocol cloudPaired](self->_device, "cloudPaired") & 1) == 0
      && !self->_isWatch
      && !self->_isManagedByWallet
      && !self->_isManagedByAliroWallet;
}

- (BOOL)canDisconnect
{
  void *v3;
  BOOL v4;

  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3
    && -[BluetoothDeviceProtocol connected](self->_device, "connected")
    && (-[BluetoothDeviceProtocol cloudPaired](self->_device, "cloudPaired") & 1) == 0
    && !self->_isWatch
    && !self->_isManagedByWallet
    && !self->_isManagedByAliroWallet;

  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BTSDeviceConfigController;
  -[BTSDeviceConfigController viewDidLoad](&v6, sel_viewDidLoad);
  if (_os_feature_enabled_impl())
  {
    -[BTSDeviceConfigController ndoController](self, "ndoController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setParentViewController:", self);

    -[BTSDeviceConfigController ndoController](self, "ndoController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateSpecifiersWithCompletionHandler:", &__block_literal_global_1);

  }
  v5 = 0;
  if (-[BTSDeviceConfigController isCurrentDeviceApplePencil:](self, "isCurrentDeviceApplePencil:", &v5) && v5 == 2)
    -[BTSDeviceConfigController refreshFindMyStatusForPencilInBackground](self, "refreshFindMyStatusForPencilInBackground");
  if (-[BTSDeviceConfigController managedByDeviceAccess](self, "managedByDeviceAccess"))
    -[BTSDeviceConfigController setTitle:](self, "setTitle:", 0);
  -[BTSDeviceConfigController updateASKHeader](self, "updateASKHeader");
}

- (void)viewWillAppear:(BOOL)a3
{
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BTSDeviceConfigController;
  -[BTSDeviceConfigController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[BTSDeviceConfigController reloadSpecifiers](self, "reloadSpecifiers");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->_enteredFromTopLevelEntry = 1;
    sharedBluetoothSettingsLogComponent();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Top Level Entry", v6, 2u);
    }
    v5 = 0;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Info Button", v6, 2u);
    }
    v5 = 1;
  }

  -[HPSDeviceAnalytics updateEntryPoint:](self->_deviceAnalytics, "updateEntryPoint:", v5);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _TtC16HeadphoneConfigs23ModernBatteryStatusView *batteryStatusView;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BTSDeviceConfigController;
  -[BTSDeviceConfigController viewDidDisappear:](&v11, sel_viewDidDisappear_, a3);
  if (self->_enteredFromTopLevelEntry)
  {
    objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "devicePairingEnabled");

    if (v5)
    {
      sharedBluetoothSettingsLogComponent();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Disable Pairing if enabled when leaving TLE", v10, 2u);
      }

      objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDevicePairingEnabled:", 0);

    }
  }
  sharedBluetoothSettingsLogComponent();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "Case Sound: viewDidDisappear, releasing case connection", v10, 2u);
  }

  -[BTSDeviceConfigController releaseCaseConnection](self, "releaseCaseConnection");
  -[HPSDeviceAnalytics submitDeviceAnalytics](self->_deviceAnalytics, "submitDeviceAnalytics");
  -[ModernBatteryStatusView cleanUp](self->_batteryStatusView, "cleanUp");
  batteryStatusView = self->_batteryStatusView;
  self->_batteryStatusView = 0;

}

- (void)updateDisconnectButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v3 = a3;
  -[NSArray objectAtIndex:](self->_controlGroupSpecifiers, "objectAtIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTSDeviceConfigController specifierForID:](self, "specifierForID:", CFSTR("disconnect"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v3)
  {
    if (!v6)
      -[BTSDeviceConfigController insertSpecifier:atIndex:](self, "insertSpecifier:atIndex:", v5, 1);
  }
  else if (v6)
  {
    -[BTSDeviceConfigController removeSpecifier:](self, "removeSpecifier:", v5);
  }
  if (_os_feature_enabled_impl())
  {
    -[NSArray objectAtIndex:](self->_controlGroupSpecifiers, "objectAtIndex:", 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isGuestPairingMode");

    if (v3)
    {
      if (v10)
      {
        sharedBluetoothSettingsLogComponent();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB30C000, v11, OS_LOG_TYPE_DEFAULT, "Guest Pairing: Inserting Upgrade Button", buf, 2u);
        }

        -[BTSDeviceConfigController insertSpecifier:atIndex:](self, "insertSpecifier:atIndex:", v8, 2);
      }
    }
    else if (v10)
    {
      sharedBluetoothSettingsLogComponent();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1DB30C000, v12, OS_LOG_TYPE_DEFAULT, "Guest Pairing: Removing Upgrade Button", v14, 2u);
      }

      -[BTSDeviceConfigController removeSpecifier:](self, "removeSpecifier:", v8);
    }

  }
  -[BTSDeviceConfigController headphoneObserver](self, "headphoneObserver");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reloadAll");

}

- (void)forgetDeviceTapped:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 1)
  {
    if (-[BTSDeviceConfigController managedByDeviceAccess](self, "managedByDeviceAccess"))
    {
      objc_msgSend(MEMORY[0x1E0C8EE08], "forgetDeviceAlertTitle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FORGET_ALERT_TITLE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[BluetoothDeviceProtocol name](self->_device, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", v12, v13);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("FORGET_DEVICE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1EA29D890, CFSTR("DeviceConfig"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0;
LABEL_19:
    v26 = 1;
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  v9 = -[BTSDeviceConfigController managedByDeviceAccess](self, "managedByDeviceAccess");
  if (v8 == 6)
  {
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C8EE08], "forgetDeviceAlertTitle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("FORGET_SHEET_TITLE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (-[BTSDeviceConfigController managedByDeviceAccess](self, "managedByDeviceAccess"))
    {
      objc_msgSend(MEMORY[0x1E0C8EE08], "forgetDeviceAlertBody");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("FORGET_ALERT_TITLE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[BluetoothDeviceProtocol name](self->_device, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", v22, v23);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("FORGET_DEVICE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1EA29D890, CFSTR("DeviceConfig"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_19;
  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C8EE08], "forgetDeviceAlertTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (-[BTSDeviceConfigController managedByDeviceAccess](self, "managedByDeviceAccess"))
  {
    objc_msgSend(MEMORY[0x1E0C8EE08], "forgetDeviceAlertBody");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  if (-[BTSDeviceConfigController managedByDeviceAccess](self, "managedByDeviceAccess"))
  {
    objc_msgSend(MEMORY[0x1E0C8EE08], "forgetDeviceAlertConfirm");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("FORGET_DEVICE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (-[BTSDeviceConfigController managedByDeviceAccess](self, "managedByDeviceAccess"))
  {
    objc_msgSend(MEMORY[0x1E0C8EE08], "forgetDeviceAlertCancel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1EA29D890, CFSTR("DeviceConfig"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v26 = 0;
LABEL_28:
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v6, v18, v26);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __48__BTSDeviceConfigController_forgetDeviceTapped___block_invoke;
  v32[3] = &unk_1EA29A880;
  v32[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v15, 2, v32);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v17, 0, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addAction:", v30);
  objc_msgSend(v29, "addAction:", v31);
  -[BTSDeviceConfigController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v29, 1, 0);

}

uint64_t __48__BTSDeviceConfigController_forgetDeviceTapped___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "forgetDevice");
}

- (void)forgetDevice
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB30C000, v0, v1, "Unpairing DADevice failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __41__BTSDeviceConfigController_forgetDevice__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  id v21;
  void *v22;
  uint8_t v23[16];
  uint8_t v24[16];
  uint8_t v25[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "devicePairingEnabled");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDevicePairingEnabled:", 1);

    do
    {
      objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "devicePairingEnabled");

    }
    while (!v6);
    sharedBluetoothSettingsLogComponent();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB30C000, v7, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Device Pairing Disabled somehow, Enabled again", buf, 2u);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "unpair");
  v8 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1560);
  sharedBluetoothSettingsLogComponent();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1DB30C000, v9, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Unpair from TLE", v25, 2u);
    }

    if ((objc_msgSend(*(id *)(a1 + 32), "isiPad") & 1) != 0)
      goto LABEL_12;
    objc_msgSend(*(id *)(a1 + 32), "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "size");
    v13 = v12;
    objc_msgSend(*(id *)(a1 + 32), "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "size");
    v16 = v15;

    if (v13 > v16)
    {
LABEL_12:
      sharedBluetoothSettingsLogComponent();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_1DB30C000, v17, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Unpairing from TLE with side by side layout, jump to General", v24, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0C99E98];
      v20 = CFSTR("prefs:root=General");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0C99E98];
      v20 = CFSTR("prefs:root=ROOT");
    }
    objc_msgSend(v19, "URLWithString:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "openSensitiveURL:withOptions:", v22, 0);

  }
  else
  {
    if (v10)
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1DB30C000, v9, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Unpair from Regular", v23, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend(v18, "popViewControllerAnimated:", 1);
  }

}

- (BOOL)isiCloudEnabled
{
  id v2;
  void *v3;
  BOOL v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isCurrentDeviceApplePencil:(int *)a3
{
  void *v4;
  void *v5;
  char v6;

  -[BTSDeviceConfigController leDevice](self, "leDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "isApplePencil:", a3);
  else
    v6 = 0;

  return v6;
}

- (id)extraUnpairWarningMessage
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  int v13;

  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "magicPaired");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FORGET_MAGIC_PAIRED_DEVICE_WARNING"), &stru_1EA29D890, CFSTR("DeviceConfig"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BluetoothDeviceProtocol name](self->_device, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  else
  {
    v13 = 0;
    if (!-[BTSDeviceConfigController isCurrentDeviceApplePencil:](self, "isCurrentDeviceApplePencil:", &v13)
      || v13 != 2)
    {
      return 0;
    }
    if (!self->_didFetchFindMyStatusForPencil)
      -[BTSDeviceConfigController refreshFindMyStatusForPencilSynchronously](self, "refreshFindMyStatusForPencilSynchronously");
    if (self->_findMyEnabledForPencil)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FORGET_FINDMY_PAIRED_PENCIL_WARNING"), &stru_1EA29D890, CFSTR("DeviceConfig-B532"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      return v12;
    }
    else
    {
      return 0;
    }
  }
}

- (void)disconnectDevice:(id)a3
{
  if (-[BTSDeviceConfigController canDisconnect](self, "canDisconnect", a3))
  {
    -[BluetoothDeviceProtocol disconnect](self->_device, "disconnect");
    -[HPSDeviceAnalytics updateFeatureChangeCount:](self->_deviceAnalytics, "updateFeatureChangeCount:", 18);
    -[BTSDeviceConfigController updateDisconnectButton:](self, "updateDisconnectButton:", 0);
    -[BTSDeviceConfigController dismissCurrentViewController](self, "dismissCurrentViewController");
  }
}

- (void)upgradeDevice:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  __int16 v10;
  __int16 v11;

  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isGuestPairingMode");

  if ((v5 & 1) != 0)
  {
    if (-[BTSDeviceConfigController canDisconnect](self, "canDisconnect"))
    {
      -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setGuestPairingMode:", 0);

      -[BTSDeviceConfigController dismissCurrentViewController](self, "dismissCurrentViewController");
      return;
    }
    sharedBluetoothSettingsLogComponent();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 0;
      v8 = "Guest Pairing: Cannot Upgrade, Device is not connected";
      v9 = (uint8_t *)&v10;
      goto LABEL_8;
    }
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 0;
      v8 = "Guest Pairing: Cannot Upgrade, Device is Guest Paired";
      v9 = (uint8_t *)&v11;
LABEL_8:
      _os_log_impl(&dword_1DB30C000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
  }

}

- (void)dismissCurrentViewController
{
  _BOOL4 enteredFromTopLevelEntry;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t buf[16];

  enteredFromTopLevelEntry = self->_enteredFromTopLevelEntry;
  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!enteredFromTopLevelEntry)
  {
    if (v5)
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Disconnect from Regular", v19, 2u);
    }

    -[BTSDeviceConfigController navigationController](self, "navigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v16, "popViewControllerAnimated:", 1);
    goto LABEL_12;
  }
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Disconnect from TLE", buf, 2u);
  }

  -[BTSDeviceConfigController parentViewController](self, "parentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);

  if (-[BTSDeviceConfigController isiPad](self, "isiPad"))
    goto LABEL_6;
  -[BTSDeviceConfigController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v11 = v10;
  -[BTSDeviceConfigController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "size");
  v14 = v13;

  if (v11 > v14)
  {
LABEL_6:
    sharedBluetoothSettingsLogComponent();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1DB30C000, v15, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Disconnecting from TLE with side by side layout, jump to General", v20, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=General"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "openSensitiveURL:withOptions:", v17, 0);

LABEL_12:
  }
}

- (BOOL)isiPhone
{
  void *v2;
  char v3;

  MGGetStringAnswer();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPhone"));

  return v3;
}

- (BOOL)isiPad
{
  void *v2;
  char v3;

  MGGetStringAnswer();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPad"));

  return v3;
}

- (BOOL)isWatch
{
  void *v2;
  char v3;

  MGGetStringAnswer();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Watch"));

  return v3;
}

- (id)leDevice
{
  objc_class *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  int v7;
  BluetoothDeviceProtocol *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7)
  {
    v8 = self->_device;
  }
  else
  {
    v9 = (int)*MEMORY[0x1E0D80628];
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v9), "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ctkd-device"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v9), "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
      v14 = CFSTR("ctkd-device");
    else
      v14 = CFSTR("linked-le-device");
    objc_msgSend(v12, "objectForKeyedSubscript:", v14);
    v8 = (BluetoothDeviceProtocol *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (BOOL)managedByDeviceAccess
{
  void *v2;
  void *v3;
  char v4;

  -[BTSDeviceConfigController leDevice](self, "leDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isManagedByDeviceAccess");
  else
    v4 = 0;

  return v4;
}

- (void)deviceConnectedHandler:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 dismissed;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BluetoothDeviceProtocol identifier](self->_device, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", v5))
  {

LABEL_7:
    goto LABEL_8;
  }
  dismissed = self->_dismissed;

  if (!dismissed)
  {
    -[NSArray objectAtIndex:](self->_controlGroupSpecifiers, "objectAtIndex:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[BTSDeviceConfigController canUnpair](self, "canUnpair"))
    {
      objc_msgSend(v4, "setProperty:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0D80808]);
      -[BTSDeviceConfigController reloadSpecifier:](self, "reloadSpecifier:", v4);
    }
    self->_devicePendingCTKDConnection = 0;
    -[BTSDeviceConfigController removeSpecifierID:](self, "removeSpecifierID:", CFSTR("CLASSIC_SETUP_TITLE_ID"));
    -[BTSDeviceConfigController removeSpecifierID:](self, "removeSpecifierID:", CFSTR("CLASSIC_SETUP_BODY_ID"));
    -[BTSDeviceConfigController removeSpecifierID:](self, "removeSpecifierID:", CFSTR("CLASSIC_SETUP_BUTTON_ID"));
    -[BTSDeviceConfigController updateDisconnectButton:](self, "updateDisconnectButton:", -[BTSDeviceConfigController canDisconnect](self, "canDisconnect"));
    goto LABEL_7;
  }
LABEL_8:

}

- (void)deviceDisconnectedHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 dismissed;
  NSObject *v8;
  uint8_t v9[16];

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BluetoothDeviceProtocol identifier](self->_device, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    dismissed = self->_dismissed;

    if (!dismissed)
      -[BTSDeviceConfigController updateDisconnectButton:](self, "updateDisconnectButton:", -[BTSDeviceConfigController canDisconnect](self, "canDisconnect"));
  }
  else
  {

  }
  sharedBluetoothSettingsLogComponent();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "Case Sound: device disconnected, releasing case connection", v9, 2u);
  }

  -[BTSDeviceConfigController releaseCaseConnection](self, "releaseCaseConnection");
}

- (void)caseSoundChangedHandler:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "Case Sound: caseSoundChangedHandler, BTNotificationForSpeakerSettingChange", v5, 2u);
  }

  -[BTSDeviceConfigController getSoundMode](self, "getSoundMode");
}

- (void)deviceSupportsSync:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 dismissed;
  const __CFString *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sharedBluetoothSettingsLogComponent();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_1DB30C000, v7, OS_LOG_TYPE_DEFAULT, "%@ received %@ for device %@", (uint8_t *)&v15, 0x20u);

  }
  if (!self->_syncSettings.supported)
  {
    objc_msgSend(v6, "address");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BluetoothDeviceProtocol identifier](self->_device, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", v12) & 1) != 0)
    {
      dismissed = self->_dismissed;

      if (!dismissed)
      {
        -[BTSDeviceConfigController loadSyncSettings](self, "loadSyncSettings");
        if (!self->_syncSettings.supported)
          -[BTSDeviceConfigController deviceSupportsSync:].cold.1();
        if (self->_supportsMAP)
          v14 = CFSTR("MAP_SWITCH");
        else
          v14 = CFSTR("FORGET_BUTTON");
        -[BTSDeviceConfigController insertContiguousSpecifiers:afterSpecifierID:animated:](self, "insertContiguousSpecifiers:afterSpecifierID:animated:", self->_syncContactsSpecifiers, v14, 1);
        if (self->_syncSettings.enabled)
          -[BTSDeviceConfigController insertContiguousSpecifiers:afterSpecifierID:animated:](self, "insertContiguousSpecifiers:afterSpecifierID:animated:", self->_syncGroupsSpecifiers, CFSTR("SYNC_SWITCH"), 1);
      }
    }
    else
    {

    }
  }

}

- (void)deviceSupportsMAP:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 dismissed;
  void *v14;
  NSObject *v15;
  _BOOL4 messagingEnabled;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sharedBluetoothSettingsLogComponent();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412802;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_1DB30C000, v7, OS_LOG_TYPE_DEFAULT, "%@ received %@ for device %@", (uint8_t *)&v17, 0x20u);

  }
  if (!self->_supportsMAP)
  {
    objc_msgSend(v6, "address");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BluetoothDeviceProtocol identifier](self->_device, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", v12) & 1) != 0)
    {
      dismissed = self->_dismissed;

      if (!dismissed)
      {
        self->_supportsMAP = 1;
        objc_msgSend(v6, "getServiceSetting:key:", 512, CFSTR("BT_KEY_MAP_ENABLED"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        self->_messagingEnabled = objc_msgSend(v14, "isEqualToString:", CFSTR("BT_VALUE_MAP_ENABLED"));

        sharedBluetoothSettingsLogComponent();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          messagingEnabled = self->_messagingEnabled;
          v17 = 67109120;
          LODWORD(v18) = messagingEnabled;
          _os_log_impl(&dword_1DB30C000, v15, OS_LOG_TYPE_DEFAULT, "After calling getServiceSetting, MAP messaging is set to: %d", (uint8_t *)&v17, 8u);
        }

        -[BTSDeviceConfigController insertContiguousSpecifiers:afterSpecifierID:animated:](self, "insertContiguousSpecifiers:afterSpecifierID:animated:", self->_messagingSpecifiers, CFSTR("FORGET_BUTTON"), 1);
      }
    }
    else
    {

    }
  }

}

- (void)deviceUpdated:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 dismissed;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(a3, "object");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BluetoothDeviceProtocol identifier](self->_device, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", v5))
  {
LABEL_9:

    goto LABEL_10;
  }
  dismissed = self->_dismissed;

  if (!dismissed)
  {
    objc_msgSend(v14, "productName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[BTSDeviceConfigController nicknameEnabled](self, "nicknameEnabled"))
    {
      objc_msgSend(v14, "name");
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }
    -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "magicPaired");

      if (v11)
      {
        objc_msgSend(v14, "name");
        v12 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v12;
      }
    }
    -[BTSDeviceConfigController setTitle:](self, "setTitle:", v4);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DEVICE_NAME_TITLE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTSDeviceConfigController reloadSpecifierID:](self, "reloadSpecifierID:", v13);

    goto LABEL_9;
  }
LABEL_10:

}

- (void)listeningModeUpdatedHandler:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  if (self->_deviceAnalytics)
  {
    objc_msgSend(a3, "userInfo");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("ListeningModes"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ListeningModes"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "unsignedIntValue");

      -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 31, v6, 0);
      -[HPSDeviceAnalytics updateFeatureChangeCount:](self->_deviceAnalytics, "updateFeatureChangeCount:", 30);
    }
    else
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ListeningModesValueOnly"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "unsignedIntValue");

      -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 31, v8, 0);
    }

  }
}

- (void)listeningModeUpdatedV2Handler:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  if (self->_deviceAnalytics)
  {
    objc_msgSend(a3, "userInfo");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("ListeningModesV2"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ListeningModesV2"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "unsignedIntValue");

      -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 33, v6, 0);
      -[HPSDeviceAnalytics updateFeatureChangeCount:](self->_deviceAnalytics, "updateFeatureChangeCount:", 32);
    }
    else
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ListeningModesV2ValueOnly"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "unsignedIntValue");

      -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 33, v8, 0);
    }

  }
}

- (void)pressAndHoldModeSelectedHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (self->_deviceAnalytics)
  {
    objc_msgSend(a3, "userInfo");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pressHoldRightBudValue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedIntValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pressHoldLeftBudValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntValue");

    -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 44, v5, 0);
    -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 43, v7, 0);
    -[HPSDeviceAnalytics updateFeatureChangeCount:](self->_deviceAnalytics, "updateFeatureChangeCount:", 42);

  }
}

- (void)cycleBetweenLeftBudValueUpdated:(id)a3
{
  void *v4;
  id v5;

  if (self->_deviceAnalytics)
  {
    objc_msgSend(a3, "userInfo");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cycleBetweenLeftBudValue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 9, 0, v4);
    -[HPSDeviceAnalytics updateFeatureChangeCount:](self->_deviceAnalytics, "updateFeatureChangeCount:", 9);

  }
}

- (void)cycleBetweenRightBudValueUpdated:(id)a3
{
  void *v4;
  id v5;

  if (self->_deviceAnalytics)
  {
    objc_msgSend(a3, "userInfo");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cycleBetweenRightBudValue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 11, 0, v4);
    -[HPSDeviceAnalytics updateFeatureChangeCount:](self->_deviceAnalytics, "updateFeatureChangeCount:", 11);

  }
}

- (void)cycleBetweenV2LeftBudValueUpdated:(id)a3
{
  void *v4;
  id v5;

  if (self->_deviceAnalytics)
  {
    objc_msgSend(a3, "userInfo");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cycleBetweenV2LeftBudValue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 13, 0, v4);
    -[HPSDeviceAnalytics updateFeatureChangeCount:](self->_deviceAnalytics, "updateFeatureChangeCount:", 12);

  }
}

- (void)cycleBetweenV2RightBudValueUpdated:(id)a3
{
  void *v4;
  id v5;

  if (self->_deviceAnalytics)
  {
    objc_msgSend(a3, "userInfo");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cycleBetweenV2RightBudValue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 15, 0, v4);
    -[HPSDeviceAnalytics updateFeatureChangeCount:](self->_deviceAnalytics, "updateFeatureChangeCount:", 14);

  }
}

- (void)spatialProfileTappedHandler:(id)a3
{
  HPSDeviceAnalytics *deviceAnalytics;

  deviceAnalytics = self->_deviceAnalytics;
  if (deviceAnalytics)
    -[HPSDeviceAnalytics updateFeatureChangeCount:](deviceAnalytics, "updateFeatureChangeCount:", 50);
}

- (void)settingsChangedHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80628]), "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HPSDevice deviceKey](HPSDevice, "deviceKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "headphoneDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "address");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BluetoothDeviceProtocol identifier](self->_device, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", v10) && !self->_dismissed)
  {

    if (v8)
    {
      sharedBluetoothSettingsLogComponent();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1DB30C000, v11, OS_LOG_TYPE_DEFAULT, "Headphone Configs: settingsChangedHandler reload!", v12, 2u);
      }

      -[BTSDeviceConfigController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("LISTENING_MODE_ID"));
      -[BTSDeviceConfigController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("SPEECH_DETECTION_ID"));
      -[BTSDeviceConfigController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("ADAPTIVE_VOLUME_ID"));
    }
  }
  else
  {

  }
}

- (void)deviceRemoved:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 dismissed;
  _BOOL4 enteredFromTopLevelEntry;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  id v21;
  void *v22;
  uint8_t v23[16];
  uint8_t v24[16];
  uint8_t buf[16];

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BluetoothDeviceProtocol identifier](self->_device, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    dismissed = self->_dismissed;

    if (!dismissed)
    {
      self->_dismissed = 1;
      enteredFromTopLevelEntry = self->_enteredFromTopLevelEntry;
      sharedBluetoothSettingsLogComponent();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (enteredFromTopLevelEntry)
      {
        if (v10)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB30C000, v9, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Device Removed while entered from TLE", buf, 2u);
        }

        if (-[BTSDeviceConfigController isiPad](self, "isiPad"))
          goto LABEL_8;
        -[BTSDeviceConfigController view](self, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "size");
        v13 = v12;
        -[BTSDeviceConfigController view](self, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "size");
        v16 = v15;

        if (v13 > v16)
        {
LABEL_8:
          sharedBluetoothSettingsLogComponent();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v24 = 0;
            _os_log_impl(&dword_1DB30C000, v17, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Device Removed from TLE with side by side layout, jump to General", v24, 2u);
          }

          objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)MEMORY[0x1E0C99E98];
          v20 = CFSTR("prefs:root=General");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)MEMORY[0x1E0C99E98];
          v20 = CFSTR("prefs:root=ROOT");
        }
        objc_msgSend(v19, "URLWithString:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "openSensitiveURL:withOptions:", v22, 0);

      }
      else
      {
        if (v10)
        {
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_1DB30C000, v9, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Device Removed from Regular", v23, 2u);
        }

        -[BTSDeviceConfigController navigationController](self, "navigationController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (id)objc_msgSend(v18, "popViewControllerAnimated:", 1);
      }

    }
  }
  else
  {

  }
}

- (void)deviceAccessDeviceLost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_dismissed && -[BTSDeviceConfigController managedByDeviceAccess](self, "managedByDeviceAccess"))
  {
    -[BTSDeviceConfigController leDevice](self, "leDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "object");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "underlyingDADevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", v6);

      if (v9)
      {
        sharedBluetoothSettingsLogComponent();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "underlyingDADevice");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138412290;
          v15 = v11;
          _os_log_impl(&dword_1DB30C000, v10, OS_LOG_TYPE_DEFAULT, "Headphone Configs: DADevice Lost, popping to previous page. %@", (uint8_t *)&v14, 0xCu);

        }
        self->_dismissed = 1;
        -[BTSDeviceConfigController navigationController](self, "navigationController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (id)objc_msgSend(v12, "popViewControllerAnimated:", 1);

      }
    }

  }
}

- (void)allowClassicConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[BTSDeviceConfigController leDevice](self, "leDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = v3;
    objc_msgSend(v3, "setDenyIncomingClassicConnection:", 0);
    -[BluetoothDeviceProtocol connect](self->_device, "connect");
    self->_devicePendingCTKDConnection = 1;
    -[BTSDeviceConfigController specifierForID:](self, "specifierForID:", CFSTR("CLASSIC_SETUP_BUTTON_ID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CLASSIC_SETUP_BUTTON_CONNECTING"), &stru_1EA29D890, CFSTR("DeviceConfig"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", v6);

    objc_msgSend(v4, "setProperty:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80808]);
    -[BTSDeviceConfigController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("CLASSIC_SETUP_BUTTON_ID"));

    v3 = v7;
  }

}

- (id)messagesEnabled:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_messagingEnabled);
}

- (void)setMessagesEnabled:(id)a3 specifier:(id)a4
{
  id v5;
  NSObject *v6;
  _BOOL4 messagingEnabled;
  void *v8;
  void *v9;
  const __CFString *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_messagingEnabled != objc_msgSend(v5, "BOOLValue"))
  {
    self->_messagingEnabled = objc_msgSend(v5, "BOOLValue");
    sharedBluetoothSettingsLogComponent();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      messagingEnabled = self->_messagingEnabled;
      v14 = 67109120;
      LODWORD(v15) = messagingEnabled;
      _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "User wants MAP set to: %d", (uint8_t *)&v14, 8u);
    }

    -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (self->_messagingEnabled)
      v10 = CFSTR("BT_VALUE_MAP_ENABLED");
    else
      v10 = CFSTR("BT_VALUE_MAP_DISABLED");
    objc_msgSend(v8, "setServiceSetting:key:value:", 512, CFSTR("BT_KEY_MAP_ENABLED"), v10);

    sharedBluetoothSettingsLogComponent();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "getServiceSetting:key:", 512, CFSTR("BT_KEY_MAP_ENABLED"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_1DB30C000, v11, OS_LOG_TYPE_DEFAULT, "After setting MAP, result is: %@", (uint8_t *)&v14, 0xCu);

    }
  }

}

- (id)contactSync:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_syncSettings.enabled);
}

- (void)setContactSync:(id)a3 specifier:(id)a4
{
  void *v5;
  NSMutableArray *syncGroupsSpecifiers;
  id v7;

  v7 = a3;
  if (self->_syncSettings.enabled != objc_msgSend(v7, "BOOLValue"))
  {
    self->_syncSettings.enabled = objc_msgSend(v7, "BOOLValue");
    self->_syncSettings.userPermissionGranted = 1;
    -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSyncSettings:", *(unsigned int *)&self->_syncSettings.supported | ((unint64_t)self->_syncSettings.userPermissionGranted << 32));

    syncGroupsSpecifiers = self->_syncGroupsSpecifiers;
    if (self->_syncSettings.enabled)
      -[BTSDeviceConfigController insertContiguousSpecifiers:afterSpecifierID:animated:](self, "insertContiguousSpecifiers:afterSpecifierID:animated:", syncGroupsSpecifiers, CFSTR("SYNC_SWITCH"), 1);
    else
      -[BTSDeviceConfigController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", syncGroupsSpecifiers, 1);
  }

}

- (id)userSelectedDeviceType
{
  void *v2;
  unsigned int v3;
  void *v4;

  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getUserSelectedDeviceType");

  if (v3 <= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", dword_1DB3C1384[v3]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setUserSelectedDeviceType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  NSObject *v9;

  v4 = a3;
  switch(objc_msgSend(v4, "intValue"))
  {
    case 1u:
      -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = 1;
      goto LABEL_7;
    case 2u:
      -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = 2;
      goto LABEL_7;
    case 3u:
      -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = 3;
      goto LABEL_7;
    case 4u:
      -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = 4;
      goto LABEL_7;
    case 5u:
      -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = 5;
LABEL_7:
      v8 = objc_msgSend(v5, "setUserSelectedDeviceType:", v7);

      if ((v8 & 1) == 0)
        goto LABEL_8;
      goto LABEL_11;
    default:
LABEL_8:
      sharedBluetoothSettingsLogComponent();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[BTSDeviceConfigController setUserSelectedDeviceType:].cold.1(v4);

LABEL_11:
      return;
  }
}

- (id)automaticAnswerCallsEnabled
{
  void *v3;
  uint64_t v4;

  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "autoAnswerMode");

  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 35, v4, 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (_DWORD)v4 == 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setAutomaticAnswerCallsEnabled:(id)a3
{
  HPSDeviceAnalytics *deviceAnalytics;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  deviceAnalytics = self->_deviceAnalytics;
  v5 = a3;
  -[HPSDeviceAnalytics updateFeatureChangeCount:](deviceAnalytics, "updateFeatureChangeCount:", 34);
  v6 = objc_msgSend(v5, "BOOLValue");

  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 35, v6, 0);
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if ((_DWORD)v6)
    v8 = 1;
  else
    v8 = 2;
  objc_msgSend(v7, "setAutoAnswerMode:", v8);

}

- (id)doubleTapAction
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInt:", objc_msgSend(v3, "doubleTapAction"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setdoubleTapAction:(id)a3
{
  HPSDeviceAnalytics *deviceAnalytics;
  id v5;
  uint64_t v6;
  id v7;

  deviceAnalytics = self->_deviceAnalytics;
  v5 = a3;
  -[HPSDeviceAnalytics updateFeatureChangeCount:](deviceAnalytics, "updateFeatureChangeCount:", 19);
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  objc_msgSend(v7, "setDoubleTapAction:", v6);
}

- (id)doubleTapActionLeft
{
  void *v3;
  NSObject *v4;
  int v6;
  unsigned int v7;

  v6 = 1;
  v7 = 1;
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleTapActionEx:rightAction:", &v7, &v6);

  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[BTSDeviceConfigController doubleTapActionLeft].cold.1(&v7);

  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 20, v7, 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setdoubleTapActionLeft:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = objc_msgSend(v4, "intValue");
    _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Set Double tap action left : %d", (uint8_t *)v9, 8u);
  }

  -[HPSDeviceAnalytics updateFeatureChangeCount:](self->_deviceAnalytics, "updateFeatureChangeCount:", 19);
  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 20, objc_msgSend(v4, "intValue"), 0);
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "intValue");
  -[BTSDeviceConfigController doubleTapActionRight](self, "doubleTapActionRight");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDoubleTapActionEx:rightAction:", v7, objc_msgSend(v8, "intValue"));

}

- (id)doubleTapActionRight
{
  void *v3;
  NSObject *v4;
  unsigned int v6;
  int v7;

  v6 = 1;
  v7 = 1;
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleTapActionEx:rightAction:", &v7, &v6);

  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[BTSDeviceConfigController doubleTapActionRight].cold.1(&v6);

  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 21, v6, 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setdoubleTapActionRight:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = objc_msgSend(v4, "intValue");
    _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Set Double tap action right : %d", (uint8_t *)v8, 8u);
  }

  -[HPSDeviceAnalytics updateFeatureChangeCount:](self->_deviceAnalytics, "updateFeatureChangeCount:", 19);
  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 21, objc_msgSend(v4, "intValue"), 0);
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTSDeviceConfigController doubleTapActionLeft](self, "doubleTapActionLeft");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDoubleTapActionEx:rightAction:", objc_msgSend(v7, "intValue"), objc_msgSend(v4, "intValue"));

}

- (id)inEarDetectEnabled
{
  HPSDeviceAnalytics *deviceAnalytics;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  deviceAnalytics = self->_deviceAnalytics;
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "inEarDetectEnabled"))
    v5 = CFSTR("On");
  else
    v5 = CFSTR("Off");
  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](deviceAnalytics, "updateFeatureValue:value:featureValueString:", 29, 0, v5);

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "inEarDetectEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setInEarDetectEnabled:(id)a3
{
  HPSDeviceAnalytics *deviceAnalytics;
  id v5;
  uint64_t v6;
  const __CFString *v7;
  id v8;

  deviceAnalytics = self->_deviceAnalytics;
  v5 = a3;
  -[HPSDeviceAnalytics updateFeatureChangeCount:](deviceAnalytics, "updateFeatureChangeCount:", 28);
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((_DWORD)v6)
    v7 = CFSTR("On");
  else
    v7 = CFSTR("Off");
  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 29, 0, v7);
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInEarDetectEnabled:", v6);

}

- (void)setSoundProfileAllowed:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(a3, "BOOLValue");
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceSoundProfileAllowed:", v4);

}

- (id)soundProfileAllowed
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "getDeviceSoundProfileAllowed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getEndCallMode
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  int v6;
  unint64_t v7;
  NSObject *v8;
  int v9;
  unsigned int v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  unsigned __int8 v14;
  int v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "getCallManagementConfig");
  v5 = HIDWORD(v4) & 0xFFFFFF;

  v6 = v4;
  if (v4 == 1)
  {
    sharedBluetoothSettingsLogComponent();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = BYTE3(v4);
      v18 = 67110144;
      v19 = 1;
      LODWORD(v4) = BYTE4(v4);
      v20 = 1024;
      v21 = v12;
      v22 = 1024;
      v23 = v5;
      v24 = 1024;
      v25 = BYTE5(v4);
      v26 = 1024;
      v27 = BYTE6(v4);
      _os_log_impl(&dword_1DB30C000, v11, OS_LOG_TYPE_DEFAULT, "Call Controls: getEndCallMode, version: %u, End Call Status: %d, End Call Config: %d, Mute Call Status: %d, Mute Call Config: %d", (uint8_t *)&v18, 0x20u);
    }
    else
    {
      LODWORD(v4) = BYTE4(v4);
    }

    if ((_DWORD)v4 != 4 && v4 >= 2)
      v14 = v5;
    else
      v14 = 2;
  }
  else if ((_BYTE)v4)
  {
    sharedBluetoothSettingsLogComponent();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 67109120;
      v19 = v6;
      _os_log_impl(&dword_1DB30C000, v13, OS_LOG_TYPE_DEFAULT, "Call Controls: getEndCallMode invalid version: %u", (uint8_t *)&v18, 8u);
    }

    v14 = 0;
  }
  else
  {
    v7 = v4 >> 16;
    sharedBluetoothSettingsLogComponent();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = BYTE1(v4);
      v10 = BYTE2(v4);
      v18 = 67109632;
      v19 = 0;
      v20 = 1024;
      v21 = v9;
      v22 = 1024;
      v23 = v7;
      _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "End Call: Get Config, version: %u, Status: %d, Mode: %d", (uint8_t *)&v18, 0x14u);
    }
    else
    {
      v10 = BYTE2(v4);
    }

    if (v10 != 4 && v10 >= 2)
      v14 = v7;
    else
      v14 = 2;
  }
  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 24, v5, 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setEndCallMode:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  int v17;
  int v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HPSDeviceAnalytics updateFeatureChangeCount:](self->_deviceAnalytics, "updateFeatureChangeCount:", 23);
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "getCallManagementConfig");

  v7 = v6;
  if (v6 == 1)
  {
    LOBYTE(v8) = objc_msgSend(v4, "intValue");
    if (v8 == 3)
      v12 = 2;
    else
      v12 = BYTE6(v6);
    if (v8 == 2)
      v13 = 3;
    else
      v13 = v12;
    sharedBluetoothSettingsLogComponent();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 67110144;
      v18 = 1;
      v19 = 1024;
      v20 = BYTE3(v6);
      v21 = 1024;
      v22 = v8;
      v23 = 1024;
      v24 = BYTE5(v6);
      v25 = 1024;
      v26 = v13;
      _os_log_impl(&dword_1DB30C000, v14, OS_LOG_TYPE_DEFAULT, "Call Controls: setEndCallMode, version: %u, End Call Status: %d, End Call Config: %d, Mute Call Status: %d, Mute Call Config: %d", (uint8_t *)&v17, 0x20u);
    }

    -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCallConfig:", v6 & 0xFF0000000000 | (v13 << 48) | ((unint64_t)v8 << 32) | v6);

    -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 39, v13, 0);
  }
  else
  {
    v8 = HIDWORD(v6) & 0xFFFFFF;
    if ((_BYTE)v6)
    {
      sharedBluetoothSettingsLogComponent();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 67109120;
        v18 = v7;
        _os_log_impl(&dword_1DB30C000, v16, OS_LOG_TYPE_DEFAULT, "Call Controls: setEndCallMode invalid version: %u", (uint8_t *)&v17, 8u);
      }

    }
    else
    {
      v9 = objc_msgSend(v4, "intValue");
      sharedBluetoothSettingsLogComponent();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 67109632;
        v18 = 0;
        v19 = 1024;
        v20 = BYTE1(v6);
        v21 = 1024;
        v22 = v9;
        _os_log_impl(&dword_1DB30C000, v10, OS_LOG_TYPE_DEFAULT, "End Call: Set Config, version: %u, Status: %d, Mode: %d", (uint8_t *)&v17, 0x14u);
      }

      -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCallConfig:", v6 & 0xFFFFFFFF00FFFFLL | (v9 << 16));

    }
  }
  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 24, v8, 0);

}

- (id)getMuteCallMode
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  BOOL v7;
  HPSDeviceAnalytics *deviceAnalytics;
  uint64_t v9;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "getCallManagementConfig");

  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67110144;
    v11[1] = v4;
    v12 = 1024;
    v13 = BYTE3(v4);
    v14 = 1024;
    v15 = BYTE4(v4);
    v16 = 1024;
    v17 = BYTE5(v4);
    v18 = 1024;
    v19 = BYTE6(v4);
    _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Call Controls: getMuteCallMode, version: %u, End Call Status: %d, End Call Config: %d, Mute Call Status: %d, Mute Call Config: %d", (uint8_t *)v11, 0x20u);
  }

  v7 = (BYTE6(v4) == 4 || BYTE6(v4) < 2u) && v4 == 1;
  deviceAnalytics = self->_deviceAnalytics;
  if (v7)
    v9 = 3;
  else
    v9 = BYTE6(v4);
  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](deviceAnalytics, "updateFeatureValue:value:featureValueString:", 39, v9, 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setMuteCallMode:(id)a3
{
  HPSDeviceAnalytics *deviceAnalytics;
  id v5;
  void *v6;
  unint64_t v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _DWORD v14[2];
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  deviceAnalytics = self->_deviceAnalytics;
  v5 = a3;
  -[HPSDeviceAnalytics updateFeatureChangeCount:](deviceAnalytics, "updateFeatureChangeCount:", 38);
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "getCallManagementConfig");

  v8 = objc_msgSend(v5, "intValue");
  if (v7 == 1)
  {
    v9 = HIDWORD(v7) & 0xFFFFFF;
    if (v8 == 3)
      LOBYTE(v9) = 2;
    if (v8 == 2)
      v10 = 3;
    else
      v10 = v9;
    sharedBluetoothSettingsLogComponent();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14[0] = 67110144;
      v12 = v10;
      v14[1] = 1;
      v15 = 1024;
      v16 = BYTE3(v7);
      v17 = 1024;
      v18 = v10;
      v19 = 1024;
      v20 = BYTE5(v7);
      v21 = 1024;
      v22 = v8;
      _os_log_impl(&dword_1DB30C000, v11, OS_LOG_TYPE_DEFAULT, "Call Controls: setMuteCallMode, version: %u, End Call Status: %d, End Call Config: %d, Mute Call Status: %d, Mute Call Config: %d", (uint8_t *)v14, 0x20u);
    }
    else
    {
      v12 = v10;
    }

    -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCallConfig:", v7 & 0xFF0000000000 | ((unint64_t)v8 << 48) | ((unint64_t)v10 << 32) | v7);

    -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 24, v12, 0);
    -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 39, v8, 0);
  }
}

- (id)micMode
{
  HPSDeviceAnalytics *deviceAnalytics;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  deviceAnalytics = self->_deviceAnalytics;
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](deviceAnalytics, "updateFeatureValue:value:featureValueString:", 37, objc_msgSend(v4, "micMode"), 0);

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "micMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setMicMode:(id)a3
{
  HPSDeviceAnalytics *deviceAnalytics;
  id v5;
  uint64_t v6;
  id v7;

  deviceAnalytics = self->_deviceAnalytics;
  v5 = a3;
  -[HPSDeviceAnalytics updateFeatureChangeCount:](deviceAnalytics, "updateFeatureChangeCount:", 36);
  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 37, objc_msgSend(v5, "intValue"), 0);
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  objc_msgSend(v7, "setMicMode:", v6);
}

- (id)smartRouteMode
{
  HPSDeviceAnalytics *deviceAnalytics;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  deviceAnalytics = self->_deviceAnalytics;
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](deviceAnalytics, "updateFeatureValue:value:featureValueString:", 49, objc_msgSend(v4, "smartRouteMode"), 0);

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "smartRouteMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setSmartRouteMode:(id)a3
{
  HPSDeviceAnalytics *deviceAnalytics;
  id v5;
  void *v6;

  deviceAnalytics = self->_deviceAnalytics;
  v5 = a3;
  -[HPSDeviceAnalytics updateFeatureChangeCount:](deviceAnalytics, "updateFeatureChangeCount:", 48);
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSmartRouteMode:", objc_msgSend(v5, "intValue"));

  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 49, objc_msgSend(v5, "intValue"), 0);
  LODWORD(v6) = objc_msgSend(v5, "intValue");

  if ((_DWORD)v6 == 2)
    -[BTSDeviceConfigController sendSmartRoutingDisabledTipEvent](self, "sendSmartRoutingDisabledTipEvent");
}

- (void)sendSmartRoutingDisabledTipEvent
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D027B8], "discoverabilitySignal");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0D02618]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithIdentifier:bundleID:context:", CFSTR("com.apple.bluetooth.smartrouting"), v5, CFSTR("off"));

  objc_msgSend(v2, "sendEvent:", v6);
}

- (id)doubleTapCapability
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInt:", objc_msgSend(v3, "doubleTapCapability"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setDeviceName:(id)a3 specifier:(id)a4
{
  -[HPSDeviceAnalytics updateFeatureChangeCount:](self->_deviceAnalytics, "updateFeatureChangeCount:", 17, a4);
}

- (id)deviceName:(id)a3
{
  return (id)-[BluetoothDeviceProtocol name](self->_device, "name", a3);
}

- (id)clickHoldModeLeft
{
  void *v2;
  uint64_t v4;

  v4 = 0;
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clickHoldMode:rightAction:", (char *)&v4 + 4, &v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(v4));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)clickHoldModeRight
{
  void *v2;
  uint64_t v4;

  v4 = 0;
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clickHoldMode:rightAction:", (char *)&v4 + 4, &v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setGestureMode:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  BluetoothDeviceProtocol **p_device;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  -[HPSDeviceAnalytics updateFeatureChangeCount:](self->_deviceAnalytics, "updateFeatureChangeCount:", 42);
  v19 = 0;
  p_device = &self->_device;
  -[BluetoothDeviceProtocol classicDevice](*p_device, "classicDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clickHoldMode:rightAction:", (char *)&v19 + 4, &v19);

  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("LEFT_ID"));

  if (v11)
  {
    -[BluetoothDeviceProtocol classicDevice](*p_device, "classicDevice");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v6, "intValue");
    v14 = v19;
    v15 = v12;
LABEL_5:
    -[NSObject setClickHoldMode:rightMode:](v15, "setClickHoldMode:rightMode:", v13, v14);
    goto LABEL_8;
  }
  objc_msgSend(v7, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("RIGHT_ID"));

  if (v17)
  {
    -[BluetoothDeviceProtocol classicDevice](*p_device, "classicDevice");
    v12 = objc_claimAutoreleasedReturnValue();
    v18 = HIDWORD(v19);
    v14 = objc_msgSend(v6, "intValue");
    v15 = v12;
    v13 = v18;
    goto LABEL_5;
  }
  sharedBluetoothSettingsLogComponent();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[BTSDeviceConfigController setGestureMode:specifier:].cold.1((id *)p_device);
LABEL_8:

}

- (int)listeningMode
{
  NSObject *v2;
  uint8_t v4[16];

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "listeningMode : getter", v4, 2u);
  }

  return 0;
}

- (id)optimizedBatteryChargingEnabled
{
  PowerUISmartChargeClientAudioAccessories *smartChargeClient;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL8 v11;
  HPSDeviceAnalytics **p_deviceAnalytics;
  const __CFString *v13;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  smartChargeClient = self->_smartChargeClient;
  if (!smartChargeClient)
  {
    sharedBluetoothSettingsLogComponent();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[BTSDeviceConfigController optimizedBatteryChargingEnabled].cold.1();

    goto LABEL_9;
  }
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v6 = -[PowerUISmartChargeClientAudioAccessories isSmartChargingCurrentlyEnabledForDevice:withError:](smartChargeClient, "isSmartChargingCurrentlyEnabledForDevice:withError:", v5, &v15);
  v7 = v15;

  sharedBluetoothSettingsLogComponent();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BTSDeviceConfigController optimizedBatteryChargingEnabled].cold.2();

LABEL_9:
    v11 = 0;
    p_deviceAnalytics = &self->_deviceAnalytics;
    v13 = CFSTR("Off");
    goto LABEL_15;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v17 = v6;
    _os_log_impl(&dword_1DB30C000, v9, OS_LOG_TYPE_DEFAULT, "OBC state : %lu", buf, 0xCu);
  }

  v11 = v6 == 1;
  p_deviceAnalytics = &self->_deviceAnalytics;
  if (v6 == 1)
    v13 = CFSTR("On");
  else
    v13 = CFSTR("Off");
LABEL_15:
  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](*p_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 41, 0, v13);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setOptimizedBatteryChargingEnabled:(id)a3
{
  int v4;
  NSObject *v5;
  const __CFString *v6;
  PowerUISmartChargeClientAudioAccessories *smartChargeClient;
  void *v8;
  void *v9;
  NSObject *v10;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  id v30;
  uint8_t buf[4];
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (self->_smartChargeClient)
  {
    v4 = objc_msgSend(a3, "BOOLValue");
    sharedBluetoothSettingsLogComponent();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v32 = v4;
      _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "set OBC state : %d", buf, 8u);
    }

    -[HPSDeviceAnalytics updateFeatureChangeCount:](self->_deviceAnalytics, "updateFeatureChangeCount:", 40);
    if (v4)
      v6 = CFSTR("On");
    else
      v6 = CFSTR("Off");
    -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 41, 0, v6);
    if (v4)
    {
      smartChargeClient = self->_smartChargeClient;
      -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "address");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      -[PowerUISmartChargeClientAudioAccessories enableSmartChargingForDevice:withError:](smartChargeClient, "enableSmartChargingForDevice:withError:", v9, &v30);
      v10 = v30;

    }
    else
    {
      v11 = (void *)MEMORY[0x1E0DC3450];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("OBC_ALERT_MESSAGE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", 0, v13, 1);
      v10 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("OBC_TURN_OFF"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __64__BTSDeviceConfigController_setOptimizedBatteryChargingEnabled___block_invoke;
      v29[3] = &unk_1EA29A880;
      v29[4] = self;
      objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v29);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("OBC_LEAVE_ON"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v17;
      v28[1] = 3221225472;
      v28[2] = __64__BTSDeviceConfigController_setOptimizedBatteryChargingEnabled___block_invoke_568;
      v28[3] = &unk_1EA29A880;
      v28[4] = self;
      objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 0, v28);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("OBC_TEMP_DISABLE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v17;
      v27[1] = 3221225472;
      v27[2] = __64__BTSDeviceConfigController_setOptimizedBatteryChargingEnabled___block_invoke_571;
      v27[3] = &unk_1EA29A880;
      v27[4] = self;
      objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 0, v27);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSObject addAction:](v10, "addAction:", v26);
      -[NSObject addAction:](v10, "addAction:", v18);
      -[NSObject addAction:](v10, "addAction:", v22);
      -[NSObject setPreferredAction:](v10, "setPreferredAction:", v26);
      -[BTSDeviceConfigController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

    }
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[BTSDeviceConfigController setOptimizedBatteryChargingEnabled:].cold.1();
  }

}

void __64__BTSDeviceConfigController_setOptimizedBatteryChargingEnabled___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  uint8_t v13[8];
  id v14;
  uint8_t buf[16];

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "User disabled smart charging", buf, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1648);
  objc_msgSend(*(id *)(v3 + 1376), "classicDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v7 = objc_msgSend(v4, "disableSmartChargingForDevice:withError:", v6, &v14);
  v8 = v14;

  sharedBluetoothSettingsLogComponent();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
    v11 = v8 == 0;
  else
    v11 = 0;
  if (v11)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1DB30C000, v10, OS_LOG_TYPE_DEFAULT, "Smart charging disabled", v13, 2u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __64__BTSDeviceConfigController_setOptimizedBatteryChargingEnabled___block_invoke_cold_1();
  }

  objc_msgSend(*(id *)(a1 + 32), "headphoneObserver");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reloadAll");

}

void __64__BTSDeviceConfigController_setOptimizedBatteryChargingEnabled___block_invoke_568(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "User left smart charging on", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "headphoneObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadAll");

}

void __64__BTSDeviceConfigController_setOptimizedBatteryChargingEnabled___block_invoke_571(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  BOOL v12;
  void *v13;
  uint8_t v14[8];
  id v15;
  uint8_t buf[16];

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "User temporarily disabled smart charging", buf, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1648);
  objc_msgSend(*(id *)(v3 + 1376), "classicDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v7 = objc_msgSend(v4, "temporarilyDisableSmartChargingForDevice:withError:", v6, &v15);
  v8 = v15;

  objc_msgSend(*(id *)(a1 + 32), "headphoneObserver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadAll");

  sharedBluetoothSettingsLogComponent();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
    v12 = v8 == 0;
  else
    v12 = 0;
  if (v12)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1DB30C000, v11, OS_LOG_TYPE_DEFAULT, "Smart charging temporarily disabled", v14, 2u);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    __64__BTSDeviceConfigController_setOptimizedBatteryChargingEnabled___block_invoke_571_cold_1();
  }

  objc_msgSend(*(id *)(a1 + 32), "headphoneObserver");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reloadAll");

}

- (id)sealDetect
{
  NSObject *v2;

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[BTSDeviceConfigController sealDetect].cold.1();

  return 0;
}

- (void)sealDetectSet:(id)a3
{
  NSObject *v3;

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[BTSDeviceConfigController sealDetectSet:].cold.1();

}

- (void)presentFitTestController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BTSFitTestWelcomeController *v13;

  -[HPSDeviceAnalytics updateFeatureChangeCount:](self->_deviceAnalytics, "updateFeatureChangeCount:", 22);
  v13 = objc_alloc_init(BTSFitTestWelcomeController);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80628]), "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HPSDevice deviceKey](HPSDevice, "deviceKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTSFitTestWelcomeController setCurrentDevice:](v13, "setCurrentDevice:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelFitTest);
  -[BTSFitTestWelcomeController navigationItem](v13, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLeftBarButtonItem:", v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D65180]), "initWithRootViewController:", v13);
  objc_msgSend(v9, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v11);

  objc_msgSend(v9, "navigationBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setHidesShadow:", 1);

  objc_msgSend(v9, "setModalPresentationStyle:", 2);
  -[BTSDeviceConfigController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

- (void)cancelFitTest
{
  -[BTSDeviceConfigController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_578);
}

- (void)presentImportantMsgLink
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "URL string is malformed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)presentAssetLocationLink
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "Accessory Firmware: URL string is malformed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)presentFindMyLink
{
  void *v3;
  NSObject *v4;

  -[HPSDeviceAnalytics updateFeatureChangeCount:](self->_deviceAnalytics, "updateFeatureChangeCount:", 54);
  if (!self->_findMyUrl)
    -[BTSDeviceConfigController getFindMyUrl](self, "getFindMyUrl");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", self->_findMyUrl);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject openURL:options:completionHandler:](v4, "openURL:options:completionHandler:", v3, MEMORY[0x1E0C9AA70], 0);
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[BTSDeviceConfigController presentImportantMsgLink].cold.1();
  }

}

- (void)presentSpatialTutorialController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  BTSpatialTutorialViewController *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;
  void *v36;
  int v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  int v46;

  -[HPSDeviceAnalytics updateFeatureChangeCount:](self->_deviceAnalytics, "updateFeatureChangeCount:", 51);
  v45 = 3;
  v46 = 3;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80628]), "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HPSDevice deviceKey](HPSDevice, "deviceKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "classicDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inEarStatusPrimary:secondary:", &v46, &v45);

  v9 = v45;
  v8 = v46;
  objc_msgSend(v6, "classicDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "productId") == 8215)
  {

LABEL_22:
    v15 = -[BTSpatialTutorialViewController initWithDevice:]([BTSpatialTutorialViewController alloc], "initWithDevice:", v6);
    -[BTSDeviceConfigController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);
    goto LABEL_23;
  }
  v11 = v8 | v9;
  objc_msgSend(v6, "classicDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "productId");

  if (!v11 || v13 == 8229)
    goto LABEL_22;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SPATIAL_TUTORIAL_OUT_OF_EAR_WARNING"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v15 = (BTSpatialTutorialViewController *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "classicDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "getAACPCapabilityBit:", 32);

  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("SPATIAL_TUTORIAL_NOT_ON_HEAD_WARNING"), &stru_1EA29D890, CFSTR("DeviceConfig-b515"));
    v19 = objc_claimAutoreleasedReturnValue();

    v15 = (BTSpatialTutorialViewController *)v19;
  }
  objc_msgSend(v6, "classicDevice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "getAACPCapabilityBit:", 10))
  {
    objc_msgSend(v6, "classicDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "productId");

    if (v22 != 8210)
      goto LABEL_11;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("SPATIAL_TUTORIAL_OUT_OF_EAR_WARNING"), &stru_1EA29D890, CFSTR("DeviceConfig-B494"));
    v23 = objc_claimAutoreleasedReturnValue();

    v15 = (BTSpatialTutorialViewController *)v23;
  }

LABEL_11:
  objc_msgSend(v6, "classicDevice");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v24, "getAACPCapabilityBit:", 10))
  {
LABEL_14:

    goto LABEL_15;
  }
  objc_msgSend(v6, "classicDevice");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "productId");

  if (v26 == 8221)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("SPATIAL_TUTORIAL_OUT_OF_EAR_WARNING"), &stru_1EA29D890, CFSTR("DeviceConfig-B498-v2"));
    v27 = objc_claimAutoreleasedReturnValue();

    v15 = (BTSpatialTutorialViewController *)v27;
    goto LABEL_14;
  }
LABEL_15:
  objc_msgSend(v6, "classicDevice");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "productId");

  if (v29 == 8211)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("SPATIAL_TUTORIAL_OUT_OF_EAR_WARNING"), &stru_1EA29D890, CFSTR("DeviceConfig-B688"));
    v31 = objc_claimAutoreleasedReturnValue();

    v15 = (BTSpatialTutorialViewController *)v31;
  }
  objc_msgSend(v6, "classicDevice");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "productId");

  if (v33 == 8212)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("SPATIAL_TUTORIAL_OUT_OF_EAR_WARNING"), &stru_1EA29D890, CFSTR("DeviceConfig-B698"));
    v35 = objc_claimAutoreleasedReturnValue();

    v15 = (BTSpatialTutorialViewController *)v35;
  }
  objc_msgSend(v6, "classicDevice");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "productId");

  if (v37 == 8228)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("SPATIAL_TUTORIAL_OUT_OF_EAR_WARNING"), &stru_1EA29D890, CFSTR("DeviceConfig-B698"));
    v39 = objc_claimAutoreleasedReturnValue();

    v15 = (BTSpatialTutorialViewController *)v39;
  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v15, &stru_1EA29D890, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "actionWithTitle:style:handler:", v43, 0, &__block_literal_global_601);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addAction:", v44);

  -[BTSDeviceConfigController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v40, 1, 0);
LABEL_23:

}

- (id)ancsAuthorized
{
  id *p_device;
  uint64_t v4;

  p_device = (id *)&self->_device;
  if (-[BluetoothDeviceProtocol isCTKDDevice](self->_device, "isCTKDDevice"))
    p_device = (id *)&self->_ctkdLeDevice;
  v4 = objc_msgSend(*p_device, "ancsAuthorized");
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
}

- (void)setANCSAuthorized:(id)a3
{
  void **p_device;
  BluetoothDeviceProtocol *device;
  id v6;
  void *v7;
  uint64_t v8;

  p_device = (void **)&self->_device;
  device = self->_device;
  v6 = a3;
  if (-[BluetoothDeviceProtocol isCTKDDevice](device, "isCTKDDevice"))
    p_device = (void **)&self->_ctkdLeDevice;
  v7 = *p_device;
  v8 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v7, "setANCSAuthorization:", v8);
}

- (id)getHealthDeviceType
{
  return (id)-[BluetoothDeviceProtocol healthDeviceType](self->_device, "healthDeviceType");
}

- (id)userSelectedHealthDataSyncConfig
{
  uint64_t v2;
  NSObject *v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = -[BluetoothDeviceProtocol userSelectedHealthDataSyncConfig](self->_device, "userSelectedHealthDataSyncConfig");
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Get user HealthDataSyncConfig: %d", (uint8_t *)v5, 8u);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setUserSelectedHealthDataSyncConfig:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "User set HealthDataSyncConfig: %@", (uint8_t *)&v6, 0xCu);
  }

  -[BluetoothDeviceProtocol setUserSelectedHealthDataSyncConfig:](self->_device, "setUserSelectedHealthDataSyncConfig:", objc_msgSend(v4, "intValue"));
}

- (id)digitalCrownMode
{
  HPSDeviceAnalytics *deviceAnalytics;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  deviceAnalytics = self->_deviceAnalytics;
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](deviceAnalytics, "updateFeatureValue:value:featureValueString:", 7, objc_msgSend(v4, "crownRotationDirection"), 0);

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "crownRotationDirection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setDigitalCrownMode:(id)a3
{
  HPSDeviceAnalytics *deviceAnalytics;
  id v5;
  uint64_t v6;
  id v7;

  deviceAnalytics = self->_deviceAnalytics;
  v5 = a3;
  -[HPSDeviceAnalytics updateFeatureChangeCount:](deviceAnalytics, "updateFeatureChangeCount:", 6);
  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 7, objc_msgSend(v5, "intValue"), 0);
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  objc_msgSend(v7, "setCrownRotationDirection:", v6);
}

- (void)refreshFindMyStatusForPencilInBackground
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];

  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[BluetoothDeviceProtocol identifier](self->_device, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);

  v6 = objc_alloc_init(MEMORY[0x1E0D89920]);
  objc_msgSend(v6, "ownerSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__BTSDeviceConfigController_refreshFindMyStatusForPencilInBackground__block_invoke;
  v8[3] = &unk_1EA29A930;
  v8[4] = self;
  objc_msgSend(v7, "peripheralConnectionMaterialForAccessoryIdentifier:completion:", v5, v8);

}

void __69__BTSDeviceConfigController_refreshFindMyStatusForPencilInBackground__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__BTSDeviceConfigController_refreshFindMyStatusForPencilInBackground__block_invoke_2;
  v5[3] = &unk_1EA29A908;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __69__BTSDeviceConfigController_refreshFindMyStatusForPencilInBackground__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1617) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1616) = *(_QWORD *)(a1 + 40) != 0;
  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1616))
      v3 = "Yes";
    else
      v3 = "No";
    v4 = 136315138;
    v5 = v3;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Pencil FindMy Enabled: %s", (uint8_t *)&v4, 0xCu);
  }

}

- (void)refreshFindMyStatusForPencilSynchronously
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  const char *v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  dispatch_group_t v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[BluetoothDeviceProtocol identifier](self->_device, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v18 = dispatch_group_create();
  dispatch_group_enter((dispatch_group_t)v14[5]);
  v6 = objc_alloc_init(MEMORY[0x1E0D89920]);
  objc_msgSend(v6, "ownerSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__BTSDeviceConfigController_refreshFindMyStatusForPencilSynchronously__block_invoke;
  v12[3] = &unk_1EA29A958;
  v12[4] = self;
  v12[5] = &v13;
  objc_msgSend(v7, "peripheralConnectionMaterialForAccessoryIdentifier:completion:", v5, v12);
  v8 = v14[5];
  v9 = dispatch_time(0, 20000000);
  dispatch_group_wait(v8, v9);
  sharedBluetoothSettingsLogComponent();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_findMyEnabledForPencil)
      v11 = "Yes";
    else
      v11 = "No";
    *(_DWORD *)buf = 136315138;
    v20 = v11;
    _os_log_impl(&dword_1DB30C000, v10, OS_LOG_TYPE_DEFAULT, "Pencil FindMy Enabled: %s", buf, 0xCu);
  }

  _Block_object_dispose(&v13, 8);
}

void __70__BTSDeviceConfigController_refreshFindMyStatusForPencilSynchronously__block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1617) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1616) = a2 != 0;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)refreshFindMyStatus
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "FindMy Status: Invalid Hex Address, Cannot Get", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __48__BTSDeviceConfigController_refreshFindMyStatus__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const char *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    sharedBluetoothSettingsLogComponent();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __48__BTSDeviceConfigController_refreshFindMyStatus__block_invoke_cold_1(v5, v6);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1540) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1541) = a2;
    sharedBluetoothSettingsLogComponent();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = "Disabled";
      if (a2)
        v7 = "Enabled";
      v8 = 136315138;
      v9 = v7;
      _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "FindMy Status: Get Completed: Status: %s", (uint8_t *)&v8, 0xCu);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

- (id)getFindMyEnable:(id)a3
{
  void *v4;
  _BOOL8 findMySetInProgress;
  id v6;
  void *v7;
  const __CFString *v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  findMySetInProgress = self->_findMySetInProgress;
  v6 = a3;
  objc_msgSend(v4, "numberWithBool:", findMySetInProgress);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x1E0D807C8]);

  if (self->_findMyEnable)
    v8 = CFSTR("On");
  else
    v8 = CFSTR("Off");
  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 26, 0, v8);
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_findMyEnable);
}

- (void)setFindMyEnable:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  BTSDeviceConfigController *v21;
  char v22;
  int v23;
  __int16 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "address");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v24 = 0;
    v23 = 0;
    -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "getHexDeviceAddress:", &v23);

    if ((v11 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v23, 6);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        if (v6)
        {
          -[HPSDeviceAnalytics updateFeatureChangeCount:](self->_deviceAnalytics, "updateFeatureChangeCount:", 25);
          v13 = objc_msgSend(v6, "BOOLValue");
          sharedBluetoothSettingsLogComponent();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v26 = v9;
            v27 = 1024;
            v28 = v13;
            _os_log_impl(&dword_1DB30C000, v14, OS_LOG_TYPE_DEFAULT, "FindMy Status: Set Address: %@, New Mode: %u", buf, 0x12u);
          }

          if ((_DWORD)v13)
            v15 = CFSTR("On");
          else
            v15 = CFSTR("Off");
          -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 26, 0, v15);
          self->_findMySetInProgress = 1;
          -[BTSDeviceConfigController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v7, 1);
          v16 = objc_alloc_init(MEMORY[0x1E0D89920]);
          -[NSObject ownerSession](v16, "ownerSession");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __55__BTSDeviceConfigController_setFindMyEnable_specifier___block_invoke;
          v19[3] = &unk_1EA29A9A8;
          v20 = v17;
          v21 = self;
          v22 = v13;
          v18 = v17;
          objc_msgSend(v18, "setFindMyNetworkStatusForMACAddress:status:completion:", v12, v13, v19);

        }
        else
        {
          sharedBluetoothSettingsLogComponent();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[BTSDeviceConfigController setFindMyEnable:specifier:].cold.3();
        }
      }
      else
      {
        sharedBluetoothSettingsLogComponent();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[BTSDeviceConfigController setFindMyEnable:specifier:].cold.2();
      }

    }
    else
    {
      sharedBluetoothSettingsLogComponent();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[BTSDeviceConfigController setFindMyEnable:specifier:].cold.4();
    }
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[BTSDeviceConfigController setFindMyEnable:specifier:].cold.1();
  }

}

void __55__BTSDeviceConfigController_setFindMyEnable_specifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    sharedBluetoothSettingsLogComponent();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __55__BTSDeviceConfigController_setFindMyEnable_specifier___block_invoke_cold_1(v3);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1541) = *(_BYTE *)(a1 + 48);
    sharedBluetoothSettingsLogComponent();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 1541))
        v5 = "Enabled";
      else
        v5 = "Disabled";
      v7 = 136315138;
      v8 = v5;
      _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "FindMy Status: Mode set to %s", (uint8_t *)&v7, 0xCu);
    }
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("FindMyStatusUpdated"), 0);

}

- (void)findMyStatusUpdatedHandler:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__BTSDeviceConfigController_findMyStatusUpdatedHandler___block_invoke;
  block[3] = &unk_1EA29A770;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __56__BTSDeviceConfigController_findMyStatusUpdatedHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "FindMy Status: Set Completed, reload specifiers", v9, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1542) = 0;
  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifierID:animated:", CFSTR("FIND_MY_ID"), 1);
  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1541);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("FIND_MY_NETWORK_GROUP_FOOTER_ENABLED");
  else
    v6 = CFSTR("FIND_MY_NETWORK_GROUP_FOOTER_DISABLED");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1EA29D890, CFSTR("DeviceConfig"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "getGroupSpecifierForSpecifierID:", CFSTR("FIND_MY_GROUP_ID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProperty:forKey:", v7, *MEMORY[0x1E0D80848]);

  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifierID:animated:", CFSTR("FIND_MY_GROUP_ID"), 1);
}

- (BOOL)deviceSupportsCarPlay
{
  void *v2;
  char v3;

  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isServiceSupported:", 0x40000);

  return v3;
}

- (id)_carPlayVehicle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[BTSDeviceConfigController vehicleManager](self, "vehicleManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "vehicleForBluetoothAddress:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)carPlayEnabled:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BTSDeviceConfigController cachedCarplayPairingStatus](self, "cachedCarplayPairingStatus", a3) == 2);
}

- (void)setCarPlayEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v6 = a3;
  -[BTSDeviceConfigController _carPlayVehicle](self, "_carPlayVehicle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "BOOLValue");

  if (v8)
    v9 = 2;
  else
    v9 = 1;
  objc_msgSend(v7, "setPairingStatus:", v9);
  -[BTSDeviceConfigController vehicleManager](self, "vehicleManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "saveVehicle:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    -[BTSDeviceConfigController setCachedCarplayPairingStatus:](self, "setCachedCarplayPairingStatus:", v9);
  else
    -[BTSDeviceConfigController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v12, 1);

}

- (void)handlePairedVehiclesChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__BTSDeviceConfigController_handlePairedVehiclesChanged___block_invoke;
  block[3] = &unk_1EA29A770;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __57__BTSDeviceConfigController_handlePairedVehiclesChanged___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_carPlayVehicle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pairingStatus");

  if (v3 != objc_msgSend(*(id *)(a1 + 32), "cachedCarplayPairingStatus"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setCachedCarplayPairingStatus:", v3);
    objc_msgSend(*(id *)(a1 + 32), "headphoneObserver");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadAll");

  }
}

- (void)handleCarPlayAllowedDidChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__BTSDeviceConfigController_handleCarPlayAllowedDidChange__block_invoke;
  block[3] = &unk_1EA29A770;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __58__BTSDeviceConfigController_handleCarPlayAllowedDidChange__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "headphoneObserver");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadAll");

}

- (void)metaGroupSelected:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  char v7;
  BOOL *p_favorites;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "propertyForKey:", *MEMORY[0x1E0D80940]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setChecked:", objc_msgSend(v4, "isChecked") ^ 1);
  objc_msgSend(v12, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("PhoneFavorites"));

  if (v6)
  {
    v7 = objc_msgSend(v4, "isChecked");
    p_favorites = &self->_syncSettings.favorites;
LABEL_5:
    *p_favorites = v7;
    goto LABEL_6;
  }
  objc_msgSend(v12, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("PhoneRecents"));

  if (v10)
  {
    v7 = objc_msgSend(v4, "isChecked");
    p_favorites = &self->_syncSettings.recents;
    goto LABEL_5;
  }
LABEL_6:
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSyncSettings:", *(unsigned int *)&self->_syncSettings.supported | ((unint64_t)self->_syncSettings.userPermissionGranted << 32));

}

- (void)contactGroupSelected:(id)a3
{
  PSSpecifier *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  PSSpecifier *v11;
  PSSpecifier *lastSelectedSyncGroup;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (PSSpecifier *)a3;
  v6 = *MEMORY[0x1E0D80940];
  -[PSSpecifier propertyForKey:](self->_lastSelectedSyncGroup, "propertyForKey:", *MEMORY[0x1E0D80940]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setChecked:", 0);

  if (self->_lastSelectedSyncGroup == v5)
  {
    v11 = 0;
    v10 = 4294967294;
    lastSelectedSyncGroup = v5;
  }
  else
  {
    -[PSSpecifier propertyForKey:](v5, "propertyForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setChecked:", 1);

    -[PSSpecifier identifier](v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");

    v11 = v5;
    lastSelectedSyncGroup = self->_lastSelectedSyncGroup;
  }
  self->_lastSelectedSyncGroup = v11;

  sharedBluetoothSettingsLogComponent();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = CFSTR("None");
    if ((_DWORD)v10 != -2)
      v16 = (const __CFString *)v5;
    v18 = 138412546;
    v19 = v14;
    v20 = 2112;
    v21 = v16;
    _os_log_impl(&dword_1DB30C000, v13, OS_LOG_TYPE_DEFAULT, "%@ new contact sync group is %@", (uint8_t *)&v18, 0x16u);

  }
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSyncGroup:enabled:", v10, 1);

}

- (void)listeningModeConfigSelected:(id)a3
{
  id v4;
  void *v5;
  $9FDB394E5CA5750B7644BE339E11A47B *p_listeningModeConfigs;
  $9FDB394E5CA5750B7644BE339E11A47B *p_anc;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 normal;
  NSObject *v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  _BOOL4 anc;
  int v20;
  uint64_t v21;
  const __CFString *v22;

  v4 = a3;
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x1E0D80940]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  p_listeningModeConfigs = &self->_listeningModeConfigs;
  p_anc = ($9FDB394E5CA5750B7644BE339E11A47B *)&self->_listeningModeConfigs.anc;
  if (self->_listeningModeConfigs.transparency + self->_listeningModeConfigs.anc + self->_listeningModeConfigs.normal != 2)
    goto LABEL_13;
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("ANC")) && p_anc->normal)
    goto LABEL_7;
  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("Passthrough"))
    && self->_listeningModeConfigs.transparency)
  {

LABEL_7:
    goto LABEL_10;
  }
  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Off")) & 1) == 0)
  {

LABEL_13:
    objc_msgSend(v5, "setChecked:", objc_msgSend(v5, "isChecked") ^ 1);
    objc_msgSend(v4, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("ANC"));

    if ((v14 & 1) != 0)
      goto LABEL_16;
    objc_msgSend(v4, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("Passthrough"));

    p_anc = ($9FDB394E5CA5750B7644BE339E11A47B *)&self->_listeningModeConfigs.transparency;
    if ((v16 & 1) != 0
      || (objc_msgSend(v4, "identifier"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("Off")),
          v17,
          p_anc = &self->_listeningModeConfigs,
          v18))
    {
LABEL_16:
      p_anc->normal = objc_msgSend(v5, "isChecked");
    }
    anc = self->_listeningModeConfigs.anc;
    v20 = (2 * anc) | 4;
    if (!self->_listeningModeConfigs.transparency)
      v20 = 2 * anc;
    v21 = v20 | p_listeningModeConfigs->normal;
    if (!self->_listeningModeConfigs.anc)
      goto LABEL_26;
    if (self->_listeningModeConfigs.transparency)
    {
      if (p_listeningModeConfigs->normal)
        v22 = CFSTR("NC&Off&T");
      else
        v22 = CFSTR("NC&T");
      goto LABEL_27;
    }
    if (p_listeningModeConfigs->normal)
      v22 = CFSTR("NC&Off");
    else
LABEL_26:
      v22 = CFSTR("T&Off");
LABEL_27:
    -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 16, 0, v22);
    -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject setListeningModeConfigs:](v12, "setListeningModeConfigs:", v21);
    goto LABEL_28;
  }
  normal = p_listeningModeConfigs->normal;

  if (!normal)
    goto LABEL_13;
LABEL_10:
  sharedBluetoothSettingsLogComponent();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[BTSDeviceConfigController listeningModeConfigSelected:].cold.1();
LABEL_28:

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  BOOL *p_favorites;
  void *v20;
  void *v21;
  int v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  int v26;
  $9FDB394E5CA5750B7644BE339E11A47B *p_anc;
  void *v28;
  void *v29;
  int v30;
  PSSpecifier *v31;
  PSSpecifier *lastSelectedSyncGroup;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  int v37;
  id v38;

  v38 = a4;
  -[BTSDeviceConfigController specifierAtIndex:](self, "specifierAtIndex:", -[BTSDeviceConfigController indexOfGroup:](self, "indexOfGroup:", objc_msgSend(a5, "section")));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v38;
    objc_msgSend(v8, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineBreakMode:", 0);

    objc_msgSend(v8, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNumberOfLines:", 0);

    objc_msgSend(v8, "specifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("IMPORTANT_MSG_ID"));

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 16.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "titleLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFont:", v14);

    }
    objc_msgSend(v8, "specifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("PhoneFavorites"));

    if (v18)
    {
      p_favorites = &self->_syncSettings.favorites;
    }
    else
    {
      objc_msgSend(v8, "specifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("PhoneRecents"));

      if (!v22)
      {
        if (self->_lastSelectedSyncGroup
          && (objc_msgSend(v8, "specifier"),
              v31 = (PSSpecifier *)objc_claimAutoreleasedReturnValue(),
              lastSelectedSyncGroup = self->_lastSelectedSyncGroup,
              v31,
              v31 == lastSelectedSyncGroup))
        {
          v23 = 1;
        }
        else
        {
          objc_msgSend(v7, "propertyForKey:", *MEMORY[0x1E0D80898]);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "BOOLValue");

          if ((v34 & 1) != 0)
            goto LABEL_20;
          v23 = 0;
        }
LABEL_9:
        objc_msgSend(v8, "setChecked:", v23);
        objc_msgSend(v8, "specifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("ANC"));

        if (v26)
        {
          p_anc = ($9FDB394E5CA5750B7644BE339E11A47B *)&self->_listeningModeConfigs.anc;
LABEL_19:
          objc_msgSend(v8, "setChecked:", p_anc->normal);
          goto LABEL_20;
        }
        objc_msgSend(v8, "specifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("Passthrough"));

        if (v30)
        {
          p_anc = ($9FDB394E5CA5750B7644BE339E11A47B *)&self->_listeningModeConfigs.transparency;
          goto LABEL_19;
        }
        objc_msgSend(v8, "specifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "identifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("Off"));

        if (v37)
        {
          p_anc = &self->_listeningModeConfigs;
          goto LABEL_19;
        }
LABEL_20:

        goto LABEL_21;
      }
      p_favorites = &self->_syncSettings.recents;
    }
    v23 = *p_favorites;
    goto LABEL_9;
  }
LABEL_21:

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  PSTableCell *listeningModeCell;
  PSTableCell *v12;
  PSTableCell *v13;
  PSTableCell *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PSTableCell *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PSTableCell *v32;
  objc_super v34;
  objc_super v35;

  v6 = a3;
  v7 = a4;
  -[BTSDeviceConfigController specifierAtIndexPath:](self, "specifierAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("LISTENING_MODE_ID"));

  if (v10)
  {
    listeningModeCell = self->_listeningModeCell;
    if (!listeningModeCell)
    {
      v35.receiver = self;
      v35.super_class = (Class)BTSDeviceConfigController;
      -[BTSDeviceConfigController tableView:cellForRowAtIndexPath:](&v35, sel_tableView_cellForRowAtIndexPath_, v6, v7);
      v12 = (PSTableCell *)objc_claimAutoreleasedReturnValue();
      v13 = self->_listeningModeCell;
      self->_listeningModeCell = v12;

      listeningModeCell = self->_listeningModeCell;
    }
    -[PSTableCell refreshCellContentsWithSpecifier:](listeningModeCell, "refreshCellContentsWithSpecifier:", v8);
    v14 = self->_listeningModeCell;
  }
  else
  {
    v34.receiver = self;
    v34.super_class = (Class)BTSDeviceConfigController;
    -[BTSDeviceConfigController tableView:cellForRowAtIndexPath:](&v34, sel_tableView_cellForRowAtIndexPath_, v6, v7);
    v14 = (PSTableCell *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("CLASSIC_SETUP_TITLE_ID"));

    if (v16)
      -[PSTableCell setSeparatorInset:](v14, "setSeparatorInset:", 0.0, 0.0, 0.0, 1.79769313e308);
    objc_msgSend(v8, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("CLASSIC_SETUP_BODY_ID"));

    if (v18)
    {
      -[PSTableCell defaultContentConfiguration](v14, "defaultContentConfiguration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setText:", v20);

      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "textProperties");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setColor:", v21);

      -[PSTableCell setContentConfiguration:](v14, "setContentConfiguration:", v19);
      v23 = v14;

    }
    else
    {
      objc_msgSend(v8, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("CLASSIC_SETUP_BUTTON_ID"));

      if (v25 && self->_devicePendingCTKDConnection)
      {
        -[PSTableCell defaultContentConfiguration](v14, "defaultContentConfiguration");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setText:", v27);

        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "textProperties");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setColor:", v28);

        -[PSTableCell setContentConfiguration:](v14, "setContentConfiguration:", v26);
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
        -[PSTableCell setAccessoryView:](v14, "setAccessoryView:", v30);

        -[PSTableCell accessoryView](v14, "accessoryView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "startAnimating");

      }
      v32 = v14;
    }

  }
  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "accessorySettingFeatureBitMask");

  -[BTSDeviceConfigController specifierAtIndex:](self, "specifierAtIndex:", -[BTSDeviceConfigController indexOfGroup:](self, "indexOfGroup:", objc_msgSend(v7, "section")));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTSDeviceConfigController specifierAtIndexPath:](self, "specifierAtIndexPath:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 & 6) == 2)
  {
    objc_msgSend(v10, "propertyForKey:", *MEMORY[0x1E0D80898]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    if (v13)
    {
      -[BTSDeviceConfigController specifierForID:](self, "specifierForID:", CFSTR("SIRI_ID"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 == v11)
      {
        -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = 1;
      }
      else
      {
        -[BTSDeviceConfigController specifierForID:](self, "specifierForID:", CFSTR("MEDIA_ID"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15 == v11)
        {
          -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          v19 = 2;
        }
        else
        {
          -[BTSDeviceConfigController specifierForID:](self, "specifierForID:", CFSTR("OFF_ID"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16 != v11)
            goto LABEL_10;
          -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          v19 = 0;
        }
      }
      objc_msgSend(v17, "setDoubleTapAction:", v19);

    }
  }
LABEL_10:
  objc_msgSend(v11, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("ACCESSORY_ABOUT_SERIAL_NUMBER_ID"));

  if (v21)
  {
    -[BTSDeviceConfigController updateSerialNumberSpecifier:](self, "updateSerialNumberSpecifier:", v11);
LABEL_14:
    -[BTSDeviceConfigController reloadSpecifier:](self, "reloadSpecifier:", v11);
    goto LABEL_15;
  }
  objc_msgSend(v11, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("ACCESSORY_ABOUT_VERSION_ID"));

  if (v23)
  {
    -[BTSDeviceConfigController updateVersionSpecifier:](self, "updateVersionSpecifier:", v11);
    goto LABEL_14;
  }
LABEL_15:
  v24.receiver = self;
  v24.super_class = (Class)BTSDeviceConfigController;
  -[BTSDeviceConfigController tableView:didSelectRowAtIndexPath:](&v24, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80598]), "selectRowAtIndexPath:animated:scrollPosition:", 0, 1, 0);

}

- (void)userDidTapWatchLink:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("bridge:"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

}

- (void)userDidTapSpatialProfileLearnMoreLink:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/ht213318?cid=mc-ols-airpods-article_ht2133318-ios_ui-06162022"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

}

- (void)userDidTapSpatialA2DPLatencyDisclosure:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/ht213920?cid=mc-ols-visionpro-article_ht213920-visionos_ui-09182023"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

}

- (void)userDidTapSpatialProfileWarningLearnMoreLink:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/guide/airpods/control-spatial-audio-and-head-tracking-dev00eb7e0a3/web"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

}

- (void)userDidTapRecommendedBuilds:(id)a3
{
  void *v3;
  int v4;
  const __CFString *v5;
  void *v6;
  id v7;

  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "productId");

  if ((v4 - 8212) <= 0x10)
  {
    if (((1 << (v4 - 20)) & 0x14A0) != 0)
    {
      v5 = CFSTR("https://confluence.sd.apple.com/x/2TV7SQE");
      goto LABEL_10;
    }
    if (v4 == 8212 || v4 == 8228)
    {
      v5 = CFSTR("https://at.apple.com/OLhUo");
      goto LABEL_10;
    }
  }
  if (v4 == 8210)
    v5 = CFSTR("https://at.apple.com/oDu4dF");
  else
    v5 = CFSTR("https://at.apple.com/n4WLN");
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "openSensitiveURL:withOptions:", v6, 0);

}

- (void)userDidTapWalletLink:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("wallet:"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

}

- (void)userDidTapNiPrivacyLink:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=Privacy&path=NEARBY_INTERACTIONS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

}

- (id)specifiers
{
  BTSDeviceConfigController *v2;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _TtC16HeadphoneConfigs23ModernBatteryStatusView *batteryStatusView;
  void *v24;
  void *v25;
  void *v26;
  HPSDevice *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  BluetoothDeviceProtocol *device;
  BluetoothDeviceProtocol *v32;
  void *v33;
  void *v34;
  void *v35;
  _TtC16HeadphoneConfigs23ModernBatteryStatusView *v36;
  BluetoothDeviceProtocol *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id *v43;
  void *v44;
  void *v45;
  void *v46;
  BluetoothDeviceProtocol *v47;
  HPSDeviceAnalytics *deviceAnalytics;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  NSString *v55;
  NSString *ancAssetVersion;
  NSArray *versionInfo;
  NSString *v58;
  void *v59;
  void *v60;
  void *v61;
  BTSDeviceConfigController *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  NSArray *controlGroupSpecifiers;
  id v77;
  void *v78;
  void *v79;
  uint64_t v80;
  NSArray *messagingSpecifiers;
  id v82;
  void *v83;
  void *v84;
  uint64_t v85;
  NSArray *syncContactsSpecifiers;
  id v87;
  void *v88;
  uint64_t v89;
  NSMutableArray *syncGroupsSpecifiers;
  NSMutableArray *v91;
  NSMutableArray *aacpControlSpecifiers;
  NSMutableArray *v93;
  NSMutableArray *accessoryFirmwareSpecifiers;
  NSMutableArray *v95;
  NSMutableArray *nameControlSpecifiers;
  NSMutableArray *v97;
  NSMutableArray *ancsControlSpecifiers;
  NSMutableArray *v99;
  NSMutableArray *deviceTypeSpecifiers;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t i;
  void *v109;
  void *v110;
  void *v111;
  int v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  _QWORD *v120;
  objc_class *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  _QWORD *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  _QWORD *v135;
  objc_class *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  _QWORD *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  _QWORD *v150;
  objc_class *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  _QWORD *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  objc_class *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  uint64_t v172;
  BTSDeviceLE *ctkdLeDevice;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  int v184;
  _QWORD *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  id v198;
  BluetoothDeviceProtocol *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  int v207;
  __CFString *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  id v214;
  BluetoothDeviceProtocol *v215;
  void *v216;
  BluetoothDeviceProtocol *v217;
  int v218;
  _QWORD *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  id v232;
  BluetoothDeviceProtocol *v233;
  void *v234;
  void *v235;
  id v236;
  void *v237;
  int v238;
  void *v239;
  id v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  int v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  char v258;
  void *v259;
  int v260;
  uint64_t v261;
  void *v262;
  void *v263;
  char v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  uint64_t v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  int v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  id v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  uint64_t v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  _BOOL4 v315;
  void *v316;
  int v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  int v322;
  NSObject *v323;
  _BOOL4 v324;
  NSArray *v325;
  uint64_t v326;
  uint64_t v327;
  void *v328;
  uint64_t v329;
  uint64_t v330;
  void *v331;
  void *v332;
  int v333;
  uint64_t v334;
  void *v336;
  NSDictionary *v337;
  NSDictionary *caseInfo;
  void *v339;
  id v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  __CFString *v345;
  void *v346;
  void *v347;
  id *v348;
  void *v349;
  void *v350;
  id v351;
  void *v352;
  void *v353;
  void *v354;
  uint64_t v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  id *location;
  id obj;
  id v363;
  BTSDeviceConfigController *v364;
  __int128 v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  _QWORD v369[2];
  uint8_t v370[128];
  uint8_t buf[4];
  void *v372;
  __int16 v373;
  void *v374;
  __int16 v375;
  void *v376;
  uint64_t v377;
  NSRange v378;
  NSRange v379;
  NSRange v380;
  NSRange v381;

  v2 = self;
  v377 = *MEMORY[0x1E0C80C00];
  v3 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80628]);
  objc_msgSend(*v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bt-device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*v3, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HPSDevice deviceKey](HPSDevice, "deviceKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", v11) & 1) != 0)
  {
    objc_msgSend(v5, "classicDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      sharedBluetoothSettingsLogComponent();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[BTSDeviceConfigController specifiers].cold.1(v5, v3);

      -[BTSDeviceConfigController navigationController](v2, "navigationController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)objc_msgSend(v14, "popViewControllerAnimated:", 1);
      v16 = (id)MEMORY[0x1E0C9AA60];
LABEL_124:

      goto LABEL_125;
    }
  }
  else
  {

  }
  v364 = v2;
  if (!v5
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_msgSend(v5, "classicDevice"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = +[HPSProductUtils isAppleHeadphone:](HPSProductUtils, "isAppleHeadphone:", v17),
        v17,
        v18))
  {
    objc_msgSend(*v3, "userInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[HPSDevice deviceKey](HPSDevice, "deviceKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_storeStrong((id *)&v2->_device, obj);
      +[HPSHeadphoneManager sharedInstance](HPSHeadphoneManager, "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "updateHPSDevice:", obj);

      batteryStatusView = v2->_batteryStatusView;
      objc_msgSend(obj, "headphoneDevice");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[ModernBatteryStatusView startLisentingWithDevice:](batteryStatusView, "startLisentingWithDevice:", v24);

      objc_msgSend(obj, "headphoneDevice");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[BTSDeviceConfigController headphoneObserver](v2, "headphoneObserver");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setHeadphoneDevice:", v25);

    }
    else
    {
      v27 = [HPSDevice alloc];
      objc_msgSend(*v3, "userInfo");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("bt-device"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[HPSDevice initWithHeadphoneDevice:btsDevice:](v27, "initWithHeadphoneDevice:btsDevice:", 0, v29);
      device = v2->_device;
      v2->_device = (BluetoothDeviceProtocol *)v30;

      v32 = v2->_device;
      objc_msgSend(*v3, "userInfo");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[HPSDevice deviceKey](HPSDevice, "deviceKey");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, v34);

      +[HPSHeadphoneManager sharedInstance](HPSHeadphoneManager, "sharedInstance");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "updateHPSDevice:", v2->_device);

      v36 = v2->_batteryStatusView;
      objc_msgSend(obj, "headphoneDevice");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[ModernBatteryStatusView startLisentingWithDevice:](v36, "startLisentingWithDevice:", v25);
    }
  }
  else
  {
    v37 = v5;
    v25 = v2->_device;
    v2->_device = v37;
  }

  sharedBluetoothSettingsLogComponent();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "debugDescription");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v3, "userInfo");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[HPSDevice deviceKey](HPSDevice, "deviceKey");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKeyedSubscript:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v3, "userInfo");
    v43 = v3;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("HPS_DeviceInfo"));
    v45 = v5;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v372 = v39;
    v373 = 2112;
    v374 = v42;
    v375 = 2112;
    v376 = v46;
    _os_log_impl(&dword_1DB30C000, v38, OS_LOG_TYPE_DEFAULT, "HeadphoneConfigs: specifiers deviceKeyDevice: %@, HEADPHONE_DEVICE: %@, USER_INFO: %@", buf, 0x20u);

    v5 = v45;
    v3 = v43;

    v2 = v364;
  }

  v47 = v2->_device;
  if (v47)
  {
    deviceAnalytics = v2->_deviceAnalytics;
    -[BluetoothDeviceProtocol classicDevice](v47, "classicDevice");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDeviceAnalytics updateProductID:](deviceAnalytics, "updateProductID:", objc_msgSend(v49, "productId"));

    location = (id *)((char *)&v2->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]);
    if (*location)
    {
LABEL_118:
      -[BluetoothDeviceProtocol productName](v2->_device, "productName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[BTSDeviceConfigController nicknameEnabled](v2, "nicknameEnabled"))
      {
        -[BluetoothDeviceProtocol name](v2->_device, "name");
        v329 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v329;
      }
      -[BluetoothDeviceProtocol classicDevice](v2->_device, "classicDevice");
      v330 = objc_claimAutoreleasedReturnValue();
      if (v330)
      {
        v331 = (void *)v330;
        -[BluetoothDeviceProtocol classicDevice](v2->_device, "classicDevice");
        v332 = (void *)objc_claimAutoreleasedReturnValue();
        v333 = objc_msgSend(v332, "magicPaired");

        if (v333)
        {
          -[BluetoothDeviceProtocol name](v2->_device, "name");
          v334 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v334;
        }
      }
      -[BTSDeviceConfigController setTitle:](v2, "setTitle:", v14);
      v16 = *location;
      goto LABEL_124;
    }
    v348 = v3;
    -[BluetoothDeviceProtocol classicDevice](v2->_device, "classicDevice");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "accessoryInfo");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v356 = v51;
    objc_msgSend(v51, "objectForKey:", CFSTR("AACPVersionInfo"));
    v52 = objc_claimAutoreleasedReturnValue();
    v357 = (void *)v52;
    v358 = v5;
    if (v52
      && (v53 = (void *)v52, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (unint64_t)objc_msgSend(v53, "count") >= 0xB)
    {
      objc_storeStrong((id *)&v2->_versionInfo, v53);
      objc_msgSend(v356, "objectForKey:", CFSTR("ANCAssetVersion"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (v54 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v55 = v54;
        ancAssetVersion = v2->_ancAssetVersion;
        v2->_ancAssetVersion = v55;
      }
      else
      {
        ancAssetVersion = v2->_ancAssetVersion;
        v2->_ancAssetVersion = 0;
      }

      objc_msgSend(v356, "objectForKey:", CFSTR("CaseInfo"));
      v336 = (void *)objc_claimAutoreleasedReturnValue();
      if (v336 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v337 = v336;
        caseInfo = v2->_caseInfo;
        v2->_caseInfo = v337;
      }
      else
      {
        caseInfo = v2->_caseInfo;
        v2->_caseInfo = 0;
      }

    }
    else
    {
      versionInfo = v2->_versionInfo;
      v2->_versionInfo = 0;

      v58 = v2->_ancAssetVersion;
      v2->_ancAssetVersion = 0;

      v54 = v2->_caseInfo;
      v2->_caseInfo = 0;
    }

    v59 = (void *)MEMORY[0x1E0C99D20];
    -[BTSDeviceConfigController loadSpecifiersFromPlistName:target:](v2, "loadSpecifiersFromPlistName:target:", CFSTR("DeviceConfig"), v2);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "arrayWithArray:", v60);
    v359 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = (void *)objc_opt_new();
    v62 = v2;
    if (v2->_accessoryHeaderController)
    {
      -[BTSDeviceConfigController leDevice](v2, "leDevice");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "relatedFutureRadioAddress");
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        -[PSListController specifiers](v2->_accessoryHeaderController, "specifiers");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "objectAtIndexedSubscript:", 0);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "localizedStringForKey:value:table:", CFSTR("FOLLOW_PAIR_INSTRUCTION_FOOTER"), &stru_1EA29D890, CFSTR("DeviceConfig"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setProperty:forKey:", v68, *MEMORY[0x1E0D80848]);

      }
      -[PSListController specifiers](v2->_accessoryHeaderController, "specifiers");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addObjectsFromArray:", v69);

    }
    v360 = v61;
    v70 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(v359, "objectAtIndexedSubscript:", 0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v359, "objectAtIndexedSubscript:", 1);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v359, "objectAtIndexedSubscript:", 2);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v359, "objectAtIndexedSubscript:", 8);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v70, "initWithObjects:", v71, v72, v73, v74, 0);
    controlGroupSpecifiers = v62->_controlGroupSpecifiers;
    v62->_controlGroupSpecifiers = (NSArray *)v75;

    v77 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(v359, "objectAtIndexedSubscript:", 3);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v359, "objectAtIndexedSubscript:", 4);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v77, "initWithObjects:", v78, v79, 0);
    messagingSpecifiers = v62->_messagingSpecifiers;
    v62->_messagingSpecifiers = (NSArray *)v80;

    v82 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(v359, "objectAtIndexedSubscript:", 5);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v359, "objectAtIndexedSubscript:", 6);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v82, "initWithObjects:", v83, v84, 0);
    syncContactsSpecifiers = v62->_syncContactsSpecifiers;
    v62->_syncContactsSpecifiers = (NSArray *)v85;

    v87 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v359, "objectAtIndexedSubscript:", 7);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v87, "initWithObjects:", v88, 0);
    syncGroupsSpecifiers = v62->_syncGroupsSpecifiers;
    v62->_syncGroupsSpecifiers = (NSMutableArray *)v89;

    v91 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    aacpControlSpecifiers = v62->_aacpControlSpecifiers;
    v62->_aacpControlSpecifiers = v91;

    v93 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    accessoryFirmwareSpecifiers = v62->_accessoryFirmwareSpecifiers;
    v62->_accessoryFirmwareSpecifiers = v93;

    v95 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    nameControlSpecifiers = v62->_nameControlSpecifiers;
    v62->_nameControlSpecifiers = v95;

    v97 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    ancsControlSpecifiers = v62->_ancsControlSpecifiers;
    v62->_ancsControlSpecifiers = v97;

    v99 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deviceTypeSpecifiers = v62->_deviceTypeSpecifiers;
    v62->_deviceTypeSpecifiers = v99;

    objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D51838], "pairedDevicesSelectorBlock");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();

    v367 = 0u;
    v368 = 0u;
    v365 = 0u;
    v366 = 0u;
    v363 = v103;
    v104 = objc_msgSend(v363, "countByEnumeratingWithState:objects:count:", &v365, v370, 16);
    v2 = v62;
    if (v104)
    {
      v105 = v104;
      v106 = *(_QWORD *)v366;
      v107 = *MEMORY[0x1E0D51848];
      do
      {
        for (i = 0; i != v105; ++i)
        {
          if (*(_QWORD *)v366 != v106)
            objc_enumerationMutation(v363);
          objc_msgSend(*(id *)(*((_QWORD *)&v365 + 1) + 8 * i), "valueForProperty:", v107);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          -[BluetoothDeviceProtocol identifier](v2->_device, "identifier");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "UUIDString");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          v112 = objc_msgSend(v110, "isEqualToString:", v111);

          v2 = v364;
          if (v112)
            v364->_isWatch = 1;

        }
        v105 = objc_msgSend(v363, "countByEnumeratingWithState:objects:count:", &v365, v370, 16);
      }
      while (v105);
    }

    -[BTSDeviceConfigController loadAccessorySettings](v2, "loadAccessorySettings");
    -[BTSDeviceConfigController loadAccessoryInfo](v2, "loadAccessoryInfo");
    if (!+[HPSProductUtils isRealityDevice](HPSProductUtils, "isRealityDevice"))
      -[BTSDeviceConfigController loadAccessoryFirmwareInfo](v2, "loadAccessoryFirmwareInfo");
    if (v2->_isWatch)
    {
      -[NSArray objectAtIndexedSubscript:](v2->_controlGroupSpecifiers, "objectAtIndexedSubscript:", 0);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "localizedStringForKey:value:table:", CFSTR("APPLE_WATCH_FOOTER_TEXT"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "localizedStringForKey:value:table:", CFSTR("APPLE_WATCH_APP_LINK"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "stringWithFormat:", v116, v118);
      v119 = (void *)objc_claimAutoreleasedReturnValue();

      v120 = (_QWORD *)MEMORY[0x1E0D80828];
      v121 = (objc_class *)objc_opt_class();
      NSStringFromClass(v121);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "setProperty:forKey:", v122, *MEMORY[0x1E0D80818]);

      objc_msgSend(v113, "setProperty:forKey:", v119, *MEMORY[0x1E0D80838]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "localizedStringForKey:value:table:", CFSTR("APPLE_WATCH_APP_LINK"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v378.location = objc_msgSend(v119, "rangeOfString:", v124);
      NSStringFromRange(v378);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "setProperty:forKey:", v125, *v120);

      v2 = v364;
      v126 = (_QWORD *)MEMORY[0x1E0D80830];

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v364);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "setProperty:forKey:", v127, *v126);

      objc_msgSend(v113, "setProperty:forKey:", CFSTR("userDidTapWatchLink:"), *MEMORY[0x1E0D80820]);
    }
    if (-[BluetoothDeviceProtocol isManagedByWallet](v2->_device, "isManagedByWallet"))
    {
      v2->_isManagedByWallet = 1;
      -[NSArray objectAtIndexedSubscript:](v2->_controlGroupSpecifiers, "objectAtIndexedSubscript:", 0);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "localizedStringForKey:value:table:", CFSTR("MANAGED_BY_WALLET_FOOTER_TEXT"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "localizedStringForKey:value:table:", CFSTR("WALLET_APP_LINK"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "stringWithFormat:", v131, v133);
      v134 = (void *)objc_claimAutoreleasedReturnValue();

      v135 = (_QWORD *)MEMORY[0x1E0D80828];
      v136 = (objc_class *)objc_opt_class();
      NSStringFromClass(v136);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "setProperty:forKey:", v137, *MEMORY[0x1E0D80818]);

      objc_msgSend(v128, "setProperty:forKey:", v134, *MEMORY[0x1E0D80838]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "localizedStringForKey:value:table:", CFSTR("WALLET_APP_LINK"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v379.location = objc_msgSend(v134, "rangeOfString:", v139);
      NSStringFromRange(v379);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "setProperty:forKey:", v140, *v135);

      v2 = v364;
      v141 = (_QWORD *)MEMORY[0x1E0D80830];

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v364);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "setProperty:forKey:", v142, *v141);

      objc_msgSend(v128, "setProperty:forKey:", CFSTR("userDidTapWalletLink:"), *MEMORY[0x1E0D80820]);
    }
    if (-[BluetoothDeviceProtocol isManagedByAliroWallet](v2->_device, "isManagedByAliroWallet"))
    {
      v2->_isManagedByAliroWallet = 1;
      -[NSArray objectAtIndexedSubscript:](v2->_controlGroupSpecifiers, "objectAtIndexedSubscript:", 0);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      v144 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "localizedStringForKey:value:table:", CFSTR("MANAGED_BY_WALLET_ALIRO_FOOTER_TEXT"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "localizedStringForKey:value:table:", CFSTR("WALLET_APP_LINK"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "stringWithFormat:", v146, v148);
      v149 = (void *)objc_claimAutoreleasedReturnValue();

      v150 = (_QWORD *)MEMORY[0x1E0D80828];
      v151 = (objc_class *)objc_opt_class();
      NSStringFromClass(v151);
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "setProperty:forKey:", v152, *MEMORY[0x1E0D80818]);

      objc_msgSend(v143, "setProperty:forKey:", v149, *MEMORY[0x1E0D80838]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "localizedStringForKey:value:table:", CFSTR("WALLET_APP_LINK"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      v380.location = objc_msgSend(v149, "rangeOfString:", v154);
      NSStringFromRange(v380);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "setProperty:forKey:", v155, *v150);

      v2 = v364;
      v156 = (_QWORD *)MEMORY[0x1E0D80830];

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v364);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "setProperty:forKey:", v157, *v156);

      objc_msgSend(v143, "setProperty:forKey:", CFSTR("userDidTapWalletLink:"), *MEMORY[0x1E0D80820]);
    }
    if (-[BluetoothDeviceProtocol doesSupportBackgroundNI](v2->_device, "doesSupportBackgroundNI"))
    {
      -[NSArray objectAtIndexedSubscript:](v2->_controlGroupSpecifiers, "objectAtIndexedSubscript:", 0);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      v159 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "localizedStringForKey:value:table:", CFSTR("NI_BACKGROUND_FOOTER_TEXT"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "localizedStringForKey:value:table:", CFSTR("NI_PRIVACY_LINK"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v159, "stringWithFormat:", v161, v163);
      v164 = (void *)objc_claimAutoreleasedReturnValue();

      v165 = (objc_class *)objc_opt_class();
      NSStringFromClass(v165);
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "setProperty:forKey:", v166, *MEMORY[0x1E0D80818]);

      objc_msgSend(v158, "setProperty:forKey:", v164, *MEMORY[0x1E0D80838]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v167, "localizedStringForKey:value:table:", CFSTR("NI_PRIVACY_LINK"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      v381.location = objc_msgSend(v164, "rangeOfString:options:", v168, 4);
      NSStringFromRange(v381);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "setProperty:forKey:", v169, *MEMORY[0x1E0D80828]);

      v2 = v364;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v364);
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "setProperty:forKey:", v170, *MEMORY[0x1E0D80830]);

      objc_msgSend(v158, "setProperty:forKey:", CFSTR("userDidTapNiPrivacyLink:"), *MEMORY[0x1E0D80820]);
    }
    if (-[BluetoothDeviceProtocol isCTKDDevice](v2->_device, "isCTKDDevice"))
    {
      objc_msgSend(*v348, "userInfo");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v171, "objectForKeyedSubscript:", CFSTR("ctkd-device"));
      v172 = objc_claimAutoreleasedReturnValue();
      ctkdLeDevice = v2->_ctkdLeDevice;
      v2->_ctkdLeDevice = (BTSDeviceLE *)v172;

    }
    -[BTSDeviceConfigController classicSetupSpecifiers](v2, "classicSetupSpecifiers");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addObjectsFromArray:", v174);

    if ((-[BluetoothDeviceProtocol supportsANCS](v2->_device, "supportsANCS") & 1) != 0
      || -[BluetoothDeviceProtocol isCTKDDevice](v2->_device, "isCTKDDevice")
      && -[BTSDeviceLE supportsANCS](v2->_ctkdLeDevice, "supportsANCS"))
    {
      v175 = (void *)MEMORY[0x1E0D804E8];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v176, "localizedStringForKey:value:table:", CFSTR("SYSTEM_NOTIFICATIONS"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v177, v364, 0, 0, 0, 0, 0);
      v178 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableArray addObject:](v364->_ancsControlSpecifiers, "addObject:", v178);
      v179 = (void *)MEMORY[0x1E0D804E8];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v180, "localizedStringForKey:value:table:", CFSTR("SHARE_SYSTEM_NOTIFICATIONS"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v181, v364, sel_setANCSAuthorized_, sel_ancsAuthorized, 0, 6, 0);
      v182 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = v364;
      -[NSMutableArray addObject:](v364->_ancsControlSpecifiers, "addObject:", v182);

    }
    -[BluetoothDeviceProtocol classicDevice](v2->_device, "classicDevice");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = objc_msgSend(v183, "getLowSecurityStatus");

    v185 = (_QWORD *)MEMORY[0x1E0D80780];
    if (v184)
    {
      v186 = (void *)MEMORY[0x1E0D804E8];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v187, "localizedStringForKey:value:table:", &stru_1EA29D890, &stru_1EA29D890, CFSTR("DeviceConfig"));
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v188, v364, 0, 0, 0, 0, 0);
      v189 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, v364, 0, 0, 0, -1, 0);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "setProperty:forKey:", objc_opt_class(), *v185);
      -[BluetoothDeviceProtocol name](v364->_device, "name");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v192, "localizedStringForKey:value:table:", CFSTR("UNSECURED_ACCESSORY_TITLE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v193 = (void *)objc_claimAutoreleasedReturnValue();

      v194 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v195, "localizedStringForKey:value:table:", CFSTR("UNSECURED_ACCESSORY_BODY"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v194, "stringWithFormat:", v196, v191);
      v197 = (void *)objc_claimAutoreleasedReturnValue();

      v198 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v199 = v364->_device;
      +[HPSDevice deviceKey](HPSDevice, "deviceKey");
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v198, "setObject:forKey:", v199, v200);

      v61 = v360;
      objc_msgSend(v198, "setObject:forKey:", v193, CFSTR("warning-cell-title"));
      objc_msgSend(v198, "setObject:forKey:", v197, CFSTR("warning-cell-body"));
      objc_msgSend(v190, "setUserInfo:", v198);
      objc_msgSend(v360, "addObject:", v189);
      objc_msgSend(v360, "addObject:", v190);

      v2 = v364;
    }
    if (-[BluetoothDeviceProtocol isLimitedConnectivityDevice](v2->_device, "isLimitedConnectivityDevice"))
    {
      v201 = (void *)MEMORY[0x1E0D804E8];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v202, "localizedStringForKey:value:table:");
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v201, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v203, v2, 0, 0, 0, 0, 0);
      v349 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, v2, 0, 0, 0, -1, 0);
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v204, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
      -[BluetoothDeviceProtocol name](v2->_device, "name");
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v206, "localizedStringForKey:value:table:", CFSTR("CONNECTIVITY_WARNING_TITLE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v342 = (void *)objc_claimAutoreleasedReturnValue();

      v207 = MGGetBoolAnswer();
      v208 = CFSTR("WIFI");
      if (v207)
        v208 = CFSTR("WLAN");
      v345 = v208;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_CONNECTIVITY_WARNING_BODY"), v345);
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      v210 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v211, "localizedStringForKey:value:table:", v209, &stru_1EA29D890, CFSTR("DeviceConfig"));
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v210, "stringWithFormat:", v212, v205);
      v213 = (void *)objc_claimAutoreleasedReturnValue();

      v214 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v215 = v364->_device;
      +[HPSDevice deviceKey](HPSDevice, "deviceKey");
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      v217 = v215;
      v2 = v364;
      objc_msgSend(v214, "setObject:forKey:", v217, v216);

      v61 = v360;
      objc_msgSend(v214, "setObject:forKey:", v342, CFSTR("warning-cell-title"));
      objc_msgSend(v214, "setObject:forKey:", v213, CFSTR("warning-cell-body"));
      objc_msgSend(v204, "setUserInfo:", v214);
      objc_msgSend(v360, "addObject:", v349);
      objc_msgSend(v360, "addObject:", v204);

    }
    v218 = -[BluetoothDeviceProtocol isFirmwareUpdateRequiredDevice](v2->_device, "isFirmwareUpdateRequiredDevice");
    v219 = (_QWORD *)MEMORY[0x1E0D80780];
    if (v218)
    {
      v220 = (void *)MEMORY[0x1E0D804E8];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v221 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v221, "localizedStringForKey:value:table:", &stru_1EA29D890, &stru_1EA29D890);
      v222 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v220, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v222, v2, 0, 0, 0, 0, 0);
      v350 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, v2, 0, 0, 0, 4, 0);
      v223 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v223, "setProperty:forKey:", objc_opt_class(), *v219);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v224, "localizedStringForKey:value:table:", CFSTR("FIRMWARE_UPDATE_WARNING_TITLE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v225 = (void *)objc_claimAutoreleasedReturnValue();

      v226 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v227 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v227, "localizedStringForKey:value:table:", CFSTR("FIRMWARE_UPDATE_WARNING_BODY"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v226, "stringWithFormat:", v228);
      v229 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v230 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v360;
      objc_msgSend(v230, "localizedStringForKey:value:table:", CFSTR("FIRMWARE_UPDATE_WARNING_TEXT_TO_SET_AS_LINK"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v231 = (void *)objc_claimAutoreleasedReturnValue();

      v232 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v233 = v364->_device;
      +[HPSDevice deviceKey](HPSDevice, "deviceKey");
      v234 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v232, "setObject:forKey:", v233, v234);

      objc_msgSend(v232, "setObject:forKey:", v225, CFSTR("warning-cell-title"));
      objc_msgSend(v232, "setObject:forKey:", v229, CFSTR("warning-cell-body"));
      objc_msgSend(v232, "setObject:forKey:", v231, CFSTR("warning-cell-body-link-text"));
      objc_msgSend(v232, "setObject:forKey:", CFSTR("https://support.apple.com/en-us/HT211232"), CFSTR("warning-cell-body-url"));
      objc_msgSend(v223, "setUserInfo:", v232);
      objc_msgSend(v360, "addObject:", v350);
      objc_msgSend(v360, "addObject:", v223);

      v2 = v364;
    }
    v5 = v358;
    if (-[BTSDeviceConfigController deviceSupportsCarPlay](v2, "deviceSupportsCarPlay"))
    {
      -[BTSDeviceConfigController carplayPreferences](v2, "carplayPreferences");
      v235 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v235)
      {
        v236 = objc_alloc_init(MEMORY[0x1E0D0D360]);
        -[BTSDeviceConfigController setCarplayPreferences:](v2, "setCarplayPreferences:", v236);
        objc_msgSend(v236, "setPreferencesDelegate:", v2);

      }
      -[BTSDeviceConfigController carplayPreferences](v2, "carplayPreferences");
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      v238 = objc_msgSend(v237, "isCarPlayAllowed");

      if (v238)
      {
        -[BTSDeviceConfigController vehicleManager](v2, "vehicleManager");
        v239 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v239)
        {
          v240 = objc_alloc_init(MEMORY[0x1E0D0D370]);
          -[BTSDeviceConfigController setVehicleManager:](v2, "setVehicleManager:", v240);
          objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
          v241 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v241, "addObserver:selector:name:object:", v2, sel_handlePairedVehiclesChanged_, *MEMORY[0x1E0D0D310], 0);

        }
        -[BTSDeviceConfigController _carPlayVehicle](v2, "_carPlayVehicle");
        v242 = (void *)objc_claimAutoreleasedReturnValue();
        v243 = v242;
        if (v242)
        {
          -[BTSDeviceConfigController setCachedCarplayPairingStatus:](v2, "setCachedCarplayPairingStatus:", objc_msgSend(v242, "pairingStatus"));
          objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("CARPLAY_GROUP"));
          v244 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v245 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v245, "localizedStringForKey:value:table:", CFSTR("CARPLAY_FOOTER_TEXT"), &stru_1EA29D890, CFSTR("DeviceConfig"));
          v246 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v244, "setProperty:forKey:", v246, *MEMORY[0x1E0D80848]);

          v247 = (void *)MEMORY[0x1E0D804E8];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v248 = (void *)objc_claimAutoreleasedReturnValue();
          v2 = v364;
          objc_msgSend(v248, "localizedStringForKey:value:table:", CFSTR("CARPLAY_SWITCH"), &stru_1EA29D890, CFSTR("DeviceConfig"));
          v249 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v247, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v249, v364, sel_setCarPlayEnabled_specifier_, sel_carPlayEnabled_, 0, 6, 0);
          v250 = (void *)objc_claimAutoreleasedReturnValue();

          v5 = v358;
          objc_msgSend(v250, "setIdentifier:", CFSTR("CARPLAY_SWITCH"));
          v369[0] = v244;
          v369[1] = v250;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v369, 2);
          v251 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "addObjectsFromArray:", v251);

        }
      }
    }
    -[BluetoothDeviceProtocol classicDevice](v2->_device, "classicDevice");
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    v253 = objc_msgSend(v252, "isServiceSupported:", 512);

    if (v253)
    {
      v2->_supportsMAP = 1;
      -[BluetoothDeviceProtocol classicDevice](v2->_device, "classicDevice");
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v254, "getServiceSetting:key:", 512, CFSTR("BT_KEY_MAP_ENABLED"));
      v255 = (void *)objc_claimAutoreleasedReturnValue();
      v2->_messagingEnabled = objc_msgSend(v255, "isEqualToString:", CFSTR("BT_VALUE_MAP_ENABLED"));

      objc_msgSend(v61, "addObjectsFromArray:", v2->_messagingSpecifiers);
    }
    if (_os_feature_enabled_impl())
    {
      -[BluetoothDeviceProtocol classicDevice](v2->_device, "classicDevice");
      v256 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[HPSProductUtils isAppleHeadphone:](HPSProductUtils, "isAppleHeadphone:", v256))
      {
        -[BluetoothDeviceProtocol classicDevice](v2->_device, "classicDevice");
        v257 = (void *)objc_claimAutoreleasedReturnValue();
        v258 = objc_msgSend(v257, "isTemporaryPaired");

        if ((v258 & 1) == 0)
        {
          -[BluetoothDeviceProtocol classicDevice](v2->_device, "classicDevice");
          v259 = (void *)objc_claimAutoreleasedReturnValue();
          v260 = objc_msgSend(v259, "isGenuineAirPods");

          if (v260)
            -[BTSDeviceConfigController updateBatteryStatus](v2, "updateBatteryStatus");
        }
      }
      else
      {

      }
    }
    -[BluetoothDeviceProtocol classicDevice](v2->_device, "classicDevice");
    v261 = objc_claimAutoreleasedReturnValue();
    if (v261)
    {
      v262 = (void *)v261;
      -[BluetoothDeviceProtocol classicDevice](v2->_device, "classicDevice");
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      v264 = objc_msgSend(v263, "isGenuineAirPods");

      if ((v264 & 1) == 0)
      {
        v265 = (void *)MEMORY[0x1E0D804E8];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v266 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v266, "localizedStringForKey:value:table:", &stru_1EA29D890, &stru_1EA29D890, CFSTR("DeviceConfig"));
        v267 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v265, "groupSpecifierWithID:", v267);
        v353 = (void *)objc_claimAutoreleasedReturnValue();

        v268 = (void *)MEMORY[0x1E0D804E8];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v269 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v269, "localizedStringForKey:value:table:", CFSTR("IMPORTANT_MSG"), &stru_1EA29D890, CFSTR("DeviceConfig"));
        v270 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v268, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v270, v364, 0, 0, 0, 4, 0);
        v271 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v271, "setIdentifier:", CFSTR("IMPORTANT_MSG_ID"));
        v272 = (void *)MEMORY[0x1E0D804E8];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v273 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v273, "localizedStringForKey:value:table:", CFSTR("IMPORTANT_MSG_NON_GENUINE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
        v274 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v272, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v274, 0, 0, 0, 0, -1, 0);
        v275 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v275, "setIdentifier:", CFSTR("IMPORTANT_MSG_NON_GENUINE_ID"));
        objc_msgSend(v275, "setProperty:forKey:", &unk_1EA2B4C88, *MEMORY[0x1E0D80938]);
        v276 = (void *)MEMORY[0x1E0D804E8];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v277 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v360;
        v5 = v358;
        objc_msgSend(v277, "localizedStringForKey:value:table:", CFSTR("IMPORTANT_MSG_LEARN_MORE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
        v278 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v276, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v278, v364, 0, 0, 0, 13, 0);
        v279 = (void *)objc_claimAutoreleasedReturnValue();

        v2 = v364;
        objc_msgSend(v279, "setButtonAction:", sel_presentImportantMsgLink);
        objc_msgSend(v360, "addObject:", v353);
        objc_msgSend(v360, "addObject:", v271);
        objc_msgSend(v360, "addObject:", v275);
        objc_msgSend(v360, "addObject:", v279);

      }
    }
    if (-[BTSDeviceConfigController canDisconnect](v2, "canDisconnect"))
      objc_msgSend(v61, "addObjectsFromArray:", v2->_nameControlSpecifiers);
    -[BluetoothDeviceProtocol classicDevice](v2->_device, "classicDevice");
    v280 = objc_claimAutoreleasedReturnValue();
    if (v280)
    {
      v281 = (void *)v280;
      -[BluetoothDeviceProtocol classicDevice](v2->_device, "classicDevice");
      v282 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v282, "vendorId") == 76)
      {
LABEL_91:

        goto LABEL_92;
      }
      -[BluetoothDeviceProtocol classicDevice](v2->_device, "classicDevice");
      v283 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v283, "isServiceSupported:", 1))
      {

LABEL_90:
        objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("DEVICE_TYPE_GROUP_ID"));
        v355 = objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v2->_deviceTypeSpecifiers, "addObject:", v355);
        v286 = (void *)MEMORY[0x1E0D804E8];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v287 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v287, "localizedStringForKey:value:table:", CFSTR("DEVICE_TYPE"));
        v288 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v286, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v288, v364, sel_setUserSelectedDeviceType_, sel_userSelectedDeviceType, objc_opt_class(), 2, 0);
        v354 = (void *)objc_claimAutoreleasedReturnValue();

        v351 = objc_alloc(MEMORY[0x1E0C99D20]);
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v346 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v346, "localizedStringForKey:value:table:", CFSTR("CAR_STEREO_TYPE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
        v289 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v343 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v343, "localizedStringForKey:value:table:", CFSTR("HEADPHONE_TYPE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
        v290 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v291 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v291, "localizedStringForKey:value:table:", CFSTR("HEARING_AID_TYPE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
        v292 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v293 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v293, "localizedStringForKey:value:table:", CFSTR("SPEAKER_TYPE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
        v294 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v295 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v295, "localizedStringForKey:value:table:", CFSTR("OTHER_TYPE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
        v296 = (void *)objc_claimAutoreleasedReturnValue();
        v352 = (void *)objc_msgSend(v351, "initWithObjects:", v289, v290, v292, v294, v296, 0);

        v297 = objc_alloc(MEMORY[0x1E0C99D20]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
        v298 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
        v299 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
        v300 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
        v301 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 5);
        v302 = (void *)objc_claimAutoreleasedReturnValue();
        v347 = (void *)objc_msgSend(v297, "initWithObjects:", v298, v299, v300, v301, v302, 0);

        v340 = objc_alloc(MEMORY[0x1E0C99D20]);
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v344 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v344, "localizedStringForKey:value:table:", CFSTR("CAR_STEREO_TYPE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
        v303 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v341 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v341, "localizedStringForKey:value:table:", CFSTR("HEADPHONE_TYPE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
        v339 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v304 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v304, "localizedStringForKey:value:table:", CFSTR("HEARING_AID_TYPE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
        v305 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v306 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v306, "localizedStringForKey:value:table:", CFSTR("SPEAKER_TYPE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
        v307 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v308 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v308, "localizedStringForKey:value:table:", CFSTR("OTHER_TYPE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
        v309 = (void *)objc_claimAutoreleasedReturnValue();
        v310 = (void *)v303;
        v311 = (void *)objc_msgSend(v340, "initWithObjects:", v303, v339, v305, v307, v309, 0);

        v281 = (void *)v355;
        v61 = v360;

        v5 = v358;
        v282 = v354;

        v2 = v364;
        objc_msgSend(v354, "setValues:titles:shortTitles:", v347, v352, v311);
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v312 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v312, "localizedStringForKey:value:table:", CFSTR("DEVICE_TYPE_FOOTER"), &stru_1EA29D890, CFSTR("DeviceConfig"));
        v313 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v354, "setProperty:forKey:", v313, *MEMORY[0x1E0D80928]);

        -[NSMutableArray addObject:](v364->_deviceTypeSpecifiers, "addObject:", v354);
        goto LABEL_91;
      }
      -[BluetoothDeviceProtocol classicDevice](v2->_device, "classicDevice");
      v284 = (void *)objc_claimAutoreleasedReturnValue();
      v285 = objc_msgSend(v284, "isServiceSupported:", 16);

      if (v285)
        goto LABEL_90;
    }
LABEL_92:
    -[BTSDeviceConfigController loadSyncSettings](v2, "loadSyncSettings");
    if (v2->_syncSettings.supported)
    {
      objc_msgSend(v61, "addObjectsFromArray:", v2->_syncContactsSpecifiers);
      if (v2->_syncSettings.enabled)
        objc_msgSend(v61, "addObjectsFromArray:", v2->_syncGroupsSpecifiers);
    }
    -[BluetoothDeviceProtocol classicDevice](v2->_device, "classicDevice");
    v314 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v314, "isServiceSupported:", 0x80000))
    {
      v315 = -[BTSDeviceConfigController canDisconnect](v2, "canDisconnect");

      if (v315)
        objc_msgSend(v61, "addObjectsFromArray:", v2->_aacpControlSpecifiers);
    }
    else
    {

    }
    -[BluetoothDeviceProtocol classicDevice](v2->_device, "classicDevice");
    v316 = (void *)objc_claimAutoreleasedReturnValue();
    v317 = objc_msgSend(v316, "connected");

    if (v317)
      objc_msgSend(v61, "addObjectsFromArray:", v2->_accessoryFirmwareSpecifiers);
    if (v2->_versionInfo)
      objc_msgSend(v61, "addObjectsFromArray:", v2->_accessoryInfoSpecifiers);
    v318 = v357;
    if (-[NSMutableArray count](v2->_deviceTypeSpecifiers, "count"))
      objc_msgSend(v61, "addObjectsFromArray:", v2->_deviceTypeSpecifiers);
    if (-[BTSDeviceConfigController canDisconnect](v2, "canDisconnect"))
    {
      objc_msgSend(v61, "addObjectsFromArray:", v2->_ancsControlSpecifiers);
      -[NSArray objectAtIndexedSubscript:](v2->_controlGroupSpecifiers, "objectAtIndexedSubscript:", 0);
      v319 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addObject:", v319);

      -[NSArray objectAtIndexedSubscript:](v2->_controlGroupSpecifiers, "objectAtIndexedSubscript:", 1);
      v320 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addObject:", v320);

      -[BluetoothDeviceProtocol classicDevice](v2->_device, "classicDevice");
      v321 = (void *)objc_claimAutoreleasedReturnValue();
      v322 = objc_msgSend(v321, "isGuestPairingMode");

      sharedBluetoothSettingsLogComponent();
      v323 = objc_claimAutoreleasedReturnValue();
      v324 = os_log_type_enabled(v323, OS_LOG_TYPE_DEFAULT);
      if (!v322)
      {
        v318 = v357;
        if (v324)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB30C000, v323, OS_LOG_TYPE_DEFAULT, "Guest Pairing: NOT Adding Upgrade Button", buf, 2u);
        }
        goto LABEL_113;
      }
      v318 = v357;
      if (v324)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v323, OS_LOG_TYPE_DEFAULT, "Guest Pairing: Adding Upgrade Button", buf, 2u);
      }

      v325 = v2->_controlGroupSpecifiers;
      v326 = 3;
    }
    else
    {
      if (!-[BTSDeviceConfigController canUnpair](v2, "canUnpair"))
      {
        v327 = 0;
        goto LABEL_117;
      }
      objc_msgSend(v61, "addObjectsFromArray:", v2->_ancsControlSpecifiers);
      v325 = v2->_controlGroupSpecifiers;
      v326 = 0;
    }
    -[NSArray objectAtIndexedSubscript:](v325, "objectAtIndexedSubscript:", v326);
    v323 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addObject:", v323);
LABEL_113:

    v327 = 2;
LABEL_117:
    -[NSArray objectAtIndexedSubscript:](v2->_controlGroupSpecifiers, "objectAtIndexedSubscript:", v327);
    v328 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addObject:", v328);

    objc_storeStrong(location, v61);
    goto LABEL_118;
  }
  v16 = 0;
LABEL_125:

  return v16;
}

- (void)loadAccessoryFirmwareInfo
{
  int v3;
  uint64_t Int64;
  BOOL v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSRange v23;

  v3 = MGGetBoolAnswer();
  Int64 = CFPrefs_GetInt64();
  if (v3)
    v5 = Int64 == 0;
  else
    v5 = 0;
  if (v5)
  {
    -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (!+[HPSProductUtils isAppleHeadphone:](HPSProductUtils, "isAppleHeadphone:"))
    {
LABEL_16:

      return;
    }
    -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isTemporaryPaired");

    if ((v7 & 1) != 0)
      return;
    -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isGenuineAirPods");

    if (!v9)
      return;
    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Internal"), self, 0, 0, 0, 0, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](self->_accessoryFirmwareSpecifiers, "addObject:");
    if (-[BTSDeviceConfigController shouldShowInternalFitTestToggle](self, "shouldShowInternalFitTestToggle"))
    {
      objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Force Show Fit Test"), self, sel_setForceShowFitTest_, sel_forceShowFitTest, 0, 6, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](self->_accessoryFirmwareSpecifiers, "addObject:", v10);

    }
    -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "getAACPCapabilityBit:", 64))
    {
      -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "getSpatialAudioPlatformSupport");

      if (v13 != 1)
      {
LABEL_15:
        objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Configure Livability"), self, 0, 0, 0, 13, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setButtonAction:", sel_presentAssetLocationLink);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("More details available at %@."), CFSTR("Recommended Builds"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setProperty:forKey:", v19, *MEMORY[0x1E0D80818]);

        objc_msgSend(v22, "setProperty:forKey:", v17, *MEMORY[0x1E0D80838]);
        v23.location = objc_msgSend(v17, "rangeOfString:", CFSTR("Recommended Builds"));
        NSStringFromRange(v23);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setProperty:forKey:", v20, *MEMORY[0x1E0D80828]);

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setProperty:forKey:", v21, *MEMORY[0x1E0D80830]);

        objc_msgSend(v22, "setProperty:forKey:", CFSTR("userDidTapRecommendedBuilds:"), *MEMORY[0x1E0D80820]);
        -[NSMutableArray addObject:](self->_accessoryFirmwareSpecifiers, "addObject:", v16);

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Use Spatial Audio Profile"), self, sel_setSoundProfileAllowed_, sel_soundProfileAllowed, 0, 6, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](self->_accessoryFirmwareSpecifiers, "addObject:", v11);
      objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Dynamic Audio Feedback"), self, sel_setDynamicEnrollmentFeedback_, sel_dynamicEnrollmentFeedback, 0, 6, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](self->_accessoryFirmwareSpecifiers, "addObject:", v14);
      objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Video Capture Spatial Audio Profile"), self, sel_setSpatialProfileVideoCapture_, sel_spatialProfileVideoCapture, 0, 6, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](self->_accessoryFirmwareSpecifiers, "addObject:", v15);

    }
    goto LABEL_15;
  }
}

- (BOOL)shouldForceShowFitTest
{
  void *v3;
  BOOL v4;

  -[BTSDeviceConfigController forceShowFitTest](self, "forceShowFitTest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "BOOLValue"))
    v4 = -[BTSDeviceConfigController shouldShowInternalFitTestToggle](self, "shouldShowInternalFitTestToggle");
  else
    v4 = 0;

  return v4;
}

- (BOOL)shouldShowInternalFitTestToggle
{
  void *v2;
  int v3;
  unsigned int v4;
  NSObject *v5;
  const char *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productId");

  v4 = ((v3 - 8217) < 8) & (0xA5u >> (v3 - 25));
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "No";
    if (v4)
      v6 = "Yes";
    v8 = 136315138;
    v9 = v6;
    _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Internal Fit Test: Should Show Internal Fit Test Toggle: %s", (uint8_t *)&v8, 0xCu);
  }

  return v4;
}

- (id)forceShowFitTest
{
  uint64_t Int64;
  NSObject *v3;
  const char *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  Int64 = CFPrefs_GetInt64();
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "No";
    if (Int64)
      v4 = "Yes";
    v6 = 136315138;
    v7 = v4;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Internal Fit Test: Force Show Fit Test: %s", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", Int64 != 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setForceShowFitTest:(id)a3
{
  int v3;
  NSObject *v4;
  const char *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a3, "BOOLValue");
  CFPrefs_SetValue();
  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "No";
    if (v3)
      v5 = "Yes";
    v6 = 136315138;
    v7 = v5;
    _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "Internal Fit Test: Set Force Show Fit Test to: %s", (uint8_t *)&v6, 0xCu);
  }

}

- (void)setSpatialProfileVideoCapture:(id)a3
{
  objc_msgSend(a3, "BOOLValue");
  CFPrefs_SetValue();
}

- (id)spatialProfileVideoCapture
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", CFPrefs_GetInt64() != 0);
}

- (void)setAdaptiveVolumeMode:(id)a3
{
  uint64_t v4;
  id v5;

  if (objc_msgSend(a3, "BOOLValue"))
    v4 = 1;
  else
    v4 = 2;
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceAdaptiveVolumeMode:", v4);

}

- (id)adaptiveVolumeMode
{
  void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getDeviceAdaptiveVolumeMode");

  if (v3 == 1)
  {
    v12 = 1;
  }
  else
  {
    if (!v3)
    {
      sharedBluetoothSettingsLogComponent();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[BTSDeviceConfigController adaptiveVolumeMode].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

    }
    v12 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDynamicEnrollmentFeedback:(id)a3
{
  int v3;
  CFPropertyListRef *v4;

  v3 = objc_msgSend(a3, "BOOLValue");
  v4 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
  if (!v3)
    v4 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
  CFPreferencesSetAppValue(CFSTR("DynamicEnrollmentFeedback"), *v4, CFSTR("com.apple.BTServer"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.BTServer"));
}

- (id)dynamicEnrollmentFeedback
{
  int AppBooleanValue;
  BOOL v3;
  uint64_t v4;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(CFSTR("com.apple.BTServer"));
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("DynamicEnrollmentFeedback"), CFSTR("com.apple.BTServer"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  v4 = !v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)loadSyncSettings
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1DB30C000, v2, v3, "%@ BTServer's sync group out-of-date, defaulting to None", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

- (void)loadAccessorySettings
{
  OUTLINED_FUNCTION_10(&dword_1DB30C000, a2, a3, "Accessory feature support : %06x", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)addA2DPDisclosureUISpecifier
{
  void *v2;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  NSRange v30;

  if (!+[HPSProductUtils isRealityDevice](HPSProductUtils, "isRealityDevice"))
    return;
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "productId");
  if (v5 >= 0x2002)
  {
    -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "productId") < 0x200A)
      goto LABEL_8;
  }
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "productId") == 8208)
  {
LABEL_7:

    if (v5 <= 0x2001)
    {
LABEL_9:

LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SPATIAL_TUTORIAL_HEADER"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v29 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v29, self, 0, 0, 0, 0, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setProperty:forKey:", CFSTR("SPATIAL_AUDIO_GROUP_ID_A2DP"), *MEMORY[0x1E0D80868]);
      -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "productId");

      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v11 == 8194)
      {
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_DETAIL_REALITYDEVICE_AIRPODS"), &stru_1EA29D890, CFSTR("DeviceConfig"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "productName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", v15, v17, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SPATIAL_AUDIO_DETAIL_REALITYDEVICE_BEATS"), &stru_1EA29D890, CFSTR("DeviceConfig"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", v15, v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v9, "setProperty:forKey:", v20, *MEMORY[0x1E0D80848]);
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setProperty:forKey:", v22, *MEMORY[0x1E0D80818]);

      objc_msgSend(v9, "setProperty:forKey:", v20, *MEMORY[0x1E0D80838]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_1EA29D890, CFSTR("SpatialAudioProfile"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30.location = objc_msgSend(v20, "rangeOfString:", v24);
      NSStringFromRange(v30);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setProperty:forKey:", v25, *MEMORY[0x1E0D80828]);

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setProperty:forKey:", v26, *MEMORY[0x1E0D80830]);

      objc_msgSend(v9, "setProperty:forKey:", CFSTR("userDidTapSpatialA2DPLatencyDisclosure:"), *MEMORY[0x1E0D80820]);
      -[NSMutableArray addObject:](self->_aacpControlSpecifiers, "addObject:", v9);

      return;
    }
LABEL_8:

    goto LABEL_9;
  }
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "productId") == 8214)
  {

    goto LABEL_7;
  }
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "productId");

  if (v5 > 0x2001)
  if (v28 == 8209)
    goto LABEL_10;
}

- (void)addHearingSpecifiers
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
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
  BluetoothDeviceProtocol *device;
  void *v17;
  void *v18;
  BluetoothDeviceProtocol *v19;
  uint8_t buf[4];
  _BOOL4 v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[BTSDeviceConfigController adaptiveTransparencySpecifier](self, "adaptiveTransparencySpecifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BTSDeviceConfigController adaptiveVolumeSupported](self, "adaptiveVolumeSupported")
    || -[BTSDeviceConfigController conversationDetectSupported](self, "conversationDetectSupported")
    || v3)
  {
    sharedBluetoothSettingsLogComponent();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Hearing: Device Supported, Adding Hearing Specifiers", buf, 2u);
    }

    v6 = (void *)MEMORY[0x1E0D804E8];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AUDIO"), &stru_1EA29D890, CFSTR("DeviceConfig-B698"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, 0, 0, 0, 0, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    if (+[HPSProductUtils isRealityDevice](HPSProductUtils, "isRealityDevice"))
    {
      -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[HPSProductUtils getProductSpecificString:descriptionKey:](HPSProductUtils, "getProductSpecificString:descriptionKey:", objc_msgSend(v9, "productId"), CFSTR("AUDIO_GROUP_FOOTER"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSObject setProperty:forKey:](v4, "setProperty:forKey:", v10, *MEMORY[0x1E0D80848]);
    }
    -[NSMutableArray addObject:](self->_aacpControlSpecifiers, "addObject:", v4);
    -[BTSDeviceConfigController addAdaptiveVolumeSpecifier](self, "addAdaptiveVolumeSpecifier");
    -[BTSDeviceConfigController addConversationDetectSpecifier](self, "addConversationDetectSpecifier");
    if (v3)
      -[NSMutableArray addObject:](self->_aacpControlSpecifiers, "addObject:", v3);
    if (-[BTSDeviceConfigController supportAutoAncStrength](self, "supportAutoAncStrength"))
    {
      v11 = (void *)MEMORY[0x1E0D804E8];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ADAPTIVE_AUDIO"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, self, sel_setAdaptiveStrengthWithValue_, sel_getAdaptiveStrength, objc_opt_class(), 2, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      +[HPSDevice deviceKey](HPSDevice, "deviceKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      device = self->_device;
      v18 = v15;
      v19 = device;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setUserInfo:", v17);

      objc_msgSend(v14, "setIdentifier:", CFSTR("ADAPTIVE_STRENGTH"));
      if (+[HPSProductUtils isRealityDevice](HPSProductUtils, "isRealityDevice"))
        objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80808]);
      -[NSMutableArray addObject:](self->_aacpControlSpecifiers, "addObject:", v14);

    }
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      v21 = -[BTSDeviceConfigController adaptiveVolumeSupported](self, "adaptiveVolumeSupported");
      v22 = 1024;
      v23 = -[BTSDeviceConfigController conversationDetectSupported](self, "conversationDetectSupported");
      v24 = 2112;
      v25 = 0;
      _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "Hearing: showHearing == False %i %i %@,", buf, 0x18u);
    }
  }

}

- (id)adaptiveTransparencySpecifier
{
  void *v3;
  int v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v33;
  _BOOL4 adaptiveTransparencyRetrieved;
  unint64_t adaptiveTransparencyIndex;
  void *v36;
  uint8_t buf[4];
  _BOOL4 v39;
  __int16 v40;
  unint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (!+[HPSProductUtils isRealityDevice](HPSProductUtils, "isRealityDevice"))
  {
    if (!-[BTSDeviceConfigController shouldShowLoudSoundReduction](self, "shouldShowLoudSoundReduction"))
    {
LABEL_23:
      v9 = 0;
      return v9;
    }
    objc_msgSend(MEMORY[0x1E0D2F9D8], "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "address");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v24, "activeHearingProtectionAvailableForAddress:", v26);

    if (!v27)
    {
      if (!self->_adaptiveTransparencyRetrieved)
      {
        sharedBluetoothSettingsLogComponent();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          adaptiveTransparencyRetrieved = self->_adaptiveTransparencyRetrieved;
          adaptiveTransparencyIndex = self->_adaptiveTransparencyIndex;
          *(_DWORD *)buf = 67109376;
          v39 = adaptiveTransparencyRetrieved;
          v40 = 2048;
          v41 = adaptiveTransparencyIndex;
          _os_log_impl(&dword_1DB30C000, v33, OS_LOG_TYPE_DEFAULT, "Hearing: AdaptiveTransparency:  initial _adaptiveTransparencyRetrieved %d  _adaptiveTransparencyIndex %lu", buf, 0x12u);
        }

        self->_adaptiveTransparencyIndex = -[NSMutableArray count](self->_aacpControlSpecifiers, "count");
        objc_msgSend(MEMORY[0x1E0D2F9D8], "sharedInstance");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "registerUpdateBlock:forRetrieveSelector:withListener:", &__block_literal_global_1240, sel_activeHearingProtectionAvailable, self);

      }
      goto LABEL_23;
    }
    v28 = objc_alloc(MEMORY[0x1E0D804E8]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("ADAPTIVE_TRANSPARENCY"), &stru_1EA29D890, CFSTR("DeviceConfig-B698"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v28, "initWithName:target:set:get:detail:cell:edit:", v30, self, sel_setHearingProtectionEnabled_specifier_, sel_getHearingProtectionEnabled_, 0, 6, 0);

    objc_msgSend(v9, "setIdentifier:", CFSTR("ADAPTIVE_TRANSPARENCY_ID"));
    objc_msgSend(v9, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("ADAPTIVE_TRANSPARENCY_DESC"), &stru_1EA29D890, CFSTR("DeviceConfig-B698"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)*MEMORY[0x1E0D80950];
    v21 = v9;
    v22 = v20;
    goto LABEL_15;
  }
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "productId");

  if (v4 != 8212 && v4 != 8228)
  {
    sharedBluetoothSettingsLogComponent();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB30C000, v31, OS_LOG_TYPE_DEFAULT, "Hearing: Adaptive Transparency: accessory doesn't  support the feature, returning", buf, 2u);
    }

    goto LABEL_23;
  }
  v6 = objc_alloc(MEMORY[0x1E0D804E8]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ADAPTIVE_TRANSPARENCY"), &stru_1EA29D890, CFSTR("DeviceConfig-B698"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithName:target:set:get:detail:cell:edit:", v8, self, sel_setHearingProtectionEnabled_specifier_, sel_getHearingProtectionEnabled_, 0, 6, 0);

  objc_msgSend(v9, "setIdentifier:", CFSTR("ADAPTIVE_TRANSPARENCY_ID"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80808]);
  objc_msgSend(v9, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ADAPTIVE_TRANSPARENCY_DESC"), &stru_1EA29D890, CFSTR("DeviceConfig-B698"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setProperty:forKey:", v11, *MEMORY[0x1E0D80950]);

  -[BTSDeviceConfigController getHearingProtectionEnabled:](self, "getHearingProtectionEnabled:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");
  v14 = CFSTR("CELL_LABEL_OFF");
  if (v13)
    v14 = CFSTR("CELL_LABEL_ON");
  v15 = v14;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", v15, &stru_1EA29D890, CFSTR("DeviceConfig-B698"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[HPSVisionOSSubtitleOnOffIndicatorCell onOffKey](_TtC16HeadphoneConfigs37HPSVisionOSSubtitleOnOffIndicatorCell, "onOffKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setProperty:forKey:", v17, v18);

  if (v4 == 8228 || v4 == 8212)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[HPSVisionOSSubtitleOnOffIndicatorCell cellDisabledKey](_TtC16HeadphoneConfigs37HPSVisionOSSubtitleOnOffIndicatorCell, "cellDisabledKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v9;
    v22 = v19;
    v23 = v20;
LABEL_15:
    objc_msgSend(v21, "setProperty:forKey:", v22, v23);

  }
  return v9;
}

void __58__BTSDeviceConfigController_adaptiveTransparencySpecifier__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("HPSSoundProtectionUpdated"), 0);

}

- (id)getHearingProtectionEnabled:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (+[HPSProductUtils isRealityDevice](HPSProductUtils, "isRealityDevice", a3))
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D2F9D8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "activeHearingProtectionEnabledForAddress:", v7);

    sharedBluetoothSettingsLogComponent();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = v4;
      _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "Hearing: AdaptiveTransparency: getHearingProtectionEnabled %d", (uint8_t *)v11, 8u);
    }

    if ((_DWORD)v4)
      v9 = CFSTR("On");
    else
      v9 = CFSTR("Off");
    -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 1, 0, v9);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setHearingProtectionEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "BOOLValue");
  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v5;
    _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "Hearing: AdaptiveTransparency: setHearingProtectionEnabled %d", (uint8_t *)v11, 8u);
  }

  -[HPSDeviceAnalytics updateFeatureChangeCount:](self->_deviceAnalytics, "updateFeatureChangeCount:", 0);
  if ((_DWORD)v5)
    v7 = CFSTR("On");
  else
    v7 = CFSTR("Off");
  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 1, 0, v7);
  objc_msgSend(MEMORY[0x1E0D2F9D8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "address");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActiveHearingProtectionEnabled:forAddress:", v5, v10);

}

- (void)updateHearingProtectionSpecifiers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "Hearing: AdaptiveTransparency: Environmental Sound Protection has been retrieved", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

uint64_t __62__BTSDeviceConfigController_updateHearingProtectionSpecifiers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifierID:animated:", CFSTR("ADAPTIVE_TRANSPARENCY_ID"), 1);
}

- (void)addConversationDetectSpecifier
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  uint8_t buf[16];
  uint8_t v31[2];
  __int16 v32;
  __int16 v33;

  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v3 = +[HPSProductUtils isRealityDevice](HPSProductUtils, "isRealityDevice");
    -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {
      v6 = objc_msgSend(v4, "getAACPCapabilityBit:", 160);

      if ((v6 & 1) == 0)
      {
        sharedBluetoothSettingsLogComponent();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v32 = 0;
          v8 = "Hearing: ConversationDetect: Accessory doesn't support the feature";
          v9 = (uint8_t *)&v32;
LABEL_18:
          _os_log_impl(&dword_1DB30C000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
          goto LABEL_22;
        }
        goto LABEL_22;
      }
    }
    else
    {
      v10 = objc_msgSend(v4, "getConversationDetectSupport");

      if ((v10 & 1) == 0)
      {
        sharedBluetoothSettingsLogComponent();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v31 = 0;
          v8 = "Hearing: ConversationDetect: Support Disabled";
          v9 = v31;
          goto LABEL_18;
        }
        goto LABEL_22;
      }
    }
    sharedBluetoothSettingsLogComponent();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB30C000, v11, OS_LOG_TYPE_DEFAULT, "Hearing: ConversationDetect: Enabled, adding Specifier", buf, 2u);
    }

    v12 = (void *)MEMORY[0x1E0D804E8];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SPEECH_DETECTION"), &stru_1EA29D890, CFSTR("DeviceConfig-B698"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, sel_setConversationDetectMode_specifier_, sel_getConversationDetectMode_, 0, 6, 0);
    v7 = objc_claimAutoreleasedReturnValue();

    -[NSObject setIdentifier:](v7, "setIdentifier:", CFSTR("SPEECH_DETECTION_ID"));
    v15 = objc_opt_class();
    v16 = *MEMORY[0x1E0D80780];
    -[NSObject setProperty:forKey:](v7, "setProperty:forKey:", v15, *MEMORY[0x1E0D80780]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SPEECH_DETECTION_DESC"), &stru_1EA29D890, CFSTR("DeviceConfig-B698"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setProperty:forKey:](v7, "setProperty:forKey:", v18, *MEMORY[0x1E0D80950]);

    if (+[HPSProductUtils isRealityDevice](HPSProductUtils, "isRealityDevice"))
    {
      -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80808]);
      -[NSObject setProperty:forKey:](v7, "setProperty:forKey:", objc_opt_class(), v16);
      -[BTSDeviceConfigController getConversationDetectMode:](self, "getConversationDetectMode:", v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("CELL_LABEL_ON");
      if (!v19)
        v20 = CFSTR("CELL_LABEL_OFF");
      v21 = v20;

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", v21, &stru_1EA29D890, CFSTR("DeviceConfig-B698"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      +[HPSVisionOSSubtitleOnOffIndicatorCell onOffKey](_TtC16HeadphoneConfigs37HPSVisionOSSubtitleOnOffIndicatorCell, "onOffKey");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setProperty:forKey:](v7, "setProperty:forKey:", v23, v24);

      -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "productId") == 8228)
      {

LABEL_20:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[HPSVisionOSSubtitleOnOffIndicatorCell cellDisabledKey](_TtC16HeadphoneConfigs37HPSVisionOSSubtitleOnOffIndicatorCell, "cellDisabledKey");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setProperty:forKey:](v7, "setProperty:forKey:", v28, v29);

        goto LABEL_21;
      }
      -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "productId");

      if (v27 == 8212)
        goto LABEL_20;
    }
LABEL_21:
    -[NSMutableArray addObject:](self->_aacpControlSpecifiers, "addObject:", v7);
    goto LABEL_22;
  }
  sharedBluetoothSettingsLogComponent();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v33 = 0;
    v8 = "Hearing: ConversationDetect: Feature Disabled";
    v9 = (uint8_t *)&v33;
    goto LABEL_18;
  }
LABEL_22:

}

- (id)getConversationDetectMode:(id)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  _BOOL8 v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "getConversationDetectMode");

  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "Disabled";
    if (v5 == 1)
      v7 = "Enabled";
    v10 = 136315138;
    v11 = v7;
    _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "Hearing: ConversationDetect: Get Mode: %s", (uint8_t *)&v10, 0xCu);
  }
  v8 = v5 == 1;

  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 53, v8, 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setConversationDetectMode:(id)a3 specifier:(id)a4
{
  HPSDeviceAnalytics *deviceAnalytics;
  id v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  deviceAnalytics = self->_deviceAnalytics;
  v6 = a3;
  -[HPSDeviceAnalytics updateFeatureChangeCount:](deviceAnalytics, "updateFeatureChangeCount:", 52);
  v7 = objc_msgSend(v6, "BOOLValue");

  sharedBluetoothSettingsLogComponent();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = "Disabled";
    if ((_DWORD)v7)
      v9 = "Enabled";
    v13 = 136315138;
    v14 = v9;
    _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "Hearing: ConversationDetect: Set Mode: %s", (uint8_t *)&v13, 0xCu);
  }

  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((_DWORD)v7)
    v12 = 1;
  else
    v12 = 2;
  objc_msgSend(v10, "setConversationDetectMode:", v12);

  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 53, v7, 0);
}

- (void)addAdaptiveVolumeSpecifier
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  uint8_t buf[16];
  uint8_t v31[2];
  __int16 v32;
  __int16 v33;

  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v3 = +[HPSProductUtils isRealityDevice](HPSProductUtils, "isRealityDevice");
    -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {
      v6 = objc_msgSend(v4, "getAACPCapabilityBit:", 144);

      if ((v6 & 1) == 0)
      {
        sharedBluetoothSettingsLogComponent();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v32 = 0;
          v8 = "Hearing: AdaptiveVolume: Accessory doesn't support the feature";
          v9 = (uint8_t *)&v32;
LABEL_18:
          _os_log_impl(&dword_1DB30C000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
          goto LABEL_22;
        }
        goto LABEL_22;
      }
    }
    else
    {
      v10 = objc_msgSend(v4, "getAdaptiveVolumeSupport");

      if ((v10 & 1) == 0)
      {
        sharedBluetoothSettingsLogComponent();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v31 = 0;
          v8 = "Hearing: AdaptiveVolume: Support Disabled";
          v9 = v31;
          goto LABEL_18;
        }
        goto LABEL_22;
      }
    }
    sharedBluetoothSettingsLogComponent();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB30C000, v11, OS_LOG_TYPE_DEFAULT, "Hearing: AdaptiveVolume: Enabled, adding Specifier", buf, 2u);
    }

    v12 = (void *)MEMORY[0x1E0D804E8];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ADAPTIVE_VOLUME"), &stru_1EA29D890, CFSTR("DeviceConfig-B698"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, sel_setAdaptiveVolumeMode_specifier_, sel_getAdaptiveVolumeMode_, 0, 6, 0);
    v7 = objc_claimAutoreleasedReturnValue();

    -[NSObject setIdentifier:](v7, "setIdentifier:", CFSTR("ADAPTIVE_VOLUME_ID"));
    v15 = objc_opt_class();
    v16 = *MEMORY[0x1E0D80780];
    -[NSObject setProperty:forKey:](v7, "setProperty:forKey:", v15, *MEMORY[0x1E0D80780]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("ADAPTIVE_VOLUME_DESC"), &stru_1EA29D890, CFSTR("DeviceConfig-B698"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setProperty:forKey:](v7, "setProperty:forKey:", v18, *MEMORY[0x1E0D80950]);

    if (+[HPSProductUtils isRealityDevice](HPSProductUtils, "isRealityDevice"))
    {
      -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80808]);
      -[NSObject setProperty:forKey:](v7, "setProperty:forKey:", objc_opt_class(), v16);
      -[BTSDeviceConfigController getAdaptiveVolumeMode:](self, "getAdaptiveVolumeMode:", v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("CELL_LABEL_ON");
      if (!v19)
        v20 = CFSTR("CELL_LABEL_OFF");
      v21 = v20;

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", v21, &stru_1EA29D890, CFSTR("DeviceConfig-B698"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      +[HPSVisionOSSubtitleOnOffIndicatorCell onOffKey](_TtC16HeadphoneConfigs37HPSVisionOSSubtitleOnOffIndicatorCell, "onOffKey");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setProperty:forKey:](v7, "setProperty:forKey:", v23, v24);

      -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "productId") == 8228)
      {

LABEL_20:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[HPSVisionOSSubtitleOnOffIndicatorCell cellDisabledKey](_TtC16HeadphoneConfigs37HPSVisionOSSubtitleOnOffIndicatorCell, "cellDisabledKey");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setProperty:forKey:](v7, "setProperty:forKey:", v28, v29);

        goto LABEL_21;
      }
      -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "productId");

      if (v27 == 8212)
        goto LABEL_20;
    }
LABEL_21:
    -[NSMutableArray addObject:](self->_aacpControlSpecifiers, "addObject:", v7);
    goto LABEL_22;
  }
  sharedBluetoothSettingsLogComponent();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v33 = 0;
    v8 = "Hearing: AdaptiveVolume: Feature Disabled";
    v9 = (uint8_t *)&v33;
    goto LABEL_18;
  }
LABEL_22:

}

- (id)getAdaptiveVolumeMode:(id)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  _BOOL8 v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "getAdaptiveVolumeMode");

  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "Disabled";
    if (v5 == 1)
      v7 = "Enabled";
    v10 = 136315138;
    v11 = v7;
    _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "Hearing: AdaptiveVolume: Get Mode: %s", (uint8_t *)&v10, 0xCu);
  }
  v8 = v5 == 1;

  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 3, v8, 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setAdaptiveVolumeMode:(id)a3 specifier:(id)a4
{
  HPSDeviceAnalytics *deviceAnalytics;
  id v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  deviceAnalytics = self->_deviceAnalytics;
  v6 = a3;
  -[HPSDeviceAnalytics updateFeatureChangeCount:](deviceAnalytics, "updateFeatureChangeCount:", 2);
  v7 = objc_msgSend(v6, "BOOLValue");

  sharedBluetoothSettingsLogComponent();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = "Disabled";
    if ((_DWORD)v7)
      v9 = "Enabled";
    v13 = 136315138;
    v14 = v9;
    _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "Hearing: AdaptiveVolume: Set Mode: %s", (uint8_t *)&v13, 0xCu);
  }

  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((_DWORD)v7)
    v12 = 1;
  else
    v12 = 2;
  objc_msgSend(v10, "setAdaptiveVolumeMode:", v12);

  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 3, v7, 0);
}

- (BOOL)BOOLFromBluetoothPreferences:(id)a3
{
  __CFString *v3;
  int AppBooleanValue;
  BOOL v5;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  v3 = (__CFString *)a3;
  CFPreferencesAppSynchronize(CFSTR("com.apple.BTServer"));
  AppBooleanValue = CFPreferencesGetAppBooleanValue(v3, CFSTR("com.apple.BTServer"), &keyExistsAndHasValidFormat);

  if (keyExistsAndHasValidFormat)
    v5 = AppBooleanValue == 0;
  else
    v5 = 1;
  return !v5;
}

- (BOOL)nicknameEnabled
{
  NSObject *v3;

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[BTSDeviceConfigController nicknameEnabled].cold.1((uint64_t)self, v3);

  return !-[BTSDeviceConfigController BOOLFromBluetoothPreferences:](self, "BOOLFromBluetoothPreferences:", CFSTR("nicknamingDisabled"));
}

- (void)loadAccessoryInfo
{
  NSMutableArray *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  _BOOL4 v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _BOOL4 v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _QWORD *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  _BOOL4 v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  char **v88;
  char **v89;
  void *v90;
  void *v91;
  void *v92;
  _BOOL4 v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  _BOOL4 v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  NSMutableArray *accessoryInfoSpecifiers;
  void *v124;
  void *v125;
  void *v126;
  _BOOL4 v127;
  void *v128;
  _BOOL4 v129;
  void *v130;
  void *v131;
  uint64_t v132;
  void *v133;
  void *v134;

  v3 = (NSMutableArray *)objc_opt_new();
  if (!self->_versionInfo)
    goto LABEL_78;
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0x1E0D80000;
  if (objc_msgSend(v4, "featureCapability:", 32))
  {
    -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "smartRouteSupport"))
    {
      -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "connected");

      if ((v8 & 1) != 0)
        goto LABEL_44;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)MGGetStringAnswer(), "uppercaseString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("SMARTROUTE_"), "stringByAppendingString:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1EA29D890, CFSTR("DeviceConfig"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)MGGetStringAnswer(), "uppercaseString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("SMARTROUTE_MANUAL_"), "stringByAppendingString:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1EA29D890, CFSTR("DeviceConfig"));
      v132 = objc_claimAutoreleasedReturnValue();

      -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "productId");

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ACCESSORY_MODEL_NAME_%d"), (v16 - 0x2000));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", v17, &stru_1EA29D890, CFSTR("DeviceConfig"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "length");

      if (v20 && v16 >> 4 < 0x201)
      {
        v129 = 0;
        v127 = 0;
      }
      else
      {

        v21 = CFSTR("ACCESSORY_MODEL_NAME_15");
        v22 = CFSTR("ACCESSORY_MODEL_NAME_42");
        v23 = CFSTR("ACCESSORY_MODEL_NAME_20");
        if (v16 != 8228)
          v23 = CFSTR("ACCESSORY_MODEL_NAME_15");
        v24 = v16 != 8221 && v16 == 8228;
        if (v16 != 8221)
          v22 = v23;
        if (v16 == 8212)
          v21 = CFSTR("ACCESSORY_MODEL_NAME_20");
        v25 = v16 != 8210 && v16 == 8212;
        if (v16 == 8210)
          v21 = CFSTR("ACCESSORY_MODEL_NAME_18");
        v26 = v16 > 8220 && v24;
        v129 = v26;
        v27 = v16 <= 8220 && v25;
        v127 = v27;
        if (v16 <= 8220)
          v17 = (void *)v21;
        else
          v17 = (void *)v22;
      }
      objc_msgSend((id)MGGetStringAnswer(), "uppercaseString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = v17;
      objc_msgSend(CFSTR("SMARTROUTE_FOOTER_"), "stringByAppendingFormat:", CFSTR("%@_%@"), v28, v17);
      v134 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("SMART_ROUTE_GROUP_ID"));
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, sel_setSmartRouteMode_, sel_smartRouteMode, objc_opt_class(), 2, 0);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_alloc(MEMORY[0x1E0C99D20]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("SMARTROUTE_AUTOMATIC"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = (void *)objc_msgSend(v29, "initWithObjects:", v31, v132, 0);

      v32 = objc_alloc(MEMORY[0x1E0C99D20]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v32, "initWithObjects:", v33, v34, 0);

      v36 = objc_alloc(MEMORY[0x1E0C99D20]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("SMARTROUTE_AUTOMATIC"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v36, "initWithObjects:", v38, v132, 0);

      v128 = (void *)v35;
      v126 = (void *)v39;
      objc_msgSend(v125, "setValues:titles:shortTitles:", v35, v133, v39);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "localizedStringForKey:value:table:", v134, &stru_1EA29D890, CFSTR("DeviceConfig"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = *MEMORY[0x1E0D80928];
      objc_msgSend(v125, "setProperty:forKey:", v41, *MEMORY[0x1E0D80928]);

      -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v41) = objc_msgSend(v43, "getAACPCapabilityBit:", 10);

      if ((_DWORD)v41)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "localizedStringForKey:value:table:", v134, &stru_1EA29D890, CFSTR("DeviceConfig-B494"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "setProperty:forKey:", v45, v42);

      }
      -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "getAACPCapabilityBit:", 10);

      if (v47)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "localizedStringForKey:value:table:", v134, &stru_1EA29D890, CFSTR("DeviceConfig-B498-v2"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "setProperty:forKey:", v49, v42);

      }
      v6 = (void *)v132;
      if (v127)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "localizedStringForKey:value:table:", v134, &stru_1EA29D890, CFSTR("DeviceConfig-B698"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "setProperty:forKey:", v51, v42);

      }
      if (v129)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "localizedStringForKey:value:table:", v134, &stru_1EA29D890, CFSTR("DeviceConfig-B698"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "setProperty:forKey:", v53, v42);

      }
      -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "getAACPCapabilityBit:", 32);

      if (v55)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "localizedStringForKey:value:table:", v134, &stru_1EA29D890, CFSTR("DeviceConfig-b515"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "setProperty:forKey:", v57, v42);

      }
      -[NSMutableArray addObject:](v3, "addObject:", v130);
      -[NSMutableArray addObject:](v3, "addObject:", v125);

      v5 = 0x1E0D80000uLL;
    }

  }
LABEL_44:
  if (!_os_feature_enabled_impl())
    goto LABEL_50;
  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[HPSProductUtils isFeatureSupported:byDevice:](HPSProductUtils, "isFeatureSupported:byDevice:", 1, v58)&& -[BTSDeviceConfigController isiCloudEnabled](self, "isiCloudEnabled"))
  {
    -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "connected");

    if ((v60 & 1) != 0)
      goto LABEL_50;
    objc_msgSend(*(id *)(v5 + 1256), "groupSpecifierWithID:", CFSTR("FIND_MY_GROUP_ID"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = *(void **)(v5 + 1256);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "localizedStringForKey:value:table:", CFSTR("FIND_MY"), &stru_1EA29D890, CFSTR("DeviceConfig"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v63, self, 0, 0, 0, 13, 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v64, "setButtonAction:", sel_presentFindMyLink);
    -[NSMutableArray addObject:](v3, "addObject:", v58);
    -[NSMutableArray addObject:](v3, "addObject:", v64);

  }
LABEL_50:
  if (_os_feature_enabled_impl())
  {
    -[BTSDeviceConfigController turnOffListeningModeSpecifiers](self, "turnOffListeningModeSpecifiers");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v65);

  }
  v66 = *(void **)(v5 + 1256);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "localizedStringForKey:value:table:", CFSTR("ACCESSORY_ABOUT_HEADER"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v68, self, 0, 0, 0, 0, 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](v3, "addObject:", v69);
  -[BTSDeviceConfigController getModelName:](self, "getModelName:", 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  v71 = (_QWORD *)MEMORY[0x1E0D807E8];
  if (v70)
  {
    v72 = *(void **)(v5 + 1256);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "localizedStringForKey:value:table:", CFSTR("ACCESSORY_ABOUT_BUD_MODEL_NAME"), &stru_1EA29D890, CFSTR("DeviceConfig"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v74, self, 0, sel_getModelName_, 0, 4, 0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v75, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *v71);
    -[NSMutableArray addObject:](v3, "addObject:", v75);

  }
  -[BTSDeviceConfigController getModelNumber:](self, "getModelNumber:", 0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    v77 = *(void **)(v5 + 1256);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "localizedStringForKey:value:table:", CFSTR("ACCESSORY_ABOUT_BUD_MODEL_NUMBER"), &stru_1EA29D890, CFSTR("DeviceConfig"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v79, self, 0, sel_getModelNumber_, 0, 4, 0);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v80, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *v71);
    -[NSMutableArray addObject:](v3, "addObject:", v80);

  }
  -[BTSDeviceConfigController getSystemSerialNumber:](self, "getSystemSerialNumber:", 0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v81;
  v83 = v81 == 0;
  if (v81)
  {
    v84 = 0;
LABEL_60:

LABEL_61:
    v85 = *(void **)(v5 + 1256);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "localizedStringForKey:value:table:", CFSTR("ACCESSORY_ABOUT_SERIAL_NUMBER"), &stru_1EA29D890, CFSTR("DeviceConfig"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = &selRef_getSystemSerialNumber_;
    v89 = &selRef_getBudLeftSerialNumber_;
    if (!v83)
      v89 = &selRef_getBudRightSerialNumber_;
    if (!v82)
      v88 = v89;
    objc_msgSend(v85, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v87, self, 0, *v88, 0, 4, 0);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = 0x1E0D80000uLL;
    objc_msgSend(v90, "setIdentifier:", CFSTR("ACCESSORY_ABOUT_SERIAL_NUMBER_ID"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v84);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setProperty:forKey:", v91, CFSTR("SERIAL_NUMBER_TYPE"));

    objc_msgSend(v90, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *v71);
    -[NSMutableArray addObject:](v3, "addObject:", v90);

    goto LABEL_66;
  }
  -[BTSDeviceConfigController getBudLeftSerialNumber:](self, "getBudLeftSerialNumber:", 0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (v81)
  {
    v84 = 1;
    goto LABEL_60;
  }
  -[BTSDeviceConfigController getBudRightSerialNumber:](self, "getBudRightSerialNumber:", 0);
  v124 = (void *)objc_claimAutoreleasedReturnValue();

  if (v124)
  {
    v83 = 0;
    v84 = 2;
    goto LABEL_61;
  }
LABEL_66:
  -[BTSDeviceConfigController getBudFirmwareVersion:](self, "getBudFirmwareVersion:", 0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  if (v92)
  {
    v93 = -[BTSDeviceConfigController supportsFirmwareReleaseNotes](self, "supportsFirmwareReleaseNotes");
    v94 = *(void **)(v5 + 1256);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "localizedStringForKey:value:table:", CFSTR("ACCESSORY_ABOUT_BUD_VERSION_FIRMWARE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    if (v93)
    {
      objc_msgSend(v94, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v96, self, 0, sel_getBudFirmwareVersion_, objc_opt_class(), 2, 0);
      v97 = (void *)objc_claimAutoreleasedReturnValue();

      v98 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[BTSDeviceConfigController getBudFirmwareVersion:](self, "getBudFirmwareVersion:", 0);
      v99 = (void *)objc_claimAutoreleasedReturnValue();

      if (v99)
      {
        -[BTSDeviceConfigController getBudFirmwareVersion:](self, "getBudFirmwareVersion:", 0);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "setObject:forKey:", v100, CFSTR("device-bud-version"));

      }
      -[BTSDeviceConfigController getCaseFirmwareVersion:](self, "getCaseFirmwareVersion:", 0);
      v101 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = 0x1E0D80000;
      if (v101)
      {
        -[BTSDeviceConfigController getCaseFirmwareVersion:](self, "getCaseFirmwareVersion:", 0);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "setObject:forKey:", v102, CFSTR("device-case-version"));

      }
      objc_msgSend(v97, "setUserInfo:", v98);
    }
    else
    {
      objc_msgSend(v94, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v96, self, 0, sel_getBudFirmwareVersion_, 0, 4, 0);
      v97 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v97, "setIdentifier:", CFSTR("ACCESSORY_ABOUT_VERSION_ID"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      v98 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "setProperty:forKey:", v98, CFSTR("VERSION_TYPE"));
      v5 = 0x1E0D80000uLL;
    }

    objc_msgSend(v97, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *v71);
    -[NSMutableArray addObject:](v3, "addObject:", v97);

  }
  -[NSDictionary objectForKey:](self->_caseInfo, "objectForKey:", CFSTR("CaseInfoName"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  if (v103)
  {
    v104 = *(void **)(v5 + 1256);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "localizedStringForKey:value:table:", CFSTR("ACCESSORY_ABOUT_CASE_NAME"), &stru_1EA29D890, CFSTR("DeviceConfig"));
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v106, self, 0, sel_getCaseName_, 0, 4, 0);
    v107 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v107, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *v71);
    -[NSMutableArray addObject:](v3, "addObject:", v107);

  }
LABEL_78:
  if (_os_feature_enabled_impl())
  {
    -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = +[HPSProductUtils isAppleHeadphone:](HPSProductUtils, "isAppleHeadphone:", v108);

    if (v109)
    {
      -[BTSDeviceConfigController getSystemSerialNumber:](self, "getSystemSerialNumber:", 0);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      if (v110)
      {
        -[BTSDeviceConfigController ndoController](self, "ndoController");
        v111 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v111)
        {
          v112 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D523E8]), "initWithSerialNumber:", v110);
          -[BTSDeviceConfigController setNdoController:](self, "setNdoController:", v112);

        }
        -[NSMutableArray lastObject](v3, "lastObject");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "identifier");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        -[BTSDeviceConfigController ndoController](self, "ndoController");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "setSpecifierIDToInsertAfter:", v114);

        -[BTSDeviceConfigController ndoController](self, "ndoController");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "specifiers");
        v117 = objc_claimAutoreleasedReturnValue();
        if (!v117)
          goto LABEL_86;
        v118 = (void *)v117;
        -[BTSDeviceConfigController ndoController](self, "ndoController");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "specifiers");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        v121 = objc_msgSend(v120, "count");

        if (v121)
        {
          -[BTSDeviceConfigController ndoController](self, "ndoController");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "specifiers");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v122);

LABEL_86:
        }
      }

    }
  }
  accessoryInfoSpecifiers = self->_accessoryInfoSpecifiers;
  self->_accessoryInfoSpecifiers = v3;

}

- (void)initializeCaseConnection
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "Case Sound: failed to get the serialNumber", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)releaseCaseConnection
{
  BTAirPodsControlServiceClient *airPodsServiceclient;
  BTAirPodsControlServiceClient *v4;

  airPodsServiceclient = self->_airPodsServiceclient;
  if (airPodsServiceclient)
  {
    -[BTAirPodsControlServiceClient invalidate](airPodsServiceclient, "invalidate");
    v4 = self->_airPodsServiceclient;
    self->_airPodsServiceclient = 0;

  }
  self->_caseSoundRetrieved = 0;
  self->_caseSoundRetrieveInProgress = 0;
}

- (void)getSoundMode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11(&dword_1DB30C000, v0, v1, "Case Sound: (_caseSoundRetrieved == YES) returning", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __41__BTSDeviceConfigController_getSoundMode__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 1568);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __41__BTSDeviceConfigController_getSoundMode__block_invoke_2;
  v5[3] = &unk_1EA29AA18;
  v5[1] = 3221225472;
  v5[4] = v2;
  v6 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  objc_msgSend(v4, "getSilentModeWithCompletionHandler:", v5);
  objc_destroyWeak(&v7);

}

void __41__BTSDeviceConfigController_getSoundMode__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1561) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1562) = 0;
  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1565) = 0;
    sharedBluetoothSettingsLogComponent();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __41__BTSDeviceConfigController_getSoundMode__block_invoke_2_cold_1();

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1564) = a2;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1565) = 1;
    v7 = *(NSObject **)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __41__BTSDeviceConfigController_getSoundMode__block_invoke_3;
    v8[3] = &unk_1EA29A9F0;
    objc_copyWeak(&v9, (id *)(a1 + 48));
    v8[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v7, v8);
    objc_destroyWeak(&v9);
  }

}

void __41__BTSDeviceConfigController_getSoundMode__block_invoke_3(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v1 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CASE_SOUND_ID"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "reloadSpecifierID:animated:", v4, 1);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "getGroupSpecifierForSpecifierID:", CFSTR("CASE_SOUND_GROUP_ID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", &stru_1EA29D890, *MEMORY[0x1E0D80848]);

  v9 = objc_loadWeakRetained(v1);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CASE_SOUND_GROUP_ID"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadSpecifierID:animated:", v8, 1);

}

- (id)getCaseSoundEnabled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 *p_caseSoundEnable;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const __CFString *v15;
  void *v16;
  _DWORD v18[2];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_setCaseSoundModeInProgress);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v5, *MEMORY[0x1E0D807C8]);

  if (self->_setCaseSoundModeInProgress)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    p_caseSoundEnable = (unsigned __int8 *)&self->_caseSoundEnable;
  }
  else
  {
    v8 = *MEMORY[0x1E0D80808];
    if (self->_caseSoundSupport)
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v8);
      -[BTSDeviceConfigController getGroupSpecifierForSpecifierID:](self, "getGroupSpecifierForSpecifierID:", CFSTR("CASE_SOUND_GROUP_ID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setProperty:forKey:", &stru_1EA29D890, *MEMORY[0x1E0D80848]);

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CASE_SOUND_GROUP_ID"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[BTSDeviceConfigController reloadSpecifierID:animated:](self, "reloadSpecifierID:animated:", v11, 1);

      sharedBluetoothSettingsLogComponent();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18[0]) = 0;
        _os_log_impl(&dword_1DB30C000, v12, OS_LOG_TYPE_DEFAULT, "Case Sound: Releasing case connection", (uint8_t *)v18, 2u);
      }

      -[BTSDeviceConfigController releaseCaseConnection](self, "releaseCaseConnection");
    }
    else
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v8);
    }
    p_caseSoundEnable = (unsigned __int8 *)&self->_caseSoundEnable;
    self->_caseSoundEnable = !self->_caseSilentMode;
    sharedBluetoothSettingsLogComponent();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *p_caseSoundEnable;
      v18[0] = 67109120;
      v18[1] = v14;
      _os_log_impl(&dword_1DB30C000, v13, OS_LOG_TYPE_DEFAULT, "Case Sound: getCaseSoundEnabled %d", (uint8_t *)v18, 8u);
    }

    if (*p_caseSoundEnable)
      v15 = CFSTR("On");
    else
      v15 = CFSTR("Off");
    -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 5, 0, v15);
    v6 = (void *)MEMORY[0x1E0CB37E8];
  }
  objc_msgSend(v6, "numberWithBool:", *p_caseSoundEnable);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)setCaseSoundEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  int v8;
  const __CFString *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  _QWORD block[5];
  id v16;
  id v17;
  char v18;
  id location;
  uint8_t buf[4];
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HPSDeviceAnalytics updateFeatureChangeCount:](self->_deviceAnalytics, "updateFeatureChangeCount:", 4);
  -[BTSDeviceConfigController initializeCaseConnection](self, "initializeCaseConnection");
  self->_setCaseSoundModeInProgress = 1;
  -[BTSDeviceConfigController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v7, 1);
  location = 0;
  objc_initWeak(&location, self);
  v8 = objc_msgSend(v6, "BOOLValue");
  if (v8)
    v9 = CFSTR("On");
  else
    v9 = CFSTR("Off");
  -[HPSDeviceAnalytics updateFeatureValue:value:featureValueString:](self->_deviceAnalytics, "updateFeatureValue:value:featureValueString:", 5, 0, v9);
  v10 = (void *)MEMORY[0x1E0C80D38];
  v11 = MEMORY[0x1E0C80D38];
  -[BTAirPodsControlServiceClient dispatchQueue](self->_airPodsServiceclient, "dispatchQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__BTSDeviceConfigController_setCaseSoundEnabled_specifier___block_invoke;
  block[3] = &unk_1EA29AA90;
  block[4] = self;
  v18 = v8 ^ 1;
  v13 = v10;
  v16 = v10;
  objc_copyWeak(&v17, &location);
  dispatch_async(v12, block);

  sharedBluetoothSettingsLogComponent();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v21 = v8;
    _os_log_impl(&dword_1DB30C000, v14, OS_LOG_TYPE_DEFAULT, "Case Sound: setCaseSoundEnabled %d", buf, 8u);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __59__BTSDeviceConfigController_setCaseSoundEnabled_specifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;
  char v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 1568);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[2] = __59__BTSDeviceConfigController_setCaseSoundEnabled_specifier___block_invoke_2;
  v6[3] = &unk_1EA29AA68;
  v5 = *(unsigned __int8 *)(a1 + 56);
  v6[1] = 3221225472;
  v6[4] = v2;
  v9 = v5;
  v7 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  objc_msgSend(v4, "setSilentMode:completionHandler:", v5, v6);
  objc_destroyWeak(&v8);

}

void __59__BTSDeviceConfigController_setCaseSoundEnabled_specifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1566) = 0;
  if (v3)
  {
    sharedBluetoothSettingsLogComponent();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __59__BTSDeviceConfigController_setCaseSoundEnabled_specifier___block_invoke_2_cold_1();

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1565) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1564) = *(_BYTE *)(a1 + 56);
  }
  v5 = *(NSObject **)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__BTSDeviceConfigController_setCaseSoundEnabled_specifier___block_invoke_1300;
  v6[3] = &unk_1EA29A9F0;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  v6[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v5, v6);
  objc_destroyWeak(&v7);

}

void __59__BTSDeviceConfigController_setCaseSoundEnabled_specifier___block_invoke_1300(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("CASE_SOUND_ID"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "reloadSpecifierID:animated:", v2, 1);

}

- (void)updateSerialNumberSpecifier:(id)a3
{
  char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char **v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char *v13;

  v4 = (char *)a3;
  if (!v4)
    goto LABEL_17;
  v13 = v4;
  objc_msgSend(v4, "propertyForKey:", CFSTR("SERIAL_NUMBER_TYPE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  v7 = (((int)v6 + 1) % 3);
  if ((_DWORD)v7 == (_DWORD)v6)
  {
LABEL_13:
    v7 = v6;
    goto LABEL_16;
  }
  v8 = &selRef_getSystemSerialNumber_;
  while ((_DWORD)v7 == 2)
  {
    -[BTSDeviceConfigController getBudRightSerialNumber:](self, "getBudRightSerialNumber:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v8 = &selRef_getBudRightSerialNumber_;
      goto LABEL_15;
    }
LABEL_12:
    v7 = (((int)v7 + 1) % 3);
    if ((_DWORD)v7 == (_DWORD)v6)
      goto LABEL_13;
  }
  if ((_DWORD)v7 != 1)
  {
    if (!(_DWORD)v7)
    {
      -[BTSDeviceConfigController getSystemSerialNumber:](self, "getSystemSerialNumber:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        goto LABEL_15;
    }
    goto LABEL_12;
  }
  -[BTSDeviceConfigController getBudLeftSerialNumber:](self, "getBudLeftSerialNumber:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_12;
  v8 = &selRef_getBudLeftSerialNumber_;
LABEL_15:
  *(_QWORD *)&v13[*MEMORY[0x1E0D805C0]] = *v8;
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setProperty:forKey:", v12, CFSTR("SERIAL_NUMBER_TYPE"));

  v4 = v13;
LABEL_17:

}

- (void)updateVersionSpecifier:(id)a3
{
  char *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  char *v14;

  v4 = (char *)a3;
  if (v4)
  {
    v14 = v4;
    objc_msgSend(v4, "propertyForKey:", CFSTR("VERSION_TYPE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v5, "intValue");
LABEL_3:

    do
    {
      while (1)
      {
        v6 = (((int)v6 + 1) % 3);
        if ((_DWORD)v6 == 1)
          break;
        if ((_DWORD)v6 == 2)
        {
          -[BTSDeviceConfigController getANCAssetVersion:](self, "getANCAssetVersion:", v14);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "length");
          goto LABEL_3;
        }
        if (!(_DWORD)v6)
        {
          *(_QWORD *)&v14[*MEMORY[0x1E0D805C0]] = sel_getBudFirmwareVersion_;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          v11 = CFSTR("ACCESSORY_ABOUT_BUD_VERSION_FIRMWARE");
          goto LABEL_11;
        }
      }
      -[BTSDeviceConfigController getCaseFirmwareVersion:](self, "getCaseFirmwareVersion:", v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");

    }
    while (v8 < 2);
    *(_QWORD *)&v14[*MEMORY[0x1E0D805C0]] = sel_getCaseFirmwareVersion_;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = CFSTR("ACCESSORY_ABOUT_CASE_VERSION_FIRMWARE");
LABEL_11:
    objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1EA29D890, CFSTR("DeviceConfig"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setName:", v12);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setProperty:forKey:", v13, CFSTR("VERSION_TYPE"));

    v4 = v14;
  }

}

- (id)getAnswerCallOption:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PRESS_ONCE"), &stru_1EA29D890, CFSTR("FeatureConfig-CallControls"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)smartRoutingIndicationForRealityDevice:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SMARTROUTE_AUTOMATIC"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getModelName:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  uint64_t v18;
  void *v19;
  id v20;

  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "productId");

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ACCESSORY_MODEL_NAME_%d"), (v4 - 0x2000));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v5, &stru_1EA29D890, CFSTR("DeviceConfig"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == 8202 || v4 == 8223)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ACCESSORY_MODEL_NAME_10"), &stru_1EA29D890, CFSTR("DeviceConfig-b515"));
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  else if (v4 == 8208)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("ACCESSORY_MODEL_NAME_16");
    v14 = CFSTR("DeviceConfig-B372");
LABEL_27:
    objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1EA29D890, v14);
    v18 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v18;
    goto LABEL_28;
  }
  switch(v4)
  {
    case 8209:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("ACCESSORY_MODEL_NAME_17");
      v14 = CFSTR("DeviceConfig-B507");
      goto LABEL_27;
    case 8210:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("ACCESSORY_MODEL_NAME_18");
      v14 = CFSTR("DeviceConfig-B494");
      goto LABEL_27;
    case 8211:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("ACCESSORY_MODEL_NAME_19");
      v14 = CFSTR("DeviceConfig-B688");
      goto LABEL_27;
    case 8212:
    case 8228:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("ACCESSORY_MODEL_NAME_20");
      v14 = CFSTR("DeviceConfig-B698");
      goto LABEL_27;
    case 8214:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("ACCESSORY_MODEL_NAME_22");
      v14 = CFSTR("DeviceConfig-B607");
      goto LABEL_27;
    case 8215:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("ACCESSORY_MODEL_NAME_23");
      v14 = CFSTR("DeviceConfig-B453");
      goto LABEL_27;
    case 8217:
    case 8222:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ACCESSORY_MODEL_NAME_25"), &stru_1EA29D890, CFSTR("DeviceConfig-B768"));
      v16 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v16;
      break;
    case 8218:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("ACCESSORY_MODEL_NAME_26");
      v14 = CFSTR("DeviceConfig-B487");
      goto LABEL_27;
    case 8221:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("ACCESSORY_MODEL_NAME_42");
      v14 = CFSTR("DeviceConfig-B498-v2");
      goto LABEL_27;
    case 8229:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("ACCESSORY_MODEL_NAME_24");
      v14 = CFSTR("DeviceConfig-B465");
      goto LABEL_27;
    case 8230:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("ACCESSORY_MODEL_NAME_38");
      v14 = CFSTR("DeviceConfig-B463");
      goto LABEL_27;
    default:
      break;
  }
  if (v4 == 8224 || v4 == 8219)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("ACCESSORY_MODEL_NAME_27");
    v14 = CFSTR("DeviceConfig-B768");
    goto LABEL_27;
  }
LABEL_28:
  if ((unint64_t)objc_msgSend(v7, "length") <= 1)
    v19 = 0;
  else
    v19 = v7;
  v20 = v19;

  return v20;
}

- (id)getModelNumber:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[NSArray objectAtIndex:](self->_versionInfo, "objectAtIndex:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByApplyingTransform:reverse:", CFSTR("Any-Hex/Java"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v4, "length") <= 1)
    v5 = 0;
  else
    v5 = v4;
  v6 = v5;

  return v6;
}

- (id)getSystemSerialNumber:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[NSArray objectAtIndex:](self->_versionInfo, "objectAtIndex:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByApplyingTransform:reverse:", CFSTR("Any-Hex/Java"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v4, "length") <= 1)
    v5 = 0;
  else
    v5 = v4;
  v6 = v5;

  return v6;
}

- (id)getBudLeftSerialNumber:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[NSArray objectAtIndex:](self->_versionInfo, "objectAtIndex:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByApplyingTransform:reverse:", CFSTR("Any-Hex/Java"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v4, "length") < 2)
  {
    v8 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ACCESSORY_ABOUT_SERIAL_NUMBER_LEFT"), &stru_1EA29D890, CFSTR("DeviceConfig"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)getBudRightSerialNumber:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[NSArray objectAtIndex:](self->_versionInfo, "objectAtIndex:", 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByApplyingTransform:reverse:", CFSTR("Any-Hex/Java"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v4, "length") < 2)
  {
    v8 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ACCESSORY_ABOUT_SERIAL_NUMBER_RIGHT"), &stru_1EA29D890, CFSTR("DeviceConfig"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)getBudFirmwareVersion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[NSArray objectAtIndex:](self->_versionInfo, "objectAtIndex:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByApplyingTransform:reverse:", CFSTR("Any-Hex/Java"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v4, "length") <= 1)
    v5 = 0;
  else
    v5 = v4;
  v6 = v5;

  return v6;
}

- (id)getANCAssetVersion:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[NSString stringByApplyingTransform:reverse:](self->_ancAssetVersion, "stringByApplyingTransform:reverse:", CFSTR("Any-Hex/Java"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "length") <= 1)
    v4 = 0;
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

- (id)getCaseName:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[NSDictionary objectForKey:](self->_caseInfo, "objectForKey:", CFSTR("CaseInfoName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v3, "length") - 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR(")"));

  v6 = objc_msgSend(v3, "length");
  if (v5)
  {
    objc_msgSend(v3, "substringToIndex:", v6 - 6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CASE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("(%@)"), v9);
  }
  else
  {
    objc_msgSend(v3, "substringToIndex:", v6 - 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CASE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("%@"), v9);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (unint64_t)objc_msgSend(v10, "length") >= 2)
  {
    objc_msgSend(v10, "stringByApplyingTransform:reverse:", CFSTR("Any-Hex/Java"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)getCaseFirmwareVersion:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_caseInfo, "objectForKey:", CFSTR("CaseInfoVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (unint64_t)objc_msgSend(v3, "length") >= 2)
  {
    objc_msgSend(v3, "stringByApplyingTransform:reverse:", CFSTR("Any-Hex/Java"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  _TtC16HeadphoneConfigs23ModernBatteryStatusView *batteryStatusView;
  _QWORD block[5];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BTSDeviceConfigController;
  v4 = a3;
  -[BTSDeviceConfigController traitCollectionDidChange:](&v15, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  -[BTSDeviceConfigController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
  {
    -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[HPSProductUtils isAppleHeadphone:](HPSProductUtils, "isAppleHeadphone:", v8))
    {
      -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isTemporaryPaired");

      if ((v10 & 1) == 0)
      {
        -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isGenuineAirPods");

        if (v12)
        {
          batteryStatusView = self->_batteryStatusView;
          if (batteryStatusView)
          {
            self->_batteryStatusView = 0;

          }
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __54__BTSDeviceConfigController_traitCollectionDidChange___block_invoke;
          block[3] = &unk_1EA29A770;
          block[4] = self;
          dispatch_async(MEMORY[0x1E0C80D38], block);
        }
      }
    }
    else
    {

    }
  }
}

uint64_t __54__BTSDeviceConfigController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateBatteryStatus");
}

- (void)updateASKHeader
{
  __assert_rtn("-[BTSDeviceConfigController updateASKHeader]", "BTSDeviceConfigController.m", 5236, "[[NSThread currentThread] isMainThread]");
}

- (id)classicSetupSpecifiers
{
  NSObject *v3;
  NSObject *v4;
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
  _BOOL4 devicePendingCTKDConnection;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  uint8_t buf[8];
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    sharedBluetoothSettingsLogComponent();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "AccessorySetupKit feature flag not enabled", buf, 2u);
    }
    goto LABEL_12;
  }
  -[BTSDeviceConfigController leDevice](self, "leDevice");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3
    || (!-[NSObject isManagedByDeviceAccess](v3, "isManagedByDeviceAccess")
     || (-[NSObject shouldDenyIncomingClassicConnection](v4, "shouldDenyIncomingClassicConnection") & 1) == 0)
    && !self->_devicePendingCTKDConnection)
  {
LABEL_12:
    v24 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_13;
  }
  v5 = (void *)MEMORY[0x1E0D804E8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", &stru_1EA29D890, &stru_1EA29D890);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groupSpecifierWithID:", v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D804E8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CLASSIC_SETUP_TITLE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, self, 0, 0, 0, 4, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setIdentifier:", CFSTR("CLASSIC_SETUP_TITLE_ID"));
  v12 = (void *)MEMORY[0x1E0D804E8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CLASSIC_SETUP_BODY"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, 0, 0, 0, 0, -1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setIdentifier:", CFSTR("CLASSIC_SETUP_BODY_ID"));
  objc_msgSend(v15, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80700]);
  v16 = (void *)MEMORY[0x1E0D804E8];
  devicePendingCTKDConnection = self->_devicePendingCTKDConnection;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (devicePendingCTKDConnection)
    v20 = CFSTR("CLASSIC_SETUP_BUTTON_CONNECTING");
  else
    v20 = CFSTR("CLASSIC_SETUP_BUTTON");
  objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_1EA29D890, CFSTR("DeviceConfig"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v21, self, 0, 0, 0, 13, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  objc_msgSend(v22, "setButtonAction:", sel_allowClassicConnection);
  objc_msgSend(v22, "setIdentifier:", CFSTR("CLASSIC_SETUP_BUTTON_ID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !self->_devicePendingCTKDConnection);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setProperty:forKey:", v23, *MEMORY[0x1E0D80808]);

  v28[0] = v26;
  v28[1] = v11;
  v28[2] = v15;
  v28[3] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v24;
}

- (void)updateBatteryStatus
{
  __assert_rtn("-[BTSDeviceConfigController updateBatteryStatus]", "BTSDeviceConfigController.m", 5308, "[[NSThread currentThread] isMainThread]");
}

- (void)getFindMyUrl
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "Invalid device address. Using default FindMy URL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)spatialAudioProfileUpdateHandler:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__BTSDeviceConfigController_spatialAudioProfileUpdateHandler___block_invoke;
  block[3] = &unk_1EA29A770;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __62__BTSDeviceConfigController_spatialAudioProfileUpdateHandler___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "headphoneObserver");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadAll");

}

- (void)triggerSpatialProfileFeedback:(id)a3
{
  NSObject *v4;
  __CFString *v5;
  id v6;
  void *v7;
  __CFString *v8;
  int v9;
  _BOOL4 v10;
  NSObject *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  NSObject *v15;
  void *v16;
  int v17;
  const __CFString *v18;
  __int16 v19;
  __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Feedback: Received Enrollment Not Completed Notification", (uint8_t *)&v17, 2u);
  }

  CFPreferencesAppSynchronize(CFSTR("com.apple.springboard"));
  CFPreferencesCopyAppValue(CFSTR("LastSpatialProfileFeedbackDate"), CFSTR("com.apple.springboard"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v6, "setDateFormat:", CFSTR("yyyyMMdd"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v7);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v9 = MGGetBoolAnswer();
  v10 = v9 && (!v5 || (-[__CFString isEqualToString:](v8, "isEqualToString:", v5) & 1) == 0);
  sharedBluetoothSettingsLogComponent();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = CFSTR("Null");
    if (v5)
      v12 = v5;
    v17 = 138413058;
    v18 = v12;
    if (v9)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v13;
    if (v10)
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    v23 = 2112;
    v24 = v14;
    _os_log_impl(&dword_1DB30C000, v11, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Feedback: Last Feedback Date: %@, Current Feedback Date: %@, Internal Build: %@, Show Feedback: %@", (uint8_t *)&v17, 0x2Au);
  }

  if (v10)
  {
    sharedBluetoothSettingsLogComponent();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v8;
      _os_log_impl(&dword_1DB30C000, v15, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Feedback: Trigger feedback and update date: %@", (uint8_t *)&v17, 0xCu);
    }

    +[HPSSpatialProfileFeedback getDraftViewController](_TtC16HeadphoneConfigs25HPSSpatialProfileFeedback, "getDraftViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTSDeviceConfigController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);
    CFPreferencesSetAppValue(CFSTR("LastSpatialProfileFeedbackDate"), v8, CFSTR("com.apple.springboard"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.springboard"));

  }
}

- (BOOL)supportsFirmwareReleaseNotes
{
  void *v2;
  int v3;

  -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productId");

  return ((v3 - 8202) < 0x1B) & (0x4200631u >> (v3 - 10));
}

- (BOOL)shouldShowFindMyNetworkAlert
{
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  _BOOL4 v6;
  const char *v7;
  const char *v8;
  _BOOL4 findMySupport;
  const char *v10;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (+[HPSProductUtils isRealityDevice](HPSProductUtils, "isRealityDevice"))
  {
    sharedBluetoothSettingsLogComponent();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Find My Network: returning, feature not supported on this platform", (uint8_t *)&v12, 2u);
    }
    LOBYTE(v4) = 0;
  }
  else
  {
    -[BluetoothDeviceProtocol classicDevice](self->_device, "classicDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[HPSProductUtils isFeatureSupported:byDevice:](HPSProductUtils, "isFeatureSupported:byDevice:", 0, v5);

    v4 = 0;
    if (v6)
      v4 = !self->_findMySupport;
    sharedBluetoothSettingsLogComponent();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = "No";
      if (v4)
        v8 = "Yes";
      else
        v8 = "No";
      findMySupport = self->_findMySupport;
      if (v6)
        v10 = "Yes";
      else
        v10 = "No";
      v12 = 136315650;
      v13 = v8;
      v14 = 2080;
      if (findMySupport)
        v7 = "Yes";
      v15 = v10;
      v16 = 2080;
      v17 = v7;
      _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Find My Network: Should Show Alert: %s, Feature: %s, Support: %s", (uint8_t *)&v12, 0x20u);
    }
  }

  return v4;
}

- (void)showFindMyNetworkAlert
{
  void *v3;
  void *v4;
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
  id v16;

  v3 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FIND_MY_NETWORK_ALERT_TITLE"), &stru_1EA29D890, CFSTR("DeviceConfig-B698"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FIND_MY_NETWORK_ALERT_DESC"), &stru_1EA29D890, CFSTR("DeviceConfig-B698"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 0, &__block_literal_global_1392);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("IMPORTANT_MSG_LEARN_MORE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 0, &__block_literal_global_1393);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "addAction:", v11);
  objc_msgSend(v16, "addAction:", v15);
  objc_msgSend(v16, "setPreferredAction:", v11);
  -[BTSDeviceConfigController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);

}

void __51__BTSDeviceConfigController_showFindMyNetworkAlert__block_invoke_2()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/ht210982?cid=mc-ols-find-my-article_ht210982-settings_ui-07122023"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openURL:withOptions:", v1, 0);

}

- (id)device
{
  return self->_device;
}

- (_TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver)headphoneObserver
{
  _TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver *headphoneObserver;
  void *v4;
  void *v5;
  void *v6;
  _TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver *v7;
  void *v8;
  uint64_t v9;
  _TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver *v10;
  _TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  headphoneObserver = self->_headphoneObserver;
  if (!headphoneObserver)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80628]), "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HPSDevice deviceKey](HPSDevice, "deviceKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    location = 0;
    objc_initWeak(&location, self);
    v7 = [_TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver alloc];
    objc_msgSend(v6, "headphoneDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __46__BTSDeviceConfigController_headphoneObserver__block_invoke;
    v15[3] = &unk_1EA29A7C0;
    objc_copyWeak(&v16, &location);
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __46__BTSDeviceConfigController_headphoneObserver__block_invoke_1395;
    v13[3] = &unk_1EA29A7C0;
    objc_copyWeak(&v14, &location);
    v10 = -[BTSHeadphoneDevicePropertyObserver initWithDevice:onChangeAction:onChangeReloadAllAction:](v7, "initWithDevice:onChangeAction:onChangeReloadAllAction:", v8, v15, v13);
    v11 = self->_headphoneObserver;
    self->_headphoneObserver = v10;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

    headphoneObserver = self->_headphoneObserver;
  }
  return headphoneObserver;
}

void __46__BTSDeviceConfigController_headphoneObserver__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  id v5;
  id v6;
  uint8_t v7[16];

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Headphone Config: Reload observed specifiers for value change", v7, 2u);
  }

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "reloadSpecifierID:", CFSTR("LISTENING_MODE_ID"));

  v5 = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "reloadSpecifierID:", CFSTR("SPEECH_DETECTION_ID"));

  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "reloadSpecifierID:", CFSTR("ADAPTIVE_VOLUME_ID"));

}

void __46__BTSDeviceConfigController_headphoneObserver__block_invoke_1395(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Headphone Config: Reload all specifiers for value change", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadSpecifiers");

}

- (CRPairedVehicleManager)vehicleManager
{
  return self->_vehicleManager;
}

- (void)setVehicleManager:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleManager, a3);
}

- (CRCarPlayPreferences)carplayPreferences
{
  return self->_carplayPreferences;
}

- (void)setCarplayPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_carplayPreferences, a3);
}

- (unint64_t)cachedCarplayPairingStatus
{
  return self->_cachedCarplayPairingStatus;
}

- (void)setCachedCarplayPairingStatus:(unint64_t)a3
{
  self->_cachedCarplayPairingStatus = a3;
}

- (PowerUISmartChargeClientAudioAccessories)smartChargeClient
{
  return self->_smartChargeClient;
}

- (void)setSmartChargeClient:(id)a3
{
  objc_storeStrong((id *)&self->_smartChargeClient, a3);
}

- (NDOACController)ndoController
{
  return self->_ndoController;
}

- (void)setNdoController:(id)a3
{
  objc_storeStrong((id *)&self->_ndoController, a3);
}

- (void)setHeadphoneObserver:(id)a3
{
  objc_storeStrong((id *)&self->_headphoneObserver, a3);
}

- (PSTableCell)listeningModeCell
{
  return self->_listeningModeCell;
}

- (void)setListeningModeCell:(id)a3
{
  objc_storeStrong((id *)&self->_listeningModeCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeningModeCell, 0);
  objc_storeStrong((id *)&self->_headphoneObserver, 0);
  objc_storeStrong((id *)&self->_ndoController, 0);
  objc_storeStrong((id *)&self->_smartChargeClient, 0);
  objc_storeStrong((id *)&self->_carplayPreferences, 0);
  objc_storeStrong((id *)&self->_vehicleManager, 0);
  objc_storeStrong((id *)&self->_adaptiveStrength, 0);
  objc_storeStrong((id *)&self->_accessoryHeaderController, 0);
  objc_storeStrong((id *)&self->_deviceAnalytics, 0);
  objc_storeStrong((id *)&self->_airPodsServiceclient, 0);
  objc_storeStrong((id *)&self->_findMyUrl, 0);
  objc_storeStrong((id *)&self->_batteryStatusView, 0);
  objc_storeStrong((id *)&self->_ctkdLeDevice, 0);
  objc_storeStrong((id *)&self->_lastSelectedSyncGroup, 0);
  objc_storeStrong((id *)&self->_deviceTypeSpecifiers, 0);
  objc_storeStrong((id *)&self->_accessoryInfoSpecifiers, 0);
  objc_storeStrong((id *)&self->_nameControlSpecifiers, 0);
  objc_storeStrong((id *)&self->_ancsControlSpecifiers, 0);
  objc_storeStrong((id *)&self->_accessoryFirmwareSpecifiers, 0);
  objc_storeStrong((id *)&self->_aacpControlSpecifiers, 0);
  objc_storeStrong((id *)&self->_syncGroupsSpecifiers, 0);
  objc_storeStrong((id *)&self->_syncContactsSpecifiers, 0);
  objc_storeStrong((id *)&self->_messagingSpecifiers, 0);
  objc_storeStrong((id *)&self->_controlGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_caseInfo, 0);
  objc_storeStrong((id *)&self->_ancAssetVersion, 0);
  objc_storeStrong((id *)&self->_versionInfo, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)handleTapOnLabel
{
  BTSDeviceConfigController *v2;
  void *v3;
  id v4;

  v2 = self;
  v3 = (void *)sub_1DB3BC31C();
  v4 = objc_msgSend((id)objc_opt_self(), sel_presenterForPrivacySplashWithIdentifier_, v3);

  if (v4)
    objc_msgSend(v4, sel_setPresentingViewController_, v2);
  objc_msgSend(v4, sel_present);

}

- (NSArray)b498Specifiers
{
  BTSDeviceConfigController *v2;
  void *v3;

  v2 = self;
  BTSDeviceConfigController.b498Specifiers.getter();

  sub_1DB38507C(0, &qword_1F02DA480);
  v3 = (void *)sub_1DB3BC3B8();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)addTopLevelEntryWithHpDevice:(id)a3
{
  -[BTSDeviceConfigController reloadSpecifiers](self, sel_reloadSpecifiers, a3);
}

- (void)removeTopLevelEntryWithHpDevice:(id)a3
{
  id v4;
  BTSDeviceConfigController *v5;

  v4 = a3;
  v5 = self;
  BTSDeviceConfigController.removeTopLevelEntry(hpDevice:)();

}

- (void)updateTopLevelEntryWithHpDevice:(id)a3
{
  id v4;
  BTSDeviceConfigController *v5;

  v4 = a3;
  v5 = self;
  _sSo25BTSDeviceConfigControllerC16HeadphoneConfigsE19updateTopLevelEntry8hpDevicey0D7Manager0dK0C_tF_0();

}

- (BOOL)adaptiveVolumeSupported
{
  BTSDeviceConfigController *v2;
  char v3;

  v2 = self;
  v3 = BTSDeviceConfigController.adaptiveVolumeSupported.getter();

  return v3 & 1;
}

- (BOOL)conversationDetectSupported
{
  BTSDeviceConfigController *v2;
  char v3;

  v2 = self;
  v3 = BTSDeviceConfigController.conversationDetectSupported.getter();

  return v3 & 1;
}

- (BOOL)supportAutoAncStrength
{
  BTSDeviceConfigController *v2;
  id v3;
  char v4;
  BTSDeviceConfigController *v5;

  v2 = self;
  v3 = -[BTSDeviceConfigController device](v2, sel_device);
  v4 = (char)v3;
  if (v3)
  {
    v5 = (BTSDeviceConfigController *)sub_1DB397518();
    swift_unknownObjectRelease();
    if (v5)
    {
      v4 = sub_1DB3BBE6C();

      v2 = v5;
    }
    else
    {
      v4 = 0;
    }
  }

  return v4 & 1;
}

- (BOOL)shouldShowCaseSoundForNewAccessories:(id)a3 productID:(int64_t)a4
{
  BTSDeviceConfigController *v6;
  _BYTE v8[32];

  swift_unknownObjectRetain();
  v6 = self;
  sub_1DB3BC5B0();
  swift_unknownObjectRelease();
  LOBYTE(a4) = sub_1DB397EAC((uint64_t)v8, a4);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  return a4 & 1;
}

- (BOOL)shouldShowLoudSoundReduction
{
  return 1;
}

- (NSArray)turnOffListeningModeSpecifiers
{
  sub_1DB38507C(0, &qword_1F02DA480);
  return (NSArray *)(id)sub_1DB3BC3B8();
}

- (void)deviceSupportsSync:.cold.1()
{
  __assert_rtn("-[BTSDeviceConfigController deviceSupportsSync:]", "BTSDeviceConfigController.m", 1089, "_syncSettings.supported");
}

- (void)setUserSelectedDeviceType:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "intValue");
  OUTLINED_FUNCTION_9(&dword_1DB30C000, v1, v2, "Failed to set device type to set device type to %d", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1();
}

- (void)doubleTapActionLeft
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1DB30C000, v2, v3, "Double tap action left : %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

- (void)doubleTapActionRight
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1DB30C000, v2, v3, "Double tap action right : %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

- (void)setGestureMode:(id *)a1 specifier:.cold.1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_1DB30C000, v2, v3, "Cannot set gesture mode for device %@ with specifier : %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12();
}

- (void)optimizedBatteryChargingEnabled
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB30C000, v0, v1, "Unable to fetch smart charging status for accessory with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setOptimizedBatteryChargingEnabled:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "PowerUIClient is NULL. Cannot set OBC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __64__BTSDeviceConfigController_setOptimizedBatteryChargingEnabled___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB30C000, v0, v1, "Failed to disable smart charging: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __64__BTSDeviceConfigController_setOptimizedBatteryChargingEnabled___block_invoke_571_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB30C000, v0, v1, "Failed to temporarily disable smart charging: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)sealDetect
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "SealDetect : getter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)sealDetectSet:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "SealDetect : setter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __48__BTSDeviceConfigController_refreshFindMyStatus__block_invoke_cold_1(void *a1, NSObject *a2)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136315394;
  v4 = "Yes";
  v5 = 1024;
  v6 = objc_msgSend(a1, "code");
  _os_log_error_impl(&dword_1DB30C000, a2, OS_LOG_TYPE_ERROR, "FindMy Status: Fetch Completed: Error: %s, Error code: %d", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_7();
}

- (void)setFindMyEnable:specifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "FindMy Status: Invalid Address, Cannot Set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setFindMyEnable:specifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "FindMy Status: Invalid Address Data, Cannot Set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setFindMyEnable:specifier:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "FindMy Status: Invalid Incoming Value, Cannot Set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setFindMyEnable:specifier:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "FindMy Status: Invalid Hex Address, Cannot Set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __55__BTSDeviceConfigController_setFindMyEnable_specifier___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "code");
  OUTLINED_FUNCTION_9(&dword_1DB30C000, v1, v2, "FindMy Status: Set Error code: %d", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1();
}

- (void)listeningModeConfigSelected:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DB30C000, v0, v1, "Invalid listening mode configuration. Early return", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)specifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(a1, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a2, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HPS_DeviceInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8(&dword_1DB30C000, v5, v6, "HeadphoneConfigs: BTSDeviceClassic does not have undlyering device! Popping user back and reloading TopLevel %@ %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_12();
}

- (void)adaptiveVolumeMode
{
  OUTLINED_FUNCTION_0_0(&dword_1DB30C000, a1, a3, "Adaptive Volume: adaptiveVolumeMode %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)nicknameEnabled
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 1376);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1DB30C000, a2, OS_LOG_TYPE_DEBUG, "Majestic Enabled - %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __41__BTSDeviceConfigController_getSoundMode__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB30C000, v0, v1, "Case Sound: getSilentModeWithCompletionHandler failed due to %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __59__BTSDeviceConfigController_setCaseSoundEnabled_specifier___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB30C000, v0, v1, "Case Sound: setSilentMode failed due to %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
