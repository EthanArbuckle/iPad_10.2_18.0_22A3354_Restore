@implementation AFSiriHeadphonesMonitor

uint64_t __56__AFSiriHeadphonesMonitor_updateAudioRouteAvailability___block_invoke(uint64_t a1)
{
  _BYTE *v2;

  objc_msgSend(*(id *)(a1 + 32), "_updateAudioRouteAvailabilityAndBroadcast:", 1);
  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[33])
  {
    objc_msgSend(v2, "_updateWirelessSplitterSessionInfoAndObserve");
    v2 = *(_BYTE **)(a1 + 32);
  }
  return objc_msgSend(v2, "_updateInEarDetectionStateAndObserve");
}

- (BOOL)_updateAudioRouteAvailabilityAndBroadcast:(BOOL)a3
{
  _BOOL4 v3;
  AFSiriAudioRoute *v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSString *btAddress;
  NSString *routeName;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSString *v15;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  uint64_t v20;
  NSString *v21;
  void *v22;
  NSObject *btQueue;
  id v24;
  _QWORD block[4];
  id v27;
  AFSiriHeadphonesMonitor *v28;
  _QWORD v29[5];
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  NSString *v33;
  __int16 v34;
  NSString *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v3 = a3;
  v40 = *MEMORY[0x1E0C80C00];
  v5 = self->_currentAudioRoute;
  objc_msgSend((id)objc_opt_class(), "_getCurrentAudioRoute:ringerSwitchState:", self->_avSystemController, -[AFDeviceRingerSwitchObserver state](self->_ringerSwitchObserver, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFSiriHeadphonesMonitor setCurrentAudioRoute:](self, "setCurrentAudioRoute:", v6);
  v7 = objc_msgSend(v6, "isEqualToRoute:", v5);
  if ((v7 & 1) == 0)
  {
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      btAddress = self->_btAddress;
      routeName = self->_routeName;
      v11 = v8;
      objc_msgSend(v6, "routeName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "btAddress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v31 = "-[AFSiriHeadphonesMonitor _updateAudioRouteAvailabilityAndBroadcast:]";
      v32 = 2112;
      v33 = routeName;
      v34 = 2112;
      v35 = btAddress;
      v36 = 2112;
      v37 = v12;
      v38 = 2112;
      v39 = v13;
      _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s Route changed from %@(%@) to %@(%@)", buf, 0x34u);

      v8 = AFSiriLogContextConnection;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v14 = v8;
      objc_msgSend(v6, "avscRouteDescription");
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v31 = "-[AFSiriHeadphonesMonitor _updateAudioRouteAvailabilityAndBroadcast:]";
      v32 = 2112;
      v33 = v15;
      _os_log_impl(&dword_19AF50000, v14, OS_LOG_TYPE_INFO, "%s Currently picked - routeDescription %@", buf, 0x16u);

    }
    objc_msgSend(v6, "btAddress");
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v17 = self->_btAddress;
    self->_btAddress = v16;

    objc_msgSend(v6, "routeName");
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    v19 = self->_routeName;
    self->_routeName = v18;

    v20 = MEMORY[0x1E0C809B0];
    v21 = self->_btAddress;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __69__AFSiriHeadphonesMonitor__updateAudioRouteAvailabilityAndBroadcast___block_invoke;
    v29[3] = &unk_1E3A30E78;
    v29[4] = self;
    -[AFSiriHeadphonesMonitor _fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress:withCompletion:](self, "_fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress:withCompletion:", v21, v29);
    v22 = (void *)objc_msgSend(v6, "copy");
    btQueue = self->_btQueue;
    block[0] = v20;
    block[1] = 3221225472;
    block[2] = __69__AFSiriHeadphonesMonitor__updateAudioRouteAvailabilityAndBroadcast___block_invoke_28;
    block[3] = &unk_1E3A36FC8;
    v24 = v22;
    v27 = v24;
    v28 = self;
    dispatch_async(btQueue, block);
    if (v3)
      -[AFSiriHeadphonesMonitor _broadcastRouteAndAuthenticationCapability](self, "_broadcastRouteAndAuthenticationCapability");

  }
  return v7 ^ 1;
}

- (void)setCurrentAudioRoute:(id)a3
{
  objc_storeStrong((id *)&self->_currentAudioRoute, a3);
}

void *__63__AFSiriHeadphonesMonitor__updateInEarDetectionStateAndObserve__block_invoke(uint64_t a1)
{
  void *result;
  _QWORD *v3;
  uint64_t v4;
  _QWORD v5[5];

  result = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  if (result)
  {
    result = (void *)objc_msgSend(result, "length");
    if (result == (void *)17)
    {
      v3 = *(_QWORD **)(a1 + 32);
      v4 = v3[12];
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __63__AFSiriHeadphonesMonitor__updateInEarDetectionStateAndObserve__block_invoke_2;
      v5[3] = &unk_1E3A30E78;
      v5[4] = v3;
      return (void *)objc_msgSend(v3, "_fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress:withCompletion:", v4, v5);
    }
  }
  return result;
}

- (void)_updateInEarDetectionStateAndObserve
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AFSiriHeadphonesMonitor__updateInEarDetectionStateAndObserve__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)updateAudioRouteAvailability:(id)a3
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
    v9 = "-[AFSiriHeadphonesMonitor updateAudioRouteAvailability:]";
    v10 = 2112;
    v11 = v4;
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s Updating route availability due to: %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__AFSiriHeadphonesMonitor_updateAudioRouteAvailability___block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);

}

- (id)_init
{
  char *v2;
  id v3;
  AFBluetoothHeadphoneInEarDetectionState *v4;
  void *v5;
  dispatch_queue_t v6;
  void *v7;
  dispatch_queue_t v8;
  void *v9;
  AFNotifyObserver *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  AFNotifyObserver *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  AFNotifyObserver *v18;
  void *v19;
  AFNotifyObserver *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  _QWORD *v27;
  void *v28;
  _QWORD *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id result;
  void *v39;
  void *v40;
  uint64_t block;
  uint64_t v42;
  void (*v43)(uint64_t);
  void *v44;
  id v45;
  objc_super v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;

  v46.receiver = self;
  v46.super_class = (Class)AFSiriHeadphonesMonitor;
  v2 = -[AFSiriHeadphonesMonitor init](&v46, sel_init);
  v3 = v2;
  if (!v2)
    return v3;
  *(_OWORD *)(v2 + 8) = xmmword_19B0EC780;
  v4 = -[AFBluetoothHeadphoneInEarDetectionState initWithBuilder:]([AFBluetoothHeadphoneInEarDetectionState alloc], "initWithBuilder:", &__block_literal_global_17948);
  v5 = (void *)*((_QWORD *)v3 + 3);
  *((_QWORD *)v3 + 3) = v4;

  v6 = dispatch_queue_create("AFSiriHeadphonesMonitor", 0);
  v7 = (void *)*((_QWORD *)v3 + 14);
  *((_QWORD *)v3 + 14) = v6;

  v8 = dispatch_queue_create("AFSiriHeadphonesMonitor.BTQueue", 0);
  v9 = (void *)*((_QWORD *)v3 + 15);
  *((_QWORD *)v3 + 15) = v8;

  v10 = [AFNotifyObserver alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "AFBluetoothPairedDeviceInfoUpdated");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AFNotifyObserver initWithName:options:queue:delegate:](v10, "initWithName:options:queue:delegate:", v11, 0, *((_QWORD *)v3 + 14), v3);
  v13 = (void *)*((_QWORD *)v3 + 6);
  *((_QWORD *)v3 + 6) = v12;

  v14 = [AFNotifyObserver alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "AFBluetoothWirelessSplitterSessionStateChanged");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[AFNotifyObserver initWithName:options:queue:delegate:](v14, "initWithName:options:queue:delegate:", v15, 1, *((_QWORD *)v3 + 14), v3);
  v17 = (void *)*((_QWORD *)v3 + 8);
  *((_QWORD *)v3 + 8) = v16;

  v18 = -[AFNotifyObserver initWithName:options:queue:delegate:]([AFNotifyObserver alloc], "initWithName:options:queue:delegate:", CFSTR("com.apple.bluetooth.GuestConnected"), 1, *((_QWORD *)v3 + 14), v3);
  v19 = (void *)*((_QWORD *)v3 + 9);
  *((_QWORD *)v3 + 9) = v18;

  v20 = [AFNotifyObserver alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "AFBluetoothInEarDetectionStateChanged");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[AFNotifyObserver initWithName:options:queue:delegate:](v20, "initWithName:options:queue:delegate:", v21, 1, *((_QWORD *)v3 + 14), v3);
  v23 = (void *)*((_QWORD *)v3 + 7);
  *((_QWORD *)v3 + 7) = v22;

  +[AFDeviceRingerSwitchObserver sharedObserver](AFDeviceRingerSwitchObserver, "sharedObserver");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)*((_QWORD *)v3 + 10);
  *((_QWORD *)v3 + 10) = v24;

  objc_msgSend(*((id *)v3 + 10), "addListener:", v3);
  v26 = *((_QWORD *)v3 + 14);
  block = MEMORY[0x1E0C809B0];
  v42 = 3221225472;
  v43 = __32__AFSiriHeadphonesMonitor__init__block_invoke_2;
  v44 = &unk_1E3A36F30;
  v27 = v3;
  v45 = v27;
  dispatch_async(v26, &block);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v29 = (_QWORD *)getAVSystemController_ServerConnectionDiedNotificationSymbolLoc_ptr;
  v50 = getAVSystemController_ServerConnectionDiedNotificationSymbolLoc_ptr;
  if (!getAVSystemController_ServerConnectionDiedNotificationSymbolLoc_ptr)
  {
    v30 = MediaExperienceLibrary();
    v29 = dlsym(v30, "AVSystemController_ServerConnectionDiedNotification");
    v48[3] = (uint64_t)v29;
    getAVSystemController_ServerConnectionDiedNotificationSymbolLoc_ptr = (uint64_t)v29;
  }
  _Block_object_dispose(&v47, 8);
  if (v29)
  {
    objc_msgSend(v28, "addObserver:selector:name:object:", v27, sel_systemControllerDied_, *v29, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    getAVSystemController_PickableRoutesDidChangeNotification();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:selector:name:object:", v27, sel_updateAudioRouteAvailability_, v32, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    getAVSystemController_PreferredExternalRouteDidChangeNotification();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObserver:selector:name:object:", v27, sel_updateAudioRouteAvailability_, v34, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObserver:selector:name:object:", v27, sel_updateAudioRouteAvailability_, CFSTR("AFPreferencesDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)v27[16];
    v27[16] = v36;

    objc_msgSend(v27, "_fetchInitialState");
    return v3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_ServerConnectionDiedNotification(void)");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("AFSiriHeadphonesMonitor.m"), 45, CFSTR("%s"), dlerror(), block, v42, v43, v44);

  __break(1u);
  return result;
}

- (AFSiriHeadphonesMonitor)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFSiriHeadphonesMonitor.m"), 186, CFSTR("init is not allowed, use +[AFSiriHeadphonesMonitor sharedMonitor]"));

  return 0;
}

- (void)_fetchInitialState
{
  uint64_t v3;
  NSObject *queue;
  NSObject *v5;
  _QWORD v6[5];
  _QWORD block[5];

  v3 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__AFSiriHeadphonesMonitor__fetchInitialState__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
  -[AFSiriHeadphonesMonitor _updateWirelessSplitterSessionInfoAndObserve](self, "_updateWirelessSplitterSessionInfoAndObserve");
  -[AFSiriHeadphonesMonitor _updateInEarDetectionStateAndObserve](self, "_updateInEarDetectionStateAndObserve");
  if (+[AFFeatureFlags isAccessibleAnnounceEnabled](AFFeatureFlags, "isAccessibleAnnounceEnabled"))
  {
    v5 = self->_queue;
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __45__AFSiriHeadphonesMonitor__fetchInitialState__block_invoke_2;
    v6[3] = &unk_1E3A36F30;
    v6[4] = self;
    dispatch_async(v5, v6);
  }
}

- (void)_updateWirelessSplitterSessionInfoAndObserve
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__AFSiriHeadphonesMonitor__updateWirelessSplitterSessionInfoAndObserve__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_updateAnnounceNotificationsOnHearingAidSupportedStatus
{
  AFSettingsConnection *settingsConnection;
  id v4;

  -[AFSiriHeadphonesMonitor _settingsConnection](self, "_settingsConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateAnnounceNotificationsOnHearingAidSupportedStatus");
  objc_msgSend(v4, "barrier");
  settingsConnection = self->_settingsConnection;
  self->_settingsConnection = 0;

}

- (void)_handleRingerStateChanged
{
  -[AFSiriHeadphonesMonitor _updateAudioRouteAvailabilityAndBroadcast:](self, "_updateAudioRouteAvailabilityAndBroadcast:", 1);
}

- (void)systemControllerDied:(id)a3
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
  v7[2] = __48__AFSiriHeadphonesMonitor_systemControllerDied___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

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
  v7[2] = __39__AFSiriHeadphonesMonitor_addDelegate___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)removeDelegate:(id)a3
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
  v7[2] = __42__AFSiriHeadphonesMonitor_removeDelegate___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_fetchWirelessSplitterSessionInfoAndStartObservingFromSourceWithCompletion:(id)a3
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
  v13 = __Block_byref_object_copy__17896;
  v14 = __Block_byref_object_dispose__17897;
  -[AFSiriHeadphonesMonitor _settingsConnection](self, "_settingsConnection");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v11[5], "startObservingWirelessSplitterSession");
  v5 = (void *)v11[5];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __102__AFSiriHeadphonesMonitor__fetchWirelessSplitterSessionInfoAndStartObservingFromSourceWithCompletion___block_invoke;
  v7[3] = &unk_1E3A30EC8;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  v9 = &v10;
  objc_msgSend(v5, "getBluetoothWirelessSplitterSessionInfoWithCompletion:", v7);

  _Block_object_dispose(&v10, 8);
}

- (void)_fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSString *btAddress;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  btAddress = self->_btAddress;
  if (btAddress && -[NSString length](btAddress, "length") == 17)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__17896;
    v20 = __Block_byref_object_dispose__17897;
    -[AFSiriHeadphonesMonitor _settingsConnection](self, "_settingsConnection");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v9 = (id)AFSiriLogContextConnection;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AFSiriHeadphonesMonitor _observerID](self, "_observerID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v23 = "-[AFSiriHeadphonesMonitor _fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress:withCompletion:]";
      v24 = 2112;
      v25 = v6;
      v26 = 2112;
      v27 = v10;
      _os_log_impl(&dword_19AF50000, v9, OS_LOG_TYPE_INFO, "%s Start observing IED States for %@ for observerID: %@", buf, 0x20u);

    }
    objc_msgSend((id)v17[5], "startObservingBluetoothInEarDetectionStateForBTAddress:forObserverID:", v6, -[AFSiriHeadphonesMonitor _observerID](self, "_observerID"));
    v11 = (void *)v17[5];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __107__AFSiriHeadphonesMonitor__fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress_withCompletion___block_invoke;
    v13[3] = &unk_1E3A30EF0;
    v13[4] = self;
    v14 = v7;
    v15 = &v16;
    objc_msgSend(v11, "getInEarDetectionStateForBTAddress:withCompletion:", v6, v13);

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("kAFAssistantErrorDomain"), 1803, 0);
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v12);

  }
}

- (void)_stopObservingInEarDetectionStateFromSource
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    v6 = v3;
    objc_msgSend(v5, "numberWithUnsignedInteger:", -[AFSiriHeadphonesMonitor _observerID](self, "_observerID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[AFSiriHeadphonesMonitor _stopObservingInEarDetectionStateFromSource]";
    v10 = 2112;
    v11 = v7;
    _os_log_debug_impl(&dword_19AF50000, v6, OS_LOG_TYPE_DEBUG, "%s Stop observing IED States for observerID: %@", (uint8_t *)&v8, 0x16u);

  }
  -[AFSiriHeadphonesMonitor _settingsConnection](self, "_settingsConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopObservingBluetoothInEarDetectionStateForObserverID:", -[AFSiriHeadphonesMonitor _observerID](self, "_observerID"));

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
  block[2] = __59__AFSiriHeadphonesMonitor__settingsConnectionDidDisconnect__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[4];
  id v12;
  AFSiriHeadphonesMonitor *v13;
  unint64_t v14;
  unint64_t v15;

  v8 = a3;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__AFSiriHeadphonesMonitor_notifyObserver_didChangeStateFrom_to___block_invoke;
  v11[3] = &unk_1E3A35150;
  v12 = v8;
  v13 = self;
  v14 = a4;
  v15 = a5;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)deviceRingerObserver:(id)a3 didChangeState:(int64_t)a4
{
  NSObject *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__AFSiriHeadphonesMonitor_deviceRingerObserver_didChangeState___block_invoke;
  v5[3] = &unk_1E3A353C0;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)_broadcastRouteAndAuthenticationCapability
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__AFSiriHeadphonesMonitor__broadcastRouteAndAuthenticationCapability__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_broadcastInEarDetectionStateChangesFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__AFSiriHeadphonesMonitor__broadcastInEarDetectionStateChangesFrom_to___block_invoke;
  block[3] = &unk_1E3A36B90;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (void)_recomputePrivateSessionStateAndBroadcast:(BOOL)a3
{
  unint64_t v3;
  NSObject *queue;
  _QWORD block[5];

  if (self->_wirelessSplitterSessionActive)
  {
    v3 = 2;
  }
  else
  {
    v3 = 1;
    if (self->_guestConnected)
      v3 = 2;
  }
  self->_sessionState = v3;
  if (a3)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__AFSiriHeadphonesMonitor__recomputePrivateSessionStateAndBroadcast___block_invoke;
    block[3] = &unk_1E3A36F30;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (AFSiriAudioRoute)currentAudioRoute
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
  v16 = __Block_byref_object_copy__17896;
  v17 = __Block_byref_object_dispose__17897;
  v18 = 0;
  queue = self->_queue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AFSiriHeadphonesMonitor_currentAudioRoute__block_invoke;
  block[3] = &unk_1E3A36F78;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(queue, block);
  v5 = (void *)v14[5];
  if (!v5)
  {
    objc_msgSend((id)objc_opt_class(), "_getCurrentAudioRoute:ringerSwitchState:", self->_avSystemController, -[AFDeviceRingerSwitchObserver state](self->_ringerSwitchObserver, "state"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v14[5];
    v14[5] = v6;

    v8 = self->_queue;
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __44__AFSiriHeadphonesMonitor_currentAudioRoute__block_invoke_2;
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

- (void)fetchPrivateSessionStateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;
  NSObject *v6;
  NSObject *queue;
  _QWORD v8[5];
  void (**v9)(id, uint64_t, _QWORD);
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[AFSiriHeadphonesMonitor fetchPrivateSessionStateWithCompletion:]";
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s Fetching private session state", buf, 0xCu);
  }
  if (self->_guestConnected)
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[AFSiriHeadphonesMonitor fetchPrivateSessionStateWithCompletion:]";
      _os_log_debug_impl(&dword_19AF50000, v6, OS_LOG_TYPE_DEBUG, "%s Guest connections active", buf, 0xCu);
    }
    v4[2](v4, 2, 0);
  }
  else
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__AFSiriHeadphonesMonitor_fetchPrivateSessionStateWithCompletion___block_invoke;
    v8[3] = &unk_1E3A36FA0;
    v8[4] = self;
    v9 = v4;
    dispatch_async(queue, v8);

  }
}

- (void)fetchInEarDetctionStateForBTAddress:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__AFSiriHeadphonesMonitor_fetchInEarDetctionStateForBTAddress_withCompletion___block_invoke;
  block[3] = &unk_1E3A36E10;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (unint64_t)_observerID
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)_audioRouteDidChange:(id)a3
{
  id v4;
  NSMutableDictionary *devicesScheduledForJSNotification;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_btQueue);
  devicesScheduledForJSNotification = self->_devicesScheduledForJSNotification;
  if (devicesScheduledForJSNotification)
  {
    objc_msgSend(v4, "btAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](devicesScheduledForJSNotification, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v9 = v8;
        objc_msgSend(v4, "routeName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "btAddress");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 136315650;
        v18 = "-[AFSiriHeadphonesMonitor _audioRouteDidChange:]";
        v19 = 2112;
        v20 = v10;
        v21 = 2112;
        v22 = v11;
        _os_log_impl(&dword_19AF50000, v9, OS_LOG_TYPE_INFO, "%s %@(%@) Picked, posting notification now...", (uint8_t *)&v17, 0x20u);

      }
      v12 = self->_devicesScheduledForJSNotification;
      objc_msgSend(v4, "btAddress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v12, "objectForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = self->_devicesScheduledForJSNotification;
      objc_msgSend(v4, "btAddress");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v15, "removeObjectForKey:", v16);

      -[AFSiriHeadphonesMonitor _postJSDiscoveryNotificationForBTDeviceWithInfo:scheduled:](self, "_postJSDiscoveryNotificationForBTDeviceWithInfo:scheduled:", v14, 0);
    }
  }

}

- (void)startObservingBluetoothConnections
{
  uint64_t v3;
  NSObject *btQueue;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  _QWORD block[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = MEMORY[0x1E0C809B0];
  btQueue = self->_btQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__AFSiriHeadphonesMonitor_startObservingBluetoothConnections__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(btQueue, block);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v6 = (_QWORD *)getBluetoothAccessoryAACPCapabilitiesReceivedSymbolLoc_ptr;
  v14 = getBluetoothAccessoryAACPCapabilitiesReceivedSymbolLoc_ptr;
  if (!getBluetoothAccessoryAACPCapabilitiesReceivedSymbolLoc_ptr)
  {
    v10[0] = v3;
    v10[1] = 3221225472;
    v10[2] = __getBluetoothAccessoryAACPCapabilitiesReceivedSymbolLoc_block_invoke;
    v10[3] = &unk_1E3A365A8;
    v10[4] = &v11;
    __getBluetoothAccessoryAACPCapabilitiesReceivedSymbolLoc_block_invoke(v10);
    v6 = (_QWORD *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (v6)
  {
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_accesoryAACPCapabilitiesReceived_, *v6, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getBluetoothAccessoryAACPCapabilitiesReceived(void)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("AFSiriHeadphonesMonitor.m"), 63, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (void)accesoryAACPCapabilitiesReceived:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *btQueue;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  btQueue = self->_btQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__AFSiriHeadphonesMonitor_accesoryAACPCapabilitiesReceived___block_invoke;
  block[3] = &unk_1E3A33A28;
  objc_copyWeak(&v11, &location);
  v10 = v6;
  v8 = v6;
  dispatch_async(btQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)_handleJSDiscoveryNotificationForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_btQueue);
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "-[AFSiriHeadphonesMonitor _handleJSDiscoveryNotificationForDevice:]";
    v22 = 2112;
    v23 = v5;
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s Received AACP capabilities for %@(%@)", buf, 0x20u);
  }
  if ((-[NSMutableSet containsObject:](self->_devicesAwaitingJSNotification, "containsObject:", v6) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u,%u"), objc_msgSend(v4, "vendorId"), objc_msgSend(v4, "productId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (AFIsH2Headset(v8) & 1) != 0 || objc_msgSend(v4, "getAACPCapabilityInteger:", 96) != 0;
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      v10 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v21 = "-[AFSiriHeadphonesMonitor _handleJSDiscoveryNotificationForDevice:]";
        v22 = 2112;
        v23 = v5;
        v24 = 2112;
        v25 = v6;
        _os_log_error_impl(&dword_19AF50000, v10, OS_LOG_TYPE_ERROR, "%s Unable to fetch device name for %@(%@)", buf, 0x20u);
      }
    }
    else if (((objc_msgSend(v4, "supportsHS") ^ 1 | v9) & 1) == 0)
    {
      +[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "deviceUsesCompactVoiceTrigger") & 1) != 0)
      {
        if ((objc_msgSend(v11, "hasPresentedCompactVoiceTriggerDiscoveryNotificationForBTDeviceWithAddress:", v6) & 1) == 0)
        {
          v12 = AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v21 = "-[AFSiriHeadphonesMonitor _handleJSDiscoveryNotificationForDevice:]";
            v22 = 2112;
            v23 = v5;
            v24 = 2112;
            v25 = v6;
            _os_log_impl(&dword_19AF50000, v12, OS_LOG_TYPE_INFO, "%s Trigger notification:%@(%@) doesn't support JS", buf, 0x20u);
          }
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __67__AFSiriHeadphonesMonitor__handleJSDiscoveryNotificationForDevice___block_invoke;
          v16[3] = &unk_1E3A30FB0;
          v17 = v5;
          v13 = v6;
          v18 = v13;
          v19 = v4;
          v14 = +[AFBluetoothDeviceInfo newWithBuilder:](AFBluetoothDeviceInfo, "newWithBuilder:", v16);
          -[NSMutableSet addObject:](self->_devicesAwaitingJSNotification, "addObject:", v13);
          -[AFSiriHeadphonesMonitor _postJSDiscoveryNotificationForBTDeviceWithInfo:scheduled:](self, "_postJSDiscoveryNotificationForBTDeviceWithInfo:scheduled:", v14, 1);

        }
      }
      else
      {
        v15 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v21 = "-[AFSiriHeadphonesMonitor _handleJSDiscoveryNotificationForDevice:]";
          _os_log_error_impl(&dword_19AF50000, v15, OS_LOG_TYPE_ERROR, "%s deviceUsesCompactVoiceTrigger: NO", buf, 0xCu);
        }
      }

    }
  }

}

- (void)_postJSDiscoveryNotificationForBTDeviceWithInfo:(id)a3 scheduled:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  NSObject *queue;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD block[5];
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_btQueue);
  objc_msgSend(v6, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFSiriHeadphonesMonitor currentAudioRoute](self, "currentAudioRoute");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "btAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_msgSend(v7, "isEqualToString:", v9) & 1) == 0)
  {
    v12 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v14 = v12;
      objc_msgSend(v6, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v20 = "-[AFSiriHeadphonesMonitor _postJSDiscoveryNotificationForBTDeviceWithInfo:scheduled:]";
      v21 = 2112;
      v22 = v15;
      v23 = 2112;
      v24 = v7;
      _os_log_error_impl(&dword_19AF50000, v14, OS_LOG_TYPE_ERROR, "%s Scheduled JS Discovery notification for %@(%@)", buf, 0x20u);

    }
    -[NSMutableDictionary objectForKey:](self->_devicesScheduledForJSNotification, "objectForKey:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      -[NSMutableDictionary setObject:forKey:](self->_devicesScheduledForJSNotification, "setObject:forKey:", v6, v7);
  }
  else
  {
    v10 = dispatch_time(0, 5500000000);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__AFSiriHeadphonesMonitor__postJSDiscoveryNotificationForBTDeviceWithInfo_scheduled___block_invoke;
    block[3] = &unk_1E3A36B90;
    block[4] = self;
    v17 = v6;
    v18 = v7;
    dispatch_after(v10, queue, block);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAudioRoute, 0);
  objc_storeStrong((id *)&self->_devicesAwaitingJSNotification, 0);
  objc_storeStrong((id *)&self->_devicesScheduledForJSNotification, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_btQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_routeName, 0);
  objc_storeStrong((id *)&self->_btAddress, 0);
  objc_storeStrong((id *)&self->_avSystemController, 0);
  objc_storeStrong((id *)&self->_ringerSwitchObserver, 0);
  objc_storeStrong((id *)&self->_wirelessGuestConnectionObserver, 0);
  objc_storeStrong((id *)&self->_wirelessSplitterSessionObserver, 0);
  objc_storeStrong((id *)&self->_inEarDetectionStateObserver, 0);
  objc_storeStrong((id *)&self->_pairedInfoChangeObserver, 0);
  objc_storeStrong((id *)&self->_settingsConnection, 0);
  objc_storeStrong((id *)&self->_inEarDetectionState, 0);
}

void __85__AFSiriHeadphonesMonitor__postJSDiscoveryNotificationForBTDeviceWithInfo_scheduled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__AFSiriHeadphonesMonitor__postJSDiscoveryNotificationForBTDeviceWithInfo_scheduled___block_invoke_2;
  v6[3] = &unk_1E3A30FD8;
  v7 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  objc_msgSend(v3, "postJSDiscoveryNotificationForBTDeviceWithInfo:withCompletion:", v2, v6);

}

void __85__AFSiriHeadphonesMonitor__postJSDiscoveryNotificationForBTDeviceWithInfo_scheduled___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v5 = *(void **)(a1 + 40);
      v6 = v4;
      objc_msgSend(v5, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "address");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v21 = "-[AFSiriHeadphonesMonitor _postJSDiscoveryNotificationForBTDeviceWithInfo:scheduled:]_block_invoke_2";
      v22 = 2112;
      v23 = v7;
      v24 = 2112;
      v25 = v8;
      v26 = 2112;
      v27 = v3;
      _os_log_error_impl(&dword_19AF50000, v6, OS_LOG_TYPE_ERROR, "%s Failed to post JS Discovery notification for %@(%@), error: %@", buf, 0x2Au);

    }
  }
  else
  {
    +[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCompactVoiceTriggerDiscoveryNotificationPresented:forBTDeviceWithAddress:", 1, *(_QWORD *)(a1 + 32));

    v10 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v14 = *(void **)(a1 + 40);
      v15 = v10;
      objc_msgSend(v14, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "address");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v21 = "-[AFSiriHeadphonesMonitor _postJSDiscoveryNotificationForBTDeviceWithInfo:scheduled:]_block_invoke_2";
      v22 = 2112;
      v23 = v16;
      v24 = 2112;
      v25 = v17;
      _os_log_error_impl(&dword_19AF50000, v15, OS_LOG_TYPE_ERROR, "%s JS Discovery notification for %@(%@) was posted successfully!", buf, 0x20u);

    }
    v12 = *(void **)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    v13 = *(NSObject **)(v11 + 120);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __85__AFSiriHeadphonesMonitor__postJSDiscoveryNotificationForBTDeviceWithInfo_scheduled___block_invoke_55;
    v18[3] = &unk_1E3A36FC8;
    v18[4] = v11;
    v19 = v12;
    dispatch_async(v13, v18);

  }
}

void __85__AFSiriHeadphonesMonitor__postJSDiscoveryNotificationForBTDeviceWithInfo_scheduled___block_invoke_55(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
  objc_msgSend(*(id *)(a1 + 40), "address");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeObject:", v2);

}

void __67__AFSiriHeadphonesMonitor__handleJSDiscoveryNotificationForDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setName:", v3);
  objc_msgSend(v4, "setAddress:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setVendorID:", objc_msgSend(*(id *)(a1 + 48), "vendorId"));
  objc_msgSend(v4, "setProductID:", objc_msgSend(*(id *)(a1 + 48), "productId"));

}

void __60__AFSiriHeadphonesMonitor_accesoryAACPCapabilitiesReceived___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[AFSiriHeadphonesMonitor accesoryAACPCapabilitiesReceived:]_block_invoke";
    v7 = 2112;
    v8 = v4;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s Bluetooth device: %@", (uint8_t *)&v5, 0x16u);
  }
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(WeakRetained, "_handleJSDiscoveryNotificationForDevice:");

}

void __61__AFSiriHeadphonesMonitor_startObservingBluetoothConnections__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 136))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 136);
    *(_QWORD *)(v4 + 136) = v3;

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (!*(_QWORD *)(v2 + 144))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 144);
    *(_QWORD *)(v7 + 144) = v6;

  }
}

void __78__AFSiriHeadphonesMonitor_fetchInEarDetctionStateForBTAddress_withCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __78__AFSiriHeadphonesMonitor_fetchInEarDetctionStateForBTAddress_withCompletion___block_invoke_2;
  v3[3] = &unk_1E3A30F88;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress:withCompletion:", v2, v3);

}

void __78__AFSiriHeadphonesMonitor_fetchInEarDetctionStateForBTAddress_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v7 = v9;
    if (v5)
    {
      v7 = 0;
      v8 = v5;
    }
    else
    {
      v8 = 0;
    }
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v8);
  }

}

void __66__AFSiriHeadphonesMonitor_fetchPrivateSessionStateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _BYTE *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 33) && (v3 = *(_QWORD *)(v2 + 8)) != 0)
  {
    v4 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      v6 = (void *)MEMORY[0x1E0CB37E8];
      v7 = v4;
      objc_msgSend(v6, "numberWithUnsignedInteger:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v12 = "-[AFSiriHeadphonesMonitor fetchPrivateSessionStateWithCompletion:]_block_invoke";
      v13 = 2112;
      v14 = v8;
      _os_log_debug_impl(&dword_19AF50000, v7, OS_LOG_TYPE_DEBUG, "%s Private session state: %@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (AFSupportsWirelessSplitter_onceToken != -1)
      dispatch_once(&AFSupportsWirelessSplitter_onceToken, &__block_literal_global_148);
    v5 = *(_BYTE **)(a1 + 32);
    if (AFSupportsWirelessSplitter_supportsWirelessSplitter)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __66__AFSiriHeadphonesMonitor_fetchPrivateSessionStateWithCompletion___block_invoke_45;
      v9[3] = &unk_1E3A30F60;
      v9[4] = v5;
      v10 = *(id *)(a1 + 40);
      objc_msgSend(v5, "_fetchWirelessSplitterSessionInfoAndStartObservingFromSourceWithCompletion:", v9);

    }
    else
    {
      v5[33] = 1;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 1;
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 0);
    }
  }
}

void __66__AFSiriHeadphonesMonitor_fetchPrivateSessionStateWithCompletion___block_invoke_45(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 112);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__AFSiriHeadphonesMonitor_fetchPrivateSessionStateWithCompletion___block_invoke_2;
  v12[3] = &unk_1E3A346A0;
  v12[4] = v7;
  v13 = v5;
  v14 = v6;
  v15 = v8;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, v12);

}

uint64_t __66__AFSiriHeadphonesMonitor_fetchPrivateSessionStateWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = objc_msgSend(*(id *)(a1 + 40), "state") != 1;
  if (*(_QWORD *)(a1 + 48))
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 0);
  v3 = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 1;
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v4 + 16))
    v3 = 2;
  *(_QWORD *)(v4 + 8) = v3;
  v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = v5;
    objc_msgSend(v6, "numberWithUnsignedInteger:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315394;
    v11 = "-[AFSiriHeadphonesMonitor fetchPrivateSessionStateWithCompletion:]_block_invoke_2";
    v12 = 2112;
    v13 = v9;
    _os_log_debug_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEBUG, "%s Fetched wireless splitter session, private session state: %@", (uint8_t *)&v10, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __44__AFSiriHeadphonesMonitor_currentAudioRoute__block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
  if (v1)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v1);
}

void __44__AFSiriHeadphonesMonitor_currentAudioRoute__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 152), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __69__AFSiriHeadphonesMonitor__recomputePrivateSessionStateAndBroadcast___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  __objc2_class **p_superclass;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "copy");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v18;
    p_superclass = &OBJC_METACLASS___AFFeatureFlags.superclass;
    *(_QWORD *)&v5 = 136315650;
    v16 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v11 = p_superclass[179];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            v12 = (void *)MEMORY[0x1E0CB37E8];
            v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
            v14 = v11;
            objc_msgSend(v12, "numberWithUnsignedInteger:", v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v16;
            v22 = "-[AFSiriHeadphonesMonitor _recomputePrivateSessionStateAndBroadcast:]_block_invoke";
            v23 = 2112;
            v24 = v10;
            v25 = 2112;
            v26 = v15;
            _os_log_debug_impl(&dword_19AF50000, v14, OS_LOG_TYPE_DEBUG, "%s Telling %@ privateSessionState:%@", buf, 0x20u);

            p_superclass = (__objc2_class **)(&OBJC_METACLASS___AFFeatureFlags + 8);
          }
          objc_msgSend(v10, "privateAudioSessionStateDidChange:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v16, (_QWORD)v17);
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    }
    while (v6);
  }

}

void __71__AFSiriHeadphonesMonitor__broadcastInEarDetectionStateChangesFrom_to___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1[4] + 128), "copy");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v19;
    *(_QWORD *)&v5 = 136315906;
    v17 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v10 = AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
          {
            v12 = a1[4];
            v13 = *(_QWORD *)(v12 + 96);
            v14 = *(_QWORD *)(v12 + 24);
            *(_DWORD *)buf = v17;
            v23 = "-[AFSiriHeadphonesMonitor _broadcastInEarDetectionStateChangesFrom:to:]_block_invoke";
            v24 = 2112;
            v25 = v9;
            v26 = 2112;
            v27 = v13;
            v28 = 2112;
            v29 = v14;
            _os_log_debug_impl(&dword_19AF50000, v10, OS_LOG_TYPE_DEBUG, "%s Telling %@ inEarDetectionStateDidChangeForBTAddress: %@ toState:%@", buf, 0x2Au);
          }
          objc_msgSend(v9, "inEarDetectionStateDidChangeForBTAddress:toState:", *(_QWORD *)(a1[4] + 96), *(_QWORD *)(a1[4] + 24), v17, (_QWORD)v18);
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v11 = AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
          {
            v15 = a1[5];
            v16 = *(_QWORD *)(a1[4] + 96);
            *(_DWORD *)buf = v17;
            v23 = "-[AFSiriHeadphonesMonitor _broadcastInEarDetectionStateChangesFrom:to:]_block_invoke";
            v24 = 2112;
            v25 = v9;
            v26 = 2112;
            v27 = v16;
            v28 = 2112;
            v29 = v15;
            _os_log_debug_impl(&dword_19AF50000, v11, OS_LOG_TYPE_DEBUG, "%s Telling %@ inEarDetectionStateDidChangeForBTAddress: %@ toState:%@", buf, 0x2Au);
          }
          objc_msgSend(v9, "inEarDetectionStateDidChangeForBTAddress:fromState:toState:", *(_QWORD *)(a1[4] + 96), a1[6], a1[5], v17);
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
    }
    while (v6);
  }

}

void __69__AFSiriHeadphonesMonitor__broadcastRouteAndAuthenticationCapability__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "copy");
  v26 = a1;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
  v4 = v3;
  v5 = objc_msgSend((id)_broadcastRouteAndAuthenticationCapability_previousAudioRoute, "hash");
  if (v5 != objc_msgSend(v4, "hash"))
  {
    objc_storeStrong((id *)&_broadcastRouteAndAuthenticationCapability_previousAudioRoute, v3);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v6 = v2;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v28;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v12 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
            {
              v14 = *(_QWORD **)(v26 + 32);
              v22 = (void *)v14[13];
              v23 = v14[12];
              v19 = v14[1];
              v20 = (void *)MEMORY[0x1E0CB37E8];
              v15 = v12;
              objc_msgSend(v20, "numberWithUnsignedInteger:", v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136316162;
              v32 = "-[AFSiriHeadphonesMonitor _broadcastRouteAndAuthenticationCapability]_block_invoke";
              v33 = 2112;
              v34 = v11;
              v35 = 2112;
              v36 = v22;
              v37 = 2112;
              v38 = v23;
              v39 = 2112;
              v40 = v21;
              _os_log_debug_impl(&dword_19AF50000, v15, OS_LOG_TYPE_DEBUG, "%s Telling %@ currentAudioRouteDidChange:to %@(%@) privateSessionState:%@", buf, 0x34u);

            }
            objc_msgSend(v11, "currentAudioRouteDidChange:", v4);
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v13 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
            {
              v24 = (void *)MEMORY[0x1E0CB37E8];
              v16 = v13;
              objc_msgSend(v24, "numberWithBool:", objc_msgSend(v4, "hasAuthenticationCapability"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = *(void **)(*(_QWORD *)(v26 + 32) + 96);
              v18 = *(_QWORD *)(*(_QWORD *)(v26 + 32) + 104);
              *(_DWORD *)buf = 136316162;
              v32 = "-[AFSiriHeadphonesMonitor _broadcastRouteAndAuthenticationCapability]_block_invoke";
              v33 = 2112;
              v34 = v11;
              v35 = 2112;
              v36 = v25;
              v37 = 2112;
              v38 = v18;
              v39 = 2112;
              v40 = v17;
              _os_log_debug_impl(&dword_19AF50000, v16, OS_LOG_TYPE_DEBUG, "%s Telling %@ authenticationCapabilityDidChange:%@ to %@(%@)", buf, 0x34u);

            }
            objc_msgSend(v11, "authenticationCapabilityDidChange:forBTAddress:", objc_msgSend(v4, "hasAuthenticationCapability"), *(_QWORD *)(*(_QWORD *)(v26 + 32) + 96));
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
      }
      while (v8);
    }

  }
}

uint64_t __63__AFSiriHeadphonesMonitor_deviceRingerObserver_didChangeState___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  int v8;
  const char *v9;
  __int16 v10;
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = v2;
    if (v4 > 2)
      v6 = CFSTR("(unknown)");
    else
      v6 = off_1E3A2E3E0[v4];
    v7 = v6;
    v8 = 136315394;
    v9 = "-[AFSiriHeadphonesMonitor deviceRingerObserver:didChangeState:]_block_invoke";
    v10 = 2112;
    v11 = v7;
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s Updating ringer switch state to: %@", (uint8_t *)&v8, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateAudioRouteAvailabilityAndBroadcast:", 1);
}

void __64__AFSiriHeadphonesMonitor_notifyObserver_didChangeStateFrom_to___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[5];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD **)(a1 + 40);
  if (v2 != v3[8])
  {
    if (v2 != v3[9])
    {
      if (v2 == v3[7])
      {
        v4 = *(_QWORD *)(a1 + 56);
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __64__AFSiriHeadphonesMonitor_notifyObserver_didChangeStateFrom_to___block_invoke_33;
        v21[3] = &unk_1E3A30F38;
        v21[4] = v3;
        +[AFBluetoothHeadphoneInEarDetectionState decodeFromNotifyState:withCompletion:](AFBluetoothHeadphoneInEarDetectionState, "decodeFromNotifyState:withCompletion:", v4, v21);
      }
      return;
    }
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v11 = *(void **)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 136315650;
      v23 = "-[AFSiriHeadphonesMonitor notifyObserver:didChangeStateFrom:to:]_block_invoke";
      v24 = 2048;
      v25 = v11;
      v26 = 2048;
      v27 = v12;
      _os_log_impl(&dword_19AF50000, v10, OS_LOG_TYPE_INFO, "%s wireless guest connection state changed from %llu to %llu", buf, 0x20u);
      v10 = AFSiriLogContextConnection;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v13 = (void *)MEMORY[0x1E0CB37E8];
      v14 = *(_QWORD *)(a1 + 56);
      v15 = v10;
      objc_msgSend(v13, "numberWithUnsignedLongLong:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v23 = "-[AFSiriHeadphonesMonitor notifyObserver:didChangeStateFrom:to:]_block_invoke";
      v24 = 2112;
      v25 = v16;
      _os_log_debug_impl(&dword_19AF50000, v15, OS_LOG_TYPE_DEBUG, "%s guestConnection: %@", buf, 0x16u);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 32) = *(_QWORD *)(a1 + 56) != 0;
LABEL_16:
    objc_msgSend(*(id *)(a1 + 40), "_recomputePrivateSessionStateAndBroadcast:", 1);
    return;
  }
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = *(void **)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 136315650;
    v23 = "-[AFSiriHeadphonesMonitor notifyObserver:didChangeStateFrom:to:]_block_invoke";
    v24 = 2048;
    v25 = v6;
    v26 = 2048;
    v27 = v7;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s wireless splitter session state changed from %llu to %llu", buf, 0x20u);
    v3 = *(_QWORD **)(a1 + 40);
  }
  v8 = *(_QWORD *)(a1 + 56);
  if (v3[2] != v8)
  {
    v3[2] = v8;
    v9 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      v17 = (void *)MEMORY[0x1E0CB37E8];
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
      v19 = v9;
      objc_msgSend(v17, "numberWithUnsignedLongLong:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v23 = "-[AFSiriHeadphonesMonitor notifyObserver:didChangeStateFrom:to:]_block_invoke";
      v24 = 2112;
      v25 = v20;
      _os_log_debug_impl(&dword_19AF50000, v19, OS_LOG_TYPE_DEBUG, "%s wireless splitter session active: %@", buf, 0x16u);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 33) = 0;
    goto LABEL_16;
  }
}

void __64__AFSiriHeadphonesMonitor_notifyObserver_didChangeStateFrom_to___block_invoke_33(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 112);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__AFSiriHeadphonesMonitor_notifyObserver_didChangeStateFrom_to___block_invoke_2;
  v15[3] = &unk_1E3A369B8;
  v16 = v9;
  v17 = v10;
  v18 = v7;
  v19 = v8;
  v12 = v8;
  v13 = v7;
  v14 = v9;
  dispatch_async(v11, v15);

}

uint64_t __64__AFSiriHeadphonesMonitor_notifyObserver_didChangeStateFrom_to___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(result + 40);
  if (v1 != *(_QWORD *)(v2 + 24))
  {
    v3 = result;
    v4 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(v3 + 48);
      v6 = *(_QWORD *)(v3 + 56);
      v7 = 136315906;
      v8 = "-[AFSiriHeadphonesMonitor notifyObserver:didChangeStateFrom:to:]_block_invoke_2";
      v9 = 2112;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      v13 = 2112;
      v14 = v1;
      _os_log_debug_impl(&dword_19AF50000, v4, OS_LOG_TYPE_DEBUG, "%s In-ear detection state for %@: %@ -> %@", (uint8_t *)&v7, 0x2Au);
      v2 = *(_QWORD *)(v3 + 40);
    }
    result = objc_msgSend(*(id *)(v3 + 48), "isEqualToString:", *(_QWORD *)(v2 + 96));
    if ((_DWORD)result)
    {
      objc_storeStrong((id *)(*(_QWORD *)(v3 + 40) + 24), *(id *)(v3 + 32));
      return objc_msgSend(*(id *)(v3 + 40), "_broadcastInEarDetectionStateChangesFrom:to:", *(_QWORD *)(v3 + 56), *(_QWORD *)(v3 + 32));
    }
  }
  return result;
}

void __59__AFSiriHeadphonesMonitor__settingsConnectionDidDisconnect__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  AFBluetoothHeadphoneInEarDetectionState *v5;
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315138;
    v10 = "-[AFSiriHeadphonesMonitor _settingsConnectionDidDisconnect]_block_invoke";
    _os_log_debug_impl(&dword_19AF50000, v2, OS_LOG_TYPE_DEBUG, "%s Settings connection: disconnected!", (uint8_t *)&v9, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 404;
  v5 = -[AFBluetoothHeadphoneInEarDetectionState initWithBuilder:]([AFBluetoothHeadphoneInEarDetectionState alloc], "initWithBuilder:", &__block_literal_global_32_17922);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v5;

  v8 = *(id *)(*(_QWORD *)(a1 + 32) + 152);
  if ((objc_msgSend(v8, "hasAuthenticationCapability") & 1) != 0
    || objc_msgSend(v8, "availableAnnouncementRequestTypes"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateWirelessSplitterSessionInfoAndObserve");
    objc_msgSend(*(id *)(a1 + 32), "_updateInEarDetectionStateAndObserve");
  }

}

void __59__AFSiriHeadphonesMonitor__settingsConnectionDidDisconnect__block_invoke_31(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setIsEnabled:", 0);
  objc_msgSend(v2, "setPrimaryEarbudSide:", 0);
  objc_msgSend(v2, "setPrimaryInEarStatus:", 0);
  objc_msgSend(v2, "setSecondaryInEarStatus:", 0);

}

void __107__AFSiriHeadphonesMonitor__fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress_withCompletion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  v7 = (void *)a1[5];
  v8 = *(NSObject **)(a1[4] + 112);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __107__AFSiriHeadphonesMonitor__fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress_withCompletion___block_invoke_2;
  v13[3] = &unk_1E3A30EA0;
  v9 = v7;
  v14 = v5;
  v15 = v6;
  v10 = a1[6];
  v16 = v9;
  v17 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v8, v13);

}

void __107__AFSiriHeadphonesMonitor__fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress_withCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = a1[6];
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, a1[4], a1[5]);
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

void __102__AFSiriHeadphonesMonitor__fetchWirelessSplitterSessionInfoAndStartObservingFromSourceWithCompletion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  v7 = (void *)a1[5];
  v8 = *(NSObject **)(a1[4] + 112);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __102__AFSiriHeadphonesMonitor__fetchWirelessSplitterSessionInfoAndStartObservingFromSourceWithCompletion___block_invoke_2;
  v13[3] = &unk_1E3A30EA0;
  v9 = v7;
  v14 = v5;
  v15 = v6;
  v10 = a1[6];
  v16 = v9;
  v17 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v8, v13);

}

void __102__AFSiriHeadphonesMonitor__fetchWirelessSplitterSessionInfoAndStartObservingFromSourceWithCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = a1[6];
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, a1[4], a1[5]);
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

void __69__AFSiriHeadphonesMonitor__updateAudioRouteAvailabilityAndBroadcast___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 112);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__AFSiriHeadphonesMonitor__updateAudioRouteAvailabilityAndBroadcast___block_invoke_2;
  block[3] = &unk_1E3A36B90;
  v12 = v6;
  v13 = v7;
  v14 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, block);

}

void __69__AFSiriHeadphonesMonitor__updateAudioRouteAvailabilityAndBroadcast___block_invoke_28(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 136315394;
    v5 = "-[AFSiriHeadphonesMonitor _updateAudioRouteAvailabilityAndBroadcast:]_block_invoke";
    v6 = 2112;
    v7 = v3;
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s Audio route changed to: %@", (uint8_t *)&v4, 0x16u);
  }
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "_audioRouteDidChange:");
}

void __69__AFSiriHeadphonesMonitor__updateAudioRouteAvailabilityAndBroadcast___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      v3 = 136315394;
      v4 = "-[AFSiriHeadphonesMonitor _updateAudioRouteAvailabilityAndBroadcast:]_block_invoke_2";
      v5 = 2112;
      v6 = v1;
      _os_log_debug_impl(&dword_19AF50000, v2, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v3, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 24), *(id *)(a1 + 48));
  }
}

uint64_t __42__AFSiriHeadphonesMonitor_removeDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __39__AFSiriHeadphonesMonitor_addDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "addObject:", *(_QWORD *)(a1 + 40));
}

void __48__AFSiriHeadphonesMonitor_systemControllerDied___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[AFSiriHeadphonesMonitor systemControllerDied:]_block_invoke";
    _os_log_debug_impl(&dword_19AF50000, v2, OS_LOG_TYPE_DEBUG, "%s AVSystemController died, updating route availability", buf, 0xCu);
  }
  objc_msgSend(getAVSystemControllerClass(), "sharedAVSystemController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 88);
  *(_QWORD *)(v4 + 88) = v3;

  getAVSystemController_PickableRoutesDidChangeNotification();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  getAVSystemController_PreferredExternalRouteDidChangeNotification();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  getAVSystemController_SubscribeToNotificationsAttribute();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAttribute:forKey:error:", v8, v10, 0, v11[0]);

  objc_msgSend(*(id *)(a1 + 32), "updateAudioRouteAvailability:", *(_QWORD *)(a1 + 40));
}

void __63__AFSiriHeadphonesMonitor__updateInEarDetectionStateAndObserve__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 112);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AFSiriHeadphonesMonitor__updateInEarDetectionStateAndObserve__block_invoke_3;
  block[3] = &unk_1E3A36B90;
  v12 = v5;
  v13 = v7;
  v14 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

void __63__AFSiriHeadphonesMonitor__updateInEarDetectionStateAndObserve__block_invoke_3(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = (void *)a1[4];
  v2 = a1[5];
  if (v1 != *(void **)(v2 + 24))
  {
    v4 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD *)(v2 + 96);
      v8 = a1[6];
      v9 = 136315906;
      v10 = "-[AFSiriHeadphonesMonitor _updateInEarDetectionStateAndObserve]_block_invoke_3";
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v1;
      v15 = 2112;
      v16 = v8;
      _os_log_debug_impl(&dword_19AF50000, v4, OS_LOG_TYPE_DEBUG, "%s In-ear detection state for %@: %@, error: %@", (uint8_t *)&v9, 0x2Au);
      v1 = (void *)a1[4];
      v2 = a1[5];
    }
    objc_storeStrong((id *)(v2 + 24), v1);
    v5 = (void *)a1[5];
    v6 = (void *)objc_opt_new();
    objc_msgSend(v5, "_broadcastInEarDetectionStateChangesFrom:to:", v6, a1[4]);

  }
}

_BYTE *__71__AFSiriHeadphonesMonitor__updateWirelessSplitterSessionInfoAndObserve__block_invoke(uint64_t a1)
{
  _BYTE *result;
  _QWORD v3[5];

  if (AFSupportsWirelessSplitter_onceToken != -1)
    dispatch_once(&AFSupportsWirelessSplitter_onceToken, &__block_literal_global_148);
  result = *(_BYTE **)(a1 + 32);
  if (AFSupportsWirelessSplitter_supportsWirelessSplitter)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __71__AFSiriHeadphonesMonitor__updateWirelessSplitterSessionInfoAndObserve__block_invoke_2;
    v3[3] = &unk_1E3A30E50;
    v3[4] = result;
    return (_BYTE *)objc_msgSend(result, "_fetchWirelessSplitterSessionInfoAndStartObservingFromSourceWithCompletion:", v3);
  }
  else
  {
    result[33] = 1;
  }
  return result;
}

void __71__AFSiriHeadphonesMonitor__updateWirelessSplitterSessionInfoAndObserve__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 112);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__AFSiriHeadphonesMonitor__updateWirelessSplitterSessionInfoAndObserve__block_invoke_3;
  block[3] = &unk_1E3A36B90;
  v12 = v5;
  v13 = v6;
  v14 = v7;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

void __71__AFSiriHeadphonesMonitor__updateWirelessSplitterSessionInfoAndObserve__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(void **)(a1 + 32);
    v9 = v2;
    v10 = objc_msgSend(v8, "state");
    v11 = *(_QWORD *)(a1 + 40);
    v12 = 136315650;
    v13 = "-[AFSiriHeadphonesMonitor _updateWirelessSplitterSessionInfoAndObserve]_block_invoke_3";
    v14 = 2048;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    _os_log_debug_impl(&dword_19AF50000, v9, OS_LOG_TYPE_DEBUG, "%s Wireless splitter session state: %ld, error: %@", (uint8_t *)&v12, 0x20u);

  }
  *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16) = objc_msgSend(*(id *)(a1 + 32), "state") != 1;
  v3 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16);
    v6 = v3;
    objc_msgSend(v4, "numberWithUnsignedLongLong:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315394;
    v13 = "-[AFSiriHeadphonesMonitor _updateWirelessSplitterSessionInfoAndObserve]_block_invoke";
    v14 = 2112;
    v15 = (uint64_t)v7;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s Wireless splitter session active: %@", (uint8_t *)&v12, 0x16u);

  }
  if (!*(_QWORD *)(a1 + 40))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 48) + 33) = 1;
    objc_msgSend(*(id *)(a1 + 48), "_recomputePrivateSessionStateAndBroadcast:", 1);
  }
}

uint64_t __45__AFSiriHeadphonesMonitor__fetchInitialState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAudioRouteAvailabilityAndBroadcast:", 0);
}

uint64_t __45__AFSiriHeadphonesMonitor__fetchInitialState__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAnnounceNotificationsOnHearingAidSupportedStatus");
}

void __32__AFSiriHeadphonesMonitor__init__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(getAVSystemControllerClass(), "sharedAVSystemController");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 88);
  *(_QWORD *)(v3 + 88) = v2;

  getAVSystemController_PickableRoutesDidChangeNotification();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  getAVSystemController_PreferredExternalRouteDidChangeNotification();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  getAVSystemController_SubscribeToNotificationsAttribute();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttribute:forKey:error:", v7, v9, 0);

  v10 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v11 = 136315138;
    v12 = "-[AFSiriHeadphonesMonitor _init]_block_invoke_2";
    _os_log_impl(&dword_19AF50000, v10, OS_LOG_TYPE_INFO, "%s AVSystemController subscription complete", (uint8_t *)&v11, 0xCu);
  }

}

void __32__AFSiriHeadphonesMonitor__init__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setIsEnabled:", 0);
  objc_msgSend(v2, "setPrimaryEarbudSide:", 0);
  objc_msgSend(v2, "setPrimaryInEarStatus:", 0);
  objc_msgSend(v2, "setSecondaryInEarStatus:", 0);

}

+ (id)sharedMonitor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__AFSiriHeadphonesMonitor_sharedMonitor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMonitor_onceToken_17969 != -1)
    dispatch_once(&sharedMonitor_onceToken_17969, block);
  return (id)sharedMonitor_monitor;
}

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("AFSiriHeadphonesMonitor.m"), 191, CFSTR("new is not allowed, use +[AFSiriHeadphonesMonitor sharedMonitor]"));

  return 0;
}

+ (id)getCurrentAudioRoute
{
  return (id)objc_msgSend((id)objc_opt_class(), "_getCurrentAudioRoute:ringerSwitchState:", 0, 0);
}

+ (id)_getCurrentAudioRoute:(id)a3 ringerSwitchState:(int64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  AFSiriAudioRoute *v14;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = _AFPreferencesAnnounceNotificationsOnHearingAidsEnabled();
  v7 = _AFPreferencesAnnounceNotificationsOnBuiltInSpeakerEnabled();
  if (!v5)
  {
    objc_msgSend(getAVSystemControllerClass(), "sharedAVSystemController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v8 = (_QWORD *)getAVSystemController_PickableRoutesAttributeSymbolLoc_ptr;
  v25 = getAVSystemController_PickableRoutesAttributeSymbolLoc_ptr;
  if (!getAVSystemController_PickableRoutesAttributeSymbolLoc_ptr)
  {
    v9 = MediaExperienceLibrary();
    v8 = dlsym(v9, "AVSystemController_PickableRoutesAttribute");
    v23[3] = (uint64_t)v8;
    getAVSystemController_PickableRoutesAttributeSymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v22, 8);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_PickableRoutesAttribute(void)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("AFSiriHeadphonesMonitor.m"), 44, CFSTR("%s"), dlerror());

    __break(1u);
  }
  objc_msgSend(v5, "attributeForKey:", *v8);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v19;
LABEL_8:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v12)
        objc_enumerationMutation(v10);
      v14 = -[AFSiriAudioRoute initWithRouteDescription:hearingAidsAnnounceEnabled:builtInSpeakerAnnounceEnabled:ringerSwitchState:]([AFSiriAudioRoute alloc], "initWithRouteDescription:hearingAidsAnnounceEnabled:builtInSpeakerAnnounceEnabled:ringerSwitchState:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13), v6, v7, a4);
      if (-[AFSiriAudioRoute isRouteCurrentlyPicked](v14, "isRouteCurrentlyPicked"))
        break;

      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v11)
          goto LABEL_8;
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    v14 = 0;
  }

  return v14;
}

void __40__AFSiriHeadphonesMonitor_sharedMonitor__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_init");
  v1 = (void *)sharedMonitor_monitor;
  sharedMonitor_monitor = v0;

}

@end
