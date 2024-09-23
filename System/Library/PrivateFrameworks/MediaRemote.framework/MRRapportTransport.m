@implementation MRRapportTransport

- (MRRapportTransport)initWithOutputDevice:(id)a3
{
  return -[MRRapportTransport initWithOutputDevice:proxyOutputDevice:](self, "initWithOutputDevice:proxyOutputDevice:", a3, a3);
}

- (MRRapportTransport)initWithOutputDevice:(id)a3 proxyOutputDevice:(id)a4
{
  id v7;
  id v8;
  MRRapportTransport *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *workerQueue;
  uint64_t v14;
  MRCompanionLinkClient *client;
  MRCompanionLinkClient *v16;
  uint64_t v17;
  id resetToken;
  _QWORD v20[4];
  id v21;
  objc_super v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)MRRapportTransport;
  v9 = -[MRRapportTransport init](&v22, sel_init);
  if (v9)
  {
    MRLogCategoryConnections();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v7;
      _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, "[MRRapportTransport] Create for %@", buf, 0xCu);
    }

    objc_storeStrong((id *)&v9->_outputDevice, a3);
    objc_storeStrong((id *)&v9->_proxyOutputDevice, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.mediaremote.externalDeviceRapportTransport/workerQueue", v11);
    workerQueue = v9->_workerQueue;
    v9->_workerQueue = (OS_dispatch_queue *)v12;

    +[MRCompanionLinkClient sharedCompanionLinkClient](MRCompanionLinkClient, "sharedCompanionLinkClient");
    v14 = objc_claimAutoreleasedReturnValue();
    client = v9->_client;
    v9->_client = (MRCompanionLinkClient *)v14;

    objc_initWeak((id *)buf, v9);
    v16 = v9->_client;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __61__MRRapportTransport_initWithOutputDevice_proxyOutputDevice___block_invoke;
    v20[3] = &unk_1E30C5EF0;
    objc_copyWeak(&v21, (id *)buf);
    -[MRCompanionLinkClient registerEvent:callback:](v16, "registerEvent:callback:", CFSTR("com.apple.mediaremote.remotecontrol.reset"), v20);
    v17 = objc_claimAutoreleasedReturnValue();
    resetToken = v9->_resetToken;
    v9->_resetToken = (id)v17;

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }

  return v9;
}

void __61__MRRapportTransport_initWithOutputDevice_proxyOutputDevice___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *WeakRetained;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D839C0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[15], "effectiveIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 105, CFSTR("MRRapportTransport received reset event"));
      objc_msgSend(WeakRetained, "resetWithError:", v8);

    }
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 104, CFSTR("MRRapportTransport.dealloc"));
  -[MRRapportTransport resetWithError:](self, "resetWithError:", v3);
  +[MRCompanionLinkClient sharedCompanionLinkClient](MRCompanionLinkClient, "sharedCompanionLinkClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeCallback:", self->_resetToken);

  v5.receiver = self;
  v5.super_class = (Class)MRRapportTransport;
  -[MRRapportTransport dealloc](&v5, sel_dealloc);
}

+ (NSUserDefaults)userDefaults
{
  if (userDefaults_onceToken != -1)
    dispatch_once(&userDefaults_onceToken, &__block_literal_global_5);
  return (NSUserDefaults *)(id)userDefaults___userDefaults;
}

void __34__MRRapportTransport_userDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mediaremote"));
  v1 = (void *)userDefaults___userDefaults;
  userDefaults___userDefaults = v0;

}

- (id)deviceInfo
{
  MRDeviceInfo *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MRDeviceInfo);
  -[MRAVOutputDevice name](self->_outputDevice, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDeviceInfo setName:](v3, "setName:", v4);

  -[MRAVOutputDevice primaryID](self->_outputDevice, "primaryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDeviceInfo setDeviceUID:](v3, "setDeviceUID:", v5);

  return v3;
}

- (id)uid
{
  void *v2;
  void *v3;

  -[MRRapportTransport deviceInfo](self, "deviceInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)name
{
  void *v2;
  void *v3;

  -[MRRapportTransport deviceInfo](self, "deviceInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hostname
{
  return 0;
}

- (int64_t)port
{
  return 0;
}

- (BOOL)shouldUseSystemAuthenticationPrompt
{
  return 0;
}

- (void)setError:(id)a3
{
  NSError *v4;
  NSError *error;
  MRRapportTransport *obj;

  v4 = (NSError *)a3;
  obj = self;
  objc_sync_enter(obj);
  error = obj->_error;
  obj->_error = v4;

  objc_sync_exit(obj);
}

- (id)error
{
  MRRapportTransport *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSError copy](v2->_error, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (id)createConnectionWithUserInfo:(id)a3
{
  NSObject *workerQueue;
  _QWORD block[5];

  workerQueue = self->_workerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MRRapportTransport_createConnectionWithUserInfo___block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_sync(workerQueue, block);
  return self->_connection;
}

void __51__MRRapportTransport_createConnectionWithUserInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  MRRapportTransportConnection *v4;
  void *v5;
  id *v6;
  MRRapportTransportConnection *v7;
  id v8;
  id v9;
  dispatch_semaphore_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  dispatch_time_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, int, id);
  void *v26;
  NSObject *v27;
  uint64_t *v28;
  id obj;
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  objc_msgSend(*(id *)(a1 + 32), "sessionUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_generateSessionUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__0;
    v35 = __Block_byref_object_dispose__0;
    v36 = 0;
    v4 = [MRRapportTransportConnection alloc];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "primaryID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id *)(v32 + 5);
    obj = (id)v32[5];
    v30 = 0;
    v7 = -[MRRapportTransportConnection initWithDeviceUID:sessionUID:targetDevice:error:](v4, "initWithDeviceUID:sessionUID:targetDevice:error:", v5, v3, &v30, &obj);
    v8 = v30;
    v9 = v30;
    objc_storeStrong(v6, obj);

    if (v7)
    {
      v10 = dispatch_semaphore_create(0);
      v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v3, CFSTR("session"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "primaryID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("destination"));

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "groupID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("destinationGroupUID"));

      v14 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
      objc_msgSend(v9, "effectiveIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = __51__MRRapportTransport_createConnectionWithUserInfo___block_invoke_30;
      v26 = &unk_1E30C5F18;
      v28 = &v31;
      v16 = v10;
      v27 = v16;
      objc_msgSend(v14, "sendRequest:destination:userInfo:timeout:response:", CFSTR("com.apple.mediaremote.remotecontrol.connect"), v15, v11, &v23, 7.0);

      v17 = dispatch_time(0, 8000000000);
      if (dispatch_semaphore_wait(v16, v17) >= 1)
      {
        v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
        objc_msgSend(*(id *)(a1 + 32), "uid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "initWithMRError:format:", 26, CFSTR("Failed to receive request from companionLinkDevice for %@ in %d seconds"), v19, 7, v23, v24, v25, v26);
        v21 = (void *)v32[5];
        v32[5] = v20;

      }
    }
    v22 = *(id **)(a1 + 32);
    if (v32[5])
    {
      objc_msgSend(v22, "setError:");
    }
    else
    {
      objc_storeStrong(v22 + 14, v7);
      objc_msgSend(*(id *)(a1 + 32), "setSessionUID:", v3);
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 120), v8);
      objc_msgSend(*(id *)(a1 + 32), "_persistConnectionRecordToDisk");
    }

    _Block_object_dispose(&v31, 8);
  }
}

void __51__MRRapportTransport_createConnectionWithUserInfo___block_invoke_30(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)resetWithError:(id)a3
{
  id v4;
  MRCompanionLinkClient *client;
  void *v6;
  MRExternalDeviceTransportConnection *connection;
  id v8;

  v8 = a3;
  if (self->_sessionUID)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_sessionUID, CFSTR("session"));
    client = self->_client;
    -[RPCompanionLinkDevice effectiveIdentifier](self->_targetDevice, "effectiveIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRCompanionLinkClient sendEvent:destination:userInfo:](client, "sendEvent:destination:userInfo:", CFSTR("com.apple.mediaremote.remotecontrol.disconnect"), v6, v4);

  }
  -[MRRapportTransport setSessionUID:](self, "setSessionUID:", 0);
  -[MRRapportTransport _removeConnectionRecordFromDisk](self, "_removeConnectionRecordFromDisk");
  -[MRExternalDeviceTransportConnection closeWithError:](self->_connection, "closeWithError:", v8);
  connection = self->_connection;
  self->_connection = 0;

}

- (void)setSessionUID:(id)a3
{
  id v5;
  MRRapportTransport *v6;
  id disconnectToken;
  MRCompanionLinkClient *client;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  if (v6->_disconnectToken)
  {
    -[MRCompanionLinkClient removeCallback:](v6->_client, "removeCallback:");
    disconnectToken = v6->_disconnectToken;
    v6->_disconnectToken = 0;

  }
  objc_storeStrong((id *)&v6->_sessionUID, a3);
  if (v6->_sessionUID)
  {
    objc_initWeak(&location, v6);
    client = v6->_client;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __36__MRRapportTransport_setSessionUID___block_invoke;
    v11[3] = &unk_1E30C5EF0;
    objc_copyWeak(&v12, &location);
    -[MRCompanionLinkClient registerEvent:callback:](client, "registerEvent:callback:", CFSTR("com.apple.mediaremote.remotecontrol.disconnect"), v11);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v6->_disconnectToken;
    v6->_disconnectToken = (id)v9;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v6);

}

void __36__MRRapportTransport_setSessionUID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *WeakRetained;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D839C0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[15], "effectiveIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if (v7)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("session"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", WeakRetained[13]))
      {
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 105, CFSTR("MRRapportTransport received disconect event"));
        objc_msgSend(WeakRetained, "resetWithError:", v9);

      }
    }
  }

}

+ (void)resetPersistedConnections
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "userDefaults");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  objc_msgSend((id)objc_opt_class(), "_readConnectionRecordsFromDisk");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v8, "deviceUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v8, "deviceUID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v5);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v3;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j);
        +[MRCompanionLinkClient sharedCompanionLinkClient](MRCompanionLinkClient, "sharedCompanionLinkClient");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "sendEvent:destination:userInfo:", CFSTR("com.apple.mediaremote.remotecontrol.reset"), v15, 0);

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v12);
  }

  objc_msgSend((id)objc_opt_class(), "_writeConnectionRecordsToDisk:", 0);
  objc_sync_exit(obj);

}

- (void)_persistConnectionRecordToDisk
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  MRRapportTransportConfiguration *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[MRRapportTransport targetDevice](self, "targetDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectiveIdentifier");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend((id)objc_opt_class(), "userDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v4);
    objc_msgSend((id)objc_opt_class(), "_readConnectionRecordsFromDisk");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      v7 = (id)objc_msgSend(v5, "mutableCopy");
    else
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = v7;
    v9 = objc_alloc_init(MRRapportTransportConfiguration);
    -[MRRapportTransport sessionUID](self, "sessionUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRRapportTransportConfiguration setSessionUID:](v9, "setSessionUID:", v10);

    -[MRRapportTransportConfiguration setDeviceUID:](v9, "setDeviceUID:", v13);
    -[MRRapportTransport targetDevice](self, "targetDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRRapportTransportConfiguration setName:](v9, "setName:", v12);

    objc_msgSend(v8, "addObject:", v9);
    objc_msgSend((id)objc_opt_class(), "_writeConnectionRecordsToDisk:", v8);

    objc_sync_exit(v4);
  }

}

- (void)_removeConnectionRecordFromDisk
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "userDefaults");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  objc_msgSend((id)objc_opt_class(), "_readConnectionRecordsFromDisk");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "sessionUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRRapportTransport sessionUID](self, "sessionUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if (v12)
          objc_msgSend(v4, "removeObject:", v9);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_msgSend((id)objc_opt_class(), "_writeConnectionRecordsToDisk:", v4);
  objc_sync_exit(obj);

}

+ (id)_readConnectionRecordsFromDisk
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("outgoingRapportConnections"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);
  MRCreateFromData(v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)_writeConnectionRecordsToDisk:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v3 = objc_msgSend(v10, "count");
  objc_msgSend((id)objc_opt_class(), "userDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    MRCreateDataFromObject(v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("outgoingRapportConnections"));

    if (MSVDeviceOSIsInternalInstall())
    {
      objc_msgSend((id)objc_opt_class(), "userDefaults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("outgoingRapportConnectionsDescription"));

LABEL_6:
    }
  }
  else
  {
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("outgoingRapportConnections"));

    if (MSVDeviceOSIsInternalInstall())
    {
      objc_msgSend((id)objc_opt_class(), "userDefaults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectForKey:", CFSTR("outgoingRapportConnectionsDescription"));
      goto LABEL_6;
    }
  }
  objc_msgSend((id)objc_opt_class(), "userDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "synchronize");

}

- (id)_generateSessionUID
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("%@-%d"), v4, ++_generateSessionUID_sessionUID);

  return v5;
}

- (NSString)sessionUID
{
  return self->_sessionUID;
}

- (MRExternalDeviceTransportConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (RPCompanionLinkDevice)targetDevice
{
  return self->_targetDevice;
}

- (void)setTargetDevice:(id)a3
{
  objc_storeStrong((id *)&self->_targetDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDevice, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_sessionUID, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong(&self->_disconnectToken, 0);
  objc_storeStrong(&self->_resetToken, 0);
  objc_storeStrong((id *)&self->_proxyOutputDevice, 0);
  objc_storeStrong((id *)&self->_outputDevice, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
