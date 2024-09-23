@implementation CADServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  CADAuditTokenTCCPermissionChecker *v10;
  ClientConnection *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  ClientConnection *v16;
  CADAuditTokenTCCPermissionChecker *v18;
  id v19;
  _QWORD v20[5];
  ClientConnection *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id location;
  id buf[2];
  _OWORD v31[3];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(MEMORY[0x1E0D0C3D0], "isRunningAsSetupUser");
  if (v8)
  {
    v9 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B6A18000, v9, OS_LOG_TYPE_ERROR, "Rejecting XPC connection because we are running as the setup user", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    -[NSLock lock](self->_connectionLock, "lock");
    v10 = [CADAuditTokenTCCPermissionChecker alloc];
    v19 = v6;
    if (v7)
      objc_msgSend(v7, "auditToken");
    else
      memset(v31, 0, 32);
    v18 = -[CADAuditTokenTCCPermissionChecker initWithAuditToken:](v10, "initWithAuditToken:", v31);
    v11 = -[ClientConnection initWithXPCConnection:tccPermissionChecker:]([ClientConnection alloc], "initWithXPCConnection:tccPermissionChecker:", v7, v18);
    objc_initWeak(buf, self);
    objc_initWeak(&location, v11);
    v12 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __48__CADServer_listener_shouldAcceptNewConnection___block_invoke;
    v26[3] = &unk_1E6A37D38;
    objc_copyWeak(&v27, buf);
    objc_copyWeak(&v28, &location);
    objc_msgSend(v7, "setInterruptionHandler:", v26);
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __48__CADServer_listener_shouldAcceptNewConnection___block_invoke_23;
    v23[3] = &unk_1E6A37D38;
    objc_copyWeak(&v24, buf);
    objc_copyWeak(&v25, &location);
    objc_msgSend(v7, "setInvalidationHandler:", v23);
    -[NSMutableSet addObject:](self->_clientConnections, "addObject:", v11);
    -[NSLock unlock](self->_connectionLock, "unlock");
    -[ClientConnection cadOperationProxy](v11, "cadOperationProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    GetSharedXPCInterfaceForCADInterface();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedObject:", v13);
    objc_msgSend(v7, "setExportedInterface:", v14);
    GetSharedXPCInterfaceForCADClientInterface();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v15);

    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __48__CADServer_listener_shouldAcceptNewConnection___block_invoke_24;
    v20[3] = &unk_1E6A378B0;
    v20[4] = self;
    v16 = v11;
    v21 = v16;
    v22 = v7;
    -[CADServer initiateAuthenticationForAppProtectionForClientConnection:completion:](self, "initiateAuthenticationForAppProtectionForClientConnection:completion:", v16, v20);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    objc_destroyWeak(buf);

    v6 = v19;
  }

  return v8 ^ 1;
}

void __38__CADServer__registerForNotifications__block_invoke(uint64_t a1, xpc_object_t xdict)
{
  const char *string;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  char *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81298]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", string, 1);
  v24 = (char *)objc_claimAutoreleasedReturnValue();
  v4 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v31 = string;
    _os_log_impl(&dword_1B6A18000, v4, OS_LOG_TYPE_DEBUG, "Beginning XPC transaction for com.apple.notifyd.matching notification named %s", buf, 0xCu);
  }
  v23 = (void *)os_transaction_create();
  if (!strcmp(string, (const char *)objc_msgSend((id)*MEMORY[0x1E0D0C4B8], "UTF8String")))
  {
    v7 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v7, OS_LOG_TYPE_INFO, "SignificantTimeChangeNotification fired", buf, 2u);
    }
    _CalTimeZoneForceUpdate();
    objc_msgSend(*(id *)(a1 + 32), "_trimExtendAndUpdateOccurrenceCache:", 0);
    goto LABEL_28;
  }
  if (!strcmp(string, "com.apple.mobilecal.timezonechanged"))
  {
    _CalTimeZoneForceUpdate();
    objc_msgSend(*(id *)(a1 + 32), "_trimExtendAndUpdateOccurrenceCache:", 0);
    v5 = CADLogHandle;
    if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v6 = "Reloading widget timeline because the timeZone or timeZoneOverride changed";
LABEL_26:
    _os_log_impl(&dword_1B6A18000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    goto LABEL_27;
  }
  if (!strcmp(string, "com.apple.mobilecal.preference.notification.overlayCalendarID"))
  {
    v5 = CADLogHandle;
    if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v6 = "Reloading widget timeline because the alternate calendar (overlay calendar) changed";
    goto LABEL_26;
  }
  if (!strcmp(string, (const char *)objc_msgSend((id)*MEMORY[0x1E0D0C460], "UTF8String")))
  {
    v8 = (void *)EKWeakLinkClass();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "performSelector:", sel_sharedListener);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v9, "performSelector:", sel_reset);

    }
    goto LABEL_28;
  }
  if (!strcmp(string, "com.apple.mobilecal.preference.notification.weekStart"))
  {
    v5 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Reloading widget timeline because of change in weekStart preference";
      goto LABEL_26;
    }
LABEL_27:
    objc_msgSend(MEMORY[0x1E0D0C408], "refreshEventWidgets");
    objc_msgSend(MEMORY[0x1E0D0C408], "refreshDateWidgets");
    goto LABEL_28;
  }
  if (!strcmp(string, "com.apple.mobile.keybagd.first_unlock"))
  {
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(NSObject **)(v20 + 80);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__CADServer__registerForNotifications__block_invoke_62;
    block[3] = &unk_1E6A373A8;
    block[4] = v20;
    dispatch_async(v21, block);
  }
  else
  {
    if (strcmp(string, "com.apple.eventkit.preference.notification.UnselectedCalendarIdentifiersForFocusMode"))
    {
      if (strcmp(string, "com.apple.accessibility.prefers.horizontal.text"))
        goto LABEL_28;
      v5 = CADLogHandle;
      if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      *(_WORD *)buf = 0;
      v6 = "Reloading widget timeline because AXSPrefersHorizontalTextLayout changed";
      goto LABEL_26;
    }
    CalDatabaseRequestApplicationSnapshotUpdateWithRateLimiter();
    v22 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v22, OS_LOG_TYPE_DEFAULT, "Reloading widget timeline because focus configuration changed", buf, 2u);
    }
    CalDatabaseRequestWidgetRefreshWithRateLimiter();
  }
LABEL_28:
  v10 = CADServerLogHandle;
  if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6A18000, v10, OS_LOG_TYPE_DEFAULT, "Forwarding darwin notifications to modules.", buf, 2u);
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "modules");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v16, "receivedNotificationNamed:", v24);
        v17 = CADServerLogHandle;
        if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v31 = v24;
          v32 = 2112;
          v33 = v16;
          _os_log_impl(&dword_1B6A18000, v17, OS_LOG_TYPE_DEFAULT, "Forwarded darwin notification named: %{public}@ to module: %@.", buf, 0x16u);
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v13);
  }

  v18 = CADServerLogHandle;
  if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6A18000, v18, OS_LOG_TYPE_DEFAULT, "Finished forwarding darwin notifications to modules.", buf, 2u);
  }
  v19 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v31 = string;
    _os_log_impl(&dword_1B6A18000, v19, OS_LOG_TYPE_DEBUG, "Ending XPC transaction for com.apple.notifyd.matching notification named %s", buf, 0xCu);
  }

}

- (NSArray)modules
{
  return self->_modules;
}

- (CADServer)init
{
  return -[CADServer initWithModules:](self, "initWithModules:", MEMORY[0x1E0C9AA60]);
}

- (CADServer)initWithModules:(id)a3
{
  id v4;
  CADServer *v5;
  void *v6;
  uint64_t v7;
  CADServer *v8;
  NSObject *v9;
  id v10;
  const char *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  NSLock *v14;
  NSLock *connectionLock;
  NSMutableSet *v16;
  NSMutableSet *clientConnections;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *initDataFirstUnlockQueue;
  dispatch_queue_t v22;
  OS_dispatch_queue *xpcQueue;
  xpc_connection_t mach_service;
  OS_xpc_object *xpcConnection;
  _xpc_connection_s *v26;
  id *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  dispatch_queue_t v31;
  id v32;
  NSObject *v33;
  dispatch_queue_t v34;
  id v35;
  uint64_t v36;
  id v37;
  NSObject *v38;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, void *);
  void *v43;
  id *v44;
  _QWORD block[4];
  CADServer *v46;
  objc_super v47;
  uint8_t buf[4];
  CADServer *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)CADServer;
  v5 = -[CADServer init](&v47, sel_init);
  if (v5)
  {
    v6 = (void *)os_transaction_create();
    v7 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__CADServer_initWithModules___block_invoke;
    block[3] = &unk_1E6A373A8;
    v8 = v5;
    v46 = v8;
    if (initWithModules__onceToken != -1)
      dispatch_once(&initWithModules__onceToken, block);
    CADLogInitIfNeeded();
    v9 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v8;
      _os_log_impl(&dword_1B6A18000, v9, OS_LOG_TYPE_DEBUG, "Server launch sequence commencing.  Server: [%@]", buf, 0xCu);
    }
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (const char *)objc_msgSend(v10, "UTF8String");

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create(v11, v12);
    -[CADServer setWorkQueue:](v8, "setWorkQueue:", v13);

    -[CADServer _setUpSignalHandlers](v8, "_setUpSignalHandlers");
    v14 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    connectionLock = v8->_connectionLock;
    v8->_connectionLock = v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    clientConnections = v8->_clientConnections;
    v8->_clientConnections = v16;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)DefaultCalendarChanged, (CFStringRef)*MEMORY[0x1E0D0BEB8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)SystemLanguageChanged, CFSTR("com.apple.language.changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("_CADDaemonStartedNotification"), 0, 0, 1u);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("initDataFirstUnlockQueue", v19);
    initDataFirstUnlockQueue = v8->_initDataFirstUnlockQueue;
    v8->_initDataFirstUnlockQueue = (OS_dispatch_queue *)v20;

    v22 = dispatch_queue_create("com.apple.calaccessd.xpcqueue", 0);
    xpcQueue = v8->_xpcQueue;
    v8->_xpcQueue = (OS_dispatch_queue *)v22;

    mach_service = xpc_connection_create_mach_service("com.apple.calaccessd.xpc", (dispatch_queue_t)v8->_xpcQueue, 1uLL);
    xpcConnection = v8->_xpcConnection;
    v8->_xpcConnection = mach_service;

    v26 = v8->_xpcConnection;
    v40 = v7;
    v41 = 3221225472;
    v42 = __29__CADServer_initWithModules___block_invoke_6;
    v43 = &unk_1E6A37D10;
    v27 = v8;
    v44 = v27;
    xpc_connection_set_event_handler(v26, &v40);
    v28 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v28, OS_LOG_TYPE_INFO, "25534103: Registering for notifications!", buf, 2u);
    }
    if (objc_msgSend(MEMORY[0x1E0D0C3D0], "isRunningAsSetupUser", v40, v41, v42, v43))
    {
      v29 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6A18000, v29, OS_LOG_TYPE_DEFAULT, "Not loading modules because we are running as the setup user", buf, 2u);
      }
    }
    else
    {
      objc_msgSend(v27, "setModules:", v4);
    }
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = dispatch_queue_create("com.apple.calaccessd.notificationqueue", v30);
    v32 = v27[1];
    v27[1] = v31;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = dispatch_queue_create("com.apple.calaccessd.alarm", v33);
    v35 = v27[14];
    v27[14] = v34;

    objc_msgSend(v27, "_registerMaintenanceActivities");
    v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.calaccessd"));
    v37 = v27[3];
    v27[3] = (id)v36;

    objc_msgSend(v27[3], "setDelegate:", v27);
    v38 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v49 = (CADServer *)v27;
      _os_log_impl(&dword_1B6A18000, v38, OS_LOG_TYPE_DEBUG, "Server launch sequence complete.  Server: [%@]", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0D0C2E0], "addObserver:selector:name:", v27, sel__handleDatabaseChanged, *MEMORY[0x1E0D0BE60]);

  }
  return v5;
}

void __29__CADServer_initWithModules___block_invoke()
{
  const char *v0;
  objc_class *v1;
  os_log_t v2;
  void *v3;
  id v4;

  v0 = CADCalendarLogSubsystem;
  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v2 = os_log_create(v0, (const char *)objc_msgSend(v4, "UTF8String"));
  v3 = (void *)CADServerLogHandle;
  CADServerLogHandle = (uint64_t)v2;

}

void __29__CADServer_initWithModules___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (object_getClass(v3) == (Class)MEMORY[0x1E0C812E0])
    objc_msgSend(*(id *)(a1 + 32), "_handleXPCConnection:", v3);

}

- (void)dealloc
{
  OS_xpc_object *xpcConnection;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v5;
  objc_super v6;

  -[CADServer _tearDownSignalHandlers](self, "_tearDownSignalHandlers");
  -[NSXPCListener invalidate](self->_NSXPCListener, "invalidate");
  -[NSXPCListener setDelegate:](self->_NSXPCListener, "setDelegate:", 0);
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
    xpc_connection_cancel(xpcConnection);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0, (CFNotificationName)*MEMORY[0x1E0D0BEB8], 0);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, 0, CFSTR("com.apple.language.changed"), 0);
  v6.receiver = self;
  v6.super_class = (Class)CADServer;
  -[CADServer dealloc](&v6, sel_dealloc);
}

- (void)activate
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *initDataFirstUnlockQueue;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD block[5];
  uint8_t buf[16];

  v3 = CADServerLogHandle;
  if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_DEFAULT, "Server activation requested.", buf, 2u);
  }
  -[CADServer workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__CADServer_activate__block_invoke;
  block[3] = &unk_1E6A373A8;
  block[4] = self;
  dispatch_sync(v4, block);

  if (objc_msgSend(MEMORY[0x1E0D0C2D8], "hasBeenUnlockedSinceBoot"))
  {
    initDataFirstUnlockQueue = self->_initDataFirstUnlockQueue;
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __21__CADServer_activate__block_invoke_20;
    v8[3] = &unk_1E6A373A8;
    v8[4] = self;
    dispatch_async(initDataFirstUnlockQueue, v8);
  }
  else
  {
    v7 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v7, OS_LOG_TYPE_INFO, "The database is inaccessible.  Will not finish initialization until it becomes accessible.", buf, 2u);
    }
  }
}

void __21__CADServer_activate__block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isActive");
  v3 = CADServerLogHandle;
  v4 = os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_DEFAULT, "Server is already active. No activation tasks to perform as a result.", buf, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_DEFAULT, "Performing server activation tasks.", buf, 2u);
    }
    xpc_connection_resume(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 32));
    v5 = CADServerLogHandle;
    if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      *(_DWORD *)buf = 138412290;
      v25 = v6;
      _os_log_impl(&dword_1B6A18000, v5, OS_LOG_TYPE_DEFAULT, "Resumed XPC connection: %@.", buf, 0xCu);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "resume");
    v7 = CADServerLogHandle;
    if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138412290;
      v25 = v8;
      _os_log_impl(&dword_1B6A18000, v7, OS_LOG_TYPE_DEFAULT, "Resumed XPC listener: %@.", buf, 0xCu);
    }
    v9 = CADServerLogHandle;
    if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v9, OS_LOG_TYPE_DEFAULT, "Activating modules.", buf, 2u);
    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v18 = a1;
    objc_msgSend(*(id *)(a1 + 32), "modules");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v15, "activate");
          v16 = CADServerLogHandle;
          if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v15;
            _os_log_impl(&dword_1B6A18000, v16, OS_LOG_TYPE_DEFAULT, "Activated module: %@.", buf, 0xCu);
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    v17 = CADServerLogHandle;
    if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v17, OS_LOG_TYPE_DEFAULT, "Finished activating modules.", buf, 2u);
    }
    objc_msgSend(*(id *)(v18 + 32), "_registerForAlarmEvents");
    objc_msgSend(*(id *)(v18 + 32), "_registerForNotifications");
    objc_msgSend(*(id *)(v18 + 32), "setActive:", 1);
  }
}

uint64_t __21__CADServer_activate__block_invoke_20(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_protectedDataDidBecomeAvailable");
}

- (void)deactivate
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = CADServerLogHandle;
  if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_DEFAULT, "Deactivating server.", buf, 2u);
  }
  -[CADServer workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__CADServer_deactivate__block_invoke;
  block[3] = &unk_1E6A373A8;
  block[4] = self;
  dispatch_sync(v4, block);

}

void __23__CADServer_deactivate__block_invoke(uint64_t a1)
{
  char v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  xpc_connection_t *v18;
  NSObject *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isActive");
  v3 = CADServerLogHandle;
  v4 = os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT);
  if ((v2 & 1) != 0)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_DEFAULT, "Performing server deactivation tasks.", buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_tearDownSignalHandlers");
    v5 = CADServerLogHandle;
    if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v5, OS_LOG_TYPE_DEFAULT, "Tore down signal handlers.", buf, 2u);
    }
    v6 = CADServerLogHandle;
    if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v6, OS_LOG_TYPE_DEFAULT, "Deactivating modules.", buf, 2u);
    }
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "modules");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v8)
    {
      v10 = v8;
      v11 = *(_QWORD *)v23;
      *(_QWORD *)&v9 = 138412290;
      v21 = v9;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v13, "deactivate", v21);
          v14 = CADServerLogHandle;
          if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v21;
            v27 = v13;
            _os_log_impl(&dword_1B6A18000, v14, OS_LOG_TYPE_DEFAULT, "Deactivated module: %@.", buf, 0xCu);
          }
        }
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      }
      while (v10);
    }

    v15 = CADServerLogHandle;
    if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v15, OS_LOG_TYPE_DEFAULT, "Finished deactivating modules.", buf, 2u);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "suspend");
    v16 = CADServerLogHandle;
    if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138412290;
      v27 = v17;
      _os_log_impl(&dword_1B6A18000, v16, OS_LOG_TYPE_DEFAULT, "Suspended XPC listener: %@.", buf, 0xCu);
    }
    v18 = *(xpc_connection_t **)(a1 + 32);
    if (v18[4])
    {
      xpc_connection_suspend(v18[4]);
      v19 = CADServerLogHandle;
      if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
        *(_DWORD *)buf = 138412290;
        v27 = v20;
        _os_log_impl(&dword_1B6A18000, v19, OS_LOG_TYPE_DEFAULT, "Suspended XPC connection: %@.", buf, 0xCu);
      }
      v18 = *(xpc_connection_t **)(a1 + 32);
    }
    -[xpc_connection_t setActive:](v18, "setActive:", 0);
  }
  else if (v4)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_DEFAULT, "Server is already inactive. No deactivation tasks to perform as a result.", buf, 2u);
  }
}

void __48__CADServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    v4 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "identity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "pid");
      objc_msgSend(v3, "identity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "clientName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = 67109378;
      v10[1] = v7;
      v11 = 2112;
      v12 = v9;
      _os_log_impl(&dword_1B6A18000, v5, OS_LOG_TYPE_ERROR, "Connection from process %i (%@) was interrupted unexpectedly", (uint8_t *)v10, 0x12u);

    }
    objc_msgSend(v3, "releaseProxy");
    if (WeakRetained)
      objc_msgSend(WeakRetained, "_clientConnectionDied:", v3);
  }

}

void __48__CADServer_listener_shouldAcceptNewConnection___block_invoke_23(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    v4 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      v5 = v4;
      objc_msgSend(v3, "identity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "pid");
      objc_msgSend(v3, "identity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "clientName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = 67109378;
      v10[1] = v7;
      v11 = 2112;
      v12 = v9;
      _os_log_impl(&dword_1B6A18000, v5, OS_LOG_TYPE_INFO, "Client disconnected: %i (%@)", (uint8_t *)v10, 0x12u);

    }
    objc_msgSend(v3, "releaseProxy");
    if (WeakRetained)
      objc_msgSend(WeakRetained, "_clientConnectionDied:", v3);
  }

}

void __48__CADServer_listener_shouldAcceptNewConnection___block_invoke_24(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__CADServer_listener_shouldAcceptNewConnection___block_invoke_2;
  v3[3] = &unk_1E6A373A8;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "initiateReminderAuthenticationForAppProtectionForClientConnection:completion:", v2, v3);

}

uint64_t __48__CADServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resume");
}

- (void)_handleDatabaseChanged
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_connectionLock, "lock");
  v3 = (void *)-[NSMutableSet copy](self->_clientConnections, "copy");
  -[NSLock unlock](self->_connectionLock, "unlock");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "handleDatabaseChanged", (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_clientConnectionDied:(id)a3
{
  NSLock *connectionLock;
  id v5;

  connectionLock = self->_connectionLock;
  v5 = a3;
  -[NSLock lock](connectionLock, "lock");
  -[NSMutableSet removeObject:](self->_clientConnections, "removeObject:", v5);

  -[NSLock unlock](self->_connectionLock, "unlock");
}

- (void)_handleXPCConnection:(id)a3
{
  _xpc_connection_s *v3;
  pid_t pid;
  void *v5;
  _xpc_connection_s *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _xpc_connection_s *v10;
  _OWORD buffer[16];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (_xpc_connection_s *)a3;
  pid = xpc_connection_get_pid(v3);
  memset(buffer, 0, sizeof(buffer));
  if (proc_name(pid, buffer, 0x100u))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buffer);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__CADServer__handleXPCConnection___block_invoke;
  v8[3] = &unk_1E6A37D60;
  v9 = v5;
  v10 = v3;
  v6 = v3;
  v7 = v5;
  xpc_connection_set_event_handler(v6, v8);
  xpc_connection_resume(v6);

}

void __34__CADServer__handleXPCConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  Class Class;
  const char *string;
  size_t v8;
  int v9;
  int64_t int64;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __CFArray *ArrayOfRecordIDsFromXPCArray;
  __CFArray *v20;
  xpc_object_t reply;
  xpc_object_t xdict;

  v3 = a2;
  v4 = v3;
  if (v3 != (id)MEMORY[0x1E0C81258] && v3 != (id)MEMORY[0x1E0C81260])
  {
    xdict = v3;
    Class = object_getClass(v3);
    v4 = xdict;
    if (Class == (Class)MEMORY[0x1E0C812F8])
    {
      string = xpc_dictionary_get_string(xdict, "function");
      v8 = strlen(string);
      v9 = strncmp(string, "postchangenote", v8);
      v4 = xdict;
      if (!v9)
      {
        int64 = xpc_dictionary_get_int64(xdict, "changeType");
        xpc_dictionary_get_int64(xdict, "changeReason");
        v11 = xpc_dictionary_get_string(xdict, "clientName");
        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = 0;
        }
        v13 = xpc_dictionary_get_string(xdict, "databasePath");
        if (v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(MEMORY[0x1E0D0BB30], "changeTrackingForDatabaseWithPath:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              xpc_dictionary_get_value(xdict, "changes");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              xpc_dictionary_get_value(xdict, "deletes");
              v17 = objc_claimAutoreleasedReturnValue();
              v18 = (void *)v17;
              if (v16 && v17)
              {
                ArrayOfRecordIDsFromXPCArray = createArrayOfRecordIDsFromXPCArray(v16);
                v20 = createArrayOfRecordIDsFromXPCArray(v18);
                objc_msgSend(v15, "addChangeset:deletes:clientID:changeType:", ArrayOfRecordIDsFromXPCArray, v20, 0, int64);
                CFRelease(ArrayOfRecordIDsFromXPCArray);
                CFRelease(v20);
              }
              else
              {
                objc_msgSend(v15, "clearAllChangesets");
              }

            }
            goto LABEL_20;
          }
        }
        else
        {
          v14 = 0;
        }
        v15 = 0;
LABEL_20:
        xpc_dictionary_get_BOOL(xdict, "postnotificationsynchronously");
        _CalDatabasePostDBOrSyncStatusChangeNotification();
        reply = xpc_dictionary_create_reply(xdict);
        xpc_dictionary_set_BOOL(reply, "notificationwasposted", 1);
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), reply);

        v4 = xdict;
      }
    }
  }

}

- (void)_finishInitializationWithDataAvailable
{
  NSObject *v2;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  if (self->_initializationFinished)
  {
    v2 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B6A18000, v2, OS_LOG_TYPE_DEFAULT, "Initialization already finished; not doing it again",
        v5,
        2u);
    }
  }
  else
  {
    self->_initializationFinished = 1;
    v4 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v4, OS_LOG_TYPE_DEFAULT, "Finishing initialization with data available", buf, 2u);
    }
    -[CADServer _migrateIfNeeded](self, "_migrateIfNeeded");
    -[CADServer _setupBirthdayListener](self, "_setupBirthdayListener");
  }
}

- (void)_protectedDataDidBecomeAvailable
{
  NSObject *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[8];
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_INFO, "Protected data is now available.", buf, 2u);
  }
  -[CADServer _finishInitializationWithDataAvailable](self, "_finishInitializationWithDataAvailable");
  -[NSLock lock](self->_connectionLock, "lock");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_clientConnections;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v8++), "clearCachedAuthorizationStatus");
      }
      while (v6 != v8);
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v6);
  }

  -[NSLock unlock](self->_connectionLock, "unlock");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CADServer modules](self, "modules", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "protectedDataDidBecomeAvailable");
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
    }
    while (v11);
  }

}

- (void)_migrateIfNeeded
{
  NSObject *v2;
  NSObject *v3;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_UTILITY, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v3 = dispatch_queue_create("migrationQ", attr);
  dispatch_async(v3, &__block_literal_global_23);

}

- (void)initiateAuthenticationForAppProtectionForClientConnection:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  void (**v15)(_QWORD);
  _OWORD v16[2];

  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  objc_msgSend(v5, "permissionValidator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "hasCalendarTCCBypassEntitlement") & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v5, "permissionValidator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "testingAccessLevelGranted");

  if (v9)
  {
LABEL_6:
    v6[2](v6);
    goto LABEL_9;
  }
  +[CADDefaultAppProtectionGuard shared](CADDefaultAppProtectionGuard, "shared");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D0C468];
  objc_msgSend(v5, "identity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "auditToken");
  else
    memset(v16, 0, sizeof(v16));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__CADServer_initiateAuthenticationForAppProtectionForClientConnection_completion___block_invoke;
  v14[3] = &unk_1E6A36758;
  v15 = v6;
  objc_msgSend(v10, "initiateAuthenticationForApplicationWithBundleIdentifier:onBehalfOfProcessWithAuditToken:accessGrantedByEntitlement:completion:", v11, v16, 0, v14);

LABEL_9:
}

uint64_t __82__CADServer_initiateAuthenticationForAppProtectionForClientConnection_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)initiateReminderAuthenticationForAppProtectionForClientConnection:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(_QWORD);
  _OWORD v15[2];

  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  objc_msgSend(v5, "permissionValidator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowsIntegrations");

  if ((v8 & 1) != 0)
  {
    +[CADDefaultAppProtectionGuard shared](CADDefaultAppProtectionGuard, "shared");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0D0C510];
    objc_msgSend(v5, "identity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      objc_msgSend(v11, "auditToken");
    else
      memset(v15, 0, sizeof(v15));
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __90__CADServer_initiateReminderAuthenticationForAppProtectionForClientConnection_completion___block_invoke;
    v13[3] = &unk_1E6A36758;
    v14 = v6;
    objc_msgSend(v9, "initiateAuthenticationForApplicationWithBundleIdentifier:onBehalfOfProcessWithAuditToken:accessGrantedByEntitlement:completion:", v10, v15, 1, v13);

  }
  else
  {
    v6[2](v6);
  }

}

uint64_t __90__CADServer_initiateReminderAuthenticationForAppProtectionForClientConnection_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_setUpSignalHandlers
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  signal(15, (void (__cdecl *)(int))1);
  signal(3, (void (__cdecl *)(int))1);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_initWeak(&location, self);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0C398]), "initWithSignal:", 15);
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __33__CADServer__setUpSignalHandlers__block_invoke;
  v15[3] = &unk_1E6A37D88;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v4, "setFireBlock:", v15);
  objc_msgSend(v3, "addObject:", v4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0C398]), "initWithSignal:", 3);
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __33__CADServer__setUpSignalHandlers__block_invoke_43;
  v13[3] = &unk_1E6A37D88;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v6, "setFireBlock:", v13);
  objc_msgSend(v3, "addObject:", v6);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0C398]), "initWithSignal:", 29);
  v8 = v5;
  v9 = 3221225472;
  v10 = __33__CADServer__setUpSignalHandlers__block_invoke_44;
  v11 = &unk_1E6A37D88;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v7, "setFireBlock:", &v8);
  objc_msgSend(v3, "addObject:", v7, v8, v9, v10, v11);
  objc_storeStrong((id *)&self->_signalSensors, v3);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_47);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

void __33__CADServer__setUpSignalHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B6A18000, v2, OS_LOG_TYPE_DEBUG, "Received SIGTERM", v3, 2u);
  }
  objc_msgSend(WeakRetained, "_deactivateAndExit");

}

void __33__CADServer__setUpSignalHandlers__block_invoke_43(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B6A18000, v2, OS_LOG_TYPE_DEBUG, "Received SIGQUIT", v3, 2u);
  }
  objc_msgSend(WeakRetained, "_deactivateAndExit");

}

void __33__CADServer__setUpSignalHandlers__block_invoke_44(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B6A18000, v2, OS_LOG_TYPE_DEBUG, "Received SIGINFO.", v3, 2u);
  }
  objc_msgSend(WeakRetained, "_dumpState");

}

void __33__CADServer__setUpSignalHandlers__block_invoke_45(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_DEBUG, "Starting sensor: [%@]", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend(v2, "startSensor");
  v4 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl(&dword_1B6A18000, v4, OS_LOG_TYPE_DEBUG, "Started sensor: [%@]", (uint8_t *)&v5, 0xCu);
  }

}

- (void)_tearDownSignalHandlers
{
  NSArray *signalSensors;

  -[NSArray enumerateObjectsUsingBlock:](self->_signalSensors, "enumerateObjectsUsingBlock:", &__block_literal_global_48);
  signalSensors = self->_signalSensors;
  self->_signalSensors = 0;

}

void __36__CADServer__tearDownSignalHandlers__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_DEBUG, "Stopping sensor: [%@]", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(v2, "stopSensor");

}

- (void)_trimExtendAndUpdateOccurrenceCache:(BOOL)a3
{
  NSObject *v3;
  uint8_t buf[16];

  v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_INFO, "25534103: Trim and extend caches", buf, 2u);
  }
  CalDatabaseEnumerateDatabases();
}

void __49__CADServer__trimExtendAndUpdateOccurrenceCache___block_invoke()
{
  uint64_t v0;
  const void *v1;

  v0 = CalDatabaseCopyEventOccurrenceCache();
  if (v0)
  {
    v1 = (const void *)v0;
    CalEventOccurrenceCacheTrimExtendAndUpdate();
    CFRelease(v1);
  }
}

- (void)_registerForNotifications
{
  NSObject *v3;
  NSObject *notificationQueue;
  _QWORD handler[5];
  uint8_t buf[16];

  v3 = CADServerLogHandle;
  if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_DEFAULT, "Registering for notifications", buf, 2u);
  }
  notificationQueue = self->_notificationQueue;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __38__CADServer__registerForNotifications__block_invoke;
  handler[3] = &unk_1E6A37D10;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", notificationQueue, handler);
}

uint64_t __38__CADServer__registerForNotifications__block_invoke_62(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_protectedDataDidBecomeAvailable");
}

- (void)_registerForAlarmEvents
{
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD handler[5];
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = CADServerLogHandle;
  if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_DEFAULT, "Registering for alarm events.", buf, 2u);
  }
  v4 = (const char *)*MEMORY[0x1E0D0C450];
  -[CADServer alarmQueue](self, "alarmQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __36__CADServer__registerForAlarmEvents__block_invoke;
  handler[3] = &unk_1E6A37D10;
  handler[4] = self;
  xpc_set_event_stream_handler(v4, v5, handler);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CADServer modules](self, "modules", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "didRegisterForAlarms");
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v8);
  }

}

void __36__CADServer__registerForAlarmEvents__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)os_transaction_create();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E0C81298]));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (_block_invoke_onceToken != -1)
    dispatch_once(&_block_invoke_onceToken, &__block_literal_global_66);
  v17 = (void *)v5;
  objc_msgSend((id)_block_invoke_dateFormatter, "stringFromDate:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = CADServerLogHandle;
  if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v24 = v6;
    v25 = 2114;
    v26 = v7;
    _os_log_impl(&dword_1B6A18000, v8, OS_LOG_TYPE_DEFAULT, "Alarm triggered with name: %{public}@. Triggered date: %{public}@.", buf, 0x16u);
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "modules", v7);
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
        objc_msgSend(v14, "receivedAlarmNamed:", v6);
        v15 = CADServerLogHandle;
        if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v24 = v6;
          v25 = 2112;
          v26 = (uint64_t)v14;
          _os_log_impl(&dword_1B6A18000, v15, OS_LOG_TYPE_DEFAULT, "Forwarded alarm named: %@ to module: %@.", buf, 0x16u);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

uint64_t __36__CADServer__registerForAlarmEvents__block_invoke_2()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_block_invoke_dateFormatter;
  _block_invoke_dateFormatter = (uint64_t)v0;

  return objc_msgSend((id)_block_invoke_dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSS"));
}

- (void)_registerMaintenanceActivities
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_INFO, "Registering maintenance activities.", v4, 2u);
  }
  -[CADServer _registerForDatabaseCleanup](self, "_registerForDatabaseCleanup");
  -[CADServer _registerForAnalyticsCollection](self, "_registerForAnalyticsCollection");
  -[CADServer _registerForAttachmentCleanup](self, "_registerForAttachmentCleanup");
  -[CADServer _registerForChangeTableCleanup](self, "_registerForChangeTableCleanup");
  -[CADServer _registerForConferenceURLRenewal](self, "_registerForConferenceURLRenewal");
  -[CADServer _registerForOccurrenceCacheUpdate](self, "_registerForOccurrenceCacheUpdate");
}

- (void)_registerActivityWithIdentifier:(const char *)a3 block:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  const char *v10;

  v5 = a4;
  v6 = (void *)*MEMORY[0x1E0C80748];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__CADServer__registerActivityWithIdentifier_block___block_invoke;
  v8[3] = &unk_1E6A37DF0;
  v9 = v5;
  v10 = a3;
  v7 = v5;
  xpc_activity_register(a3, v6, v8);

}

void __51__CADServer__registerActivityWithIdentifier_block___block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  xpc_activity_state_t state;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  uint8_t buf[4];
  NSObject *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = *(_QWORD *)(a1 + 40);
    v7 = v4;
    objc_msgSend(v5, "stringWithUTF8String:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v43 = v8;
    _os_log_impl(&dword_1B6A18000, v7, OS_LOG_TYPE_INFO, "Beginning XPC transaction for activity with identifier: [%@].", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.calendarDaemon.registerActivity.%s"), *(_QWORD *)(a1 + 40));
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v9, "UTF8String");
  v10 = (void *)os_transaction_create();

  state = xpc_activity_get_state(v3);
  v12 = (void *)CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = *(_QWORD *)(a1 + 40);
    v15 = v12;
    objc_msgSend(v13, "stringWithUTF8String:", v14);
    v16 = objc_claimAutoreleasedReturnValue();
    _CADStringFromXPCActivityState(state);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v43 = v16;
    v44 = 2112;
    v45 = v17;
    _os_log_impl(&dword_1B6A18000, v15, OS_LOG_TYPE_INFO, "Activity with identifier: [%@] is in [%@] state.", buf, 0x16u);

  }
  if (state == 2)
  {
    v24 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      v25 = (void *)MEMORY[0x1E0CB3940];
      v26 = *(_QWORD *)(a1 + 40);
      v27 = v24;
      objc_msgSend(v25, "stringWithUTF8String:", v26);
      v28 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v43 = v28;
      _os_log_impl(&dword_1B6A18000, v27, OS_LOG_TYPE_INFO, "Running activity with identifier: [%@].", buf, 0xCu);

    }
    if (!objc_msgSend(MEMORY[0x1E0D0C3D0], "isRunningAsSetupUser"))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v34 = (void *)CADLogHandle;
      if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
        goto LABEL_20;
      v35 = (void *)MEMORY[0x1E0CB3940];
      v36 = *(_QWORD *)(a1 + 40);
      v18 = v34;
      objc_msgSend(v35, "stringWithUTF8String:", v36);
      v22 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v43 = v22;
      _os_log_impl(&dword_1B6A18000, v18, OS_LOG_TYPE_INFO, "Finished running activity with identifier: [%@].", buf, 0xCu);
      goto LABEL_18;
    }
    v29 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v29, OS_LOG_TYPE_ERROR, "Skipping activity because we are running as the setup user", buf, 2u);
    }
  }
  else
  {
    if (!state)
    {
      v18 = xpc_activity_copy_criteria(v3);
      v19 = (void *)CADLogHandle;
      if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
      {
LABEL_19:

        goto LABEL_20;
      }
      v20 = (void *)MEMORY[0x1E0CB3940];
      v21 = *(_QWORD *)(a1 + 40);
      v22 = v19;
      objc_msgSend(v20, "stringWithUTF8String:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v43 = v18;
      v44 = 2112;
      v45 = v23;
      _os_log_impl(&dword_1B6A18000, v22, OS_LOG_TYPE_INFO, "Criteria: %@. Identifier: %@.", buf, 0x16u);

LABEL_18:
      goto LABEL_19;
    }
    v30 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      v31 = v30;
      _CADStringFromXPCActivityState(state);
      v32 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)(a1 + 40));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v43 = v32;
      v44 = 2112;
      v45 = v33;
      _os_log_impl(&dword_1B6A18000, v31, OS_LOG_TYPE_INFO, "Will not process activity state [%@]. Identifier: [%@].", buf, 0x16u);

    }
  }
LABEL_20:
  v37 = (void *)CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    v38 = (void *)MEMORY[0x1E0CB3940];
    v39 = *(_QWORD *)(a1 + 40);
    v40 = v37;
    objc_msgSend(v38, "stringWithUTF8String:", v39);
    v41 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v43 = v41;
    _os_log_impl(&dword_1B6A18000, v40, OS_LOG_TYPE_INFO, "Ending XPC transaction for activity with identifier: [%@].", buf, 0xCu);

  }
}

- (void)_registerForDatabaseCleanup
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__CADServer__registerForDatabaseCleanup__block_invoke;
  v2[3] = &unk_1E6A373A8;
  v2[4] = self;
  -[CADServer _registerActivityWithIdentifier:block:](self, "_registerActivityWithIdentifier:block:", "com.apple.calendar.daemon.databasecleanup", v2);
}

void __40__CADServer__registerForDatabaseCleanup__block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = CalDatabaseCreateWithOptions();
  if (v2)
  {
    v3 = (const void *)v2;
    CalDatabaseSetChangeLoggingEnabled();
    objc_msgSend(*(id *)(a1 + 32), "cleanupDatabase:", v3);
    CFRelease(v3);
  }
  else
  {
    v4 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B6A18000, v4, OS_LOG_TYPE_ERROR, "WARNING: Database is nil. Cannot perform identity orphan cleanup as a result.", v5, 2u);
    }
  }
}

- (void)_registerForAnalyticsCollection
{
  -[CADServer _registerActivityWithIdentifier:block:](self, "_registerActivityWithIdentifier:block:", "com.apple.calendar.daemon.analytics", &__block_literal_global_74);
}

- (void)_registerForAttachmentCleanup
{
  -[CADServer _registerActivityWithIdentifier:block:](self, "_registerActivityWithIdentifier:block:", "com.apple.calendar.daemon.attachmentcleanup", &__block_literal_global_76);
}

void __42__CADServer__registerForAttachmentCleanup__block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  uint8_t v2[16];
  uint8_t buf[16];

  v0 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6A18000, v0, OS_LOG_TYPE_DEFAULT, "Cleaning up orphaned attachments", buf, 2u);
  }
  +[LocalAttachmentCleanUpSupport cleanUpOrphanedFiles](LocalAttachmentCleanUpSupport, "cleanUpOrphanedFiles");
  v1 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1B6A18000, v1, OS_LOG_TYPE_DEFAULT, "Finished cleaning up orphaned attachments", v2, 2u);
  }
}

- (void)_registerForChangeTableCleanup
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __43__CADServer__registerForChangeTableCleanup__block_invoke;
  v2[3] = &unk_1E6A373A8;
  v2[4] = self;
  -[CADServer _registerActivityWithIdentifier:block:](self, "_registerActivityWithIdentifier:block:", "com.apple.calendar.daemon.changetablecleanup", v2);
}

void __43__CADServer__registerForChangeTableCleanup__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const void *v4;
  uint64_t v5;
  const char *v6;
  uint8_t *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  __int16 v11;
  __int16 v12;
  uint8_t buf[16];

  v2 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6A18000, v2, OS_LOG_TYPE_DEFAULT, "Cleaning up change tables", buf, 2u);
  }
  v3 = CalDatabaseCreateWithOptions();
  if (v3)
  {
    v4 = (const void *)v3;
    objc_msgSend(*(id *)(a1 + 32), "_cleanupChangeTablesInDatabase:", v3);
    CFRelease(v4);
    v5 = CADLogHandle;
    if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
      return;
    v12 = 0;
    v6 = "Finished cleaning up change tables";
    v7 = (uint8_t *)&v12;
    v8 = v5;
    v9 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    v10 = CADLogHandle;
    if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      return;
    v11 = 0;
    v6 = "WARNING: Database is nil. Cannot clean up change tables as a result.";
    v7 = (uint8_t *)&v11;
    v8 = v10;
    v9 = OS_LOG_TYPE_ERROR;
  }
  _os_log_impl(&dword_1B6A18000, v8, v9, v6, v7, 2u);
}

- (void)_registerForConferenceURLRenewal
{
  -[CADServer _registerActivityWithIdentifier:block:](self, "_registerActivityWithIdentifier:block:", "com.apple.calendar.daemon.conferencerenewal", &__block_literal_global_80);
}

uint64_t __45__CADServer__registerForConferenceURLRenewal__block_invoke()
{
  return +[CADConferenceUtils performConferenceLinkRenewalIfNeeded](CADConferenceUtils, "performConferenceLinkRenewalIfNeeded");
}

- (void)_registerForOccurrenceCacheUpdate
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__CADServer__registerForOccurrenceCacheUpdate__block_invoke;
  v2[3] = &unk_1E6A373A8;
  v2[4] = self;
  -[CADServer _registerActivityWithIdentifier:block:](self, "_registerActivityWithIdentifier:block:", "com.apple.calendar.daemon.occurrencecacheupdate", v2);
}

uint64_t __46__CADServer__registerForOccurrenceCacheUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_trimExtendAndUpdateOccurrenceCache:", 1);
}

- (void)cleanupDatabase:(CalDatabase *)a3
{
  NSObject *v4;
  int v5;
  CalDatabase *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = a3;
    _os_log_impl(&dword_1B6A18000, v4, OS_LOG_TYPE_INFO, "Performing database cleanup. Database: %@", (uint8_t *)&v5, 0xCu);
  }
  CalDatabaseCleanUpDeclinedEvents();
  CalIdentityGarbageCollectOrphans();
  CalDatabaseCleanupDanglers();
}

- (void)_cleanupChangeTablesInDatabase:(CalDatabase *)a3
{
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  __int16 v8;
  CalDatabase *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[CADIdleChangeTrackingCleanupInfo serverIdleChangeTrackingCleanupInfo](CADIdleChangeTrackingCleanupInfo, "serverIdleChangeTrackingCleanupInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = a3;
    _os_log_impl(&dword_1B6A18000, v5, OS_LOG_TYPE_INFO, "Performing idle change-tracking client cleanup. Idle change tracking cleanup info: %@. Database: %@.", (uint8_t *)&v6, 0x16u);
  }
  objc_msgSend(v4, "languishPeriod");
  objc_msgSend(v4, "numberOfChanges");
  CFAbsoluteTimeGetCurrent();
  CalDatabasePurgeIdlePersistentChangeTrackingClients();

}

- (unint64_t)_lastKnownContactsAuthorization
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("CADLastKnownContactsAuthorization"));

  return v3;
}

- (unint64_t)_contactsAuthorization
{
  void *v2;
  void *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  unint64_t v7;
  _QWORD v9[3];
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v2 = (void *)tcc_message_options_create();
  tcc_message_options_set_reply_handler_policy();
  objc_msgSend((id)*MEMORY[0x1E0D0C468], "UTF8String");
  v3 = (void *)tcc_identity_create();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_queue_create("contactsAuthQueue", v4);

  v6 = (void *)tcc_server_create();
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0;
  tcc_server_message_get_authorization_records_by_identity();
  v7 = v12[3];
  _Block_object_dispose(v9, 8);

  _Block_object_dispose(&v11, 8);
  return v7;
}

void __35__CADServer__contactsAuthorization__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = tcc_authorization_record_get_authorization_right();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v6 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      v12 = 134217984;
      v13 = v7;
      v8 = "Contacts authorization is %llu";
      v9 = v6;
      v10 = OS_LOG_TYPE_INFO;
LABEL_4:
      _os_log_impl(&dword_1B6A18000, v9, v10, v8, (uint8_t *)&v12, 0xCu);
    }
  }
  else if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v11 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = a3;
      v8 = "Error getting contacts authorization: %@";
      v9 = v11;
      v10 = OS_LOG_TYPE_ERROR;
      goto LABEL_4;
    }
  }

}

- (void)_registerContactsAccess
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C97298]);
  objc_msgSend(v2, "requestAccessForEntityType:completionHandler:", 0, &__block_literal_global_90);

}

- (void)_setupBirthdayListener
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  OS_dispatch_queue *v12;
  OS_dispatch_queue *tccQueue;
  id v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (MGGetBoolAnswer())
  {
    v3 = -[CADServer _contactsAuthorization](self, "_contactsAuthorization");
    v4 = v3;
    if (v3 == 2)
    {
      -[CADServer _startBirthdayListener](self, "_startBirthdayListener");
      if (-[CADServer _lastKnownContactsAuthorization](self, "_lastKnownContactsAuthorization") != 2)
        +[CADBirthdayListener reset](CADBirthdayListener, "reset");
    }
    else
    {
      if (v3 == 1)
      {
        v5 = (void *)*MEMORY[0x1E0DB10D0];
        v15 = *MEMORY[0x1E0D0C468];
        v16 = v5;
        v6 = (void *)MEMORY[0x1E0C99D20];
        v7 = v5;
        objc_msgSend(v6, "arrayWithObjects:count:", &v15, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        v11 = (void *)tcc_events_filter_create_with_criteria();
        v12 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.calaccessd.tccQ", 0);
        tccQueue = self->_tccQueue;
        self->_tccQueue = v12;

        tcc_events_subscribe();
        return;
      }
      -[CADServer _registerContactsAccess](self, "_registerContactsAccess");
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setInteger:forKey:", v4, CFSTR("CADLastKnownContactsAuthorization"));

  }
  else
  {
    -[CADServer _startBirthdayListener](self, "_startBirthdayListener");
  }
}

uint64_t __35__CADServer__setupBirthdayListener__block_invoke(uint64_t a1)
{
  uint64_t authorization_right;
  void *v3;
  void *v4;

  authorization_right = tcc_authorization_record_get_authorization_right();
  v3 = *(void **)(a1 + 32);
  if (authorization_right == 2)
    objc_msgSend(v3, "_startBirthdayListener");
  else
    objc_msgSend(v3, "_registerContactsAccess");
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", authorization_right, CFSTR("CADLastKnownContactsAuthorization"));

  return tcc_events_unsubscribe();
}

- (void)_startBirthdayListener
{
  dispatch_time_t v2;

  v2 = dispatch_time(0, 3000000000);
  dispatch_after(v2, MEMORY[0x1E0C80D38], &__block_literal_global_99);
}

uint64_t __35__CADServer__startBirthdayListener__block_invoke()
{
  return +[CADBirthdayListener start](CADBirthdayListener, "start");
}

- (void)_deactivateAndExit
{
  -[CADServer deactivate](self, "deactivate");
  -[CADServer _exit](self, "_exit");
}

- (void)_exit
{
  NSObject *v2;

  -[CADServer workQueue](self, "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v2, &__block_literal_global_100_0);

}

uint64_t __18__CADServer__exit__block_invoke()
{
  NSObject *v0;
  uint8_t v2[16];

  v0 = CADServerLogHandle;
  if (os_log_type_enabled((os_log_t)CADServerLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1B6A18000, v0, OS_LOG_TYPE_DEFAULT, "Exiting", v2, 2u);
  }
  return xpc_transaction_exit_clean();
}

- (void)_dumpState
{
  NSObject *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[8];
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_DEBUG, "Dumping server state to the system log", buf, 2u);
  }
  NSLog(CFSTR("Dumping calaccessd state:"));
  if (-[NSMutableSet count](self->_clientConnections, "count"))
  {
    NSLog(CFSTR(" %ld connection(s)"), -[NSMutableSet count](self->_clientConnections, "count"));
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = self->_clientConnections;
    v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "dumpState");
        }
        while (v6 != v8);
        v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
      }
      while (v6);
    }

  }
  else
  {
    NSLog(CFSTR(" No connections."));
  }
}

- (void)setModules:(id)a3
{
  objc_storeStrong((id *)&self->_modules, a3);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (OS_dispatch_queue)alarmQueue
{
  return self->_alarmQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_modules, 0);
  objc_storeStrong((id *)&self->_initDataFirstUnlockQueue, 0);
  objc_storeStrong((id *)&self->_signalSensors, 0);
  objc_storeStrong((id *)&self->_connectionLock, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_tccQueue, 0);
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_NSXPCListener, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

@end
