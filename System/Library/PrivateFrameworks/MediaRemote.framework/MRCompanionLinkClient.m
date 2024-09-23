@implementation MRCompanionLinkClient

+ (id)sharedCompanionLinkClient
{
  if (sharedCompanionLinkClient_onceToken != -1)
    dispatch_once(&sharedCompanionLinkClient_onceToken, &__block_literal_global_18);
  return (id)sharedCompanionLinkClient___connection;
}

void __50__MRCompanionLinkClient_sharedCompanionLinkClient__block_invoke()
{
  MRCompanionLinkClient *v0;
  void *v1;

  v0 = -[MRCompanionLinkClient initWithOptions:]([MRCompanionLinkClient alloc], "initWithOptions:", 0);
  v1 = (void *)sharedCompanionLinkClient___connection;
  sharedCompanionLinkClient___connection = (uint64_t)v0;

}

+ (id)sharedIDSCompanionLinkClient
{
  if (sharedIDSCompanionLinkClient_onceToken != -1)
    dispatch_once(&sharedIDSCompanionLinkClient_onceToken, &__block_literal_global_68);
  return 0;
}

+ (void)rapportCompanionLinkClient:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  dispatch_queue_t v6;
  MRBlockGuard *v7;
  id v8;
  id v9;
  MRBlockGuard *v10;
  _QWORD v11[4];
  MRBlockGuard *v12;
  id v13;
  id v14;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D83900]);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create("com.apple.mediaremote.companionLinkClient", v5);
  objc_msgSend(v4, "setDispatchQueue:", v6);

  objc_msgSend(v4, "setInvalidationHandler:", &__block_literal_global_71);
  objc_msgSend(v4, "setInterruptionHandler:", &__block_literal_global_73);
  v7 = -[MRBlockGuard initWithTimeout:reason:handler:]([MRBlockGuard alloc], "initWithTimeout:reason:handler:", CFSTR("CompanionLinkClient:activate"), &__block_literal_global_79_0, 30.0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_80;
  v11[3] = &unk_1E30C71C0;
  v13 = v4;
  v14 = v3;
  v12 = v7;
  v8 = v4;
  v9 = v3;
  v10 = v7;
  objc_msgSend(v8, "activateWithCompletion:", v11);

}

void __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  _MRLogForCategory(7uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_72()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  _MRLogForCategory(7uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_72_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_77(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  _MRLogForCategory(7uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_77_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_80(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[16];

  v3 = a2;
  objc_msgSend(a1[4], "disarm");
  _MRLogForCategory(7uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_80_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[CompanionLinkClient] CompanionLinkClient activated", buf, 2u);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_81;
  v12[3] = &unk_1E30C6568;
  v14 = a1[6];
  v13 = a1[5];
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

uint64_t __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_81(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (MRCompanionLinkClient)initWithOptions:(int)a3
{
  MRCompanionLinkClient *v3;
  MRCompanionLinkClient *v4;
  _QWORD v6[4];
  MRCompanionLinkClient *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MRCompanionLinkClient;
  v3 = -[MRCompanionLinkClient init](&v8, sel_init, *(_QWORD *)&a3);
  v4 = v3;
  if (v3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__MRCompanionLinkClient_initWithOptions___block_invoke;
    v6[3] = &unk_1E30C71E8;
    v7 = v3;
    +[MRCompanionLinkClient rapportCompanionLinkClient:](MRCompanionLinkClient, "rapportCompanionLinkClient:", v6);

  }
  return v4;
}

uint64_t __41__MRCompanionLinkClient_initWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setConnection:", a2);
}

- (void)setConnection:(id)a3
{
  MRCompanionLinkClient *v5;
  NSObject *v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  NSMutableSet *pendingRegisteredEvents;
  NSMutableSet *pendingRegisteredRequests;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSMutableArray *pendingEvents;
  NSMutableArray *pendingRequests;
  id v38;
  NSMutableArray *obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint8_t v59[128];
  uint8_t buf[4];
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v5 = self;
  objc_sync_enter(v5);
  _MRLogForCategory(7uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v61 = v38;
    _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "[CompanionLinkClient] Setting Connection %@", buf, 0xCu);
  }

  objc_storeStrong((id *)&v5->_connection, a3);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v7 = v5->_pendingRegisteredEvents;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v53 != v9)
          objc_enumerationMutation(v7);
        -[MRCompanionLinkClient _registerEvent:](v5, "_registerEvent:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i), v38);
      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    }
    while (v8);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v11 = v5->_pendingRegisteredRequests;
  v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v49 != v13)
          objc_enumerationMutation(v11);
        -[MRCompanionLinkClient _registerRequest:](v5, "_registerRequest:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j), v38);
      }
      v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
    }
    while (v12);
  }

  pendingRegisteredEvents = v5->_pendingRegisteredEvents;
  v5->_pendingRegisteredEvents = 0;

  pendingRegisteredRequests = v5->_pendingRegisteredRequests;
  v5->_pendingRegisteredRequests = 0;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v17 = v5->_pendingEvents;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v45;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v45 != v19)
          objc_enumerationMutation(v17);
        v21 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * k);
        objc_msgSend(v21, "eventID", v38);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "userInfo");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "destination");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "uid");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRCompanionLinkClient _sendEvent:userInfo:destination:uid:](v5, "_sendEvent:userInfo:destination:uid:", v22, v23, v24, v25);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
    }
    while (v18);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v5->_pendingRequests;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v41;
    do
    {
      for (m = 0; m != v26; ++m)
      {
        if (*(_QWORD *)v41 != v27)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * m);
        objc_msgSend(v29, "eventID", v38);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "userInfo");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "destination");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "uid");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "date");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "callback");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRCompanionLinkClient _sendRequest:userInfo:destination:uid:date:response:](v5, "_sendRequest:userInfo:destination:uid:date:response:", v30, v31, v32, v33, v34, v35);

      }
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
    }
    while (v26);
  }

  pendingEvents = v5->_pendingEvents;
  v5->_pendingEvents = 0;

  pendingRequests = v5->_pendingRequests;
  v5->_pendingRequests = 0;

  objc_sync_exit(v5);
}

- (id)deviceUIDForRapportUID:(id)a3
{
  id v4;
  MRCompanionLinkClient *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[RPCompanionLinkClient activeDevices](v5->_connection, "activeDevices", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (!v7)
  {
    v19 = 0;
    goto LABEL_23;
  }
  v8 = *(_QWORD *)v27;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v27 != v8)
        objc_enumerationMutation(v6);
      v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      objc_msgSend(v10, "effectiveIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v4);

      if (v12)
      {
        objc_msgSend(v10, "mediaRouteIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        _MRLogForCategory(7uLL);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v10, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v31 = v4;
          v32 = 2114;
          v33 = v19;
          v34 = 2114;
          v35 = v21;
          _os_log_debug_impl(&dword_193827000, v20, OS_LOG_TYPE_DEBUG, "[CompanionLinkClient] Mapped inputUID <%{public}@> to effectiveIdentifier <%{public}@> <(%{public}@)>", buf, 0x20u);

        }
        goto LABEL_22;
      }
      objc_msgSend(v10, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", v4);

      if (v14)
      {
        objc_msgSend(v10, "mediaRouteIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        _MRLogForCategory(7uLL);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v10, "name");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v31 = v4;
          v32 = 2114;
          v33 = v19;
          v34 = 2114;
          v35 = v22;
          _os_log_debug_impl(&dword_193827000, v20, OS_LOG_TYPE_DEBUG, "[CompanionLinkClient] Mapped inputUID <%{public}@> to identifier <%{public}@> <(%{public}@)>", buf, 0x20u);

        }
        goto LABEL_22;
      }
      objc_msgSend(v10, "mediaRouteIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", v4);

      if (v16)
      {
        objc_msgSend(v10, "mediaRouteIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        _MRLogForCategory(7uLL);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v10, "name");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v31 = v4;
          v32 = 2114;
          v33 = v19;
          v34 = 2114;
          v35 = v23;
          _os_log_debug_impl(&dword_193827000, v20, OS_LOG_TYPE_DEBUG, "[CompanionLinkClient] Mapped inputUID <%{public}@> to mediaRouteIdentifier <%{public}@> <(%{public}@)>", buf, 0x20u);

        }
        goto LABEL_22;
      }
      objc_msgSend(v10, "mediaRemoteIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", v4);

      if (v18)
      {
        objc_msgSend(v10, "mediaRouteIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        _MRLogForCategory(7uLL);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v10, "name");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v31 = v4;
          v32 = 2114;
          v33 = v19;
          v34 = 2114;
          v35 = v25;
          _os_log_debug_impl(&dword_193827000, v20, OS_LOG_TYPE_DEBUG, "[CompanionLinkClient] Mapped inputUID <%{public}@> to mediaRemoteIdentifier <%{public}@> <(%{public}@)>", buf, 0x20u);

        }
LABEL_22:

        goto LABEL_23;
      }
    }
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    v19 = 0;
    if (v7)
      continue;
    break;
  }
LABEL_23:

  objc_sync_exit(v5);
  return v19;
}

- (id)rapportUIDForDeviceUID:(id)a3
{
  id v4;
  MRCompanionLinkClient *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[RPCompanionLinkClient activeDevices](v5->_connection, "activeDevices", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (!v7)
  {
    v19 = 0;
    goto LABEL_23;
  }
  v8 = *(_QWORD *)v27;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v27 != v8)
        objc_enumerationMutation(v6);
      v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      objc_msgSend(v10, "mediaRouteIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v4);

      if (v12)
      {
        objc_msgSend(v10, "effectiveIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        _MRLogForCategory(7uLL);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v10, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v31 = v4;
          v32 = 2114;
          v33 = v19;
          v34 = 2114;
          v35 = v21;
          _os_log_debug_impl(&dword_193827000, v20, OS_LOG_TYPE_DEBUG, "[CompanionLinkClient] Mapped deviceUID <%{public}@> to rapportUID <%{public}@> <(%{public}@)>", buf, 0x20u);

        }
        goto LABEL_22;
      }
      objc_msgSend(v10, "effectiveIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", v4);

      if (v14)
      {
        objc_msgSend(v10, "effectiveIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        _MRLogForCategory(7uLL);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v10, "name");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v31 = v4;
          v32 = 2114;
          v33 = v19;
          v34 = 2114;
          v35 = v22;
          _os_log_debug_impl(&dword_193827000, v20, OS_LOG_TYPE_DEBUG, "[CompanionLinkClient] Mapped effectiveIdentifier <%{public}@> to rapportUID <%{public}@> <(%{public}@)>", buf, 0x20u);

        }
        goto LABEL_22;
      }
      objc_msgSend(v10, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", v4);

      if (v16)
      {
        objc_msgSend(v10, "effectiveIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        _MRLogForCategory(7uLL);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v10, "name");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v31 = v4;
          v32 = 2114;
          v33 = v19;
          v34 = 2114;
          v35 = v23;
          _os_log_debug_impl(&dword_193827000, v20, OS_LOG_TYPE_DEBUG, "[CompanionLinkClient] Mapped identifier <%{public}@> to rapportUID <%{public}@> <(%{public}@)>", buf, 0x20u);

        }
        goto LABEL_22;
      }
      objc_msgSend(v10, "mediaRemoteIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", v4);

      if (v18)
      {
        objc_msgSend(v10, "effectiveIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        _MRLogForCategory(7uLL);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v10, "name");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v31 = v4;
          v32 = 2114;
          v33 = v19;
          v34 = 2114;
          v35 = v25;
          _os_log_debug_impl(&dword_193827000, v20, OS_LOG_TYPE_DEBUG, "[CompanionLinkClient] Mapped mediaRemoteIdentifier <%{public}@> to rapportUID <%{public}@> <(%{public}@)>", buf, 0x20u);

        }
LABEL_22:

        goto LABEL_23;
      }
    }
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    v19 = 0;
    if (v7)
      continue;
    break;
  }
LABEL_23:

  objc_sync_exit(v5);
  return v19;
}

- (id)nameForUID:(id)a3
{
  id v4;
  MRCompanionLinkClient *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[RPCompanionLinkClient activeDevices](v5->_connection, "activeDevices", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v10, "mediaRouteIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
          goto LABEL_13;
        objc_msgSend(v10, "effectiveIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v4);

        if ((v14 & 1) != 0)
          goto LABEL_13;
        objc_msgSend(v10, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v4);

        if ((v16 & 1) == 0)
        {
          objc_msgSend(v10, "mediaRemoteIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", v4);

          if ((v18 & 1) == 0)
            continue;
        }
LABEL_13:
        objc_msgSend(v10, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v19 = 0;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v19 = 0;
  }
LABEL_15:

  objc_sync_exit(v5);
  return v19;
}

- (id)registerEvent:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  MRCompanionLinkClient *v8;
  id v9;
  NSMutableDictionary *eventCallbacks;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  NSMutableSet *pendingRegisteredEvents;
  NSMutableSet *v16;
  NSMutableSet *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[NSMutableDictionary objectForKey:](v8->_eventCallbacks, "objectForKey:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    eventCallbacks = v8->_eventCallbacks;
    if (!eventCallbacks)
    {
      v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v12 = v8->_eventCallbacks;
      v8->_eventCallbacks = v11;

      eventCallbacks = v8->_eventCallbacks;
    }
    -[NSMutableDictionary setObject:forKey:](eventCallbacks, "setObject:forKey:", v9, v6);
  }
  v13 = (void *)objc_msgSend(v7, "copy");
  v14 = (void *)MEMORY[0x194036C44]();
  objc_msgSend(v9, "addObject:", v14);

  if (v8->_connection)
  {
    -[MRCompanionLinkClient _registerEvent:](v8, "_registerEvent:", v6);
  }
  else
  {
    pendingRegisteredEvents = v8->_pendingRegisteredEvents;
    if (!pendingRegisteredEvents)
    {
      v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v17 = v8->_pendingRegisteredEvents;
      v8->_pendingRegisteredEvents = v16;

      pendingRegisteredEvents = v8->_pendingRegisteredEvents;
    }
    -[NSMutableSet addObject:](pendingRegisteredEvents, "addObject:", v6);
  }
  v18 = (void *)MEMORY[0x194036C44](v13);

  objc_sync_exit(v8);
  return v18;
}

- (id)registerRequest:(id)a3 callback:(id)a4
{
  id v7;
  id v8;
  MRCompanionLinkClient *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *requestCallbacks;
  NSMutableDictionary *v14;
  NSMutableSet *pendingRegisteredRequests;
  NSMutableSet *v16;
  NSMutableSet *v17;
  void *v18;

  v7 = a3;
  v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  -[NSMutableDictionary objectForKey:](v9->_requestCallbacks, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (!v8)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("MRCompanionLinkClient.m"), 316, CFSTR("Duplicate request handler for %@"), v7);
  }
  else
  {
    if (!v9->_requestCallbacks)
    {
      v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      requestCallbacks = v9->_requestCallbacks;
      v9->_requestCallbacks = v12;

    }
    v10 = (void *)objc_msgSend(v8, "copy");
    v14 = v9->_requestCallbacks;
    v11 = (void *)MEMORY[0x194036C44]();
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v11, v7);
  }

LABEL_8:
  if (v9->_connection)
  {
    -[MRCompanionLinkClient _registerRequest:](v9, "_registerRequest:", v7);
  }
  else
  {
    pendingRegisteredRequests = v9->_pendingRegisteredRequests;
    if (!pendingRegisteredRequests)
    {
      v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v17 = v9->_pendingRegisteredRequests;
      v9->_pendingRegisteredRequests = v16;

      pendingRegisteredRequests = v9->_pendingRegisteredRequests;
    }
    -[NSMutableSet addObject:](pendingRegisteredRequests, "addObject:", v7);
  }
  v18 = (void *)MEMORY[0x194036C44](v10);

  objc_sync_exit(v9);
  return v18;
}

- (void)removeCallback:(id)a3
{
  id v4;
  MRCompanionLinkClient *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableDictionary *requestCallbacks;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, uint64_t, _BYTE *);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[NSMutableDictionary allValues](v5->_eventCallbacks, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x194036C44](v4);
        objc_msgSend(v10, "removeObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);
  }

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  v25 = 0;
  requestCallbacks = v5->_requestCallbacks;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __40__MRCompanionLinkClient_removeCallback___block_invoke;
  v17 = &unk_1E30C7210;
  v13 = v4;
  v18 = v13;
  v19 = &v20;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](requestCallbacks, "enumerateKeysAndObjectsUsingBlock:", &v14);
  if (v21[5])
    -[NSMutableDictionary removeObjectForKey:](v5->_requestCallbacks, "removeObjectForKey:", v14, v15, v16, v17);

  _Block_object_dispose(&v20, 8);
  objc_sync_exit(v5);

}

void __40__MRCompanionLinkClient_removeCallback___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;
  id v9;

  v8 = a2;
  if (*(_QWORD *)(a1 + 32) == a3)
  {
    v9 = v8;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v8 = v9;
    *a4 = 1;
  }

}

- (void)_registerEvent:(id)a3
{
  id v4;
  NSMutableSet *registeredEvents;
  NSMutableSet *v6;
  NSMutableSet *v7;
  RPCompanionLinkClient *connection;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  registeredEvents = self->_registeredEvents;
  if (!registeredEvents)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_registeredEvents;
    self->_registeredEvents = v6;

    registeredEvents = self->_registeredEvents;
  }
  if ((-[NSMutableSet containsObject:](registeredEvents, "containsObject:", v4) & 1) == 0)
  {
    objc_initWeak(&location, self);
    connection = self->_connection;
    -[MRCompanionLinkClient _resolveEventID:](self, "_resolveEventID:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __40__MRCompanionLinkClient__registerEvent___block_invoke;
    v11[3] = &unk_1E30C7238;
    objc_copyWeak(&v13, &location);
    v10 = v4;
    v12 = v10;
    -[RPCompanionLinkClient registerEventID:options:handler:](connection, "registerEventID:options:handler:", v9, 0, v11);

    -[NSMutableSet addObject:](self->_registeredEvents, "addObject:", v10);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __40__MRCompanionLinkClient__registerEvent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleEventID:event:options:", *(_QWORD *)(a1 + 32), v8, v5);

}

- (void)_registerRequest:(id)a3
{
  id v4;
  NSMutableSet *registeredRequests;
  NSMutableSet *v6;
  NSMutableSet *v7;
  RPCompanionLinkClient *connection;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  registeredRequests = self->_registeredRequests;
  if (!registeredRequests)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_registeredRequests;
    self->_registeredRequests = v6;

    registeredRequests = self->_registeredRequests;
  }
  if ((-[NSMutableSet containsObject:](registeredRequests, "containsObject:", v4) & 1) == 0)
  {
    objc_initWeak(&location, self);
    connection = self->_connection;
    -[MRCompanionLinkClient _resolveEventID:](self, "_resolveEventID:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __42__MRCompanionLinkClient__registerRequest___block_invoke;
    v11[3] = &unk_1E30C7288;
    objc_copyWeak(&v13, &location);
    v10 = v4;
    v12 = v10;
    -[RPCompanionLinkClient registerRequestID:options:handler:](connection, "registerRequestID:options:handler:", v9, 0, v11);

    -[NSMutableSet addObject:](self->_registeredRequests, "addObject:", v10);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __42__MRCompanionLinkClient__registerRequest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  uint64_t v11;
  void *Error;
  _QWORD v13[4];
  id v14;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v11 = *(_QWORD *)(a1 + 32);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __42__MRCompanionLinkClient__registerRequest___block_invoke_2;
    v13[3] = &unk_1E30C7260;
    v14 = v9;
    objc_msgSend(WeakRetained, "_handleRequestID:request:options:response:", v11, v7, v8, v13);

  }
  else
  {
    Error = (void *)MRMediaRemoteCreateError(4);
    (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, Error);

  }
}

uint64_t __42__MRCompanionLinkClient__registerRequest___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendEventToHome:(id)a3 userInfo:(id)a4
{
  -[MRCompanionLinkClient sendEvent:destination:userInfo:](self, "sendEvent:destination:userInfo:", a3, *MEMORY[0x1E0D83978], a4);
}

- (void)sendEventToCompanion:(id)a3 userInfo:(id)a4
{
  -[MRCompanionLinkClient sendEvent:destination:userInfo:](self, "sendEvent:destination:userInfo:", a3, *MEMORY[0x1E0D83970], a4);
}

- (void)sendEvent:(id)a3 toDevicesOfHomeUser:(id)a4 userInfo:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  int v19;
  void *v20;
  id obj;
  MRCompanionLinkClient *v22;
  id v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v8 = a4;
  v22 = self;
  v23 = a5;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[RPCompanionLinkClient activeDevices](self->_connection, "activeDevices");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v9)
  {
    v10 = v9;
    v25 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v12, "homeKitUserIdentifiers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v27;
          while (2)
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v27 != v16)
                objc_enumerationMutation(v13);
              objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "UUIDString");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "isEqualToString:", v8);

              if (v19)
              {
                objc_msgSend(v12, "effectiveIdentifier");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                -[MRCompanionLinkClient sendEvent:destination:userInfo:](v22, "sendEvent:destination:userInfo:", v24, v20, v23);

                goto LABEL_16;
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            if (v15)
              continue;
            break;
          }
        }
LABEL_16:

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v10);
  }

}

- (void)sendEvent:(id)a3 destination:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  MRCompanionLinkClient *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = self;
  objc_sync_enter(v13);
  if (v13->_connection)
    -[MRCompanionLinkClient _sendEvent:userInfo:destination:uid:](v13, "_sendEvent:userInfo:destination:uid:", v14, v10, v8, v12);
  else
    -[MRCompanionLinkClient _enqueueEvent:userInfo:destination:uid:](v13, "_enqueueEvent:userInfo:destination:uid:", v14, v10, v8, v12);
  objc_sync_exit(v13);

}

- (void)sendRequest:(id)a3 destination:(id)a4 userInfo:(id)a5 timeout:(double)a6 response:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  MRBlockGuard *v18;
  void *v19;
  uint64_t v20;
  id v21;
  MRBlockGuard *v22;
  NSObject *v23;
  MRBlockGuard *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  MRCompanionLinkClient *v30;
  void *v32;
  _QWORD v33[4];
  MRBlockGuard *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v32 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = [MRBlockGuard alloc];
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@<%@>"), v11, v16);
  v20 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __75__MRCompanionLinkClient_sendRequest_destination_userInfo_timeout_response___block_invoke;
  v39[3] = &unk_1E30C6798;
  v21 = v14;
  v40 = v21;
  v22 = -[MRBlockGuard initWithTimeout:reason:handler:](v18, "initWithTimeout:reason:handler:", v19, v39, a6);

  _MRLogForCategory(7uLL);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v42 = v11;
    v43 = 2114;
    v44 = v16;
    v45 = 2112;
    v46 = v12;
    v47 = 2112;
    v48 = v13;
    _os_log_impl(&dword_193827000, v23, OS_LOG_TYPE_DEFAULT, "[CompanionLinkClient] Request: %{public}@<%{public}@> to destination <%@> with userInfo %@", buf, 0x2Au);
  }

  v33[0] = v20;
  v33[1] = 3221225472;
  v33[2] = __75__MRCompanionLinkClient_sendRequest_destination_userInfo_timeout_response___block_invoke_101;
  v33[3] = &unk_1E30C72B0;
  v24 = v22;
  v34 = v24;
  v25 = v17;
  v35 = v25;
  v26 = v11;
  v36 = v26;
  v27 = v16;
  v37 = v27;
  v28 = v21;
  v38 = v28;
  v29 = (void *)MEMORY[0x194036C44](v33);
  v30 = self;
  objc_sync_enter(v30);
  if (v30->_connection)
    -[MRCompanionLinkClient _sendRequest:userInfo:destination:uid:date:response:](v30, "_sendRequest:userInfo:destination:uid:date:response:", v26, v32, v12, v27, v25, v29);
  else
    -[MRCompanionLinkClient _enqueueRequest:userInfo:destination:uid:date:response:](v30, "_enqueueRequest:userInfo:destination:uid:date:response:", v26, v32, v12, v27, v25, v29);
  objc_sync_exit(v30);

}

uint64_t __75__MRCompanionLinkClient_sendRequest_destination_userInfo_timeout_response___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __75__MRCompanionLinkClient_sendRequest_destination_userInfo_timeout_response___block_invoke_101(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    v9 = v8;

    _MRLogForCategory(7uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = *(_QWORD *)(a1 + 48);
        v13 = *(_QWORD *)(a1 + 56);
        v17 = 138544130;
        v18 = v12;
        v19 = 2114;
        v20 = v13;
        v21 = 2114;
        v22 = v6;
        v23 = 2048;
        v24 = v9;
        _os_log_error_impl(&dword_193827000, v11, OS_LOG_TYPE_ERROR, "[CompanionLinkClient] Response: %{public}@<%{public}@> returned error <%{public}@> in <%lf> seconds", (uint8_t *)&v17, 0x2Au);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 48);
      v15 = *(_QWORD *)(a1 + 56);
      v17 = 138544130;
      v18 = v14;
      v19 = 2114;
      v20 = v15;
      v21 = 2048;
      v22 = v9;
      v23 = 2114;
      v24 = v5;
      _os_log_impl(&dword_193827000, v11, OS_LOG_TYPE_DEFAULT, "[CompanionLinkClient] Response: %{public}@<%{public}@> returned in <%lf> seconds with %{public}@@", (uint8_t *)&v17, 0x2Au);
    }

    v16 = *(_QWORD *)(a1 + 64);
    if (v16)
      (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v5, v6);
  }

}

- (void)_sendEvent:(id)a3 userInfo:(id)a4 destination:(id)a5 uid:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  RPCompanionLinkClient *connection;
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[MROrigin localOrigin](MROrigin, "localOrigin");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRDeviceInfoRequest deviceInfoForOrigin:](MRDeviceInfoRequest, "deviceInfoForOrigin:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "data");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("deviceInfoData"));

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("uid"));
  if (v11)
  {
    MRCreateEncodedUserInfo(v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("userInfoData"));

  }
  _MRLogForCategory(7uLL);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v30 = v10;
    v31 = 2114;
    v32 = v13;
    v33 = 2112;
    v34 = v12;
    v35 = 2112;
    v36 = v11;
    _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, "[CompanionLinkClient] Sending event %{public}@<%{public}@> to destination <%@> with userInfo %@", buf, 0x2Au);
  }

  connection = self->_connection;
  -[MRCompanionLinkClient _resolveEventID:](self, "_resolveEventID:", v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __61__MRCompanionLinkClient__sendEvent_userInfo_destination_uid___block_invoke;
  v25[3] = &unk_1E30C72D8;
  v26 = v10;
  v27 = v13;
  v28 = v12;
  v22 = v12;
  v23 = v13;
  v24 = v10;
  -[RPCompanionLinkClient sendEventID:event:destinationID:options:completion:](connection, "sendEventID:event:destinationID:options:completion:", v21, v14, v22, 0, v25);

}

void __61__MRCompanionLinkClient__sendEvent_userInfo_destination_uid___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _MRLogForCategory(7uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __61__MRCompanionLinkClient__sendEvent_userInfo_destination_uid___block_invoke_cold_1();

  }
}

- (void)_enqueueEvent:(id)a3 userInfo:(id)a4 destination:(id)a5 uid:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSMutableArray *v15;
  NSMutableArray *pendingEvents;
  MRCompanionLinkClientEvent *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  _MRLogForCategory(7uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138544130;
    v19 = v10;
    v20 = 2114;
    v21 = v13;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v11;
    _os_log_impl(&dword_193827000, v14, OS_LOG_TYPE_DEFAULT, "[CompanionLinkClient] Enqueing event %{public}@<%{public}@> to destination <%@> with userInfo %@", (uint8_t *)&v18, 0x2Au);
  }

  if (!self->_pendingEvents)
  {
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingEvents = self->_pendingEvents;
    self->_pendingEvents = v15;

  }
  v17 = objc_alloc_init(MRCompanionLinkClientEvent);
  -[MRCompanionLinkClientEvent setEventID:](v17, "setEventID:", v10);
  -[MRCompanionLinkClientEvent setUserInfo:](v17, "setUserInfo:", v11);
  -[MRCompanionLinkClientEvent setDestination:](v17, "setDestination:", v12);
  -[MRCompanionLinkClientEvent setUid:](v17, "setUid:", v13);
  -[NSMutableArray addObject:](self->_pendingEvents, "addObject:", v17);

}

- (void)_sendRequest:(id)a3 userInfo:(id)a4 destination:(id)a5 uid:(id)a6 date:(id)a7 response:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  RPCompanionLinkClient *connection;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[MROrigin localOrigin](MROrigin, "localOrigin");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRDeviceInfoRequest deviceInfoForOrigin:](MRDeviceInfoRequest, "deviceInfoForOrigin:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "data");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("deviceInfoData"));

  objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, CFSTR("uid"));
  if (v14)
  {
    MRCreateEncodedUserInfo(v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, CFSTR("userInfoData"));

  }
  _MRLogForCategory(7uLL);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v30 = v13;
    v31 = 2114;
    v32 = v16;
    v33 = 2112;
    v34 = v15;
    v35 = 2112;
    v36 = v14;
    _os_log_impl(&dword_193827000, v23, OS_LOG_TYPE_DEFAULT, "[CompanionLinkClient] Sending request %{public}@<%{public}@> to destination <%@> with userInfo %@", buf, 0x2Au);
  }

  connection = self->_connection;
  -[MRCompanionLinkClient _resolveEventID:](self, "_resolveEventID:", v13);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __77__MRCompanionLinkClient__sendRequest_userInfo_destination_uid_date_response___block_invoke;
  v27[3] = &unk_1E30C7300;
  v28 = v17;
  v26 = v17;
  -[RPCompanionLinkClient sendRequestID:request:destinationID:options:responseHandler:](connection, "sendRequestID:request:destinationID:options:responseHandler:", v25, v18, v15, 0, v27);

}

void __77__MRCompanionLinkClient__sendRequest_userInfo_destination_uid_date_response___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a4;
  MRCreateDecodedUserInfo(a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v5 + 16))(v5, v7, v6);

}

- (void)_enqueueRequest:(id)a3 userInfo:(id)a4 destination:(id)a5 uid:(id)a6 date:(id)a7 response:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  NSMutableArray *v21;
  NSMutableArray *pendingRequests;
  MRCompanionLinkClientRequest *v23;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = a7;
  _MRLogForCategory(7uLL);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138544130;
    v25 = v14;
    v26 = 2114;
    v27 = v17;
    v28 = 2112;
    v29 = v16;
    v30 = 2112;
    v31 = v15;
    _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, "[CompanionLinkClient] Enqueing request %{public}@<%{public}@> to destination <%@> with userInfo %@", (uint8_t *)&v24, 0x2Au);
  }

  if (!self->_pendingRequests)
  {
    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingRequests = self->_pendingRequests;
    self->_pendingRequests = v21;

  }
  v23 = objc_alloc_init(MRCompanionLinkClientRequest);
  -[MRCompanionLinkClientEvent setEventID:](v23, "setEventID:", v14);
  -[MRCompanionLinkClientEvent setUserInfo:](v23, "setUserInfo:", v15);
  -[MRCompanionLinkClientEvent setDestination:](v23, "setDestination:", v16);
  -[MRCompanionLinkClientEvent setUid:](v23, "setUid:", v17);
  -[MRCompanionLinkClientRequest setDate:](v23, "setDate:", v19);

  -[MRCompanionLinkClientRequest setCallback:](v23, "setCallback:", v18);
  -[NSMutableArray addObject:](self->_pendingRequests, "addObject:", v23);

}

- (void)_handleEventID:(id)a3 event:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  void *v9;
  MRDeviceInfo *v10;
  void *v11;
  MRDeviceInfo *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  MRCompanionLinkClient *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD block[4];
  id v39;
  MRDeviceInfo *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  id v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v7 = a4;
  v8 = a5;
  v30 = (void *)*MEMORY[0x1E0D839C0];
  v31 = v8;
  objc_msgSend(v8, "objectForKeyedSubscript:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [MRDeviceInfo alloc];
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("deviceInfoData"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MRDeviceInfo initWithData:](v10, "initWithData:", v11);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("userInfoData"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateDecodedUserInfo(v13);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("uid"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDeviceInfo deviceUID](v12, "deviceUID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDeviceInfo name](v12, "name");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  _MRLogForCategory(7uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544898;
    v48 = v37;
    v49 = 2114;
    v50 = v33;
    v51 = 2114;
    v52 = v35;
    v53 = 2114;
    v54 = v34;
    v55 = 2112;
    v56 = v30;
    v57 = 2114;
    v58 = v9;
    v59 = 2112;
    v60 = v36;
    _os_log_impl(&dword_193827000, v14, OS_LOG_TYPE_DEFAULT, "[CompanionLinkClient] Received event %{public}@<%{public}@> from <%{public}@> (%{public}@) with %@ <%{public}@> userInfo %@", buf, 0x48u);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[RPCompanionLinkClient activeDevices](self->_connection, "activeDevices");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v43;
LABEL_5:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v43 != v17)
        objc_enumerationMutation(v15);
      v19 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v18);
      objc_msgSend(v19, "effectiveIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", v9);

      if ((v21 & 1) != 0)
        break;
      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        if (v16)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
    v22 = v19;

    if (!v22)
      goto LABEL_15;
    v23 = self;
    objc_sync_enter(v23);
    -[NSMutableDictionary objectForKey:](v23->_eventCallbacks, "objectForKey:", v37);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");

    objc_sync_exit(v23);
    if (v36)
      v26 = (id)objc_msgSend(v36, "mutableCopy");
    else
      v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v27 = v26;
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v9, v30);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__MRCompanionLinkClient__handleEventID_event_options___block_invoke;
    block[3] = &unk_1E30C7328;
    v39 = v25;
    v40 = v12;
    v41 = v27;
    v28 = v27;
    v29 = v25;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
LABEL_11:

LABEL_15:
    _MRLogForCategory(7uLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544386;
      v48 = v37;
      v49 = 2114;
      v50 = v35;
      v51 = 2114;
      v52 = v34;
      v53 = 2112;
      v54 = v30;
      v55 = 2112;
      v56 = v9;
      _os_log_error_impl(&dword_193827000, v22, OS_LOG_TYPE_ERROR, "[CompanionLinkClient] Received event <%{public}@> from <%{public}@> (%{public}@) with <%@> <%@> but could not find device", buf, 0x34u);
    }
  }

}

void __54__MRCompanionLinkClient__handleEventID_event_options___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)_handleRequestID:(id)a3 request:(id)a4 options:(id)a5 response:(id)a6
{
  id v9;
  id v10;
  void *v11;
  MRDeviceInfo *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  MRCompanionLinkClient *v29;
  void *v30;
  void *v31;
  id v32;
  id Error;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v41;
  MRDeviceInfo *v42;
  id v43;
  _QWORD block[4];
  MRDeviceInfo *v45;
  id v46;
  id v47;
  void (**v48)(_QWORD, _QWORD, _QWORD);
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  id v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v43 = a4;
  v10 = a5;
  v37 = a6;
  v35 = *MEMORY[0x1E0D839C0];
  v36 = v10;
  objc_msgSend(v10, "objectForKeyedSubscript:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [MRDeviceInfo alloc];
  objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("deviceInfoData"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[MRDeviceInfo initWithData:](v12, "initWithData:", v13);

  objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("userInfoData"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateDecodedUserInfo(v14);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("uid"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDeviceInfo deviceUID](v42, "deviceUID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDeviceInfo name](v42, "name");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  _MRLogForCategory(7uLL);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544898;
    v59 = v9;
    v60 = 2114;
    v61 = v15;
    v62 = 2114;
    v63 = v39;
    v64 = 2114;
    v65 = v38;
    v66 = 2112;
    v67 = v35;
    v68 = 2114;
    v69 = v11;
    v70 = 2112;
    v71 = v41;
    _os_log_impl(&dword_193827000, v16, OS_LOG_TYPE_DEFAULT, "[CompanionLinkClient] Received request %{public}@<%{public}@> from <%{public}@> (%{public}@) with %@ <%{public}@> userInfo %@", buf, 0x48u);
  }

  v55 = 0u;
  v56 = 0u;
  v54 = 0u;
  v53 = 0u;
  -[RPCompanionLinkClient activeDevices](self->_connection, "activeDevices");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v54;
    while (2)
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v54 != v19)
          objc_enumerationMutation(v17);
        v21 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v21, "effectiveIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", v11);

        if (v23)
        {
          v18 = v21;
          goto LABEL_13;
        }
      }
      v18 = (id)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      if (v18)
        continue;
      break;
    }
  }
LABEL_13:

  v24 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __67__MRCompanionLinkClient__handleRequestID_request_options_response___block_invoke;
  v49[3] = &unk_1E30C7350;
  v25 = v9;
  v50 = v25;
  v26 = v15;
  v51 = v26;
  v27 = v37;
  v52 = v27;
  v28 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](v49);
  if (v18)
  {
    v29 = self;
    objc_sync_enter(v29);
    -[NSMutableDictionary objectForKey:](v29->_requestCallbacks, "objectForKey:", v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "copy");

    objc_sync_exit(v29);
    if (v31)
    {
      if (v41)
        v32 = (id)objc_msgSend(v41, "mutableCopy");
      else
        v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v34 = v32;
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v11, v35);
      block[0] = v24;
      block[1] = 3221225472;
      block[2] = __67__MRCompanionLinkClient__handleRequestID_request_options_response___block_invoke_108;
      block[3] = &unk_1E30C7378;
      v47 = v31;
      v45 = v42;
      v46 = v34;
      v48 = v28;
      Error = v34;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      Error = (id)MRMediaRemoteCreateError(14);
      ((void (**)(_QWORD, _QWORD, id))v28)[2](v28, 0, Error);
    }

  }
  else
  {
    v31 = (void *)MRMediaRemoteCreateError(4);
    ((void (**)(_QWORD, _QWORD, void *))v28)[2](v28, 0, v31);
  }

}

void __67__MRCompanionLinkClient__handleRequestID_request_options_response___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _MRLogForCategory(7uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __67__MRCompanionLinkClient__handleRequestID_request_options_response___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = a1[4];
    v10 = a1[5];
    v13 = 138543874;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    v17 = 2114;
    v18 = v5;
    _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "[CompanionLinkClient] Responding to request %{public}@<%{public}@> with <%{public}@>", (uint8_t *)&v13, 0x20u);
  }

  v11 = a1[6];
  MRCreateEncodedUserInfo(v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v12, v6);

}

uint64_t __67__MRCompanionLinkClient__handleRequestID_request_options_response___block_invoke_108(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], a1[7]);
}

- (id)_resolveEventID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("com.apple.mediaremote.%@"), v4);

  return v5;
}

- (NSArray)companionLinkDevices
{
  void *v2;
  void *v3;

  -[MRCompanionLinkClient connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (RPCompanionLinkClient)connection
{
  return self->_connection;
}

- (NSMutableDictionary)eventCallbacks
{
  return self->_eventCallbacks;
}

- (void)setEventCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_eventCallbacks, a3);
}

- (NSMutableDictionary)requestCallbacks
{
  return self->_requestCallbacks;
}

- (void)setRequestCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_requestCallbacks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestCallbacks, 0);
  objc_storeStrong((id *)&self->_eventCallbacks, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_registeredRequests, 0);
  objc_storeStrong((id *)&self->_pendingRegisteredRequests, 0);
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_registeredEvents, 0);
  objc_storeStrong((id *)&self->_pendingRegisteredEvents, 0);
}

void __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_193827000, a1, a3, "[CompanionLinkClient] CompanionLinkClient invalidation", a5, a6, a7, a8, 0);
}

void __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_72_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_193827000, a1, a3, "[CompanionLinkClient] CompanionLinkClient interrupted", a5, a6, a7, a8, 0);
}

void __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_77_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_193827000, a2, a3, "[CompanionLinkClient] %@", a5, a6, a7, a8, 2u);
}

void __52__MRCompanionLinkClient_rapportCompanionLinkClient___block_invoke_80_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_193827000, a2, a3, "[CompanionLinkClient] Error activating CompanionLinkClient %{public}@", a5, a6, a7, a8, 2u);
}

void __61__MRCompanionLinkClient__sendEvent_userInfo_destination_uid___block_invoke_cold_1()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t v4[22];
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_0();
  v5 = 2112;
  v6 = v0;
  v7 = v1;
  v8 = v2;
  _os_log_error_impl(&dword_193827000, v3, OS_LOG_TYPE_ERROR, "[CompanionLinkClient] Error sending <%{public}@> <%{public}@> event to <%@> <%{public}@>", v4, 0x2Au);
}

void __67__MRCompanionLinkClient__handleRequestID_request_options_response___block_invoke_cold_1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[22];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_0();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl(&dword_193827000, v2, OS_LOG_TYPE_ERROR, "[CompanionLinkClient] Responding to request %{public}@<%{public}@> with error <%{public}@>", v3, 0x20u);
}

@end
