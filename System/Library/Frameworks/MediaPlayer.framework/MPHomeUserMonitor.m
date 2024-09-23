@implementation MPHomeUserMonitor

- (MPHomeUserMonitor)initWithUser:(id)a3 homeManager:(id)a4
{
  id v6;
  id v7;
  MPHomeUserMonitor *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v11;
  OS_dispatch_queue *calloutQueue;
  NSObject *v13;
  _QWORD block[4];
  MPHomeUserMonitor *v16;
  id v17;
  id v18;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MPHomeUserMonitor;
  v8 = -[MPHomeUserMonitor init](&v19, sel_init);
  if (v8)
  {
    v9 = dispatch_queue_create("com.apple.mediaplayer.MPHomeUserMonitor.accessQueue", 0);
    accessQueue = v8->_accessQueue;
    v8->_accessQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_create("com.apple.mediaplayer.MPHomeUserMonitor.calloutQueue", MEMORY[0x1E0C80D50]);
    calloutQueue = v8->_calloutQueue;
    v8->_calloutQueue = (OS_dispatch_queue *)v11;

    v13 = v8->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__MPHomeUserMonitor_initWithUser_homeManager___block_invoke;
    block[3] = &unk_1E3163698;
    v16 = v8;
    v17 = v7;
    v18 = v6;
    dispatch_sync(v13, block);

  }
  return v8;
}

- (void)_update
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  -[MPHomeUserMonitor _loadAllowExplicitValue](self, "_loadAllowExplicitValue");
  -[MPHomeUserMonitor _loadCurrentAccessoryPrivateListening](self, "_loadCurrentAccessoryPrivateListening");
}

- (BOOL)isExplicitSettingEnabled
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
  v9 = 1;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__MPHomeUserMonitor_isExplicitSettingEnabled__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setExplicitSettingEnabled:(BOOL)a3
{
  NSObject *accessQueue;
  _QWORD v4[5];
  BOOL v5;

  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__MPHomeUserMonitor_setExplicitSettingEnabled___block_invoke;
  v4[3] = &unk_1E3163468;
  v4[4] = self;
  v5 = a3;
  dispatch_async(accessQueue, v4);
}

- (BOOL)isPrivateListeningEnabledForCurrentAccessory
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
  v9 = 1;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__MPHomeUserMonitor_isPrivateListeningEnabledForCurrentAccessory__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setPrivateListeningEnabledForCurrentAccessory:(BOOL)a3
{
  NSObject *accessQueue;
  _QWORD v4[5];
  BOOL v5;

  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__MPHomeUserMonitor_setPrivateListeningEnabledForCurrentAccessory___block_invoke;
  v4[3] = &unk_1E3163468;
  v4[4] = self;
  v5 = a3;
  dispatch_async(accessQueue, v4);
}

- (void)setPrivateListeningEnabledForAccessoryWithRouteID:(id)a3 enabled:(BOOL)a4
{
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__MPHomeUserMonitor_setPrivateListeningEnabledForAccessoryWithRouteID_enabled___block_invoke;
  block[3] = &unk_1E31623A8;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(accessQueue, block);

}

- (BOOL)hasAccessoryWithRouteID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  -[HMHomeManager currentHome](self->_homeManager, "currentHome");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    objc_msgSend(v5, "accessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45__MPHomeUserMonitor_hasAccessoryWithRouteID___block_invoke;
    v10[3] = &unk_1E31623D0;
    v11 = v4;
    v12 = &v13;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

    v8 = *((_BYTE *)v14 + 24) != 0;
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)privateListeningEnabledForAccessoryWithRouteID:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[4];
  id v9;
  MPHomeUserMonitor *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__MPHomeUserMonitor_privateListeningEnabledForAccessoryWithRouteID___block_invoke;
  block[3] = &unk_1E31635A8;
  v9 = v4;
  v10 = self;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  LOBYTE(accessQueue) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)accessQueue;
}

- (id)privateListeningEnabledForGroupWithRouteIDs:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  if (+[MPHomeMonitor isCurrentDeviceValidHomeAccessory](MPHomeMonitor, "isCurrentDeviceValidHomeAccessory"))
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__46319;
    v12 = __Block_byref_object_dispose__46320;
    v13 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65__MPHomeUserMonitor_privateListeningEnabledForGroupWithRouteIDs___block_invoke;
    v7[3] = &unk_1E31623F8;
    v7[4] = self;
    v7[5] = &v8;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
    v5 = (id)v9[5];
    _Block_object_dispose(&v8, 8);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_homeAccesssoryWithRouteID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  MPHomeUserMonitor *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMHomeManager currentHome](self->_homeManager, "currentHome");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__46319;
  v19 = __Block_byref_object_dispose__46320;
  v20 = 0;
  if (!v5)
    goto LABEL_3;
  objc_msgSend(v5, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__MPHomeUserMonitor__homeAccesssoryWithRouteID___block_invoke;
  v12[3] = &unk_1E31623D0;
  v13 = v4;
  v14 = &v15;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  v8 = (void *)v16[5];
  if (!v8)
  {
LABEL_3:
    v9 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v22 = self;
      v23 = 2114;
      v24 = v4;
      _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_ERROR, "<MPHomeManagerObserver %p> homeAccesssoryWithRouteID: No homeAccessory with routeID=%{public}@", buf, 0x16u);
    }

    v8 = (void *)v16[5];
  }
  v10 = v8;
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (void)_loadAllowExplicitValue
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _BOOL4 allowExplicitCachedValue;
  int v12;
  MPHomeUserMonitor *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  -[HMSettings rootGroup](self->_sharedSettings, "rootGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _findSettingWithKeyPath(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (const __CFString *)objc_opt_class();
  if (_isValidSetting(v4, v5))
  {
    objc_msgSend(v4, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v8 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 134217984;
      v13 = self;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_ERROR, "<MPHomeUserMonitor %p> _loadAllowExplicitValueFromSetting: failed [invalid setting]", (uint8_t *)&v12, 0xCu);
    }

    v7 = 1;
  }
  if (self->_allowExplicitCachedValue != v7)
  {
    v9 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[HMUser userID](self->_user, "userID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      allowExplicitCachedValue = self->_allowExplicitCachedValue;
      v12 = 134218755;
      v13 = self;
      v14 = 2113;
      v15 = v10;
      v16 = 1024;
      v17 = allowExplicitCachedValue;
      v18 = 1024;
      v19 = v7;
      _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEFAULT, "<MPHomeUserMonitor %p> _loadAllowExplicitValueFromSetting: userID=%{private}@ cachedValue=%{BOOL}u newValue=%{BOOL}u", (uint8_t *)&v12, 0x22u);

    }
    self->_allowExplicitCachedValue = v7;
    -[MPHomeUserMonitor _notifyAllowExplicitUpdated](self, "_notifyAllowExplicitUpdated");
  }

}

- (void)_loadCurrentAccessoryPrivateListening
{
  void *v3;
  HMUser *user;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  void *v12;
  int v13;
  MPHomeUserMonitor *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  -[HMHomeManager currentAccessory](self->_homeManager, "currentAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  user = self->_user;
  -[HMHomeManager currentHome](self->_homeManager, "currentHome");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMUser userListeningHistoryUpdateControlForHome:](user, "userListeningHistoryUpdateControlForHome:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (v6)
    {
      objc_msgSend(v6, "accessories");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "containsObject:", v3) ^ 1;

      goto LABEL_10;
    }
    v9 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v13 = 134217984;
      v14 = self;
      v10 = "[<MPHomeUserMonitor %p> _loadCurrentAccessoryPrivateListening:] failed to fetch privateListeningSetting [use"
            "rListeningControl=nil]";
      goto LABEL_8;
    }
  }
  else
  {
    v9 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v13 = 134217984;
      v14 = self;
      v10 = "[<MPHomeUserMonitor %p> _loadCurrentAccessoryPrivateListening:] failed to fetch privateListeningSetting [cur"
            "rentAccessory=nil]";
LABEL_8:
      _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v13, 0xCu);
    }
  }

  v8 = 1;
LABEL_10:
  if (self->_currentAccessoryPrivateListeningCachedValue != v8)
  {
    self->_currentAccessoryPrivateListeningCachedValue = v8;
    v11 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[HMUser userID](self->_user, "userID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 134218499;
      v14 = self;
      v15 = 1024;
      v16 = v8;
      v17 = 2113;
      v18 = v12;
      _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEFAULT, "[<MPHomeUserMonitor %p> _loadCurrentAccessoryPrivateListening:] updating value privateListeningEnabled=%{BOOL}u for userID=%{private}@", (uint8_t *)&v13, 0x1Cu);

    }
    -[MPHomeUserMonitor _notifyPrivateListeningUpdated](self, "_notifyPrivateListeningUpdated");
  }

}

- (void)_updateUserListeningHistoryControlForAccessory:(id)a3 enable:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  HMUser *user;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  MPHomeUserMonitor *v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (v6)
  {
    user = self->_user;
    -[HMHomeManager currentHome](self->_homeManager, "currentHome");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMUser userListeningHistoryUpdateControlForHome:](user, "userListeningHistoryUpdateControlForHome:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    if (v4)
      objc_msgSend(v10, "removeAccessory:", v6);
    else
      objc_msgSend(v10, "addAccessory:", v6);

  }
  else
  {
    v11 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 134218240;
      v13 = self;
      v14 = 1024;
      v15 = v4;
      _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_ERROR, "[<MPHomeUserMonitor %p> _updateUserListeningHistoryControlForAccessory:] failed to set enable=%{BOOL}u [accessory=nil]", (uint8_t *)&v12, 0x12u);
    }

  }
}

- (void)_notifyPrivateListeningUpdated
{
  -[MPHomeUserMonitor _postNotificationWithName:](self, "_postNotificationWithName:", CFSTR("MPHomeUserMonitorPrivateListeningForCurrentDeviceSettingDidChangeNotification"));
}

- (void)_notifyAllowExplicitUpdated
{
  -[MPHomeUserMonitor _postNotificationWithName:](self, "_postNotificationWithName:", CFSTR("MPHomeUserObserverUserAllowExplicitSettingsDidChangeNotification"));
}

- (void)_postNotificationWithName:(id)a3
{
  id v4;
  NSObject *calloutQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  calloutQueue = self->_calloutQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__MPHomeUserMonitor__postNotificationWithName___block_invoke;
  v7[3] = &unk_1E31635F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(calloutQueue, v7);

}

- (void)settingsDidUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *accessQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  MPHomeUserMonitor *v10;
  uint8_t buf[4];
  MPHomeUserMonitor *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v12 = self;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEBUG, "<MPHomeUserMonitor %p> HMSettingsDelegate settingsDidUpdate", buf, 0xCu);
  }

  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__MPHomeUserMonitor_settingsDidUpdate___block_invoke;
  v8[3] = &unk_1E31635F8;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(accessQueue, v8);

}

- (void)user:(id)a3 didUpdateUserListeningHistoryUpdateControl:(id)a4 forHome:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *accessQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  MPHomeUserMonitor *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v17 = self;
    _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEBUG, "<MPHomeUserMonitor %p> HMUserDelegatePrivate user:didUpdateUserListeningHistoryUpdateControl:forHome:", buf, 0xCu);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__MPHomeUserMonitor_user_didUpdateUserListeningHistoryUpdateControl_forHome___block_invoke;
  block[3] = &unk_1E3163698;
  block[4] = self;
  v14 = v7;
  v15 = v8;
  v11 = v8;
  v12 = v7;
  dispatch_async(accessQueue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_sharedSettings, 0);
  objc_storeStrong((id *)&self->_privateHomeSettings, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __77__MPHomeUserMonitor_user_didUpdateUserListeningHistoryUpdateControl_forHome___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "currentAccessory");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(id *)(a1 + 40);
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  if (v2 == v3)
  {

  }
  else
  {
    v4 = v3;
    v5 = v2;
    v6 = objc_msgSend(v5, "isEqual:", v4);

    if (!v6)
      goto LABEL_11;
  }
  v7 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "currentHome");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v8)
    v9 = 1;
  else
    v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9 && v10)
    objc_msgSend(*(id *)(a1 + 32), "_loadCurrentAccessoryPrivateListening");
LABEL_11:

}

void __39__MPHomeUserMonitor_settingsDidUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "rootGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _findSettingWithKeyPath(v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "_loadAllowExplicitValue");

}

void __47__MPHomeUserMonitor__postNotificationWithName___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 134218242;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "[<MPHomeUserMonitor %p> posting notification: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

void __48__MPHomeUserMonitor__homeAccesssoryWithRouteID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v7 = a2;
  v8 = *(void **)(a1 + 32);
  v10 = v7;
  objc_msgSend(v7, "deviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "isEqualToString:", v9);

  if ((_DWORD)v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __65__MPHomeUserMonitor_privateListeningEnabledForGroupWithRouteIDs___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "hasAccessoryWithRouteID:", v11);
  v4 = v11;
  if (v3)
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v6 = (void *)MEMORY[0x1E0CB37E8];
    if (v5)
    {
      if (objc_msgSend(v5, "BOOLValue"))
        v7 = objc_msgSend(*(id *)(a1 + 32), "privateListeningEnabledForAccessoryWithRouteID:", v11);
      else
        v7 = 0;
      objc_msgSend(v6, "numberWithInt:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "privateListeningEnabledForAccessoryWithRouteID:", v11));
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v4 = v11;
  }

}

void __68__MPHomeUserMonitor_privateListeningEnabledForAccessoryWithRouteID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t, _BYTE *);
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(void **)(v2 + 24);
    objc_msgSend(*(id *)(v2 + 48), "currentHome");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "userListeningHistoryUpdateControlForHome:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      -[NSObject accessories](v5, "accessories");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __68__MPHomeUserMonitor_privateListeningEnabledForAccessoryWithRouteID___block_invoke_15;
      v20 = &unk_1E31623D0;
      v7 = *(id *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 48);
      v21 = v7;
      v22 = v8;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v17);

      v9 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(v10 + 24), "userID", v17, v18, v19, v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        *(_DWORD *)buf = 134218755;
        v24 = v10;
        v25 = 2113;
        v26 = v11;
        v27 = 2114;
        v28 = v12;
        v29 = 1024;
        v30 = v13;
        _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEFAULT, "<MPHomeUserMonitor %p> privateListeningEnabledForAccessoryWithRouteID userID=%{private}@ routeID=%{public}@ privateListening=%{BOOL}u", buf, 0x26u);

      }
      v14 = v21;
    }
    else
    {
      v14 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v16 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134217984;
        v24 = v16;
        _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_ERROR, "[<MPHomeUserMonitor %p> privateListeningEnabledForAccessoryWithRouteID:] failed to fetch privateListeningSetting [userListeningControl=nil]", buf, 0xCu);
      }
    }

  }
  else
  {
    v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134217984;
      v24 = v15;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "[<MPHomeUserMonitor %p> privateListeningEnabledForAccessoryWithRouteID:] failed to fetch privateListeningSetting [routeID=nil]", buf, 0xCu);
    }
  }

}

void __68__MPHomeUserMonitor_privateListeningEnabledForAccessoryWithRouteID___block_invoke_15(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(a2, "deviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "isEqualToString:", v7);

  if ((_DWORD)v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __45__MPHomeUserMonitor_hasAccessoryWithRouteID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(a2, "deviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "isEqualToString:", v7);

  if ((_DWORD)v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __79__MPHomeUserMonitor_setPrivateListeningEnabledForAccessoryWithRouteID_enabled___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(v3 + 24), "userID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(unsigned __int8 *)(a1 + 48);
    v8 = 134218755;
    v9 = v3;
    v10 = 2113;
    v11 = v4;
    v12 = 2114;
    v13 = v5;
    v14 = 1024;
    v15 = v6;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "<MPHomeUserMonitor %p> Setting privateListening for accessory. userID=%{private}@ routID=%{public}@ enabled=%{BOOL}u", (uint8_t *)&v8, 0x26u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_homeAccesssoryWithRouteID:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_updateUserListeningHistoryControlForAccessory:enable:", v7, *(unsigned __int8 *)(a1 + 48));

}

void __67__MPHomeUserMonitor_setPrivateListeningEnabledForCurrentAccessory___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(unsigned __int8 *)(v1 + 57) != *(unsigned __int8 *)(a1 + 40))
  {
    objc_msgSend(*(id *)(v1 + 48), "currentAccessory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 57) = *(_BYTE *)(a1 + 40);
      v4 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(v5 + 24), "userID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = *(unsigned __int8 *)(a1 + 40);
        v11 = 134218499;
        v12 = v5;
        v13 = 2113;
        v14 = v6;
        v15 = 1024;
        v16 = v7;
        _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "<MPHomeUserMonitor %p> Setting privateListening for currentAccessory. userID=%{private}@ enabled=%{BOOL}u", (uint8_t *)&v11, 0x1Cu);

      }
      objc_msgSend(*(id *)(a1 + 32), "_updateUserListeningHistoryControlForAccessory:enable:", v3, *(unsigned __int8 *)(a1 + 40));
    }
    else
    {
      v8 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(unsigned __int8 *)(a1 + 40);
        v11 = 134218240;
        v12 = v9;
        v13 = 1024;
        LODWORD(v14) = v10;
        _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_ERROR, "[<MPHomeUserMonitor %p> setPrivateListeningEnabledForCurrentAccessory:] failed to set enabled=%{BOOL}u [currentAccessory=nil]", (uint8_t *)&v11, 0x12u);
      }

    }
  }
}

uint64_t __65__MPHomeUserMonitor_isPrivateListeningEnabledForCurrentAccessory__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 57);
  return result;
}

void __47__MPHomeUserMonitor_setExplicitSettingEnabled___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  _QWORD v8[5];
  char v9;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 56) != v2)
  {
    *(_BYTE *)(v1 + 56) = v2;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "rootGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _findSettingWithKeyPath(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (const __CFString *)objc_opt_class();
    if (_isValidSetting(v5, v6))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __47__MPHomeUserMonitor_setExplicitSettingEnabled___block_invoke_2;
      v8[3] = &unk_1E3162380;
      v8[4] = *(_QWORD *)(a1 + 32);
      v9 = *(_BYTE *)(a1 + 40);
      objc_msgSend(v5, "updateValue:completionHandler:", v7, v8);

    }
  }
}

void __47__MPHomeUserMonitor_setExplicitSettingEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 134218754;
      v11 = v5;
      v12 = 2114;
      v13 = CFSTR("root.music.allowExplicitContent");
      v14 = 1024;
      v15 = v6;
      v16 = 2114;
      v17 = v3;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "<MPHomeUserMonitor %p> HMSetting \"%{public}@\" failed to update. shouldAllowExplicit=%{BOOOL}u error=%{public}@", buf, 0x26u);
    }

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__MPHomeUserMonitor_setExplicitSettingEnabled___block_invoke_12;
    block[3] = &unk_1E3163508;
    block[4] = v7;
    dispatch_async(v8, block);
  }

}

uint64_t __47__MPHomeUserMonitor_setExplicitSettingEnabled___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadAllowExplicitValue");
}

uint64_t __45__MPHomeUserMonitor_isExplicitSettingEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 56);
  return result;
}

uint64_t __46__MPHomeUserMonitor_initWithUser_homeManager___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;

  objc_storeStrong((id *)a1[4] + 6, a1[5]);
  objc_storeStrong((id *)a1[4] + 3, a1[6]);
  objc_msgSend(*((id *)a1[4] + 3), "setDelegate:");
  v2 = a1[4];
  v3 = (void *)*((_QWORD *)v2 + 3);
  objc_msgSend(*((id *)v2 + 6), "currentHome");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userSettingsForHome:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "settings");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = a1[4];
  v8 = (void *)v7[5];
  v7[5] = v6;

  objc_msgSend(*((id *)a1[4] + 5), "setDelegate:");
  v9 = a1[4];
  v10 = (void *)*((_QWORD *)v9 + 3);
  objc_msgSend(*((id *)v9 + 6), "currentHome");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userSettingsForHome:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "privateSettings");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = a1[4];
  v15 = (void *)v14[4];
  v14[4] = v13;

  objc_msgSend(*((id *)a1[4] + 4), "setDelegate:");
  return objc_msgSend(a1[4], "_update");
}

+ (MPHomeUserMonitor)userMonitorWithHomeIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (+[MPHomeMonitor isCurrentDeviceValidHomeAccessory](MPHomeMonitor, "isCurrentDeviceValidHomeAccessory"))
  {
    +[MPHomeManagerObserver sharedObserver](MPHomeManagerObserver, "sharedObserver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userMonitorWithHomeIdentifier:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (MPHomeUserMonitor *)v5;
}

+ (MPHomeUserMonitor)userMonitorWithHomeIdentifiers:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (+[MPHomeMonitor isCurrentDeviceValidHomeAccessory](MPHomeMonitor, "isCurrentDeviceValidHomeAccessory"))
  {
    +[MPHomeManagerObserver sharedObserver](MPHomeManagerObserver, "sharedObserver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userMonitorWithHomeIdentifiers:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (MPHomeUserMonitor *)v5;
}

+ (MPHomeUserMonitor)userMonitorWithUserIdentity:(id)a3 fromUserIdentityStore:(id)a4
{
  id v5;
  id v6;
  id v7;
  os_log_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  os_log_t v14;
  NSObject *v15;
  uint8_t v17[16];
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  if (+[MPHomeMonitor isCurrentDeviceValidHomeAccessory](MPHomeMonitor, "isCurrentDeviceValidHomeAccessory"))
  {
    if (v6)
    {
      v7 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v7;
    objc_msgSend(v7, "getPropertiesForUserIdentity:error:", v5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "homeUserIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPHomeUserMonitor userMonitorWithHomeIdentifiers:](MPHomeUserMonitor, "userMonitorWithHomeIdentifiers:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = v13;
        v8 = v14;
LABEL_15:

        goto LABEL_16;
      }
      v15 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_193B9B000, v15, OS_LOG_TYPE_ERROR, "[MPHomeUserMonitor userMonitorWithUserIdentity:fromUserIdentityStore:] userMonitor=nil", v17, 2u);
      }

      v14 = 0;
    }
    else
    {
      v14 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_ERROR, "[MPHomeUserMonitor userMonitorWithUserIdentity:fromUserIdentityStore:] identityProperties=nil", buf, 2u);
      }
    }
    v8 = 0;
    goto LABEL_15;
  }
  v8 = 0;
LABEL_16:

  return (MPHomeUserMonitor *)v8;
}

+ (MPHomeUserMonitor)monitorForCurrentUser
{
  void *v2;
  void *v3;

  if (+[MPHomeMonitor isCurrentDeviceValidHomeAccessory](MPHomeMonitor, "isCurrentDeviceValidHomeAccessory"))
  {
    +[MPHomeManagerObserver sharedObserver](MPHomeManagerObserver, "sharedObserver");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "monitorForCurrentUser");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return (MPHomeUserMonitor *)v3;
}

+ (BOOL)isExplicitSettingEnabledForCurrentUser
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[MPHomeUserMonitor monitorForCurrentUser](MPHomeUserMonitor, "monitorForCurrentUser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "isExplicitSettingEnabled");
  }
  else
  {
    v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = 1;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "MPHomeUserMonitor.isExplicitSettingEnabledForCurrentUser returning fallback value=%{BOOL}u [monitorForCurrentUser=nil]", (uint8_t *)v7, 8u);
    }

    v4 = 1;
  }

  return v4;
}

+ (void)setExplicitSettingEnabledForCurrentUser:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  +[MPHomeUserMonitor monitorForCurrentUser](MPHomeUserMonitor, "monitorForCurrentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setExplicitSettingEnabled:", v3);
  }
  else
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_ERROR, "[MPHomeUserMonitor setExplicitSettingEnabledForCurrentUser:] failed to set explicitSettingEnabled=%{BOOL}u [monitorForCurrentUser=nil]", (uint8_t *)v7, 8u);
    }

  }
}

+ (BOOL)isPrivateListeningEnabledForCurrentUserAndAccessory
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[MPHomeUserMonitor monitorForCurrentUser](MPHomeUserMonitor, "monitorForCurrentUser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "isPrivateListeningEnabledForCurrentAccessory");
  }
  else
  {
    v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = 1;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "MPHomeUserMonitor.isPrivateListeningEnabledForCurrentUserAndAccessory returning fallback value=%{BOOL}u [monitorForCurrentUser=nil]", (uint8_t *)v7, 8u);
    }

    v4 = 1;
  }

  return v4;
}

+ (void)setPrivateListeningEnabledForCurrentUserAndAccessory:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  +[MPHomeUserMonitor monitorForCurrentUser](MPHomeUserMonitor, "monitorForCurrentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setPrivateListeningEnabledForCurrentAccessory:", v3);
  }
  else
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_ERROR, "[MPHomeUserMonitor setPrivateListeningEnabledForCurrentUserAndAccessory:] failed to set privateListeningEnabled=%{BOOL}u [monitorForCurrentUser=nil]", (uint8_t *)v7, 8u);
    }

  }
}

@end
