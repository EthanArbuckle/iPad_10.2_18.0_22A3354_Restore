@implementation MSPSharedTripService

- (void)addReceivingObserver:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 136380931;
    v7 = "-[MSPSharedTripService addReceivingObserver:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEBUG, "[Service] %{private}s (%@)", (uint8_t *)&v6, 0x16u);
  }

  -[GEOObserverHashTable registerObserver:](self->_receivingObservers, "registerObserver:", v4);
}

void __37__MSPSharedTripService_receivedTrips__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __38__MSPSharedTripService_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ED3284C0;
  qword_1ED3284C0 = (uint64_t)v1;

  return notify_register_dispatch(MSPSharedTripServerStartDarwinNotification, &dword_1ED3284BC, MEMORY[0x1E0C80D38], &__block_literal_global_18);
}

- (MSPSharedTripService)init
{
  MSPSharedTripService *v2;
  MSPSharedTripService *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *isolationQueue;
  id v7;
  void *v8;
  uint64_t v9;
  GEOObserverHashTable *receivingObservers;
  uint64_t v11;
  GEOObserverHashTable *sendingObservers;
  MSPSharedTripContactController *v13;
  MSPSharedTripContactController *sharingContactController;
  uint64_t v15;
  NSMutableDictionary *subscriptionTokensByTripID;
  uint64_t v17;
  id userDisabledDefaultListener;
  uint64_t v19;
  id serverDisabledDefaultListener;
  void *v21;
  void *v22;
  id v24[5];
  id v25;
  id location;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)MSPSharedTripService;
  v2 = -[MSPSharedTripService init](&v27, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_sharingIdentityLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.Maps.SharedTrip.Service.Isolation", v4);
    isolationQueue = v3->_isolationQueue;
    v3->_isolationQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc(MEMORY[0x1E0D272B8]);
    v8 = (void *)MEMORY[0x1E0C80D38];
    v9 = objc_msgSend(v7, "initWithProtocol:queue:", &unk_1EF094FA8, MEMORY[0x1E0C80D38]);
    receivingObservers = v3->_receivingObservers;
    v3->_receivingObservers = (GEOObserverHashTable *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D272B8]), "initWithProtocol:queue:", &unk_1EF095008, v8);
    sendingObservers = v3->_sendingObservers;
    v3->_sendingObservers = (GEOObserverHashTable *)v11;

    v13 = -[MSPSharedTripContactController initWithSharedTripServer:]([MSPSharedTripContactController alloc], "initWithSharedTripServer:", v3);
    sharingContactController = v3->_sharingContactController;
    v3->_sharingContactController = v13;

    -[MSPSharedTripContactController setDelegate:](v3->_sharingContactController, "setDelegate:", v3);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    subscriptionTokensByTripID = v3->_subscriptionTokensByTripID;
    v3->_subscriptionTokensByTripID = (NSMutableDictionary *)v15;

    objc_initWeak(&location, v3);
    v24[1] = (id)MEMORY[0x1E0C809B0];
    v24[2] = (id)3221225472;
    v24[3] = __28__MSPSharedTripService_init__block_invoke;
    v24[4] = &unk_1E6653CC8;
    objc_copyWeak(&v25, &location);
    _GEOConfigAddBlockListenerForKey();
    v17 = objc_claimAutoreleasedReturnValue();
    userDisabledDefaultListener = v3->_userDisabledDefaultListener;
    v3->_userDisabledDefaultListener = (id)v17;

    objc_copyWeak(v24, &location);
    _GEOConfigAddBlockListenerForKey();
    v19 = objc_claimAutoreleasedReturnValue();
    serverDisabledDefaultListener = v3->_serverDisabledDefaultListener;
    v3->_serverDisabledDefaultListener = (id)v19;

    objc_msgSend(MEMORY[0x1E0D27298], "sharedNetworkObserver");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v3->_networkReachable = objc_msgSend(v21, "isNetworkReachable");

    objc_msgSend(MEMORY[0x1E0D27298], "sharedNetworkObserver");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addNetworkReachableObserver:selector:", v3, sel__networkReachabilityChanged_);

    -[MSPSharedTripService checkin](v3, "checkin");
    objc_destroyWeak(v24);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)checkin
{
  NSObject *isolationQueue;
  _QWORD v4[4];
  id v5;
  id location;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31__MSPSharedTripService_checkin__block_invoke;
  v4[3] = &unk_1E66520A0;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __32__MSPSharedTripService__checkin__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  id v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t v18[16];
  uint8_t buf[16];
  uint8_t v20[16];

  v9 = a2;
  v10 = a3;
  v11 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_handleCheckinWithSharingIdentity:activeRecipients:receivedTrips:permissions:", v9, v10, v11, a5);
    v14 = *((_QWORD *)v13 + 15);
    MSPGetSharedTripLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B39C0000, v16, OS_LOG_TYPE_DEBUG, "[Service] Leaving checkin dispatch group", buf, 2u);
      }

      dispatch_group_leave(*((dispatch_group_t *)v13 + 15));
      v16 = *((_QWORD *)v13 + 15);
      *((_QWORD *)v13 + 15) = 0;
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1B39C0000, v16, OS_LOG_TYPE_ERROR, "[Service] Checkin dispatch group missing when checkin completed", v18, 2u);
    }

    objc_msgSend(*((id *)v13 + 6), "sharedTripServiceDidUpdateReceivingAvailability:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*((id *)v13 + 7), "sharedTripServiceDidUpdateSendingAvailability:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    MSPGetSharedTripLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1B39C0000, v17, OS_LOG_TYPE_DEBUG, "[Service] Leaving checking dispatch group, self deallocated", v20, 2u);
    }

  }
}

- (void)_handleCheckinWithSharingIdentity:(id)a3 activeRecipients:(id)a4 receivedTrips:(id)a5 permissions:(unint64_t)a6
{
  id v11;
  NSObject *isolationQueue;
  id v13;
  NSMutableArray *v14;
  NSMutableArray *receivedTrips;
  id v16;

  v16 = a3;
  v11 = a5;
  isolationQueue = self->_isolationQueue;
  v13 = a4;
  dispatch_assert_queue_V2(isolationQueue);
  self->_connectionError = 0;
  self->_connectionRetryCounter = 0;
  os_unfair_lock_lock(&self->_sharingIdentityLock);
  objc_storeStrong((id *)&self->_sharingIdentity, a3);
  self->_permissions = a6;
  os_unfair_lock_unlock(&self->_sharingIdentityLock);
  -[MSPSharedTripContactController updateActiveSharingHandles:](self->_sharingContactController, "updateActiveSharingHandles:", v13);

  if (v11)
    v14 = (NSMutableArray *)objc_msgSend(v11, "mutableCopy");
  else
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  receivedTrips = self->_receivedTrips;
  self->_receivedTrips = v14;

  -[MSPSharedTripService _addTestTripsTo:](self, "_addTestTripsTo:", self->_receivedTrips);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MSPSharedTripService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED3284C8 != -1)
    dispatch_once(&qword_1ED3284C8, block);
  return (id)qword_1ED3284C0;
}

- (MSPSharedTripSharingIdentity)sharingIdentity
{
  os_unfair_lock_s *p_sharingIdentityLock;
  MSPSharedTripSharingIdentity *v4;

  p_sharingIdentityLock = &self->_sharingIdentityLock;
  os_unfair_lock_lock(&self->_sharingIdentityLock);
  v4 = self->_sharingIdentity;
  os_unfair_lock_unlock(p_sharingIdentityLock);
  return v4;
}

- (BOOL)entitledToShareTrip
{
  MSPSharedTripService *v2;
  os_unfair_lock_s *p_sharingIdentityLock;

  v2 = self;
  p_sharingIdentityLock = &self->_sharingIdentityLock;
  os_unfair_lock_lock(&self->_sharingIdentityLock);
  LODWORD(v2) = v2->_permissions & 1;
  os_unfair_lock_unlock(p_sharingIdentityLock);
  return (char)v2;
}

- (BOOL)entitledToReceiveTrips
{
  os_unfair_lock_s *p_sharingIdentityLock;
  unint64_t v4;

  p_sharingIdentityLock = &self->_sharingIdentityLock;
  os_unfair_lock_lock(&self->_sharingIdentityLock);
  v4 = (self->_permissions >> 1) & 1;
  os_unfair_lock_unlock(p_sharingIdentityLock);
  return v4;
}

void __31__MSPSharedTripService_checkin__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_checkin");

}

- (void)_checkin
{
  NSObject *v2;
  const char *v3;
  char v5;
  _BOOL4 v6;
  OS_dispatch_group *checkinDispatchGroup;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  id buf[2];

  if (self->_checkinDispatchGroup)
  {
    MSPGetSharedTripLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      v3 = "[Service] Will not checkin, still waiting for previous checkin to complete";
LABEL_12:
      _os_log_impl(&dword_1B39C0000, v2, OS_LOG_TYPE_DEBUG, v3, (uint8_t *)buf, 2u);
    }
  }
  else
  {
    v5 = MSPSharedTripEnabled();
    MSPGetSharedTripLog();
    v2 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);
    if ((v5 & 1) != 0)
    {
      if (v6)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1B39C0000, v2, OS_LOG_TYPE_DEBUG, "[Service] Preparing checkin dispatch group", (uint8_t *)buf, 2u);
      }

      v2 = dispatch_group_create();
      checkinDispatchGroup = self->_checkinDispatchGroup;
      self->_checkinDispatchGroup = (OS_dispatch_group *)v2;

      dispatch_group_enter(v2);
      MSPGetSharedTripLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_DEBUG, "[Service] Entering checkin dispatch group", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, self);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __32__MSPSharedTripService__checkin__block_invoke;
      v9[3] = &unk_1E66547F0;
      objc_copyWeak(&v10, buf);
      v9[4] = self;
      -[MSPSharedTripService _checkinWithCompletion:](self, "_checkinWithCompletion:", v9);
      objc_destroyWeak(&v10);
      objc_destroyWeak(buf);
    }
    else if (v6)
    {
      LOWORD(buf[0]) = 0;
      v3 = "[Service] Will not checkin, feature is not enabled";
      goto LABEL_12;
    }
  }

}

- (void)_checkinWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_checkinWithCompletion", (const char *)&unk_1B3A3EAC5, v7, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[MSPSharedTripService _remoteObjectProxy](self, "_remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "checkinWithCompletion:", v4);

}

- (id)_remoteObjectProxy
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[MSPSharedTripService _openConnectionIfNeeded](self, "_openConnectionIfNeeded");
  return -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
}

- (void)_openConnectionIfNeeded
{
  NSObject *v3;
  NSXPCConnection *v4;
  NSXPCConnection *connection;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSXPCConnection *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id from;
  id location;
  uint8_t buf[4];
  NSXPCConnection *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (!self->_connection)
  {
    MSPGetSharedTripLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEFAULT, "[Service] Will open connection to daemon", buf, 2u);
    }

    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.Maps.xpc.SharedTrip"), 0);
    connection = self->_connection;
    self->_connection = v4;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF07C810);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_fetchSharedTripsWithCompletion_, 0, 1);

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_checkinWithCompletion_, 2, 1);

    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v6);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF08A868);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v13);

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    -[NSXPCConnection _setQueue:](self->_connection, "_setQueue:", self->_isolationQueue);
    objc_initWeak(&location, self);
    objc_initWeak(&from, self->_connection);
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __47__MSPSharedTripService__openConnectionIfNeeded__block_invoke;
    v20[3] = &unk_1E6651B78;
    objc_copyWeak(&v21, &from);
    objc_copyWeak(&v22, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v20);
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __47__MSPSharedTripService__openConnectionIfNeeded__block_invoke_180;
    v17[3] = &unk_1E6651B78;
    objc_copyWeak(&v18, &from);
    objc_copyWeak(&v19, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v17);
    MSPGetSharedTripLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_connection;
      *(_DWORD *)buf = 138412290;
      v26 = v16;
      _os_log_impl(&dword_1B39C0000, v15, OS_LOG_TYPE_DEFAULT, "[Service] Checking in on connection: %@", buf, 0xCu);
    }

    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
}

- (NSArray)receivedTrips
{
  NSObject *isolationQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__8;
  v11 = __Block_byref_object_dispose__8;
  v12 = 0;
  isolationQueue = self->_isolationQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__MSPSharedTripService_receivedTrips__block_invoke;
  v6[3] = &unk_1E6653670;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(isolationQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

uint64_t __38__MSPSharedTripService_sharedInstance__block_invoke_2()
{
  return objc_msgSend((id)qword_1ED3284C0, "checkin");
}

void __28__MSPSharedTripService_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  MSPGetSharedTripLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B39C0000, v2, OS_LOG_TYPE_DEFAULT, "[Service] Notified Share ETA user enabled did change", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_checkEnabledState");

}

void __28__MSPSharedTripService_init__block_invoke_68(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  MSPGetSharedTripLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B39C0000, v2, OS_LOG_TYPE_DEFAULT, "[Service] Notified Share ETA server enabled did change", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_checkEnabledState");

}

- (void)dealloc
{
  void *v3;
  id userDisabledDefaultListener;
  id serverDisabledDefaultListener;
  OS_dispatch_group *checkinDispatchGroup;
  NSObject *v7;
  objc_super v8;

  -[MSPSharedTripService _stopMonitoringSystemBlockList](self, "_stopMonitoringSystemBlockList");
  objc_msgSend(MEMORY[0x1E0D27298], "sharedNetworkObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeNetworkReachableObserver:", self);

  GEOConfigRemoveBlockListener();
  GEOConfigRemoveBlockListener();
  userDisabledDefaultListener = self->_userDisabledDefaultListener;
  self->_userDisabledDefaultListener = 0;

  serverDisabledDefaultListener = self->_serverDisabledDefaultListener;
  self->_serverDisabledDefaultListener = 0;

  checkinDispatchGroup = self->_checkinDispatchGroup;
  if (checkinDispatchGroup)
  {
    self->_checkinDispatchGroup = 0;
    v7 = checkinDispatchGroup;

    dispatch_group_leave(v7);
  }
  v8.receiver = self;
  v8.super_class = (Class)MSPSharedTripService;
  -[MSPSharedTripService dealloc](&v8, sel_dealloc);
}

- (void)_resetCheckinIdentityAndPermissions
{
  NSObject *v3;
  MSPSharedTripSharingIdentity *sharingIdentity;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  MSPGetSharedTripLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEBUG, "[Service] Resetting checkin identity and permissions", v5, 2u);
  }

  os_unfair_lock_lock(&self->_sharingIdentityLock);
  sharingIdentity = self->_sharingIdentity;
  self->_sharingIdentity = 0;

  self->_permissions = 0;
  os_unfair_lock_unlock(&self->_sharingIdentityLock);
}

- (void)_performBlockWhenCheckinCompleted:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (self->_checkinDispatchGroup)
  {
    MSPGetSharedTripLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEBUG, "[Service] Registering to be notified when checkin is completed", v6, 2u);
    }

    dispatch_group_notify((dispatch_group_t)self->_checkinDispatchGroup, (dispatch_queue_t)self->_isolationQueue, v4);
  }

}

- (void)_checkEnabledState
{
  char v3;
  NSXPCConnection *connection;
  NSObject *v5;
  NSObject *v6;
  NSXPCConnection *v7;
  int v8;
  NSXPCConnection *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v3 = MSPSharedTripEnabled();
  connection = self->_connection;
  if ((v3 & 1) != 0)
  {
    if (!connection)
    {
      MSPGetSharedTripLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEFAULT, "[Service] Feature is enabled, will attempt checkin", (uint8_t *)&v8, 2u);
      }

      -[MSPSharedTripService _checkin](self, "_checkin");
    }
  }
  else if (connection)
  {
    MSPGetSharedTripLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = self->_connection;
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEFAULT, "[Service] Feature is disabled, invalidating current connection: %@", (uint8_t *)&v8, 0xCu);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
}

- (void)performBlockAfterInitialConnection:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MSPSharedTripService_performBlockAfterInitialConnection___block_invoke;
  block[3] = &unk_1E6654818;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __59__MSPSharedTripService_performBlockAfterInitialConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_performBlockAfterInitialConnection:", *(_QWORD *)(a1 + 32));

}

- (void)_performBlockAfterInitialConnection:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  OS_dispatch_group *checkinDispatchGroup;
  NSObject *v8;
  _BOOL4 v9;
  uint8_t v10[16];
  _QWORD v11[5];
  id v12;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__MSPSharedTripService__performBlockAfterInitialConnection___block_invoke;
  v11[3] = &unk_1E6653E38;
  v11[4] = self;
  v5 = v4;
  v12 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1B5E2B4E8](v11);
  checkinDispatchGroup = self->_checkinDispatchGroup;
  MSPGetSharedTripLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (checkinDispatchGroup)
  {
    if (v9)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_DEBUG, "[Service] Will fire external post-checkin block when checkin is completed", v10, 2u);
    }

    dispatch_group_notify((dispatch_group_t)self->_checkinDispatchGroup, (dispatch_queue_t)self->_isolationQueue, v6);
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_DEBUG, "[Service] Will fire external post-checkin block, checkin is not in progress", v10, 2u);
    }

    v6[2](v6);
  }

}

void __60__MSPSharedTripService__performBlockAfterInitialConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  uint8_t buf[16];

  MSPGetSharedTripLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B39C0000, v2, OS_LOG_TYPE_DEBUG, "[Service] Firing external post-checkin block", buf, 2u);
  }

  v3 = *(void **)(a1 + 32);
  v10 = 0;
  objc_msgSend(v3, "_serviceCanAttemptConnection:", &v10);
  v4 = v10;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__MSPSharedTripService__performBlockAfterInitialConnection___block_invoke_76;
  v7[3] = &unk_1E6654840;
  v5 = *(id *)(a1 + 40);
  v8 = v4;
  v9 = v5;
  v7[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __60__MSPSharedTripService__performBlockAfterInitialConnection___block_invoke_76(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)performBlockAfterInitialSync:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MSPSharedTripService_performBlockAfterInitialSync___block_invoke;
  block[3] = &unk_1E6654818;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __53__MSPSharedTripService_performBlockAfterInitialSync___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_performBlockAfterInitialSync:", *(_QWORD *)(a1 + 32));

}

- (void)_performBlockAfterInitialSync:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (_performBlockAfterInitialSync__onceToken != -1)
    dispatch_once(&_performBlockAfterInitialSync__onceToken, &__block_literal_global_77);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__MSPSharedTripService__performBlockAfterInitialSync___block_invoke_78;
  v6[3] = &unk_1E6654888;
  v7 = v4;
  v5 = v4;
  -[MSPSharedTripService _performBlockAfterInitialConnection:](self, "_performBlockAfterInitialConnection:", v6);

}

void __54__MSPSharedTripService__performBlockAfterInitialSync___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  MSPGetSharedTripLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B39C0000, v0, OS_LOG_TYPE_INFO, "[Service] Call to deprecated performAfterInitialSync:, please use performBlockAfterInitialConnection: instead", v1, 2u);
  }

}

uint64_t __54__MSPSharedTripService__performBlockAfterInitialSync___block_invoke_78(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)canAddReceivers
{
  return self->_networkReachable && MSPSharedTripSharingAvailable();
}

- (void)_networkReachabilityChanged:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  __CFString *v13;
  __int16 v14;
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D26750]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (self->_networkReachable != v6)
  {
    MSPGetSharedTripLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_networkReachable)
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      v9 = v8;
      if (v6)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      v11 = v10;
      v12 = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_DEFAULT, "[Service] Network reachability changed: %{public}@ -> %{public}@, notifying sending observers", (uint8_t *)&v12, 0x16u);

    }
    self->_networkReachable = v6;
    -[GEOObserverHashTable sharedTripServiceDidUpdateSendingAvailability:](self->_sendingObservers, "sharedTripServiceDidUpdateSendingAvailability:", self);
  }
}

- (NSArray)receivers
{
  NSObject *isolationQueue;
  id v4;
  _QWORD block[5];
  id v7;
  id location;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__8;
  v13 = __Block_byref_object_dispose__8;
  v14 = 0;
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__MSPSharedTripService_receivers__block_invoke;
  block[3] = &unk_1E6653710;
  block[4] = &v9;
  objc_copyWeak(&v7, &location);
  dispatch_sync(isolationQueue, block);
  v4 = (id)v10[5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v4;
}

void __33__MSPSharedTripService_receivers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_receivers");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_receivers
{
  void *v3;
  void *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[MSPSharedTripContactController activeContactsValues](self->_sharingContactController, "activeContactsValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isSharingWithContact:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MSPSharedTripService_isSharingWithContact___block_invoke;
  block[3] = &unk_1E6651EB0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(isolationQueue, block);
  LOBYTE(v4) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __45__MSPSharedTripService_isSharingWithContact___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 72), "contactIsActive:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)startSharingWithContact:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *isolationQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__MSPSharedTripService_startSharingWithContact_completion___block_invoke;
  v11[3] = &unk_1E66548B0;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(isolationQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __59__MSPSharedTripService_startSharingWithContact_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_startSharingWithContact:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_startSharingWithContact:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;
  _QWORD block[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  if (self->_networkReachable)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke_80;
    v8[3] = &unk_1E6654950;
    v9 = v6;
    v10 = v7;
    objc_copyWeak(&v11, &location);
    -[MSPSharedTripService _validateCurrentConfigurationWithCompletion:](self, "_validateCurrentConfigurationWithCompletion:", v8);
    objc_destroyWeak(&v11);

    objc_destroyWeak(&location);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke;
    block[3] = &unk_1E6653E38;
    v14 = v6;
    v15 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  _BYTE v6[12];
  __int16 v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v9[0] = *MEMORY[0x1E0CB2938];
  *(_QWORD *)v6 = CFSTR("No network connection");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v9, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.SharedTrip"), 20, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  MSPGetSharedTripLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v6 = 138478083;
    *(_QWORD *)&v6[4] = v5;
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_ERROR, "[Service] Error starting to share with contact %{private}@: %{public}@", v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke_80(id *a1, void *a2)
{
  id v3;
  uint64_t *v4;
  NSObject *v5;
  uint64_t *WeakRetained;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  uint64_t *v18;
  id v19;
  uint8_t buf[8];
  _QWORD block[4];
  uint64_t *v22;
  id v23;
  id v24;

  v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke_2;
    block[3] = &unk_1E66548D8;
    v22 = (uint64_t *)a1[4];
    v23 = v3;
    v24 = a1[5];
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v4 = v22;
  }
  else if ((objc_msgSend(MEMORY[0x1E0C97298], "_maps_isAuthorized") & 1) != 0)
  {
    if (objc_msgSend(a1[4], "isHandleBlocked"))
    {
      MSPGetSharedTripLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_ERROR, "[Service] Will not start sharing, contact is in system block list", buf, 2u);
      }

      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke_83;
      v14[3] = &unk_1E6653E38;
      v15 = a1[4];
      v16 = a1[5];
      dispatch_async(MEMORY[0x1E0C80D38], v14);

    }
    WeakRetained = (uint64_t *)objc_loadWeakRetained(a1 + 6);
    v4 = WeakRetained;
    if (WeakRetained)
    {
      v7 = (void *)WeakRetained[9];
      v8 = a1[4];
      v9 = WeakRetained[3];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke_84;
      v11[3] = &unk_1E6654928;
      v12 = v8;
      v13 = a1[5];
      objc_msgSend(v7, "shareWithContactValue:queue:completion:", v12, v9, v11);

    }
  }
  else
  {
    MSPGetSharedTripLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B39C0000, v10, OS_LOG_TYPE_ERROR, "[Service] Will not start sharing, Maps is not authorised for Contacts", buf, 2u);
    }

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke_82;
    v17[3] = &unk_1E6653E38;
    v18 = (uint64_t *)a1[4];
    v19 = a1[5];
    dispatch_async(MEMORY[0x1E0C80D38], v17);

    v4 = v18;
  }

}

uint64_t __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  MSPGetSharedTripLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = a1[4];
    v4 = a1[5];
    v6 = 138478083;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1B39C0000, v2, OS_LOG_TYPE_ERROR, "[Service] Error starting to share with contact %{private}@: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke_82(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  _BYTE v6[12];
  __int16 v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v9[0] = *MEMORY[0x1E0CB2938];
  *(_QWORD *)v6 = CFSTR("Maps does not have authorisation for Contacts");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v9, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.SharedTrip"), 19, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  MSPGetSharedTripLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v6 = 138478083;
    *(_QWORD *)&v6[4] = v5;
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_ERROR, "[Service] Error starting to share with contact %{private}@: %{public}@", v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke_83(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  _BYTE v6[12];
  __int16 v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v9[0] = *MEMORY[0x1E0CB2938];
  *(_QWORD *)v6 = CFSTR("Contact is in system block list");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v9, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.SharedTrip"), 21, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  MSPGetSharedTripLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v6 = 138478083;
    *(_QWORD *)&v6[4] = v5;
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_ERROR, "[Service] Error starting to share with contact %{private}@: %{public}@", v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke_84(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke_2_85;
  v7[3] = &unk_1E6654900;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = a2;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __60__MSPSharedTripService__startSharingWithContact_completion___block_invoke_2_85(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    MSPGetSharedTripLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = a1[4];
      v3 = a1[5];
      v6 = 138478083;
      v7 = v3;
      v8 = 2114;
      v9 = v4;
      _os_log_impl(&dword_1B39C0000, v2, OS_LOG_TYPE_ERROR, "[Service] Error starting to share with contact %{private}@: %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

+ (BOOL)_supportsPassingClosureReasons
{
  if (qword_1ED3284D0 != -1)
    dispatch_once(&qword_1ED3284D0, &__block_literal_global_88_0);
  return _MergedGlobals_49;
}

void __54__MSPSharedTripService__supportsPassingClosureReasons__block_invoke()
{
  void *v0;
  void *v1;
  char v2;
  NSObject *v3;
  const char *v4;
  int v5;
  void *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v1, "isEqual:", *MEMORY[0x1E0D26D08]) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.Preferences"));
  _MergedGlobals_49 = v2;
  MSPGetSharedTripLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "YES";
    if (!_MergedGlobals_49)
      v4 = "NO";
    v5 = 138543618;
    v6 = v1;
    v7 = 2080;
    v8 = v4;
    _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEFAULT, "[Service] %{public}@ supports passing sharing closure reasons: %s", (uint8_t *)&v5, 0x16u);
  }

}

- (void)stopSharingWithContact:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *isolationQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__MSPSharedTripService_stopSharingWithContact_completion___block_invoke;
  v11[3] = &unk_1E66548B0;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(isolationQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __58__MSPSharedTripService_stopSharingWithContact_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_stopSharingWithContact:reason:completion:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));

}

- (void)stopSharingWithContact:(id)a3 reason:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *isolationQueue;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17[2];
  id location;
  _QWORD block[4];
  id v20;

  v8 = a3;
  v9 = a5;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  if ((objc_msgSend((id)objc_opt_class(), "_supportsPassingClosureReasons") & 1) != 0)
  {
    objc_initWeak(&location, self);
    isolationQueue = self->_isolationQueue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __65__MSPSharedTripService_stopSharingWithContact_reason_completion___block_invoke_2;
    v14[3] = &unk_1E6653648;
    objc_copyWeak(v17, &location);
    v11 = v8;
    v17[1] = (id)a4;
    v15 = v11;
    v16 = v9;
    v12 = v9;
    dispatch_async(isolationQueue, v14);

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__MSPSharedTripService_stopSharingWithContact_reason_completion___block_invoke;
    block[3] = &unk_1E6653508;
    v20 = v9;
    v13 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __65__MSPSharedTripService_stopSharingWithContact_reason_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v4 = *MEMORY[0x1E0CB2938];
  v5[0] = CFSTR("Operation not permitted");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.SharedTrip"), 22, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

void __65__MSPSharedTripService_stopSharingWithContact_reason_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_stopSharingWithContact:reason:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

- (void)_stopSharingWithContact:(id)a3 reason:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15[2];
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__MSPSharedTripService__stopSharingWithContact_reason_completion___block_invoke;
  v12[3] = &unk_1E6654998;
  v10 = v8;
  v13 = v10;
  v11 = v9;
  v14 = v11;
  objc_copyWeak(v15, &location);
  v15[1] = (id)a4;
  -[MSPSharedTripService _validateCurrentConfigurationWithCompletion:](self, "_validateCurrentConfigurationWithCompletion:", v12);
  objc_destroyWeak(v15);

  objc_destroyWeak(&location);
}

void __66__MSPSharedTripService__stopSharingWithContact_reason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t *WeakRetained;
  uint64_t *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD block[4];
  uint64_t *v15;
  id v16;
  id v17;

  v3 = a2;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "code") != 20)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__MSPSharedTripService__stopSharingWithContact_reason_completion___block_invoke_2;
    block[3] = &unk_1E66548D8;
    v15 = (uint64_t *)*(id *)(a1 + 32);
    v16 = v4;
    v17 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v6 = v15;
    goto LABEL_6;
  }
  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = (void *)WeakRetained[9];
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 56);
    v10 = WeakRetained[3];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__MSPSharedTripService__stopSharingWithContact_reason_completion___block_invoke_93;
    v11[3] = &unk_1E66541D0;
    v12 = v8;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v7, "stopSharingWithContactValue:reason:queue:completion:", v12, v9, v10, v11);

LABEL_6:
  }

}

uint64_t __66__MSPSharedTripService__stopSharingWithContact_reason_completion___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  MSPGetSharedTripLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = a1[4];
    v4 = a1[5];
    v6 = 138478083;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1B39C0000, v2, OS_LOG_TYPE_ERROR, "[Service] Error stopping sharing with contact %{private}@: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __66__MSPSharedTripService__stopSharingWithContact_reason_completion___block_invoke_93(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MSPSharedTripService__stopSharingWithContact_reason_completion___block_invoke_2_94;
  block[3] = &unk_1E66548D8;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __66__MSPSharedTripService__stopSharingWithContact_reason_completion___block_invoke_2_94(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    MSPGetSharedTripLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = a1[4];
      v3 = a1[5];
      v6 = 138478083;
      v7 = v3;
      v8 = 2114;
      v9 = v4;
      _os_log_impl(&dword_1B39C0000, v2, OS_LOG_TYPE_ERROR, "[Service] Error stopping sharing with contact %{private}@: %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)stopAllSharingWithCompletion:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MSPSharedTripService_stopAllSharingWithCompletion___block_invoke;
  block[3] = &unk_1E6654818;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __53__MSPSharedTripService_stopAllSharingWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_stopAllSharingWithReason:completion:", 0, *(_QWORD *)(a1 + 32));

}

- (void)stopAllSharingWithReason:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *isolationQueue;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12[2];
  id location;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  if ((objc_msgSend((id)objc_opt_class(), "_supportsPassingClosureReasons") & 1) != 0)
  {
    objc_initWeak(&location, self);
    isolationQueue = self->_isolationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__MSPSharedTripService_stopAllSharingWithReason_completion___block_invoke_95;
    block[3] = &unk_1E6651B30;
    objc_copyWeak(v12, &location);
    v12[1] = (id)a3;
    v11 = v6;
    v8 = v6;
    dispatch_async(isolationQueue, block);

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__MSPSharedTripService_stopAllSharingWithReason_completion___block_invoke;
    v14[3] = &unk_1E6653508;
    v15 = v6;
    v9 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v14);

  }
}

void __60__MSPSharedTripService_stopAllSharingWithReason_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0CB2938];
  *(_QWORD *)v5 = CFSTR("Operation not permitted");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.SharedTrip"), 22, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  MSPGetSharedTripLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v5 = 138543362;
    *(_QWORD *)&v5[4] = v3;
    _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_ERROR, "[Service] Error stopping all sharing: %{public}@", v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__MSPSharedTripService_stopAllSharingWithReason_completion___block_invoke_95(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_stopAllSharingWithReason:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)_stopAllSharingWithReason:(unint64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__MSPSharedTripService__stopAllSharingWithReason_completion___block_invoke;
  v8[3] = &unk_1E66549C0;
  v7 = v6;
  v9 = v7;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  -[MSPSharedTripService _validateCurrentConfigurationWithCompletion:](self, "_validateCurrentConfigurationWithCompletion:", v8);
  objc_destroyWeak(v10);

  objc_destroyWeak(&location);
}

void __61__MSPSharedTripService__stopAllSharingWithReason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t *WeakRetained;
  uint64_t *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD block[4];
  uint64_t *v13;
  id v14;

  v3 = a2;
  v4 = v3;
  if (!v3 || objc_msgSend(v3, "code") == 20)
  {
    WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 40));
    v6 = WeakRetained;
    if (WeakRetained)
    {
      v7 = (void *)WeakRetained[9];
      v8 = *(_QWORD *)(a1 + 48);
      v9 = WeakRetained[3];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __61__MSPSharedTripService__stopAllSharingWithReason_completion___block_invoke_96;
      v10[3] = &unk_1E66535A8;
      v11 = *(id *)(a1 + 32);
      objc_msgSend(v7, "stopAllSharingWithReason:queue:completion:", v8, v9, v10);

    }
    goto LABEL_7;
  }
  if (*(_QWORD *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__MSPSharedTripService__stopAllSharingWithReason_completion___block_invoke_2;
    block[3] = &unk_1E6653E38;
    v13 = v4;
    v14 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v6 = v13;
LABEL_7:

  }
}

uint64_t __61__MSPSharedTripService__stopAllSharingWithReason_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MSPGetSharedTripLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1B39C0000, v2, OS_LOG_TYPE_ERROR, "[Service] Error stopping all sharing: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __61__MSPSharedTripService__stopAllSharingWithReason_completion___block_invoke_96(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __61__MSPSharedTripService__stopAllSharingWithReason_completion___block_invoke_2_97;
    v5[3] = &unk_1E6653E38;
    v6 = v3;
    v7 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

uint64_t __61__MSPSharedTripService__stopAllSharingWithReason_completion___block_invoke_2_97(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    MSPGetSharedTripLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_1B39C0000, v2, OS_LOG_TYPE_ERROR, "[Service] Error stopping all sharing: %{public}@", (uint8_t *)&v5, 0xCu);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)sharedTripContactController:(id)a3 didUpdateActiveContactsValues:(id)a4
{
  id v5;
  NSObject *v6;
  GEOObserverHashTable *sendingObservers;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9 = 136315395;
    v10 = "-[MSPSharedTripService sharedTripContactController:didUpdateActiveContactsValues:]";
    v11 = 2113;
    v12 = v5;
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_INFO, "[Service] %s %{private}@", (uint8_t *)&v9, 0x16u);
  }

  sendingObservers = self->_sendingObservers;
  objc_msgSend(v5, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOObserverHashTable sharedTripService:didUpdateReceivers:](sendingObservers, "sharedTripService:didUpdateReceivers:", self, v8);

}

- (BOOL)_supportsMonitoringBlockList
{
  if (qword_1ED3284D8 != -1)
    dispatch_once(&qword_1ED3284D8, &__block_literal_global_98);
  return byte_1ED3284B9;
}

void __52__MSPSharedTripService__supportsMonitoringBlockList__block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  const char *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  byte_1ED3284B9 = objc_msgSend(v1, "isEqual:", *MEMORY[0x1E0D26D08]);

  MSPGetSharedTripLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (byte_1ED3284B9)
      v3 = "YES";
    else
      v3 = "NO";
    v4 = 136315138;
    v5 = v3;
    _os_log_impl(&dword_1B39C0000, v2, OS_LOG_TYPE_DEFAULT, "[Service] Supports monitoring system block list: %s", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_startMonitoringSystemBlockListIfNeeded
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id blockListMonitoringObserver;
  _QWORD v9[4];
  id v10;
  id buf[2];

  if (-[MSPSharedTripService _supportsMonitoringBlockList](self, "_supportsMonitoringBlockList")
    && !self->_blockListMonitoringObserver)
  {
    MSPGetSharedTripLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEFAULT, "[Service] Will start monitoring system block list updates", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0D13278];
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__MSPSharedTripService__startMonitoringSystemBlockListIfNeeded__block_invoke;
    v9[3] = &unk_1E6654A08;
    objc_copyWeak(&v10, buf);
    objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", v5, 0, v6, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    blockListMonitoringObserver = self->_blockListMonitoringObserver;
    self->_blockListMonitoringObserver = v7;

    objc_destroyWeak(&v10);
    objc_destroyWeak(buf);
  }
}

void __63__MSPSharedTripService__startMonitoringSystemBlockListIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_systemBlockListDidUpdate");

}

- (void)_stopMonitoringSystemBlockList
{
  NSObject *v3;
  void *v4;
  id blockListMonitoringObserver;
  GCDTimer *blockListCoalescingTimer;
  uint8_t v7[16];

  if (self->_blockListMonitoringObserver)
  {
    MSPGetSharedTripLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEFAULT, "[Service] Will stop monitoring system block list updates", v7, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self->_blockListMonitoringObserver);

    blockListMonitoringObserver = self->_blockListMonitoringObserver;
    self->_blockListMonitoringObserver = 0;

    -[GCDTimer invalidate](self->_blockListCoalescingTimer, "invalidate");
    blockListCoalescingTimer = self->_blockListCoalescingTimer;
    self->_blockListCoalescingTimer = 0;

  }
}

- (void)_systemBlockListDidUpdate
{
  NSObject *isolationQueue;
  _QWORD block[5];

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MSPSharedTripService__systemBlockListDidUpdate__block_invoke;
  block[3] = &unk_1E6651E88;
  block[4] = self;
  dispatch_async(isolationQueue, block);
}

uint64_t __49__MSPSharedTripService__systemBlockListDidUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleCoalescedBlockListCheckIfNeeded");
}

- (void)_scheduleCoalescedBlockListCheckIfNeeded
{
  NSObject *v3;
  OS_dispatch_queue *isolationQueue;
  GCDTimer *v5;
  GCDTimer *blockListCoalescingTimer;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!self->_blockListCoalescingTimer)
  {
    MSPGetSharedTripLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v10 = 0x3FF0000000000000;
      _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEFAULT, "[Service] System block list did update, scheduling coalescing check in %#.1lfs", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    isolationQueue = self->_isolationQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64__MSPSharedTripService__scheduleCoalescedBlockListCheckIfNeeded__block_invoke;
    v7[3] = &unk_1E6651E60;
    objc_copyWeak(&v8, (id *)buf);
    +[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", isolationQueue, v7, 1.0);
    v5 = (GCDTimer *)objc_claimAutoreleasedReturnValue();
    blockListCoalescingTimer = self->_blockListCoalescingTimer;
    self->_blockListCoalescingTimer = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

void __64__MSPSharedTripService__scheduleCoalescedBlockListCheckIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_checkBlockList");

}

- (void)_checkBlockList
{
  GCDTimer *blockListCoalescingTimer;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  MSPSharedTripService *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  blockListCoalescingTimer = self->_blockListCoalescingTimer;
  self->_blockListCoalescingTimer = 0;

  MSPGetSharedTripLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_DEFAULT, "[Service] Instructing capability fetcher to check existing blocked statuses", buf, 2u);
  }

  +[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "verifyBlockedStatuses");

  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEFAULT, "[Service] Checking blocklist to see if we need to stop any sharing...", buf, 2u);
  }

  v21 = self;
  -[MSPSharedTripService _receivers](self, "_receivers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v14, "isHandleBlocked"))
        {
          MSPGetSharedTripLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v14, "handleForIDS");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138477827;
            v27 = (uint64_t)v16;
            _os_log_impl(&dword_1B39C0000, v15, OS_LOG_TYPE_DEFAULT, "[Service] Found %{private}@ is now blocked", buf, 0xCu);

          }
          objc_msgSend(v14, "handleForIDS");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v17);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v11);
  }

  if (v8)
  {
    MSPGetSharedTripLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 134217984;
      v27 = v19;
      _os_log_impl(&dword_1B39C0000, v18, OS_LOG_TYPE_DEFAULT, "[Service] Found %lu handles are now blocked, will stop sharing", buf, 0xCu);
    }

    objc_msgSend(v8, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPSharedTripService _stopSharingTripWithContacts:reason:completion:](v21, "_stopSharingTripWithContacts:reason:completion:", v20, 0, &__block_literal_global_106);

  }
}

- (void)blockSharedTripWithIdentifier:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D27540], "_msp_blockTestTripWithIdentifier:", v4))
  {
    isolationQueue = self->_isolationQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__MSPSharedTripService_blockSharedTripWithIdentifier___block_invoke;
    v6[3] = &unk_1E6651C08;
    v6[4] = self;
    v7 = v4;
    dispatch_async(isolationQueue, v6);

  }
  else
  {
    -[MSPSharedTripService blockSharedTrip:](self, "blockSharedTrip:", v4);
  }

}

void __54__MSPSharedTripService_blockSharedTripWithIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D27540], "_msp_testTripForIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sharedTripDidBecomeUnavailable:", v2);

}

- (id)_subscriptionTokensForTripID:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_subscriptionTokensByTripID, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = 1;
    else
      v8 = !v4;
    if (!v8)
    {
      MSPGetSharedTripLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v11 = 138412290;
        v12 = v6;
        _os_log_impl(&dword_1B39C0000, v9, OS_LOG_TYPE_DEBUG, "[Service] Initialising subscription tokens for trip %@", (uint8_t *)&v11, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subscriptionTokensByTripID, "setObject:forKeyedSubscript:", v7, v6);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_addSubscriptionTokenForTripID:(id)a3
{
  id v4;
  MSPSharedTripSubscriptionToken *v5;
  MSPSharedTripSubscriptionToken *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  id location;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = [MSPSharedTripSubscriptionToken alloc];
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __55__MSPSharedTripService__addSubscriptionTokenForTripID___block_invoke;
    v14 = &unk_1E6654A70;
    objc_copyWeak(&v15, &location);
    v6 = -[MSPSharedTripSubscriptionToken initWithSharedTripIdentifier:invalidationHandler:](v5, "initWithSharedTripIdentifier:invalidationHandler:", v4, &v11);
    -[MSPSharedTripService _subscriptionTokensForTripID:createIfNeeded:](self, "_subscriptionTokensForTripID:createIfNeeded:", v4, 1, v11, v12, v13, v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v6);
    MSPGetSharedTripLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 138412546;
      v18 = v4;
      v19 = 2048;
      v20 = v9;
      _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_INFO, "[Service] Add subscription token for trip %@ (%lu subscriptions)", buf, 0x16u);
    }

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __55__MSPSharedTripService__addSubscriptionTokenForTripID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  uint8_t v9[16];

  v5 = a3;
  v6 = a2;
  MSPGetSharedTripLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_INFO, "[Service] Token invalidated, will purge", v9, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_subscriptionTokenDidInvalidate:forTripID:", v6, v5);

}

- (void)purgeToken:(id)a3 forTripID:(id)a4
{
  id v6;
  id v7;
  NSObject *isolationQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MSPSharedTripService_purgeToken_forTripID___block_invoke;
  block[3] = &unk_1E66534B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(isolationQueue, block);

}

uint64_t __45__MSPSharedTripService_purgeToken_forTripID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgeToken:forTripID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_subscriptionTokenDidInvalidate:(id)a3 forTripID:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *isolationQueue;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD *v12;
  const char *label;
  const char *v14;
  void *v15;
  _QWORD v16[2];
  uint64_t (*v17)(uint64_t);
  void *v18;
  MSPSharedTripService *v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  isolationQueue = self->_isolationQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v17 = __66__MSPSharedTripService__subscriptionTokenDidInvalidate_forTripID___block_invoke;
  v18 = &unk_1E66534B8;
  v19 = self;
  v9 = v6;
  v20 = v9;
  v10 = v7;
  v21 = v10;
  v11 = isolationQueue;
  v12 = v16;
  label = dispatch_queue_get_label(v11);
  v14 = dispatch_queue_get_label(0);
  if (label == v14 || label && v14 && !strcmp(label, v14))
  {
    v15 = (void *)MEMORY[0x1B5E2B350]();
    v17((uint64_t)v12);
    objc_autoreleasePoolPop(v15);
  }
  else
  {
    dispatch_sync(v11, v12);
  }

}

uint64_t __66__MSPSharedTripService__subscriptionTokenDidInvalidate_forTripID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgeToken:forTripID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_purgeToken:(id)a3 forTripID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[MSPSharedTripService _subscriptionTokensForTripID:createIfNeeded:](self, "_subscriptionTokensForTripID:createIfNeeded:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    MSPGetSharedTripLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_1B39C0000, v9, OS_LOG_TYPE_INFO, "[Service] Purging %@ for trip %@", buf, 0x16u);
    }

    objc_msgSend(v8, "removeObject:", v6);
    if (!objc_msgSend(v8, "count"))
    {
      -[MSPSharedTripService _remoteObjectProxy](self, "_remoteObjectProxy");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __46__MSPSharedTripService__purgeToken_forTripID___block_invoke;
      v11[3] = &unk_1E6654220;
      v12 = v7;
      objc_msgSend(v10, "unsubscribeFromSharedTripUpdatesWithIdentifier:completion:", v12, v11);

    }
  }

}

void __46__MSPSharedTripService__purgeToken_forTripID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MSPGetSharedTripLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v3;
      v7 = "[Service] Failed to unsubscribe from trip %@: %@";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 22;
LABEL_6:
      _os_log_impl(&dword_1B39C0000, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = 138412290;
    v13 = v11;
    v7 = "[Service] Unsubscribed from trip %@";
    v8 = v5;
    v9 = OS_LOG_TYPE_INFO;
    v10 = 12;
    goto LABEL_6;
  }

}

- (void)removeReceivingObserver:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 136380931;
    v7 = "-[MSPSharedTripService removeReceivingObserver:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEBUG, "[Service] %{private}s (%@)", (uint8_t *)&v6, 0x16u);
  }

  -[GEOObserverHashTable unregisterObserver:](self->_receivingObservers, "unregisterObserver:", v4);
}

- (void)addSendingObserver:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 136380931;
    v7 = "-[MSPSharedTripService addSendingObserver:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEBUG, "[Service] %{private}s (%@)", (uint8_t *)&v6, 0x16u);
  }

  -[GEOObserverHashTable registerObserver:](self->_sendingObservers, "registerObserver:", v4);
}

- (void)removeSendingObserver:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 136380931;
    v7 = "-[MSPSharedTripService removeSendingObserver:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEBUG, "[Service] %{private}s (%@)", (uint8_t *)&v6, 0x16u);
  }

  -[GEOObserverHashTable unregisterObserver:](self->_sendingObservers, "unregisterObserver:", v4);
}

- (void)_validateCurrentConfigurationWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  _BOOL4 v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  _QWORD v15[4];
  void (**v16)(id, void *);
  id v17;
  id v18;
  _BYTE location[12];
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v18 = 0;
  v5 = -[MSPSharedTripService _serviceCanAttemptConnection:](self, "_serviceCanAttemptConnection:", &v18);
  v6 = v18;
  v7 = v6;
  if (v6)
    v8 = 0;
  else
    v8 = v5;
  if (!v8)
  {
    if (v6)
    {
      MSPGetSharedTripLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = objc_msgSend(v7, "code");
        *(_DWORD *)location = 134218242;
        *(_QWORD *)&location[4] = v10;
        v20 = 2112;
        v21 = v7;
        v11 = "[Service] Validated configuration with error code: %ld, %@";
        v12 = v9;
        v13 = OS_LOG_TYPE_ERROR;
        v14 = 22;
LABEL_12:
        _os_log_impl(&dword_1B39C0000, v12, v13, v11, location, v14);
      }
LABEL_13:

      v4[2](v4, v7);
      goto LABEL_14;
    }
LABEL_10:
    MSPGetSharedTripLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)location = 0;
      v11 = "[Service] Validated configuration with no error";
      v12 = v9;
      v13 = OS_LOG_TYPE_DEFAULT;
      v14 = 2;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (self->_sharingIdentity)
    goto LABEL_10;
  objc_initWeak((id *)location, self);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__MSPSharedTripService__validateCurrentConfigurationWithCompletion___block_invoke;
  v15[3] = &unk_1E6654818;
  objc_copyWeak(&v17, (id *)location);
  v16 = v4;
  -[MSPSharedTripService _performBlockWhenCheckinCompleted:](self, "_performBlockWhenCheckinCompleted:", v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)location);
LABEL_14:

}

void __68__MSPSharedTripService__validateCurrentConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  MSPGetSharedTripLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B39C0000, v2, OS_LOG_TYPE_DEBUG, "[Service] Notified identity should have synced, retrying validation", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_validateCurrentConfigurationWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (BOOL)_serviceCanAttemptConnection:(id *)a3
{
  MSPSharedTripSharingIdentity *sharingIdentity;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (-[MSPSharedTripService _isMapsInstalled](self, "_isMapsInstalled"))
  {
    if ((GEOConfigGetBOOL() & 1) != 0)
    {
      if ((GEOConfigGetBOOL() & 1) != 0)
      {
        sharingIdentity = self->_sharingIdentity;
        if (sharingIdentity && !-[MSPSharedTripSharingIdentity hasValidAccount](sharingIdentity, "hasValidAccount"))
        {
          v11 = *MEMORY[0x1E0CB2938];
          v12[0] = CFSTR("Invalid account for sharing");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = (void *)MEMORY[0x1E0CB35C8];
          v8 = 5;
        }
        else
        {
          if (!self->_connectionError)
          {
            v9 = 0;
            if (!a3)
              goto LABEL_14;
            goto LABEL_13;
          }
          v11 = *MEMORY[0x1E0CB2938];
          v12[0] = CFSTR("Failed to connect to trip sharing process");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = (void *)MEMORY[0x1E0CB35C8];
          v8 = 1;
        }
      }
      else
      {
        v11 = *MEMORY[0x1E0CB2938];
        v12[0] = CFSTR("Feature disabled remotely");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x1E0CB35C8];
        v8 = 3;
      }
    }
    else
    {
      v11 = *MEMORY[0x1E0CB2938];
      v12[0] = CFSTR("Feature disabled by user");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = 4;
    }
  }
  else
  {
    v11 = *MEMORY[0x1E0CB2938];
    v12[0] = CFSTR("Maps is not installed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = 2;
  }
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.SharedTrip"), v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
LABEL_13:
    *a3 = objc_retainAutorelease(v9);
LABEL_14:

  return v9 == 0;
}

- (BOOL)_isMapsInstalled
{
  BOOL v3;
  void *v4;
  void *v5;
  int v6;
  MSPMapsPaths *v7;
  MSPMapsPaths *mapsPaths;
  MSPMapsPaths *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v13[8];
  _QWORD v14[4];
  id v15;
  id location[2];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (!self->_confirmedMapsIsInstalled)
  {
    objc_msgSend(MEMORY[0x1E0D01828], "processHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D26D08]);

    if (!v6)
    {
      if ((objc_msgSend(v4, "hasEntitlement:", CFSTR("com.apple.private.coreservices.canmaplsdatabase")) & 1) != 0)
      {
        objc_initWeak(location, self);
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __40__MSPSharedTripService__isMapsInstalled__block_invoke;
        v14[3] = &unk_1E66520A0;
        objc_copyWeak(&v15, location);
        +[MSPMapsPaths mapsApplicationContainerPathsWithInvalidationHandler:](MSPMapsPaths, "mapsApplicationContainerPathsWithInvalidationHandler:", v14);
        v7 = (MSPMapsPaths *)objc_claimAutoreleasedReturnValue();
        mapsPaths = self->_mapsPaths;
        self->_mapsPaths = v7;

        v9 = self->_mapsPaths;
        v3 = v9 != 0;
        if (v9)
        {
          self->_confirmedMapsIsInstalled = 1;
        }
        else
        {
          MSPGetSharedTripLog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v13 = 0;
            _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_ERROR, "[Service] Maps app is not available", v13, 2u);
          }

        }
        objc_destroyWeak(&v15);
        objc_destroyWeak(location);
        goto LABEL_15;
      }
      MSPGetSharedTripLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_1B39C0000, v10, OS_LOG_TYPE_DEBUG, "[Service] Assuming Maps is installed, not entitled to check", (uint8_t *)location, 2u);
      }

    }
    v3 = 1;
    self->_confirmedMapsIsInstalled = 1;
LABEL_15:

    return v3;
  }
  return 1;
}

void __40__MSPSharedTripService__isMapsInstalled__block_invoke(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v2;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[3];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__MSPSharedTripService__isMapsInstalled__block_invoke_2;
    block[3] = &unk_1E6651E88;
    block[4] = v2;
    dispatch_async(v3, block);
  }

}

void __40__MSPSharedTripService__isMapsInstalled__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  MSPGetSharedTripLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B39C0000, v2, OS_LOG_TYPE_ERROR, "[Service] Maps paths invalidated, clearing cached installation state", v5, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 152) = 0;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 144);
  *(_QWORD *)(v3 + 144) = 0;

}

- (id)archivedSharingState
{
  NSObject *v3;
  NSObject *isolationQueue;
  id v5;
  _QWORD v7[6];
  uint8_t buf[8];
  uint8_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  if (!-[MSPSharedTripService _supportsArchivingSharingState](self, "_supportsArchivingSharingState"))
    return 0;
  MSPGetSharedTripLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_archivedSharingState", (const char *)&unk_1B3A3EAC5, buf, 2u);
  }

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  *(_QWORD *)buf = 0;
  v9 = buf;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__8;
  v12 = __Block_byref_object_dispose__8;
  v13 = 0;
  isolationQueue = self->_isolationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__MSPSharedTripService_archivedSharingState__block_invoke;
  v7[3] = &unk_1E6654A98;
  v7[4] = self;
  v7[5] = buf;
  dispatch_sync(isolationQueue, v7);
  v5 = *((id *)v9 + 5);
  _Block_object_dispose(buf, 8);

  return v5;
}

void __44__MSPSharedTripService_archivedSharingState__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 88))
  {
    objc_msgSend(*(id *)(v1 + 72), "archivedSharingStorage");
    v3 = objc_claimAutoreleasedReturnValue();
    -[NSObject setGroupIdentifier:](v3, "setGroupIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
    MSPGetSharedTripLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_INFO, "[Service] Fetching archived sharing state: %@", (uint8_t *)&v8, 0xCu);
    }

    -[NSObject data](v3, "data");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  else
  {
    MSPGetSharedTripLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_INFO, "[Service] No shared trip group identifier, will not create archived sharing state", (uint8_t *)&v8, 2u);
    }
  }

}

- (id)contactsFromArchivedTripSharingState:(id)a3
{
  id v3;
  MSPSharingRestorationStorage *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[MSPSharingRestorationStorage initWithData:]([MSPSharingRestorationStorage alloc], "initWithData:", v3);
    if (v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E10]);
      -[MSPSharingRestorationStorage mapsIdentifiers](v4, "mapsIdentifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v6);

      -[MSPSharingRestorationStorage messagesIdentifiers](v4, "messagesIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v7);

      objc_msgSend(v5, "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[MSPSharedTripContact contactsFromIDSHandles:](MSPSharedTripContact, "contactsFromIDSHandles:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (BOOL)_supportsArchivingSharingState
{
  if (qword_1ED3284E0 != -1)
    dispatch_once(&qword_1ED3284E0, &__block_literal_global_119_0);
  return byte_1ED3284BA;
}

void __54__MSPSharedTripService__supportsArchivingSharingState__block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  const char *v3;
  int v4;
  void *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  byte_1ED3284BA = objc_msgSend(v1, "isEqual:", *MEMORY[0x1E0D26D08]);
  MSPGetSharedTripLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = "YES";
    if (!byte_1ED3284BA)
      v3 = "NO";
    v4 = 138543618;
    v5 = v1;
    v6 = 2080;
    v7 = v3;
    _os_log_impl(&dword_1B39C0000, v2, OS_LOG_TYPE_DEFAULT, "[Service] %{public}@ supports archiving sharing state: %s", (uint8_t *)&v4, 0x16u);
  }

}

- (void)_addTestTripsTo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  if (GEOConfigGetBOOL())
  {
    objc_msgSend(MEMORY[0x1E0D27540], "_msp_testTrip");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0D27540];
    objc_msgSend(v3, "groupIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v4, "_msp_isTestTripBlockedWithIdentifier:", v5);

    if ((v4 & 1) == 0)
      objc_msgSend(v18, "addObject:", v3);

  }
  if (GEOConfigGetBOOL())
  {
    objc_msgSend(MEMORY[0x1E0D27540], "_msp_testTripWithMultipleStops");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0D27540];
    objc_msgSend(v6, "groupIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v7, "_msp_isTestTripBlockedWithIdentifier:", v8);

    if ((v7 & 1) == 0)
      objc_msgSend(v18, "addObject:", v6);

  }
  if (GEOConfigGetBOOL())
  {
    objc_msgSend(MEMORY[0x1E0D27540], "_msp_testTripWithMultipleStopsMiddleOfTrip");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0D27540];
    objc_msgSend(v9, "groupIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = objc_msgSend(v10, "_msp_isTestTripBlockedWithIdentifier:", v11);

    if ((v10 & 1) == 0)
      objc_msgSend(v18, "addObject:", v9);

  }
  if (GEOConfigGetBOOL())
  {
    objc_msgSend(MEMORY[0x1E0D27540], "_msp_testTripSky");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0D27540];
    objc_msgSend(v12, "groupIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = objc_msgSend(v13, "_msp_isTestTripBlockedWithIdentifier:", v14);

    if ((v13 & 1) == 0)
      objc_msgSend(v18, "addObject:", v12);

  }
  if (GEOConfigGetBOOL())
  {
    objc_msgSend(MEMORY[0x1E0D27540], "_msp_testTripClosedTripInPast");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0D27540];
    objc_msgSend(v15, "groupIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = objc_msgSend(v16, "_msp_isTestTripBlockedWithIdentifier:", v17);

    if ((v16 & 1) == 0)
      objc_msgSend(v18, "addObject:", v15);

  }
}

- (void)checkinWithCompletion:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MSPSharedTripService_checkinWithCompletion___block_invoke;
  block[3] = &unk_1E6654818;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __46__MSPSharedTripService_checkinWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_checkinWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)fetchSharingIdentityWithCompletion:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MSPSharedTripService_fetchSharingIdentityWithCompletion___block_invoke;
  block[3] = &unk_1E6654818;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __59__MSPSharedTripService_fetchSharingIdentityWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_fetchSharingIdentityWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)_fetchSharingIdentityWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_fetchSharingIdentityWithCompletion", (const char *)&unk_1B3A3EAC5, buf, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[MSPSharedTripService _remoteObjectProxy](self, "_remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__MSPSharedTripService__fetchSharingIdentityWithCompletion___block_invoke;
  v8[3] = &unk_1E6654AE0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "fetchSharingIdentityWithCompletion:", v8);

}

void __60__MSPSharedTripService__fetchSharingIdentityWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), a2);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__MSPSharedTripService__fetchSharingIdentityWithCompletion___block_invoke_2;
  v7[3] = &unk_1E6653330;
  v5 = *(id *)(a1 + 40);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __60__MSPSharedTripService__fetchSharingIdentityWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)fetchRequiresUserConfirmationOfSharingIdentityWithCompletion:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__MSPSharedTripService_fetchRequiresUserConfirmationOfSharingIdentityWithCompletion___block_invoke;
  block[3] = &unk_1E6654818;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __85__MSPSharedTripService_fetchRequiresUserConfirmationOfSharingIdentityWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_fetchRequiresUserConfirmationOfSharingIdentityWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)_fetchRequiresUserConfirmationOfSharingIdentityWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_fetchRequiresUserConfirmationOfSharingIdentityWithCompletion", (const char *)&unk_1B3A3EAC5, buf, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[MSPSharedTripService _remoteObjectProxy](self, "_remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__MSPSharedTripService__fetchRequiresUserConfirmationOfSharingIdentityWithCompletion___block_invoke;
  v8[3] = &unk_1E6654B30;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "fetchRequiresUserConfirmationOfSharingIdentityWithCompletion:", v8);

}

void __86__MSPSharedTripService__fetchRequiresUserConfirmationOfSharingIdentityWithCompletion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  char v16;

  v7 = a3;
  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __86__MSPSharedTripService__fetchRequiresUserConfirmationOfSharingIdentityWithCompletion___block_invoke_2;
  v12[3] = &unk_1E6654B08;
  v9 = *(id *)(a1 + 32);
  v14 = v8;
  v15 = v9;
  v16 = a2;
  v13 = v7;
  v10 = v8;
  v11 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

uint64_t __86__MSPSharedTripService__fetchRequiresUserConfirmationOfSharingIdentityWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)reportUserConfirmationOfSharingIdentity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *isolationQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__MSPSharedTripService_reportUserConfirmationOfSharingIdentity_completion___block_invoke;
  v11[3] = &unk_1E66548B0;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(isolationQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __75__MSPSharedTripService_reportUserConfirmationOfSharingIdentity_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_reportUserConfirmationOfSharingIdentity:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_reportUserConfirmationOfSharingIdentity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  MSPGetSharedTripLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_reportUserConfirmationOfSharingIdentity", (const char *)&unk_1B3A3EAC5, buf, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[MSPSharedTripService _remoteObjectProxy](self, "_remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__MSPSharedTripService__reportUserConfirmationOfSharingIdentity_completion___block_invoke;
  v11[3] = &unk_1E66535A8;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "reportUserConfirmationOfSharingIdentity:completion:", v7, v11);

}

void __76__MSPSharedTripService__reportUserConfirmationOfSharingIdentity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__MSPSharedTripService__reportUserConfirmationOfSharingIdentity_completion___block_invoke_2;
  v6[3] = &unk_1E6653330;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __76__MSPSharedTripService__reportUserConfirmationOfSharingIdentity_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)startSharingTripWithContacts:(id)a3 capabilityType:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *isolationQueue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a5;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__MSPSharedTripService_startSharingTripWithContacts_capabilityType_completion___block_invoke;
  block[3] = &unk_1E6653648;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __79__MSPSharedTripService_startSharingTripWithContacts_capabilityType_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_startSharingTripWithContacts:capabilityType:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

- (void)_startSharingTripWithContacts:(id)a3 capabilityType:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  MSPGetSharedTripLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    LOWORD(v14) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_startSharingTripWithContacts:capabilityType:", (const char *)&unk_1B3A3EAC5, (uint8_t *)&v14, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  MSPGetSharedTripLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (a4 > 4)
      v12 = CFSTR("Unknown");
    else
      v12 = off_1E6654BC8[a4];
    v14 = 138412546;
    v15 = v8;
    v16 = 2114;
    v17 = v12;
    _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_DEFAULT, "[Service] Start sharing trip with contacts: %@ via %{public}@", (uint8_t *)&v14, 0x16u);
  }

  -[MSPSharedTripService _remoteObjectProxy](self, "_remoteObjectProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "startSharingTripWithContacts:capabilityType:completion:", v8, a4, v9);

}

- (void)startSharingTripWithMessagesGroup:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *isolationQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__MSPSharedTripService_startSharingTripWithMessagesGroup_completion___block_invoke;
  v11[3] = &unk_1E66548B0;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(isolationQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __69__MSPSharedTripService_startSharingTripWithMessagesGroup_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_startSharingTripWithMessagesGroup:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_startSharingTripWithMessagesGroup:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MSPGetSharedTripLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_startSharingTripWithMessagesGroup", (const char *)&unk_1B3A3EAC5, (uint8_t *)&v11, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  MSPGetSharedTripLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1B39C0000, v9, OS_LOG_TYPE_DEFAULT, "[Service] Start sharing trip with group: %@", (uint8_t *)&v11, 0xCu);
  }

  -[MSPSharedTripService _remoteObjectProxy](self, "_remoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startSharingTripWithMessagesGroup:completion:", v6, v7);

}

- (void)stopSharingTripWithContacts:(id)a3 reason:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *isolationQueue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a5;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__MSPSharedTripService_stopSharingTripWithContacts_reason_completion___block_invoke;
  block[3] = &unk_1E6653648;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __70__MSPSharedTripService_stopSharingTripWithContacts_reason_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_stopSharingTripWithContacts:reason:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

- (void)_stopSharingTripWithContacts:(id)a3 reason:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  MSPGetSharedTripLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_stopSharingTripWithContacts", (const char *)&unk_1B3A3EAC5, (uint8_t *)&v13, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  MSPGetSharedTripLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v8;
    _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_DEFAULT, "[Service] Stop sharing trip with Maps/Messages contacts: %@", (uint8_t *)&v13, 0xCu);
  }

  -[MSPSharedTripService _remoteObjectProxy](self, "_remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stopSharingTripWithContacts:reason:completion:", v8, a4, v9);

}

- (void)stopSharingTripWithMessagesGroup:(id)a3 reason:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *isolationQueue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a5;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__MSPSharedTripService_stopSharingTripWithMessagesGroup_reason_completion___block_invoke;
  block[3] = &unk_1E6653648;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __75__MSPSharedTripService_stopSharingTripWithMessagesGroup_reason_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_stopSharingTripWithMessagesGroup:reason:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

- (void)_stopSharingTripWithMessagesGroup:(id)a3 reason:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  MSPGetSharedTripLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_stopSharingTripWithMessagesGroup", (const char *)&unk_1B3A3EAC5, (uint8_t *)&v13, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  MSPGetSharedTripLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v8;
    _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_DEFAULT, "[Service] Stop sharing trip with group: %@", (uint8_t *)&v13, 0xCu);
  }

  -[MSPSharedTripService _remoteObjectProxy](self, "_remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stopSharingTripWithMessagesGroup:reason:completion:", v8, a4, v9);

}

- (void)stopSharingTripWithReason:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *isolationQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__MSPSharedTripService_stopSharingTripWithReason_completion___block_invoke;
  v9[3] = &unk_1E6651B30;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(isolationQueue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __61__MSPSharedTripService_stopSharingTripWithReason_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_stopSharingTripWithReason:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)_stopSharingTripWithReason:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v6 = a4;
  MSPGetSharedTripLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_stopSharingTrip", (const char *)&unk_1B3A3EAC5, buf, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  MSPGetSharedTripLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_DEFAULT, "[Service] Stop sharing trip", v10, 2u);
  }

  -[MSPSharedTripService _remoteObjectProxy](self, "_remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stopSharingTripWithReason:completion:", a3, v6);

}

- (void)fetchActiveHandlesWithCompletion:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MSPSharedTripService_fetchActiveHandlesWithCompletion___block_invoke;
  block[3] = &unk_1E6654818;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __57__MSPSharedTripService_fetchActiveHandlesWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_fetchActiveHandlesWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)_fetchActiveHandlesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_fetchActiveHandlesWithCompletion:", (const char *)&unk_1B3A3EAC5, buf, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEFAULT, "[Service] Fetch active handles", buf, 2u);
  }

  -[MSPSharedTripService _remoteObjectProxy](self, "_remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__MSPSharedTripService__fetchActiveHandlesWithCompletion___block_invoke;
  v9[3] = &unk_1E6654B58;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "fetchActiveHandlesWithCompletion:", v9);

}

void __58__MSPSharedTripService__fetchActiveHandlesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MSPGetSharedTripLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v11 = v3;
    _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_DEFAULT, "[Service] Fetched active handles: %{private}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "updateActiveSharingHandles:", v3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__MSPSharedTripService__fetchActiveHandlesWithCompletion___block_invoke_122;
  v7[3] = &unk_1E6653330;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __58__MSPSharedTripService__fetchActiveHandlesWithCompletion___block_invoke_122(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)fetchSharedTripsWithCompletion:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__MSPSharedTripService_fetchSharedTripsWithCompletion___block_invoke;
  block[3] = &unk_1E6654818;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __55__MSPSharedTripService_fetchSharedTripsWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_fetchSharedTripsWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)_fetchSharedTripsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEFAULT, "[Service] Fetch shared trips", buf, 2u);
  }

  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_fetchSharedTripsOnQueue", (const char *)&unk_1B3A3EAC5, buf, 2u);
  }

  -[MSPSharedTripService _remoteObjectProxy](self, "_remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__MSPSharedTripService__fetchSharedTripsWithCompletion___block_invoke;
  v9[3] = &unk_1E6654B58;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "fetchSharedTripsWithCompletion:", v9);

}

void __56__MSPSharedTripService__fetchSharedTripsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  if (a2)
    v3 = objc_msgSend(a2, "mutableCopy");
  else
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  v4 = (void *)v3;
  objc_msgSend(*(id *)(a1 + 32), "_addTestTripsTo:", v3);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), v4);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__MSPSharedTripService__fetchSharedTripsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E6653330;
  v5 = *(id *)(a1 + 40);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __56__MSPSharedTripService__fetchSharedTripsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)subscribeToSharedTripUpdatesWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *isolationQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__MSPSharedTripService_subscribeToSharedTripUpdatesWithIdentifier_completion___block_invoke;
  v11[3] = &unk_1E66548B0;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(isolationQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __78__MSPSharedTripService_subscribeToSharedTripUpdatesWithIdentifier_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_subscribeToSharedTripUpdatesWithIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_subscribeToSharedTripUpdatesWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  __int128 *v17;
  _QWORD v18[4];
  id v19;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  MSPGetSharedTripLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_DEFAULT, "[Service] Request to subscribe to trip: %@", (uint8_t *)&buf, 0xCu);
  }

  MSPGetSharedTripLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_subscribeToSharedTripUpdatesWithIdentifier", (const char *)&unk_1B3A3EAC5, (uint8_t *)&buf, 2u);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__8;
  v24 = __Block_byref_object_dispose__8;
  v25 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __79__MSPSharedTripService__subscribeToSharedTripUpdatesWithIdentifier_completion___block_invoke;
  v18[3] = &unk_1E6654B80;
  v11 = v7;
  v19 = v11;
  p_buf = &buf;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __79__MSPSharedTripService__subscribeToSharedTripUpdatesWithIdentifier_completion___block_invoke_3;
  v14[3] = &unk_1E6654BA8;
  v12 = (id)MEMORY[0x1B5E2B4E8](v18);
  v16 = v12;
  v14[4] = self;
  v13 = v6;
  v15 = v13;
  v17 = &buf;
  -[MSPSharedTripService _validateCurrentConfigurationWithCompletion:](self, "_validateCurrentConfigurationWithCompletion:", v14);

  _Block_object_dispose(&buf, 8);
}

void __79__MSPSharedTripService__subscribeToSharedTripUpdatesWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__MSPSharedTripService__subscribeToSharedTripUpdatesWithIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E6653580;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v4;
  v10 = v5;
  v8 = v3;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __79__MSPSharedTripService__subscribeToSharedTripUpdatesWithIdentifier_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[4]);
}

void __79__MSPSharedTripService__subscribeToSharedTripUpdatesWithIdentifier_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_subscriptionTokensForTripID:createIfNeeded:", *(_QWORD *)(a1 + 40), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");
    MSPGetSharedTripLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v7 = objc_msgSend(v3, "count");
        v8 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        v21 = v7;
        v22 = 2112;
        v23 = v8;
        _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_INFO, "[Service] Skipping remote subscribe, already %lu subscription tokens for trip: %@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_addSubscriptionTokenForTripID:", *(_QWORD *)(a1 + 40));
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v21 = v12;
        _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEFAULT, "[Service] Subscribe to trip: %@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxyWithErrorHandler:", *(_QWORD *)(a1 + 48));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __79__MSPSharedTripService__subscribeToSharedTripUpdatesWithIdentifier_completion___block_invoke_124;
      v16[3] = &unk_1E6654BA8;
      v15 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(a1 + 40);
      v19 = *(_QWORD *)(a1 + 56);
      v16[4] = v15;
      v17 = v14;
      v18 = *(id *)(a1 + 48);
      objc_msgSend(v13, "subscribeToSharedTripUpdatesWithIdentifier:completion:", v17, v16);

    }
  }
}

void __79__MSPSharedTripService__subscribeToSharedTripUpdatesWithIdentifier_completion___block_invoke_124(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    MSPGetSharedTripLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v9 = 138412546;
      v10 = v5;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_ERROR, "[Service] Failed to subscribe to trip %@: %@", (uint8_t *)&v9, 0x16u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_addSubscriptionTokenForTripID:", *(_QWORD *)(a1 + 40));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)unsubscribeFromSharedTripUpdatesWithIdentifier:(id)a3 completion:(id)a4
{
  -[MSPSharedTripService doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)blockSharedTrip:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__MSPSharedTripService_blockSharedTrip___block_invoke;
  block[3] = &unk_1E6651C58;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __40__MSPSharedTripService_blockSharedTrip___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_blockSharedTrip:", *(_QWORD *)(a1 + 32));

}

- (void)_blockSharedTrip:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEFAULT, "[Service] Block trip: %@", (uint8_t *)&v8, 0xCu);
  }

  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_blockSharedTrip", (const char *)&unk_1B3A3EAC5, (uint8_t *)&v8, 2u);
  }

  -[MSPSharedTripService _remoteObjectProxy](self, "_remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "blockSharedTrip:", v4);

}

- (void)clearBlockedTripIdentifiers
{
  NSObject *isolationQueue;
  _QWORD v4[4];
  id v5;
  id location;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__MSPSharedTripService_clearBlockedTripIdentifiers__block_invoke;
  v4[3] = &unk_1E66520A0;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __51__MSPSharedTripService_clearBlockedTripIdentifiers__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_clearBlockedTripIdentifiers");

}

- (void)_clearBlockedTripIdentifiers
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  MSPGetSharedTripLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEFAULT, "[Service] Clear blocked trip identifiers", buf, 2u);
  }

  MSPGetSharedTripLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_clearBlockedTripIdentifiers", (const char *)&unk_1B3A3EAC5, v6, 2u);
  }

  -[MSPSharedTripService _remoteObjectProxy](self, "_remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearBlockedTripIdentifiers");

}

- (void)purgeExpiredBlockedTripIdentifiers
{
  NSObject *isolationQueue;
  _QWORD v4[4];
  id v5;
  id location;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__MSPSharedTripService_purgeExpiredBlockedTripIdentifiers__block_invoke;
  v4[3] = &unk_1E66520A0;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __58__MSPSharedTripService_purgeExpiredBlockedTripIdentifiers__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_purgeExpiredBlockedTripIdentifiers");

}

- (void)_purgeExpiredBlockedTripIdentifiers
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  MSPGetSharedTripLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEFAULT, "[Service] Purge expired blocked trip identifiers", buf, 2u);
  }

  MSPGetSharedTripLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_purgeExpiredBlockedTripIdentifiers", (const char *)&unk_1B3A3EAC5, v6, 2u);
  }

  -[MSPSharedTripService _remoteObjectProxy](self, "_remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "purgeExpiredBlockedTripIdentifiers");

}

- (void)sharedTripDidBecomeAvailable:(id)a3
{
  NSObject *isolationQueue;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  isolationQueue = self->_isolationQueue;
  v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136380675;
    v9 = "-[MSPSharedTripService sharedTripDidBecomeAvailable:]";
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEBUG, "[Service] %{private}s", (uint8_t *)&v8, 0xCu);
  }

  -[MSPSharedTripService _insertOrUpdateTrip:](self, "_insertOrUpdateTrip:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEOObserverHashTable sharedTripService:didReceiveSharedTrip:](self->_receivingObservers, "sharedTripService:didReceiveSharedTrip:", self, v7);
}

- (void)destinationDidUpdateForSharedTrip:(id)a3
{
  NSObject *isolationQueue;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  isolationQueue = self->_isolationQueue;
  v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136380675;
    v9 = "-[MSPSharedTripService destinationDidUpdateForSharedTrip:]";
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEBUG, "[Service] %{private}s", (uint8_t *)&v8, 0xCu);
  }

  -[MSPSharedTripService _insertOrUpdateTrip:](self, "_insertOrUpdateTrip:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEOObserverHashTable sharedTripService:didUpdateDestinationForSharedTrip:](self->_receivingObservers, "sharedTripService:didUpdateDestinationForSharedTrip:", self, v7);
}

- (void)destinationReachedDidUpdateForSharedTrip:(id)a3
{
  NSObject *isolationQueue;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  isolationQueue = self->_isolationQueue;
  v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136380675;
    v9 = "-[MSPSharedTripService destinationReachedDidUpdateForSharedTrip:]";
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEBUG, "[Service] %{private}s", (uint8_t *)&v8, 0xCu);
  }

  -[MSPSharedTripService _insertOrUpdateTrip:](self, "_insertOrUpdateTrip:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEOObserverHashTable sharedTripService:didUpdateReachedDestinationForSharedTrip:](self->_receivingObservers, "sharedTripService:didUpdateReachedDestinationForSharedTrip:", self, v7);
}

- (void)etaDidUpdateForSharedTrip:(id)a3
{
  NSObject *isolationQueue;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  isolationQueue = self->_isolationQueue;
  v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136380675;
    v9 = "-[MSPSharedTripService etaDidUpdateForSharedTrip:]";
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEBUG, "[Service] %{private}s", (uint8_t *)&v8, 0xCu);
  }

  -[MSPSharedTripService _insertOrUpdateTrip:](self, "_insertOrUpdateTrip:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEOObserverHashTable sharedTripService:didUpdateETAForSharedTrip:](self->_receivingObservers, "sharedTripService:didUpdateETAForSharedTrip:", self, v7);
}

- (void)routeDidUpdateForSharedTrip:(id)a3
{
  NSObject *isolationQueue;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  isolationQueue = self->_isolationQueue;
  v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136380675;
    v9 = "-[MSPSharedTripService routeDidUpdateForSharedTrip:]";
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEBUG, "[Service] %{private}s", (uint8_t *)&v8, 0xCu);
  }

  -[MSPSharedTripService _insertOrUpdateTrip:](self, "_insertOrUpdateTrip:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEOObserverHashTable sharedTripService:didUpdateRouteForSharedTrip:](self->_receivingObservers, "sharedTripService:didUpdateRouteForSharedTrip:", self, v7);
}

- (void)sharedTripDidBecomeUnavailable:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSMutableArray *receivedTrips;
  void *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v10 = 136380675;
    v11 = "-[MSPSharedTripService sharedTripDidBecomeUnavailable:]";
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEBUG, "[Service] %{private}s", (uint8_t *)&v10, 0xCu);
  }

  if (!v4)
  {
    MSPGetSharedTripLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_ERROR, "[Service] Notified trip became unavailable but passed nil", (uint8_t *)&v10, 2u);
    }

  }
  receivedTrips = self->_receivedTrips;
  objc_msgSend(v4, "equalityTest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NSMutableArray indexOfObjectPassingTest:](receivedTrips, "indexOfObjectPassingTest:", v8);

  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_receivedTrips, "removeObjectAtIndex:", v9);
    -[GEOObserverHashTable sharedTripService:didRemoveSharedTrip:](self->_receivingObservers, "sharedTripService:didRemoveSharedTrip:", self, v4);
  }

}

- (void)sharedTripDidClose:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136380675;
    v9 = "-[MSPSharedTripService sharedTripDidClose:]";
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEBUG, "[Service] %{private}s", (uint8_t *)&v8, 0xCu);
  }

  if (!v4)
  {
    MSPGetSharedTripLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_ERROR, "[Service] Notified trip closed but passed nil", (uint8_t *)&v8, 2u);
    }

  }
  -[MSPSharedTripService _insertOrUpdateTrip:](self, "_insertOrUpdateTrip:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEOObserverHashTable sharedTripService:didUpdateClosedTrip:](self->_receivingObservers, "sharedTripService:didUpdateClosedTrip:", self, v7);
}

- (id)_insertOrUpdateTrip:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableArray *receivedTrips;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_insertOrUpdateTrip", (const char *)&unk_1B3A3EAC5, buf, 2u);
  }

  receivedTrips = self->_receivedTrips;
  objc_msgSend(v4, "equalityTest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSMutableArray indexOfObjectPassingTest:](receivedTrips, "indexOfObjectPassingTest:", v7);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v4)
      -[NSMutableArray insertObject:atIndex:](self->_receivedTrips, "insertObject:atIndex:", v4, 0);
    v9 = v4;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_receivedTrips, "objectAtIndex:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "merge:", v4);
    if (objc_msgSend(v9, "hasClosed") && (objc_msgSend(v9, "closed") & 1) != 0
      || objc_msgSend(v9, "hasArrived") && objc_msgSend(v9, "arrived"))
    {
      if (objc_msgSend(v9, "hasEtaInfo"))
      {
        objc_msgSend(v9, "finalETAInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "hasEtaTimestamp");

        if (v11)
        {
          MSPGetSharedTripLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v14 = 0;
            _os_log_impl(&dword_1B39C0000, v12, OS_LOG_TYPE_INFO, "Re-stripping eta and route info from closed/arrived trip", v14, 2u);
          }

          objc_msgSend(v9, "stripArrivedOrClosedTrip");
        }
      }
    }
  }

  return v9;
}

- (void)sharedTripDidStartSharingWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *v6;
  NSString *sharingGroupIdentifier;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136380675;
    v9 = "-[MSPSharedTripService sharedTripDidStartSharingWithIdentifier:]";
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEBUG, "[Service] %{private}s", (uint8_t *)&v8, 0xCu);
  }

  v6 = (NSString *)objc_msgSend(v4, "copy");
  sharingGroupIdentifier = self->_sharingGroupIdentifier;
  self->_sharingGroupIdentifier = v6;

  -[MSPSharedTripService _startMonitoringSystemBlockListIfNeeded](self, "_startMonitoringSystemBlockListIfNeeded");
}

- (void)sharedTripDidUpdateRecipients:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 136315395;
    v7 = "-[MSPSharedTripService sharedTripDidUpdateRecipients:]";
    v8 = 2113;
    v9 = v4;
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_INFO, "[Service] %s: %{private}@", (uint8_t *)&v6, 0x16u);
  }

  -[MSPSharedTripContactController updateActiveSharingHandles:](self->_sharingContactController, "updateActiveSharingHandles:", v4);
}

- (void)sharedTripInvalidatedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *sharingGroupIdentifier;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136380675;
    v8 = "-[MSPSharedTripService sharedTripInvalidatedWithError:]";
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEBUG, "[Service] %{private}s", (uint8_t *)&v7, 0xCu);
  }

  -[MSPSharedTripService _stopMonitoringSystemBlockList](self, "_stopMonitoringSystemBlockList");
  sharingGroupIdentifier = self->_sharingGroupIdentifier;
  self->_sharingGroupIdentifier = 0;

  -[MSPSharedTripContactController reset](self->_sharingContactController, "reset");
  -[GEOObserverHashTable sharedTripService:sharingDidInvalidateWithError:](self->_sendingObservers, "sharedTripService:sharingDidInvalidateWithError:", self, v4);

}

- (void)sharingIdentityDidChange:(id)a3
{
  MSPSharedTripSharingIdentity *v4;
  NSObject *v5;
  MSPSharedTripSharingIdentity *sharingIdentity;
  MSPSharedTripSharingIdentity *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (MSPSharedTripSharingIdentity *)a3;
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136380675;
    v9 = "-[MSPSharedTripService sharingIdentityDidChange:]";
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEBUG, "[Service] %{private}s", (uint8_t *)&v8, 0xCu);
  }

  sharingIdentity = self->_sharingIdentity;
  self->_sharingIdentity = v4;
  v7 = v4;

  -[GEOObserverHashTable sharedTripService:didUpdateSharingIdentity:](self->_sendingObservers, "sharedTripService:didUpdateSharingIdentity:", self, v7);
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  NSObject *isolationQueue;
  id v5;
  void *v6;
  void *v7;

  isolationQueue = self->_isolationQueue;
  v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  -[MSPSharedTripService _openConnectionIfNeeded](self, "_openConnectionIfNeeded");
  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __47__MSPSharedTripService__openConnectionIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  dispatch_group_t *v4;
  dispatch_group_t *v5;
  NSObject *v6;
  dispatch_group_t v7;
  dispatch_group_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  MSPGetSharedTripLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v9 = 138412290;
    v10 = WeakRetained;
    _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_ERROR, "[Service] Connection invalidated: %@", (uint8_t *)&v9, 0xCu);
  }

  v4 = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)v4 + 16) = 1;
    if (v4[15])
    {
      MSPGetSharedTripLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEBUG, "[Service] Leaving checkin group, connection invalidated", (uint8_t *)&v9, 2u);
      }

      dispatch_group_leave(v5[15]);
      v7 = v5[15];
      v5[15] = 0;

    }
    v8 = v5[1];
    v5[1] = 0;

  }
}

void __47__MSPSharedTripService__openConnectionIfNeeded__block_invoke_180(uint64_t a1)
{
  NSObject *WeakRetained;
  NSObject *v3;
  dispatch_group_t *v4;
  dispatch_group_t *v5;
  NSObject *v6;
  dispatch_group_t v7;
  dispatch_group_t v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  dispatch_group_t v13;
  NSObject *v14;
  dispatch_group_t v15;
  double v16;
  dispatch_group_t v17;
  NSObject *v18;
  NSObject *v19;
  dispatch_group_t v20;
  int v21;
  dispatch_group_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  MSPGetSharedTripLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v21 = 138412290;
    v22 = WeakRetained;
    _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_ERROR, "[Service] Connection interrupted: %@", (uint8_t *)&v21, 0xCu);
  }

  v4 = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)v4 + 16) = 1;
    if (v4[15])
    {
      MSPGetSharedTripLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEBUG, "[Service] Leaving checkin group, connection interrupted", (uint8_t *)&v21, 2u);
      }

      dispatch_group_leave(v5[15]);
      v7 = v5[15];
      v5[15] = 0;

    }
    v8 = v5[5];
    v9 = (unint64_t)&v5[4]->isa + 1;
    v5[4] = (dispatch_group_t)v9;
    v10 = v8;
    v11 = v10;
    if (v9 < 5)
    {
      if (v10)
      {
        -[NSObject timeIntervalSinceNow](v10, "timeIntervalSinceNow");
        if (v16 <= 0.0)
        {
          v17 = v5[5];
          v5[5] = 0;

          v5[4] = 0;
          MSPGetSharedTripLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v21) = 0;
            _os_log_impl(&dword_1B39C0000, v18, OS_LOG_TYPE_DEFAULT, "[Service] BackoffUntilDate has passed, resetting connection retries", (uint8_t *)&v21, 2u);
          }

        }
      }
      MSPGetSharedTripLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v5[4];
        v21 = 134218240;
        v22 = v20;
        v23 = 2048;
        v24 = 5;
        _os_log_impl(&dword_1B39C0000, v19, OS_LOG_TYPE_DEFAULT, "[Service] Attempting to resume connection (%lu/%lu)", (uint8_t *)&v21, 0x16u);
      }

      -[dispatch_group_t _checkin](v5, "_checkin");
    }
    else
    {
      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 3600.0);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = v5[5];
        v5[5] = (dispatch_group_t)v12;

      }
      MSPGetSharedTripLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v5[5];
        v21 = 138412290;
        v22 = v15;
        _os_log_impl(&dword_1B39C0000, v14, OS_LOG_TYPE_DEFAULT, "[Service] Will not attempt to resume connection, backing off until %@", (uint8_t *)&v21, 0xCu);
      }

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockListCoalescingTimer, 0);
  objc_storeStrong(&self->_blockListMonitoringObserver, 0);
  objc_storeStrong((id *)&self->_mapsPaths, 0);
  objc_storeStrong(&self->_serverDisabledDefaultListener, 0);
  objc_storeStrong(&self->_userDisabledDefaultListener, 0);
  objc_storeStrong((id *)&self->_checkinDispatchGroup, 0);
  objc_storeStrong((id *)&self->_sharingIdentity, 0);
  objc_storeStrong((id *)&self->_sharingGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_subscriptionTokensByTripID, 0);
  objc_storeStrong((id *)&self->_sharingContactController, 0);
  objc_storeStrong((id *)&self->_receivedTrips, 0);
  objc_storeStrong((id *)&self->_sendingObservers, 0);
  objc_storeStrong((id *)&self->_receivingObservers, 0);
  objc_storeStrong((id *)&self->_reconnectionBackoffUntilDate, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
