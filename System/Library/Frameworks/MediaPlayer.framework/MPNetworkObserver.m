@implementation MPNetworkObserver

+ (MPNetworkObserver)sharedNetworkObserver
{
  if (sharedNetworkObserver___once != -1)
    dispatch_once(&sharedNetworkObserver___once, &__block_literal_global_39412);
  return (MPNetworkObserver *)(id)sharedNetworkObserver___sharedNetworkObserver;
}

- (BOOL)isMusicCellularStreamingAllowed
{
  void *v2;
  BOOL v3;

  +[MPPlaybackUserDefaults standardUserDefaults](MPPlaybackUserDefaults, "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preferredMusicLowBandwidthResolution") > 0;

  return v3;
}

void __42__MPNetworkObserver_sharedNetworkObserver__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[MPNetworkObserver _init]([MPNetworkObserver alloc], "_init");
  v1 = (void *)sharedNetworkObserver___sharedNetworkObserver;
  sharedNetworkObserver___sharedNetworkObserver = (uint64_t)v0;

}

- (id)_init
{
  MPNetworkObserver *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  NSObject *v5;
  uint64_t v6;
  _QWORD v8[4];
  MPNetworkObserver *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD handler[4];
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MPNetworkObserver;
  v2 = -[MPNetworkObserver init](&v16, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.MediaPlayer.MPNetworkObserver", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    objc_initWeak(&location, v2);
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __26__MPNetworkObserver__init__block_invoke;
    handler[3] = &unk_1E315E6B0;
    objc_copyWeak(&v14, &location);
    notify_register_dispatch("com.apple.mobileipod.playbackPreferencesChanged-MusicAllowsCellularData", &v2->_musicCellularNetworkingAllowedNotifyToken, v5, handler);

    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __26__MPNetworkObserver__init__block_invoke_2;
    v11[3] = &unk_1E315E6B0;
    objc_copyWeak(&v12, &location);
    notify_register_dispatch("com.apple.Music-AllowsCellularDataDownloads", &v2->_musicCellularNetworkingAllowedNotifyToken, v5, v11);

    v2->_videosAllowsCellularStreaming = CFPreferencesGetAppBooleanValue(CFSTR("CellularDataMode"), CFSTR("com.apple.videos-preferences"), 0) != 0;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __26__MPNetworkObserver__init__block_invoke_3;
    v8[3] = &unk_1E315E6D8;
    objc_copyWeak(&v10, &location);
    v9 = v2;
    notify_register_dispatch("com.apple.videos-preferences-changed", &v2->_videosPreferencesChangedToken, v5, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (MPNetworkObserver)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MPNetworkObserverInitException"), CFSTR("-init is not supported, use +sharedNetworkObserver"));

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_musicCellularNetworkingAllowedNotifyToken);
  notify_cancel(self->_videosPreferencesChangedToken);
  v3.receiver = self;
  v3.super_class = (Class)MPNetworkObserver;
  -[MPNetworkObserver dealloc](&v3, sel_dealloc);
}

- (void)beginUsingNetwork
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MPNetworkObserver_beginUsingNetwork__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)endUsingNetwork
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__MPNetworkObserver_endUsingNetwork__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)setMusicCellularStreamingAllowed:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a3;
  +[MPPlaybackUserDefaults standardUserDefaults](MPPlaybackUserDefaults, "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v3)
    v5 = 64;
  else
    v5 = 0;
  objc_msgSend(v4, "setPreferredMusicLowBandwidthResolution:", v5);

}

- (BOOL)isVideoCellularStreamingAllowed
{
  NSObject *accessQueue;
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
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__MPNetworkObserver_isVideoCellularStreamingAllowed__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setVideoCellularStreamingAllowed:(BOOL)a3
{
  NSObject *accessQueue;
  void *v5;
  _QWORD block[6];
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MPNetworkObserver_setVideoCellularStreamingAllowed___block_invoke;
  block[3] = &unk_1E315E700;
  v7 = a3;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(accessQueue, block);
  if (*((_BYTE *)v9 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("MPNetworkObserverIsVideoCellularStreamingAllowedDidChangeNotification"), self);

  }
  _Block_object_dispose(&v8, 8);
}

- (BOOL)isMusicCellularDownloadingAllowed
{
  return CFPreferencesGetAppBooleanValue(CFSTR("AllowsCellularDataDownloads"), CFSTR("com.apple.Music"), 0) != 0;
}

- (void)setMusicCellularDownloadingAllowed:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  CFPropertyListRef *v5;
  __CFString *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446722;
    v9 = "-[MPNetworkObserver setMusicCellularDownloadingAllowed:]";
    v10 = 2114;
    v11 = CFSTR("AllowsCellularDataDownloads");
    v12 = 1024;
    v13 = v3;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: Changing %{public}@ preference to %{BOOL}u.", (uint8_t *)&v8, 0x1Cu);
  }

  v5 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
  if (!v3)
    v5 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
  CFPreferencesSetAppValue(CFSTR("AllowsCellularDataDownloads"), *v5, CFSTR("com.apple.Music"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.Music"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.Music-AllowsCellularDataDownloads");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v6, 0, 0, 1u);

}

- (BOOL)isStoreCellularNetworkingAllowed
{
  return CFPreferencesGetAppBooleanValue(CFSTR("AllowAutoDownloadOnCellular"), CFSTR("com.apple.itunesstored"), 0) != 0;
}

- (BOOL)isUsingNetwork
{
  NSObject *accessQueue;
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
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__MPNetworkObserver_isUsingNetwork__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

uint64_t __35__MPNetworkObserver_isUsingNetwork__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 16) > 0;
  return result;
}

uint64_t __54__MPNetworkObserver_setVideoCellularStreamingAllowed___block_invoke(uint64_t result)
{
  if (*(unsigned __int8 *)(*(_QWORD *)(result + 32) + 32) != *(unsigned __int8 *)(result + 48))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(result + 32) + 32) = *(_BYTE *)(result + 48);
    CFPreferencesSetAppValue(CFSTR("CellularDataMode"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(result + 32) + 32)), CFSTR("com.apple.videos-preferences"));
    return CFPreferencesAppSynchronize(CFSTR("com.apple.videos-preferences"));
  }
  return result;
}

uint64_t __52__MPNetworkObserver_isVideoCellularStreamingAllowed__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

void __36__MPNetworkObserver_endUsingNetwork__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 16);
  v3 = v2 < 1;
  v4 = v2 - 1;
  if (!v3)
  {
    *(_QWORD *)(v1 + 16) = v4;
    v5 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v5 + 16))
    {
      dispatch_get_global_queue(0, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __36__MPNetworkObserver_endUsingNetwork__block_invoke_2;
      block[3] = &unk_1E3163508;
      block[4] = v5;
      dispatch_async(v6, block);

    }
  }
}

void __36__MPNetworkObserver_endUsingNetwork__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MPNetworkObserverIsUsingNetworkDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __38__MPNetworkObserver_beginUsingNetwork__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 16) == 1)
  {
    dispatch_get_global_queue(0, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__MPNetworkObserver_beginUsingNetwork__block_invoke_2;
    block[3] = &unk_1E3163508;
    block[4] = v1;
    dispatch_async(v2, block);

  }
}

void __38__MPNetworkObserver_beginUsingNetwork__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MPNetworkObserverIsUsingNetworkDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __26__MPNetworkObserver__init__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CFPreferencesAppSynchronize(CFSTR("com.apple.mobileipod"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "postNotificationName:object:", CFSTR("MPNetworkObserverIsMusicCellularStreamingAllowedDidChangeNotification"), WeakRetained);

  }
}

void __26__MPNetworkObserver__init__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CFPreferencesAppSynchronize(CFSTR("com.apple.Music"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "postNotificationName:object:", CFSTR("MPNetworkObserverIsMusicCellularDownloadingAllowedDidChangeNotification"), WeakRetained);

  }
}

void __26__MPNetworkObserver__init__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  BOOL v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;
  char v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    CFPreferencesAppSynchronize(CFSTR("com.apple.videos-preferences"));
    v3 = CFPreferencesGetAppBooleanValue(CFSTR("CellularDataMode"), CFSTR("com.apple.videos-preferences"), 0) == 0;
    WeakRetained = v8;
    v4 = !v3;
    v5 = *(_QWORD *)(a1 + 32);
    if (*(unsigned __int8 *)(v5 + 32) != v4)
    {
      v6 = *(NSObject **)(v5 + 24);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __26__MPNetworkObserver__init__block_invoke_4;
      block[3] = &unk_1E3163468;
      v10 = (id)v5;
      v11 = v4;
      dispatch_sync(v6, block);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "postNotificationName:object:", CFSTR("MPNetworkObserverIsVideoCellularStreamingAllowedDidChangeNotification"), v8);

      WeakRetained = v8;
    }
  }

}

uint64_t __26__MPNetworkObserver__init__block_invoke_4(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 32) = *(_BYTE *)(result + 40);
  return result;
}

@end
