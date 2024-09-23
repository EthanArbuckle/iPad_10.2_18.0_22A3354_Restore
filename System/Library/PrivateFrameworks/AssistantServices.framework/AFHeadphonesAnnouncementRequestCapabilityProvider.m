@implementation AFHeadphonesAnnouncementRequestCapabilityProvider

- (id)_init
{
  AFHeadphonesAnnouncementRequestCapabilityProvider *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  dispatch_group_t v6;
  OS_dispatch_group *group;
  void *v8;
  AFNotifyObserver *v9;
  void *v10;
  uint64_t v11;
  AFNotifyObserver *pairedInfoChangeObserver;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  AFNotifyObserver *v19;
  AFNotifyObserver *forcedUpdateObserver;
  uint64_t v21;
  NSHashTable *delegates;
  id result;
  void *v24;
  void *v25;
  objc_super v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v26.receiver = self;
  v26.super_class = (Class)AFHeadphonesAnnouncementRequestCapabilityProvider;
  v2 = -[AFHeadphonesAnnouncementRequestCapabilityProvider init](&v26, sel_init);
  if (!v2)
    return v2;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("AFHeadphonesAnnouncementRequestCapabilityProvider", v3);

  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v4;

  v6 = dispatch_group_create();
  group = v2->_group;
  v2->_group = (OS_dispatch_group *)v6;

  -[AFHeadphonesAnnouncementRequestCapabilityProvider _headphonesMonitor](v2, "_headphonesMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addDelegate:", v2);

  v9 = [AFNotifyObserver alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "AFBluetoothPairedDeviceInfoUpdated");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AFNotifyObserver initWithName:options:queue:delegate:](v9, "initWithName:options:queue:delegate:", v10, 0, v2->_queue, v2);
  pairedInfoChangeObserver = v2->_pairedInfoChangeObserver;
  v2->_pairedInfoChangeObserver = (AFNotifyObserver *)v11;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v14 = (_QWORD *)getBluetoothPairedStatusChangedNotificationSymbolLoc_ptr;
  v30 = getBluetoothPairedStatusChangedNotificationSymbolLoc_ptr;
  if (!getBluetoothPairedStatusChangedNotificationSymbolLoc_ptr)
  {
    v15 = BluetoothManagerLibrary();
    v14 = dlsym(v15, "BluetoothPairedStatusChangedNotification");
    v28[3] = (uint64_t)v14;
    getBluetoothPairedStatusChangedNotificationSymbolLoc_ptr = (uint64_t)v14;
  }
  _Block_object_dispose(&v27, 8);
  if (v14)
  {
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel_fetchEligibleAnnouncementRequestTypesAndNotifyObservers_, *v14, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v17 = (_QWORD *)getBluetoothFirstDeviceUnlockCompletedSymbolLoc_ptr;
    v30 = getBluetoothFirstDeviceUnlockCompletedSymbolLoc_ptr;
    if (!getBluetoothFirstDeviceUnlockCompletedSymbolLoc_ptr)
    {
      v18 = BluetoothManagerLibrary();
      v17 = dlsym(v18, "BluetoothFirstDeviceUnlockCompleted");
      v28[3] = (uint64_t)v17;
      getBluetoothFirstDeviceUnlockCompletedSymbolLoc_ptr = (uint64_t)v17;
    }
    _Block_object_dispose(&v27, 8);
    if (v17)
    {
      objc_msgSend(v16, "addObserver:selector:name:object:", v2, sel_fetchEligibleAnnouncementRequestTypesAndNotifyObservers_, *v17, 0);

      v19 = -[AFNotifyObserver initWithName:options:queue:delegate:]([AFNotifyObserver alloc], "initWithName:options:queue:delegate:", CFSTR("AFSiriUserNotificationRequestCapabilityForceUpdate"), 0, v2->_queue, v2);
      forcedUpdateObserver = v2->_forcedUpdateObserver;
      v2->_forcedUpdateObserver = v19;

      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v21 = objc_claimAutoreleasedReturnValue();
      delegates = v2->_delegates;
      v2->_delegates = (NSHashTable *)v21;

      -[AFHeadphonesAnnouncementRequestCapabilityProvider _fetchInitialState](v2, "_fetchInitialState");
      return v2;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getBluetoothFirstDeviceUnlockCompleted(void)");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("AFHeadphonesAnnouncementRequestCapabilityProvider.m"), 54, CFSTR("%s"), dlerror());
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getBluetoothPairedStatusChangedNotification(void)");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("AFHeadphonesAnnouncementRequestCapabilityProvider.m"), 53, CFSTR("%s"), dlerror());
  }

  __break(1u);
  return result;
}

- (void)_fetchInitialState
{
  NSObject *queue;
  _QWORD block[5];

  if (MGGetBoolAnswer())
  {
    dispatch_group_enter((dispatch_group_t)self->_group);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__AFHeadphonesAnnouncementRequestCapabilityProvider__fetchInitialState__block_invoke;
    block[3] = &unk_1E3A36F30;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)fetchLocalVoiceAssetAvailabilityWithCompletion:(id)a3
{
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (AFSiriAudioRoute)currentAnnouncementRoute
{
  NSObject *queue;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[6];
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__10078;
  v17 = __Block_byref_object_dispose__10079;
  v18 = 0;
  queue = self->_queue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__AFHeadphonesAnnouncementRequestCapabilityProvider_currentAnnouncementRoute__block_invoke;
  block[3] = &unk_1E3A36F78;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(queue, block);
  v5 = (void *)v14[5];
  if (!v5)
  {
    -[AFHeadphonesAnnouncementRequestCapabilityProvider _getCurrentAnnouncementRoute](self, "_getCurrentAnnouncementRoute");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v14[5];
    v14[5] = v6;

    v8 = self->_queue;
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __77__AFHeadphonesAnnouncementRequestCapabilityProvider_currentAnnouncementRoute__block_invoke_2;
    v11[3] = &unk_1E3A36F78;
    v11[4] = self;
    v11[5] = &v13;
    dispatch_async(v8, v11);
    v5 = (void *)v14[5];
  }
  v9 = v5;
  _Block_object_dispose(&v13, 8);

  return (AFSiriAudioRoute *)v9;
}

- (id)currentlyRoutedHeadphonesProductID
{
  void *v2;
  void *v3;
  void *v4;

  -[AFHeadphonesAnnouncementRequestCapabilityProvider currentAnnouncementRoute](self, "currentAnnouncementRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "productID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)currentlyRoutedHeadphonesBTAddress
{
  void *v2;
  void *v3;
  void *v4;

  -[AFHeadphonesAnnouncementRequestCapabilityProvider currentAnnouncementRoute](self, "currentAnnouncementRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "btAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)_getCurrentAnnouncementRoute
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[AFHeadphonesAnnouncementRequestCapabilityProvider _headphonesMonitor](self, "_headphonesMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentAudioRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "availableAnnouncementRequestTypes"))
  {
    v4 = (void *)AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
    {
      v7 = v4;
      v8 = objc_msgSend(v3, "availableAnnouncementRequestTypes");
      objc_msgSend(v3, "avscRouteDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315650;
      v11 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider _getCurrentAnnouncementRoute]";
      v12 = 2048;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_debug_impl(&dword_19AF50000, v7, OS_LOG_TYPE_DEBUG, "%s capabilities: %lu for routeDescription: %@", (uint8_t *)&v10, 0x20u);

    }
    v5 = v3;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_updateAudioRouteAvailabilityAndBroadcast:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  unint64_t lastKnownAvailableAnnouncementRequests;
  unint64_t v11;
  __CFString *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  int v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  __CFString *v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  -[AFHeadphonesAnnouncementRequestCapabilityProvider _getCurrentAnnouncementRoute](self, "_getCurrentAnnouncementRoute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFHeadphonesAnnouncementRequestCapabilityProvider setCurrentAnnouncementRoute:](self, "setCurrentAnnouncementRoute:", v5);
  v6 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    v8 = v6;
    v9 = objc_msgSend(v5, "availableAnnouncementRequestTypes");
    lastKnownAvailableAnnouncementRequests = self->_lastKnownAvailableAnnouncementRequests;
    v11 = objc_msgSend(v5, "announcePlatformForRoute");
    if (v11 > 4)
      v12 = CFSTR("(unknown)");
    else
      v12 = off_1E3A33BB8[v11];
    v18 = v12;
    v20 = 136315906;
    v21 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider _updateAudioRouteAvailabilityAndBroadcast:]";
    v22 = 2048;
    v23 = v9;
    v24 = 2048;
    v25 = lastKnownAvailableAnnouncementRequests;
    v26 = 2112;
    v27 = v18;
    _os_log_debug_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEBUG, "%s Available route capabilities: %lu, last known availability: %lu announcePlatformForRoute: %@", (uint8_t *)&v20, 0x2Au);

  }
  if (objc_msgSend(v5, "availableAnnouncementRequestTypes") != self->_lastKnownAvailableAnnouncementRequests)
  {
    v7 = (void *)AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
    {
      v13 = v7;
      v14 = objc_msgSend(v5, "availableAnnouncementRequestTypes");
      objc_msgSend(v5, "avscRouteDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v5, "announcePlatformForRoute");
      if (v16 > 4)
        v17 = CFSTR("(unknown)");
      else
        v17 = off_1E3A33BB8[v16];
      v19 = v17;
      v20 = 136315906;
      v21 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider _updateAudioRouteAvailabilityAndBroadcast:]";
      v22 = 2048;
      v23 = v14;
      v24 = 2112;
      v25 = (unint64_t)v15;
      v26 = 2112;
      v27 = v19;
      _os_log_debug_impl(&dword_19AF50000, v13, OS_LOG_TYPE_DEBUG, "%s updating available route capabilities: %lu for routeDescription: %@ announcePlatformForRoute: %@", (uint8_t *)&v20, 0x2Au);

    }
    self->_lastKnownAvailableAnnouncementRequests = objc_msgSend(v5, "availableAnnouncementRequestTypes");
    if (v3)
      -[AFHeadphonesAnnouncementRequestCapabilityProvider notifyObserversOfAvailableAnnouncementRequestTypes](self, "notifyObserversOfAvailableAnnouncementRequestTypes");
  }

}

- (void)notifyObserversOfAvailableAnnouncementRequestTypes
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __103__AFHeadphonesAnnouncementRequestCapabilityProvider_notifyObserversOfAvailableAnnouncementRequestTypes__block_invoke;
  v2[3] = &unk_1E3A35100;
  v2[4] = self;
  -[AFHeadphonesAnnouncementRequestCapabilityProvider fetchAvailableAnnouncementRequestTypesWithCompletion:](self, "fetchAvailableAnnouncementRequestTypesWithCompletion:", v2);
}

- (void)fetchEligibleAnnouncementRequestTypesAndNotifyObservers:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider fetchEligibleAnnouncementRequestTypesAndNotifyObservers:]";
    v10 = 2112;
    v11 = v4;
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesAndNotifyObservers___block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);

}

- (void)_fetchEligibleAnnouncementRequestTypesAndNotifyObservers
{
  NSObject *v3;
  unint64_t lastKnownEligibleAnnouncementRequests;
  _QWORD v5[6];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider _fetchEligibleAnnouncementRequestTypesAndNotifyObservers]";
    _os_log_debug_impl(&dword_19AF50000, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  lastKnownEligibleAnnouncementRequests = self->_lastKnownEligibleAnnouncementRequests;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __109__AFHeadphonesAnnouncementRequestCapabilityProvider__fetchEligibleAnnouncementRequestTypesAndNotifyObservers__block_invoke;
  v5[3] = &unk_1E3A2F2B0;
  v5[4] = self;
  v5[5] = lastKnownEligibleAnnouncementRequests;
  -[AFHeadphonesAnnouncementRequestCapabilityProvider fetchEligibleAnnouncementRequestTypesWithCompletion:](self, "fetchEligibleAnnouncementRequestTypesWithCompletion:", v5);
}

- (void)_notifyObserversOfEligibleAnnouncementRequestTypes:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider _notifyObserversOfEligibleAnnouncementRequestTypes:]";
    v19 = 2048;
    v20 = a3;
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s Notifying observers, eligible announcement requests changed: %lu", buf, 0x16u);
  }
  v6 = (void *)-[NSHashTable copy](self->_delegates, "copy");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "provider:eligibleAnnouncementRequestTypesChanged:", self, a3, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (id)_headphonesMonitor
{
  return +[AFSiriHeadphonesMonitor sharedMonitor](AFSiriHeadphonesMonitor, "sharedMonitor");
}

- (void)_fetchPairedBluetoothDevicesFromSourceWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__10078;
  v14 = __Block_byref_object_dispose__10079;
  -[AFHeadphonesAnnouncementRequestCapabilityProvider _settingsConnection](self, "_settingsConnection");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)v11[5];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __106__AFHeadphonesAnnouncementRequestCapabilityProvider__fetchPairedBluetoothDevicesFromSourceWithCompletion___block_invoke;
  v7[3] = &unk_1E3A2F2D8;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  v9 = &v10;
  objc_msgSend(v5, "getPairedBluetoothDeviceInfoArrayWithCompletion:", v7);

  _Block_object_dispose(&v10, 8);
}

- (void)privateAudioSessionStateDidChange:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = v5;
    objc_msgSend(v6, "numberWithUnsignedInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v12 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider privateAudioSessionStateDidChange:]";
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s headphonesPrivateSession: %@", buf, 0x16u);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__AFHeadphonesAnnouncementRequestCapabilityProvider_privateAudioSessionStateDidChange___block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)currentAudioRouteDidChange:(id)a3
{
  void *v5;
  NSObject *queue;
  NSObject *v7;
  void *v8;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v7 = v5;
    objc_msgSend(a3, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v11 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider currentAudioRouteDidChange:]";
    v12 = 2112;
    v13 = v8;
    _os_log_debug_impl(&dword_19AF50000, v7, OS_LOG_TYPE_DEBUG, "%s current audio route did change: %@", buf, 0x16u);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__AFHeadphonesAnnouncementRequestCapabilityProvider_currentAudioRouteDidChange___block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4
{
  AFNotifyObserver *v5;
  AFNotifyObserver *v6;
  NSObject *v7;
  const char *v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = (AFNotifyObserver *)a3;
  v6 = v5;
  if (self->_forcedUpdateObserver == v5)
  {
    if (!self->_lastKnownEligibleAnnouncementRequests)
    {
      v7 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v9 = 136315138;
        *(_QWORD *)&v9[4] = "-[AFHeadphonesAnnouncementRequestCapabilityProvider notifyObserver:didReceiveNotificationWithToken:]";
        v8 = "%s forced update observer re-fetching eligibility";
        goto LABEL_10;
      }
LABEL_7:
      -[AFHeadphonesAnnouncementRequestCapabilityProvider fetchEligibleAnnouncementRequestTypesAndNotifyObservers:](self, "fetchEligibleAnnouncementRequestTypesAndNotifyObservers:", 0, *(_OWORD *)v9);
    }
  }
  else if (self->_pairedInfoChangeObserver == v5)
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v9 = 136315138;
      *(_QWORD *)&v9[4] = "-[AFHeadphonesAnnouncementRequestCapabilityProvider notifyObserver:didReceiveNotificationWithToken:]";
      v8 = "%s re-fetching eligibility after assistantd is ready";
LABEL_10:
      _os_log_debug_impl(&dword_19AF50000, v7, OS_LOG_TYPE_DEBUG, v8, v9, 0xCu);
      goto LABEL_7;
    }
    goto LABEL_7;
  }

}

- (id)_settingsConnection
{
  AFSettingsConnection *settingsConnection;
  AFSettingsConnection *v4;
  AFSettingsConnection *v5;
  AFSettingsConnection *v6;

  if (AFSupportsWirelessSplitter_onceToken != -1)
    dispatch_once(&AFSupportsWirelessSplitter_onceToken, &__block_literal_global_148);
  if (AFSupportsWirelessSplitter_supportsWirelessSplitter)
  {
    settingsConnection = self->_settingsConnection;
    if (!settingsConnection)
    {
      v4 = objc_alloc_init(AFSettingsConnection);
      v5 = self->_settingsConnection;
      self->_settingsConnection = v4;

      -[AFSettingsConnection _setDelegate:](self->_settingsConnection, "_setDelegate:", self);
      settingsConnection = self->_settingsConnection;
    }
    v6 = settingsConnection;
  }
  else
  {
    v6 = objc_alloc_init(AFSettingsConnection);
  }
  return v6;
}

- (void)_settingsConnectionDidDisconnect
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__AFHeadphonesAnnouncementRequestCapabilityProvider__settingsConnectionDidDisconnect__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)addDelegate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__AFHeadphonesAnnouncementRequestCapabilityProvider_addDelegate___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (unint64_t)lastKnownEligibleAnnouncementRequestTypes
{
  return self->_lastKnownEligibleAnnouncementRequests;
}

- (void)fetchEligibleAnnouncementRequestTypesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  __int128 *v15;
  _QWORD v16[5];
  NSObject *v17;
  _QWORD block[5];
  NSObject *v19;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((MGGetBoolAnswer() & 1) != 0)
  {
    v5 = dispatch_group_create();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v22 = 0x2020000000;
    v23 = 0;
    dispatch_group_enter(v5);
    queue = self->_queue;
    v7 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke;
    block[3] = &unk_1E3A31C68;
    block[4] = self;
    p_buf = &buf;
    v8 = v5;
    v19 = v8;
    dispatch_async(queue, block);
    dispatch_group_enter(v8);
    v9 = self->_queue;
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke_4;
    v16[3] = &unk_1E3A36FC8;
    v16[4] = self;
    v17 = v8;
    v10 = v8;
    dispatch_async(v9, v16);
    v11 = self->_queue;
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke_7;
    v13[3] = &unk_1E3A31BF8;
    v15 = &buf;
    v13[4] = self;
    v14 = v4;
    dispatch_group_notify(v10, v11, v13);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[AFHeadphonesAnnouncementRequestCapabilityProvider fetchEligibleAnnouncementReque"
                                      "stTypesWithCompletion:]";
      _os_log_debug_impl(&dword_19AF50000, v12, OS_LOG_TYPE_DEBUG, "%s Announcements not supported on device", (uint8_t *)&buf, 0xCu);
    }
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (void)fetchAvailableAnnouncementRequestTypesWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __106__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)setCurrentAnnouncementRoute:(id)a3
{
  objc_storeStrong((id *)&self->_currentAnnouncementRoute, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAnnouncementRoute, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_forcedUpdateObserver, 0);
  objc_storeStrong((id *)&self->_pairedInfoChangeObserver, 0);
  objc_storeStrong((id *)&self->_settingsConnection, 0);
}

void __106__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((MGGetBoolAnswer() & 1) != 0)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = *(NSObject **)(v2 + 40);
    v4 = *(NSObject **)(v2 + 48);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __106__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke_15;
    v7[3] = &unk_1E3A36FA0;
    v7[4] = v2;
    v8 = v3;
    dispatch_group_notify(v4, v5, v7);

  }
  else
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider fetchAvailableAnnouncementRequestTypesWithCompletion:]_block_invoke";
      _os_log_debug_impl(&dword_19AF50000, v6, OS_LOG_TYPE_DEBUG, "%s Announcements not supported on this device", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __106__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke_15(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void (**v4)(_QWORD);
  void *v5;
  _QWORD *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[4];
  void (**v10)(_QWORD);
  _QWORD v11[5];
  id v12;

  v2 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __106__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke_2;
  v11[3] = &unk_1E3A36FA0;
  v3 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v4 = (void (**)(_QWORD))MEMORY[0x1A1AC0C3C](v11);
  v5 = v4;
  v6 = *(_QWORD **)(a1 + 32);
  if (v6[7])
  {
    v8 = v6[5];
    v7 = v6[6];
    block[0] = v2;
    block[1] = 3221225472;
    block[2] = __106__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke_17;
    block[3] = &unk_1E3A36BB8;
    v10 = v4;
    dispatch_group_notify(v7, v8, block);

  }
  else
  {
    v4[2](v4);
  }

}

void __106__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_headphonesMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __106__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke_3;
  v4[3] = &unk_1E3A2F378;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "fetchPrivateSessionStateWithCompletion:", v4);

}

uint64_t __106__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __106__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t v13;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __106__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke_4;
  v10[3] = &unk_1E3A2F350;
  v13 = a2;
  v10[4] = v6;
  v11 = v5;
  v12 = v7;
  v9 = v5;
  dispatch_async(v8, v10);

}

uint64_t __106__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke_4(_QWORD *a1)
{
  void *v2;
  uint64_t (*v3)(void);
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1[4] + 56);
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = a1[7];
    v8 = v2;
    objc_msgSend(v6, "numberWithUnsignedInteger:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider fetchAvailableAnnouncementRequestTypesWithCompletion:]_block_invoke_4";
    v12 = 2048;
    v13 = v5;
    v14 = 2112;
    v15 = v9;
    _os_log_debug_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEBUG, "%s Available announcement requests: %lu, private session state: %@", (uint8_t *)&v10, 0x20u);

  }
  if (a1[5] || a1[7] != 1)
    v3 = *(uint64_t (**)(void))(a1[6] + 16);
  else
    v3 = *(uint64_t (**)(void))(a1[6] + 16);
  return v3();
}

void __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  __int128 v3;
  _QWORD v4[5];
  __int128 v5;

  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke_2;
  v4[3] = &unk_1E3A2F300;
  v4[4] = v1;
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v5 = v3;
  objc_msgSend(v1, "_fetchPairedBluetoothDevicesFromSourceWithCompletion:", v4);

}

void __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke_4(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke_5;
  v2[3] = &unk_1E3A2F328;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "fetchLocalVoiceAssetAvailabilityWithCompletion:", v2);

}

uint64_t __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke_7(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  int v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    v7 = *(unsigned __int8 *)(a1[4] + 8);
    v8 = 136315650;
    v9 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider fetchEligibleAnnouncementRequestTypesWithCompletion:]_block_invoke_7";
    v10 = 2048;
    v11 = v6;
    v12 = 1024;
    v13 = v7;
    _os_log_debug_impl(&dword_19AF50000, v2, OS_LOG_TYPE_DEBUG, "%s Eligible Announcement Requests: %lu, Local Voice Asset Available: %d", (uint8_t *)&v8, 0x1Cu);
  }
  v3 = a1[4];
  if (*(_BYTE *)(v3 + 8))
    v4 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  else
    v4 = 0;
  *(_QWORD *)(v3 + 64) = v4;
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

void __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke_5(uint64_t a1, char a2)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  char v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke_6;
  block[3] = &unk_1E3A2FF68;
  block[4] = v2;
  v7 = a2;
  v6 = v3;
  dispatch_async(v4, block);

}

void __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke_6(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = *(_BYTE *)(a1 + 48);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[4];
  id v9;
  __int128 v10;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke_3;
  block[3] = &unk_1E3A31C68;
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

void __105__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "supportsSpokenNotification", (_QWORD)v8))
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= 1uLL;
        if (objc_msgSend(v7, "supportsAnnounceCall"))
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= 2uLL;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __65__AFHeadphonesAnnouncementRequestCapabilityProvider_addDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addObject:", *(_QWORD *)(a1 + 40));
}

void __85__AFHeadphonesAnnouncementRequestCapabilityProvider__settingsConnectionDidDisconnect__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider _settingsConnectionDidDisconnect]_block_invoke";
    _os_log_debug_impl(&dword_19AF50000, v2, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = 0;

}

uint64_t __80__AFHeadphonesAnnouncementRequestCapabilityProvider_currentAudioRouteDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAudioRouteAvailabilityAndBroadcast:", 1);
}

uint64_t __87__AFHeadphonesAnnouncementRequestCapabilityProvider_privateAudioSessionStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyObserversOfAvailableAnnouncementRequestTypes");
}

void __106__AFHeadphonesAnnouncementRequestCapabilityProvider__fetchPairedBluetoothDevicesFromSourceWithCompletion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = (void *)a1[5];
  v5 = *(NSObject **)(a1[4] + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__AFHeadphonesAnnouncementRequestCapabilityProvider__fetchPairedBluetoothDevicesFromSourceWithCompletion___block_invoke_2;
  block[3] = &unk_1E3A31BF8;
  v8 = v3;
  v9 = v4;
  v10 = a1[6];
  v6 = v3;
  dispatch_async(v5, block);

}

void __106__AFHeadphonesAnnouncementRequestCapabilityProvider__fetchPairedBluetoothDevicesFromSourceWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __109__AFHeadphonesAnnouncementRequestCapabilityProvider__fetchEligibleAnnouncementRequestTypesAndNotifyObservers__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[7];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(NSObject **)(v2 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__AFHeadphonesAnnouncementRequestCapabilityProvider__fetchEligibleAnnouncementRequestTypesAndNotifyObservers__block_invoke_2;
  block[3] = &unk_1E3A32CC0;
  block[5] = v3;
  block[6] = a2;
  block[4] = v2;
  dispatch_async(v4, block);
}

uint64_t __109__AFHeadphonesAnnouncementRequestCapabilityProvider__fetchEligibleAnnouncementRequestTypesAndNotifyObservers__block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(result + 40);
  v1 = *(_QWORD *)(result + 48);
  if (v2 != v1)
  {
    v3 = result;
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      v5 = 136315650;
      v6 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider _fetchEligibleAnnouncementRequestTypesAndNotifyObservers]_block_invoke_2";
      v7 = 2048;
      v8 = v2;
      v9 = 2048;
      v10 = v1;
      _os_log_debug_impl(&dword_19AF50000, v4, OS_LOG_TYPE_DEBUG, "%s previous announcement request eligibility: %lu, now updating to %lu", (uint8_t *)&v5, 0x20u);
      v1 = *(_QWORD *)(v3 + 48);
    }
    return objc_msgSend(*(id *)(v3 + 32), "_notifyObserversOfEligibleAnnouncementRequestTypes:", v1);
  }
  return result;
}

uint64_t __109__AFHeadphonesAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesAndNotifyObservers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchEligibleAnnouncementRequestTypesAndNotifyObservers");
}

void __103__AFHeadphonesAnnouncementRequestCapabilityProvider_notifyObserversOfAvailableAnnouncementRequestTypes__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __103__AFHeadphonesAnnouncementRequestCapabilityProvider_notifyObserversOfAvailableAnnouncementRequestTypes__block_invoke_2;
  v4[3] = &unk_1E3A353C0;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void __103__AFHeadphonesAnnouncementRequestCapabilityProvider_notifyObserversOfAvailableAnnouncementRequestTypes__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    v16 = "-[AFHeadphonesAnnouncementRequestCapabilityProvider notifyObserversOfAvailableAnnouncementRequestTypes]_block_invoke_2";
    v17 = 2048;
    v18 = v9;
    _os_log_debug_impl(&dword_19AF50000, v2, OS_LOG_TYPE_DEBUG, "%s Notifying observers of available announcement requests: %lu", buf, 0x16u);
  }
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "provider:availableAnnouncementRequestTypesChanged:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

void __77__AFHeadphonesAnnouncementRequestCapabilityProvider_currentAnnouncementRoute__block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  if (v1)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v1);
}

void __77__AFHeadphonesAnnouncementRequestCapabilityProvider_currentAnnouncementRoute__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __71__AFHeadphonesAnnouncementRequestCapabilityProvider__fetchInitialState__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateAudioRouteAvailabilityAndBroadcast:", 0);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
}

+ (id)provider
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__AFHeadphonesAnnouncementRequestCapabilityProvider_provider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (provider_onceToken != -1)
    dispatch_once(&provider_onceToken, block);
  return (id)provider_provider;
}

+ (int64_t)platform
{
  return 1;
}

+ (id)announceableIntentIdentifiersForUserNotificationAnnouncementType:(int64_t)a3
{
  void *v3;
  void *v4;
  id result;
  id *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 > 9)
    return 0;
  switch(a3)
  {
    case 1:
      getINSearchForMessagesIntentIdentifier();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      return v4;
    case 2:
      v29 = 0;
      v30 = &v29;
      v31 = 0x2020000000;
      v6 = (id *)getINReadAnnouncementIntentIdentifierSymbolLoc_ptr;
      v32 = getINReadAnnouncementIntentIdentifierSymbolLoc_ptr;
      if (!getINReadAnnouncementIntentIdentifierSymbolLoc_ptr)
      {
        v7 = IntentsLibrary();
        v6 = (id *)dlsym(v7, "INReadAnnouncementIntentIdentifier");
        v30[3] = (uint64_t)v6;
        getINReadAnnouncementIntentIdentifierSymbolLoc_ptr = (uint64_t)v6;
      }
      _Block_object_dispose(&v29, 8);
      if (v6)
      {
        v36 = *v6;
        v8 = (void *)MEMORY[0x1E0C99D20];
        v9 = v36;
        objc_msgSend(v8, "arrayWithObjects:count:", &v36, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        return v10;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getINReadAnnouncementIntentIdentifier(void)");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("AFHeadphonesAnnouncementRequestCapabilityProvider.m"), 35, CFSTR("%s"), dlerror());

      goto LABEL_23;
    case 3:
      return MEMORY[0x1E0C9AA60];
    case 4:
      getINSearchForNotebookItemsIntentIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      return v12;
    case 5:
      v29 = 0;
      v30 = &v29;
      v31 = 0x2020000000;
      v13 = (id *)getINPlayVoicemailIntentIdentifierSymbolLoc_ptr;
      v32 = getINPlayVoicemailIntentIdentifierSymbolLoc_ptr;
      if (!getINPlayVoicemailIntentIdentifierSymbolLoc_ptr)
      {
        v14 = IntentsLibrary();
        v13 = (id *)dlsym(v14, "INPlayVoicemailIntentIdentifier");
        v30[3] = (uint64_t)v13;
        getINPlayVoicemailIntentIdentifierSymbolLoc_ptr = (uint64_t)v13;
      }
      _Block_object_dispose(&v29, 8);
      if (v13)
      {
        v34 = *v13;
        v15 = (void *)MEMORY[0x1E0C99D20];
        v16 = v34;
        objc_msgSend(v15, "arrayWithObjects:count:", &v34, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        return v17;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getINPlayVoicemailIntentIdentifier(void)");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("AFHeadphonesAnnouncementRequestCapabilityProvider.m"), 37, CFSTR("%s"), dlerror());

      goto LABEL_23;
    case 6:
      v29 = 0;
      v30 = &v29;
      v31 = 0x2020000000;
      v18 = (id *)getINJoinCallIntentIdentifierSymbolLoc_ptr;
      v32 = getINJoinCallIntentIdentifierSymbolLoc_ptr;
      if (!getINJoinCallIntentIdentifierSymbolLoc_ptr)
      {
        v19 = IntentsLibrary();
        v18 = (id *)dlsym(v19, "INJoinCallIntentIdentifier");
        v30[3] = (uint64_t)v18;
        getINJoinCallIntentIdentifierSymbolLoc_ptr = (uint64_t)v18;
      }
      _Block_object_dispose(&v29, 8);
      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getINJoinCallIntentIdentifier(void)");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("AFHeadphonesAnnouncementRequestCapabilityProvider.m"), 38, CFSTR("%s"), dlerror());

LABEL_23:
        __break(1u);
      }
      v33 = *v18;
      v20 = (void *)MEMORY[0x1E0C99D20];
      v21 = v33;
      objc_msgSend(v20, "arrayWithObjects:count:", &v33, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      result = v22;
      break;
    default:
      return 0;
  }
  return result;
}

+ (id)requiredIntentIdentifiersForUserNotificationAnnouncementType:(int64_t)a3
{
  void *v3;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id *v11;
  void *v12;
  id v13;
  id *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 > 9)
  {
LABEL_4:
    v3 = 0;
  }
  else
  {
    switch(a3)
    {
      case 1:
        getINSearchForMessagesIntentIdentifier();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v5;
        v24 = 0;
        v25 = &v24;
        v26 = 0x2020000000;
        v6 = (id *)getINSendMessageIntentIdentifierSymbolLoc_ptr;
        v27 = getINSendMessageIntentIdentifierSymbolLoc_ptr;
        if (!getINSendMessageIntentIdentifierSymbolLoc_ptr)
        {
          v7 = IntentsLibrary();
          v6 = (id *)dlsym(v7, "INSendMessageIntentIdentifier");
          v25[3] = (uint64_t)v6;
          getINSendMessageIntentIdentifierSymbolLoc_ptr = (uint64_t)v6;
        }
        _Block_object_dispose(&v24, 8);
        if (!v6)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getINSendMessageIntentIdentifier(void)");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("AFHeadphonesAnnouncementRequestCapabilityProvider.m"), 34, CFSTR("%s"), dlerror());

LABEL_21:
          __break(1u);
        }
        v32 = *v6;
        v8 = (void *)MEMORY[0x1E0C99D20];
        v9 = v32;
        objc_msgSend(v8, "arrayWithObjects:count:", &v31, 2);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      case 2:
      case 3:
      case 5:
      case 6:
        v3 = (void *)MEMORY[0x1E0C9AA60];
        return v3;
      case 4:
        getINSearchForNotebookItemsIntentIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        return v3;
      case 7:
        v24 = 0;
        v25 = &v24;
        v26 = 0x2020000000;
        v11 = (id *)getINAnswerCallIntentIdentifierSymbolLoc_ptr;
        v27 = getINAnswerCallIntentIdentifierSymbolLoc_ptr;
        if (!getINAnswerCallIntentIdentifierSymbolLoc_ptr)
        {
          v12 = IntentsLibrary();
          v11 = (id *)dlsym(v12, "INAnswerCallIntentIdentifier");
          v25[3] = (uint64_t)v11;
          getINAnswerCallIntentIdentifierSymbolLoc_ptr = (uint64_t)v11;
        }
        _Block_object_dispose(&v24, 8);
        if (v11)
        {
          v13 = *v11;
          v28 = v13;
          v24 = 0;
          v25 = &v24;
          v26 = 0x2020000000;
          v14 = (id *)getINHangUpCallIntentIdentifierSymbolLoc_ptr;
          v27 = getINHangUpCallIntentIdentifierSymbolLoc_ptr;
          if (!getINHangUpCallIntentIdentifierSymbolLoc_ptr)
          {
            v15 = IntentsLibrary();
            v14 = (id *)dlsym(v15, "INHangUpCallIntentIdentifier");
            v25[3] = (uint64_t)v14;
            getINHangUpCallIntentIdentifierSymbolLoc_ptr = (uint64_t)v14;
          }
          _Block_object_dispose(&v24, 8);
          if (v14)
          {
            v29 = *v14;
            v16 = (void *)MEMORY[0x1E0C99D20];
            v17 = v29;
            objc_msgSend(v16, "arrayWithObjects:count:", &v28, 2);
            v3 = (void *)objc_claimAutoreleasedReturnValue();

            return v3;
          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getINHangUpCallIntentIdentifier(void)");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("AFHeadphonesAnnouncementRequestCapabilityProvider.m"), 40, CFSTR("%s"), dlerror());

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getINAnswerCallIntentIdentifier(void)");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("AFHeadphonesAnnouncementRequestCapabilityProvider.m"), 39, CFSTR("%s"), dlerror());

        }
        goto LABEL_21;
      default:
        goto LABEL_4;
    }
  }
  return v3;
}

void __61__AFHeadphonesAnnouncementRequestCapabilityProvider_provider__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_init");
  v1 = (void *)provider_provider;
  provider_provider = v0;

}

@end
