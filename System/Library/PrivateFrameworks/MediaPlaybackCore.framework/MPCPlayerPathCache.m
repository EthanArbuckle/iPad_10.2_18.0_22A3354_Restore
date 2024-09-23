@implementation MPCPlayerPathCache

- (id)resolvedPlayerPathForPlayerPath:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__23624;
  v16 = __Block_byref_object_dispose__23625;
  v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__MPCPlayerPathCache_resolvedPlayerPathForPlayerPath___block_invoke;
  block[3] = &unk_24CAB85F0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

+ (MPCPlayerPathCache)sharedCache
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__MPCPlayerPathCache_sharedCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCache___onceToken != -1)
    dispatch_once(&sharedCache___onceToken, block);
  return (MPCPlayerPathCache *)(id)sharedCache___sharedCache;
}

void __54__MPCPlayerPathCache_resolvedPlayerPathForPlayerPath___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  MPCFuture *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v12;
  _QWORD v13[5];
  __int128 v14;
  _QWORD v15[5];
  id v16;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  if (!v5 || objc_msgSend(v5, "isInvalid"))
  {
    v6 = -[MPCFuture initWithQueue:]([MPCFuture alloc], "initWithQueue:", *(_QWORD *)(a1[4] + 48));
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setDebugLabel:", CFSTR("resolvedPlayerPath"));
    objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[5]);
    v9 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __54__MPCPlayerPathCache_resolvedPlayerPathForPlayerPath___block_invoke_2;
    v15[3] = &unk_24CAB8618;
    v10 = (void *)a1[5];
    v15[4] = a1[4];
    v16 = v10;
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __54__MPCPlayerPathCache_resolvedPlayerPathForPlayerPath___block_invoke_4;
    v13[3] = &unk_24CAB8670;
    v13[4] = a1[4];
    v12 = *(_OWORD *)(a1 + 5);
    v11 = (id)v12;
    v14 = v12;
    objc_msgSend(v16, "resolveWithRouteResolvedHandler:completion:", v15, v13);

  }
}

void __54__MPCPlayerPathCache_resolvedPlayerPathForPlayerPath___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t v16;
  __int128 v17;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 40);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__MPCPlayerPathCache_resolvedPlayerPathForPlayerPath___block_invoke_5;
  block[3] = &unk_24CAB8648;
  v14 = v6;
  v15 = v5;
  v16 = v7;
  v12 = *(_OWORD *)(a1 + 40);
  v9 = (id)v12;
  v17 = v12;
  v10 = v5;
  v11 = v6;
  dispatch_async(v8, block);

}

void __54__MPCPlayerPathCache_resolvedPlayerPathForPlayerPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 40);
  v4 = v3;
  msv_dispatch_sync_on_queue();

}

- (void)_onQueue_registerForEndpointInvalidationsWithUnresolvedPlayerPath:(id)a3 routeResolvedPlayerPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  objc_msgSend(v7, "route");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "route");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endpoint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v11, "debugName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v26 = v6;
        v27 = 2112;
        v28 = v14;
        _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEBUG, "MRCPPC: Registering for endpoint invalidations unresolved player path: %@, endpoint: %@", buf, 0x16u);

      }
      objc_initWeak((id *)buf, self);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __112__MPCPlayerPathCache__onQueue_registerForEndpointInvalidationsWithUnresolvedPlayerPath_routeResolvedPlayerPath___block_invoke;
      v22 = &unk_24CAB8710;
      objc_copyWeak(&v24, (id *)buf);
      v16 = *MEMORY[0x24BDDCD20];
      v17 = v6;
      v23 = v17;
      objc_msgSend(v15, "addObserverForName:object:queue:usingBlock:", v16, v12, 0, &v19);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_endpointInvalidationObservers, "setObject:forKeyedSubscript:", v18, v17, v19, v20, v21, v22);
      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)buf);
    }

  }
}

uint64_t __54__MPCPlayerPathCache_resolvedPlayerPathForPlayerPath___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_registerForInvalidationWithUnresolvedPlayerPath:invalidationPlayerPath:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "mediaRemotePlayerPath"));
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_registerForEndpointChangeWithUnresolvedPlayerPath:routeResolvedPlayerPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_registerForEndpointInvalidationsWithUnresolvedPlayerPath:routeResolvedPlayerPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_onQueue_registerForInvalidationWithUnresolvedPlayerPath:(id)a3 invalidationPlayerPath:(void *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id location;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  objc_initWeak(&location, self);
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v13 = a4;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEBUG, "MRCPPC: Registering for invalidation with player path %@ (unresolved %@)", buf, 0x16u);
  }

  objc_copyWeak(&v10, &location);
  v9 = v6;
  v8 = (void *)MRMediaRemoteAddPlayerPathInvalidationHandler();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_playerPathObservers, "setObject:forKeyedSubscript:", v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)_onQueue_registerForEndpointChangeWithUnresolvedPlayerPath:(id)a3 routeResolvedPlayerPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  objc_msgSend(v6, "deviceUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "route");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v7, "route");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "endpoint");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v20 = v6;
        v21 = 2112;
        v22 = v13;
        _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEBUG, "MRCPPC: Registering for endpoint topology changes with unresolved player path: %@, endpoint identifier: %@", buf, 0x16u);
      }

      objc_initWeak((id *)buf, self);
      v15 = (void *)MRAVEndpointObserverCreateWithOutputDeviceUID();
      objc_copyWeak(&v18, (id *)buf);
      v16 = v6;
      v17 = v13;
      MRAVEndpointObserverAddEndpointChangedCallback();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_endpointObservers, "setObject:forKeyedSubscript:", v15, v16);

      MEMORY[0x212BD1980](v15);
      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);

    }
  }

}

void __54__MPCPlayerPathCache_resolvedPlayerPathForPlayerPath___block_invoke_5(_QWORD *a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)a1[4];
  if (v2)
  {
    v3 = v2;
LABEL_3:
    v4 = v3;
    objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "finishWithError:", v3);
    objc_msgSend(*(id *)(a1[6] + 8), "setObject:forKeyedSubscript:", 0, a1[7]);

    return;
  }
  if (!a1[5])
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlayerRequestError"), 5000, CFSTR("resolvedPlayerPath and error was nil"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "finishWithValue:");
}

void __33__MPCPlayerPathCache_sharedCache__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_USER_INITIATED, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("com.apple.MediaPlaybackCore/MRNowPlayingNotificationQueue", v3);
  v5 = (void *)__mediaRemoteNotificationQueue;
  __mediaRemoteNotificationQueue = (uint64_t)v4;

  v6 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v7 = (void *)sharedCache___sharedCache;
  sharedCache___sharedCache = v6;

}

- (id)_init
{
  MPCPlayerPathCache *v2;
  uint64_t v3;
  NSMutableDictionary *playerPathResolutions;
  uint64_t v5;
  NSMutableDictionary *playerPathObservers;
  uint64_t v7;
  NSMutableDictionary *endpointObservers;
  uint64_t v9;
  NSMutableDictionary *endpointInvalidationObservers;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *accessQueue;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *calloutQueue;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MPCPlayerPathCache;
  v2 = -[MPCPlayerPathCache init](&v18, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    playerPathResolutions = v2->_playerPathResolutions;
    v2->_playerPathResolutions = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    playerPathObservers = v2->_playerPathObservers;
    v2->_playerPathObservers = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    endpointObservers = v2->_endpointObservers;
    v2->_endpointObservers = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    endpointInvalidationObservers = v2->_endpointInvalidationObservers;
    v2->_endpointInvalidationObservers = (NSMutableDictionary *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.MediaPlaybackCore/MPCPlayerPathCache", v11);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.MediaPlaybackCore/MPCPlayerPathCache.callout", v14);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v15;

    _MRMediaRemoteRegisterForNowPlayingNotificationsEx();
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  MRMediaRemoteUnregisterForNowPlayingNotifications();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMutableDictionary allValues](self->_playerPathObservers, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        MRMediaRemoteRemovePlayerPathInvalidationHandler();
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)MPCPlayerPathCache;
  -[MPCPlayerPathCache dealloc](&v8, sel_dealloc);
}

- (id)observationTokenDescriptionForPlayerPath:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__23624;
  v16 = __Block_byref_object_dispose__23625;
  v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__MPCPlayerPathCache_observationTokenDescriptionForPlayerPath___block_invoke;
  block[3] = &unk_24CAB85F0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)_onQueue_clearObserversForPlayerPath:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_endpointObservers, "objectForKeyedSubscript:");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    MEMORY[0x212BD1998](v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_endpointObservers, "setObject:forKeyedSubscript:", 0, v9);
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_playerPathObservers, "objectForKeyedSubscript:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    MRMediaRemoteRemovePlayerPathInvalidationHandler();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_playerPathObservers, "setObject:forKeyedSubscript:", 0, v9);
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_endpointInvalidationObservers, "objectForKeyedSubscript:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:", v7);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_endpointInvalidationObservers, "setObject:forKeyedSubscript:", 0, v9);
  }

}

- (NSMutableDictionary)playerPathResolutions
{
  return self->_playerPathResolutions;
}

- (NSMutableDictionary)playerPathObservers
{
  return self->_playerPathObservers;
}

- (NSMutableDictionary)endpointObservers
{
  return self->_endpointObservers;
}

- (NSMutableDictionary)endpointInvalidationObservers
{
  return self->_endpointInvalidationObservers;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_endpointInvalidationObservers, 0);
  objc_storeStrong((id *)&self->_endpointObservers, 0);
  objc_storeStrong((id *)&self->_playerPathObservers, 0);
  objc_storeStrong((id *)&self->_playerPathResolutions, 0);
}

void __112__MPCPlayerPathCache__onQueue_registerForEndpointInvalidationsWithUnresolvedPlayerPath_routeResolvedPlayerPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  _QWORD *v8;
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[5];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __112__MPCPlayerPathCache__onQueue_registerForEndpointInvalidationsWithUnresolvedPlayerPath_routeResolvedPlayerPath___block_invoke_2;
    block[3] = &unk_24CABAA28;
    v8 = WeakRetained;
    v9 = *(id *)(a1 + 32);
    v10 = v3;
    dispatch_async(v6, block);

  }
}

void __112__MPCPlayerPathCache__onQueue_registerForEndpointInvalidationsWithUnresolvedPlayerPath_routeResolvedPlayerPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_DEBUG, "MRCPPC: Received invalidation for player path: %@, endpoint %@ ", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(v2, "invalidate");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearObserversForPlayerPath:", *(_QWORD *)(a1 + 40));

}

void __105__MPCPlayerPathCache__onQueue_registerForEndpointChangeWithUnresolvedPlayerPath_routeResolvedPlayerPath___block_invoke(id *a1, uint64_t a2)
{
  _QWORD *WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  _QWORD *v8;
  id v9;
  id v10;
  uint64_t v11;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[5];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __105__MPCPlayerPathCache__onQueue_registerForEndpointChangeWithUnresolvedPlayerPath_routeResolvedPlayerPath___block_invoke_2;
    v7[3] = &unk_24CAB86C0;
    v8 = WeakRetained;
    v9 = a1[4];
    v11 = a2;
    v10 = a1[5];
    dispatch_async(v6, v7);

  }
}

void __105__MPCPlayerPathCache__onQueue_registerForEndpointChangeWithUnresolvedPlayerPath_routeResolvedPlayerPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(id *)(a1 + 56);
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 48));

  if ((v5 & 1) == 0)
  {
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEBUG, "MRCPPC: Received endpoint invalidation for unresolved player path: %@.", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(v2, "invalidate");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearObserversForPlayerPath:", *(_QWORD *)(a1 + 40));
  }

}

void __102__MPCPlayerPathCache__onQueue_registerForInvalidationWithUnresolvedPlayerPath_invalidationPlayerPath___block_invoke(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[1], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "result");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412546;
      v10 = a2;
      v11 = 2112;
      v12 = objc_msgSend(v7, "mediaRemotePlayerPath");
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEBUG, "MRCPPC: Received invalidation for player path %@ (future player path: %@)", (uint8_t *)&v9, 0x16u);
    }

    objc_msgSend(v6, "invalidate");
    objc_msgSend(v5[1], "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));
    objc_msgSend(v5, "_onQueue_clearObserversForPlayerPath:", *(_QWORD *)(a1 + 32));

  }
}

void __63__MPCPlayerPathCache_observationTokenDescriptionForPlayerPath___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
