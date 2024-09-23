@implementation _MPCMediaRemotePublisher

- (id)_supportedSessionTypes
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  void *v14;
  __int128 v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCQueueController allKnownSessionTypes](MPCQueueController, "allKnownSessionTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v19;
    *(_QWORD *)&v6 = 138543618;
    v16 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9);
        v17 = 0;
        v11 = +[MPCQueueController isSupportedSessionType:forEngine:reason:](MPCQueueController, "isSupportedSessionType:forEngine:reason:", v10, v2, &v17, v16);
        v12 = v17;
        if (v11)
        {
          objc_msgSend(v3, "addObject:", v10);
        }
        else
        {
          v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            v23 = v10;
            v24 = 2114;
            v25 = v12;
            _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, "[Publisher] _supportedSessionTypes excluding session type [not supported] sessionType=%{public}@ reason=%{public}@", buf, 0x16u);
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v7);
  }
  v14 = (void *)objc_msgSend(v3, "copy");

  return v14;
}

- (void)accountManager:(id)a3 didChangeAccounts:(id)a4
{
  id v5;
  NSArray *v6;
  NSArray *accounts;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  int v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (!-[NSArray isEqualToArray:](self->_accounts, "isEqualToArray:", v5))
  {
    v6 = (NSArray *)objc_msgSend(v5, "copy");
    accounts = self->_accounts;
    self->_accounts = v6;

    -[NSArray firstObject](self->_accounts, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isActiveAccount"))
    {
      objc_msgSend(v8, "storeFrontIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSString isEqualToString:](self->_activeAccountStoreFrontIdentifier, "isEqualToString:", v9))
      {
        objc_storeStrong((id *)&self->_activeAccountStoreFrontIdentifier, v9);
        v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 138543362;
          v15 = v9;
          _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "[Publisher] Updating active account storefront: %{public}@", (uint8_t *)&v14, 0xCu);
        }

      }
      v11 = objc_msgSend(v8, "hasCatalogPlaybackCapability");
      if (self->_activeAccountAllowsSubscriptionPlayback != v11)
      {
        v12 = v11;
        self->_activeAccountAllowsSubscriptionPlayback = v11;
        v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 67109120;
          LODWORD(v15) = v12;
          _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, "[Publisher] Updating active account subscription capabilities: %{BOOL}u", (uint8_t *)&v14, 8u);
        }

      }
    }
    -[_MPCMediaRemotePublisher publishIfNeeded](self, "publishIfNeeded");
    -[_MPCMediaRemotePublisher _updateLaunchCommands](self, "_updateLaunchCommands");

  }
}

- (unint64_t)vocalAttenuationUnavailabilityReasons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  unint64_t v17;

  +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queueController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MSVDeviceSupportsVocalAttenuation();
  v9 = objc_msgSend(v4, "hasCatalogPlaybackCapability");
  objc_msgSend(v6, "musicSharePlay");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "vocalAttenuationController");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = *(void **)(v11 + 80);
  else
    v13 = 0;
  v14 = v8 ^ 1u;
  if (!v9)
    v14 |= 2uLL;
  if (v10)
    v15 = v14 | 8;
  else
    v15 = v14;
  v16 = v13;

  if (v16)
    v17 = v15 | 0x10;
  else
    v17 = v15;
  if (!objc_msgSend(v7, "supportsVocalAttenuation"))
    v17 |= 0x20uLL;

  return v17;
}

- (void)_updateSupportedCommands
{
  uint64_t v2;
  _QWORD block[5];

  if (!self->_commandUpdateScheduled)
  {
    v2 = MEMORY[0x24BDAC760];
    self->_commandUpdateScheduled = 1;
    block[0] = v2;
    block[1] = 3221225472;
    block[2] = __52___MPCMediaRemotePublisher__updateSupportedCommands__block_invoke;
    block[3] = &unk_24CABA2D0;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

- (BOOL)hasInitializedSupportedCommands
{
  return self->_initializedSupportedCommands;
}

- (void)engineDidEndStateRestoration:(id)a3
{
  self->_engineRestoringState = 0;
}

- (void)becomeActive
{
  -[MPNowPlayingInfoCenter becomeActive](self->_infoCenter, "becomeActive");
}

- (id)nowPlayingInfoCenter:(id)a3 contentItemIDsFromOffset:(int64_t)a4 toOffset:(int64_t)a5 nowPlayingIndex:(int64_t *)a6
{
  void *v9;
  void *v10;
  void *v11;

  -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "queueController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "contentItemIDsFromOffset:toOffset:mode:nowPlayingIndex:", a4, a5, 1, a6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v11;
}

- (id)playbackQueueIdentifierForNowPlayingInfoCenter:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queueController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (MPCPlaybackEngine)playbackEngine
{
  return (MPCPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (void)engineWillBeginStateRestoration:(id)a3
{
  self->_engineRestoringState = 1;
}

- (void)invalidateSessionTypesWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "[Publisher] invalidateSessionTypesWithReason [] reason=%{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[_MPCMediaRemotePublisher _updateSupportedCommands](self, "_updateSupportedCommands");
  -[_MPCMediaRemotePublisher _updateLaunchCommands](self, "_updateLaunchCommands");

}

- (_MPCMediaRemotePublisher)initWithPlaybackEngine:(id)a3
{
  id v4;
  _MPCMediaRemotePublisher *v5;
  _MPCMediaRemotePublisher *v6;
  NSObject *v7;
  _MPCMediaRemotePublisher *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  MPRemoteCommandCenter *commandCenter;
  void *v13;
  uint64_t v14;
  MPNowPlayingInfoCenter *infoCenter;
  _MPCMediaRemotePublisher_Swift *v16;
  _MPCMediaRemotePublisher_Swift *swift;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *hostingSharedSessionID;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD block[4];
  _MPCMediaRemotePublisher *v31;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)_MPCMediaRemotePublisher;
  v5 = -[_MPCMediaRemotePublisher init](&v32, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_libraryAddStatusObserverLock._os_unfair_lock_opaque = 0;
    dispatch_get_global_queue(25, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51___MPCMediaRemotePublisher_initWithPlaybackEngine___block_invoke;
    block[3] = &unk_24CABA2D0;
    v8 = v6;
    v31 = v8;
    dispatch_async(v7, block);

    objc_storeWeak((id *)&v8->_playbackEngine, v4);
    objc_msgSend(v4, "addEngineObserver:", v8);
    +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerObserver:", v8);

    objc_msgSend(v4, "initializationParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remoteCommandCenter");
    v11 = objc_claimAutoreleasedReturnValue();
    commandCenter = v8->_commandCenter;
    v8->_commandCenter = (MPRemoteCommandCenter *)v11;

    -[MPRemoteCommandCenter setWantsSerializedEventDelivery:](v8->_commandCenter, "setWantsSerializedEventDelivery:", 1);
    -[MPRemoteCommandCenter setDelegate:](v8->_commandCenter, "setDelegate:", v8);
    objc_msgSend(v4, "initializationParameters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "nowPlayingInfoCenter");
    v14 = objc_claimAutoreleasedReturnValue();
    infoCenter = v8->_infoCenter;
    v8->_infoCenter = (MPNowPlayingInfoCenter *)v14;

    -[MPNowPlayingInfoCenter setPlaybackQueueDataSource:](v8->_infoCenter, "setPlaybackQueueDataSource:", v8);
    -[MPNowPlayingInfoCenter setPlaybackEngine:](v8->_infoCenter, "setPlaybackEngine:", v4);
    v8->_mediaServerAvailable = 1;
    v16 = -[_MPCMediaRemotePublisher_Swift initWithPublisher:]([_MPCMediaRemotePublisher_Swift alloc], "initWithPublisher:", v8);
    swift = v8->_swift;
    v8->_swift = v16;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v8, sel__activeSharedSessionDidChange_, *MEMORY[0x24BE64F30], 0);
    objc_msgSend(v18, "addObserver:selector:name:object:", v8, sel__durationAvailableNotification_, *MEMORY[0x24BDDB9A0], 0);
    objc_msgSend(v18, "addObserver:selector:name:object:", v8, sel__likedStateChangedNotification_, *MEMORY[0x24BDDB9B0], 0);
    objc_msgSend(v18, "addObserver:selector:name:object:", v8, sel__commandEventDidTimeoutNotification_, *MEMORY[0x24BDDC570], 0);
    objc_msgSend(MEMORY[0x24BE654C8], "sharedLocalEndpoint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "groupSessionInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifier");
    v21 = objc_claimAutoreleasedReturnValue();
    hostingSharedSessionID = v8->_hostingSharedSessionID;
    v8->_hostingSharedSessionID = (NSString *)v21;

    if (+[MPCPlaybackEngine isSystemPodcasts](MPCPlaybackEngine, "isSystemPodcasts"))
    {
      +[MPCPodcastsDefaultsHelper standard](MPCPodcastsDefaultsHelper, "standard");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16C8], "podcastsSkipForwardIntervalDefaultDidChange");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObserver:selector:name:object:", v8, sel__podcastsSkipIntervalDidChange_, v24, v23);

      objc_msgSend(MEMORY[0x24BDD16C8], "podcastsSkipBackwardIntervalDefaultDidChange");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObserver:selector:name:object:", v8, sel__podcastsSkipIntervalDidChange_, v25, v23);

    }
    objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "artworkCacheLimit");
    objc_msgSend(MEMORY[0x24BDDC6D8], "setCacheLimit:forCacheIdentifier:cacheReference:", v27, CFSTR("images"), v8);
    v28 = objc_msgSend(v26, "exportableArtworkCacheLimit");
    objc_msgSend(MEMORY[0x24BDDC6D8], "setCacheLimit:forCacheIdentifier:cacheReference:", v28, CFSTR("exportables"), v8);
    +[MPCQueueController registerPublisher:](MPCQueueController, "registerPublisher:", v8);
    -[_MPCMediaRemotePublisher _updateLaunchCommands](v8, "_updateLaunchCommands");

  }
  return v6;
}

- (void)_updateLaunchCommands
{
  msv_dispatch_on_main_queue();
}

- (void)publishIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  char v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  char v66;
  void *v67;
  void *v68;
  void *v69;
  char v70;
  void *v71;
  void *v72;
  void *v73;
  char v74;
  void *v75;
  void *v76;
  void *v77;
  char v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  char v100;
  void *v101;
  uint8_t v102[16];

  if (!-[_MPCMediaRemotePublisher isEngineRestoringState](self, "isEngineRestoringState"))
  {
    -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isStarted"))
    {
      +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "hasLoadedInitialAccounts");

      if (v5)
      {
        if (!-[_MPCMediaRemotePublisher hasInitializedSupportedCommands](self, "hasInitializedSupportedCommands"))
        {
          v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v102 = 0;
            _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEFAULT, "[Publisher] publishIfNeeded: first publish", v102, 2u);
          }

          -[MPRemoteCommandCenter playCommand](self->_commandCenter, "playCommand");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setUnsupportedReasons:", 0);

          -[MPRemoteCommandCenter playCommand](self->_commandCenter, "playCommand");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "hasTargets");

          if ((v9 & 1) == 0)
          {
            -[MPRemoteCommandCenter playCommand](self->_commandCenter, "playCommand");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addTarget:action:usingExtendedStatus:", self, sel__performCommandEvent_completion_, 1);

          }
          -[MPRemoteCommandCenter pauseCommand](self->_commandCenter, "pauseCommand");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setUnsupportedReasons:", 0);

          -[MPRemoteCommandCenter pauseCommand](self->_commandCenter, "pauseCommand");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "hasTargets");

          if ((v13 & 1) == 0)
          {
            -[MPRemoteCommandCenter pauseCommand](self->_commandCenter, "pauseCommand");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addTarget:action:usingExtendedStatus:", self, sel__performCommandEvent_completion_, 1);

          }
          -[MPRemoteCommandCenter stopCommand](self->_commandCenter, "stopCommand");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setUnsupportedReasons:", 0);

          -[MPRemoteCommandCenter stopCommand](self->_commandCenter, "stopCommand");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "hasTargets");

          if ((v17 & 1) == 0)
          {
            -[MPRemoteCommandCenter stopCommand](self->_commandCenter, "stopCommand");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addTarget:action:usingExtendedStatus:", self, sel__performCommandEvent_completion_, 1);

          }
          -[MPRemoteCommandCenter togglePlayPauseCommand](self->_commandCenter, "togglePlayPauseCommand");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setUnsupportedReasons:", 0);

          -[MPRemoteCommandCenter togglePlayPauseCommand](self->_commandCenter, "togglePlayPauseCommand");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "hasTargets");

          if ((v21 & 1) == 0)
          {
            -[MPRemoteCommandCenter togglePlayPauseCommand](self->_commandCenter, "togglePlayPauseCommand");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addTarget:action:usingExtendedStatus:", self, sel__performCommandEvent_completion_, 1);

          }
          -[MPRemoteCommandCenter nextTrackCommand](self->_commandCenter, "nextTrackCommand");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setUnsupportedReasons:", 0);

          -[MPRemoteCommandCenter nextTrackCommand](self->_commandCenter, "nextTrackCommand");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "hasTargets");

          if ((v25 & 1) == 0)
          {
            -[MPRemoteCommandCenter nextTrackCommand](self->_commandCenter, "nextTrackCommand");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addTarget:action:usingExtendedStatus:", self, sel__performCommandEvent_completion_, 1);

          }
          -[MPRemoteCommandCenter previousTrackCommand](self->_commandCenter, "previousTrackCommand");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setUnsupportedReasons:", 0);

          -[MPRemoteCommandCenter previousTrackCommand](self->_commandCenter, "previousTrackCommand");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "hasTargets");

          if ((v29 & 1) == 0)
          {
            -[MPRemoteCommandCenter previousTrackCommand](self->_commandCenter, "previousTrackCommand");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addTarget:action:usingExtendedStatus:", self, sel__performCommandEvent_completion_, 1);

          }
          -[MPRemoteCommandCenter playItemInQueueCommand](self->_commandCenter, "playItemInQueueCommand");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setUnsupportedReasons:", 0);

          -[MPRemoteCommandCenter playItemInQueueCommand](self->_commandCenter, "playItemInQueueCommand");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "hasTargets");

          if ((v33 & 1) == 0)
          {
            -[MPRemoteCommandCenter playItemInQueueCommand](self->_commandCenter, "playItemInQueueCommand");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "addTarget:action:usingExtendedStatus:", self, sel__performCommandEvent_completion_, 1);

          }
          -[MPRemoteCommandCenter setPlaybackQueueCommand](self->_commandCenter, "setPlaybackQueueCommand");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setUnsupportedReasons:", 0);

          -[MPRemoteCommandCenter setPlaybackQueueCommand](self->_commandCenter, "setPlaybackQueueCommand");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "hasTargets");

          if ((v37 & 1) == 0)
          {
            -[MPRemoteCommandCenter setPlaybackQueueCommand](self->_commandCenter, "setPlaybackQueueCommand");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "addTarget:action:usingExtendedStatus:", self, sel__performCommandEvent_completion_, 1);

          }
          -[MPRemoteCommandCenter setPlaybackQueueCommand](self->_commandCenter, "setPlaybackQueueCommand");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "registerSupportedQueueType:", 8);

          -[MPRemoteCommandCenter setPlaybackQueueCommand](self->_commandCenter, "setPlaybackQueueCommand");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "registerSupportedQueueType:", 7);

          -[MPRemoteCommandCenter setPlaybackQueueCommand](self->_commandCenter, "setPlaybackQueueCommand");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "registerSupportedCustomQueueIdentifier:", CFSTR("com.apple.music.playbackqueue.radio"));

          -[MPRemoteCommandCenter setPlaybackQueueCommand](self->_commandCenter, "setPlaybackQueueCommand");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "registerSupportedCustomQueueIdentifier:", CFSTR("com.apple.music.playbackqueue.tracklist"));

          if (_os_feature_enabled_impl())
          {
            -[MPRemoteCommandCenter setPlaybackQueueCommand](self->_commandCenter, "setPlaybackQueueCommand");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "registerSupportedCustomQueueIdentifier:", CFSTR("com.apple.music.playbackqueue.sharedlistening"));

          }
          -[MPRemoteCommandCenter setPlaybackQueueCommand](self->_commandCenter, "setPlaybackQueueCommand");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "registerSupportedCustomQueueIdentifier:", CFSTR("com.apple.mediaplayer.playbackcontext"));

          -[MPRemoteCommandCenter setPlaybackQueueCommand](self->_commandCenter, "setPlaybackQueueCommand");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "registerSupportedCustomQueueIdentifier:", CFSTR("com.apple.MediaPlaybackCore.playbackContextArchive-v1.opack"));

          -[MPRemoteCommandCenter setPlaybackQueueCommand](self->_commandCenter, "setPlaybackQueueCommand");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setTimeout:", 30.0);

          -[MPRemoteCommandCenter setPlaybackSessionCommand](self->_commandCenter, "setPlaybackSessionCommand");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setTimeout:", 30.0);

          -[MPRemoteCommandCenter prepareForSetPlaybackQueueCommand](self->_commandCenter, "prepareForSetPlaybackQueueCommand");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setUnsupportedReasons:", 0);

          -[MPRemoteCommandCenter prepareForSetPlaybackQueueCommand](self->_commandCenter, "prepareForSetPlaybackQueueCommand");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "hasTargets");

          if ((v50 & 1) == 0)
          {
            -[MPRemoteCommandCenter prepareForSetPlaybackQueueCommand](self->_commandCenter, "prepareForSetPlaybackQueueCommand");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "addTarget:action:usingExtendedStatus:", self, sel__performCommandEvent_completion_, 1);

          }
          -[MPRemoteCommandCenter prepareForSetPlaybackQueueCommand](self->_commandCenter, "prepareForSetPlaybackQueueCommand");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "setSkipSerializedEventDelivery:", 1);

          -[MPRemoteCommandCenter prepareForSetPlaybackQueueCommand](self->_commandCenter, "prepareForSetPlaybackQueueCommand");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setTimeout:", 30.0);

          -[MPRemoteCommandCenter insertIntoPlaybackQueueCommand](self->_commandCenter, "insertIntoPlaybackQueueCommand");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "setUnsupportedReasons:", 0);

          -[MPRemoteCommandCenter insertIntoPlaybackQueueCommand](self->_commandCenter, "insertIntoPlaybackQueueCommand");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "hasTargets");

          if ((v56 & 1) == 0)
          {
            -[MPRemoteCommandCenter insertIntoPlaybackQueueCommand](self->_commandCenter, "insertIntoPlaybackQueueCommand");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "addTarget:action:usingExtendedStatus:", self, sel__performCommandEvent_completion_, 1);

          }
          -[MPRemoteCommandCenter insertIntoPlaybackQueueCommand](self->_commandCenter, "insertIntoPlaybackQueueCommand");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "registerSupportedQueueType:", 7);

          -[MPRemoteCommandCenter insertIntoPlaybackQueueCommand](self->_commandCenter, "insertIntoPlaybackQueueCommand");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "registerSupportedCustomQueueIdentifier:", CFSTR("com.apple.music.playbackqueue.radio"));

          -[MPRemoteCommandCenter insertIntoPlaybackQueueCommand](self->_commandCenter, "insertIntoPlaybackQueueCommand");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "registerSupportedCustomQueueIdentifier:", CFSTR("com.apple.music.playbackqueue.tracklist"));

          -[MPRemoteCommandCenter insertIntoPlaybackQueueCommand](self->_commandCenter, "insertIntoPlaybackQueueCommand");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "registerSupportedCustomQueueIdentifier:", CFSTR("com.apple.mediaplayer.playbackcontext"));

          -[MPRemoteCommandCenter skipForwardCommand](self->_commandCenter, "skipForwardCommand");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "setPreferredIntervals:", &unk_24CB17368);

          -[MPRemoteCommandCenter skipBackwardCommand](self->_commandCenter, "skipBackwardCommand");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "setPreferredIntervals:", &unk_24CB17380);

          -[MPRemoteCommandCenter skipForwardCommand](self->_commandCenter, "skipForwardCommand");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "setUnsupportedReasons:", 0);

          -[MPRemoteCommandCenter skipForwardCommand](self->_commandCenter, "skipForwardCommand");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend(v65, "hasTargets");

          if ((v66 & 1) == 0)
          {
            -[MPRemoteCommandCenter skipForwardCommand](self->_commandCenter, "skipForwardCommand");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "addTarget:action:usingExtendedStatus:", self, sel__performCommandEvent_completion_, 1);

          }
          -[MPRemoteCommandCenter skipBackwardCommand](self->_commandCenter, "skipBackwardCommand");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "setUnsupportedReasons:", 0);

          -[MPRemoteCommandCenter skipBackwardCommand](self->_commandCenter, "skipBackwardCommand");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = objc_msgSend(v69, "hasTargets");

          if ((v70 & 1) == 0)
          {
            -[MPRemoteCommandCenter skipBackwardCommand](self->_commandCenter, "skipBackwardCommand");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "addTarget:action:usingExtendedStatus:", self, sel__performCommandEvent_completion_, 1);

          }
          -[MPRemoteCommandCenter changeQueueEndActionCommand](self->_commandCenter, "changeQueueEndActionCommand");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setUnsupportedReasons:", 0);

          -[MPRemoteCommandCenter changeQueueEndActionCommand](self->_commandCenter, "changeQueueEndActionCommand");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = objc_msgSend(v73, "hasTargets");

          if ((v74 & 1) == 0)
          {
            -[MPRemoteCommandCenter changeQueueEndActionCommand](self->_commandCenter, "changeQueueEndActionCommand");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "addTarget:action:usingExtendedStatus:", self, sel__performCommandEvent_completion_, 1);

          }
          -[MPRemoteCommandCenter likeCommand](self->_commandCenter, "likeCommand");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "setUnsupportedReasons:", 0);

          -[MPRemoteCommandCenter likeCommand](self->_commandCenter, "likeCommand");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = objc_msgSend(v77, "hasTargets");

          if ((v78 & 1) == 0)
          {
            -[MPRemoteCommandCenter likeCommand](self->_commandCenter, "likeCommand");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "addTarget:action:usingExtendedStatus:", self, sel__performCommandEvent_completion_, 1);

          }
          objc_msgSend(MEMORY[0x24BDD1488], "mediaPlaybackCoreBundle");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "localizedStringForKey:value:table:", CFSTR("REMOTE_CONTROL_LIKE_TRACK_RADIO"), &stru_24CABB5D0, CFSTR("Radio"));
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPRemoteCommandCenter likeCommand](self->_commandCenter, "likeCommand");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "setLocalizedTitle:", v81);

          objc_msgSend(MEMORY[0x24BDD1488], "mediaPlaybackCoreBundle");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "localizedStringForKey:value:table:", CFSTR("REMOTE_CONTROL_LIKE_TRACK_SHORT"), &stru_24CABB5D0, CFSTR("Radio"));
          v84 = objc_claimAutoreleasedReturnValue();
          -[MPRemoteCommandCenter likeCommand](self->_commandCenter, "likeCommand");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "setLocalizedShortTitle:", v84);

          -[MPRemoteCommandCenter dislikeCommand](self->_commandCenter, "dislikeCommand");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "setUnsupportedReasons:", 0);

          -[MPRemoteCommandCenter dislikeCommand](self->_commandCenter, "dislikeCommand");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v84) = objc_msgSend(v87, "hasTargets");

          if ((v84 & 1) == 0)
          {
            -[MPRemoteCommandCenter dislikeCommand](self->_commandCenter, "dislikeCommand");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "addTarget:action:usingExtendedStatus:", self, sel__performCommandEvent_completion_, 1);

          }
          objc_msgSend(MEMORY[0x24BDD1488], "mediaPlaybackCoreBundle");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "localizedStringForKey:value:table:", CFSTR("REMOTE_CONTROL_DISLIKE_TRACK_RADIO"), &stru_24CABB5D0, CFSTR("Radio"));
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPRemoteCommandCenter dislikeCommand](self->_commandCenter, "dislikeCommand");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "setLocalizedTitle:", v90);

          objc_msgSend(MEMORY[0x24BDD1488], "mediaPlaybackCoreBundle");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "localizedStringForKey:value:table:", CFSTR("REMOTE_CONTROL_DISLIKE_TRACK_SHORT"), &stru_24CABB5D0, CFSTR("Radio"));
          v93 = objc_claimAutoreleasedReturnValue();
          -[MPRemoteCommandCenter dislikeCommand](self->_commandCenter, "dislikeCommand");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "setLocalizedShortTitle:", v93);

          -[MPRemoteCommandCenter addNowPlayingItemToLibraryCommand](self->_commandCenter, "addNowPlayingItemToLibraryCommand");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "setUnsupportedReasons:", 0);

          -[MPRemoteCommandCenter addNowPlayingItemToLibraryCommand](self->_commandCenter, "addNowPlayingItemToLibraryCommand");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v93) = objc_msgSend(v96, "hasTargets");

          if ((v93 & 1) == 0)
          {
            -[MPRemoteCommandCenter addNowPlayingItemToLibraryCommand](self->_commandCenter, "addNowPlayingItemToLibraryCommand");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v97, "addTarget:action:usingExtendedStatus:", self, sel__performCommandEvent_completion_, 1);

          }
          -[MPRemoteCommandCenter addItemToLibraryCommand](self->_commandCenter, "addItemToLibraryCommand");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setUnsupportedReasons:", 0);

          -[MPRemoteCommandCenter addItemToLibraryCommand](self->_commandCenter, "addItemToLibraryCommand");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = objc_msgSend(v99, "hasTargets");

          if ((v100 & 1) == 0)
          {
            -[MPRemoteCommandCenter addItemToLibraryCommand](self->_commandCenter, "addItemToLibraryCommand");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v101, "addTarget:action:usingExtendedStatus:", self, sel__performCommandEvent_completion_, 1);

          }
          -[_MPCMediaRemotePublisher setInitializedSupportedCommands:](self, "setInitializedSupportedCommands:", 1);
          -[_MPCMediaRemotePublisher __updateSupportedCommands](self, "__updateSupportedCommands");
        }
        -[_MPCMediaRemotePublisher _updateSupportedCommands](self, "_updateSupportedCommands");
      }
    }

  }
}

- (BOOL)isEngineRestoringState
{
  return self->_engineRestoringState;
}

- (void)setInitializedSupportedCommands:(BOOL)a3
{
  self->_initializedSupportedCommands = a3;
}

- (MPRemoteCommandCenter)commandCenter
{
  return self->_commandCenter;
}

- (id)nowPlayingInfoCenter:(id)a3 contentItemForID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  id v19;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queueController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "itemForContentItemID:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = v10;
      v22 = v8;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      objc_msgSend(v10, "chapters");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            objc_msgSend(v16, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isEqualToString:", v5);

            if ((v18 & 1) != 0)
            {
              v19 = v16;

              v10 = v21;
              v8 = v22;
              goto LABEL_13;
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v13)
            continue;
          break;
        }
      }

      v10 = v21;
      v8 = v22;
    }
  }
  v19 = v9;
LABEL_13:

  return v19;
}

- (id)nowPlayingInfoCenter:(id)a3 artworkCatalogForContentItem:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;

  objc_msgSend(a4, "identifier", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queueController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemForContentItemID:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "player");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0.0;
  if (v8 == v10)
  {
    objc_msgSend(v6, "player");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentTime");
    v11 = v13;

  }
  objc_msgSend(v8, "artworkCatalogForPlaybackTime:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)engine:(id)a3 didChangeQueueController:(id)a4
{
  -[MPNowPlayingInfoCenter invalidatePlaybackQueue](self->_infoCenter, "invalidatePlaybackQueue", a3, a4);
  -[_MPCMediaRemotePublisher publishIfNeeded](self, "publishIfNeeded");
}

- (void)engine:(id)a3 didChangeToItem:(id)a4
{
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[MPNowPlayingInfoCenter invalidatePlaybackQueue](self->_infoCenter, "invalidatePlaybackQueue");
  -[_MPCMediaRemotePublisher publishIfNeeded](self, "publishIfNeeded");
}

- (void)updatePlaybackMetrics:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (MSVDeviceOSIsInternalInstall())
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("metrics"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("segments"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "msv_reduceIntoDouble:by:", &__block_literal_global_81_3575, 0.0);
    v9 = v8;
    WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
    objc_msgSend(WeakRetained, "queueController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setLastPlayPerformanceTime:", v9);
    objc_storeStrong((id *)&self->_lastPerformanceMetrics, a3);

  }
}

- (id)_exportableSessionTypes
{
  void *v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSObject *v15;
  int v16;
  id v17;
  NSObject *v18;
  NSObject *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  NSObject *v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isVocalAttenuationEnabled"))
  {
    v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_DEFAULT, "[Publisher] _exportableSessionTypes empty [Suntory mode is active]", buf, 2u);
    }
    v4 = (id)MEMORY[0x24BDBD1A8];
  }
  else
  {
    objc_msgSend(v2, "queueController");
    v5 = objc_claimAutoreleasedReturnValue();
    v3 = v5;
    if (v5)
    {
      -[NSObject currentItem](v5, "currentItem");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v20 = v6;
        v21 = v2;
        -[NSObject contentItemID](v6, "contentItemID");
        v8 = objc_claimAutoreleasedReturnValue();
        +[MPCQueueController allKnownSessionTypes](MPCQueueController, "allKnownSessionTypes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v24 != v13)
                objc_enumerationMutation(v10);
              v15 = *(NSObject **)(*((_QWORD *)&v23 + 1) + 8 * i);
              v22 = 0;
              v16 = -[NSObject isExportableSessionType:forContentItemID:reason:](v3, "isExportableSessionType:forContentItemID:reason:", v15, v8, &v22);
              v17 = v22;
              if (v16)
              {
                objc_msgSend(v4, "addObject:", v15);
              }
              else
              {
                v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v28 = v15;
                  v29 = 2114;
                  v30 = v17;
                  _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "[Publisher] _exportableSessionTypes excluding session type [not exportable] sessionType=%{public}@ reason=%{public}@", buf, 0x16u);
                }

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v12);
        }

        v7 = v20;
        v2 = v21;
      }
      else
      {
        v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v28 = v3;
          _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[Publisher] _exportableSessionTypes empty [queueController: %p currentItem is nil]", buf, 0xCu);
        }
        v4 = (id)MEMORY[0x24BDBD1A8];
      }

    }
    else
    {
      v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[Publisher] _exportableSessionTypes empty [queueController is nil]", buf, 2u);
      }
      v4 = (id)MEMORY[0x24BDBD1A8];
    }

  }
  return v4;
}

- (NSString)hostingSharedSessionID
{
  return self->_hostingSharedSessionID;
}

- (void)getShouldRestoreStateWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "shouldSkipNextStateRestoration"))
  {
    objc_msgSend(v4, "clearShouldSkipNextStateRestoration");
  }
  else if (!objc_msgSend(v4, "disableStateRestoration"))
  {
    v5 = (void *)objc_opt_class();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __64___MPCMediaRemotePublisher_getShouldRestoreStateWithCompletion___block_invoke;
    v6[3] = &unk_24CAB9B10;
    v7 = v3;
    objc_msgSend(v5, "getPendingCommandTypesWithCompletion:", v6);

    goto LABEL_6;
  }
  (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
LABEL_6:

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[MPCQueueController unregisterPublisher:](MPCQueueController, "unregisterPublisher:", self);
  +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_MPCMediaRemotePublisher;
  -[_MPCMediaRemotePublisher dealloc](&v4, sel_dealloc);
}

- (void)reportUserBackgroundedApplication
{
  void *v3;
  void *v4;
  id v5;

  -[MPRemoteCommandCenter pauseCommand](self->_commandCenter, "pauseCommand");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MPRemoteCommandCenter pauseCommand](self->_commandCenter, "pauseCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "newCommandEvent");
  objc_msgSend(v5, "invokeCommandWithEvent:completion:", v4, &__block_literal_global_3596);

}

- (id)getQOSDialogForError:(id)a3 withItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[_MPCMediaRemotePublisher swift](self, "swift");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getSwiftQOSDialogForError:withItem:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)leaveSharedSessionWithCommandID:(id)a3 remoteControlInterface:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCMediaRemotePublisher.m"), 357, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("commandID.length > 0"));

  }
  if (!objc_msgSend(v10, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCMediaRemotePublisher.m"), 358, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("remoteControlInterface.length > 0"));

  }
  -[MPRemoteCommandCenter leaveSharedPlaybackSessionCommand](self->_commandCenter, "leaveSharedPlaybackSessionCommand");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x24BDDCB68]);
  v14 = objc_msgSend(v12, "mediaRemoteCommandType");
  v15 = *MEMORY[0x24BE65990];
  v23[0] = *MEMORY[0x24BE658C0];
  v23[1] = v15;
  v24[0] = v9;
  v24[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v13, "initWithCommand:mediaRemoteType:options:", v12, v14, v16);

  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __94___MPCMediaRemotePublisher_leaveSharedSessionWithCommandID_remoteControlInterface_completion___block_invoke;
  v21[3] = &unk_24CAB9910;
  v22 = v11;
  v18 = v11;
  objc_msgSend(v12, "invokeCommandWithEvent:completion:", v17, v21);

}

- (void)_leaveSharedSessionWithCommandID:(id)a3 completion:(id)a4
{
  id v5;
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
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;

  v5 = a4;
  -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queueController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "musicSharePlay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "musicSharePlay");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endSynchronizedPlayback");

    objc_msgSend(v6, "sessionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stateRestorationSessionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "length"))
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __72___MPCMediaRemotePublisher__leaveSharedSessionWithCommandID_completion___block_invoke;
      v18[3] = &unk_24CABA438;
      v18[4] = self;
      v19 = v5;
      objc_msgSend(v6, "loadSessionWithIdentifier:completion:", v11, v18);
      v12 = v19;
    }
    else
    {
      v15 = (void *)objc_opt_new();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __72___MPCMediaRemotePublisher__leaveSharedSessionWithCommandID_completion___block_invoke_3;
      v16[3] = &unk_24CAB9A98;
      v17 = v5;
      -[_MPCMediaRemotePublisher performSetQueue:completion:](self, "performSetQueue:completion:", v15, v16);

      v12 = v17;
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x24BDDCB80];
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 5, CFSTR("Cannot leave shared session [not in shared session] queueController=%@"), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "statusWithCode:error:", 200, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v5 + 2))(v5, v14);

  }
}

- (void)engine:(id)a3 didChangeToState:(unint64_t)a4
{
  -[MPNowPlayingInfoCenter setPlaybackState:](self->_infoCenter, "setPlaybackState:", a4);
}

- (void)engine:(id)a3 didChangeQueueWithReason:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEFAULT, "Invalidating playback queue because %{public}@", (uint8_t *)&v7, 0xCu);
  }

  -[MPNowPlayingInfoCenter invalidatePlaybackQueue](self->_infoCenter, "invalidatePlaybackQueue");
  -[_MPCMediaRemotePublisher publishIfNeeded](self, "publishIfNeeded");

}

- (void)engine:(id)a3 didChangeRepeatType:(int64_t)a4
{
  id v5;

  -[MPRemoteCommandCenter changeRepeatModeCommand](self->_commandCenter, "changeRepeatModeCommand", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentRepeatType:", a4);

}

- (void)engine:(id)a3 didChangeShuffleType:(int64_t)a4
{
  id v5;

  -[MPRemoteCommandCenter changeShuffleModeCommand](self->_commandCenter, "changeShuffleModeCommand", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentShuffleType:", a4);

}

- (void)engine:(id)a3 didChangeActionAtQueueEnd:(int64_t)a4
{
  void *v6;

  -[MPRemoteCommandCenter changeQueueEndActionCommand](self->_commandCenter, "changeQueueEndActionCommand", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCurrentQueueEndAction:", a4);

  -[_MPCMediaRemotePublisher _updateSupportedCommands](self, "_updateSupportedCommands");
}

- (void)engineDidLoseMediaServices:(id)a3
{
  self->_mediaServerAvailable = 0;
}

- (void)engineDidResetMediaServices:(id)a3
{
  self->_mediaServerAvailable = 1;
}

- (void)engineDidBlockVocalAttenuation:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9;
  _MPCMediaRemotePublisher *v10;

  v4 = a3;
  if (objc_msgSend(v4, "isVocalAttenuationEnabled"))
  {
    objc_msgSend(v4, "setVocalAttenuationEnabled:", 0);
    v5 = MEMORY[0x24BDAC760];
    v6 = 3221225472;
    v7 = __59___MPCMediaRemotePublisher_engineDidBlockVocalAttenuation___block_invoke;
    v8 = &unk_24CAB8C28;
    v9 = v4;
    v10 = self;
    objc_msgSend(v9, "reloadQueueForReason:completion:", 1, &v5);

  }
  -[_MPCMediaRemotePublisher _updateSupportedCommands](self, "_updateSupportedCommands", v5, v6, v7, v8);

}

- (void)invalidateQueueTypesWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "[Publisher] invalidateQueueTypesWithReason [] reason=%{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[_MPCMediaRemotePublisher _updateSupportedCommands](self, "_updateSupportedCommands");
  -[_MPCMediaRemotePublisher _updateLaunchCommands](self, "_updateLaunchCommands");

}

- (void)nowPlayingInfoCenter:(id)a3 didBeginLyricsEvent:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "token");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "token");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v6;
    v13 = 2114;
    v14 = v8;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_INFO, "Lyrics begin event: %{public}@, Lyrics ID = %{public}@, Info = %{public}@", (uint8_t *)&v11, 0x20u);

  }
}

- (void)nowPlayingInfoCenter:(id)a3 didEndLyricsEvent:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  MPCReportingLyricsViewEvent *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  double v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "token");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "token");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138544130;
    v30 = *(double *)&v7;
    v31 = 2114;
    v32 = v8;
    v33 = 2114;
    v34 = v10;
    v35 = 2114;
    v36 = v12;
    _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_INFO, "Lyrics end event: %{public}@ - %{public}@, ID = %{public}@, Info = %{public}@", (uint8_t *)&v29, 0x2Au);

  }
  objc_msgSend(v5, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceDate:", v14);
  v16 = v15;

  if (v16 > 0.0)
  {
    objc_msgSend(v5, "token");
    v17 = objc_claimAutoreleasedReturnValue();
    -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject identifier](v17, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v29 = 138543362;
        v30 = *(double *)&v17;
        _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_ERROR, "Lyrics end event: missing lyrics identifier. Token = %{public}@", (uint8_t *)&v29, 0xCu);
      }
      goto LABEL_18;
    }
    objc_msgSend(v18, "queueController");
    v20 = objc_claimAutoreleasedReturnValue();
    -[NSObject identifier](v17, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject itemForContentItemID:](v20, "itemForContentItemID:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v22, "modelGenericObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "flattenedGenericObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24 && objc_msgSend(v24, "type") == 1)
      {
        v25 = objc_alloc_init(MPCReportingLyricsViewEvent);
        objc_msgSend(v24, "song");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCReportingLyricsViewEvent setModelSong:](v25, "setModelSong:", v26);

        objc_msgSend(v22, "modelPlayEvent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCReportingLyricsViewEvent setModelPlayEvent:](v25, "setModelPlayEvent:", v27);

        -[MPCReportingLyricsViewEvent setFeatureName:](v25, "setFeatureName:", CFSTR("now_playing"));
        -[MPCReportingLyricsViewEvent setVisibleDuration:](v25, "setVisibleDuration:", v16);
        -[MPCReportingLyricsViewEvent setSourceType:](v25, "setSourceType:", 1);
        objc_msgSend(v18, "reportingController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "recordLyricsViewEvent:", v25);
        goto LABEL_16;
      }
    }
    else
    {
      v24 = 0;
    }
    v25 = (MPCReportingLyricsViewEvent *)os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(&v25->super, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

LABEL_18:
      goto LABEL_19;
    }
    -[NSObject identifier](v17, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543362;
    v30 = *(double *)&v28;
    _os_log_impl(&dword_210BD8000, &v25->super, OS_LOG_TYPE_ERROR, "Lyrics end event: no song found for contentItemID %{public}@", (uint8_t *)&v29, 0xCu);
LABEL_16:

    goto LABEL_17;
  }
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v29 = 134349056;
    v30 = v16;
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_ERROR, "Lyrics end event: invalid duration for reporting. Duration = %{public}g", (uint8_t *)&v29, 0xCu);
  }
LABEL_19:

}

- (void)commandCenter:(id)a3 didTimeoutCommandEvent:(id)a4 statusHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a4;
  v8 = a5;
  -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "eventStream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __79___MPCMediaRemotePublisher_commandCenter_didTimeoutCommandEvent_statusHandler___block_invoke;
  v13[3] = &unk_24CAB26C8;
  v14 = v7;
  v15 = v8;
  v11 = v8;
  v12 = v7;
  objc_msgSend(v10, "performQuery:", v13);

}

- (void)_commandEventDidTimeoutNotification:(id)a3
{
  id v4;
  void *v5;
  MPRemoteCommandCenter *commandCenter;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  commandCenter = self->_commandCenter;
  objc_msgSend(v5, "command");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(commandCenter) = -[MPRemoteCommandCenter containsCommand:](commandCenter, "containsCommand:", v7);

  if ((_DWORD)commandCenter)
  {
    -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "eventStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = CFSTR("remote-control-id");
    objc_msgSend(v5, "commandID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = CFSTR("remote-control-status");
    v17[0] = v10;
    objc_msgSend(v4, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("status"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "emitEventType:payload:", CFSTR("remote-control-timeout"), v14);

  }
}

- (void)_durationAvailableNotification:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
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
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[4];
  _QWORD v32[5];

  v32[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_MPCMediaRemotePublisher publishIfNeeded](self, "publishIfNeeded");
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
    objc_msgSend(WeakRetained, "queueController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v10)
    {
      objc_msgSend(v7, "durationIfAvailable");

      objc_msgSend(v7, "modelGenericObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "flattenedGenericObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "anyObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifiers");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "queueSectionID");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "queueItemID");
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "playbackInfo");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_expectedStopTimeWithPlaybackInfo:");
      v17 = v16;
      -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "eventStream");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = CFSTR("item-ids");
      v19 = WeakRetained;
      if (!WeakRetained)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v32[0] = v19;
      v32[1] = v14;
      v31[1] = CFSTR("queue-section-id");
      v31[2] = CFSTR("queue-item-id");
      v32[2] = v15;
      v31[3] = CFSTR("item-metadata");
      v29[0] = CFSTR("item-duration");
      v20 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v7, "durationIfAvailable", v14);
      objc_msgSend(v20, "numberWithDouble:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = CFSTR("item-end-boundary");
      v30[0] = v21;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = v22;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
      v23 = (void *)v15;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v32[3] = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "emitEventType:payload:", CFSTR("item-update"), v25);

      if (!WeakRetained)
    }
    else
    {

    }
  }

}

- (void)_activeSharedSessionDidChange:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE64F38]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isHosted") && (objc_msgSend(v4, "isPlaceholder") & 1) == 0)
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v7 = v5;
  v6 = v5;
  msv_dispatch_on_main_queue();

}

- (void)becomeActiveIfNeededWithCommandID:(id)a3 completion:(id)a4
{
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  _QWORD *v48;
  _QWORD *v49;
  _QWORD *v50;
  os_signpost_id_t v51;
  _QWORD v52[4];
  id v53;
  _MPCMediaRemotePublisher *v54;
  _QWORD *v55;
  _QWORD *v56;
  SEL v57;
  _QWORD v58[4];
  id v59;
  id v60;
  _QWORD *v61;
  _QWORD aBlock[4];
  id v63;
  id v64;
  _QWORD *v65;
  uint8_t buf[16];
  _QWORD v67[4];
  _QWORD v68[4];
  _QWORD v69[4];
  _QWORD v70[2];
  _QWORD v71[4];

  v71[2] = *MEMORY[0x24BDAC8D0];
  v35 = a3;
  v34 = a4;
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x2020000000;
  v69[3] = 0;
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x2020000000;
  v68[3] = 0;
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x2020000000;
  v67[3] = 0;
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  v8 = os_signpost_id_generate(v7);

  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SessionActivation", ", buf, 2u);
  }

  MSVNanoIDCreateTaggedPointer();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "eventStream");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = CFSTR("session-activation-id");
  v70[1] = CFSTR("session-activation-command-id");
  v71[0] = v11;
  v14 = v35;
  if (!v35)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v71[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, v70, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "emitEventType:payload:", CFSTR("session-activation-begin"), v15);

  if (!v35)
  -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke;
  aBlock[3] = &unk_24CAB2768;
  v19 = v17;
  v63 = v19;
  v65 = v68;
  v20 = v16;
  v64 = v20;
  v21 = _Block_copy(aBlock);
  v58[0] = v18;
  v58[1] = 3221225472;
  v58[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_5;
  v58[3] = &unk_24CAB27B8;
  v33 = v19;
  v59 = v33;
  v61 = v68;
  v22 = v20;
  v60 = v22;
  v23 = _Block_copy(v58);
  v52[0] = v18;
  v52[1] = 3221225472;
  v52[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_9;
  v52[3] = &unk_24CAB2808;
  v24 = v22;
  v53 = v24;
  v54 = self;
  v55 = v69;
  v56 = v67;
  v57 = a2;
  v25 = _Block_copy(v52);
  v45[0] = v18;
  v45[1] = 3221225472;
  v45[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_2_123;
  v45[3] = &unk_24CAB2830;
  v45[4] = self;
  v51 = v8;
  v26 = v11;
  v46 = v26;
  v48 = v67;
  v49 = v69;
  v50 = v68;
  v27 = v34;
  v47 = v27;
  v28 = _Block_copy(v45);
  v40[0] = v18;
  v40[1] = 3221225472;
  v40[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_125;
  v40[3] = &unk_24CAB28A8;
  v41 = v25;
  v42 = v28;
  v43 = v23;
  v29 = v21;
  v44 = v29;
  v36[0] = v18;
  v36[1] = 3221225472;
  v36[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_7_133;
  v36[3] = &unk_24CAB28D0;
  v30 = v43;
  v37 = v30;
  v31 = v41;
  v38 = v31;
  v32 = v42;
  v39 = v32;
  (*((void (**)(id, _QWORD *, _QWORD *))v21 + 2))(v29, v40, v36);

  _Block_object_dispose(v67, 8);
  _Block_object_dispose(v68, 8);
  _Block_object_dispose(v69, 8);

}

- (void)deactivateAudioSessionIfIdle:(int64_t)a3
{
  void *v4;
  id v5;

  -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivateAudioSessionIfIdle:", a3);

}

- (void)_enqueueFallbackIntentIfNeededForCommandEvent:(id)a3 play:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  NSObject *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[16];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contextID");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_8;
  v12 = (void *)v11;
  objc_msgSend(v8, "contextID");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queueController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sessionID");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v13 == v15)
  {

    goto LABEL_8;
  }
  v16 = v15;
  v17 = objc_msgSend(v13, "isEqual:", v15);

  if ((v17 & 1) != 0)
  {
LABEL_8:
    v19 = 1;
    goto LABEL_9;
  }
  v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "[Publisher] _enqueueFallbackIntentIfNeededForCommandEvent not using fallback intent [contextID does not match queueController.sessionID]", buf, 2u);
  }

  v19 = 0;
LABEL_9:
  objc_msgSend(v8, "mediaRemoteOptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x24BE658F8]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "BOOLValue");

  if (v22)
  {
    v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_DEFAULT, "[Publisher] _enqueueFallbackIntentIfNeededForCommandEvent not using fallback intent [command option to disable]", buf, 2u);
    }

    v19 = 0;
  }
  objc_msgSend(v10, "fallbackPlaybackIntent");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v19 && v24)
  {
    v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210BD8000, v26, OS_LOG_TYPE_DEFAULT, "[Publisher] _enqueueFallbackIntentIfNeededForCommandEvent attempting reload with fallback playback context", buf, 2u);
    }

    if (v6)
      v27 = 20;
    else
      v27 = 10;
    objc_msgSend(v25, "setActionAfterQueueLoad:", v27);
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __90___MPCMediaRemotePublisher__enqueueFallbackIntentIfNeededForCommandEvent_play_completion___block_invoke;
    v31[3] = &unk_24CAB9A98;
    v32 = v9;
    -[_MPCMediaRemotePublisher performSetQueueWithIntent:completion:](self, "performSetQueueWithIntent:completion:", v25, v31);
    v28 = v32;
  }
  else
  {
    v29 = (void *)MEMORY[0x24BDDCB80];
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 1, CFSTR("Failing due to no content in the player and no fallback intent."));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "statusWithCode:error:", 100, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v30);

  }
}

- (void)__updateSupportedCommands
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  _MPCMediaRemotePublisher *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  int v27;
  void *v28;
  _MPCMediaRemotePublisher *v29;
  void *v30;
  void *v31;
  void *v32;
  _MPCMediaRemotePublisher *v33;
  void *v34;
  void *v35;
  void *v36;
  _MPCMediaRemotePublisher *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _MPCMediaRemotePublisher *v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  _MPCMediaRemotePublisher *v48;
  void *v49;
  void *v50;
  void *v51;
  _MPCMediaRemotePublisher *v52;
  void *v53;
  void *v54;
  void *v55;
  _MPCMediaRemotePublisher *v56;
  void *v57;
  void *v58;
  __CFString *v59;
  __CFString *v60;
  void *v61;
  char v62;
  __CFString *v63;
  void *v64;
  void *v65;
  _MPCMediaRemotePublisher *v66;
  void *v67;
  void *v68;
  __CFString *v69;
  void *v70;
  char v71;
  __CFString *v72;
  void *v73;
  _MPCMediaRemotePublisher *v74;
  void *v75;
  void *v76;
  void *v77;
  char v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  _BYTE *v83;
  void *v84;
  void *v85;
  void *v86;
  char v87;
  void *v88;
  _BYTE *v89;
  void *v90;
  void *v91;
  void *v92;
  char v93;
  unint64_t v94;
  void *v95;
  int v96;
  void *v97;
  __CFString *v98;
  void *v99;
  char v100;
  void *v101;
  uint64_t v102;
  void *v103;
  _BYTE *v104;
  void *v105;
  void *v106;
  char v107;
  char v108;
  void *v109;
  char v110;
  void *v111;
  _BYTE *v112;
  void *v113;
  void *v114;
  void *v115;
  char v116;
  void *v117;
  char v118;
  void *v119;
  uint64_t v120;
  void *v121;
  _BYTE *v122;
  unint64_t v123;
  void *v124;
  void *v125;
  char v126;
  __CFString *v127;
  void *v128;
  char v129;
  void *v130;
  _BYTE *v131;
  void *v132;
  void *v133;
  void *v134;
  int v135;
  void *v136;
  _BYTE *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  _BYTE *v142;
  void *v143;
  void *v144;
  void *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  int v149;
  id v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  _BYTE *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  id v162;
  void *v163;
  uint64_t v164;
  unint64_t v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  int v171;
  void *v172;
  void *v173;
  void *v174;
  int v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  int v183;
  void *v184;
  void *v185;
  int v186;
  void *v187;
  void *v188;
  void *v189;
  char v190;
  void *v191;
  void *v192;
  void *v193;
  id v194;
  void *v195;
  void *v196;
  void *v197;
  int v198;
  void *v199;
  void *v200;
  void *v201;
  _MPCPodcastsPlaybackRateHelper *v202;
  void *v203;
  int v204;
  int v205;
  void *v206;
  uint64_t v207;
  double v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  double v220;
  double v221;
  void *v222;
  void *v223;
  uint64_t v224;
  void *v225;
  void *v226;
  void *v227;
  double v228;
  double v229;
  void *v230;
  void *v231;
  void *v232;
  unint64_t v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  uint64_t v239;
  void *v240;
  uint64_t v241;
  void *v242;
  _BOOL8 v243;
  void *v244;
  void *v245;
  uint64_t v246;
  void *v247;
  _BOOL8 v248;
  void *v249;
  void *v250;
  void *v251;
  uint64_t v252;
  void *v253;
  void *v254;
  void *v255;
  id v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  id v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  char v266;
  void *v267;
  id v268;
  void *v269;
  void *v270;
  uint64_t v271;
  void *v272;
  void *v273;
  id v274;
  void *v275;
  _QWORD *v276;
  uint64_t v277;
  void *v278;
  const __CFString *v279;
  void *v280;
  id v281;
  uint64_t v282;
  unint64_t v283;
  void *v284;
  void *v285;
  uint64_t v286;
  void *v287;
  void *v288;
  id v289;
  void *v290;
  uint64_t v291;
  void *v292;
  uint64_t v293;
  void *v294;
  void *v295;
  id v296;
  void *v297;
  uint64_t v298;
  void *v299;
  void *v300;
  id v301;
  uint64_t v302;
  void *v303;
  void *v304;
  id v305;
  uint64_t v306;
  void *v307;
  void *v308;
  uint64_t v309;
  int v310;
  int v311;
  void *v312;
  double v313;
  uint64_t v314;
  void *v315;
  int v316;
  int v317;
  void *v318;
  double v319;
  uint64_t v320;
  void *v321;
  void *v322;
  double v323;
  uint64_t v324;
  void *v325;
  void *v326;
  uint64_t v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  id *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  char v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  id v351;
  id v352;
  id v353;
  void *v354;
  void *v355;
  void *v356;
  char v357;
  void *v358;
  NSObject *v359;
  NSObject *v360;
  void *v361;
  void *v362;
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  void *v402;
  void *v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  os_signpost_id_t spid;
  unint64_t v414;
  __CFString *v415;
  unint64_t v416;
  int v417;
  __CFString *v418;
  int v419;
  __CFString *v420;
  id v421;
  void *v422;
  void *v423;
  int v424;
  _MPCPodcastsPlaybackRateHelper *v425;
  void *v426;
  id WeakRetained;
  _QWORD v428[4];
  id v429;
  id v430;
  __CFString *v431;
  __CFString *v432;
  __CFString *v433;
  __CFString *v434;
  const __CFString *v435;
  id v436;
  _QWORD v437[2];
  _QWORD v438[2];
  void *v439;
  void *v440;
  void *v441;
  void *v442;
  uint8_t buf[4];
  void *v444;
  __int16 v445;
  void *v446;
  uint64_t v447;

  v447 = *MEMORY[0x24BDAC8D0];
  if (!-[_MPCMediaRemotePublisher hasInitializedSupportedCommands](self, "hasInitializedSupportedCommands"))
    return;
  v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v4 = os_signpost_id_generate(v3);

  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v6 = v5;
  v414 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "UpdateSupportedCommands", ", buf, 2u);
  }
  spid = v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  objc_msgSend(WeakRetained, "queueController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "behaviorImpl");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v424 = objc_msgSend(v9, "isEmpty");

  v10 = objc_msgSend(v7, "behaviorType");
  v422 = v7;
  objc_msgSend(v7, "sessionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPRemoteCommandCenter setPlaybackSessionCommand](self->_commandCenter, "setPlaybackSessionCommand");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCurrentPlaybackSessionIdentifier:", v11);

  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v422, "sessionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v444 = v14;
    v445 = 2114;
    v446 = v8;
    _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_INFO, "[Publisher] _updateSupportedCommands sessionIdentifier=%{public}@ currentItem=%{public}@", buf, 0x16u);

  }
  v15 = objc_msgSend(v8, "isAlwaysLive");
  -[MPRemoteCommandCenter changePlaybackPositionCommand](self->_commandCenter, "changePlaybackPositionCommand");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = self;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v18, "addObject:", CFSTR("live streaming content"));
  v417 = v15;
  -[MPRemoteCommandCenter changePlaybackPositionCommand](self->_commandCenter, "changePlaybackPositionCommand");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCanBeControlledByScrubbing:", v15 ^ 1u);

  objc_msgSend(WeakRetained, "transcriptAlignmentController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  v416 = v10;
  if (v21)
    v23 = objc_msgSend(v21, "isEnabled");
  else
    v23 = 0;
  -[MPRemoteCommandCenter changePlaybackPositionCommand](self->_commandCenter, "changePlaybackPositionCommand");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setSupportsReferencePosition:", v23);

  if (objc_msgSend(v18, "count"))
  {
    v25 = 0x24BDBC000;
    v26 = v416;
    v27 = v417;
    if (!objc_msgSend(v18, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v361 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]");
      v362 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v361, "handleFailureInFunction:file:lineNumber:description:", v362, CFSTR("_MPCMediaRemotePublisher.m"), 1016, CFSTR("Must provide reason for unsupported command"));

      v27 = v417;
      v26 = v416;
    }
    objc_msgSend(v16, "setUnsupportedReasons:", v18);
    if (objc_msgSend(v16, "hasTargets"))
      objc_msgSend(v16, "removeTarget:action:", v17, sel__performCommandEvent_completion_);
  }
  else
  {
    objc_msgSend(v16, "setUnsupportedReasons:", 0);
    v25 = 0x24BDBC000uLL;
    v26 = v416;
    v27 = v417;
    if ((objc_msgSend(v16, "hasTargets") & 1) == 0)
      objc_msgSend(v16, "addTarget:action:usingExtendedStatus:", v17, sel__performCommandEvent_completion_, 1);
    objc_msgSend(v16, "setEnabled:", objc_msgSend(v19, "count") == 0);
    objc_msgSend(v16, "setDisabledReasons:", v19);
  }

  -[MPRemoteCommandCenter changePlaybackRateCommand](self->_commandCenter, "changePlaybackRateCommand");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v17;
  objc_msgSend(*(id *)(v25 + 3768), "array");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v25 + 3768), "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "supportsRateChange") & 1) == 0)
    objc_msgSend(v30, "addObject:", CFSTR("item does not support rate changes"));
  if (v27)
    objc_msgSend(v30, "addObject:", CFSTR("live streaming content"));
  if (v26 != 4)
    objc_msgSend(v31, "addObject:", CFSTR("hidden for Music"));
  if (objc_msgSend(v30, "count"))
  {
    if (!objc_msgSend(v30, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v363 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]");
      v364 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v363, "handleFailureInFunction:file:lineNumber:description:", v364, CFSTR("_MPCMediaRemotePublisher.m"), 1022, CFSTR("Must provide reason for unsupported command"));

      v27 = v417;
      v26 = v416;
    }
    objc_msgSend(v28, "setUnsupportedReasons:", v30);
    if (objc_msgSend(v28, "hasTargets"))
      objc_msgSend(v28, "removeTarget:action:", v29, sel__performCommandEvent_completion_);
  }
  else
  {
    objc_msgSend(v28, "setUnsupportedReasons:", 0);
    if ((objc_msgSend(v28, "hasTargets") & 1) == 0)
      objc_msgSend(v28, "addTarget:action:usingExtendedStatus:", v29, sel__performCommandEvent_completion_, 1);
    objc_msgSend(v28, "setEnabled:", objc_msgSend(v31, "count") == 0);
    objc_msgSend(v28, "setDisabledReasons:", v31);
  }

  -[MPRemoteCommandCenter setSleepTimerCommand](self->_commandCenter, "setSleepTimerCommand");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v29;
  objc_msgSend(*(id *)(v25 + 3768), "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v25 + 3768), "array");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26 != 4)
  {
    objc_msgSend(v34, "addObject:", CFSTR("sleep timers for podcasts"));
    objc_msgSend(v35, "addObject:", CFSTR("hidden for Music"));
  }
  if (objc_msgSend(v34, "count"))
  {
    if (!objc_msgSend(v34, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v365 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]");
      v366 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v365, "handleFailureInFunction:file:lineNumber:description:", v366, CFSTR("_MPCMediaRemotePublisher.m"), 1028, CFSTR("Must provide reason for unsupported command"));

      v27 = v417;
    }
    objc_msgSend(v32, "setUnsupportedReasons:", v34);
    if (objc_msgSend(v32, "hasTargets"))
      objc_msgSend(v32, "removeTarget:action:", v33, sel__performCommandEvent_completion_);
  }
  else
  {
    objc_msgSend(v32, "setUnsupportedReasons:", 0);
    if ((objc_msgSend(v32, "hasTargets") & 1) == 0)
      objc_msgSend(v32, "addTarget:action:usingExtendedStatus:", v33, sel__performCommandEvent_completion_, 1);
    objc_msgSend(v32, "setEnabled:", objc_msgSend(v35, "count") == 0);
    objc_msgSend(v32, "setDisabledReasons:", v35);
  }

  -[MPRemoteCommandCenter seekForwardCommand](self->_commandCenter, "seekForwardCommand");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v33;
  objc_msgSend(*(id *)(v25 + 3768), "array");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v25 + 3768), "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v422, "musicSharePlay");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
    objc_msgSend(v38, "addObject:", CFSTR("shared listening does not support FF"));
  if (v27)
    objc_msgSend(v38, "addObject:", CFSTR("live streaming content"));
  if ((objc_msgSend(v8, "supportsFastForward") & 1) == 0)
    objc_msgSend(v38, "addObject:", CFSTR("AV does not support FF"));
  if (objc_msgSend(v38, "count"))
  {
    if (!objc_msgSend(v38, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v367 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]");
      v368 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v367, "handleFailureInFunction:file:lineNumber:description:", v368, CFSTR("_MPCMediaRemotePublisher.m"), 1038, CFSTR("Must provide reason for unsupported command"));

      v27 = v417;
    }
    objc_msgSend(v36, "setUnsupportedReasons:", v38);
    if (objc_msgSend(v36, "hasTargets"))
      objc_msgSend(v36, "removeTarget:action:", v37, sel__performCommandEvent_completion_);
  }
  else
  {
    objc_msgSend(v36, "setUnsupportedReasons:", 0);
    if ((objc_msgSend(v36, "hasTargets") & 1) == 0)
      objc_msgSend(v36, "addTarget:action:usingExtendedStatus:", v37, sel__performCommandEvent_completion_, 1);
    objc_msgSend(v36, "setEnabled:", objc_msgSend(v39, "count") == 0);
    objc_msgSend(v36, "setDisabledReasons:", v39);
  }

  -[MPRemoteCommandCenter seekBackwardCommand](self->_commandCenter, "seekBackwardCommand");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v37;
  objc_msgSend(*(id *)(v25 + 3768), "array");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v25 + 3768), "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v422, "musicSharePlay");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
    objc_msgSend(v43, "addObject:", CFSTR("shared listening does not support RW"));
  if (v27)
    objc_msgSend(v43, "addObject:", CFSTR("live streaming content"));
  if ((objc_msgSend(v8, "supportsRewind") & 1) == 0)
    objc_msgSend(v43, "addObject:", CFSTR("AV does not support RW"));
  if (objc_msgSend(v43, "count"))
  {
    if (!objc_msgSend(v43, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v369 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]");
      v370 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v369, "handleFailureInFunction:file:lineNumber:description:", v370, CFSTR("_MPCMediaRemotePublisher.m"), 1047, CFSTR("Must provide reason for unsupported command"));

      v27 = v417;
    }
    objc_msgSend(v41, "setUnsupportedReasons:", v43);
    if (objc_msgSend(v41, "hasTargets"))
      objc_msgSend(v41, "removeTarget:action:", v42, sel__performCommandEvent_completion_);
  }
  else
  {
    objc_msgSend(v41, "setUnsupportedReasons:", 0);
    if ((objc_msgSend(v41, "hasTargets") & 1) == 0)
      objc_msgSend(v41, "addTarget:action:usingExtendedStatus:", v42, sel__performCommandEvent_completion_, 1);
    objc_msgSend(v41, "setEnabled:", objc_msgSend(v44, "count") == 0);
    objc_msgSend(v41, "setDisabledReasons:", v44);
  }

  v46 = objc_msgSend(v8, "prefersSeekOverSkip");
  if (!v8)
    v46 |= objc_msgSend(WeakRetained, "isSystemPodcastsApplication");
  -[MPRemoteCommandCenter skipForwardCommand](self->_commandCenter, "skipForwardCommand");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v42;
  objc_msgSend(*(id *)(v25 + 3768), "array");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v25 + 3768), "array");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    objc_msgSend(v49, "addObject:", CFSTR("live streaming content"));
  if ((v46 & 1) == 0)
    objc_msgSend(v50, "addObject:", CFSTR("item prefers seek over skip"));
  if (objc_msgSend(v49, "count"))
  {
    if (!objc_msgSend(v49, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v371 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]");
      v372 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v371, "handleFailureInFunction:file:lineNumber:description:", v372, CFSTR("_MPCMediaRemotePublisher.m"), 1057, CFSTR("Must provide reason for unsupported command"));

      v27 = v417;
    }
    objc_msgSend(v47, "setUnsupportedReasons:", v49);
    if (objc_msgSend(v47, "hasTargets"))
      objc_msgSend(v47, "removeTarget:action:", v48, sel__performCommandEvent_completion_);
  }
  else
  {
    objc_msgSend(v47, "setUnsupportedReasons:", 0);
    if ((objc_msgSend(v47, "hasTargets") & 1) == 0)
      objc_msgSend(v47, "addTarget:action:usingExtendedStatus:", v48, sel__performCommandEvent_completion_, 1);
    objc_msgSend(v47, "setEnabled:", objc_msgSend(v50, "count") == 0);
    objc_msgSend(v47, "setDisabledReasons:", v50);
  }

  -[MPRemoteCommandCenter skipBackwardCommand](self->_commandCenter, "skipBackwardCommand");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v48;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    objc_msgSend(v53, "addObject:", CFSTR("live streaming content"));
  if ((v46 & 1) == 0)
    objc_msgSend(v54, "addObject:", CFSTR("item prefers seek over skip"));
  if (objc_msgSend(v53, "count"))
  {
    if (!objc_msgSend(v53, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v373 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]");
      v374 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v373, "handleFailureInFunction:file:lineNumber:description:", v374, CFSTR("_MPCMediaRemotePublisher.m"), 1061, CFSTR("Must provide reason for unsupported command"));

    }
    objc_msgSend(v51, "setUnsupportedReasons:", v53);
    if (objc_msgSend(v51, "hasTargets"))
      objc_msgSend(v51, "removeTarget:action:", v52, sel__performCommandEvent_completion_);
  }
  else
  {
    objc_msgSend(v51, "setUnsupportedReasons:", 0);
    if ((objc_msgSend(v51, "hasTargets") & 1) == 0)
      objc_msgSend(v51, "addTarget:action:usingExtendedStatus:", v52, sel__performCommandEvent_completion_, 1);
    objc_msgSend(v51, "setEnabled:", objc_msgSend(v54, "count") == 0);
    objc_msgSend(v51, "setDisabledReasons:", v54);
  }

  -[MPRemoteCommandCenter previousTrackCommand](self->_commandCenter, "previousTrackCommand");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v52;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (v424)
    objc_msgSend(v57, "addObject:", CFSTR("behavior has no items"));
  v59 = CFSTR("uninitialized queueController");
  if (v422)
    v59 = 0;
  v60 = v59;
  v423 = v8;
  objc_msgSend(v8, "contentItemID");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v434 = v60;
  v62 = objc_msgSend(v422, "canPreviousTrackForContentItemID:reason:", v61, &v434);
  v63 = v434;

  if ((v62 & 1) == 0)
    objc_msgSend(v58, "addObject:", v63);

  if (objc_msgSend(v57, "count"))
  {
    v64 = v423;
    if (!objc_msgSend(v57, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v375 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]");
      v376 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v375, "handleFailureInFunction:file:lineNumber:description:", v376, CFSTR("_MPCMediaRemotePublisher.m"), 1068, CFSTR("Must provide reason for unsupported command"));

    }
    objc_msgSend(v55, "setUnsupportedReasons:", v57);
    if (objc_msgSend(v55, "hasTargets"))
      objc_msgSend(v55, "removeTarget:action:", v56, sel__performCommandEvent_completion_);
  }
  else
  {
    objc_msgSend(v55, "setUnsupportedReasons:", 0);
    v64 = v423;
    if ((objc_msgSend(v55, "hasTargets") & 1) == 0)
      objc_msgSend(v55, "addTarget:action:usingExtendedStatus:", v56, sel__performCommandEvent_completion_, 1);
    objc_msgSend(v55, "setEnabled:", objc_msgSend(v58, "count") == 0);
    objc_msgSend(v55, "setDisabledReasons:", v58);
  }

  -[MPRemoteCommandCenter nextTrackCommand](self->_commandCenter, "nextTrackCommand");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v56;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (v424)
    objc_msgSend(v67, "addObject:", CFSTR("behavior has no items"));
  v69 = v60;
  objc_msgSend(v64, "contentItemID");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v433 = v69;
  v71 = objc_msgSend(v422, "canNextTrackForContentItemID:reason:", v70, &v433);
  v72 = v433;

  if ((v71 & 1) == 0)
    objc_msgSend(v68, "addObject:", v72);
  if (objc_msgSend(v423, "isPlaceholder"))
    objc_msgSend(v68, "addObject:", CFSTR("loading item"));

  if (objc_msgSend(v67, "count"))
  {
    if (!objc_msgSend(v67, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v377 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]");
      v378 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v377, "handleFailureInFunction:file:lineNumber:description:", v378, CFSTR("_MPCMediaRemotePublisher.m"), 1075, CFSTR("Must provide reason for unsupported command"));

    }
    objc_msgSend(v65, "setUnsupportedReasons:", v67);
    if (objc_msgSend(v65, "hasTargets"))
      objc_msgSend(v65, "removeTarget:action:", v66, sel__performCommandEvent_completion_);
  }
  else
  {
    objc_msgSend(v65, "setUnsupportedReasons:", 0);
    if ((objc_msgSend(v65, "hasTargets") & 1) == 0)
      objc_msgSend(v65, "addTarget:action:usingExtendedStatus:", v66, sel__performCommandEvent_completion_, 1);
    objc_msgSend(v65, "setEnabled:", objc_msgSend(v68, "count") == 0);
    objc_msgSend(v65, "setDisabledReasons:", v68);
  }

  -[MPRemoteCommandCenter createRadioStationCommand](self->_commandCenter, "createRadioStationCommand");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v66;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (v424)
    objc_msgSend(v75, "addObject:", CFSTR("behavior has no items"));
  objc_msgSend(v422, "upNextBehavior");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v77, "allowsQueueModifications");

  if ((v78 & 1) == 0)
    objc_msgSend(v75, "addObject:", CFSTR("queue does not allow modification"));
  if (!v74[32])
    objc_msgSend(v75, "addObject:", CFSTR("active account does not allow subscription playback"));
  if (v417)
    objc_msgSend(v75, "addObject:", CFSTR("live streaming content"));
  if (objc_msgSend(v423, "isPlaceholder"))
    objc_msgSend(v75, "addObject:", CFSTR("loading item"));
  objc_msgSend(v423, "modelGenericObject");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "flattenedGenericObject");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v80, "type");

  if (v81 != 1)
    objc_msgSend(v75, "addObject:", CFSTR("item is not a Song"));
  if (objc_msgSend(v75, "count"))
  {
    if (!objc_msgSend(v75, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v379 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]");
      v380 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v379, "handleFailureInFunction:file:lineNumber:description:", v380, CFSTR("_MPCMediaRemotePublisher.m"), 1084, CFSTR("Must provide reason for unsupported command"));

    }
    objc_msgSend(v73, "setUnsupportedReasons:", v75);
    if (objc_msgSend(v73, "hasTargets"))
      objc_msgSend(v73, "removeTarget:action:", v74, sel__performCommandEvent_completion_);
  }
  else
  {
    objc_msgSend(v73, "setUnsupportedReasons:", 0);
    if ((objc_msgSend(v73, "hasTargets") & 1) == 0)
      objc_msgSend(v73, "addTarget:action:usingExtendedStatus:", v74, sel__performCommandEvent_completion_, 1);
    objc_msgSend(v73, "setEnabled:", objc_msgSend(v76, "count") == 0);
    objc_msgSend(v73, "setDisabledReasons:", v76);
  }

  -[MPRemoteCommandCenter reorderQueueCommand](self->_commandCenter, "reorderQueueCommand");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v74;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  if (v424)
    objc_msgSend(v84, "addObject:", CFSTR("behavior has no items"));
  objc_msgSend(v422, "upNextBehavior");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend(v86, "allowsQueueModifications");

  if ((v87 & 1) == 0)
    objc_msgSend(v84, "addObject:", CFSTR("queue does not allow modifications"));
  if (objc_msgSend(v84, "count"))
  {
    if (!objc_msgSend(v84, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v381 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]");
      v382 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v381, "handleFailureInFunction:file:lineNumber:description:", v382, CFSTR("_MPCMediaRemotePublisher.m"), 1089, CFSTR("Must provide reason for unsupported command"));

    }
    objc_msgSend(v82, "setUnsupportedReasons:", v84);
    if (objc_msgSend(v82, "hasTargets"))
      objc_msgSend(v82, "removeTarget:action:", v83, sel__performCommandEvent_completion_);
  }
  else
  {
    objc_msgSend(v82, "setUnsupportedReasons:", 0);
    if ((objc_msgSend(v82, "hasTargets") & 1) == 0)
      objc_msgSend(v82, "addTarget:action:usingExtendedStatus:", v83, sel__performCommandEvent_completion_, 1);
    objc_msgSend(v82, "setEnabled:", objc_msgSend(v85, "count") == 0);
    objc_msgSend(v82, "setDisabledReasons:", v85);
  }

  -[MPRemoteCommandCenter removeFromPlaybackQueueCommand](self->_commandCenter, "removeFromPlaybackQueueCommand");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v83;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (v424)
    objc_msgSend(v90, "addObject:", CFSTR("behavior has no items"));
  objc_msgSend(v422, "upNextBehavior");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend(v92, "allowsQueueModifications");

  if ((v93 & 1) == 0)
    objc_msgSend(v90, "addObject:", CFSTR("queue does not allow modifications"));
  v94 = v416;
  if (objc_msgSend(v90, "count"))
  {
    if (!objc_msgSend(v90, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v383 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]");
      v384 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v383, "handleFailureInFunction:file:lineNumber:description:", v384, CFSTR("_MPCMediaRemotePublisher.m"), 1093, CFSTR("Must provide reason for unsupported command"));

      v94 = v416;
    }
    objc_msgSend(v88, "setUnsupportedReasons:", v90);
    if (objc_msgSend(v88, "hasTargets"))
      objc_msgSend(v88, "removeTarget:action:", v89, sel__performCommandEvent_completion_);
  }
  else
  {
    objc_msgSend(v88, "setUnsupportedReasons:", 0);
    if ((objc_msgSend(v88, "hasTargets") & 1) == 0)
      objc_msgSend(v88, "addTarget:action:usingExtendedStatus:", v89, sel__performCommandEvent_completion_, 1);
    objc_msgSend(v88, "setEnabled:", objc_msgSend(v91, "count") == 0);
    objc_msgSend(v88, "setDisabledReasons:", v91);
  }

  if (v422)
  {
    objc_msgSend(v422, "music");
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    if (v95)
    {
      v420 = 0;
      v96 = 1;
    }
    else
    {
      v97 = (void *)MEMORY[0x24BDD17C8];
      if (v94 >= 6)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unknown/%lld"), v94);
        v98 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v98 = off_24CAB2EB0[v94];
      }
      objc_msgSend(v97, "stringWithFormat:", CFSTR("%@ behavior"), v98);
      v420 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v96 = 0;
    }
  }
  else
  {
    v96 = 0;
    v420 = CFSTR("uninitialized queueController");
  }
  objc_msgSend(v422, "music");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v432 = CFSTR("<MISSING REASON>");
  v100 = objc_msgSend(v99, "canUserChangeRepeatTypeWithReason:", &v432);
  v415 = v432;

  objc_msgSend(v422, "music");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = objc_msgSend(v101, "repeatType");

  -[MPRemoteCommandCenter changeRepeatModeCommand](self->_commandCenter, "changeRepeatModeCommand");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = v89;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v96 & 1) == 0)
    objc_msgSend(v105, "addObject:", v420);
  if (v424)
    objc_msgSend(v105, "addObject:", CFSTR("behavior has no items"));
  if (objc_msgSend(WeakRetained, "disableRepeat"))
    objc_msgSend(v105, "addObject:", CFSTR("disabled for playback engine"));
  if (v417)
    objc_msgSend(v105, "addObject:", CFSTR("live streaming content"));
  v419 = v96;
  v107 = v96 ^ 1;
  v108 = v96 ^ 1 | v100;
  if ((v108 & 1) == 0)
    objc_msgSend(v105, "addObject:", v415);
  -[MPRemoteCommandCenter changeRepeatModeCommand](self->_commandCenter, "changeRepeatModeCommand");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setCurrentRepeatType:", v102);

  if (objc_msgSend(v105, "count"))
  {
    if (!objc_msgSend(v105, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v412 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]");
      v385 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v412, "handleFailureInFunction:file:lineNumber:description:", v385, CFSTR("_MPCMediaRemotePublisher.m"), 1120, CFSTR("Must provide reason for unsupported command"));

    }
    objc_msgSend(v103, "setUnsupportedReasons:", v105);
    v110 = v419;
    if (objc_msgSend(v103, "hasTargets"))
      objc_msgSend(v103, "removeTarget:action:", v104, sel__performCommandEvent_completion_);
  }
  else
  {
    objc_msgSend(v103, "setUnsupportedReasons:", 0);
    if ((objc_msgSend(v103, "hasTargets") & 1) == 0)
      objc_msgSend(v103, "addTarget:action:usingExtendedStatus:", v104, sel__performCommandEvent_completion_, 1);
    objc_msgSend(v103, "setEnabled:", objc_msgSend(v106, "count") == 0);
    objc_msgSend(v103, "setDisabledReasons:", v106);
    v110 = v419;
  }

  -[MPRemoteCommandCenter advanceRepeatModeCommand](self->_commandCenter, "advanceRepeatModeCommand");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v104;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v110 & 1) == 0)
    objc_msgSend(v113, "addObject:", v420);
  if (v424)
    objc_msgSend(v113, "addObject:", CFSTR("behavior has no items"));
  if (objc_msgSend(WeakRetained, "disableRepeat"))
    objc_msgSend(v113, "addObject:", CFSTR("disabled for playback engine"));
  if (v417)
    objc_msgSend(v113, "addObject:", CFSTR("live streaming content"));
  if ((v108 & 1) == 0)
    objc_msgSend(v113, "addObject:", v415);
  -[MPRemoteCommandCenter advanceRepeatModeCommand](self->_commandCenter, "advanceRepeatModeCommand");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "setCurrentRepeatType:", v102);

  if (objc_msgSend(v113, "count"))
  {
    v116 = v419;
    if (!objc_msgSend(v113, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v386 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]");
      v387 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v386, "handleFailureInFunction:file:lineNumber:description:", v387, CFSTR("_MPCMediaRemotePublisher.m"), 1130, CFSTR("Must provide reason for unsupported command"));

      v116 = v419;
    }
    objc_msgSend(v111, "setUnsupportedReasons:", v113);
    if (objc_msgSend(v111, "hasTargets"))
      objc_msgSend(v111, "removeTarget:action:", v112, sel__performCommandEvent_completion_);
  }
  else
  {
    objc_msgSend(v111, "setUnsupportedReasons:", 0);
    v116 = v419;
    if ((objc_msgSend(v111, "hasTargets") & 1) == 0)
      objc_msgSend(v111, "addTarget:action:usingExtendedStatus:", v112, sel__performCommandEvent_completion_, 1);
    objc_msgSend(v111, "setEnabled:", objc_msgSend(v114, "count") == 0);
    objc_msgSend(v111, "setDisabledReasons:", v114);
  }

  objc_msgSend(v422, "music");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v431 = CFSTR("<MISSING REASON>");
  v118 = objc_msgSend(v117, "canUserChangeShuffleModeWithReason:", &v431);
  v418 = v431;

  objc_msgSend(v422, "music");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = objc_msgSend(v119, "shuffleType");

  -[MPRemoteCommandCenter changeShuffleModeCommand](self->_commandCenter, "changeShuffleModeCommand");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = v112;
  v123 = 0x24BDBC000uLL;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v116 & 1) == 0)
    objc_msgSend(v124, "addObject:", v420);
  if (v424)
    objc_msgSend(v124, "addObject:", CFSTR("behavior has no items"));
  if (objc_msgSend(WeakRetained, "disableShuffle"))
    objc_msgSend(v124, "addObject:", CFSTR("disabled for playback engine"));
  v126 = v107 | v118;
  v127 = v418;
  if ((v126 & 1) == 0)
    objc_msgSend(v124, "addObject:", v418);
  -[MPRemoteCommandCenter changeShuffleModeCommand](self->_commandCenter, "changeShuffleModeCommand");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setCurrentShuffleType:", v120);

  if (objc_msgSend(v124, "count"))
  {
    v129 = v419;
    if (!objc_msgSend(v124, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v388 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]");
      v389 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v388, "handleFailureInFunction:file:lineNumber:description:", v389, CFSTR("_MPCMediaRemotePublisher.m"), 1143, CFSTR("Must provide reason for unsupported command"));

      v127 = v418;
      v129 = v419;
    }
    objc_msgSend(v121, "setUnsupportedReasons:", v124);
    if (objc_msgSend(v121, "hasTargets"))
      objc_msgSend(v121, "removeTarget:action:", v122, sel__performCommandEvent_completion_);
  }
  else
  {
    objc_msgSend(v121, "setUnsupportedReasons:", 0);
    v129 = v419;
    if ((objc_msgSend(v121, "hasTargets") & 1) == 0)
      objc_msgSend(v121, "addTarget:action:usingExtendedStatus:", v122, sel__performCommandEvent_completion_, 1);
    objc_msgSend(v121, "setEnabled:", objc_msgSend(v125, "count") == 0);
    objc_msgSend(v121, "setDisabledReasons:", v125);
  }

  -[MPRemoteCommandCenter advanceShuffleModeCommand](self->_commandCenter, "advanceShuffleModeCommand");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = v122;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v129 & 1) == 0)
    objc_msgSend(v132, "addObject:", v420);
  if (v424)
    objc_msgSend(v132, "addObject:", CFSTR("behavior has no items"));
  if (objc_msgSend(WeakRetained, "disableShuffle"))
    objc_msgSend(v132, "addObject:", CFSTR("disabled for playback engine"));
  if ((v126 & 1) == 0)
    objc_msgSend(v132, "addObject:", v127);
  -[MPRemoteCommandCenter advanceShuffleModeCommand](self->_commandCenter, "advanceShuffleModeCommand");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "setCurrentShuffleType:", v120);

  if (objc_msgSend(v132, "count"))
  {
    v135 = v419;
    if (!objc_msgSend(v132, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v390 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]");
      v391 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v390, "handleFailureInFunction:file:lineNumber:description:", v391, CFSTR("_MPCMediaRemotePublisher.m"), 1152, CFSTR("Must provide reason for unsupported command"));

      v135 = v419;
    }
    objc_msgSend(v130, "setUnsupportedReasons:", v132);
    if (objc_msgSend(v130, "hasTargets"))
      objc_msgSend(v130, "removeTarget:action:", v131, sel__performCommandEvent_completion_);
  }
  else
  {
    objc_msgSend(v130, "setUnsupportedReasons:", 0);
    v135 = v419;
    if ((objc_msgSend(v130, "hasTargets") & 1) == 0)
      objc_msgSend(v130, "addTarget:action:usingExtendedStatus:", v131, sel__performCommandEvent_completion_, 1);
    objc_msgSend(v130, "setEnabled:", objc_msgSend(v133, "count") == 0);
    objc_msgSend(v130, "setDisabledReasons:", v133);
  }

  -[MPRemoteCommandCenter reshuffleCommand](self->_commandCenter, "reshuffleCommand");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = v131;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v135 & 1) == 0)
    objc_msgSend(v138, "addObject:", v420);
  if (v424)
    objc_msgSend(v138, "addObject:", CFSTR("behavior has no items"));
  if (objc_msgSend(WeakRetained, "disableShuffle"))
    objc_msgSend(v138, "addObject:", CFSTR("disabled for playback engine"));
  if ((v126 & 1) == 0)
    objc_msgSend(v138, "addObject:", v127);
  if (objc_msgSend(v138, "count"))
  {
    v140 = v422;
    if (!objc_msgSend(v138, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v392 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]");
      v393 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v392, "handleFailureInFunction:file:lineNumber:description:", v393, CFSTR("_MPCMediaRemotePublisher.m"), 1160, CFSTR("Must provide reason for unsupported command"));

      v127 = v418;
      v135 = v419;
    }
    objc_msgSend(v136, "setUnsupportedReasons:", v138);
    if (objc_msgSend(v136, "hasTargets"))
      objc_msgSend(v136, "removeTarget:action:", v137, sel__performCommandEvent_completion_);
  }
  else
  {
    objc_msgSend(v136, "setUnsupportedReasons:", 0);
    v140 = v422;
    if ((objc_msgSend(v136, "hasTargets") & 1) == 0)
      objc_msgSend(v136, "addTarget:action:usingExtendedStatus:", v137, sel__performCommandEvent_completion_, 1);
    objc_msgSend(v136, "setEnabled:", objc_msgSend(v139, "count") == 0);
    objc_msgSend(v136, "setDisabledReasons:", v139);
  }

  -[MPRemoteCommandCenter changeQueueEndActionCommand](self->_commandCenter, "changeQueueEndActionCommand");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = v137;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v135 & 1) == 0)
    objc_msgSend(v143, "addObject:", v420);
  if (v424)
    objc_msgSend(v143, "addObject:", CFSTR("behavior has no items"));
  if (objc_msgSend(WeakRetained, "disableAutoPlay"))
    objc_msgSend(v143, "addObject:", CFSTR("disabled for playback engine"));
  if (v135)
  {
    objc_msgSend(v140, "music");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v145, "autoPlayEnabled"))
      v146 = 3;
    else
      v146 = 2;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "addObject:", &unk_24CB16A58);
    if ((v424 & 1) == 0)
    {
      objc_msgSend(v422, "music");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      v430 = 0;
      v149 = objc_msgSend(v148, "canUserEnableAutoPlayWithReason:", &v430);
      v150 = v430;

      if (v149)
        objc_msgSend(v147, "addObject:", &unk_24CB16A70);

      v123 = 0x24BDBC000;
      LOBYTE(v135) = v419;
    }
    -[MPRemoteCommandCenter changeQueueEndActionCommand](self->_commandCenter, "changeQueueEndActionCommand");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "setCurrentQueueEndAction:", v146);

    -[MPRemoteCommandCenter changeQueueEndActionCommand](self->_commandCenter, "changeQueueEndActionCommand");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "setSupportedQueueEndActions:", v147);

    v140 = v422;
    v127 = v418;
  }
  else
  {
    -[MPRemoteCommandCenter changeQueueEndActionCommand](self->_commandCenter, "changeQueueEndActionCommand");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "setCurrentQueueEndAction:", 1);

    -[MPRemoteCommandCenter changeQueueEndActionCommand](self->_commandCenter, "changeQueueEndActionCommand");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "setSupportedQueueEndActions:", MEMORY[0x24BDBD1A8]);
  }

  if (objc_msgSend(v143, "count"))
  {
    if (!objc_msgSend(v143, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v394 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]");
      v395 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v394, "handleFailureInFunction:file:lineNumber:description:", v395, CFSTR("_MPCMediaRemotePublisher.m"), 1188, CFSTR("Must provide reason for unsupported command"));

      v140 = v422;
    }
    objc_msgSend(v141, "setUnsupportedReasons:", v143);
    if (objc_msgSend(v141, "hasTargets"))
      objc_msgSend(v141, "removeTarget:action:", v142, sel__performCommandEvent_completion_);
  }
  else
  {
    objc_msgSend(v141, "setUnsupportedReasons:", 0);
    if ((objc_msgSend(v141, "hasTargets") & 1) == 0)
      objc_msgSend(v141, "addTarget:action:usingExtendedStatus:", v142, sel__performCommandEvent_completion_, 1);
    objc_msgSend(v141, "setEnabled:", objc_msgSend(v144, "count") == 0);
    objc_msgSend(v141, "setDisabledReasons:", v144);
  }

  -[MPRemoteCommandCenter shareQueueCommand](self->_commandCenter, "shareQueueCommand");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = v142;
  objc_msgSend(*(id *)(v123 + 3768), "array");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v123 + 3768), "array");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v135 & 1) == 0)
    objc_msgSend(v156, "addObject:", v420);
  objc_msgSend(v140, "musicSharePlay");
  v158 = (void *)objc_claimAutoreleasedReturnValue();

  if (v158)
    objc_msgSend(v156, "addObject:", CFSTR("already in shared listening mode"));
  if (v424)
    objc_msgSend(v156, "addObject:", CFSTR("behavior has no items"));
  v159 = v422;
  if (!objc_msgSend(v423, "storeSubscriptionAdamID"))
    objc_msgSend(v156, "addObject:", CFSTR("item doesn't have subscription adam id"));
  if (objc_msgSend(v156, "count"))
  {
    if (!objc_msgSend(v156, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v396 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]");
      v397 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v396, "handleFailureInFunction:file:lineNumber:description:", v397, CFSTR("_MPCMediaRemotePublisher.m"), 1194, CFSTR("Must provide reason for unsupported command"));

      v159 = v422;
    }
    objc_msgSend(v154, "setUnsupportedReasons:", v156);
    if (objc_msgSend(v154, "hasTargets"))
      objc_msgSend(v154, "removeTarget:action:", v155, sel__performCommandEvent_completion_);
  }
  else
  {
    objc_msgSend(v154, "setUnsupportedReasons:", 0);
    if ((objc_msgSend(v154, "hasTargets") & 1) == 0)
      objc_msgSend(v154, "addTarget:action:usingExtendedStatus:", v155, sel__performCommandEvent_completion_, 1);
    objc_msgSend(v154, "setEnabled:", objc_msgSend(v157, "count") == 0);
    objc_msgSend(v154, "setDisabledReasons:", v157);
  }

  -[MPRemoteCommandCenter shareQueueCommand](self->_commandCenter, "shareQueueCommand");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "setTimeout:", 30.0);

  -[MPRemoteCommandCenter insertIntoPlaybackQueueCommand](self->_commandCenter, "insertIntoPlaybackQueueCommand");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = v155;
  objc_msgSend(*(id *)(v123 + 3768), "array");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v123 + 3768), "array");
  v164 = objc_claimAutoreleasedReturnValue();
  v165 = v123;
  v166 = (void *)v164;
  objc_msgSend(*(id *)(v165 + 3768), "arrayWithCapacity:", 4);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  if (v423)
  {
    objc_msgSend(v159, "upNextBehavior");
    v168 = (void *)objc_claimAutoreleasedReturnValue();

    if (v168)
    {
      objc_msgSend(v159, "upNextBehavior");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v423, "contentItemID");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      v171 = objc_msgSend(v169, "isSupportedInsertionPosition:fromContentItemID:reason:", 0, v170, 0);

      if (v171)
        objc_msgSend(v167, "addObject:", &unk_24CB16A88);
      v172 = v422;
      objc_msgSend(v422, "upNextBehavior");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v423, "contentItemID");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      v175 = objc_msgSend(v173, "isSupportedInsertionPosition:fromContentItemID:reason:", 1, v174, 0);

      if (v175
        && (objc_msgSend(v167, "addObject:", &unk_24CB16AA0),
            objc_msgSend(v422, "music"),
            v176 = (void *)objc_claimAutoreleasedReturnValue(),
            v176,
            v176))
      {
        objc_msgSend(v422, "music");
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v423, "contentItemID");
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v177, "lastSectionContentItemIDForTargetContentItemID:", v178);
        v179 = (void *)objc_claimAutoreleasedReturnValue();

        -[MPRemoteCommandCenter insertIntoPlaybackQueueCommand](self->_commandCenter, "insertIntoPlaybackQueueCommand");
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v180, "setLastSectionContentItemID:", v179);

        v172 = v422;
      }
      else
      {
        -[MPRemoteCommandCenter insertIntoPlaybackQueueCommand](self->_commandCenter, "insertIntoPlaybackQueueCommand");
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v179, "setLastSectionContentItemID:", 0);
      }

      objc_msgSend(v172, "upNextBehavior");
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v423, "contentItemID");
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      v183 = objc_msgSend(v181, "isSupportedInsertionPosition:fromContentItemID:reason:", 2, v182, 0);

      if (v183)
        objc_msgSend(v167, "addObject:", &unk_24CB16A58);
      objc_msgSend(v422, "upNextBehavior");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v423, "contentItemID");
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      v186 = objc_msgSend(v184, "isSupportedInsertionPosition:fromContentItemID:reason:", 3, v185, 0);

      v159 = v422;
      if (v186)
        objc_msgSend(v167, "addObject:", &unk_24CB16A70);
    }
  }
  -[MPRemoteCommandCenter insertIntoPlaybackQueueCommand](self->_commandCenter, "insertIntoPlaybackQueueCommand");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "setSupportedInsertionPositions:", v167);

  objc_msgSend(v159, "upNextBehavior");
  v188 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v188)
    objc_msgSend(v166, "addObject:", CFSTR("current behavior is not upNextBehavior"));
  objc_msgSend(v159, "upNextBehavior");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v190 = objc_msgSend(v189, "allowsQueueModifications");

  if ((v190 & 1) == 0)
    objc_msgSend(v166, "addObject:", CFSTR("queue does not allow modifications"));
  if (!v423)
    objc_msgSend(v166, "addObject:", CFSTR("no current item in queue"));
  if (!objc_msgSend(v167, "count"))
    objc_msgSend(v166, "addObject:", CFSTR("queue does not support any insertion positions"));

  if (objc_msgSend(v163, "count"))
  {
    if (!objc_msgSend(v163, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v398 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]");
      v399 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v398, "handleFailureInFunction:file:lineNumber:description:", v399, CFSTR("_MPCMediaRemotePublisher.m"), 1234, CFSTR("Must provide reason for unsupported command"));

    }
    objc_msgSend(v161, "setUnsupportedReasons:", v163);
    if (objc_msgSend(v161, "hasTargets"))
      objc_msgSend(v161, "removeTarget:action:", v162, sel__performCommandEvent_completion_);
  }
  else
  {
    objc_msgSend(v161, "setUnsupportedReasons:", 0);
    if ((objc_msgSend(v161, "hasTargets") & 1) == 0)
      objc_msgSend(v161, "addTarget:action:usingExtendedStatus:", v162, sel__performCommandEvent_completion_, 1);
    objc_msgSend(v161, "setEnabled:", objc_msgSend(v166, "count") == 0);
    objc_msgSend(v161, "setDisabledReasons:", v166);
  }

  objc_msgSend(v162, "_supportedSessionTypes");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "_exportableSessionTypes");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPRemoteCommandCenter setPlaybackSessionCommand](self->_commandCenter, "setPlaybackSessionCommand");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v194 = v162;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v198 = objc_msgSend(v197, "disableQHO");

  if (v198)
    objc_msgSend(v195, "addObject:", CFSTR("QHO disabled by defaults"));
  if ((objc_msgSend(WeakRetained, "isQueueHandoffSupported") & 1) == 0)
    objc_msgSend(v195, "addObject:", CFSTR("engine not configured for QHO"));
  if (!objc_msgSend(v191, "count"))
    objc_msgSend(v195, "addObject:", CFSTR("no supported session types"));
  -[MPRemoteCommandCenter setPlaybackSessionCommand](self->_commandCenter, "setPlaybackSessionCommand");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "setSupportedSessionTypes:", v191);

  -[MPRemoteCommandCenter setPlaybackSessionCommand](self->_commandCenter, "setPlaybackSessionCommand");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v200, "setExportableSessionTypes:", v192);

  if (objc_msgSend(v195, "count"))
  {
    if (!objc_msgSend(v195, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v400 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]");
      v401 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v400, "handleFailureInFunction:file:lineNumber:description:", v401, CFSTR("_MPCMediaRemotePublisher.m"), 1245, CFSTR("Must provide reason for unsupported command"));

    }
    objc_msgSend(v193, "setUnsupportedReasons:", v195);
    if (objc_msgSend(v193, "hasTargets"))
      objc_msgSend(v193, "removeTarget:action:", v194, sel__performCommandEvent_completion_);
  }
  else
  {
    objc_msgSend(v193, "setUnsupportedReasons:", 0);
    if ((objc_msgSend(v193, "hasTargets") & 1) == 0)
      objc_msgSend(v193, "addTarget:action:usingExtendedStatus:", v194, sel__performCommandEvent_completion_, 1);
    objc_msgSend(v193, "setEnabled:", objc_msgSend(v196, "count") == 0);
    objc_msgSend(v193, "setDisabledReasons:", v196);
  }

  if (v416 == 4)
  {
    +[MPCPodcastsDefaultsHelper standard](MPCPodcastsDefaultsHelper, "standard");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    v202 = [_MPCPodcastsPlaybackRateHelper alloc];
    objc_msgSend(WeakRetained, "player");
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v203, "currentRate");
    v205 = v204;
    objc_msgSend(WeakRetained, "player");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    v207 = objc_msgSend(v206, "state");
    LODWORD(v208) = v205;
    v425 = -[_MPCPodcastsPlaybackRateHelper initWithCurrentRate:playbackState:](v202, "initWithCurrentRate:playbackState:", v207, v208);

    -[MPRemoteCommandCenter changePlaybackRateCommand](self->_commandCenter, "changePlaybackRateCommand");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MPCPodcastsPlaybackRateHelper supportedPlaybackRates](_MPCPodcastsPlaybackRateHelper, "supportedPlaybackRates");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v209, "setSupportedPlaybackRates:", v210);

    -[_MPCPodcastsPlaybackRateHelper preferredPlaybackRateForDisplay](v425, "preferredPlaybackRateForDisplay");
    objc_msgSend(v209, "setPreferredRate:");
    v211 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v201, "skipForwardInterval");
    objc_msgSend(v211, "numberWithDouble:");
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    v442 = v212;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v442, 1);
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPRemoteCommandCenter skipForwardCommand](self->_commandCenter, "skipForwardCommand");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v214, "setPreferredIntervals:", v213);

    v215 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v201, "skipBackwardInterval");
    objc_msgSend(v215, "numberWithDouble:");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    v441 = v216;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v441, 1);
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPRemoteCommandCenter skipBackwardCommand](self->_commandCenter, "skipBackwardCommand");
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v218, "setPreferredIntervals:", v217);

    objc_msgSend(WeakRetained, "sleepTimerController");
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v219, "time");
    v221 = v220;
    -[MPRemoteCommandCenter setSleepTimerCommand](self->_commandCenter, "setSleepTimerCommand");
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v222, "setTime:", v221);

    objc_msgSend(WeakRetained, "sleepTimerController");
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    v224 = objc_msgSend(v223, "stopMode");
    -[MPRemoteCommandCenter setSleepTimerCommand](self->_commandCenter, "setSleepTimerCommand");
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v225, "setStopMode:", v224);

    v226 = v201;
    objc_msgSend(WeakRetained, "sleepTimerController");
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v227, "fireDate");
    v229 = v228;
    -[MPRemoteCommandCenter setSleepTimerCommand](self->_commandCenter, "setSleepTimerCommand");
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v230, "setFireDate:", v229);

    v232 = v423;
    v231 = v425;
    v233 = 0x24BDBC000uLL;
  }
  else
  {
    v232 = v423;
    v233 = 0x24BDBC000;
    if (v423 || !objc_msgSend(WeakRetained, "isSystemPodcastsApplication"))
      goto LABEL_350;
    +[MPCPodcastsDefaultsHelper standard](MPCPodcastsDefaultsHelper, "standard");
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    v234 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v226, "skipForwardInterval");
    objc_msgSend(v234, "numberWithDouble:");
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    v440 = v235;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v440, 1);
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPRemoteCommandCenter skipForwardCommand](self->_commandCenter, "skipForwardCommand");
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v237, "setPreferredIntervals:", v236);

    v238 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v226, "skipBackwardInterval");
    objc_msgSend(v238, "numberWithDouble:");
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    v439 = v231;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v439, 1);
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPRemoteCommandCenter skipBackwardCommand](self->_commandCenter, "skipBackwardCommand");
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v227, "setPreferredIntervals:", v209);
  }

LABEL_350:
  if (objc_msgSend(v232, "stationAllowsItemLiking"))
    v239 = 1;
  else
    v239 = 2;
  -[MPRemoteCommandCenter likeCommand](self->_commandCenter, "likeCommand");
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "setPresentationStyle:", v239);

  v241 = objc_msgSend(v232, "isLikedStateEnabled");
  -[MPRemoteCommandCenter likeCommand](self->_commandCenter, "likeCommand");
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v242, "setEnabled:", v241);

  v243 = objc_msgSend(v232, "likedState") == 2;
  -[MPRemoteCommandCenter likeCommand](self->_commandCenter, "likeCommand");
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v244, "setActive:", v243);

  -[MPRemoteCommandCenter dislikeCommand](self->_commandCenter, "dislikeCommand");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v245, "setPresentationStyle:", v239);

  v246 = objc_msgSend(v232, "isLikedStateEnabled");
  -[MPRemoteCommandCenter dislikeCommand](self->_commandCenter, "dislikeCommand");
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v247, "setEnabled:", v246);

  v248 = objc_msgSend(v232, "likedState") == 3;
  -[MPRemoteCommandCenter dislikeCommand](self->_commandCenter, "dislikeCommand");
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v249, "setActive:", v248);

  objc_msgSend(v232, "modelGenericObject");
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v250, "flattenedGenericObject");
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v251, "anyObject");
  v252 = objc_claimAutoreleasedReturnValue();

  -[MPRemoteCommandCenter addNowPlayingItemToLibraryCommand](self->_commandCenter, "addNowPlayingItemToLibraryCommand");
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)v194 + 4);
  v254 = (void *)*((_QWORD *)v194 + 1);
  v428[0] = MEMORY[0x24BDAC760];
  v428[1] = 3221225472;
  v428[2] = __53___MPCMediaRemotePublisher___updateSupportedCommands__block_invoke;
  v428[3] = &unk_24CAB2920;
  v421 = v253;
  v429 = v421;
  objc_msgSend(v254, "setStatusBlock:", v428);
  objc_msgSend(*((id *)v194 + 1), "configureWithModelObject:", v252);
  os_unfair_lock_unlock((os_unfair_lock_t)v194 + 4);
  -[MPRemoteCommandCenter ratingCommand](self->_commandCenter, "ratingCommand");
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  v256 = v194;
  objc_msgSend(*(id *)(v233 + 3768), "array");
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v233 + 3768), "array");
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v232, "supportsRating") & 1) == 0)
    objc_msgSend(v257, "addObject:", CFSTR("item does not support ratings"));
  v259 = v422;
  if (objc_msgSend(v257, "count"))
  {
    if (!objc_msgSend(v257, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v402 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]");
      v403 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v402, "handleFailureInFunction:file:lineNumber:description:", v403, CFSTR("_MPCMediaRemotePublisher.m"), 1309, CFSTR("Must provide reason for unsupported command"));

      v259 = v422;
    }
    objc_msgSend(v255, "setUnsupportedReasons:", v257);
    if (objc_msgSend(v255, "hasTargets"))
      objc_msgSend(v255, "removeTarget:action:", v256, sel__performCommandEvent_completion_);
  }
  else
  {
    objc_msgSend(v255, "setUnsupportedReasons:", 0);
    if ((objc_msgSend(v255, "hasTargets") & 1) == 0)
      objc_msgSend(v255, "addTarget:action:usingExtendedStatus:", v256, sel__performCommandEvent_completion_, 1);
    objc_msgSend(v255, "setEnabled:", objc_msgSend(v258, "count") == 0);
    objc_msgSend(v255, "setDisabledReasons:", v258);
  }

  -[MPRemoteCommandCenter leaveSharedPlaybackSessionCommand](self->_commandCenter, "leaveSharedPlaybackSessionCommand");
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  v261 = v256;
  objc_msgSend(*(id *)(v233 + 3768), "array");
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v233 + 3768), "array");
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v259, "musicSharePlay");
  v264 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v264)
    objc_msgSend(v262, "addObject:", CFSTR("not in shared listening mode"));
  -[MPRemoteCommandCenter leaveSharedPlaybackSessionCommand](self->_commandCenter, "leaveSharedPlaybackSessionCommand");
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v265, "setSkipSerializedEventDelivery:", 1);

  v426 = (void *)v252;
  if (objc_msgSend(v262, "count"))
  {
    if (!objc_msgSend(v262, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v404 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]");
      v405 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v404, "handleFailureInFunction:file:lineNumber:description:", v405, CFSTR("_MPCMediaRemotePublisher.m"), 1314, CFSTR("Must provide reason for unsupported command"));

    }
    objc_msgSend(v260, "setUnsupportedReasons:", v262);
    if (objc_msgSend(v260, "hasTargets"))
      objc_msgSend(v260, "removeTarget:action:", v261, sel__performCommandEvent_completion_);
  }
  else
  {
    objc_msgSend(v260, "setUnsupportedReasons:", 0);
    if ((objc_msgSend(v260, "hasTargets") & 1) == 0)
      objc_msgSend(v260, "addTarget:action:usingExtendedStatus:", v261, sel__performCommandEvent_completion_, 1);
    objc_msgSend(v260, "setEnabled:", objc_msgSend(v263, "count") == 0);
    objc_msgSend(v260, "setDisabledReasons:", v263);
  }

  v266 = objc_msgSend(v261, "vocalAttenuationUnavailabilityReasons");
  -[MPRemoteCommandCenter prepareVocalsControlCommand](self->_commandCenter, "prepareVocalsControlCommand");
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  v268 = v261;
  objc_msgSend(*(id *)(v233 + 3768), "array");
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v233 + 3768), "array");
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v266 & 1) != 0)
    objc_msgSend(v269, "addObject:", CFSTR("vocal attenuation is not supported on this device"));
  if ((v266 & 2) != 0)
    objc_msgSend(v269, "addObject:", CFSTR("Active account cannot play catalog content"));
  if ((v266 & 0x10) != 0)
  {
    objc_msgSend(WeakRetained, "vocalAttenuationController");
    v271 = objc_claimAutoreleasedReturnValue();
    v272 = (void *)v271;
    if (v271)
      v273 = *(void **)(v271 + 80);
    else
      v273 = 0;
    v274 = v273;
    objc_msgSend(v274, "explanation");
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v269, "addObject:", v275);

  }
  objc_msgSend(WeakRetained, "vocalAttenuationController");
  v276 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v276 || (v277 = v276[9], v276, v277 != 2))
  {
    objc_msgSend(WeakRetained, "vocalAttenuationController");
    v278 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[MPCWhiskyController isVocalAttenuationAvailable](v278))
      v279 = CFSTR("engine is ready for vocal attenuation");
    else
      v279 = CFSTR("engine cannot prepare for vocal attenuation");
    objc_msgSend(v270, "addObject:", v279);

  }
  if (objc_msgSend(v269, "count"))
  {
    if (!objc_msgSend(v269, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v406 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]");
      v407 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v406, "handleFailureInFunction:file:lineNumber:description:", v407, CFSTR("_MPCMediaRemotePublisher.m"), 1339, CFSTR("Must provide reason for unsupported command"));

    }
    objc_msgSend(v267, "setUnsupportedReasons:", v269);
    if (objc_msgSend(v267, "hasTargets"))
      objc_msgSend(v267, "removeTarget:action:", v268, sel__performCommandEvent_completion_);
  }
  else
  {
    objc_msgSend(v267, "setUnsupportedReasons:", 0);
    if ((objc_msgSend(v267, "hasTargets") & 1) == 0)
      objc_msgSend(v267, "addTarget:action:usingExtendedStatus:", v268, sel__performCommandEvent_completion_, 1);
    objc_msgSend(v267, "setEnabled:", objc_msgSend(v270, "count") == 0);
    objc_msgSend(v267, "setDisabledReasons:", v270);
  }

  -[MPRemoteCommandCenter vocalsControlCommand](self->_commandCenter, "vocalsControlCommand");
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  v281 = v268;
  objc_msgSend(*(id *)(v233 + 3768), "array");
  v282 = objc_claimAutoreleasedReturnValue();
  v283 = v233;
  v284 = (void *)v282;
  objc_msgSend(*(id *)(v283 + 3768), "array");
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v266 & 1) != 0)
  {
    objc_msgSend(v284, "addObject:", CFSTR("vocal attenuation is not supported on this device"));
    if ((v266 & 2) == 0)
    {
LABEL_397:
      if ((v266 & 8) == 0)
        goto LABEL_399;
      goto LABEL_398;
    }
  }
  else if ((v266 & 2) == 0)
  {
    goto LABEL_397;
  }
  objc_msgSend(v284, "addObject:", CFSTR("Active account cannot play catalog content"));
  if ((v266 & 8) != 0)
LABEL_398:
    objc_msgSend(v284, "addObject:", CFSTR("vocal attenuation is disabled in shared listening mode"));
LABEL_399:
  objc_msgSend(WeakRetained, "vocalAttenuationController");
  v286 = objc_claimAutoreleasedReturnValue();
  v287 = (void *)v286;
  if (v286)
    v288 = *(void **)(v286 + 80);
  else
    v288 = 0;
  v289 = v288;

  if (!v289)
  {
    objc_msgSend(WeakRetained, "vocalAttenuationController");
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    v291 = -[MPCWhiskyController isVocalAttenuationAvailable](v290);

    if ((v291 & 1) == 0)
      objc_msgSend(v284, "addObject:", CFSTR("engine is not ready for vocal attenuation"));
  }
  if ((v266 & 0x20) != 0)
    objc_msgSend(v285, "addObject:", CFSTR("current item does not support vocal attenuation"));
  -[MPRemoteCommandCenter vocalsControlCommand](self->_commandCenter, "vocalsControlCommand");
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v292, "setDisabledReason:", 0);

  if (objc_msgSend(v423, "supportsVocalAttenuation"))
  {
    if ((v266 & 0x10) != 0)
    {
      objc_msgSend(WeakRetained, "vocalAttenuationController");
      v293 = objc_claimAutoreleasedReturnValue();
      v294 = (void *)v293;
      if (v293)
        v295 = *(void **)(v293 + 80);
      else
        v295 = 0;
      v296 = v295;
      objc_msgSend(v296, "explanation");
      v297 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v285, "addObject:", v297);

    }
    objc_msgSend(WeakRetained, "vocalAttenuationController");
    v298 = objc_claimAutoreleasedReturnValue();
    v299 = (void *)v298;
    if (v298)
      v300 = *(void **)(v298 + 80);
    else
      v300 = 0;
    v301 = v300;

    if (v301)
    {
      objc_msgSend(WeakRetained, "vocalAttenuationController");
      v302 = objc_claimAutoreleasedReturnValue();
      v303 = (void *)v302;
      if (v302)
        v304 = *(void **)(v302 + 80);
      else
        v304 = 0;
      v305 = v304;
      v306 = objc_msgSend(v305, "reason");

      switch(v306)
      {
        case 0:
          -[MPRemoteCommandCenter vocalsControlCommand](self->_commandCenter, "vocalsControlCommand");
          v307 = (void *)objc_claimAutoreleasedReturnValue();
          v308 = v307;
          v309 = 0;
          goto LABEL_424;
        case 1:
          -[MPRemoteCommandCenter vocalsControlCommand](self->_commandCenter, "vocalsControlCommand");
          v307 = (void *)objc_claimAutoreleasedReturnValue();
          v308 = v307;
          v309 = 4;
          goto LABEL_424;
        case 2:
          -[MPRemoteCommandCenter vocalsControlCommand](self->_commandCenter, "vocalsControlCommand");
          v307 = (void *)objc_claimAutoreleasedReturnValue();
          v308 = v307;
          v309 = 5;
          goto LABEL_424;
        case 3:
          -[MPRemoteCommandCenter vocalsControlCommand](self->_commandCenter, "vocalsControlCommand");
          v307 = (void *)objc_claimAutoreleasedReturnValue();
          v308 = v307;
          v309 = 6;
LABEL_424:
          objc_msgSend(v307, "setDisabledReason:", v309);

          break;
        default:
          break;
      }
    }
  }
  objc_msgSend(WeakRetained, "vocalLevel");
  v311 = v310;
  -[MPRemoteCommandCenter vocalsControlCommand](self->_commandCenter, "vocalsControlCommand");
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v313) = v311;
  objc_msgSend(v312, "setVocalsLevel:", v313);

  objc_msgSend(WeakRetained, "vocalAttenuationController");
  v314 = objc_claimAutoreleasedReturnValue();
  v315 = (void *)v314;
  v316 = 0;
  v317 = 0;
  if (v314)
    v317 = *(_DWORD *)(v314 + 56);
  -[MPRemoteCommandCenter vocalsControlCommand](self->_commandCenter, "vocalsControlCommand");
  v318 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v319) = v317;
  objc_msgSend(v318, "setMinVocalsLevel:", v319);

  objc_msgSend(WeakRetained, "vocalAttenuationController");
  v320 = objc_claimAutoreleasedReturnValue();
  v321 = (void *)v320;
  if (v320)
    v316 = *(_DWORD *)(v320 + 60);
  -[MPRemoteCommandCenter vocalsControlCommand](self->_commandCenter, "vocalsControlCommand");
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v323) = v316;
  objc_msgSend(v322, "setMaxVocalsLevel:", v323);

  v324 = objc_msgSend(WeakRetained, "isVocalAttenuationEnabled");
  -[MPRemoteCommandCenter vocalsControlCommand](self->_commandCenter, "vocalsControlCommand");
  v325 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v325, "setVocalsControlActive:", v324);

  objc_msgSend(WeakRetained, "pickedRoute");
  v326 = (void *)objc_claimAutoreleasedReturnValue();
  v327 = objc_msgSend(v326, "isAirPlayRoute") ^ 1;
  -[MPRemoteCommandCenter vocalsControlCommand](self->_commandCenter, "vocalsControlCommand");
  v328 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v328, "setContinuous:", v327);

  if (objc_msgSend(v284, "count"))
  {
    v329 = v422;
    if (!objc_msgSend(v284, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v408 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]");
      v409 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v408, "handleFailureInFunction:file:lineNumber:description:", v409, CFSTR("_MPCMediaRemotePublisher.m"), 1387, CFSTR("Must provide reason for unsupported command"));

      v329 = v422;
    }
    objc_msgSend(v280, "setUnsupportedReasons:", v284);
    if (objc_msgSend(v280, "hasTargets"))
      objc_msgSend(v280, "removeTarget:action:", v281, sel__performCommandEvent_completion_);
  }
  else
  {
    objc_msgSend(v280, "setUnsupportedReasons:", 0);
    v329 = v422;
    if ((objc_msgSend(v280, "hasTargets") & 1) == 0)
      objc_msgSend(v280, "addTarget:action:usingExtendedStatus:", v281, sel__performCommandEvent_completion_, 1);
    objc_msgSend(v280, "setEnabled:", objc_msgSend(v285, "count") == 0);
    objc_msgSend(v280, "setDisabledReasons:", v285);
  }

  objc_msgSend(v329, "upNextBehavior");
  v330 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v423, "contentItemID");
  v331 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v330, "tailInsertionContentItemIDForTargetContentItemID:", v331);
  v332 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPRemoteCommandCenter clearUpNextCommand](self->_commandCenter, "clearUpNextCommand");
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  v334 = (id *)v281;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v335 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v336 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v329, "upNextBehavior");
  v337 = (void *)objc_claimAutoreleasedReturnValue();

  if (v337)
  {
    if (v332)
      goto LABEL_439;
  }
  else
  {
    objc_msgSend(v336, "addObject:", CFSTR("current behavior is not upNextBehavior"));
    if (v332)
      goto LABEL_439;
  }
  objc_msgSend(v335, "addObject:", CFSTR("no active up next queue"));
LABEL_439:
  if (objc_msgSend(v335, "count"))
  {
    if (!objc_msgSend(v335, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v410 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_MPCMediaRemotePublisher __updateSupportedCommands]");
      v411 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v410, "handleFailureInFunction:file:lineNumber:description:", v411, CFSTR("_MPCMediaRemotePublisher.m"), 1394, CFSTR("Must provide reason for unsupported command"));

    }
    objc_msgSend(v333, "setUnsupportedReasons:", v335);
    if (objc_msgSend(v333, "hasTargets"))
      objc_msgSend(v333, "removeTarget:action:", v334, sel__performCommandEvent_completion_);
  }
  else
  {
    objc_msgSend(v333, "setUnsupportedReasons:", 0);
    if ((objc_msgSend(v333, "hasTargets") & 1) == 0)
      objc_msgSend(v333, "addTarget:action:usingExtendedStatus:", v334, sel__performCommandEvent_completion_, 1);
    objc_msgSend(v333, "setEnabled:", objc_msgSend(v336, "count") == 0);
    objc_msgSend(v333, "setDisabledReasons:", v336);
  }

  if (MSVDeviceOSIsInternalInstall())
  {
    -[MPRemoteCommandCenter debugCommand](self->_commandCenter, "debugCommand");
    v338 = (void *)objc_claimAutoreleasedReturnValue();
    v339 = objc_msgSend(v338, "hasTargets");

    if ((v339 & 1) == 0)
    {
      -[MPRemoteCommandCenter debugCommand](self->_commandCenter, "debugCommand");
      v340 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v340, "addTarget:action:usingExtendedStatus:", v334, sel__performDebugEvent_completion_, 1);

    }
    -[MPRemoteCommandCenter debugCommand](self->_commandCenter, "debugCommand");
    v341 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v341, "setSupportedSubsystems:", &unk_24CB17398);

    v437[0] = CFSTR("com.apple.Music.performance");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p"), v334[17]);
    v342 = (void *)objc_claimAutoreleasedReturnValue();
    v437[1] = CFSTR("com.apple.Music.queue");
    v438[0] = v342;
    v343 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v422, "revisionString");
    v344 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v423, "contentItemID");
    v345 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v343, "stringWithFormat:", CFSTR("%@&currentItem=%@"), v344, v345);
    v346 = (void *)objc_claimAutoreleasedReturnValue();
    v438[1] = v346;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v438, v437, 2);
    v347 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPRemoteCommandCenter debugCommand](self->_commandCenter, "debugCommand");
    v348 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v348, "setSubsystemRevisions:", v347);

  }
  -[MPRemoteCommandCenter _debugCommandDescriptions](self->_commandCenter, "_debugCommandDescriptions");
  v349 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v349, "msv_compactMap:", &__block_literal_global_240);
  v350 = (void *)objc_claimAutoreleasedReturnValue();

  v351 = v334[9];
  v352 = v350;
  v353 = v351;
  v354 = v352;
  v355 = v352;
  if (v352 == v353)
    goto LABEL_456;
  v356 = v353;
  v357 = objc_msgSend(v352, "isEqual:", v353);

  if ((v357 & 1) == 0)
  {
    objc_storeStrong(v334 + 9, v350);
    objc_msgSend(v334, "playbackEngine");
    v355 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v355, "eventStream");
    v354 = (void *)objc_claimAutoreleasedReturnValue();
    v435 = CFSTR("remote-control-commands");
    v436 = v352;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v436, &v435, 1);
    v358 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v354, "emitEventType:payload:", CFSTR("remote-control-commands-changed"), v358);

LABEL_456:
  }
  v359 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v360 = v359;
  if (v414 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v359))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v360, OS_SIGNPOST_INTERVAL_END, spid, "UpdateSupportedCommands", ", buf, 2u);
  }

}

- (void)_performDebugEvent:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  NSDictionary *lastPerformanceMetrics;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void (**v29)(id, void *);

  v29 = (void (**)(id, void *))a4;
  v6 = a3;
  -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaRemoteOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE65960]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
  v11 = v10;
  if (v10 == CFSTR("com.apple.Music.performance")
    || (v12 = -[__CFString isEqual:](v10, "isEqual:", CFSTR("com.apple.Music.performance")), v11, v12))
  {
    lastPerformanceMetrics = self->_lastPerformanceMetrics;
    if (lastPerformanceMetrics)
    {
      objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", lastPerformanceMetrics, 0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        objc_msgSend(MEMORY[0x24BDDCB80], "statusWithCode:", 100);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v29[2](v29, v15);

      }
      objc_msgSend(MEMORY[0x24BDDCB80], "statusWithCode:customData:type:", 0, v14, CFSTR("com.public.json"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29[2](v29, v16);
      goto LABEL_18;
    }
    v24 = (void *)MEMORY[0x24BDDCB80];
    v25 = 100;
  }
  else
  {
    v17 = v11;
    if (v17 == CFSTR("com.apple.Music.queue")
      || (v18 = v17,
          v19 = -[__CFString isEqual:](v17, "isEqual:", CFSTR("com.apple.Music.queue")),
          v18,
          v19))
    {
      objc_msgSend(v7, "queueController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v20;
      if (v20)
      {
        objc_msgSend(v20, "debugDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)MEMORY[0x24BDDCB80];
        objc_msgSend(v16, "dataUsingEncoding:", 4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "statusWithCode:customData:type:", 0, v22, CFSTR("com.public.text"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v29[2](v29, v23);

      }
      else
      {
        v28 = (void *)MEMORY[0x24BDDCB80];
        objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 2, CFSTR("No queueController"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "statusWithCode:error:", 100, v16);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v29[2](v29, v22);
      }

LABEL_18:
      goto LABEL_19;
    }
    v26 = v18;
    if (v26 != CFSTR("com.apple.Music.events"))
    {
      v27 = v26;
      -[__CFString isEqual:](v26, "isEqual:", CFSTR("com.apple.Music.events"));

    }
    v24 = (void *)MEMORY[0x24BDDCB80];
    v25 = 200;
  }
  objc_msgSend(v24, "statusWithCode:", v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2](v29, v14);
LABEL_19:

}

- (void)_beginBackgroundTaskUntilPlayCommandWithCommand:(id)a3 timeout:(double)a4
{
  void *v6;
  id v7;
  id v8;
  MSVBlockGuard *v9;
  MSVBlockGuard *setPlaybackQueueExtendedTimeGuard;
  _QWORD v11[4];
  id v12;

  _MPCBeginBackgroundTaskAndReturnEndTaskBlockWithContext((uint64_t)"-[_MPCMediaRemotePublisher _beginBackgroundTaskUntilPlayCommandWithCommand:timeout:]", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BE65C40]);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __84___MPCMediaRemotePublisher__beginBackgroundTaskUntilPlayCommandWithCommand_timeout___block_invoke;
  v11[3] = &unk_24CAB2988;
  v12 = v6;
  v8 = v6;
  v9 = (MSVBlockGuard *)objc_msgSend(v7, "initWithTimeout:interruptionHandler:", v11, a4);
  setPlaybackQueueExtendedTimeGuard = self->_setPlaybackQueueExtendedTimeGuard;
  self->_setPlaybackQueueExtendedTimeGuard = v9;

}

- (void)_performCommandEvent:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  const char *v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  uint32_t v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  NSObject *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  void *v53;
  BOOL v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  int v77;
  void *v78;
  void *v79;
  _BOOL4 v80;
  void *v81;
  BOOL v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  unsigned int v93;
  _BOOL4 v95;
  uint64_t v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  char v101;
  NSObject *v102;
  void *v103;
  id v104;
  void *v105;
  NSObject *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  id v112;
  void *v113;
  void *v114;
  id v115;
  void *v116;
  uint64_t v117;
  id v118;
  void *v119;
  uint64_t v120;
  id v121;
  id v122;
  uint64_t v123;
  float v124;
  float v125;
  _MPCPodcastsPlaybackRateHelper *v126;
  void *v127;
  int v128;
  int v129;
  void *v130;
  uint64_t v131;
  double v132;
  _MPCPodcastsPlaybackRateHelper *v133;
  float v134;
  void *v135;
  id v136;
  double v137;
  id v138;
  id v139;
  id v140;
  id v141;
  void *v142;
  void *v143;
  BOOL v144;
  void *v145;
  void *v146;
  id v147;
  id v148;
  void *v149;
  char v150;
  NSObject *v151;
  double v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  id v159;
  unint64_t v160;
  void *v161;
  void *v162;
  id v163;
  uint64_t v164;
  void *v165;
  void *v166;
  id v167;
  id v168;
  void *v169;
  id v170;
  void *v171;
  void *v172;
  id v173;
  void *v174;
  void *v175;
  void *v176;
  id v177;
  void *v178;
  id v179;
  void *v180;
  id v181;
  void *v182;
  char v183;
  void *v184;
  _BOOL4 v185;
  void *v186;
  uint64_t v187;
  void *v188;
  id v189;
  void *v190;
  _BOOL4 v191;
  id v192;
  void (**v193)(_QWORD);
  void *v194;
  void *v195;
  id v196;
  id v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  BOOL v202;
  id v203;
  id v204;
  _BOOL4 v205;
  void *v206;
  void *v207;
  void *v208;
  id v209;
  uint64_t v210;
  int v211;
  int v212;
  void *v213;
  __CFString *v214;
  void *v215;
  void *v216;
  BOOL v217;
  void *v218;
  void *v219;
  void *v220;
  _QWORD *v221;
  BOOL v222;
  _QWORD *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  char v233;
  char v234;
  int v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  double v241;
  double v242;
  id *v243;
  id *v244;
  id v245;
  id v246;
  void *v247;
  void *v248;
  void *v249;
  int v250;
  id v251;
  void *v252;
  id v253;
  int v254;
  int v255;
  void *v256;
  void *v257;
  NSObject *v258;
  double v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  _BOOL4 v265;
  void *v266;
  void *v267;
  void *v268;
  __CFString *v269;
  double v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  id v291;
  void *v292;
  char v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  BOOL v304;
  id v305;
  void *v306;
  id v307;
  int v308;
  void *v309;
  BOOL v310;
  void *v311;
  int v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  NSObject *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  int64_t v326;
  uint64_t v327;
  void *v328;
  dispatch_time_t v329;
  NSObject *v330;
  void *v331;
  void *v332;
  void *v333;
  unint64_t v334;
  void *v335;
  void *v336;
  void *v337;
  id v338;
  void *v339;
  void *v340;
  unint64_t v341;
  NSObject *v342;
  NSObject *v343;
  NSObject *v344;
  NSObject *v345;
  void *v346;
  void *v347;
  void *v348;
  int v349;
  NSObject *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  id v359;
  id v360;
  void *v361;
  void *v362;
  void *v363;
  double v364;
  double v365;
  void *v366;
  double v367;
  double v368;
  void (**v369)(void);
  void *v370;
  id v371;
  NSObject *v372;
  double v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  dispatch_source_t v378;
  OS_dispatch_source *nextPreviousTrackCooldownTimer;
  NSObject *v380;
  dispatch_time_t v381;
  NSObject *v382;
  id v383;
  uint64_t v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  uint64_t v389;
  uint64_t v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  int v402;
  id v403;
  double v404;
  id v405;
  id v406;
  id v407;
  id v408;
  id v409;
  uint64_t (**v410)(void);
  uint64_t (**v411)(void);
  void (**v412)(void);
  void *v413;
  void (**v414)(void);
  void *v415;
  double v416;
  id v417;
  void *v418;
  void *v419;
  char *spid;
  id spida;
  void *spidb;
  void (**spidc)(void);
  _MPCMediaRemotePublisher *val;
  id vala;
  id v426;
  id v427;
  unsigned int v428;
  void *v429;
  void *v430;
  __CFString *v431;
  id v432;
  void *v433;
  void *v434;
  void *v435;
  _QWORD v436[4];
  id v437;
  _MPCMediaRemotePublisher *v438;
  id v439;
  char v440;
  _QWORD v441[4];
  id v442;
  id v443;
  char *v444;
  _QWORD v445[4];
  id v446;
  _QWORD v447[4];
  id v448;
  id v449;
  id v450;
  _QWORD v451[5];
  _QWORD v452[4];
  id v453;
  id v454;
  id v455;
  _QWORD v456[4];
  id v457;
  id v458;
  id v459;
  _QWORD v460[4];
  id v461;
  id v462;
  _QWORD v463[4];
  id v464;
  id v465;
  id v466;
  _MPCMediaRemotePublisher *v467;
  id v468;
  _QWORD v469[4];
  id v470;
  id v471;
  _QWORD v472[4];
  id v473;
  id v474;
  id v475;
  _MPCMediaRemotePublisher *v476;
  id v477;
  _QWORD v478[4];
  id v479;
  id v480;
  _QWORD v481[4];
  id v482;
  id v483;
  _QWORD v484[4];
  id v485;
  __CFString *v486;
  BOOL v487;
  _QWORD v488[4];
  id v489;
  id v490;
  _QWORD v491[4];
  id v492;
  id v493;
  _BOOL8 v494;
  _QWORD v495[4];
  id v496;
  id v497;
  uint64_t v498;
  _QWORD v499[4];
  id v500;
  id v501;
  uint64_t v502;
  _QWORD v503[4];
  id v504;
  id v505;
  unint64_t v506;
  _QWORD v507[4];
  id v508;
  id v509;
  _QWORD v510[4];
  void (**v511)(_QWORD);
  _QWORD v512[4];
  __CFString *v513;
  id v514;
  id v515;
  id v516;
  _QWORD v517[4];
  id v518;
  id v519;
  id v520;
  void (**v521)(void);
  _QWORD v522[4];
  id v523;
  id v524;
  id v525;
  id v526;
  _QWORD v527[4];
  id v528;
  _QWORD v529[5];
  id v530;
  _QWORD v531[5];
  id v532;
  _QWORD handler[5];
  id v534;
  _QWORD v535[4];
  id v536;
  id v537;
  _QWORD v538[4];
  id v539;
  id v540;
  _QWORD v541[4];
  id v542;
  id v543;
  uint64_t v544;
  id v545;
  id v546;
  _QWORD v547[4];
  id v548;
  id v549;
  _MPCMediaRemotePublisher *v550;
  id v551;
  id v552;
  _QWORD v553[4];
  id v554;
  double v555;
  _QWORD v556[4];
  id v557;
  id v558;
  id v559;
  _MPCMediaRemotePublisher *v560;
  id v561;
  id v562;
  id v563;
  _QWORD v564[4];
  id v565;
  _QWORD v566[4];
  id v567;
  _QWORD v568[4];
  id v569;
  id v570;
  id v571;
  _QWORD v572[4];
  id v573;
  id v574;
  id v575;
  _QWORD aBlock[4];
  id v577;
  double v578;
  id v579;
  id v580;
  id v581;
  id v582;
  id v583;
  id v584;
  _BYTE *v585;
  id v586[2];
  unsigned int v587;
  id location;
  _QWORD v589[2];
  const __CFString *v590;
  id v591;
  uint8_t v592[4];
  double v593;
  __int16 v594;
  id v595;
  __int16 v596;
  id v597;
  _BYTE buf[24];
  uint64_t (*v599)(uint64_t, uint64_t);
  void (*v600)(uint64_t);
  id v601;
  _QWORD v602[5];
  _QWORD v603[8];

  v603[5] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v417 = a4;
  v428 = objc_msgSend(v6, "mediaRemoteCommandType");
  val = self;
  -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queueController");
  v419 = (void *)objc_claimAutoreleasedReturnValue();
  MPCRemoteCommandDescriptionCopy(v428);
  v426 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commandID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v428 - 21 <= 1)
  {
    v9 = objc_msgSend(v6, "isNegative");
    v10 = CFSTR("YES");
    if (v9)
      v10 = CFSTR("NO");
    objc_msgSend(v426, "stringByAppendingFormat:", CFSTR(" (%@)"), v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v426 = (id)v11;
  }
  objc_msgSend(v7, "eventStream");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Command %@"), v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "eventDeliveryDeferralAssertionOfType:forReason:withTimeout:", 1, v13, 5.0);
  v415 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "interfaceID");
    v15 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v426;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2114;
    v599 = v15;
    _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "-[_MPCMediaRemotePublisher _performCommandEvent:completion:]: received MRMediaRemoteCommand type=%{public}@ id=%{public}@ interface=%{public}@", buf, 0x20u);

  }
  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  spid = (char *)os_signpost_id_make_with_pointer(v16, v8);

  if (v428)
  {
    if (v428 == 122)
    {
      v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
      v18 = v17;
      if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        v19 = "PerformCommandSetPlaybackQueue";
        v20 = "";
LABEL_15:
        v22 = v18;
        v23 = (os_signpost_id_t)spid;
        v24 = 2;
LABEL_19:
        _os_signpost_emit_with_name_impl(&dword_210BD8000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v23, v19, v20, buf, v24);
      }
    }
    else
    {
      v25 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
      v18 = v25;
      if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        v26 = objc_msgSend(objc_retainAutorelease(v426), "UTF8String");
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = v26;
        v19 = "PerformCommandOther";
        v20 = "command=%{public, signpost.telemetry:string1, name=command}s";
        v22 = v18;
        v23 = (os_signpost_id_t)spid;
        v24 = 12;
        goto LABEL_19;
      }
    }
  }
  else
  {
    v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    v18 = v21;
    if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      v19 = "PerformCommandPlay";
      v20 = "";
      goto LABEL_15;
    }
  }

  _MPCBeginBackgroundTaskAndReturnEndTaskBlockWithContext((uint64_t)"-[_MPCMediaRemotePublisher _performCommandEvent:completion:]", v426);
  v413 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaRemoteOptions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v435 = (void *)objc_msgSend(v27, "mutableCopy");

  objc_msgSend(v435, "setObject:forKeyedSubscript:", 0, *MEMORY[0x24BE65990]);
  objc_msgSend(v435, "setObject:forKeyedSubscript:", 0, *MEMORY[0x24BE658C0]);
  objc_msgSend(v435, "setObject:forKeyedSubscript:", 0, *MEMORY[0x24BE659A8]);
  objc_msgSend(v435, "setObject:forKeyedSubscript:", 0, *MEMORY[0x24BE659D8]);
  objc_msgSend(v435, "setObject:forKeyedSubscript:", 0, *MEMORY[0x24BE659E8]);
  objc_msgSend(v435, "setObject:forKeyedSubscript:", 0, *MEMORY[0x24BE658E8]);
  objc_msgSend(v435, "setObject:forKeyedSubscript:", 0, *MEMORY[0x24BE658B0]);
  objc_msgSend(v435, "setObject:forKeyedSubscript:", 0, CFSTR("playbackContext"));
  objc_msgSend(v435, "setObject:forKeyedSubscript:", 0, CFSTR("sharedListeningIntentToken"));
  objc_msgSend(v435, "setObject:forKeyedSubscript:", 0, CFSTR("kMRMediaRemoteOptionSenderID"));
  objc_msgSend(v7, "eventStream");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v603[0] = v8;
  v602[0] = CFSTR("remote-control-id");
  v602[1] = CFSTR("remote-control-type");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v428);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v603[1] = v29;
  v602[2] = CFSTR("remote-control-source");
  objc_msgSend(v6, "sourceID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v603[2] = v30;
  v602[3] = CFSTR("remote-control-associated-participant-id");
  objc_msgSend(v6, "associatedParticipantIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (!v31)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v602[4] = CFSTR("remote-control-options");
  v33 = (void *)MEMORY[0x24BDBD1B8];
  if (v435)
    v33 = v435;
  v603[3] = v32;
  v603[4] = v33;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v603, v602, 5);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "emitEventType:payload:", CFSTR("remote-control-begin"), v34);

  if (!v31)
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v599 = __Block_byref_object_copy__3282;
  v600 = __Block_byref_object_dispose__3283;
  v601 = 0;
  objc_initWeak(&location, val);
  objc_msgSend(v7, "eventStream");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke;
  aBlock[3] = &unk_24CAB29B0;
  v408 = v415;
  v577 = v408;
  v416 = COERCE_DOUBLE(v426);
  v578 = v416;
  v37 = v8;
  v579 = v37;
  v38 = v6;
  v580 = v38;
  v409 = v35;
  v581 = v409;
  v585 = buf;
  v406 = v417;
  v583 = v406;
  objc_copyWeak(v586, &location);
  v587 = v428;
  v586[1] = spid;
  v39 = v7;
  v582 = v39;
  v407 = v413;
  v584 = v407;
  v40 = _Block_copy(aBlock);
  v572[0] = v36;
  v572[1] = 3221225472;
  v572[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_267;
  v572[3] = &unk_24CAB29D8;
  v41 = v39;
  v573 = v41;
  v42 = v37;
  v574 = v42;
  v43 = v40;
  v575 = v43;
  v412 = (void (**)(void))_Block_copy(v572);
  v568[0] = v36;
  v568[1] = 3221225472;
  v568[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_271;
  v568[3] = &unk_24CAB29D8;
  v44 = v41;
  v569 = v44;
  v427 = v42;
  v570 = v427;
  v45 = v43;
  v571 = v45;
  v414 = (void (**)(void))_Block_copy(v568);
  v566[0] = v36;
  v566[1] = 3221225472;
  v566[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_273;
  v566[3] = &unk_24CAB2A00;
  v46 = v38;
  v567 = v46;
  v411 = (uint64_t (**)(void))_Block_copy(v566);
  v564[0] = v36;
  v564[1] = 3221225472;
  v564[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_279;
  v564[3] = &unk_24CAB2A00;
  v47 = v46;
  v565 = v47;
  v410 = (uint64_t (**)(void))_Block_copy(v564);
  v48 = v428;
  if (-[_MPCMediaRemotePublisher isMediaServerAvailable](val, "isMediaServerAvailable"))
    goto LABEL_31;
  v49 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v50 = os_log_type_enabled(v49, OS_LOG_TYPE_INFO);
  if (v428 == 139)
  {
    if (v50)
    {
      objc_msgSend(v47, "interfaceID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v592 = 138543874;
      v593 = v416;
      v594 = 2114;
      v595 = v427;
      v596 = 2114;
      v597 = v51;
      _os_log_impl(&dword_210BD8000, v49, OS_LOG_TYPE_INFO, "❕-[_MPCMediaRemotePublisher _performCommandEvent:completion:]: mediaserverd unavailable [allowing command] type=%{public}@ id=%{public}@ interface=%{public}@", v592, 0x20u);

    }
    v48 = v428;
LABEL_31:
    objc_msgSend(v47, "contentItemID");
    v418 = (void *)objc_claimAutoreleasedReturnValue();
    switch((int)v48)
    {
      case 0:
        v556[0] = v36;
        v556[1] = 3221225472;
        v556[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_294;
        v556[3] = &unk_24CAB2AA0;
        v562 = v45;
        v557 = v44;
        v558 = v419;
        v559 = v427;
        objc_copyWeak(&v563, &location);
        v560 = val;
        v561 = v47;
        -[_MPCMediaRemotePublisher becomeActiveIfNeededWithCommandID:completion:](val, "becomeActiveIfNeededWithCommandID:completion:", v559, v556);

        objc_destroyWeak(&v563);
        goto LABEL_41;
      case 1:
      case 3:
        objc_msgSend(v44, "player");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "currentItem");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v53 == 0;

        if (v54)
        {
          v229 = (void *)MEMORY[0x24BDDCB80];
          objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 2, CFSTR("Cannot pause because there is no current item."));
          v230 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v229, "statusWithCode:error:", 100, v230);
          v231 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, void *))v45 + 2))(v45, v231);

        }
        else
        {
          objc_msgSend(v47, "mediaRemoteOptions");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("MPCRemoteCommandEventOptionPauseFadeoutDurationKey"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "doubleValue");
          v58 = v57;

          objc_msgSend(v44, "player");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v553[0] = v36;
          v553[1] = 3221225472;
          v553[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_5;
          v553[3] = &unk_24CAB8400;
          v554 = v45;
          v555 = v58;
          objc_msgSend(v59, "pauseWithFadeout:identifier:completion:", v427, v553, v58);

        }
        goto LABEL_41;
      case 2:
        v547[0] = v36;
        v547[1] = 3221225472;
        v547[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_6;
        v547[3] = &unk_24CAB2AF0;
        v552 = v45;
        v548 = v44;
        v549 = v427;
        v550 = val;
        v551 = v47;
        -[_MPCMediaRemotePublisher becomeActiveIfNeededWithCommandID:completion:](val, "becomeActiveIfNeededWithCommandID:completion:", v549, v547);

        goto LABEL_41;
      case 4:
      case 5:
LABEL_43:
        v63 = objc_msgSend(v419, "behaviorType");
        v64 = v48 & 0xFFFFFFFE;
        if (v63 != 4)
          goto LABEL_48;
        +[MPCPodcastsDefaultsHelper standard](MPCPodcastsDefaultsHelper, "standard");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v65, "remoteSkipInsteadOfNextTrack") || v64 != 4 || (v411[2]() & 1) != 0)
        {

          goto LABEL_48;
        }
        v293 = v410[2]();

        if ((v293 & 1) != 0)
        {
LABEL_48:
          objc_msgSend(v44, "queueController");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "currentItem");
          v404 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            spida = *(id *)&v404;
          else
            spida = 0;
          objc_msgSend(v44, "player");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "currentTime");
          v88 = v87;

          objc_msgSend(spida, "chapters");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = objc_msgSend(v89, "count");

          objc_msgSend(spida, "nextChapterAfter:", v88);
          v91 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(spida, "previousChapterBefore:", v88);
          v92 = (void *)objc_claimAutoreleasedReturnValue();

          if (v428 != 4 || v91 == 0)
          {
            v93 = v428;
            v95 = v428 == 5 && v92 != 0;
          }
          else
          {
            v95 = 1;
            v93 = v428;
          }
          if (v63 == 4 && v64 == 4 && v90 && v95)
          {
            if (v93 == 4)
              v96 = 100;
            else
              v96 = 101;
            -[_MPCMediaRemotePublisher _performSkipChapterCommand:withCommandID:completion:](val, "_performSkipChapterCommand:withCommandID:completion:", v96, v427, v45);
            goto LABEL_301;
          }
          objc_msgSend(v47, "mediaRemoteOptions");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "objectForKeyedSubscript:", *MEMORY[0x24BE659E0]);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = objc_msgSend(v98, "longLongValue");

          if (v428 == 5)
          {
            objc_msgSend(*(id *)&v404, "contentItemID");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v546 = 0;
            v101 = objc_msgSend(v419, "canPreviousTrackForContentItemID:reason:", v100, &v546);
            v403 = v546;

            if ((v101 & 1) == 0)
            {
              _MPCLogCategoryPlayback();
              v102 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v592 = 138543618;
                v593 = v404;
                v594 = 2114;
                v595 = v403;
                _os_log_impl(&dword_210BD8000, v102, OS_LOG_TYPE_ERROR, "❗️Cannot skip backwards from current item: %{public}@ [%{public}@]", v592, 0x16u);
              }

              v103 = (void *)MEMORY[0x24BDDCB80];
              objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 2101, CFSTR("Current item forbids skipping backwards: %@ [%@]"), *(_QWORD *)&v404, v403);
              v104 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v103, "statusWithCode:error:", 200, v104);
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, void *))v45 + 2))(v45, v105);

LABEL_300:
LABEL_301:

              goto LABEL_41;
            }
          }
          else
          {
            objc_msgSend(*(id *)&v404, "contentItemID");
            v232 = (void *)objc_claimAutoreleasedReturnValue();
            v545 = 0;
            v233 = objc_msgSend(v419, "canNextTrackForContentItemID:reason:", v232, &v545);
            v403 = v545;

            if ((v233 & 1) == 0)
            {
              _MPCLogCategoryPlayback();
              v317 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v317, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v592 = 138543618;
                v593 = v404;
                v594 = 2114;
                v595 = v403;
                _os_log_impl(&dword_210BD8000, v317, OS_LOG_TYPE_ERROR, "❗️Cannot skip forwards from current item: %{public}@ [%{public}@]", v592, 0x16u);
              }

              v318 = (void *)MEMORY[0x24BDDCB80];
              objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 2101, CFSTR("Current item forbids skipping forwards: %@ [%@]"), *(_QWORD *)&v404, v403);
              v104 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v318, "statusWithCode:error:", 200, v104);
              v319 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, void *))v45 + 2))(v45, v319);

              goto LABEL_300;
            }
          }
          if (v418 || v99)
          {
            -[_MPCMediaRemotePublisher swift](val, "swift");
            v316 = (void *)objc_claimAutoreleasedReturnValue();
            v541[0] = v36;
            v541[1] = 3221225472;
            v541[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_314;
            v541[3] = &unk_24CAB2B18;
            v542 = v419;
            v543 = v45;
            v544 = v99;
            objc_msgSend(v316, "findContentItemIDWithIncomingContentItemID:trackID:completion:", v418, v99, v541);

            v104 = v542;
          }
          else
          {
            v104 = v47;
            v234 = objc_msgSend(v104, "isRequestingDefermentToPlaybackQueuePosition");
            if (v428 == 5)
              v235 = -1;
            else
              v235 = 1;
            objc_msgSend(v104, "mediaRemoteOptions");
            v236 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v236, "objectForKeyedSubscript:", CFSTR("MPCRemoteCommandEventOptionSkipImmediatelyKey"));
            v237 = (void *)objc_claimAutoreleasedReturnValue();
            v402 = objc_msgSend(v237, "BOOLValue");

            if ((v234 & 1) != 0
              || !objc_msgSend(v44, "skipWithDirectionShouldJumpToItemStart:", v428 != 5))
            {
              v535[0] = v36;
              v535[1] = 3221225472;
              v535[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_3_323;
              v535[3] = &unk_24CAB2B60;
              v536 = v419;
              v537 = v44;
              v433 = _Block_copy(v535);
              if (val->_nextPreviousTrackCooldownTimer)
              {
                v326 = val->_deferredTrackChangeDelta + v235;
                val->_deferredTrackChangeDelta = v326;
                if (v402)
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("🛎  Forced [pending delta %ld]"), v326);
                  v327 = objc_claimAutoreleasedReturnValue();
                  v328 = *(void **)(*(_QWORD *)&buf[8] + 40);
                  *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v327;

                  v329 = 0;
                }
                else
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("⏲  Deferred [pending delta %ld]"), v326);
                  v390 = objc_claimAutoreleasedReturnValue();
                  v391 = *(void **)(*(_QWORD *)&buf[8] + 40);
                  *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v390;

                  v329 = dispatch_time(0, 350000000);
                }
                dispatch_source_set_timer((dispatch_source_t)val->_nextPreviousTrackCooldownTimer, v329, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
              }
              else
              {
                v378 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
                nextPreviousTrackCooldownTimer = val->_nextPreviousTrackCooldownTimer;
                val->_nextPreviousTrackCooldownTimer = (OS_dispatch_source *)v378;

                v380 = val->_nextPreviousTrackCooldownTimer;
                v381 = dispatch_time(0, 350000000);
                dispatch_source_set_timer(v380, v381, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
                v382 = val->_nextPreviousTrackCooldownTimer;
                handler[0] = v36;
                handler[1] = 3221225472;
                handler[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_5_335;
                handler[3] = &unk_24CAB9830;
                handler[4] = val;
                v383 = v433;
                v534 = v383;
                dispatch_source_set_event_handler(v382, handler);
                dispatch_resume((dispatch_object_t)val->_nextPreviousTrackCooldownTimer);
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("🛎  Immediate"));
                v384 = objc_claimAutoreleasedReturnValue();
                v385 = *(void **)(*(_QWORD *)&buf[8] + 40);
                *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v384;

                (*((void (**)(id, _QWORD))v383 + 2))(v383, v235);
              }
              objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
              v238 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, void *))v45 + 2))(v45, v238);
              v243 = &v536;
              v244 = &v537;
            }
            else
            {
              objc_msgSend(v44, "player");
              v433 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "player");
              v238 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v238, "currentItem");
              v239 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v239, "playbackInfoStartTime");
              v240 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v240, "doubleValue");
              v242 = v241;
              v538[0] = v36;
              v538[1] = 3221225472;
              v538[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_320;
              v538[3] = &unk_24CABA438;
              v540 = v45;
              v539 = v44;
              objc_msgSend(v433, "jumpToTime:identifier:completion:", v427, v538, v242);

              v243 = &v540;
              v244 = &v539;
            }

          }
          goto LABEL_300;
        }
        +[MPCPodcastsDefaultsHelper standard](MPCPodcastsDefaultsHelper, "standard");
        v294 = (void *)objc_claimAutoreleasedReturnValue();
        if (v428 == 4)
        {
          objc_msgSend(v294, "skipForwardInterval");
          v412[2]();
        }
        else
        {
          objc_msgSend(v294, "skipBackwardInterval");
          v414[2]();
        }

        goto LABEL_41;
      case 6:
        objc_msgSend(v419, "music");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = objc_msgSend(v110, "shuffleType");

        v112 = v47;
        objc_msgSend(v419, "music");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v419, "targetContentItemID");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        v491[0] = v36;
        v491[1] = 3221225472;
        v491[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_8_382;
        v491[3] = &unk_24CAB5480;
        v493 = v45;
        v494 = v111 == 0;
        v115 = v112;
        v492 = v115;
        objc_msgSend(v113, "setShuffleType:targetContentItemID:completion:", v494, v114, v491);

        goto LABEL_41;
      case 7:
        objc_msgSend(v419, "music");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = objc_msgSend(v116, "repeatType");

        v118 = v47;
        objc_msgSend(v419, "music");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        if (v117)
          v120 = v117 == 2;
        else
          v120 = 2;
        v499[0] = v36;
        v499[1] = 3221225472;
        v499[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_6_378;
        v499[3] = &unk_24CAB5480;
        v501 = v45;
        v502 = v120;
        v121 = v118;
        v500 = v121;
        objc_msgSend(v119, "setRepeatType:completion:", v120, v499);

        goto LABEL_41;
      case 8:
        val->_hasBeganFastForward = 1;
        v529[0] = v36;
        v529[1] = 3221225472;
        v529[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_7_341;
        v529[3] = &unk_24CABA438;
        v529[4] = val;
        v530 = v45;
        objc_msgSend(v44, "beginScanningWithDirection:identifier:completion:", 1, v427, v529);

        goto LABEL_41;
      case 9:
      case 11:
        if (val->_hasBeganRewind || val->_hasBeganFastForward)
        {
          *(_WORD *)&val->_hasBeganFastForward = 0;
          objc_msgSend(v44, "player");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v527[0] = v36;
          v527[1] = 3221225472;
          v527[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_8_346;
          v527[3] = &unk_24CAB9A98;
          v528 = v45;
          objc_msgSend(v67, "endScanningWithIdentifier:completion:", v427, v527);

        }
        else
        {
          v320 = (void *)MEMORY[0x24BDDCB80];
          objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 2100, CFSTR("Attempting to stop scanning without scanning"));
          v321 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v320, "statusWithCode:error:", 1007, v321);
          v322 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, void *))v45 + 2))(v45, v322);

        }
        goto LABEL_41;
      case 10:
        val->_hasBeganRewind = 1;
        v531[0] = v36;
        v531[1] = 3221225472;
        v531[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_6_338;
        v531[3] = &unk_24CABA438;
        v531[4] = val;
        v532 = v45;
        objc_msgSend(v44, "beginScanningWithDirection:identifier:completion:", 0, v427, v531);

        goto LABEL_41;
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 23:
LABEL_82:
        _MPCLogCategoryPlayback();
        v106 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v592 = 138543618;
          v593 = v416;
          v594 = 2114;
          v595 = v427;
          _os_log_impl(&dword_210BD8000, v106, OS_LOG_TYPE_ERROR, "❗️Unsupported command: %{public}@ id=%{public}@", v592, 0x16u);
        }
LABEL_84:

        v107 = (void *)MEMORY[0x24BDDCB80];
        objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 5, CFSTR("Unsupported command event: %@"), v47);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "statusWithCode:error:", 200, v108);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v45 + 2))(v45, v109);

        goto LABEL_41;
      case 17:
        objc_msgSend(v47, "interval");
        v412[2]();
        goto LABEL_41;
      case 18:
        objc_msgSend(v47, "interval");
        v414[2]();
        goto LABEL_41;
      case 19:
        v122 = v47;
        v123 = objc_msgSend(v419, "behaviorType");
        objc_msgSend(v122, "playbackRate");
        v125 = v124;
        if (v123 != 4)
          goto LABEL_97;
        v126 = [_MPCPodcastsPlaybackRateHelper alloc];
        objc_msgSend(v44, "player");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "currentRate");
        v129 = v128;
        objc_msgSend(v44, "player");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        v131 = objc_msgSend(v130, "state");
        LODWORD(v132) = v129;
        v133 = -[_MPCPodcastsPlaybackRateHelper initWithCurrentRate:playbackState:](v126, "initWithCurrentRate:playbackState:", v131, v132);

        if (-[_MPCPodcastsPlaybackRateHelper canHandlePlaybackRateChangeForCommandEvent:](v133, "canHandlePlaybackRateChangeForCommandEvent:", v122))
        {
          -[_MPCPodcastsPlaybackRateHelper updatedPlaybackRateForChangePlaybackRateCommandEvent:](v133, "updatedPlaybackRateForChangePlaybackRateCommandEvent:", v122);
          v125 = v134;

LABEL_97:
          objc_msgSend(v44, "player");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          v447[0] = v36;
          v447[1] = 3221225472;
          v447[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_483;
          v447[3] = &unk_24CAB2D28;
          v449 = v45;
          v136 = v122;
          v448 = v136;
          objc_copyWeak(&v450, &location);
          *(float *)&v137 = v125;
          objc_msgSend(v135, "setRate:identifier:completion:", v427, v447, v137);

          objc_destroyWeak(&v450);
        }
        else
        {
          _MPCLogCategoryPlayback();
          v330 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v330, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v592 = 134349056;
            v593 = v125;
            _os_log_impl(&dword_210BD8000, v330, OS_LOG_TYPE_DEBUG, "Rate is set to either min or max speed: %{public}f", v592, 0xCu);
          }

          objc_msgSend(MEMORY[0x24BDDCB80], "statusWithCode:", 1007);
          v331 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, void *))v45 + 2))(v45, v331);

        }
        goto LABEL_41;
      case 20:
        v138 = v47;
        if (v418)
        {
          v139 = v418;
        }
        else
        {
          objc_msgSend(v44, "player");
          v275 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v275, "currentItem");
          v276 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v276, "contentItemID");
          v139 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v44, "queueController");
        v277 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v277, "itemForContentItemID:", v139);
        v278 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v138, "rating");
        objc_msgSend(v278, "setRating:");
        objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
        v279 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v45 + 2))(v45, v279);

        goto LABEL_41;
      case 21:
        v140 = v47;
        if (v418)
        {
          v141 = v418;
        }
        else
        {
          objc_msgSend(v44, "player");
          v280 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v280, "currentItem");
          v281 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v281, "contentItemID");
          v141 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v44, "queueController");
        v282 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v282, "itemForContentItemID:", v141);
        v283 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v140, "isNegative"))
        {
          if (objc_msgSend(v283, "likedState") != 2)
            goto LABEL_205;
          objc_msgSend(v140, "userIdentity");
          v284 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v283, "setLikedState:forUserIdentity:", 1, v284);
        }
        else
        {
          if (objc_msgSend(v283, "likedState") == 2)
            goto LABEL_205;
          objc_msgSend(v140, "userIdentity");
          v284 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v283, "setLikedState:forUserIdentity:", 2, v284);
        }

        -[_MPCMediaRemotePublisher publishIfNeeded](val, "publishIfNeeded");
        goto LABEL_205;
      case 22:
        v140 = v47;
        if (v418)
        {
          v141 = v418;
        }
        else
        {
          objc_msgSend(v44, "player");
          v286 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v286, "currentItem");
          v287 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v287, "contentItemID");
          v141 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v44, "queueController");
        v288 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v288, "itemForContentItemID:", v141);
        v283 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v140, "isNegative"))
        {
          if (objc_msgSend(v283, "likedState") != 3)
            goto LABEL_205;
          objc_msgSend(v140, "userIdentity");
          v289 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v283, "setLikedState:forUserIdentity:", 1, v289);
        }
        else
        {
          if (objc_msgSend(v283, "likedState") == 3)
            goto LABEL_205;
          objc_msgSend(v140, "userIdentity");
          v289 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v283, "setLikedState:forUserIdentity:", 3, v289);
        }

        -[_MPCMediaRemotePublisher publishIfNeeded](val, "publishIfNeeded");
LABEL_205:
        objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
        v285 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v45 + 2))(v45, v285);

        goto LABEL_41;
      case 24:
        objc_msgSend(v44, "player");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "currentItem");
        v430 = (void *)objc_claimAutoreleasedReturnValue();

        if (v430)
        {
          vala = v47;
          objc_msgSend(vala, "nowPlayingContentItemID");
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          v144 = v143 == 0;

          if (!v144)
          {
            objc_msgSend(vala, "nowPlayingContentItemID");
            v145 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v430, "contentItemID");
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            v147 = v145;
            v148 = v146;
            if (v147 == v148)
            {

            }
            else
            {
              v149 = v148;
              v150 = objc_msgSend(v147, "isEqual:", v148);

              if ((v150 & 1) == 0)
              {
                _MPCLogCategoryPlayback();
                v151 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(vala, "nowPlayingContentItemID");
                  v152 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                  objc_msgSend(v430, "contentItemID");
                  v153 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v592 = 138543618;
                  v593 = v152;
                  v594 = 2114;
                  v595 = v153;
                  _os_log_impl(&dword_210BD8000, v151, OS_LOG_TYPE_ERROR, "❗️SeekToPlaybackPosition failed. Could not seek for non-current item id: %{public}@ [currentItem is %{public}@]", v592, 0x16u);

                }
                v154 = (void *)MEMORY[0x24BDD1540];
                objc_msgSend(vala, "nowPlayingContentItemID");
                v155 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v430, "contentItemID");
                v156 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v154, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3, CFSTR("Cannot seek item (%@) with different current item (%@)"), v155, v156);
                v157 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v157, "mpc_remoteCommandStatus");
                v158 = (void *)objc_claimAutoreleasedReturnValue();
                (*((void (**)(id, void *))v45 + 2))(v45, v158);

                goto LABEL_272;
              }
            }
          }
          v522[0] = v36;
          v522[1] = 3221225472;
          v522[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_351;
          v522[3] = &unk_24CAB2B88;
          v359 = v44;
          v523 = v359;
          v524 = v427;
          v360 = v45;
          v526 = v360;
          v291 = vala;
          v525 = v291;
          spidc = (void (**)(void))_Block_copy(v522);
          objc_msgSend(v291, "referenceTime");
          v361 = (void *)objc_claimAutoreleasedReturnValue();
          if (v361)
          {
            objc_msgSend(v291, "referenceTime");
            v362 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v362, "doubleValue");

            objc_msgSend(v359, "transcriptAlignmentController");
            v363 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v291, "positionTime");
            v365 = v364;
            objc_msgSend(v291, "referenceTime");
            v366 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v366, "doubleValue");
            v368 = v367;
            v517[0] = v36;
            v517[1] = 3221225472;
            v517[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_353;
            v517[3] = &unk_24CAB2BB0;
            v518 = v359;
            v519 = v291;
            v520 = v360;
            v369 = spidc;
            v521 = v369;
            objc_msgSend(v363, "resolveWith:referenceTime:completionHandler:", v517, v365, v368);

            v155 = v523;
LABEL_272:

            goto LABEL_41;
          }
          objc_msgSend(v291, "positionTime");
          spidc[2]();

          v292 = v523;
        }
        else
        {
          v290 = (void *)MEMORY[0x24BDDCB80];
          objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 2, CFSTR("Cannot jumpToTime without a current item."));
          v291 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v290, "statusWithCode:error:", 100, v291);
          v292 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, void *))v45 + 2))(v45, v292);
        }

        goto LABEL_41;
      case 25:
        v159 = v47;
        v160 = objc_msgSend(v159, "repeatType");
        if (v160 >= 3)
        {
          v256 = (void *)MEMORY[0x24BDDCB80];
          objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 5, CFSTR("Unsupported repeatType %ld"), v160);
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v256, "statusWithCode:error:", 200, v162);
          v257 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, void *))v45 + 2))(v45, v257);

        }
        else
        {
          objc_msgSend(v419, "music");
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          v503[0] = v36;
          v503[1] = 3221225472;
          v503[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_5_373;
          v503[3] = &unk_24CAB5480;
          v505 = v45;
          v506 = v160;
          v504 = v159;
          objc_msgSend(v161, "setRepeatType:completion:", v160, v503);

          v162 = v505;
        }

        goto LABEL_41;
      case 26:
        v163 = v47;
        v164 = objc_msgSend(v163, "shuffleType");
        objc_msgSend(v419, "music");
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v419, "targetContentItemID");
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        v495[0] = v36;
        v495[1] = 3221225472;
        v495[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_7_379;
        v495[3] = &unk_24CAB5480;
        v497 = v45;
        v498 = v164;
        v167 = v163;
        v496 = v167;
        objc_msgSend(v165, "setShuffleType:targetContentItemID:completion:", v164, v166, v495);

        goto LABEL_41;
      default:
        switch((int)v48)
        {
          case 100:
          case 101:
            if (objc_msgSend(v419, "behaviorType") == 4)
            {
              -[_MPCMediaRemotePublisher _performSkipChapterCommand:withCommandID:completion:](val, "_performSkipChapterCommand:withCommandID:completion:", v48, v427, v45);
              goto LABEL_41;
            }
            _MPCLogCategoryPlayback();
            v106 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v592 = 138543618;
              v593 = v416;
              v594 = 2114;
              v595 = v427;
              _os_log_impl(&dword_210BD8000, v106, OS_LOG_TYPE_ERROR, "❗️Unsupported command: %{public}@ id=%{public}@", v592, 0x16u);
            }
            goto LABEL_84;
          case 102:
          case 103:
          case 104:
          case 105:
          case 106:
          case 107:
          case 108:
          case 109:
          case 110:
          case 111:
          case 112:
          case 113:
          case 114:
          case 115:
          case 116:
          case 117:
          case 118:
          case 119:
          case 120:
          case 123:
          case 126:
          case 136:
          case 137:
          case 138:
          case 141:
            goto LABEL_82;
          case 121:
            v173 = v47;
            objc_msgSend(v173, "stationURL");
            v174 = (void *)objc_claimAutoreleasedReturnValue();
            if (v174)
            {
              +[MPCPlaybackIntent radioPlaybackIntentWithStationURL:](MPCPlaybackIntent, "radioPlaybackIntentWithStationURL:", v174);
              v175 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v175, "setPlayActivityFeatureName:", CFSTR("siri"));
              objc_msgSend(v173, "contextID");
              v176 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v175, "setSiriReferenceIdentifier:", v176);

              v469[0] = v36;
              v469[1] = 3221225472;
              v469[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_425;
              v469[3] = &unk_24CABA438;
              v177 = v175;
              v470 = v177;
              v471 = v45;
              -[_MPCMediaRemotePublisher performSetQueueWithIntent:completion:](val, "performSetQueueWithIntent:completion:", v177, v469);

              v178 = v470;
            }
            else
            {
              objc_msgSend(v44, "player");
              v298 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v298, "currentItem");
              v177 = (id)objc_claimAutoreleasedReturnValue();

              if (v177)
              {
                objc_msgSend(v177, "modelGenericObject");
                v299 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v299, "flattenedGenericObject");
                v434 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v434, "type") == 1)
                {
                  objc_msgSend(v434, "song");
                  v300 = (void *)objc_claimAutoreleasedReturnValue();
                  +[MPCPlaybackIntent radioPlaybackIntentFromSong:](MPCPlaybackIntent, "radioPlaybackIntentFromSong:", v300);
                  v301 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v301, "setPlayActivityFeatureName:", CFSTR("now_playing"));
                  objc_msgSend(v173, "contextID");
                  v302 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v301, "setSiriReferenceIdentifier:", v302);

                  if (v301)
                  {
                    objc_msgSend(v419, "music");
                    v303 = (void *)objc_claimAutoreleasedReturnValue();
                    v304 = v303 == 0;

                    if (v304)
                    {
                      v460[0] = v36;
                      v460[1] = 3221225472;
                      v460[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_4_445;
                      v460[3] = &unk_24CABA438;
                      v462 = v45;
                      v305 = v301;
                      v461 = v305;
                      -[_MPCMediaRemotePublisher performSetQueueWithIntent:completion:](val, "performSetQueueWithIntent:completion:", v305, v460);

                      v306 = v462;
                    }
                    else
                    {
                      v463[0] = v36;
                      v463[1] = 3221225472;
                      v463[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_432;
                      v463[3] = &unk_24CAB9E18;
                      v305 = v301;
                      v464 = v305;
                      v468 = v45;
                      v465 = v419;
                      v466 = v177;
                      v467 = val;
                      objc_msgSend(v305, "getRemotePlaybackQueueWithDestination:completion:", 1, v463);

                      v306 = v464;
                    }
                  }
                  else
                  {
                    v397 = (void *)MEMORY[0x24BDDCB80];
                    v398 = (void *)MEMORY[0x24BDD1540];
                    objc_msgSend(v434, "song");
                    v306 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v398, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3000, CFSTR("Failed to get radio intent from song: %@"), v306);
                    v399 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v397, "statusWithCode:error:", 200, v399);
                    v400 = (void *)objc_claimAutoreleasedReturnValue();
                    (*((void (**)(id, void *))v45 + 2))(v45, v400);

                    v305 = 0;
                  }
                }
                else
                {
                  objc_msgSend(v434, "type");
                  NSStringFromMPModelGenericObjectType();
                  v305 = (id)objc_claimAutoreleasedReturnValue();
                  _MPCLogCategoryPlayback();
                  v372 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v372, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v44, "engineID");
                    v373 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                    *(_DWORD *)v592 = 138543874;
                    v593 = v373;
                    v594 = 2114;
                    v595 = v427;
                    v596 = 2114;
                    v597 = v305;
                    _os_log_impl(&dword_210BD8000, v372, OS_LOG_TYPE_ERROR, "[PBLSH:%{public}@] _performCommandEvent:%{public}@… | failing CreateRadioStation command [unsupported model object type] type=%{public}@", v592, 0x20u);

                  }
                  v374 = (void *)MEMORY[0x24BDDCB80];
                  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 5, CFSTR("Unsupported model object type %@"), v305);
                  v306 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v374, "statusWithCode:error:", 200, v306);
                  v375 = (void *)objc_claimAutoreleasedReturnValue();
                  (*((void (**)(id, void *))v45 + 2))(v45, v375);

                }
              }
              else
              {
                v370 = (void *)MEMORY[0x24BDDCB80];
                objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 2, CFSTR("Cannot create station with seed item without current item"));
                v434 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v370, "statusWithCode:error:", 100, v434);
                v305 = (id)objc_claimAutoreleasedReturnValue();
                (*((void (**)(id, id))v45 + 2))(v45, v305);
              }

              v178 = v434;
            }

            goto LABEL_41;
          case 122:
            v168 = v47;
            -[_MPCMediaRemotePublisher swift](val, "swift");
            v169 = (void *)objc_claimAutoreleasedReturnValue();
            v472[0] = v36;
            v472[1] = 3221225472;
            v472[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_406;
            v472[3] = &unk_24CAB2C40;
            v477 = v45;
            v170 = v168;
            v473 = v170;
            v474 = v44;
            v475 = v427;
            v476 = val;
            objc_msgSend(v169, "performSetQueueWithEvent:completion:", v170, v472);

            goto LABEL_41;
          case 124:
            v179 = v47;
            switch(objc_msgSend(v179, "stopMode"))
            {
              case 0:
                objc_msgSend(v44, "sleepTimerController");
                v180 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v180, "reset");
                goto LABEL_249;
              case 1:
                objc_msgSend(v44, "sleepTimerController");
                v180 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v179, "time");
                v335 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v335, "doubleValue");
                objc_msgSend(v180, "startSleepTimerWithTimeRemaining:");

                goto LABEL_249;
              case 2:
                objc_msgSend(v44, "sleepTimerController");
                v180 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v180, "startSleepTimerForChapterEnd");
                goto LABEL_249;
              case 3:
                objc_msgSend(v44, "sleepTimerController");
                v180 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v180, "startSleepTimerForItemEnd");
LABEL_249:

                break;
              default:
                break;
            }
            -[_MPCMediaRemotePublisher _updateSupportedCommands](val, "_updateSupportedCommands");
            objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
            v336 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, void *))v45 + 2))(v45, v336);

            goto LABEL_41;
          case 125:
            v181 = v47;
            objc_msgSend(v419, "upNextBehavior");
            v182 = (void *)objc_claimAutoreleasedReturnValue();
            v183 = objc_msgSend(v182, "allowsQueueModifications");

            if ((v183 & 1) != 0)
            {
              if (objc_msgSend(v181, "insertionPosition") == 3
                && (objc_msgSend(v181, "insertAfterContentItemID"),
                    v184 = (void *)objc_claimAutoreleasedReturnValue(),
                    v185 = v184 == 0,
                    v184,
                    v185))
              {
                v388 = (void *)MEMORY[0x24BDDCB80];
                objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 5, CFSTR("Insert operation indicated specific insertion position type, but no content item ID provided."));
                v189 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v388, "statusWithCode:error:", 1006, v189);
                v269 = (__CFString *)objc_claimAutoreleasedReturnValue();
                (*((void (**)(id, __CFString *))v45 + 2))(v45, v269);
              }
              else
              {
                objc_msgSend(v419, "upNextBehavior");
                v186 = (void *)objc_claimAutoreleasedReturnValue();
                v187 = objc_msgSend(v181, "insertionPosition");
                objc_msgSend(v419, "targetContentItemID");
                v188 = (void *)objc_claimAutoreleasedReturnValue();
                v516 = 0;
                LOBYTE(v187) = objc_msgSend(v186, "isSupportedInsertionPosition:fromContentItemID:reason:", v187, v188, &v516);
                v189 = v516;

                if ((v187 & 1) != 0)
                {
                  objc_msgSend(v419, "upNextBehavior");
                  v190 = (void *)objc_claimAutoreleasedReturnValue();
                  v191 = v190 == 0;

                  if (v191)
                  {
                    v395 = (void *)MEMORY[0x24BDDCB80];
                    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 5, CFSTR("InsertIntoPlaybackQueue not possible without up next behavior."));
                    v269 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v395, "statusWithCode:error:", 200, v269);
                    v396 = (void *)objc_claimAutoreleasedReturnValue();
                    (*((void (**)(id, void *))v45 + 2))(v45, v396);

                  }
                  else
                  {
                    v512[0] = v36;
                    v512[1] = 3221225472;
                    v512[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_365;
                    v512[3] = &unk_24CAB98A8;
                    v431 = v419;
                    v513 = v431;
                    v192 = v181;
                    v514 = v192;
                    v515 = v45;
                    v193 = (void (**)(_QWORD))_Block_copy(v512);
                    objc_msgSend(v192, "mediaRemoteOptions");
                    v194 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v194, "objectForKey:", CFSTR("MPCRemoteCommandEventOptionShouldPlayInsertedContent"));
                    v195 = (void *)objc_claimAutoreleasedReturnValue();
                    LODWORD(v192) = objc_msgSend(v195, "BOOLValue");

                    if ((_DWORD)v192)
                    {
                      v510[0] = v36;
                      v510[1] = 3221225472;
                      v510[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_3_369;
                      v510[3] = &unk_24CAB9720;
                      v511 = v193;
                      -[__CFString performAllowingEditsToChangeCurrentItem:](v431, "performAllowingEditsToChangeCurrentItem:", v510);

                    }
                    else
                    {
                      v193[2](v193);
                    }

                    v269 = v513;
                  }
                }
                else
                {
                  v332 = (void *)MEMORY[0x24BDDCB80];
                  v333 = (void *)MEMORY[0x24BDD1540];
                  v334 = objc_msgSend(v181, "insertionPosition");
                  if (v334 >= 5)
                  {
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown/%ld"), v334);
                    v269 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v269 = off_24CAB2E88[v334];
                  }
                  objc_msgSend(v333, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 5, CFSTR("Insert operation indicated unsupported insertion position: %@ [%@]"), v269, v189);
                  v376 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v332, "statusWithCode:error:", 1006, v376);
                  v377 = (void *)objc_claimAutoreleasedReturnValue();
                  (*((void (**)(id, void *))v45 + 2))(v45, v377);

                }
              }
            }
            else
            {
              v268 = (void *)MEMORY[0x24BDDCB80];
              objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 4, CFSTR("Cannot modify queue due to iAP lockout"));
              v189 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v268, "statusWithCode:error:", 1002, v189);
              v269 = (__CFString *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, __CFString *))v45 + 2))(v45, v269);
            }

            goto LABEL_41;
          case 127:
          case 128:
            v68 = v47;
            objc_msgSend(v68, "mediaRemoteOptions");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "objectForKey:", *MEMORY[0x24BE659E0]);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = objc_msgSend(v70, "longLongValue");

            objc_msgSend(v44, "player");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "currentItem");
            v429 = (void *)objc_claimAutoreleasedReturnValue();

            if (v71 && v71 != objc_msgSend(v429, "persistentID"))
            {
              v245 = objc_alloc(MEMORY[0x24BDDC9D8]);
              v246 = objc_alloc(MEMORY[0x24BDDC758]);
              objc_msgSend(MEMORY[0x24BDDC9D8], "kindWithVariants:", 1);
              v247 = (void *)objc_claimAutoreleasedReturnValue();
              v451[0] = v36;
              v451[1] = 3221225472;
              v451[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_466;
              v451[3] = &__block_descriptor_40_e49_v16__0__MPIdentifierSet_MPMutableIdentifierSet__8l;
              v451[4] = v71;
              v248 = (void *)objc_msgSend(v246, "initWithSource:modelKind:block:", CFSTR("MediaRemotePublisher"), v247, v451);
              v75 = (void *)objc_msgSend(v245, "initWithIdentifiers:block:", v248, &__block_literal_global_473_3305);

              v76 = 0;
              v77 = 1;
            }
            else
            {
              objc_msgSend(v429, "modelGenericObject");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "flattenedGenericObject");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "anyObject");
              v75 = (void *)objc_claimAutoreleasedReturnValue();

              os_unfair_lock_lock(&val->_libraryAddStatusObserverLock);
              v76 = -[MPLibraryAddStatusObserver currentStatus](val->_libraryAddStatusObserver, "currentStatus");
              os_unfair_lock_unlock(&val->_libraryAddStatusObserverLock);
              v77 = 0;
            }
            if (v75)
            {
              objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
              v249 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, void *))v45 + 2))(v45, v249);

              if (objc_msgSend(v68, "isNegative"))
              {
                if (v76 == 1)
                  v250 = 1;
                else
                  v250 = v77;
                if (v250 == 1)
                {
                  v251 = objc_alloc_init(MEMORY[0x24BDDC8C8]);
                  objc_msgSend(v251, "setModelObject:", v75);
                  objc_msgSend(v251, "performWithResponseHandler:", &__block_literal_global_476);
LABEL_175:

                  goto LABEL_185;
                }
                goto LABEL_185;
              }
              if (v76 == 1)
                v254 = v77;
              else
                v254 = 1;
              if (v254 != 1 || ((v76 & 0xFFFFFFFFFFFFFFFELL) == 2 ? (v255 = 1) : (v255 = v77), v255 != 1))
              {
LABEL_185:

                goto LABEL_41;
              }
              v251 = objc_alloc_init(MEMORY[0x24BDDCA88]);
              objc_msgSend(v251, "appendSection:", &stru_24CABB5D0);
              objc_msgSend(v251, "appendItem:", v75);
              v253 = objc_alloc_init(MEMORY[0x24BDDC8E0]);
              objc_msgSend(v253, "setShouldLibraryAdd:", 1);
              objc_msgSend(v253, "setModelObjects:", v251);
              objc_msgSend(v253, "performWithResponseHandler:", &__block_literal_global_480);
            }
            else
            {
              v252 = (void *)MEMORY[0x24BDDCB80];
              objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3, CFSTR("Unable to find item to add to library: trackID=%lld currentItem=%@"), v71, v429);
              v251 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v252, "statusWithCode:error:", 100, v251);
              v253 = (id)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, id))v45 + 2))(v45, v253);
            }

            goto LABEL_175;
          case 129:
            if (v418)
            {
              objc_msgSend(v419, "upNextBehavior");
              v171 = (void *)objc_claimAutoreleasedReturnValue();
              v481[0] = v36;
              v481[1] = 3221225472;
              v481[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_12;
              v481[3] = &unk_24CABA438;
              v483 = v45;
              v482 = v47;
              objc_msgSend(v171, "removeContentItemID:completion:", v418, v481);

              goto LABEL_41;
            }
            v295 = (void *)MEMORY[0x24BDDCB80];
            objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3, CFSTR("Cannot find item to remove: %@"), 0);
            v296 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v295, "statusWithCode:error:", 100, v296);
            v297 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, void *))v45 + 2))(v45, v297);

            goto LABEL_42;
          case 130:
            v196 = v47;
            v507[0] = v36;
            v507[1] = 3221225472;
            v507[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_4_370;
            v507[3] = &unk_24CABA438;
            v509 = v45;
            v197 = v196;
            v508 = v197;
            v198 = _Block_copy(v507);
            objc_msgSend(v197, "insertBeforeContextItemID");
            v199 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v199, "length"))
            {
              objc_msgSend(v419, "upNextBehavior");
              v200 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v200, "moveContentItemID:beforeContentItemID:completion:", v418, v199, v198);
            }
            else
            {
              objc_msgSend(v197, "insertAfterContextItemID");
              v200 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v200, "length"))
              {
                objc_msgSend(v419, "upNextBehavior");
                v315 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v315, "moveContentItemID:afterContentItemID:completion:", v418, v200, v198);

              }
            }

            goto LABEL_41;
          case 131:
            goto LABEL_43;
          case 132:
            objc_msgSend(v44, "queueController");
            v201 = (void *)objc_claimAutoreleasedReturnValue();
            v202 = objc_msgSend(v201, "behaviorType") == 4;

            if (v202)
            {
              objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
              v203 = (id)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, id))v45 + 2))(v45, v203);
            }
            else
            {
              v203 = v47;
              objc_msgSend(v203, "userIdentity");
              v270 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
              v271 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v271, "accountForUserIdentity:", *(_QWORD *)&v270);
              v272 = (void *)objc_claimAutoreleasedReturnValue();

              if (v272)
              {
                objc_msgSend(v44, "leaseManager");
                v273 = (void *)objc_claimAutoreleasedReturnValue();
                v478[0] = v36;
                v478[1] = 3221225472;
                v478[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_396;
                v478[3] = &unk_24CABA438;
                v480 = v45;
                v479 = v272;
                objc_msgSend(v273, "prepareForPlaybackWithAccount:completion:", v479, v478);

                v274 = v480;
              }
              else
              {
                _MPCLogCategoryPlayback();
                v342 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v342, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v592 = 138412290;
                  v593 = v270;
                  _os_log_impl(&dword_210BD8000, v342, OS_LOG_TYPE_ERROR, "❗️[Skipping PrepareForSetQueue] No playback account found for user identity: %@", v592, 0xCu);
                }

                objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
                v274 = (void *)objc_claimAutoreleasedReturnValue();
                (*((void (**)(id, void *))v45 + 2))(v45, v274);
              }

            }
            if (MSVDeviceIsAudioAccessory())
            {
              dispatch_get_global_queue(21, 0);
              v343 = objc_claimAutoreleasedReturnValue();
              dispatch_async(v343, &__block_literal_global_402);

              dispatch_async(v343, &__block_literal_global_404);
            }
            goto LABEL_41;
          case 133:
            v204 = v47;
            objc_msgSend(v204, "type");
            v459 = 0;
            spidb = (void *)objc_claimAutoreleasedReturnValue();
            v205 = +[MPCQueueController isSupportedSessionType:forEngine:reason:](MPCQueueController, "isSupportedSessionType:forEngine:reason:", spidb, v44, &v459);
            v405 = v459;
            if (v205)
            {
              objc_msgSend(v204, "identifier");
              v432 = (id)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v432, "length"))
              {
                v337 = (void *)MEMORY[0x24BDDCB80];
                objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3104, CFSTR("Migration identifier missing"));
                v262 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v337, "statusWithCode:error:", 200, v262);
                v338 = (id)objc_claimAutoreleasedReturnValue();
                (*((void (**)(id, id))v45 + 2))(v45, v338);
LABEL_294:

                goto LABEL_295;
              }
              objc_msgSend(v44, "eventStream");
              v206 = (void *)objc_claimAutoreleasedReturnValue();
              v590 = CFSTR("session-id");
              v591 = v432;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v591, &v590, 1);
              v207 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v206, "emitEventType:payload:", CFSTR("session-migrate-begin"), v207);

              +[_MPCQueueControllerBehaviorPodcastsTransportableExtension defaultSessionType](_MPCQueueControllerBehaviorPodcastsTransportableExtension, "defaultSessionType");
              v208 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(spidb, "isEqualToString:", v208))
              {

LABEL_265:
                _MPCLogCategoryPodcastsBehavior();
                v350 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v350, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)v592 = 0;
                  _os_log_impl(&dword_210BD8000, v350, OS_LOG_TYPE_DEFAULT, "Received legacy Podcasts queue from handoff", v592, 2u);
                }

                objc_msgSend(v204, "playbackSessionData");
                v262 = (void *)objc_claimAutoreleasedReturnValue();
                v351 = (void *)MEMORY[0x24BDD1620];
                v352 = (void *)MEMORY[0x24BDBCF20];
                v589[0] = objc_opt_class();
                v589[1] = objc_opt_class();
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v589, 2);
                v353 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v352, "setWithArray:", v353);
                v354 = (void *)objc_claimAutoreleasedReturnValue();
                v458 = 0;
                objc_msgSend(v351, "unarchivedObjectOfClasses:fromData:error:", v354, v262, &v458);
                v355 = (void *)objc_claimAutoreleasedReturnValue();
                v338 = v458;

                if (v338)
                {
                  v356 = (void *)MEMORY[0x24BDDCB80];
                  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3101, v338, CFSTR("Unabled to decode session"));
                  v357 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v356, "statusWithCode:error:", 200, v357);
                  v358 = (void *)objc_claimAutoreleasedReturnValue();
                  (*((void (**)(id, void *))v45 + 2))(v45, v358);
                }
                else
                {
                  v389 = MRSystemAppPlaybackQueueCreate();
                  MRSystemAppPlaybackQueueSetGenericTrackIdentifiers();
                  v357 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDC740]), "initWithMediaRemotePlaybackQueue:options:", v389, 0);
                  objc_msgSend(v357, "setRequestingImmediatePlayback:", 0);
                  v456[0] = v36;
                  v456[1] = 3221225472;
                  v456[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_456;
                  v456[3] = &unk_24CAB9A98;
                  v457 = v45;
                  -[_MPCMediaRemotePublisher performSetQueue:completion:](val, "performSetQueue:completion:", v357, v456);
                  v358 = v457;
                }

                goto LABEL_294;
              }
              +[_MPCQueueControllerBehaviorPodcastsTransportableExtension fallbackSessionType](_MPCQueueControllerBehaviorPodcastsTransportableExtension, "fallbackSessionType");
              v348 = (void *)objc_claimAutoreleasedReturnValue();
              v349 = objc_msgSend(spidb, "isEqualToString:", v348);

              if (v349)
                goto LABEL_265;
              objc_msgSend(v44, "leaseManager");
              v392 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v392, "setCanStealLeaseIfNeeded");

              objc_msgSend(v44, "player");
              v393 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v393, "pauseWithIdentifier:completion:", v427, &__block_literal_global_458);

              -[_MPCMediaRemotePublisher swift](val, "swift");
              v394 = (void *)objc_claimAutoreleasedReturnValue();
              v452[0] = v36;
              v452[1] = 3221225472;
              v452[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_459;
              v452[3] = &unk_24CAB9CA8;
              v453 = v44;
              v432 = v432;
              v454 = v432;
              v455 = v45;
              objc_msgSend(v394, "performSetSessionWithEvent:completion:", v204, v452);

              v262 = v453;
            }
            else
            {
              _MPCLogCategoryPlayback();
              v258 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v258, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v204, "type");
                v259 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                *(_DWORD *)v592 = 138543618;
                v593 = v259;
                v594 = 2114;
                v595 = v405;
                _os_log_impl(&dword_210BD8000, v258, OS_LOG_TYPE_ERROR, "Unsupported sessionType [SetPlaybackSession] type=%{public}@ reason=%{public}@", v592, 0x16u);

              }
              v260 = (void *)MEMORY[0x24BDDCB80];
              v261 = (void *)MEMORY[0x24BDD1540];
              objc_msgSend(v204, "type");
              v432 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v261, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 5, CFSTR("Unsupported sessionType %@"), v432);
              v262 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v260, "statusWithCode:error:", 200, v262);
              v263 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, void *))v45 + 2))(v45, v263);

            }
LABEL_295:

            goto LABEL_41;
          case 134:
            v488[0] = v36;
            v488[1] = 3221225472;
            v488[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_9_383;
            v488[3] = &unk_24CAB9830;
            v489 = v419;
            v490 = v45;
            objc_msgSend(v489, "performAllowingEditsToChangeCurrentItem:", v488);

            goto LABEL_41;
          case 135:
            v209 = v47;
            v210 = objc_msgSend(v209, "queueEndAction");
            v211 = objc_msgSend(v44, "disableAutoPlay");
            if (v210 == 3)
              v212 = v211;
            else
              v212 = 0;
            if (v212 == 1)
            {
              v213 = (void *)MEMORY[0x24BDDCB80];
              objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 5, CFSTR("playback engine autoplay disabled"));
              v214 = (__CFString *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v213, "statusWithCode:error:", 200, v214);
              v215 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, void *))v45 + 2))(v45, v215);

            }
            else
            {
              objc_msgSend(v419, "music");
              v264 = (void *)objc_claimAutoreleasedReturnValue();
              v265 = v264 == 0;

              if (v265)
              {
                v339 = (void *)MEMORY[0x24BDDCB80];
                v340 = (void *)MEMORY[0x24BDD1540];
                v341 = objc_msgSend(v419, "behaviorType");
                if (v341 >= 6)
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unknown/%lld"), v341);
                  v214 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v214 = off_24CAB2EB0[v341];
                }
                objc_msgSend(v340, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 5, CFSTR("unsupported command [%@ behavior]"), v214);
                v386 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v339, "statusWithCode:error:", 200, v386);
                v387 = (void *)objc_claimAutoreleasedReturnValue();
                (*((void (**)(id, void *))v45 + 2))(v45, v387);

              }
              else
              {
                objc_msgSend(v419, "music");
                v266 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v419, "targetContentItemID");
                v267 = (void *)objc_claimAutoreleasedReturnValue();
                v484[0] = v36;
                v484[1] = 3221225472;
                v484[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_11;
                v484[3] = &unk_24CAB2BD8;
                v486 = (__CFString *)v45;
                v487 = v210 == 3;
                v485 = v209;
                objc_msgSend(v266, "setAutoPlayEnabled:targetContentItemID:completion:", v210 == 3, v267, v484);

                v214 = v486;
              }
            }

            goto LABEL_41;
          case 139:
            v445[0] = v36;
            v445[1] = 3221225472;
            v445[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_486;
            v445[3] = &unk_24CAB2D50;
            v446 = v45;
            -[_MPCMediaRemotePublisher _leaveSharedSessionWithCommandID:completion:](val, "_leaveSharedSessionWithCommandID:completion:", v427, v445);

            goto LABEL_41;
          case 140:
            objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
            v172 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, void *))v45 + 2))(v45, v172);

            goto LABEL_41;
          case 142:
            objc_msgSend(v419, "musicSharePlay");
            v216 = (void *)objc_claimAutoreleasedReturnValue();
            v217 = v216 == 0;

            if (v217)
            {
              v307 = v47;
              v308 = objc_msgSend(v44, "isVocalAttenuationEnabled");
              objc_msgSend(v307, "active");
              v309 = (void *)objc_claimAutoreleasedReturnValue();
              v310 = v309 == 0;

              if (!v310)
              {
                objc_msgSend(v307, "active");
                v311 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "setVocalAttenuationEnabled:", objc_msgSend(v311, "BOOLValue"));

              }
              v312 = objc_msgSend(v44, "isVocalAttenuationEnabled");
              objc_msgSend(v307, "level");
              v313 = (void *)objc_claimAutoreleasedReturnValue();
              if (v313)
              {
                objc_msgSend(v307, "level");
                v314 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v314, "floatValue");
              }
              else
              {
                objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
                v314 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v314, "defaultVocalLevel");
              }
              objc_msgSend(v44, "setVocalLevel:");

              if (v308 == v312)
              {
                objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
                v371 = (id)objc_claimAutoreleasedReturnValue();
                (*((void (**)(id, id))v45 + 2))(v45, v371);
              }
              else
              {
                -[_MPCMediaRemotePublisher _updateSupportedCommands](val, "_updateSupportedCommands");
                v436[0] = v36;
                v436[1] = 3221225472;
                v436[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_509;
                v436[3] = &unk_24CAB2DC8;
                v440 = v308;
                v437 = v44;
                v438 = val;
                v439 = v45;
                objc_msgSend(v437, "reloadQueueForReason:completion:", 1, v436);

                v371 = v437;
              }

            }
            else
            {
              v218 = (void *)MEMORY[0x24BDDCB80];
              objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 5, CFSTR("Vocal attenuator is disabled in shared listening mode"));
              v219 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v218, "statusWithCode:error:", 200, v219);
              v220 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, void *))v45 + 2))(v45, v220);

            }
            goto LABEL_41;
          case 143:
            objc_msgSend(v44, "vocalAttenuationController");
            v221 = (_QWORD *)objc_claimAutoreleasedReturnValue();
            if (v221 && (v222 = v221[9] == 2, v221, v222))
            {
              objc_msgSend(v44, "vocalAttenuationController");
              v223 = (_QWORD *)objc_claimAutoreleasedReturnValue();
              -[MPCWhiskyController prepareForProcessing](v223);

              objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
              v224 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, void *))v45 + 2))(v45, v224);

            }
            else
            {
              objc_msgSend(MEMORY[0x24BDDCB80], "statusWithCode:", 0);
              v401 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, void *))v45 + 2))(v45, v401);

            }
            goto LABEL_41;
          case 144:
            objc_msgSend(v419, "upNextBehavior");
            v225 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "queueController");
            v226 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v226, "targetContentItemID");
            v227 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v225, "clearAllItemsAfterContentItemID:", v227);

            objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
            v228 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, void *))v45 + 2))(v45, v228);

            goto LABEL_41;
          default:
            if ((_DWORD)v48 != 25020)
              goto LABEL_82;
            objc_msgSend(v44, "player");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "currentItem");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v80 = v79 == 0;

            if (v80)
            {
              v323 = (void *)MEMORY[0x24BDDCB80];
              objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 2, CFSTR("Failed to share queue [no current item]"));
              v324 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v323, "statusWithCode:error:", 200, v324);
              v325 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, void *))v45 + 2))(v45, v325);

            }
            else
            {
              objc_msgSend(v419, "musicSharePlay");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              v82 = v81 == 0;

              if (v82)
              {
                _MPCLogCategoryPlayback();
                v344 = objc_claimAutoreleasedReturnValue();
                v345 = v344;
                if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v344))
                {
                  *(_WORD *)v592 = 0;
                  _os_signpost_emit_with_name_impl(&dword_210BD8000, v345, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)spid, "shareQueue:getTracklist", ", v592, 2u);
                }

                objc_msgSend(v419, "music");
                v346 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v419, "targetContentItemID");
                v347 = (void *)objc_claimAutoreleasedReturnValue();
                v441[0] = v36;
                v441[1] = 3221225472;
                v441[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_491;
                v441[3] = &unk_24CAB2DA0;
                v444 = spid;
                v443 = v45;
                v442 = v47;
                objc_msgSend(v346, "getSharedQueueTracklistWithStartingContentItemID:completion:", v347, v441);

              }
              else
              {
                v83 = (void *)MEMORY[0x24BDDCB80];
                objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 5, CFSTR("Cannot get a shared queue tracklist [already in a shared queue] queueController=%@"), v419);
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v83, "statusWithCode:error:", 200, v84);
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                (*((void (**)(id, void *))v45 + 2))(v45, v85);

              }
            }
            goto LABEL_41;
        }
    }
  }
  if (v50)
  {
    objc_msgSend(v47, "interfaceID");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v592 = 138543874;
    v593 = v416;
    v594 = 2114;
    v595 = v427;
    v596 = 2114;
    v597 = v60;
    _os_log_impl(&dword_210BD8000, v49, OS_LOG_TYPE_INFO, "❕-[_MPCMediaRemotePublisher _performCommandEvent:completion:]: mediaserverd unavailable [failing command] type=%{public}@ id=%{public}@ interface=%{public}@", v592, 0x20u);

  }
  v61 = (void *)MEMORY[0x24BDDCB80];
  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 1000, CFSTR("mediaserverd not available to perform command"));
  v418 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "statusWithCode:error:", 1501, v418);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v45 + 2))(v45, v62);

LABEL_41:
LABEL_42:

  objc_destroyWeak(v586);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);

}

- (void)performSetQueueWithIntent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _MPCMediaRemotePublisher *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65___MPCMediaRemotePublisher_performSetQueueWithIntent_completion___block_invoke;
  v10[3] = &unk_24CAB5718;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v9, "getRemotePlaybackQueueWithDestination:completion:", 1, v10);

}

- (void)performSetQueue:(id)a3 completion:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = (objc_class *)MEMORY[0x24BDDCBE8];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  -[_MPCMediaRemotePublisher commandCenter](self, "commandCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPlaybackQueueCommand");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v9, "initWithCommand:playbackQueue:", v11, v8);

  -[_MPCMediaRemotePublisher swift](self, "swift");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "performSetQueueWithEvent:completion:", v13, v7);

}

- (void)_performSkipChapterCommand:(unsigned int)a3 withCommandID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  NSObject *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "player");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentTime");
  v13 = v12;

  objc_msgSend(v10, "queueController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v15;
  if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v16;
      _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_ERROR, "❗️Cannot skip chapters for current item: %{public}@, item has an unexpected type.", buf, 0xCu);
    }

    v21 = (void *)MEMORY[0x24BDDCB80];
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 2101, CFSTR("Current item has an unexpected type: %@."), v16);
    goto LABEL_10;
  }
  objc_msgSend(v16, "chapters");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (!v18)
  {
    v24 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v16;
      _os_log_impl(&dword_210BD8000, v24, OS_LOG_TYPE_ERROR, "❗️Cannot skip chapters for current item: %{public}@, item does not have chapters.", buf, 0xCu);
    }

    v21 = (void *)MEMORY[0x24BDDCB80];
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 2101, CFSTR("Current item does not have chapters: %@."), v16);
    goto LABEL_10;
  }
  if (a3 == 101)
  {
    objc_msgSend(v16, "previousChapterBefore:", v13);
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v25 = (void *)v19;
    if (v19)
    {
      objc_msgSend(v10, "player");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "startTime");
      v28 = v27;
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __80___MPCMediaRemotePublisher__performSkipChapterCommand_withCommandID_completion___block_invoke;
      v30[3] = &unk_24CAB9CA8;
      v31 = v16;
      v32 = v25;
      v33 = v9;
      v22 = v25;
      objc_msgSend(v26, "jumpToTime:identifier:completion:", v8, v30, v28);

      v23 = v31;
      goto LABEL_11;
    }
    goto LABEL_18;
  }
  if (a3 == 100)
  {
    objc_msgSend(v16, "nextChapterAfter:", v13);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
LABEL_18:
  v29 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v35 = v16;
    _os_log_impl(&dword_210BD8000, v29, OS_LOG_TYPE_ERROR, "❗️Cannot skip chapters for current item: %{public}@, unable to find next chapter.", buf, 0xCu);
  }

  v21 = (void *)MEMORY[0x24BDDCB80];
  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 2101, CFSTR("Unable to find next chapter for current item: %@."), v16);
LABEL_10:
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "statusWithCode:error:", 200, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v9 + 2))(v9, v23);
LABEL_11:

}

- (MPNowPlayingInfoCenter)infoCenter
{
  return self->_infoCenter;
}

- (_MPCMediaRemotePublisher_Swift)swift
{
  return self->_swift;
}

- (void)setEngineRestoringState:(BOOL)a3
{
  self->_engineRestoringState = a3;
}

- (BOOL)isMediaServerAvailable
{
  return self->_mediaServerAvailable;
}

- (void)setMediaServerAvailable:(BOOL)a3
{
  self->_mediaServerAvailable = a3;
}

- (NSDictionary)lastPerformanceMetrics
{
  return self->_lastPerformanceMetrics;
}

- (void)setLastPerformanceMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_lastPerformanceMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPerformanceMetrics, 0);
  objc_storeStrong((id *)&self->_swift, 0);
  objc_storeStrong((id *)&self->_hostingSharedSessionID, 0);
  objc_storeStrong((id *)&self->_commandCenter, 0);
  objc_storeStrong((id *)&self->_infoCenter, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_storeStrong((id *)&self->_setPlaybackQueueExtendedTimeGuard, 0);
  objc_storeStrong((id *)&self->_lastCommandDescriptions, 0);
  objc_storeStrong((id *)&self->_nextPreviousTrackCooldownTimer, 0);
  objc_storeStrong((id *)&self->_activeAccountStoreFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_libraryAddStatusObserver, 0);
}

- (id)playbackQueuePropertiesForNowPlayingInfoCenter:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;

  -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queueController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "upNextBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentItemID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tailInsertionContentItemIDForTargetContentItemID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("tailInsertionContentItemID"));

    v10 = objc_msgSend(v5, "displayItemCount");
    if (v10)
    {
      v11 = v10;
      objc_msgSend(v4, "currentItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isRadioItem");

      if ((v13 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("totalItemCount"));

      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)playbackQueueAuxilaryNowPlayingInfoForNowPlayingInfoCenter:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queueController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __102___MPCMediaRemotePublisher_PlaybackQueue__playbackQueueAuxilaryNowPlayingInfoForNowPlayingInfoCenter___block_invoke;
  v15 = &unk_24CAB2DF0;
  v16 = v5;
  v7 = v5;
  v8 = objc_msgSend(v6, "performQueryReturningBOOL:", &v12);
  v17 = *MEMORY[0x24BE657E0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8, v12, v13, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)nowPlayingInfoCenter:(id)a3 contentItemIDForOffset:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queueController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "contentItemIDWithCurrentItemOffset:mode:didReachEnd:", a4, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)nowPlayingInfoCenter:(id)a3 artworkForContentItem:(id)a4 size:(CGSize)a5 completion:(id)a6
{
  double height;
  double width;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *Error;
  _QWORD v19[4];
  id v20;
  id v21;

  height = a5.height;
  width = a5.width;
  v11 = a6;
  v12 = (void *)MEMORY[0x24BDD1768];
  v13 = a4;
  v14 = a3;
  objc_msgSend(v12, "progressWithTotalUnitCount:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCMediaRemotePublisher nowPlayingInfoCenter:artworkCatalogForContentItem:](self, "nowPlayingInfoCenter:artworkCatalogForContentItem:", v14, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "setCacheIdentifier:forCacheReference:", CFSTR("images"), self);
    objc_msgSend(v16, "setFittingSize:", width, height);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __102___MPCMediaRemotePublisher_PlaybackQueue__nowPlayingInfoCenter_artworkForContentItem_size_completion___block_invoke;
    v19[3] = &unk_24CAB2E18;
    v21 = v11;
    v20 = v15;
    objc_msgSend(v16, "requestImageWithCompletion:", v19);

  }
  else
  {
    Error = (void *)MRMediaRemoteCreateError();
    (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, Error);

  }
  return v15;
}

- (id)nowPlayingInfoCenter:(id)a3 remoteArtworkForContentItem:(id)a4 format:(id)a5 size:(CGSize)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = (id)*MEMORY[0x24BDDC480];
  if (v15 == v13)
  {

    goto LABEL_5;
  }
  v16 = v15;
  v17 = objc_msgSend(v13, "isEqual:", v15);

  if (v17)
  {
LABEL_5:
    -[_MPCMediaRemotePublisher nowPlayingInfoCenter:artworkCatalogForContentItem:](self, "nowPlayingInfoCenter:artworkCatalogForContentItem:", v11, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCacheIdentifier:forCacheReference:", CFSTR("exportables"), self);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __115___MPCMediaRemotePublisher_PlaybackQueue__nowPlayingInfoCenter_remoteArtworkForContentItem_format_size_completion___block_invoke;
    v21[3] = &unk_24CAB2E40;
    v22 = v14;
    objc_msgSend(v19, "requestExportableArtworkPropertiesWithCompletion:", v21);

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 29, CFSTR("request for unknown remote artwork format: %@"), v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v14 + 2))(v14, 0, v18);

LABEL_6:
  return 0;
}

- (id)nowPlayingInfoCenter:(id)a3 infoForContentItem:(id)a4 completion:(id)a5
{
  void *v7;
  void (**v8)(id, void *, _QWORD);
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = (void *)MEMORY[0x24BDD1768];
  v8 = (void (**)(id, void *, _QWORD))a5;
  v9 = a4;
  objc_msgSend(v7, "progressWithTotalUnitCount:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "queueController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "itemForContentItemID:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "itemDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v16, 0);

    objc_msgSend(v10, "setCompletedUnitCount:", 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3, CFSTR("Content item not found"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v8)[2](v8, 0, v17);

  }
  return v10;
}

- (id)nowPlayingInfoCenter:(id)a3 transcriptAlignmentsForContentItem:(id)a4 completion:(id)a5
{
  void (**v7)(id, _QWORD, void *);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v7 = (void (**)(id, _QWORD, void *))a5;
  v8 = (void *)MEMORY[0x24BDD1768];
  v9 = a4;
  objc_msgSend(v8, "progressWithTotalUnitCount:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "queueController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentItemID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isEqualToString:", v11) & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(v12, "transcriptAlignmentController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3, CFSTR("Content item not found"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v20);

    goto LABEL_6;
  }
  objc_msgSend(v12, "transcriptAlignmentController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "startProcessing");

  objc_msgSend(v12, "transcriptAlignmentController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "transcriptAlignments");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *, void *))v7)[2](v7, v19, 0);

  objc_msgSend(v10, "setCompletedUnitCount:", 1);
LABEL_6:

  return v10;
}

- (id)nowPlayingInfoCenter:(id)a3 lyricsForContentItem:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "queueController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "itemForContentItemID:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v16 = (id)objc_msgSend(v15, "nowPlayingInfoCenter:lyricsForContentItem:completion:", v8, v9, v10);
  else
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);

  return v11;
}

- (id)nowPlayingInfoCenter:(id)a3 childContentItemIDAtIndex:(int64_t)a4 ofItem:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(a5, "identifier", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queueController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "itemForContentItemID:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;
    objc_msgSend(v11, "chapters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13 <= a4)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(v11, "chapters");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndex:", a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)nowPlayingInfoCenter:(id)a3 getTransportablePlaybackSessionRepresentationForRequest:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __131___MPCMediaRemotePublisher_PlaybackQueue__nowPlayingInfoCenter_getTransportablePlaybackSessionRepresentationForRequest_completion___block_invoke;
  block[3] = &unk_24CAB98A8;
  v12 = v7;
  v13 = v8;
  block[4] = self;
  v9 = v7;
  v10 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)nowPlayingInfoCenter:(id)a3 willBeginSessionMigrationWithIdentifier:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  _MPCMediaRemotePublisher *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218242;
    v10 = self;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEFAULT, "MPCMediaRemotePublisher: %p - [Lease] - Session migration will begin - identifier:%{public}@", (uint8_t *)&v9, 0x16u);
  }

  -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leaseManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginIgnoringLeaseEndEventsForReason:", v5);

}

- (void)nowPlayingInfoCenter:(id)a3 didEndMigrationWithIdentifier:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  int v19;
  _MPCMediaRemotePublisher *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  -[_MPCMediaRemotePublisher playbackEngine](self, "playbackEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (v11)
    {
      v19 = 134218498;
      v20 = self;
      v21 = 2114;
      v22 = v7;
      v23 = 2114;
      v24 = v8;
      _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_ERROR, "MPCMediaRemotePublisher: %p -  [Lease] - Session migration did end with error [Stealing the lease back] - identifier:%{public}@ - error:%{public}@", (uint8_t *)&v19, 0x20u);
    }

    objc_msgSend(v9, "leaseManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCanStealLeaseIfNeeded");

    objc_msgSend(v9, "player");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = 0;
    objc_msgSend(v14, "prepareForRate:completionHandler:", 0, v15);

    objc_msgSend(v9, "player");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject currentItem](v10, "currentItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = 1.0;
    objc_msgSend(v16, "prepareForRate:completionHandler:", 0, v17);

  }
  else if (v11)
  {
    v19 = 134218242;
    v20 = self;
    v21 = 2114;
    v22 = v7;
    _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_ERROR, "MPCMediaRemotePublisher: %p -  [Lease] - Session migration did end - identifier:%{public}@", (uint8_t *)&v19, 0x16u);
  }

  objc_msgSend(v9, "leaseManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "endIgnoringLeaseEndEventsForReason:", v7);

}

@end
