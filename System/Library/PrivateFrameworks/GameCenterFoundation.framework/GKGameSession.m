@implementation GKGameSession

+ (id)gk_sessionEventListeners
{
  if (gk_sessionEventListeners_onceToken != -1)
    dispatch_once(&gk_sessionEventListeners_onceToken, &__block_literal_global_5);
  return (id)gk_sessionEventListeners_listeners;
}

void __69__GKGameSession_GKGameSessionEventListener__gk_sessionEventListeners__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1 = (void *)gk_sessionEventListeners_listeners;
  gk_sessionEventListeners_listeners = (uint64_t)v0;

}

+ (void)addEventListener:(NSObject *)listener
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[4];
  NSObject *v6;

  v3 = listener;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__GKGameSession_GKGameSessionEventListener__addEventListener___block_invoke;
  block[3] = &unk_1E75B1590;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __62__GKGameSession_GKGameSessionEventListener__addEventListener___block_invoke(uint64_t a1)
{
  id v2;

  +[GKGameSession gk_sessionEventListeners](GKGameSession, "gk_sessionEventListeners");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));

}

+ (void)removeEventListener:(NSObject *)listener
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[4];
  NSObject *v6;

  v3 = listener;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__GKGameSession_GKGameSessionEventListener__removeEventListener___block_invoke;
  block[3] = &unk_1E75B1590;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __65__GKGameSession_GKGameSessionEventListener__removeEventListener___block_invoke(uint64_t a1)
{
  id v2;

  +[GKGameSession gk_sessionEventListeners](GKGameSession, "gk_sessionEventListeners");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 32));

}

+ (void)postSession:(id)a3 didAddPlayer:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__GKGameSession_GKGameSessionEventListener__postSession_didAddPlayer___block_invoke;
  v9[3] = &unk_1E75B1A28;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __70__GKGameSession_GKGameSessionEventListener__postSession_didAddPlayer___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[GKGameSession gk_sessionEventListeners](GKGameSession, "gk_sessionEventListeners");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
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
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "session:didAddPlayer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

+ (void)postSession:(id)a3 didRemovePlayer:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__GKGameSession_GKGameSessionEventListener__postSession_didRemovePlayer___block_invoke;
  v9[3] = &unk_1E75B1A28;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __73__GKGameSession_GKGameSessionEventListener__postSession_didRemovePlayer___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[GKGameSession gk_sessionEventListeners](GKGameSession, "gk_sessionEventListeners");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
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
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "session:didRemovePlayer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

+ (void)postSession:(id)a3 player:(id)a4 didChangeConnectionState:(int64_t)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  int64_t v14;

  v7 = a3;
  v8 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__GKGameSession_GKGameSessionEventListener__postSession_player_didChangeConnectionState___block_invoke;
  block[3] = &unk_1E75B1A50;
  v12 = v7;
  v13 = v8;
  v14 = a5;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __89__GKGameSession_GKGameSessionEventListener__postSession_player_didChangeConnectionState___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[GKGameSession gk_sessionEventListeners](GKGameSession, "gk_sessionEventListeners");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
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
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "session:player:didChangeConnectionState:", a1[4], a1[5], a1[6]);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

+ (void)postSession:(id)a3 player:(id)a4 didSaveData:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__GKGameSession_GKGameSessionEventListener__postSession_player_didSaveData___block_invoke;
  block[3] = &unk_1E75B1A78;
  v14 = v7;
  v15 = v8;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  v12 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __76__GKGameSession_GKGameSessionEventListener__postSession_player_didSaveData___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[GKGameSession gk_sessionEventListeners](GKGameSession, "gk_sessionEventListeners");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
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
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "session:player:didSaveData:", a1[4], a1[5], a1[6]);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

+ (void)postSession:(id)a3 didReceiveData:(id)a4 fromPlayer:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__GKGameSession_GKGameSessionEventListener__postSession_didReceiveData_fromPlayer___block_invoke;
  block[3] = &unk_1E75B1A78;
  v14 = v7;
  v15 = v8;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  v12 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __83__GKGameSession_GKGameSessionEventListener__postSession_didReceiveData_fromPlayer___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[GKGameSession gk_sessionEventListeners](GKGameSession, "gk_sessionEventListeners");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
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
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "session:didReceiveData:fromPlayer:", a1[4], a1[5], a1[6]);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

+ (void)postSession:(id)a3 didReceiveMessage:(id)a4 withData:(id)a5 fromPlayer:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __95__GKGameSession_GKGameSessionEventListener__postSession_didReceiveMessage_withData_fromPlayer___block_invoke;
  v17[3] = &unk_1E75B1AA0;
  v18 = v9;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  v16 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v17);

}

void __95__GKGameSession_GKGameSessionEventListener__postSession_didReceiveMessage_withData_fromPlayer___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[GKGameSession gk_sessionEventListeners](GKGameSession, "gk_sessionEventListeners");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
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
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "session:didReceiveMessage:withData:fromPlayer:", a1[4], a1[5], a1[6], a1[7]);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

+ (void)createSessionInContainer:(NSString *)containerName withTitle:(NSString *)title maxConnectedPlayers:(NSInteger)maxPlayers completionHandler:(void *)completionHandler
{
  void *v10;
  NSString *v11;
  NSString *v12;
  id v13;

  v10 = completionHandler;
  v11 = title;
  v12 = containerName;
  objc_msgSend(a1, "gameSessionService");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "createSessionInContainer:withTitle:maxConnectedPlayers:handler:", v12, v11, maxPlayers, v10);

}

+ (void)loadSessionsInContainer:(NSString *)containerName completionHandler:(void *)completionHandler
{
  void *v6;
  NSString *v7;
  id v8;

  v6 = completionHandler;
  v7 = containerName;
  objc_msgSend(a1, "gameSessionService");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "loadSessionsInContainer:handler:", v7, v6);

}

+ (void)loadSessionWithIdentifier:(NSString *)identifier completionHandler:(void *)completionHandler
{
  void *v6;
  NSString *v7;
  id v8;

  v6 = completionHandler;
  v7 = identifier;
  objc_msgSend(a1, "gameSessionService");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "loadSessionWithIdentifier:handler:", v7, v6);

}

+ (void)removeSessionWithIdentifier:(NSString *)identifier completionHandler:(void *)completionHandler
{
  void *v6;
  NSString *v7;
  id v8;

  v6 = completionHandler;
  v7 = identifier;
  objc_msgSend(a1, "gameSessionService");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeSessionWithIdentifier:handler:", v7, v6);

}

+ (id)daemonProxy
{
  return +[GKDaemonProxy daemonProxy](GKDaemonProxy, "daemonProxy");
}

- (id)daemonProxy
{
  return +[GKDaemonProxy daemonProxy](GKDaemonProxy, "daemonProxy");
}

+ (id)gameSessionService
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "daemonProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gameSessionService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)gameSessionService
{
  void *v2;
  void *v3;

  -[GKGameSession daemonProxy](self, "daemonProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gameSessionService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)gameSessionServicePrivate
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "daemonProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gameSessionServicePrivate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKGameSession)initWithCoder:(id)a3
{
  id v4;
  GKGameSession *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)GKGameSession;
  v5 = -[GKGameSession init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGameSession setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGameSession setTitle:](v5, "setTitle:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("owner"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGameSession setOwner:](v5, "setOwner:", v8);

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("players"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGameSession setPlayers:](v5, "setPlayers:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastModifiedDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGameSession setLastModifiedDate:](v5, "setLastModifiedDate:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastModifiedPlayer"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGameSession setLastModifiedPlayer:](v5, "setLastModifiedPlayer:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverChangeTag"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGameSession setServerChangeTag:](v5, "setServerChangeTag:", v15);

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, v18, v19, v20, v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("playerStates"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGameSession setPlayerStates:](v5, "setPlayerStates:", v23);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxNumberOfConnectedPlayers"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGameSession setMaxNumberOfConnectedPlayers:](v5, "setMaxNumberOfConnectedPlayers:", objc_msgSend(v24, "integerValue"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[GKGameSession identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[GKGameSession title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("title"));

  -[GKGameSession owner](self, "owner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("owner"));

  -[GKGameSession players](self, "players");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("players"));

  -[GKGameSession lastModifiedDate](self, "lastModifiedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("lastModifiedDate"));

  -[GKGameSession lastModifiedPlayer](self, "lastModifiedPlayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("lastModifiedPlayer"));

  -[GKGameSession serverChangeTag](self, "serverChangeTag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("serverChangeTag"));

  -[GKGameSession playerStates](self, "playerStates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("playerStates"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[GKGameSession maxNumberOfConnectedPlayers](self, "maxNumberOfConnectedPlayers"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("maxNumberOfConnectedPlayers"));

}

- (id)descriptionSubstitutionMap
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)_gkDescriptionWithChildren:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  objc_property_t *v11;
  objc_property_t *v12;
  unint64_t i;
  const char *Name;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  GKGameSession *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  GKGameSession *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  GKGameSession *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t k;
  const __CFString *v60;
  GKGameSession *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  int64_t v67;
  id obj;
  void *v69;
  void *v70;
  id v71;
  int64_t v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  unsigned int outCount;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  _gkTabStringForTabLevel(a3);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (void *)v5;
  objc_msgSend(v6, "appendFormat:", CFSTR("%@<%@ %p> {\n"), v5, v8, self);

  -[GKGameSession descriptionSubstitutionMap](self, "descriptionSubstitutionMap");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  outCount = 0;
  v62 = self;
  v10 = (objc_class *)objc_opt_class();
  v11 = class_copyPropertyList(v10, &outCount);
  v12 = v11;
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      Name = property_getName(v12[i]);
      if (Name)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Name);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

      }
    }
  }
  else if (!v11)
  {
    goto LABEL_9;
  }
  free(v12);
LABEL_9:
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = v9;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v89, 16);
  if (v16)
  {
    v17 = v16;
    v18 = a3 + 1;
    v72 = a3 + 2;
    v19 = *(_QWORD *)v83;
    v66 = *(_QWORD *)v83;
    v67 = v18;
    do
    {
      v20 = 0;
      v21 = v62;
      v64 = v17;
      do
      {
        if (*(_QWORD *)v83 != v19)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * v20);
        -[GKGameSession valueForKey:](v21, "valueForKey:", v22);
        v23 = objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v24 = (void *)v23;
          objc_msgSend(v70, "objectForKeyedSubscript:", v22);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v69 = v25;
            v26 = v25;
            objc_msgSend(v26, "count");
            if (objc_msgSend(v26, "count") == 1)
            {
              objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "valueForKeyPath:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v28, "_gkDescriptionWithChildren:", v67);
              v29 = v21;
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "stringByTrimmingCharactersInSet:", v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "appendFormat:", CFSTR("%@    %@.%@ : %@"), v73, v22, v33, v32);

              v21 = v29;
              v24 = v28;
              v17 = v64;
              v25 = v69;
            }
            else
            {
              v63 = v20;
              v40 = v24;
              objc_msgSend(v6, "appendFormat:", CFSTR("    %@%@ : <%@:%p> {\n"), v73, v22, objc_opt_class(), v24);
              v80 = 0u;
              v81 = 0u;
              v78 = 0u;
              v79 = 0u;
              v71 = v26;
              v41 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
              if (v41)
              {
                v42 = v41;
                v43 = *(_QWORD *)v79;
                do
                {
                  for (j = 0; j != v42; ++j)
                  {
                    v45 = v6;
                    if (*(_QWORD *)v79 != v43)
                      objc_enumerationMutation(v71);
                    v46 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * j);
                    objc_msgSend(v40, "valueForKeyPath:", v46);
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v47, "_gkDescriptionWithChildren:", v72);
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "stringByTrimmingCharactersInSet:", v49);
                    v50 = (void *)objc_claimAutoreleasedReturnValue();

                    v6 = v45;
                    objc_msgSend(v45, "appendFormat:", CFSTR("%@        %@ : %@"), v73, v46, v50);

                  }
                  v42 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
                }
                while (v42);
              }
              v26 = v71;

              objc_msgSend(v6, "appendFormat:", CFSTR("    %@}\n"), v73);
              v20 = v63;
              v17 = v64;
              v19 = v66;
              v25 = v69;
              v24 = v40;
              v21 = v62;
            }
          }
          else
          {
            v34 = v20;
            if (v25)
            {
              objc_msgSend(v24, "valueForKeyPath:", v25);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v35, "_gkDescriptionWithChildren:", v67);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
              v37 = v21;
              v38 = v25;
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "stringByTrimmingCharactersInSet:", v39);
              v26 = (id)objc_claimAutoreleasedReturnValue();

              v25 = v38;
              v21 = v37;

              objc_msgSend(v6, "appendFormat:", CFSTR("%@    %@.%@ : %@"), v73, v22, v25, v26);
              v24 = v35;
            }
            else
            {
              objc_msgSend(v24, "_gkDescriptionWithChildren:", v67);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "stringByTrimmingCharactersInSet:", v52);
              v26 = (id)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v6, "appendFormat:", CFSTR("%@    %@ : %@"), v73, v22, v26);
            }
            v19 = v66;
            v20 = v34;
          }

        }
        else
        {
          objc_msgSend(v65, "addObject:", v22);
        }
        ++v20;
      }
      while (v20 != v17);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v89, 16);
    }
    while (v17);
  }

  v53 = v65;
  if (objc_msgSend(v65, "count"))
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("%@    "), v73);
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v54 = v65;
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
    if (v55)
    {
      v56 = v55;
      v57 = 0;
      v58 = *(_QWORD *)v75;
      do
      {
        for (k = 0; k != v56; ++k)
        {
          if (*(_QWORD *)v75 != v58)
            objc_enumerationMutation(v54);
          if (v57 + k <= 0)
            v60 = CFSTR("%@");
          else
            v60 = CFSTR(", %@");
          objc_msgSend(v6, "appendFormat:", v60, *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * k));
        }
        v57 += v56;
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
      }
      while (v56);
    }

    objc_msgSend(v6, "appendString:", CFSTR(" : (null)\n"));
    v53 = v65;
  }
  objc_msgSend(v6, "appendFormat:", CFSTR("%@}\n"), v73);

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)GKGameSession;
  -[GKGameSession description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameSession identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameSession title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameSession lastModifiedDate](self, "lastModifiedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, id: %@, title: %@, date: %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)updateWithSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGameSession setIdentifier:](self, "setIdentifier:", v5);

    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGameSession setTitle:](self, "setTitle:", v6);

    objc_msgSend(v4, "lastModifiedDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGameSession setLastModifiedDate:](self, "setLastModifiedDate:", v7);

    objc_msgSend(v4, "lastModifiedPlayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGameSession setLastModifiedPlayer:](self, "setLastModifiedPlayer:", v8);

    objc_msgSend(v4, "serverChangeTag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGameSession setServerChangeTag:](self, "setServerChangeTag:", v9);

    objc_msgSend(v4, "owner");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGameSession setOwner:](self, "setOwner:", v10);

    objc_msgSend(v4, "players");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGameSession setPlayers:](self, "setPlayers:", v11);

    objc_msgSend(v4, "playerStates");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGameSession setPlayerStates:](self, "setPlayerStates:", v12);

    v13 = objc_msgSend(v4, "maxNumberOfConnectedPlayers");
    -[GKGameSession setMaxNumberOfConnectedPlayers:](self, "setMaxNumberOfConnectedPlayers:", v13);
  }
}

- (void)getShareURLWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void *v5;
  id v6;

  v4 = completionHandler;
  -[GKGameSession gameSessionService](self, "gameSessionService");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[GKGameSession identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchShareURLForSessionWithIdentifier:handler:", v5, v4);

}

- (void)loadDataWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = completionHandler;
  -[GKGameSession gameSessionService](self, "gameSessionService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameSession identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__GKGameSession_loadDataWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E75B7B98;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "loadDataForSessionWithIdentifier:handler:", v6, v8);

}

void __47__GKGameSession_loadDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if (v10)
    objc_msgSend(*(id *)(a1 + 32), "updateWithSession:", v10);
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v7, v8);

}

- (void)saveData:(NSData *)data completionHandler:(void *)completionHandler
{
  void *v6;
  NSData *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = completionHandler;
  v7 = data;
  -[GKGameSession gameSessionService](self, "gameSessionService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameSession identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameSession serverChangeTag](self, "serverChangeTag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__GKGameSession_saveData_completionHandler___block_invoke;
  v12[3] = &unk_1E75B7B98;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v8, "saveData:forSessionWithIdentifier:changeTag:handler:", v7, v9, v10, v12);

}

void __44__GKGameSession_saveData_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if (v10)
    objc_msgSend(*(id *)(a1 + 32), "updateWithSession:", v10);
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v7, v8);

}

- (void)setConnectionState:(GKConnectionState)state completionHandler:(void *)completionHandler
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = completionHandler;
  -[GKGameSession gameSessionService](self, "gameSessionService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameSession identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__GKGameSession_setConnectionState_completionHandler___block_invoke;
  v10[3] = &unk_1E75B7BC0;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "setConnectionState:forSessionWithIdentifier:handler:", state, v8, v10);

}

void __54__GKGameSession_setConnectionState_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "updateWithSession:", v7);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);

}

- (NSArray)playersWithConnectionState:(GKConnectionState)state
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableDictionary *playerStates;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v16;
  NSArray *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_players;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        playerStates = self->_playerStates;
        objc_msgSend(v9, "identifier", v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](playerStates, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "integerValue");

        if (v14 == state)
          objc_msgSend(v16, "addObject:", v9);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  return (NSArray *)v16;
}

- (void)sendData:(NSData *)data withTransportType:(GKTransportType)transport completionHandler:(void *)completionHandler
{
  int *p_sendDataMetricsReported;
  void *v9;
  NSData *v10;
  uint64_t v11;
  void *v12;
  id v13;

  p_sendDataMetricsReported = &self->sendDataMetricsReported;
  v9 = completionHandler;
  v10 = data;
  v11 = GKAtomicCompareAndSwap32(0, 1u, (unsigned int *)p_sendDataMetricsReported);
  -[GKGameSession gameSessionService](self, "gameSessionService");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[GKGameSession identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendData:reliably:forSessionWithIdentifier:shouldReportMetrics:handler:", v10, transport == GKTransportTypeReliable, v12, v11, v9);

}

- (void)sendMessageWithLocalizedFormatKey:(NSString *)key arguments:(NSArray *)arguments data:(NSData *)data toPlayers:(NSArray *)players badgePlayers:(BOOL)badgePlayers completionHandler:(void *)completionHandler
{
  NSString *v14;
  NSArray *v15;
  NSData *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  NSString *identifier;
  void *v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  BOOL v26;

  v14 = key;
  v15 = arguments;
  v16 = data;
  v17 = completionHandler;
  -[NSArray valueForKey:](players, "valueForKey:", CFSTR("identifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = GKAtomicCompareAndSwap32(0, 1u, (unsigned int *)&self->sendMessageMetricsReported);
    -[GKGameSession gameSessionService](self, "gameSessionService");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __107__GKGameSession_sendMessageWithLocalizedFormatKey_arguments_data_toPlayers_badgePlayers_completionHandler___block_invoke;
    v24[3] = &unk_1E75B7BE8;
    v26 = badgePlayers;
    v24[4] = self;
    v25 = v17;
    BYTE1(v23) = v19;
    LOBYTE(v23) = badgePlayers;
    objc_msgSend(v20, "sendMessageForSessionWithID:withLocalizedFormatKey:arguments:userMessage:data:recipientIDs:badgePlayers:shouldReportMetrics:handler:", identifier, v14, v15, 0, v16, v18, v23, v24);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "_gkUserErrorForGameSessionErrorCode:userInfo:", 9, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v17 + 2))(v17, v22);

  }
}

void __107__GKGameSession_sendMessageWithLocalizedFormatKey_arguments_data_toPlayers_badgePlayers_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (!v5 && *(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "updateWithSession:", v7);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);

}

- (void)clearBadgeForPlayers:(NSArray *)players completionHandler:(void *)completionHandler
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = completionHandler;
  -[NSArray valueForKey:](players, "valueForKey:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameSession gameSessionService](self, "gameSessionService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameSession identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__GKGameSession_clearBadgeForPlayers_completionHandler___block_invoke;
  v11[3] = &unk_1E75B7BC0;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "setBadged:forPlayerIDs:forSessionWithIdentifier:handler:", 0, v7, v9, v11);

}

void __56__GKGameSession_clearBadgeForPlayers_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (!v5)
    objc_msgSend(*(id *)(a1 + 32), "updateWithSession:", v7);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);

}

- (NSArray)badgedPlayers
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSMutableDictionary *playerStates;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = self->_players;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        playerStates = self->_playerStates;
        objc_msgSend(v8, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](playerStates, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "BOOLValue");

        if (v13)
          objc_msgSend(v15, "addObject:", v8);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  return (NSArray *)v15;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (GKCloudPlayer)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
  objc_storeStrong((id *)&self->_owner, a3);
}

- (NSArray)players
{
  return self->_players;
}

- (void)setPlayers:(id)a3
{
  objc_storeStrong((id *)&self->_players, a3);
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void)setLastModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastModifiedDate, a3);
}

- (GKCloudPlayer)lastModifiedPlayer
{
  return self->_lastModifiedPlayer;
}

- (void)setLastModifiedPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_lastModifiedPlayer, a3);
}

- (NSInteger)maxNumberOfConnectedPlayers
{
  return self->_maxNumberOfConnectedPlayers;
}

- (void)setMaxNumberOfConnectedPlayers:(int64_t)a3
{
  self->_maxNumberOfConnectedPlayers = a3;
}

- (NSString)serverChangeTag
{
  return self->_serverChangeTag;
}

- (void)setServerChangeTag:(id)a3
{
  objc_storeStrong((id *)&self->_serverChangeTag, a3);
}

- (NSMutableDictionary)playerStates
{
  return self->_playerStates;
}

- (void)setPlayerStates:(id)a3
{
  objc_storeStrong((id *)&self->_playerStates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerStates, 0);
  objc_storeStrong((id *)&self->_serverChangeTag, 0);
  objc_storeStrong((id *)&self->_lastModifiedPlayer, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_players, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (void)getZonesWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "gameSessionServicePrivate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getZonesWithCompletionHandler:", v4);

}

+ (void)getSessionsForZone:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "gameSessionServicePrivate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "loadSessionsInContainer:handler:", v7, v6);

}

@end
