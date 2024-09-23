@implementation MRNowPlayingOriginClientRequests

void __50__MRNowPlayingOriginClientRequests_setDeviceInfo___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "verboseOriginClientLogging");

  if (v3)
  {
    _MRLogForCategory(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      v10 = 138543618;
      v11 = v6;
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingOriginClientRequests] %{public}@ UpdatingCache: deviceInfo %{public}@", (uint8_t *)&v10, 0x16u);
    }

  }
  v7 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 16);
  *(_QWORD *)(v8 + 16) = v7;

}

- (id)existingNowPlayingClientRequestsForPlayerPath:(id)a3
{
  id v4;
  void *v5;
  NSObject *serialQueue;
  id v7;
  _QWORD block[5];
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
  v15 = __Block_byref_object_copy__18;
  v16 = __Block_byref_object_dispose__18;
  v17 = 0;
  objc_msgSend(v4, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__MRNowPlayingOriginClientRequests_existingNowPlayingClientRequestsForPlayerPath___block_invoke;
    block[3] = &unk_1E30C8C28;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(serialQueue, block);

  }
  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __82__MRNowPlayingOriginClientRequests_existingNowPlayingClientRequestsForPlayerPath___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v7, "client", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "client");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

        if (v10)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

void __46__MRNowPlayingOriginClientRequests_deviceInfo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (MRDeviceInfo)deviceInfo
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__18;
  v8 = __Block_byref_object_dispose__18;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRDeviceInfo *)v2;
}

- (id)nowPlayingClientRequestsForPlayerPath:(id)a3
{
  id v4;
  void *v5;
  NSObject *serialQueue;
  id v7;
  _QWORD block[5];
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
  v15 = __Block_byref_object_copy__18;
  v16 = __Block_byref_object_dispose__18;
  v17 = 0;
  objc_msgSend(v4, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__MRNowPlayingOriginClientRequests_nowPlayingClientRequestsForPlayerPath___block_invoke;
    block[3] = &unk_1E30C8C28;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(serialQueue, block);

  }
  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (MRNowPlayingOriginClientRequests)initWithOrigin:(id)a3
{
  id v5;
  MRNowPlayingOriginClientRequests *v6;
  MRNowPlayingOriginClientRequests *v7;
  MRPlayerPath *v8;
  MRPlayerPath *playerPath;
  objc_class *v10;
  const char *Name;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *serialQueue;
  NSMutableArray *v15;
  NSMutableArray *nowPlayingClients;
  void *v17;
  NSObject *v18;
  void *v19;
  objc_super v21;
  uint8_t buf[4];
  MRNowPlayingOriginClientRequests *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MRNowPlayingOriginClientRequests;
  v6 = -[MRNowPlayingOriginClientRequests init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_origin, a3);
    v8 = -[MRPlayerPath initWithOrigin:client:player:]([MRPlayerPath alloc], "initWithOrigin:client:player:", v5, 0, 0);
    playerPath = v7->_playerPath;
    v7->_playerPath = v8;

    v10 = (objc_class *)objc_opt_class();
    Name = class_getName(v10);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create(Name, v12);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    nowPlayingClients = v7->_nowPlayingClients;
    v7->_nowPlayingClients = v15;

    +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v17, "verboseOriginClientLogging");

    if ((_DWORD)v12)
    {
      _MRLogForCategory(1uLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v23 = v7;
        v24 = 2112;
        v25 = v5;
        v26 = 2112;
        v27 = v19;
        _os_log_impl(&dword_193827000, v18, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingOriginClientRequests] Creating %@ for origin %@ at %@", buf, 0x20u);

      }
    }
  }

  return v7;
}

- (void)handleVolumeRequestWithCompletion:(id)a3
{
  id v5;
  NSObject *serialQueue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingOriginClientRequests.m"), 223, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__MRNowPlayingOriginClientRequests_handleVolumeRequestWithCompletion___block_invoke;
  block[3] = &unk_1E30C5B40;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(serialQueue, block);

}

- (void)handleVolumeCapabilitiesRequestWithCompletion:(id)a3
{
  id v5;
  NSObject *serialQueue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingOriginClientRequests.m"), 255, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__MRNowPlayingOriginClientRequests_handleVolumeCapabilitiesRequestWithCompletion___block_invoke;
  block[3] = &unk_1E30C5B40;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(serialQueue, block);

}

void __74__MRNowPlayingOriginClientRequests_handleDeviceInfoRequestWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v7 + 16))
  {
    objc_msgSend((id)v7, "setDeviceInfo:", v5);
    v7 = *(_QWORD *)(a1 + 32);
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *(id *)(v7 + 56);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeAllObjects", (_QWORD)v13);
}

- (void)setDeviceInfo:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

void __74__MRNowPlayingOriginClientRequests_nowPlayingClientRequestsForPlayerPath___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  MRNowPlayingClientRequests *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v7, "client", (_QWORD)v14);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "client");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

        if (v10)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v7);

          goto LABEL_11;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v11 = -[MRNowPlayingClientRequests initWithPlayerPath:]([MRNowPlayingClientRequests alloc], "initWithPlayerPath:", *(_QWORD *)(a1 + 40));
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }
}

- (void)handleDeviceInfoRequestWithCompletion:(id)a3
{
  id v5;
  NSObject *serialQueue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingOriginClientRequests.m"), 191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__MRNowPlayingOriginClientRequests_handleDeviceInfoRequestWithCompletion___block_invoke;
  block[3] = &unk_1E30C5B40;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(serialQueue, block);

}

uint64_t __74__MRNowPlayingOriginClientRequests_handleDeviceInfoRequestWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  _QWORD v14[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 16))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = *(void **)(v2 + 56);
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 56);
    *(_QWORD *)(v6 + 56) = v5;

    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  }
  v8 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  v9 = (void *)MEMORY[0x194036C44]();
  objc_msgSend(v4, "addObject:", v9);

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count");
  if (result == 1)
  {
    v10 = (void *)MRGetSharedService();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(const char **)(v11 + 96);
    v13 = *(_QWORD *)(v11 + 8);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__MRNowPlayingOriginClientRequests_handleDeviceInfoRequestWithCompletion___block_invoke_2;
    v14[3] = &unk_1E30CA528;
    v14[4] = v11;
    return MRMediaRemoteServiceGetDeviceInfo(v10, v12, v13, (uint64_t)v14);
  }
  return result;
}

void __46__MRNowPlayingOriginClientRequests_setVolume___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  float v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "verboseOriginClientLogging");

  if (v3)
  {
    _MRLogForCategory(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      objc_msgSend(*(id *)(a1 + 40), "floatValue");
      v7 = 138543618;
      v8 = v5;
      v9 = 2048;
      v10 = v6;
      _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingOriginClientRequests] %{public}@ UpdatingCache: volume %lf", (uint8_t *)&v7, 0x16u);
    }

  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

void __58__MRNowPlayingOriginClientRequests_setVolumeCapabilities___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "verboseOriginClientLogging");

  if (v3)
  {
    _MRLogForCategory(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      v6 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(objc_msgSend(*(id *)(a1 + 40), "intValue"));
      v7 = 138543618;
      v8 = v5;
      v9 = 2114;
      v10 = v6;
      _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingOriginClientRequests] %{public}@ UpdatingCache: volumeCapabilities %{public}@", (uint8_t *)&v7, 0x16u);

    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

void __70__MRNowPlayingOriginClientRequests_handleVolumeRequestWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "floatValue");
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }
  else
  {
    v5 = *(void **)(v2 + 64);
    if (!v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 64);
      *(_QWORD *)(v7 + 64) = v6;

      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    }
    v9 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    v10 = (void *)MEMORY[0x194036C44]();
    objc_msgSend(v5, "addObject:", v10);

    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count") == 1)
    {
      v11 = (void *)MRGetSharedService();
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(v12 + 8);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __70__MRNowPlayingOriginClientRequests_handleVolumeRequestWithCompletion___block_invoke_2;
      v14[3] = &unk_1E30C8A80;
      v14[4] = v12;
      MRMediaRemoteServiceGetMediaPlaybackVolume(v11, v13, v14);
    }
  }
}

void __82__MRNowPlayingOriginClientRequests_handleVolumeCapabilitiesRequestWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  if (v3)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(v3, "intValue"), 0);
  }
  else
  {
    v4 = *(void **)(v2 + 72);
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 72);
      *(_QWORD *)(v6 + 72) = v5;

      v4 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    }
    v8 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    v9 = (void *)MEMORY[0x194036C44]();
    objc_msgSend(v4, "addObject:", v9);

    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count") == 1)
    {
      v10 = (void *)MRGetSharedService();
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 96);
      v13 = *(void **)(v11 + 8);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __82__MRNowPlayingOriginClientRequests_handleVolumeCapabilitiesRequestWithCompletion___block_invoke_2;
      v14[3] = &unk_1E30C8AA8;
      v14[4] = v11;
      MRMediaRemoteServiceGetPickedRouteVolumeControlCapabilities(v10, v12, v13, v14);
    }
  }
}

uint64_t __82__MRNowPlayingOriginClientRequests_handleVolumeCapabilitiesRequestWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v3 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setVolumeCapabilities:", v4);

    v3 = *(_QWORD *)(a1 + 32);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *(id *)(v3 + 72);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeAllObjects", (_QWORD)v11);
}

- (void)setVolumeCapabilities:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

uint64_t __70__MRNowPlayingOriginClientRequests_handleVolumeRequestWithCompletion___block_invoke_2(uint64_t a1, double a2)
{
  float v2;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v2 = *(float *)&a2;
  v17 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v4 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setVolume:", v5);

    v4 = *(_QWORD *)(a1 + 32);
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = *(id *)(v4 + 64);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(float))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++) + 16))(v2);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeAllObjects", (_QWORD)v12);
}

- (void)setVolume:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

- (void)dealloc
{
  void *v3;
  int v4;
  NSObject *v5;
  MROrigin *origin;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  MRNowPlayingOriginClientRequests *v10;
  __int16 v11;
  MROrigin *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "verboseOriginClientLogging");

  if (v4)
  {
    _MRLogForCategory(1uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      origin = self->_origin;
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v10 = self;
      v11 = 2112;
      v12 = origin;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingOriginClientRequests] Destroying %@ for origin %@ at %@", buf, 0x20u);

    }
  }
  v8.receiver = self;
  v8.super_class = (Class)MRNowPlayingOriginClientRequests;
  -[MRNowPlayingOriginClientRequests dealloc](&v8, sel_dealloc);
}

- (id)debugDescription
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__18;
  v8 = __Block_byref_object_dispose__18;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __52__MRNowPlayingOriginClientRequests_debugDescription__block_invoke(uint64_t a1)
{
  void **v2;
  void *v3;
  void *v4;
  float v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v2 = *(void ***)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB3940];
  MRCreateIndentedDebugDescriptionFromObject(v2[11]);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(*(void **)(*(_QWORD *)(a1 + 32) + 16));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "floatValue");
  v6 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(v5);
  MRCreateIndentedDebugDescriptionFromObject(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(*(void **)(*(_QWORD *)(a1 + 32) + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(*(void **)(*(_QWORD *)(a1 + 32) + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromArray(*(void **)(*(_QWORD *)(a1 + 32) + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("    origin = %@\n    deviceInfo = %@\n    volumeCapabilities = %@\n    volume = %@\n    lastPlayingDate = %@\n    nowPlayingClients = %@\n"), v15, v4, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateFormattedDebugDescriptionFromClass(v2, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

- (void)removeClient:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MRNowPlayingOriginClientRequests_removeClient___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

void __49__MRNowPlayingOriginClientRequests_removeClient___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v7, "client", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "client");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

        if (v10)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", v7);
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)removeAllClients
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MRNowPlayingOriginClientRequests_removeAllClients__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

uint64_t __52__MRNowPlayingOriginClientRequests_removeAllClients__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");
}

- (NSArray)nowPlayingClientRequests
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__18;
  v10 = __Block_byref_object_dispose__18;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__MRNowPlayingOriginClientRequests_nowPlayingClientRequests__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __60__MRNowPlayingOriginClientRequests_nowPlayingClientRequests__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSNumber)volumeCapabilities
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__18;
  v8 = __Block_byref_object_dispose__18;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSNumber *)v2;
}

void __54__MRNowPlayingOriginClientRequests_volumeCapabilities__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (NSNumber)volume
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__18;
  v8 = __Block_byref_object_dispose__18;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSNumber *)v2;
}

void __42__MRNowPlayingOriginClientRequests_volume__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)setLastPlayingDate:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_sync_on_queue();

}

void __55__MRNowPlayingOriginClientRequests_setLastPlayingDate___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "verboseOriginClientLogging");

  if (v3)
  {
    _MRLogForCategory(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      v7 = 138543618;
      v8 = v6;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingOriginClientRequests] %{public}@ UpdatingCache: lastPlayingDate %@", (uint8_t *)&v7, 0x16u);
    }

  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

- (NSDate)lastPlayingDate
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__18;
  v8 = __Block_byref_object_dispose__18;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSDate *)v2;
}

void __51__MRNowPlayingOriginClientRequests_lastPlayingDate__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)handleLastPlayingDateRequestWithCompletion:(id)a3
{
  id v5;
  NSObject *serialQueue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingOriginClientRequests.m"), 286, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__MRNowPlayingOriginClientRequests_handleLastPlayingDateRequestWithCompletion___block_invoke;
  block[3] = &unk_1E30C5B40;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_sync(serialQueue, block);

}

void __79__MRNowPlayingOriginClientRequests_handleLastPlayingDateRequestWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 40))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v3 = *(void **)(v2 + 80);
    if (!v3)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 80);
      *(_QWORD *)(v5 + 80) = v4;

      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    }
    v7 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    v8 = (void *)MEMORY[0x194036C44]();
    objc_msgSend(v3, "addObject:", v8);

    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count") == 1)
    {
      v9 = (void *)MRGetSharedService();
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 96);
      v12 = *(void **)(v10 + 8);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __79__MRNowPlayingOriginClientRequests_handleLastPlayingDateRequestWithCompletion___block_invoke_2;
      v13[3] = &unk_1E30CA550;
      v13[4] = v10;
      MRMediaRemoteServiceGetLastPlayingDateForPlayer(v9, v11, v12, v13);
    }
  }
}

void __79__MRNowPlayingOriginClientRequests_handleLastPlayingDateRequestWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v7 + 40))
  {
    objc_msgSend((id)v7, "setLastPlayingDate:", v5);
    v7 = *(_QWORD *)(a1 + 32);
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *(id *)(v7 + 80);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeAllObjects", (_QWORD)v13);
}

- (void)restoreNowPlayingClientState
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MRNowPlayingOriginClientRequests_restoreNowPlayingClientState__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

void __64__MRNowPlayingOriginClientRequests_restoreNowPlayingClientState__block_invoke(uint64_t a1)
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
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "restoreNowPlayingClientState", (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (MROrigin)origin
{
  return self->_origin;
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_lastPlayingDateCompletions, 0);
  objc_storeStrong((id *)&self->_volumeCapabilitiesCompletions, 0);
  objc_storeStrong((id *)&self->_volumeCompletions, 0);
  objc_storeStrong((id *)&self->_deviceInfoCompletions, 0);
  objc_storeStrong((id *)&self->_nowPlayingClients, 0);
  objc_storeStrong((id *)&self->_lastPlayingDate, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_volumeCapabilities, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end
