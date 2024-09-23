@implementation MPAVTelevisionRoutingDataSource

- (MPAVTelevisionRoutingDataSource)init
{
  MPAVTelevisionRoutingDataSource *v2;
  NSMutableArray *v3;
  NSMutableArray *discoveredTelevisions;
  dispatch_queue_t v5;
  OS_dispatch_queue *serialQueue;
  id v8[5];
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MPAVTelevisionRoutingDataSource;
  v2 = -[MPAVRoutingDataSource init](&v11, sel_init);
  if (v2)
  {
    v2->_discoveryController = (void *)MRTelevisionControllerCreate();
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    discoveredTelevisions = v2->_discoveredTelevisions;
    v2->_discoveredTelevisions = v3;

    v5 = dispatch_queue_create("com.apple.MediaPlayer.MPAVTelevisionRoutingDataSource/serialQueue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    objc_initWeak(&location, v2);
    v8[1] = (id)MEMORY[0x1E0C809B0];
    v8[2] = (id)3221225472;
    v8[3] = __39__MPAVTelevisionRoutingDataSource_init__block_invoke;
    v8[4] = &unk_1E3153AF0;
    objc_copyWeak(&v9, &location);
    MRTelevisionControllerSetDiscoveryCallback();
    objc_copyWeak(v8, &location);
    MRTelevisionControllerSetRemovalCallback();
    objc_destroyWeak(v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  MRTelevisionControllerSetDiscoveryCallback();
  MRTelevisionControllerSetRemovalCallback();
  CFRelease(self->_discoveryController);
  v3.receiver = self;
  v3.super_class = (Class)MPAVTelevisionRoutingDataSource;
  -[MPAVRoutingDataSource dealloc](&v3, sel_dealloc);
}

- (void)setDiscoveryMode:(int64_t)a3
{
  int IsDiscoveringDevices;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *discoveryController;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)MPAVTelevisionRoutingDataSource;
  -[MPAVRoutingDataSource setDiscoveryMode:](&v10, sel_setDiscoveryMode_);
  IsDiscoveringDevices = MRTelevisionControllerIsDiscoveringDevices();
  if (!a3 || (IsDiscoveringDevices & 1) != 0)
  {
    if (IsDiscoveringDevices)
    {
      v8 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        discoveryController = self->_discoveryController;
        *(_DWORD *)buf = 138543362;
        v12 = discoveryController;
        _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "[TelevisionRoutingDataSource] Ending discovery with controller: %{public}@", buf, 0xCu);
      }

      MRTelevisionControllerEndDiscovery();
    }
  }
  else
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = self->_discoveryController;
      *(_DWORD *)buf = 138543362;
      v12 = v7;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "[TelevisionRoutingDataSource] Beginning discovery using controller: %{public}@", buf, 0xCu);
    }

    MRTelevisionControllerBeginDiscovery();
  }
}

- (BOOL)devicePresenceDetected
{
  void *v2;
  BOOL v3;

  -[MPAVTelevisionRoutingDataSource _discoveredTelevisions](self, "_discoveredTelevisions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)getRoutesForCategory:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  MPAVTelevisionRoute *v11;
  MPAVTelevisionRoute *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[MPAVTelevisionRoutingDataSource _discoveredTelevisions](self, "_discoveredTelevisions", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [MPAVTelevisionRoute alloc];
        v12 = -[MPAVTelevisionRoute initWithTelevision:](v11, "initWithTelevision:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)getPickedRouteHasVolumeControlWithCompletion:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (id)_discoveredTelevisions
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
  v9 = __Block_byref_object_copy__3218;
  v10 = __Block_byref_object_dispose__3219;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__MPAVTelevisionRoutingDataSource__discoveredTelevisions__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_onQueue_controllerDidDiscoverTelevision:(void *)a3
{
  id v4;

  -[NSMutableArray addObject:](self->_discoveredTelevisions, "addObject:", a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("MPAVRoutingDataSourceRoutesDidChangeNotification"), self);

}

- (void)_onQueue_controllerDidRemoveTelevision:(void *)a3
{
  id v4;

  -[NSMutableArray removeObject:](self->_discoveredTelevisions, "removeObject:", a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("MPAVRoutingDataSourceRoutesDidChangeNotification"), self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_discoveredTelevisions, 0);
}

void __57__MPAVTelevisionRoutingDataSource__discoveredTelevisions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __39__MPAVTelevisionRoutingDataSource_init__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_onQueue_controllerDidDiscoverTelevision:", a2);

}

void __39__MPAVTelevisionRoutingDataSource_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_onQueue_controllerDidRemoveTelevision:", a2);

}

@end
