@implementation _GCHapticClientProxy

+ (_GCHapticClientProxy)clientProxyWithConnection:(id)a3 server:(id)a4 clientID:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithConnection:server:clientID:", v8, v9, a5);

  return (_GCHapticClientProxy *)v10;
}

- (id)_initWithConnection:(id)a3 server:(id)a4 clientID:(unint64_t)a5
{
  id v9;
  id v10;
  _GCHapticClientProxy *v11;
  _GCHapticClientProxy *v12;
  uint64_t v13;
  NSMutableDictionary *hapticPlayers;
  uint64_t v15;
  NSArray *actuators;
  uint64_t v17;
  GCSSettingsStoreService *settingsStore;
  void *v19;
  void *v20;
  uint64_t v21;
  NSArray *invalidationHandlers;
  _GCHapticClientProxy *v23;
  void *v24;
  uint64_t v25;
  id connectionInvalidationRegistration;
  uint64_t v27;
  id connectionInterruptedRegistration;
  NSObject *v30;
  _QWORD v31[4];
  _GCHapticClientProxy *v32;
  objc_super v33;
  uint8_t buf[4];
  _GCHapticClientProxy *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v33.receiver = self;
  v33.super_class = (Class)_GCHapticClientProxy;
  v11 = -[_GCHapticClientProxy init](&v33, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_applicationState = 0;
    objc_storeStrong((id *)&v11->_server, a4);
    objc_storeStrong((id *)&v12->_connection, a3);
    v12->_clientID = a5;
    +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    hapticPlayers = v12->_hapticPlayers;
    v12->_hapticPlayers = (NSMutableDictionary *)v13;

    +[NSMutableArray array](&off_254DEBB20, "array");
    v15 = objc_claimAutoreleasedReturnValue();
    actuators = v12->_actuators;
    v12->_actuators = (NSArray *)v15;

    *(_WORD *)&v12->_shouldSquareContinuousIntensity = 257;
    GCLookupService();
    v17 = objc_claimAutoreleasedReturnValue();
    settingsStore = v12->_settingsStore;
    v12->_settingsStore = (GCSSettingsStoreService *)v17;

    -[GCSSettingsStoreService profiles](v12->_settingsStore, "profiles");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:forKeyPath:options:context:", v12, CFSTR("values"), 1, kGCSettingsContext);

    -[GCSSettingsStoreService games](v12->_settingsStore, "games");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:forKeyPath:options:context:", v12, CFSTR("values"), 1, kGCSettingsContext);

    v21 = objc_opt_new();
    invalidationHandlers = v12->_invalidationHandlers;
    v12->_invalidationHandlers = (NSArray *)v21;

    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __60___GCHapticClientProxy__initWithConnection_server_clientID___block_invoke;
    v31[3] = &unk_24D2B4800;
    v23 = v12;
    v32 = v23;
    v24 = (void *)MEMORY[0x2199DEBB0](v31);
    -[_GCIPCIncomingConnection addInvalidationHandler:](v12->_connection, "addInvalidationHandler:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    connectionInvalidationRegistration = v23->_connectionInvalidationRegistration;
    v23->_connectionInvalidationRegistration = (id)v25;

    -[_GCIPCIncomingConnection addInterruptionHandler:](v12->_connection, "addInterruptionHandler:", v24);
    v27 = objc_claimAutoreleasedReturnValue();
    connectionInterruptedRegistration = v23->_connectionInterruptedRegistration;
    v23->_connectionInterruptedRegistration = (id)v27;

    v23->_initializationTime = (double)mach_absolute_time() * 0.0000000416666667;
    if (gc_isInternalBuild())
    {
      getGCHapticsLogger();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v23;
        _os_log_impl(&dword_215181000, v30, OS_LOG_TYPE_DEFAULT, "Haptic client proxy created: %@", buf, 0xCu);
      }

    }
  }

  return v12;
}

- (_GCHapticClientProxy)init
{
  -[_GCHapticClientProxy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
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
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  unsigned __int8 v17;
  void *v18;
  objc_super v19;

  -[GCSSettingsStoreService profiles](self->_settingsStore, "profiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[GCSSettingsStoreService profiles](self->_settingsStore, "profiles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("values"), kGCSettingsContext);

  }
  -[GCSSettingsStoreService games](self->_settingsStore, "games");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[GCSSettingsStoreService games](self->_settingsStore, "games");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, CFSTR("values"), kGCSettingsContext);

  }
  +[GCAnalytics instance](GCAnalytics, "instance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCHapticClientProxy bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[_GCHapticClientProxy controllerProductCategory](self, "controllerProductCategory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  v13 = -[_GCHapticClientProxy totalPlayers](self, "totalPlayers");
  -[_GCHapticClientProxy totalLifetimeInSeconds](self, "totalLifetimeInSeconds");
  v15 = v14;
  -[_GCHapticClientProxy activeLifetimeInSeconds](self, "activeLifetimeInSeconds");
  objc_msgSend(v8, "sendHapticsClientDestroyedEventForBundleID:productCategory:totalPlayers:sessionTotalDuration:sessionActiveDuration:terminationReason:", v10, v12, v13, (int)v15, (int)v16, CFSTR("Dealloc"));

  v17 = atomic_load((unsigned __int8 *)&self->_invalid);
  if ((v17 & 1) == 0)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCHapticClientProxy.mm"), 134, CFSTR("%@ is being deallocated, but is still valid."), self);

  }
  -[_GCHapticClientProxy invalidate](self, "invalidate");
  -[_GCHapticClientProxy releaseClientResources](self, "releaseClientResources");
  v19.receiver = self;
  v19.super_class = (Class)_GCHapticClientProxy;
  -[_GCHapticClientProxy dealloc](&v19, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)kGCSettingsContext == a6)
  {
    -[_GCHapticClientProxy refreshUserSettingForMuteHaptics](self, "refreshUserSettingForMuteHaptics");
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_GCHapticClientProxy;
    -[_GCHapticClientProxy observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)invalidateDueToControllerDisconnect
{
  void *v3;
  NSObject *v4;
  int v5;
  _GCHapticClientProxy *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 138412290;
      v6 = self;
      _os_log_impl(&dword_215181000, v4, OS_LOG_TYPE_INFO, "%@ invalidateDueToControllerDisconnect", (uint8_t *)&v5, 0xCu);
    }

  }
  -[_GCIPCIncomingConnection remoteProxy](self->_connection, "remoteProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientDisconnectingForReason:error:", 3, 0);

  -[_GCHapticClientProxy invalidate](self, "invalidate");
}

- (void)invalidate
{
  BOOL *p_invalid;
  unsigned __int8 v3;
  _GCHapticClientProxy *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id connectionInterruptedRegistration;
  id connectionInvalidationRegistration;
  _GCIPCIncomingConnection *connection;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  _GCHapticClientProxy *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  p_invalid = &self->_invalid;
  v3 = atomic_load((unsigned __int8 *)&self->_invalid);
  if ((v3 & 1) == 0)
  {
    v4 = self;
    objc_sync_enter(v4);
    atomic_store(1u, (unsigned __int8 *)p_invalid);
    -[_GCHapticClientProxy invalidationHandlers](v4, "invalidationHandlers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v4);

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v5, "reverseObjectEnumerator", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9++) + 16))();
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v7);
    }

    if (gc_isInternalBuild())
    {
      getGCLogger();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v4;
        _os_log_impl(&dword_215181000, v13, OS_LOG_TYPE_INFO, "Haptic client proxy invalidated: %@", buf, 0xCu);
      }

    }
    connectionInterruptedRegistration = v4->_connectionInterruptedRegistration;
    v4->_connectionInterruptedRegistration = 0;

    connectionInvalidationRegistration = v4->_connectionInvalidationRegistration;
    v4->_connectionInvalidationRegistration = 0;

    -[_GCIPCIncomingConnection invalidate](v4->_connection, "invalidate");
    connection = v4->_connection;
    v4->_connection = 0;

  }
}

- (void)setBundleIdentifier:(id)a3
{
  id v5;
  NSString **p_bundleIdentifier;
  char v7;
  NSObject *v8;
  _BOOL4 neverMute;
  int v10;
  _GCHapticClientProxy *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  p_bundleIdentifier = &self->_bundleIdentifier;
  if (!self->_bundleIdentifier)
  {
    objc_storeStrong((id *)&self->_bundleIdentifier, a3);
    if ((-[NSString isEqual:](*p_bundleIdentifier, "isEqual:", CFSTR("com.apple.TVSettings")) & 1) != 0)
      v7 = 1;
    else
      v7 = -[NSString isEqual:](*p_bundleIdentifier, "isEqual:", CFSTR("com.apple.Preferences"));
    self->_neverMute = v7;
    if (gc_isInternalBuild())
    {
      getGCHapticsLogger();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        neverMute = self->_neverMute;
        v10 = 138412546;
        v11 = self;
        v12 = 1024;
        v13 = neverMute;
        _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_INFO, "%@ neverMute=%d", (uint8_t *)&v10, 0x12u);
      }

    }
    -[_GCHapticClientProxy refreshUserSettingForMuteHaptics](self, "refreshUserSettingForMuteHaptics");
  }

}

- (void)refreshUserSettingForMuteHaptics
{
  void *v3;
  void *v4;
  double v5;
  float v6;
  double v7;
  double v8;
  NSObject *v9;
  NSString *bundleIdentifier;
  int v11;
  _GCHapticClientProxy *v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[_GCHapticClientProxy setMute:forReason:](self, "setMute:forReason:", 0, 4);
  -[GCSSettingsStoreService profileForPersistentControllerIdentifier:appBundleIdentifier:](self->_settingsStore, "profileForPersistentControllerIdentifier:appBundleIdentifier:", self->_persistentControllerIdentifier, self->_bundleIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "hapticStrength");
    v6 = v5;
    v7 = v6;
    if (gc_isInternalBuild())
    {
      getGCHapticsLogger();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        bundleIdentifier = self->_bundleIdentifier;
        v11 = 138412802;
        v12 = self;
        v13 = 1024;
        v14 = v7 < 0.01;
        v15 = 2112;
        v16 = bundleIdentifier;
        _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_DEFAULT, "%@ setMute=%d for %@", (uint8_t *)&v11, 0x1Cu);
      }

    }
    -[_GCHapticClientProxy setMute:forReason:](self, "setMute:forReason:", v7 < 0.01, 4);
    if (v7 >= 0.01)
    {
      *(float *)&v8 = v6;
      -[_GCHapticClientProxy setHapticStrength:](self, "setHapticStrength:", v8);
    }
  }

}

- (BOOL)running
{
  return self->_running;
}

- (BOOL)stopping
{
  return self->_stopping;
}

- (void)sharedMemory
{
  return &self->_sharedMemory;
}

- (void)notifyClientOnStopWithReason:(int64_t)a3 error:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  int64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[_GCHapticClientProxy stopRunning](self, "stopRunning");
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 134218242;
      v10 = a3;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_INFO, "notifyClientOnStopWithReason:%lu error:%@", (uint8_t *)&v9, 0x16u);
    }

  }
  -[_GCIPCIncomingConnection remoteProxy](self->_connection, "remoteProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientStoppedForReason:error:", a3, v6);

}

- (void)setMute:(BOOL)a3 forReason:(unint64_t)a4
{
  char *v4;
  int v5;
  int v6;

  v4 = (char *)self + 4 * a4;
  v5 = *((_DWORD *)v4 + 25);
  if (a3)
    v6 = v5 + 1;
  else
    v6 = v5 - 1;
  *((_DWORD *)v4 + 25) = (int)fmax((double)v6, 0.0);
  self->_dirtyMuteState = 1;
}

- (void)setHapticStrength:(float)a3
{
  self->_hapticStrength = a3;
}

- (float)hapticStrength
{
  return self->_hapticStrength;
}

- (BOOL)isMutedForReason:(unint64_t)a3
{
  void *v7;

  if (a3 >= 5)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCHapticClientProxy.mm"), 248, CFSTR("Attempting to check if player is muted for invalid reason"));

  }
  return self->_muteReasons[a3] != 0;
}

- (BOOL)isMuted
{
  BOOL v2;
  uint64_t v3;

  if (!self->_dirtyMuteState)
    return self->_muted;
  v2 = 0;
  self->_muted = 0;
  if (!self->_neverMute)
  {
    v3 = 0;
    while (!self->_muteReasons[v3])
    {
      if (++v3 == 5)
        return 0;
    }
    v2 = 1;
    self->_muted = 1;
  }
  return v2;
}

- (void)notifyClientCompletedWithError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  _GCHapticClientProxy *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412546;
      v8 = self;
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_215181000, v6, OS_LOG_TYPE_INFO, "%@ notifyClientCompletedWithError: %@", (uint8_t *)&v7, 0x16u);
    }

  }
  -[_GCIPCIncomingConnection remoteProxy](self->_connection, "remoteProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientCompletedWithError:", 0);

}

- (void)setComplete:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  _GCHapticClientProxy *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (self->_complete != a3)
  {
    v3 = a3;
    if (gc_isInternalBuild())
    {
      getGCHapticsLogger();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = CFSTR("NO");
        if (v3)
          v6 = CFSTR("YES");
        v7 = 138412546;
        v8 = self;
        v9 = 2112;
        v10 = v6;
        _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_INFO, "%@ setComplete=%@", (uint8_t *)&v7, 0x16u);
      }

    }
    self->_complete = v3;
    if (v3)
      -[_GCHapticClientProxy notifyClientCompletedWithError:](self, "notifyClientCompletedWithError:", 0);
  }
}

- (id)description
{
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@-%lu (%@) reservedChannels=%lu muted=%d running=%d>"), objc_opt_class(), self->_clientID, self->_bundleIdentifier, -[NSMutableDictionary count](self->_hapticPlayers, "count"), self->_muted, self->_running);
}

- (double)totalLifetimeInSeconds
{
  double result;

  result = 0.0;
  if (self->_initializationTime >= 0.0)
    return (double)mach_absolute_time() * 0.0000000416666667 - self->_initializationTime;
  return result;
}

- (void)addActiveTime:(double)a3
{
  if (a3 >= 0.0)
    self->_activeLifetimeInSeconds = self->_activeLifetimeInSeconds + a3;
}

- (unint64_t)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unint64_t)a3
{
  self->_clientID = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (NSString)persistentControllerIdentifier
{
  return self->_persistentControllerIdentifier;
}

- (NSString)controllerProductCategory
{
  return self->_controllerProductCategory;
}

- (NSArray)actuators
{
  return self->_actuators;
}

- (NSMutableDictionary)hapticPlayers
{
  return self->_hapticPlayers;
}

- (void)setHapticPlayers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (BOOL)shouldSquareContinuousIntensity
{
  return self->_shouldSquareContinuousIntensity;
}

- (void)setShouldSquareContinuousIntensity:(BOOL)a3
{
  self->_shouldSquareContinuousIntensity = a3;
}

- (BOOL)complete
{
  return self->_complete;
}

- (BOOL)isMockClient
{
  return self->_mockClient;
}

- (void)setMockClient:(BOOL)a3
{
  self->_mockClient = a3;
}

- (unsigned)applicationState
{
  return self->_applicationState;
}

- (void)setApplicationState:(unsigned int)a3
{
  self->_applicationState = a3;
}

- (int)totalPlayers
{
  return self->_totalPlayers;
}

- (double)activeLifetimeInSeconds
{
  return self->_activeLifetimeInSeconds;
}

- (NSArray)invalidationHandlers
{
  return self->_invalidationHandlers;
}

- (void)setInvalidationHandlers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationHandlers, 0);
  objc_storeStrong((id *)&self->_hapticPlayers, 0);
  objc_storeStrong((id *)&self->_actuators, 0);
  objc_storeStrong((id *)&self->_controllerProductCategory, 0);
  objc_storeStrong((id *)&self->_persistentControllerIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong(&self->_connectionInterruptedRegistration, 0);
  objc_storeStrong(&self->_connectionInvalidationRegistration, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_activeProfile, 0);
  objc_storeStrong((id *)&self->_settingsStore, 0);
  SharableMemoryBlock::~SharableMemoryBlock((id *)&self->_sharedMemory._vptr$SharableMemoryBase);
  objc_storeStrong((id *)&self->_server, 0);
}

- (id).cxx_construct
{
  *((_WORD *)self + 16) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_DWORD *)self + 14) = 0;
  *(_QWORD *)((char *)self + 60) = 0xFFFFFFFFLL;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 3) = &unk_24D2B5FB8;
  return self;
}

- (BOOL)isInvalid
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_invalid);
  return v2 & 1;
}

- (id)addInvalidationHandler:(id)a3
{
  id v4;
  void *v5;
  _GCHapticClientProxy *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  _GCObservation *v11;
  _GCObservation *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = self;
  objc_sync_enter(v6);
  v7 = atomic_load((unsigned __int8 *)&v6->_invalid);
  if ((v7 & 1) != 0)
  {
    objc_sync_exit(v6);

    v12 = 0;
  }
  else
  {
    -[_GCHapticClientProxy invalidationHandlers](v6, "invalidationHandlers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    v10 = (void *)MEMORY[0x2199DEBB0](v5);
    objc_msgSend(v9, "addObject:", v10);

    -[_GCHapticClientProxy setInvalidationHandlers:](v6, "setInvalidationHandlers:", v9);
    objc_sync_exit(v6);

    objc_initWeak(&location, v6);
    v11 = [_GCObservation alloc];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __71___GCHapticClientProxy_InvalidationObservable__addInvalidationHandler___block_invoke;
    v14[3] = &unk_24D2B5F10;
    objc_copyWeak(&v16, &location);
    v15 = v5;
    v12 = -[_GCObservation initWithCleanupHandler:](v11, "initWithCleanupHandler:", v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)_configureActuatorsLegacyWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSArray *v8;
  NSArray *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  GCHapticActuator *v16;
  NSArray *v17;
  NSArray *actuators;
  NSObject *v19;
  NSObject *v20;
  NSArray *v21;
  id v22;
  GCHapticActuator *v23;
  uint8_t buf[4];
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("hapticEngineInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (gc_isInternalBuild())
    {
      getGCHapticsLogger();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215181000, v19, OS_LOG_TYPE_DEFAULT, "hapticEngineInfo not found, looking for individual components...", buf, 2u);
      }

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("hapticEngineLabel"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("hapticEngineName"));
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
        v7 = (__CFString *)v14;
      else
        v7 = CFSTR("Unknown");
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("hapticEngineIndex"));
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
      v6 = (void *)v15;
    else
      v6 = &unk_24D30F100;
    objc_msgSend(v4, "objectForKey:", CFSTR("hapticEngineType"));
    v12 = objc_claimAutoreleasedReturnValue();
    v16 = -[GCHapticActuator initWithLabel:type:index:]([GCHapticActuator alloc], "initWithLabel:type:index:", v7, -[NSObject isEqualToString:](v12, "isEqualToString:", CFSTR("LRA")), objc_msgSend(v6, "integerValue"));
    v23 = v16;
    +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v23, 1);
    v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
    actuators = self->_actuators;
    self->_actuators = v17;

    if (gc_isInternalBuild())
    {
      getGCHapticsLogger();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = self->_actuators;
        *(_DWORD *)buf = 138412290;
        v25 = v21;
        _os_log_impl(&dword_215181000, v20, OS_LOG_TYPE_DEFAULT, "Created actuator: %@", buf, 0xCu);
      }

    }
    goto LABEL_16;
  }
  v22 = 0;
  +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](&off_254E12C00, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (__CFString *)v22;
  v26[0] = v6;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v26, 1);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v9 = self->_actuators;
  self->_actuators = v8;

  if (!v7)
  {
    if (!gc_isInternalBuild())
      goto LABEL_18;
    getGCHapticsLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    *(_DWORD *)buf = 138412290;
    v25 = v6;
    v13 = "Haptic actuator received: %@";
    goto LABEL_27;
  }
  +[GCAnalytics instance](GCAnalytics, "instance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  currentProcessBundleIdentifier();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendHapticsErrorRaisedEventFromSource:productCategory:errorType:", v11, self->_controllerProductCategory, CFSTR("ConfigureActuatorsLegacyFailure"));

  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
LABEL_16:

      goto LABEL_18;
    }
    *(_DWORD *)buf = 138412290;
    v25 = v7;
    v13 = "Failed to unarchive haptic actuator! %@";
LABEL_27:
    _os_log_impl(&dword_215181000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
    goto LABEL_16;
  }
LABEL_18:

}

- (void)configureWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, unint64_t);
  NSString *v8;
  NSString *controllerProductCategory;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *p_super;
  NSArray *v16;
  NSCopying *v17;
  NSCopying *identifier;
  NSString *v19;
  NSString *persistentControllerIdentifier;
  NSObject *v21;
  NSString *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  NSString *v31;
  NSObject *v32;
  NSCopying *v33;
  NSObject *v34;
  NSArray *actuators;
  NSCopying *v36;
  NSObject *v37;
  unint64_t clientID;
  NSObject *v39;
  id v40;
  uint8_t buf[4];
  unint64_t v42;
  __int16 v43;
  NSCopying *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, unint64_t))a4;
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = (unint64_t)v6;
      _os_log_impl(&dword_215181000, v29, OS_LOG_TYPE_DEFAULT, "configureWithOptions %@", buf, 0xCu);
    }

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("controllerProductCategory"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  controllerProductCategory = self->_controllerProductCategory;
  self->_controllerProductCategory = v8;

  if (self->_controllerProductCategory && gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = self->_controllerProductCategory;
      *(_DWORD *)buf = 138412290;
      v42 = (unint64_t)v31;
      _os_log_impl(&dword_215181000, v30, OS_LOG_TYPE_DEFAULT, "Received controller product category %@", buf, 0xCu);
    }

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("actuators"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v40 = 0;
    +[NSKeyedUnarchiver unarchivedArrayOfObjectsOfClass:fromData:error:](&off_254E12C00, "unarchivedArrayOfObjectsOfClass:fromData:error:", objc_opt_class(), v10, &v40);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v40;
    if (v12)
    {
      +[GCAnalytics instance](GCAnalytics, "instance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      currentProcessBundleIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sendHapticsErrorRaisedEventFromSource:productCategory:errorType:", v14, self->_controllerProductCategory, CFSTR("ConfigureActuatorsFailure"));

      if (!gc_isInternalBuild())
      {
LABEL_13:

        goto LABEL_14;
      }
      getGCHapticsLogger();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v42 = (unint64_t)v12;
        _os_log_impl(&dword_215181000, p_super, OS_LOG_TYPE_DEFAULT, "Failed to unarchive haptic actuator! %@", buf, 0xCu);
      }
    }
    else
    {
      if (gc_isInternalBuild())
      {
        getGCHapticsLogger();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v42 = (unint64_t)v11;
          _os_log_impl(&dword_215181000, v39, OS_LOG_TYPE_DEFAULT, "Haptic actuators received: %@", buf, 0xCu);
        }

      }
      v16 = v11;
      p_super = &self->_actuators->super;
      self->_actuators = v16;
    }

    goto LABEL_13;
  }
  -[_GCHapticClientProxy _configureActuatorsLegacyWithOptions:](self, "_configureActuatorsLegacyWithOptions:", v6);
LABEL_14:
  objc_msgSend(v6, "objectForKey:", CFSTR("controllerIdentifier"));
  v17 = (NSCopying *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v17;

  if (self->_identifier && gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = self->_identifier;
      *(_DWORD *)buf = 138412290;
      v42 = (unint64_t)v33;
      _os_log_impl(&dword_215181000, v32, OS_LOG_TYPE_DEFAULT, "Received controller identifier %@", buf, 0xCu);
    }

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("persistentControllerIdentifier"));
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  persistentControllerIdentifier = self->_persistentControllerIdentifier;
  self->_persistentControllerIdentifier = v19;

  v21 = self->_persistentControllerIdentifier;
  if (!v21)
  {
    self->_persistentControllerIdentifier = (NSString *)CFSTR("__Unknown");
LABEL_21:

    goto LABEL_22;
  }
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = self->_persistentControllerIdentifier;
      *(_DWORD *)buf = 138412290;
      v42 = (unint64_t)v22;
      _os_log_impl(&dword_215181000, v21, OS_LOG_TYPE_DEFAULT, "Received persistent controller identifier %@", buf, 0xCu);
    }
    goto LABEL_21;
  }
LABEL_22:
  objc_msgSend(v6, "objectForKey:", CFSTR("isDummyServer"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23 && objc_msgSend(v23, "BOOLValue"))
  {
    if (gc_isInternalBuild())
    {
      getGCHapticsLogger();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        actuators = self->_actuators;
        v36 = self->_identifier;
        *(_DWORD *)buf = 138412546;
        v42 = (unint64_t)actuators;
        v43 = 2112;
        v44 = v36;
        _os_log_impl(&dword_215181000, v34, OS_LOG_TYPE_DEFAULT, "==ENTERING DUMMY SERVER MODE FOR ACTUATORS %@ AND CONTROLLER IDENTIFIER %@==", buf, 0x16u);
      }

    }
    v25 = 1;
  }
  else
  {
    v25 = 0;
  }
  -[_GCHapticClientProxy setMockClient:](self, "setMockClient:", v25);
  objc_msgSend(v6, "objectForKey:", CFSTR("shouldSquareContinuousIntensity"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26 && objc_msgSend(v26, "BOOLValue") && gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      clientID = self->_clientID;
      *(_DWORD *)buf = 134217984;
      v42 = clientID;
      _os_log_impl(&dword_215181000, v37, OS_LOG_TYPE_INFO, "%lu should use legacy continuous intensity curve.", buf, 0xCu);
    }

  }
  +[_GCHapticServerManager sharedInstance](_GCHapticServerManager, "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "hapticClientProxyInitialized:", self);

  v7[2](v7, self->_clientID);
}

- (void)queryCapabilities:(id)a3 reply:(id)a4
{
  void (**v6)(id, id, _QWORD);
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  BOOL v17;

  v13 = a3;
  v6 = (void (**)(id, id, _QWORD))a4;
  v7 = objc_alloc_init((Class)&off_254DEBD30);
  objc_msgSend(v13, "objectForKey:", CFSTR("RequestedLocality"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray firstObject](self->_actuators, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "type") == 0;

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __62___GCHapticClientProxy_HapticServer__queryCapabilities_reply___block_invoke;
  v14[3] = &unk_24D2B5F38;
  v11 = v7;
  v15 = v11;
  v12 = v8;
  v16 = v12;
  v17 = v10;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v14);
  v6[2](v6, v11, 0);

}

- (void)allocateClientResources:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  NSObject *v8;
  unint64_t clientID;
  unsigned int v10;
  _BYTE buf[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      clientID = self->_clientID;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = clientID;
      _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - allocateClientResources", buf, 0xCu);
    }

  }
  *(_QWORD *)buf = xpc_null_create();
  v10 = 5376;
  v5 = HapticSharedMemory::allocate((uint64_t)&self->_sharedMemory, (void **)buf, &v10);
  if (v5)
  {
    +[NSError errorWithDomain:code:userInfo:](&off_254DF2E50, "errorWithDomain:code:userInfo:", CFSTR("com.apple.GameController.gamecontrollerd.haptics"), v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  (*((void (**)(id, _QWORD, _QWORD, void *))v4 + 2))(v4, *(_QWORD *)buf, v10, v6);

  v7 = *(void **)buf;
  *(_QWORD *)buf = 0;

}

- (void)releaseClientResources
{
  NSObject *v3;
  unint64_t clientID;
  int v5;
  unint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      clientID = self->_clientID;
      v5 = 134217984;
      v6 = clientID;
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - releaseClientResources", (uint8_t *)&v5, 0xCu);
    }

  }
  (*((void (**)(HapticSharedMemory *))self->_sharedMemory._vptr$SharableMemoryBase + 2))(&self->_sharedMemory);
}

- (void)getHapticLatency:(id)a3
{
  void (**v4)(id, _QWORD, double);
  NSObject *v5;
  unint64_t clientID;
  int v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, double))a3;
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      clientID = self->_clientID;
      v7 = 134217984;
      v8 = clientID;
      _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - getHapticLatency", (uint8_t *)&v7, 0xCu);
    }

  }
  v4[2](v4, 0, 15.0);

}

- (void)setPlayerBehavior:(unint64_t)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD);
  unint64_t v7;
  NSObject *v8;
  unint64_t clientID;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  int v14;
  unint64_t v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD))a4;
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      clientID = self->_clientID;
      v14 = 134218240;
      v15 = clientID;
      v16 = 2048;
      v17 = a3;
      _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - setPlayerBehavior %lu", (uint8_t *)&v14, 0x16u);
    }

  }
  v7 = a3 & 0x40;
  if ((v7 >> 6) != -[_GCHapticClientProxy isMutedForReason:](self, "isMutedForReason:", 0))
  {
    if (gc_isInternalBuild())
    {
      getGCHapticsLogger();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        -[_GCHapticClientProxy identifier](self, "identifier");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        v13 = CFSTR("Unmute");
        if (v7)
          v13 = CFSTR("Mute");
        v14 = 138412546;
        v15 = (unint64_t)v13;
        v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_215181000, v10, OS_LOG_TYPE_INFO, "%@ haptics for client %@", (uint8_t *)&v14, 0x16u);

      }
    }
    -[_GCHapticClientProxy setMute:forReason:](self, "setMute:forReason:", v7 != 0, 0);
  }
  v6[2](v6, 0);

}

- (void)teardownAndReleaseChannels
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  +[_GCHapticServerManager sharedInstance](_GCHapticServerManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "runloopQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64___GCHapticClientProxy_HapticServer__teardownAndReleaseChannels__block_invoke;
  block[3] = &unk_24D2B4800;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)releaseChannels
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  +[_GCHapticServerManager sharedInstance](_GCHapticServerManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "runloopQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53___GCHapticClientProxy_HapticServer__releaseChannels__block_invoke;
  block[3] = &unk_24D2B4800;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)requestChannels:(unint64_t)a3 reply:(id)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  SEL v14;

  v7 = a4;
  +[_GCHapticServerManager sharedInstance](_GCHapticServerManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "runloopQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60___GCHapticClientProxy_HapticServer__requestChannels_reply___block_invoke;
  v11[3] = &unk_24D2B5F60;
  v13 = a3;
  v14 = a2;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  dispatch_async(v9, v11);

}

- (void)removeChannel:(unint64_t)a3 reply:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  unint64_t v12;

  v6 = a4;
  +[_GCHapticServerManager sharedInstance](_GCHapticServerManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "runloopQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58___GCHapticClientProxy_HapticServer__removeChannel_reply___block_invoke;
  block[3] = &unk_24D2B5F88;
  v11 = v6;
  v12 = a3;
  block[4] = self;
  v9 = v6;
  dispatch_async(v8, block);

}

- (void)setChannelEventBehavior:(unint64_t)a3 behavior:(unint64_t)a4 reply:(id)a5
{
  void (**v9)(id, _QWORD);
  NSMutableDictionary *hapticPlayers;
  void *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  unint64_t clientID;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  int v22;
  unint64_t v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v9 = (void (**)(id, _QWORD))a5;
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      clientID = self->_clientID;
      v22 = 134218496;
      v23 = clientID;
      v24 = 2048;
      v25 = a3;
      v26 = 2048;
      v27 = a4;
      _os_log_impl(&dword_215181000, v14, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - setChannelEventBehavior %lu, behavior %lu", (uint8_t *)&v22, 0x20u);
    }

  }
  hapticPlayers = self->_hapticPlayers;
  +[NSNumber numberWithUnsignedInteger:](&off_254DED908, "numberWithUnsignedInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](hapticPlayers, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = a4 & 2;
    if ((v13 >> 1) != objc_msgSend(v12, "isMutedForReason:", 0))
    {
      if (gc_isInternalBuild())
      {
        getGCHapticsLogger();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v12, "identifier");
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v19;
          v21 = CFSTR("Unmute");
          if (v13)
            v21 = CFSTR("Mute");
          v22 = 138412546;
          v23 = (unint64_t)v21;
          v24 = 2112;
          v25 = v19;
          _os_log_impl(&dword_215181000, v18, OS_LOG_TYPE_INFO, "%@ haptics for player %@", (uint8_t *)&v22, 0x16u);

        }
      }
      objc_msgSend(v12, "setMute:forReason:", v13 != 0, 0);
    }
    v9[2](v9, 0);
  }
  else
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCHapticClientProxy.mm"), 609, CFSTR("Attempting to setChannelEventBehavior for unbound channel!"));

    NSErrorFromOSStatus(-4804);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v9)[2](v9, v17);

  }
}

- (void)loadHapticEvent:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, void *);
  void *v8;
  NSObject *v9;
  unint64_t clientID;
  int v11;
  unint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, void *))a4;
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      clientID = self->_clientID;
      v11 = 134218242;
      v12 = clientID;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - loadHapticEvent %@", (uint8_t *)&v11, 0x16u);
    }

  }
  +[NSError errorWithDomain:code:userInfo:](&off_254DF2E50, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4809, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, -1, v8);

}

- (void)loadHapticSequenceFromData:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t, void *, double);
  void *v8;
  NSObject *v9;
  unint64_t clientID;
  int v11;
  unint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t, void *, double))a4;
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      clientID = self->_clientID;
      v11 = 134218242;
      v12 = clientID;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - loadHapticSequenceFromData %@", (uint8_t *)&v11, 0x16u);
    }

  }
  +[NSError errorWithDomain:code:userInfo:](&off_254DF2E50, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4809, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, -1, -1, v8, -1.0);

}

- (void)loadHapticSequenceFromEvents:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t, void *, double);
  void *v8;
  NSObject *v9;
  unint64_t clientID;
  int v11;
  unint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t, void *, double))a4;
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      clientID = self->_clientID;
      v11 = 134218242;
      v12 = clientID;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - loadHapticSequenceFromEvents %@", (uint8_t *)&v11, 0x16u);
    }

  }
  +[NSError errorWithDomain:code:userInfo:](&off_254DF2E50, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4809, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, -1, -1, v8, -1.0);

}

- (void)loadVibePattern:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, void *);
  void *v8;
  NSObject *v9;
  unint64_t clientID;
  int v11;
  unint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, void *))a4;
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      clientID = self->_clientID;
      v11 = 134218242;
      v12 = clientID;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - loadVibePattern %@", (uint8_t *)&v11, 0x16u);
    }

  }
  +[NSError errorWithDomain:code:userInfo:](&off_254DF2E50, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4809, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, -1, v8);

}

- (void)setSequenceEventBehavior:(unint64_t)a3 behavior:(unint64_t)a4 channelIndex:(unint64_t)a5 reply:(id)a6
{
  void (**v8)(id, void *);
  void *v9;
  NSObject *v10;
  unint64_t clientID;
  int v12;
  unint64_t v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, void *))a6;
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      clientID = self->_clientID;
      v12 = 134218240;
      v13 = clientID;
      v14 = 2048;
      v15 = a3;
      _os_log_impl(&dword_215181000, v10, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - setSequenceEventBehavior %lu", (uint8_t *)&v12, 0x16u);
    }

  }
  +[NSError errorWithDomain:code:userInfo:](&off_254DF2E50, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4809, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v9);

}

- (void)createCustomAudioEvent:(id)a3 format:(id)a4 frames:(unint64_t)a5 options:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, uint64_t, void *);
  void *v16;
  NSObject *v17;
  unint64_t clientID;
  int v19;
  unint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, uint64_t, void *))a7;
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      clientID = self->_clientID;
      v19 = 134219010;
      v20 = clientID;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      v25 = 2048;
      v26 = a5;
      v27 = 2112;
      v28 = v14;
      _os_log_impl(&dword_215181000, v17, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - createCustomAudioEvent %@ format %@, frames %lu, options %@", (uint8_t *)&v19, 0x34u);
    }

  }
  +[NSError errorWithDomain:code:userInfo:](&off_254DF2E50, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4809, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2](v15, -1, v16);

}

- (void)copyCustomAudioEvent:(unint64_t)a3 options:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, void *);
  void *v10;
  NSObject *v11;
  unint64_t clientID;
  int v13;
  unint64_t v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void (**)(id, uint64_t, void *))a5;
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      clientID = self->_clientID;
      v13 = 134218498;
      v14 = clientID;
      v15 = 2048;
      v16 = a3;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_215181000, v11, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - copyCustomAudioEvent %lu, options %@", (uint8_t *)&v13, 0x20u);
    }

  }
  +[NSError errorWithDomain:code:userInfo:](&off_254DF2E50, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4809, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, -1, v10);

}

- (void)referenceCustomAudioEvent:(unint64_t)a3 reply:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  NSObject *v8;
  unint64_t clientID;
  int v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *))a4;
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      clientID = self->_clientID;
      v10 = 134218240;
      v11 = clientID;
      v12 = 2048;
      v13 = a3;
      _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - referenceCustomAudioEvent %lu", (uint8_t *)&v10, 0x16u);
    }

  }
  +[NSError errorWithDomain:code:userInfo:](&off_254DF2E50, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4809, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);

}

- (void)releaseCustomAudioEvent:(unint64_t)a3 reply:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  NSObject *v8;
  unint64_t clientID;
  int v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *))a4;
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      clientID = self->_clientID;
      v10 = 134218240;
      v11 = clientID;
      v12 = 2048;
      v13 = a3;
      _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - releaseCustomAudioEvent %lu", (uint8_t *)&v10, 0x16u);
    }

  }
  +[NSError errorWithDomain:code:userInfo:](&off_254DF2E50, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4809, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);

}

- (void)removeCustomAudioEvent:(unint64_t)a3 reply:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  NSObject *v8;
  unint64_t clientID;
  int v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *))a4;
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      clientID = self->_clientID;
      v10 = 134218240;
      v11 = clientID;
      v12 = 2048;
      v13 = a3;
      _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - removeCustomAudioEvent %lu", (uint8_t *)&v10, 0x16u);
    }

  }
  +[NSError errorWithDomain:code:userInfo:](&off_254DF2E50, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4809, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);

}

- (void)prepareHapticSequence:(unint64_t)a3 reply:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  NSObject *v8;
  unint64_t clientID;
  int v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *))a4;
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      clientID = self->_clientID;
      v10 = 134218240;
      v11 = clientID;
      v12 = 2048;
      v13 = a3;
      _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - prepareHapticSequence %lu", (uint8_t *)&v10, 0x16u);
    }

  }
  +[NSError errorWithDomain:code:userInfo:](&off_254DF2E50, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4809, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);

}

- (void)detachSequence:(unint64_t)a3
{
  NSObject *v5;
  unint64_t clientID;
  int v7;
  unint64_t v8;
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      clientID = self->_clientID;
      v7 = 134218240;
      v8 = clientID;
      v9 = 2048;
      v10 = a3;
      _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - detachSequence %lu", (uint8_t *)&v7, 0x16u);
    }

  }
}

- (void)prewarm:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  unint64_t clientID;
  int v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      clientID = self->_clientID;
      v7 = 134217984;
      v8 = clientID;
      _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - prewarm", (uint8_t *)&v7, 0xCu);
    }

  }
  v4[2](v4, 0);

}

- (void)stopPrewarm
{
  NSObject *v3;
  unint64_t clientID;
  int v5;
  unint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      clientID = self->_clientID;
      v5 = 134217984;
      v6 = clientID;
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - stopPrewarm", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)startRunning:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  unint64_t clientID;
  int v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      clientID = self->_clientID;
      v7 = 134217984;
      v8 = clientID;
      _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - startRunning", (uint8_t *)&v7, 0xCu);
    }

  }
  self->_running = 1;
  v4[2](v4, 0);

}

- (void)stopRunning
{
  NSObject *v3;
  unint64_t clientID;
  int v5;
  unint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      clientID = self->_clientID;
      v5 = 134217984;
      v6 = clientID;
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - stopRunning", (uint8_t *)&v5, 0xCu);
    }

  }
  *(_WORD *)&self->_running = 0;
}

- (void)stopRunning:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  unint64_t clientID;
  int v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      clientID = self->_clientID;
      v7 = 134217984;
      v8 = clientID;
      _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - stopRunning theReply", (uint8_t *)&v7, 0xCu);
    }

  }
  *(_WORD *)&self->_running = 256;
  v4[2](v4, 0);
  self->_stopping = 0;

}

- (void)debugExpectNotifyOnFinishAfter:(double)a3 reply:(id)a4
{
  void (**v6)(_QWORD);
  NSObject *v7;
  unint64_t clientID;
  int v9;
  unint64_t v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(_QWORD))a4;
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      clientID = self->_clientID;
      v9 = 134218240;
      v10 = clientID;
      v11 = 2048;
      v12 = a3;
      _os_log_impl(&dword_215181000, v7, OS_LOG_TYPE_DEFAULT, "HapticClient %lu - debugExpectNotifyOnFinishAfter %f", (uint8_t *)&v9, 0x16u);
    }

  }
  v6[2](v6);

}

- (void)debugEngineIsRunning:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

@end
