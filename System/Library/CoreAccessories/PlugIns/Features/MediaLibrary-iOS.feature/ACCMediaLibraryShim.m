@implementation ACCMediaLibraryShim

+ (BOOL)allowCachedTracksForAppleMusic
{
  int AppBooleanValue;

  AppBooleanValue = __allowCachedTracksForAppleMusic___allowCachedTracksForAppleMusicSetting;
  if (__allowCachedTracksForAppleMusic___allowCachedTracksForAppleMusicSetting == -1)
  {
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("allowCachedTracksForAppleMusic"), CFSTR("com.apple.iapd"), 0);
    __allowCachedTracksForAppleMusic___allowCachedTracksForAppleMusicSetting = AppBooleanValue;
  }
  return AppBooleanValue != 0;
}

+ (BOOL)isMusicAppVisible
{
  void *v2;
  char v3;

  GetMediaLibraryHelper();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showMusic");

  return v3;
}

- (void)_updateSubscribedToAppleMusicStatus:(BOOL)a3
{
  _BOOL4 v4;
  int AppBooleanValue;
  char v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _BOOL4 subscribedToAppleMusic;
  _DWORD v11[2];
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!self->_isShuttingDown && self->_enableLibraryInfoUpdate)
  {
    v4 = a3;
    AppBooleanValue = __allowCachedTracksForAppleMusic___allowCachedTracksForAppleMusicSetting;
    if (__allowCachedTracksForAppleMusic___allowCachedTracksForAppleMusicSetting == -1)
    {
      AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("allowCachedTracksForAppleMusic"), CFSTR("com.apple.iapd"), 0);
      __allowCachedTracksForAppleMusic___allowCachedTracksForAppleMusicSetting = AppBooleanValue;
    }
    if (AppBooleanValue)
    {
      if (__mlForceAppleMusicSubscribedState == 1)
      {
        v6 = 0;
      }
      else
      {
        if (__mlForceAppleMusicSubscribedState != 2)
        {
          if (v4)

          v6 = 0;
          v7 = 36;
          goto LABEL_15;
        }
        v6 = 1;
      }
      v7 = 35;
LABEL_15:
      *((_BYTE *)&self->super.isa + v7) = v6;
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v8 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v8 = MEMORY[0x24BDACB70];
        v9 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        subscribedToAppleMusic = self->_subscribedToAppleMusic;
        v11[0] = 67109376;
        v11[1] = __mlForceAppleMusicSubscribedState;
        v12 = 1024;
        v13 = subscribedToAppleMusic;
        _os_log_impl(&dword_21A7E0000, v8, OS_LOG_TYPE_DEFAULT, "_updateSubscribedToAppleMusicStatus: __mlForceAppleMusicSubscribedState=%d _subscribedToAppleMusic=%d", (uint8_t *)v11, 0xEu);
      }

    }
  }
}

- (void)_handleSubscribedToAppleMusicChanged:(id)a3
{
  -[ACCMediaLibraryShim _updateSubscribedToAppleMusicStatus:](self, "_updateSubscribedToAppleMusicStatus:", 0);
}

- (void)_mediaLibrariesAvailableChanged:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSObject *libraryInfoUpdateQ;
  _QWORD block[5];
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_21A7E0000, v7, OS_LOG_TYPE_INFO, "_mediaLibrariesAvailableChanged: notification=%@", buf, 0xCu);
  }

  if (self->_enableLibraryInfoUpdate && !self->_isShuttingDown)
  {
    libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__ACCMediaLibraryShim__mediaLibrariesAvailableChanged___block_invoke;
    block[3] = &unk_24DD25F28;
    block[4] = self;
    dispatch_async(libraryInfoUpdateQ, block);
  }

}

_BYTE *__55__ACCMediaLibraryShim__mediaLibrariesAvailableChanged___block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[32])
  {
    if (!result[33])
      return (_BYTE *)objc_msgSend(result, "_updateMediaLibraryInfomationUpdates:", 0);
  }
  return result;
}

- (void)_handlMediaLibraryNeedFilterChange:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_21A7E0000, v7, OS_LOG_TYPE_INFO, "_handlMediaLibraryNeedFilterChange: notification=%@", (uint8_t *)&v8, 0xCu);
  }

  -[ACCMediaLibraryShim _mediaLibrariesAvailableChanged:](self, "_mediaLibrariesAvailableChanged:", 0);
}

- (void)_setupNewLibraries:(id)a3 forAccessory:(id)a4
{
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  _BOOL4 enableLibraryInfoUpdate;
  _BOOL4 isShuttingDown;
  void *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *libraryList;
  int v15;
  ACCMediaLibraryShimInfo *deviceLibrary;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  ACCMediaLibraryShimInfo *v27;
  void *radioLibrary;
  unint64_t v29;
  unint64_t v30;
  ACCMediaLibraryShimInfo *v31;
  ACCMediaLibraryShimInfo *v32;
  NSMutableDictionary *v33;
  ACCMediaLibraryShimInfo *v34;
  NSDictionary *libraries;
  NSDictionary **p_libraries;
  uint64_t v37;
  NSDictionary *v38;
  id *v39;
  NSObject *v40;
  id v41;
  id obj;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  _BOOL4 v51;
  __int16 v52;
  _BOOL4 v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v43 = a4;
  if (gLogObjects)
    v7 = gNumLogObjects < 1;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    enableLibraryInfoUpdate = self->_enableLibraryInfoUpdate;
    isShuttingDown = self->_isShuttingDown;
    *(_DWORD *)buf = 67109890;
    v51 = enableLibraryInfoUpdate;
    v52 = 1024;
    v53 = isShuttingDown;
    v54 = 2112;
    v55 = v6;
    v56 = 2112;
    v57 = v43;
    _os_log_impl(&dword_21A7E0000, v9, OS_LOG_TYPE_INFO, "_setupNewLibraries: _enableLibraryInfoUpdate=%d _isShuttingDown=%d oldLibraryList=%@ accessory=%@", buf, 0x22u);
  }

  if (self->_enableLibraryInfoUpdate && !self->_isShuttingDown)
  {
    objc_msgSend(MEMORY[0x24BDDC7F0], "mediaLibraries");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    libraryList = self->_libraryList;
    self->_libraryList = v13;

    v15 = -[ACCMediaLibraryShim subscribedToAppleMusic](self, "subscribedToAppleMusic");
    deviceLibrary = self->_deviceLibrary;
    self->_deviceLibrary = 0;

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v17 = MEMORY[0x24BDACB70];
      v18 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[ACCMediaLibraryShim _setupNewLibraries:forAccessory:].cold.3((uint64_t)self, (uint64_t)v12, v17);

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v12;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v46 != v21)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          ACCMediaLibraryShimUIDString(v23, v15);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          ACCMediaLibraryShimUIDString(self->_deviceMediaLibrary, v15);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v24, "isEqualToString:", v25);

          if (!v6
            || (objc_msgSend(v6, "objectForKey:", v24),
                (v27 = (ACCMediaLibraryShimInfo *)objc_claimAutoreleasedReturnValue()) == 0))
          {
            v27 = -[ACCMediaLibraryShimInfo initWithMediaLibrary:accessory:Context:LibraryType:]([ACCMediaLibraryShimInfo alloc], "initWithMediaLibrary:accessory:Context:LibraryType:", v23, v43, self, v26 ^ 1u);
          }
          objc_msgSend(v44, "setObject:forKey:", v23, v24);
          if (v26)
            objc_storeStrong((id *)&self->_deviceLibrary, v27);
          -[NSMutableDictionary setObject:forKey:](self->_libraryList, "setObject:forKey:", v27, v24);

        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v20);
    }

    radioLibrary = self->_radioLibrary;
    if (radioLibrary)
    {
      v29 = 0x253E63000;
      v30 = 0x253E63000;
      if (self->_radioIsEnabled)
      {
LABEL_40:
        p_libraries = &self->_libraries;
        libraries = self->_libraries;
        if (libraries)
        {
          *p_libraries = 0;

        }
        if (self->_enableLibraryInfoUpdate)
        {
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v44);
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = *p_libraries;
          *p_libraries = (NSDictionary *)v37;

        }
        v39 = *(id **)(v29 + 3112);
        if (v39 && *(int *)(v30 + 3120) >= 1)
        {
          v40 = *v39;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
          v40 = MEMORY[0x24BDACB70];
          v41 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          -[ACCMediaLibraryShim _setupNewLibraries:forAccessory:].cold.1();

        goto LABEL_53;
      }
      self->_radioLibrary = 0;
    }
    else
    {
      v29 = 0x253E63000uLL;
      v30 = 0x253E63000uLL;
      if (!self->_mpRadioLibrary || !self->_radioIsEnabled)
        goto LABEL_40;
      v31 = -[ACCMediaLibraryShimInfo initWithMediaLibrary:accessory:Context:LibraryType:]([ACCMediaLibraryShimInfo alloc], "initWithMediaLibrary:accessory:Context:LibraryType:", self->_mpRadioLibrary, v43, self, 2);
      v32 = self->_radioLibrary;
      self->_radioLibrary = v31;

      v33 = self->_libraryList;
      v34 = self->_radioLibrary;
      -[ACCMediaLibraryShimInfo UIDString](v34, "UIDString");
      radioLibrary = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v34, radioLibrary);
    }

    goto LABEL_40;
  }
LABEL_53:

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<ACCMediaLibraryShim>[\naccessory=%@\n    _libraryInfoUpdateQ=%@\n    _libraryList=%@\n    _libraries=%@\n    _deviceMediaLibrary=%@\n    _deviceLibrary=%@\n    _enableLibraryInfoUpdate=%d\n    _radioIsEnabled=%d]"), self->_accessory, self->_libraryInfoUpdateQ, self->_libraryList, self->_libraries, self->_deviceMediaLibrary, self->_deviceLibrary, self->_enableLibraryInfoUpdate, self->_radioIsEnabled);
}

- (ACCMediaLibraryShim)initWithAccessory:(id)a3 windowPerLibrary:(unsigned int)a4 delegate:(id)a5
{
  id v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  ACCMediaLibraryShim *v14;
  ACCSettingsState *v15;
  ACCSettingsState *measureMemoryUsage;
  id v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *libraryInfoUpdateQ;
  ACCMediaLibraryShimInfo *deviceLibrary;
  ACCMediaLibraryShimInfo *radioLibrary;
  NSDictionary *libraries;
  NSMutableDictionary *libraryList;
  ACCMemUsageStat *memUse;
  ACCMemUsageStat *v25;
  ACCMemUsageStat *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  MPMediaLibrary *deviceMediaLibrary;
  uint64_t v33;
  MPRadioLibrary *mpRadioLibrary;
  void *v35;
  void *v36;
  objc_super v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  unsigned int v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  if (gLogObjects)
    v11 = gNumLogObjects < 1;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v13 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v40 = v9;
    v41 = 1024;
    v42 = a4;
    v43 = 2112;
    v44 = v10;
    _os_log_impl(&dword_21A7E0000, v13, OS_LOG_TYPE_INFO, "ACCMediaLibraryShim  initWithAccessory: %@ windowPerLibrary: %u delegate: %@", buf, 0x1Cu);
  }

  v38.receiver = self;
  v38.super_class = (Class)ACCMediaLibraryShim;
  v14 = -[ACCMediaLibraryShim init](&v38, sel_init);
  if (v14)
  {
    v15 = -[ACCSettingsState initWithKey:applicationID:notification:defaultValue:invalidValue:]([ACCSettingsState alloc], "initWithKey:applicationID:notification:defaultValue:invalidValue:", CFSTR("MeasureMemoryUsage"), CFSTR("com.apple.iapd"), CFSTR("com.apple.iapd.LoggingPreferencesChangedNotification"), 0, -1);
    measureMemoryUsage = v14->_measureMemoryUsage;
    v14->_measureMemoryUsage = v15;

    v17 = GetMediaLibraryHelper();
    if (__mlForceAppleMusicSubscribedState == -1)
      __mlForceAppleMusicSubscribedState = CFPreferencesGetAppIntegerValue(CFSTR("ACCForceAppleMusicSubscribedState"), CFSTR("com.apple.iapd"), 0);
    v18 = dispatch_queue_create("com.apple.accml.mediaLibraryInfoQ", 0);
    libraryInfoUpdateQ = v14->_libraryInfoUpdateQ;
    v14->_libraryInfoUpdateQ = (OS_dispatch_queue *)v18;

    v14->_enableLibraryInfoUpdate = 0;
    objc_storeStrong((id *)&v14->_accessory, a3);
    v14->_isShuttingDown = 0;
    deviceLibrary = v14->_deviceLibrary;
    v14->_deviceLibrary = 0;

    radioLibrary = v14->_radioLibrary;
    v14->_radioLibrary = 0;

    v14->_windowPerLibrary = a4;
    libraries = v14->_libraries;
    v14->_libraries = 0;

    libraryList = v14->_libraryList;
    v14->_libraryList = 0;

    objc_storeWeak((id *)&v14->_delegate, v10);
    memUse = v14->_memUse;
    v14->_memUse = 0;

    if (-[ACCSettingsState BOOLValue](v14->_measureMemoryUsage, "BOOLValue"))
    {
      v25 = -[ACCMemUsageStat initWithName:]([ACCMemUsageStat alloc], "initWithName:", CFSTR("ACCMediaLibraryUpdate"));
      v26 = v14->_memUse;
      v14->_memUse = v25;

    }
    v27 = (void *)MEMORY[0x24BDDC7F0];
    objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setRunLoopForNotifications:", v28);

    objc_msgSend(MEMORY[0x24BDDC818], "setFilteringDisabled:", 1);
    objc_msgSend(MEMORY[0x24BDDC810], "predicateWithValue:forProperty:", &unk_24DD293E0, *MEMORY[0x24BDDBC30]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addLibraryFilterPredicate:", v29);

    objc_msgSend(MEMORY[0x24BDDC7F0], "deviceMediaLibrary");
    v31 = objc_claimAutoreleasedReturnValue();
    deviceMediaLibrary = v14->_deviceMediaLibrary;
    v14->_deviceMediaLibrary = (MPMediaLibrary *)v31;

    objc_msgSend(MEMORY[0x24BDDCB48], "defaultRadioLibrary");
    v33 = objc_claimAutoreleasedReturnValue();
    mpRadioLibrary = v14->_mpRadioLibrary;
    v14->_mpRadioLibrary = (MPRadioLibrary *)v33;

    GetMediaLibraryHelper();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v14->_radioIsEnabled = objc_msgSend(v35, "iTunesRadioEnabled");

    v14->_subscribedToAppleMusic = 0;
    -[ACCMediaLibraryShim _updateSubscribedToAppleMusicStatus:](v14, "_updateSubscribedToAppleMusicStatus:", 1);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObserver:selector:name:object:", v14, sel__mediaLibrariesAvailableChanged_, *MEMORY[0x24BDDBCE0], 0);
    if (__allowCachedTracksForAppleMusic___allowCachedTracksForAppleMusicSetting == -1)
      __allowCachedTracksForAppleMusic___allowCachedTracksForAppleMusicSetting = CFPreferencesGetAppBooleanValue(CFSTR("allowCachedTracksForAppleMusic"), CFSTR("com.apple.iapd"), 0);
    objc_msgSend(v36, "addObserver:selector:name:object:", v14, sel__mediaLibrariesAvailableChanged_, *MEMORY[0x24BDDC560], 0);
    objc_msgSend(v36, "addObserver:selector:name:object:", v14, sel__handlMediaLibraryNeedFilterChange_, kMediaLibraryNeedFilterChange, 0);

  }
  return v14;
}

- (void)startShimForAccessoryAttach:(id)a3
{
  id v4;
  NSObject *libraryInfoUpdateQ;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__ACCMediaLibraryShim_startShimForAccessoryAttach___block_invoke;
  v7[3] = &unk_24DD25ED8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(libraryInfoUpdateQ, v7);

}

uint64_t __51__ACCMediaLibraryShim_startShimForAccessoryAttach___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupNewLibraries:forAccessory:", 0, *(_QWORD *)(a1 + 40));
}

- (void)shuttingDown
{
  BOOL v3;
  id v4;
  NSObject *v5;
  NSDictionary *libraries;
  NSMutableDictionary *libraryList;
  void *v8;
  NSObject *libraryInfoUpdateQ;
  ACCMemUsageStat *memUse;
  NSObject *v11;
  id v12;
  NSDictionary *v13;
  void *v14;
  void *v15;
  void *v16;
  ACCMemUsageStat *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t i;
  uint64_t v29;
  id *v30;
  int v31;
  BOOL v32;
  NSObject *v33;
  NSObject *v34;
  NSDictionary *v35;
  ACCMediaLibraryAccessory *accessory;
  void *v37;
  uint64_t v38;
  ACCMediaLibraryShim *v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD block[5];
  uint8_t buf[4];
  NSDictionary *v47;
  __int16 v48;
  NSMutableDictionary *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    libraries = self->_libraries;
    libraryList = self->_libraryList;
    *(_DWORD *)buf = 138412546;
    v47 = libraries;
    v48 = 2112;
    v49 = libraryList;
    _os_log_impl(&dword_21A7E0000, v5, OS_LOG_TYPE_INFO, "ACCMediaLibraryShim shuttingDown: _libraries=%@  _libraryList=%@", buf, 0x16u);
  }

  *(_WORD *)&self->_enableLibraryInfoUpdate = 256;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", self);
  libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__ACCMediaLibraryShim_shuttingDown__block_invoke;
  block[3] = &unk_24DD25F28;
  block[4] = self;
  dispatch_async(libraryInfoUpdateQ, block);
  if (-[ACCSettingsState BOOLValue](self->_measureMemoryUsage, "BOOLValue"))
  {
    memUse = self->_memUse;
    if (memUse)
    {
      -[ACCMemUsageStat update](memUse, "update");
      v37 = v8;
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v11 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v11 = MEMORY[0x24BDACB70];
        v12 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[ACCMediaLibraryAccessory accessoryUID](self->_accessory, "accessoryUID");
        v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACCMemUsageStat statInfo](self->_memUse, "statInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "startTime");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", v16);
        v17 = self->_memUse;
        *(_DWORD *)buf = 138412802;
        v47 = v13;
        v48 = 2048;
        v49 = v18;
        v50 = 2112;
        v51 = (uint64_t)v17;
        _os_log_impl(&dword_21A7E0000, v11, OS_LOG_TYPE_DEFAULT, "shuttingDown: %@, Finished after %f sec, memUse:\n%@", buf, 0x20u);

      }
      -[ACCMemUsageStat markList](self->_memUse, "markList");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v19, "count");

      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v39 = self;
      -[ACCMemUsageStat markList](self->_memUse, "markList");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "allValues");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v21;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
      v23 = 0x253E63000uLL;
      if (v22)
      {
        v24 = v22;
        v25 = 0;
        v26 = *(_QWORD *)v42;
        v27 = MEMORY[0x24BDACB70];
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v42 != v26)
              objc_enumerationMutation(obj);
            v29 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
            v30 = *(id **)(v23 + 3112);
            v31 = gNumLogObjects;
            if (v30)
              v32 = gNumLogObjects < 1;
            else
              v32 = 1;
            if (v32)
            {
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                v47 = (NSDictionary *)v30;
                v48 = 1024;
                LODWORD(v49) = v31;
                _os_log_error_impl(&dword_21A7E0000, v27, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v33 = v27;
              v34 = v27;
            }
            else
            {
              v34 = *v30;
            }
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              -[ACCMediaLibraryAccessory accessoryUID](v39->_accessory, "accessoryUID");
              v35 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v47 = v35;
              v48 = 2048;
              v49 = (NSMutableDictionary *)(v25 + i);
              v23 = 0x253E63000;
              v50 = 2048;
              v51 = v38;
              v52 = 2112;
              v53 = v29;
              _os_log_impl(&dword_21A7E0000, v34, OS_LOG_TYPE_DEFAULT, "shuttingDown: %@, mark: %lu / %lu \n%@", buf, 0x2Au);

            }
          }
          v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
          v25 += i;
        }
        while (v24);
      }

      self = v39;
      v8 = v37;
    }
  }
  accessory = self->_accessory;
  self->_accessory = 0;

}

void __35__ACCMediaLibraryShim_shuttingDown__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  if (v3)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v3, "allValues", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8++), "shuttingDown");
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }

    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 64);
    *(_QWORD *)(v9 + 64) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_storeWeak((id *)(v2 + 88), 0);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 80);
  *(_QWORD *)(v11 + 80) = 0;

  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 72);
  *(_QWORD *)(v13 + 72) = 0;

}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10(&dword_21A7E0000, v0, v1, "ACCMediaLibraryShim dealloc: _libraries=%@  _libraryList=%@", v2);
  OUTLINED_FUNCTION_2();
}

void __30__ACCMediaLibraryShim_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  if (v3)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v3, "allValues", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8++), "shuttingDown");
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 64);
    *(_QWORD *)(v9 + 64) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  v11 = *(void **)(v2 + 80);
  *(_QWORD *)(v2 + 80) = 0;

  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 72);
  *(_QWORD *)(v12 + 72) = 0;

}

- (BOOL)_checkForDifferentMediaLibraries
{
  void *v3;
  int v4;
  NSUInteger v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  _BOOL4 isShuttingDown;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!self->_libraries)
    return 1;
  objc_msgSend(MEMORY[0x24BDDC7F0], "mediaLibraries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ACCMediaLibraryShim subscribedToAppleMusic](self, "subscribedToAppleMusic");
  v5 = -[NSDictionary count](self->_libraries, "count");
  if (v5 != objc_msgSend(v3, "count"))
  {
    v16 = 1;
    goto LABEL_22;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v7)
  {
LABEL_17:
    v16 = 0;
    goto LABEL_21;
  }
  v8 = v7;
  v9 = *(_QWORD *)v19;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v19 != v9)
        objc_enumerationMutation(v6);
      ACCMediaLibraryShimUIDString(*(void **)(*((_QWORD *)&v18 + 1) + 8 * i), v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ACCMediaLibraryShimUIDString(self->_deviceMediaLibrary, v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12, (_QWORD)v18);

      if (v13)
      {
        -[NSDictionary objectForKey:](self->_libraries, "objectForKey:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          v16 = 1;
          goto LABEL_20;
        }
      }
      if (!self->_enableLibraryInfoUpdate)
      {
        v16 = 0;
LABEL_20:

        goto LABEL_21;
      }
      isShuttingDown = self->_isShuttingDown;

      if (isShuttingDown)
        goto LABEL_17;
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    v16 = 0;
    if (v8)
      continue;
    break;
  }
LABEL_21:

LABEL_22:
  return v16;
}

- (BOOL)_checkForDifferentRadioLibrary
{
  int radioIsEnabled;
  void *v4;
  int v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  MPRadioLibrary *v12;
  MPRadioLibrary *mpRadioLibrary;
  _DWORD v15[2];
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  radioIsEnabled = self->_radioIsEnabled;
  GetMediaLibraryHelper();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "iTunesRadioEnabled");

  if (radioIsEnabled != v5)
  {
    if (gLogObjects)
      v6 = gNumLogObjects < 1;
    else
      v6 = 1;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v7 = MEMORY[0x24BDACB70];
    }
    else
    {
      v8 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = self->_radioIsEnabled;
      GetMediaLibraryHelper();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = 67109376;
      v15[1] = v9;
      v16 = 1024;
      v17 = objc_msgSend(v10, "iTunesRadioEnabled");
      _os_log_impl(&dword_21A7E0000, v8, OS_LOG_TYPE_INFO, "_checkForDifferentRadioLibrary: _radioIsEnabled=%d->%d", (uint8_t *)v15, 0xEu);

    }
    GetMediaLibraryHelper();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self->_radioIsEnabled = objc_msgSend(v11, "iTunesRadioEnabled");

    if (self->_radioIsEnabled)
    {
      objc_msgSend(MEMORY[0x24BDDCB48], "defaultRadioLibrary");
      v12 = (MPRadioLibrary *)objc_claimAutoreleasedReturnValue();
      mpRadioLibrary = self->_mpRadioLibrary;
      self->_mpRadioLibrary = v12;

    }
  }
  return radioIsEnabled != v5;
}

- (void)_sendLibraryInfoList
{
  id v3;
  ACCMediaLibraryShimDelegate **p_delegate;
  id WeakRetained;
  id v6;
  char v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  ACCMediaLibraryShimInfo *v24;
  MPRadioLibrary *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  id v29;
  _BOOL4 radioIsEnabled;
  ACCMediaLibraryShimInfo *radioLibrary;
  MPRadioLibrary *mpRadioLibrary;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  _BOOL4 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  _BYTE v44[24];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (!self->_enableLibraryInfoUpdate)
    goto LABEL_21;
  if (self->_isShuttingDown)
    goto LABEL_3;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[NSMutableDictionary allValues](self->_libraryList, "allValues", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v40;
LABEL_10:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v40 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v13);
      if (!objc_msgSend(v14, "libraryType"))
      {
        v15 = objc_alloc(MEMORY[0x24BE00B88]);
        objc_msgSend(v14, "UIDString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v15, "initWithMediaLibrary:name:type:", v16, v17, objc_msgSend(v14, "libraryType"));

        objc_msgSend(v3, "addObject:", v18);
      }
      if (!self->_enableLibraryInfoUpdate || self->_isShuttingDown)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        if (v11)
          goto LABEL_10;
        break;
      }
    }
  }

  if (self->_enableLibraryInfoUpdate && !self->_isShuttingDown)
  {
    if (self->_mpRadioLibrary && self->_radioLibrary)
    {
      if (gLogObjects)
        v19 = gNumLogObjects <= 0;
      else
        v19 = 1;
      v20 = !v19;
      if (self->_radioIsEnabled)
      {
        if (v20)
        {
          v21 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
          v21 = MEMORY[0x24BDACB70];
          v29 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          radioIsEnabled = self->_radioIsEnabled;
          radioLibrary = self->_radioLibrary;
          mpRadioLibrary = self->_mpRadioLibrary;
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v44 = radioIsEnabled;
          *(_WORD *)&v44[4] = 2112;
          *(_QWORD *)&v44[6] = radioLibrary;
          *(_WORD *)&v44[14] = 2112;
          *(_QWORD *)&v44[16] = mpRadioLibrary;
          _os_log_impl(&dword_21A7E0000, v21, OS_LOG_TYPE_INFO, "_sendLibraryInfoList: _radioIsEnabled=%d _radioLibrary=%@ _mpRadioLibrary=%@", buf, 0x1Cu);
        }

        -[ACCMediaLibraryShimInfo UIDString](self->_radioLibrary, "UIDString");
        v22 = objc_claimAutoreleasedReturnValue();
        if (-[ACCMediaLibraryShimInfo libraryType](self->_radioLibrary, "libraryType") == 2)
        {
          acc_strings_bundle();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Apple Music Radio"), &stru_24DD265E0, 0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00B88]), "initWithMediaLibrary:name:type:", v22, v34, 2);
          objc_msgSend(v3, "addObject:", v35);

        }
        goto LABEL_56;
      }
      if (v20)
      {
        v22 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v22 = MEMORY[0x24BDACB70];
        v36 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        goto LABEL_56;
      v37 = -[MPRadioLibrary stationCount](self->_mpRadioLibrary, "stationCount");
      v38 = self->_radioIsEnabled;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v44 = v37;
      *(_WORD *)&v44[8] = 1024;
      *(_DWORD *)&v44[10] = v38;
      v26 = "_sendLibraryInfoList: RadioLibrary count(%llu) == 0 _radioIsEnabled=%d";
      v27 = v22;
      v28 = 18;
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v22 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v22 = MEMORY[0x24BDACB70];
        v23 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        goto LABEL_56;
      v24 = self->_radioLibrary;
      v25 = self->_mpRadioLibrary;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v44 = v24;
      *(_WORD *)&v44[8] = 2112;
      *(_QWORD *)&v44[10] = v25;
      v26 = "_sendLibraryInfoList: Error, no RadioLibrary (info=%@ mp=%@)";
      v27 = v22;
      v28 = 22;
    }
    _os_log_impl(&dword_21A7E0000, v27, OS_LOG_TYPE_INFO, v26, buf, v28);
LABEL_56:

LABEL_3:
    if (self->_enableLibraryInfoUpdate && !self->_isShuttingDown)
    {
      p_delegate = &self->_delegate;
      WeakRetained = objc_loadWeakRetained((id *)p_delegate);

      if (WeakRetained)
      {
        v6 = objc_loadWeakRetained((id *)p_delegate);
        v7 = objc_opt_respondsToSelector();

        if ((v7 & 1) != 0)
        {
          v8 = objc_loadWeakRetained((id *)p_delegate);
          objc_msgSend(v8, "notifyAvailableLibraries:", v3);

        }
      }
    }
  }
LABEL_21:

}

- (void)_updateMediaLibraryInfomationUpdates:(BOOL)a3
{
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *libraryList;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (self->_enableLibraryInfoUpdate && !self->_isShuttingDown)
  {
    v4 = a3;
    v5 = -[ACCMediaLibraryShim _checkForDifferentRadioLibrary](self, "_checkForDifferentRadioLibrary");
    v6 = -[ACCMediaLibraryShim _checkForDifferentMediaLibraries](self, "_checkForDifferentMediaLibraries");
    if (self->_enableLibraryInfoUpdate && !self->_isShuttingDown && (v5 || v6 || v4))
    {
      v7 = self->_libraryList;
      libraryList = self->_libraryList;
      self->_libraryList = 0;

      -[ACCMediaLibraryShim _setupNewLibraries:forAccessory:](self, "_setupNewLibraries:forAccessory:", v7, self->_accessory);
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      -[NSMutableDictionary allValues](v7, "allValues", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            v15 = self->_libraryList;
            objc_msgSend(v14, "UIDString");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKey:](v15, "objectForKey:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v17)
            {
              objc_msgSend(v14, "stopSendingMediaLibraryUpdates");
              objc_msgSend(v14, "shuttingDown");
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v11);
      }

      -[ACCMediaLibraryShim _sendLibraryInfoList](self, "_sendLibraryInfoList");
    }
  }
}

- (void)startSendingMediaLibraryInfomationUpdates
{
  BOOL v3;
  id v4;
  NSObject *v5;
  _BOOL4 enableLibraryInfoUpdate;
  NSObject *libraryInfoUpdateQ;
  _QWORD block[5];
  uint8_t buf[4];
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    enableLibraryInfoUpdate = self->_enableLibraryInfoUpdate;
    *(_DWORD *)buf = 67109120;
    v10 = enableLibraryInfoUpdate;
    _os_log_impl(&dword_21A7E0000, v5, OS_LOG_TYPE_DEFAULT, "startSendingMediaLibraryInfomationUpdates _enableLibraryInfoUpdate=%d", buf, 8u);
  }

  if (!self->_enableLibraryInfoUpdate)
  {
    libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__ACCMediaLibraryShim_startSendingMediaLibraryInfomationUpdates__block_invoke;
    block[3] = &unk_24DD25F28;
    block[4] = self;
    dispatch_async(libraryInfoUpdateQ, block);
  }
}

uint64_t __64__ACCMediaLibraryShim_startSendingMediaLibraryInfomationUpdates__block_invoke(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  int v5;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 32);
    v7[0] = 67109376;
    v7[1] = v5;
    v8 = 1024;
    v9 = 1;
    _os_log_impl(&dword_21A7E0000, v4, OS_LOG_TYPE_INFO, "startSendingMediaLibraryInfomationUpdates: _updateMediaLibraryInfomationUpdates:true _enableLibraryInfoUpdate=%d->%d", (uint8_t *)v7, 0xEu);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_updateMediaLibraryInfomationUpdates:", 1);
}

- (void)stopSendingMediaLibraryInfomationUpdates
{
  BOOL v3;
  id v4;
  NSObject *v5;
  _BOOL4 enableLibraryInfoUpdate;
  NSObject *libraryInfoUpdateQ;
  _QWORD block[5];
  uint8_t buf[4];
  _BOOL4 v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    enableLibraryInfoUpdate = self->_enableLibraryInfoUpdate;
    *(_DWORD *)buf = 67109376;
    v10 = enableLibraryInfoUpdate;
    v11 = 1024;
    v12 = 0;
    _os_log_impl(&dword_21A7E0000, v5, OS_LOG_TYPE_DEFAULT, "stopSendingMediaLibraryInfomationUpdates _enableLibraryInfoUpdate=%d->%d", buf, 0xEu);
  }

  self->_enableLibraryInfoUpdate = 0;
  libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__ACCMediaLibraryShim_stopSendingMediaLibraryInfomationUpdates__block_invoke;
  block[3] = &unk_24DD25F28;
  block[4] = self;
  dispatch_async(libraryInfoUpdateQ, block);
}

uint64_t __63__ACCMediaLibraryShim_stopSendingMediaLibraryInfomationUpdates__block_invoke(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  int v5;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 32);
    v7[0] = 67109376;
    v7[1] = v5;
    v8 = 1024;
    v9 = 0;
    _os_log_impl(&dword_21A7E0000, v4, OS_LOG_TYPE_INFO, "_updateMediaLibraryInfomationUpdates:false _enableLibraryInfoUpdate=%d->%d", (uint8_t *)v7, 0xEu);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_updateMediaLibraryInfomationUpdates:", 0);
}

- (BOOL)isGeniusMixesSupported
{
  int AppBooleanValue;

  AppBooleanValue = isGeniusMixesSupported___bGeniusMixSupportEnable;
  if (isGeniusMixesSupported___bGeniusMixSupportEnable == -1)
  {
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("GeniusMixSupport"), CFSTR("com.apple.iapd"), 0);
    isGeniusMixesSupported___bGeniusMixSupportEnable = AppBooleanValue;
  }
  return AppBooleanValue != 0;
}

- (void)startMediaLibraryUpdate:(id)a3 lastRevision:(id)a4 requestedInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *libraryInfoUpdateQ;
  void *v32;
  void *v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD block[5];
  id v40;
  id v41;
  id v42;
  char v43;
  char v44;
  char v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  id v52;
  __int16 v53;
  id v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (gLogObjects)
    v11 = gNumLogObjects < 1;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v13 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    ACCMediaLibraryFeatureRequestedInfoDesc(v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v52 = v7;
    v53 = 2112;
    v54 = v8;
    v55 = 2112;
    v56 = v14;
    _os_log_impl(&dword_21A7E0000, v13, OS_LOG_TYPE_DEFAULT, "startMediaLibraryUpdate:%@ lastRevision:%@ requestedInfo:%@", buf, 0x20u);

  }
  v32 = v8;

  v33 = v7;
  objc_msgSend(v10, "setValue:forKey:", v7, CFSTR("LibUID"));
  objc_msgSend(v10, "setValue:forKey:", CFSTR("1"), CFSTR("Progress"));
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v15 = v9;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v16)
  {
    v17 = v16;
    v35 = 0;
    v34 = 0;
    v38 = *(_QWORD *)v47;
    v37 = *MEMORY[0x24BE00B68];
    v36 = *MEMORY[0x24BE00B50];
    v18 = *MEMORY[0x24BE00B60];
    v19 = *MEMORY[0x24BE00B70];
    v20 = *MEMORY[0x24BE00B48];
    v21 = *MEMORY[0x24BE00B58];
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v47 != v38)
          objc_enumerationMutation(v15);
        v23 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        if (objc_msgSend(v23, "isEqualToString:", v37))
        {
          objc_msgSend(v15, "objectForKey:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setValue:forKey:", v24, CFSTR("PlaylistProperty"));

        }
        if (objc_msgSend(v23, "isEqualToString:", v36))
        {
          objc_msgSend(v15, "objectForKey:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setValue:forKey:", v25, CFSTR("ItemProperty"));

        }
        if (objc_msgSend(v23, "isEqualToString:", v18))
        {
          objc_msgSend(v15, "objectForKey:", v23);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setValue:forKey:", v26, CFSTR("PlaylistContentStyle"));
          if (objc_msgSend(v26, "intValue") == 1 || objc_msgSend(v26, "intValue") == 3)
            v34 = 1;
          if (objc_msgSend(v26, "intValue") == 2 || objc_msgSend(v26, "intValue") == 3)
            LOBYTE(v35) = 1;

        }
        if (objc_msgSend(v23, "isEqualToString:", v19))
        {
          objc_msgSend(v15, "objectForKey:", v23);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setValue:forKey:", v27, CFSTR("PlaylistContentItemProperty"));

          BYTE4(v35) = 1;
        }
        if (objc_msgSend(v23, "isEqualToString:", v20))
        {
          objc_msgSend(v15, "objectForKey:", v23);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setValue:forKey:", v28, CFSTR("HideNonLocal"));

        }
        if (objc_msgSend(v23, "isEqualToString:", v21))
        {
          objc_msgSend(v15, "objectForKey:", v23);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setValue:forKey:", v29, CFSTR("PlayAllSongsCapable"));

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v17);
  }
  else
  {
    v35 = 0;
    v34 = 0;
  }

  if (!self->_isShuttingDown)
  {
    libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__ACCMediaLibraryShim_startMediaLibraryUpdate_lastRevision_requestedInfo___block_invoke;
    block[3] = &unk_24DD25FE0;
    block[4] = self;
    v40 = v10;
    v43 = v34 & 1;
    v44 = v35 & 1;
    v45 = BYTE4(v35) & 1;
    v41 = v32;
    v42 = v33;
    dispatch_async(libraryInfoUpdateQ, block);

  }
}

void __74__ACCMediaLibraryShim_startMediaLibraryUpdate_lastRevision_requestedInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  int v11;
  int v12;
  int v13;
  int v14;
  void *v15;
  __int16 v16;
  _BYTE v17[10];
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 33))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("LibUID"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKey:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 && (objc_msgSend(v3, "isShuttingDown") & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v9 = MEMORY[0x24BDACB70];
        v10 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = *(unsigned __int8 *)(a1 + 64);
        v12 = *(unsigned __int8 *)(a1 + 65);
        v13 = *(unsigned __int8 *)(a1 + 66);
        v14 = 138413058;
        v15 = v4;
        v16 = 1024;
        *(_DWORD *)v17 = v11;
        *(_WORD *)&v17[4] = 1024;
        *(_DWORD *)&v17[6] = v12;
        v18 = 1024;
        v19 = v13;
        _os_log_impl(&dword_21A7E0000, v9, OS_LOG_TYPE_INFO, "startSendingMediaLibraryUpdates: libraryinInfo=%@ requestedPlaylistContentTransferID=%d requestedPlaylistContentMetaList=%d requestedPlaylistContentMetaProperties=%d", (uint8_t *)&v14, 0x1Eu);
      }

      objc_msgSend(v4, "startSendingMediaLibraryUpdates:lastRevision:requestedTransferID:requestedMetaList:requestedMetaProperties:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), *(unsigned __int8 *)(a1 + 66));
    }
    else
    {
      if (gLogObjects)
        v5 = gNumLogObjects < 1;
      else
        v5 = 1;
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v7 = MEMORY[0x24BDACB70];
        v6 = MEMORY[0x24BDACB70];
      }
      else
      {
        v7 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(void **)(a1 + 56);
        v14 = 138412546;
        v15 = v8;
        v16 = 2112;
        *(_QWORD *)v17 = v4;
        _os_log_impl(&dword_21A7E0000, v7, OS_LOG_TYPE_DEFAULT, "startSendingMediaLibraryUpdates: WARNING No libraryInfo or shuttingDown for mediaLibraryUID=%@ libraryInfo=%@", (uint8_t *)&v14, 0x16u);
      }

    }
  }
}

- (void)stopMediaLibraryUpdate:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  _BOOL4 isShuttingDown;
  NSObject *libraryInfoUpdateQ;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    isShuttingDown = self->_isShuttingDown;
    *(_DWORD *)buf = 138412546;
    v13 = v4;
    v14 = 1024;
    v15 = isShuttingDown;
    _os_log_impl(&dword_21A7E0000, v7, OS_LOG_TYPE_DEFAULT, "stopMediaLibraryUpdate: %@ _isShuttingDown=%d", buf, 0x12u);
  }

  if (!self->_isShuttingDown)
  {
    libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __46__ACCMediaLibraryShim_stopMediaLibraryUpdate___block_invoke;
    v10[3] = &unk_24DD25ED8;
    v10[4] = self;
    v11 = v4;
    dispatch_async(libraryInfoUpdateQ, v10);

  }
}

void __46__ACCMediaLibraryShim_stopMediaLibraryUpdate___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 33))
  {
    objc_msgSend(*(id *)(v1 + 64), "objectForKey:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 && (objc_msgSend(v3, "isShuttingDown") & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v9 = MEMORY[0x24BDACB70];
        v10 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v4;
        _os_log_impl(&dword_21A7E0000, v9, OS_LOG_TYPE_INFO, "stopMediaLibraryUpdate: libraryInfo=%@, call stopSendingMediaLibraryUpdates:", (uint8_t *)&v12, 0xCu);
      }

      objc_msgSend(v4, "stopSendingMediaLibraryUpdates");
    }
    else
    {
      if (gLogObjects)
        v5 = gNumLogObjects < 1;
      else
        v5 = 1;
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v7 = MEMORY[0x24BDACB70];
        v6 = MEMORY[0x24BDACB70];
      }
      else
      {
        v7 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(void **)(a1 + 40);
        v12 = 138412290;
        v13 = v8;
        _os_log_impl(&dword_21A7E0000, v7, OS_LOG_TYPE_DEFAULT, "stopMediaLibraryUpdate: WARNING No libraryInfo or shuttingDown for mediaLibraryUID=%@", (uint8_t *)&v12, 0xCu);
      }

    }
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    if (v11)
      objc_msgSend(v11, "clearAllUpdatesForLibrary:", *(_QWORD *)(a1 + 40));

  }
}

- (void)stopAllMediaLibraryUpdate
{
  BOOL v3;
  id v4;
  NSObject *v5;
  _BOOL4 isShuttingDown;
  NSObject *libraryInfoUpdateQ;
  _QWORD block[5];
  uint8_t buf[4];
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    isShuttingDown = self->_isShuttingDown;
    *(_DWORD *)buf = 67109120;
    v10 = isShuttingDown;
    _os_log_impl(&dword_21A7E0000, v5, OS_LOG_TYPE_DEFAULT, "stopAllMediaLibraryUpdate _isShuttingDown=%d", buf, 8u);
  }

  if (!self->_isShuttingDown)
  {
    libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__ACCMediaLibraryShim_stopAllMediaLibraryUpdate__block_invoke;
    block[3] = &unk_24DD25F28;
    block[4] = self;
    dispatch_async(libraryInfoUpdateQ, block);
  }
}

_QWORD *__48__ACCMediaLibraryShim_stopAllMediaLibraryUpdate__block_invoke(_QWORD *result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t i;
  void *v8;
  char v9;
  uint64_t v10;
  int v11;
  BOOL v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  _QWORD *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v1 = result[4];
  if (!*(_BYTE *)(v1 + 33))
  {
    v19 = result;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(*(id *)(v1 + 64), "allValues");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v21;
      v6 = MEMORY[0x24BDACB70];
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v21 != v5)
            objc_enumerationMutation(v2);
          v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          v9 = objc_msgSend(v8, "isShuttingDown");
          v10 = gLogObjects;
          v11 = gNumLogObjects;
          if (gLogObjects)
            v12 = gNumLogObjects <= 0;
          else
            v12 = 1;
          v13 = !v12;
          if ((v9 & 1) != 0)
          {
            if (v13)
            {
              v14 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                v26 = v10;
                v27 = 1024;
                v28 = v11;
                _os_log_error_impl(&dword_21A7E0000, v6, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v16 = v6;
              v14 = v6;
            }
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v8, "UIDString");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v26 = (uint64_t)v17;
              _os_log_impl(&dword_21A7E0000, v14, OS_LOG_TYPE_DEFAULT, "stopAllMediaLibraryUpdate: WARNING No libraryInfo or shuttingDown for libraryInfo.UIDString=%@", buf, 0xCu);

            }
          }
          else
          {
            if (v13)
            {
              v15 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                v26 = v10;
                v27 = 1024;
                v28 = v11;
                _os_log_error_impl(&dword_21A7E0000, v6, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v18 = v6;
              v15 = v6;
            }
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v26 = (uint64_t)v8;
              _os_log_impl(&dword_21A7E0000, v15, OS_LOG_TYPE_INFO, "stopAllMediaLibraryUpdate: libraryInfo=%@, call stopSendingMediaLibraryUpdates:", buf, 0xCu);
            }

            objc_msgSend(v8, "stopSendingMediaLibraryUpdates");
          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v4);
    }

    result = *(_QWORD **)(v19[4] + 48);
    if (result)
      return (_QWORD *)objc_msgSend(result, "clearAllUpdates");
  }
  return result;
}

- (void)playMediaLibraryCurrentSelection:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  _BOOL4 isShuttingDown;
  NSObject *libraryInfoUpdateQ;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    isShuttingDown = self->_isShuttingDown;
    *(_DWORD *)buf = 138412546;
    v13 = v4;
    v14 = 1024;
    v15 = isShuttingDown;
    _os_log_impl(&dword_21A7E0000, v7, OS_LOG_TYPE_DEFAULT, "playMediaLibraryCurrentSelection: %@ _isShuttingDown=%d", buf, 0x12u);
  }

  if (!self->_isShuttingDown)
  {
    libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __56__ACCMediaLibraryShim_playMediaLibraryCurrentSelection___block_invoke;
    v10[3] = &unk_24DD25ED8;
    v10[4] = self;
    v11 = v4;
    dispatch_async(libraryInfoUpdateQ, v10);

  }
}

void __56__ACCMediaLibraryShim_playMediaLibraryCurrentSelection___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 33))
  {
    objc_msgSend(*(id *)(v1 + 64), "objectForKey:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 && (objc_msgSend(v3, "isShuttingDown") & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v9 = MEMORY[0x24BDACB70];
        v10 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v4;
        _os_log_impl(&dword_21A7E0000, v9, OS_LOG_TYPE_INFO, "playMediaLibraryCurrentSelection: libraryInfo=%@, call startMLPlaybackWithResume:", (uint8_t *)&v11, 0xCu);
      }

      objc_msgSend(v4, "startMLPlaybackWithResume:", 1);
    }
    else
    {
      if (gLogObjects)
        v5 = gNumLogObjects < 1;
      else
        v5 = 1;
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v7 = MEMORY[0x24BDACB70];
        v6 = MEMORY[0x24BDACB70];
      }
      else
      {
        v7 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(void **)(a1 + 40);
        v11 = 138412290;
        v12 = v8;
        _os_log_impl(&dword_21A7E0000, v7, OS_LOG_TYPE_DEFAULT, "playMediaLibraryCurrentSelection: WARNING No libraryInfo or shuttingDown for mediaLibraryUID=%@", (uint8_t *)&v11, 0xCu);
      }

    }
  }
}

- (void)playMediaLibraryItems:(id)a3 itemList:(id)a4 firstItemIndex:(unint64_t)a5
{
  id v8;
  id v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  _BOOL4 isShuttingDown;
  NSObject *libraryInfoUpdateQ;
  _QWORD v16[5];
  id v17;
  id v18;
  unint64_t v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (gLogObjects)
    v10 = gNumLogObjects < 1;
  else
    v10 = 1;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v12 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  else
  {
    v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(v9, "count");
    isShuttingDown = self->_isShuttingDown;
    *(_DWORD *)buf = 138413058;
    v21 = v8;
    v22 = 2048;
    v23 = v13;
    v24 = 2048;
    v25 = a5;
    v26 = 1024;
    v27 = isShuttingDown;
    _os_log_impl(&dword_21A7E0000, v12, OS_LOG_TYPE_DEFAULT, "playMediaLibraryItems: %@ itemList.count:%lu firstItemIndex:%lu _isShuttingDown=%d", buf, 0x26u);
  }

  if (!self->_isShuttingDown)
  {
    libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __69__ACCMediaLibraryShim_playMediaLibraryItems_itemList_firstItemIndex___block_invoke;
    v16[3] = &unk_24DD26008;
    v16[4] = self;
    v17 = v8;
    v18 = v9;
    v19 = a5;
    dispatch_async(libraryInfoUpdateQ, v16);

  }
}

void __69__ACCMediaLibraryShim_playMediaLibraryItems_itemList_firstItemIndex___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 33))
  {
    objc_msgSend(*(id *)(v1 + 64), "objectForKey:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 && (objc_msgSend(v3, "isShuttingDown") & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v9 = MEMORY[0x24BDACB70];
        v10 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = objc_msgSend(*(id *)(a1 + 48), "count");
        v12 = *(_QWORD *)(a1 + 56);
        v13 = 138412802;
        v14 = v4;
        v15 = 2048;
        v16 = v11;
        v17 = 2048;
        v18 = v12;
        _os_log_impl(&dword_21A7E0000, v9, OS_LOG_TYPE_INFO, "playMediaLibraryItems: libraryInfo=%@  itemList.count=%lu firstItemIndex=%lu, call startPlaybackOfItems:witFirst:", (uint8_t *)&v13, 0x20u);
      }

      objc_msgSend(v4, "startPlaybackOfItems:withFirst:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56));
    }
    else
    {
      if (gLogObjects)
        v5 = gNumLogObjects < 1;
      else
        v5 = 1;
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v7 = MEMORY[0x24BDACB70];
        v6 = MEMORY[0x24BDACB70];
      }
      else
      {
        v7 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(void **)(a1 + 40);
        v13 = 138412290;
        v14 = v8;
        _os_log_impl(&dword_21A7E0000, v7, OS_LOG_TYPE_DEFAULT, "playMediaLibraryItems: WARNING No libraryInfo or shuttingDown for mediaLibraryUID=%@", (uint8_t *)&v13, 0xCu);
      }

    }
  }
}

- (void)playMediaLibraryCollection:(id)a3 collection:(unint64_t)a4 type:(int)a5 firstItemIndex:(unint64_t)a6
{
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  _BOOL4 isShuttingDown;
  NSObject *libraryInfoUpdateQ;
  _QWORD block[5];
  id v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  int v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  if (gLogObjects)
    v11 = gNumLogObjects < 1;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v13 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    isShuttingDown = self->_isShuttingDown;
    *(_DWORD *)buf = 138413314;
    v22 = v10;
    v23 = 2048;
    v24 = a4;
    v25 = 1024;
    v26 = a5;
    v27 = 2048;
    v28 = a6;
    v29 = 1024;
    v30 = isShuttingDown;
    _os_log_impl(&dword_21A7E0000, v13, OS_LOG_TYPE_DEFAULT, "playMediaLibraryCollection: %@ collectionPersistentID:%llu collectionType:%d firstItemIndex:%lu _isShuttingDown=%d", buf, 0x2Cu);
  }

  if (!self->_isShuttingDown)
  {
    libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __81__ACCMediaLibraryShim_playMediaLibraryCollection_collection_type_firstItemIndex___block_invoke;
    block[3] = &unk_24DD26030;
    block[4] = self;
    v17 = v10;
    v18 = a4;
    v20 = a5;
    v19 = a6;
    dispatch_async(libraryInfoUpdateQ, block);

  }
}

void __81__ACCMediaLibraryShim_playMediaLibraryCollection_collection_type_firstItemIndex___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 33))
  {
    objc_msgSend(*(id *)(v1 + 64), "objectForKey:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 && (objc_msgSend(v3, "isShuttingDown") & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v9 = MEMORY[0x24BDACB70];
        v10 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = *(_DWORD *)(a1 + 64);
        v12 = *(_QWORD *)(a1 + 48);
        v13 = *(_QWORD *)(a1 + 56);
        v14 = 138413058;
        v15 = v4;
        v16 = 2048;
        v17 = v12;
        v18 = 1024;
        v19 = v11;
        v20 = 2048;
        v21 = v13;
        _os_log_impl(&dword_21A7E0000, v9, OS_LOG_TYPE_INFO, "playMediaLibraryCollection: libraryInfo=%@ collectionPersistentID=%llu collectionType=%d firstItemIndex=%lu, call startPlaybackOfCollection:ofType:withFirst:", (uint8_t *)&v14, 0x26u);
      }

      objc_msgSend(v4, "startPlaybackOfCollection:ofType:withFirst:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), *(unsigned int *)(a1 + 56));
    }
    else
    {
      if (gLogObjects)
        v5 = gNumLogObjects < 1;
      else
        v5 = 1;
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v7 = MEMORY[0x24BDACB70];
        v6 = MEMORY[0x24BDACB70];
      }
      else
      {
        v7 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(void **)(a1 + 40);
        v14 = 138412290;
        v15 = v8;
        _os_log_impl(&dword_21A7E0000, v7, OS_LOG_TYPE_DEFAULT, "playMediaLibraryCollection WARNING No libraryInfo or shuttingDown for mediaLibraryUID=%@", (uint8_t *)&v14, 0xCu);
      }

    }
  }
}

- (void)playMediaLibraryCollection:(id)a3 collection:(unint64_t)a4 type:(int)a5 firstItemPersistentID:(unint64_t)a6
{
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  _BOOL4 isShuttingDown;
  NSObject *libraryInfoUpdateQ;
  _QWORD block[5];
  id v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  int v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  if (gLogObjects)
    v11 = gNumLogObjects < 1;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v13 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    isShuttingDown = self->_isShuttingDown;
    *(_DWORD *)buf = 138413314;
    v22 = v10;
    v23 = 2048;
    v24 = a4;
    v25 = 1024;
    v26 = a5;
    v27 = 2048;
    v28 = a6;
    v29 = 1024;
    v30 = isShuttingDown;
    _os_log_impl(&dword_21A7E0000, v13, OS_LOG_TYPE_DEFAULT, "playMediaLibraryCollection: %@ collectionPersistentID:%llu collectionType:%d firstItemPersistentID:%llu _isShuttingDown=%d", buf, 0x2Cu);
  }

  if (!self->_isShuttingDown)
  {
    libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __88__ACCMediaLibraryShim_playMediaLibraryCollection_collection_type_firstItemPersistentID___block_invoke;
    block[3] = &unk_24DD26030;
    block[4] = self;
    v17 = v10;
    v18 = a4;
    v20 = a5;
    v19 = a6;
    dispatch_async(libraryInfoUpdateQ, block);

  }
}

void __88__ACCMediaLibraryShim_playMediaLibraryCollection_collection_type_firstItemPersistentID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 33))
  {
    objc_msgSend(*(id *)(v1 + 64), "objectForKey:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 && (objc_msgSend(v3, "isShuttingDown") & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v9 = MEMORY[0x24BDACB70];
        v10 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = *(_DWORD *)(a1 + 64);
        v12 = *(_QWORD *)(a1 + 48);
        v13 = *(_QWORD *)(a1 + 56);
        v14 = 138413058;
        v15 = v4;
        v16 = 2048;
        v17 = v12;
        v18 = 1024;
        v19 = v11;
        v20 = 2048;
        v21 = v13;
        _os_log_impl(&dword_21A7E0000, v9, OS_LOG_TYPE_INFO, "playMediaLibraryCollection: libraryInfo=%@ collectionPersistentID=%llu collectionType=%d firstItemPersistentID%llu, call startPlaybackOfCollection:ofType:withFirstPersistentID:", (uint8_t *)&v14, 0x26u);
      }

      objc_msgSend(v4, "startPlaybackOfCollection:ofType:withFirstPersistentID:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 56));
    }
    else
    {
      if (gLogObjects)
        v5 = gNumLogObjects < 1;
      else
        v5 = 1;
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v7 = MEMORY[0x24BDACB70];
        v6 = MEMORY[0x24BDACB70];
      }
      else
      {
        v7 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(void **)(a1 + 40);
        v14 = 138412290;
        v15 = v8;
        _os_log_impl(&dword_21A7E0000, v7, OS_LOG_TYPE_DEFAULT, "playMediaLibraryCollection: WARNING No libraryInfo or shuttingDown for mediaLibraryUID=%@", (uint8_t *)&v14, 0xCu);
      }

    }
  }
}

- (void)playAllSongs:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  _BOOL4 isShuttingDown;
  NSObject *libraryInfoUpdateQ;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    isShuttingDown = self->_isShuttingDown;
    *(_DWORD *)buf = 138412546;
    v13 = v4;
    v14 = 1024;
    v15 = isShuttingDown;
    _os_log_impl(&dword_21A7E0000, v7, OS_LOG_TYPE_DEFAULT, "playAllSongs: %@ _isShuttingDown=%d", buf, 0x12u);
  }

  if (!self->_isShuttingDown)
  {
    libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __36__ACCMediaLibraryShim_playAllSongs___block_invoke;
    v10[3] = &unk_24DD25ED8;
    v10[4] = self;
    v11 = v4;
    dispatch_async(libraryInfoUpdateQ, v10);

  }
}

void __36__ACCMediaLibraryShim_playAllSongs___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 33))
  {
    objc_msgSend(*(id *)(v1 + 64), "objectForKey:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 && (objc_msgSend(v3, "isShuttingDown") & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v9 = MEMORY[0x24BDACB70];
        v10 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v4;
        _os_log_impl(&dword_21A7E0000, v9, OS_LOG_TYPE_INFO, "playAllSongs: libraryInfo=%@ call startMLPlaybackOfAllSongs", (uint8_t *)&v11, 0xCu);
      }

      objc_msgSend(v4, "startMLPlaybackOfAllSongs");
    }
    else
    {
      if (gLogObjects)
        v5 = gNumLogObjects < 1;
      else
        v5 = 1;
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v7 = MEMORY[0x24BDACB70];
        v6 = MEMORY[0x24BDACB70];
      }
      else
      {
        v7 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(void **)(a1 + 40);
        v11 = 138412290;
        v12 = v8;
        _os_log_impl(&dword_21A7E0000, v7, OS_LOG_TYPE_DEFAULT, "playAllSongs: WARNING No libraryInfo or shuttingDown for mediaLibraryUID=%@", (uint8_t *)&v11, 0xCu);
      }

    }
  }
}

- (void)playAllSongs:(id)a3 firstItemPersistentID:(unint64_t)a4
{
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  _BOOL4 isShuttingDown;
  NSObject *libraryInfoUpdateQ;
  _QWORD block[5];
  id v13;
  unint64_t v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (gLogObjects)
    v7 = gNumLogObjects < 1;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    isShuttingDown = self->_isShuttingDown;
    *(_DWORD *)buf = 138412802;
    v16 = v6;
    v17 = 2048;
    v18 = a4;
    v19 = 1024;
    v20 = isShuttingDown;
    _os_log_impl(&dword_21A7E0000, v9, OS_LOG_TYPE_DEFAULT, "playAllSongs: %@ firstItemPersistentID:%llu _isShuttingDown=%d", buf, 0x1Cu);
  }

  if (!self->_isShuttingDown)
  {
    libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__ACCMediaLibraryShim_playAllSongs_firstItemPersistentID___block_invoke;
    block[3] = &unk_24DD26058;
    block[4] = self;
    v13 = v6;
    v14 = a4;
    dispatch_async(libraryInfoUpdateQ, block);

  }
}

void __58__ACCMediaLibraryShim_playAllSongs_firstItemPersistentID___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = a1[4];
  if (!*(_BYTE *)(v1 + 33))
  {
    objc_msgSend(*(id *)(v1 + 64), "objectForKey:", a1[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 && (objc_msgSend(v3, "isShuttingDown") & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v9 = MEMORY[0x24BDACB70];
        v10 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = a1[6];
        v12 = 138412546;
        v13 = v4;
        v14 = 2048;
        v15 = v11;
        _os_log_impl(&dword_21A7E0000, v9, OS_LOG_TYPE_INFO, "playAllSongs: libraryInfo=%@ firstItemPersistentID=%llu, call startMLPlaybackOfAllSongsStartPersistentID:", (uint8_t *)&v12, 0x16u);
      }

      objc_msgSend(v4, "startMLPlaybackOfAllSongsStartPersistentID:", a1[6]);
    }
    else
    {
      if (gLogObjects)
        v5 = gNumLogObjects < 1;
      else
        v5 = 1;
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v7 = MEMORY[0x24BDACB70];
        v6 = MEMORY[0x24BDACB70];
      }
      else
      {
        v7 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (void *)a1[5];
        v12 = 138412290;
        v13 = v8;
        _os_log_impl(&dword_21A7E0000, v7, OS_LOG_TYPE_DEFAULT, "playAllSongs: WARNING No libraryInfo or shuttingDown for mediaLibraryUID=%@", (uint8_t *)&v12, 0xCu);
      }

    }
  }
}

- (void)confirmMediaLibraryUpdate:(id)a3 lastRevision:(id)a4 updateCount:(unsigned int)a5
{
  id v8;
  id v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  _BOOL4 isShuttingDown;
  NSObject *libraryInfoUpdateQ;
  _QWORD v15[5];
  id v16;
  id v17;
  unsigned int v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (gLogObjects)
    v10 = gNumLogObjects < 1;
  else
    v10 = 1;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v12 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  else
  {
    v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    isShuttingDown = self->_isShuttingDown;
    *(_DWORD *)buf = 138412802;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    v23 = 1024;
    v24 = isShuttingDown;
    _os_log_impl(&dword_21A7E0000, v12, OS_LOG_TYPE_DEFAULT, "confirmMediaLibraryUpdate: %@ lastRevision:%@ _isShuttingDown=%d", buf, 0x1Cu);
  }

  if (!self->_isShuttingDown)
  {
    libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __74__ACCMediaLibraryShim_confirmMediaLibraryUpdate_lastRevision_updateCount___block_invoke;
    v15[3] = &unk_24DD26080;
    v15[4] = self;
    v16 = v8;
    v17 = v9;
    v18 = a5;
    dispatch_async(libraryInfoUpdateQ, v15);

  }
}

void __74__ACCMediaLibraryShim_confirmMediaLibraryUpdate_lastRevision_updateCount___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  int v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 33))
  {
    objc_msgSend(*(id *)(v1 + 64), "objectForKey:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 && (objc_msgSend(v3, "isShuttingDown") & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v9 = MEMORY[0x24BDACB70];
        v10 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = *(_QWORD *)(a1 + 48);
        v12 = *(_DWORD *)(a1 + 56);
        v13 = 138412802;
        v14 = v4;
        v15 = 2112;
        v16 = v11;
        v17 = 1024;
        v18 = v12;
        _os_log_impl(&dword_21A7E0000, v9, OS_LOG_TYPE_INFO, "confirmMediaLibraryUpdateLastRevision: libraryInfo=%@ lastRevision=%@ count=%d, call confirmMediaLibraryUpdateLastRevision:updateCount:", (uint8_t *)&v13, 0x1Cu);
      }

      objc_msgSend(v4, "confirmMediaLibraryUpdateLastRevision:updateCount:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56));
    }
    else
    {
      if (gLogObjects)
        v5 = gNumLogObjects < 1;
      else
        v5 = 1;
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v7 = MEMORY[0x24BDACB70];
        v6 = MEMORY[0x24BDACB70];
      }
      else
      {
        v7 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(void **)(a1 + 40);
        v13 = 138412290;
        v14 = v8;
        _os_log_impl(&dword_21A7E0000, v7, OS_LOG_TYPE_DEFAULT, "confirmMediaLibraryUpdate: WARNING No libraryInfo or shuttingDown for mediaLibraryUID=%@", (uint8_t *)&v13, 0xCu);
      }

    }
  }
}

- (void)confirmMediaLibraryPlaylistContentUpdate:(id)a3 lastRevision:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  _BOOL4 isShuttingDown;
  NSObject *libraryInfoUpdateQ;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    isShuttingDown = self->_isShuttingDown;
    *(_DWORD *)buf = 138412802;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    v20 = 1024;
    v21 = isShuttingDown;
    _os_log_impl(&dword_21A7E0000, v10, OS_LOG_TYPE_DEFAULT, "confirmMediaLibraryPlaylistContentUpdate: %@ lastRevision:%@ _isShuttingDown=%d", buf, 0x1Cu);
  }

  if (!self->_isShuttingDown)
  {
    libraryInfoUpdateQ = self->_libraryInfoUpdateQ;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __77__ACCMediaLibraryShim_confirmMediaLibraryPlaylistContentUpdate_lastRevision___block_invoke;
    block[3] = &unk_24DD25FB8;
    block[4] = self;
    v14 = v6;
    v15 = v7;
    dispatch_async(libraryInfoUpdateQ, block);

  }
}

void __77__ACCMediaLibraryShim_confirmMediaLibraryPlaylistContentUpdate_lastRevision___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = a1[4];
  if (!*(_BYTE *)(v1 + 33))
  {
    objc_msgSend(*(id *)(v1 + 64), "objectForKey:", a1[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 && (objc_msgSend(v3, "isShuttingDown") & 1) == 0)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v9 = MEMORY[0x24BDACB70];
        v10 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = a1[6];
        v12 = 138412546;
        v13 = v4;
        v14 = 2112;
        v15 = v11;
        _os_log_impl(&dword_21A7E0000, v9, OS_LOG_TYPE_INFO, "confirmMediaLibraryPlaylistContentUpdate: libraryInfo=%@ lastRevision=%@, call confirmMediaLibraryPlaylistContentUpdateLastRevision:", (uint8_t *)&v12, 0x16u);
      }

      objc_msgSend(v4, "confirmMediaLibraryPlaylistContentUpdateLastRevision:", a1[6]);
    }
    else
    {
      if (gLogObjects)
        v5 = gNumLogObjects < 1;
      else
        v5 = 1;
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v7 = MEMORY[0x24BDACB70];
        v6 = MEMORY[0x24BDACB70];
      }
      else
      {
        v7 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (void *)a1[5];
        v12 = 138412290;
        v13 = v8;
        _os_log_impl(&dword_21A7E0000, v7, OS_LOG_TYPE_DEFAULT, "confirmMediaLibraryPlaylistContentUpdate: WARNING No libraryInfo or shuttingDown for mediaLibraryUID=%@", (uint8_t *)&v12, 0xCu);
      }

    }
  }
}

- (ACCMediaLibraryAccessory)accessory
{
  return self->_accessory;
}

- (BOOL)isShuttingDown
{
  return self->_isShuttingDown;
}

- (OS_dispatch_queue)libraryInfoUpdateQ
{
  return self->_libraryInfoUpdateQ;
}

- (NSMutableDictionary)libraryList
{
  return self->_libraryList;
}

- (ACCMediaLibraryShimInfo)deviceLibrary
{
  return self->_deviceLibrary;
}

- (ACCMediaLibraryShimInfo)radioLibrary
{
  return self->_radioLibrary;
}

- (BOOL)radioIsEnabled
{
  return self->_radioIsEnabled;
}

- (BOOL)subscribedToAppleMusic
{
  return self->_subscribedToAppleMusic;
}

- (unsigned)windowPerLibrary
{
  return self->_windowPerLibrary;
}

- (void)setWindowPerLibrary:(unsigned int)a3
{
  self->_windowPerLibrary = a3;
}

- (ACCMediaLibraryShimDelegate)delegate
{
  return (ACCMediaLibraryShimDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (ACCMemUsageStat)memUse
{
  return self->_memUse;
}

- (BOOL)isSubscribedToAppleMusic
{
  return self->_isSubscribedToAppleMusic;
}

- (void)setIsSubscribedToAppleMusic:(BOOL)a3
{
  self->_isSubscribedToAppleMusic = a3;
}

- (ACCSettingsState)measureMemoryUsage
{
  return self->_measureMemoryUsage;
}

- (void)setMeasureMemoryUsage:(id)a3
{
  objc_storeStrong((id *)&self->_measureMemoryUsage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measureMemoryUsage, 0);
  objc_storeStrong((id *)&self->_memUse, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_radioLibrary, 0);
  objc_storeStrong((id *)&self->_deviceLibrary, 0);
  objc_storeStrong((id *)&self->_libraryList, 0);
  objc_storeStrong((id *)&self->_libraryInfoUpdateQ, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_mpRadioLibrary, 0);
  objc_storeStrong((id *)&self->_deviceMediaLibrary, 0);
  objc_storeStrong((id *)&self->_libraries, 0);
}

- (void)_setupNewLibraries:forAccessory:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10(&dword_21A7E0000, v0, (uint64_t)v0, "_setupNewLibraries: _libraries=%@  _libraryList=%@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)_setupNewLibraries:(NSObject *)a3 forAccessory:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 16);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_10(&dword_21A7E0000, a3, (uint64_t)a3, "_setupNewLibraries: _deviceMediaLibrary=%@  libs=%@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

@end
