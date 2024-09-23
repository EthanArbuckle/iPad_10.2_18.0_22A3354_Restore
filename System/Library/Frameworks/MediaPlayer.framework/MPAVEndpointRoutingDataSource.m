@implementation MPAVEndpointRoutingDataSource

- (id)getRoutesForCategory:(id)a3
{
  NSObject *serialQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__39886;
  v11 = __Block_byref_object_dispose__39887;
  v12 = 0;
  serialQueue = self->_serialQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__MPAVEndpointRoutingDataSource_getRoutesForCategory___block_invoke;
  v6[3] = &unk_1E3163580;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(serialQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (MPAVEndpointRoutingDataSource)init
{
  return -[MPAVEndpointRoutingDataSource initWithThrottlingEnabled:](self, "initWithThrottlingEnabled:", 0);
}

void __54__MPAVEndpointRoutingDataSource_getRoutesForCategory___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  MPAVEndpointRoute *v11;
  MPMRAVEndpointWrapper *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  MPAVRouteConnection *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id obj;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeAllObjects");
  v21 = a1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "availableEndpoints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v8, "uniqueIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v9);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (MPAVEndpointRoute *)v10;
          v12 = -[MPMRAVEndpointWrapper initWithMRAVEndpoint:]([MPMRAVEndpointWrapper alloc], "initWithMRAVEndpoint:", v8);
          -[MPAVEndpointRoute setEndpointWrapper:](v11, "setEndpointWrapper:", v12);

        }
        else
        {
          v11 = -[MPAVEndpointRoute initWithEndpoint:]([MPAVEndpointRoute alloc], "initWithEndpoint:", v8);
        }
        objc_msgSend(v8, "externalDevice");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[MPAVEndpointRoute connection](v11, "connection");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "externalDevice");

        if ((void *)v15 != v13)
        {
          if (v13)
          {
            v16 = -[MPAVRouteConnection initWithExternalDevice:]([MPAVRouteConnection alloc], "initWithExternalDevice:", v13);
            -[MPAVEndpointRoute setConnection:](v11, "setConnection:", v16);

          }
          else
          {
            -[MPAVEndpointRoute setConnection:](v11, "setConnection:", 0);
          }
        }
        objc_msgSend(*(id *)(*(_QWORD *)(v21 + 32) + 104), "setObject:forKeyedSubscript:", v11, v9);
        objc_msgSend(v3, "addObject:", v11);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }

  v17 = objc_msgSend(v3, "copy");
  v18 = *(_QWORD *)(*(_QWORD *)(v21 + 40) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

}

- (void)setDiscoveryMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3)
    a3 = a3;
  else
    a3 = 0;
  -[MRAVRoutingDiscoverySession setDiscoveryMode:](self->_discoverySession, "setDiscoveryMode:", a3);
}

uint64_t __63__MPAVEndpointRoutingDataSource_setDidReceiveDiscoveryResults___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 80) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __59__MPAVEndpointRoutingDataSource_didReceiveDiscoveryResults__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

- (MPAVEndpointRoutingDataSource)initWithThrottlingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  MPAVEndpointRoutingDataSource *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *endpoints;
  dispatch_queue_t v7;
  OS_dispatch_queue *serialQueue;
  void *v9;
  uint64_t v10;
  MRAVRoutingDiscoverySession *discoverySession;
  objc_super v13;

  v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPAVEndpointRoutingDataSource;
  v4 = -[MPAVRoutingDataSource init](&v13, sel_init);
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    endpoints = v4->_endpoints;
    v4->_endpoints = v5;

    v7 = dispatch_queue_create("com.apple.MediaPlayer.MPAVEndpointRoutingDataSource/serialQueue", 0);
    serialQueue = v4->_serialQueue;
    v4->_serialQueue = (OS_dispatch_queue *)v7;

    -[MPAVEndpointRoutingDataSource discoverySessionConfiguration](v4, "discoverySessionConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEnableThrottling:", v3);
    v4->_suppressNotifications = 0;
    objc_msgSend(MEMORY[0x1E0D4C500], "discoverySessionWithConfiguration:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    discoverySession = v4->_discoverySession;
    v4->_discoverySession = (MRAVRoutingDiscoverySession *)v10;

    if (!v4->_suppressNotifications)
      -[MPAVEndpointRoutingDataSource _setDiscoverySessionCallback](v4, "_setDiscoverySessionCallback");

  }
  return v4;
}

- (void)_setDiscoverySessionCallback
{
  MRAVRoutingDiscoverySession *discoverySession;
  void *v4;
  id callbackToken;
  _QWORD v6[4];
  id v7;
  id location;

  if (!self->_callbackToken)
  {
    objc_initWeak(&location, self);
    discoverySession = self->_discoverySession;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61__MPAVEndpointRoutingDataSource__setDiscoverySessionCallback__block_invoke;
    v6[3] = &unk_1E31615F8;
    objc_copyWeak(&v7, &location);
    -[MRAVRoutingDiscoverySession addEndpointsChangedCallback:](discoverySession, "addEndpointsChangedCallback:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    callbackToken = self->_callbackToken;
    self->_callbackToken = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (MRAVRoutingDiscoverySessionConfiguration)discoverySessionConfiguration
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4C508]), "initWithEndpointFeatures:", 8);
  objc_msgSend(v3, "setTargetAudioSessionID:", -[MPAVEndpointRoutingDataSource targetSessionID](self, "targetSessionID"));
  return (MRAVRoutingDiscoverySessionConfiguration *)v3;
}

- (unsigned)targetSessionID
{
  return self->_targetSessionID;
}

void __61__MPAVEndpointRoutingDataSource__setDiscoverySessionCallback__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (objc_msgSend(v4, "count"))
      objc_msgSend(WeakRetained, "setDidReceiveDiscoveryResults:", 1);
    objc_msgSend(WeakRetained, "_endpointsDidChange:", v4);
  }

}

- (BOOL)didReceiveDiscoveryResults
{
  MPAVEndpointRoutingDataSource *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[MPAVEndpointRoutingDataSource serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__MPAVEndpointRoutingDataSource_didReceiveDiscoveryResults__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setDidReceiveDiscoveryResults:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[MPAVEndpointRoutingDataSource serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__MPAVEndpointRoutingDataSource_setDidReceiveDiscoveryResults___block_invoke;
  v6[3] = &unk_1E3163468;
  v6[4] = self;
  v7 = a3;
  dispatch_sync(v5, v6);

}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)_endpointsDidChange:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("MPAVRoutingDataSourceRoutesDidChangeNotification"), self);

}

- (void)dealloc
{
  objc_super v3;

  -[MRAVRoutingDiscoverySession removeEndpointsChangedCallback:](self->_discoverySession, "removeEndpointsChangedCallback:", self->_callbackToken);
  v3.receiver = self;
  v3.super_class = (Class)MPAVEndpointRoutingDataSource;
  -[MPAVRoutingDataSource dealloc](&v3, sel_dealloc);
}

- (void)setSuppressNotifications:(BOOL)a3
{
  if (a3)
    -[MPAVEndpointRoutingDataSource _clearDiscoverySessionCallback](self, "_clearDiscoverySessionCallback");
  else
    -[MPAVEndpointRoutingDataSource _setDiscoverySessionCallback](self, "_setDiscoverySessionCallback");
  self->_suppressNotifications = a3;
}

- (void)setTargetSessionID:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  MPAVEndpointRoutingDataSource *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_targetSessionID != a3)
  {
    v3 = *(_QWORD *)&a3;
    v5 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543874;
      v8 = objc_opt_class();
      v9 = 2048;
      v10 = self;
      v11 = 1026;
      v12 = v3;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p>_targetSessionID setting target session ID = %{public}d", (uint8_t *)&v7, 0x1Cu);
    }

    self->_targetSessionID = v3;
    -[MRAVRoutingDiscoverySession setTargetAudioSessionID:](self->_discoverySession, "setTargetAudioSessionID:", v3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("MPAVRoutingDataSourceRoutesDidChangeNotification"), self);

  }
}

- (void)setRoutingContextUID:(id)a3
{
  id v5;
  NSObject *v6;
  NSString *v7;
  NSString *routingContextUID;
  void *v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  MPAVEndpointRoutingDataSource *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPAVEndpointRoutingDataSource.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("routingContextUID"));

  }
  if (!-[NSString isEqualToString:](self->_routingContextUID, "isEqualToString:", v5))
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v12 = objc_opt_class();
      v13 = 2048;
      v14 = self;
      v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> setting routing context UID = %{public}@", buf, 0x20u);
    }

    v7 = (NSString *)objc_msgSend(v5, "copy");
    routingContextUID = self->_routingContextUID;
    self->_routingContextUID = v7;

    -[MRAVRoutingDiscoverySession setRoutingContextUID:](self->_discoverySession, "setRoutingContextUID:", self->_routingContextUID);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("MPAVRoutingDataSourceRoutesDidChangeNotification"), self);

  }
}

- (int64_t)discoveryMode
{
  uint64_t v2;

  v2 = -[MRAVRoutingDiscoverySession discoveryMode](self->_discoverySession, "discoveryMode") - 1;
  if (v2 < 3)
    return v2 + 1;
  else
    return 0;
}

- (BOOL)devicePresenceDetected
{
  return -[MRAVRoutingDiscoverySession devicePresenceDetected](self->_discoverySession, "devicePresenceDetected");
}

- (void)setPickedRoute:(id)a3 withPassword:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  const void *v12;
  void *v13;
  NSString *routingContextUID;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "routeUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (const void *)MRAVRouteQueryCreate();
    MRAVRouteQuerySetRouteUID();
    v21 = v10;
    MRMediaRemoteFindAndPickRoute();
    CFRelease(v12);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)MEMORY[0x1E0D4C4E0];
      routingContextUID = self->_routingContextUID;
      v15 = v8;
      objc_msgSend(v13, "sharedLocalEndpointForRoutingContextWithUID:", routingContextUID);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "endpointObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "outputDevices");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setOutputDevices:initiator:withReplyQueue:completion:", v18, v20, MEMORY[0x1E0C80D38], v10);

    }
  }

}

- (void)_clearDiscoverySessionCallback
{
  id callbackToken;

  if (self->_callbackToken)
  {
    -[MRAVRoutingDiscoverySession removeEndpointsChangedCallback:](self->_discoverySession, "removeEndpointsChangedCallback:");
    callbackToken = self->_callbackToken;
    self->_callbackToken = 0;

  }
}

- (NSString)routingContextUID
{
  return self->_routingContextUID;
}

- (BOOL)suppressNotifications
{
  return self->_suppressNotifications;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (NSMutableDictionary)endpoints
{
  return self->_endpoints;
}

- (void)setEndpoints:(id)a3
{
  objc_storeStrong((id *)&self->_endpoints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_routingContextUID, 0);
  objc_storeStrong(&self->_callbackToken, 0);
  objc_storeStrong((id *)&self->_discoverySession, 0);
}

uint64_t __72__MPAVEndpointRoutingDataSource_setPickedRoute_withPassword_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  uint64_t result;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  v5 = v4;
  if (a2)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v11 = 138412290;
    v12 = a2;
    v6 = "[EndpointRoutingDataSource] Route search failed with error: %@";
    v7 = v5;
    v8 = OS_LOG_TYPE_ERROR;
    v9 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    LOWORD(v11) = 0;
    v6 = "[EndpointRoutingDataSource] Successfully found and picked route.";
    v7 = v5;
    v8 = OS_LOG_TYPE_DEFAULT;
    v9 = 2;
  }
  _os_log_impl(&dword_193B9B000, v7, v8, v6, (uint8_t *)&v11, v9);
LABEL_7:

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

@end
