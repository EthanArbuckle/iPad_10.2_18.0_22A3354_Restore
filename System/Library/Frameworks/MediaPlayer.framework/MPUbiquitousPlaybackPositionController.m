@implementation MPUbiquitousPlaybackPositionController

uint64_t __77__MPUbiquitousPlaybackPositionController__onServiceQueue_becomeActiveService__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_shouldBeActive");
  if ((_DWORD)result)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v3 + 8))
    {
      if (*(_BYTE *)(v3 + 10))
        *(_BYTE *)(v3 + 8) = 1;
    }
  }
  return result;
}

uint64_t __85__MPUbiquitousPlaybackPositionController__onServiceQueue_updateActiveServiceIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8);
  result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_shouldBeActive");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_onQueue_shouldBeActive
{
  return self->_externallyActive
      && -[MPUbiquitousPlaybackPositionController _onQueue_isEnabled](self, "_onQueue_isEnabled");
}

- (BOOL)_onQueue_isEnabled
{
  void *v2;
  char v3;

  +[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHomeSharingLibrary") ^ 1;

  return v3;
}

+ (MPUbiquitousPlaybackPositionController)sharedUbiquitousPlaybackPositionController
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("disableUPP"));

  if ((v3 & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    if (sharedUbiquitousPlaybackPositionController_onceToken != -1)
      dispatch_once(&sharedUbiquitousPlaybackPositionController_onceToken, &__block_literal_global_40093);
    v4 = (id)sharedUbiquitousPlaybackPositionController_bookmarksController;
  }
  return (MPUbiquitousPlaybackPositionController *)v4;
}

uint64_t __85__MPUbiquitousPlaybackPositionController__applicationDidEnterForegroundNotification___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onServiceQueue_updateActiveServiceIfNeeded");
}

uint64_t __76__MPUbiquitousPlaybackPositionController_beginUsingPlaybackPositionMetadata__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 10) = 1;
  return result;
}

void __85__MPUbiquitousPlaybackPositionController__applicationDidEnterForegroundNotification___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__MPUbiquitousPlaybackPositionController__applicationDidEnterForegroundNotification___block_invoke_2;
  block[3] = &unk_1E3163508;
  block[4] = v1;
  dispatch_async(v2, block);
}

- (void)beginUsingPlaybackPositionMetadata
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__MPUbiquitousPlaybackPositionController_beginUsingPlaybackPositionMetadata__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_applicationDidEnterForegroundNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__MPUbiquitousPlaybackPositionController__applicationDidEnterForegroundNotification___block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_onServiceQueue_updateActiveServiceIfNeeded
{
  NSObject *queue;
  _QWORD block[7];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__MPUbiquitousPlaybackPositionController__onServiceQueue_updateActiveServiceIfNeeded__block_invoke;
  block[3] = &unk_1E31626B8;
  block[4] = self;
  block[5] = &v9;
  block[6] = &v5;
  dispatch_sync(queue, block);
  if (*((unsigned __int8 *)v6 + 24) != *((unsigned __int8 *)v10 + 24))
  {
    if (*((_BYTE *)v6 + 24))
      -[MPUbiquitousPlaybackPositionController _onServiceQueue_becomeActiveService](self, "_onServiceQueue_becomeActiveService");
    else
      -[MPUbiquitousPlaybackPositionController _onServiceQueue_resignActiveService](self, "_onServiceQueue_resignActiveService");
  }
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v9, 8);
}

- (void)_onServiceQueue_becomeActiveService
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__MPUbiquitousPlaybackPositionController__onServiceQueue_becomeActiveService__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __84__MPUbiquitousPlaybackPositionController_sharedUbiquitousPlaybackPositionController__block_invoke()
{
  MPUbiquitousPlaybackPositionController *v0;
  void *v1;

  v0 = objc_alloc_init(MPUbiquitousPlaybackPositionController);
  v1 = (void *)sharedUbiquitousPlaybackPositionController_bookmarksController;
  sharedUbiquitousPlaybackPositionController_bookmarksController = (uint64_t)v0;

}

- (MPUbiquitousPlaybackPositionController)init
{
  MPUbiquitousPlaybackPositionController *v2;
  MPUbiquitousPlaybackPositionController *v3;
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  id v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *serviceQueue;
  ICPlaybackPositionClient *v18;
  ICPlaybackPositionClient *uppServiceProxy;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)MPUbiquitousPlaybackPositionController;
  v2 = -[MPUbiquitousPlaybackPositionController init](&v22, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_externallyActive = 1;
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("com.apple.%@.queue.%p"), v6, v3);

    v8 = objc_retainAutorelease(v7);
    v9 = dispatch_queue_create((const char *)objc_msgSend(v8, "UTF8String"), 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v9;

    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("com.apple.%@.serviceQueue.%p"), v13, v3);

    v15 = objc_retainAutorelease(v14);
    v16 = dispatch_queue_create((const char *)objc_msgSend(v15, "UTF8String"), 0);
    serviceQueue = v3->_serviceQueue;
    v3->_serviceQueue = (OS_dispatch_queue *)v16;

    v18 = (ICPlaybackPositionClient *)objc_alloc_init(MEMORY[0x1E0DDC020]);
    uppServiceProxy = v3->_uppServiceProxy;
    v3->_uppServiceProxy = v18;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel__applicationDidEnterBackgroundNotification_, *MEMORY[0x1E0DC4768], 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel__applicationWillEnterForegroundNotification_, *MEMORY[0x1E0DC4860], 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel__applicationDidEnterForegroundNotification_, *MEMORY[0x1E0DC4750], 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v3, sel__defaultMediaLibraryDidChangeNotification_, CFSTR("MPMediaLibraryDefaultMediaLibraryDidChangeNotification"), 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MPUbiquitousPlaybackPositionController;
  -[MPUbiquitousPlaybackPositionController dealloc](&v4, sel_dealloc);
}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *serviceQueue;
  _QWORD block[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  MPSharedBackgroundTaskProvider();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__MPUbiquitousPlaybackPositionController__applicationDidEnterBackgroundNotification___block_invoke;
  v12[3] = &unk_1E31639A0;
  v12[4] = &v13;
  v7 = objc_msgSend(v5, "beginTaskWithName:expirationHandler:", CFSTR("MP_onServiceQueue_resignActiveService"), v12);

  v14[3] = v7;
  v8 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v14[3];
    *(_DWORD *)buf = 134218498;
    v18 = v9;
    v19 = 2082;
    v20 = "/Library/Caches/com.apple.xbs/Sources/MediaPlayer/MediaPlayer/Core/StoreBookkeeper Support/_ios_tvos/MPUbiquit"
          "ousPlaybackPositionController.m";
    v21 = 1024;
    v22 = 102;
    _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "BackgroundTask: Took assertion (%lli) at %{public}s:%d", buf, 0x1Cu);
  }

  serviceQueue = self->_serviceQueue;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __85__MPUbiquitousPlaybackPositionController__applicationDidEnterBackgroundNotification___block_invoke_23;
  block[3] = &unk_1E3163580;
  block[4] = self;
  block[5] = &v13;
  dispatch_async(serviceQueue, block);
  _Block_object_dispose(&v13, 8);

}

- (void)_applicationWillEnterForegroundNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__MPUbiquitousPlaybackPositionController__applicationWillEnterForegroundNotification___block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_defaultMediaLibraryDidChangeNotification:(id)a3
{
  NSObject *serviceQueue;
  _QWORD block[5];

  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__MPUbiquitousPlaybackPositionController__defaultMediaLibraryDidChangeNotification___block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(serviceQueue, block);
}

- (void)noteChangedPlaybackPositionMetadataForTrackPersistentID:(int64_t)a3 isCheckpoint:(BOOL)a4
{
  NSObject *queue;
  _QWORD block[6];
  BOOL v6;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__MPUbiquitousPlaybackPositionController_noteChangedPlaybackPositionMetadataForTrackPersistentID_isCheckpoint___block_invoke;
  block[3] = &unk_1E315ED60;
  block[4] = self;
  block[5] = a3;
  v6 = a4;
  dispatch_sync(queue, block);
}

- (void)setExternallyActive:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__MPUbiquitousPlaybackPositionController_setExternallyActive___block_invoke;
  v4[3] = &unk_1E3163468;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

- (BOOL)externallyActive
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__MPUbiquitousPlaybackPositionController_externallyActive__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)playbackPositionForLocalEntityIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPUbiquitousPlaybackPositionController playbackPositionForLocalEntityIdentifiers:](self, "playbackPositionForLocalEntityIdentifiers:", v6, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)playbackPositionForLocalEntityIdentifiers:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *serviceQueue;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  MPUbiquitousPlaybackPositionController *v15;
  id v16;
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__40061;
  v23 = __Block_byref_object_dispose__40062;
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = dispatch_semaphore_create(0);
  serviceQueue = self->_serviceQueue;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __84__MPUbiquitousPlaybackPositionController_playbackPositionForLocalEntityIdentifiers___block_invoke;
  v14 = &unk_1E31615D0;
  v15 = self;
  v7 = v4;
  v16 = v7;
  v18 = &v19;
  v8 = v5;
  v17 = v8;
  dispatch_sync(serviceQueue, &v11);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v9 = (void *)objc_msgSend((id)v20[5], "copy", v11, v12, v13, v14, v15);

  _Block_object_dispose(&v19, 8);
  return v9;
}

- (void)persistPlaybackPositionMetadataEntity:(id)a3 isCheckpoint:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *serviceQueue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  MPUbiquitousPlaybackPositionController *v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a5;
  serviceQueue = self->_serviceQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __104__MPUbiquitousPlaybackPositionController_persistPlaybackPositionMetadataEntity_isCheckpoint_completion___block_invoke;
  v13[3] = &unk_1E315EDD8;
  v14 = v8;
  v15 = self;
  v17 = a4;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(serviceQueue, v13);

}

- (id)_playbackPositionEntityWithValuesFromMusicLibraryTrackPersistentID:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  -[MPUbiquitousPlaybackPositionController uppServiceProxy](self, "uppServiceProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemWithPersistentID:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("storeBookmarkIdentifier"), CFSTR("bookmarkTime"), CFSTR("hasBeenPlayed"), CFSTR("playCount"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valuesForProperties:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKey:", CFSTR("storeBookmarkIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0DDC028]);
    v11 = *MEMORY[0x1E0DDBD70];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithDomain:playbackPositionKey:persistentIdentifier:", v11, v9, v12);

    objc_msgSend(v8, "objectForKey:", CFSTR("bookmarkTime"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBookmarkTime:", v14);

    objc_msgSend(v8, "objectForKey:", CFSTR("hasBeenPlayed"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHasBeenPlayed:", v15);

    objc_msgSend(v8, "objectForKey:", CFSTR("playCount"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setUserPlayCount:", v16);

    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v17, "numberWithDouble:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBookmarkTimestamp:", v18);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_onServiceQueue_resignActiveService
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__MPUbiquitousPlaybackPositionController__onServiceQueue_resignActiveService__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (BOOL)isServiceActive
{
  return self->_beganUsingPlaybackPositionMetadata;
}

- (void)setServiceActive:(BOOL)a3
{
  self->_isServiceActive = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)serviceQueue
{
  return self->_serviceQueue;
}

- (ICPlaybackPositionClient)uppServiceProxy
{
  return self->_uppServiceProxy;
}

- (void)setUppServiceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_uppServiceProxy, a3);
}

- (void)setBeganUsingPlaybackPositionMetadata:(BOOL)a3
{
  self->_beganUsingPlaybackPositionMetadata = a3;
}

- (BOOL)databaseHasBookmarkableContents
{
  return self->_databaseHasBookmarkableContents;
}

- (void)setDatabaseHasBookmarkableContents:(BOOL)a3
{
  self->_databaseHasBookmarkableContents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uppServiceProxy, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __77__MPUbiquitousPlaybackPositionController__onServiceQueue_resignActiveService__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = 0;
  return result;
}

void __104__MPUbiquitousPlaybackPositionController_persistPlaybackPositionMetadataEntity_isCheckpoint_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;

  v2 = objc_alloc(MEMORY[0x1E0DDC028]);
  v3 = *MEMORY[0x1E0DDBD70];
  objc_msgSend(*(id *)(a1 + 32), "ubiquitousIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithDomain:playbackPositionKey:persistentIdentifier:", v3, v4, 0);

  if (objc_msgSend(*(id *)(a1 + 32), "bookmarkTimestampModified"))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "bookmarkTimestamp");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBookmarkTimestamp:", v7);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "bookmarkTimeModified"))
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "bookmarkTime");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBookmarkTime:", v9);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "userPlayCountModified"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "userPlayCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserPlayCount:", v10);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "hasBeenPlayedModified"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "hasBeenPlayed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHasBeenPlayed:", v11);

  }
  v12 = *(void **)(a1 + 48);
  v13 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
  v14 = *(unsigned __int8 *)(a1 + 56);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __104__MPUbiquitousPlaybackPositionController_persistPlaybackPositionMetadataEntity_isCheckpoint_completion___block_invoke_2;
  v15[3] = &unk_1E3162588;
  v16 = v12;
  objc_msgSend(v13, "persistPlaybackPositionEntity:isCheckpoint:completionBlock:", v5, v14, v15);

}

uint64_t __104__MPUbiquitousPlaybackPositionController_persistPlaybackPositionMetadataEntity_isCheckpoint_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __84__MPUbiquitousPlaybackPositionController_playbackPositionForLocalEntityIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__MPUbiquitousPlaybackPositionController_playbackPositionForLocalEntityIdentifiers___block_invoke_2;
  v5[3] = &unk_1E315EDB0;
  v4 = *(_OWORD *)(a1 + 48);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v2, "getLocalPlaybackPositionForEntityIdentifiers:completionBlock:", v1, v5);

}

intptr_t __84__MPUbiquitousPlaybackPositionController_playbackPositionForLocalEntityIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__MPUbiquitousPlaybackPositionController_playbackPositionForLocalEntityIdentifiers___block_invoke_3;
  v6[3] = &unk_1E315ED88;
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(a4, "enumerateObjectsUsingBlock:", v6);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __84__MPUbiquitousPlaybackPositionController_playbackPositionForLocalEntityIdentifiers___block_invoke_3(uint64_t a1, void *a2)
{
  MPUbiquitousPlaybackPositionEntity *v3;
  void *v4;
  MPUbiquitousPlaybackPositionEntity *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v3 = [MPUbiquitousPlaybackPositionEntity alloc];
  objc_msgSend(v15, "playbackPositionKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MPUbiquitousPlaybackPositionEntity initWithUbiquitousIdentifier:](v3, "initWithUbiquitousIdentifier:", v4);

  objc_msgSend(v15, "bookmarkTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v15, "bookmarkTimestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    -[MPUbiquitousPlaybackPositionEntity setBookmarkTimestamp:](v5, "setBookmarkTimestamp:");

  }
  objc_msgSend(v15, "bookmarkTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v15, "bookmarkTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    -[MPUbiquitousPlaybackPositionEntity setBookmarkTime:](v5, "setBookmarkTime:");

  }
  objc_msgSend(v15, "userPlayCount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v15, "userPlayCount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPUbiquitousPlaybackPositionEntity setUserPlayCount:](v5, "setUserPlayCount:", objc_msgSend(v11, "unsignedIntValue"));

  }
  objc_msgSend(v15, "hasBeenPlayed");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v15, "hasBeenPlayed");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPUbiquitousPlaybackPositionEntity setHasBeenPlayed:](v5, "setHasBeenPlayed:", objc_msgSend(v13, "BOOLValue"));

  }
  objc_msgSend(v15, "libraryIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPUbiquitousPlaybackPositionEntity setLibraryIdentifier:](v5, "setLibraryIdentifier:", v14);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v5);
}

uint64_t __58__MPUbiquitousPlaybackPositionController_externallyActive__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 9);
  return result;
}

void __62__MPUbiquitousPlaybackPositionController_setExternallyActive___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 9) != v2)
  {
    *(_BYTE *)(v1 + 9) = v2;
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(NSObject **)(v3 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__MPUbiquitousPlaybackPositionController_setExternallyActive___block_invoke_2;
    block[3] = &unk_1E3163508;
    block[4] = v3;
    dispatch_async(v4, block);
  }
}

uint64_t __62__MPUbiquitousPlaybackPositionController_setExternallyActive___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onServiceQueue_updateActiveServiceIfNeeded");
}

void __111__MPUbiquitousPlaybackPositionController_noteChangedPlaybackPositionMetadataForTrackPersistentID_isCheckpoint___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[6];
  char v6;

  if (objc_msgSend(*(id *)(a1 + 32), "_onQueue_isEnabled"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(NSObject **)(v2 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __111__MPUbiquitousPlaybackPositionController_noteChangedPlaybackPositionMetadataForTrackPersistentID_isCheckpoint___block_invoke_2;
    block[3] = &unk_1E315ED60;
    block[1] = 3221225472;
    block[4] = v2;
    block[5] = v3;
    v6 = *(_BYTE *)(a1 + 48);
    dispatch_async(v4, block);
  }
}

void __111__MPUbiquitousPlaybackPositionController_noteChangedPlaybackPositionMetadataForTrackPersistentID_isCheckpoint___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_onServiceQueue_updateActiveServiceIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_playbackPositionEntityWithValuesFromMusicLibraryTrackPersistentID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "persistPlaybackPositionEntity:isCheckpoint:completionBlock:", v2, *(unsigned __int8 *)(a1 + 48), 0);

}

void __84__MPUbiquitousPlaybackPositionController__defaultMediaLibraryDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __84__MPUbiquitousPlaybackPositionController__defaultMediaLibraryDidChangeNotification___block_invoke_2;
  v4[3] = &unk_1E3163580;
  v4[4] = v2;
  v4[5] = &v5;
  dispatch_sync(v3, v4);
  objc_msgSend(*(id *)(a1 + 32), "_onServiceQueue_resignActiveService");
  if (*((_BYTE *)v6 + 24))
    objc_msgSend(*(id *)(a1 + 32), "_onServiceQueue_becomeActiveService");
  _Block_object_dispose(&v5, 8);
}

uint64_t __84__MPUbiquitousPlaybackPositionController__defaultMediaLibraryDidChangeNotification___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_shouldBeActive");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __86__MPUbiquitousPlaybackPositionController__applicationWillEnterForegroundNotification___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__MPUbiquitousPlaybackPositionController__applicationWillEnterForegroundNotification___block_invoke_2;
  block[3] = &unk_1E3163508;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __86__MPUbiquitousPlaybackPositionController__applicationWillEnterForegroundNotification___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onServiceQueue_updateActiveServiceIfNeeded");
}

void __85__MPUbiquitousPlaybackPositionController__applicationDidEnterBackgroundNotification___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  MPSharedBackgroundTaskProvider();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

  v3 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v5 = 134218498;
    v6 = v4;
    v7 = 2082;
    v8 = "/Library/Caches/com.apple.xbs/Sources/MediaPlayer/MediaPlayer/Core/StoreBookkeeper Support/_ios_tvos/MPUbiquito"
         "usPlaybackPositionController.m";
    v9 = 1024;
    v10 = 99;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "BackgroundTask: End assertion (%lli) at %{public}s:%d", (uint8_t *)&v5, 0x1Cu);
  }

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *MEMORY[0x1E0D4CE50];
}

void __85__MPUbiquitousPlaybackPositionController__applicationDidEnterBackgroundNotification___block_invoke_23(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_onServiceQueue_resignActiveService");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != *MEMORY[0x1E0D4CE50])
  {
    MPSharedBackgroundTaskProvider();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "endTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));

    v3 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v5 = 134218498;
      v6 = v4;
      v7 = 2082;
      v8 = "/Library/Caches/com.apple.xbs/Sources/MediaPlayer/MediaPlayer/Core/StoreBookkeeper Support/_ios_tvos/MPUbiqui"
           "tousPlaybackPositionController.m";
      v9 = 1024;
      v10 = 107;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "BackgroundTask: End assertion (%lli) at %{public}s:%d", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

@end
