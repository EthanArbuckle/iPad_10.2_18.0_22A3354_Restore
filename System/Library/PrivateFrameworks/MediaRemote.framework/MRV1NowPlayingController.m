@implementation MRV1NowPlayingController

- (MRV1NowPlayingController)initWithConfiguration:(id)a3
{
  id v4;
  MRV1NowPlayingController *v5;
  uint64_t v6;
  MRNowPlayingControllerConfiguration *configuration;
  NSMutableArray *v8;
  NSMutableArray *deferredContentItemsToMerge;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MRV1NowPlayingController;
  v5 = -[MRV1NowPlayingController init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (MRNowPlayingControllerConfiguration *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deferredContentItemsToMerge = v5->_deferredContentItemsToMerge;
    v5->_deferredContentItemsToMerge = v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.MediaRemote.MRV2NowPlayingController.queue", v10);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v11;

  }
  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  MRV1NowPlayingController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> Deallocating.", buf, 0xCu);
  }

  -[MRV1NowPlayingController _unregisterForPlayerPathInvalidations](self, "_unregisterForPlayerPathInvalidations");
  v4.receiver = self;
  v4.super_class = (Class)MRV1NowPlayingController;
  -[MRV1NowPlayingController dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRV1NowPlayingController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "outputDeviceUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p : %@>"), v4, self, v7);

  return (NSString *)v8;
}

- (NSString)debugDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRV1NowPlayingController endpointObserver](self, "endpointObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRV1NowPlayingController endpointObserverGroupUID](self, "endpointObserverGroupUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p {   endpointObserver=%@\n   endpointObserverGroupID=%@\n}>\n"), v4, self, v5, v6);

  return (NSString *)v7;
}

- (void)beginLoadingUpdates
{
  NSObject *v3;
  _QWORD block[5];

  -[MRV1NowPlayingController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__MRV1NowPlayingController_beginLoadingUpdates__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __47__MRV1NowPlayingController_beginLoadingUpdates__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
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
  _QWORD v16[5];
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 11))
  {
    _MRLogForCategory(1uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v18 = v3;
      _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> Begin loading updates.", buf, 0xCu);
    }

    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "destination");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "outputDeviceUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "destination");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playerPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "destination");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playerPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "player");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __47__MRV1NowPlayingController_beginLoadingUpdates__block_invoke_11;
    v16[3] = &unk_1E30C7958;
    v16[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "_loadNowPlayingStateForUID:client:player:completion:", v13, v8, v12, v16);

  }
}

void __47__MRV1NowPlayingController_beginLoadingUpdates__block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setUpdateLoadingEnabled:", 1);
  v6 = *(void **)(a1 + 32);
  if (v5)
    objc_msgSend(v6, "_notifyDelegateOfError:", v5);
  else
    objc_msgSend(v6, "_notifyDelegateOfNewResponse:", v7);

}

- (void)endLoadingUpdates
{
  NSObject *v3;
  _QWORD block[5];

  -[MRV1NowPlayingController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MRV1NowPlayingController_endLoadingUpdates__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __45__MRV1NowPlayingController_endLoadingUpdates__block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 11))
  {
    v1 = result;
    _MRLogForCategory(1uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(v1 + 32);
      v4 = 138412290;
      v5 = v3;
      _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> End loading updates.", (uint8_t *)&v4, 0xCu);
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
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  -[MRV1NowPlayingController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputDeviceUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRV1NowPlayingController configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRV1NowPlayingController configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "destination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "player");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__MRV1NowPlayingController__reloadForCompleteInvalidation__block_invoke;
  v12[3] = &unk_1E30C7958;
  v12[4] = self;
  -[MRV1NowPlayingController _loadNowPlayingStateForUID:client:player:completion:](self, "_loadNowPlayingStateForUID:client:player:completion:", v5, v8, v11, v12);

}

uint64_t __58__MRV1NowPlayingController__reloadForCompleteInvalidation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v3, "_notifyDelegateOfError:");
  else
    return objc_msgSend(v3, "_notifyDelegateOfNewResponse:", a2);
}

- (void)_reloadForPlayerPathInvalidation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  -[MRV1NowPlayingController _unregisterForPlayerPathInvalidations](self, "_unregisterForPlayerPathInvalidations");
  -[MRV1NowPlayingController destination](self, "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endpoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRV1NowPlayingController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRV1NowPlayingController configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "destination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "player");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__MRV1NowPlayingController__reloadForPlayerPathInvalidation__block_invoke;
  v11[3] = &unk_1E30C7958;
  v11[4] = self;
  -[MRV1NowPlayingController _loadNowPlayingStateForEndpoint:client:player:completion:](self, "_loadNowPlayingStateForEndpoint:client:player:completion:", v4, v7, v10, v11);

}

uint64_t __60__MRV1NowPlayingController__reloadForPlayerPathInvalidation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v3, "_notifyDelegateOfError:");
  else
    return objc_msgSend(v3, "_notifyDelegateOfNewResponse:", a2);
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
  -[MRV1NowPlayingController queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__MRV1NowPlayingController__loadNowPlayingStateForUID_client_player_completion___block_invoke;
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

void __80__MRV1NowPlayingController__loadNowPlayingStateForUID_client_player_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearState");
  _MRLogForCategory(1uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> Begin resolving endpoint.", buf, 0xCu);
  }

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__MRV1NowPlayingController__loadNowPlayingStateForUID_client_player_completion___block_invoke_14;
  v6[3] = &unk_1E30CD248;
  v6[4] = v4;
  v9 = *(id *)(a1 + 64);
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v4, "_onQueue_retrieveEndpointForUID:completion:", v5, v6);

}

void __80__MRV1NowPlayingController__loadNowPlayingStateForUID_client_player_completion___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_registerForEndpointChangesIfNeeded");
  _MRLogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __80__MRV1NowPlayingController__loadNowPlayingStateForUID_client_player_completion___block_invoke_14_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> Resolved to Endpoint: %@.", (uint8_t *)&v10, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_loadNowPlayingStateForEndpoint:client:player:completion:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
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
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  MRV1NowPlayingController *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  _MRLogForCategory(1uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "debugName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v22 = self;
    v23 = 2112;
    v24 = v15;
    _os_log_impl(&dword_193827000, v14, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> Begin resolving player path for endpoint %@.", buf, 0x16u);

  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __85__MRV1NowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke;
  v18[3] = &unk_1E30C79D0;
  v19 = v10;
  v20 = v11;
  v18[4] = self;
  v16 = v10;
  v17 = v11;
  -[MRV1NowPlayingController _createPlayerPathForEndpoint:client:player:completion:](self, "_createPlayerPathForEndpoint:client:player:completion:", v16, v13, v12, v18);

}

void __85__MRV1NowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id *v8;
  void *v9;
  id v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  objc_class *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v8 = (id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v7 + 88);
  if (v6)
  {
    if (v9)
    {
      if (objc_msgSend(v9, "isValid"))
      {
        v10 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(*((id *)*v8 + 11), "timeUntilNextInterval");
        v12 = (__CFString *)objc_msgSend(v10, "initWithFormat:", CFSTR("Already attempting retry in %lf more seconds"), v11);
      }
      else
      {
        _MRLogForCategory(1uLL);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          __85__MRV1NowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_cold_1();

        v12 = CFSTR("Exhausted all retry attempts. Controller likely will not function properly until the destination device makes a signficant change");
      }
    }
    else
    {
      v14 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(&unk_1E3143C68, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      v12 = (__CFString *)objc_msgSend(v14, "initWithFormat:", CFSTR("Will attempt retry in %lf seconds"), v16);

      v17 = (objc_class *)MEMORY[0x1E0D4D118];
      v18 = *v8;
      v19 = [v17 alloc];
      objc_msgSend(*v8, "queue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __85__MRV1NowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_27;
      v31[3] = &unk_1E30C5CA8;
      v31[4] = v18;
      v21 = objc_msgSend(v19, "initWithIntervals:name:queue:block:", &unk_1E3143C68, CFSTR("NowPlayingController.retryTimer"), v20, v31);
      v22 = (void *)*((_QWORD *)*v8 + 11);
      *((_QWORD *)*v8 + 11) = v21;

    }
    _MRLogForCategory(1uLL);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = *v8;
      *(_DWORD *)buf = 138412802;
      v33 = v25;
      v34 = 2112;
      v35 = v6;
      v36 = 2112;
      v37 = v12;
      _os_log_error_impl(&dword_193827000, v24, OS_LOG_TYPE_ERROR, "[MRV1NowPlayingController] <%@> Error creating player path %@. %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    *(_QWORD *)(v7 + 88) = 0;

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __85__MRV1NowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_32;
    v26[3] = &unk_1E30C6720;
    v13 = *(void **)(a1 + 40);
    v27 = *(id *)(a1 + 32);
    v28 = v13;
    v29 = v5;
    v30 = *(id *)(a1 + 48);
    objc_msgSend(v27, "_resolvePlayerPath:completion:", v29, v26);

  }
}

void __85__MRV1NowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_27(uint64_t a1)
{
  id *v1;
  NSObject *v2;
  uint64_t v3;
  int v4;
  id *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = (id *)*(id *)(a1 + 32);
  if (v1)
  {
    _MRLogForCategory(1uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v1[11], "currentInterval");
      v4 = 138412546;
      v5 = v1;
      v6 = 2048;
      v7 = v3;
      _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> Attempting retry after already waiting %lf seconds", (uint8_t *)&v4, 0x16u);
    }

    objc_msgSend(v1, "_reloadForCompleteInvalidation");
  }

}

void __85__MRV1NowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v5, "isResolved") & 1) != 0)
  {
    v8 = *(_QWORD *)(a1 + 40);
    v7 = (id *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 32), "destination");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEndpoint:", v8);

    v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "destination");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUnresolvedPlayerPath:", v10);

    objc_msgSend(*(id *)(a1 + 32), "destination");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setResolvedPlayerPath:", v5);

    _MRLogForCategory(1uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *v7;
      *(_DWORD *)buf = 138412546;
      v32 = v14;
      v33 = 2112;
      v34 = v5;
      _os_log_impl(&dword_193827000, v13, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> Resolved to player path: %@.", buf, 0x16u);
    }

    objc_msgSend(*v7, "_registerNotificationHandlersIfNeeded");
    objc_msgSend(*v7, "_registerForPlayerPathInvalidationsIfNeeded");
    _MRLogForCategory(1uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *v7;
      *(_DWORD *)buf = 138412290;
      v32 = v16;
      _os_log_impl(&dword_193827000, v15, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> Begin loading data.", buf, 0xCu);
    }

    v17 = *v7;
    v30 = 0;
    objc_msgSend(v17, "_loadNowPlayingStateForPlayerPath:error:", v5, &v30);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v30;
    _MRLogForCategory(1uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        __85__MRV1NowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_32_cold_1();
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v28 = *v7;
      *(_DWORD *)buf = 138412546;
      v32 = v28;
      v33 = 2112;
      v34 = v18;
      _os_log_impl(&dword_193827000, v21, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> End loading data. Response: %@.", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    _MRLogForCategory(1uLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __85__MRV1NowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_32_cold_2();

    objc_msgSend(*(id *)(a1 + 32), "setResponse:", 0);
    v23 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "destination");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setEndpoint:", v23);

    v25 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "destination");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setUnresolvedPlayerPath:", v25);

    objc_msgSend(*(id *)(a1 + 32), "_registerForPlayerPathInvalidationsIfNeeded");
    v27 = *(_QWORD *)(a1 + 56);
    if (v6)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v27 + 16))(v27, 0, v6);
    }
    else
    {
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 42);
      (*(void (**)(uint64_t, _QWORD, void *))(v27 + 16))(v27, 0, v29);

    }
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
  NSObject *v14;
  dispatch_time_t v15;
  id v16;
  id v17;
  void *v18;
  MRNowPlayingPlayerResponse *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  NSObject *v25;
  uint64_t *v26;
  _QWORD v27[4];
  NSObject *v28;
  uint64_t *v29;
  uint64_t *v30;
  _QWORD v31[4];
  NSObject *v32;
  uint64_t *v33;
  _QWORD v34[4];
  NSObject *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  int v71;

  v6 = a3;
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v71 = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__32;
  v66 = __Block_byref_object_dispose__32;
  v67 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__32;
  v60 = __Block_byref_object_dispose__32;
  v61 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__32;
  v54 = __Block_byref_object_dispose__32;
  v55 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__32;
  v48 = __Block_byref_object_dispose__32;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__32;
  v42 = __Block_byref_object_dispose__32;
  v43 = 0;
  v7 = dispatch_group_create();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create("com.apple.MediaRemote.MRNowPlayingController.callbackQueue", v8);

  dispatch_group_enter(v7);
  v10 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __68__MRV1NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke;
  v34[3] = &unk_1E30C7A20;
  v36 = &v50;
  v37 = &v44;
  v11 = v7;
  v35 = v11;
  -[MRV1NowPlayingController _requestSupportedCommandsForPlayerPath:queue:completion:](self, "_requestSupportedCommandsForPlayerPath:queue:completion:", v6, v9, v34);
  dispatch_group_enter(v11);
  v31[0] = v10;
  v31[1] = 3221225472;
  v31[2] = __68__MRV1NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_2;
  v31[3] = &unk_1E30C7A48;
  v33 = &v68;
  v12 = v11;
  v32 = v12;
  MRMediaRemoteGetPlaybackStateForPlayer(v6, v9, v31);
  dispatch_group_enter(v12);
  v27[0] = v10;
  v27[1] = 3221225472;
  v27[2] = __68__MRV1NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_3;
  v27[3] = &unk_1E30C8F68;
  v29 = &v62;
  v30 = &v56;
  v13 = v12;
  v28 = v13;
  -[MRV1NowPlayingController _requestPlaybackQueueForPlayerPath:includeArtwork:queue:completion:](self, "_requestPlaybackQueueForPlayerPath:includeArtwork:queue:completion:", v6, 1, v9, v27);
  dispatch_group_enter(v13);
  v21 = v10;
  v22 = 3221225472;
  v23 = __68__MRV1NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_4;
  v24 = &unk_1E30C7A98;
  v26 = &v38;
  v14 = v13;
  v25 = v14;
  -[MRV1NowPlayingController _requestPlayerLastPlayingDateForPlayerPath:queue:completion:](self, "_requestPlayerLastPlayingDateForPlayerPath:queue:completion:", v6, v9, &v21);
  v15 = dispatch_time(0, 5000000000);
  if (!dispatch_group_wait(v14, v15))
  {
    v18 = (void *)v57[5];
    if (!v18)
    {
      v18 = (void *)v45[5];
      if (!v18)
      {
        v19 = objc_alloc_init(MRNowPlayingPlayerResponse);
        -[MRNowPlayingPlayerResponse setPlaybackQueue:](v19, "setPlaybackQueue:", v63[5], v21, v22, v23, v24);
        -[MRNowPlayingPlayerResponse setPlaybackState:](v19, "setPlaybackState:", *((unsigned int *)v69 + 6));
        -[MRNowPlayingPlayerResponse setSupportedCommands:](v19, "setSupportedCommands:", v51[5]);
        -[MRNowPlayingPlayerResponse setDeviceLastPlayingDate:](v19, "setDeviceLastPlayingDate:", 0);
        -[MRNowPlayingPlayerResponse setPlayerLastPlayingDate:](v19, "setPlayerLastPlayingDate:", v39[5]);
        goto LABEL_10;
      }
    }
    if (a4)
    {
      v17 = objc_retainAutorelease(v18);
      goto LABEL_8;
    }
LABEL_9:
    v19 = 0;
    goto LABEL_10;
  }
  if (!a4)
    goto LABEL_9;
  v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v17 = (id)objc_msgSend(v16, "initWithMRError:", 26, v21, v22, v23, v24);
LABEL_8:
  v19 = 0;
  *a4 = v17;
LABEL_10:

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);

  return v19;
}

void __68__MRV1NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __68__MRV1NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_2(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __68__MRV1NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
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

void __68__MRV1NowPlayingController__loadNowPlayingStateForPlayerPath_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (void)_requestPlaybackQueueForPlayerPath:(id)a3 includeArtwork:(BOOL)a4 queue:(id)a5 completion:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[MRV1NowPlayingController setRequestingQueue:](self, "setRequestingQueue:", 1);
  +[MRPlaybackQueueRequest defaultPlaybackQueueRequest](MRPlaybackQueueRequest, "defaultPlaybackQueueRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCachingPolicy:", 2);
  if (v8)
  {
    objc_msgSend(v13, "setArtworkHeight:", 600.0);
    objc_msgSend(v13, "setArtworkWidth:", 600.0);
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __95__MRV1NowPlayingController__requestPlaybackQueueForPlayerPath_includeArtwork_queue_completion___block_invoke;
  v15[3] = &unk_1E30C7AC0;
  v15[4] = self;
  v16 = v12;
  v14 = v12;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync(v13, v10, v11, v15);

}

void __95__MRV1NowPlayingController__requestPlaybackQueueForPlayerPath_includeArtwork_queue_completion___block_invoke(uint64_t a1, void *a2)
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

  -[MRPlaybackQueueRequest setArtworkHeight:](v13, "setArtworkHeight:", 600.0);
  -[MRPlaybackQueueRequest setArtworkWidth:](v13, "setArtworkWidth:", 600.0);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__MRV1NowPlayingController__requestContentItemArtwork_forPlayerPath_queue_completion___block_invoke;
  v15[3] = &unk_1E30C7B60;
  v16 = v9;
  v14 = v9;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync(v13, v11, v10, v15);

}

uint64_t __86__MRV1NowPlayingController__requestContentItemArtwork_forPlayerPath_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
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
  v9[2] = __84__MRV1NowPlayingController__requestSupportedCommandsForPlayerPath_queue_completion___block_invoke;
  v9[3] = &unk_1E30C6B70;
  v10 = v7;
  v8 = v7;
  MRMediaRemoteGetSupportedCommandsForPlayer(a3, a4, v9);

}

uint64_t __84__MRV1NowPlayingController__requestSupportedCommandsForPlayerPath_queue_completion___block_invoke(uint64_t a1)
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
  v12[2] = __88__MRV1NowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke;
  v12[3] = &unk_1E30C7BD8;
  v13 = v7;
  v11 = v7;
  -[MRNowPlayingRequest requestLastPlayingDateOnQueue:completion:](v10, "requestLastPlayingDateOnQueue:completion:", v8, v12);

}

void __88__MRV1NowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  if (v4)
  {
    _MRLogForCategory(1uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __88__MRV1NowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_onQueue_retrieveEndpointForUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  MRAVLightweightReconnaissanceSession *v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  id *v16;
  _QWORD v17[4];
  MRAVLightweightReconnaissanceSession *v18;
  id v19;
  _QWORD v20[4];
  MRAVLightweightReconnaissanceSession *v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  -[MRV1NowPlayingController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (objc_msgSend(v6, "isEqualToString:", CFSTR("proactiveEndpoint")))
  {
    -[MRV1NowPlayingController queue](self, "queue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __71__MRV1NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke;
    v23[3] = &unk_1E30C7C00;
    v24 = v7;
    MRAVEndpointResolveActiveSystemEndpointWithType(1, v9, v23, 7.0);

    v10 = v24;
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@ %p>"), objc_opt_class(), self);
    v11 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
    -[MRV1NowPlayingController endpointObserverGroupUID](self, "endpointObserverGroupUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[MRV1NowPlayingController endpointObserverGroupUID](self, "endpointObserverGroupUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRV1NowPlayingController queue](self, "queue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __71__MRV1NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_2;
      v20[3] = &unk_1E30C7C28;
      v15 = (id *)&v21;
      v21 = v11;
      v16 = &v22;
      v22 = v7;
      -[MRAVLightweightReconnaissanceSession searchEndpointsForGroupUID:timeout:reason:queue:completion:](v11, "searchEndpointsForGroupUID:timeout:reason:queue:completion:", v13, v10, v14, v20, 7.0);

    }
    else
    {
      -[MRV1NowPlayingController queue](self, "queue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __71__MRV1NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_3;
      v17[3] = &unk_1E30C7C28;
      v15 = (id *)&v18;
      v18 = v11;
      v16 = &v19;
      v19 = v7;
      -[MRAVLightweightReconnaissanceSession searchEndpointsForOutputDeviceUID:timeout:reason:queue:completion:](v11, "searchEndpointsForOutputDeviceUID:timeout:reason:queue:completion:", v6, v10, v13, v17, 7.0);
    }

  }
}

uint64_t __71__MRV1NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__MRV1NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  id v7;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v7 = *(id *)(a1 + 32);
  v6(v5, a2, a3);

}

void __71__MRV1NowPlayingController__onQueue_retrieveEndpointForUID_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
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
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24 = CFSTR("MREndpointConnectionReasonUserInfoKey");
  v25[0] = CFSTR("MRNowPlayingController");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __82__MRV1NowPlayingController__createPlayerPathForEndpoint_client_player_completion___block_invoke;
  v19[3] = &unk_1E30C68F0;
  v22 = v12;
  v23 = v13;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v13;
  objc_msgSend(v17, "connectToExternalDeviceWithUserInfo:completion:", v14, v19);

}

void __82__MRV1NowPlayingController__createPlayerPathForEndpoint_client_player_completion___block_invoke(id *a1, void *a2)
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
  block[2] = __82__MRV1NowPlayingController__createPlayerPathForEndpoint_client_player_completion___block_invoke_2;
  block[3] = &unk_1E30C7C50;
  v7 = v3;
  v11 = a1[8];
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  v5 = v3;
  dispatch_async(v4, block);

}

void __82__MRV1NowPlayingController__createPlayerPathForEndpoint_client_player_completion___block_invoke_2(uint64_t a1)
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
  -[MRV1NowPlayingController queue](self, "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__MRV1NowPlayingController__resolvePlayerPath_completion___block_invoke;
  v10[3] = &unk_1E30C7B60;
  v11 = v6;
  v9 = v6;
  MRMediaRemoteNowPlayingResolvePlayerPath(v7, v8, v10);

}

uint64_t __58__MRV1NowPlayingController__resolvePlayerPath_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_onQueue_clearState
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MRV1NowPlayingController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MRV1NowPlayingController _unregisterForPlayerPathInvalidations](self, "_unregisterForPlayerPathInvalidations");
  -[MRV1NowPlayingController _unregisterForEndpointChanges](self, "_unregisterForEndpointChanges");
  -[MRV1NowPlayingController destination](self, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEndpoint:", 0);

  -[MRV1NowPlayingController destination](self, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUnresolvedPlayerPath:", 0);

  -[MRV1NowPlayingController destination](self, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setResolvedPlayerPath:", 0);

  -[MRV1NowPlayingController deferredContentItemsToMerge](self, "deferredContentItemsToMerge");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

}

- (void)_notifyDelegateOfNewResponse:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  -[MRV1NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MRV1NowPlayingController helper](self, "helper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didLoadResponse");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (void)_notifyDelegateOfPlaybackStateChange:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v3 = *(_QWORD *)&a3;
  -[MRV1NowPlayingController helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MRV1NowPlayingController helper](self, "helper");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playbackStateDidChange");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, v3);

  }
}

- (void)_notifyDelegateOfPlaybackQueueChange:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  -[MRV1NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MRV1NowPlayingController helper](self, "helper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playbackQueueDidChange");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (void)_notifyDelegateOfUpdatedContentItemsWithContentItems:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  -[MRV1NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MRV1NowPlayingController helper](self, "helper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentItemsDidUpdate");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (void)_notifyDelegateOfUpdatedArtwork:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  -[MRV1NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MRV1NowPlayingController helper](self, "helper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentItemsDidLoadArtwork");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (void)_notifyDelegateOfSupportedCommandsChange:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  -[MRV1NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MRV1NowPlayingController helper](self, "helper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "supportedCommandsDidChange");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (void)_notifyDelegateOfUpdatedPlayerLastPlayingDate:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  -[MRV1NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MRV1NowPlayingController helper](self, "helper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playerLastPlayingDateDidChange");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (void)_notifyDelegateOfUpdatedClientProperties:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  -[MRV1NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MRV1NowPlayingController helper](self, "helper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientPropertiesDidChange");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (void)_notifyDelegateOfPlayerPathChange:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  -[MRV1NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MRV1NowPlayingController helper](self, "helper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playerPathDidChange");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (void)_notifyDelegateOfInvalidation
{
  void *v3;
  void (**v4)(void);
  id v5;

  -[MRV1NowPlayingController helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MRV1NowPlayingController helper](self, "helper");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didInvalidate");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)_notifyDelegateOfError:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  -[MRV1NowPlayingController helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MRV1NowPlayingController helper](self, "helper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didFailWithError");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (void)_registerNotificationHandlersIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (!-[MRV1NowPlayingController registeredForNotifications](self, "registeredForNotifications"))
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

    -[MRV1NowPlayingController setRegisteredForNotifications:](self, "setRegisteredForNotifications:", 1);
  }
}

- (void)_unregisterNotificationHandlers
{
  void *v3;

  if (-[MRV1NowPlayingController registeredForNotifications](self, "registeredForNotifications"))
  {
    MRMediaRemoteSetWantsNowPlayingNotifications(0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

    -[MRV1NowPlayingController setRegisteredForNotifications:](self, "setRegisteredForNotifications:", 0);
  }
}

- (void)_handlePlaybackQueueChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MRV1NowPlayingController *v9;

  v4 = a3;
  -[MRV1NowPlayingController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__MRV1NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __68__MRV1NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kMRNowPlayingPlayerPathUserInfoKey"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedPlayerPath");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v3)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "isEqual:", v3);

    if ((v7 & 1) == 0)
      goto LABEL_8;
  }
  _MRLogForCategory(1uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> processing PlaybackQueueDidChangeNotification.", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "deferredContentItemsToMerge");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

  v11 = *(void **)(a1 + 40);
  objc_msgSend(v11, "destination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resolvedPlayerPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "queue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__MRV1NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke_67;
  v15[3] = &unk_1E30C7C78;
  v15[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v11, "_requestPlaybackQueueForPlayerPath:includeArtwork:queue:completion:", v13, 1, v14, v15);

LABEL_8:
}

uint64_t __68__MRV1NowPlayingController__handlePlaybackQueueChangedNotification___block_invoke_67(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v3, "_notifyDelegateOfError:");
  else
    return objc_msgSend(v3, "_notifyDelegateOfPlaybackQueueChange:", a2);
}

- (void)_handlePlaybackQueueContentItemsChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MRV1NowPlayingController *v9;

  v4 = a3;
  -[MRV1NowPlayingController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__MRV1NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __80__MRV1NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kMRNowPlayingPlayerPathUserInfoKey"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedPlayerPath");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v3)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "isEqual:", v3);

    if ((v7 & 1) == 0)
      goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteUpdatedContentItemsUserInfoKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "mr_compactMap:", &__block_literal_global_81);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(*(id *)(a1 + 40), "requestingQueue");
  _MRLogForCategory(1uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      v14 = *(_QWORD *)(a1 + 40);
      v17 = 138412546;
      v18 = v14;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_193827000, v12, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> deferring PlaybackQueueContentItemsChangedNotification for content items %@ because we are requesting a new playback queue.", (uint8_t *)&v17, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "deferredContentItemsToMerge");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObjectsFromArray:", v9);

  }
  else
  {
    if (v13)
    {
      v16 = *(_QWORD *)(a1 + 40);
      v17 = 138412546;
      v18 = v16;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_193827000, v12, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> updated content items %@.", (uint8_t *)&v17, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "_notifyDelegateOfUpdatedContentItemsWithContentItems:", v10);
  }

LABEL_13:
}

uint64_t __80__MRV1NowPlayingController__handlePlaybackQueueContentItemsChangedNotification___block_invoke_2(uint64_t a1, void *a2)
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
  MRV1NowPlayingController *v9;

  v4 = a3;
  -[MRV1NowPlayingController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__MRV1NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __87__MRV1NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kMRNowPlayingPlayerPathUserInfoKey"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedPlayerPath");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v3)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "isEqual:", v3);

    if ((v7 & 1) == 0)
      goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteUpdatedContentItemsUserInfoKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "mr_compactMap:", &__block_literal_global_69_0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _MRLogForCategory(1uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v19 = v12;
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_193827000, v11, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> processing PlaybackQueueContentItemsArtworkChangedNotification for content items %@.", buf, 0x16u);
  }

  v13 = *(void **)(a1 + 40);
  objc_msgSend(v13, "destination");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resolvedPlayerPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "queue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __87__MRV1NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke_70;
  v17[3] = &unk_1E30C7C78;
  v17[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v13, "_requestContentItemArtwork:forPlayerPath:queue:completion:", v10, v15, v16, v17);

LABEL_8:
}

uint64_t __87__MRV1NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __87__MRV1NowPlayingController__handlePlaybackQueueContentItemsArtworkChangedNotification___block_invoke_70(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfError:", a3);
  }
  else
  {
    _MRLogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "contentItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> updated artwork for content items %@.", (uint8_t *)&v11, 0x16u);

    }
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v5, "contentItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_notifyDelegateOfUpdatedArtwork:", v10);

  }
}

- (void)_handlePlaybackStateChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MRV1NowPlayingController *v9;

  v4 = a3;
  -[MRV1NowPlayingController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__MRV1NowPlayingController__handlePlaybackStateChangedNotification___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __68__MRV1NowPlayingController__handlePlaybackStateChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  _BOOL4 IsAdvancing;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kMRNowPlayingPlayerPathUserInfoKey"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedPlayerPath");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v3)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "isEqual:", v3);

    if ((v7 & 1) == 0)
      goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kMRMediaRemotePlaybackStateUserInfoKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _MRLogForCategory(1uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v20 = v11;
    v21 = 2112;
    v22 = MRMediaRemoteCopyPlaybackStateDescription(objc_msgSend(v9, "intValue"));
    _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> processing PlaybackStateDidChangeNotification with new PlaybackState %@.", buf, 0x16u);
  }

  v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "playbackState");
  objc_msgSend(*(id *)(a1 + 40), "_notifyDelegateOfPlaybackStateChange:", objc_msgSend(v9, "intValue"));
  IsAdvancing = MRMediaRemotePlaybackStateIsAdvancing(v12);
  if (IsAdvancing != MRMediaRemotePlaybackStateIsAdvancing(objc_msgSend(v9, "intValue")))
  {
    v14 = *(void **)(a1 + 40);
    objc_msgSend(v14, "destination");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "resolvedPlayerPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __68__MRV1NowPlayingController__handlePlaybackStateChangedNotification___block_invoke_71;
    v18[3] = &unk_1E30C7CC0;
    v18[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v14, "_requestPlayerLastPlayingDateForPlayerPath:queue:completion:", v16, v17, v18);

  }
LABEL_10:

}

uint64_t __68__MRV1NowPlayingController__handlePlaybackStateChangedNotification___block_invoke_71(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfUpdatedPlayerLastPlayingDate:", a2);
}

- (void)_handleSupportedCommandsChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MRV1NowPlayingController *v9;

  v4 = a3;
  -[MRV1NowPlayingController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__MRV1NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __72__MRV1NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kMRNowPlayingPlayerPathUserInfoKey"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedPlayerPath");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v3)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "isEqual:", v3);

    if ((v7 & 1) == 0)
      goto LABEL_8;
  }
  _MRLogForCategory(1uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v16 = v9;
    _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> processing SupportedCommandsDidChangeNotification.", buf, 0xCu);
  }

  v10 = *(void **)(a1 + 40);
  objc_msgSend(v10, "destination");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resolvedPlayerPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "queue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__MRV1NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_72;
  v14[3] = &unk_1E30C7CE8;
  v14[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v10, "_requestSupportedCommandsForPlayerPath:queue:completion:", v12, v13, v14);

LABEL_8:
}

uint64_t __72__MRV1NowPlayingController__handleSupportedCommandsChangedNotification___block_invoke_72(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v3, "_notifyDelegateOfError:");
  else
    return objc_msgSend(v3, "_notifyDelegateOfSupportedCommandsChange:", a2);
}

- (void)_handleActiveSystemEndpointChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v9;
  MRV1NowPlayingController *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[MRV1NowPlayingController configuration](self, "configuration", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputDeviceUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("proactiveEndpoint"));

  if (v7)
  {
    _MRLogForCategory(1uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = self;
      _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> reloading due to ASE change.", (uint8_t *)&v9, 0xCu);
    }

    -[MRV1NowPlayingController _notifyDelegateOfInvalidation](self, "_notifyDelegateOfInvalidation");
    -[MRV1NowPlayingController _reloadForCompleteInvalidation](self, "_reloadForCompleteInvalidation");
  }
}

- (void)_registerForPlayerPathInvalidationsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  if (!-[MRV1NowPlayingController registeredForPlayerPathInvalidations](self, "registeredForPlayerPathInvalidations"))
  {
    objc_initWeak(&location, self);
    -[MRV1NowPlayingController destination](self, "destination");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unresolvedPlayerPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[MRV1NowPlayingController queue](self, "queue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __71__MRV1NowPlayingController__registerForPlayerPathInvalidationsIfNeeded__block_invoke;
    v8[3] = &unk_1E30CD270;
    objc_copyWeak(&v10, &location);
    v6 = v4;
    v9 = v6;
    v7 = (void *)MRMediaRemoteAddPlayerPathInvalidationHandler((uint64_t)v6, v5, v8);
    -[MRV1NowPlayingController setPlayerPathInvalidationObserver:](self, "setPlayerPathInvalidationObserver:", v7);

    -[MRV1NowPlayingController setRegisteredForPlayerPathInvalidations:](self, "setRegisteredForPlayerPathInvalidations:", 1);
    objc_destroyWeak(&v10);

    objc_destroyWeak(&location);
  }
}

void __71__MRV1NowPlayingController__registerForPlayerPathInvalidationsIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    _MRLogForCategory(1uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412802;
      v8 = WeakRetained;
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = a2;
      _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> reloading due to player path invalidation %@ -> %@.", (uint8_t *)&v7, 0x20u);
    }

    objc_msgSend(WeakRetained, "_notifyDelegateOfInvalidation");
    objc_msgSend(WeakRetained, "_reloadForPlayerPathInvalidation");
  }

}

- (void)_unregisterForPlayerPathInvalidations
{
  void *v3;
  void *v4;

  -[MRV1NowPlayingController playerPathInvalidationObserver](self, "playerPathInvalidationObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MRV1NowPlayingController playerPathInvalidationObserver](self, "playerPathInvalidationObserver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MRMediaRemoteRemovePlayerPathInvalidationHandler((uint64_t)v4);

    -[MRV1NowPlayingController setPlayerPathInvalidationObserver:](self, "setPlayerPathInvalidationObserver:", 0);
  }
  -[MRV1NowPlayingController setRegisteredForPlayerPathInvalidations:](self, "setRegisteredForPlayerPathInvalidations:", 0);
}

- (void)_registerForEndpointChangesIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  MRAVEndpointObserver *endpointObserver;
  MRAVEndpointObserver *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MRAVEndpointObserver *v18;
  MRAVEndpointObserver *v19;
  _QWORD v20[4];
  id v21;
  id location;

  if (!-[MRV1NowPlayingController registeredForEndpointChanges](self, "registeredForEndpointChanges"))
  {
    -[MRV1NowPlayingController destination](self, "destination");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "outputDeviceUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("proactiveEndpoint"));

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handleActiveSystemEndpointChangedNotification_, CFSTR("kMRMediaRemoteActiveSystemEndpointDidChangeNotification"), 0);

    }
    else
    {
      objc_initWeak(&location, self);
      endpointObserver = self->_endpointObserver;
      if (!endpointObserver)
      {
        v8 = [MRAVEndpointObserver alloc];
        -[MRV1NowPlayingController configuration](self, "configuration");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "destination");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "outputDeviceUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_alloc(MEMORY[0x1E0CB3940]);
        v13 = objc_opt_class();
        -[MRV1NowPlayingController configuration](self, "configuration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "destination");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "outputDeviceUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@:%@"), v13, v16);
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __63__MRV1NowPlayingController__registerForEndpointChangesIfNeeded__block_invoke;
        v20[3] = &unk_1E30C7D38;
        objc_copyWeak(&v21, &location);
        v18 = -[MRAVEndpointObserver initWithOutputDeviceUID:label:callback:](v8, "initWithOutputDeviceUID:label:callback:", v11, v17, v20);
        v19 = self->_endpointObserver;
        self->_endpointObserver = v18;

        objc_destroyWeak(&v21);
        endpointObserver = self->_endpointObserver;
      }
      -[MRAVEndpointObserver begin](endpointObserver, "begin");
      objc_destroyWeak(&location);
    }
    -[MRV1NowPlayingController setRegisteredForEndpointChanges:](self, "setRegisteredForEndpointChanges:", 1);
  }
}

void __63__MRV1NowPlayingController__registerForEndpointChangesIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = a2;
    objc_msgSend(WeakRetained, "destination");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endpoint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v7 == v8)
    {

    }
    else
    {
      v9 = v8;
      v10 = objc_msgSend(v7, "isEqual:", v8);

      if ((v10 & 1) == 0)
      {
        _MRLogForCategory(1uLL);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(WeakRetained, "destination");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "endpoint");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138412802;
          v18 = WeakRetained;
          v19 = 2112;
          v20 = v13;
          v21 = 2112;
          v22 = v4;
          _os_log_impl(&dword_193827000, v11, OS_LOG_TYPE_DEFAULT, "[MRV1NowPlayingController] <%@> reloading due to change in endpoint. Current endpoint: %@. New endpoint: %@.", (uint8_t *)&v17, 0x20u);

        }
        objc_msgSend(v4, "outputDevices");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "groupID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "setEndpointObserverGroupUID:", v16);

        objc_msgSend(WeakRetained, "_notifyDelegateOfInvalidation");
        objc_msgSend(WeakRetained, "_reloadForCompleteInvalidation");
      }
    }

  }
}

- (void)_unregisterForEndpointChanges
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  -[MRV1NowPlayingController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputDeviceUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("proactiveEndpoint"));

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("kMRMediaRemoteActiveSystemEndpointDidChangeNotification"), 0);

  }
  else
  {
    -[MRAVEndpointObserver end](self->_endpointObserver, "end");
  }
  -[MRV1NowPlayingController setRegisteredForEndpointChanges:](self, "setRegisteredForEndpointChanges:", 0);
}

- (BOOL)updateLoadingEnabled
{
  MRV1NowPlayingController *v2;
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
  -[MRV1NowPlayingController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__MRV1NowPlayingController_updateLoadingEnabled__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_async_and_wait(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __48__MRV1NowPlayingController_updateLoadingEnabled__block_invoke(uint64_t result)
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
  v10 = __Block_byref_object_copy__32;
  v11 = __Block_byref_object_dispose__32;
  v12 = 0;
  -[MRV1NowPlayingController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__MRV1NowPlayingController_response__block_invoke;
  v6[3] = &unk_1E30C5D20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (MRNowPlayingPlayerResponse *)v4;
}

void __36__MRV1NowPlayingController_response__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (MRNowPlayingControllerHelper)helper
{
  return self->helper;
}

- (void)setHelper:(id)a3
{
  objc_storeStrong((id *)&self->helper, a3);
}

- (MRNowPlayingControllerDestination)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (MRNowPlayingControllerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)playerPathInvalidationObserver
{
  return self->_playerPathInvalidationObserver;
}

- (void)setPlayerPathInvalidationObserver:(id)a3
{
  objc_storeStrong(&self->_playerPathInvalidationObserver, a3);
}

- (MRAVEndpointObserver)endpointObserver
{
  return self->_endpointObserver;
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

- (MSVVariableIntervalTimer)retryTimer
{
  return self->_retryTimer;
}

- (void)setRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_retryTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_deferredContentItemsToMerge, 0);
  objc_storeStrong((id *)&self->_endpointObserverGroupUID, 0);
  objc_storeStrong((id *)&self->_endpointObserver, 0);
  objc_storeStrong(&self->_playerPathInvalidationObserver, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->helper, 0);
}

void __80__MRV1NowPlayingController__loadNowPlayingStateForUID_client_player_completion___block_invoke_14_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_8();
  OUTLINED_FUNCTION_5(&dword_193827000, v0, v1, "[MRV1NowPlayingController] %@ Unable to discover endpoint.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __85__MRV1NowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_8();
  _os_log_fault_impl(&dword_193827000, v0, OS_LOG_TYPE_FAULT, "Exhausted all retry attempts %@", v1, 0xCu);
  OUTLINED_FUNCTION_8();
}

void __85__MRV1NowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_32_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_8();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_193827000, v1, OS_LOG_TYPE_ERROR, "[MRV1NowPlayingController] <%@> Error loading data %@.", v2, 0x16u);
  OUTLINED_FUNCTION_8();
}

void __85__MRV1NowPlayingController__loadNowPlayingStateForEndpoint_client_player_completion___block_invoke_32_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_8();
  OUTLINED_FUNCTION_5(&dword_193827000, v0, v1, "[MRV1NowPlayingController] <%@> Player path is not resolved. There may be no now playing application.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __88__MRV1NowPlayingController__requestPlayerLastPlayingDateForPlayerPath_queue_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_193827000, a2, a3, "[MRV1NowPlayingController] Failed to retrieve player last playing date with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

@end
