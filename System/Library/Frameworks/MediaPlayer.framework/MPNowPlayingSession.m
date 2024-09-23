@implementation MPNowPlayingSession

- (MPNowPlayingSession)initWithPlayerPath:(id)a3 routingContextID:(id)a4
{
  id v7;
  id v8;
  MPNowPlayingSession *v9;
  MPNowPlayingSession *v10;
  NSArray *currentAdTimeRanges;
  dispatch_queue_t v12;
  OS_dispatch_queue *privateQueue;
  uint64_t v14;
  MRPlayerPath *playerPath;
  void *v16;
  void *v17;
  uint64_t v18;
  MPNowPlayingInfoCenter *nowPlayingInfoCenter;
  MPNowPlayingInfoCenter *v20;
  MPNowPlayingInfoCenter *v21;
  uint64_t v22;
  MPRemoteCommandCenter *remoteCommandCenter;
  MPRemoteCommandCenter *v24;
  MPRemoteCommandCenter *v25;
  void *v26;
  void *v27;
  void *v29;
  objc_super v30;

  v7 = a3;
  v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)MPNowPlayingSession;
  v9 = -[MPNowPlayingSession init](&v30, sel_init);
  v10 = v9;
  if (v9)
  {
    currentAdTimeRanges = v9->_currentAdTimeRanges;
    v9->_currentAdTimeRanges = (NSArray *)MEMORY[0x1E0C9AA60];

    v12 = dispatch_queue_create(0, 0);
    privateQueue = v10->_privateQueue;
    v10->_privateQueue = (OS_dispatch_queue *)v12;

    objc_msgSend(MEMORY[0x1E0D4C5F8], "localResolvedPlayerPathFromPlayerPath:", v7);
    v14 = objc_claimAutoreleasedReturnValue();
    playerPath = v10->_playerPath;
    v10->_playerPath = (MRPlayerPath *)v14;

    objc_storeStrong((id *)&v10->_routingContextID, a4);
    objc_opt_class();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v16);
    if (initWithPlayerPath_routingContextID__onceToken != -1)
      dispatch_once(&initWithPlayerPath_routingContextID__onceToken, &__block_literal_global_22087);
    objc_msgSend((id)objc_opt_class(), "nowPlayingSessionForPlayerPath:", v10->_playerPath);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("MPNowPlayingSession.m"), 126, CFSTR("Cannot have two MPNowPlayingSession for the same playerPath: %@"), v7);

    }
    objc_msgSend((id)__nowPlayingSessionMap, "setObject:forKey:", v10, v7);
    objc_sync_exit(v16);

    +[MPNowPlayingInfoCenter infoCenterForPlayerPath:](MPNowPlayingInfoCenter, "infoCenterForPlayerPath:", v7);
    v18 = objc_claimAutoreleasedReturnValue();
    nowPlayingInfoCenter = v10->_nowPlayingInfoCenter;
    v10->_nowPlayingInfoCenter = (MPNowPlayingInfoCenter *)v18;

    if (!v10->_nowPlayingInfoCenter)
    {
      v20 = -[MPNowPlayingInfoCenter initWithPlayerPath:]([MPNowPlayingInfoCenter alloc], "initWithPlayerPath:", v10->_playerPath);
      v21 = v10->_nowPlayingInfoCenter;
      v10->_nowPlayingInfoCenter = v20;

    }
    +[MPRemoteCommandCenter commandCenterForPlayerPath:](MPRemoteCommandCenter, "commandCenterForPlayerPath:", v10->_playerPath);
    v22 = objc_claimAutoreleasedReturnValue();
    remoteCommandCenter = v10->_remoteCommandCenter;
    v10->_remoteCommandCenter = (MPRemoteCommandCenter *)v22;

    if (!v10->_remoteCommandCenter)
    {
      v24 = -[MPRemoteCommandCenter initWithPlayerPath:]([MPRemoteCommandCenter alloc], "initWithPlayerPath:", v7);
      v25 = v10->_remoteCommandCenter;
      v10->_remoteCommandCenter = v24;

    }
    v10->_canBecomeActive = MRMediaRemoteCanBecomeActivePlayer();
    MRMediaRemoteSetWantsNowPlayingNotifications();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v10, sel_activePlayerDidChangeNotification_, *MEMORY[0x1E0D4C768], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v10, sel_playerPictureInPictureEnabledDidChangeNotification_, *MEMORY[0x1E0D4CD90], 0);

  }
  return v10;
}

- (MPNowPlayingSession)initWithPlayers:(NSArray *)players
{
  NSArray *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  MPNowPlayingSession *v13;
  uint64_t v14;
  NSMutableSet *playerSet;
  NSMutableSet *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = players;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4C5F0]), "initWithIdentifier:displayName:", v7, v7);
  v9 = objc_alloc(MEMORY[0x1E0D4C5F8]);
  objc_msgSend(MEMORY[0x1E0D4C5B8], "localOrigin");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4C510], "localClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithOrigin:client:player:", v10, v11, v8);

  v13 = -[MPNowPlayingSession initWithPlayerPath:routingContextID:](self, "initWithPlayerPath:routingContextID:", v12, 0);
  if (v13)
  {
    v25 = v8;
    if (!v5 || !-[NSArray count](v5, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("MPNowPlayingSession.m"), 156, CFSTR("MPNowPlayingSession must be initialized with one or more AVPlayer instances."));

    }
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v5);
    v14 = objc_claimAutoreleasedReturnValue();
    playerSet = v13->_playerSet;
    v13->_playerSet = (NSMutableSet *)v14;

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v16 = v13->_playerSet;
    v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v20);
          -[MPNowPlayingSession mxSessionIDKeyPath](v13, "mxSessionIDKeyPath");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObserver:forKeyPath:options:context:", v13, v22, 1, 0);

          ++v20;
        }
        while (v18 != v20);
        v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v18);
    }

    -[MPNowPlayingSession updateMediaExperienceIDs](v13, "updateMediaExperienceIDs");
    v8 = v25;
  }

  return v13;
}

- (void)setAutomaticallyPublishesNowPlayingInfo:(BOOL)automaticallyPublishesNowPlayingInfo
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  MRPlayerPath *playerPath;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  MPNowPlayingSession *v26;
  __int16 v27;
  MRPlayerPath *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  _BOOL4 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (self->_automaticallyPublishesNowPlayingInfo != automaticallyPublishesNowPlayingInfo)
  {
    v3 = automaticallyPublishesNowPlayingInfo;
    v5 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (void *)objc_opt_class();
      playerPath = self->_playerPath;
      *(_DWORD *)buf = 138413314;
      v24 = v6;
      v25 = 2048;
      v26 = self;
      v27 = 2112;
      v28 = playerPath;
      v29 = 2080;
      v30 = "-[MPNowPlayingSession setAutomaticallyPublishesNowPlayingInfo:]";
      v31 = 1024;
      v32 = v3;
      v8 = v6;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_INFO, "<%@: %p - %@> %s %d", buf, 0x30u);

    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[MPNowPlayingSession playerSet](self, "playerSet", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (self->_automaticallyPublishesNowPlayingInfo)
            -[MPNowPlayingSession removePlayerObservers:](self, "removePlayerObservers:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
          else
            -[MPNowPlayingSession addPlayerObservers:](self, "addPlayerObservers:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
          objc_msgSend(v14, "currentItem");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            -[MPNowPlayingSession addPlayerItemObservers:](self, "addPlayerItemObservers:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    self->_automaticallyPublishesNowPlayingInfo = v3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v3)
      objc_msgSend(v16, "addObserver:selector:name:object:", self, sel__playerItemNowPlayingInfoDidChange_, CFSTR("MPPlayerItemNowPlayingInfoDidChangeNotification"), 0);
    else
      objc_msgSend(v16, "removeObserver:name:object:", self, CFSTR("MPPlayerItemNowPlayingInfoDidChangeNotification"), 0);

    -[MPNowPlayingSession extractNowPlayingInfoFromPlayersAndUpdateAdRanges](self, "extractNowPlayingInfoFromPlayersAndUpdateAdRanges");
    -[MPNowPlayingSession updateNowPlayingInfo](self, "updateNowPlayingInfo");
  }
}

- (MPNowPlayingInfoCenter)nowPlayingInfoCenter
{
  NSObject *v3;
  uint8_t v5[16];

  if (-[MPNowPlayingSession automaticallyPublishesNowPlayingInfo](self, "automaticallyPublishesNowPlayingInfo"))
  {
    v3 = os_log_create("MediaPlayer", "RuntimeIssues");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_fault_impl(&dword_193B9B000, v3, OS_LOG_TYPE_FAULT, "WARNING: using MPNowPlayingInfoCenter is unsupported when using automatic publishing.", v5, 2u);
    }

  }
  return self->_nowPlayingInfoCenter;
}

- (void)dealloc
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  MRMediaRemoteSetWantsNowPlayingNotifications();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_playerSet;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        -[MPNowPlayingSession mxSessionIDKeyPath](self, "mxSessionIDKeyPath");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObserver:forKeyPath:", self, v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v10.receiver = self;
  v10.super_class = (Class)MPNowPlayingSession;
  -[MPNowPlayingSession dealloc](&v10, sel_dealloc);
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  MRPlayerPath *playerPath;
  id v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  MPNowPlayingSession *v11;
  __int16 v12;
  MRPlayerPath *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_invalidated = 1;
  v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class();
    playerPath = self->_playerPath;
    v8 = 138412802;
    v9 = v4;
    v10 = 2048;
    v11 = self;
    v12 = 2112;
    v13 = playerPath;
    v6 = v4;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "<%@: %p - %@> invalidated", (uint8_t *)&v8, 0x20u);

  }
  -[MPNowPlayingInfoCenter invalidate](self->_nowPlayingInfoCenter, "invalidate");
  -[MPRemoteCommandCenter invalidate](self->_remoteCommandCenter, "invalidate");
  objc_opt_class();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  objc_msgSend((id)__nowPlayingSessionMap, "removeObjectForKey:", self->_playerPath);
  objc_sync_exit(v7);

  MRMediaRemoteRemovePlayer();
}

- (NSArray)players
{
  return (NSArray *)-[NSMutableSet allObjects](self->_playerSet, "allObjects");
}

- (id)mediaExperienceIDs
{
  return (id)-[NSSet copy](self->_mxSessionIDs, "copy");
}

- (void)addPlayer:(AVPlayer *)player
{
  void *v4;
  _BOOL4 v5;
  AVPlayer *v6;
  void *v7;
  AVPlayer *v8;

  v8 = player;
  -[NSMutableSet addObject:](self->_playerSet, "addObject:", v8);
  -[MPNowPlayingSession mxSessionIDKeyPath](self, "mxSessionIDKeyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayer addObserver:forKeyPath:options:context:](v8, "addObserver:forKeyPath:options:context:", self, v4, 1, 0);

  -[MPNowPlayingSession updateMediaExperienceIDs](self, "updateMediaExperienceIDs");
  v5 = -[MPNowPlayingSession automaticallyPublishesNowPlayingInfo](self, "automaticallyPublishesNowPlayingInfo");
  v6 = v8;
  if (v5)
  {
    -[MPNowPlayingSession addPlayerObservers:](self, "addPlayerObservers:", v8);
    -[AVPlayer currentItem](v8, "currentItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[MPNowPlayingSession addPlayerItemObservers:](self, "addPlayerItemObservers:", v7);

    v6 = v8;
  }

}

- (void)removePlayer:(AVPlayer *)player
{
  NSMutableSet *playerSet;
  AVPlayer *v5;
  void *v6;
  void *v7;
  id v8;

  playerSet = self->_playerSet;
  v5 = player;
  -[NSMutableSet removeObject:](playerSet, "removeObject:", v5);
  -[MPNowPlayingSession mxSessionIDKeyPath](self, "mxSessionIDKeyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayer removeObserver:forKeyPath:](v5, "removeObserver:forKeyPath:", self, v6);

  -[MPNowPlayingSession updateMediaExperienceIDs](self, "updateMediaExperienceIDs");
  -[MPNowPlayingSession removePlayerObservers:](self, "removePlayerObservers:", v5);
  -[AVPlayer currentItem](v5, "currentItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v8)
  {
    -[MPNowPlayingSession removePlayerItemObservers:](self, "removePlayerItemObservers:", v8);
    v7 = v8;
  }

}

- (void)updateMediaExperienceIDs
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSSet *v12;
  NSSet *mxSessionIDs;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[NSMutableSet count](self->_playerSet, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_playerSet;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "mxSessionID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "mxSessionID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (NSSet *)objc_msgSend(v3, "copy");
  mxSessionIDs = self->_mxSessionIDs;
  self->_mxSessionIDs = v12;

  if (!self->_invalidated)
    MRMediaRemoteSetMXSessionIDForPlayer();

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  _BYTE v21[80];

  v10 = a3;
  v11 = a5;
  if (-[NSMutableSet containsObject:](self->_playerSet, "containsObject:", a4))
  {
    -[MPNowPlayingSession mxSessionIDKeyPath](self, "mxSessionIDKeyPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "isEqualToString:", v12);

    if (v13)
    {
      -[MPNowPlayingSession updateMediaExperienceIDs](self, "updateMediaExperienceIDs");
      goto LABEL_20;
    }
  }
  if ((void *)MPNowPlayingPublisherPlayerItemObserverContext == a6)
  {
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0CB2CC8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v14, "isEqual:", v16);

      if ((v17 & 1) == 0)
        -[MPNowPlayingSession removePlayerItemObservers:](self, "removePlayerItemObservers:", v14);
    }
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v15, "isEqual:", v18);

      if ((v19 & 1) == 0)
      {
        -[MPNowPlayingSession addPlayerItemObservers:](self, "addPlayerItemObservers:", v15);
        -[MPNowPlayingSession extractNowPlayingInfoFromPlayersAndUpdateAdRanges](self, "extractNowPlayingInfoFromPlayersAndUpdateAdRanges");
      }
    }
    -[MPNowPlayingSession updateNowPlayingInfo](self, "updateNowPlayingInfo");

    goto LABEL_19;
  }
  if ((void *)MPNowPlayingPublisherPlayerItemDurationObserverContext == a6)
  {
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v20;
    memset(&v21[56], 0, 24);
    if (!v20 || (objc_msgSend(v20, "CMTimeValue"), (~*(_DWORD *)&v21[68] & 0x11) != 0))
    {
      memset(&v21[32], 0, 24);
      *(CMTime *)v21 = *(CMTime *)&v21[56];
      -[MPNowPlayingSession netTimeForGrossTime:](self, "netTimeForGrossTime:", v21);
      *(CMTime *)v21 = *(CMTime *)&v21[32];
      -[MPNowPlayingSession setCurrentAssetNetDuration:](self, "setCurrentAssetNetDuration:", CMTimeGetSeconds((CMTime *)v21));
    }
    -[MPNowPlayingSession updateNowPlayingInfo](self, "updateNowPlayingInfo");
LABEL_19:

    goto LABEL_20;
  }
  if ((void *)MPNowPlayingPublisherPlayerTimeControlObserverContext == a6)
    -[MPNowPlayingSession updateNowPlayingInfo](self, "updateNowPlayingInfo");
LABEL_20:

}

- (id)mxSessionIDKeyPath
{
  return NSStringFromSelector(sel_mxSessionID);
}

- (void)updateAudioSession:(id)a3
{
  MPNowPlayingSession *v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_audioSession, a3);
  objc_sync_exit(v5);

  if (!v5->_invalidated)
  {
    objc_msgSend(v7, "opaqueSessionID");
    MRMediaRemoteSetAVAudioSessionOpaqueSessionIDForPlayer();
  }
  -[MPNowPlayingSession delegate](v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "nowPlayingSession:audioSessionDidChange:", v5, v7);

}

- (unsigned)audioSessionID
{
  void *v2;
  unsigned int v3;

  -[MPNowPlayingSession audioSession](self, "audioSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "opaqueSessionID");

  return v3;
}

- (AVAudioSession)audioSession
{
  MPNowPlayingSession *v2;
  AVAudioSession *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_audioSession;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCanBecomeActive:(BOOL)a3
{
  id WeakRetained;

  if (self->_canBecomeActive != a3)
  {
    self->_canBecomeActive = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "nowPlayingSessionDidChangeCanBecomeActive:", self);

  }
}

- (void)becomeActiveIfPossibleWithCompletion:(void *)completion
{
  id v4;
  MPNowPlayingInfoCenter *nowPlayingInfoCenter;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = completion;
  nowPlayingInfoCenter = self->_nowPlayingInfoCenter;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__MPNowPlayingSession_becomeActiveIfPossibleWithCompletion___block_invoke;
  v7[3] = &unk_1E3161878;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[MPNowPlayingInfoCenter _becomeActiveIfPossibleWithCompletion:](nowPlayingInfoCenter, "_becomeActiveIfPossibleWithCompletion:", v7);

}

- (void)setActive:(BOOL)a3
{
  id WeakRetained;

  if (self->_active != a3)
  {
    self->_active = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "nowPlayingSessionDidChangeActive:", self);

  }
}

- (void)setPictureInPictureEnabled:(BOOL)a3
{
  if (!self->_invalidated && self->_pictureInPictureEnabled != a3)
  {
    self->_pictureInPictureEnabled = a3;
    MRMediaRemoteSetPictureInPictureStatusForPlayer();
  }
}

- (void)extractNowPlayingInfoFromPlayersAndUpdateAdRanges
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  os_log_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  id v40;
  void *v41;
  void *v42;
  MPNowPlayingSession *v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  MPNowPlayingSession *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  _QWORD v61[6];

  v61[3] = *MEMORY[0x1E0C80C00];
  v40 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v61[0] = CFSTR("MPNowPlayingInfoPropertyPlaybackRate");
  v61[1] = CFSTR("MPNowPlayingInfoPropertyElapsedPlaybackTime");
  v61[2] = CFSTR("playbackDuration");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 3);
  v4 = objc_claimAutoreleasedReturnValue();
  v43 = self;
  -[MPNowPlayingSession players](self, "players");
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
  v41 = v3;
  v42 = (void *)v4;
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v50 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v9, "currentItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "nowPlayingInfo");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            v14 = -[NSObject mutableCopy](v12, "mutableCopy");
            -[NSObject removeObjectsForKeys:](v14, "removeObjectsForKeys:", v4);
            objc_msgSend(v3, "addEntriesFromDictionary:", v14);
          }
          else
          {
            v14 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              v16 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412802;
              v55 = v16;
              v56 = 2048;
              v57 = v43;
              v58 = 2112;
              v59 = v11;
              v17 = v16;
              _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_DEFAULT, "<%@: %p> player item has no nowPlayingInfo dictionary: %@", buf, 0x20u);

              v3 = v41;
            }
          }
        }
        else
        {
          v13 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            goto LABEL_14;
          v15 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412802;
          v55 = v15;
          v56 = 2048;
          v57 = v43;
          v4 = (uint64_t)v42;
          v58 = 2112;
          v59 = v9;
          v14 = v15;
          _os_log_impl(&dword_193B9B000, v13, OS_LOG_TYPE_DEFAULT, "<%@: %p> player has no player item: %@", buf, 0x20u);
        }

LABEL_14:
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    }
    while (v6);
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("MPNowPlayingInfoPropertyAdTimeRanges"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v46 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v40, "addObject:", v24);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      }
      while (v21);
    }

    objc_msgSend(v40, "allObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sortedArrayUsingComparator:", &__block_literal_global_62);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "objectForKey:", CFSTR("playbackDuration"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[MPNowPlayingSession hasInvalidAdTimeRange:totalDuration:](v43, "hasInvalidAdTimeRange:totalDuration:", v26, v27))
    {

      -[MPRemoteCommandCenter seekForwardCommand](v43->_remoteCommandCenter, "seekForwardCommand");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setForceDisabled:", 1);

      -[MPRemoteCommandCenter specialSeekForwardCommand](v43->_remoteCommandCenter, "specialSeekForwardCommand");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setForceDisabled:", 1);

      -[MPRemoteCommandCenter seekForwardCommand](v43->_remoteCommandCenter, "seekForwardCommand");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setDisabledReason:", 3);

      -[MPRemoteCommandCenter specialSeekForwardCommand](v43->_remoteCommandCenter, "specialSeekForwardCommand");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setDisabledReason:", 3);
      v26 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      -[MPRemoteCommandCenter seekForwardCommand](v43->_remoteCommandCenter, "seekForwardCommand");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setForceDisabled:", 0);

      -[MPRemoteCommandCenter specialSeekForwardCommand](v43->_remoteCommandCenter, "specialSeekForwardCommand");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setForceDisabled:", 0);
    }

    -[MPNowPlayingSession currentAdTimeRanges](v43, "currentAdTimeRanges");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isEqual:", v26);

    if ((v34 & 1) == 0)
      -[MPNowPlayingSession setCurrentAdTimeRanges:](v43, "setCurrentAdTimeRanges:", v26);

    v3 = v41;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("MPNowPlayingInfoPropertyCreditsStartTime"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0.0;
  if (v35)
  {
    objc_opt_class();
    v37 = v40;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v35, "doubleValue");
      v36 = v38;
    }
  }
  else
  {
    v37 = v40;
  }
  -[MPNowPlayingSession currentAssetNetCreditsStartTime](v43, "currentAssetNetCreditsStartTime");
  if (v39 != v36)
    -[MPNowPlayingSession setCurrentAssetNetCreditsStartTime:](v43, "setCurrentAssetNetCreditsStartTime:", v36);
  -[MPNowPlayingSession setBaseNowPlayingInfo:](v43, "setBaseNowPlayingInfo:", v3);

}

- (BOOL)hasInvalidAdTimeRange:(id)a3 totalDuration:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  double Seconds;
  float v10;
  uint64_t *v11;
  char v12;
  CMTime v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v5 = a3;
  v6 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3810000000;
  v23 = &unk_193F4554F;
  v24 = *MEMORY[0x1E0CA2E68];
  v25 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__MPNowPlayingSession_hasInvalidAdTimeRange_totalDuration___block_invoke;
  v15[3] = &unk_1E3158908;
  v18 = &v26;
  v7 = v6;
  v16 = v7;
  v8 = v5;
  v17 = v8;
  v19 = &v20;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v15);
  if (v7)
  {
    v14 = *(CMTime *)(v21 + 4);
    Seconds = CMTimeGetSeconds(&v14);
    objc_msgSend(v7, "floatValue");
    v11 = v27;
    if (Seconds >= v10)
      *((_BYTE *)v27 + 24) = 1;
  }
  else
  {
    v11 = v27;
  }
  v12 = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

- (void)setCurrentAssetNetCreditsStartTime:(double)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;
  CMTime time;
  CMTime v24[2];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  self->_currentAssetNetCreditsStartTime = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[MPNowPlayingSession currentAdTimeRanges](self, "currentAdTimeRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v26;
    v8 = a3;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        memset(v24, 0, sizeof(v24));
        if (v10)
          objc_msgSend(v10, "timeRange");
        time = v24[0];
        if (CMTimeGetSeconds(&time) < a3)
        {
          time = v24[1];
          v8 = v8 + CMTimeGetSeconds(&time);
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v6);
  }
  else
  {
    v8 = a3;
  }

  -[MPNowPlayingSession players](self, "players");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  memset(v24, 0, 24);
  CMTimeMakeWithSeconds(v24, v8, 1000000000);
  objc_initWeak(&location, self);
  time = v24[0];
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &time);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPNowPlayingSession privateQueue](self, "privateQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __58__MPNowPlayingSession_setCurrentAssetNetCreditsStartTime___block_invoke;
  v20 = &unk_1E315E5D0;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v12, "addBoundaryTimeObserverForTimes:queue:usingBlock:", v14, v15, &v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPNowPlayingSession setCreditsTimeObserverToken:](self, "setCreditsTimeObserverToken:", v16, v17, v18, v19, v20);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (void)setCurrentAdTimeRanges:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  _OWORD v31[2];
  CMTime rhs;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CMTime lhs;
  CMTime v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id location;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  objc_storeStrong((id *)&self->_currentAdTimeRanges, a3);
  -[MPNowPlayingSession players](self, "players");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[MPNowPlayingSession currentAdTimeRanges](self, "currentAdTimeRanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v44 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E0CB3B18];
        if (v10)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "timeRange");
        }
        else
        {
          v39 = 0u;
          v40 = 0u;
          v38 = 0u;
        }
        v41 = v38;
        v42 = v39;
        objc_msgSend(v11, "valueWithCMTime:", &v41);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v12);

        v13 = (void *)MEMORY[0x1E0CB3B18];
        if (v10)
        {
          objc_msgSend(v10, "timeRange");
          *(_OWORD *)&lhs.value = v33;
          lhs.epoch = v34;
          objc_msgSend(v10, "timeRange");
        }
        else
        {
          v34 = 0u;
          v35 = 0u;
          v33 = 0u;
          memset(&lhs, 0, sizeof(lhs));
          v30 = 0u;
          memset(v31, 0, sizeof(v31));
        }
        rhs = *(CMTime *)((char *)v31 + 8);
        CMTimeAdd(&v37, &lhs, &rhs);
        objc_msgSend(v13, "valueWithCMTime:", &v37);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v14);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v7);
  }

  v15 = (void *)objc_msgSend(v25, "copy");
  -[MPNowPlayingSession privateQueue](self, "privateQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __46__MPNowPlayingSession_setCurrentAdTimeRanges___block_invoke;
  v28[3] = &unk_1E315E5D0;
  objc_copyWeak(&v29, &location);
  objc_msgSend(v23, "addBoundaryTimeObserverForTimes:queue:usingBlock:", v15, v16, v28);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPNowPlayingSession setAdTimeRangesStartObserverToken:](self, "setAdTimeRangesStartObserverToken:", v18);
  v19 = (void *)objc_msgSend(v24, "copy");
  -[MPNowPlayingSession privateQueue](self, "privateQueue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = __46__MPNowPlayingSession_setCurrentAdTimeRanges___block_invoke_68;
  v26[3] = &unk_1E315E5D0;
  objc_copyWeak(&v27, &location);
  objc_msgSend(v23, "addBoundaryTimeObserverForTimes:queue:usingBlock:", v19, v20, v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPNowPlayingSession setAdTimeRangesEndObserverToken:](self, "setAdTimeRangesEndObserverToken:", v21);
  objc_destroyWeak(&v27);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

- (float)effectivePlaybackRateWithPlayer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CMTimeEpoch v10;
  uint64_t i;
  void *v12;
  float v13;
  float v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  __int128 v21;
  CMTime start;
  CMTime time2;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CMTime v28;
  CMTimeRange time1;
  CMTimeRange buf;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "timeControlStatus") == 2)
  {
    memset(&v28, 0, sizeof(v28));
    if (v4)
      objc_msgSend(v4, "currentTime");
    -[MPNowPlayingSession currentAdTimeRanges](self, "currentAdTimeRanges");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v6 = v5;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v25;
        v21 = *MEMORY[0x1E0CA2E68];
        v10 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v25 != v9)
              objc_enumerationMutation(v6);
            v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            memset(&buf, 0, sizeof(buf));
            if (v12)
              objc_msgSend(v12, "timeRange");
            *(_OWORD *)&time1.start.value = v21;
            time1.start.epoch = v10;
            time2 = v28;
            if (CMTimeCompare(&time1.start, &time2) >= 1)
            {
              *(_OWORD *)&time1.start.value = v21;
              time1.start.epoch = v10;
              time2 = buf.start;
              if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0)
              {
                *(_OWORD *)&time1.start.value = *(_OWORD *)&buf.start.value;
                time1.start.epoch = buf.start.epoch;
                time2 = v28;
                CMTimeAdd(&start, &time1.start, &time2);
                time2 = buf.duration;
                CMTimeRangeMake(&time1, &start, &time2);
                buf = time1;
              }
            }
            time1 = buf;
            time2 = v28;
            if (CMTimeRangeContainsTime(&time1, &time2))
            {
              v17 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                v18 = (void *)objc_opt_class();
                LODWORD(time1.start.value) = 138412546;
                *(CMTimeValue *)((char *)&time1.start.value + 4) = (CMTimeValue)v18;
                LOWORD(time1.start.flags) = 2048;
                *(_QWORD *)((char *)&time1.start.flags + 2) = self;
                v19 = v18;
                _os_log_impl(&dword_193B9B000, v17, OS_LOG_TYPE_DEFAULT, "<%@: %p> effective playback rate 0 due to ad", (uint8_t *)&time1, 0x16u);

              }
              v14 = 0.0;
              goto LABEL_26;
            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
          if (v8)
            continue;
          break;
        }
      }

    }
    objc_msgSend(v4, "rate", v21);
    v14 = v13;
LABEL_26:

  }
  else
  {
    v15 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf.start.value) = 138412546;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = objc_opt_class();
      LOWORD(buf.start.flags) = 2048;
      *(_QWORD *)((char *)&buf.start.flags + 2) = self;
      v16 = *(id *)((char *)&buf.start.value + 4);
      _os_log_impl(&dword_193B9B000, v15, OS_LOG_TYPE_DEBUG, "<%@: %p> effective playback rate 0 due to non-playing time control", (uint8_t *)&buf, 0x16u);

    }
    v14 = 0.0;
  }

  return v14;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)netTimeForGrossTime:(SEL)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  CMTime v11;
  CMTime lhs;
  _QWORD v13[5];
  __int128 v14;
  int64_t var3;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  uint64_t v21;

  if ((a4->var2 & 0x11) == 1)
  {
    v6 = self;
    -[$3CC8671D27C23BF42ADDB32F2B5E48AE currentAdTimeRanges](self, "currentAdTimeRanges");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x3810000000;
      v19 = &unk_193F4554F;
      v20 = *MEMORY[0x1E0CA2E68];
      v21 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      -[$3CC8671D27C23BF42ADDB32F2B5E48AE currentAdTimeRanges](v6, "currentAdTimeRanges");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __43__MPNowPlayingSession_netTimeForGrossTime___block_invoke;
      v13[3] = &unk_1E3158930;
      v14 = *(_OWORD *)&a4->var0;
      var3 = a4->var3;
      v13[4] = &v16;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);

      lhs = (CMTime)*a4;
      v11 = *(CMTime *)(v17 + 4);
      CMTimeSubtract((CMTime *)retstr, &lhs, &v11);
      _Block_object_dispose(&v16, 8);
    }
    else
    {
      v10 = MEMORY[0x1E0CA2E18];
      *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
      retstr->var3 = *(_QWORD *)(v10 + 16);
    }

  }
  else
  {
    v9 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
    retstr->var3 = *(_QWORD *)(v9 + 16);
  }
  return self;
}

- (void)updateNowPlayingInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  double Seconds;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  uint64_t v21;
  CMTime time;
  __int128 v23;
  uint64_t v24;

  -[MPNowPlayingSession players](self, "players");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[MPNowPlayingInfoCenter setNowPlayingInfo:](self->_nowPlayingInfoCenter, "setNowPlayingInfo:", 0);
    goto LABEL_15;
  }
  -[MPNowPlayingSession baseNowPlayingInfo](self, "baseNowPlayingInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[MPNowPlayingSession effectivePlaybackRateWithPlayer:](self, "effectivePlaybackRateWithPlayer:", v4);
  objc_msgSend(v8, "numberWithFloat:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("MPNowPlayingInfoPropertyPlaybackRate"));

  v23 = 0uLL;
  v24 = 0;
  if (!v4 || (objc_msgSend(v4, "currentTime"), (~HIDWORD(v23) & 0x11) != 0))
  {
    v20 = v23;
    v21 = v24;
    -[MPNowPlayingSession netTimeForGrossTime:](self, "netTimeForGrossTime:", &v20);
    Seconds = CMTimeGetSeconds(&time);
    -[MPNowPlayingSession currentAssetNetDuration](self, "currentAssetNetDuration");
    v14 = v13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("playbackDuration"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", Seconds);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("MPNowPlayingInfoPropertyElapsedPlaybackTime"));

    -[MPNowPlayingSession currentAssetNetCreditsStartTime](self, "currentAssetNetCreditsStartTime");
    if (v17 <= 0.0)
      v18 = v14;
    else
      v18 = v17;
    v19 = 0.0;
    if (v18 > 0.0)
      v19 = Seconds / v18 * 100.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", round(v19) / 100.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("MPNowPlayingInfoPropertyPlaybackProgress");
    goto LABEL_12;
  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("MPNowPlayingInfoPropertyIsLiveStream"));
  objc_msgSend(v5, "currentDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = CFSTR("MPNowPlayingInfoPropertyCurrentPlaybackDate");
LABEL_12:
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v11);
  }

  -[MPNowPlayingInfoCenter setNowPlayingInfo:](self->_nowPlayingInfoCenter, "setNowPlayingInfo:", v7);
LABEL_15:

}

- (void)addPlayerObservers:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_playerRateDidChange_, *MEMORY[0x1E0C8AC90], v5);
  NSStringFromSelector(sel_currentItem);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, v6, 3, MPNowPlayingPublisherPlayerItemObserverContext);

  NSStringFromSelector(sel_timeControlStatus);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, v7, 0, MPNowPlayingPublisherPlayerTimeControlObserverContext);

}

- (void)removePlayerObservers:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", self, *MEMORY[0x1E0C8AC90], v5);
  NSStringFromSelector(sel_currentItem);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, v6, MPNowPlayingPublisherPlayerItemObserverContext);

  NSStringFromSelector(sel_timeControlStatus);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, v7, MPNowPlayingPublisherPlayerTimeControlObserverContext);

}

- (void)addPlayerItemObservers:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_playerItemTimeJumped_, *MEMORY[0x1E0C8AC78], v5);
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_playerItemPlaybackStalled_, *MEMORY[0x1E0C8AC70], v5);
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_playerItemDidPlayToEnd_, *MEMORY[0x1E0C8AC48], v5);
  NSStringFromSelector(sel_duration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, v6, 1, MPNowPlayingPublisherPlayerItemDurationObserverContext);

}

- (void)removePlayerItemObservers:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x1E0C8AC78], v5);
  objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x1E0C8AC70], v5);
  objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x1E0C8AC48], v5);
  NSStringFromSelector(sel_duration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, v6, MPNowPlayingPublisherPlayerItemDurationObserverContext);

}

- (void)playerRateDidChange:(id)a3
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  MPNowPlayingSession *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412546;
    v7 = (id)objc_opt_class();
    v8 = 2048;
    v9 = self;
    v5 = v7;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEBUG, "<%@: %p> playerRateDidChange", (uint8_t *)&v6, 0x16u);

  }
  -[MPNowPlayingSession updateNowPlayingInfo](self, "updateNowPlayingInfo");
}

- (void)_playerItemNowPlayingInfoDidChange:(id)a3
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  MPNowPlayingSession *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412546;
    v7 = (id)objc_opt_class();
    v8 = 2048;
    v9 = self;
    v5 = v7;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEBUG, "<%@: %p> _playerItemNowPlayingInfoDidChange", (uint8_t *)&v6, 0x16u);

  }
  -[MPNowPlayingSession extractNowPlayingInfoFromPlayersAndUpdateAdRanges](self, "extractNowPlayingInfoFromPlayersAndUpdateAdRanges");
  -[MPNowPlayingSession updateNowPlayingInfo](self, "updateNowPlayingInfo");
}

- (void)playerItemTimeJumped:(id)a3
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  MPNowPlayingSession *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412546;
    v7 = (id)objc_opt_class();
    v8 = 2048;
    v9 = self;
    v5 = v7;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEBUG, "<%@: %p> playerItemTimeJumped", (uint8_t *)&v6, 0x16u);

  }
  -[MPNowPlayingSession updateNowPlayingInfo](self, "updateNowPlayingInfo");
}

- (void)playerItemPlaybackStalled:(id)a3
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  MPNowPlayingSession *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412546;
    v7 = (id)objc_opt_class();
    v8 = 2048;
    v9 = self;
    v5 = v7;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEBUG, "<%@: %p> playerItemPlaybackStalled", (uint8_t *)&v6, 0x16u);

  }
  -[MPNowPlayingSession updateNowPlayingInfo](self, "updateNowPlayingInfo");
}

- (void)playerItemDidPlayToEnd:(id)a3
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  MPNowPlayingSession *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412546;
    v7 = (id)objc_opt_class();
    v8 = 2048;
    v9 = self;
    v5 = v7;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEBUG, "<%@: %p> playerItemDidPlayToEnd", (uint8_t *)&v6, 0x16u);

  }
  -[MPNowPlayingSession updateNowPlayingInfo](self, "updateNowPlayingInfo");
}

- (void)activePlayerDidChangeNotification:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__MPNowPlayingSession_activePlayerDidChangeNotification___block_invoke;
  v6[3] = &unk_1E31635F8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)playerPictureInPictureEnabledDidChangeNotification:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__MPNowPlayingSession_playerPictureInPictureEnabledDidChangeNotification___block_invoke;
  v6[3] = &unk_1E31635F8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)endpointWithCompletion:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPNowPlayingSession.m"), 801, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v6 = objc_alloc_init(MEMORY[0x1E0D4C4D8]);
  -[MPNowPlayingSession routingContextID](self, "routingContextID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__MPNowPlayingSession_endpointWithCompletion___block_invoke;
  v10[3] = &unk_1E3161850;
  v11 = v5;
  v8 = v5;
  objc_msgSend(v6, "searchEndpointsForRoutingContextUID:timeout:reason:queue:completion:", v7, CFSTR("MPNowPlayingSession.endpointWithCompletion"), MEMORY[0x1E0C80D38], v10, 7.0);

}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (BOOL)automaticallyPublishesNowPlayingInfo
{
  return self->_automaticallyPublishesNowPlayingInfo;
}

- (void)setNowPlayingInfoCenter:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingInfoCenter, a3);
}

- (MPRemoteCommandCenter)remoteCommandCenter
{
  return self->_remoteCommandCenter;
}

- (BOOL)canBecomeActive
{
  return self->_canBecomeActive;
}

- (BOOL)isActive
{
  return self->_active;
}

- (NSMutableSet)playerSet
{
  return self->_playerSet;
}

- (void)setPlayerSet:(id)a3
{
  objc_storeStrong((id *)&self->_playerSet, a3);
}

- (NSArray)currentAdTimeRanges
{
  return self->_currentAdTimeRanges;
}

- (double)currentAssetNetDuration
{
  return self->_currentAssetNetDuration;
}

- (void)setCurrentAssetNetDuration:(double)a3
{
  self->_currentAssetNetDuration = a3;
}

- (double)currentAssetNetCreditsStartTime
{
  return self->_currentAssetNetCreditsStartTime;
}

- (NSDictionary)baseNowPlayingInfo
{
  return self->_baseNowPlayingInfo;
}

- (void)setBaseNowPlayingInfo:(id)a3
{
  objc_storeStrong((id *)&self->_baseNowPlayingInfo, a3);
}

- (OS_dispatch_queue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (id)creditsTimeObserverToken
{
  return self->_creditsTimeObserverToken;
}

- (void)setCreditsTimeObserverToken:(id)a3
{
  objc_storeStrong(&self->_creditsTimeObserverToken, a3);
}

- (id)adTimeRangesStartObserverToken
{
  return self->_adTimeRangesStartObserverToken;
}

- (void)setAdTimeRangesStartObserverToken:(id)a3
{
  objc_storeStrong(&self->_adTimeRangesStartObserverToken, a3);
}

- (id)adTimeRangesEndObserverToken
{
  return self->_adTimeRangesEndObserverToken;
}

- (void)setAdTimeRangesEndObserverToken:(id)a3
{
  objc_storeStrong(&self->_adTimeRangesEndObserverToken, a3);
}

- (NSSet)mxSessionIDs
{
  return self->_mxSessionIDs;
}

- (BOOL)isPictureInPictureEnabled
{
  return self->_pictureInPictureEnabled;
}

- (NSString)routingContextID
{
  return self->_routingContextID;
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_routingContextID, 0);
  objc_storeStrong((id *)&self->_mxSessionIDs, 0);
  objc_storeStrong(&self->_adTimeRangesEndObserverToken, 0);
  objc_storeStrong(&self->_adTimeRangesStartObserverToken, 0);
  objc_storeStrong(&self->_creditsTimeObserverToken, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_baseNowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_currentAdTimeRanges, 0);
  objc_storeStrong((id *)&self->_playerSet, 0);
  objc_storeStrong((id *)&self->_remoteCommandCenter, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfoCenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioSession, 0);
}

uint64_t __46__MPNowPlayingSession_endpointWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__MPNowPlayingSession_playerPictureInPictureEnabledDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
  {
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CDC8]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 144);
    if (objc_msgSend(v3, "isEqual:", v4))
    {
      v5 = v4;
      MRMediaRemoteGetPictureInPictureStatusForPlayer();

    }
  }
}

uint64_t __74__MPNowPlayingSession_playerPictureInPictureEnabledDidChangeNotification___block_invoke_2(uint64_t result, char a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v2 + 8))
  {
    *(_BYTE *)(v2 + 27) = a2;
    return objc_msgSend(*(id *)(result + 32), "setCanBecomeActive:", MRMediaRemoteCanBecomeActivePlayer());
  }
  return result;
}

void __57__MPNowPlayingSession_activePlayerDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
  {
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CDC8]);
    v3 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setActive:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "isEqual:", v3));
    objc_msgSend(*(id *)(a1 + 32), "setCanBecomeActive:", MRMediaRemoteCanBecomeActivePlayer());

  }
}

void __43__MPNowPlayingSession_netTimeForGrossTime___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  _OWORD *v8;
  CMTime *v9;
  _QWORD v10[4];
  CMTime v11;
  CMTime v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CMTime time1;
  CMTime v17;
  CMTime v18;
  CMTime lhs;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CMTime rhs;
  CMTime time;
  CMTimeRange range;

  v6 = a2;
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "timeRange");
  else
    memset(&range, 0, sizeof(range));
  v8 = (_OWORD *)(a1 + 40);
  time = *(CMTime *)(a1 + 40);
  if (CMTimeRangeContainsTime(&range, &time))
  {
    memset(&time, 0, sizeof(time));
    if (v7)
    {
      objc_msgSend(v7, "timeRange");
    }
    else
    {
      v21 = 0u;
      v22 = 0u;
      v20 = 0u;
    }
    *(_OWORD *)&rhs.value = v20;
    rhs.epoch = v21;
    *(_OWORD *)&lhs.value = *v8;
    lhs.epoch = *(_QWORD *)(a1 + 56);
    CMTimeSubtract(&time, &lhs, &rhs);
    lhs = *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
    v17 = time;
    CMTimeAdd(&v18, &lhs, &v17);
    *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = v18;
LABEL_13:
    *a4 = 1;
    goto LABEL_14;
  }
  if (v7)
  {
    objc_msgSend(v7, "timeRange");
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
  }
  *(_OWORD *)&time1.value = v13;
  time1.epoch = v14;
  *(_OWORD *)&time.value = *v8;
  time.epoch = *(_QWORD *)(a1 + 56);
  if ((CMTimeCompare(&time1, &time) & 0x80000000) == 0)
    goto LABEL_13;
  v9 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
  if (v7)
    objc_msgSend(v7, "timeRange");
  else
    memset(v10, 0, sizeof(v10));
  v11 = *(CMTime *)&v10[1];
  time = *v9;
  CMTimeAdd(&v12, &time, &v11);
  *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = v12;
LABEL_14:

}

void __46__MPNowPlayingSession_setCurrentAdTimeRanges___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412546;
      v8 = (id)objc_opt_class();
      v9 = 2048;
      v10 = WeakRetained;
      v3 = v8;
      _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "<%@: %p> enter ad break start boundary time observer block", (uint8_t *)&v7, 0x16u);

    }
    objc_msgSend(WeakRetained, "updateNowPlayingInfo");
    v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_opt_class();
      v7 = 138412546;
      v8 = v5;
      v9 = 2048;
      v10 = WeakRetained;
      v6 = v5;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "<%@: %p> exit ad break start boundary time observer block", (uint8_t *)&v7, 0x16u);

    }
  }

}

void __46__MPNowPlayingSession_setCurrentAdTimeRanges___block_invoke_68(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412546;
      v8 = (id)objc_opt_class();
      v9 = 2048;
      v10 = WeakRetained;
      v3 = v8;
      _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "<%@: %p> enter ad break end boundary time observer block", (uint8_t *)&v7, 0x16u);

    }
    objc_msgSend(WeakRetained, "updateNowPlayingInfo");
    v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_opt_class();
      v7 = 138412546;
      v8 = v5;
      v9 = 2048;
      v10 = WeakRetained;
      v6 = v5;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "<%@: %p> exit ad break end boundary time observer block", (uint8_t *)&v7, 0x16u);

    }
  }

}

void __58__MPNowPlayingSession_setCurrentAssetNetCreditsStartTime___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412546;
      v8 = (id)objc_opt_class();
      v9 = 2048;
      v10 = WeakRetained;
      v3 = v8;
      _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "<%@: %p> enter credits boundary time observer block", (uint8_t *)&v7, 0x16u);

    }
    objc_msgSend(WeakRetained, "updateNowPlayingInfo");
    v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_opt_class();
      v7 = 138412546;
      v8 = v5;
      v9 = 2048;
      v10 = WeakRetained;
      v6 = v5;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "<%@: %p> exit credits boundary time observer block", (uint8_t *)&v7, 0x16u);

    }
  }

}

void __59__MPNowPlayingSession_hasInvalidAdTimeRange_totalDuration___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  CMTime v14;
  CMTime v15;
  CMTime duration;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange time2;
  CMTimeRange time1;
  CMTime v21;
  __int128 v22;
  _OWORD v23[2];
  CMTime rhs;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CMTime lhs;
  CMTime v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;

  v7 = a2;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "timeRange");
    if (a3)
      goto LABEL_6;
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
    v30 = 0u;
    if (a3)
      goto LABEL_6;
  }
  *(_OWORD *)&time1.start.value = *MEMORY[0x1E0CA2E68];
  time1.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  *(_OWORD *)&time2.start.value = v30;
  time2.start.epoch = v31;
  if (CMTimeCompare(&time1.start, &time2.start) >= 1)
  {
LABEL_22:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
    goto LABEL_25;
  }
LABEL_6:
  memset(&v29, 0, sizeof(v29));
  if (v8)
  {
    objc_msgSend(v8, "timeRange");
    *(_OWORD *)&lhs.value = v25;
    lhs.epoch = v26;
    objc_msgSend(v8, "timeRange");
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v25 = 0u;
    memset(&lhs, 0, sizeof(lhs));
    v22 = 0u;
    memset(v23, 0, sizeof(v23));
  }
  rhs = *(CMTime *)((char *)v23 + 8);
  CMTimeAdd(&v29, &lhs, &rhs);
  memset(&v21, 0, sizeof(v21));
  v9 = objc_msgSend(*(id *)(a1 + 32), "intValue");
  CMTimeMake(&v21, v9, v29.timescale);
  if (*(_QWORD *)(a1 + 32))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "count") - 1 == a3)
    {
      time1.start = v29;
      time2.start = v21;
      if (CMTimeCompare(&time1.start, &time2.start) >= 1)
        goto LABEL_22;
    }
  }
  if (objc_msgSend(*(id *)(a1 + 40), "count") - 1 > a3)
  {
    memset(&time1, 0, sizeof(time1));
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3 + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "timeRange");
    else
      memset(&time1, 0, sizeof(time1));

    memset(&time2, 0, sizeof(time2));
    if (v8)
      objc_msgSend(v8, "timeRange");
    else
      memset(&range, 0, sizeof(range));
    otherRange = time1;
    CMTimeRangeGetIntersection(&time2, &range, &otherRange);
    *(_OWORD *)&otherRange.start.value = *MEMORY[0x1E0CA2E68];
    otherRange.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    duration = time2.duration;
    if (CMTimeCompare(&otherRange.start, &duration) < 0)
      goto LABEL_22;
  }
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32;
  if (v8)
    objc_msgSend(v8, "timeRange");
  else
    memset(v13, 0, sizeof(v13));
  v14 = *(CMTime *)&v13[1];
  *(_OWORD *)&time1.start.value = *(_OWORD *)v12;
  time1.start.epoch = *(_QWORD *)(v12 + 16);
  CMTimeAdd(&v15, &time1.start, &v14);
  *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = v15;
LABEL_25:

}

uint64_t __72__MPNowPlayingSession_extractNowPlayingInfoFromPlayersAndUpdateAdRanges__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  CMTime v8;
  CMTime time2;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  CMTime time1;

  v4 = a2;
  v5 = a3;
  if (v4)
  {
    objc_msgSend(v4, "timeRange");
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
  }
  *(_OWORD *)&time1.value = v10;
  time1.epoch = v11;
  if (v5)
    objc_msgSend(v5, "timeRange");
  else
    memset(&v8, 0, sizeof(v8));
  time2 = v8;
  v6 = CMTimeCompare(&time1, &time2);

  return v6;
}

uint64_t __50__MPNowPlayingSession_setPictureInPictureEnabled___block_invoke(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 8))
    return objc_msgSend(*(id *)(result + 32), "setCanBecomeActive:", MRMediaRemoteCanBecomeActivePlayer());
  return result;
}

void __60__MPNowPlayingSession_becomeActiveIfPossibleWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MPNowPlayingSession_becomeActiveIfPossibleWithCompletion___block_invoke_2;
  block[3] = &unk_1E3161780;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __60__MPNowPlayingSession_becomeActiveIfPossibleWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setActive:", *(_QWORD *)(a1 + 40) == 0);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 26));
  return result;
}

void __47__MPNowPlayingSession_updateMediaExperienceIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(v5 + 128);
      v7 = *(_QWORD *)(v5 + 144);
      v8 = 138543874;
      v9 = v6;
      v10 = 2114;
      v11 = v7;
      v12 = 2114;
      v13 = a2;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "Failed to update MXSessionIDs: %{public}@ for player path: %{public}@. Error: %{public}@", (uint8_t *)&v8, 0x20u);
    }

  }
}

void __59__MPNowPlayingSession_initWithPlayerPath_routingContextID___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__nowPlayingSessionMap;
  __nowPlayingSessionMap = v0;

}

+ (id)nowPlayingSessionForPlayerID:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4C5F0]), "initWithIdentifier:displayName:", v3, v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D4C5F0], "defaultPlayer");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  v6 = objc_alloc(MEMORY[0x1E0D4C5F8]);
  objc_msgSend(MEMORY[0x1E0D4C5B8], "localOrigin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4C510], "localClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithOrigin:client:player:", v7, v8, v5);

  objc_msgSend((id)objc_opt_class(), "nowPlayingSessionForPlayerPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)nowPlayingSessionForPlayerPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  objc_msgSend((id)__nowPlayingSessionMap, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v4);

  return v5;
}

@end
