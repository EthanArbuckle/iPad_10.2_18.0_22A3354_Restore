@implementation MRNowPlayingClientRequests

- (id)existingNowPlayingPlayerClientRequestsForPlayerPath:(id)a3
{
  id v4;
  void *v5;
  MRNowPlayingClientRequests *v6;
  NSMutableArray *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = self;
    objc_sync_enter(v6);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v6->_playerClients;
    v8 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v11, "playerPath", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqual:", v4);

          if (v13)
          {
            v8 = v11;
            goto LABEL_12;
          }
        }
        v8 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

    objc_sync_exit(v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (MRClient)client
{
  return -[MRPlayerPath client](self->_playerPath, "client");
}

- (id)nowPlayingPlayerClientRequestsForPlayerPath:(id)a3
{
  id v4;
  void *v5;
  MRNowPlayingClientRequests *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  MRNowPlayingPlayerClientRequests *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = self;
    objc_sync_enter(v6);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v6->_playerClients;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v17;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        objc_msgSend(v11, "playerPath", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if ((v13 & 1) != 0)
          break;
        if (v8 == ++v10)
        {
          v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v14 = v11;

      if (v14)
        goto LABEL_13;
    }
    else
    {
LABEL_10:

    }
    v14 = -[MRNowPlayingPlayerClientRequests initWithPlayerPath:]([MRNowPlayingPlayerClientRequests alloc], "initWithPlayerPath:", v4);
    -[NSMutableArray addObject:](v6->_playerClients, "addObject:", v14);
LABEL_13:
    objc_sync_exit(v6);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (MRNowPlayingClientRequests)initWithPlayerPath:(id)a3
{
  id v5;
  MRNowPlayingClientRequests *v6;
  void *v7;
  void *v8;
  int v9;
  NSMutableArray *v10;
  NSMutableArray *playerClients;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MRNowPlayingClientRequests;
  v6 = -[MRNowPlayingClientRequests init](&v17, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRNowPlayingClientRequests initWithPlayerPath:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("MRNowPlayingOriginClientRequests.m"), 342, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("playerPath.client"));

    }
    objc_msgSend(v5, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "processIdentifier");

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRNowPlayingClientRequests initWithPlayerPath:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("MRNowPlayingOriginClientRequests.m"), 343, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("playerPath.client.processIdentifier"));

    }
    objc_storeStrong((id *)&v6->_playerPath, a3);
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    playerClients = v6->_playerClients;
    v6->_playerClients = v10;

  }
  return v6;
}

- (id)debugDescription
{
  MRNowPlayingClientRequests *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x1E0CB3940];
  MRCreateIndentedDebugDescriptionFromObject(v2->_playerPath);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(v2->_clientProperties);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromArray(v2->_playerClients);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("    playerPath = %@\n    clientProperties = %@\n    playerClients = %@\n"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateFormattedDebugDescriptionFromClass(v2, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v8;
}

- (void)setClientProperties:(id)a3
{
  id v5;
  MRNowPlayingClientRequests *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  NSObject *v11;
  MRPlayerPath *playerPath;
  uint64_t v13;
  MRClient *clientProperties;
  void *v15;
  uint8_t buf[4];
  MRPlayerPath *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  -[MRPlayerPath client](v6->_playerPath, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v5);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MRNowPlayingOriginClientRequests.m"), 381, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_playerPath.client isEqual:clientProperties]"));

  }
  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "verboseOriginClientLogging");

  if (v10)
  {
    _MRLogForCategory(1uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      playerPath = v6->_playerPath;
      *(_DWORD *)buf = 138543618;
      v17 = playerPath;
      v18 = 2114;
      v19 = v5;
      _os_log_impl(&dword_193827000, v11, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingOriginClientRequests] %{public}@ UpdatingCache: clientProperties %{public}@", buf, 0x16u);
    }

  }
  v13 = objc_msgSend(v5, "copy");
  clientProperties = v6->_clientProperties;
  v6->_clientProperties = (MRClient *)v13;

  objc_sync_exit(v6);
}

- (MRClient)clientProperties
{
  MRNowPlayingClientRequests *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[MRClient copy](v2->_clientProperties, "copy");
  objc_sync_exit(v2);

  return (MRClient *)v3;
}

- (void)removePlayer:(id)a3
{
  id v4;
  MRNowPlayingClientRequests *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5->_playerClients;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "playerPath", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if (v12)
        {
          -[NSMutableArray removeObject:](v5->_playerClients, "removeObject:", v10);
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v5);
}

- (void)handleClientPropertiesRequestWithCompletion:(id)a3
{
  void (**v5)(id, MRClient *, _QWORD);
  MRNowPlayingClientRequests *v6;
  MRClient *clientProperties;
  NSMutableArray *clientPropertiesCompletions;
  NSMutableArray *v9;
  NSMutableArray *v10;
  void *v11;
  void *v12;
  void *v13;
  MRPlayerPath *playerPath;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];

  v5 = (void (**)(id, MRClient *, _QWORD))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingOriginClientRequests.m"), 448, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v6 = self;
  objc_sync_enter(v6);
  clientProperties = v6->_clientProperties;
  if (clientProperties)
  {
    v5[2](v5, clientProperties, 0);
  }
  else
  {
    clientPropertiesCompletions = v6->_clientPropertiesCompletions;
    if (!clientPropertiesCompletions)
    {
      v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v10 = v6->_clientPropertiesCompletions;
      v6->_clientPropertiesCompletions = v9;

      clientPropertiesCompletions = v6->_clientPropertiesCompletions;
    }
    v11 = (void *)objc_msgSend(v5, "copy");
    v12 = (void *)MEMORY[0x194036C44]();
    -[NSMutableArray addObject:](clientPropertiesCompletions, "addObject:", v12);

    if (-[NSMutableArray count](v6->_clientPropertiesCompletions, "count") == 1)
    {
      v13 = (void *)MRGetSharedService();
      playerPath = v6->_playerPath;
      +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "workerQueue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __74__MRNowPlayingClientRequests_handleClientPropertiesRequestWithCompletion___block_invoke;
      v18[3] = &unk_1E30CA578;
      v18[4] = v6;
      MRMediaRemoteServiceGetClientProperties(v13, playerPath, v16, v18);

    }
  }
  objc_sync_exit(v6);

}

void __74__MRNowPlayingClientRequests_handleClientPropertiesRequestWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = *(id *)(a1 + 32);
  objc_sync_enter(v8);
  v9 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v9 + 8))
  {
    objc_storeStrong((id *)(v9 + 8), a2);
    v9 = *(_QWORD *)(a1 + 32);
  }
  v10 = (void *)objc_msgSend(*(id *)(v9 + 24), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  objc_sync_exit(v8);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v11);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)restoreNowPlayingClientState
{
  MRNowPlayingClientRequests *v2;
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v3 = v2->_playerClients;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "restoreNowPlayingClientState", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (NSArray)nowPlayingClients
{
  return self->_nowPlayingClients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingClients, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_clientPropertiesCompletions, 0);
  objc_storeStrong((id *)&self->_playerClients, 0);
  objc_storeStrong((id *)&self->_clientProperties, 0);
}

@end
