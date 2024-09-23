@implementation MRNowPlayingOriginClientManager

- (uint64_t)_allowLocalOriginUsage
{
  void *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "supportMultiplayerHost"))
    v2 = __57__MRNowPlayingOriginClientManager__allowLocalOriginUsage__block_invoke();
  else
    v2 = 1;

  return v2;
}

- (id)playerClientForPlayerPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[MRPlayerPath localResolvedPlayerPathFromPlayerPath:](MRPlayerPath, "localResolvedPlayerPathFromPlayerPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRNowPlayingOriginClientManager clientForPlayerPath:](self, "clientForPlayerPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nowPlayingPlayerClientForPlayerPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)clientForPlayerPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[MRPlayerPath localResolvedPlayerPathFromPlayerPath:](MRPlayerPath, "localResolvedPlayerPathFromPlayerPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRNowPlayingOriginClientManager originClientForPlayerPath:](self, "originClientForPlayerPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nowPlayingClientForPlayerPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)originClientForPlayerPath:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  int v14;
  void *v15;
  __int16 v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[MRPlayerPath localResolvedPlayerPathFromPlayerPath:](MRPlayerPath, "localResolvedPlayerPathFromPlayerPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "origin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isLocal"))
  {
    v6 = -[MRNowPlayingOriginClientManager _allowLocalOriginUsage]((uint64_t)self);

    if ((v6 & 1) == 0)
    {
      _MRLogForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:
        v11 = 0;
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v8 = objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v4;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingOriginClientManager] Cannot create a local originClient in framework for %@: %@", (uint8_t *)&v14, 0x16u);
LABEL_11:

      goto LABEL_12;
    }
  }
  else
  {

  }
  -[MRNowPlayingOriginClientManager existingOriginClientForPlayerPath:]((id *)&self->super.isa, v4);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v4, "origin");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isLocal");

    if ((v10 & 1) == 0)
    {
      _MRLogForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v12 = objc_claimAutoreleasedReturnValue();
        v14 = 138412546;
        v15 = v4;
        v16 = 2112;
        v17 = v12;
        _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingOriginClientManager] Cannot implicitly create a custom originClient for %@: %@. Instead MediaRemote should be explicitly creating this originClient in NowPlayingSessionManager", (uint8_t *)&v14, 0x16u);

      }
      goto LABEL_11;
    }
  }
  -[MRNowPlayingOriginClientManager _createOriginClientForPlayerPath:routingContextID:]((uint64_t)self, v4, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v11;
}

- (id)existingOriginClientForPlayerPath:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v9;
  void *v10;

  v3 = a2;
  if (a1)
  {
    +[MRPlayerPath localResolvedPlayerPathFromPlayerPath:](MRPlayerPath, "localResolvedPlayerPathFromPlayerPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "origin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRNowPlayingOriginClientManager existingOriginClientForPlayerPath:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("MRNowPlayingOriginClientManager.m"), 159, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("origin"));

    }
    v6 = a1[1];
    objc_sync_enter(v6);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[1], "objectForKey:", v7);
    a1 = (id *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v6);
  }

  return a1;
}

+ (id)sharedManager
{
  if (sharedManager___once_3 != -1)
    dispatch_once(&sharedManager___once_3, &__block_literal_global_104);
  return (id)sharedManager___sharedManager_2;
}

- (id)existingPlayerClientRequestsForPlayerPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MRNowPlayingOriginClientManager existingClientRequestsForPlayerPath:](self, "existingClientRequestsForPlayerPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "existingNowPlayingPlayerClientRequestsForPlayerPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)existingClientRequestsForPlayerPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MRNowPlayingOriginClientManager existingOriginClientRequestsForPlayerPath:](self, "existingOriginClientRequestsForPlayerPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "existingNowPlayingClientRequestsForPlayerPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)existingOriginClientRequestsForPlayerPath:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "origin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = self->_originClientRequests;
    objc_sync_enter(v6);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_originClientRequests, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)handleActiveSystemEndpointOutputDeviceUIDForType:(int64_t)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *active;
  MRBlockGuard *v15;
  void *v16;
  MRBlockGuard *v17;
  __CFString *v18;
  __CFString *v19;
  NSObject *v20;
  int64_t v21;
  id v22;
  id v23;
  id v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  MRNowPlayingOriginClientManager *v26;
  NSMutableDictionary *activeSystemEndpointUIDs;
  NSMutableDictionary *v28;
  NSMutableDictionary *v29;
  void *v30;
  void *v31;
  id v32;
  NSMutableDictionary *activeSystemEndpointUIDCompletions;
  NSMutableDictionary *v34;
  NSMutableDictionary *v35;
  void *v36;
  NSMutableDictionary *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  id v45;
  id v46;
  MRBlockGuard *v47;
  __CFString *v49;
  _QWORD v50[5];
  __CFString *v51;
  id v52;
  id v53;
  id v54;
  int64_t v55;
  _QWORD v56[4];
  MRBlockGuard *v57;
  id v58;
  __CFString *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  uint8_t buf[4];
  const __CFString *v65;
  __int16 v66;
  id v67;
  __int16 v68;
  const __CFString *v69;
  __int16 v70;
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingOriginClientManager.m"), 363, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = a3;
  active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription(a3);
  v15 = [MRBlockGuard alloc];
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("handleActiveSystemEndpointOutputDeviceUIDForType"), v12);
  v17 = -[MRBlockGuard initWithTimeout:reason:handler:](v15, "initWithTimeout:reason:handler:", v16, 0, 0.0);

  v18 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("handleActiveSystemEndpointOutputDeviceUIDForType"), v12);
  v19 = v18;
  if (active)
    -[__CFString appendFormat:](v18, "appendFormat:", CFSTR(" for %@"), active);
  v49 = v19;
  _MRLogForCategory(0xAuLL);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v13;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v65 = v49;
    _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __101__MRNowPlayingOriginClientManager_handleActiveSystemEndpointOutputDeviceUIDForType_queue_completion___block_invoke;
  v56[3] = &unk_1E30CF958;
  v47 = v17;
  v57 = v47;
  v22 = active;
  v58 = v22;
  v59 = CFSTR("handleActiveSystemEndpointOutputDeviceUIDForType");
  v23 = v12;
  v60 = v23;
  v46 = v10;
  v61 = v46;
  v24 = v8;
  v62 = v24;
  v45 = v9;
  v63 = v45;
  v25 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](v56);
  v26 = self;
  objc_sync_enter(v26);
  activeSystemEndpointUIDs = v26->_activeSystemEndpointUIDs;
  if (!activeSystemEndpointUIDs)
  {
    v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v29 = v26->_activeSystemEndpointUIDs;
    v26->_activeSystemEndpointUIDs = v28;

    activeSystemEndpointUIDs = v26->_activeSystemEndpointUIDs;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](activeSystemEndpointUIDs, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[MRNowPlayingOriginClientManager activeSystemEndpointOutputDeviceUIDForType:](v26, "activeSystemEndpointOutputDeviceUIDForType:", v21);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v25)[2](v25, v32, 0);
  }
  else
  {
    activeSystemEndpointUIDCompletions = v26->_activeSystemEndpointUIDCompletions;
    if (!activeSystemEndpointUIDCompletions)
    {
      v34 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v35 = v26->_activeSystemEndpointUIDCompletions;
      v26->_activeSystemEndpointUIDCompletions = v34;

      activeSystemEndpointUIDCompletions = v26->_activeSystemEndpointUIDCompletions;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](activeSystemEndpointUIDCompletions, "objectForKeyedSubscript:", v36);
    v32 = (id)objc_claimAutoreleasedReturnValue();

    if (!v32)
    {
      v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v37 = v26->_activeSystemEndpointUIDCompletions;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v37, "setObject:forKeyedSubscript:", v32, v38);

    }
    v39 = (void *)objc_msgSend(v25, "copy");
    v40 = (void *)MEMORY[0x194036C44]();
    objc_msgSend(v32, "addObject:", v40);

    if (objc_msgSend(v32, "count") == 1)
    {
      _MRLogForCategory(0xAuLL);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        v65 = CFSTR("handleActiveSystemEndpointOutputDeviceUIDForType");
        v66 = 2114;
        v67 = v23;
        v68 = 2112;
        v69 = 0;
        v70 = 2112;
        v71 = v22;
        _os_log_impl(&dword_193827000, v41, OS_LOG_TYPE_DEFAULT, "Cache Miss: Request: %{public}@<%{public}@> for %@ %@", buf, 0x2Au);
      }

      v42 = (void *)MRGetSharedService();
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __101__MRNowPlayingOriginClientManager_handleActiveSystemEndpointOutputDeviceUIDForType_queue_completion___block_invoke_43;
      v50[3] = &unk_1E30CF980;
      v55 = v21;
      v50[4] = v26;
      v51 = CFSTR("handleActiveSystemEndpointOutputDeviceUIDForType");
      v52 = v23;
      v53 = v22;
      v32 = v32;
      v54 = v32;
      MRMediaRemoteServiceGetActiveSystemEndpointUID(v42, v21, v24, v50);

    }
    else
    {
      _MRLogForCategory(0xAuLL);
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        v65 = CFSTR("handleActiveSystemEndpointOutputDeviceUIDForType");
        v66 = 2114;
        v67 = v23;
        v68 = 2112;
        v69 = CFSTR("waiting for previously batched request to respond");
        v70 = 2112;
        v71 = v22;
        _os_log_impl(&dword_193827000, v43, OS_LOG_TYPE_DEFAULT, "Cache Miss: Request: %{public}@<%{public}@> for %@ %@", buf, 0x2Au);
      }

    }
  }

  objc_sync_exit(v26);
}

- (id)activeSystemEndpointOutputDeviceUIDForType:(int64_t)a3
{
  MRNowPlayingOriginClientManager *v4;
  NSMutableDictionary *activeSystemEndpointUIDs;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;

  v4 = self;
  objc_sync_enter(v4);
  activeSystemEndpointUIDs = v4->_activeSystemEndpointUIDs;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](activeSystemEndpointUIDs, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v4);
  if (!v7)
  {
    MRGetSharedService();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getActiveSystemEndpointUIDForType:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      +[MRAVOutputDevice localDeviceUID](MRAVOutputDevice, "localDeviceUID");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v11;

    -[MRNowPlayingOriginClientManager updateActiveSystemEndpointOutputDeviceUID:forType:](v4, "updateActiveSystemEndpointOutputDeviceUID:forType:", v7, a3);
  }
  +[MRAVOutputDevice localDeviceUID](MRAVOutputDevice, "localDeviceUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "isEqualToString:", v12);

  if (v13)
  {

    v7 = 0;
  }
  v14 = (void *)objc_msgSend(v7, "copy");

  return v14;
}

void __96__MRNowPlayingOriginClientManager_resolveActiveSystemEndpointWithType_timeout_queue_completion___block_invoke_3(uint64_t a1)
{
  -[MRNowPlayingOriginClientManager _resolveActiveSystemEndpointWithType:requestName:requestType:requestID:timeout:queue:completion:](*(void **)(a1 + 32), *(_QWORD *)(a1 + 72), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), (void *)resolveActiveSystemEndpointWithType_timeout_queue_completion__workerQueue, *(void **)(a1 + 64), *(double *)(a1 + 80));
}

- (id)playerClientRequestsForPlayerPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MRNowPlayingOriginClientManager clientRequestsForPlayerPath:](self, "clientRequestsForPlayerPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nowPlayingPlayerClientRequestsForPlayerPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)clientRequestsForPlayerPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MRNowPlayingOriginClientManager originClientRequestsForPlayerPath:](self, "originClientRequestsForPlayerPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nowPlayingClientRequestsForPlayerPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)originClientRequestsForPlayerPath:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  void *v7;
  MRNowPlayingOriginClientRequests *v8;

  v4 = a3;
  objc_msgSend(v4, "origin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = self->_originClientRequests;
    objc_sync_enter(v6);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_originClientRequests, "objectForKey:", v7);
    v8 = (MRNowPlayingOriginClientRequests *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = -[MRNowPlayingOriginClientRequests initWithOrigin:]([MRNowPlayingOriginClientRequests alloc], "initWithOrigin:", v5);
      -[NSMutableDictionary setObject:forKey:](self->_originClientRequests, "setObject:forKey:", v8, v7);
    }

    objc_sync_exit(v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)updateActiveSystemEndpointOutputDeviceUID:(id)a3 forType:(int64_t)a4
{
  MRNowPlayingOriginClientManager *v6;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *activeSystemEndpointUIDs;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = self;
  objc_sync_enter(v6);
  v7 = v13;
  if (!v6->_activeSystemEndpointUIDs)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    activeSystemEndpointUIDs = v6->_activeSystemEndpointUIDs;
    v6->_activeSystemEndpointUIDs = v8;

    v7 = v13;
  }
  v10 = v7;
  if (!v7)
  {
    +[MRAVOutputDevice localDeviceUID](MRAVOutputDevice, "localDeviceUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v6->_activeSystemEndpointUIDs;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v10, v12);

  if (!v13)
  objc_sync_exit(v6);

}

void __131__MRNowPlayingOriginClientManager__resolveActiveSystemEndpointWithType_requestName_requestType_requestID_timeout_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  char v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  MRAVLightweightReconnaissanceSession *v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  MRAVLightweightReconnaissanceSession *v29;
  _QWORD v30[4];
  MRAVLightweightReconnaissanceSession *v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  const __CFString *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[MRAVOutputDevice localDeviceUID](MRAVOutputDevice, "localDeviceUID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v3)
  {

    goto LABEL_5;
  }
  v5 = v4;
  v6 = objc_msgSend(v4, "isEqual:", v3);

  if (v6)
  {
LABEL_5:

    v3 = 0;
  }
  if (*(_QWORD *)(a1 + 88) == 4)
  {
    +[MRGroupSessionRequestManager sharedManager](MRGroupSessionRequestManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "groupSessionInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_msgSend(v8, "isHosted");
      if (v3 && v9)
      {
        _MRLogForCategory(0xAuLL);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = *(_QWORD *)(a1 + 32);
          v12 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543874;
          v44 = v11;
          v45 = 2114;
          v46 = v12;
          v47 = 2112;
          v48 = CFSTR("Will override with local for supported client hosting GroupSession.");
          _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
        }

        v3 = 0;
      }
      else if ((objc_msgSend(v8, "isHosted") & 1) == 0)
      {
        objc_msgSend(v8, "effectiveIdentifier");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (v3 == v13)
        {

        }
        else
        {
          v14 = v13;
          v15 = objc_msgSend(v3, "isEqual:", v13);

          if ((v15 & 1) == 0)
          {
            _MRLogForCategory(0xAuLL);
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              v17 = *(_QWORD *)(a1 + 32);
              v18 = *(_QWORD *)(a1 + 40);
              *(_DWORD *)buf = 138543874;
              v44 = v17;
              v45 = 2114;
              v46 = v18;
              v47 = 2112;
              v48 = CFSTR("Will override with remote GroupSession endpoint for supported client.");
              _os_log_impl(&dword_193827000, v16, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
            }

            objc_msgSend(v8, "effectiveIdentifier");
            v19 = objc_claimAutoreleasedReturnValue();

            v3 = (id)v19;
          }
        }
      }
    }

  }
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@<%@>"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v21 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
  v22 = *(double *)(a1 + 96);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __131__MRNowPlayingOriginClientManager__resolveActiveSystemEndpointWithType_requestName_requestType_requestID_timeout_queue_completion___block_invoke_61;
  v30[3] = &unk_1E30CFA20;
  v24 = *(_QWORD *)(a1 + 48);
  v23 = *(_QWORD *)(a1 + 56);
  v31 = v21;
  v32 = v23;
  v33 = *(id *)(a1 + 64);
  v25 = *(id *)(a1 + 40);
  v26 = *(_QWORD *)(a1 + 88);
  v34 = v25;
  v40 = v26;
  v27 = *(id *)(a1 + 32);
  v41 = *(_QWORD *)(a1 + 104);
  v35 = v27;
  v36 = v3;
  v37 = *(id *)(a1 + 72);
  v42 = *(_QWORD *)(a1 + 96);
  v38 = *(id *)(a1 + 48);
  v39 = *(id *)(a1 + 80);
  v28 = v3;
  v29 = v21;
  -[MRAVLightweightReconnaissanceSession searchEndpointsForOutputDeviceUID:timeout:reason:queue:completion:](v29, "searchEndpointsForOutputDeviceUID:timeout:reason:queue:completion:", v28, v20, v24, v30, v22);

}

void __101__MRNowPlayingOriginClientManager_handleActiveSystemEndpointOutputDeviceUIDForType_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  _QWORD block[4];
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  id v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "disarm");
  v7 = *(_QWORD *)(a1 + 40);
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 && !v6)
  {
    v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        v12 = *(_QWORD *)(a1 + 48);
        v11 = *(_QWORD *)(a1 + 56);
        v13 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
        *(_DWORD *)buf = 138544386;
        v44 = v12;
        v45 = 2114;
        v46 = v11;
        v47 = 2112;
        v48 = v5;
        v49 = 2114;
        v50 = v13;
        v51 = 2048;
        v52 = v15;
        v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v17 = v9;
        v18 = 52;
LABEL_16:
        _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    if (!v10)
      goto LABEL_22;
    v29 = *(_QWORD *)(a1 + 48);
    v30 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
    *(_DWORD *)buf = 138544130;
    v44 = v29;
    v45 = 2114;
    v46 = v30;
    v47 = 2112;
    v48 = v5;
    v49 = 2048;
    v50 = v31;
    v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    v17 = v9;
    v18 = 42;
    goto LABEL_16;
  }
  if (v6)
  {
    v19 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v19)
      {
        v21 = *(_QWORD *)(a1 + 48);
        v20 = *(_QWORD *)(a1 + 56);
        v22 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
        *(_DWORD *)buf = 138544386;
        v44 = v21;
        v45 = 2114;
        v46 = v20;
        v47 = 2114;
        v48 = v6;
        v49 = 2114;
        v50 = v22;
        v51 = 2048;
        v52 = v23;
        _os_log_error_impl(&dword_193827000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_17:

        goto LABEL_22;
      }
    }
    else if (v19)
    {
      __101__MRNowPlayingOriginClientManager_handleActiveSystemEndpointOutputDeviceUIDForType_queue_completion___block_invoke_cold_1(a1);
    }
    goto LABEL_22;
  }
  v24 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (!v24)
      goto LABEL_22;
    v32 = *(_QWORD *)(a1 + 48);
    v33 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
    *(_DWORD *)buf = 138543874;
    v44 = v32;
    v45 = 2114;
    v46 = v33;
    v47 = 2048;
    v48 = v34;
    v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v17 = v9;
    v18 = 32;
    goto LABEL_16;
  }
  if (v24)
  {
    v26 = *(_QWORD *)(a1 + 48);
    v25 = *(_QWORD *)(a1 + 56);
    v27 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
    *(_DWORD *)buf = 138544130;
    v44 = v26;
    v45 = 2114;
    v46 = v25;
    v47 = 2114;
    v48 = v27;
    v49 = 2048;
    v50 = v28;
    v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__MRNowPlayingOriginClientManager_handleActiveSystemEndpointOutputDeviceUIDForType_queue_completion___block_invoke_40;
  block[3] = &unk_1E30C6658;
  v35 = *(NSObject **)(a1 + 72);
  v36 = *(id *)(a1 + 80);
  v41 = v6;
  v42 = v36;
  v40 = v5;
  v37 = v6;
  v38 = v5;
  dispatch_async(v35, block);

}

void __96__MRNowPlayingOriginClientManager_resolveActiveSystemEndpointWithType_timeout_queue_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  id v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(v5, "debugName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = a1[4];
    _MRLogForCategory(0xAuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v16)
      {
        if (!v17)
          goto LABEL_21;
        v18 = a1[5];
        v19 = a1[6];
        objc_msgSend(v5, "debugName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = a1[4];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "timeIntervalSinceDate:", a1[7]);
        *(_DWORD *)buf = 138544386;
        v47 = v18;
        v48 = 2114;
        v49 = v19;
        v50 = 2112;
        v51 = v13;
        v52 = 2114;
        v53 = v20;
        v54 = 2048;
        v55 = v22;
        v23 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v24 = v8;
        v25 = 52;
      }
      else
      {
        if (!v17)
          goto LABEL_21;
        v33 = a1[5];
        v34 = a1[6];
        objc_msgSend(v5, "debugName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "timeIntervalSinceDate:", a1[7]);
        *(_DWORD *)buf = 138544130;
        v47 = v33;
        v48 = 2114;
        v49 = v34;
        v50 = 2112;
        v51 = v13;
        v52 = 2048;
        v53 = v35;
        v23 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        v24 = v8;
        v25 = 42;
      }
      _os_log_impl(&dword_193827000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);

    }
    else
    {
      if (v16)
      {
        if (!v17)
          goto LABEL_21;
        v27 = a1[5];
        v26 = a1[6];
        v28 = (void *)a1[4];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", a1[7]);
        *(_DWORD *)buf = 138544130;
        v47 = v27;
        v48 = 2114;
        v49 = v26;
        v50 = 2114;
        v51 = v28;
        v52 = 2048;
        v53 = v29;
        v30 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        v31 = v8;
        v32 = 42;
      }
      else
      {
        if (!v17)
          goto LABEL_21;
        v36 = a1[5];
        v37 = a1[6];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", a1[7]);
        *(_DWORD *)buf = 138543874;
        v47 = v36;
        v48 = 2114;
        v49 = v37;
        v50 = 2048;
        v51 = v38;
        v30 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v31 = v8;
        v32 = 32;
      }
      _os_log_impl(&dword_193827000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
    }
    goto LABEL_20;
  }
  v7 = a1[4];
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (!v9)
      goto LABEL_21;
    v11 = a1[5];
    v10 = a1[6];
    v12 = a1[4];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", a1[7]);
    *(_DWORD *)buf = 138544386;
    v47 = v11;
    v48 = 2114;
    v49 = v10;
    v50 = 2114;
    v51 = v6;
    v52 = 2114;
    v53 = v12;
    v54 = 2048;
    v55 = v14;
    _os_log_error_impl(&dword_193827000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:

    goto LABEL_21;
  }
  if (v9)
    __64__MRNowPlayingRequest_requestLastPlayingDateOnQueue_completion___block_invoke_2_cold_1((uint64_t)a1);
LABEL_21:

  v39 = (void *)a1[9];
  if (v39)
  {
    v40 = a1[8];
    v41 = v40;
    if (!v40)
    {
      v41 = MEMORY[0x1E0C80D38];
      v42 = MEMORY[0x1E0C80D38];
      v39 = (void *)a1[9];
    }
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __96__MRNowPlayingOriginClientManager_resolveActiveSystemEndpointWithType_timeout_queue_completion___block_invoke_51;
    v43[3] = &unk_1E30C6568;
    v45 = v39;
    v44 = v5;
    dispatch_async(v41, v43);
    if (!v40)

  }
}

- (void)_resolveActiveSystemEndpointWithType:(void *)a3 requestName:(void *)a4 requestType:(void *)a5 requestID:(void *)a6 timeout:(void *)a7 queue:(double)a8 completion:
{
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  _QWORD *v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  double v41;
  uint64_t v42;

  v31 = a3;
  v30 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (a1)
  {
    v18 = a1;
    objc_sync_enter(v18);
    v19 = (void *)v18[8];
    if (!v19)
    {
      v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v21 = (void *)v18[8];
      v18[8] = v20;

      v19 = (void *)v18[8];
    }
    if ((a2 & 0xFFFFFFFFFFFFFFFELL) == 4)
      v22 = 0;
    else
      v22 = a2;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2, v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v23);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v25 = (void *)v18[8];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, v26);

    }
    v27 = (void *)objc_msgSend(v17, "copy");
    v28 = (void *)MEMORY[0x194036C44]();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v28, v15);

    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __131__MRNowPlayingOriginClientManager__resolveActiveSystemEndpointWithType_requestName_requestType_requestID_timeout_queue_completion___block_invoke;
    v32[3] = &unk_1E30CFA48;
    v40 = a2;
    v33 = v31;
    v34 = v15;
    v41 = a8;
    v35 = v16;
    v36 = v18;
    v29 = v24;
    v37 = v29;
    v42 = v22;
    v38 = v30;
    v39 = v17;
    objc_msgSend(v18, "handleActiveSystemEndpointOutputDeviceUIDForType:queue:completion:", v22, v35, v32);

    objc_sync_exit(v18);
  }

}

- (void)resolveActiveSystemEndpointWithType:(int64_t)a3 timeout:(double)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *active;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD block[5];
  __CFString *v32;
  id v33;
  id v34;
  id v35;
  int64_t v36;
  double v37;
  _QWORD v38[4];
  id v39;
  __CFString *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription(a3);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("ResolveActiveEndpoint"), v15);
  v17 = v16;
  if (active)
    objc_msgSend(v16, "appendFormat:", CFSTR(" for %@"), active);
  _MRLogForCategory(0xAuLL);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v46 = v17;
    _os_log_impl(&dword_193827000, v18, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v19 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __96__MRNowPlayingOriginClientManager_resolveActiveSystemEndpointWithType_timeout_queue_completion___block_invoke;
  v38[3] = &unk_1E30CF9A8;
  v20 = active;
  v39 = v20;
  v40 = CFSTR("ResolveActiveEndpoint");
  v21 = v15;
  v41 = v21;
  v42 = v13;
  v43 = v10;
  v44 = v11;
  v30 = v10;
  v22 = v11;
  v23 = v13;
  v24 = (void *)MEMORY[0x194036C44](v38);
  v25 = v17;
  if (resolveActiveSystemEndpointWithType_timeout_queue_completion__onceToken != -1)
    dispatch_once(&resolveActiveSystemEndpointWithType_timeout_queue_completion__onceToken, &__block_literal_global_53_0);
  v26 = resolveActiveSystemEndpointWithType_timeout_queue_completion__workerQueue;
  block[0] = v19;
  block[1] = 3221225472;
  block[2] = __96__MRNowPlayingOriginClientManager_resolveActiveSystemEndpointWithType_timeout_queue_completion___block_invoke_3;
  block[3] = &unk_1E30CF9D0;
  block[4] = self;
  v32 = CFSTR("ResolveActiveEndpoint");
  v33 = v20;
  v34 = v21;
  v37 = a4;
  v35 = v24;
  v36 = a3;
  v27 = v24;
  v28 = v21;
  v29 = v20;
  dispatch_async(v26, block);

}

void __48__MRNowPlayingOriginClientManager_sharedManager__block_invoke()
{
  MRNowPlayingOriginClientManager *v0;
  void *v1;

  v0 = objc_alloc_init(MRNowPlayingOriginClientManager);
  v1 = (void *)sharedManager___sharedManager_2;
  sharedManager___sharedManager_2 = (uint64_t)v0;

}

- (MRNowPlayingOriginClientManager)init
{
  MRNowPlayingOriginClientManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *originClients;
  NSMutableDictionary *v5;
  NSMutableDictionary *originClientRequests;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MRNowPlayingOriginClientManager;
  v2 = -[MRNowPlayingOriginClientManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    originClients = v2->_originClients;
    v2->_originClients = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    originClientRequests = v2->_originClientRequests;
    v2->_originClientRequests = v5;

  }
  return v2;
}

void __96__MRNowPlayingOriginClientManager_resolveActiveSystemEndpointWithType_timeout_queue_completion___block_invoke_2()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.mediaremote.resolveActiveSystemEndpoint.workerQueue", v2);
  v1 = (void *)resolveActiveSystemEndpointWithType_timeout_queue_completion__workerQueue;
  resolveActiveSystemEndpointWithType_timeout_queue_completion__workerQueue = (uint64_t)v0;

}

- (id)debugDescription
{
  MRNowPlayingOriginClientManager *v2;
  void *v3;
  NSMutableDictionary *activeSystemEndpointUIDs;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableDictionary count](v2->_activeSystemEndpointUIDs, "count"));
  activeSystemEndpointUIDs = v2->_activeSystemEndpointUIDs;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __51__MRNowPlayingOriginClientManager_debugDescription__block_invoke;
  v23[3] = &unk_1E30CF930;
  v21 = v3;
  v24 = v21;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](activeSystemEndpointUIDs, "enumerateKeysAndObjectsUsingBlock:", v23);
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[MRNowPlayingOriginClientManager originClients](v2, "originClients");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromArray(v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRNowPlayingOriginClientManager originClientRequests]((id *)&v2->super.isa);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromArray(v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x194036C44](v2->_createPlayerCallback);
  MRCreateIndentedDebugDescriptionFromObject(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x194036C44](v2->_destroyPlayerCallback);
  MRCreateIndentedDebugDescriptionFromObject(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x194036C44](v2->_generatePlayerIDCallback);
  MRCreateIndentedDebugDescriptionFromObject(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(v2->_activeSystemEndpointUIDCompletions);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(v2->_resolveActiveSystemEndpointCompletions);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("    originClients = %@\n    originClientRequests = %@\n    createPlayerCallback = %@\n    destroyPlayerCallback = %@\n    generatePlayerIDCallback = %@\n    activeSystemEndpoint = %@\n    activeSystemEndpointUIDCompletions = %@\n    resolveActiveSystemEndpointCompletions = %@\n"), v19, v18, v17, v7, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateFormattedDebugDescriptionFromClass(v2, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v14;
}

void __51__MRNowPlayingOriginClientManager_debugDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id active;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  active = (id)MRMediaRemoteActiveEndpointTypeCopyDescription((int)objc_msgSend(a2, "intValue"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, active);

}

- (id)originClientRequests
{
  id *v1;
  id v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    v2 = a1[2];
    objc_sync_enter(v2);
    objc_msgSend(v1[2], "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = (id *)objc_msgSend(v3, "copy");

    objc_sync_exit(v2);
  }
  return v1;
}

- (NSArray)originClients
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;

  v3 = self->_originClients;
  objc_sync_enter(v3);
  -[NSMutableDictionary allValues](self->_originClients, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_sync_exit(v3);
  return (NSArray *)v5;
}

- (void)setCreateNewPlayerCallback:(id)a3
{
  MRNowPlayingOriginClientManager *v4;
  uint64_t v5;
  id createPlayerCallback;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  createPlayerCallback = v4->_createPlayerCallback;
  v4->_createPlayerCallback = (id)v5;

  objc_sync_exit(v4);
}

- (id)createNewPlayerCallback
{
  MRNowPlayingOriginClientManager *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_msgSend(v2->_createPlayerCallback, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (void)setDestroyPlayerCallback:(id)a3
{
  MRNowPlayingOriginClientManager *v4;
  uint64_t v5;
  id destroyPlayerCallback;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  destroyPlayerCallback = v4->_destroyPlayerCallback;
  v4->_destroyPlayerCallback = (id)v5;

  objc_sync_exit(v4);
}

- (id)destroyPlayerCallback
{
  MRNowPlayingOriginClientManager *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_msgSend(v2->_destroyPlayerCallback, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (void)setGeneratePlayerIDCallback:(id)a3
{
  MRNowPlayingOriginClientManager *v4;
  uint64_t v5;
  id generatePlayerIDCallback;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  generatePlayerIDCallback = v4->_generatePlayerIDCallback;
  v4->_generatePlayerIDCallback = (id)v5;

  objc_sync_exit(v4);
}

- (id)generatePlayerIDCallback
{
  MRNowPlayingOriginClientManager *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_msgSend(v2->_generatePlayerIDCallback, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (id)localOriginClient
{
  void *v3;
  void *v4;

  +[MROrigin localOrigin](MROrigin, "localOrigin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRNowPlayingOriginClientManager originClientForOrigin:](self, "originClientForOrigin:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)originClientForOrigin:(id)a3
{
  id v4;
  MRPlayerPath *v5;
  void *v6;

  v4 = a3;
  v5 = -[MRPlayerPath initWithOrigin:client:player:]([MRPlayerPath alloc], "initWithOrigin:client:player:", v4, 0, 0);

  -[MRNowPlayingOriginClientManager originClientForPlayerPath:](self, "originClientForPlayerPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createCustomOriginClientForOrigin:(id)a3 routingContextID:(id)a4
{
  id v7;
  id v8;
  MRPlayerPath *v9;
  void *v10;
  void *v11;
  void *v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingOriginClientManager.m"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("origin"));

  }
  v9 = -[MRPlayerPath initWithOrigin:client:player:]([MRPlayerPath alloc], "initWithOrigin:client:player:", v7, 0, 0);
  +[MRPlayerPath localResolvedPlayerPathFromPlayerPath:](MRPlayerPath, "localResolvedPlayerPathFromPlayerPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRNowPlayingOriginClientManager _createOriginClientForPlayerPath:routingContextID:]((uint64_t)self, v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (MRNowPlayingOriginClient)_createOriginClientForPlayerPath:(void *)a3 routingContextID:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  MRNowPlayingOriginClient *v11;
  void *v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    +[MRPlayerPath localResolvedPlayerPathFromPlayerPath:](MRPlayerPath, "localResolvedPlayerPathFromPlayerPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "origin");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRNowPlayingOriginClientManager _createOriginClientForPlayerPath:routingContextID:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("MRNowPlayingOriginClientManager.m"), 215, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("origin"));

    }
    v9 = *(id *)(a1 + 8);
    objc_sync_enter(v9);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v10);
    v11 = (MRNowPlayingOriginClient *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v11 = -[MRNowPlayingOriginClient initWithOrigin:routingContextID:]([MRNowPlayingOriginClient alloc], "initWithOrigin:routingContextID:", v8, v6);
      if (v11)
        objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v11, v10);
    }

    objc_sync_exit(v9);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __57__MRNowPlayingOriginClientManager__allowLocalOriginUsage__block_invoke()
{
  if ((MRProcessIsMediaRemoteDaemon() & 1) != 0 || (MRProcessIsAirPlayDaemon() & 1) != 0)
    return 1;
  else
    return MRProcessIsHomePodCannedDemo();
}

- (void)restoreNowPlayingClientState
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[MRNowPlayingOriginClientManager originClientRequests]((id *)&self->super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v7++), "restoreNowPlayingClientState");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[MRNowPlayingOriginClientManager originClients](self, "originClients", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "restoreNowPlayingClientState");
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }

}

- (void)removeOrigin:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *originClients;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRNowPlayingOriginClientManager removeOrigin:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("MRNowPlayingOriginClientManager.m"), 327, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("origin"));

  }
  v4 = self->_originClients;
  objc_sync_enter(v4);
  originClients = self->_originClients;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v9, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](originClients, "removeObjectForKey:", v6);

  objc_sync_exit(v4);
}

- (void)removeOriginRequests:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *originClientRequests;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRNowPlayingOriginClientManager removeOriginRequests:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("MRNowPlayingOriginClientManager.m"), 336, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("origin"));

  }
  v4 = self->_originClientRequests;
  objc_sync_enter(v4);
  originClientRequests = self->_originClientRequests;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v9, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](originClientRequests, "removeObjectForKey:", v6);

  objc_sync_exit(v4);
}

- (void)clearActiveSystemEndpoints
{
  NSMutableDictionary *activeSystemEndpointUIDs;
  MRNowPlayingOriginClientManager *obj;

  obj = self;
  objc_sync_enter(obj);
  activeSystemEndpointUIDs = obj->_activeSystemEndpointUIDs;
  obj->_activeSystemEndpointUIDs = 0;

  objc_sync_exit(obj);
}

uint64_t __101__MRNowPlayingOriginClientManager_handleActiveSystemEndpointOutputDeviceUIDForType_queue_completion___block_invoke_40(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __101__MRNowPlayingOriginClientManager_handleActiveSystemEndpointOutputDeviceUIDForType_queue_completion___block_invoke_43(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 72));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    _MRLogForCategory(0xAuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v11 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138544130;
      v23 = v9;
      v24 = 2114;
      v25 = v10;
      v26 = 2112;
      v27 = CFSTR("request completed however response is already stale");
      v28 = 2112;
      v29 = v11;
      _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "Cache Miss: Request: %{public}@<%{public}@> for %@ %@", buf, 0x2Au);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "updateActiveSystemEndpointOutputDeviceUID:forType:", v3, *(_QWORD *)(a1 + 72));
  }
  objc_msgSend(*(id *)(a1 + 32), "activeSystemEndpointOutputDeviceUIDForType:", *(_QWORD *)(a1 + 72));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v13 = *(id *)(a1 + 64);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v13);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16) + 16))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16));
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

  objc_msgSend(*(id *)(a1 + 64), "removeAllObjects", (_QWORD)v17);
  objc_sync_exit(v4);

}

uint64_t __96__MRNowPlayingOriginClientManager_resolveActiveSystemEndpointWithType_timeout_queue_completion___block_invoke_51(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __131__MRNowPlayingOriginClientManager__resolveActiveSystemEndpointWithType_requestName_requestType_requestID_timeout_queue_completion___block_invoke_61(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  int v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[6];
  _QWORD v53[5];
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  void *v61;
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  const __CFString *v67;
  __int16 v68;
  uint64_t v69;
  _QWORD v70[4];

  v70[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__48;
  v59 = __Block_byref_object_dispose__48;
  v8 = v5;
  v60 = v8;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = __Block_byref_object_copy__48;
  v53[4] = __Block_byref_object_dispose__48;
  v9 = v6;
  v54 = v9;
  v10 = *(id *)(a1 + 40);
  objc_sync_enter(v10);
  objc_msgSend(*(id *)(a1 + 48), "objectForKey:", *(_QWORD *)(a1 + 56));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v8)
  {
    if (*(_QWORD *)(a1 + 104) != 5
      || (objc_msgSend(v8, "groupSessionInfo"), (v13 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
      || (v14 = objc_msgSend(v8, "isLocalEndpoint"), v13, (v14 & 1) != 0))
    {
      objc_msgSend(*(id *)(a1 + 40), "activeSystemEndpointOutputDeviceUIDForType:", *(_QWORD *)(a1 + 112));
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (*(_QWORD *)(a1 + 104) == 4)
      {
        +[MRGroupSessionRequestManager sharedManager](MRGroupSessionRequestManager, "sharedManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "groupSessionInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          if ((objc_msgSend(v18, "isHosted") & 1) != 0)
          {
            v19 = 0;
          }
          else
          {
            objc_msgSend(v18, "effectiveIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
          }

        }
        else
        {
          v19 = v16;
        }

      }
      else
      {
        v19 = (void *)v15;
      }
      v31 = *(void **)(a1 + 72);
      v32 = v19;
      v33 = v31;
      if (v32 == v33)
      {

      }
      else
      {
        v34 = v33;
        v35 = objc_msgSend(v32, "isEqual:", v33);

        if (!v35)
        {
          if (v12)
          {
            if (*(_QWORD *)(a1 + 104) == 4)
            {
              _MRLogForCategory(0);
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
                __131__MRNowPlayingOriginClientManager__resolveActiveSystemEndpointWithType_requestName_requestType_requestID_timeout_queue_completion___block_invoke_61_cold_1((uint64_t)v32, v36);

              _MRLogForCategory(0xAuLL);
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                v39 = *(_QWORD *)(a1 + 56);
                v38 = *(_QWORD *)(a1 + 64);
                *(_DWORD *)buf = 138543874;
                v63 = v38;
                v64 = 2114;
                v65 = v39;
                v66 = 2112;
                v67 = CFSTR("Failed to find endpoint for group session. Return local.");
                _os_log_impl(&dword_193827000, v37, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
              }

              v40 = (void *)MEMORY[0x194036C44](v12);
              v70[0] = v40;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 1);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              +[MRAVLocalEndpoint sharedLocalEndpoint](MRAVLocalEndpoint, "sharedLocalEndpoint");
              v41 = objc_claimAutoreleasedReturnValue();
              v42 = (void *)v56[5];
              v56[5] = v41;

              objc_msgSend(*(id *)(a1 + 48), "removeObjectForKey:", *(_QWORD *)(a1 + 56));
              MRAVEndpointUpdateActiveSystemEndpointWithReason(0, 1, (uint64_t)CFSTR("Failed to resolve group session endpoint"), 0, 0);
              goto LABEL_40;
            }
            _MRLogForCategory(0xAuLL);
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              v50 = *(_QWORD *)(a1 + 56);
              v49 = *(_QWORD *)(a1 + 64);
              v51 = *(_QWORD *)(a1 + 80);
              *(_DWORD *)buf = 138544130;
              v63 = v49;
              v64 = 2114;
              v65 = v50;
              v66 = 2112;
              v67 = CFSTR("response is already stale");
              v68 = 2112;
              v69 = v51;
              _os_log_impl(&dword_193827000, v48, OS_LOG_TYPE_DEFAULT, "Cache Miss: Request: %{public}@<%{public}@> for %@ %@", buf, 0x2Au);
            }

            -[MRNowPlayingOriginClientManager _resolveActiveSystemEndpointWithType:requestName:requestType:requestID:timeout:queue:completion:](*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(double *)(a1 + 120));
          }
          else
          {
            _MRLogForCategory(0xAuLL);
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              v46 = *(_QWORD *)(a1 + 56);
              v45 = *(_QWORD *)(a1 + 64);
              v47 = *(_QWORD *)(a1 + 80);
              *(_DWORD *)buf = 138544130;
              v63 = v45;
              v64 = 2114;
              v65 = v46;
              v66 = 2112;
              v67 = CFSTR("resolve completed however previous response already fulfilled request (informational only, not further action required)");
              v68 = 2112;
              v69 = v47;
              _os_log_impl(&dword_193827000, v44, OS_LOG_TYPE_DEFAULT, "Cache Miss: Request: %{public}@<%{public}@> for %@ %@", buf, 0x2Au);
            }

          }
          v24 = 0;
LABEL_40:

          goto LABEL_41;
        }
      }
      objc_msgSend(*(id *)(a1 + 48), "allValues");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v43, "copy");

      objc_msgSend(*(id *)(a1 + 48), "removeAllObjects");
      goto LABEL_40;
    }
    _MRLogForCategory(0xAuLL);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v27 = *(_QWORD *)(a1 + 56);
      v26 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138543874;
      v63 = v26;
      v64 = 2114;
      v65 = v27;
      v66 = 2112;
      v67 = CFSTR("ASE is remote GroupSession, will override with local for unsupported client.");
      _os_log_impl(&dword_193827000, v25, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    +[MRAVLocalEndpoint sharedLocalEndpoint](MRAVLocalEndpoint, "sharedLocalEndpoint");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v56[5];
    v56[5] = v28;

    objc_msgSend(*(id *)(a1 + 48), "allValues");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v30, "copy");

    objc_msgSend(*(id *)(a1 + 48), "removeAllObjects");
  }
  else if (v11)
  {
    if (objc_msgSend(*(id *)(a1 + 48), "count") == 1)
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Could not discover %@ for ResolveActiveEndpoint<%@> in <%lf> seconds"), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 120));
      -[MRNowPlayingOriginClientManager _clearSystemEndpointForType:reason:queue:](*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 104), v20, *(void **)(a1 + 88));

    }
    +[MRAVLocalEndpoint sharedLocalEndpoint](MRAVLocalEndpoint, "sharedLocalEndpoint");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v56[5];
    v56[5] = v21;

    v23 = (void *)MEMORY[0x194036C44](v12);
    v61 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "removeObjectForKey:", *(_QWORD *)(a1 + 56));
  }
  else
  {
    v24 = 0;
  }
LABEL_41:

  objc_sync_exit(v10);
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __131__MRNowPlayingOriginClientManager__resolveActiveSystemEndpointWithType_requestName_requestType_requestID_timeout_queue_completion___block_invoke_76;
  v52[3] = &unk_1E30CF9F8;
  v52[4] = &v55;
  v52[5] = v53;
  objc_msgSend(v24, "enumerateObjectsUsingBlock:", v52);
  _Block_object_dispose(v53, 8);

  _Block_object_dispose(&v55, 8);
}

- (void)_clearSystemEndpointForType:(void *)a3 reason:(void *)a4 queue:
{
  unint64_t v5;
  id v6;
  id v7;
  MRUpdateActiveSystemEndpointRequest *v8;

  if (a1)
  {
    v5 = a2;
    if (a2 <= 3)
      v5 = qword_193ADA970[a2];
    v6 = a4;
    v7 = a3;
    v8 = -[MRUpdateActiveSystemEndpointRequest initWithOutputDeviceUID:type:reason:]([MRUpdateActiveSystemEndpointRequest alloc], "initWithOutputDeviceUID:type:reason:", 0, v5, v7);

    -[MRUpdateActiveSystemEndpointRequest setChangeType:](v8, "setChangeType:", 1);
    -[MRUpdateActiveSystemEndpointRequest perform:completion:](v8, "perform:completion:", v6, 0);

  }
}

uint64_t __131__MRNowPlayingOriginClientManager__resolveActiveSystemEndpointWithType_requestName_requestType_requestID_timeout_queue_completion___block_invoke_76(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (NSArray)originClientRequets
{
  return self->_originClientRequets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originClientRequets, 0);
  objc_storeStrong((id *)&self->_resolveActiveSystemEndpointCompletions, 0);
  objc_storeStrong((id *)&self->_activeSystemEndpointUIDCompletions, 0);
  objc_storeStrong((id *)&self->_activeSystemEndpointUIDs, 0);
  objc_storeStrong(&self->_generatePlayerIDCallback, 0);
  objc_storeStrong(&self->_destroyPlayerCallback, 0);
  objc_storeStrong(&self->_createPlayerCallback, 0);
  objc_storeStrong((id *)&self->_originClientRequests, 0);
  objc_storeStrong((id *)&self->_originClients, 0);
}

void __101__MRNowPlayingOriginClientManager_handleActiveSystemEndpointOutputDeviceUIDForType_queue_completion___block_invoke_cold_1(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_193827000, v3, v4, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0();
}

void __131__MRNowPlayingOriginClientManager__resolveActiveSystemEndpointWithType_requestName_requestType_requestID_timeout_queue_completion___block_invoke_61_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_193827000, a2, OS_LOG_TYPE_FAULT, "[MRNowPlayingOriginClientManager] Could not find endpoint for %@.", (uint8_t *)&v2, 0xCu);
}

@end
