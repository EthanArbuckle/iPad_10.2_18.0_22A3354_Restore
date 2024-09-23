@implementation MOSuggestionsUIServerManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __46__MOSuggestionsUIServerManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_shared;
}

void __46__MOSuggestionsUIServerManager_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_opt_new(*(_QWORD *)(a1 + 32));
  v2 = (void *)sharedInstance_shared;
  sharedInstance_shared = v1;

}

+ (id)getRemoteProcessIdentifier:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForEntitlement:", CFSTR("application-identifier")));
    v6 = v5;
    if ((!v5 || !-[__CFString length](v5, "length"))
      && (v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier")),
          v6,
          (v6 = (__CFString *)v7) == 0)
      || !-[__CFString length](v6, "length"))
    {

      v6 = &stru_1001EDF88;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%u"), v6, objc_msgSend(v4, "pid")));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)getConnectionIdentifier:(id)a3
{
  return objc_msgSend(a3, "userInfo");
}

- (MOSuggestionsUIServerManager)init
{
  MOSuggestionsUIServerManager *v2;
  uint64_t v3;
  NSMutableDictionary *clientConnections;
  uint64_t v5;
  NSMutableDictionary *connectionProperties;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MOSuggestionsUIServerManager;
  v2 = -[MOSuggestionsUIServerManager init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    clientConnections = v2->_clientConnections;
    v2->_clientConnections = (NSMutableDictionary *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    connectionProperties = v2->_connectionProperties;
    v2->_connectionProperties = (NSMutableDictionary *)v5;

    -[MOSuggestionsUIServerManager setupListener](v2, "setupListener");
    -[MOSuggestionsUIServerManager registerForLockNotifications](v2, "registerForLockNotifications");
    -[MOSuggestionsUIServerManager requestNotificationAuthIfNeeded](v2, "requestNotificationAuthIfNeeded");
    -[MOSuggestionsUIServerManager registerForLayoutMonitorForBackgroundStateNotifications](v2, "registerForLayoutMonitorForBackgroundStateNotifications");
  }
  return v2;
}

- (void)dealloc
{
  id os_log;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Invalidate connection listener", buf, 2u);
  }

  -[BSServiceConnectionListener invalidate](self->_connectionListener, "invalidate");
  -[FBSDisplayLayoutMonitor invalidate](self->_displayMonitor, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)MOSuggestionsUIServerManager;
  -[MOSuggestionsUIServerManager dealloc](&v5, "dealloc");
}

- (void)didConnectToSecureWindowWithSession:(id)a3 connectionId:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id os_log;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  int v29;
  void *v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    v12 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
      v29 = 138412290;
      v30 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Connected to window, client connection: %@", (uint8_t *)&v29, 0xCu);

    }
    v14 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectionProperties, "objectForKeyedSubscript:", v9));
    v15 = v14;
    if (v14)
    {
      -[NSObject setActivationState:](v14, "setActivationState:", 3);
      -[NSObject setSession:](v15, "setSession:", v8);
      -[NSObject setDelegate:](v15, "setDelegate:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject pendingPresentationOptions](v15, "pendingPresentationOptions"));

      if (v16)
      {
        v17 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          LOWORD(v29) = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Fulfilling previously unfulfillable presentation request", (uint8_t *)&v29, 2u);
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject delegate](v15, "delegate"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject pendingPresentationOptions](v15, "pendingPresentationOptions"));
        objc_msgSend(v19, "didReceivePresentationRequestWithOptions:", v20);
      }
      else
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject unfulfilledUpdateState](v15, "unfulfilledUpdateState"));

        if (!v24)
        {
LABEL_19:
          -[NSObject setPendingPresentationOptions:](v15, "setPendingPresentationOptions:", 0);
          -[NSObject setUnfulfilledUpdateState:](v15, "setUnfulfilledUpdateState:", 0);
          -[NSObject setUnfulfilledUpdateIsAnimated:](v15, "setUnfulfilledUpdateIsAnimated:", 0);
          goto LABEL_20;
        }
        v25 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          LOWORD(v29) = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Fulfilling previously unfulfillable update request", (uint8_t *)&v29, 2u);
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject delegate](v15, "delegate"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject unfulfilledUpdateState](v15, "unfulfilledUpdateState"));
        v27 = objc_msgSend(v20, "unsignedIntValue");
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject unfulfilledUpdateIsAnimated](v15, "unfulfilledUpdateIsAnimated"));
        objc_msgSend(v19, "didReceiveUpdateRequestWithState:animated:", v27, objc_msgSend(v28, "BOOLValue"));

      }
      goto LABEL_19;
    }
    v22 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[MOSuggestionsUIServerManager didConnectToSecureWindowWithSession:connectionId:delegate:].cold.2();

    -[MOSuggestionsUIServerManager destroyScene:](self, "destroyScene:", v8);
  }
  else
  {
    -[MOSuggestionsUIServerManager destroyScene:](self, "destroyScene:", v8);
    v21 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    v15 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[MOSuggestionsUIServerManager didConnectToSecureWindowWithSession:connectionId:delegate:].cold.1();
  }
LABEL_20:

}

- (void)didDisonnectToSecureWindowForConnectionId:(id)a3
{
  id v4;
  id os_log;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  MOSuggestionsConnectionProperties *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD block[4];
  id v19;
  dispatch_queue_t v20;
  id v21;
  uint8_t buf[4];
  void *v23;

  v4 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
      *(_DWORD *)buf = 138412290;
      v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ Disconnected from window.", buf, 0xCu);

    }
    v7 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectionProperties, "objectForKeyedSubscript:", v4));
    v9 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = (MOSuggestionsConnectionProperties *)v10;
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
        *(_DWORD *)buf = 138412290;
        v23 = v12;
        _os_log_impl((void *)&_mh_execute_header, &v11->super, OS_LOG_TYPE_INFO, "%@ Connection state clean-up.", buf, 0xCu);

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject session](v7, "session"));
      -[MOSuggestionsUIServerManager destroyScene:](self, "destroyScene:", v13);

      v11 = objc_opt_new(MOSuggestionsConnectionProperties);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject connectionHost](v7, "connectionHost"));
      -[MOSuggestionsConnectionProperties setConnectionHost:](v11, "setConnectionHost:", v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject responseQueue](v7, "responseQueue"));
      -[MOSuggestionsConnectionProperties setResponseQueue:](v11, "setResponseQueue:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject delegate](v7, "delegate"));
      -[MOSuggestionsConnectionProperties setDelegate:](v11, "setDelegate:", v16);

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_connectionProperties, "setObject:forKeyedSubscript:", v11, v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOSuggestionsConnectionProperties responseQueue](v11, "responseQueue"));
      if (v17)
      {
        objc_initWeak((id *)buf, self);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __74__MOSuggestionsUIServerManager_didDisonnectToSecureWindowForConnectionId___block_invoke;
        block[3] = &unk_1001E2CE0;
        objc_copyWeak(&v21, (id *)buf);
        v19 = v4;
        v20 = v17;
        dispatch_async(v20, block);

        objc_destroyWeak(&v21);
        objc_destroyWeak((id *)buf);
      }

    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[MOSuggestionsUIServerManager didDisonnectToSecureWindowForConnectionId:].cold.2();
    }

  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    -[MOSuggestionsUIServerManager didDisonnectToSecureWindowForConnectionId:].cold.1();
  }

}

void __74__MOSuggestionsUIServerManager_didDisonnectToSecureWindowForConnectionId___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getConnectionHostId:", *(_QWORD *)(a1 + 32)));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteTarget"));

  objc_msgSend(v5, "didReceiveStateUpdateRequest:", &off_1001EF9B0);
  v6 = *(NSObject **)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __74__MOSuggestionsUIServerManager_didDisonnectToSecureWindowForConnectionId___block_invoke_147;
  v7[3] = &unk_1001E2CB8;
  objc_copyWeak(&v9, v2);
  v8 = *(id *)(a1 + 32);
  dispatch_async(v6, v7);

  objc_destroyWeak(&v9);
}

void __74__MOSuggestionsUIServerManager_didDisonnectToSecureWindowForConnectionId___block_invoke_147(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "removeConnectionId:", *(_QWORD *)(a1 + 32));

}

- (void)onLockNotification
{
  int v3;
  id os_log;
  NSObject *v5;
  _BOOL4 v6;
  NSMutableDictionary *connectionProperties;
  _QWORD v8[5];
  uint8_t buf[16];

  v3 = SBSGetScreenLockStatus(0, a2);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Screen locked - terminating for view security", buf, 2u);
    }

    connectionProperties = self->_connectionProperties;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __50__MOSuggestionsUIServerManager_onLockNotification__block_invoke;
    v8[3] = &unk_1001E2D48;
    v8[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](connectionProperties, "enumerateKeysAndObjectsUsingBlock:", v8);
    -[FBSDisplayLayoutMonitor invalidate](self->_displayMonitor, "invalidate");
    exit(0);
  }
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Screen locked false positive - ignored queued event", buf, 2u);
  }

}

void __50__MOSuggestionsUIServerManager_onLockNotification__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "delegate"));
  objc_msgSend(v3, "getProxyFor:withBlock:", v4, &__block_literal_global);

}

void __50__MOSuggestionsUIServerManager_onLockNotification__block_invoke_2(id a1, MOSuggestionsUIClient *a2)
{
  -[MOSuggestionsUIClient didReceiveStateUpdateRequest:](a2, "didReceiveStateUpdateRequest:", &off_1001EF9B0);
}

- (void)registerForLayoutMonitorForBackgroundStateNotifications
{
  FBSDisplayLayoutMonitor *v3;
  FBSDisplayLayoutMonitor *displayMonitor;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor](FBSDisplayLayoutMonitorConfiguration, "configurationForDefaultMainDisplayMonitor"));
  objc_msgSend(v5, "setTransitionHandler:", &__block_literal_global_152);
  v3 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitor monitorWithConfiguration:](FBSDisplayLayoutMonitor, "monitorWithConfiguration:", v5));
  displayMonitor = self->_displayMonitor;
  self->_displayMonitor = v3;

}

void __87__MOSuggestionsUIServerManager_registerForLayoutMonitorForBackgroundStateNotifications__block_invoke(id a1, FBSDisplayLayoutMonitor *a2, FBSDisplayLayout *a3, FBSDisplayLayoutTransitionContext *a4)
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBSDisplayLayout elements](a3, "elements", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v8 = SBSDisplayLayoutElementAppSwitcherIdentifier;
    v9 = SBSDisplayLayoutElementHomeScreenIdentifier;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
        if (objc_msgSend(v12, "isEqualToString:", v8))
        {

        }
        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
          v14 = objc_msgSend(v13, "isEqualToString:", v9);

          if (!v14)
            continue;
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v15, "postNotificationName:object:", CFSTR("MOSuggestionSheetVideoPlaybackViewPlaybackShouldPause"), 0);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

}

- (void)registerForLockNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)checkLockedState_bounce, CFSTR("com.apple.mobile.keybagd.lock_status"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)requestNotificationAuthIfNeeded
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "onboardingStatus=%lu", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_9();
}

void __63__MOSuggestionsUIServerManager_requestNotificationAuthIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __63__MOSuggestionsUIServerManager_requestNotificationAuthIfNeeded__block_invoke_cold_1(v3);

  if (!objc_msgSend(v3, "authorizationStatus")
    && (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v6 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Authorization TCC prompt not yet sent and onboarding status >= getStarted", v8, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "requestAuthorizationWithOptions:completionHandler:", 7, &__block_literal_global_163);
  }

}

void __63__MOSuggestionsUIServerManager_requestNotificationAuthIfNeeded__block_invoke_161(id a1, BOOL a2, NSError *a3)
{
  _BOOL4 v3;
  NSError *v4;
  id os_log;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  NSError *v9;

  v3 = a2;
  v4 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109378;
    v7[1] = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Request notification authorization complete. granted=%u, error=%@", (uint8_t *)v7, 0x12u);
  }

}

- (void)setupListener
{
  void *v3;
  BSServiceConnectionListener *connectionListener;
  id v5;
  void *v6;
  id os_log;
  NSObject *v8;
  uint8_t v9[8];
  _QWORD v10[5];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __45__MOSuggestionsUIServerManager_setupListener__block_invoke;
  v10[3] = &unk_1001E2E18;
  v10[4] = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnectionListener listenerWithConfigurator:](BSServiceConnectionListener, "listenerWithConfigurator:", v10));
  objc_msgSend(v3, "activate");
  connectionListener = self->_connectionListener;
  self->_connectionListener = (BSServiceConnectionListener *)v3;
  v5 = v3;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance"));
  objc_msgSend(v6, "addObserver:", self);

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Endpoint ready and awaiting connections", v9, 2u);
  }

}

void __45__MOSuggestionsUIServerManager_setupListener__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setDomain:", CFSTR("com.apple.moments.ui-services"));
  objc_msgSend(v3, "setService:", CFSTR("com.apple.moments.ui-services.presenter"));
  objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 32));

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  id os_log;
  NSObject *v14;
  id v15;
  NSObject *v16;
  NSUUID *v17;
  id v18;
  unsigned int v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void **v32;
  uint64_t v33;
  void (*v34)(uint64_t, void *);
  void *v35;
  MOSuggestionsUIServerManager *v36;
  NSUUID *v37;
  id v38;
  id location;
  uint8_t buf[4];
  NSUUID *v41;
  __int16 v42;
  void *v43;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (listener_didReceiveConnection_withContext__onceToken != -1)
    dispatch_once(&listener_didReceiveConnection_withContext__onceToken, &__block_literal_global_172);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "remoteProcess"));
  v12 = objc_msgSend(v11, "pid");
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v41) = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Endpoint received new connection request -- pid:%d", buf, 8u);
  }

  objc_initWeak(&location, self);
  if (-[MOSuggestionsUIServerManager isConnectingProcessAuthorized:](self, "isConnectingProcessAuthorized:", v11))
  {
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[MOSuggestionsUIServerManager listener:didReceiveConnection:withContext:].cold.3();

    v32 = _NSConcreteStackBlock;
    v33 = 3221225472;
    v34 = __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke_238;
    v35 = &unk_1001E2EE8;
    v36 = self;
    v17 = objc_opt_new(NSUUID);
    v37 = v17;
    objc_copyWeak(&v38, &location);
    objc_msgSend(v9, "configureConnection:", &v32);
    v18 = objc_loadWeakRetained(&location);
    v19 = objc_msgSend(v18, "addConnection:withId:", v9, v17, v32, v33, v34, v35, v36);

    if (v19)
    {
      v20 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "remoteProcess"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[MOSuggestionsUIServerManager getRemoteProcessIdentifier:](MOSuggestionsUIServerManager, "getRemoteProcessIdentifier:", v30));
        *(_DWORD *)buf = 138412546;
        v41 = v17;
        v42 = 2112;
        v43 = v31;
        _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Activating connection: client:%@, id:%@", buf, 0x16u);

      }
      objc_msgSend(v9, "activate");
    }
    else
    {
      v24 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "remoteProcess"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[MOSuggestionsUIServerManager getRemoteProcessIdentifier:](MOSuggestionsUIServerManager, "getRemoteProcessIdentifier:", v26));
        -[MOSuggestionsUIServerManager listener:didReceiveConnection:withContext:].cold.2(v27, (uint64_t)buf, v25, v26);
      }

      objc_msgSend(v9, "invalidate");
    }
    v28 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      -[MOSuggestionsUIServerManager listener:didReceiveConnection:withContext:].cold.1();

    objc_destroyWeak(&v38);
  }
  else
  {
    v22 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[MOSuggestionsUIServerManager listener:didReceiveConnection:withContext:].cold.4();

    objc_msgSend(v9, "invalidate");
  }
  objc_destroyWeak(&location);

}

void __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke(id a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[BSMutableServiceInterface interfaceWithIdentifier:](BSMutableServiceInterface, "interfaceWithIdentifier:", CFSTR("com.apple.moments.ui-services.presenter")));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[BSObjCProtocol protocolForProtocol:](BSObjCProtocol, "protocolForProtocol:", &OBJC_PROTOCOL___MOSuggestionsUIServer));
  objc_msgSend(v5, "setServer:", v1);

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BSObjCProtocol protocolForProtocol:](BSObjCProtocol, "protocolForProtocol:", &OBJC_PROTOCOL___MOSuggestionsUIClient));
  objc_msgSend(v5, "setClient:", v2);

  objc_msgSend(v5, "setClientMessagingExpectation:", 1);
  v3 = objc_msgSend(v5, "copy");
  v4 = (void *)listener_didReceiveConnection_withContext____interface;
  listener_didReceiveConnection_withContext____interface = (uint64_t)v3;

}

void __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke_238(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  objc_msgSend(v3, "setTargetQueue:", &_dispatch_main_q);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceQuality userInitiated](BSServiceQuality, "userInitiated"));
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend(v3, "setInterface:", listener_didReceiveConnection_withContext____interface);
  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setUserInfo:", *(_QWORD *)(a1 + 40));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke_2;
  v10[3] = &unk_1001E2E80;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  objc_msgSend(v3, "setInvalidationHandler:", v10);
  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke_242;
  v8 = &unk_1001E2E80;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  objc_msgSend(v3, "setInterruptionHandler:", &v5);
  objc_msgSend(v3, "setActivationHandler:", &__block_literal_global_244, v5, v6, v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);

}

void __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  id WeakRetained;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke_2_cold_1((uint64_t)v3);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "removeConnection:", v3);

}

void __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke_242(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  id WeakRetained;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke_242_cold_1((uint64_t)v3);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "removeConnection:", v3);

}

void __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke_243(id a1, BSServiceConnectionContext *a2)
{
  BSServiceConnectionContext *v2;
  id os_log;
  NSObject *v4;

  v2 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke_243_cold_1((uint64_t)v2);

}

- (BOOL)isConnectingProcessAuthorized:(id)a3
{
  id v3;
  void *v4;
  id os_log;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  id v13;
  NSObject *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  unsigned __int8 v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  void *v30;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForEntitlement:", CFSTR("com.apple.developer.journal.allow")));
  if (v4)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
      *(_DWORD *)buf = 138412802;
      v26 = v7;
      v27 = 1024;
      v28 = objc_msgSend(v3, "pid");
      v29 = 2112;
      v30 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Connection BundleID=%@ pid=%d API entitlements=%@", buf, 0x1Cu);

    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "isEqualToString:", CFSTR("suggestions"), (_QWORD)v20) & 1) != 0)
          {

            v18 = 1;
            goto LABEL_17;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v10)
          continue;
        break;
      }
    }

  }
  v13 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
    v16 = objc_msgSend(v3, "pid");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForEntitlement:", CFSTR("com.apple.moments.allowSuggestions")));
    *(_DWORD *)buf = 138412802;
    v26 = v15;
    v27 = 1024;
    v28 = v16;
    v29 = 2112;
    v30 = v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Connection BundleID=%@ pid=%d valueFor=%@", buf, 0x1Cu);

  }
  v18 = objc_msgSend(v3, "hasEntitlement:", CFSTR("com.apple.moments.allowSuggestions"));
LABEL_17:

  return v18;
}

- (BOOL)addConnection:(id)a3 withId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  void *v13;
  NSMutableSet *v14;
  MOSuggestionsConnectionProperties *v15;
  void *v16;
  id v17;
  dispatch_queue_attr_t v18;
  NSObject *v19;
  dispatch_queue_attr_t v20;
  NSObject *v21;
  id v22;
  dispatch_queue_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id os_log;
  NSObject *v29;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteProcess"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MOSuggestionsUIServerManager getRemoteProcessIdentifier:](MOSuggestionsUIServerManager, "getRemoteProcessIdentifier:", v8));

  if (v6)
    v10 = v9 == 0;
  else
    v10 = 1;
  v11 = v10 || v7 == 0;
  v12 = !v11;
  if (v11)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    v29 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[MOSuggestionsUIServerManager addConnection:withId:].cold.1();

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_clientConnections, "objectForKeyedSubscript:", v9));

    if (!v13)
    {
      v14 = objc_opt_new(NSMutableSet);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_clientConnections, "setObject:forKeyedSubscript:", v14, v9);

    }
    v15 = objc_opt_new(MOSuggestionsConnectionProperties);
    -[MOSuggestionsConnectionProperties setConnectionHost:](v15, "setConnectionHost:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteProcess"));
    v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bundleIdentifier"));

    if (!v17)
      v17 = v9;
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_USER_INITIATED, 0);
    v21 = objc_claimAutoreleasedReturnValue(v20);

    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("RSP:%@"), v17)));
    v23 = dispatch_queue_create((const char *)objc_msgSend(v22, "UTF8String"), v21);
    -[MOSuggestionsConnectionProperties setResponseQueue:](v15, "setResponseQueue:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_clientConnections, "objectForKeyedSubscript:", v9));
    objc_msgSend(v24, "addObject:", v7);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_connectionProperties, "setObject:forKeyedSubscript:", v15, v7);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MOApprovedApplicationsManager sharedInstance](MOApprovedApplicationsManager, "sharedInstance"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteProcess"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bundleIdentifier"));
    objc_msgSend(v25, "registerApplicationsForDataAccess:", v27);

  }
  return v12;
}

- (void)destroyScene:(id)a3
{
  id v3;
  id os_log;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  void *v11;

  v3 = a3;
  if (v3)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    v5 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(destroyScene) destroying scene %@", buf, 0xCu);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __45__MOSuggestionsUIServerManager_destroyScene___block_invoke;
    v8[3] = &unk_1001E2F10;
    v9 = v3;
    objc_msgSend(v7, "requestSceneSessionDestruction:options:errorHandler:", v9, 0, v8);

  }
}

void __45__MOSuggestionsUIServerManager_destroyScene___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __45__MOSuggestionsUIServerManager_destroyScene___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "description"));
    v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(destroyScene) Successfully destroyed scene %@", (uint8_t *)&v8, 0xCu);

  }
}

- (void)removeConnectionId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id os_log;
  NSObject *v12;
  void *v13;
  NSMutableDictionary *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectionProperties, "objectForKeyedSubscript:", v4));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOSuggestionsUIServerManager getConnectionHostId:](self, "getConnectionHostId:", v4));
      objc_msgSend(v6, "invalidate");

      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "session"));
      -[MOSuggestionsUIServerManager destroyScene:](self, "destroyScene:", v7);

      -[NSMutableDictionary removeObjectForKey:](self->_connectionProperties, "removeObjectForKey:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectionHost"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "remoteProcess"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MOSuggestionsUIServerManager getRemoteProcessIdentifier:](MOSuggestionsUIServerManager, "getRemoteProcessIdentifier:", v9));

      if (v10)
      {
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
        v12 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v27 = v4;
          v28 = 2112;
          v29 = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Connection '%@' removed for '%@'", buf, 0x16u);
        }

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_clientConnections, "objectForKeyedSubscript:", v10));
        objc_msgSend(v13, "removeObject:", v4);

        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v14 = self->_clientConnections;
        v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v22;
LABEL_8:
          v18 = 0;
          while (1)
          {
            if (*(_QWORD *)v22 != v17)
              objc_enumerationMutation(v14);
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_clientConnections, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v18), (_QWORD)v21));
            v20 = objc_msgSend(v19, "count");

            if (v20)
              break;
            if (v16 == (id)++v18)
            {
              v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
              if (v16)
                goto LABEL_8;
              break;
            }
          }
        }

      }
    }

  }
}

- (void)removeConnection:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[MOSuggestionsUIServerManager getConnectionIdentifier:](MOSuggestionsUIServerManager, "getConnectionIdentifier:", a3));
  -[MOSuggestionsUIServerManager removeConnectionId:](self, "removeConnectionId:", v4);

}

- (id)getPropertiesForConnection:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOSuggestionsUIServerManager getConnectionIdentifier:](MOSuggestionsUIServerManager, "getConnectionIdentifier:", a3));
  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectionProperties, "objectForKeyedSubscript:", v4));
  else
    v5 = 0;

  return v5;
}

- (BOOL)isVisibleClient:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id os_log;
  NSObject *v14;
  BOOL v15;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  id v24;
  __int16 v25;
  _BOOL4 v26;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v3, "pid")));
    v18 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessHandle handleForIdentifier:error:](RBSProcessHandle, "handleForIdentifier:error:", v5, &v18));
    v7 = v18;

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentState"));
    v9 = objc_msgSend(v8, "taskState");

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentState"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endowmentNamespaces"));
    v12 = objc_msgSend(v11, "containsObject:", CFSTR("com.apple.frontboard.visibility"));

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    v14 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[MOSuggestionsUIServerManager getRemoteProcessIdentifier:](MOSuggestionsUIServerManager, "getRemoteProcessIdentifier:", v4));
      *(_DWORD *)buf = 138413058;
      v20 = v17;
      v21 = 1024;
      v22 = v12;
      v23 = 2112;
      v24 = v7;
      v25 = 1024;
      v26 = v9 == 4;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Query client %@ visible=%u (error=%@) isRunning=%u", buf, 0x22u);

    }
    if (v9 == 4)
      v15 = v12;
    else
      v15 = 0;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)getConnectionHostId:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectionProperties, "objectForKeyedSubscript:"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectionHost"));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)getConnectionPropertiesForId:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_connectionProperties, "objectForKeyedSubscript:"));
  else
    return 0;
}

- (id)getAnyVisibleClientId
{
  NSMutableDictionary *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->_connectionProperties;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOSuggestionsUIServerManager getConnectionHostId:](self, "getConnectionHostId:", v8, (_QWORD)v14));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "remoteProcess"));
        v11 = -[MOSuggestionsUIServerManager isVisibleClient:](self, "isVisibleClient:", v10);

        if ((v11 & 1) != 0)
        {
          v12 = v8;
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (id)getClientConnectionPropertiesFor:(id)a3
{
  id v4;
  NSMutableDictionary *connectionProperties;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  connectionProperties = self->_connectionProperties;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __65__MOSuggestionsUIServerManager_getClientConnectionPropertiesFor___block_invoke;
  v9[3] = &unk_1001E2F38;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](connectionProperties, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __65__MOSuggestionsUIServerManager_getClientConnectionPropertiesFor___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
  v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

- (id)getClientRemoteProcessFor:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOSuggestionsUIServerManager getClientConnectionPropertiesFor:](self, "getClientConnectionPropertiesFor:"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectionHost"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteProcess"));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)getClientIdentifierFor:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOSuggestionsUIServerManager getClientRemoteProcessFor:](self, "getClientRemoteProcessFor:", a3));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
    if (!v5)
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", CFSTR("application-identifier")));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)getClientBundleIdentifierFor:(id)a3
{
  void *v3;
  id os_log;
  NSObject *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOSuggestionsUIServerManager getClientRemoteProcessFor:](self, "getClientRemoteProcessFor:", a3));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[MOSuggestionsUIServerManager getClientBundleIdentifierFor:].cold.1(v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
  return v6;
}

- (id)getClientProxyFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id os_log;
  NSObject *v9;
  id v10;
  NSObject *v11;
  uint8_t v13[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOSuggestionsUIServerManager getClientConnectionPropertiesFor:](self, "getClientConnectionPropertiesFor:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectionHost"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteTarget"));

  if (!v7)
  {
    if (v5 && (objc_msgSend(v5, "brokenPipeState") & 1) == 0)
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
      v9 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[MOSuggestionsUIServerManager getClientProxyFor:].cold.1();

      objc_msgSend(v5, "setBrokenPipeState:", 1);
    }
    objc_msgSend(v4, "didReceiveUpdateRequestWithState:animated:", 0, 1);
  }
  if (v5 && objc_msgSend(v5, "brokenPipeState"))
  {
    v10 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Remote proxy target restored", v13, 2u);
    }

    objc_msgSend(v5, "setBrokenPipeState:", 0);
  }

  return v7;
}

- (void)getProxyFor:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id os_log;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOSuggestionsUIServerManager getClientConnectionPropertiesFor:](self, "getClientConnectionPropertiesFor:", v6));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "responseQueue"));
  if (v9)
  {
    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __54__MOSuggestionsUIServerManager_getProxyFor_withBlock___block_invoke;
    v12[3] = &unk_1001E2F60;
    objc_copyWeak(&v15, &location);
    v13 = v6;
    v14 = v7;
    dispatch_async(v9, v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else if (v8)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    v11 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MOSuggestionsUIServerManager getProxyFor:withBlock:].cold.1(v8, v11);

  }
}

void __54__MOSuggestionsUIServerManager_getProxyFor_withBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getClientProxyFor:", *(_QWORD *)(a1 + 32)));

  v3 = v4;
  if (v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v3 = v4;
  }

}

- (BOOL)isClientVisibleFor:(id)a3
{
  id v4;
  id os_log;
  NSObject *v6;
  void *v7;
  unint64_t v8;
  id v10;
  NSMutableDictionary *v11;
  unsigned __int8 v12;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v4 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[MOSuggestionsUIServerManager isClientVisibleFor:].cold.2();

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MOOnboardingManager sharedInstance](MOOnboardingManager, "sharedInstance"));
  v8 = (unint64_t)objc_msgSend(v7, "onboardingFlowCompletionStatus");

  if (v8 > 4 || ((1 << v8) & 0x13) == 0)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = self->_connectionProperties;
    v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v11);
          v18 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOSuggestionsUIServerManager getConnectionHostId:](self, "getConnectionHostId:", v18, (_QWORD)v25));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "remoteProcess"));
          v21 = -[MOSuggestionsUIServerManager isVisibleClient:](self, "isVisibleClient:", v20);

          if ((v21 & 1) != 0)
          {
            v12 = v18 != 0;
            goto LABEL_10;
          }
        }
        v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v15)
          continue;
        break;
      }
    }

    v22 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[MOSuggestionsUIServerManager getClientConnectionPropertiesFor:](self, "getClientConnectionPropertiesFor:", v4));
    v11 = v22;
    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary connectionHost](v22, "connectionHost"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "remoteProcess"));
      v12 = -[MOSuggestionsUIServerManager isVisibleClient:](self, "isVisibleClient:", v24);

      goto LABEL_10;
    }
  }
  else
  {
    v10 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(&v11->super.super, OS_LOG_TYPE_DEBUG))
      -[MOSuggestionsUIServerManager isClientVisibleFor:].cold.1();
  }
  v12 = 0;
LABEL_10:

  return v12;
}

- (void)requestPickerForSceneIdentiyToken:(id)a3 withOptions:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id os_log;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  UIWindowSceneActivationRequestOptions *v28;
  id v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  NSObject *v38;
  _QWORD v39[4];
  id v40;
  const __CFString *v41;
  void *v42;
  uint8_t buf[4];
  void *v44;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](BSServiceConnection, "currentContext"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MOSuggestionsUIServerManager getConnectionIdentifier:](MOSuggestionsUIServerManager, "getConnectionIdentifier:", v9));

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[MOSuggestionsUIServerManager requestPickerForSceneIdentiyToken:withOptions:].cold.3();

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](BSServiceConnection, "currentContext"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOSuggestionsUIServerManager getPropertiesForConnection:](self, "getPropertiesForConnection:", v13));

  if (!v14)
  {
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MOSuggestionsUIServerManager requestPickerForSceneIdentiyToken:withOptions:].cold.2();

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOSuggestionsUIServerManager.m"), 650, CFSTR("unexpected picker request from untracked connection (in %s:%d)"), "-[MOSuggestionsUIServerManager requestPickerForSceneIdentiyToken:withOptions:]", 650);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sceneIdentityToken"));

  if (v18)
  {
    v19 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[MOSuggestionsUIServerManager requestPickerForSceneIdentiyToken:withOptions:].cold.1(v14, v20);
  }
  else
  {
    objc_msgSend(v14, "setSceneIdentityToken:", v7);
    objc_msgSend(v14, "setActivationState:", 2);
    v21 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringRepresentation"));
      *(_DWORD *)buf = 138412290;
      v44 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Activating new scene with token=%@", buf, 0xCu);

    }
    v20 = objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", CFSTR("com.apple.MomentsUIService.clientContext"));
    v41 = CFSTR("connectionId");
    v42 = v10;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
    -[NSObject setUserInfo:](v20, "setUserInfo:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject userInfo](v20, "userInfo"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "allKeys"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v26));
    -[NSObject setRequiredUserInfoKeys:](v20, "setRequiredUserInfoKeys:", v27);

    v28 = objc_opt_new(UIWindowSceneActivationRequestOptions);
    v29 = objc_msgSend(objc_alloc((Class)_UIWindowSceneOverlayPlacement), "initWithTargetSceneIdentity:", v7);
    -[UIWindowSceneActivationRequestOptions setPlacement:](v28, "setPlacement:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = __78__MOSuggestionsUIServerManager_requestPickerForSceneIdentiyToken_withOptions___block_invoke;
    v39[3] = &unk_1001E2F10;
    v40 = v14;
    objc_msgSend(v30, "requestSceneSessionActivation:userActivity:options:errorHandler:", 0, v20, v28, v39);

  }
  v31 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  v32 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sceneIdentityToken"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "stringRepresentation"));
    *(_DWORD *)buf = 138412290;
    v44 = v34;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Received picker presentation request with token=%@", buf, 0xCu);

  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "session"));

  if (v35)
  {
    v36 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "delegate"));
    objc_msgSend(v36, "didReceivePresentationRequestWithOptions:", v8);
  }
  else
  {
    v37 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "View is not ready to accept presentations.", buf, 2u);
    }

    v36 = objc_msgSend(v8, "copy");
    objc_msgSend(v14, "setPendingPresentationOptions:", v36);
  }

}

void __78__MOSuggestionsUIServerManager_requestPickerForSceneIdentiyToken_withOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setSceneIdentityToken:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setActivationState:", 0);
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    v5 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __78__MOSuggestionsUIServerManager_requestPickerForSceneIdentiyToken_withOptions___block_invoke_cold_1();

  }
}

- (void)updatePickerState:(id)a3 animated:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id os_log;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](BSServiceConnection, "currentContext"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOSuggestionsUIServerManager getPropertiesForConnection:](self, "getPropertiesForConnection:", v9));

  if (!v10)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MOSuggestionsUIServerManager updatePickerState:animated:].cold.3();

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOSuggestionsUIServerManager.m"), 694, CFSTR("unexpected picker request from untracked connection (in %s:%d)"), "-[MOSuggestionsUIServerManager updatePickerState:animated:]", 694);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "session"));

  if (v14)
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
    objc_msgSend(v15, "didReceiveUpdateRequestWithState:animated:", objc_msgSend(v7, "unsignedIntValue"), objc_msgSend(v8, "BOOLValue"));
  }
  else
  {
    v16 = objc_msgSend(v10, "activationState");
    v17 = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = v18;
    if (v16 == (id)2)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[MOSuggestionsUIServerManager updatePickerState:animated:].cold.1();

      v20 = objc_msgSend(v7, "copy");
      objc_msgSend(v10, "setUnfulfilledUpdateState:", v20);

      v15 = objc_msgSend(v8, "copy");
      objc_msgSend(v10, "setUnfulfilledUpdateIsAnimated:", v15);
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[MOSuggestionsUIServerManager updatePickerState:animated:].cold.2();

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = __59__MOSuggestionsUIServerManager_updatePickerState_animated___block_invoke;
      v22[3] = &unk_1001E2F88;
      v23 = v10;
      -[MOSuggestionsUIServerManager getProxyFor:withBlock:](self, "getProxyFor:withBlock:", v21, v22);

      v15 = v23;
    }
  }

}

void __59__MOSuggestionsUIServerManager_updatePickerState_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "currentViewState")));
  objc_msgSend(v3, "didReceiveStateUpdateRequest:", v4);

}

- (void)launch
{
  id os_log;
  NSObject *v3;
  uint8_t v4[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Called angel launch specifically", v4, 2u);
  }

}

- (void)terminate
{
  id os_log;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Terminating Angel connection", v9, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](BSServiceConnection, "currentContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOSuggestionsUIServerManager getPropertiesForConnection:](self, "getPropertiesForConnection:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connectionHost"));
  objc_msgSend(v7, "invalidate");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](BSServiceConnection, "currentContext"));
  -[MOSuggestionsUIServerManager removeConnection:](self, "removeConnection:", v8);

}

- (void)fetchAssets:(id)a3 withTypes:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id os_log;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "suggestionIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));
    *(_DWORD *)buf = 138412290;
    v25 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "(Legacy) server, fetching suggestion assets for suggestion id=%@", buf, 0xCu);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](BSServiceConnection, "currentContext"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOSuggestionsUIServerManager getPropertiesForConnection:](self, "getPropertiesForConnection:", v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "delegate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "requestedTypes"));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __65__MOSuggestionsUIServerManager_fetchAssets_withTypes_completion___block_invoke;
  v21[3] = &unk_1001E2FB0;
  v22 = v8;
  v23 = v9;
  v19 = v9;
  v20 = v8;
  objc_msgSend(v17, "willReturnAssetsForSuggestion:withTypes:completion:", v20, v18, v21);

}

void __65__MOSuggestionsUIServerManager_fetchAssets_withTypes_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  int v10;
  void *v11;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "baseBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
    v10 = 138412290;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "fetchAssets:withTypes:completion completing with assets for suggestion: %@", (uint8_t *)&v10, 0xCu);

  }
  v8 = *(_QWORD *)(a1 + 40);
  v9 = objc_msgSend(v3, "copy");

  (*(void (**)(uint64_t, id, _QWORD))(v8 + 16))(v8, v9, 0);
}

- (void)fetchAssets:(id)a3 withTypes:(id)a4 onAssetsCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  id os_log;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "suggestionIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));
    *(_DWORD *)buf = 138412290;
    v25 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, " server, fetching suggestion assets for suggestion id=%@", buf, 0xCu);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](BSServiceConnection, "currentContext"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOSuggestionsUIServerManager getPropertiesForConnection:](self, "getPropertiesForConnection:", v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "delegate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "requestedTypes"));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __71__MOSuggestionsUIServerManager_fetchAssets_withTypes_onAssetsCallback___block_invoke;
  v21[3] = &unk_1001E2FD8;
  v22 = v8;
  v23 = v9;
  v19 = v9;
  v20 = v8;
  objc_msgSend(v17, "willReturnAssetsForSuggestion:withTypes:onAssetsCallback:", v20, v18, v21);

}

void __71__MOSuggestionsUIServerManager_fetchAssets_withTypes_onAssetsCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "baseBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
    v10 = 138412290;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "fetchAssets:withTypes:onAssetsCallback completing with assets for suggestion: %@", (uint8_t *)&v10, 0xCu);

  }
  v8 = (void *)objc_opt_new(MOSuggestionAssetsArrayTransport);
  v9 = objc_msgSend(v3, "copy");

  objc_msgSend(v8, "setAssets:", v9);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)cancelSheet:(id)a3
{
  -[MOSuggestionsUIServerManager getProxyFor:withBlock:](self, "getProxyFor:withBlock:", a3, &__block_literal_global_284);
}

void __44__MOSuggestionsUIServerManager_cancelSheet___block_invoke(id a1, MOSuggestionsUIClient *a2)
{
  -[MOSuggestionsUIClient sheetCancelled](a2, "sheetCancelled");
}

- (void)showBlankComposeView:(id)a3
{
  -[MOSuggestionsUIServerManager getProxyFor:withBlock:](self, "getProxyFor:withBlock:", a3, &__block_literal_global_285);
}

void __53__MOSuggestionsUIServerManager_showBlankComposeView___block_invoke(id a1, MOSuggestionsUIClient *a2)
{
  -[MOSuggestionsUIClient showBlankComposeView](a2, "showBlankComposeView");
}

- (void)performTask:(unint64_t)a3 suggestion:(id)a4 sender:(id)a5
{
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __62__MOSuggestionsUIServerManager_performTask_suggestion_sender___block_invoke;
  v9[3] = &unk_1001E3040;
  v10 = a4;
  v11 = a3;
  v8 = v10;
  -[MOSuggestionsUIServerManager getProxyFor:withBlock:](self, "getProxyFor:withBlock:", a5, v9);

}

void __62__MOSuggestionsUIServerManager_performTask_suggestion_sender___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  void *v6;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __62__MOSuggestionsUIServerManager_performTask_suggestion_sender___block_invoke_cold_1(a1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40)));
  objc_msgSend(v3, "performTask:suggestion:", v6, *(_QWORD *)(a1 + 32));

}

- (void)sendSuggestionSheetStateUpdate:(unint64_t)a3 sender:(id)a4
{
  id v6;
  void *v7;
  id os_log;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOSuggestionsUIServerManager getClientConnectionPropertiesFor:](self, "getClientConnectionPropertiesFor:", v6));
  if (objc_msgSend(v7, "currentViewState") != (id)a3)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[MOSuggestionsUIServerManager sendSuggestionSheetStateUpdate:sender:].cold.1(a3, v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    objc_msgSend(v7, "setCurrentViewState:", a3);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __70__MOSuggestionsUIServerManager_sendSuggestionSheetStateUpdate_sender___block_invoke;
    v12[3] = &unk_1001E2F88;
    v13 = v10;
    v11 = v10;
    -[MOSuggestionsUIServerManager getProxyFor:withBlock:](self, "getProxyFor:withBlock:", v6, v12);

  }
}

id __70__MOSuggestionsUIServerManager_sendSuggestionSheetStateUpdate_sender___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didReceiveStateUpdateRequest:", *(_QWORD *)(a1 + 32));
}

- (void)grantSandboxAccessFor:(id)a3 sender:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "path"));
  v8 = APP_SANDBOX_READ;
  v9 = objc_msgSend(v7, "fileSystemRepresentation");
  v10 = sandbox_extension_issue_file(v8, v9, SANDBOX_EXTENSION_DEFAULT);
  if (v10)
  {
    v11 = (void *)v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v10));
    free(v11);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __61__MOSuggestionsUIServerManager_grantSandboxAccessFor_sender___block_invoke;
    v14[3] = &unk_1001E2F88;
    v15 = v12;
    v13 = v12;
    -[MOSuggestionsUIServerManager getProxyFor:withBlock:](self, "getProxyFor:withBlock:", v6, v14);

  }
}

id __61__MOSuggestionsUIServerManager_grantSandboxAccessFor_sender___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didGrantSandboxAccessFor:", *(_QWORD *)(a1 + 32));
}

- (void)processManager:(id)a3 didRemoveProcess:(id)a4
{
  id v5;
  NSMutableDictionary *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned int v13;
  id os_log;
  NSObject *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];

  v5 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_connectionProperties;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOSuggestionsUIServerManager getConnectionHostId:](self, "getConnectionHostId:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), (_QWORD)v17));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "remoteProcess"));

        if (v12)
        {
          v13 = objc_msgSend(v5, "pid");
          if (v13 == objc_msgSend(v12, "pid"))
          {
            os_log = _mo_log_facility_get_os_log(&MOLogFacilityUIService);
            v15 = objc_claimAutoreleasedReturnValue(os_log);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(+[MOSuggestionsUIServerManager getRemoteProcessIdentifier:](MOSuggestionsUIServerManager, "getRemoteProcessIdentifier:", v12));
              *(_DWORD *)buf = 138412290;
              v22 = v16;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Client process has ended id=%@", buf, 0xCu);

            }
            goto LABEL_14;
          }
        }

      }
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_14:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_connectionProperties, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
}

- (void)didConnectToSecureWindowWithSession:connectionId:delegate:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_4();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Could not link new scene to client connection", v1, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)didConnectToSecureWindowWithSession:connectionId:delegate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "Could not link new scene, client connection missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)didDisonnectToSecureWindowForConnectionId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "Secure window disconnection from nil connection, ignoring.)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)didDisonnectToSecureWindowForConnectionId:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "Disconnected from secure window after client dropped", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __63__MOSuggestionsUIServerManager_requestNotificationAuthIfNeeded__block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "authorizationStatus");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v1, v2, "UNNotificationSettings auth status=%lu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_6();
}

- (void)listener:didReceiveConnection:withContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "Activating Connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)listener:(NSObject *)a3 didReceiveConnection:(void *)a4 withContext:.cold.2(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5((void *)&_mh_execute_header, a3, (uint64_t)a3, "Can't add new connection, clientId:%@", (uint8_t *)a2);

}

- (void)listener:didReceiveConnection:withContext:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "Caller is entitled ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)listener:didReceiveConnection:withContext:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5((void *)&_mh_execute_header, v0, v1, "'%{public}@' is not entitled!", v2);
  OUTLINED_FUNCTION_9();
}

void __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[MOSuggestionsUIServerManager getConnectionIdentifier:](MOSuggestionsUIServerManager, "getConnectionIdentifier:", a1));
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v2, v3, "Connection invalid - %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

void __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke_242_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[MOSuggestionsUIServerManager getConnectionIdentifier:](MOSuggestionsUIServerManager, "getConnectionIdentifier:", a1));
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v2, v3, "Connection interrupted - %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

void __74__MOSuggestionsUIServerManager_listener_didReceiveConnection_withContext___block_invoke_243_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[MOSuggestionsUIServerManager getConnectionIdentifier:](MOSuggestionsUIServerManager, "getConnectionIdentifier:", a1));
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v2, v3, "Connection active - %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)addConnection:withId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "Can't add connection: Can't get proper client identity", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __45__MOSuggestionsUIServerManager_destroyScene___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5((void *)&_mh_execute_header, v0, v1, "(destroyScene) Error de-activating scene: %@", v2);
  OUTLINED_FUNCTION_9();
}

- (void)getClientBundleIdentifierFor:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "bundleIdentifier"));
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v2, v3, "Remote bundle identifier: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)getClientProxyFor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "Lost remote proxy target", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getProxyFor:(void *)a1 withBlock:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "connectionHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteProcess"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MOSuggestionsUIServerManager getRemoteProcessIdentifier:](MOSuggestionsUIServerManager, "getRemoteProcessIdentifier:", v4));
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5((void *)&_mh_execute_header, a2, v6, "Can't send message to %@", v7);

  OUTLINED_FUNCTION_8();
}

- (void)isClientVisibleFor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "Rejecting clients visibility due onboarding status", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)isClientVisibleFor:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "MOSuggestionsUIServerManager:clientsVisible:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)requestPickerForSceneIdentiyToken:(void *)a1 withOptions:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  unsigned int v4;
  void *v5;
  const __CFString *v6;
  _DWORD v7[2];
  __int16 v8;
  const __CFString *v9;

  v4 = objc_msgSend(a1, "activationState");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "session"));
  v6 = CFSTR("Y");
  if (!v5)
    v6 = CFSTR("N");
  v7[0] = 67109378;
  v7[1] = v4;
  v8 = 2112;
  v9 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "client activation = %u, session=%@", (uint8_t *)v7, 0x12u);

  OUTLINED_FUNCTION_8();
}

- (void)requestPickerForSceneIdentiyToken:withOptions:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11((void *)&_mh_execute_header, v0, v1, "unexpected picker request from untracked connection (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)requestPickerForSceneIdentiyToken:withOptions:.cold.3()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](BSServiceConnection, "currentContext"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "remoteProcess"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MOSuggestionsUIServerManager getRemoteProcessIdentifier:](MOSuggestionsUIServerManager, "getRemoteProcessIdentifier:", v1));
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v2, v3, "requestPickerForSceneIdentiyToken from %@-%@", v4, v5, v6, v7, 2u);

}

void __78__MOSuggestionsUIServerManager_requestPickerForSceneIdentiyToken_withOptions___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5((void *)&_mh_execute_header, v0, v1, "Error activating scene: %@", v2);
  OUTLINED_FUNCTION_9();
}

- (void)updatePickerState:animated:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "View is getting ready to accept updates.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updatePickerState:animated:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "View is out of sync, updating client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updatePickerState:animated:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11((void *)&_mh_execute_header, v0, v1, "unexpected picker request from untracked connection (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __62__MOSuggestionsUIServerManager_performTask_suggestion_sender___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "baseBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "bundleIdentifier"));
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v2, v3, "server, requesting client to perform task %lu for suggestion %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_8();
}

- (void)sendSuggestionSheetStateUpdate:(int)a1 sender:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "server, acknowledging state transition to %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_2();
}

@end
