@implementation MRNowPlayingClient

- (id)nowPlayingPlayerClientForPlayerPath:(id)a3
{
  id v4;
  MRNowPlayingClient *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  MRNowPlayingPlayerClient *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5->_playerClients;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(v6);
      v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
      objc_msgSend(v10, "playerPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isEqual:", v4) & 1) != 0)
        break;

      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = v10;

    if (v12)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  v12 = -[MRNowPlayingPlayerClient initWithPlayerPath:]([MRNowPlayingPlayerClient alloc], "initWithPlayerPath:", v4);
  -[NSMutableArray addObject:](v5->_playerClients, "addObject:", v12);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("New player %@ was added"), v4);
  -[MRNowPlayingClient reevaluateActivePlayerWithReason:completion:](v5, "reevaluateActivePlayerWithReason:completion:", v13, 0);

LABEL_12:
  objc_sync_exit(v5);

  return v12;
}

- (void)reevaluateActivePlayerWithReason:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MRNowPlayingClient *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL isForeground;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  BOOL v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (v8->_useMediaRemoteActivePlayerHeuristic)
  {
    -[MRNowPlayingClient playerClients](v8, "playerClients");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mr_filter:", &__block_literal_global_93);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3928];
    NSStringFromSelector(sel_activeRequestedDate);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sortDescriptorWithKey:ascending:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v24[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sortedArrayUsingDescriptors:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    isForeground = v8->_isForeground;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __66__MRNowPlayingClient_reevaluateActivePlayerWithReason_completion___block_invoke_2;
    v22[3] = &__block_descriptor_33_e34_B16__0__MRNowPlayingPlayerClient_8l;
    v23 = isForeground;
    objc_msgSend(v15, "mr_first:", v22);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend(v15, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        v17 = v18;
      }
      else
      {
        -[MRNowPlayingClient playerClients](v8, "playerClients");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "mr_first:", &__block_literal_global_247_0);
        v17 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    objc_msgSend(v17, "playerPath");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRNowPlayingClient setActivePlayerPath:reason:completion:](v8, "setActivePlayerPath:reason:completion:", v21, v6, v7);

  }
  objc_sync_exit(v8);

}

- (NSArray)playerClients
{
  MRNowPlayingClient *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableArray copy](v2->_playerClients, "copy");
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

uint64_t __66__MRNowPlayingClient_reevaluateActivePlayerWithReason_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "playerPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDefaultPlayer");

  return v4;
}

BOOL __66__MRNowPlayingClient_reevaluateActivePlayerWithReason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "playerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isDefaultPlayer") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v2, "activeRequestedDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  return v5;
}

- (void)setActivePlayerPath:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  MRNowPlayingClient *v11;
  MRPlayer *activePlayer;
  void *v13;
  MRPlayer *v14;
  MRPlayer *v15;
  MRPlayer *v16;
  BOOL v17;
  NSObject *v18;
  MRPlayer *v19;
  void *v20;
  MRPlayer *v21;
  uint64_t v22;
  MRPlayer *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  MRPlayer *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  activePlayer = v11->_activePlayer;
  objc_msgSend(v8, "player");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = activePlayer;
  v15 = v13;
  if (v14 == v15)
  {

  }
  else
  {
    v16 = v15;
    v17 = -[MRPlayer isEqual:](v14, "isEqual:", v15);

    if (!v17)
    {
      if (v11->_activePlayer)
      {
        _MRLogForCategory(0);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = v11->_activePlayer;
          objc_msgSend(v8, "player");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v40 = v8;
          v41 = 2114;
          v42 = CFSTR("ActivePlayerPath");
          v43 = 2112;
          v44 = v19;
          v45 = 2112;
          v46 = v20;
          _os_log_impl(&dword_193827000, v18, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ from <%@> to <%@>", buf, 0x2Au);

        }
      }
      else
      {
        _MRLogForCategory(0);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "player");
          v21 = (MRPlayer *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v40 = v8;
          v41 = 2114;
          v42 = CFSTR("ActivePlayerPath");
          v43 = 2112;
          v44 = v21;
          _os_log_impl(&dword_193827000, v18, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ to <%@>", buf, 0x20u);

        }
      }

      objc_msgSend(v8, "player");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v11->_activePlayer;
      v11->_activePlayer = (MRPlayer *)v22;

      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "UUIDString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("setNowPlayingPlayer"), v26);
      v28 = v27;
      if (v8)
        objc_msgSend(v27, "appendFormat:", CFSTR(" for %@"), v8);
      if (v9)
        objc_msgSend(v28, "appendFormat:", CFSTR(" because %@"), v9);
      _MRLogForCategory(0xAuLL);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v40 = v28;
        _os_log_impl(&dword_193827000, v29, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
      }

      v30 = (void *)MRGetSharedService();
      dispatch_get_global_queue(0, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __60__MRNowPlayingClient_setActivePlayerPath_reason_completion___block_invoke;
      v34[3] = &unk_1E30C6630;
      v35 = v8;
      v32 = v26;
      v36 = v32;
      v33 = v24;
      v37 = v33;
      v38 = v10;
      MRMediaRemoteServiceSetNowPlayingPlayer(v30, v35, v31, v34);

      goto LABEL_18;
    }
  }
  if (v10)
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
LABEL_18:
  objc_sync_exit(v11);

}

uint64_t __47__MRNowPlayingClient_canBeNowPlayingForPlayer___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "playerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (MRClient)client
{
  MRNowPlayingClient *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[MRPlayerPath client](v2->_playerPath, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_sync_exit(v2);
  return (MRClient *)v4;
}

- (MRNowPlayingClient)initWithPlayerPath:(id)a3
{
  id v4;
  MRNowPlayingClient *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *avscQueue;
  uint64_t v9;
  MRPlayerPath *playerPath;
  MRPlayerPath *v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *playerClients;
  void *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *replayQueue;
  uint64_t v22;
  NSMutableArray *commandQueue;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD block[4];
  MRNowPlayingClient *v34;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)MRNowPlayingClient;
  v5 = -[MRNowPlayingClient init](&v35, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.MediaRemote.MRNowPlayingOriginClient.avscQueue", v6);
    avscQueue = v5->_avscQueue;
    v5->_avscQueue = (OS_dispatch_queue *)v7;

    v9 = objc_msgSend(v4, "copy");
    playerPath = v5->_playerPath;
    v5->_playerPath = (MRPlayerPath *)v9;

    -[MRPlayerPath setPlayer:](v5->_playerPath, "setPlayer:", 0);
    v11 = v5->_playerPath;
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRNowPlayingClient initWithPlayerPath:]");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("MRNowPlayingOriginClient.m"), 446, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_playerPath"));

      v11 = v5->_playerPath;
    }
    -[MRPlayerPath client](v11, "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRNowPlayingClient initWithPlayerPath:]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("MRNowPlayingOriginClient.m"), 449, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

    }
    objc_msgSend(v12, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRNowPlayingClient initWithPlayerPath:]");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("MRNowPlayingOriginClient.m"), 450, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client.bundleIdentifier"));

    }
    if (!objc_msgSend(v12, "processIdentifier"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRNowPlayingClient initWithPlayerPath:]");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("MRNowPlayingOriginClient.m"), 451, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client.processIdentifier"));

    }
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    playerClients = v5->_playerClients;
    v5->_playerClients = v14;

    -[MRPlayerPath origin](v5->_playerPath, "origin");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isLocal");

    if (v17)
    {
      v18 = v5->_avscQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__MRNowPlayingClient_initWithPlayerPath___block_invoke;
      block[3] = &unk_1E30C5CA8;
      v34 = v5;
      dispatch_async(v18, block);

    }
    v5->_isForeground = 1;
    v5->_useMediaRemoteActivePlayerHeuristic = 1;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("replayQueue", v19);
    replayQueue = v5->_replayQueue;
    v5->_replayQueue = (OS_dispatch_queue *)v20;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = objc_claimAutoreleasedReturnValue();
    commandQueue = v5->_commandQueue;
    v5->_commandQueue = (NSMutableArray *)v22;

  }
  return v5;
}

void __41__MRNowPlayingClient_initWithPlayerPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((Class)getAVSystemControllerClass_0[0](), "sharedAVSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  getAVSystemController_ServerConnectionDiedNotification[0]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getAVSystemController_SubscribeToNotificationsAttribute[0]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAttribute:forKey:error:", v4, v5, 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  getAVSystemController_ServerConnectionDiedNotification[0]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", v7, sel__avSessionMediaServicesResetNotification_, v8, 0);

}

- (BOOL)canBeNowPlayingForPlayer:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *playerClients;
  void *v7;
  char v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = v4;
  if (self->_perPlayerCanBeNowPlaying || !self->_canBeNowPlaying)
  {
    playerClients = self->_playerClients;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __47__MRNowPlayingClient_canBeNowPlayingForPlayer___block_invoke;
    v10[3] = &unk_1E30CEF28;
    v11 = v4;
    -[NSMutableArray mr_first:](playerClients, "mr_first:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "canBeNowPlayingPlayer");

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)canBeNowPlaying
{
  MRNowPlayingClient *v2;
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL canBeNowPlaying;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_perPlayerCanBeNowPlaying)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = v2->_playerClients;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v3);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "canBeNowPlayingPlayer", (_QWORD)v9) & 1) != 0)
          {

            canBeNowPlaying = 1;
            goto LABEL_13;
          }
        }
        v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          continue;
        break;
      }
    }

    canBeNowPlaying = 0;
  }
  else
  {
    canBeNowPlaying = v2->_canBeNowPlaying;
  }
LABEL_13:
  objc_sync_exit(v2);

  return canBeNowPlaying;
}

- (void)setPerPlayerCanBeNowPlaying:(BOOL)a3
{
  _BOOL4 v3;
  MRNowPlayingClient *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  obj->_perPlayerCanBeNowPlaying = v3;
  if (v3)
    -[MRNowPlayingClient sendQueuedCommandsWithReason:](obj, "sendQueuedCommandsWithReason:", CFSTR("perPlayCanBeNowPlaying=YES"));
  objc_sync_exit(obj);

}

- (void)sendQueuedCommandsWithReason:(id)a3
{
  id v4;
  MRNowPlayingClient *v5;
  void *v6;
  NSObject *replayQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (-[NSMutableArray count](v5->_commandQueue, "count"))
  {
    v6 = (void *)-[NSMutableArray copy](v5->_commandQueue, "copy");
    -[NSMutableArray removeAllObjects](v5->_commandQueue, "removeAllObjects");
    replayQueue = v5->_replayQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__MRNowPlayingClient_sendQueuedCommandsWithReason___block_invoke;
    v9[3] = &unk_1E30C5F40;
    v10 = v6;
    v11 = v4;
    v8 = v6;
    dispatch_async(replayQueue, v9);

  }
  objc_sync_exit(v5);

}

uint64_t __60__MRNowPlayingClient_setActivePlayerPath_reason_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  int v22;
  const __CFString *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a1[4];
  _MRLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!a2)
  {
    v12 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v12)
        goto LABEL_14;
      v14 = a1[4];
      v13 = a1[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", a1[6]);
      v22 = 138544130;
      v23 = CFSTR("setNowPlayingPlayer");
      v24 = 2114;
      v25 = v13;
      v26 = 2114;
      v27 = v14;
      v28 = 2048;
      v29 = v15;
      v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v17 = v6;
      v18 = 42;
    }
    else
    {
      if (!v12)
        goto LABEL_14;
      v19 = a1[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", a1[6]);
      v22 = 138543874;
      v23 = CFSTR("setNowPlayingPlayer");
      v24 = 2114;
      v25 = v19;
      v26 = 2048;
      v27 = v20;
      v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v17 = v6;
      v18 = 32;
    }
    _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v22, v18);
    goto LABEL_13;
  }
  v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v7)
      goto LABEL_14;
    v9 = a1[4];
    v8 = a1[5];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", a1[6]);
    v22 = 138544386;
    v23 = CFSTR("setNowPlayingPlayer");
    v24 = 2114;
    v25 = v8;
    v26 = 2114;
    v27 = a2;
    v28 = 2114;
    v29 = v9;
    v30 = 2048;
    v31 = v11;
    _os_log_error_impl(&dword_193827000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v22, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v7)
    __60__MRNowPlayingClient_setActivePlayerPath_reason_completion___block_invoke_cold_1((uint64_t)a1);
LABEL_14:

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)updateActivePlayerPath:(id)a3 completion:(id)a4
{
  id v6;
  MRNowPlayingClient *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v7->_useMediaRemoteActivePlayerHeuristic = 0;
  -[MRNowPlayingClient setActivePlayerPath:reason:completion:](v7, "setActivePlayerPath:reason:completion:", v8, CFSTR("API Usage"), v6);
  objc_sync_exit(v7);

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MRNowPlayingClient;
  -[MRNowPlayingClient dealloc](&v2, sel_dealloc);
}

- (void)setCanBeNowPlaying:(BOOL)a3
{
  _BOOL4 v3;
  MRNowPlayingClient *v4;
  double v5;
  void *v6;
  MRNowPlayingClient *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  v4 = obj;
  if (obj->_canBeNowPlaying != v3)
  {
    obj->_canBeNowPlaying = v3;
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v4 = obj;
      obj->_canBeNowPlayingTimestamp = v5;
      if (!obj->_perPlayerCanBeNowPlaying)
      {
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("canBeNowPlaying=YES for %@"), obj->_playerPath);
        -[MRNowPlayingClient sendQueuedCommandsWithReason:](obj, "sendQueuedCommandsWithReason:", v6);

        v4 = obj;
      }
    }
  }
  objc_sync_exit(v4);

}

- (BOOL)perPlayerCanBeNowPlaying
{
  MRNowPlayingClient *v2;
  BOOL perPlayerCanBeNowPlaying;

  v2 = self;
  objc_sync_enter(v2);
  perPlayerCanBeNowPlaying = v2->_perPlayerCanBeNowPlaying;
  objc_sync_exit(v2);

  return perPlayerCanBeNowPlaying;
}

- (void)setClient:(id)a3
{
  MRNowPlayingClient *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MRPlayerPath setClient:](v4->_playerPath, "setClient:", v5);
  objc_sync_exit(v4);

}

- (void)mergeClient:(id)a3
{
  MRNowPlayingClient *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MRPlayerPath client](v4->_playerPath, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mergeFrom:", v6);

  objc_sync_exit(v4);
}

- (void)requestActiveForPlayerPath:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MRNowPlayingClient *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[MRNowPlayingClient nowPlayingPlayerClientForPlayerPath:](v8, "nowPlayingPlayerClientForPlayerPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActiveRequestedDate:", v10);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__MRNowPlayingClient_requestActiveForPlayerPath_completion___block_invoke;
  v14[3] = &unk_1E30CE2F0;
  v14[4] = v8;
  v11 = v6;
  v15 = v11;
  v12 = v9;
  v16 = v12;
  v13 = v7;
  v17 = v13;
  -[MRNowPlayingClient reevaluateActivePlayerWithReason:completion:](v8, "reevaluateActivePlayerWithReason:completion:", CFSTR("Attempting to set now playing player if possible"), v14);

  objc_sync_exit(v8);
}

void __60__MRNowPlayingClient_requestActiveForPlayerPath_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "activePlayerPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 40)))
    {

    }
    else
    {
      v5 = objc_msgSend(*(id *)(a1 + 48), "isPictureInPictureEnabled");

      if (v5)
      {
        v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 41);
        goto LABEL_7;
      }
    }
    v3 = 0;
  }
LABEL_7:
  v6 = *(_QWORD *)(a1 + 56);
  if (v6)
  {
    v7 = v3;
    (*(void (**)(void))(v6 + 16))();
    v3 = v7;
  }

}

uint64_t __66__MRNowPlayingClient_reevaluateActivePlayerWithReason_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(a1 + 32))
  {
    if ((objc_msgSend(v3, "isPictureInPictureEnabled") & 1) != 0)
    {
      v5 = 1;
      goto LABEL_7;
    }
    if (!*(_BYTE *)(a1 + 32))
    {
      v5 = 0;
      goto LABEL_7;
    }
  }
  v5 = objc_msgSend(v4, "isPictureInPictureEnabled") ^ 1;
LABEL_7:

  return v5;
}

- (void)applicationWillEnterForeground
{
  MRNowPlayingClient *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_isForeground = 1;
  -[MRNowPlayingClient reevaluateActivePlayerWithReason:completion:](obj, "reevaluateActivePlayerWithReason:completion:", CFSTR("Application will enter foreground"), 0);
  objc_sync_exit(obj);

}

- (void)applicationDidEnterBackground
{
  MRNowPlayingClient *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_isForeground = 0;
  -[MRNowPlayingClient reevaluateActivePlayerWithReason:completion:](obj, "reevaluateActivePlayerWithReason:completion:", CFSTR("Application did enter background"), 0);
  objc_sync_exit(obj);

}

- (MRPlayerPath)activePlayerPath
{
  MRNowPlayingClient *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[MRPlayerPath copy](v2->_playerPath, "copy");
  v4 = (void *)-[MRPlayer copy](v2->_activePlayer, "copy");
  objc_msgSend(v3, "setPlayer:", v4);

  objc_sync_exit(v2);
  return (MRPlayerPath *)v3;
}

- (void)removePlayer:(id)a3
{
  id v4;
  MRNowPlayingClient *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v5->_playerClients;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v7)
    goto LABEL_16;
  v8 = *(_QWORD *)v18;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v18 != v8)
        objc_enumerationMutation(v6);
      v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      objc_msgSend(v10, "playerPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqual:", v4))
      {
        -[NSMutableArray removeObject:](v5->_playerClients, "removeObject:", v10);
        -[MRNowPlayingClient activePlayerPath](v5, "activePlayerPath");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v13 = v4;
        v14 = v13;
        if (v12 == v13)
        {

        }
        else
        {
          v15 = objc_msgSend(v12, "isEqual:", v13);

          if (!v15)
            goto LABEL_15;
        }
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Active player %@ was removed"), v14);
        -[MRNowPlayingClient reevaluateActivePlayerWithReason:completion:](v5, "reevaluateActivePlayerWithReason:completion:", v16, 0);

LABEL_15:
        goto LABEL_16;
      }

    }
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
      continue;
    break;
  }
LABEL_16:

  objc_sync_exit(v5);
}

- (void)enqueueCommand:(unsigned int)a3 options:(id)a4 playerPath:(id)a5 commandCompletion:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  MRNowPlayingClientCommandQueueEntry *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  MRNowPlayingClient *v18;
  int v19;
  uint64_t v20;
  NSMutableArray *playerClients;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  dispatch_time_t v30;
  NSObject *replayQueue;
  void *v32;
  id v33;
  _QWORD block[5];
  MRNowPlayingClientCommandQueueEntry *v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v8 = *(_QWORD *)&a3;
  v46 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v33 = a6;
  v12 = objc_alloc_init(MRNowPlayingClientCommandQueueEntry);
  -[MRNowPlayingClientCommandQueueEntry setCommand:](v12, "setCommand:", v8);
  -[MRNowPlayingClientCommandQueueEntry setOptions:](v12, "setOptions:", v10);
  v13 = (void *)objc_msgSend(v11, "copy");
  -[MRNowPlayingClientCommandQueueEntry setPlayerPath:](v12, "setPlayerPath:", v13);

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRNowPlayingClientCommandQueueEntry setDateCreated:](v12, "setDateCreated:", v14);

  -[MRNowPlayingClientCommandQueueEntry setCommandCompletion:](v12, "setCommandCompletion:", v33);
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOptionCommandID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MRMediaRemoteCopyCommandDescription(v8);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Enqueueing command for %@"), self->_playerPath);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  _MRLogForCategory(0xAuLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v41 = v16;
    v42 = 2114;
    v43 = v15;
    v44 = 2112;
    v45 = v32;
    _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  v18 = self;
  objc_sync_enter(v18);
  -[NSMutableArray addObject:](v18->_commandQueue, "addObject:", v12);
  if (!v18->_perPlayerCanBeNowPlaying && v18->_canBeNowPlaying)
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("canBeNowPlaying=YES for %@"), self->_playerPath);
    -[MRNowPlayingClient sendQueuedCommandsWithReason:](v18, "sendQueuedCommandsWithReason:", v26);

    goto LABEL_11;
  }
  v19 = objc_msgSend(v11, "isResolved");
  v20 = MEMORY[0x1E0C809B0];
  if (!v19)
  {
LABEL_10:
    +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "queuedCommandsTimeoutInterval");
    v29 = v28;

    v30 = dispatch_time(0, (uint64_t)(v29 * 1000000000.0));
    replayQueue = v18->_replayQueue;
    block[0] = v20;
    block[1] = 3221225472;
    block[2] = __74__MRNowPlayingClient_enqueueCommand_options_playerPath_commandCompletion___block_invoke_2;
    block[3] = &unk_1E30C9008;
    block[4] = v18;
    v35 = v12;
    v36 = v16;
    v37 = v15;
    dispatch_after(v30, replayQueue, block);

    goto LABEL_11;
  }
  playerClients = v18->_playerClients;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __74__MRNowPlayingClient_enqueueCommand_options_playerPath_commandCompletion___block_invoke;
  v38[3] = &unk_1E30CEF28;
  v39 = v11;
  -[NSMutableArray msv_firstWhere:](playerClients, "msv_firstWhere:", v38);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v22, "canBeNowPlayingPlayer"))
  {

    goto LABEL_10;
  }
  v23 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v22, "playerPath");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("canBeNowPlayingPlayer=YES for %@"), v24);

  -[MRNowPlayingClient sendQueuedCommandsWithReason:](v18, "sendQueuedCommandsWithReason:", v25);
LABEL_11:
  objc_sync_exit(v18);

}

uint64_t __74__MRNowPlayingClient_enqueueCommand_options_playerPath_commandCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "playerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __74__MRNowPlayingClient_enqueueCommand_options_playerPath_commandCompletion___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 40), "dateCreated");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceNow");
    v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Removing previously queued command because it timed out (enqueued for %f seconds)"), v5);

    _MRLogForCategory(0xAuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      v16 = v8;
      v17 = 2114;
      v18 = v9;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 40), "commandCompletion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = *(void **)(a1 + 40);
      v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__MRNowPlayingClient_enqueueCommand_options_playerPath_commandCompletion___block_invoke_264;
      block[3] = &unk_1E30C5CA8;
      v14 = v11;
      dispatch_async(v12, block);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", *(_QWORD *)(a1 + 40));

  }
  objc_sync_exit(v2);

}

void __74__MRNowPlayingClient_enqueueCommand_options_playerPath_commandCompletion___block_invoke_264(uint64_t a1)
{
  void *v1;
  void (**v2)(id, void *);

  objc_msgSend(*(id *)(a1 + 32), "commandCompletion");
  v2 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
  +[MRCommandResult commandResultWithSendError:](MRCommandResult, "commandResultWithSendError:", 17);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, v1);

}

void __51__MRNowPlayingClient_sendQueuedCommandsWithReason___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id obj;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = *(id *)(a1 + 32);
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v1)
  {
    v2 = v1;
    v15 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v4, "options");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOptionCommandID"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = MRMediaRemoteCopyCommandDescription(objc_msgSend(v4, "command"));
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sending previously queued command because %@"), *(_QWORD *)(a1 + 40));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        _MRLogForCategory(0xAuLL);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v22 = v7;
          v23 = 2114;
          v24 = v6;
          v25 = 2112;
          v26 = v8;
          _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
        }

        objc_msgSend(v4, "playerPath");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "command");
        objc_msgSend(v4, "options");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "commandCompletion");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        MRServiceClientRemotePlayerPathCommandCallback(v10, v11, v12, v13);

      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    }
    while (v2);
  }

}

- (void)_avSessionMediaServicesResetNotification:(id)a3
{
  NSObject *v4;
  NSObject *avscQueue;
  _QWORD block[5];
  uint8_t buf[16];

  _MRLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingOriginClient] AVAudioSessionMediaServicesWereReset notification received -- restoring now playing app eligibility state", buf, 2u);
  }

  avscQueue = self->_avscQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MRNowPlayingClient__avSessionMediaServicesResetNotification___block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_async(avscQueue, block);
}

void __63__MRNowPlayingClient__avSessionMediaServicesResetNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((Class)getAVSystemControllerClass_0[0](), "sharedAVSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  getAVSystemController_ServerConnectionDiedNotification[0]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getAVSystemController_SubscribeToNotificationsAttribute[0]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAttribute:forKey:error:", v4, v5, 0);

  if (objc_msgSend(*(id *)(a1 + 32), "canBeNowPlaying"))
  {
    getAVSystemController_CanBeNowPlayingAppAttribute_0[0]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAttribute:forKey:error:", MEMORY[0x1E0C9AAB0], v6, 0);

  }
}

- (void)restoreNowPlayingClientState
{
  MRNowPlayingClient *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_canBeNowPlaying)
  {
    v3 = (void *)MRGetSharedService();
    MRMediaRemoteServiceSetCanBeNowPlayingApp(v3, 1, v2->_canBeNowPlayingTimestamp);
  }
  if (v2->_activePlayer)
  {
    v4 = (void *)MRGetSharedService();
    -[MRNowPlayingClient activePlayerPath](v2, "activePlayerPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MRMediaRemoteServiceSetNowPlayingPlayer(v4, v5, 0, 0);

  }
  -[MRPlayerPath client](v2->_playerPath, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hasAuxiliaryProperties"))
  {
    v7 = (void *)MRGetSharedService();
    MRMediaRemoteServiceUpdateClientProperties(v7, v2->_playerPath, 0, 0);
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = v2->_playerClients;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "restoreNowPlayingClientState", (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  objc_sync_exit(v2);
}

- (id)description
{
  MRNowPlayingClient *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v2 = self;
  objc_sync_enter(v2);
  v7.receiver = v2;
  v7.super_class = (Class)MRNowPlayingClient;
  -[MRNowPlayingClient description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPlayerPath client](v2->_playerPath, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("Client: %@ Players: %@"), v4, v2->_playerClients);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v5;
}

- (id)debugDescription
{
  MRNowPlayingClient *v2;
  void *v3;
  MRPlayerPath *playerPath;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x1E0CB3940];
  playerPath = v2->_playerPath;
  -[MRPlayerPath client](playerPath, "client");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(v2->_activePlayer);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2->_isForeground)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  MRCreateIndentedDebugDescriptionFromObject(v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2->_perPlayerCanBeNowPlaying)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  MRCreateIndentedDebugDescriptionFromObject(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2->_canBeNowPlaying)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  MRCreateIndentedDebugDescriptionFromObject(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v2->_canBeNowPlayingTimestamp);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MRNowPlayingClient canBeNowPlaying](v2, "canBeNowPlaying"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  MRCreateIndentedDebugDescriptionFromObject(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromArray(v2->_commandQueue);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromArray(v2->_playerClients);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("    playerPath = %@\n    client = %@\n    activePlayer = %@\n    isForeground = %@\n    perPlayerCanBeNowPlaying = %@\n    canBeNowPlaying = %@\n    canBeNowPlayingTimeStamp = %@\n    effectiveCanBeNowPlaying = %@\n    enqueueCommands = %@\n    playerClients = %@\n"), playerPath, v21, v20, v19, v7, v9, v11, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateFormattedDebugDescriptionFromClass(v2, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v17;
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
  objc_storeStrong((id *)&self->_playerPath, a3);
}

- (BOOL)useMediaRemoteActivePlayerHeuristic
{
  return self->_useMediaRemoteActivePlayerHeuristic;
}

- (void)setUseMediaRemoteActivePlayerHeuristic:(BOOL)a3
{
  self->_useMediaRemoteActivePlayerHeuristic = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_avscQueue, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_replayQueue, 0);
  objc_storeStrong((id *)&self->_playerClients, 0);
  objc_storeStrong((id *)&self->_activePlayer, 0);
}

void __60__MRNowPlayingClient_setActivePlayerPath_reason_completion___block_invoke_cold_1(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_193827000, v3, v4, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_0();
}

@end
