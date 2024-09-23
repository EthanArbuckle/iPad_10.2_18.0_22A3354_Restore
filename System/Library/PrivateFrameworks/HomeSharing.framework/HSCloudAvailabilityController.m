@implementation HSCloudAvailabilityController

- (HSCloudAvailabilityController)init
{
  HSCloudAvailabilityController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  RadiosPreferences *v5;
  RadiosPreferences *radiosPreferences;
  uint64_t v7;
  CoreTelephonyClient *telephonyClient;
  CoreTelephonyClient *v9;
  void *v10;
  id v11;
  NSObject *v12;
  HSCloudAvailabilityController *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _QWORD v26[4];
  HSCloudAvailabilityController *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, const __CFString *);
  void *v31;
  __int128 *p_buf;
  _QWORD handler[5];
  id v34;
  objc_super v35;
  uint8_t v36[4];
  int v37;
  __int16 v38;
  int v39;
  __int128 buf;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  HSCloudAvailabilityController *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v35.receiver = self;
  v35.super_class = (Class)HSCloudAvailabilityController;
  v2 = -[HSCloudAvailabilityController init](&v35, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.HomeSharing.HSCloudAvailabilityController.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = (RadiosPreferences *)objc_alloc_init(MEMORY[0x24BE04788]);
    radiosPreferences = v2->_radiosPreferences;
    v2->_radiosPreferences = v5;

    -[RadiosPreferences setDelegate:](v2->_radiosPreferences, "setDelegate:", v2);
    v2->_isAirplaneModeActive = -[RadiosPreferences airplaneMode](v2->_radiosPreferences, "airplaneMode");
    v2->_isAutoDownloadOnCellularAllowed = -[HSCloudAvailabilityController _uncachedIsAutoDownloadOnCellularAllowed](v2, "_uncachedIsAutoDownloadOnCellularAllowed");
    v2->_isShowingAllMusic = -[HSCloudAvailabilityController _uncachedIsShowingAllMusic](v2, "_uncachedIsShowingAllMusic");
    v2->_isShowingAllVideo = -[HSCloudAvailabilityController _uncachedIsShowingAllVideo](v2, "_uncachedIsShowingAllVideo");
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", v2->_accessQueue);
    telephonyClient = v2->_telephonyClient;
    v2->_telephonyClient = (CoreTelephonyClient *)v7;

    v9 = v2->_telephonyClient;
    v34 = 0;
    -[CoreTelephonyClient getInternetConnectionStateSync:](v9, "getInternetConnectionStateSync:", &v34);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v34;
    if (v11)
    {
      v12 = os_log_create("com.apple.amp.HomeSharing", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_20AA9E000, v12, OS_LOG_TYPE_ERROR, "HSCloudAvailabilityController init [CoreTelephonyClient getInternetConnectionStateSync] encountered error=%{public}@", (uint8_t *)&buf, 0xCu);
      }

      v2->_isCellularDataActive = 0;
    }
    else
    {
      v2->_isCellularDataActive = objc_msgSend(v10, "state") == 2;
    }
    -[CoreTelephonyClient setDelegate:](v2->_telephonyClient, "setDelegate:", v2);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__664;
    v43 = __Block_byref_object_dispose__665;
    v13 = v2;
    v44 = v13;
    v14 = MEMORY[0x24BDAC760];
    v15 = v2->_accessQueue;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __37__HSCloudAvailabilityController_init__block_invoke;
    handler[3] = &unk_24C364608;
    handler[4] = &buf;
    v13->_preferencesChangedNotifyTokenIsValid = notify_register_dispatch("com.apple.mobileipod-prefsChanged", &v13->_preferencesChangedNotifyToken, v15, handler) == 0;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v13, sel__applicationWillEnterForeground_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);

    v28 = v14;
    v29 = 3221225472;
    v30 = __37__HSCloudAvailabilityController_init__block_invoke_2;
    v31 = &unk_24C364630;
    p_buf = &buf;
    v13->_ctServerConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();
    v17 = _CTServerConnectionRegisterForNotification();
    if ((_DWORD)v17)
    {
      v18 = os_log_create("com.apple.amp.HomeSharing", "Availability");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v36 = 67109376;
        v37 = v17;
        v38 = 1024;
        v39 = HIDWORD(v17);
        _os_log_impl(&dword_20AA9E000, v18, OS_LOG_TYPE_ERROR, "Error (domain %d, code %d) registering for PerAppNetworkDataAccessPolicyChangedNotification", v36, 0xEu);
      }

    }
    +[HSWiFiManager sharedWiFiManager](HSWiFiManager, "sharedWiFiManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_isWiFiEnabled = objc_msgSend(v19, "isWiFiEnabled");

    +[HSWiFiManager sharedWiFiManager](HSWiFiManager, "sharedWiFiManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_isWiFiAssociated = objc_msgSend(v20, "isWiFiAssociated");

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[HSWiFiManager sharedWiFiManager](HSWiFiManager, "sharedWiFiManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v13, sel__wifiStateDidChangeNotification_, CFSTR("HSWiFiManagerWiFiDidChangeNotification"), v22);

    objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "registerObserver:", v13);
    v13->_isNetworkReachable = objc_msgSend(v23, "isRemoteServerLikelyReachable");
    v13->_networkType = objc_msgSend(v23, "networkType");
    v13->_networkReachabilityObservationCount = 0;
    -[HSCloudAvailabilityController _onQueue_updateCanShowCloudDownloadButtonsWithNotification:](v13, "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 0);
    -[HSCloudAvailabilityController _onQueue_updateCanShowCloudTracksWithNotification:](v13, "_onQueue_updateCanShowCloudTracksWithNotification:", 0);
    v13->_isCellularDataRestrictedForMusic = 1;
    v24 = v2->_accessQueue;
    v26[0] = v14;
    v26[1] = 3221225472;
    v26[2] = __37__HSCloudAvailabilityController_init__block_invoke_29;
    v26[3] = &unk_24C364D10;
    v27 = v13;
    dispatch_async(v24, v26);

    _Block_object_dispose(&buf, 8);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[CoreTelephonyClient setDelegate:](self->_telephonyClient, "setDelegate:", 0);
  -[RadiosPreferences setDelegate:](self->_radiosPreferences, "setDelegate:", 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);

  if (self->_preferencesChangedNotifyTokenIsValid)
    notify_cancel(self->_preferencesChangedNotifyToken);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HSWiFiManager sharedWiFiManager](HSWiFiManager, "sharedWiFiManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("HSWiFiManagerWiFiDidChangeNotification"), v5);

  if (self->_ctServerConnection)
  {
    _CTServerConnectionUnregisterForNotification();
    CFRelease(self->_ctServerConnection);
  }
  v6.receiver = self;
  v6.super_class = (Class)HSCloudAvailabilityController;
  -[HSCloudAvailabilityController dealloc](&v6, sel_dealloc);
}

- (BOOL)hasProperNetworkConditionsToPlayMedia
{
  if (!self->_isNetworkReachable)
    return 0;
  if (ICEnvironmentNetworkTypeIsCellular())
    return self->_isAutoDownloadOnCellularAllowed;
  return 1;
}

- (BOOL)hasProperNetworkConditionsToShowCloudMedia
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __75__HSCloudAvailabilityController_hasProperNetworkConditionsToShowCloudMedia__block_invoke;
  v5[3] = &unk_24C364D38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isCellularDataRestrictedForMusic
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __65__HSCloudAvailabilityController_isCellularDataRestrictedForMusic__block_invoke;
  v5[3] = &unk_24C364D38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)shouldProhibitMusicActionForCurrentNetworkConditions
{
  int IsCellular;

  if (self->_isNetworkReachable)
  {
    IsCellular = ICEnvironmentNetworkTypeIsCellular();
    if (IsCellular)
      LOBYTE(IsCellular) = -[HSCloudAvailabilityController isCellularDataRestrictedForMusic](self, "isCellularDataRestrictedForMusic");
  }
  else
  {
    LOBYTE(IsCellular) = 1;
  }
  return IsCellular;
}

- (BOOL)isCellularDataRestrictedForVideos
{
  _BOOL4 v2;
  NSObject *v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = -[HSCloudAvailabilityController _isAutoDownloadOnCellularAllowed](self, "_isAutoDownloadOnCellularAllowed");
  v3 = os_log_create("com.apple.amp.HomeSharing", "Availability");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_20AA9E000, v3, OS_LOG_TYPE_DEFAULT, "Videos allow cellular data: %d", (uint8_t *)v5, 8u);
  }

  return !v2;
}

- (BOOL)shouldProhibitVideosActionForCurrentNetworkConditions
{
  int IsCellular;

  if (self->_isNetworkReachable)
  {
    IsCellular = ICEnvironmentNetworkTypeIsCellular();
    if (IsCellular)
      LOBYTE(IsCellular) = -[HSCloudAvailabilityController isCellularDataRestrictedForVideos](self, "isCellularDataRestrictedForVideos");
  }
  else
  {
    LOBYTE(IsCellular) = 1;
  }
  return IsCellular;
}

- (BOOL)isCellularDataRestrictedForStoreApps
{
  NSObject *v2;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = os_log_create("com.apple.amp.HomeSharing", "Availability");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = 1;
    _os_log_impl(&dword_20AA9E000, v2, OS_LOG_TYPE_DEFAULT, "StoreApps allow cellular data: %d", (uint8_t *)v4, 8u);
  }

  return 0;
}

- (BOOL)shouldProhibitStoreAppsActionForCurrentNetworkConditions
{
  int IsCellular;

  if (self->_isNetworkReachable)
  {
    IsCellular = ICEnvironmentNetworkTypeIsCellular();
    if (IsCellular)
      LOBYTE(IsCellular) = -[HSCloudAvailabilityController isCellularDataRestrictedForStoreApps](self, "isCellularDataRestrictedForStoreApps");
  }
  else
  {
    LOBYTE(IsCellular) = 1;
  }
  return IsCellular;
}

- (BOOL)canShowCloudDownloadButtons
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__HSCloudAvailabilityController_canShowCloudDownloadButtons__block_invoke;
  v5[3] = &unk_24C364D38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)canShowCloudMusic
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__HSCloudAvailabilityController_canShowCloudMusic__block_invoke;
  v5[3] = &unk_24C364D38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)canShowCloudVideo
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__HSCloudAvailabilityController_canShowCloudVideo__block_invoke;
  v5[3] = &unk_24C364D38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isCellularDataRestricted
{
  return !-[HSCloudAvailabilityController _isAutoDownloadOnCellularAllowed](self, "_isAutoDownloadOnCellularAllowed");
}

- (BOOL)shouldProhibitActionsForCurrentNetworkConditions
{
  int IsCellular;

  if (self->_isNetworkReachable)
  {
    IsCellular = ICEnvironmentNetworkTypeIsCellular();
    if (IsCellular)
      LOBYTE(IsCellular) = -[HSCloudAvailabilityController _isAutoDownloadOnCellularAllowed](self, "_isAutoDownloadOnCellularAllowed");
  }
  else
  {
    LOBYTE(IsCellular) = 1;
  }
  return IsCellular;
}

- (BOOL)isNetworkReachable
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__HSCloudAvailabilityController_isNetworkReachable__block_invoke;
  v5[3] = &unk_24C364D38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)beginObservingNetworkReachability
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__HSCloudAvailabilityController_beginObservingNetworkReachability__block_invoke;
  block[3] = &unk_24C364D10;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)endObservingNetworkReachability
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__HSCloudAvailabilityController_endObservingNetworkReachability__block_invoke;
  block[3] = &unk_24C364D10;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)airplaneModeChanged
{
  char v3;
  NSObject *accessQueue;
  _QWORD v5[5];
  char v6;

  v3 = -[RadiosPreferences airplaneMode](self->_radiosPreferences, "airplaneMode");
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__HSCloudAvailabilityController_airplaneModeChanged__block_invoke;
  v5[3] = &unk_24C364658;
  v5[4] = self;
  v6 = v3;
  dispatch_async(accessQueue, v5);
}

- (void)_wifiStateDidChangeNotification:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;
  NSObject *accessQueue;
  _QWORD v9[5];
  char v10;
  char v11;

  +[HSWiFiManager sharedWiFiManager](HSWiFiManager, "sharedWiFiManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isWiFiEnabled");

  +[HSWiFiManager sharedWiFiManager](HSWiFiManager, "sharedWiFiManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isWiFiAssociated");

  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __65__HSCloudAvailabilityController__wifiStateDidChangeNotification___block_invoke;
  v9[3] = &unk_24C364680;
  v9[4] = self;
  v10 = v5;
  v11 = v7;
  dispatch_async(accessQueue, v9);
}

- (void)_applicationWillEnterForeground:(id)a3
{
  _BOOL4 isCellularDataRestrictedForMusic;
  CoreTelephonyClient *telephonyClient;
  void *v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  NSObject *accessQueue;
  _QWORD block[5];
  BOOL v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  isCellularDataRestrictedForMusic = self->_isCellularDataRestrictedForMusic;
  telephonyClient = self->_telephonyClient;
  v13 = 0;
  -[CoreTelephonyClient getInternetConnectionStateSync:](telephonyClient, "getInternetConnectionStateSync:", &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (v7)
  {
    v8 = os_log_create("com.apple.amp.HomeSharing", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v7;
      _os_log_impl(&dword_20AA9E000, v8, OS_LOG_TYPE_ERROR, "HSCloudAvailabilityController _applicationWillEnterForeground [CoreTelephonyClient getInternetConnectionStateSync] encountered error=%{public}@", buf, 0xCu);
    }

    v9 = isCellularDataRestrictedForMusic;
  }
  else
  {
    v9 = objc_msgSend(v6, "state") == 2;
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__HSCloudAvailabilityController__applicationWillEnterForeground___block_invoke;
  block[3] = &unk_24C364658;
  block[4] = self;
  v12 = v9;
  dispatch_async(accessQueue, block);

}

- (BOOL)_isAutoDownloadOnCellularAllowed
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __65__HSCloudAvailabilityController__isAutoDownloadOnCellularAllowed__block_invoke;
  v5[3] = &unk_24C364D38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_hasCellularCapability
{
  if (_hasCellularCapability_cellularOnceToken != -1)
    dispatch_once(&_hasCellularCapability_cellularOnceToken, &__block_literal_global_32);
  return _hasCellularCapability_hasCellularCapability;
}

- (BOOL)_hasWiFiCapability
{
  if (_hasWiFiCapability_wifiOnceToken != -1)
    dispatch_once(&_hasWiFiCapability_wifiOnceToken, &__block_literal_global_35);
  return _hasWiFiCapability_hasWiFiCapability;
}

- (void)_setNewIsNetworkReachable:(BOOL)a3 networkType:(int64_t)a4
{
  NSObject *accessQueue;
  _QWORD block[6];
  BOOL v6;

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__HSCloudAvailabilityController__setNewIsNetworkReachable_networkType___block_invoke;
  block[3] = &unk_24C3646E8;
  v6 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async(accessQueue, block);
}

- (BOOL)_uncachedIsAutoDownloadOnCellularAllowed
{
  return CFPreferencesGetAppBooleanValue(CFSTR("AllowAutoDownloadOnCellular"), CFSTR("com.apple.itunesstored"), 0) != 0;
}

- (BOOL)_uncachedIsShowingAllMusic
{
  return 1;
}

- (void)_onQueue_updateIsCellularDataRestrictedForMusic
{
  NSObject *v3;
  _BOOL4 isCellularDataRestrictedForMusic;
  CFDictionaryRef theDict[2];

  theDict[1] = *(CFDictionaryRef *)MEMORY[0x24BDAC8D0];
  if (self->_ctServerConnection)
  {
    theDict[0] = 0;
    _CTServerConnectionCopyCellularUsagePolicy();
  }
  v3 = os_log_create("com.apple.amp.HomeSharing", "Availability");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    isCellularDataRestrictedForMusic = self->_isCellularDataRestrictedForMusic;
    LODWORD(theDict[0]) = 67109120;
    HIDWORD(theDict[0]) = isCellularDataRestrictedForMusic;
    _os_log_impl(&dword_20AA9E000, v3, OS_LOG_TYPE_DEFAULT, "Music restrict cellular data: %d", (uint8_t *)theDict, 8u);
  }

}

- (BOOL)_uncachedIsShowingAllVideo
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("VideosShowCloudMediaEnabledSetting"), CFSTR("com.apple.mobileipod"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 0;
  return !v3;
}

- (void)_onQueue_updateCanShowCloudDownloadButtonsWithNotification:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 isWiFiEnabled;

  v3 = a3;
  if (-[HSCloudAvailabilityController _hasCellularCapability](self, "_hasCellularCapability")
    && !self->_isAirplaneModeActive
    && self->_isCellularDataActive)
  {
    isWiFiEnabled = 1;
  }
  else if (-[HSCloudAvailabilityController _hasWiFiCapability](self, "_hasWiFiCapability"))
  {
    isWiFiEnabled = self->_isWiFiEnabled;
    if (self->_isWiFiEnabled)
      isWiFiEnabled = self->_isWiFiAssociated;
  }
  else
  {
    isWiFiEnabled = 0;
  }
  if (self->_canShowCloudDownloadButtons != isWiFiEnabled)
  {
    self->_canShowCloudDownloadButtons = isWiFiEnabled;
    if (v3)
      -[HSCloudAvailabilityController _onQueue_updateCanShowCloudTracksWithNotification:](self, "_onQueue_updateCanShowCloudTracksWithNotification:", 1);
  }
}

- (void)_onQueue_updateCanShowCloudTracksWithNotification:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 isWiFiEnabled;
  _BOOL4 v6;
  _BOOL4 isShowingAllMusic;
  _BOOL4 isShowingAllVideo;
  NSObject *v9;
  _BOOL4 isCellularDataActive;
  NSObject *v11;
  _QWORD v12[5];
  _QWORD block[5];

  v3 = a3;
  if (-[HSCloudAvailabilityController _hasWiFiCapability](self, "_hasWiFiCapability"))
    isWiFiEnabled = self->_isWiFiEnabled;
  else
    isWiFiEnabled = 0;
  if (-[HSCloudAvailabilityController _hasCellularCapability](self, "_hasCellularCapability"))
    v6 = !self->_isAirplaneModeActive;
  else
    v6 = 0;
  if (isWiFiEnabled || v6)
  {
    isShowingAllMusic = self->_isShowingAllMusic;
    isShowingAllVideo = self->_isShowingAllVideo;
  }
  else
  {
    isShowingAllMusic = 0;
    isShowingAllVideo = 0;
  }
  if (self->_canShowCloudMusic != isShowingAllMusic || self->_canShowCloudVideo != isShowingAllVideo)
  {
    self->_canShowCloudMusic = isShowingAllMusic;
    self->_canShowCloudVideo = isShowingAllVideo;
    if (v3)
    {
      dispatch_get_global_queue(0, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __83__HSCloudAvailabilityController__onQueue_updateCanShowCloudTracksWithNotification___block_invoke;
      block[3] = &unk_24C364D10;
      block[4] = self;
      dispatch_async(v9, block);

    }
  }
  if (!isWiFiEnabled)
  {
    if (!v6)
    {
      isCellularDataActive = 0;
      goto LABEL_21;
    }
LABEL_19:
    isCellularDataActive = self->_isCellularDataActive;
    goto LABEL_21;
  }
  isCellularDataActive = self->_isWiFiAssociated;
  if (!self->_isWiFiAssociated && v6)
    goto LABEL_19;
LABEL_21:
  if (self->_hasProperNetworkConditionsToShowCloudMedia != isCellularDataActive)
  {
    self->_hasProperNetworkConditionsToShowCloudMedia = isCellularDataActive;
    if (v3)
    {
      dispatch_get_global_queue(0, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __83__HSCloudAvailabilityController__onQueue_updateCanShowCloudTracksWithNotification___block_invoke_2;
      v12[3] = &unk_24C364D10;
      v12[4] = self;
      dispatch_async(v11, v12);

    }
  }
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  HSCloudAvailabilityController *v9;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__HSCloudAvailabilityController_environmentMonitorDidChangeNetworkReachability___block_invoke;
  v7[3] = &unk_24C364710;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  HSCloudAvailabilityController *v9;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__HSCloudAvailabilityController_environmentMonitorDidChangeNetworkType___block_invoke;
  v7[3] = &unk_24C364710;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  id v7;
  CoreTelephonyClient *telephonyClient;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  _BOOL4 v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  HSCloudAvailabilityController *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  telephonyClient = self->_telephonyClient;
  v18 = 0;
  v9 = a3;
  -[CoreTelephonyClient getCurrentDataSubscriptionContextSync:](telephonyClient, "getCurrentDataSubscriptionContextSync:", &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v18;
  if (v11)
  {
    v12 = os_log_create("com.apple.amp.HomeSharing", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      v20 = v13;
      v21 = 2048;
      v22 = self;
      v23 = 2114;
      v24 = v11;
      _os_log_impl(&dword_20AA9E000, v12, OS_LOG_TYPE_DEFAULT, "<%@ %p> Error getting current data context. error=%{public}@", buf, 0x20u);
    }

  }
  objc_msgSend(v10, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v14, "isEqual:", v15);
  if (v16)
  {
    v17 = objc_msgSend(v7, "state") == 2;
    if (self->_isCellularDataActive != v17)
    {
      self->_isCellularDataActive = v17;
      -[HSCloudAvailabilityController _onQueue_updateCanShowCloudDownloadButtonsWithNotification:](self, "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 1);
      -[HSCloudAvailabilityController _onQueue_updateCanShowCloudTracksWithNotification:](self, "_onQueue_updateCanShowCloudTracksWithNotification:", 1);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __72__HSCloudAvailabilityController_environmentMonitorDidChangeNetworkType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int IsCellular;
  int v4;
  NSObject *v5;
  _QWORD block[5];

  v2 = objc_msgSend(*(id *)(a1 + 32), "networkType");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) != v2)
  {
    IsCellular = ICEnvironmentNetworkTypeIsCellular();
    v4 = ICEnvironmentNetworkTypeIsCellular();
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) = v2;
    if (IsCellular != v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 1);
      objc_msgSend(*(id *)(a1 + 40), "_onQueue_updateCanShowCloudTracksWithNotification:", 0);
      dispatch_get_global_queue(0, 0);
      v5 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __72__HSCloudAvailabilityController_environmentMonitorDidChangeNetworkType___block_invoke_2;
      block[3] = &unk_24C364D10;
      block[4] = *(_QWORD *)(a1 + 40);
      dispatch_async(v5, block);

    }
  }
}

void __72__HSCloudAvailabilityController_environmentMonitorDidChangeNetworkType___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("HSCloudAvailabilityControllerCanShowCloudTracksDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __80__HSCloudAvailabilityController_environmentMonitorDidChangeNetworkReachability___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];

  v2 = objc_msgSend(*(id *)(a1 + 32), "isRemoteServerLikelyReachable");
  v3 = *(_QWORD *)(a1 + 40);
  if (*(unsigned __int8 *)(v3 + 26) != v2)
  {
    *(_BYTE *)(v3 + 26) = v2;
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __80__HSCloudAvailabilityController_environmentMonitorDidChangeNetworkReachability___block_invoke_2;
    block[3] = &unk_24C364D10;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(v4, block);

  }
}

void __80__HSCloudAvailabilityController_environmentMonitorDidChangeNetworkReachability___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("HSCloudAvailabilityControllerNetworkReachabilityDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __83__HSCloudAvailabilityController__onQueue_updateCanShowCloudTracksWithNotification___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("HSCloudAvailabilityControllerCanShowCloudTracksDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __83__HSCloudAvailabilityController__onQueue_updateCanShowCloudTracksWithNotification___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("HSCloudAvailabilityControllerHasProperNetworkConditionsToShowCloudMediaDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __71__HSCloudAvailabilityController__setNewIsNetworkReachable_networkType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(a1 + 48);
  v4 = MEMORY[0x24BDAC760];
  if (*(unsigned __int8 *)(v2 + 26) != v3)
  {
    *(_BYTE *)(v2 + 26) = v3;
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __71__HSCloudAvailabilityController__setNewIsNetworkReachable_networkType___block_invoke_2;
    block[3] = &unk_24C364D10;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v5, block);

    v2 = *(_QWORD *)(a1 + 32);
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v2 + 40) != v6)
  {
    *(_QWORD *)(v2 + 40) = v6;
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateCanShowCloudTracksWithNotification:", 0);
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __71__HSCloudAvailabilityController__setNewIsNetworkReachable_networkType___block_invoke_3;
    v8[3] = &unk_24C364D10;
    v8[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v7, v8);

  }
}

void __71__HSCloudAvailabilityController__setNewIsNetworkReachable_networkType___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("HSCloudAvailabilityControllerNetworkReachabilityDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __71__HSCloudAvailabilityController__setNewIsNetworkReachable_networkType___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("HSCloudAvailabilityControllerCanShowCloudTracksDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __51__HSCloudAvailabilityController__hasWiFiCapability__block_invoke()
{
  const __CFBoolean *v0;
  const __CFBoolean *v1;
  CFTypeID v2;
  BOOL v3;

  v0 = (const __CFBoolean *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    v3 = v2 == CFBooleanGetTypeID() && CFBooleanGetValue(v1) != 0;
    _hasWiFiCapability_hasWiFiCapability = v3;
    CFRelease(v1);
  }
  else
  {
    _hasWiFiCapability_hasWiFiCapability = 0;
  }
}

void __55__HSCloudAvailabilityController__hasCellularCapability__block_invoke()
{
  const __CFBoolean *v0;
  const __CFBoolean *v1;
  CFTypeID v2;
  BOOL v3;

  v0 = (const __CFBoolean *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    v3 = v2 == CFBooleanGetTypeID() && CFBooleanGetValue(v1) != 0;
    _hasCellularCapability_hasCellularCapability = v3;
    CFRelease(v1);
  }
  else
  {
    _hasCellularCapability_hasCellularCapability = 0;
  }
}

uint64_t __65__HSCloudAvailabilityController__isAutoDownloadOnCellularAllowed__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 18);
  return result;
}

uint64_t __65__HSCloudAvailabilityController__applicationWillEnterForeground___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 19) != v2)
  {
    *(_BYTE *)(v1 + 19) = v2;
    return objc_msgSend(*(id *)(result + 32), "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 1);
  }
  return result;
}

uint64_t __65__HSCloudAvailabilityController__wifiStateDidChangeNotification___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  v1 = result;
  v2 = *(_QWORD *)(result + 32);
  v3 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v2 + 24) != v3 || *(unsigned __int8 *)(v2 + 25) != *(unsigned __int8 *)(result + 41))
  {
    *(_BYTE *)(v2 + 24) = v3;
    *(_BYTE *)(*(_QWORD *)(result + 32) + 25) = *(_BYTE *)(result + 41);
    objc_msgSend(*(id *)(result + 32), "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 1);
    return objc_msgSend(*(id *)(v1 + 32), "_onQueue_updateCanShowCloudTracksWithNotification:", 1);
  }
  return result;
}

uint64_t __52__HSCloudAvailabilityController_airplaneModeChanged__block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 17) != v2)
  {
    *(_BYTE *)(v1 + 17) = v2;
    return objc_msgSend(*(id *)(result + 32), "_onQueue_updateCanShowCloudTracksWithNotification:", 1);
  }
  return result;
}

_QWORD *__64__HSCloudAvailabilityController_endObservingNetworkReachability__block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result[4];
  v2 = *(_QWORD *)(v1 + 56);
  if (v2)
  {
    *(_QWORD *)(v1 + 56) = v2 - 1;
    result = (_QWORD *)result[4];
    if (!result[7])
      return (_QWORD *)objc_msgSend(result, "_onQueue_endObservingReachabilityChanges");
  }
  return result;
}

_QWORD *__66__HSCloudAvailabilityController_beginObservingNetworkReachability__block_invoke(uint64_t a1)
{
  _QWORD *result;

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  result = *(_QWORD **)(a1 + 32);
  if (result[7] == 1)
    return (_QWORD *)objc_msgSend(result, "_onQueue_beginObservingReachabilityChanges");
  return result;
}

uint64_t __51__HSCloudAvailabilityController_isNetworkReachable__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 26);
  return result;
}

uint64_t __50__HSCloudAvailabilityController_canShowCloudVideo__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 28);
  return result;
}

uint64_t __50__HSCloudAvailabilityController_canShowCloudMusic__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 27);
  return result;
}

uint64_t __60__HSCloudAvailabilityController_canShowCloudDownloadButtons__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 29);
  return result;
}

uint64_t __65__HSCloudAvailabilityController_isCellularDataRestrictedForMusic__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 20);
  return result;
}

uint64_t __75__HSCloudAvailabilityController_hasProperNetworkConditionsToShowCloudMedia__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

void __37__HSCloudAvailabilityController_init__block_invoke(uint64_t a1)
{
  _BYTE *v1;
  int v2;
  int v3;
  _BYTE *v4;

  v1 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    v4 = v1;
    CFPreferencesAppSynchronize(CFSTR("com.apple.mobileipod"));
    v2 = objc_msgSend(v4, "_uncachedIsShowingAllMusic");
    v3 = objc_msgSend(v4, "_uncachedIsShowingAllVideo");
    v1 = v4;
    if (v4[21] != v2 || v4[22] != v3)
    {
      v4[21] = v2;
      v4[22] = v3;
      objc_msgSend(v4, "_onQueue_updateCanShowCloudDownloadButtonsWithNotification:", 1);
      objc_msgSend(v4, "_onQueue_updateCanShowCloudTracksWithNotification:", 1);
      v1 = v4;
    }
  }

}

void __37__HSCloudAvailabilityController_init__block_invoke_2(uint64_t a1, const __CFString *a2)
{
  id v3;

  v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (CFStringCompare(a2, (CFStringRef)*MEMORY[0x24BDC2AD8], 0) == kCFCompareEqualTo)
    objc_msgSend(v3, "_onQueue_updateIsCellularDataRestrictedForMusic");

}

uint64_t __37__HSCloudAvailabilityController_init__block_invoke_29(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateIsCellularDataRestrictedForMusic");
}

+ (id)sharedController
{
  if (sharedController___once != -1)
    dispatch_once(&sharedController___once, &__block_literal_global);
  return (id)sharedController___sharedController;
}

void __49__HSCloudAvailabilityController_sharedController__block_invoke()
{
  HSCloudAvailabilityController *v0;
  void *v1;

  v0 = objc_alloc_init(HSCloudAvailabilityController);
  v1 = (void *)sharedController___sharedController;
  sharedController___sharedController = (uint64_t)v0;

}

@end
