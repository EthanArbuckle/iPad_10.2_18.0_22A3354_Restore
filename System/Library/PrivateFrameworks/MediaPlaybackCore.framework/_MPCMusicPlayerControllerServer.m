@implementation _MPCMusicPlayerControllerServer

- (id)_nowPlayingWithItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v41;
  uint64_t v42;
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (v4)
  {
    objc_msgSend(v4, "mediaItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v43 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v5;
      objc_msgSend(v7, "modelObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "contentItemID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      v5 = v7;
      if (!v11)
      {
        objc_msgSend(v7, "modelObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = (void *)MEMORY[0x24BDDC890];
          v14 = v12;
          objc_msgSend(v14, "anyObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "identifiers");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v46[0] = MEMORY[0x24BDAC760];
          v46[1] = 3221225472;
          v46[2] = __55___MPCMusicPlayerControllerServer__nowPlayingWithItem___block_invoke;
          v46[3] = &unk_24CAB8A40;
          v47 = v6;
          v17 = (void *)objc_msgSend(v16, "copyWithSource:block:", CFSTR("MPMusicPlayerControllerServer"), v46);
          v18 = v6;
          v19 = (void *)objc_msgSend(v15, "copyWithIdentifiers:block:", v17, &__block_literal_global_2739);
          objc_msgSend(v13, "genericObjectWithModelObject:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v6 = v18;
        }
        else
        {
          objc_msgSend(v12, "identifiers");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v44[0] = MEMORY[0x24BDAC760];
          v44[1] = 3221225472;
          v44[2] = __55___MPCMusicPlayerControllerServer__nowPlayingWithItem___block_invoke_3;
          v44[3] = &unk_24CAB8A40;
          v45 = v6;
          v23 = (void *)objc_msgSend(v22, "copyWithSource:block:", CFSTR("MPMusicPlayerControllerServer"), v44);
          v20 = (void *)objc_msgSend(v12, "copyWithIdentifiers:block:", v23, &__block_literal_global_12);

          v14 = v45;
        }

        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDC930]), "initWithModelObject:", v20);
      }

    }
    -[_MPCMusicPlayerControllerServer playbackEngine](self, "playbackEngine");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "queueController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "displayIndexForContentItemID:", v26);

    v28 = objc_msgSend(v25, "displayItemCount");
    objc_msgSend(v25, "behaviorImpl");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "componentsForContentItemID:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v42 = v27;
    v32 = v5;
    v33 = v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v34 = objc_msgSend(v31, "uid");
    else
      v34 = 0;
    v35 = (void *)MEMORY[0x24BDDCA68];
    objc_msgSend(v6, "identifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "artworkIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeFormat");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v33;
    v39 = v32;
    objc_msgSend(v35, "nowPlayingWithItem:itemIdentifier:itemUID:artworkIdentifier:audioFormat:index:count:", v32, v36, v34, v37, v38, v42, v41);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v43;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (_MPCMusicPlayerControllerServer)initWithPlaybackEngine:(id)a3
{
  id v4;
  _MPCMusicPlayerControllerServer *v5;
  _MPCMusicPlayerControllerServer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_MPCMusicPlayerControllerServer;
  v5 = -[_MPCMusicPlayerControllerServer init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_playbackEngine, v4);
    objc_msgSend(v4, "addEngineObserver:", v6);
    -[_MPCMusicPlayerControllerServer _registerForCommandHandlersRegisteredNotification](v6, "_registerForCommandHandlersRegisteredNotification");
  }

  return v6;
}

- (void)startServer
{
  id v3;
  NSXPCListener *v4;
  NSXPCListener *listener;
  MPMusicPlayerControllerSystemCache *v6;
  void *systemCache;
  NSXPCListener *v8;
  NSMutableArray *v9;
  NSMutableArray *activeConnections;

  if (+[MPCPlaybackEngine isSystemMusic](MPCPlaybackEngine, "isSystemMusic"))
  {
    v3 = objc_alloc(MEMORY[0x24BDD1998]);
    v4 = (NSXPCListener *)objc_msgSend(v3, "initWithMachServiceName:", *MEMORY[0x24BDDC420]);
    listener = self->_listener;
    self->_listener = v4;

    objc_msgSend(MEMORY[0x24BDDCA78], "sharedCache");
    v6 = (MPMusicPlayerControllerSystemCache *)objc_claimAutoreleasedReturnValue();
    systemCache = self->_systemCache;
    self->_systemCache = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
    v8 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
    systemCache = self->_listener;
    self->_listener = v8;
  }

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  activeConnections = self->_activeConnections;
  self->_activeConnections = v9;

  self->_resumed = 0;
  -[_MPCMusicPlayerControllerServer _registerForMPAVItemTitlesDidChangeNotification](self, "_registerForMPAVItemTitlesDidChangeNotification");
  -[_MPCMusicPlayerControllerServer resumeIfNeeded](self, "resumeIfNeeded");
}

- (void)_registerForMPAVItemTitlesDidChangeNotification
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleMPAVItemTitlesDidChange_, *MEMORY[0x24BDDB9F8], 0);

}

- (void)_registerForCommandHandlersRegisteredNotification
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDDC568];
  -[_MPCMusicPlayerControllerServer playbackEngine](self, "playbackEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaRemotePublisher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commandCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__handleCommandHandlersRegistered_, v3, v6);

}

- (void)resumeIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  int v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (self->_listener && !self->_resumed)
  {
    -[_MPCMusicPlayerControllerServer playbackEngine](self, "playbackEngine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mediaRemotePublisher");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commandCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "commandHandlersRegistered");

    if (v6)
    {
      -[NSXPCListener resume](self->_listener, "resume");
      self->_resumed = 1;
      v7 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 67109120;
        v10 = +[MPCPlaybackEngine isSystemMusic](MPCPlaybackEngine, "isSystemMusic");
        v8 = "MPMusicPlayerControllerServer: startServer: resummed systemMusicApplication=%{BOOL}u";
LABEL_8:
        _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v9, 8u);
      }
    }
    else
    {
      v7 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 67109120;
        v10 = +[MPCPlaybackEngine isSystemMusic](MPCPlaybackEngine, "isSystemMusic");
        v8 = "MPMusicPlayerControllerServer: startServer: deferred resume waiting for canBeNowPlaying systemMusicApplication=%{BOOL}u";
        goto LABEL_8;
      }
    }

  }
}

- (void)engine:(id)a3 didChangeToItem:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  void *v13;
  MPMusicPlayerQueueDescriptor *preparingDescriptor;
  MPMusicPlayerQueueDescriptor *v15;
  MPMusicPlayerQueueDescriptor *v16;
  MPMusicPlayerQueueDescriptor *v17;
  int v18;
  void (**prepareCompletionHandler)(id, void *);
  void *v20;
  id v21;
  MPMusicPlayerQueueDescriptor *v22;
  id v23;
  int v24;
  id v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v7;
    v26 = 1024;
    v27 = objc_msgSend(v9, "isReloadingPlaybackContext");
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "MPMusicPlayerControllerServer: engine:didChangeToItem: - %{public}@ - reloading:%{BOOL}u", (uint8_t *)&v24, 0x12u);

  }
  objc_msgSend(v6, "player");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isReloadingPlaybackContext");

  if ((v11 & 1) == 0)
  {
    v12 = objc_msgSend(v7, "isPlaceholder");
    v13 = 0;
    if (!v7)
      goto LABEL_17;
    if ((v12 & 1) != 0)
      goto LABEL_17;
    -[_MPCMusicPlayerControllerServer _nowPlayingWithItem:](self, "_nowPlayingWithItem:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_prepareCompletionHandler)
      goto LABEL_17;
    preparingDescriptor = self->_preparingDescriptor;
    v15 = self->_queueDescriptor;
    if (preparingDescriptor == v15)
    {

    }
    else
    {
      v16 = v15;
      v17 = preparingDescriptor;
      v18 = -[MPMusicPlayerQueueDescriptor isEqual:](v17, "isEqual:", v16);

      if (!v18)
        goto LABEL_17;
    }
    if (-[MPMusicPlayerQueueDescriptor matchesStartItem:](self->_queueDescriptor, "matchesStartItem:", v7)
      || self->_waitingForAdditionalPlaybackContexts)
    {
      if (!self->_skipWaitingForLikelyToKeepUp)
      {
LABEL_17:
        -[MPMusicPlayerControllerSystemCache setNowPlaying:](self->_systemCache, "setNowPlaying:", v13);
        v23 = objc_alloc_init(MEMORY[0x24BDDCA80]);
        objc_msgSend(v23, "setHasNowPlaying:", 1);
        objc_msgSend(v23, "setNowPlaying:", v13);
        objc_msgSend(v23, "setQueueDidChange:", 0);
        -[_MPCMusicPlayerControllerServer _addContentItemIDsToUpdateRecord:](self, "_addContentItemIDsToUpdateRecord:", v23);
        -[_MPCMusicPlayerControllerServer _applyServerStateUpdateRecord:](self, "_applyServerStateUpdateRecord:", v23);

        goto LABEL_18;
      }
      (*((void (**)(void))self->_prepareCompletionHandler + 2))();
    }
    else
    {
      prepareCompletionHandler = (void (**)(id, void *))self->_prepareCompletionHandler;
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x24BDDC418], 6, CFSTR("Prepare queue failed with unexpected start item"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      prepareCompletionHandler[2](prepareCompletionHandler, v20);

    }
    v21 = self->_prepareCompletionHandler;
    self->_prepareCompletionHandler = 0;

    v22 = self->_preparingDescriptor;
    self->_preparingDescriptor = 0;

    goto LABEL_17;
  }
LABEL_18:

}

- (void)_handleMPAVItemTitlesDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[_MPCMusicPlayerControllerServer playbackEngine](self, "playbackEngine", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCMusicPlayerControllerServer _nowPlayingWithItem:](self, "_nowPlayingWithItem:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[MPMusicPlayerControllerSystemCache setNowPlaying:](self->_systemCache, "setNowPlaying:", v8);
  v7 = objc_alloc_init(MEMORY[0x24BDDCA80]);
  objc_msgSend(v7, "setHasTimeMetadata:", 1);
  objc_msgSend(v7, "setHasNowPlaying:", 1);
  objc_msgSend(v7, "setNowPlaying:", v8);
  -[_MPCMusicPlayerControllerServer _applyServerStateUpdateRecord:](self, "_applyServerStateUpdateRecord:", v7);

}

- (MPCPlaybackEngine)playbackEngine
{
  return (MPCPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (void)_applyServerStateUpdateRecord:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_activeConnections;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "remoteObjectProxy", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "applyServerStateUpdateRecord:", v4);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_addContentItemIDsToUpdateRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  -[_MPCMusicPlayerControllerServer playbackEngine](self, "playbackEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[MPCPlaybackEngine isSystemMusic](MPCPlaybackEngine, "isSystemMusic"))
  {
    objc_msgSend(v5, "queueController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "displayItemCount");
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v6, "contentItemIDsFromOffset:toOffset:mode:nowPlayingIndex:", -v7, v7, 1, &v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHasContentItemIDs:", 1);
    objc_msgSend(v4, "setContentItemIDs:", v8);

  }
}

- (void)_handleCommandHandlersRegistered:(id)a3
{
  msv_dispatch_on_main_queue();
}

- (BOOL)isRunning
{
  return self->_listener != 0;
}

- (void)stopServer
{
  NSXPCListener *listener;
  NSObject *v4;
  uint8_t v5[16];

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  listener = self->_listener;
  self->_listener = 0;

  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "MPMusicPlayerControllerServer: stopServer", v5, 2u);
  }

}

- (NSXPCListenerEndpoint)endpoint
{
  return -[NSXPCListener endpoint](self->_listener, "endpoint");
}

- (void)getNowPlayingWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  v6 = os_signpost_id_generate(v5);

  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "getNowPlaying", ", buf, 2u);
  }

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58___MPCMusicPlayerControllerServer_getNowPlayingWithReply___block_invoke;
  v12[3] = &unk_24CAB9830;
  v12[4] = self;
  v13 = v4;
  v9 = v4;
  dispatch_sync(MEMORY[0x24BDAC9B8], v12);
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v11, OS_SIGNPOST_INTERVAL_END, v6, "getNowPlaying", ", buf, 2u);
  }

}

- (void)getNowPlayingsForContentItemIDs:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD block[5];
  id v17;
  id v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  v9 = os_signpost_id_generate(v8);

  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "getNowPlayingsForContentItemIDs", ", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73___MPCMusicPlayerControllerServer_getNowPlayingsForContentItemIDs_reply___block_invoke;
  block[3] = &unk_24CAB98A8;
  block[4] = self;
  v17 = v6;
  v18 = v7;
  v12 = v7;
  v13 = v6;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  v14 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v15 = v14;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v15, OS_SIGNPOST_INTERVAL_END, v9, "getNowPlayingsForContentItemIDs", ", buf, 2u);
  }

}

- (void)getNowPlayingAtIndex:(int64_t)a3 reply:(id)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  int64_t v16;
  uint8_t buf[16];

  v6 = a4;
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  v8 = os_signpost_id_generate(v7);

  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "getNowPlayingAtIndex", ", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62___MPCMusicPlayerControllerServer_getNowPlayingAtIndex_reply___block_invoke;
  block[3] = &unk_24CABABE0;
  v15 = v6;
  v16 = a3;
  block[4] = self;
  v11 = v6;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v13 = v12;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v13, OS_SIGNPOST_INTERVAL_END, v8, "getNowPlayingAtIndex", ", buf, 2u);
  }

}

- (void)setNowPlayingItem:(id)a3 itemIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD block[5];
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_MPCMusicPlayerControllerServer _remoteCommandSenderIDForCurrentXPCConnection](self, "_remoteCommandSenderIDForCurrentXPCConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  v13 = os_signpost_id_generate(v12);

  v14 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "setNowPlayingItem", ", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79___MPCMusicPlayerControllerServer_setNowPlayingItem_itemIdentifier_completion___block_invoke;
  block[3] = &unk_24CAB75D0;
  block[4] = self;
  v23 = v8;
  v24 = v9;
  v25 = v11;
  v26 = v10;
  v16 = v10;
  v17 = v11;
  v18 = v9;
  v19 = v8;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  v20 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v21 = v20;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v21, OS_SIGNPOST_INTERVAL_END, v13, "setNowPlayingItem", ", buf, 2u);
  }

}

- (void)_onQueue_setNowPlayingItem:(id)a3 itemIdentifier:(id)a4 remoteCommandSenderID:(id)a5 completion:(id)a6
{
  unint64_t v10;
  unint64_t v11;
  id v12;
  void (**v13)(id, void *);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  void (**v33)(id, void *);

  v10 = (unint64_t)a3;
  v11 = (unint64_t)a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[_MPCMusicPlayerControllerServer playbackEngine](self, "playbackEngine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mediaRemotePublisher");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commandCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "playItemInQueueCommand");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!(v10 | v11))
  {
    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = *MEMORY[0x24BDDC418];
    v21 = CFSTR("No item provided to setNowPlayingItem");
    v22 = 5;
LABEL_7:
    objc_msgSend(v19, "msv_errorWithDomain:code:debugDescription:", v20, v22, v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v26);

    goto LABEL_15;
  }
  if (!objc_msgSend(v17, "isSupportedAndEnabled"))
  {
    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = *MEMORY[0x24BDDC418];
    v21 = CFSTR("PlayItemInQueue is currently not enabled or the playback engine is not ready");
    v22 = 7;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)v11;
  if (v11)
  {
    v25 = v24;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)v10, "modelObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "identifiers");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "contentItemID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v25 = 0;
    }
  }
  if (objc_msgSend(v25, "length"))
  {
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v25, *MEMORY[0x24BE658D0]);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend((id)v10, "persistentID"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v28, *MEMORY[0x24BE659E0]);

  }
  v29 = (void *)objc_msgSend(v18, "newCommandEventWithCommandType:options:", 131, v23);
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __110___MPCMusicPlayerControllerServer__onQueue_setNowPlayingItem_itemIdentifier_remoteCommandSenderID_completion___block_invoke;
  v31[3] = &unk_24CAB2170;
  v32 = (id)v10;
  v33 = v13;
  -[_MPCMusicPlayerControllerServer _invokeServerCommandEvent:remoteCommandSenderID:completion:](self, "_invokeServerCommandEvent:remoteCommandSenderID:completion:", v29, v12, v31);

LABEL_15:
}

- (void)setNowPlayingUID:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  unint64_t v19;
  uint8_t buf[16];

  v6 = a4;
  -[_MPCMusicPlayerControllerServer _remoteCommandSenderIDForCurrentXPCConnection](self, "_remoteCommandSenderIDForCurrentXPCConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  v9 = os_signpost_id_generate(v8);

  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "setNowPlayingUID", ", buf, 2u);
  }

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __63___MPCMusicPlayerControllerServer_setNowPlayingUID_completion___block_invoke;
  v16[3] = &unk_24CAB5C28;
  v16[4] = self;
  v17 = v7;
  v18 = v6;
  v19 = a3;
  v12 = v6;
  v13 = v7;
  dispatch_sync(MEMORY[0x24BDAC9B8], v16);
  v14 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v15 = v14;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v15, OS_SIGNPOST_INTERVAL_END, v9, "setNowPlayingUID", ", buf, 2u);
  }

}

- (void)getImageForArtworkIdentifier:(id)a3 itemIdentifier:(id)a4 atSize:(CGSize)a5 reply:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  CGFloat v21;
  CGFloat v22;

  height = a5.height;
  width = a5.width;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92___MPCMusicPlayerControllerServer_getImageForArtworkIdentifier_itemIdentifier_atSize_reply___block_invoke;
  block[3] = &unk_24CAB21E8;
  block[4] = self;
  v18 = v12;
  v21 = width;
  v22 = height;
  v19 = v11;
  v20 = v13;
  v14 = v11;
  v15 = v13;
  v16 = v12;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);

}

- (id)_timeSnapshotWithElapsedTime:(double)a3 rate:(float)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;

  -[_MPCMusicPlayerControllerServer playbackEngine](self, "playbackEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "player");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "state");

  switch(v10)
  {
    case 1:
      v11 = 2;
      break;
    case 2:
      v11 = 1;
      break;
    case 3:
    case 4:
    case 5:
      if (a4 >= 0.0)
        v11 = 4;
      else
        v11 = 5;
      break;
    case 6:
      v11 = 3;
      break;
    default:
      v11 = 0;
      break;
  }
  if (objc_msgSend(v8, "isAlwaysLive"))
  {
    *(float *)&v12 = a4;
    objc_msgSend(MEMORY[0x24BDDCA70], "liveSnapshotWithRate:state:", v11, v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v14 = v13;
    v15 = (void *)MEMORY[0x24BDDCA70];
    objc_msgSend(v8, "durationIfAvailable");
    *(float *)&v16 = a4;
    objc_msgSend(v15, "snapshotWithElapsedTime:duration:rate:atTimestamp:state:", v11, a3, v17, v16, v14);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)getTimeSnapshotWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  v6 = os_signpost_id_generate(v5);

  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "getTimeSnapshot", ", buf, 2u);
  }

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60___MPCMusicPlayerControllerServer_getTimeSnapshotWithReply___block_invoke;
  v12[3] = &unk_24CAB9830;
  v12[4] = self;
  v13 = v4;
  v9 = v4;
  dispatch_sync(MEMORY[0x24BDAC9B8], v12);
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v11, OS_SIGNPOST_INTERVAL_END, v6, "getTimeSnapshot", ", buf, 2u);
  }

}

- (void)setDescriptor:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "playbackContexts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCMusicPlayerControllerServer playbackEngine](self, "playbackEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "disableRepeat"))
    objc_msgSend(v9, "setRepeatType:", 0);
  if (objc_msgSend(v10, "disableShuffle"))
    objc_msgSend(v9, "setShuffleType:", 0);
  objc_msgSend(v9, "setQueueEndAction:", 2);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "auditToken");
      MSVBundleIDForAuditToken();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    -[_MPCMusicPlayerControllerServer _remoteCommandSenderIDForCurrentXPCConnection](self, "_remoteCommandSenderIDForCurrentXPCConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __60___MPCMusicPlayerControllerServer_setDescriptor_completion___block_invoke;
    v18[3] = &unk_24CAB2238;
    v18[4] = self;
    v19 = v6;
    v25 = v7;
    v20 = v13;
    v21 = v8;
    v22 = v9;
    v23 = v15;
    v24 = v10;
    v16 = v15;
    v17 = v13;
    dispatch_sync(MEMORY[0x24BDAC9B8], v18);

  }
  else
  {
    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v6;
      _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "MusicKit: No playback contexts found for descriptor %{public}@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x24BDDC418], 1, CFSTR("Playback context not found when setting descriptor."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }

}

- (void)getDescriptorWithReply:(id)a3
{
  id v4;
  id v5;
  _QWORD block[5];
  id v7;

  v4 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58___MPCMusicPlayerControllerServer_getDescriptorWithReply___block_invoke;
  block[3] = &unk_24CAB9830;
  block[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);

}

- (void)prependDescriptor:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "playbackContexts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_waitingForAdditionalPlaybackContexts = (unint64_t)objc_msgSend(v7, "count") > 1;
  -[_MPCMusicPlayerControllerServer _remoteCommandSenderIDForCurrentXPCConnection](self, "_remoteCommandSenderIDForCurrentXPCConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v8;
  v11 = v7;
  msv_dispatch_on_main_queue();

}

- (void)_prependPlaybackContexts:(id)a3 remoteCommandSenderID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MPCPlaybackContextRemotePlaybackQueue *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _MPCMusicPlayerControllerServer *v23;
  id v24;
  id v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[_MPCMusicPlayerControllerServer playbackEngine](self, "playbackEngine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mediaRemotePublisher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "commandCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "insertIntoPlaybackQueueCommand");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isSupportedAndEnabled"))
    {
      objc_msgSend(v11, "setActionAfterQueueLoad:", 10);
      v16 = -[MPCPlaybackContextRemotePlaybackQueue initWithPlaybackContext:]([MPCPlaybackContextRemotePlaybackQueue alloc], "initWithPlaybackContext:", v11);
      -[MPCPlaybackContextRemotePlaybackQueue setReplaceIntent:](v16, "setReplaceIntent:", 1);
      v17 = objc_alloc(MEMORY[0x24BDDC760]);
      v26 = *MEMORY[0x24BE65948];
      v27[0] = &unk_24CB168A8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithCommand:playbackQueue:options:", v15, v16, v18);

      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __93___MPCMusicPlayerControllerServer__prependPlaybackContexts_remoteCommandSenderID_completion___block_invoke;
      v21[3] = &unk_24CAB6B30;
      v25 = v10;
      v22 = v8;
      v23 = self;
      v24 = v9;
      -[_MPCMusicPlayerControllerServer _invokeServerCommandEvent:remoteCommandSenderID:completion:](self, "_invokeServerCommandEvent:remoteCommandSenderID:completion:", v19, v24, v21);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x24BDDC418], 7, CFSTR("InsertIntoPlaybackQueue is currently not enabled or the playback engine is not ready"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v10 + 2))(v10, v20);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x24BDDC418], 1, CFSTR("Playback context not found when prepending contexts."));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
  }

}

- (void)appendDescriptor:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "playbackContexts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_waitingForAdditionalPlaybackContexts = (unint64_t)objc_msgSend(v7, "count") > 1;
  -[_MPCMusicPlayerControllerServer _remoteCommandSenderIDForCurrentXPCConnection](self, "_remoteCommandSenderIDForCurrentXPCConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v8;
  v11 = v7;
  msv_dispatch_on_main_queue();

}

- (void)_appendPlaybackContexts:(id)a3 remoteCommandSenderID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MPCPlaybackContextRemotePlaybackQueue *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _MPCMusicPlayerControllerServer *v23;
  id v24;
  id v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(v8, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[_MPCMusicPlayerControllerServer playbackEngine](self, "playbackEngine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mediaRemotePublisher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "commandCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "insertIntoPlaybackQueueCommand");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isSupportedAndEnabled"))
    {
      objc_msgSend(v11, "setActionAfterQueueLoad:", 10);
      v16 = -[MPCPlaybackContextRemotePlaybackQueue initWithPlaybackContext:]([MPCPlaybackContextRemotePlaybackQueue alloc], "initWithPlaybackContext:", v11);
      -[MPCPlaybackContextRemotePlaybackQueue setReplaceIntent:](v16, "setReplaceIntent:", 1);
      v17 = objc_alloc(MEMORY[0x24BDDC760]);
      v26[0] = *MEMORY[0x24BE65948];
      v26[1] = CFSTR("MPCRemoteCommandEventOptionShouldPlayInsertedContent");
      v27[0] = &unk_24CB168C0;
      v27[1] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithCommand:playbackQueue:options:", v15, v16, v18);

      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __92___MPCMusicPlayerControllerServer__appendPlaybackContexts_remoteCommandSenderID_completion___block_invoke;
      v21[3] = &unk_24CAB6B30;
      v25 = v10;
      v22 = v8;
      v23 = self;
      v24 = v9;
      -[_MPCMusicPlayerControllerServer _invokeServerCommandEvent:remoteCommandSenderID:completion:](self, "_invokeServerCommandEvent:remoteCommandSenderID:completion:", v19, v24, v21);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x24BDDC418], 7, CFSTR("InsertIntoPlaybackQueue is currently not enabled or the playback engine is not ready"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v10 + 2))(v10, v20);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x24BDDC418], 1, CFSTR("Playback context not found when appending contexts."));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
  }

}

- (void)play
{
  void *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  -[_MPCMusicPlayerControllerServer _remoteCommandSenderIDForCurrentXPCConnection](self, "_remoteCommandSenderIDForCurrentXPCConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  v5 = os_signpost_id_generate(v4);

  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "play", ", buf, 2u);
  }

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __39___MPCMusicPlayerControllerServer_play__block_invoke;
  v11[3] = &unk_24CABA1D0;
  v11[4] = self;
  v12 = v3;
  v8 = v3;
  dispatch_sync(MEMORY[0x24BDAC9B8], v11);
  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v10 = v9;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v10, OS_SIGNPOST_INTERVAL_END, v5, "play", ", buf, 2u);
  }

}

- (void)pauseWithFadeDuration:(int64_t)a3
{
  void *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  -[_MPCMusicPlayerControllerServer _remoteCommandSenderIDForCurrentXPCConnection](self, "_remoteCommandSenderIDForCurrentXPCConnection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  v6 = os_signpost_id_generate(v5);

  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "pauseWithFadeDuration", ", buf, 2u);
  }

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __57___MPCMusicPlayerControllerServer_pauseWithFadeDuration___block_invoke;
  v12[3] = &unk_24CABA1D0;
  v12[4] = self;
  v13 = v4;
  v9 = v4;
  dispatch_sync(MEMORY[0x24BDAC9B8], v12);
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v11, OS_SIGNPOST_INTERVAL_END, v6, "pauseWithFadeDuration", ", buf, 2u);
  }

}

- (void)stop
{
  -[_MPCMusicPlayerControllerServer pauseWithFadeDuration:](self, "pauseWithFadeDuration:", 0);
}

- (void)skipWithBehavior:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  int64_t v15;
  uint8_t buf[16];

  -[_MPCMusicPlayerControllerServer _remoteCommandSenderIDForCurrentXPCConnection](self, "_remoteCommandSenderIDForCurrentXPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  v7 = os_signpost_id_generate(v6);

  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "skipWithBehavior", ", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52___MPCMusicPlayerControllerServer_skipWithBehavior___block_invoke;
  block[3] = &unk_24CABA558;
  v14 = v5;
  v15 = a3;
  block[4] = self;
  v10 = v5;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v12 = v11;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v12, OS_SIGNPOST_INTERVAL_END, v7, "skipWithBehavior", ", buf, 2u);
  }

}

- (void)reshuffle
{
  void *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  -[_MPCMusicPlayerControllerServer _remoteCommandSenderIDForCurrentXPCConnection](self, "_remoteCommandSenderIDForCurrentXPCConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  v5 = os_signpost_id_generate(v4);

  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "reshuffle", ", buf, 2u);
  }

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __44___MPCMusicPlayerControllerServer_reshuffle__block_invoke;
  v11[3] = &unk_24CABA1D0;
  v11[4] = self;
  v12 = v3;
  v8 = v3;
  dispatch_sync(MEMORY[0x24BDAC9B8], v11);
  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v10 = v9;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v10, OS_SIGNPOST_INTERVAL_END, v5, "reshuffle", ", buf, 2u);
  }

}

- (void)beginSeekWithDirection:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  int64_t v15;
  uint8_t buf[16];

  -[_MPCMusicPlayerControllerServer _remoteCommandSenderIDForCurrentXPCConnection](self, "_remoteCommandSenderIDForCurrentXPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  v7 = os_signpost_id_generate(v6);

  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "beginSeekWithDirection", ", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58___MPCMusicPlayerControllerServer_beginSeekWithDirection___block_invoke;
  block[3] = &unk_24CABA558;
  v14 = v5;
  v15 = a3;
  block[4] = self;
  v10 = v5;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v12 = v11;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v12, OS_SIGNPOST_INTERVAL_END, v7, "beginSeekWithDirection", ", buf, 2u);
  }

}

- (void)endSeek
{
  void *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  -[_MPCMusicPlayerControllerServer _remoteCommandSenderIDForCurrentXPCConnection](self, "_remoteCommandSenderIDForCurrentXPCConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  v5 = os_signpost_id_generate(v4);

  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "endSeek", ", buf, 2u);
  }

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __42___MPCMusicPlayerControllerServer_endSeek__block_invoke;
  v11[3] = &unk_24CABA1D0;
  v11[4] = self;
  v12 = v3;
  v8 = v3;
  dispatch_sync(MEMORY[0x24BDAC9B8], v11);
  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v10 = v9;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v10, OS_SIGNPOST_INTERVAL_END, v5, "endSeek", ", buf, 2u);
  }

}

- (void)setRepeatMode:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  int64_t v15;
  uint8_t buf[16];

  -[_MPCMusicPlayerControllerServer _remoteCommandSenderIDForCurrentXPCConnection](self, "_remoteCommandSenderIDForCurrentXPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  v7 = os_signpost_id_generate(v6);

  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "setRepeatMode", ", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49___MPCMusicPlayerControllerServer_setRepeatMode___block_invoke;
  block[3] = &unk_24CABA558;
  v14 = v5;
  v15 = a3;
  block[4] = self;
  v10 = v5;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v12 = v11;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v12, OS_SIGNPOST_INTERVAL_END, v7, "setRepeatMode", ", buf, 2u);
  }

}

- (void)getRepeatModeWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  v6 = os_signpost_id_generate(v5);

  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "getRepeatMode", ", buf, 2u);
  }

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58___MPCMusicPlayerControllerServer_getRepeatModeWithReply___block_invoke;
  v12[3] = &unk_24CAB9830;
  v12[4] = self;
  v13 = v4;
  v9 = v4;
  dispatch_sync(MEMORY[0x24BDAC9B8], v12);
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v11, OS_SIGNPOST_INTERVAL_END, v6, "getRepeatMode", ", buf, 2u);
  }

}

- (void)setShuffleMode:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  int64_t v15;
  uint8_t buf[16];

  -[_MPCMusicPlayerControllerServer _remoteCommandSenderIDForCurrentXPCConnection](self, "_remoteCommandSenderIDForCurrentXPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  v7 = os_signpost_id_generate(v6);

  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "setShuffleMode", ", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50___MPCMusicPlayerControllerServer_setShuffleMode___block_invoke;
  block[3] = &unk_24CABA558;
  v14 = v5;
  v15 = a3;
  block[4] = self;
  v10 = v5;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v12 = v11;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v12, OS_SIGNPOST_INTERVAL_END, v7, "setShuffleMode", ", buf, 2u);
  }

}

- (void)getShuffleModeWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  v6 = os_signpost_id_generate(v5);

  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "getShuffleMode", ", buf, 2u);
  }

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __59___MPCMusicPlayerControllerServer_getShuffleModeWithReply___block_invoke;
  v12[3] = &unk_24CAB9830;
  v12[4] = self;
  v13 = v4;
  v9 = v4;
  dispatch_sync(MEMORY[0x24BDAC9B8], v12);
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v11, OS_SIGNPOST_INTERVAL_END, v6, "getShuffleMode", ", buf, 2u);
  }

}

- (void)setElapsedTime:(double)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  double v17;
  os_signpost_id_t v18;
  uint8_t buf[16];

  v6 = a4;
  -[_MPCMusicPlayerControllerServer _remoteCommandSenderIDForCurrentXPCConnection](self, "_remoteCommandSenderIDForCurrentXPCConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  v9 = os_signpost_id_generate(v8);

  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "setElapsedTime", ", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61___MPCMusicPlayerControllerServer_setElapsedTime_completion___block_invoke;
  block[3] = &unk_24CAB24C8;
  v17 = a3;
  block[4] = self;
  v15 = v7;
  v16 = v6;
  v18 = v9;
  v12 = v6;
  v13 = v7;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);

}

- (void)setPlaybackRate:(float)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  os_signpost_id_t v17;
  float v18;
  uint8_t buf[16];

  v6 = a4;
  -[_MPCMusicPlayerControllerServer _remoteCommandSenderIDForCurrentXPCConnection](self, "_remoteCommandSenderIDForCurrentXPCConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  v9 = os_signpost_id_generate(v8);

  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "setPlaybackRate", ", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62___MPCMusicPlayerControllerServer_setPlaybackRate_completion___block_invoke;
  block[3] = &unk_24CAB24F0;
  v18 = a3;
  block[4] = self;
  v15 = v7;
  v16 = v6;
  v17 = v9;
  v12 = v6;
  v13 = v7;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);

}

- (void)performQueueModifications:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD block[4];
  id v17;
  id v18;
  _MPCMusicPlayerControllerServer *v19;
  id v20;
  id v21;

  v7 = a3;
  v8 = a4;
  -[_MPCMusicPlayerControllerServer playbackEngine](self, "playbackEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[MPCPlaybackEngine isSystemMusic](MPCPlaybackEngine, "isSystemMusic"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCMusicPlayerControllerServer.m"), 879, CFSTR("performQueueModifications is not supported for the system music application"));

  }
  -[_MPCMusicPlayerControllerServer _remoteCommandSenderIDForCurrentXPCConnection](self, "_remoteCommandSenderIDForCurrentXPCConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72___MPCMusicPlayerControllerServer_performQueueModifications_completion___block_invoke;
  block[3] = &unk_24CAB75D0;
  v17 = v9;
  v18 = v7;
  v19 = self;
  v20 = v10;
  v21 = v8;
  v11 = v8;
  v12 = v10;
  v13 = v7;
  v14 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)prerollWithCompletion:(id)a3
{
  void (**v3)(id, _QWORD);
  NSObject *v4;
  uint8_t v5[16];

  v3 = (void (**)(id, _QWORD))a3;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_ERROR, "MPMusicPlayerControllerServer: prerollWithCompletion FAILED [not implemented]", v5, 2u);
  }

  v3[2](v3, 0);
}

- (void)beginPlaybackAtHostTime:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_ERROR, "MPMusicPlayerControllerServer: beginPlaybackAtHostTime FAILED [not implemented]", v4, 2u);
  }

}

- (void)setRelativeVolume:(float)a3
{
  void *v4;
  char v5;
  void *v6;
  double v7;
  id v8;

  -[_MPCMusicPlayerControllerServer playbackEngine](self, "playbackEngine");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v8, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v7 = a3;
    objc_msgSend(v6, "setRelativeVolume:", v7);

  }
}

- (void)setDisableAutomaticCanBeNowPlaying:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  -[_MPCMusicPlayerControllerServer playbackEngine](self, "playbackEngine");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaRemotePublisher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commandCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisableAutomaticCanBeNowPlaying:", v3);

}

- (void)setDisableAutoPlay:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_MPCMusicPlayerControllerServer playbackEngine](self, "playbackEngine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisableAutoPlay:", v3);

}

- (void)setDisableRepeat:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_MPCMusicPlayerControllerServer playbackEngine](self, "playbackEngine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisableRepeat:", v3);

}

- (void)setDisableShuffle:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_MPCMusicPlayerControllerServer playbackEngine](self, "playbackEngine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisableShuffle:", v3);

}

- (void)setApplicationMusicPlayerTransitionType:(int64_t)a3 withDuration:(double)a4
{
  void *v6;
  id v7;

  -[_MPCMusicPlayerControllerServer playbackEngine](self, "playbackEngine");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setApplicationMusicPlayerTransitionType:withDuration:", a3, a4);

}

- (void)engine:(id)a3 didChangeToState:(unint64_t)a4
{
  double v5;
  void *v6;
  id v7;

  v7 = objc_alloc_init(MEMORY[0x24BDDCA80]);
  objc_msgSend(v7, "setHasTimeSnapshot:", 1);
  LODWORD(v5) = 2143289344;
  -[_MPCMusicPlayerControllerServer _timeSnapshotWithElapsedTime:rate:](self, "_timeSnapshotWithElapsedTime:rate:", NAN, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeSnapshot:", v6);

  -[_MPCMusicPlayerControllerServer _applyServerStateUpdateRecord:](self, "_applyServerStateUpdateRecord:", v7);
}

- (void)engine:(id)a3 didChangeQueueWithReason:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  -[_MPCMusicPlayerControllerServer playbackEngine](self, "playbackEngine", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queueController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "currentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isPlaceholder") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[_MPCMusicPlayerControllerServer _nowPlayingWithItem:](self, "_nowPlayingWithItem:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (id)v8;
  -[MPMusicPlayerControllerSystemCache setNowPlaying:](self->_systemCache, "setNowPlaying:", v8);
  v9 = objc_alloc_init(MEMORY[0x24BDDCA80]);
  objc_msgSend(v9, "setHasNowPlaying:", 1);
  objc_msgSend(v9, "setNowPlaying:", v10);
  objc_msgSend(v9, "setQueueDidChange:", 1);
  -[_MPCMusicPlayerControllerServer _addContentItemIDsToUpdateRecord:](self, "_addContentItemIDsToUpdateRecord:", v9);
  -[_MPCMusicPlayerControllerServer _applyServerStateUpdateRecord:](self, "_applyServerStateUpdateRecord:", v9);

}

- (void)engine:(id)a3 didAchieveLikelyToKeepUpWithItem:(id)a4
{
  id v6;
  MPMusicPlayerQueueDescriptor *preparingDescriptor;
  MPMusicPlayerQueueDescriptor *v8;
  MPMusicPlayerQueueDescriptor *v9;
  MPMusicPlayerQueueDescriptor *v10;
  int v11;
  id prepareCompletionHandler;
  MPMusicPlayerQueueDescriptor *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (self->_prepareCompletionHandler)
  {
    preparingDescriptor = self->_preparingDescriptor;
    v8 = self->_queueDescriptor;
    if (preparingDescriptor == v8)
    {

    }
    else
    {
      v9 = v8;
      v10 = preparingDescriptor;
      v11 = -[MPMusicPlayerQueueDescriptor isEqual:](v10, "isEqual:", v9);

      if (!v11)
        goto LABEL_7;
    }
    (*((void (**)(void))self->_prepareCompletionHandler + 2))();
    prepareCompletionHandler = self->_prepareCompletionHandler;
    self->_prepareCompletionHandler = 0;

    v13 = self->_preparingDescriptor;
    self->_preparingDescriptor = 0;

  }
LABEL_7:

}

- (void)engine:(id)a3 didResetQueueWithPlaybackContext:(id)a4 error:(id)a5
{
  MPMusicPlayerQueueDescriptor *v7;
  MPMusicPlayerQueueDescriptor *v8;
  MPMusicPlayerQueueDescriptor *v9;
  char v10;
  void (**prepareCompletionHandler)(id, void *);
  void *v12;
  id v13;
  MPMusicPlayerQueueDescriptor *preparingDescriptor;
  id v15;
  id v16;

  v16 = a5;
  objc_msgSend(a4, "queueDescriptor");
  v7 = (MPMusicPlayerQueueDescriptor *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_queueDescriptor, v7);
  if (!self->_prepareCompletionHandler)
    goto LABEL_10;
  v8 = self->_preparingDescriptor;
  if (v8 == v7)
  {

    if (!v16)
      goto LABEL_10;
LABEL_8:
    (*((void (**)(void))self->_prepareCompletionHandler + 2))();
    goto LABEL_9;
  }
  v9 = v8;
  v10 = -[MPMusicPlayerQueueDescriptor isEqual:](v8, "isEqual:", v7);

  if (v16 && (v10 & 1) != 0)
    goto LABEL_8;
  if ((v10 & 1) == 0)
  {
    prepareCompletionHandler = (void (**)(id, void *))self->_prepareCompletionHandler;
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x24BDDC418], 2, CFSTR("Queue was interrupted by another queue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    prepareCompletionHandler[2](prepareCompletionHandler, v12);

LABEL_9:
    v13 = self->_prepareCompletionHandler;
    self->_prepareCompletionHandler = 0;

    preparingDescriptor = self->_preparingDescriptor;
    self->_preparingDescriptor = 0;

  }
LABEL_10:
  -[MPMusicPlayerControllerSystemCache setQueueDescriptor:](self->_systemCache, "setQueueDescriptor:", v7);
  v15 = objc_alloc_init(MEMORY[0x24BDDCA80]);
  objc_msgSend(v15, "setHasQueueDescriptor:", 1);
  objc_msgSend(v15, "setQueueDescriptor:", v7);
  objc_msgSend(v15, "setQueueDidChange:", 1);
  -[_MPCMusicPlayerControllerServer _addContentItemIDsToUpdateRecord:](self, "_addContentItemIDsToUpdateRecord:", v15);
  -[_MPCMusicPlayerControllerServer _applyServerStateUpdateRecord:](self, "_applyServerStateUpdateRecord:", v15);

}

- (void)engine:(id)a3 didChangeRepeatType:(int64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  -[_MPCMusicPlayerControllerServer playbackEngine](self, "playbackEngine", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queueController");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "music");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "autoPlayEnabled");

  v8 = objc_alloc_init(MEMORY[0x24BDDCA80]);
  objc_msgSend(v8, "setHasRepeatMode:", 1);
  objc_msgSend(v8, "setRepeatMode:", MPMusicRepeatModeForMPRepeatType());
  objc_msgSend(v8, "setQueueDidChange:", v7);
  if ((_DWORD)v7)
    -[_MPCMusicPlayerControllerServer _addContentItemIDsToUpdateRecord:](self, "_addContentItemIDsToUpdateRecord:", v8);
  -[_MPCMusicPlayerControllerServer _applyServerStateUpdateRecord:](self, "_applyServerStateUpdateRecord:", v8);

}

- (void)engine:(id)a3 didChangeShuffleType:(int64_t)a4
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDDCA80]);
  objc_msgSend(v5, "setHasShuffleMode:", 1);
  objc_msgSend(v5, "setShuffleMode:", MPMusicShuffleModeForMPShuffleType());
  objc_msgSend(v5, "setQueueDidChange:", 1);
  -[_MPCMusicPlayerControllerServer _addContentItemIDsToUpdateRecord:](self, "_addContentItemIDsToUpdateRecord:", v5);
  -[_MPCMusicPlayerControllerServer _applyServerStateUpdateRecord:](self, "_applyServerStateUpdateRecord:", v5);

}

- (void)engine:(id)a3 didReachEndOfQueueWithReason:(id)a4
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDDCA80]);
  objc_msgSend(v5, "setQueueDidEnd:", 1);
  -[_MPCMusicPlayerControllerServer _applyServerStateUpdateRecord:](self, "_applyServerStateUpdateRecord:", v5);

}

- (void)engine:(id)a3 didEndPlaybackOfItem:(id)a4
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDDCA80]);
  objc_msgSend(v5, "setItemDidEnd:", 1);
  -[_MPCMusicPlayerControllerServer _applyServerStateUpdateRecord:](self, "_applyServerStateUpdateRecord:", v5);

}

- (void)engine:(id)a3 didChangeItemElapsedTime:(double)a4 rate:(float)a5
{
  double v8;
  void *v9;
  id v10;

  v10 = objc_alloc_init(MEMORY[0x24BDDCA80]);
  objc_msgSend(v10, "setHasTimeSnapshot:", 1);
  *(float *)&v8 = a5;
  -[_MPCMusicPlayerControllerServer _timeSnapshotWithElapsedTime:rate:](self, "_timeSnapshotWithElapsedTime:rate:", a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTimeSnapshot:", v9);

  -[_MPCMusicPlayerControllerServer _applyServerStateUpdateRecord:](self, "_applyServerStateUpdateRecord:", v10);
}

- (void)engine:(id)a3 didChangeCurrentItemVariantID:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  -[_MPCMusicPlayerControllerServer playbackEngine](self, "playbackEngine", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queueController");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isPlaceholder") & 1) == 0)
  {
    -[_MPCMusicPlayerControllerServer _nowPlayingWithItem:](self, "_nowPlayingWithItem:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x24BDDCA80]);
    objc_msgSend(v8, "setHasNowPlaying:", 1);
    objc_msgSend(v8, "setNowPlaying:", v7);
    objc_msgSend(v8, "setAudioFormatDidChange:", 1);
    -[_MPCMusicPlayerControllerServer _applyServerStateUpdateRecord:](self, "_applyServerStateUpdateRecord:", v8);

  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
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
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  id v34;
  id v35;
  int v36;
  id from;
  id location;
  _QWORD block[5];
  id v40;
  uint8_t buf[4];
  _QWORD v42[2];
  _QWORD v43[3];
  _QWORD v44[4];

  v44[2] = *MEMORY[0x24BDAC8D0];
  v28 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70___MPCMusicPlayerControllerServer_listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_24CABA1D0;
  block[4] = self;
  v8 = v6;
  v40 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v8);
  v30 = v7;
  v31 = 3221225472;
  v32 = __70___MPCMusicPlayerControllerServer_listener_shouldAcceptNewConnection___block_invoke_2;
  v33 = &unk_24CAB2540;
  v36 = objc_msgSend(v8, "processIdentifier");
  objc_copyWeak(&v34, &location);
  objc_copyWeak(&v35, &from);
  objc_msgSend(v8, "setInvalidationHandler:", &v30);
  if (+[MPCPlaybackEngine isSystemMusic](MPCPlaybackEngine, "isSystemMusic"))
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AA1048, v28, v30, v31, v32, v33);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExportedInterface:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AA1308, v28, v30, v31, v32, v33);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExportedInterface:", v10);

    objc_msgSend(v8, "remoteObjectInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDBCF20];
    v44[0] = objc_opt_class();
    v44[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_getNowPlayingsForContentItemIDs_reply_, 0, 1);

    objc_msgSend(v8, "exportedInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDBCF20];
    v43[0] = objc_opt_class();
    v43[1] = objc_opt_class();
    v43[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_beginPlaybackAtHostTime_, 0, 0);

  }
  v18 = (void *)MEMORY[0x24BE65CD0];
  objc_msgSend(v8, "exportedInterface");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "protocol");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "proxyWithObject:protocol:", self, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExportedObject:", v21);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AEC0F0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRemoteObjectInterface:", v22);

  if (MSVDeviceOSIsInternalInstall())
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "integerForKey:", CFSTR("DelayMusicServerConnection"));

    if (v24 >= 1)
    {
      v25 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        LODWORD(v42[0]) = v24;
        WORD2(v42[0]) = 2114;
        *(_QWORD *)((char *)v42 + 6) = v8;
        _os_log_impl(&dword_210BD8000, v25, OS_LOG_TYPE_DEFAULT, "MPMusicPlayerControllerServer: acceptNewConnection: delaying connection [%ds] %{public}@", buf, 0x12u);
      }

      sleep(v24);
    }
  }
  objc_msgSend(v8, "resume");
  v26 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v42[0] = v8;
    _os_log_impl(&dword_210BD8000, v26, OS_LOG_TYPE_DEFAULT, "MPMusicPlayerControllerServer: acceptNewConnection: %{public}@", buf, 0xCu);
  }

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

- (void)_invokeServerCommandEvent:(id)a3 remoteCommandSenderID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "mediaRemoteOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  MSVNanoIDCreateTaggedPointer();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("MPMusicPlayer-"), "stringByAppendingString:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE658C0]);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("MPCMusicPlayerControllerServer"), *MEMORY[0x24BE65990]);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, CFSTR("kMRMediaRemoteOptionSenderID"));

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = v8;
    objc_msgSend(v18, "playbackQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMediaRemoteOptions:", v15);
    v20 = objc_alloc(MEMORY[0x24BDDCBE8]);
    objc_msgSend(v18, "command");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v20, "initWithCommand:playbackQueue:", v21, v19);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = v8;
      objc_msgSend(v23, "playbackQueue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_alloc(MEMORY[0x24BDDC760]);
      objc_msgSend(v23, "command");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = objc_msgSend(v24, "initWithCommand:playbackQueue:options:", v21, v19, v15);
    }
    else
    {
      v25 = objc_alloc((Class)objc_opt_class());
      objc_msgSend(v8, "command");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "command");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v25, "initWithCommand:mediaRemoteType:options:", v19, objc_msgSend(v21, "mediaRemoteCommandType"), v15);
    }
  }
  v26 = (void *)v22;

  v27 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v37 = v26;
    _os_log_impl(&dword_210BD8000, v27, OS_LOG_TYPE_DEFAULT, "MPMusicPlayerControllerServer: _invokeServerCommandEvent:… start dispatch [] serverEvent=%{public}@", buf, 0xCu);
  }

  -[_MPCMusicPlayerControllerServer playbackEngine](self, "playbackEngine");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "mediaRemotePublisher");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commandCenter");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __94___MPCMusicPlayerControllerServer__invokeServerCommandEvent_remoteCommandSenderID_completion___block_invoke;
  v33[3] = &unk_24CAB2170;
  v34 = v26;
  v35 = v9;
  v31 = v9;
  v32 = v26;
  objc_msgSend(v30, "dispatchCommandEvent:completion:", v32, v33);

}

- (id)_remoteCommandSenderIDForCurrentXPCConnection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "auditToken");
    MSVBundleIDForAuditToken();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SenderBundleIdentifier = <%@>, SenderPID = <%i>"), v4, objc_msgSend(v3, "processIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (MPMusicPlayerControllerSystemCache)systemCache
{
  return self->_systemCache;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (NSMutableArray)activeConnections
{
  return self->_activeConnections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConnections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_systemCache, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_storeStrong((id *)&self->_settingMultiplePlaybackContextsUUID, 0);
  objc_storeStrong(&self->_prepareCompletionHandler, 0);
  objc_storeStrong((id *)&self->_preparingDescriptor, 0);
  objc_storeStrong((id *)&self->_queueDescriptor, 0);
}

@end
