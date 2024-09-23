@implementation FMFSession

void __33__FMFSession_didUpdateLocations___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(*(id *)(a1 + 40), "count") && objc_msgSend(v2, "conformsToProtocol:", &unk_1F03A8CC8))
  {
    LogCategory_Daemon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1DC81B000, v3, OS_LOG_TYPE_DEFAULT, "removing all location annotations from map", v4, 2u);
    }

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "removeAllFriendLocationsFromMap");
  }

}

- (void)didUpdateFollowing:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  LogCategory_Daemon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1DC81B000, v4, OS_LOG_TYPE_DEFAULT, "didUpdateFollowing: %@", (uint8_t *)&v6, 0xCu);
  }

  +[FMFSessionDataManager sharedInstance](FMFSessionDataManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFollowing:", v3);

}

- (void)didUpdateFollowers:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  LogCategory_Daemon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1DC81B000, v4, OS_LOG_TYPE_DEFAULT, "didUpdateFollowers: %@", (uint8_t *)&v6, 0xCu);
  }

  +[FMFSessionDataManager sharedInstance](FMFSessionDataManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFollowers:", v3);

}

- (void)didUpdateFences:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    LogCategory_Daemon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1DC81B000, v5, OS_LOG_TYPE_DEFAULT, "FMFSession didUpdateFences: %@", buf, 0xCu);
    }

    +[FMFSessionDataManager sharedInstance](FMFSessionDataManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFences:", v4);

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __30__FMFSession_didUpdateFences___block_invoke;
    v7[3] = &unk_1EA4F2AD8;
    v7[4] = self;
    v8 = v4;
    -[FMFSession dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v7);

  }
}

void __24__FMFSession_connection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "__connection");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)serverProxy
{
  void *v2;
  void *v3;

  -[FMFSession connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_337);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSXPCConnection)connection
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  -[FMFSession connectionQueue](self, "connectionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__FMFSession_connection__block_invoke;
  v6[3] = &unk_1EA4F2C78;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSXPCConnection *)v4;
}

- (id)__connection
{
  NSObject *v2;
  NSXPCConnection *connection;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSXPCConnection *v39;
  NSXPCConnection *v40;
  NSObject *v41;
  NSXPCConnection *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  FMFSessionProxy *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  _QWORD v71[4];
  id v72;
  id v73;
  _QWORD v74[4];
  id v75;
  id v76;
  id location;
  uint8_t buf[4];
  NSXPCConnection *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  -[FMFSession connectionQueue](self, "connectionQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  connection = self->_connection;
  if (!connection)
  {
    objc_initWeak(&location, self);
    v64 = &unk_1F03A8C68;
    v62 = &unk_1F03A4970;
    v4 = (void *)MEMORY[0x1E0C99E60];
    v5 = objc_opt_class();
    objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, v14, v15, v16, objc_opt_class(), 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, v19, v20, objc_opt_class(), 0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, v25, objc_opt_class(), 0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1E0C99E60];
    v29 = objc_opt_class();
    v30 = objc_opt_class();
    v31 = objc_opt_class();
    v32 = objc_opt_class();
    v33 = objc_opt_class();
    v34 = objc_opt_class();
    v35 = objc_opt_class();
    v36 = objc_opt_class();
    v37 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, v30, v31, v32, v33, v34, v35, v36, v37, objc_opt_class(), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.icloud.fmfd"), 4096);
    v40 = self->_connection;
    self->_connection = v39;

    LogCategory_Daemon();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = self->_connection;
      *(_DWORD *)buf = 138412290;
      v79 = v42;
      _os_log_impl(&dword_1DC81B000, v41, OS_LOG_TYPE_DEFAULT, "Created connection: %@", buf, 0xCu);
    }

    v43 = (void *)objc_opt_new();
    objc_storeStrong((id *)&self->_sessionInterruptionFuture, v43);
    v44 = MEMORY[0x1E0C809B0];
    v74[0] = MEMORY[0x1E0C809B0];
    v74[1] = 3221225472;
    v74[2] = __26__FMFSession___connection__block_invoke;
    v74[3] = &unk_1EA4F2CA0;
    objc_copyWeak(&v76, &location);
    v60 = v43;
    v75 = v60;
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v74);
    v45 = (void *)objc_opt_new();
    objc_storeStrong((id *)&self->_sessionInvalidationFuture, v45);
    v71[0] = v44;
    v71[1] = 3221225472;
    v71[2] = __26__FMFSession___connection__block_invoke_2;
    v71[3] = &unk_1EA4F2CA0;
    objc_copyWeak(&v73, &location);
    v46 = v45;
    v72 = v46;
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v71);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", v64);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v47);
    objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v69, sel_getHandlesSharingLocationsWithMe_, 0, 1);
    objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v69, sel_getHandlesSharingLocationsWithMeWithGroupId_completion_, 0, 1);
    objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v69, sel_getHandlesSharingMyLocation_, 0, 1);
    objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v69, sel_getHandlesSharingMyLocationWithGroupId_completion_, 0, 1);
    objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v67, sel_getPendingFriendshipRequestsWithCompletion_, 0, 1);
    objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v67, sel_getPendingFriendshipRequestsWithCompletion_, 1, 1);
    objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v69, sel_getHandlesWithPendingOffers_, 0, 1);
    objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v68, sel_getAllLocations_, 0, 1);
    objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v66, sel_allDevices_, 0, 1);
    objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v65, sel_favoritesForMaxCount_completion_, 0, 1);
    objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v68, sel_nearbyLocationsWithCompletion_, 0, 1);
    objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v69, sel_getHandlesWithPendingOffers_, 0, 1);
    objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v69, sel_canOfferToHandles_completion_, 0, 1);
    v48 = (void *)MEMORY[0x1E0C99E60];
    v49 = objc_opt_class();
    objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v50, sel_sendFriendshipOfferToHandles_groupId_callerId_endDate_completion_, 1, 1);

    objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v61, sel_dumpStateWithCompletion_, 0, 1);
    objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_addFence_completion_, 0, 1);
    objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_deleteFence_completion_, 0, 1);
    objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_getFences_, 0, 1);
    objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_fencesForHandles_completion_, 0, 1);
    objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v63, sel_getFavoritesWithCompletion_, 0, 1);
    objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_triggerWithUUID_forFenceWithID_withStatus_forDate_completion_, 0, 1);
    v51 = -[FMFSessionProxy initWithFMFSession:]([FMFSessionProxy alloc], "initWithFMFSession:", self);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", v62);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v52);
    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", v51);
    objc_msgSend(v52, "setClasses:forSelector:argumentIndex:ofReply:", v68, sel_setLocations_, 0, 0);
    objc_msgSend(v52, "setClasses:forSelector:argumentIndex:ofReply:", v69, sel_didUpdatePendingOffersForHandles_, 0, 0);
    objc_msgSend(v52, "setClasses:forSelector:argumentIndex:ofReply:", v66, sel_didUpdateActiveDeviceList_, 0, 0);
    objc_msgSend(v52, "setClasses:forSelector:argumentIndex:ofReply:", v69, sel_didUpdateFollowers_, 0, 0);
    objc_msgSend(v52, "setClasses:forSelector:argumentIndex:ofReply:", v69, sel_didUpdateFollowing_, 0, 0);
    objc_msgSend(v52, "setClasses:forSelector:argumentIndex:ofReply:", v68, sel_didUpdateLocations_, 0, 0);
    objc_msgSend(v52, "setClasses:forSelector:argumentIndex:ofReply:", v65, sel_didUpdateFavorites_, 0, 0);
    objc_msgSend(v52, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_didUpdateFences_, 0, 0);
    -[NSXPCConnection resume](self->_connection, "resume");
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_335);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "numberWithInt:", objc_msgSend(v55, "processIdentifier"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setSessionClientPid:", v56);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "bundleIdentifier");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setSessionClientBundleId:", v58);

    objc_msgSend(v53, "sessionWasCreatedRefresh");
    objc_destroyWeak(&v73);

    objc_destroyWeak(&v76);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)_registerForFMFDLaunchedNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  FMFSession *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_FMFDDaemonDidLaunch, CFSTR("com.apple.icloud.fmfd.launched"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  LogCategory_Daemon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1DC81B000, v4, OS_LOG_TYPE_DEFAULT, "Registered for _FMFDDaemonDidLaunch notification for session: (%@ - client bundle id(%@)", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__daemonDidLaunch, CFSTR("FMFSessionDaemonDidLaunchNotification"), 0);

}

- (void)didUpdateLocations:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1DC81B000, v5, OS_LOG_TYPE_DEFAULT, "didUpdateLocations: %@", buf, 0xCu);
  }

  +[FMFSessionDataManager sharedInstance](FMFSessionDataManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocations:", v4);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__FMFSession_didUpdateLocations___block_invoke;
  v8[3] = &unk_1EA4F2AD8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[FMFSession dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v8);

}

void __40__FMFSession_locatingInProgressChanged___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setLocations:", v2);

}

- (void)setLocations:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  -[FMFSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __27__FMFSession_setLocations___block_invoke;
  v8[3] = &unk_1EA4F2AD8;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[FMFSession dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v8);

}

- (void)dispatchOnDelegateQueue:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  _QWORD v7[4];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[FMFSession delegateQueue](self, "delegateQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FMFSession delegateQueue](self, "delegateQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__FMFSession_dispatchOnDelegateQueue___block_invoke;
    v7[3] = &unk_1EA4F2D08;
    v8 = v4;
    objc_msgSend(v6, "addOperationWithBlock:", v7);

  }
  else if (v4)
  {
    v4[2](v4);
  }

}

- (NSOperationQueue)delegateQueue
{
  return self->_delegateQueue;
}

- (FMFSessionDelegate)delegate
{
  return (FMFSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

void __27__FMFSession_setLocations___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(*(id *)(a1 + 40), "didReceiveLocation:", v7, (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)locatingInProgressChanged:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "handle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v10 = v6;
    v11 = 2112;
    v12 = v4;
    v13 = 1024;
    v14 = objc_msgSend(v4, "isLocatingInProgress");
    _os_log_impl(&dword_1DC81B000, v5, OS_LOG_TYPE_DEFAULT, "locatingInProgressChanged: %@, %@, %d", buf, 0x1Cu);

  }
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__FMFSession_locatingInProgressChanged___block_invoke;
    v7[3] = &unk_1EA4F2AD8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

uint64_t __38__FMFSession_dispatchOnDelegateQueue___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setIsModelInitialized:(BOOL)a3
{
  self->_isModelInitialized = a3;
}

- (void)modelDidLoad
{
  -[FMFSession setIsModelInitialized:](self, "setIsModelInitialized:", 1);
}

uint64_t __32__FMFSession_Fences__getFences___block_invoke_5(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

void __51__FMFSession_didChangeActiveLocationSharingDevice___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "deviceName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1DC81B000, v3, OS_LOG_TYPE_DEFAULT, "didChangeLocationSharingDevice: %@", (uint8_t *)&v5, 0xCu);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didChangeActiveLocationSharingDevice:", *(_QWORD *)(a1 + 40));

}

- (void)getFences:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  FMFSession *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    _os_log_impl(&dword_1DC81B000, v5, OS_LOG_TYPE_DEFAULT, "FMFSession: getFences: %@", buf, 0xCu);
  }

  -[FMFSession serverProxy](self, "serverProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__FMFSession_Fences__getFences___block_invoke;
  v8[3] = &unk_1EA4F2530;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "getFences:", v8);

}

- (FMFSession)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v6;
  id v7;
  FMFSession *v8;
  dispatch_queue_t v9;
  dispatch_queue_t v10;
  NSMutableSet *v11;
  NSMutableSet *internalHandles;
  id v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FMFSession;
  v8 = -[FMFSession init](&v16, sel_init);
  if (v8)
  {
    v9 = dispatch_queue_create("FMFSessionConnectionQueue", 0);
    -[FMFSession setConnectionQueue:](v8, "setConnectionQueue:", v9);

    if (initWithDelegate_delegateQueue__onceToken != -1)
      dispatch_once(&initWithDelegate_delegateQueue__onceToken, &__block_literal_global_120);
    dispatch_sync((dispatch_queue_t)sessionCountQueue, &__block_literal_global_122);
    v10 = dispatch_queue_create("FMFSession-HandlesQueue", 0);
    -[FMFSession setHandlesQueue:](v8, "setHandlesQueue:", v10);

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    internalHandles = v8->_internalHandles;
    v8->_internalHandles = v11;

    -[FMFSession setDelegate:](v8, "setDelegate:", v6);
    -[FMFSession setDelegateQueue:](v8, "setDelegateQueue:", v7);
    v13 = -[FMFSession serverProxy](v8, "serverProxy");
    -[FMFSession _registerForFMFDLaunchedNotification](v8, "_registerForFMFDLaunchedNotification");
    -[FMFSession _registerForApplicationLifecycleEvents](v8, "_registerForApplicationLifecycleEvents");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v8, sel_locatingInProgressChanged_, CFSTR("locatingInProgressChanged"), 0);

  }
  return v8;
}

- (void)setHandlesQueue:(id)a3
{
  objc_storeStrong((id *)&self->_handlesQueue, a3);
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionQueue, a3);
}

- (void)_registerForApplicationLifecycleEvents
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_applicationDidEnterBackground, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_applicationWillEnterForeground, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);

}

void __45__FMFSession_initWithDelegate_delegateQueue___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("FMFSession.count", 0);
  v1 = (void *)sessionCountQueue;
  sessionCountQueue = (uint64_t)v0;

  sessionCount = 0;
}

- (void)didChangeActiveLocationSharingDevice:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__FMFSession_didChangeActiveLocationSharingDevice___block_invoke;
  v6[3] = &unk_1EA4F2AD8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[FMFSession dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v6);

}

void __45__FMFSession_initWithDelegate_delegateQueue___block_invoke_2()
{
  uint64_t v0;
  NSObject *v1;

  v0 = sessionCount++;
  if (v0 >= 9)
  {
    LogCategory_Daemon();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
      __45__FMFSession_initWithDelegate_delegateQueue___block_invoke_2_cold_1(v1);

  }
}

void __35__FMFSession_didUpdatePreferences___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didUpdatePreferences:", *(_QWORD *)(a1 + 40));

}

void __30__FMFSession_didUpdateFences___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didUpdateFences:", *(_QWORD *)(a1 + 40));

}

- (void)didUpdatePreferences:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1DC81B000, v5, OS_LOG_TYPE_DEFAULT, "FMFSession didUpdatePreferences: %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__FMFSession_didUpdatePreferences___block_invoke;
  v7[3] = &unk_1EA4F2AD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[FMFSession dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v7);

}

void __32__FMFSession_Fences__getFences___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  LogCategory_Daemon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1DC81B000, v7, OS_LOG_TYPE_DEFAULT, "FMFSession: getFences result: error? %@, fences: %@", buf, 0x16u);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __32__FMFSession_Fences__getFences___block_invoke_5;
  v12[3] = &unk_1EA4F22C8;
  v8 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v14 = v6;
  v15 = v9;
  v13 = v5;
  v10 = v6;
  v11 = v5;
  objc_msgSend(v8, "dispatchOnDelegateQueue:", v12);

}

- (void)includeDeviceInAutomations:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[FMFSession serverProxy](self, "serverProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__FMFSession_HomeKit__includeDeviceInAutomations___block_invoke;
  v7[3] = &unk_1EA4F2150;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "includeDeviceInAutomations:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __50__FMFSession_HomeKit__includeDeviceInAutomations___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  NSObject *v12;
  char v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  LogCategory_Daemon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v15 = a2;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1DC81B000, v6, OS_LOG_TYPE_DEFAULT, "includeDeviceInAutomations: %i %@", buf, 0x12u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    LogCategory_Daemon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DC81B000, v9, OS_LOG_TYPE_DEFAULT, "includeDeviceInAutomations: Could not dispatch to delegate queue. FMFSession was dereferenced.", buf, 2u);
    }
    goto LABEL_8;
  }
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__FMFSession_HomeKit__includeDeviceInAutomations___block_invoke_1;
    v10[3] = &unk_1EA4F2128;
    v12 = v8;
    v13 = a2;
    v11 = v5;
    objc_msgSend(WeakRetained, "dispatchOnDelegateQueue:", v10);

    v9 = v12;
LABEL_8:

  }
}

uint64_t __50__FMFSession_HomeKit__includeDeviceInAutomations___block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)iCloudAccountNameWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__FMFSession_Internal__iCloudAccountNameWithCompletion___block_invoke;
  v7[3] = &unk_1EA4F21B0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "iCloudAccountNameWithCompletion:", v7);

}

uint64_t __56__FMFSession_Internal__iCloudAccountNameWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)getActiveLocationSharingDevice
{
  void *v3;
  FMFSynchronizer *v4;
  void *v5;
  FMFSynchronizer *v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  FMFSynchronizer *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[FMFSession(Internal) getActiveLocationSharingDevice]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FMFSynchronizer initWithDescription:andTimeout:]([FMFSynchronizer alloc], "initWithDescription:andTimeout:", v3, 1.0);
  -[FMFSession serverProxy](self, "serverProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __54__FMFSession_Internal__getActiveLocationSharingDevice__block_invoke;
  v12 = &unk_1EA4F21D8;
  v14 = &v15;
  v6 = v4;
  v13 = v6;
  objc_msgSend(v5, "deviceSharingLocation:", &v9);

  -[FMFSynchronizer wait](v6, "wait", v9, v10, v11, v12);
  v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v7;
}

void __54__FMFSession_Internal__getActiveLocationSharingDevice__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "signal");

}

- (id)getAllDevices
{
  void *v3;
  FMFSynchronizer *v4;
  void *v5;
  FMFSynchronizer *v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  FMFSynchronizer *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[FMFSession(Internal) getAllDevices]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FMFSynchronizer initWithDescription:andTimeout:]([FMFSynchronizer alloc], "initWithDescription:andTimeout:", v3, 1.0);
  -[FMFSession serverProxy](self, "serverProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __37__FMFSession_Internal__getAllDevices__block_invoke;
  v12 = &unk_1EA4F2200;
  v14 = &v15;
  v6 = v4;
  v13 = v6;
  objc_msgSend(v5, "allDevices:", &v9);

  -[FMFSynchronizer wait](v6, "wait", v9, v10, v11, v12);
  v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v7;
}

void __37__FMFSession_Internal__getAllDevices__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "signal");

}

- (double)maxLocatingInterval
{
  void *v3;
  FMFSynchronizer *v4;
  void *v5;
  FMFSynchronizer *v6;
  double v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, double);
  void *v12;
  FMFSynchronizer *v13;
  uint64_t *v14;
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;

  v15 = 0;
  v16 = (double *)&v15;
  v17 = 0x2020000000;
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[FMFSession(Internal) maxLocatingInterval]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FMFSynchronizer initWithDescription:andTimeout:]([FMFSynchronizer alloc], "initWithDescription:andTimeout:", v3, 1.0);
  -[FMFSession serverProxy](self, "serverProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __43__FMFSession_Internal__maxLocatingInterval__block_invoke;
  v12 = &unk_1EA4F2228;
  v14 = &v15;
  v6 = v4;
  v13 = v6;
  objc_msgSend(v5, "getMaxLocatingInterval:", &v9);

  -[FMFSynchronizer wait](v6, "wait", v9, v10, v11, v12);
  v7 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v7;
}

uint64_t __43__FMFSession_Internal__maxLocatingInterval__block_invoke(uint64_t a1, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

- (void)getAllDevices:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__FMFSession_Internal__getAllDevices___block_invoke;
  v7[3] = &unk_1EA4F2250;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "allDevices:", v7);

}

uint64_t __38__FMFSession_Internal__getAllDevices___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeDevice:completion:", v7, v6);

}

- (void)getPrettyNameForHandle:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getPrettyNameForHandle:completion:", v7, v6);

}

- (void)getRecordIdForHandle:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getRecordIdForHandle:completion:", v7, v6);

}

- (id)verifyRestrictionsAndShowDialogIfRequired
{
  void *v3;
  void *v4;

  if (+[FMFSession FMFRestricted](FMFSession, "FMFRestricted"))
  {
    -[FMFSession serverProxy](self, "serverProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "showRestrictedAlert");

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.fmf.error"), 105, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setExpiredInitTimestamp
{
  id v2;

  -[FMFSession serverProxy](self, "serverProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setExpiredInitTimestamp");

}

- (BOOL)is5XXError:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "code") == 1006 || objc_msgSend(v3, "code") == 1007;

  return v4;
}

- (BOOL)shouldHandleErrorInFWK:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v7;
  NSObject *v8;
  _DWORD v10[2];
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "code");
    v7 = ((unint64_t)(v5 - 1000) > 5 || ((1 << (v5 + 24)) & 0x2B) == 0) && v5 != 104;
  }
  else
  {
    v7 = 0;
  }
  LogCategory_Daemon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109376;
    v10[1] = v7;
    v11 = 2048;
    v12 = objc_msgSend(v4, "code");
    _os_log_impl(&dword_1DC81B000, v8, OS_LOG_TYPE_DEFAULT, "shouldHandleErrorInFWK:%d, error.code(%ld)", (uint8_t *)v10, 0x12u);
  }

  return v7;
}

- (void)crashDaemon
{
  id v2;

  -[FMFSession serverProxy](self, "serverProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "crashDaemon");

}

- (void)exit5XXGracePeriod
{
  id v2;

  -[FMFSession serverProxy](self, "serverProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exit5XXGracePeriod");

}

- (void)isIn5XXGracePeriodWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__FMFSession_Internal__isIn5XXGracePeriodWithCompletion___block_invoke;
  v7[3] = &unk_1EA4F2278;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "isIn5XXGracePeriodWithCompletion:", v7);

}

uint64_t __57__FMFSession_Internal__isIn5XXGracePeriodWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendIDSPacket:(id)a3 toHandle:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendIDSPacket:toHandle:", v7, v6);

}

- (void)sendIDSMessage:(id)a3 toIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendIDSMessage:toIdentifier:completion:", v10, v9, v8);

}

- (void)dumpStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__FMFSession_Internal__dumpStateWithCompletion___block_invoke;
  v7[3] = &unk_1EA4F22A0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "dumpStateWithCompletion:", v7);

}

uint64_t __48__FMFSession_Internal__dumpStateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sessionHandleReport:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__FMFSession_Internal__sessionHandleReport___block_invoke;
  v7[3] = &unk_1EA4F22A0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "sessionHandleReport:", v7);

}

uint64_t __44__FMFSession_Internal__sessionHandleReport___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getDataForPerformanceRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getDataForPerformanceRequest:", v4);

}

- (void)showShareMyLocationiCloudSettingsOffAlert
{
  id v2;

  -[FMFSession serverProxy](self, "serverProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showShareMyLocationiCloudSettingsOffAlert");

}

- (void)showShareMyLocationRestrictedAlert
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DC81B000, v3, OS_LOG_TYPE_DEFAULT, "FMFSession: showShareMyLocationRestrictedAlert", v5, 2u);
  }

  -[FMFSession serverProxy](self, "serverProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showRestrictedAlert");

}

- (void)showMeDeviceAlert
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DC81B000, v3, OS_LOG_TYPE_DEFAULT, "FMFSession: showMeDeviceAlert", v5, 2u);
  }

  -[FMFSession serverProxy](self, "serverProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showMeDeviceAlert");

}

- (void)refreshLocationForHandle:(id)a3 callerId:(id)a4 priority:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__FMFSession_Locate__refreshLocationForHandle_callerId_priority_completion___block_invoke;
  v15[3] = &unk_1EA4F22F0;
  v15[4] = self;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v13, "fetchLocationForHandle:callerId:priority:completion:", v12, v11, a5, v15);

}

void __76__FMFSession_Locate__refreshLocationForHandle_callerId_priority_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__FMFSession_Locate__refreshLocationForHandle_callerId_priority_completion___block_invoke_2;
  v11[3] = &unk_1EA4F22C8;
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v5;
  v14 = v8;
  v12 = v6;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v7, "dispatchOnDelegateQueue:", v11);

}

uint64_t __76__FMFSession_Locate__refreshLocationForHandle_callerId_priority_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)refreshLocationForHandles:(id)a3 callerId:(id)a4 priority:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__FMFSession_Locate__refreshLocationForHandles_callerId_priority_completion___block_invoke;
  v15[3] = &unk_1EA4F22F0;
  v15[4] = self;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v13, "fetchLocationForHandles:callerId:priority:completion:", v12, v11, a5, v15);

}

void __77__FMFSession_Locate__refreshLocationForHandles_callerId_priority_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__FMFSession_Locate__refreshLocationForHandles_callerId_priority_completion___block_invoke_2;
  v11[3] = &unk_1EA4F22C8;
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v5;
  v14 = v8;
  v12 = v6;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v7, "dispatchOnDelegateQueue:", v11);

}

uint64_t __77__FMFSession_Locate__refreshLocationForHandles_callerId_priority_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)locationForHandle:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__FMFSession_Locate__locationForHandle_completion___block_invoke;
  v10[3] = &unk_1EA4F2340;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "locationForHandle:completion:", v7, v10);

}

void __51__FMFSession_Locate__locationForHandle_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__FMFSession_Locate__locationForHandle_completion___block_invoke_2;
  v15[3] = &unk_1EA4F2318;
  v10 = *(void **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v19 = v11;
  v12 = v9;
  v13 = v8;
  v14 = v7;
  objc_msgSend(v10, "dispatchOnDelegateQueue:", v15);

}

uint64_t __51__FMFSession_Locate__locationForHandle_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5], a1[6]);
  return result;
}

- (void)getActiveLocationSharingDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[16];

  v4 = a3;
  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DC81B000, v5, OS_LOG_TYPE_DEFAULT, "getActiveLocationSharingDevice:", buf, 2u);
  }

  -[FMFSession serverProxy](self, "serverProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v8 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __52__FMFSession_Admin__getActiveLocationSharingDevice___block_invoke;
  v20[3] = &unk_1EA4F2428;
  v21 = v4;
  v9 = v4;
  v10 = (id)objc_msgSend(v7, "addCompletionBlock:", v20);
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __52__FMFSession_Admin__getActiveLocationSharingDevice___block_invoke_1;
  v18[3] = &unk_1EA4F2450;
  v11 = v7;
  v19 = v11;
  -[FMFSession addInvalidationHander:](self, "addInvalidationHander:", v18);
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __52__FMFSession_Admin__getActiveLocationSharingDevice___block_invoke_4;
  v16[3] = &unk_1EA4F2450;
  v12 = v11;
  v17 = v12;
  -[FMFSession addInterruptionHander:](self, "addInterruptionHander:", v16);
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __52__FMFSession_Admin__getActiveLocationSharingDevice___block_invoke_5;
  v14[3] = &unk_1EA4F24A0;
  v14[4] = self;
  v15 = v12;
  v13 = v12;
  objc_msgSend(v6, "deviceSharingLocation:", v14);

}

void __52__FMFSession_Admin__getActiveLocationSharingDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  LogCategory_Daemon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1DC81B000, v7, OS_LOG_TYPE_DEFAULT, "getActiveLocationSharingDevice completed.", (uint8_t *)&v9, 2u);
  }

  LogCategory_Daemon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1DC81B000, v8, OS_LOG_TYPE_DEFAULT, "getActiveLocationSharingDevice calling completion with result: %@, error: %@", (uint8_t *)&v9, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __52__FMFSession_Admin__getActiveLocationSharingDevice___block_invoke_1(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  LogCategory_Daemon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DC81B000, v2, OS_LOG_TYPE_DEFAULT, "getActiveLocationSharingDevice invalidated. Finishing with error.", v5, 2u);
  }

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.fmf.error"), 1020, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithError:", v4);

}

void __52__FMFSession_Admin__getActiveLocationSharingDevice___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  LogCategory_Daemon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DC81B000, v2, OS_LOG_TYPE_DEFAULT, "getActiveLocationSharingDevice interrupted. Finishing with error.", v5, 2u);
  }

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.fmf.error"), 1019, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithError:", v4);

}

void __52__FMFSession_Admin__getActiveLocationSharingDevice___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__FMFSession_Admin__getActiveLocationSharingDevice___block_invoke_2;
  v10[3] = &unk_1EA4F2478;
  v11 = v6;
  v7 = *(void **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v13 = v5;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "dispatchOnDelegateQueue:", v10);

}

uint64_t __52__FMFSession_Admin__getActiveLocationSharingDevice___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3)
    return objc_msgSend(v2, "finishWithError:");
  else
    return objc_msgSend(v2, "finishWithResult:", a1[6]);
}

- (void)getThisDeviceAndCompanion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DC81B000, v5, OS_LOG_TYPE_DEFAULT, "getThisDeviceAndCompanion:", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__FMFSession_Admin__getThisDeviceAndCompanion___block_invoke;
  v7[3] = &unk_1EA4F2250;
  v8 = v4;
  v6 = v4;
  -[FMFSession getAllDevices:](self, "getAllDevices:", v7);

}

void __47__FMFSession_Admin__getThisDeviceAndCompanion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    LogCategory_Daemon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __47__FMFSession_Admin__getThisDeviceAndCompanion___block_invoke_cold_1((uint64_t)v6, v7);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = 0;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v5);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v14, "isThisDevice"))
          {
            v15 = v14;

            v10 = v15;
          }
          if (objc_msgSend(v14, "isCompanionDevice"))
          {
            v16 = v14;

            v11 = v16;
          }
        }
        v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)setActiveDevice:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  _BOOL4 v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  void (**v22)(id, void *);

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = +[FMFSession FMFRestricted](FMFSession, "FMFRestricted");
  -[FMFSession serverProxy](self, "serverProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "showRestrictedAlert");

    LogCategory_Daemon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[FMFSession(Admin) setActiveDevice:completion:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.fmf.error"), 105, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v19);

    }
  }
  else
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __48__FMFSession_Admin__setActiveDevice_completion___block_invoke;
    v20[3] = &unk_1EA4F2558;
    v20[4] = self;
    v22 = v7;
    v21 = v6;
    objc_msgSend(v10, "isNetworkReachable:", v20);

  }
}

void __48__FMFSession_Admin__setActiveDevice_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "serverProxy");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __48__FMFSession_Admin__setActiveDevice_completion___block_invoke_5;
      v20[3] = &unk_1EA4F2508;
      v8 = *(_QWORD *)(a1 + 40);
      v20[4] = *(_QWORD *)(a1 + 32);
      v21 = *(id *)(a1 + 48);
      objc_msgSend(v7, "setActiveDevice:completion:", v8, v20);

      v9 = v21;
    }
    else
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __48__FMFSession_Admin__setActiveDevice_completion___block_invoke_8;
      v22[3] = &unk_1EA4F2530;
      v22[4] = v6;
      v23 = *(id *)(a1 + 48);
      objc_msgSend(v6, "getAllDevices:", v22);
      v9 = v23;
    }

  }
  else
  {
    LogCategory_Daemon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __48__FMFSession_Admin__setActiveDevice_completion___block_invoke_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);

    objc_msgSend(*(id *)(a1 + 32), "serverProxy");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "showNetworkOfflineDuringOfferAlert");

    v19 = *(_QWORD *)(a1 + 48);
    if (v19)
      (*(void (**)(uint64_t, id))(v19 + 16))(v19, v5);
  }

}

void __48__FMFSession_Admin__setActiveDevice_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD, _QWORD);
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v3 = a2;
  objc_msgSend(v3, "fm_firstObjectPassingTest:", &__block_literal_global_0);
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v4
    || (objc_msgSend(v3, "fm_firstObjectPassingTest:", &__block_literal_global_10),
        (v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue()) != 0))
  {
    if ((objc_msgSend(v4, "isActiveDevice") & 1) != 0)
    {
      v5 = *(_QWORD *)(a1 + 40);
      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.fmf.error"), 108, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "serverProxy");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __48__FMFSession_Admin__setActiveDevice_completion___block_invoke_4;
      v10[3] = &unk_1EA4F2508;
      v8 = *(void **)(a1 + 40);
      v10[4] = *(_QWORD *)(a1 + 32);
      v11 = v8;
      objc_msgSend(v7, "setActiveDevice:completion:", v4, v10);

    }
  }
  else
  {
    v4 = *(void (***)(_QWORD, _QWORD))(a1 + 40);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.fmf.error"), 100, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v4)[2](v4, v9);

      v4 = 0;
    }
  }

}

uint64_t __48__FMFSession_Admin__setActiveDevice_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isThisDevice");
}

uint64_t __48__FMFSession_Admin__setActiveDevice_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCompanionDevice");
}

void __48__FMFSession_Admin__setActiveDevice_completion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "shouldHandleErrorInFWK:"))
  {
    objc_msgSend(*(id *)(a1 + 32), "serverProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "showGenericErrorAlert");

  }
  v4 = *(_QWORD *)(a1 + 40);
  v5 = v6;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
    v5 = v6;
  }

}

void __48__FMFSession_Admin__setActiveDevice_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8 = v3;
  if (v3)
  {
    if (!objc_msgSend(v4, "shouldHandleErrorInFWK:"))
      goto LABEL_6;
    objc_msgSend(*(id *)(a1 + 32), "serverProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "showGenericErrorAlert");
  }
  else
  {
    objc_msgSend(v4, "serverProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "showActiveDeviceChangedAlert");
  }

LABEL_6:
  v6 = *(_QWORD *)(a1 + 40);
  v7 = v8;
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v8);
    v7 = v8;
  }

}

- (void)getHandlesSharingLocationsWithMe:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__FMFSession_Admin__getHandlesSharingLocationsWithMe___block_invoke;
  v7[3] = &unk_1EA4F2530;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getHandlesSharingLocationsWithMe:", v7);

}

void __54__FMFSession_Admin__getHandlesSharingLocationsWithMe___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  LogCategory_Daemon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1DC81B000, v7, OS_LOG_TYPE_DEFAULT, "Handles sharing location with me %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__FMFSession_Admin__getHandlesSharingLocationsWithMe___block_invoke_13;
  v12[3] = &unk_1EA4F22C8;
  v8 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v14 = v6;
  v15 = v9;
  v13 = v5;
  v10 = v6;
  v11 = v5;
  objc_msgSend(v8, "dispatchOnDelegateQueue:", v12);

}

uint64_t __54__FMFSession_Admin__getHandlesSharingLocationsWithMe___block_invoke_13(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)getHandlesSharingLocationsWithMeWithGroupId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  FMFSession *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[FMFSession serverProxy](self, "serverProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __76__FMFSession_Admin__getHandlesSharingLocationsWithMeWithGroupId_completion___block_invoke;
    v9[3] = &unk_1EA4F2580;
    v10 = v6;
    v11 = self;
    v12 = v7;
    objc_msgSend(v8, "getHandlesSharingLocationsWithMeWithGroupId:completion:", v10, v9);

  }
  else
  {
    -[FMFSession getHandlesSharingLocationsWithMe:](self, "getHandlesSharingLocationsWithMe:", v7);
  }

}

void __76__FMFSession_Admin__getHandlesSharingLocationsWithMeWithGroupId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  LogCategory_Daemon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v18 = v8;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1DC81B000, v7, OS_LOG_TYPE_DEFAULT, "Handles sharing location with me through group Id: %@, %@", buf, 0x16u);
  }

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__FMFSession_Admin__getHandlesSharingLocationsWithMeWithGroupId_completion___block_invoke_14;
  v13[3] = &unk_1EA4F22C8;
  v9 = *(void **)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v15 = v6;
  v16 = v10;
  v14 = v5;
  v11 = v6;
  v12 = v5;
  objc_msgSend(v9, "dispatchOnDelegateQueue:", v13);

}

uint64_t __76__FMFSession_Admin__getHandlesSharingLocationsWithMeWithGroupId_completion___block_invoke_14(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)getHandlesFollowingMyLocation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__FMFSession_Admin__getHandlesFollowingMyLocation___block_invoke;
  v7[3] = &unk_1EA4F2530;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getHandlesSharingMyLocation:", v7);

}

void __51__FMFSession_Admin__getHandlesFollowingMyLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  LogCategory_Daemon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1DC81B000, v7, OS_LOG_TYPE_DEFAULT, "Handles following my location: %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__FMFSession_Admin__getHandlesFollowingMyLocation___block_invoke_15;
  v12[3] = &unk_1EA4F22C8;
  v8 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v14 = v6;
  v15 = v9;
  v13 = v5;
  v10 = v6;
  v11 = v5;
  objc_msgSend(v8, "dispatchOnDelegateQueue:", v12);

}

uint64_t __51__FMFSession_Admin__getHandlesFollowingMyLocation___block_invoke_15(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)getHandlesFollowingMyLocationWithGroupId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  FMFSession *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[FMFSession serverProxy](self, "serverProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __73__FMFSession_Admin__getHandlesFollowingMyLocationWithGroupId_completion___block_invoke;
    v9[3] = &unk_1EA4F2580;
    v10 = v6;
    v11 = self;
    v12 = v7;
    objc_msgSend(v8, "getHandlesSharingMyLocationWithGroupId:completion:", v10, v9);

  }
  else
  {
    -[FMFSession getHandlesFollowingMyLocation:](self, "getHandlesFollowingMyLocation:", v7);
  }

}

void __73__FMFSession_Admin__getHandlesFollowingMyLocationWithGroupId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  LogCategory_Daemon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v18 = v8;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1DC81B000, v7, OS_LOG_TYPE_DEFAULT, "Handles following my location, through group Id: %@, %@", buf, 0x16u);
  }

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__FMFSession_Admin__getHandlesFollowingMyLocationWithGroupId_completion___block_invoke_16;
  v13[3] = &unk_1EA4F22C8;
  v9 = *(void **)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v15 = v6;
  v16 = v10;
  v14 = v5;
  v11 = v6;
  v12 = v5;
  objc_msgSend(v9, "dispatchOnDelegateQueue:", v13);

}

uint64_t __73__FMFSession_Admin__getHandlesFollowingMyLocationWithGroupId_completion___block_invoke_16(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)setHideMyLocationEnabled:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, void *);
  _BOOL4 v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[5];
  void (**v20)(id, void *);

  v4 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = +[FMFSession FMFRestricted](FMFSession, "FMFRestricted");
  -[FMFSession serverProxy](self, "serverProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "showRestrictedAlert");

    LogCategory_Daemon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[FMFSession(Admin) setHideMyLocationEnabled:completion:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.fmf.error"), 105, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v18);

    }
  }
  else
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __57__FMFSession_Admin__setHideMyLocationEnabled_completion___block_invoke;
    v19[3] = &unk_1EA4F2508;
    v19[4] = self;
    v20 = v6;
    objc_msgSend(v9, "setHideMyLocationEnabled:completion:", v4, v19);

  }
}

void __57__FMFSession_Admin__setHideMyLocationEnabled_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__FMFSession_Admin__setHideMyLocationEnabled_completion___block_invoke_2;
  v7[3] = &unk_1EA4F25A8;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "dispatchOnDelegateQueue:", v7);

}

uint64_t __57__FMFSession_Admin__setHideMyLocationEnabled_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)isMyLocationEnabled:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__FMFSession_Admin__isMyLocationEnabled___block_invoke;
  v7[3] = &unk_1EA4F25D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "isMyLocationEnabled:", v7);

}

void __41__FMFSession_Admin__isMyLocationEnabled___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__FMFSession_Admin__isMyLocationEnabled___block_invoke_2;
  v9[3] = &unk_1EA4F2128;
  v6 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  objc_msgSend(v6, "dispatchOnDelegateQueue:", v9);

}

uint64_t __41__FMFSession_Admin__isMyLocationEnabled___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)setAllowFriendRequestsEnabled:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v6 = a4;
  -[FMFSession serverProxy](self, "serverProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__FMFSession_Admin__setAllowFriendRequestsEnabled_completion___block_invoke;
  v9[3] = &unk_1EA4F2508;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "setAllowFriendRequestsEnabled:completion:", v4, v9);

}

void __62__FMFSession_Admin__setAllowFriendRequestsEnabled_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__FMFSession_Admin__setAllowFriendRequestsEnabled_completion___block_invoke_2;
  v7[3] = &unk_1EA4F25A8;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "dispatchOnDelegateQueue:", v7);

}

uint64_t __62__FMFSession_Admin__setAllowFriendRequestsEnabled_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)isAllowFriendRequestsEnabled:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__FMFSession_Admin__isAllowFriendRequestsEnabled___block_invoke;
  v7[3] = &unk_1EA4F25D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "isAllowFriendRequestsEnabled:", v7);

}

void __50__FMFSession_Admin__isAllowFriendRequestsEnabled___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__FMFSession_Admin__isAllowFriendRequestsEnabled___block_invoke_2;
  v9[3] = &unk_1EA4F2128;
  v6 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  objc_msgSend(v6, "dispatchOnDelegateQueue:", v9);

}

uint64_t __50__FMFSession_Admin__isAllowFriendRequestsEnabled___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)getAccountEmailAddress:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__FMFSession_Admin__getAccountEmailAddress___block_invoke;
  v7[3] = &unk_1EA4F25F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getAccountEmailAddress:", v7);

}

void __44__FMFSession_Admin__getAccountEmailAddress___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__FMFSession_Admin__getAccountEmailAddress___block_invoke_2;
  v11[3] = &unk_1EA4F22C8;
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "dispatchOnDelegateQueue:", v11);

}

uint64_t __44__FMFSession_Admin__getAccountEmailAddress___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)canShareLocationWithHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__FMFSession_Admin__canShareLocationWithHandle_groupId_callerId_completion___block_invoke;
  v16[3] = &unk_1EA4F2620;
  v16[4] = self;
  v17 = v10;
  v15 = v10;
  objc_msgSend(v14, "canShareLocationWithHandle:groupId:callerId:completion:", v13, v12, v11, v16);

}

void __76__FMFSession_Admin__canShareLocationWithHandle_groupId_callerId_completion___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  char v14;
  uint8_t buf[4];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  LogCategory_Daemon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v16 = a2;
    _os_log_impl(&dword_1DC81B000, v7, OS_LOG_TYPE_DEFAULT, "Can share location %d", buf, 8u);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__FMFSession_Admin__canShareLocationWithHandle_groupId_callerId_completion___block_invoke_18;
  v11[3] = &unk_1EA4F2128;
  v8 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v14 = a2;
  v12 = v6;
  v13 = v9;
  v10 = v6;
  objc_msgSend(v8, "dispatchOnDelegateQueue:", v11);

}

uint64_t __76__FMFSession_Admin__canShareLocationWithHandle_groupId_callerId_completion___block_invoke_18(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), 0, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)canGetLocationForHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__FMFSession_Admin__canGetLocationForHandle_groupId_callerId_completion___block_invoke;
  v16[3] = &unk_1EA4F2620;
  v16[4] = self;
  v17 = v10;
  v15 = v10;
  objc_msgSend(v14, "canGetLocationForHandle:groupId:callerId:completion:", v13, v12, v11, v16);

}

void __73__FMFSession_Admin__canGetLocationForHandle_groupId_callerId_completion___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  char v14;
  uint8_t buf[4];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  LogCategory_Daemon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v16 = a2;
    _os_log_impl(&dword_1DC81B000, v7, OS_LOG_TYPE_DEFAULT, "Can get location %d", buf, 8u);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__FMFSession_Admin__canGetLocationForHandle_groupId_callerId_completion___block_invoke_20;
  v11[3] = &unk_1EA4F2128;
  v8 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v14 = a2;
  v12 = v6;
  v13 = v9;
  v10 = v6;
  objc_msgSend(v8, "dispatchOnDelegateQueue:", v11);

}

uint64_t __73__FMFSession_Admin__canGetLocationForHandle_groupId_callerId_completion___block_invoke_20(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), 0, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)getPendingMappingPacketsForHandle:(id)a3 groupId:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__FMFSession_Admin__getPendingMappingPacketsForHandle_groupId_completion___block_invoke;
  v13[3] = &unk_1EA4F2648;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "getPendingMappingPacketsForHandle:groupId:completion:", v10, v9, v13);

}

void __74__FMFSession_Admin__getPendingMappingPacketsForHandle_groupId_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__FMFSession_Admin__getPendingMappingPacketsForHandle_groupId_completion___block_invoke_2;
  v15[3] = &unk_1EA4F2318;
  v10 = *(void **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v19 = v11;
  v12 = v9;
  v13 = v8;
  v14 = v7;
  objc_msgSend(v10, "dispatchOnDelegateQueue:", v15);

}

void __74__FMFSession_Admin__getPendingMappingPacketsForHandle_groupId_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  void *v3;
  id v4;

  v1 = a1[7];
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a1[4]);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a1[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *, _QWORD))(v1 + 16))(v1, v4, v3, a1[6]);

  }
}

- (void)getOfferExpirationForHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__FMFSession_Admin__getOfferExpirationForHandle_groupId_callerId_completion___block_invoke;
  v16[3] = &unk_1EA4F2670;
  v16[4] = self;
  v17 = v10;
  v15 = v10;
  objc_msgSend(v14, "getOfferExpirationForHandle:groupId:callerId:completion:", v13, v12, v11, v16);

}

void __77__FMFSession_Admin__getOfferExpirationForHandle_groupId_callerId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__FMFSession_Admin__getOfferExpirationForHandle_groupId_callerId_completion___block_invoke_2;
  v11[3] = &unk_1EA4F22C8;
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "dispatchOnDelegateQueue:", v11);

}

uint64_t __77__FMFSession_Admin__getOfferExpirationForHandle_groupId_callerId_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)getHandlesWithPendingOffers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__FMFSession_Admin__getHandlesWithPendingOffers___block_invoke;
  v7[3] = &unk_1EA4F2530;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getHandlesWithPendingOffers:", v7);

}

void __49__FMFSession_Admin__getHandlesWithPendingOffers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__FMFSession_Admin__getHandlesWithPendingOffers___block_invoke_2;
  v11[3] = &unk_1EA4F22C8;
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "dispatchOnDelegateQueue:", v11);

}

uint64_t __49__FMFSession_Admin__getHandlesWithPendingOffers___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)canOfferToHandles:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "canOfferToHandles:completion:", v7, v6);

}

- (void)contactForPayload:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__FMFSession_Notifications__contactForPayload_completion___block_invoke;
  v10[3] = &unk_1EA4F2758;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "contactForPayload:completion:", v7, v10);

}

void __58__FMFSession_Notifications__contactForPayload_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    LogCategory_Daemon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __58__FMFSession_Notifications__contactForPayload_completion___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __58__FMFSession_Notifications__contactForPayload_completion___block_invoke_1;
  v18[3] = &unk_1EA4F22C8;
  v14 = *(void **)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  v20 = v6;
  v21 = v15;
  v19 = v5;
  v16 = v6;
  v17 = v5;
  objc_msgSend(v14, "dispatchOnDelegateQueue:", v18);

}

uint64_t __58__FMFSession_Notifications__contactForPayload_completion___block_invoke_1(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)handleAndLocationForPayload:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__FMFSession_Notifications__handleAndLocationForPayload_completion___block_invoke;
  v10[3] = &unk_1EA4F2780;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "handleAndLocationForPayload:completion:", v7, v10);

}

void __68__FMFSession_Notifications__handleAndLocationForPayload_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    LogCategory_Daemon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __68__FMFSession_Notifications__handleAndLocationForPayload_completion___block_invoke_cold_1((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);

  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __68__FMFSession_Notifications__handleAndLocationForPayload_completion___block_invoke_3;
  v22[3] = &unk_1EA4F2318;
  v17 = *(void **)(a1 + 32);
  v18 = *(id *)(a1 + 40);
  v23 = v7;
  v24 = v8;
  v25 = v9;
  v26 = v18;
  v19 = v9;
  v20 = v8;
  v21 = v7;
  objc_msgSend(v17, "dispatchOnDelegateQueue:", v22);

}

uint64_t __68__FMFSession_Notifications__handleAndLocationForPayload_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5], a1[6]);
  return result;
}

- (void)dataForPayload:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__FMFSession_Notifications__dataForPayload_completion___block_invoke;
  v10[3] = &unk_1EA4F27D0;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "dataForPayload:completion:", v7, v10);

}

void __55__FMFSession_Notifications__dataForPayload_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v12)
  {
    LogCategory_Daemon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __55__FMFSession_Notifications__dataForPayload_completion___block_invoke_cold_1((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);

  }
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __55__FMFSession_Notifications__dataForPayload_completion___block_invoke_5;
  v26[3] = &unk_1EA4F27A8;
  v20 = *(void **)(a1 + 32);
  v21 = *(id *)(a1 + 40);
  v30 = v12;
  v31 = v21;
  v27 = v9;
  v28 = v10;
  v29 = v11;
  v22 = v12;
  v23 = v11;
  v24 = v10;
  v25 = v9;
  objc_msgSend(v20, "dispatchOnDelegateQueue:", v26);

}

uint64_t __55__FMFSession_Notifications__dataForPayload_completion___block_invoke_5(_QWORD *a1)
{
  uint64_t result;

  result = a1[8];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5], a1[6], a1[7]);
  return result;
}

- (void)decryptPayload:(id)a3 withToken:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a4;
  LogCategory_Daemon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v13;
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_1DC81B000, v12, OS_LOG_TYPE_DEFAULT, "%@ %@", buf, 0x16u);

  }
  -[FMFSession serverProxy](self, "serverProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__FMFSession_Notifications__decryptPayload_withToken_completion___block_invoke;
  v16[3] = &unk_1EA4F25F8;
  v16[4] = self;
  v17 = v10;
  v15 = v10;
  objc_msgSend(v14, "decryptPayload:withToken:completion:", v9, v11, v16);

}

void __65__FMFSession_Notifications__decryptPayload_withToken_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    LogCategory_Daemon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_1DC81B000, v7, OS_LOG_TYPE_DEFAULT, "Error occured when decryptPayload %@", buf, 0xCu);
    }

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__FMFSession_Notifications__decryptPayload_withToken_completion___block_invoke_7;
  v12[3] = &unk_1EA4F22C8;
  v8 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v14 = v6;
  v15 = v9;
  v13 = v5;
  v10 = v6;
  v11 = v5;
  objc_msgSend(v8, "dispatchOnDelegateQueue:", v12);

}

uint64_t __65__FMFSession_Notifications__decryptPayload_withToken_completion___block_invoke_7(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)encryptPayload:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  LogCategory_Daemon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = v10;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1DC81B000, v9, OS_LOG_TYPE_DEFAULT, "%@ %@", buf, 0x16u);

  }
  -[FMFSession serverProxy](self, "serverProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__FMFSession_Notifications__encryptPayload_completion___block_invoke;
  v13[3] = &unk_1EA4F25F8;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "encryptPayload:completion:", v7, v13);

}

void __55__FMFSession_Notifications__encryptPayload_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    LogCategory_Daemon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_1DC81B000, v7, OS_LOG_TYPE_DEFAULT, "Error occured when encryptPayload: %@", buf, 0xCu);
    }

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__FMFSession_Notifications__encryptPayload_completion___block_invoke_9;
  v12[3] = &unk_1EA4F22C8;
  v8 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v14 = v6;
  v15 = v9;
  v13 = v5;
  v10 = v6;
  v11 = v5;
  objc_msgSend(v8, "dispatchOnDelegateQueue:", v12);

}

uint64_t __55__FMFSession_Notifications__encryptPayload_completion___block_invoke_9(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)favoritesForMaxCount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__FMFSession_TodayWidget__favoritesForMaxCount_completion___block_invoke;
  v10[3] = &unk_1EA4F28F0;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "favoritesForMaxCount:completion:", v7, v10);

}

void __59__FMFSession_TodayWidget__favoritesForMaxCount_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_Daemon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_1DC81B000, v4, OS_LOG_TYPE_DEFAULT, "favoritesForMaxCount: %@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__FMFSession_TodayWidget__favoritesForMaxCount_completion___block_invoke_1;
  v8[3] = &unk_1EA4F25A8;
  v5 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  objc_msgSend(v5, "dispatchOnDelegateQueue:", v8);

}

uint64_t __59__FMFSession_TodayWidget__favoritesForMaxCount_completion___block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)nearbyLocationsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__FMFSession_TodayWidget__nearbyLocationsWithCompletion___block_invoke;
  v7[3] = &unk_1EA4F2530;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "nearbyLocationsWithCompletion:", v7);

}

void __57__FMFSession_TodayWidget__nearbyLocationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_Daemon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_1DC81B000, v4, OS_LOG_TYPE_DEFAULT, "nearbyLocationsWithCompletion: %@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__FMFSession_TodayWidget__nearbyLocationsWithCompletion___block_invoke_3;
  v8[3] = &unk_1EA4F25A8;
  v5 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  objc_msgSend(v5, "dispatchOnDelegateQueue:", v8);

}

uint64_t __57__FMFSession_TodayWidget__nearbyLocationsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)getAllLocations:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DC81B000, v5, OS_LOG_TYPE_DEFAULT, "getAllLocations", v7, 2u);
  }

  -[FMFSession serverProxy](self, "serverProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getAllLocations:", v4);

}

- (void)getFavoritesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  FMFSession *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    _os_log_impl(&dword_1DC81B000, v5, OS_LOG_TYPE_DEFAULT, "FMFSession: %@ getFavoritesWithCompletion", buf, 0xCu);
  }

  -[FMFSession serverProxy](self, "serverProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__FMFSession_Favorites__getFavoritesWithCompletion___block_invoke;
  v8[3] = &unk_1EA4F28F0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "getFavoritesWithCompletion:", v8);

}

void __52__FMFSession_Favorites__getFavoritesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  LogCategory_Daemon();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      v9 = "FMFSession: getFavoritesWithCompletion completed with error: %@";
LABEL_6:
      _os_log_impl(&dword_1DC81B000, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
    }
  }
  else if (v8)
  {
    *(_DWORD *)buf = 138412290;
    v19 = v5;
    v9 = "FMFSession: getFavorites: %@";
    goto LABEL_6;
  }

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__FMFSession_Favorites__getFavoritesWithCompletion___block_invoke_1;
  v14[3] = &unk_1EA4F22C8;
  v10 = *(void **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v16 = v6;
  v17 = v11;
  v15 = v5;
  v12 = v6;
  v13 = v5;
  objc_msgSend(v10, "dispatchOnDelegateQueue:", v14);

}

uint64_t __52__FMFSession_Favorites__getFavoritesWithCompletion___block_invoke_1(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)addFavorite:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  FMFSession *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  LogCategory_Daemon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1DC81B000, v8, OS_LOG_TYPE_DEFAULT, "FMFSession: %@ addFavorite: %@", buf, 0x16u);
  }

  -[FMFSession serverProxy](self, "serverProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__FMFSession_Favorites__addFavorite_completion___block_invoke;
  v11[3] = &unk_1EA4F2508;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "addFavorite:completion:", v6, v11);

}

void __48__FMFSession_Favorites__addFavorite_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    LogCategory_Daemon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_1DC81B000, v4, OS_LOG_TYPE_DEFAULT, "FMFSession: addFavorite completed with error: %@", buf, 0xCu);
    }

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__FMFSession_Favorites__addFavorite_completion___block_invoke_3;
  v8[3] = &unk_1EA4F25A8;
  v5 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  objc_msgSend(v5, "dispatchOnDelegateQueue:", v8);

}

uint64_t __48__FMFSession_Favorites__addFavorite_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)removeFavorite:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  FMFSession *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  LogCategory_Daemon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1DC81B000, v8, OS_LOG_TYPE_DEFAULT, "FMFSession: %@ removeFavorite: %@", buf, 0x16u);
  }

  -[FMFSession serverProxy](self, "serverProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__FMFSession_Favorites__removeFavorite_completion___block_invoke;
  v11[3] = &unk_1EA4F2508;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "removeFavorite:completion:", v6, v11);

}

void __51__FMFSession_Favorites__removeFavorite_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    LogCategory_Daemon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_1DC81B000, v4, OS_LOG_TYPE_DEFAULT, "FMFSession: removeFavorite completed with error: %@", buf, 0xCu);
    }

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__FMFSession_Favorites__removeFavorite_completion___block_invoke_5;
  v8[3] = &unk_1EA4F25A8;
  v5 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  objc_msgSend(v5, "dispatchOnDelegateQueue:", v8);

}

uint64_t __51__FMFSession_Favorites__removeFavorite_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (BOOL)_isNoMappingPacketReturnedError:(id)a3
{
  return a3 && objc_msgSend(a3, "code") == 204;
}

- (void)_sendFriendshipOfferToHandles:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  LogCategory_Daemon();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    v23 = v12;
    v24 = 2112;
    v25 = v15;
    v26 = 2112;
    v27 = v13;
    v28 = 2112;
    v29 = v14;
    _os_log_impl(&dword_1DC81B000, v17, OS_LOG_TYPE_INFO, "Sending friend offer for: %@ to date: %@ withGroupId: %@ fromCallerId: %@", buf, 0x2Au);
  }

  -[FMFSession serverProxy](self, "serverProxy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __91__FMFSession_Establish___sendFriendshipOfferToHandles_groupId_callerId_endDate_completion___block_invoke;
  v20[3] = &unk_1EA4F2918;
  v20[4] = self;
  v21 = v16;
  v19 = v16;
  objc_msgSend(v18, "sendFriendshipOfferToHandles:groupId:callerId:endDate:completion:", v12, v13, v14, v15, v20);

}

void __91__FMFSession_Establish___sendFriendshipOfferToHandles_groupId_callerId_endDate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__FMFSession_Establish___sendFriendshipOfferToHandles_groupId_callerId_endDate_completion___block_invoke_2;
  v14[3] = &unk_1EA4F22C8;
  v7 = *(void **)(a1 + 32);
  v17 = *(id *)(a1 + 40);
  v8 = v5;
  v15 = v8;
  v9 = v6;
  v16 = v9;
  objc_msgSend(v7, "dispatchOnDelegateQueue:", v14);
  if (objc_msgSend(*(id *)(a1 + 32), "shouldHandleErrorInFWK:", v9))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "is5XXError:", v9);
    v11 = *(void **)(a1 + 32);
    if (v10)
    {
      objc_msgSend(v11, "serverProxy");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "show5XXDuringStartOfferAlert");
LABEL_6:

      goto LABEL_7;
    }
    if ((objc_msgSend(v11, "_isNoMappingPacketReturnedError:", v9) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "serverProxy");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "showGenericErrorAlert");
      goto LABEL_6;
    }
  }
LABEL_7:
  v13 = objc_msgSend(*(id *)(a1 + 32), "_isNoMappingPacketReturnedError:", v9);
  if (!v9 || v13)
    objc_msgSend(*(id *)(a1 + 32), "_checkAndDisplayMeDeviceSwitchAlert");

}

uint64_t __91__FMFSession_Establish___sendFriendshipOfferToHandles_groupId_callerId_endDate_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)_sendAutoSwitchMeDevice
{
  -[FMFSession setActiveDevice:completion:](self, "setActiveDevice:completion:", 0, &__block_literal_global_2);
}

void __48__FMFSession_Establish___sendAutoSwitchMeDevice__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "code");
    LogCategory_Daemon();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v4 == 108)
    {
      if (v6)
      {
        LOWORD(v9) = 0;
        v7 = "Offer: This device is already set as Me device";
LABEL_7:
        _os_log_impl(&dword_1DC81B000, v5, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v9, 2u);
      }
    }
    else if (v6)
    {
      objc_msgSend(v3, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1DC81B000, v5, OS_LOG_TYPE_INFO, "Offer: Error while trying to set this device as Me device, error: %@", (uint8_t *)&v9, 0xCu);

    }
  }
  else
  {
    LogCategory_Daemon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      v7 = "Offer: Successfully set this devie as Me device.";
      goto LABEL_7;
    }
  }

}

- (void)_checkAndDisplayMeDeviceSwitchAlert
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __60__FMFSession_Establish___checkAndDisplayMeDeviceSwitchAlert__block_invoke;
  v2[3] = &unk_1EA4F2988;
  v2[4] = self;
  -[FMFSession getActiveLocationSharingDevice:](self, "getActiveLocationSharingDevice:", v2);
}

void __60__FMFSession_Establish___checkAndDisplayMeDeviceSwitchAlert__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    LogCategory_Daemon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __60__FMFSession_Establish___checkAndDisplayMeDeviceSwitchAlert__block_invoke_cold_1((uint64_t)v6, v7);
LABEL_4:

    goto LABEL_5;
  }
  if ((objc_msgSend(v5, "isThisDevice") & 1) != 0 || (objc_msgSend(v5, "isCompanionDevice") & 1) != 0)
  {
    LogCategory_Daemon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DC81B000, v7, OS_LOG_TYPE_INFO, "This device is already MeDevice", buf, 2u);
    }
    goto LABEL_4;
  }
  LogCategory_Daemon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DC81B000, v8, OS_LOG_TYPE_INFO, "This device is not MeDevice", buf, 2u);
  }

  LogCategory_Daemon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DC81B000, v9, OS_LOG_TYPE_INFO, "Showing MeDevice switch alert", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "serverProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__FMFSession_Establish___checkAndDisplayMeDeviceSwitchAlert__block_invoke_3;
  v12[3] = &unk_1EA4F2960;
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v10, "showSwitchMeDeviceAlertUsingCurrentMeDeviceName:completion:", v11, v12);

LABEL_5:
}

void __60__FMFSession_Establish___checkAndDisplayMeDeviceSwitchAlert__block_invoke_3(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v6[16];
  uint8_t buf[16];

  LogCategory_Daemon();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DC81B000, v4, OS_LOG_TYPE_INFO, "User selected to switch this device as MeDevice", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_sendAutoSwitchMeDevice");
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1DC81B000, v4, OS_LOG_TYPE_INFO, "User selected NOT to switch this device as MeDevice", v6, 2u);
    }

  }
}

- (void)sendFriendshipOfferToHandles:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[FMFSession verifyRestrictionsAndShowDialogIfRequired](self, "verifyRestrictionsAndShowDialogIfRequired");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    LogCategory_Daemon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[FMFSession(Establish) sendFriendshipOfferToHandles:groupId:callerId:endDate:completion:].cold.1();

    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __90__FMFSession_Establish__sendFriendshipOfferToHandles_groupId_callerId_endDate_completion___block_invoke;
    v29[3] = &unk_1EA4F25A8;
    v31 = v16;
    v30 = v17;
    v19 = v16;
    -[FMFSession dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v29);

    v20 = v31;
  }
  else
  {
    -[FMFSession serverProxy](self, "serverProxy");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __90__FMFSession_Establish__sendFriendshipOfferToHandles_groupId_callerId_endDate_completion___block_invoke_2;
    v23[3] = &unk_1EA4F29B0;
    v23[4] = self;
    v28 = v16;
    v24 = v12;
    v25 = v13;
    v26 = v14;
    v27 = v15;
    v22 = v16;
    objc_msgSend(v21, "isNetworkReachable:", v23);

    v20 = v28;
  }

}

uint64_t __90__FMFSession_Establish__sendFriendshipOfferToHandles_groupId_callerId_endDate_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

void __90__FMFSession_Establish__sendFriendshipOfferToHandles_groupId_callerId_endDate_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_sendFriendshipOfferToHandles:groupId:callerId:endDate:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  }
  else
  {
    LogCategory_Daemon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __90__FMFSession_Establish__sendFriendshipOfferToHandles_groupId_callerId_endDate_completion___block_invoke_2_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "serverProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "showNetworkOfflineDuringOfferAlert");

    v8 = *(_QWORD *)(a1 + 72);
    if (v8)
      (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v5);
  }

}

- (void)sendFriendshipOfferToHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  objc_msgSend(v12, "setWithObject:", a3);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[FMFSession sendFriendshipOfferToHandles:groupId:callerId:endDate:completion:](self, "sendFriendshipOfferToHandles:groupId:callerId:endDate:completion:", v17, v16, v15, v14, v13);

}

- (void)extendFriendshipOfferToHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  LogCategory_Daemon();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v30 = v12;
    v31 = 2112;
    v32 = v15;
    _os_log_impl(&dword_1DC81B000, v17, OS_LOG_TYPE_INFO, "Extending friend offer for: %@ to date: %@", buf, 0x16u);
  }

  -[FMFSession verifyRestrictionsAndShowDialogIfRequired](self, "verifyRestrictionsAndShowDialogIfRequired");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    LogCategory_Daemon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[FMFSession(Establish) extendFriendshipOfferToHandle:groupId:callerId:endDate:completion:].cold.1();

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __91__FMFSession_Establish__extendFriendshipOfferToHandle_groupId_callerId_endDate_completion___block_invoke;
    v26[3] = &unk_1EA4F25A8;
    v28 = v16;
    v27 = v18;
    v20 = v16;
    -[FMFSession dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v26);

    v21 = v28;
  }
  else
  {
    -[FMFSession serverProxy](self, "serverProxy");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __91__FMFSession_Establish__extendFriendshipOfferToHandle_groupId_callerId_endDate_completion___block_invoke_2;
    v24[3] = &unk_1EA4F25F8;
    v24[4] = self;
    v25 = v16;
    v23 = v16;
    objc_msgSend(v22, "extendFriendshipOfferToHandle:groupId:callerId:endDate:completion:", v12, v13, v14, v15, v24);

    v21 = v25;
  }

}

uint64_t __91__FMFSession_Establish__extendFriendshipOfferToHandle_groupId_callerId_endDate_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

void __91__FMFSession_Establish__extendFriendshipOfferToHandle_groupId_callerId_endDate_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__FMFSession_Establish__extendFriendshipOfferToHandle_groupId_callerId_endDate_completion___block_invoke_3;
  v8[3] = &unk_1EA4F25A8;
  v5 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v9 = v4;
  v10 = v6;
  v7 = v4;
  objc_msgSend(v5, "dispatchOnDelegateQueue:", v8);

}

uint64_t __91__FMFSession_Establish__extendFriendshipOfferToHandle_groupId_callerId_endDate_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)sendFriendshipInviteToHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD, void *);
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[5];
  void (**v22)(id, _QWORD, void *);
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD, void *))a7;
  LogCategory_Daemon();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v12;
    _os_log_impl(&dword_1DC81B000, v17, OS_LOG_TYPE_INFO, "Sending friend invite for: %@", buf, 0xCu);
  }

  -[FMFSession verifyRestrictionsAndShowDialogIfRequired](self, "verifyRestrictionsAndShowDialogIfRequired");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    LogCategory_Daemon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[FMFSession(Establish) sendFriendshipInviteToHandle:groupId:callerId:endDate:completion:].cold.1();

    if (v16)
      v16[2](v16, 0, v18);
  }
  else
  {
    -[FMFSession serverProxy](self, "serverProxy");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __90__FMFSession_Establish__sendFriendshipInviteToHandle_groupId_callerId_endDate_completion___block_invoke;
    v21[3] = &unk_1EA4F25F8;
    v21[4] = self;
    v22 = v16;
    objc_msgSend(v20, "sendFriendshipInviteToHandle:groupId:callerId:endDate:completion:", v12, v13, v14, v15, v21);

  }
}

void __90__FMFSession_Establish__sendFriendshipInviteToHandle_groupId_callerId_endDate_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__FMFSession_Establish__sendFriendshipInviteToHandle_groupId_callerId_endDate_completion___block_invoke_2;
  v8[3] = &unk_1EA4F25A8;
  v5 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v9 = v4;
  v10 = v6;
  v7 = v4;
  objc_msgSend(v5, "dispatchOnDelegateQueue:", v8);

}

uint64_t __90__FMFSession_Establish__sendFriendshipInviteToHandle_groupId_callerId_endDate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)sendNotNowToHandle:(id)a3 callerId:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  void (**v16)(id, _QWORD, void *);
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  LogCategory_Daemon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl(&dword_1DC81B000, v11, OS_LOG_TYPE_INFO, "Sending notNow for: %@", buf, 0xCu);
  }

  -[FMFSession verifyRestrictionsAndShowDialogIfRequired](self, "verifyRestrictionsAndShowDialogIfRequired");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    LogCategory_Daemon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[FMFSession(Establish) sendNotNowToHandle:callerId:completion:].cold.1();

    if (v10)
      v10[2](v10, 0, v12);
  }
  else
  {
    -[FMFSession serverProxy](self, "serverProxy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64__FMFSession_Establish__sendNotNowToHandle_callerId_completion___block_invoke;
    v15[3] = &unk_1EA4F25F8;
    v15[4] = self;
    v16 = v10;
    objc_msgSend(v14, "sendNotNowToHandle:callerId:completion:", v8, v9, v15);

  }
}

void __64__FMFSession_Establish__sendNotNowToHandle_callerId_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__FMFSession_Establish__sendNotNowToHandle_callerId_completion___block_invoke_2;
  v8[3] = &unk_1EA4F25A8;
  v5 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v9 = v4;
  v10 = v6;
  v7 = v4;
  objc_msgSend(v5, "dispatchOnDelegateQueue:", v8);

}

uint64_t __64__FMFSession_Establish__sendNotNowToHandle_callerId_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)approveFriendshipRequest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  void (**v13)(id, void *);
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  LogCategory_Daemon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1DC81B000, v8, OS_LOG_TYPE_INFO, "Approving friend request for: %@", buf, 0xCu);
  }

  -[FMFSession verifyRestrictionsAndShowDialogIfRequired](self, "verifyRestrictionsAndShowDialogIfRequired");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    LogCategory_Daemon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[FMFSession(Establish) approveFriendshipRequest:completion:].cold.1();

    if (v7)
      v7[2](v7, v9);
  }
  else
  {
    -[FMFSession serverProxy](self, "serverProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__FMFSession_Establish__approveFriendshipRequest_completion___block_invoke;
    v12[3] = &unk_1EA4F2508;
    v12[4] = self;
    v13 = v7;
    objc_msgSend(v11, "approveFriendshipRequest:completion:", v6, v12);

  }
}

void __61__FMFSession_Establish__approveFriendshipRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__FMFSession_Establish__approveFriendshipRequest_completion___block_invoke_2;
  v7[3] = &unk_1EA4F25A8;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "dispatchOnDelegateQueue:", v7);

}

uint64_t __61__FMFSession_Establish__approveFriendshipRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)declineFriendshipRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  LogCategory_Daemon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v6;
    _os_log_impl(&dword_1DC81B000, v8, OS_LOG_TYPE_INFO, "Declining friend request for: %@", buf, 0xCu);
  }

  -[FMFSession verifyRestrictionsAndShowDialogIfRequired](self, "verifyRestrictionsAndShowDialogIfRequired");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    LogCategory_Daemon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[FMFSession(Establish) declineFriendshipRequest:completion:].cold.1();

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __61__FMFSession_Establish__declineFriendshipRequest_completion___block_invoke;
    v17[3] = &unk_1EA4F25A8;
    v19 = v7;
    v18 = v9;
    v11 = v7;
    -[FMFSession dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v17);

    v12 = v19;
  }
  else
  {
    -[FMFSession serverProxy](self, "serverProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __61__FMFSession_Establish__declineFriendshipRequest_completion___block_invoke_2;
    v15[3] = &unk_1EA4F2508;
    v15[4] = self;
    v16 = v7;
    v14 = v7;
    objc_msgSend(v13, "declineFriendshipRequest:completion:", v6, v15);

    v12 = v16;
  }

}

uint64_t __61__FMFSession_Establish__declineFriendshipRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __61__FMFSession_Establish__declineFriendshipRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__FMFSession_Establish__declineFriendshipRequest_completion___block_invoke_3;
  v7[3] = &unk_1EA4F25A8;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "dispatchOnDelegateQueue:", v7);

}

uint64_t __61__FMFSession_Establish__declineFriendshipRequest_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)stopSharingMyLocationWithHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  LogCategory_Daemon();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v10;
    _os_log_impl(&dword_1DC81B000, v14, OS_LOG_TYPE_INFO, "Stop sharing location with handle: %@", buf, 0xCu);
  }

  -[FMFSession verifyRestrictionsAndShowDialogIfRequired](self, "verifyRestrictionsAndShowDialogIfRequired");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    LogCategory_Daemon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[FMFSession(Establish) stopSharingMyLocationWithHandle:groupId:callerId:completion:].cold.1();

    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __85__FMFSession_Establish__stopSharingMyLocationWithHandle_groupId_callerId_completion___block_invoke;
    v23[3] = &unk_1EA4F25A8;
    v25 = v13;
    v24 = v15;
    v17 = v13;
    -[FMFSession dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v23);

    v18 = v25;
  }
  else
  {
    -[FMFSession serverProxy](self, "serverProxy");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __85__FMFSession_Establish__stopSharingMyLocationWithHandle_groupId_callerId_completion___block_invoke_2;
    v21[3] = &unk_1EA4F25F8;
    v21[4] = self;
    v22 = v13;
    v20 = v13;
    objc_msgSend(v19, "stopSharingMyLocationWithHandle:groupId:callerId:completion:", v10, v11, v12, v21);

    v18 = v22;
  }

}

uint64_t __85__FMFSession_Establish__stopSharingMyLocationWithHandle_groupId_callerId_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

void __85__FMFSession_Establish__stopSharingMyLocationWithHandle_groupId_callerId_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__FMFSession_Establish__stopSharingMyLocationWithHandle_groupId_callerId_completion___block_invoke_3;
  v8[3] = &unk_1EA4F25A8;
  v5 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v9 = v4;
  v10 = v6;
  v7 = v4;
  objc_msgSend(v5, "dispatchOnDelegateQueue:", v8);

}

uint64_t __85__FMFSession_Establish__stopSharingMyLocationWithHandle_groupId_callerId_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)stopSharingMyLocationWithHandles:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  LogCategory_Daemon();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v10;
    _os_log_impl(&dword_1DC81B000, v14, OS_LOG_TYPE_INFO, "Stop sharing location with handles: [%@]", buf, 0xCu);
  }

  -[FMFSession verifyRestrictionsAndShowDialogIfRequired](self, "verifyRestrictionsAndShowDialogIfRequired");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    LogCategory_Daemon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[FMFSession(Establish) stopSharingMyLocationWithHandle:groupId:callerId:completion:].cold.1();

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __86__FMFSession_Establish__stopSharingMyLocationWithHandles_groupId_callerId_completion___block_invoke;
    v26[3] = &unk_1EA4F25A8;
    v28 = v13;
    v27 = v15;
    v17 = v13;
    -[FMFSession dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v26);

    v18 = v28;
  }
  else
  {
    -[FMFSession serverProxy](self, "serverProxy");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __86__FMFSession_Establish__stopSharingMyLocationWithHandles_groupId_callerId_completion___block_invoke_2;
    v21[3] = &unk_1EA4F29D8;
    v21[4] = self;
    v25 = v13;
    v22 = v10;
    v23 = v11;
    v24 = v12;
    v20 = v13;
    objc_msgSend(v19, "isNetworkReachable:", v21);

    v18 = v25;
  }

}

uint64_t __86__FMFSession_Establish__stopSharingMyLocationWithHandles_groupId_callerId_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

void __86__FMFSession_Establish__stopSharingMyLocationWithHandles_groupId_callerId_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "serverProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __86__FMFSession_Establish__stopSharingMyLocationWithHandles_groupId_callerId_completion___block_invoke_8;
    v13[3] = &unk_1EA4F25F8;
    v9 = *(_QWORD *)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = *(id *)(a1 + 64);
    objc_msgSend(v6, "stopSharingMyLocationWithHandles:groupId:callerId:completion:", v9, v7, v8, v13);

  }
  else
  {
    LogCategory_Daemon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __86__FMFSession_Establish__stopSharingMyLocationWithHandles_groupId_callerId_completion___block_invoke_2_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "serverProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "showNetworkOfflineDuringStopOfferAlert");

    v12 = *(_QWORD *)(a1 + 64);
    if (v12)
      (*(void (**)(uint64_t, _QWORD, id))(v12 + 16))(v12, 0, v5);
  }

}

void __86__FMFSession_Establish__stopSharingMyLocationWithHandles_groupId_callerId_completion___block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "shouldHandleErrorInFWK:", v4))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "is5XXError:", v4);
    objc_msgSend(*(id *)(a1 + 32), "serverProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
      objc_msgSend(v6, "show5XXDuringStopOfferAlert");
    else
      objc_msgSend(v6, "showGenericErrorAlert");

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__FMFSession_Establish__stopSharingMyLocationWithHandles_groupId_callerId_completion___block_invoke_2_9;
  v11[3] = &unk_1EA4F25A8;
  v8 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v12 = v4;
  v13 = v9;
  v10 = v4;
  objc_msgSend(v8, "dispatchOnDelegateQueue:", v11);

}

uint64_t __86__FMFSession_Establish__stopSharingMyLocationWithHandles_groupId_callerId_completion___block_invoke_2_9(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)getPendingFriendshipRequestsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DC81B000, v5, OS_LOG_TYPE_INFO, "Get pending friendship requests", buf, 2u);
  }

  -[FMFSession serverProxy](self, "serverProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__FMFSession_Establish__getPendingFriendshipRequestsWithCompletion___block_invoke;
  v8[3] = &unk_1EA4F2A00;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "getPendingFriendshipRequestsWithCompletion:", v8);

}

void __68__FMFSession_Establish__getPendingFriendshipRequestsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__FMFSession_Establish__getPendingFriendshipRequestsWithCompletion___block_invoke_2;
  v15[3] = &unk_1EA4F2318;
  v10 = *(void **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v19 = v11;
  v12 = v9;
  v13 = v8;
  v14 = v7;
  objc_msgSend(v10, "dispatchOnDelegateQueue:", v15);

}

uint64_t __68__FMFSession_Establish__getPendingFriendshipRequestsWithCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5], a1[6]);
  return result;
}

- (void)addFence:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  FMFSession *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  LogCategory_Daemon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1DC81B000, v8, OS_LOG_TYPE_DEFAULT, "FMFSession: %@ addFence: %@", buf, 0x16u);
  }

  -[FMFSession serverProxy](self, "serverProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__FMFSession_Fences__addFence_completion___block_invoke;
  v11[3] = &unk_1EA4F2B70;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "addFence:completion:", v6, v11);

}

void __42__FMFSession_Fences__addFence_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  LogCategory_Daemon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1DC81B000, v7, OS_LOG_TYPE_DEFAULT, "FMFSession: addFences result: error? %@, fences: %@", buf, 0x16u);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__FMFSession_Fences__addFence_completion___block_invoke_1;
  v12[3] = &unk_1EA4F22C8;
  v8 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v14 = v6;
  v15 = v9;
  v13 = v5;
  v10 = v6;
  v11 = v5;
  objc_msgSend(v8, "dispatchOnDelegateQueue:", v12);

}

uint64_t __42__FMFSession_Fences__addFence_completion___block_invoke_1(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)deleteFence:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  FMFSession *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  LogCategory_Daemon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1DC81B000, v8, OS_LOG_TYPE_DEFAULT, "FMFSession: %@ deleteFence: %@", buf, 0x16u);
  }

  -[FMFSession serverProxy](self, "serverProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__FMFSession_Fences__deleteFence_completion___block_invoke;
  v11[3] = &unk_1EA4F2508;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "deleteFence:completion:", v6, v11);

}

void __45__FMFSession_Fences__deleteFence_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_Daemon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_1DC81B000, v4, OS_LOG_TYPE_DEFAULT, "FMFSession: deleteFence result: error? %@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__FMFSession_Fences__deleteFence_completion___block_invoke_3;
  v8[3] = &unk_1EA4F25A8;
  v5 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  objc_msgSend(v5, "dispatchOnDelegateQueue:", v8);

}

uint64_t __45__FMFSession_Fences__deleteFence_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)fencesForHandles:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  FMFSession *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  LogCategory_Daemon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1DC81B000, v8, OS_LOG_TYPE_DEFAULT, "FMFSession: %@ fenceForHandles: %@", buf, 0x16u);
  }

  -[FMFSession serverProxy](self, "serverProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__FMFSession_Fences__fencesForHandles_completion___block_invoke;
  v11[3] = &unk_1EA4F2530;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "fencesForHandles:completion:", v6, v11);

}

void __50__FMFSession_Fences__fencesForHandles_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  LogCategory_Daemon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1DC81B000, v7, OS_LOG_TYPE_DEFAULT, "FMFSession: fenceForHandles result: error? %@, fences: %@", buf, 0x16u);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__FMFSession_Fences__fencesForHandles_completion___block_invoke_7;
  v12[3] = &unk_1EA4F22C8;
  v8 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v14 = v6;
  v15 = v9;
  v13 = v5;
  v10 = v6;
  v11 = v5;
  objc_msgSend(v8, "dispatchOnDelegateQueue:", v12);

}

uint64_t __50__FMFSession_Fences__fencesForHandles_completion___block_invoke_7(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)triggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 forDate:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  FMFSession *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = a6;
  v16 = a3;
  LogCategory_Daemon();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v23 = "-[FMFSession(Fences) triggerWithUUID:forFenceWithID:withStatus:forDate:completion:]";
    v24 = 2112;
    v25 = self;
    v26 = 2112;
    v27 = v12;
    v28 = 2112;
    v29 = v13;
    _os_log_impl(&dword_1DC81B000, v17, OS_LOG_TYPE_DEFAULT, "%s: %@ fenceID: %@ status: %@", buf, 0x2Au);
  }

  -[FMFSession serverProxy](self, "serverProxy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __83__FMFSession_Fences__triggerWithUUID_forFenceWithID_withStatus_forDate_completion___block_invoke;
  v20[3] = &unk_1EA4F2508;
  v20[4] = self;
  v21 = v14;
  v19 = v14;
  objc_msgSend(v18, "triggerWithUUID:forFenceWithID:withStatus:forDate:completion:", v16, v12, v13, v15, v20);

}

void __83__FMFSession_Fences__triggerWithUUID_forFenceWithID_withStatus_forDate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__FMFSession_Fences__triggerWithUUID_forFenceWithID_withStatus_forDate_completion___block_invoke_2;
  v7[3] = &unk_1EA4F25A8;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "dispatchOnDelegateQueue:", v7);

}

uint64_t __83__FMFSession_Fences__triggerWithUUID_forFenceWithID_withStatus_forDate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)triggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 forDate:(id)a6 triggerLocation:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  FMFSession *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a3;
  LogCategory_Daemon();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v26 = "-[FMFSession(Fences) triggerWithUUID:forFenceWithID:withStatus:forDate:triggerLocation:completion:]";
    v27 = 2112;
    v28 = self;
    v29 = 2112;
    v30 = v14;
    v31 = 2112;
    v32 = v15;
    _os_log_impl(&dword_1DC81B000, v20, OS_LOG_TYPE_DEFAULT, "%s: %@ fenceID: %@ status: %@ with trigger location", buf, 0x2Au);
  }

  -[FMFSession serverProxy](self, "serverProxy");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __99__FMFSession_Fences__triggerWithUUID_forFenceWithID_withStatus_forDate_triggerLocation_completion___block_invoke;
  v23[3] = &unk_1EA4F2508;
  v23[4] = self;
  v24 = v16;
  v22 = v16;
  objc_msgSend(v21, "triggerWithUUID:forFenceWithID:withStatus:forDate:triggerLocation:completion:", v19, v14, v15, v18, v17, v23);

}

void __99__FMFSession_Fences__triggerWithUUID_forFenceWithID_withStatus_forDate_triggerLocation_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __99__FMFSession_Fences__triggerWithUUID_forFenceWithID_withStatus_forDate_triggerLocation_completion___block_invoke_2;
  v7[3] = &unk_1EA4F25A8;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "dispatchOnDelegateQueue:", v7);

}

uint64_t __99__FMFSession_Fences__triggerWithUUID_forFenceWithID_withStatus_forDate_triggerLocation_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)muteFencesForHandle:(id)a3 untilDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  FMFSession *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  LogCategory_Daemon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v17 = "-[FMFSession(Fences) muteFencesForHandle:untilDate:completion:]";
    v18 = 2112;
    v19 = self;
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_1DC81B000, v11, OS_LOG_TYPE_DEFAULT, "%s: %@ handle: %@ date: %@", buf, 0x2Au);
  }

  -[FMFSession serverProxy](self, "serverProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__FMFSession_Fences__muteFencesForHandle_untilDate_completion___block_invoke;
  v14[3] = &unk_1EA4F2508;
  v14[4] = self;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v12, "muteFencesForHandle:untilDate:completion:", v8, v9, v14);

}

void __63__FMFSession_Fences__muteFencesForHandle_untilDate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__FMFSession_Fences__muteFencesForHandle_untilDate_completion___block_invoke_2;
  v7[3] = &unk_1EA4F25A8;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "dispatchOnDelegateQueue:", v7);

}

uint64_t __63__FMFSession_Fences__muteFencesForHandle_untilDate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)_daemonDidLaunch
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  FMFSession *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = self;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1DC81B000, v3, OS_LOG_TYPE_DEFAULT, "Received _daemonDidLaunch notification, attempting to restore connection if needed (session: %@ - client bundle id(%@))", (uint8_t *)&v6, 0x16u);

  }
  -[FMFSession restoreClientConnection](self, "restoreClientConnection");
}

- (void)restoreClientConnection
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id buf[2];

  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1DC81B000, v3, OS_LOG_TYPE_DEFAULT, "FMFSession will restore connection if needed.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  -[FMFSession connectionQueue](self, "connectionQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__FMFSession_restoreClientConnection__block_invoke;
  block[3] = &unk_1EA4F2A28;
  objc_copyWeak(&v6, buf);
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __37__FMFSession_restoreClientConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    LogCategory_Daemon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bundleIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = WeakRetained;
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_1DC81B000, v2, OS_LOG_TYPE_DEFAULT, "FMFSession restoring connection (session: %@ - client bundle id(%@))", (uint8_t *)&v8, 0x16u);

    }
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(WeakRetained, "__connection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_5);

    }
  }

}

void __37__FMFSession_restoreClientConnection__block_invoke_101(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __37__FMFSession_restoreClientConnection__block_invoke_101_cold_1();

}

+ (FMFSession)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__FMFSession_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_dispatch_predicate_2 != -1)
    dispatch_once(&sharedInstance_dispatch_predicate_2, block);
  return (FMFSession *)(id)sharedInstance__instance_1;
}

void __28__FMFSession_sharedInstance__block_invoke()
{
  id v0;
  void *v1;
  NSObject *v2;
  uint8_t v3[16];

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance__instance_1;
  sharedInstance__instance_1 = (uint64_t)v0;

  LogCategory_Daemon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DC81B000, v2, OS_LOG_TYPE_INFO, "Creating shared instance of FMFSession", v3, 2u);
  }

}

- (FMFSession)init
{
  return -[FMFSession initWithDelegate:](self, "initWithDelegate:", 0);
}

- (FMFSession)initWithDelegate:(id)a3
{
  return -[FMFSession initWithDelegate:delegateQueue:](self, "initWithDelegate:delegateQueue:", a3, 0);
}

- (void)dealloc
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  FMFSession *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  dispatch_sync((dispatch_queue_t)sessionCountQueue, &__block_literal_global_130);
  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DC81B000, v3, OS_LOG_TYPE_DEFAULT, "Unregistering for _FMFDDaemonDidLaunch notification", buf, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.icloud.fmfd.launched"), 0);
  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DC81B000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating connection due to session dealloc", buf, 2u);
  }

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  LogCategory_Daemon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = self;
    _os_log_impl(&dword_1DC81B000, v6, OS_LOG_TYPE_DEFAULT, "Deallocating session %@", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)FMFSession;
  -[FMFSession dealloc](&v7, sel_dealloc);
}

void __21__FMFSession_dealloc__block_invoke()
{
  NSObject *v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  --sessionCount;
  LogCategory_Daemon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 134217984;
    v2 = sessionCount;
    _os_log_impl(&dword_1DC81B000, v0, OS_LOG_TYPE_DEFAULT, "FMFSession current session count (%ld)", (uint8_t *)&v1, 0xCu);
  }

}

- (void)addInterruptionHander:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  v5 = -[FMFSession serverProxy](self, "serverProxy");
  objc_initWeak(&location, self);
  -[FMFSession connectionQueue](self, "connectionQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__FMFSession_addInterruptionHander___block_invoke;
  block[3] = &unk_1EA4F2C50;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __36__FMFSession_addInterruptionHander___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "sessionInterruptionFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__FMFSession_addInterruptionHander___block_invoke_2;
  v5[3] = &unk_1EA4F2C28;
  v6 = *(id *)(a1 + 32);
  v4 = (id)objc_msgSend(v3, "addSuccessBlock:", v5);

}

uint64_t __36__FMFSession_addInterruptionHander___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addInvalidationHander:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  v5 = -[FMFSession serverProxy](self, "serverProxy");
  objc_initWeak(&location, self);
  -[FMFSession connectionQueue](self, "connectionQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__FMFSession_addInvalidationHander___block_invoke;
  block[3] = &unk_1EA4F2C50;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __36__FMFSession_addInvalidationHander___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "sessionInvalidationFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__FMFSession_addInvalidationHander___block_invoke_2;
  v5[3] = &unk_1EA4F2C28;
  v6 = *(id *)(a1 + 32);
  v4 = (id)objc_msgSend(v3, "addSuccessBlock:", v5);

}

uint64_t __36__FMFSession_addInvalidationHander___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __26__FMFSession___connection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = WeakRetained;
    _os_log_impl(&dword_1DC81B000, v3, OS_LOG_TYPE_DEFAULT, "Connection to server interrupted! Session: %@", buf, 0xCu);
  }

  objc_msgSend(WeakRetained, "invalidate");
  v4 = *(void **)(a1 + 32);
  FMEmptyResult();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:", v5);

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__FMFSession___connection__block_invoke_301;
  v6[3] = &unk_1EA4F2450;
  v6[4] = WeakRetained;
  objc_msgSend(WeakRetained, "dispatchOnDelegateQueue:", v6);

}

void __26__FMFSession___connection__block_invoke_301(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.fmf.error"), 1019, 0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "connectionError:", v1);

  }
}

void __26__FMFSession___connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = WeakRetained;
    _os_log_impl(&dword_1DC81B000, v3, OS_LOG_TYPE_DEFAULT, "Connection to server invalidated! Session: %@", buf, 0xCu);
  }

  objc_msgSend(WeakRetained, "invalidate");
  v4 = *(void **)(a1 + 32);
  FMEmptyResult();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:", v5);

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__FMFSession___connection__block_invoke_304;
  v6[3] = &unk_1EA4F2450;
  v6[4] = WeakRetained;
  objc_msgSend(WeakRetained, "dispatchOnDelegateQueue:", v6);

}

void __26__FMFSession___connection__block_invoke_304(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.fmf.error"), 1020, 0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "connectionError:", v1);

  }
}

void __26__FMFSession___connection__block_invoke_2_334(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __26__FMFSession___connection__block_invoke_2_334_cold_1();

}

void __25__FMFSession_serverProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __25__FMFSession_serverProxy__block_invoke_cold_1();

}

- (void)invalidate
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id buf[2];

  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1DC81B000, v3, OS_LOG_TYPE_DEFAULT, "FMFSession will invalidate connection if needed.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  -[FMFSession connectionQueue](self, "connectionQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__FMFSession_invalidate__block_invoke;
  block[3] = &unk_1EA4F2A28;
  objc_copyWeak(&v6, buf);
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __24__FMFSession_invalidate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = *((id *)WeakRetained + 5);
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "invalidate");
      v5 = (void *)v2[5];
      v2[5] = 0;

      LogCategory_Daemon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 138412290;
        v8 = v4;
        _os_log_impl(&dword_1DC81B000, v6, OS_LOG_TYPE_DEFAULT, "FMFSession did invalidate connection %@.", (uint8_t *)&v7, 0xCu);
      }

    }
  }

}

- (void)forceRefresh
{
  id v2;

  -[FMFSession serverProxy](self, "serverProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceRefresh");

}

- (void)forceRefreshWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forceRefreshWithCompletion:", v4);

}

- (void)failedToGetLocationForHandle:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__FMFSession_failedToGetLocationForHandle_error___block_invoke;
  v10[3] = &unk_1EA4F2478;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[FMFSession dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v10);

}

void __49__FMFSession_failedToGetLocationForHandle_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didFailToFetchLocationForHandle:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)didAddFollowerHandle:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__FMFSession_didAddFollowerHandle___block_invoke;
  v6[3] = &unk_1EA4F2AD8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[FMFSession dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v6);

}

void __35__FMFSession_didAddFollowerHandle___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1DC81B000, v3, OS_LOG_TYPE_DEFAULT, "didAddFollowerHandle: %@", (uint8_t *)&v5, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didStartSharingMyLocationWithHandle:", *(_QWORD *)(a1 + 40));

}

- (void)didRemoveFollowerHandle:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__FMFSession_didRemoveFollowerHandle___block_invoke;
  v6[3] = &unk_1EA4F2AD8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[FMFSession dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v6);

}

void __38__FMFSession_didRemoveFollowerHandle___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1DC81B000, v3, OS_LOG_TYPE_DEFAULT, "didRemoveFollowerHandle: %@", (uint8_t *)&v5, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didStopSharingMyLocationWithHandle:", *(_QWORD *)(a1 + 40));

}

- (void)didStartFollowingHandle:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__FMFSession_didStartFollowingHandle___block_invoke;
  v6[3] = &unk_1EA4F2AD8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[FMFSession dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v6);

}

void __38__FMFSession_didStartFollowingHandle___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1DC81B000, v3, OS_LOG_TYPE_DEFAULT, "didStartFollowingHandle: %@", (uint8_t *)&v5, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didStartAbilityToGetLocationForHandle:", *(_QWORD *)(a1 + 40));

}

- (void)didStopFollowingHandle:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__FMFSession_didStopFollowingHandle___block_invoke;
  v6[3] = &unk_1EA4F2AD8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[FMFSession dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v6);

}

void __37__FMFSession_didStopFollowingHandle___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1DC81B000, v3, OS_LOG_TYPE_DEFAULT, "didStopFollowingHandle: %@", (uint8_t *)&v5, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didStopAbilityToGetLocationForHandle:", *(_QWORD *)(a1 + 40));

}

- (void)didUpdateFavorites:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__FMFSession_didUpdateFavorites___block_invoke;
  v6[3] = &unk_1EA4F2AD8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[FMFSession dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v6);

}

void __33__FMFSession_didUpdateFavorites___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1DC81B000, v3, OS_LOG_TYPE_DEFAULT, "didUpdateFavorites: %@", (uint8_t *)&v5, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didUpdateFavoriteHandles:", *(_QWORD *)(a1 + 40));

}

- (void)didUpdateHideFromFollowersStatus:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__FMFSession_didUpdateHideFromFollowersStatus___block_invoke;
  v3[3] = &unk_1EA4F2D30;
  v3[4] = self;
  v4 = a3;
  -[FMFSession dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v3);
}

void __47__FMFSession_didUpdateHideFromFollowersStatus___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(unsigned __int8 *)(a1 + 40);
    v5[0] = 67109120;
    v5[1] = v4;
    _os_log_impl(&dword_1DC81B000, v3, OS_LOG_TYPE_DEFAULT, "didUpdateHideFromFollowersStatus: %d", (uint8_t *)v5, 8u);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didUpdateHidingStatus:", *(unsigned __int8 *)(a1 + 40));

}

- (void)didUpdateActiveDeviceList:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__FMFSession_didUpdateActiveDeviceList___block_invoke;
  v6[3] = &unk_1EA4F2AD8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[FMFSession dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v6);

}

void __40__FMFSession_didUpdateActiveDeviceList___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1DC81B000, v3, OS_LOG_TYPE_DEFAULT, "didUpdateActiveDeviceList: %@", (uint8_t *)&v5, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didUpdateActiveDeviceList:", *(_QWORD *)(a1 + 40));

}

- (void)didReceiveFriendshipRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__FMFSession_didReceiveFriendshipRequest___block_invoke;
  v6[3] = &unk_1EA4F2AD8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[FMFSession dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v6);

}

void __42__FMFSession_didReceiveFriendshipRequest___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1DC81B000, v3, OS_LOG_TYPE_DEFAULT, "didReceiveFriendshipRequest: %@", (uint8_t *)&v5, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didReceiveFriendshipRequest:", *(_QWORD *)(a1 + 40));

}

- (void)didUpdatePendingOffersForHandles:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__FMFSession_didUpdatePendingOffersForHandles___block_invoke;
  v6[3] = &unk_1EA4F2AD8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[FMFSession dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v6);

}

void __47__FMFSession_didUpdatePendingOffersForHandles___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1DC81B000, v3, OS_LOG_TYPE_DEFAULT, "didUpdatePendingOffersForHandles: %@", (uint8_t *)&v5, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didUpdatePendingOffersForHandles:", *(_QWORD *)(a1 + 40));

}

- (void)sendMappingPacket:(id)a3 toHandle:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__FMFSession_sendMappingPacket_toHandle___block_invoke;
  v10[3] = &unk_1EA4F2478;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[FMFSession dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v10);

}

void __41__FMFSession_sendMappingPacket_toHandle___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1DC81B000, v3, OS_LOG_TYPE_DEFAULT, "sendMappingPacket:toHandle: %@", (uint8_t *)&v5, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "sendMappingPacket:toHandle:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)didReceiveServerError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__FMFSession_didReceiveServerError___block_invoke;
  v6[3] = &unk_1EA4F2AD8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[FMFSession dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v6);

}

void __36__FMFSession_didReceiveServerError___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1DC81B000, v3, OS_LOG_TYPE_DEFAULT, "didReceiveServerError: %@", (uint8_t *)&v5, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didReceiveServerError:", *(_QWORD *)(a1 + 40));

}

- (void)abDidChange
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  LogCategory_Daemon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DC81B000, v2, OS_LOG_TYPE_DEFAULT, "abDidChange", v4, 2u);
  }

  +[FMFSessionDataManager sharedInstance](FMFSessionDataManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "abDidChange");

}

- (void)abPreferencesDidChange
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  LogCategory_Daemon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DC81B000, v2, OS_LOG_TYPE_DEFAULT, "abPreferencesDidChange", v4, 2u);
  }

  +[FMFSessionDataManager sharedInstance](FMFSessionDataManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "abPreferencesDidChange");

}

- (void)networkReachabilityUpdated:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;
  uint8_t buf[4];
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v9 = v3;
    _os_log_impl(&dword_1DC81B000, v5, OS_LOG_TYPE_DEFAULT, "networkReachabilityUpdated, Is reachable %d", buf, 8u);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__FMFSession_networkReachabilityUpdated___block_invoke;
  v6[3] = &unk_1EA4F2D30;
  v6[4] = self;
  v7 = v3;
  -[FMFSession dispatchOnDelegateQueue:](self, "dispatchOnDelegateQueue:", v6);
}

void __41__FMFSession_networkReachabilityUpdated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "networkReachabilityUpdated:", *(unsigned __int8 *)(a1 + 40));

}

- (NSSet)handles
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  -[FMFSession handlesQueue](self, "handlesQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __21__FMFSession_handles__block_invoke;
  v6[3] = &unk_1EA4F2C78;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

void __21__FMFSession_handles__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "internalHandles");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setHandles:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FMFSession handles](self, "handles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "minusSet:", v4);
  -[FMFSession removeHandles:](self, "removeHandles:", v6);
  -[FMFSession addHandles:](self, "addHandles:", v4);

}

- (void)addHandles:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  FMFSession *v10;

  v4 = a3;
  -[FMFSession handlesQueue](self, "handlesQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__FMFSession_addHandles___block_invoke;
  block[3] = &unk_1EA4F2AD8;
  v7 = v4;
  v9 = v7;
  v10 = self;
  dispatch_sync(v5, block);

  if (objc_msgSend(v7, "count"))
  {
    -[FMFSession serverProxy](self, "serverProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addFriendHandles:", v7);

  }
}

void __25__FMFSession_addHandles___block_invoke(uint64_t a1)
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
  LogCategory_Daemon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1DC81B000, v2, OS_LOG_TYPE_DEFAULT, "Adding handles: %@ to session: %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "internalHandles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", *(_QWORD *)(a1 + 32));

}

- (void)removeHandles:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  FMFSession *v10;

  v4 = a3;
  -[FMFSession handlesQueue](self, "handlesQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__FMFSession_removeHandles___block_invoke;
  block[3] = &unk_1EA4F2AD8;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_sync(v5, block);

  -[FMFSession serverProxy](self, "serverProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFriendHandles:", v7);

}

void __28__FMFSession_removeHandles___block_invoke(uint64_t a1)
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
  LogCategory_Daemon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1DC81B000, v2, OS_LOG_TYPE_DEFAULT, "Removing handles: %@ from session: %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "internalHandles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minusSet:", *(_QWORD *)(a1 + 32));

}

- (void)setDebugContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMFSession serverProxy](self, "serverProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDebugContext:", v4);

}

- (void)receivedMappingPacket:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v6 = a4;
  v7 = a3;
  LogCategory_Daemon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1DC81B000, v8, OS_LOG_TYPE_DEFAULT, "receivedMappingPacket:", v10, 2u);
  }

  -[FMFSession serverProxy](self, "serverProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "importMappingPacket:completion:", v7, v6);

}

- (void)mappingPacketSendFailed:(id)a3 toHandle:(id)a4 withError:(id)a5
{
  id v5;
  NSObject *v6;

  v5 = a5;
  LogCategory_Daemon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[FMFSession mappingPacketSendFailed:toHandle:withError:].cold.1((uint64_t)v5, v6);

}

- (void)handleIncomingAirDropURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  LogCategory_Daemon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl(&dword_1DC81B000, v8, OS_LOG_TYPE_DEFAULT, "handleIncomingAirDropURL: %@", buf, 0xCu);
  }

  objc_msgSend(v6, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__FMFSession_handleIncomingAirDropURL_completion___block_invoke;
  v11[3] = &unk_1EA4F25F8;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  -[FMFSession receivedMappingPacket:completion:](self, "receivedMappingPacket:completion:", v9, v11);

}

void __50__FMFSession_handleIncomingAirDropURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  LogCategory_Daemon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1DC81B000, v7, OS_LOG_TYPE_DEFAULT, "receivedMappingPacket: completion responseId: %@", (uint8_t *)&v10, 0xCu);
  }

  if (v6)
  {
    if (objc_msgSend(v6, "code") != 1000)
      goto LABEL_8;
    objc_msgSend(*(id *)(a1 + 32), "serverProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "showAirDropImportErrorAlert");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "serverProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "showAirDropImportAlertForId:", v5);
  }

LABEL_8:
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

+ (BOOL)FMFAllowed
{
  void *v2;

  if (!FMFAllowed_fmfAllowedNumber)
  {
    v2 = (void *)MGCopyAnswer();
    objc_storeStrong((id *)&FMFAllowed_fmfAllowedNumber, v2);
    if (v2)
      CFRelease(v2);
  }
  return objc_msgSend((id)FMFAllowed_fmfAllowedNumber, "BOOLValue");
}

+ (BOOL)FMFRestricted
{
  uint64_t v2;
  void *v3;

  v2 = *MEMORY[0x1E0D47018];
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "effectiveBoolValueForSetting:", v2) == 2;

  return v2;
}

+ (BOOL)isProvisionedForLocationSharing
{
  id v2;
  void *v3;
  void *v4;
  char v5;

  v2 = objc_alloc_init(getACAccountStoreClass());
  objc_msgSend(v2, "aa_primaryAppleAccountWithPreloadedDataclasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "isProvisionedForDataclass:", *MEMORY[0x1E0C8F408]);
  else
    v5 = 1;

  return v5;
}

+ (BOOL)isAnyAccountManaged
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  NSObject *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[4];
  int v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(getACAccountStoreClass());
  objc_msgSend(v2, "aa_appleAccounts");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "aa_isManagedAppleID", (_QWORD)v9) & 1) != 0)
        {
          LODWORD(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  LogCategory_Daemon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v14 = v4;
    _os_log_impl(&dword_1DC81B000, v7, OS_LOG_TYPE_DEFAULT, "FMFSession: isAnyAccountManaged %d", buf, 8u);
  }

  return v4;
}

- (NSMutableSet)internalHandles
{
  return self->_internalHandles;
}

- (void)setInternalHandles:(id)a3
{
  objc_storeStrong((id *)&self->_internalHandles, a3);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSSet)cachedGetHandlesSharingLocationsWithMe
{
  return self->_cachedGetHandlesSharingLocationsWithMe;
}

- (void)setCachedGetHandlesSharingLocationsWithMe:(id)a3
{
  objc_storeStrong((id *)&self->_cachedGetHandlesSharingLocationsWithMe, a3);
}

- (NSSet)cachedGetHandlesFollowingMyLocation
{
  return self->_cachedGetHandlesFollowingMyLocation;
}

- (void)setCachedGetHandlesFollowingMyLocation:(id)a3
{
  objc_storeStrong((id *)&self->_cachedGetHandlesFollowingMyLocation, a3);
}

- (NSMutableDictionary)cachedLocationForHandleByHandle
{
  return self->_cachedLocationForHandleByHandle;
}

- (void)setCachedLocationForHandleByHandle:(id)a3
{
  objc_storeStrong((id *)&self->_cachedLocationForHandleByHandle, a3);
}

- (NSMutableDictionary)cachedOfferExpirationForHandleByHandle
{
  return self->_cachedOfferExpirationForHandleByHandle;
}

- (void)setCachedOfferExpirationForHandleByHandle:(id)a3
{
  objc_storeStrong((id *)&self->_cachedOfferExpirationForHandleByHandle, a3);
}

- (NSMutableDictionary)cachedCanShareLocationWithHandleByHandle
{
  return self->_cachedCanShareLocationWithHandleByHandle;
}

- (void)setCachedCanShareLocationWithHandleByHandle:(id)a3
{
  objc_storeStrong((id *)&self->_cachedCanShareLocationWithHandleByHandle, a3);
}

- (OS_dispatch_queue)handlesQueue
{
  return self->_handlesQueue;
}

- (BOOL)isModelInitialized
{
  return self->_isModelInitialized;
}

- (FMFuture)sessionInvalidationFuture
{
  return self->_sessionInvalidationFuture;
}

- (void)setSessionInvalidationFuture:(id)a3
{
  objc_storeStrong((id *)&self->_sessionInvalidationFuture, a3);
}

- (FMFuture)sessionInterruptionFuture
{
  return self->_sessionInterruptionFuture;
}

- (void)setSessionInterruptionFuture:(id)a3
{
  objc_storeStrong((id *)&self->_sessionInterruptionFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionInterruptionFuture, 0);
  objc_storeStrong((id *)&self->_sessionInvalidationFuture, 0);
  objc_storeStrong((id *)&self->_handlesQueue, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_cachedCanShareLocationWithHandleByHandle, 0);
  objc_storeStrong((id *)&self->_cachedOfferExpirationForHandleByHandle, 0);
  objc_storeStrong((id *)&self->_cachedLocationForHandleByHandle, 0);
  objc_storeStrong((id *)&self->_cachedGetHandlesFollowingMyLocation, 0);
  objc_storeStrong((id *)&self->_cachedGetHandlesSharingLocationsWithMe, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_internalHandles, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)getHandlesSharingLocationsWithMe
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[FMFSessionDataManager sharedInstance](FMFSessionDataManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "following");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1DC81B000, v5, OS_LOG_TYPE_DEFAULT, "getHandlesSharingLocationsWithMe: %@", (uint8_t *)&v7, 0xCu);
  }

  -[FMFSession reloadDataIfNotLoaded](self, "reloadDataIfNotLoaded");
  return v4;
}

- (id)getHandlesFollowingMyLocation
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[FMFSessionDataManager sharedInstance](FMFSessionDataManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "followers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1DC81B000, v5, OS_LOG_TYPE_DEFAULT, "getHandlesFollowingMyLocation: %@", (uint8_t *)&v7, 0xCu);
  }

  -[FMFSession reloadDataIfNotLoaded](self, "reloadDataIfNotLoaded");
  return v4;
}

- (id)getFavoritesSharingLocationWithMe
{
  void *v3;
  FMFSynchronizer *v4;
  void *v5;
  FMFSynchronizer *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  FMFSynchronizer *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[FMFSession(Data) getFavoritesSharingLocationWithMe]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FMFSynchronizer initWithDescription:andTimeout:]([FMFSynchronizer alloc], "initWithDescription:andTimeout:", v3, 1.0);
  -[FMFSession serverProxy](self, "serverProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __53__FMFSession_Data__getFavoritesSharingLocationWithMe__block_invoke;
  v14 = &unk_1EA4F2E78;
  v16 = &v17;
  v6 = v4;
  v15 = v6;
  objc_msgSend(v5, "favoritesForMaxCount:completion:", 0, &v11);

  -[FMFSynchronizer wait](v6, "wait", v11, v12, v13, v14);
  LogCategory_Daemon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v18[5];
    *(_DWORD *)buf = 138412290;
    v24 = v8;
    _os_log_impl(&dword_1DC81B000, v7, OS_LOG_TYPE_DEFAULT, "getFavoritesSharingLocationWithMe: %@", buf, 0xCu);
  }

  v9 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v9;
}

void __53__FMFSession_Data__getFavoritesSharingLocationWithMe__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "signal");

}

- (BOOL)canShareLocationWithHandle:(id)a3 groupId:(id)a4 callerId:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  int v14;
  id v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  +[FMFSessionDataManager sharedInstance](FMFSessionDataManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "followerForHandle:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (v8)
      v11 = objc_msgSend(v10, "isSharingThroughGroupId:", v8);
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  LogCategory_Daemon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412802;
    v15 = v7;
    v16 = 1024;
    v17 = v11;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_1DC81B000, v12, OS_LOG_TYPE_DEFAULT, "canShareLocationWithHandle: %@: %d groupId: %@", (uint8_t *)&v14, 0x1Cu);
  }

  -[FMFSession reloadDataIfNotLoaded](self, "reloadDataIfNotLoaded");
  return v11;
}

- (BOOL)canGetLocationForHandle:(id)a3 groupId:(id)a4 callerId:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  int v14;
  id v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  +[FMFSessionDataManager sharedInstance](FMFSessionDataManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "followingForHandle:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (v8)
      v11 = objc_msgSend(v10, "isSharingThroughGroupId:", v8);
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  LogCategory_Daemon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412802;
    v15 = v7;
    v16 = 1024;
    v17 = v11;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_1DC81B000, v12, OS_LOG_TYPE_DEFAULT, "canGetLocationForHandle: %@: %d groupId: %@", (uint8_t *)&v14, 0x1Cu);
  }

  -[FMFSession reloadDataIfNotLoaded](self, "reloadDataIfNotLoaded");
  return v11;
}

- (id)getHandlesWithPendingOffers
{
  void *v3;
  FMFSynchronizer *v4;
  void *v5;
  FMFSynchronizer *v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  FMFSynchronizer *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[FMFSession(Data) getHandlesWithPendingOffers]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FMFSynchronizer initWithDescription:andTimeout:]([FMFSynchronizer alloc], "initWithDescription:andTimeout:", v3, 1.0);
  -[FMFSession serverProxy](self, "serverProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __47__FMFSession_Data__getHandlesWithPendingOffers__block_invoke;
  v12 = &unk_1EA4F2200;
  v14 = &v15;
  v6 = v4;
  v13 = v6;
  objc_msgSend(v5, "getHandlesWithPendingOffers:", &v9);

  -[FMFSynchronizer wait](v6, "wait", v9, v10, v11, v12);
  v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v7;
}

void __47__FMFSession_Data__getHandlesWithPendingOffers__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "signal");

}

- (BOOL)isMyLocationEnabled
{
  void *v3;
  FMFSynchronizer *v4;
  void *v5;
  FMFSynchronizer *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, char);
  void *v11;
  FMFSynchronizer *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[FMFSession(Data) isMyLocationEnabled]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FMFSynchronizer initWithDescription:andTimeout:]([FMFSynchronizer alloc], "initWithDescription:andTimeout:", v3, 1.0);
  -[FMFSession serverProxy](self, "serverProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __39__FMFSession_Data__isMyLocationEnabled__block_invoke;
  v11 = &unk_1EA4F2EA0;
  v13 = &v14;
  v6 = v4;
  v12 = v6;
  objc_msgSend(v5, "isMyLocationEnabled:", &v8);

  -[FMFSynchronizer wait](v6, "wait", v8, v9, v10, v11);
  LOBYTE(v5) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)v5;
}

uint64_t __39__FMFSession_Data__isMyLocationEnabled__block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

- (id)cachedLocationForHandle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[FMFSessionDataManager sharedInstance](FMFSessionDataManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationForHandle:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LogCategory_Daemon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v3;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1DC81B000, v6, OS_LOG_TYPE_DEFAULT, "cachedLocationForHandle: %@: %@", (uint8_t *)&v8, 0x16u);
  }

  return v5;
}

- (id)getOfferExpirationForHandle:(id)a3 groupId:(id)a4 callerId:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  +[FMFSessionDataManager sharedInstance](FMFSessionDataManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "offerExpirationForHandle:groupId:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LogCategory_Daemon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412802;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_1DC81B000, v11, OS_LOG_TYPE_DEFAULT, "getOfferExpirationForHandle: %@ groupId: %@ result:%@", (uint8_t *)&v13, 0x20u);
  }

  -[FMFSession reloadDataIfNotLoaded](self, "reloadDataIfNotLoaded");
  return v10;
}

- (void)reloadDataIfNotLoaded
{
  NSObject *v3;
  uint8_t v4[16];

  if (!-[FMFSession hasModelInitialized](self, "hasModelInitialized"))
  {
    LogCategory_Daemon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1DC81B000, v3, OS_LOG_TYPE_DEFAULT, "Reloading Data - Not Loaded", v4, 2u);
    }

    -[FMFSession forceRefresh](self, "forceRefresh");
  }
}

void __47__FMFSession_Admin__getThisDeviceAndCompanion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[FMFSession(Admin) getThisDeviceAndCompanion:]_block_invoke";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1DC81B000, a2, OS_LOG_TYPE_ERROR, "%s: getAllDevices failed, error = %@", (uint8_t *)&v2, 0x16u);
}

void __48__FMFSession_Admin__setActiveDevice_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DC81B000, a1, a3, "Trying to setActiveDevice:completion: when device is offline", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __58__FMFSession_Notifications__contactForPayload_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DC81B000, a2, a3, "Error occured when getting contact for payload %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __68__FMFSession_Notifications__handleAndLocationForPayload_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DC81B000, a2, a3, "Error occured when getting handle and location for payload %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __55__FMFSession_Notifications__dataForPayload_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DC81B000, a2, a3, "Error occured when getting dataForPayload for payload %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __60__FMFSession_Establish___checkAndDisplayMeDeviceSwitchAlert__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DC81B000, a2, OS_LOG_TYPE_ERROR, "Error while trying to get active Share My Location device: %@", (uint8_t *)&v2, 0xCu);
}

void __90__FMFSession_Establish__sendFriendshipOfferToHandles_groupId_callerId_endDate_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DC81B000, v0, v1, "Trying to sendFriendshipOfferToHandles:groupId:callerId:endDate:completion: when device is offline", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __86__FMFSession_Establish__stopSharingMyLocationWithHandles_groupId_callerId_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DC81B000, v0, v1, "Trying to stopSharingMyLocationWithHandle:groupId:callerId:endDate:completion: when device is offline", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __37__FMFSession_restoreClientConnection__block_invoke_101_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5(&dword_1DC81B000, v0, v1, "Failed to restore connection. %s: error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __45__FMFSession_initWithDelegate_delegateQueue___block_invoke_2_cold_1(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 134217984;
  v2 = sessionCount;
  _os_log_fault_impl(&dword_1DC81B000, log, OS_LOG_TYPE_FAULT, "Too many FMFSession instances (%ld)", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

void __26__FMFSession___connection__block_invoke_2_334_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5(&dword_1DC81B000, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __25__FMFSession_serverProxy__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_5(&dword_1DC81B000, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)mappingPacketSendFailed:(uint64_t)a1 toHandle:(NSObject *)a2 withError:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DC81B000, a2, OS_LOG_TYPE_ERROR, "mappingPacketSendFailed: Error: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

@end
