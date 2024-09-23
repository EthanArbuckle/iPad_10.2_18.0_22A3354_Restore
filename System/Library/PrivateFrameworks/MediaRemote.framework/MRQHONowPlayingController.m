@implementation MRQHONowPlayingController

+ (id)localRouteController
{
  MRQHONowPlayingController *v2;
  void *v3;
  MRQHONowPlayingController *v4;

  v2 = [MRQHONowPlayingController alloc];
  v3 = (void *)MRMediaRemoteAirPlayReceiverCopyPairingIdentity();
  v4 = -[MRQHONowPlayingController initWithUID:](v2, "initWithUID:", v3);

  return v4;
}

+ (id)proactiveEndpointController
{
  return -[MRQHONowPlayingController initWithUID:]([MRQHONowPlayingController alloc], "initWithUID:", CFSTR("proactiveEndpoint"));
}

- (MRQHONowPlayingController)initWithUID:(id)a3
{
  return -[MRQHONowPlayingController initWithUID:client:player:](self, "initWithUID:client:player:", a3, 0, 0);
}

- (MRQHONowPlayingController)initWithUID:(id)a3 client:(id)a4 player:(id)a5
{
  id v8;
  id v9;
  id v10;
  MRQHONowPlayingController *v11;
  uint64_t v12;
  NSString *uid;
  uint64_t v14;
  MRClient *client;
  uint64_t v16;
  MRPlayer *player;
  NSMutableArray *v18;
  NSMutableArray *deferredContentItemsToMerge;
  id v20;
  const char *v21;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *queue;
  id v25;
  const char *v26;
  NSObject *v27;
  dispatch_queue_t v28;
  OS_dispatch_queue *delegateQueue;
  objc_super v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)MRQHONowPlayingController;
  v11 = -[MRQHONowPlayingController init](&v31, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    uid = v11->_uid;
    v11->_uid = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    client = v11->_client;
    v11->_client = (MRClient *)v14;

    v16 = objc_msgSend(v10, "copy");
    player = v11->_player;
    v11->_player = (MRPlayer *)v16;

    *(_DWORD *)&v11->_registeredForNotifications = 0;
    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deferredContentItemsToMerge = v11->_deferredContentItemsToMerge;
    v11->_deferredContentItemsToMerge = v18;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.MediaRemote.MRQHONowPlayingController:%@|queue"), v8);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = (const char *)objc_msgSend(v20, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = dispatch_queue_create(v21, v22);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v23;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.MediaRemote.MRQHONowPlayingController:%@|delegateQueue"), v8);
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v26 = (const char *)objc_msgSend(v25, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = dispatch_queue_create(v26, v27);
    delegateQueue = v11->_delegateQueue;
    v11->_delegateQueue = (OS_dispatch_queue *)v28;

  }
  return v11;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[MRQHONowPlayingController uid](self, "uid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v7 = v4;
    _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> Deallocating.", buf, 0xCu);

  }
  -[MRQHONowPlayingController _unregisterForPlayerPathInvalidations](self, "_unregisterForPlayerPathInvalidations");
  v5.receiver = self;
  v5.super_class = (Class)MRQHONowPlayingController;
  -[MRQHONowPlayingController dealloc](&v5, sel_dealloc);
}

- (void)beginLoadingUpdates
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!-[MRQHONowPlayingController updateLoadingEnabled](self, "updateLoadingEnabled"))
  {
    _MRLogForCategory(1uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[MRQHONowPlayingController uid](self, "uid");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> Begin loading updates.", buf, 0xCu);

    }
    -[MRQHONowPlayingController uid](self, "uid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRQHONowPlayingController client](self, "client");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRQHONowPlayingController player](self, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__MRQHONowPlayingController_beginLoadingUpdates__block_invoke;
    v8[3] = &unk_1E30C7958;
    v8[4] = self;
    -[MRQHONowPlayingController _loadNowPlayingStateForUID:client:player:completion:](self, "_loadNowPlayingStateForUID:client:player:completion:", v5, v6, v7, v8);

  }
}

void __48__MRQHONowPlayingController_beginLoadingUpdates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setUpdateLoadingEnabled:", 1);
  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v6, "_onQueue_updateByReplacingWithNewResponse:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfError:", v5);
  }
  else
  {
    objc_msgSend(v6, "_onQueue_updateByReplacingWithNewResponse:", v7);
    objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfNewResponse:", v7);
  }

}

- (void)endLoadingUpdates
{
  NSObject *v3;
  _QWORD block[5];

  -[MRQHONowPlayingController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MRQHONowPlayingController_endLoadingUpdates__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __46__MRQHONowPlayingController_endLoadingUpdates__block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 11))
  {
    v1 = result;
    _MRLogForCategory(1uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(v1 + 32), "uid");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 138412290;
      v5 = v3;
      _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> End loading updates.", (uint8_t *)&v4, 0xCu);

    }
    objc_msgSend(*(id *)(v1 + 32), "_unregisterForEndpointChanges");
    objc_msgSend(*(id *)(v1 + 32), "_unregisterForPlayerPathInvalidations");
    objc_msgSend(*(id *)(v1 + 32), "_unregisterNotificationHandlers");
    objc_msgSend(*(id *)(v1 + 32), "_onQueue_clearState");
    objc_msgSend(*(id *)(v1 + 32), "setEndpointObserverGroupUID:", 0);
    return objc_msgSend(*(id *)(v1 + 32), "setUpdateLoadingEnabled:", 0);
  }
  return result;
}

- (void)_reloadForCompleteInvalidation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[MRQHONowPlayingController uid](self, "uid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRQHONowPlayingController client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRQHONowPlayingController player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__MRQHONowPlayingController__reloadForCompleteInvalidation__block_invoke;
  v6[3] = &unk_1E30C7958;
  v6[4] = self;
  -[MRQHONowPlayingController _loadNowPlayingStateForUID:client:player:completion:](self, "_loadNowPlayingStateForUID:client:player:completion:", v3, v4, v5, v6);

}

void __59__MRQHONowPlayingController__reloadForCompleteInvalidation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v6, "_onQueue_updateByReplacingWithNewResponse:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfError:", v5);
  }
  else
  {
    objc_msgSend(v6, "_onQueue_updateByReplacingWithNewResponse:", v7);
    objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfNewResponse:", v7);
  }

}

- (void)_reloadForPlayerPathInvalidation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[MRQHONowPlayingController _unregisterForPlayerPathInvalidations](self, "_unregisterForPlayerPathInvalidations");
  -[MRQHONowPlayingController endpoint](self, "endpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRQHONowPlayingController client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRQHONowPlayingController player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__MRQHONowPlayingController__reloadForPlayerPathInvalidation__block_invoke;
  v6[3] = &unk_1E30C7958;
  v6[4] = self;
  -[MRQHONowPlayingController _loadNowPlayingStateForEndpoint:client:player:completion:](self, "_loadNowPlayingStateForEndpoint:client:player:completion:", v3, v4, v5, v6);

}

void __61__MRQHONowPlayingController__reloadForPlayerPathInvalidation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v6, "_onQueue_updateByReplacingWithNewResponse:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfError:", v5);
  }
  else
  {
    objc_msgSend(v6, "_onQueue_updateByReplacingWithNewResponse:", v7);
    objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfNewResponse:", v7);
  }

}

- (void)_loadNowPlayingStateForUID:(id)a3 client:(id)a4 player:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[MRQHONowPlayingController queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__MRQHONowPlayingController__loadNowPlayingStateForUID_client_player_completion___block_invoke;
  block[3] = &unk_1E30C79A8;
  block[4] = self;
  v20 = v10;
  v22 = v12;
  v23 = v13;
  v21 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v13;
  v18 = v10;
  dispatch_async(v14, block);

}

void __81__MRQHONowPlayingController__loadNowPlayingStateForUID_client_player_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearState");
  _MRLogForCategory(1uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v15 = v3;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> Begin resolving endpoint.", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__MRQHONowPlayingController__loadNowPlayingStateForUID_client_player_completion___block_invoke_13;
  v8[3] = &unk_1E30C7980;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = v7;
  v13 = *(id *)(a1 + 64);
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  objc_msgSend(v5, "_onQueue_retrieveEndpointForUID:completion:", v6, v8);

}

void __81__MRQHONowPlayingController__loadNowPlayingStateForUID_client_player_completion___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _MRLogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __81__MRQHONowPlayingController__loadNowPlayingStateForUID_client_player_completion___block_invoke_13_cold_1(a1, v8, v9);

    objc_msgSend(*(id *)(a1 + 40), "_registerForEndpointChangesIfNeeded");
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "uid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v10;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> Resolved to Endpoint: %@.", (uint8_t *)&v11, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "setEndpoint:", v5);
    objc_msgSend(*(id *)(a1 + 40), "_loadNowPlayingStateForEndpoint:client:player:completion:", v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }

}

- (void)_loadNowPlayingStateForEndpoint:(id)a3 client:(id)a4 player:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  _MRLogForCategory(1uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[MRQHONowPlayingController uid](self, "uid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = v15;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_193827000, v14, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> Begin resolving player path for endpoint %@.", buf, 0x16u);

  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __86__MRQHONowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke;
  v17[3] = &unk_1E30C79F8;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  -[MRQHONowPlayingController _createPlayerPathForEndpoint:client:player:completion:](self, "_createPlayerPathForEndpoint:client:player:completion:", v10, v13, v12, v17);

}

void __86__MRQHONowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _MRLogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __86__MRQHONowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __86__MRQHONowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_15;
    v9[3] = &unk_1E30C79D0;
    v8 = *(void **)(a1 + 40);
    v10 = *(id *)(a1 + 32);
    v12 = v8;
    v11 = v5;
    objc_msgSend(v10, "_resolvePlayerPath:completion:", v11, v9);

  }
}

void __86__MRQHONowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _MRLogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __86__MRQHONowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_15_cold_3();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else if ((objc_msgSend(v5, "isResolved") & 1) != 0)
  {
    v8 = (id *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 32), "setUnresolvedPlayerPath:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setResolvedPlayerPath:", v5);
    _MRLogForCategory(1uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*v8, "uid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v10;
      v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> Resolved to player path: %@.", buf, 0x16u);

    }
    objc_msgSend(*v8, "_registerNotificationHandlersIfNeeded");
    objc_msgSend(*v8, "_registerForPlayerPathInvalidationsIfNeeded");
    objc_msgSend(*v8, "_registerForEndpointChangesIfNeeded");
    _MRLogForCategory(1uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*v8, "uid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v12;
      _os_log_impl(&dword_193827000, v11, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> Begin loading data.", buf, 0xCu);

    }
    v13 = *v8;
    v22 = 0;
    objc_msgSend(v13, "_loadNowPlayingStateForPlayerPath:error:", v5, &v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v22;
    _MRLogForCategory(1uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __86__MRQHONowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_15_cold_1();
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*v8, "uid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v21;
      v25 = 2112;
      v26 = v14;
      _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> End loading data. Response: %@.", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    _MRLogForCategory(1uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __86__MRQHONowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_15_cold_2(a1, v18);

    objc_msgSend(*(id *)(a1 + 32), "setResponse:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setUnresolvedPlayerPath:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_registerForPlayerPathInvalidationsIfNeeded");
    objc_msgSend(*(id *)(a1 + 32), "_registerForEndpointChangesIfNeeded");
    v19 = *(_QWORD *)(a1 + 48);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 42);
    (*(void (**)(uint64_t, _QWORD, void *))(v19 + 16))(v19, 0, v20);

  }
}

- (id)_loadNowPlayingStateForPlayerPath:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  dispatch_time_t v16;
  id v17;
  id v18;
  void *v19;
  MRNowPlayingPlayerResponse *v20;
  MRDestination *v22;
  MRDestination *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  NSObject *v28;
  uint64_t *v29;
  _QWORD v30[4];
  NSObject *v31;
  MRQHONowPlayingController *v32;
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  _QWORD v36[4];
  NSObject *v37;
  uint64_t *v38;
  _QWORD v39[4];
  NSObject *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  int v76;

  v6 = a3;
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v76 = 0;
  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__6;
  v71 = __Block_byref_object_dispose__6;
  v72 = 0;
  v61 = 0;
  v62 = &v61;
  v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__6;
  v65 = __Block_byref_object_dispose__6;
  v66 = 0;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__6;
  v59 = __Block_byref_object_dispose__6;
  v60 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__6;
  v53 = __Block_byref_object_dispose__6;
  v54 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__6;
  v47 = __Block_byref_object_dispose__6;
  v48 = 0;
  v7 = dispatch_group_create();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create("com.apple.MediaRemote.MRQHONowPlayingController.callbackQueue", v8);

  dispatch_group_enter(v7);
  v10 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __69__MRQHONowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke;
  v39[3] = &unk_1E30C7A20;
  v41 = &v55;
  v42 = &v49;
  v11 = v7;
  v40 = v11;
  -[MRQHONowPlayingController _requestSupportedCommandsForPlayerPath:queue:completion:](self, "_requestSupportedCommandsForPlayerPath:queue:completion:", v6, v9, v39);
  dispatch_group_enter(v11);
  v36[0] = v10;
  v36[1] = 3221225472;
  v36[2] = __69__MRQHONowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_2;
  v36[3] = &unk_1E30C7A48;
  v38 = &v73;
  v12 = v11;
  v37 = v12;
  MRMediaRemoteGetPlaybackStateForPlayer(v6, v9, v36);
  dispatch_group_enter(v12);
  v30[0] = v10;
  v30[1] = 3221225472;
  v30[2] = __69__MRQHONowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_3;
  v30[3] = &unk_1E30C7A70;
  v34 = &v67;
  v35 = &v61;
  v13 = v12;
  v31 = v13;
  v32 = self;
  v14 = v6;
  v33 = v14;
  -[MRQHONowPlayingController _onQueue_requestPlaybackQueueForPlayerPath:includeArtwork:queue:completion:](self, "_onQueue_requestPlaybackQueueForPlayerPath:includeArtwork:queue:completion:", v14, 1, v9, v30);
  dispatch_group_enter(v13);
  v24 = v10;
  v25 = 3221225472;
  v26 = __69__MRQHONowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_5;
  v27 = &unk_1E30C7A98;
  v29 = &v43;
  v15 = v13;
  v28 = v15;
  -[MRQHONowPlayingController _requestPlayerLastPlayingDateForPlayerPath:queue:completion:](self, "_requestPlayerLastPlayingDateForPlayerPath:queue:completion:", v14, v9, &v24);
  v16 = dispatch_time(0, 5000000000);
  if (!dispatch_group_wait(v15, v16))
  {
    v19 = (void *)v62[5];
    if (!v19)
    {
      v19 = (void *)v50[5];
      if (!v19)
      {
        v20 = objc_alloc_init(MRNowPlayingPlayerResponse);
        v22 = [MRDestination alloc];
        v23 = -[MRDestination initWithPlayerPath:](v22, "initWithPlayerPath:", v14, v24, v25, v26, v27);
        -[MRNowPlayingPlayerResponse setDestination:](v20, "setDestination:", v23);

        -[MRNowPlayingPlayerResponse setPlaybackQueue:](v20, "setPlaybackQueue:", v68[5]);
        -[MRNowPlayingPlayerResponse setPlaybackState:](v20, "setPlaybackState:", *((unsigned int *)v74 + 6));
        -[MRNowPlayingPlayerResponse setSupportedCommands:](v20, "setSupportedCommands:", v56[5]);
        -[MRNowPlayingPlayerResponse setDeviceLastPlayingDate:](v20, "setDeviceLastPlayingDate:", 0);
        -[MRNowPlayingPlayerResponse setPlayerLastPlayingDate:](v20, "setPlayerLastPlayingDate:", v44[5]);
        goto LABEL_10;
      }
    }
    if (a4)
    {
      v18 = objc_retainAutorelease(v19);
      goto LABEL_8;
    }
LABEL_9:
    v20 = 0;
    goto LABEL_10;
  }
  if (!a4)
    goto LABEL_9;
  v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v18 = (id)objc_msgSend(v17, "initWithMRError:", 26, v24, v25, v26, v27);
LABEL_8:
  v20 = 0;
  *a4 = v18;
LABEL_10:

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v61, 8);

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v73, 8);

  return v20;
}

void __69__MRQHONowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __69__MRQHONowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_2(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __69__MRQHONowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;
  v12 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v13 = objc_alloc(MEMORY[0x1E0C99D20]);
  objc_msgSend(v9, "contentItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithArray:copyItems:", v14, 1);

  objc_msgSend(*(id *)(a1 + 40), "queue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__MRQHONowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_4;
  block[3] = &unk_1E30C7328;
  v17 = *(void **)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 40);
  v20 = v15;
  v21 = v17;
  v18 = v15;
  dispatch_async(v16, block);

}

uint64_t __69__MRQHONowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_requestAndUpdateArtworkForContentItems:forPlayerPath:withReason:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), CFSTR("Initial load"));
}

void __69__MRQHONowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_5(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (void)_onQueue_requestPlaybackQueueForPlayerPath:(id)a3 includeArtwork:(BOOL)a4 queue:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  -[MRQHONowPlayingController setRequestingQueue:](self, "setRequestingQueue:", 1);
  +[MRPlaybackQueueRequest defaultPlaybackQueueRequest](MRPlaybackQueueRequest, "defaultPlaybackQueueRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __104__MRQHONowPlayingController__onQueue_requestPlaybackQueueForPlayerPath_includeArtwork_queue_completion___block_invoke;
  v14[3] = &unk_1E30C7AC0;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync(v12, v11, v10, v14);

}

void __104__MRQHONowPlayingController__onQueue_requestPlaybackQueueForPlayerPath_includeArtwork_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setRequestingQueue:", 0);
  v4 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "deferredContentItemsToMerge", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "contentItemForIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "mergeFrom:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "deferredContentItemsToMerge");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_onQueue_requestAndUpdateArtworkForContentItems:(id)a3 forPlayerPath:(id)a4 withReason:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  int v42;
  int v43;
  id v44;
  void (**v45)(_QWORD, _QWORD, _QWORD);
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  char v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void (**v73)(_QWORD, _QWORD, _QWORD);
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  id obj;
  MRQHONowPlayingController *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  _BOOL4 v86;
  void *v87;
  uint64_t v88;
  _QWORD v89[5];
  id v90;
  _QWORD v91[4];
  void (**v92)(_QWORD, _QWORD, _QWORD);
  _QWORD v93[5];
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  void *v99;
  uint8_t buf[4];
  void *v101;
  __int16 v102;
  id v103;
  __int16 v104;
  void *v105;
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v80 = a4;
  v79 = a5;
  -[MRQHONowPlayingController queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  _MRLogForCategory(1uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[MRQHONowPlayingController uid](self, "uid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v101 = v11;
    v102 = 2112;
    v103 = v79;
    _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> _requestAndUpdateArtworkForContentItems because %@.", buf, 0x16u);

  }
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  obj = v8;
  v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v106, 16);
  if (v85)
  {
    v84 = *(_QWORD *)v96;
    v82 = self;
    do
    {
      for (i = 0; i != v85; ++i)
      {
        if (*(_QWORD *)v96 != v84)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
        -[MRNowPlayingPlayerResponse playbackQueue](self->_response, "playbackQueue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "contentItemForIdentifier:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v16, "copy");

        if (v17)
        {
          objc_msgSend(v17, "metadata");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v18, "artworkAvailable") & 1) != 0)
          {
            v86 = 1;
          }
          else
          {
            objc_msgSend(v17, "metadata");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "artworkURL");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              v86 = 1;
            }
            else
            {
              objc_msgSend(v17, "metadata");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "artworkIdentifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v86 = v22 != 0;

            }
          }
          v88 = i;

          objc_msgSend(v17, "artwork");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "imageData");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "metadata");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "artworkIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            objc_msgSend(v13, "metadata");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "artworkIdentifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "metadata");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "artworkIdentifier");
            v30 = v13;
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v28, "isEqual:", v31) ^ 1;

            v13 = v30;
          }
          else
          {
            v32 = 0;
          }

          objc_msgSend(v13, "metadata");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "artworkURL");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            objc_msgSend(v13, "metadata");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "artworkURL");
            v83 = v13;
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "metadata");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "artworkURL");
            v38 = v24;
            v39 = v32;
            v40 = v17;
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v36, "isEqual:", v41);

            v17 = v40;
            v32 = v39;
            v24 = v38;

            v13 = v83;
          }
          else
          {
            v42 = 0;
          }
          i = v88;

          v43 = v24 ? v32 : 1;
          self = v82;
          if ((v86 & (v43 | v42)) == 1)
          {
            v93[0] = MEMORY[0x1E0C809B0];
            v93[1] = 3221225472;
            v93[2] = __102__MRQHONowPlayingController__onQueue_requestAndUpdateArtworkForContentItems_forPlayerPath_withReason___block_invoke;
            v93[3] = &unk_1E30C7AE8;
            v93[4] = v82;
            v87 = v17;
            v44 = v17;
            v94 = v44;
            v45 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](v93);
            -[MRQHONowPlayingController cachedNowPlayingArtwork](v82, "cachedNowPlayingArtwork");
            v46 = objc_claimAutoreleasedReturnValue();
            if (!v46)
              goto LABEL_28;
            v47 = (void *)v46;
            objc_msgSend(v44, "metadata");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "artworkIdentifier");
            v49 = (id)objc_claimAutoreleasedReturnValue();
            -[MRQHONowPlayingController cachedNowPlayingArtworkIdentifier](v82, "cachedNowPlayingArtworkIdentifier");
            v50 = (id)objc_claimAutoreleasedReturnValue();
            if (v49 == v50)
            {

            }
            else
            {
              v51 = v50;
              v52 = objc_msgSend(v49, "isEqual:", v50);

              if ((v52 & 1) == 0)
              {
LABEL_28:
                objc_msgSend(v80, "origin");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v53, "isLocal"))
                {

                  goto LABEL_34;
                }
                objc_msgSend(v13, "metadata");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "artworkURL");
                v55 = (void *)objc_claimAutoreleasedReturnValue();

                if (v55)
                {
                  _MRLogForCategory(1uLL);
                  v56 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                  {
                    -[MRQHONowPlayingController uid](v82, "uid");
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "identifier");
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "metadata");
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v59, "artworkIdentifier");
                    v60 = v13;
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v101 = v57;
                    v102 = 2112;
                    v103 = v58;
                    v104 = 2112;
                    v105 = v61;
                    _os_log_impl(&dword_193827000, v56, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> downloading artwork for content item %@, artwork %@.", buf, 0x20u);

                    v13 = v60;
                    i = v88;

                  }
                  -[MRQHONowPlayingController queue](v82, "queue");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  v91[0] = MEMORY[0x1E0C809B0];
                  v91[1] = 3221225472;
                  v91[2] = __102__MRQHONowPlayingController__onQueue_requestAndUpdateArtworkForContentItems_forPlayerPath_withReason___block_invoke_32;
                  v91[3] = &unk_1E30C7B10;
                  v92 = v45;
                  -[MRQHONowPlayingController _downloadContentItemArtwork:queue:completion:](v82, "_downloadContentItemArtwork:queue:completion:", v13, v62, v91);

                  v63 = v92;
                }
                else
                {
LABEL_34:
                  _MRLogForCategory(1uLL);
                  v64 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                  {
                    -[MRQHONowPlayingController uid](v82, "uid");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "identifier");
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "metadata");
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v67, "artworkIdentifier");
                    v68 = v13;
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v101 = v65;
                    v102 = 2112;
                    v103 = v66;
                    v104 = 2112;
                    v105 = v69;
                    _os_log_impl(&dword_193827000, v64, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> requesting artwork for content item %@, artwork %@.", buf, 0x20u);

                    v13 = v68;
                    i = v88;

                  }
                  objc_msgSend(v13, "identifier");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  v99 = v70;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v99, 1);
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MRQHONowPlayingController queue](v82, "queue");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  v89[0] = MEMORY[0x1E0C809B0];
                  v89[1] = 3221225472;
                  v89[2] = __102__MRQHONowPlayingController__onQueue_requestAndUpdateArtworkForContentItems_forPlayerPath_withReason___block_invoke_33;
                  v89[3] = &unk_1E30C7B38;
                  v73 = v45;
                  v89[4] = v13;
                  v90 = v73;
                  -[MRQHONowPlayingController _requestContentItemArtwork:forPlayerPath:queue:completion:](v82, "_requestContentItemArtwork:forPlayerPath:queue:completion:", v71, v80, v72, v89);

                  v63 = v90;
                }
LABEL_41:

                v17 = v87;
                goto LABEL_42;
              }
            }
            _MRLogForCategory(1uLL);
            v74 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
            {
              -[MRQHONowPlayingController uid](v82, "uid");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "identifier");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "metadata");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "artworkIdentifier");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v101 = v75;
              v102 = 2112;
              v103 = v76;
              v104 = 2112;
              v105 = v78;
              _os_log_impl(&dword_193827000, v74, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> Artwork cache hit for content item %@, artwork %@.", buf, 0x20u);

            }
            -[MRQHONowPlayingController cachedNowPlayingArtwork](v82, "cachedNowPlayingArtwork");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *, _QWORD))v45)[2](v45, v63, 0);
            goto LABEL_41;
          }
        }
LABEL_42:

      }
      v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v106, 16);
    }
    while (v85);
  }

}

void __102__MRQHONowPlayingController__onQueue_requestAndUpdateArtworkForContentItems_forPlayerPath_withReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  MRContentItem *v22;
  void *v23;
  MRContentItem *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  MRContentItem *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _MRLogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __102__MRQHONowPlayingController__onQueue_requestAndUpdateArtworkForContentItems_forPlayerPath_withReason___block_invoke_cold_1();

  }
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "playbackQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentItemWithOffset:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "isEqualToString:", v11);

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 40), "metadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "artworkIdentifier");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "cachedNowPlayingArtworkIdentifier");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (v14 == v15)
      {

LABEL_13:
        goto LABEL_14;
      }
      v16 = v15;
      v17 = objc_msgSend(v14, "isEqual:", v15);

      if ((v17 & 1) == 0)
      {
        _MRLogForCategory(1uLL);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "uid");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "metadata");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "artworkIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v32 = v19;
          v33 = 2112;
          v34 = v21;
          _os_log_impl(&dword_193827000, v18, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> updated artwork cache with %@.", buf, 0x16u);

        }
        objc_msgSend(*(id *)(a1 + 32), "setCachedNowPlayingArtwork:", v5);
        objc_msgSend(*(id *)(a1 + 40), "metadata");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "artworkIdentifier");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setCachedNowPlayingArtworkIdentifier:", v14);
        goto LABEL_13;
      }
    }
LABEL_14:
    v22 = [MRContentItem alloc];
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[MRContentItem initWithIdentifier:](v22, "initWithIdentifier:", v23);

    -[MRContentItem setArtwork:](v24, "setArtwork:", v5);
    v25 = *(void **)(a1 + 32);
    v30 = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_onQueue_updateByMergingContentItemChanges:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v27, "count"))
    {
      _MRLogForCategory(1uLL);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "uid");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v32 = v29;
        v33 = 2112;
        v34 = v27;
        _os_log_impl(&dword_193827000, v28, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> updated artwork for content items %@.", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfUpdatedArtwork:", v27);
    }

  }
}

uint64_t __102__MRQHONowPlayingController__onQueue_requestAndUpdateArtworkForContentItems_forPlayerPath_withReason___block_invoke_32(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __102__MRQHONowPlayingController__onQueue_requestAndUpdateArtworkForContentItems_forPlayerPath_withReason___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "identifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentItemForIdentifier:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "artwork");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v9, v6);

}

- (void)_requestContentItemArtwork:(id)a3 forPlayerPath:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  MRPlaybackQueueRequest *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[MRPlaybackQueueRequest initWithIdentifiers:]([MRPlaybackQueueRequest alloc], "initWithIdentifiers:", v12);

  -[MRPlaybackQueueRequest setArtworkHeight:](v13, "setArtworkHeight:", 1200.0);
  -[MRPlaybackQueueRequest setArtworkWidth:](v13, "setArtworkWidth:", 1200.0);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __87__MRQHONowPlayingController__requestContentItemArtwork_forPlayerPath_queue_completion___block_invoke;
  v15[3] = &unk_1E30C7B60;
  v16 = v9;
  v14 = v9;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync(v13, v11, v10, v15);

}

uint64_t __87__MRQHONowPlayingController__requestContentItemArtwork_forPlayerPath_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_downloadContentItemArtwork:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C92C98], "sharedSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "artworkURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__MRQHONowPlayingController__downloadContentItemArtwork_queue_completion___block_invoke;
  v17[3] = &unk_1E30C7BB0;
  v18 = v8;
  v19 = v7;
  v20 = v9;
  v13 = v9;
  v14 = v7;
  v15 = v8;
  objc_msgSend(v10, "dataTaskWithURL:completionHandler:", v12, v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resume");

}

void __74__MRQHONowPlayingController__downloadContentItemArtwork_queue_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v6 = a2;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__MRQHONowPlayingController__downloadContentItemArtwork_queue_completion___block_invoke_2;
  v12[3] = &unk_1E30C7B88;
  v13 = v7;
  v8 = *(NSObject **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v15 = v6;
  v16 = v9;
  v10 = v6;
  v11 = v7;
  dispatch_async(v8, v12);

}

void __74__MRQHONowPlayingController__downloadContentItemArtwork_queue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  MRArtwork *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *MEMORY[0x1E0CB3388];
    v12[0] = *(_QWORD *)(a1 + 32);
    v3 = *MEMORY[0x1E0CB2D68];
    v11[0] = v2;
    v11[1] = v3;
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Failed to download artwork for content item %@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:userInfo:", 2, v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 56);
    v10 = -[MRArtwork initWithImageData:height:width:]([MRArtwork alloc], "initWithImageData:height:width:", *(_QWORD *)(a1 + 48), 0, 0);
    (*(void (**)(uint64_t))(v9 + 16))(v9);

  }
}

- (void)_requestSupportedCommandsForPlayerPath:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__MRQHONowPlayingController__requestSupportedCommandsForPlayerPath_queue_completion___block_invoke;
  v9[3] = &unk_1E30C6B70;
  v10 = v7;
  v8 = v7;
  MRMediaRemoteGetSupportedCommandsForPlayer(a3, a4, v9);

}

uint64_t __85__MRQHONowPlayingController__requestSupportedCommandsForPlayerPath_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_requestPlayerLastPlayingDateForPlayerPath:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  MRNowPlayingRequest *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[MRNowPlayingRequest initWithPlayerPath:]([MRNowPlayingRequest alloc], "initWithPlayerPath:", v9);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __89__MRQHONowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke;
  v12[3] = &unk_1E30C7BD8;
  v13 = v7;
  v11 = v7;
  -[MRNowPlayingRequest requestLastPlayingDateOnQueue:completion:](v10, "requestLastPlayingDateOnQueue:completion:", v8, v12);

}

void __89__MRQHONowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    _MRLogForCategory(1uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __89__MRQHONowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke_cold_1((uint64_t)v4, v5, v6);

    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_onQueue_updateByReplacingWithNewResponse:(id)a3
{
  MRNowPlayingPlayerResponse *v4;
  NSObject *v5;
  MRNowPlayingPlayerResponse *response;

  v4 = (MRNowPlayingPlayerResponse *)a3;
  -[MRQHONowPlayingController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  response = self->_response;
  self->_response = v4;

}

- (void)_onQueue_updateWithNewPlaybackState:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;

  v3 = *(_QWORD *)&a3;
  -[MRQHONowPlayingController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MRNowPlayingPlayerResponse setPlaybackState:](self->_response, "setPlaybackState:", v3);
}

- (void)_onQueue_updateWithNewDeviceLastPlayingDate:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  -[MRQHONowPlayingController queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[MRNowPlayingPlayerResponse setDeviceLastPlayingDate:](self->_response, "setDeviceLastPlayingDate:", v5);
}

- (void)_onQueue_updateWithNewPlayerLastPlayingDate:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  -[MRQHONowPlayingController queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[MRNowPlayingPlayerResponse setPlayerLastPlayingDate:](self->_response, "setPlayerLastPlayingDate:", v5);
}

- (void)_onQueue_updateWithNewSupportedCommands:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  -[MRQHONowPlayingController queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[MRNowPlayingPlayerResponse setSupportedCommands:](self->_response, "setSupportedCommands:", v5);
}

- (void)_onQueue_updateWithNewPlaybackQueue:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  -[MRQHONowPlayingController queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[MRNowPlayingPlayerResponse setPlaybackQueue:](self->_response, "setPlaybackQueue:", v5);
}

- (id)_onQueue_updateByMergingContentItemChanges:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  uint64_t v35;
  MRQHONowPlayingController *v36;
  NSObject *v37;
  id v38;
  id v40;
  MRQHONowPlayingController *v41;
  uint64_t v42;
  uint64_t v43;
  id obj;
  id v45;
  _QWORD block[5];
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MRQHONowPlayingController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v49;
    v41 = self;
    v42 = *(_QWORD *)v49;
    do
    {
      v9 = 0;
      v43 = v7;
      do
      {
        if (*(_QWORD *)v49 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v9);
        -[MRNowPlayingPlayerResponse playbackQueue](self->_response, "playbackQueue", v40);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "contentItemForIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v10, "metadata");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v14, "artworkAvailable") & 1) != 0)
          {
            objc_msgSend(v13, "metadata");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "artworkAvailable");

            if ((v16 & 1) == 0)
            {
LABEL_17:
              objc_msgSend(v40, "addObject:", v10);
              goto LABEL_20;
            }
          }
          else
          {

          }
          objc_msgSend(v10, "metadata");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "artworkURL");
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = (void *)v18;
            objc_msgSend(v10, "metadata");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "artworkURL");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "metadata");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "artworkURL");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v21, "isEqual:", v23);

            v7 = v43;
            v8 = v42;

            if ((v24 & 1) == 0)
            {
              objc_msgSend(v40, "addObject:", v10);
              goto LABEL_19;
            }
          }
          else
          {

          }
          objc_msgSend(v10, "metadata");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "artworkIdentifier");
          v26 = objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            v27 = (void *)v26;
            objc_msgSend(v10, "metadata");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "artworkIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "metadata");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "artworkIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v29, "isEqual:", v31);

            v7 = v43;
            v8 = v42;

            self = v41;
            if ((v32 & 1) == 0)
              goto LABEL_17;
LABEL_20:
            objc_msgSend(v13, "mergeFrom:", v10);
            objc_msgSend(v13, "identifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "addObject:", v33);

            goto LABEL_21;
          }

LABEL_19:
          self = v41;
          goto LABEL_20;
        }
LABEL_21:

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v40, "count"))
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v40, 1);
    -[MRQHONowPlayingController queue](self, "queue");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = self;
    v37 = v35;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__MRQHONowPlayingController__onQueue_updateByMergingContentItemChanges___block_invoke;
    block[3] = &unk_1E30C5F40;
    block[4] = v36;
    v47 = v34;
    v38 = v34;
    dispatch_async(v37, block);

  }
  return v45;
}

void __72__MRQHONowPlayingController__onQueue_updateByMergingContentItemChanges___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v1, "resolvedPlayerPath");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_onQueue_requestAndUpdateArtworkForContentItems:forPlayerPath:withReason:", v2, v3, CFSTR("Artwork added on update"));

}

- (void)_onQueue_retrieveEndpointForUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  MRAVLightweightReconnaissanceSession *v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  id *v15;
  _QWORD v16[4];
  MRAVLightweightReconnaissanceSession *v17;
  id v18;
  _QWORD v19[4];
  MRAVLightweightReconnaissanceSession *v20;
  id v21;
  _QWORD v22[4];
  MRAVLightweightReconnaissanceSession *v23;

  v6 = a3;
  v7 = a4;
  -[MRQHONowPlayingController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (objc_msgSend(v6, "isEqualToString:", CFSTR("proactiveEndpoint")))
  {
    -[MRQHONowPlayingController queue](self, "queue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __72__MRQHONowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke;
    v22[3] = &unk_1E30C7C00;
    v23 = (MRAVLightweightReconnaissanceSession *)v7;
    MRAVEndpointResolveActiveSystemEndpointWithType(1, v9, v22, 7.0);

    v10 = v23;
  }
  else
  {
    v10 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
    -[MRQHONowPlayingController endpointObserverGroupUID](self, "endpointObserverGroupUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[MRQHONowPlayingController endpointObserverGroupUID](self, "endpointObserverGroupUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRQHONowPlayingController queue](self, "queue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __72__MRQHONowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_2;
      v19[3] = &unk_1E30C7C28;
      v14 = (id *)&v20;
      v20 = v10;
      v15 = &v21;
      v21 = v7;
      -[MRAVLightweightReconnaissanceSession searchEndpointsForGroupUID:timeout:reason:queue:completion:](v10, "searchEndpointsForGroupUID:timeout:reason:queue:completion:", v12, CFSTR("MRQHONowPlayingController-search"), v13, v19, 7.0);

    }
    else
    {
      -[MRQHONowPlayingController queue](self, "queue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __72__MRQHONowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_3;
      v16[3] = &unk_1E30C7C28;
      v14 = (id *)&v17;
      v17 = v10;
      v15 = &v18;
      v18 = v7;
      -[MRAVLightweightReconnaissanceSession searchEndpointsForOutputDeviceUID:timeout:reason:queue:completion:](v10, "searchEndpointsForOutputDeviceUID:timeout:reason:queue:completion:", v6, CFSTR("MRQHONowPlayingController-search"), v12, v16, 7.0);
    }

  }
}

uint64_t __72__MRQHONowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__MRQHONowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  id v7;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v7 = *(id *)(a1 + 32);
  v6(v5, a2, a3);

}

void __72__MRQHONowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  id v7;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v7 = *(id *)(a1 + 32);
  v6(v5, a2, a3);

}

- (void)_createPlayerPathForEndpoint:(id)a3 client:(id)a4 player:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1E0CB3940];
  -[MRQHONowPlayingController uid](self, "uid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("MRQHONowPlayingController-%@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = CFSTR("MREndpointConnectionReasonUserInfoKey");
  v28[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __83__MRQHONowPlayingController__createPlayerPathForEndpoint_client_player_completion___block_invoke;
  v22[3] = &unk_1E30C68F0;
  v25 = v12;
  v26 = v13;
  v22[4] = self;
  v23 = v10;
  v24 = v11;
  v18 = v12;
  v19 = v11;
  v20 = v10;
  v21 = v13;
  objc_msgSend(v20, "connectToExternalDeviceWithUserInfo:completion:", v17, v22);

}

void __83__MRQHONowPlayingController__createPlayerPathForEndpoint_client_player_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(a1[4], "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__MRQHONowPlayingController__createPlayerPathForEndpoint_client_player_completion___block_invoke_2;
  block[3] = &unk_1E30C7C50;
  v7 = v3;
  v11 = a1[8];
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  v5 = v3;
  dispatch_async(v4, block);

}

void __83__MRQHONowPlayingController__createPlayerPathForEndpoint_client_player_completion___block_invoke_2(uint64_t a1)
{
  MRPlayerPath *v2;
  void *v3;
  MRPlayerPath *v4;

  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v2 = [MRPlayerPath alloc];
    objc_msgSend(*(id *)(a1 + 40), "origin");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[MRPlayerPath initWithOrigin:client:player:](v2, "initWithOrigin:client:player:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

- (void)_resolvePlayerPath:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[MRQHONowPlayingController queue](self, "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__MRQHONowPlayingController__resolvePlayerPath_completion___block_invoke;
  v10[3] = &unk_1E30C7B60;
  v11 = v6;
  v9 = v6;
  MRMediaRemoteNowPlayingResolvePlayerPath(v7, v8, v10);

}

uint64_t __59__MRQHONowPlayingController__resolvePlayerPath_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_onQueue_clearState
{
  NSObject *v3;
  id v4;

  -[MRQHONowPlayingController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MRQHONowPlayingController _unregisterForPlayerPathInvalidations](self, "_unregisterForPlayerPathInvalidations");
  -[MRQHONowPlayingController _unregisterForEndpointChanges](self, "_unregisterForEndpointChanges");
  -[MRQHONowPlayingController setEndpoint:](self, "setEndpoint:", 0);
  -[MRQHONowPlayingController setUnresolvedPlayerPath:](self, "setUnresolvedPlayerPath:", 0);
  -[MRQHONowPlayingController setResolvedPlayerPath:](self, "setResolvedPlayerPath:", 0);
  -[MRQHONowPlayingController deferredContentItemsToMerge](self, "deferredContentItemsToMerge");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (void)_notifyDelegateOfNewResponse:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[MRQHONowPlayingController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MRQHONowPlayingController delegateQueue](self, "delegateQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__MRQHONowPlayingController__notifyDelegateOfNewResponse___block_invoke;
    v8[3] = &unk_1E30C5F40;
    v8[4] = self;
    v9 = v4;
    dispatch_async(v7, v8);

  }
}

void __58__MRQHONowPlayingController__notifyDelegateOfNewResponse___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controller:didLoadResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_notifyDelegateOfPlaybackStateChangeFromOldState:(unsigned int)a3 toNewState:(unsigned int)a4
{
  void *v7;
  char v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  char v12;
  NSObject *v13;
  _QWORD v14[5];
  _QWORD block[5];
  unsigned int v16;
  unsigned int v17;

  -[MRQHONowPlayingController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  v9 = MEMORY[0x1E0C809B0];
  if ((v8 & 1) != 0)
  {
    -[MRQHONowPlayingController delegateQueue](self, "delegateQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __89__MRQHONowPlayingController__notifyDelegateOfPlaybackStateChangeFromOldState_toNewState___block_invoke;
    block[3] = &unk_1E30C78E0;
    block[4] = self;
    v16 = a3;
    v17 = a4;
    dispatch_async(v10, block);

  }
  -[MRQHONowPlayingController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[MRQHONowPlayingController delegateQueue](self, "delegateQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __89__MRQHONowPlayingController__notifyDelegateOfPlaybackStateChangeFromOldState_toNewState___block_invoke_2;
    v14[3] = &unk_1E30C5CA8;
    v14[4] = self;
    dispatch_async(v13, v14);

  }
}

void __89__MRQHONowPlayingController__notifyDelegateOfPlaybackStateChangeFromOldState_toNewState___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controller:playbackStateDidChangeFrom:to:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));

}

void __89__MRQHONowPlayingController__notifyDelegateOfPlaybackStateChangeFromOldState_toNewState___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controller:didUpdateResponse:", v2, v3);

}

- (void)_notifyDelegateOfPlaybackQueueChangeFromOldQueue:(id)a3 toNewQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  char v13;
  NSObject *v14;
  _QWORD v15[5];
  _QWORD block[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[MRQHONowPlayingController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  v10 = MEMORY[0x1E0C809B0];
  if ((v9 & 1) != 0)
  {
    -[MRQHONowPlayingController delegateQueue](self, "delegateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __89__MRQHONowPlayingController__notifyDelegateOfPlaybackQueueChangeFromOldQueue_toNewQueue___block_invoke;
    block[3] = &unk_1E30C7328;
    block[4] = self;
    v17 = v6;
    v18 = v7;
    dispatch_async(v11, block);

  }
  -[MRQHONowPlayingController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[MRQHONowPlayingController delegateQueue](self, "delegateQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __89__MRQHONowPlayingController__notifyDelegateOfPlaybackQueueChangeFromOldQueue_toNewQueue___block_invoke_2;
    v15[3] = &unk_1E30C5CA8;
    v15[4] = self;
    dispatch_async(v14, v15);

  }
}

void __89__MRQHONowPlayingController__notifyDelegateOfPlaybackQueueChangeFromOldQueue_toNewQueue___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controller:playbackQueueDidChangeFrom:to:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __89__MRQHONowPlayingController__notifyDelegateOfPlaybackQueueChangeFromOldQueue_toNewQueue___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controller:didUpdateResponse:", v2, v3);

}

- (void)_notifyDelegateOfUpdatedContentItems:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  char v10;
  NSObject *v11;
  _QWORD v12[5];
  _QWORD block[5];
  id v14;

  v4 = a3;
  -[MRQHONowPlayingController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  v7 = MEMORY[0x1E0C809B0];
  if ((v6 & 1) != 0)
  {
    -[MRQHONowPlayingController delegateQueue](self, "delegateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __66__MRQHONowPlayingController__notifyDelegateOfUpdatedContentItems___block_invoke;
    block[3] = &unk_1E30C5F40;
    block[4] = self;
    v14 = v4;
    dispatch_async(v8, block);

  }
  -[MRQHONowPlayingController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[MRQHONowPlayingController delegateQueue](self, "delegateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __66__MRQHONowPlayingController__notifyDelegateOfUpdatedContentItems___block_invoke_2;
    v12[3] = &unk_1E30C5CA8;
    v12[4] = self;
    dispatch_async(v11, v12);

  }
}

void __66__MRQHONowPlayingController__notifyDelegateOfUpdatedContentItems___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controller:contentItemsDidUpdate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __66__MRQHONowPlayingController__notifyDelegateOfUpdatedContentItems___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controller:didUpdateResponse:", v2, v3);

}

- (void)_notifyDelegateOfUpdatedArtwork:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  char v10;
  NSObject *v11;
  _QWORD v12[5];
  _QWORD block[5];
  id v14;

  v4 = a3;
  -[MRQHONowPlayingController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  v7 = MEMORY[0x1E0C809B0];
  if ((v6 & 1) != 0)
  {
    -[MRQHONowPlayingController delegateQueue](self, "delegateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __61__MRQHONowPlayingController__notifyDelegateOfUpdatedArtwork___block_invoke;
    block[3] = &unk_1E30C5F40;
    block[4] = self;
    v14 = v4;
    dispatch_async(v8, block);

  }
  -[MRQHONowPlayingController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[MRQHONowPlayingController delegateQueue](self, "delegateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __61__MRQHONowPlayingController__notifyDelegateOfUpdatedArtwork___block_invoke_2;
    v12[3] = &unk_1E30C5CA8;
    v12[4] = self;
    dispatch_async(v11, v12);

  }
}

void __61__MRQHONowPlayingController__notifyDelegateOfUpdatedArtwork___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controller:didLoadArtworkForContentItems:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __61__MRQHONowPlayingController__notifyDelegateOfUpdatedArtwork___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controller:didUpdateResponse:", v2, v3);

}

- (void)_notifyDelegateOfSupportedCommandsChangeFromOldCommands:(id)a3 toNewCommands:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  char v13;
  NSObject *v14;
  _QWORD v15[5];
  _QWORD block[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[MRQHONowPlayingController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  v10 = MEMORY[0x1E0C809B0];
  if ((v9 & 1) != 0)
  {
    -[MRQHONowPlayingController delegateQueue](self, "delegateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __99__MRQHONowPlayingController__notifyDelegateOfSupportedCommandsChangeFromOldCommands_toNewCommands___block_invoke;
    block[3] = &unk_1E30C7328;
    block[4] = self;
    v17 = v6;
    v18 = v7;
    dispatch_async(v11, block);

  }
  -[MRQHONowPlayingController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[MRQHONowPlayingController delegateQueue](self, "delegateQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __99__MRQHONowPlayingController__notifyDelegateOfSupportedCommandsChangeFromOldCommands_toNewCommands___block_invoke_2;
    v15[3] = &unk_1E30C5CA8;
    v15[4] = self;
    dispatch_async(v14, v15);

  }
}

void __99__MRQHONowPlayingController__notifyDelegateOfSupportedCommandsChangeFromOldCommands_toNewCommands___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controller:supportedCommandsDidChangeFrom:to:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __99__MRQHONowPlayingController__notifyDelegateOfSupportedCommandsChangeFromOldCommands_toNewCommands___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controller:didUpdateResponse:", v2, v3);

}

- (void)_notifyDelegateOfUpdatedDeviceLastPlayingDate:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  char v10;
  NSObject *v11;
  _QWORD v12[5];
  _QWORD block[5];
  id v14;

  v4 = a3;
  -[MRQHONowPlayingController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  v7 = MEMORY[0x1E0C809B0];
  if ((v6 & 1) != 0)
  {
    -[MRQHONowPlayingController delegateQueue](self, "delegateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __75__MRQHONowPlayingController__notifyDelegateOfUpdatedDeviceLastPlayingDate___block_invoke;
    block[3] = &unk_1E30C5F40;
    block[4] = self;
    v14 = v4;
    dispatch_async(v8, block);

  }
  -[MRQHONowPlayingController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[MRQHONowPlayingController delegateQueue](self, "delegateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __75__MRQHONowPlayingController__notifyDelegateOfUpdatedDeviceLastPlayingDate___block_invoke_2;
    v12[3] = &unk_1E30C5CA8;
    v12[4] = self;
    dispatch_async(v11, v12);

  }
}

void __75__MRQHONowPlayingController__notifyDelegateOfUpdatedDeviceLastPlayingDate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controller:deviceLastPlayingDateDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __75__MRQHONowPlayingController__notifyDelegateOfUpdatedDeviceLastPlayingDate___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controller:didUpdateResponse:", v2, v3);

}

- (void)_notifyDelegateOfUpdatedPlayerLastPlayingDate:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  char v10;
  NSObject *v11;
  _QWORD v12[5];
  _QWORD block[5];
  id v14;

  v4 = a3;
  -[MRQHONowPlayingController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  v7 = MEMORY[0x1E0C809B0];
  if ((v6 & 1) != 0)
  {
    -[MRQHONowPlayingController delegateQueue](self, "delegateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __75__MRQHONowPlayingController__notifyDelegateOfUpdatedPlayerLastPlayingDate___block_invoke;
    block[3] = &unk_1E30C5F40;
    block[4] = self;
    v14 = v4;
    dispatch_async(v8, block);

  }
  -[MRQHONowPlayingController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[MRQHONowPlayingController delegateQueue](self, "delegateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __75__MRQHONowPlayingController__notifyDelegateOfUpdatedPlayerLastPlayingDate___block_invoke_2;
    v12[3] = &unk_1E30C5CA8;
    v12[4] = self;
    dispatch_async(v11, v12);

  }
}

void __75__MRQHONowPlayingController__notifyDelegateOfUpdatedPlayerLastPlayingDate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controller:playerLastPlayingDateDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __75__MRQHONowPlayingController__notifyDelegateOfUpdatedPlayerLastPlayingDate___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controller:didUpdateResponse:", v2, v3);

}

- (void)_notifyDelegateOfError:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[MRQHONowPlayingController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MRQHONowPlayingController delegateQueue](self, "delegateQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52__MRQHONowPlayingController__notifyDelegateOfError___block_invoke;
    v8[3] = &unk_1E30C5F40;
    v8[4] = self;
    v9 = v4;
    dispatch_async(v7, v8);

  }
}

void __52__MRQHONowPlayingController__notifyDelegateOfError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controller:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_notifyDelegateOfInvalidation
{
  void *v3;
  char v4;
  NSObject *v5;
  _QWORD block[5];

  -[MRQHONowPlayingController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MRQHONowPlayingController delegateQueue](self, "delegateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__MRQHONowPlayingController__notifyDelegateOfInvalidation__block_invoke;
    block[3] = &unk_1E30C5CA8;
    block[4] = self;
    dispatch_async(v5, block);

  }
}

void __58__MRQHONowPlayingController__notifyDelegateOfInvalidation__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controllerWillReloadForInvalidation:", *(_QWORD *)(a1 + 32));

}

- (void)_registerNotificationHandlersIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (!-[MRQHONowPlayingController registeredForNotifications](self, "registeredForNotifications"))
  {
    MRMediaRemoteSetWantsNowPlayingNotifications(1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handlePlaybackQueueChangedNotification_, CFSTR("kMRPlayerPlaybackQueueChangedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handlePlaybackQueueContentItemsChangedNotification_, CFSTR("kMRPlayerPlaybackQueueContentItemsChangedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handlePlaybackQueueContentItemsArtworkChangedNotification_, CFSTR("kMRPlayerPlaybackQueueContentItemArtworkChangedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handlePlaybackStateChangedNotification_, CFSTR("_kMRMediaRemotePlayerPlaybackStateDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__handleSupportedCommandsChangedNotification_, CFSTR("kMRMediaRemotePlayerSupportedCommandsDidChangeNotification"), 0);

    -[MRQHONowPlayingController setRegisteredForNotifications:](self, "setRegisteredForNotifications:", 1);
  }
}

- (void)_unregisterNotificationHandlers
{
  void *v3;

  if (-[MRQHONowPlayingController registeredForNotifications](self, "registeredForNotifications"))
  {
    MRMediaRemoteSetWantsNowPlayingNotifications(0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

    -[MRQHONowPlayingController setRegisteredForNotifications:](self, "setRegisteredForNotifications:", 0);
  }
}

- (void)_handlePlaybackQueueChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MRQHONowPlayingController *v9;

  v4 = a3;
  -[MRQHONowPlayingController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__MRQHONowPlayingController__handlePlaybackQueueChangedNotification___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __69__MRQHONowPlayingController__handlePlaybackQueueChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kMRNowPlayingPlayerPathUserInfoKey"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "resolvedPlayerPath");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v3)
  {

  }
  else
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "isEqual:", v3);

    if (!v6)
      goto LABEL_8;
  }
  _MRLogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "uid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v16 = v8;
    v17 = 2048;
    v18 = v9;
    _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@ : %p> processing PlaybackQueueDidChangeNotification.", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "deferredContentItemsToMerge");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

  v11 = *(void **)(a1 + 40);
  objc_msgSend(v11, "resolvedPlayerPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "queue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__MRQHONowPlayingController__handlePlaybackQueueChangedNotification___block_invoke_87;
  v14[3] = &unk_1E30C7C78;
  v14[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v11, "_onQueue_requestPlaybackQueueForPlayerPath:includeArtwork:queue:completion:", v12, 1, v13, v14);

LABEL_8:
}

void __69__MRQHONowPlayingController__handlePlaybackQueueChangedNotification___block_invoke_87(uint64_t a1, void *a2, uint64_t a3)
{
  id *v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = *(id **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(v5, "_notifyDelegateOfError:", a3);
  }
  else
  {
    objc_msgSend(v5[6], "playbackQueue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 == v14)
    {

    }
    else
    {
      v8 = objc_msgSend(v6, "isEqual:");

      if ((v8 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateWithNewPlaybackQueue:", v14);
        objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfPlaybackQueueChangeFromOldQueue:toNewQueue:", v7, v14);
      }
    }

  }
  v9 = objc_alloc(MEMORY[0x1E0C99D20]);
  objc_msgSend(v14, "contentItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithArray:copyItems:", v10, 1);

  v12 = *(void **)(a1 + 32);
  objc_msgSend(v12, "resolvedPlayerPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_onQueue_requestAndUpdateArtworkForContentItems:forPlayerPath:withReason:", v11, v13, CFSTR("PlaybackQueueDidChangeNotification"));

}

- (void)_handlePlaybackQueueContentItemsChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MRQHONowPlayingController *v9;

  v4 = a3;
  -[MRQHONowPlayingController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__MRQHONowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __81__MRQHONowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kMRNowPlayingPlayerPathUserInfoKey"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "resolvedPlayerPath");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v3)
  {

  }
  else
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "isEqual:", v3);

    if (!v6)
      goto LABEL_16;
  }
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteUpdatedContentItemsUserInfoKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "mr_compactMap:", &__block_literal_global_22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(*(id *)(a1 + 40), "requestingQueue");
  _MRLogForCategory(1uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 40), "uid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v13;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_193827000, v11, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> deferring PlaybackQueueContentItemsChangedNotification for content items %@ because we are requesting a new playback queue.", (uint8_t *)&v18, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "deferredContentItemsToMerge");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObjectsFromArray:", v8);
  }
  else
  {
    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 40), "uid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v15;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_193827000, v11, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> processing PlaybackQueueContentItemsChangedNotification for content items %@.", (uint8_t *)&v18, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "_onQueue_updateByMergingContentItemChanges:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      _MRLogForCategory(1uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "uid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412546;
        v19 = v17;
        v20 = 2112;
        v21 = v14;
        _os_log_impl(&dword_193827000, v16, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> updated content items %@.", (uint8_t *)&v18, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 40), "_notifyDelegateOfUpdatedContentItems:", v14);
    }
  }

LABEL_16:
}

uint64_t __81__MRQHONowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (void)_handlePlaybackQueueContentItemsArtworkChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MRQHONowPlayingController *v9;

  v4 = a3;
  -[MRQHONowPlayingController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__MRQHONowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __88__MRQHONowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kMRNowPlayingPlayerPathUserInfoKey"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "resolvedPlayerPath");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v3)
  {

  }
  else
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "isEqual:", v3);

    if (!v6)
      goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteUpdatedContentItemsUserInfoKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "mr_compactMap:", &__block_literal_global_91);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(*(id *)(a1 + 40), "requestingQueue");
  _MRLogForCategory(1uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 40), "uid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v13;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_193827000, v11, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> ignoring PlaybackQueueContentItemsArtworkChangedNotification for content items %@ ", (uint8_t *)&v16, 0x16u);

    }
  }
  else
  {
    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 40), "uid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_193827000, v11, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> processing PlaybackQueueContentItemsArtworkChangedNotification for content items %@.", (uint8_t *)&v16, 0x16u);

    }
    v15 = *(void **)(a1 + 40);
    objc_msgSend(v15, "resolvedPlayerPath");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_onQueue_requestAndUpdateArtworkForContentItems:forPlayerPath:withReason:", v8, v11, CFSTR("PlaybackQueueContentItemsArtworkChangedNotification"));
  }

LABEL_12:
}

uint64_t __88__MRQHONowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (void)_handlePlaybackStateChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MRQHONowPlayingController *v9;

  v4 = a3;
  -[MRQHONowPlayingController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__MRQHONowPlayingController__handlePlaybackStateChangedNotification___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __69__MRQHONowPlayingController__handlePlaybackStateChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kMRNowPlayingPlayerPathUserInfoKey"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "resolvedPlayerPath");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v3)
  {

  }
  else
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "isEqual:", v3);

    if (!v6)
      goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kMRMediaRemotePlaybackStateUserInfoKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _MRLogForCategory(1uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "uid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v10;
    v18 = 2112;
    v19 = MRMediaRemoteCopyPlaybackStateDescription(objc_msgSend(v8, "intValue"));
    _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> processing PlaybackStateDidChangeNotification with new PlaybackState %@.", buf, 0x16u);

  }
  v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "playbackState");
  objc_msgSend(*(id *)(a1 + 40), "_onQueue_updateWithNewPlaybackState:", objc_msgSend(v8, "intValue"));
  objc_msgSend(*(id *)(a1 + 40), "_notifyDelegateOfPlaybackStateChangeFromOldState:toNewState:", v11, objc_msgSend(v8, "intValue"));
  LODWORD(v11) = MRMediaRemotePlaybackStateIsAdvancing(v11);
  if ((_DWORD)v11 != MRMediaRemotePlaybackStateIsAdvancing(objc_msgSend(v8, "intValue")))
  {
    v12 = *(void **)(a1 + 40);
    objc_msgSend(v12, "resolvedPlayerPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __69__MRQHONowPlayingController__handlePlaybackStateChangedNotification___block_invoke_94;
    v15[3] = &unk_1E30C7CC0;
    v15[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v12, "_requestPlayerLastPlayingDateForPlayerPath:queue:completion:", v13, v14, v15);

  }
LABEL_10:

}

void __69__MRQHONowPlayingController__handlePlaybackStateChangedNotification___block_invoke_94(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_onQueue_updateWithNewPlayerLastPlayingDate:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfUpdatedPlayerLastPlayingDate:", v4);

}

- (void)_handleSupportedCommandsChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MRQHONowPlayingController *v9;

  v4 = a3;
  -[MRQHONowPlayingController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__MRQHONowPlayingController__handleSupportedCommandsChangedNotification___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __73__MRQHONowPlayingController__handleSupportedCommandsChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kMRNowPlayingPlayerPathUserInfoKey"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "resolvedPlayerPath");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v3)
  {

  }
  else
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "isEqual:", v3);

    if (!v6)
      goto LABEL_8;
  }
  _MRLogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "uid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v8;
    _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> processing SupportedCommandsDidChangeNotification.", buf, 0xCu);

  }
  v9 = *(void **)(a1 + 40);
  objc_msgSend(v9, "resolvedPlayerPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "queue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__MRQHONowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_95;
  v12[3] = &unk_1E30C7CE8;
  v12[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v9, "_requestSupportedCommandsForPlayerPath:queue:completion:", v10, v11, v12);

LABEL_8:
}

void __73__MRQHONowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_95(uint64_t a1, void *a2, uint64_t a3)
{
  id *v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = *(id **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(v5, "_notifyDelegateOfError:", a3);
  }
  else
  {
    objc_msgSend(v5[6], "supportedCommands");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateWithNewSupportedCommands:", v7);
    objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfSupportedCommandsChangeFromOldCommands:toNewCommands:", v6, v7);

  }
}

- (void)_handleActiveSystemEndpointChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteActiveEndpointTypeUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  -[MRQHONowPlayingController uid](self, "uid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "isEqualToString:", CFSTR("proactiveEndpoint"));

  if ((_DWORD)v5 && v6 == 1)
  {
    _MRLogForCategory(1uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[MRQHONowPlayingController uid](self, "uid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> reloading due to ASE change.", (uint8_t *)&v10, 0xCu);

    }
    -[MRQHONowPlayingController _notifyDelegateOfInvalidation](self, "_notifyDelegateOfInvalidation");
    -[MRQHONowPlayingController _reloadForCompleteInvalidation](self, "_reloadForCompleteInvalidation");
  }
}

- (void)_registerForPlayerPathInvalidationsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  if (!-[MRQHONowPlayingController registeredForPlayerPathInvalidations](self, "registeredForPlayerPathInvalidations"))
  {
    objc_initWeak(&location, self);
    -[MRQHONowPlayingController unresolvedPlayerPath](self, "unresolvedPlayerPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRQHONowPlayingController queue](self, "queue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __72__MRQHONowPlayingController__registerForPlayerPathInvalidationsIfNeeded__block_invoke;
    v9 = &unk_1E30C7D10;
    objc_copyWeak(&v10, &location);
    v5 = (void *)MRMediaRemoteAddPlayerPathInvalidationHandler((uint64_t)v3, v4, &v6);
    -[MRQHONowPlayingController setPlayerPathInvalidationObserver:](self, "setPlayerPathInvalidationObserver:", v5, v6, v7, v8, v9);

    -[MRQHONowPlayingController setRegisteredForPlayerPathInvalidations:](self, "setRegisteredForPlayerPathInvalidations:", 1);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __72__MRQHONowPlayingController__registerForPlayerPathInvalidationsIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _MRLogForCategory(1uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "uid");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 138412290;
      v5 = v3;
      _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> reloading due to player path invalidation.", (uint8_t *)&v4, 0xCu);

    }
    objc_msgSend(WeakRetained, "_notifyDelegateOfInvalidation");
    objc_msgSend(WeakRetained, "_reloadForPlayerPathInvalidation");
  }

}

- (void)_unregisterForPlayerPathInvalidations
{
  void *v3;
  void *v4;

  -[MRQHONowPlayingController playerPathInvalidationObserver](self, "playerPathInvalidationObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MRQHONowPlayingController playerPathInvalidationObserver](self, "playerPathInvalidationObserver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MRMediaRemoteRemovePlayerPathInvalidationHandler((uint64_t)v4);

    -[MRQHONowPlayingController setPlayerPathInvalidationObserver:](self, "setPlayerPathInvalidationObserver:", 0);
  }
  -[MRQHONowPlayingController setRegisteredForPlayerPathInvalidations:](self, "setRegisteredForPlayerPathInvalidations:", 0);
}

- (void)_registerForEndpointChangesIfNeeded
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id location;

  if (!-[MRQHONowPlayingController registeredForEndpointChanges](self, "registeredForEndpointChanges"))
  {
    -[MRQHONowPlayingController uid](self, "uid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("proactiveEndpoint"));

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleActiveSystemEndpointChangedNotification_, CFSTR("kMRMediaRemoteActiveSystemEndpointDidChangeNotification"), 0);

    }
    else
    {
      objc_initWeak(&location, self);
      v8 = MEMORY[0x1E0C809B0];
      objc_copyWeak(&v9, &location);
      -[MRQHONowPlayingController endpointObserver](self, "endpointObserver", v8, 3221225472, __64__MRQHONowPlayingController__registerForEndpointChangesIfNeeded__block_invoke, &unk_1E30C7D38);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEndpointChangedCallback:", &v8);

      -[MRQHONowPlayingController endpointObserver](self, "endpointObserver");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "begin");

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
    -[MRQHONowPlayingController setRegisteredForEndpointChanges:](self, "setRegisteredForEndpointChanges:", 1);
  }
}

void __64__MRQHONowPlayingController__registerForEndpointChangesIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = a2;
    objc_msgSend(WeakRetained, "endpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      _MRLogForCategory(1uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "uid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "endpoint");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412802;
        v16 = v10;
        v17 = 2112;
        v18 = v11;
        v19 = 2112;
        v20 = v4;
        _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "[MRQHONPC] <%@> reloading due to change in endpoint. Current endpoint: %@. New endpoint: %@.", (uint8_t *)&v15, 0x20u);

      }
      objc_msgSend(v4, "outputDevices");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "groupID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setEndpointObserverGroupUID:", v14);

      objc_msgSend(WeakRetained, "_notifyDelegateOfInvalidation");
      objc_msgSend(WeakRetained, "_reloadForCompleteInvalidation");
    }

  }
}

- (void)_unregisterForEndpointChanges
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[MRQHONowPlayingController uid](self, "uid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("proactiveEndpoint"));

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("kMRMediaRemoteActiveSystemEndpointDidChangeNotification"), 0);
  }
  else
  {
    -[MRQHONowPlayingController endpointObserver](self, "endpointObserver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "end");

    -[MRQHONowPlayingController endpointObserver](self, "endpointObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEndpointChangedCallback:", 0);
  }

  -[MRQHONowPlayingController setRegisteredForEndpointChanges:](self, "setRegisteredForEndpointChanges:", 0);
}

- (BOOL)updateLoadingEnabled
{
  MRQHONowPlayingController *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[MRQHONowPlayingController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__MRQHONowPlayingController_updateLoadingEnabled__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_async_and_wait(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __49__MRQHONowPlayingController_updateLoadingEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 11);
  return result;
}

- (MRNowPlayingPlayerResponse)response
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
  v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  v12 = 0;
  -[MRQHONowPlayingController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__MRQHONowPlayingController_response__block_invoke;
  v6[3] = &unk_1E30C5D20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (MRNowPlayingPlayerResponse *)v4;
}

void __37__MRQHONowPlayingController_response__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (MRAVEndpointObserver)endpointObserver
{
  MRAVEndpointObserver *endpointObserver;
  MRAVEndpointObserver *v4;
  void *v5;
  MRAVEndpointObserver *v6;
  MRAVEndpointObserver *v7;

  endpointObserver = self->_endpointObserver;
  if (!endpointObserver)
  {
    v4 = [MRAVEndpointObserver alloc];
    -[MRQHONowPlayingController uid](self, "uid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MRAVEndpointObserver initWithOutputDeviceUID:](v4, "initWithOutputDeviceUID:", v5);
    v7 = self->_endpointObserver;
    self->_endpointObserver = v6;

    endpointObserver = self->_endpointObserver;
  }
  return endpointObserver;
}

- (NSString)uid
{
  return self->_uid;
}

- (MRClient)client
{
  return self->_client;
}

- (MRPlayer)player
{
  return self->_player;
}

- (MRQHONowPlayingControllerDelegate)delegate
{
  return (MRQHONowPlayingControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (MRPlayerPath)unresolvedPlayerPath
{
  return self->_unresolvedPlayerPath;
}

- (void)setUnresolvedPlayerPath:(id)a3
{
  objc_storeStrong((id *)&self->_unresolvedPlayerPath, a3);
}

- (MRPlayerPath)resolvedPlayerPath
{
  return self->_resolvedPlayerPath;
}

- (void)setResolvedPlayerPath:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedPlayerPath, a3);
}

- (MRAVEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_endpoint, a3);
}

- (id)playerPathInvalidationObserver
{
  return self->_playerPathInvalidationObserver;
}

- (void)setPlayerPathInvalidationObserver:(id)a3
{
  objc_storeStrong(&self->_playerPathInvalidationObserver, a3);
}

- (void)setEndpointObserver:(id)a3
{
  objc_storeStrong((id *)&self->_endpointObserver, a3);
}

- (NSString)endpointObserverGroupUID
{
  return self->_endpointObserverGroupUID;
}

- (void)setEndpointObserverGroupUID:(id)a3
{
  objc_storeStrong((id *)&self->_endpointObserverGroupUID, a3);
}

- (NSMutableArray)deferredContentItemsToMerge
{
  return self->_deferredContentItemsToMerge;
}

- (void)setDeferredContentItemsToMerge:(id)a3
{
  objc_storeStrong((id *)&self->_deferredContentItemsToMerge, a3);
}

- (BOOL)registeredForNotifications
{
  return self->_registeredForNotifications;
}

- (void)setRegisteredForNotifications:(BOOL)a3
{
  self->_registeredForNotifications = a3;
}

- (BOOL)registeredForEndpointChanges
{
  return self->_registeredForEndpointChanges;
}

- (void)setRegisteredForEndpointChanges:(BOOL)a3
{
  self->_registeredForEndpointChanges = a3;
}

- (BOOL)registeredForPlayerPathInvalidations
{
  return self->_registeredForPlayerPathInvalidations;
}

- (void)setRegisteredForPlayerPathInvalidations:(BOOL)a3
{
  self->_registeredForPlayerPathInvalidations = a3;
}

- (void)setUpdateLoadingEnabled:(BOOL)a3
{
  self->_updateLoadingEnabled = a3;
}

- (BOOL)requestingQueue
{
  return self->_requestingQueue;
}

- (void)setRequestingQueue:(BOOL)a3
{
  self->_requestingQueue = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (NSString)cachedNowPlayingArtworkIdentifier
{
  return self->_cachedNowPlayingArtworkIdentifier;
}

- (void)setCachedNowPlayingArtworkIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cachedNowPlayingArtworkIdentifier, a3);
}

- (MRArtwork)cachedNowPlayingArtwork
{
  return self->_cachedNowPlayingArtwork;
}

- (void)setCachedNowPlayingArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_cachedNowPlayingArtwork, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedNowPlayingArtwork, 0);
  objc_storeStrong((id *)&self->_cachedNowPlayingArtworkIdentifier, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_deferredContentItemsToMerge, 0);
  objc_storeStrong((id *)&self->_endpointObserverGroupUID, 0);
  objc_storeStrong((id *)&self->_endpointObserver, 0);
  objc_storeStrong(&self->_playerPathInvalidationObserver, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_resolvedPlayerPath, 0);
  objc_storeStrong((id *)&self->_unresolvedPlayerPath, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_uid, 0);
}

void __81__MRQHONowPlayingController__loadNowPlayingStateForUID_client_player_completion___block_invoke_13_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_3_1(&dword_193827000, a2, a3, "[MRQHONPC] %@ Unable to discover endpoint.", (uint8_t *)&v4);
}

void __86__MRQHONowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_1();
  objc_msgSend(*(id *)(v0 + 32), "uid");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_193827000, v2, v3, "[MRQHONPC] <%@> Error creating player path %@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

void __86__MRQHONowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_15_cold_1()
{
  id *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_1();
  objc_msgSend(*v0, "uid");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_193827000, v2, v3, "[MRQHONPC] <%@> Error loading data %@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

void __86__MRQHONowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_15_cold_2(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "uid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_3_1(&dword_193827000, a2, v4, "[MRQHONPC] <%@> Player path is not resolved. There may be no now playing application.", (uint8_t *)&v5);

}

void __86__MRQHONowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_15_cold_3()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_1();
  objc_msgSend(*(id *)(v0 + 32), "uid");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_193827000, v2, v3, "[MRQHONPC] <%@> Error resolving player path %@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

void __102__MRQHONowPlayingController__onQueue_requestAndUpdateArtworkForContentItems_forPlayerPath_withReason___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_4_1();
  v3 = v2;
  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v2 + 32), "uid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v3 + 40), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412802;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  v10 = 2112;
  v11 = v1;
  _os_log_error_impl(&dword_193827000, v0, OS_LOG_TYPE_ERROR, "[MRQHONPC] <%@> Error fetching artwork for content item %@. Error: %@.", (uint8_t *)&v6, 0x20u);

}

void __89__MRQHONowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_3_1(&dword_193827000, a2, a3, "[MRQHONPC] Failed to retrieve player last playing date with error: %@", (uint8_t *)&v3);
}

@end
