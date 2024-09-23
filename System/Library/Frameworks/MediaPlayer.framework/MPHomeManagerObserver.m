@implementation MPHomeManagerObserver

- (MPHomeManagerObserver)init
{
  MPHomeManagerObserver *v2;
  MPHomeManagerObserver *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v6;
  OS_dispatch_queue *calloutQueue;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t homekitInitSignpostId;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  uint64_t v15;
  HMHomeManager *homeManager;
  uint64_t v17;
  NSMutableDictionary *userMonitorMap;
  NSObject *v19;
  _QWORD block[4];
  MPHomeManagerObserver *v22;
  objc_super v23;
  uint8_t buf[8];
  uint64_t v25;
  Class (*v26)(uint64_t);
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v23.receiver = self;
  v23.super_class = (Class)MPHomeManagerObserver;
  v2 = -[MPHomeManagerObserver init](&v23, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_setupDidComplete = 0;
    v4 = dispatch_queue_create("com.apple.mediaplayer.MPHomeManagerObserver.accessQueue", 0);
    accessQueue = v3->_accessQueue;
    v3->_accessQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_create("com.apple.mediaplayer.MPHomeManagerObserver.calloutQueue", MEMORY[0x1E0C80D50]);
    calloutQueue = v3->_calloutQueue;
    v3->_calloutQueue = (OS_dispatch_queue *)v6;

    v8 = os_log_create("com.apple.amp.mediaplayer", "Default");
    v3->_homekitInitSignpostId = os_signpost_id_make_with_pointer(v8, v3);

    v9 = os_log_create("com.apple.amp.mediaplayer", "Default");
    v10 = v9;
    homekitInitSignpostId = v3->_homekitInitSignpostId;
    if (homekitInitSignpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193B9B000, v10, OS_SIGNPOST_INTERVAL_BEGIN, homekitInitSignpostId, "homekitInitialization", (const char *)&unk_193F291C9, buf, 2u);
    }

    v29 = 0;
    v30 = &v29;
    v31 = 0x2050000000;
    v12 = (void *)getHMHomeManagerClass_softClass;
    v32 = getHMHomeManagerClass_softClass;
    v13 = MEMORY[0x1E0C809B0];
    if (!getHMHomeManagerClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __getHMHomeManagerClass_block_invoke;
      v27 = &unk_1E31639A0;
      v28 = &v29;
      __getHMHomeManagerClass_block_invoke((uint64_t)buf);
      v12 = (void *)v30[3];
    }
    v14 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v29, 8);
    v15 = objc_msgSend([v14 alloc], "initWithOptions:", 24);
    homeManager = v3->_homeManager;
    v3->_homeManager = (HMHomeManager *)v15;

    -[HMHomeManager setDelegate:](v3->_homeManager, "setDelegate:", v3);
    v3->_soundCheckCachedValue = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    userMonitorMap = v3->_userMonitorMap;
    v3->_userMonitorMap = (NSMutableDictionary *)v17;

    v19 = v3->_accessQueue;
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __29__MPHomeManagerObserver_init__block_invoke;
    block[3] = &unk_1E3163508;
    v22 = v3;
    dispatch_async(v19, block);

  }
  return v3;
}

- (BOOL)setupDidComplete
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
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__MPHomeManagerObserver_setupDidComplete__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasCurrentUser
{
  void *v2;
  BOOL v3;

  -[MPHomeManagerObserver currentUser](self, "currentUser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)hasCurrentHome
{
  void *v2;
  BOOL v3;

  -[MPHomeManagerObserver currentHome](self, "currentHome");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)hasCurrentAccessory
{
  void *v2;
  BOOL v3;

  -[MPHomeManagerObserver currentAccessory](self, "currentAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (HMUser)currentUser
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  int v9;
  MPHomeManagerObserver *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[HMHomeManager currentHome](self->_homeManager, "currentHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 134217984;
      v10 = self;
      v7 = "<MPHomeManagerObserver %p> failed to fetch currentUser [HMHomeManager.currentHome=nil]";
      goto LABEL_7;
    }
LABEL_8:

    v5 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v3, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 134217984;
      v10 = self;
      v7 = "<MPHomeManagerObserver %p> failed to fetch currentUser [HMHomeManager.currentHome.currentUser=nil]";
LABEL_7:
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v9, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

  return (HMUser *)v5;
}

- (HMHome)currentHome
{
  return (HMHome *)-[HMHomeManager currentHome](self->_homeManager, "currentHome");
}

- (HMAccessory)currentAccessory
{
  return (HMAccessory *)-[HMHomeManager currentAccessory](self->_homeManager, "currentAccessory");
}

- (BOOL)isSoundCheckEnabled
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
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__MPHomeManagerObserver_isSoundCheckEnabled__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setSoundCheckEnabled:(BOOL)a3
{
  NSObject *accessQueue;
  _QWORD v4[5];
  BOOL v5;

  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__MPHomeManagerObserver_setSoundCheckEnabled___block_invoke;
  v4[3] = &unk_1E3163468;
  v4[4] = self;
  v5 = a3;
  dispatch_async(accessQueue, v4);
}

- (MPHomeUserMonitor)monitorForCurrentUser
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9635;
  v10 = __Block_byref_object_dispose__9636;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__MPHomeManagerObserver_monitorForCurrentUser__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MPHomeUserMonitor *)v3;
}

- (id)userMonitorWithHomeIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPHomeManagerObserver userMonitorWithHomeIdentifiers:](self, "userMonitorWithHomeIdentifiers:", v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)userMonitorWithHomeIdentifiers:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  NSObject *v7;
  _QWORD block[5];
  id v10;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__9635;
    v15 = __Block_byref_object_dispose__9636;
    v16 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__MPHomeManagerObserver_userMonitorWithHomeIdentifiers___block_invoke;
    block[3] = &unk_1E31635A8;
    p_buf = &buf;
    block[4] = self;
    v10 = v4;
    dispatch_sync(accessQueue, block);
    v6 = *(id *)(*((_QWORD *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "<MPHomeManagerObserver %p> userMonitorWithHomeIdentifiers: returning nil [identifiers.count=0]", (uint8_t *)&buf, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

- (id)homeAccesssoryWithRouteID:(id)a3
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
  MPHomeManagerObserver *v22;
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
  v18 = __Block_byref_object_copy__9635;
  v19 = __Block_byref_object_dispose__9636;
  v20 = 0;
  if (!v5)
    goto LABEL_3;
  objc_msgSend(v5, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__MPHomeManagerObserver_homeAccesssoryWithRouteID___block_invoke;
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

- (id)_userMonitorWithHomeIdentifiers:(id)a3
{
  id v4;
  NSMutableDictionary *userMonitorMap;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  userMonitorMap = self->_userMonitorMap;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__MPHomeManagerObserver__userMonitorWithHomeIdentifiers___block_invoke;
  v11[3] = &unk_1E3154A00;
  v12 = v4;
  v6 = v4;
  -[NSMutableDictionary msv_firstWhere:](userMonitorMap, "msv_firstWhere:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "second");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_updateSoundCheck
{
  HMHome *currentHome;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  _BOOL4 soundCheckCachedValue;
  int v11;
  MPHomeManagerObserver *v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  currentHome = self->_currentHome;
  if (currentHome)
  {
    v4 = -[HMHome soundCheckEnabled](currentHome, "soundCheckEnabled");
  }
  else
  {
    v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v11 = 134218240;
      v12 = self;
      v13 = 1024;
      v14 = 0;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "<MPHomeManagerObserver %p> _updateSoundCheck: _currentHome=nil using fallback value=%{BOOL}u", (uint8_t *)&v11, 0x12u);
    }

    v4 = 0;
  }
  +[MPPlaybackUserDefaults standardUserDefaults](MPPlaybackUserDefaults, "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "soundCheckEnabled");

  if ((_DWORD)v4 != v7)
  {
    +[MPPlaybackUserDefaults standardUserDefaults](MPPlaybackUserDefaults, "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSoundCheckEnabled:", v4);

  }
  if (self->_soundCheckCachedValue != (_DWORD)v4)
  {
    v9 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      soundCheckCachedValue = self->_soundCheckCachedValue;
      v11 = 134218496;
      v12 = self;
      v13 = 1024;
      v14 = soundCheckCachedValue;
      v15 = 1024;
      v16 = v4;
      _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEFAULT, "<MPHomeManagerObserver %p> _updateSoundCheck: cachedValue=%{BOOL}u currentValue=%{BOOL}u", (uint8_t *)&v11, 0x18u);
    }

    self->_soundCheckCachedValue = v4;
    -[MPHomeManagerObserver _soundCheckDidChange](self, "_soundCheckDidChange");
  }
}

- (void)_update
{
  HMHome *v3;
  HMHome **p_currentHome;
  HMHome *v5;
  HMHome *v6;
  char v7;
  NSObject *v8;
  HMHome *currentHome;
  HMUser *v10;
  HMUser *v11;
  HMUser *v12;
  char v13;
  NSObject *v14;
  HMUser *currentUser;
  HMHome *v16;
  void *v17;
  void *v18;
  void *v19;
  os_log_t v20;
  uint64_t v21;
  void *v22;
  HMHome *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  uint8_t buf[4];
  MPHomeManagerObserver *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  HMUser *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  -[HMHomeManager currentHome](self->_homeManager, "currentHome");
  v3 = (HMHome *)objc_claimAutoreleasedReturnValue();
  p_currentHome = &self->_currentHome;
  v5 = self->_currentHome;
  if (v5 == v3)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[HMHome isEqual:](v5, "isEqual:", v3);

    if ((v7 & 1) == 0)
    {
      v8 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        currentHome = self->_currentHome;
        *(_DWORD *)buf = 134218496;
        v27 = self;
        v28 = 2048;
        v29 = currentHome;
        v30 = 2048;
        v31 = (HMUser *)v3;
        _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "<MPHomeManagerObserver %p> currentHomeDidChange from %p to %p", buf, 0x20u);
      }

      -[HMHome setDelegate:](self->_currentHome, "setDelegate:", 0);
      objc_storeStrong((id *)&self->_currentHome, v3);
      -[HMHome setDelegate:](self->_currentHome, "setDelegate:", self);
      -[MPHomeManagerObserver _currentHomeDidChange](self, "_currentHomeDidChange");
    }
  }
  -[HMHome currentUser](self->_currentHome, "currentUser");
  v10 = (HMUser *)objc_claimAutoreleasedReturnValue();
  v11 = self->_currentUser;
  if (v11 == v10)
  {

  }
  else
  {
    v12 = v11;
    v13 = -[HMUser isEqual:](v11, "isEqual:", v10);

    if ((v13 & 1) == 0)
    {
      v14 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        currentUser = self->_currentUser;
        *(_DWORD *)buf = 134218496;
        v27 = self;
        v28 = 2048;
        v29 = currentUser;
        v30 = 2048;
        v31 = v10;
        _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_DEFAULT, "<MPHomeManagerObserver %p> currentUserDidChange from %p to %p", buf, 0x20u);
      }

      objc_storeStrong((id *)&self->_currentUser, v10);
      -[MPHomeManagerObserver _currentUserDidChange](self, "_currentUserDidChange");
    }
  }
  v16 = *p_currentHome;
  if (*p_currentHome)
  {
    self->_setupDidComplete = 1;
    v17 = (void *)MEMORY[0x1E0C99E20];
    -[HMHome users](v16, "users");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "addObject:", self->_currentUser);
    if (objc_msgSend(v19, "count"))
    {
      if (-[NSSet isEqualToSet:](self->_homeUsers, "isEqualToSet:", v19))
      {
LABEL_20:
        -[MPHomeManagerObserver _updateSoundCheck](self, "_updateSoundCheck");

        goto LABEL_21;
      }
      v20 = (os_log_t)-[NSSet mutableCopy](self->_homeUsers, "mutableCopy");
      -[NSObject minusSet:](v20, "minusSet:", v19);
      v21 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __32__MPHomeManagerObserver__update__block_invoke;
      v25[3] = &unk_1E3154A28;
      v25[4] = self;
      -[NSObject enumerateObjectsUsingBlock:](v20, "enumerateObjectsUsingBlock:", v25);
      v22 = (void *)objc_msgSend(v19, "mutableCopy");
      objc_msgSend(v22, "minusSet:", self->_homeUsers);
      v24[0] = v21;
      v24[1] = 3221225472;
      v24[2] = __32__MPHomeManagerObserver__update__block_invoke_12;
      v24[3] = &unk_1E3154A28;
      v24[4] = self;
      objc_msgSend(v22, "enumerateObjectsUsingBlock:", v24);
      objc_storeStrong((id *)&self->_homeUsers, v19);
      -[MPHomeManagerObserver _usersDidChange](self, "_usersDidChange");

    }
    else
    {
      v20 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v23 = self->_currentHome;
        *(_DWORD *)buf = 134218240;
        v27 = self;
        v28 = 2048;
        v29 = v23;
        _os_log_impl(&dword_193B9B000, v20, OS_LOG_TYPE_ERROR, "<MPHomeManagerObserver %p> currentUsers.count=0 in currentHome=%p", buf, 0x16u);
      }
    }

    goto LABEL_20;
  }
LABEL_21:

}

- (void)_updateAsyncOnQueue
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MPHomeManagerObserver__updateAsyncOnQueue__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)_currentHomeDidChange
{
  id WeakRetained;
  NSObject *calloutQueue;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__MPHomeManagerObserver__currentHomeDidChange__block_invoke;
    block[3] = &unk_1E3163508;
    block[4] = self;
    dispatch_async(calloutQueue, block);
  }
}

- (void)_currentUserDidChange
{
  id WeakRetained;
  NSObject *calloutQueue;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__MPHomeManagerObserver__currentUserDidChange__block_invoke;
    block[3] = &unk_1E3163508;
    block[4] = self;
    dispatch_async(calloutQueue, block);
  }
}

- (void)_usersDidChange
{
  id WeakRetained;
  NSObject *calloutQueue;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__MPHomeManagerObserver__usersDidChange__block_invoke;
    block[3] = &unk_1E3163508;
    block[4] = self;
    dispatch_async(calloutQueue, block);
  }
}

- (void)_soundCheckDidChange
{
  id WeakRetained;
  BOOL soundCheckCachedValue;
  NSObject *calloutQueue;
  _QWORD v6[5];
  BOOL v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    soundCheckCachedValue = self->_soundCheckCachedValue;
    calloutQueue = self->_calloutQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__MPHomeManagerObserver__soundCheckDidChange__block_invoke;
    v6[3] = &unk_1E3163468;
    v6[4] = self;
    v7 = soundCheckCachedValue;
    dispatch_async(calloutQueue, v6);
  }
}

- (void)home:(id)a3 didAddUser:(id)a4
{
  NSObject *v5;
  int v6;
  MPHomeManagerObserver *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134217984;
    v7 = self;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEBUG, "<MPHomeManagerObserver %p> HMHomeDelegate home:didAddUser:", (uint8_t *)&v6, 0xCu);
  }

  -[MPHomeManagerObserver _updateAsyncOnQueue](self, "_updateAsyncOnQueue");
}

- (void)home:(id)a3 didRemoveUser:(id)a4
{
  NSObject *v5;
  int v6;
  MPHomeManagerObserver *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134217984;
    v7 = self;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEBUG, "<MPHomeManagerObserver %p> HMHomeDelegate home:didRemoveUser:", (uint8_t *)&v6, 0xCu);
  }

  -[MPHomeManagerObserver _updateAsyncOnQueue](self, "_updateAsyncOnQueue");
}

- (void)homeDidUpdateSoundCheck:(id)a3
{
  NSObject *v4;
  NSObject *accessQueue;
  _QWORD block[5];
  uint8_t buf[4];
  MPHomeManagerObserver *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v8 = self;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEBUG, "<MPHomeManagerObserver %p> HMHomeDelegatePrivate homeDidUpdateSoundCheck", buf, 0xCu);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MPHomeManagerObserver_homeDidUpdateSoundCheck___block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)homeDidUpdateAccessControlForCurrentUser:(id)a3
{
  NSObject *v4;
  int v5;
  MPHomeManagerObserver *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = 134217984;
    v6 = self;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEBUG, "<MPHomeManagerObserver %p> HMHomeDelegatePrivate homeDidUpdateAccessControlForCurrentUser", (uint8_t *)&v5, 0xCu);
  }

  -[MPHomeManagerObserver _updateAsyncOnQueue](self, "_updateAsyncOnQueue");
}

- (void)homeManagerDidUpdateCurrentHome:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  MPHomeManagerObserver *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134218242;
    v7 = self;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEBUG, "<MPHomeManagerObserver %p> HMHomeManagerDelegatePrivate homeManager:%{public}@ homeManagerDidUpdateCurrentHome:", (uint8_t *)&v6, 0x16u);
  }

  -[MPHomeManagerObserver _updateAsyncOnQueue](self, "_updateAsyncOnQueue");
}

- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  int v8;
  MPHomeManagerObserver *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 134218498;
    v9 = self;
    v10 = 2114;
    v11 = v6;
    v12 = 2048;
    v13 = a4;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEBUG, "<MPHomeManagerObserver %p> HMHomeManagerDelegatePrivate homeManager:%{public}@ didUpdateStatus:%lu", (uint8_t *)&v8, 0x20u);
  }

  -[MPHomeManagerObserver _updateAsyncOnQueue](self, "_updateAsyncOnQueue");
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t homekitInitSignpostId;
  int v9;
  MPHomeManagerObserver *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v9 = 134218242;
    v10 = self;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEBUG, "<MPHomeManagerObserver %p> HMHomeManagerDelegatePrivate homeManagerDidUpdateHomes:%{public}@", (uint8_t *)&v9, 0x16u);
  }

  v6 = os_log_create("com.apple.amp.mediaplayer", "Default");
  v7 = v6;
  homekitInitSignpostId = self->_homekitInitSignpostId;
  if (homekitInitSignpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v7, OS_SIGNPOST_INTERVAL_END, homekitInitSignpostId, "homekitInitialization", (const char *)&unk_193F291C9, (uint8_t *)&v9, 2u);
  }

  -[MPHomeManagerObserver _updateAsyncOnQueue](self, "_updateAsyncOnQueue");
}

- (void)homeManagerDidUpdatePrimaryHome:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  MPHomeManagerObserver *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134218242;
    v7 = self;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEBUG, "<MPHomeManagerObserver %p> HMHomeManagerDelegatePrivate homeManagerDidUpdatePrimaryHome:%{public}@", (uint8_t *)&v6, 0x16u);
  }

  -[MPHomeManagerObserver _updateAsyncOnQueue](self, "_updateAsyncOnQueue");
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  MPHomeManagerObserver *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 134218498;
    v10 = self;
    v11 = 2114;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEBUG, "<MPHomeManagerObserver %p> HMHomeManagerDelegatePrivate homeManager:%{public}@ didAddHome:%{public}@", (uint8_t *)&v9, 0x20u);
  }

  -[MPHomeManagerObserver _updateAsyncOnQueue](self, "_updateAsyncOnQueue");
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  MPHomeManagerObserver *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 134218498;
    v10 = self;
    v11 = 2114;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEBUG, "<MPHomeManagerObserver %p> HMHomeManagerDelegatePrivate homeManager:%{public}@ didRemoveHome:%{public}@", (uint8_t *)&v9, 0x20u);
  }

  -[MPHomeManagerObserver _updateAsyncOnQueue](self, "_updateAsyncOnQueue");
}

- (void)homeManagerDidRemoveCurrentAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  MPHomeManagerObserver *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134218242;
    v7 = self;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEBUG, "<MPHomeManagerObserver %p> HMHomeManagerDelegatePrivate homeManagerDidRemoveCurrentAccessory:%{public}@", (uint8_t *)&v6, 0x16u);
  }

  -[MPHomeManagerObserver _updateAsyncOnQueue](self, "_updateAsyncOnQueue");
}

- (MPHomeManagerObserverDelegate)delegate
{
  return (MPHomeManagerObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userMonitorMap, 0);
  objc_storeStrong((id *)&self->_homeUsers, 0);
  objc_storeStrong((id *)&self->_currentUser, 0);
  objc_storeStrong((id *)&self->_currentHome, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

uint64_t __49__MPHomeManagerObserver_homeDidUpdateSoundCheck___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSoundCheck");
}

void __45__MPHomeManagerObserver__soundCheckDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(WeakRetained, "soundCheckSettingDidUpdate:", *(unsigned __int8 *)(a1 + 40));

}

void __40__MPHomeManagerObserver__usersDidChange__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "<MPHomeManagerObserver %p> homeUsersDidChange:", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(WeakRetained, "homeUsersDidChange");

}

void __46__MPHomeManagerObserver__currentUserDidChange__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "<MPHomeManagerObserver %p> currentUserDidChange:", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(WeakRetained, "currentUserDidChange");

}

void __46__MPHomeManagerObserver__currentHomeDidChange__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "<MPHomeManagerObserver %p> currentHomeDidChange:", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(WeakRetained, "currentHomeDidChange");

}

uint64_t __44__MPHomeManagerObserver__updateAsyncOnQueue__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

void __32__MPHomeManagerObserver__update__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "userID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218499;
    v11 = v5;
    v12 = 2113;
    v13 = v6;
    v14 = 2113;
    v15 = v7;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "<MPHomeManagerObserver %p> Removing MPHomeUserMonitor userID=%{private}@ uniqueIdentifier=%{private}@", (uint8_t *)&v10, 0x20u);

  }
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(v3, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v9);

}

void __32__MPHomeManagerObserver__update__block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  MPHomeUserMonitor *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  MPHomeUserMonitor *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = -[MPHomeUserMonitor initWithUser:homeManager:]([MPHomeUserMonitor alloc], "initWithUser:homeManager:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "userID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218755;
    v12 = v6;
    v13 = 2048;
    v14 = v4;
    v15 = 2113;
    v16 = v7;
    v17 = 2113;
    v18 = v8;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "<MPHomeManagerObserver %p> Adding <MPHomeUserMonitor %p> userID=%{private}@ uniqueIdentifier=%{private}@", (uint8_t *)&v11, 0x2Au);

  }
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(v3, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, v10);

}

uint64_t __57__MPHomeManagerObserver__userMonitorWithHomeIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

void __51__MPHomeManagerObserver_homeAccesssoryWithRouteID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
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

void __56__MPHomeManagerObserver_userMonitorWithHomeIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_userMonitorWithHomeIdentifiers:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v5 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 134218243;
      v15 = v6;
      v16 = 2113;
      v17 = v7;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "<MPHomeManagerObserver %p> userMonitorWithHomeIdentifiers: forcing update [no monitor found] homeIdentifiers=%{private}@", (uint8_t *)&v14, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_update");
    objc_msgSend(*(id *)(a1 + 32), "_userMonitorWithHomeIdentifiers:", *(_QWORD *)(a1 + 40));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v11 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v14 = 134218242;
        v15 = v12;
        v16 = 2112;
        v17 = v13;
        _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_ERROR, "<MPHomeManagerObserver %p> userMonitorWithHomeIdentifiers: homeUser found after forced update. monitor=%@", (uint8_t *)&v14, 0x16u);
      }

    }
  }
}

void __46__MPHomeManagerObserver_monitorForCurrentUser__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "currentUser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(_QWORD **)(a1 + 32);
    v4 = (void *)v3[7];
    objc_msgSend(v3, "currentUser");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  else
  {
    v9 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v13 = v10;
      _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_ERROR, "<MPHomeManagerObserver %p> monitorForCurrentUser: currentUser=nil", buf, 0xCu);
    }

  }
}

uint64_t __46__MPHomeManagerObserver_setSoundCheckEnabled___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 64) != v2)
  {
    *(_BYTE *)(v1 + 64) = v2;
    v3 = *(_QWORD *)(result + 32);
    v4 = *(void **)(v3 + 32);
    LOBYTE(v5) = *(_BYTE *)(result + 40);
    return objc_msgSend(v4, "updateSoundCheckEnabled:completion:", MEMORY[0x1E0C809B0], 3221225472, __46__MPHomeManagerObserver_setSoundCheckEnabled___block_invoke_2, &unk_1E3162380, v3, v5);
  }
  return result;
}

void __46__MPHomeManagerObserver_setSoundCheckEnabled___block_invoke_2(uint64_t a1, void *a2)
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
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "Preferences");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      v11 = v5;
      v12 = 1024;
      v13 = v6;
      v14 = 2114;
      v15 = v3;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "<MPHomeManagerObserver %p> updateSoundCheckEnabled. shouldEnable=%{BOOL}u error=%{public}@", buf, 0x1Cu);
    }

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__MPHomeManagerObserver_setSoundCheckEnabled___block_invoke_4;
    block[3] = &unk_1E3163508;
    block[4] = v7;
    dispatch_async(v8, block);
  }

}

uint64_t __46__MPHomeManagerObserver_setSoundCheckEnabled___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSoundCheck");
}

uint64_t __44__MPHomeManagerObserver_isSoundCheckEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 64);
  return result;
}

uint64_t __41__MPHomeManagerObserver_setupDidComplete__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 65);
  return result;
}

uint64_t __29__MPHomeManagerObserver_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

+ (id)sharedObserver
{
  if (sharedObserver_onceToken != -1)
    dispatch_once(&sharedObserver_onceToken, &__block_literal_global_9659);
  return (id)sharedObserver___sharedObserver;
}

void __39__MPHomeManagerObserver_sharedObserver__block_invoke()
{
  MPHomeManagerObserver *v0;
  void *v1;

  v0 = objc_alloc_init(MPHomeManagerObserver);
  v1 = (void *)sharedObserver___sharedObserver;
  sharedObserver___sharedObserver = (uint64_t)v0;

}

@end
