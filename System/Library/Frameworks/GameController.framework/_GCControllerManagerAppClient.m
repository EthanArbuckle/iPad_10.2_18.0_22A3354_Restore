@implementation _GCControllerManagerAppClient

- (_GCControllerManagerAppClient)init
{
  _GCControllerManagerAppClient *v2;
  _GCControllerManagerAppClient *v3;
  _GCControllerManagerAppClient *v4;
  NSMutableSet *v5;
  NSMutableSet *knownHIDServices;
  NSMutableDictionary *v7;
  NSMutableDictionary *publishedControllers;
  NSMutableSet *v9;
  NSMutableSet *pendingControllers;
  NSMutableSet *v11;
  NSMutableSet *serverValidControllerIdentifiers;
  NSMutableSet *v13;
  NSMutableSet *customControllerIdentifiers;
  BKSHIDEventDeliveryPolicyObserver *v15;
  BKSHIDEventDeliveryPolicyObserver *hidEventObserver;
  void *v17;
  _QWORD block[4];
  _GCControllerManagerAppClient *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)_GCControllerManagerAppClient;
  v2 = -[_GCControllerManager init](&v21, sel_init);
  v3 = v2;
  if (v2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37___GCControllerManagerAppClient_init__block_invoke;
    block[3] = &unk_24D2B2B20;
    v4 = v2;
    v20 = v4;
    if (init_onceToken != -1)
      dispatch_once(&init_onceToken, block);
    v5 = (NSMutableSet *)objc_alloc_init((Class)&off_254DEBF30);
    knownHIDServices = v4->_knownHIDServices;
    v4->_knownHIDServices = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)&off_254DEBD30);
    publishedControllers = v4->_publishedControllers;
    v4->_publishedControllers = v7;

    v9 = (NSMutableSet *)objc_alloc_init((Class)&off_254DEBF30);
    pendingControllers = v4->_pendingControllers;
    v4->_pendingControllers = v9;

    v11 = (NSMutableSet *)objc_alloc_init((Class)&off_254DEBF30);
    serverValidControllerIdentifiers = v4->_serverValidControllerIdentifiers;
    v4->_serverValidControllerIdentifiers = v11;

    v13 = (NSMutableSet *)objc_alloc_init((Class)&off_254DEBF30);
    customControllerIdentifiers = v4->_customControllerIdentifiers;
    v4->_customControllerIdentifiers = v13;

    v4->_shouldStartBufferingOnForeground = 0;
    v4->_bufferingStarted = 0;
    v15 = (BKSHIDEventDeliveryPolicyObserver *)objc_alloc_init((Class)&off_254E06248);
    hidEventObserver = v4->_hidEventObserver;
    v4->_hidEventObserver = v15;

    +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment](&off_254E06998, "keyboardFocusEnvironment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKSHIDEventDeliveryPolicyObserver setDeferringEnvironment:](v4->_hidEventObserver, "setDeferringEnvironment:", v17);

    -[BKSHIDEventDeliveryPolicyObserver addObserver:](v4->_hidEventObserver, "addObserver:", v4);
  }
  return v3;
}

- (void)dealloc
{
  BKSHIDEventDeliveryPolicyObserver *hidEventObserver;
  BKSHIDEventDeliveryPolicyObserver *v4;
  objc_super v5;

  hidEventObserver = self->_hidEventObserver;
  if (hidEventObserver)
  {
    -[BKSHIDEventDeliveryPolicyObserver removeObserver:](hidEventObserver, "removeObserver:", self);
    v4 = self->_hidEventObserver;
    self->_hidEventObserver = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)_GCControllerManagerAppClient;
  -[_GCControllerManager dealloc](&v5, sel_dealloc);
}

+ (id)serviceFor:(id)a3 client:(id)a4
{
  if (&unk_254DC8C20 != a3)
    return 0;
  +[GCAnalytics instance](GCAnalytics, "instance");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)open
{
  void *v3;
  char v4;
  void *v5;
  _QWORD activity_block[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_GCControllerManagerAppClient;
  -[_GCControllerManager open](&v7, sel_open);
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __37___GCControllerManagerAppClient_open__block_invoke;
  activity_block[3] = &unk_24D2B2B20;
  activity_block[4] = self;
  _os_activity_initiate(&dword_215181000, "Connect To Game Controller Daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    currentProcessBundleIdentifier();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Preferences"));

    if ((v4 & 1) == 0)
    {
      +[_GCUIInteractionCompatibilityManager sharedInstance](_GCUIInteractionCompatibilityManager, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setEnabled:", 1);

    }
  }
  SetupVirtualGameControllerIfForced();
  +[GCFrameworkInitialization controllerManagerDidOpen](GCFrameworkInitialization, "controllerManagerDidOpen");
}

- (void)finalizeRecording
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "resume");
  objc_msgSend(v2, "remoteProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50___GCControllerManagerAppClient_finalizeRecording__block_invoke;
  v5[3] = &unk_24D2B3808;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "moveLastRecordingToDesktop:", v5);

}

- (void)_connectToDaemon
{
  NSObject *v2;
  void *v4;
  uint64_t v5;
  void *v6;
  id serverConnectionInvalidation;
  void *v8;
  id serverConnectionInterruption;
  GCIPCOutgoingConnection *serverConnection;
  _QWORD v11[5];
  _QWORD v12[5];
  uint8_t buf[16];

  if (self->_serverConnection)
  {
    if (!gc_isInternalBuild())
      return;
    getGCLogger();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215181000, v2, OS_LOG_TYPE_INFO, "Game Controller daemon connection has already been established.", buf, 2u);
    }
  }
  else
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setClient:", self);
    v5 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __49___GCControllerManagerAppClient__connectToDaemon__block_invoke;
    v12[3] = &unk_24D2B2B20;
    v12[4] = self;
    objc_msgSend(v4, "addInvalidationHandler:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    serverConnectionInvalidation = self->_serverConnectionInvalidation;
    self->_serverConnectionInvalidation = v6;

    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __49___GCControllerManagerAppClient__connectToDaemon__block_invoke_134;
    v11[3] = &unk_24D2B2B20;
    v11[4] = self;
    objc_msgSend(v4, "addInterruptionHandler:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    serverConnectionInterruption = self->_serverConnectionInterruption;
    self->_serverConnectionInterruption = v8;

    serverConnection = self->_serverConnection;
    self->_serverConnection = (GCIPCOutgoingConnection *)v4;
    v2 = v4;

    -[GCIPCOutgoingConnection resume](self->_serverConnection, "resume");
    -[_GCControllerManagerAppClient _resumeDaemonConnection](self, "_resumeDaemonConnection");
  }

}

- (void)_resumeDaemonConnection
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD activity_block[5];
  uint8_t buf[16];

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215181000, v4, OS_LOG_TYPE_INFO, "resume daemon connection - begin", buf, 2u);
    }

  }
  if (-[_GCControllerManager isAppInBackground](self, "isAppInBackground"))
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_INFO, "resume daemon connection - app is backgrounded, deferring to app foreground", buf, 2u);
      }

    }
    self->_shouldResumeDaemonConnectionOnForeground = 1;
  }
  else
  {
    v3 = MEMORY[0x24BDAC760];
    activity_block[0] = MEMORY[0x24BDAC760];
    activity_block[1] = 3221225472;
    activity_block[2] = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke;
    activity_block[3] = &unk_24D2B2B20;
    activity_block[4] = self;
    _os_activity_initiate(&dword_215181000, "Connect To 'Controller Service'", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
    v14[0] = v3;
    v14[1] = 3221225472;
    v14[2] = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_137;
    v14[3] = &unk_24D2B2B20;
    v14[4] = self;
    _os_activity_initiate(&dword_215181000, "Connect To 'Player Indicator XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, v14);
    v13[0] = v3;
    v13[1] = 3221225472;
    v13[2] = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_140;
    v13[3] = &unk_24D2B2B20;
    v13[4] = self;
    _os_activity_initiate(&dword_215181000, "Connect To 'Light XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, v13);
    v12[0] = v3;
    v12[1] = 3221225472;
    v12[2] = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_143;
    v12[3] = &unk_24D2B2B20;
    v12[4] = self;
    _os_activity_initiate(&dword_215181000, "Connect To 'Adaptive Triggers XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, v12);
    v11[0] = v3;
    v11[1] = 3221225472;
    v11[2] = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_146;
    v11[3] = &unk_24D2B2B20;
    v11[4] = self;
    _os_activity_initiate(&dword_215181000, "Connect To 'Motion XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, v11);
    v10[0] = v3;
    v10[1] = 3221225472;
    v10[2] = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_149;
    v10[3] = &unk_24D2B2B20;
    v10[4] = self;
    _os_activity_initiate(&dword_215181000, "Connect To 'Battery XPC Proxy Service", OS_ACTIVITY_FLAG_DEFAULT, v10);
    v9[0] = v3;
    v9[1] = 3221225472;
    v9[2] = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_152;
    v9[3] = &unk_24D2B2B20;
    v9[4] = self;
    _os_activity_initiate(&dword_215181000, "Connect To 'Settings XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, v9);
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_155;
    v8[3] = &unk_24D2B2B20;
    v8[4] = self;
    _os_activity_initiate(&dword_215181000, "Connect To 'PhotoVideo XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, v8);
    v7[0] = v3;
    v7[1] = 3221225472;
    v7[2] = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_158;
    v7[3] = &unk_24D2B2B20;
    v7[4] = self;
    _os_activity_initiate(&dword_215181000, "Connect To 'Game Intent XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, v7);
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_161;
    v6[3] = &unk_24D2B2B20;
    v6[4] = self;
    _os_activity_initiate(&dword_215181000, "Connect To 'System Gesture XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, v6);
  }
}

- (void)CBApplicationDidBecomeActive
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_GCControllerManagerAppClient;
  -[_GCControllerManager CBApplicationDidBecomeActive](&v6, sel_CBApplicationDidBecomeActive);
  if (self->_shouldResumeDaemonConnectionOnForeground)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_INFO, "app is foregrounded, executing deferred _resumeDaemonConnection", v5, 2u);
      }

    }
    -[_GCControllerManagerAppClient _resumeDaemonConnection](self, "_resumeDaemonConnection");
    self->_shouldResumeDaemonConnectionOnForeground = 0;
  }
  if (self->_shouldStartBufferingOnForeground)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_215181000, v4, OS_LOG_TYPE_INFO, "app is foregrounded, executing deferred startBuffering", v5, 2u);
      }

    }
    if (!self->_bufferingStarted)
      -[_GCControllerManagerAppClient startBuffering](self, "startBuffering");
    self->_shouldStartBufferingOnForeground = 0;
  }
}

- (void)CBApplicationWillResignActive
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_GCControllerManagerAppClient;
  -[_GCControllerManager CBApplicationWillResignActive](&v2, sel_CBApplicationWillResignActive);
}

- (id)controllers
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  _GCControllerManagerAppClient *v14;

  +[NSMutableArray array](&off_254DEBB20, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCControllerManager controllersQueue](self, "controllersQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __44___GCControllerManagerAppClient_controllers__block_invoke;
  v12 = &unk_24D2B2B48;
  v5 = v3;
  v13 = v5;
  v14 = self;
  dispatch_barrier_sync(v4, &v9);

  -[_GCControllerManager _legacy_controllers](self, "_legacy_controllers", v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  v7 = v5;
  return v7;
}

- (void)_onqueue_addPendingController:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_GCControllerManager controllersQueue](self, "controllersQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v9, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet member:](self->_serverValidControllerIdentifiers, "member:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCControllerManagerApp.m"), 438, CFSTR("Asked to add %@, which is not in the valid set."), v9);

  }
  -[NSMutableSet addObject:](self->_pendingControllers, "addObject:", v9);

}

- (void)_onqueue_refreshPublishedControllers
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *publishedControllers;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  NSMutableDictionary *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  void *v33;
  void *v34;
  void *v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  -[_GCControllerManager controllersQueue](self, "controllersQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[NSMutableDictionary allKeys](self->_publishedControllers, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithArray:](&off_254DEBEC0, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[NSSet setWithSet:](&off_254DEBEC0, "setWithSet:", self->_serverValidControllerIdentifiers);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByAddingObjectsFromSet:", self->_customControllerIdentifiers);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = v5;
  objc_msgSend(v5, "gc_setByRemovingObjectsFromSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  publishedControllers = self->_publishedControllers;
  v34 = v8;
  objc_msgSend(v8, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSNull null](&off_254E06A98, "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectsForKeys:notFoundMarker:](publishedControllers, "objectsForKeys:notFoundMarker:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v42 != v16)
          objc_enumerationMutation(v13);
        -[_GCControllerManagerAppClient _onqueue_unpublishController:](self, "_onqueue_unpublishController:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v15);
  }
  v33 = v13;

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = (id)-[NSMutableSet copy](self->_pendingControllers, "copy");
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v38;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v38 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v21);
        objc_msgSend(v22, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v7, "containsObject:", v23);

        if ((v24 & 1) == 0)
        {
          unk_254DEC4F8(&off_254DEC660, "currentHandler");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCControllerManagerApp.m"), 458, CFSTR("Pending controller is not valid: %@"), v22);

        }
        v25 = self->_publishedControllers;
        objc_msgSend(v22, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](v25, "objectForKey:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          if (objc_msgSend(v22, "update:withContext:", v27, self))
          {
            if (gc_isInternalBuild())
            {
              getGCLogger();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v46 = v27;
                _os_log_debug_impl(&dword_215181000, v29, OS_LOG_TYPE_DEBUG, "Updated controller: '%@'", buf, 0xCu);
              }

            }
            -[NSMutableSet removeObject:](self->_pendingControllers, "removeObject:", v22);
          }
        }
        else
        {
          objc_msgSend(v22, "materializeWithContext:", self);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            if (gc_isInternalBuild())
            {
              getGCLogger();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v46 = v27;
                _os_log_debug_impl(&dword_215181000, v30, OS_LOG_TYPE_DEBUG, "Materialized controller: '%@'", buf, 0xCu);
              }

            }
            -[NSMutableSet removeObject:](self->_pendingControllers, "removeObject:", v22);
            -[_GCControllerManagerAppClient _onqueue_publishController:](self, "_onqueue_publishController:", v27);
          }
        }

        ++v21;
      }
      while (v19 != v21);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      v19 = v31;
    }
    while (v31);
  }

}

- (BOOL)_containsPublishedController:(id)a3
{
  NSMutableDictionary *publishedControllers;
  void *v4;
  void *v5;

  publishedControllers = self->_publishedControllers;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](publishedControllers, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(publishedControllers) = v5 != 0;

  return (char)publishedControllers;
}

- (void)_onqueue_unpublishController:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableDictionary *publishedControllers;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[_GCControllerManager controllersQueue](self, "controllersQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  publishedControllers = self->_publishedControllers;
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](publishedControllers, "removeObjectForKey:", v7);

  if (!-[NSMutableDictionary count](self->_publishedControllers, "count"))
  {
    +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopVideoRecordingBuffering");

  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62___GCControllerManagerAppClient__onqueue_unpublishController___block_invoke;
  v10[3] = &unk_24D2B2B48;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

}

- (void)_onqueue_publishController:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableDictionary *publishedControllers;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[_GCControllerManager controllersQueue](self, "controllersQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  publishedControllers = self->_publishedControllers;
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](publishedControllers, "setObject:forKey:", v4, v7);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60___GCControllerManagerAppClient__onqueue_publishController___block_invoke;
  v9[3] = &unk_24D2B2B48;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

- (void)_onqueue_publishCustomController:(id)a3
{
  NSObject *v4;
  NSMutableSet *customControllerIdentifiers;
  void *v6;
  id v7;

  v7 = a3;
  -[_GCControllerManager controllersQueue](self, "controllersQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  customControllerIdentifiers = self->_customControllerIdentifiers;
  objc_msgSend(v7, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](customControllerIdentifiers, "addObject:", v6);

  -[_GCControllerManagerAppClient _onqueue_publishController:](self, "_onqueue_publishController:", v7);
}

- (void)_onqueue_unpublishCustomController:(id)a3
{
  NSObject *v4;
  NSMutableSet *customControllerIdentifiers;
  void *v6;
  id v7;

  v7 = a3;
  -[_GCControllerManager controllersQueue](self, "controllersQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  customControllerIdentifiers = self->_customControllerIdentifiers;
  objc_msgSend(v7, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](customControllerIdentifiers, "removeObject:", v6);

  -[_GCControllerManagerAppClient _onqueue_unpublishController:](self, "_onqueue_unpublishController:", v7);
}

- (void)updateEmulatedControllerEnabled
{
  GCSettingsXPCProxyServiceRemoteServerInterface *settingsXPCProxyService;
  _QWORD v3[5];

  settingsXPCProxyService = self->_settingsXPCProxyService;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __64___GCControllerManagerAppClient_updateEmulatedControllerEnabled__block_invoke;
  v3[3] = &unk_24D2B51C0;
  v3[4] = self;
  -[GCSettingsXPCProxyServiceRemoteServerInterface checkEmulatedControllerEnabledWithReply:](settingsXPCProxyService, "checkEmulatedControllerEnabledWithReply:", v3);
}

- (void)updateCurrentControllerAndProfileForUnpublishedController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[_GCControllerManagerAppClient _mostRecentlyActiveControllerIgnoring:](self, "_mostRecentlyActiveControllerIgnoring:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCControllerManagerAppClient _setCurrentController:](self, "_setCurrentController:", v4);

  objc_msgSend(v11, "extendedGamepad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v11, "extendedGamepad");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_GCControllerManagerAppClient _mostRecentlyActiveExtendedGamepadIgnoring:](self, "_mostRecentlyActiveExtendedGamepadIgnoring:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_GCControllerManagerAppClient setCurrentExtendedGamepad:](self, "setCurrentExtendedGamepad:", v7);

LABEL_4:
    objc_msgSend(v11, "microGamepad");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_GCControllerManagerAppClient _mostRecentlyActiveMicroGamepadIgnoring:](self, "_mostRecentlyActiveMicroGamepadIgnoring:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_GCControllerManagerAppClient setCurrentMicroGamepad:](self, "setCurrentMicroGamepad:", v10);

    goto LABEL_5;
  }
  objc_msgSend(v11, "microGamepad");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_4;
LABEL_5:

}

- (id)currentController
{
  _GCControllerManagerAppClient *v2;
  GCController *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->super._currentController;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCurrentController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[_GCControllerManagerAppClient _setCurrentController:](self, "_setCurrentController:", a3);
  -[GCController extendedGamepad](self->super._currentController, "extendedGamepad");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[GCController extendedGamepad](self->super._currentController, "extendedGamepad");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_GCControllerManagerAppClient _setCurrentExtendedGamepad:](self, "_setCurrentExtendedGamepad:", v5);

  }
  -[GCController microGamepad](self->super._currentController, "microGamepad");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[GCController microGamepad](self->super._currentController, "microGamepad");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[_GCControllerManagerAppClient _setCurrentMicroGamepad:](self, "_setCurrentMicroGamepad:", v7);

  }
}

- (void)_setCurrentController:(id)a3
{
  GCController *v5;
  _GCControllerManagerAppClient *v6;
  GCController **p_currentController;
  GCController *currentController;
  void *v9;
  void *v10;
  NSObject *v11;
  GCController *v12;
  NSObject *v13;
  GCController *v14;
  int v15;
  GCController *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (GCController *)a3;
  v6 = self;
  objc_sync_enter(v6);
  p_currentController = &v6->super._currentController;
  currentController = v6->super._currentController;
  if (currentController != v5)
  {
    if (currentController)
    {
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = *p_currentController;
          v15 = 138412290;
          v16 = v14;
          _os_log_impl(&dword_215181000, v13, OS_LOG_TYPE_INFO, "Posting GCControllerDidStopBeingCurrentNotification: %@", (uint8_t *)&v15, 0xCu);
        }

      }
      +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("GCControllerDidStopBeingCurrentNotification"), *p_currentController, 0);

    }
    objc_storeStrong((id *)&v6->super._currentController, a3);
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = *p_currentController;
        v15 = 138412290;
        v16 = v12;
        _os_log_impl(&dword_215181000, v11, OS_LOG_TYPE_INFO, "Posting GCControllerDidBecomeCurrentNotification: %@", (uint8_t *)&v15, 0xCu);
      }

    }
    +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("GCControllerDidBecomeCurrentNotification"), *p_currentController, 0);

  }
  objc_sync_exit(v6);

}

- (id)currentMicroGamepad
{
  _GCControllerManagerAppClient *v2;
  GCMicroGamepad *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->super._currentMicroGamepad;
  objc_sync_exit(v2);

  return v3;
}

- (void)_setCurrentMicroGamepad:(id)a3
{
  GCMicroGamepad *v5;
  _GCControllerManagerAppClient *v6;
  GCMicroGamepad **p_currentMicroGamepad;
  GCMicroGamepad *currentMicroGamepad;
  void *v9;
  void *v10;
  NSObject *v11;
  GCMicroGamepad *v12;
  NSObject *v13;
  GCMicroGamepad *v14;
  int v15;
  GCMicroGamepad *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (GCMicroGamepad *)a3;
  v6 = self;
  objc_sync_enter(v6);
  p_currentMicroGamepad = &v6->super._currentMicroGamepad;
  currentMicroGamepad = v6->super._currentMicroGamepad;
  if (currentMicroGamepad != v5)
  {
    if (currentMicroGamepad)
    {
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = *p_currentMicroGamepad;
          v15 = 138412290;
          v16 = v14;
          _os_log_impl(&dword_215181000, v13, OS_LOG_TYPE_INFO, "Posting GCMicroGamepadDidStopBeingCurrentNotification: %@", (uint8_t *)&v15, 0xCu);
        }

      }
      +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("GCMicroGamepadDidStopBeingCurrentNotification"), *p_currentMicroGamepad, 0);

    }
    objc_storeStrong((id *)&v6->super._currentMicroGamepad, a3);
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = *p_currentMicroGamepad;
        v15 = 138412290;
        v16 = v12;
        _os_log_impl(&dword_215181000, v11, OS_LOG_TYPE_INFO, "Posting GCMicroGamepadDidBecomeCurrentNotification: %@", (uint8_t *)&v15, 0xCu);
      }

    }
    +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("GCMicroGamepadDidBecomeCurrentNotification"), *p_currentMicroGamepad, 0);

  }
  objc_sync_exit(v6);

}

- (id)currentExtendedGamepad
{
  _GCControllerManagerAppClient *v2;
  GCExtendedGamepad *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->super._currentExtendedGamepad;
  objc_sync_exit(v2);

  return v3;
}

- (void)_setCurrentExtendedGamepad:(id)a3
{
  GCExtendedGamepad *v5;
  _GCControllerManagerAppClient *v6;
  GCExtendedGamepad **p_currentExtendedGamepad;
  GCExtendedGamepad *currentExtendedGamepad;
  void *v9;
  void *v10;
  NSObject *v11;
  GCExtendedGamepad *v12;
  NSObject *v13;
  GCExtendedGamepad *v14;
  int v15;
  GCExtendedGamepad *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (GCExtendedGamepad *)a3;
  v6 = self;
  objc_sync_enter(v6);
  p_currentExtendedGamepad = &v6->super._currentExtendedGamepad;
  currentExtendedGamepad = v6->super._currentExtendedGamepad;
  if (currentExtendedGamepad != v5)
  {
    if (currentExtendedGamepad)
    {
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = *p_currentExtendedGamepad;
          v15 = 138412290;
          v16 = v14;
          _os_log_impl(&dword_215181000, v13, OS_LOG_TYPE_INFO, "Posting GCExtendedGamepadDidStopBeingCurrentNotification: %@", (uint8_t *)&v15, 0xCu);
        }

      }
      +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("GCExtendedGamepadDidStopBeingCurrentNotification"), *p_currentExtendedGamepad, 0);

    }
    objc_storeStrong((id *)&v6->super._currentExtendedGamepad, a3);
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = *p_currentExtendedGamepad;
        v15 = 138412290;
        v16 = v12;
        _os_log_impl(&dword_215181000, v11, OS_LOG_TYPE_INFO, "Posting GCExtendedGamepadDidBecomeCurrentNotification: %@", (uint8_t *)&v15, 0xCu);
      }

    }
    +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("GCExtendedGamepadDidBecomeCurrentNotification"), *p_currentExtendedGamepad, 0);

  }
  objc_sync_exit(v6);

}

- (id)_mostRecentlyActiveControllerIgnoring:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[_GCControllerManagerAppClient controllers](self, "controllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v11 = *(id *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (v11 != v4)
        {
          if (v8)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "physicalInputProfile");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "lastEventTimestamp");
            v14 = v13;
            objc_msgSend(v8, "physicalInputProfile");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "lastEventTimestamp");
            v17 = v16;

            if (v14 >= v17)
            {
              v18 = v11;

              v8 = v18;
            }
          }
          else
          {
            v8 = v11;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_mostRecentlyActiveMicroGamepadIgnoring:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  BOOL v13;
  double v14;
  double v15;
  double v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[_GCControllerManagerAppClient controllers](self, "controllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "microGamepad");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
          v13 = v11 == v4;
        else
          v13 = 1;
        if (!v13)
        {
          if (v8)
          {
            objc_msgSend(v11, "lastEventTimestamp");
            v15 = v14;
            objc_msgSend(v8, "lastEventTimestamp");
            if (v15 >= v16)
            {
              v17 = v12;

              v8 = v17;
            }
          }
          else
          {
            v8 = v11;
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_mostRecentlyActiveExtendedGamepadIgnoring:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  BOOL v13;
  double v14;
  double v15;
  double v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[_GCControllerManagerAppClient controllers](self, "controllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "extendedGamepad");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
          v13 = v11 == v4;
        else
          v13 = 1;
        if (!v13)
        {
          if (v8)
          {
            objc_msgSend(v11, "lastEventTimestamp");
            v15 = v14;
            objc_msgSend(v8, "lastEventTimestamp");
            if (v15 >= v16)
            {
              v17 = v12;

              v8 = v17;
            }
          }
          else
          {
            v8 = v11;
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)onHIDServiceAdded:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[5];

  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_knownHIDServices, "containsObject:", v4) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_knownHIDServices, "addObject:", v4);
    -[_GCControllerManager registerIPCObject:](self, "registerIPCObject:", v4);
    -[_GCControllerManager controllersQueue](self, "controllersQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51___GCControllerManagerAppClient_onHIDServiceAdded___block_invoke;
    block[3] = &unk_24D2B2B20;
    block[4] = self;
    dispatch_barrier_async(v5, block);

  }
}

- (void)onHIDServiceRemoved:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_knownHIDServices, "containsObject:"))
    -[NSMutableSet removeObject:](self->_knownHIDServices, "removeObject:", v4);

}

- (void)setProperty:(id)a3 forKey:(id)a4 forHIDServiceClientWithRegistryID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *hidSystemClientQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  hidSystemClientQueue = self->super._hidSystemClientQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __86___GCControllerManagerAppClient_setProperty_forKey_forHIDServiceClientWithRegistryID___block_invoke;
  v15[3] = &unk_24D2B51E8;
  v15[4] = self;
  v16 = v10;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(hidSystemClientQueue, v15);

}

- (void)startVideoRecording
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(getRPScreenRecorderClass(), "sharedRecorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52___GCControllerManagerAppClient_startVideoRecording__block_invoke;
  v4[3] = &unk_24D2B4308;
  v4[4] = self;
  objc_msgSend(v3, "startRecordingWithHandler:", v4);

}

- (void)stopVideoRecordingWithClipBuffering:(BOOL)a3 controller:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  GCPhotoVideoXPCProxyServiceRemoteServerInterface *photoVideoService;
  id v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  v6 = a4;
  +[NSBundle mainBundle](&off_254DF2768, "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForInfoDictionaryKey:", CFSTR("CFBundleDisplayName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[NSProcessInfo processInfo](&off_254DF29B0, "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "processName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  photoVideoService = self->_photoVideoService;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke;
  v12[3] = &unk_24D2B5260;
  v14 = a3;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  -[GCPhotoVideoXPCProxyServiceRemoteServerInterface generateURLFor:withReply:](photoVideoService, "generateURLFor:withReply:", v8, v12);

}

- (void)startBuffering
{
  void *v3;
  _QWORD v4[5];

  if (!self->_bufferingStartPending)
  {
    self->_bufferingStartPending = 1;
    objc_msgSend(getRPScreenRecorderClass(), "sharedRecorder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __47___GCControllerManagerAppClient_startBuffering__block_invoke;
    v4[3] = &unk_24D2B4308;
    v4[4] = self;
    objc_msgSend(v3, "startClipBufferingWithCompletionHandler:", v4);

  }
}

- (void)stopBuffering
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(getRPScreenRecorderClass(), "sharedRecorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46___GCControllerManagerAppClient_stopBuffering__block_invoke;
  v4[3] = &unk_24D2B4308;
  v4[4] = self;
  objc_msgSend(v3, "stopClipBufferingWithCompletionHandler:", v4);

}

- (void)startVideoRecordingBuffering
{
  if (-[_GCControllerManager isAppInBackground](self, "isAppInBackground"))
  {
    self->_shouldStartBufferingOnForeground = 1;
  }
  else if (!self->_bufferingStarted)
  {
    -[_GCControllerManagerAppClient startBuffering](self, "startBuffering");
  }
}

- (void)stopVideoRecordingBuffering
{
  if (self->_bufferingStarted)
    -[_GCControllerManagerAppClient stopBuffering](self, "stopBuffering");
}

- (void)onVideoRecordingToggledWithController:(id)a3 mode:(int64_t)a4
{
  id v6;
  void *v7;
  char v8;
  int isInternalBuild;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;

  v6 = a3;
  if (-[_GCControllerManager isAppInBackground](self, "isAppInBackground"))
    goto LABEL_20;
  if (!a4 && self->_bufferingStarted)
  {
    -[_GCControllerManagerAppClient stopBuffering](self, "stopBuffering");
    goto LABEL_20;
  }
  objc_msgSend(getRPScreenRecorderClass(), "sharedRecorder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isRecording");

  isInternalBuild = gc_isInternalBuild();
  if ((v8 & 1) != 0)
  {
    if (isInternalBuild)
    {
      getGCLogger();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[_GCControllerManagerAppClient onVideoRecordingToggledWithController:mode:].cold.1();

    }
    -[_GCControllerManagerAppClient stopVideoRecordingWithClipBuffering:controller:](self, "stopVideoRecordingWithClipBuffering:controller:", self->_bufferingStarted, v6);
    goto LABEL_20;
  }
  if (isInternalBuild)
  {
    getGCLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[_GCControllerManagerAppClient onVideoRecordingToggledWithController:mode:].cold.3();

    if (a4)
      goto LABEL_8;
LABEL_19:
    -[_GCControllerManagerAppClient startVideoRecording](self, "startVideoRecording");
    goto LABEL_20;
  }
  if (!a4)
    goto LABEL_19;
LABEL_8:
  if (a4 == 1)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[_GCControllerManagerAppClient onVideoRecordingToggledWithController:mode:].cold.2();

    }
    -[_GCControllerManagerAppClient startBuffering](self, "startBuffering");
  }
LABEL_20:

}

- (void)onScreenshotTriggeredWithController:(id)a3
{
  id v4;
  GCPhotoVideoXPCProxyServiceRemoteServerInterface *photoVideoService;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  photoVideoService = self->_photoVideoService;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69___GCControllerManagerAppClient_onScreenshotTriggeredWithController___block_invoke;
  v7[3] = &unk_24D2B4308;
  v8 = v4;
  v6 = v4;
  -[GCPhotoVideoXPCProxyServiceRemoteServerInterface takeScreenshotWithReply:](photoVideoService, "takeScreenshotWithReply:", v7);

}

- (id)serviceClientForIPCService:(id)a3
{
  if (&unk_254DEB658 == a3
    || &unk_254DD1190 == a3
    || &unk_254DEB2F8 == a3
    || &unk_254DD1298 == a3
    || &unk_254DEB6B8 == a3
    || &unk_254DD13B8 == a3
    || &unk_254DEAD28 == a3
    || &unk_254DD14C0 == a3
    || &unk_254DEACC8 == a3
    || &unk_254DD15D0 == a3
    || &unk_254DEB598 == a3
    || &unk_254DEAEA8 == a3
    || &unk_254DEB718 == a3
    || &unk_254DD16E0 == a3)
  {
    return self;
  }
  else
  {
    return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingStart, 0);
  objc_storeStrong((id *)&self->_hidEventObserver, 0);
  objc_storeStrong((id *)&self->_userDefaultsXPCProxyService, 0);
  objc_storeStrong((id *)&self->_systemGestureXPCProxyService, 0);
  objc_storeStrong((id *)&self->_gameIntentXPCProxyService, 0);
  objc_storeStrong((id *)&self->_photoVideoService, 0);
  objc_storeStrong((id *)&self->_batteryXPCProxyService, 0);
  objc_storeStrong((id *)&self->_motionXPCProxyService, 0);
  objc_storeStrong((id *)&self->_settingsXPCProxyService, 0);
  objc_storeStrong((id *)&self->_adaptiveTriggersXPCProxyService, 0);
  objc_storeStrong((id *)&self->_lightXPCProxyService, 0);
  objc_storeStrong((id *)&self->_playerIndicatorXPCProxyService, 0);
  objc_storeStrong((id *)&self->_controllerService, 0);
  objc_storeStrong(&self->_serverConnectionInterruption, 0);
  objc_storeStrong(&self->_serverConnectionInvalidation, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_customControllerIdentifiers, 0);
  objc_storeStrong((id *)&self->_serverValidControllerIdentifiers, 0);
  objc_storeStrong((id *)&self->_pendingControllers, 0);
  objc_storeStrong((id *)&self->_publishedControllers, 0);
  objc_storeStrong((id *)&self->_knownHIDServices, 0);
}

- (void)publishControllers:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __71___GCControllerManagerAppClient_ControllerService__publishControllers___block_invoke;
  activity_block[3] = &unk_24D2B2B48;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_215181000, "(Controller Service Client) Publish Controllers", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)unpublishControllersWithIdentifiers:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __88___GCControllerManagerAppClient_ControllerService__unpublishControllersWithIdentifiers___block_invoke;
  activity_block[3] = &unk_24D2B2B48;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_215181000, "(Controller Service Client) Unpublish Controllers", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)refreshControllers
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __70___GCControllerManagerAppClient_ControllerService__refreshControllers__block_invoke;
  activity_block[3] = &unk_24D2B2B20;
  activity_block[4] = self;
  _os_activity_initiate(&dword_215181000, "(Controller Service Client) Refresh Controllers", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (_GCIPCEndpointConnection)playerIndicatorXPCProxyServiceConnection
{
  return self->_serverConnection;
}

- (GCPlayerIndicatorXPCProxyServiceRemoteServerInterface)playerIndicatorXPCProxyServiceRemoteServer
{
  return self->_playerIndicatorXPCProxyService;
}

- (_GCIPCEndpointConnection)lightXPCProxyServiceConnection
{
  return self->_serverConnection;
}

- (GCLightXPCProxyServiceRemoteServerInterface)lightXPCProxyServiceRemoteServer
{
  return self->_lightXPCProxyService;
}

- (_GCIPCEndpointConnection)adaptiveTriggersXPCProxyServiceConnection
{
  return self->_serverConnection;
}

- (GCAdaptiveTriggersXPCProxyServiceRemoteServerInterface)adaptiveTriggersXPCProxyServiceRemoteServer
{
  return self->_adaptiveTriggersXPCProxyService;
}

- (_GCIPCEndpointConnection)motionXPCProxyServiceConnection
{
  return self->_serverConnection;
}

- (GCMotionXPCProxyServiceRemoteServerInterface)motionXPCProxyServiceRemoteServer
{
  return self->_motionXPCProxyService;
}

- (_GCIPCEndpointConnection)batteryXPCProxyServiceConnection
{
  return self->_serverConnection;
}

- (GCBatteryXPCProxyServiceRemoteServerInterface)batteryXPCProxyServiceRemoteServer
{
  return self->_batteryXPCProxyService;
}

- (_GCIPCEndpointConnection)settingsXPCProxyServiceConnection
{
  return self->_serverConnection;
}

- (GCSettingsXPCProxyServiceRemoteServerInterface)settingsXPCProxyServiceRemoteServer
{
  return self->_settingsXPCProxyService;
}

- (_GCIPCEndpointConnection)gameIntentXPCProxyServiceConnection
{
  return self->_serverConnection;
}

- (GCGameIntentXPCProxyServiceRemoteServerInterface)gameIntentXPCProxyServiceRemoteServer
{
  return self->_gameIntentXPCProxyService;
}

- (_GCIPCEndpointConnection)systemGestureXPCProxyServiceConnection
{
  return self->_serverConnection;
}

- (GCSystemGestureXPCProxyServiceRemoteServerInterface)systemGestureXPCProxyServiceRemoteServer
{
  return self->_systemGestureXPCProxyService;
}

- (void)observerDeliveryPolicyDidChange:(id)a3
{
  GCIPCOutgoingConnection *serverConnection;
  id v4;
  uint64_t v5;
  id v6;

  serverConnection = self->_serverConnection;
  v4 = a3;
  -[GCIPCOutgoingConnection remoteProxy](serverConnection, "remoteProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canReceiveEvents");

  objc_msgSend(v6, "clientCanReceiveEventsDidChange:", v5);
}

- (void)onVideoRecordingToggledWithController:mode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_1(&dword_215181000, v0, v1, "Requesting video recording end...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7_0();
}

- (void)onVideoRecordingToggledWithController:mode:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_1(&dword_215181000, v0, v1, "Unexpected call to startBuffering. it should be already started", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7_0();
}

- (void)onVideoRecordingToggledWithController:mode:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_1(&dword_215181000, v0, v1, "Requesting video recording start...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7_0();
}

@end
