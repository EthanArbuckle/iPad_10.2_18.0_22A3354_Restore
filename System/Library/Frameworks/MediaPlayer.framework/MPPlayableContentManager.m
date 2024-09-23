@implementation MPPlayableContentManager

- (id)_init
{
  MPPlayableContentManager *v2;
  NSObject *v3;
  NSMutableSet *v4;
  NSMutableSet *mutatedContentItems;
  NSMutableSet *v6;
  NSMutableSet *contentItemIdentifiersSentToMediaRemote;
  NSArray *nowPlayingIdentifiers;
  dispatch_queue_t v9;
  OS_dispatch_queue *serialQueue;
  NSOperationQueue *v11;
  NSOperationQueue *artworkUpdateQueue;
  void *v13;
  objc_class *v14;
  CARSessionStatus *v15;
  CARSessionStatus *currentSessionStatus;
  objc_super v18;
  uint8_t buf[8];
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v18.receiver = self;
  v18.super_class = (Class)MPPlayableContentManager;
  v2 = -[MPPlayableContentManager init](&v18, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "Content manager initialized, awaiting session status.", buf, 2u);
    }

    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    mutatedContentItems = v2->_mutatedContentItems;
    v2->_mutatedContentItems = v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    contentItemIdentifiersSentToMediaRemote = v2->_contentItemIdentifiersSentToMediaRemote;
    v2->_contentItemIdentifiersSentToMediaRemote = v6;

    nowPlayingIdentifiers = v2->_nowPlayingIdentifiers;
    v2->_nowPlayingIdentifiers = (NSArray *)MEMORY[0x1E0C9AA60];

    v9 = dispatch_queue_create("com.apple.MediaRemote.MPPlayableContentManagerSerialQueue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v9;

    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    artworkUpdateQueue = v2->_artworkUpdateQueue;
    v2->_artworkUpdateQueue = v11;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_artworkUpdateQueue, "setMaxConcurrentOperationCount:", 5);
    v2->_scheduledSupportedAPIsChange = 0;
    if (objc_msgSend((id)objc_opt_class(), "_deviceIsCarplayCapable"))
    {
      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v13 = (void *)getCARSessionStatusClass_softClass;
      v27 = getCARSessionStatusClass_softClass;
      if (!getCARSessionStatusClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        v20 = 3221225472;
        v21 = __getCARSessionStatusClass_block_invoke;
        v22 = &unk_1E31639A0;
        v23 = &v24;
        __getCARSessionStatusClass_block_invoke((uint64_t)buf);
        v13 = (void *)v25[3];
      }
      v14 = objc_retainAutorelease(v13);
      _Block_object_dispose(&v24, 8);
      v15 = (CARSessionStatus *)objc_alloc_init(v14);
      currentSessionStatus = v2->_currentSessionStatus;
      v2->_currentSessionStatus = v15;
    }
    else
    {
      currentSessionStatus = v2->_currentSessionStatus;
      v2->_currentSessionStatus = 0;
    }

    -[CARSessionStatus setSessionObserver:](v2->_currentSessionStatus, "setSessionObserver:", v2);
  }
  return v2;
}

- (MPPlayableContentManager)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-init is invalid. Use +sharedManager."));

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[MPPlayableContentManager _tearDownMediaRemoteEndpoint](self, "_tearDownMediaRemoteEndpoint");
  -[MPPlayableContentManager _tearDownNotifications](self, "_tearDownNotifications");
  v3.receiver = self;
  v3.super_class = (Class)MPPlayableContentManager;
  -[MPPlayableContentManager dealloc](&v3, sel_dealloc);
}

- (void)setDataSource:(id)dataSource
{
  NSObject *v4;
  uint8_t v5[16];

  objc_storeWeak((id *)&self->_dataSource, dataSource);
  -[MPPlayableContentManager _scheduleUpdateSupportedAPIs](self, "_scheduleUpdateSupportedAPIs");
  if (self->_context)
  {
    -[MPPlayableContentManager reloadData](self, "reloadData");
  }
  else
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "Content manager skipping dataSource reload; awaiting context.",
        v5,
        2u);
    }

  }
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
  -[MPPlayableContentManager _scheduleUpdateSupportedAPIs](self, "_scheduleUpdateSupportedAPIs");
}

- (void)reloadData
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MPPlayableContentManager_reloadData__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)beginUpdates
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__MPPlayableContentManager_beginUpdates__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)endUpdates
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MPPlayableContentManager_endUpdates__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)setNowPlayingIdentifiers:(NSArray *)nowPlayingIdentifiers
{
  NSArray *v5;
  void *v6;
  NSObject *v7;
  NSObject *serialQueue;
  NSArray *v9;
  _QWORD v10[5];
  NSArray *v11;
  uint8_t buf[16];

  v5 = nowPlayingIdentifiers;
  if (!v5)
  {
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPPlayableContentManager.m"), 216, CFSTR("-[MPPlayableContentManager setNowPlayingIdentifiers:] nowPlayingIdentifiers cannot be nil."));

      v5 = 0;
    }
    else
    {
      v7 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "Warning: -[MPPlayableContentManager setNowPlayingIdentifiers:] nowPlayingIdentifiers cannot be nil. The argument has been replaced with an empty array, please change usage to match this expectation. An assertion will be triggered for apps built on or after the iOS 12.2 SDK.", buf, 2u);
      }

      v5 = (NSArray *)MEMORY[0x1E0C9AA60];
    }
  }
  serialQueue = self->_serialQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__MPPlayableContentManager_setNowPlayingIdentifiers___block_invoke;
  v10[3] = &unk_1E31635F8;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  dispatch_sync(serialQueue, v10);

}

- (void)_contentItemChangedNotification:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  MPPlayableContentManager *v9;

  v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__MPPlayableContentManager__contentItemChangedNotification___block_invoke;
  v7[3] = &unk_1E31635F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

- (void)sessionDidConnect:(id)a3
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  MPPlayableContentManagerContext *v8;
  MPPlayableContentManagerContext *context;
  MPPlayableContentManagerContext *v10;
  uint64_t v11;
  uint8_t v12[16];
  uint8_t buf[16];
  uint8_t v14[16];

  v5 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "Content manager session connected.", buf, 2u);
    }

    if (!self->_context)
    {
      v7 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "Content manager initializing context.", v12, 2u);
      }

      v8 = objc_alloc_init(MPPlayableContentManagerContext);
      context = self->_context;
      self->_context = v8;

      -[MPPlayableContentManagerContext setContentLimitsEnforced:](self->_context, "setContentLimitsEnforced:", -[MPPlayableContentManager _areContentLimitsEnforced](self, "_areContentLimitsEnforced"));
      v10 = self->_context;
      if (-[MPPlayableContentManager _musicListsLimited](self, "_musicListsLimited"))
        v11 = 12;
      else
        v11 = 0x7FFFFFFFFFFFFFFFLL;
      -[MPPlayableContentManagerContext setEnforcedContentItemsCount:](v10, "setEnforcedContentItemsCount:", v11);
      -[MPPlayableContentManagerContext setEnforcedContentTreeDepth:](self->_context, "setEnforcedContentTreeDepth:", 5);
      -[MPPlayableContentManagerContext setEndpointAvailable:](self->_context, "setEndpointAvailable:", 1);
    }
    -[MPPlayableContentManager _setupMediaRemoteEndpoint](self, "_setupMediaRemoteEndpoint");
    -[MPPlayableContentManager _setupNotifications](self, "_setupNotifications");
    -[MPPlayableContentManager _scheduleUpdateSupportedAPIs](self, "_scheduleUpdateSupportedAPIs");
    -[MPPlayableContentManager reloadData](self, "reloadData");
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "Content manager has no available session.", v14, 2u);
    }

  }
}

- (void)sessionDidDisconnect:(id)a3
{
  -[MPPlayableContentManager _tearDownMediaRemoteEndpoint](self, "_tearDownMediaRemoteEndpoint", a3);
  -[MPPlayableContentManager _tearDownNotifications](self, "_tearDownNotifications");
}

- (void)_enqueueArtworkUpdate:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSOperationQueue *artworkUpdateQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  artworkUpdateQueue = self->_artworkUpdateQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__MPPlayableContentManager__enqueueArtworkUpdate_withCompletion___block_invoke;
  v11[3] = &unk_1E3162560;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[NSOperationQueue addOperationWithBlock:](artworkUpdateQueue, "addOperationWithBlock:", v11);

}

- (void)_enqueueArtworkUpdate:(id)a3 size:(CGSize)a4 withCompletion:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  NSOperationQueue *artworkUpdateQueue;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  CGFloat v17;
  CGFloat v18;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  artworkUpdateQueue = self->_artworkUpdateQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__MPPlayableContentManager__enqueueArtworkUpdate_size_withCompletion___block_invoke;
  v14[3] = &unk_1E3156EC0;
  v17 = width;
  v18 = height;
  v15 = v9;
  v16 = v10;
  v12 = v10;
  v13 = v9;
  -[NSOperationQueue addOperationWithBlock:](artworkUpdateQueue, "addOperationWithBlock:", v14);

}

- (void)_setupMediaRemoteEndpoint
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "Content manager setting up media remote endpoint.", v4, 2u);
  }

  _setupMediaRemoteEndpoint___endpoint = (uint64_t)self;
  MRMediaRemoteSetBrowsableContentEndpoint();
}

- (void)_tearDownMediaRemoteEndpoint
{
  MRMediaRemoteSetBrowsableContentEndpoint();
}

- (void)_setupNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__contentItemChangedNotification_, CFSTR("_MPContentItemDidChangeNotification"), 0);
  getCARSessionLimitUserInterfacesChangedNotification();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__limitedUIChanged_, v3, 0);

  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__browsableContentEndpointChanged_, *MEMORY[0x1E0D4C778], 0);
}

- (void)_tearDownNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("_MPContentItemDidChangeNotification"), 0);
  getCARSessionLimitUserInterfacesChangedNotification();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, v3, 0);

  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0D4C778], 0);
}

- (void)_pushContentItemsUpdate
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MPPlayableContentManager__pushContentItemsUpdate__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_handlePlaybackInitializationCompletedWithContext:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void **v11;
  uint64_t v12;
  unsigned int v13;
  NSObject *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "serviced"))
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_playableContentManager_initiatePlaybackOfContentItemAtIndexPath_completionHandler_);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v8;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "The completion handler for the current %{public}@ procedure has already been called once. You should only call MediaPlayer's completion handler once after servicing the call.", (uint8_t *)&v16, 0xCu);

    }
  }
  objc_msgSend(v5, "indexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  v11 = (void **)malloc_type_malloc(0x10uLL, 0x1010040FDD9F14CuLL);
  v11[1] = (void *)v10;
  if (v10)
  {
    v12 = 0;
    *v11 = malloc_type_malloc(8 * v10, 0x100004000313F17uLL);
    v13 = 1;
    do
    {
      *((_QWORD *)*v11 + v12) = objc_msgSend(v9, "indexAtPosition:", v12);
      v12 = v13;
    }
    while (v10 > v13++);
  }
  else
  {
    *v11 = 0;
  }
  MRMediaRemoteFinishedPlaybackInitialization();
  v15 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543618;
    v17 = v9;
    v18 = 2114;
    v19 = v6;
    _os_log_impl(&dword_193B9B000, v15, OS_LOG_TYPE_DEFAULT, "Playback initialization completed at index path: %{public}@, error: %{public}@", (uint8_t *)&v16, 0x16u);
  }

  free(*v11);
  free(v11);
  objc_msgSend(v5, "setServiced:", 1);

}

- (BOOL)_contentItemWasSentToMediaRemote:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MPPlayableContentManager__contentItemWasSentToMediaRemote___block_invoke;
  block[3] = &unk_1E31635A8;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(serialQueue, block);
  LOBYTE(serialQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)serialQueue;
}

- (BOOL)_onQueueContentItemWasSentToMediaRemote:(id)a3
{
  NSMutableSet *contentItemIdentifiersSentToMediaRemote;
  void *v4;

  contentItemIdentifiersSentToMediaRemote = self->_contentItemIdentifiersSentToMediaRemote;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(contentItemIdentifiersSentToMediaRemote) = -[NSMutableSet containsObject:](contentItemIdentifiersSentToMediaRemote, "containsObject:", v4);

  return (char)contentItemIdentifiersSentToMediaRemote;
}

- (void)_markContentItemsAsSentToMediaRemote:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[4];
  id v8;
  MPPlayableContentManager *v9;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__MPPlayableContentManager__markContentItemsAsSentToMediaRemote___block_invoke;
  block[3] = &unk_1E31635F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

- (void)_limitedUIChanged:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[MPPlayableContentManager context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentLimitsEnforced:", -[MPPlayableContentManager _areContentLimitsEnforced](self, "_areContentLimitsEnforced"));

  -[MPPlayableContentManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MPPlayableContentManager _musicListsLimited](self, "_musicListsLimited"))
    v6 = 12;
  else
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v5, "setEnforcedContentItemsCount:", v6);

  v7 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MPPlayableContentManager _musicListsLimited](self, "_musicListsLimited"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "Content manager updated limited UI: %@", (uint8_t *)&v11, 0xCu);

  }
  -[MPPlayableContentManager delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPPlayableContentManager context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "playableContentManager:didUpdateContext:", self, v10);

  }
}

- (void)_browsableContentEndpointChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  -[CARSessionStatus currentSession](self->_currentSessionStatus, "currentSession", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getCARSessionLimitUserInterfacesChangedNotification();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, v5, 0);

  -[MPPlayableContentManager context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v6, "setEndpointAvailable:", 1);

    getCARSessionLimitUserInterfacesChangedNotification();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__limitedUIChanged_, v6, 0);
  }
  else
  {
    objc_msgSend(v6, "setEndpointAvailable:", 0);
  }

  -[MPPlayableContentManager context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentLimitsEnforced:", -[MPPlayableContentManager _areContentLimitsEnforced](self, "_areContentLimitsEnforced"));

  -[MPPlayableContentManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MPPlayableContentManager _musicListsLimited](self, "_musicListsLimited"))
    v9 = 12;
  else
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v8, "setEnforcedContentItemsCount:", v9);

  -[MPPlayableContentManager delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPPlayableContentManager context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playableContentManager:didUpdateContext:", self, v11);

  }
}

- (BOOL)_musicListsLimited
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[CARSessionStatus currentSession](self->_currentSessionStatus, "currentSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = ((unint64_t)objc_msgSend(v3, "limitableUserInterfaces") >> 3) & 1;

  return v4;
}

- (BOOL)_areContentLimitsEnforced
{
  void *v3;
  void *v4;
  BOOL v5;

  -[CARSessionStatus currentSession](self->_currentSessionStatus, "currentSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "limitUserInterfaces");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "BOOLValue"))
    v5 = -[MPPlayableContentManager _musicListsLimited](self, "_musicListsLimited");
  else
    v5 = 0;

  return v5;
}

- (void)_updateSupportedAPIs
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[MPPlayableContentManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_respondsToSelector();
  objc_opt_respondsToSelector();
  -[MPPlayableContentManager dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_respondsToSelector();
  objc_opt_respondsToSelector();
  objc_opt_respondsToSelector();
  v5 = (void *)MRMediaRemoteCopyBrowsableContentAPIMaskDescription();
  v6 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "Updating supported browsable content APIs: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  MRMediaRemoteSetSupportedBrowsableContentAPIs();
}

- (void)_scheduleUpdateSupportedAPIs
{
  uint64_t v2;
  _QWORD block[5];

  if (!self->_scheduledSupportedAPIsChange)
  {
    v2 = MEMORY[0x1E0C809B0];
    self->_scheduledSupportedAPIsChange = 1;
    block[0] = v2;
    block[1] = 3221225472;
    block[2] = __56__MPPlayableContentManager__scheduleUpdateSupportedAPIs__block_invoke;
    block[3] = &unk_1E3163508;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (id)dataSource
{
  return objc_loadWeakRetained((id *)&self->_dataSource);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (MPPlayableContentManagerContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSArray)nowPlayingIdentifiers
{
  return self->_nowPlayingIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingIdentifiers, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_currentSessionStatus, 0);
  objc_storeStrong((id *)&self->_artworkUpdateQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_contentItemIdentifiersSentToMediaRemote, 0);
  objc_storeStrong((id *)&self->_mutatedContentItems, 0);
}

uint64_t __56__MPPlayableContentManager__scheduleUpdateSupportedAPIs__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_updateSupportedAPIs");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = 0;
  return result;
}

void __48__MPPlayableContentManager__updateSupportedAPIs__block_invoke(uint64_t a1, unsigned int a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 134217984;
      v5 = a2;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_ERROR, "Error updating browsable content APIs. MediaRemote error %ld", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __65__MPPlayableContentManager__markContentItemsAsSentToMediaRemote___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        objc_msgSend(MEMORY[0x1E0C99E38], "null", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7 != v8)
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addObject:", MRContentItemGetIdentifier());
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

uint64_t __61__MPPlayableContentManager__contentItemWasSentToMediaRemote___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_onQueueContentItemWasSentToMediaRemote:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __51__MPPlayableContentManager__pushContentItemsUpdate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count"))
  {
    v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      *(_DWORD *)buf = 138412290;
      v17 = v3;
      _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "Pushing content items update with items: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "waitUntilAllOperationsAreFinished");
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count"));
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
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
          v10 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9));
          objc_msgSend(v4, "addObject:", objc_msgSend(v10, "_mediaRemoteContentItem", (_QWORD)v11));
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

    MRMediaRemoteUpdateBrowsableContentItems();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");

  }
}

void __70__MPPlayableContentManager__enqueueArtworkUpdate_size_withCompletion___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIImage *v8;
  UIImage *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  CGSize v23;

  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = v2;
  if (v2 == -1.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    v4 = v5;
  }
  v6 = v3;
  if (v3 == -1.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    v6 = v7;
  }
  objc_msgSend(*(id *)(a1 + 32), "imageWithSize:", v4, v6);
  v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    -[UIImage size](v8, "size");
    if (v10 > 0.0)
    {
      -[UIImage size](v9, "size");
      if (v11 > 0.0)
      {
        -[UIImage size](v9, "size");
        v13 = v12;
        -[UIImage size](v9, "size");
        if (v2 == -1.0 && v3 == -1.0)
        {
          -[UIImage size](v9, "size");
          v2 = v15;
          -[UIImage size](v9, "size");
          v3 = v16;
        }
        else
        {
          v17 = v13 / v14;
          if (v2 == -1.0)
          {
            v2 = v3 * v17;
          }
          else if (v3 == -1.0)
          {
            v3 = v2 / v17;
          }
        }
      }
    }
    -[UIImage size](v9, "size");
    if (v18 > v2 || (-[UIImage size](v9, "size"), v19 > v3))
    {
      v23.width = v2;
      v23.height = v3;
      UIGraphicsBeginImageContextWithOptions(v23, 0, 0.0);
      -[UIImage drawInRect:](v9, "drawInRect:", 0.0, 0.0, v2, v3);
      UIGraphicsGetImageFromCurrentImageContext();
      v20 = objc_claimAutoreleasedReturnValue();
      UIGraphicsEndImageContext();

      v9 = (UIImage *)v20;
    }
    UIImagePNGRepresentation(v9);
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  v21 = *(_QWORD *)(a1 + 40);
  -[UIImage size](v9, "size");
  (*(void (**)(uint64_t, id))(v21 + 16))(v21, v22);

}

void __65__MPPlayableContentManager__enqueueArtworkUpdate_withCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "pngDataWithSize:", 768.0, 768.0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __60__MPPlayableContentManager__contentItemChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BYTE *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "containsObject:", v2) & 1) == 0
    && objc_msgSend(*(id *)(a1 + 40), "_onQueueContentItemWasSentToMediaRemote:", v2))
  {
    v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "[PlayableContentManager] Content item %@ mutated. Enqueueing for update.", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "addObject:", v2);
    v4 = *(_BYTE **)(a1 + 40);
    if (!v4[40])
      objc_msgSend(v4, "_pushContentItemsUpdate");
  }

}

uint64_t __53__MPPlayableContentManager_setNowPlayingIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v2;

  v5 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "Content manager updated now playing identifiers. Pushing new identifiers.", v7, 2u);
  }

  return MRMediaRemoteUpdateNowPlayingIdentifiers();
}

uint64_t __38__MPPlayableContentManager_endUpdates__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "Content manager stopped coalescing content item updates. Pushing changes, if any.", v4, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_pushContentItemsUpdate");
}

void __40__MPPlayableContentManager_beginUpdates__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "Content manager beginning to coalesce content item updates.", v3, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
}

uint64_t __38__MPPlayableContentManager_reloadData__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "Content manager invalidating browsable content...", v4, 2u);
  }

  return MRMediaRemoteInvalidateBrowsableContent();
}

+ (MPPlayableContentManager)sharedContentManager
{
  if (sharedContentManager___once != -1)
    dispatch_once(&sharedContentManager___once, &__block_literal_global_16577);
  return (MPPlayableContentManager *)(id)sharedContentManager___instance;
}

+ (BOOL)_deviceIsCarplayCapable
{
  if (_deviceIsCarplayCapable_onceToken != -1)
    dispatch_once(&_deviceIsCarplayCapable_onceToken, &__block_literal_global_18);
  return _deviceIsCarplayCapable__MGDeviceIsCarplayCapable;
}

uint64_t __51__MPPlayableContentManager__deviceIsCarplayCapable__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  _deviceIsCarplayCapable__MGDeviceIsCarplayCapable = result;
  return result;
}

void __48__MPPlayableContentManager_sharedContentManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[MPPlayableContentManager _init]([MPPlayableContentManager alloc], "_init");
  v1 = (void *)sharedContentManager___instance;
  sharedContentManager___instance = (uint64_t)v0;

}

@end
