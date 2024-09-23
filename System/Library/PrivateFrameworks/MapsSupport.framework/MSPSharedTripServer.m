@implementation MSPSharedTripServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  MSPSharedTripPeer *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  BOOL v18;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  _BOOL4 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v6 = a4;
  v7 = -[MSPSharedTripPeer initWithConnection:]([MSPSharedTripPeer alloc], "initWithConnection:", v6);
  if (-[MSPSharedTripPeer canControlSharing](v7, "canControlSharing")
    || -[MSPSharedTripPeer canControlReceiving](v7, "canControlReceiving"))
  {
    -[NSMapTable setObject:forKey:](self->_peersByConnection, "setObject:forKey:", v7, v6);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF07C810);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0, v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v8, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_fetchSharedTripsWithCompletion_, 0, 1);

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v8, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_checkinWithCompletion_, 2, 1);

    objc_msgSend(v6, "setExportedInterface:", v8);
    objc_msgSend(v6, "setExportedObject:", self);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF08A868);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRemoteObjectInterface:", v15);

    objc_msgSend(v6, "_setQueue:", MEMORY[0x1E0C80D38]);
    MSPGetSharedTripLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v29 = v6;
      v30 = 1024;
      v31 = -[MSPSharedTripPeer canControlSharing](v7, "canControlSharing");
      v32 = 1024;
      v33 = -[MSPSharedTripPeer canControlReceiving](v7, "canControlReceiving");
      _os_log_impl(&dword_1B39C0000, v16, OS_LOG_TYPE_DEBUG, "[Server] Accepting new connection: %@, can share: %d, can receive: %d", buf, 0x18u);
    }

    objc_initWeak((id *)buf, v6);
    objc_initWeak(&location, self);
    v17 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __58__MSPSharedTripServer_listener_shouldAcceptNewConnection___block_invoke;
    v24[3] = &unk_1E6651B78;
    objc_copyWeak(&v25, (id *)buf);
    objc_copyWeak(&v26, &location);
    objc_msgSend(v6, "setInvalidationHandler:", v24);
    v21[0] = v17;
    v21[1] = 3221225472;
    v21[2] = __58__MSPSharedTripServer_listener_shouldAcceptNewConnection___block_invoke_124;
    v21[3] = &unk_1E6651B78;
    objc_copyWeak(&v22, (id *)buf);
    objc_copyWeak(&v23, &location);
    objc_msgSend(v6, "setInterruptionHandler:", v21);
    -[NSMutableSet addObject:](self->_connections, "addObject:", v6);
    objc_msgSend(v6, "resume");
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
    v18 = 1;
  }
  else
  {
    MSPGetSharedTripLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v6;
      _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_ERROR, "[Server] will not accept connection due to missing entitlements: %@", buf, 0xCu);
    }
    v18 = 0;
  }

  return v18;
}

- (MSPSharedTripServer)init
{
  MSPSharedTripServer *v2;
  MSPSharedTripServer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSPSharedTripServer;
  v2 = -[MSPSharedTripServer init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MSPSharedTripServer createControllers](v2, "createControllers");
    -[MSPSharedTripServer createXPCListener](v3, "createXPCListener");
  }
  return v3;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[MSPSharedTripServer cleanConnections](self, "cleanConnections");
  MSPGetSharedTripLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    v6 = "-[MSPSharedTripServer dealloc]";
    _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEBUG, "[Server] %{private}s", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MSPSharedTripServer;
  -[MSPSharedTripServer dealloc](&v4, sel_dealloc);
}

- (void)cleanConnections
{
  NSObject *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  MSPGetSharedTripLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    v16 = "-[MSPSharedTripServer cleanConnections]";
    _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEBUG, "[Server] %{private}s", buf, 0xCu);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_connections;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v9, "invalidate", (_QWORD)v10);
        objc_msgSend(v9, "setExportedObject:", 0);
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[MSPReceiverETAController cleanTimer](self->_receivingController, "cleanTimer");
  -[NSXPCListener invalidate](self->_listener, "invalidate");
}

- (void)createXPCListener
{
  NSObject *v3;
  NSMutableSet *v4;
  NSMutableSet *connections;
  NSMapTable *v6;
  NSMapTable *peersByConnection;
  NSMutableDictionary *v8;
  NSMutableDictionary *connectionSubscriptionsByTripID;
  NSXPCListener *v10;
  NSXPCListener *listener;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_listener)
  {
    MSPGetSharedTripLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v12 = 136380675;
      v13 = "-[MSPSharedTripServer createXPCListener]";
      _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEBUG, "[Server] %{private}s", (uint8_t *)&v12, 0xCu);
    }

    v4 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 2);
    connections = self->_connections;
    self->_connections = v4;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v6 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    peersByConnection = self->_peersByConnection;
    self->_peersByConnection = v6;

    v8 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    connectionSubscriptionsByTripID = self->_connectionSubscriptionsByTripID;
    self->_connectionSubscriptionsByTripID = v8;

    v10 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.Maps.xpc.SharedTrip"));
    listener = self->_listener;
    self->_listener = v10;

    -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
    -[NSXPCListener _setQueue:](self->_listener, "_setQueue:", MEMORY[0x1E0C80D38]);
    -[NSXPCListener resume](self->_listener, "resume");
    notify_post(MSPSharedTripServerStartDarwinNotification);
  }
}

void __58__MSPSharedTripServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id *v4;
  id *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  MSPGetSharedTripLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = WeakRetained;
    _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_ERROR, "[Server] Connection invalidated: %@", (uint8_t *)&v6, 0xCu);
  }

  v4 = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4[5], "removeObject:", WeakRetained);
    objc_msgSend(v5[7], "removeObjectForKey:", WeakRetained);
    objc_msgSend(v5, "_purgeSubscriptionsForConnection:", WeakRetained);
  }

}

void __58__MSPSharedTripServer_listener_shouldAcceptNewConnection___block_invoke_124(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id *v4;
  id *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  MSPGetSharedTripLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = WeakRetained;
    _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_ERROR, "[Server] Connection interrupted: %@", (uint8_t *)&v6, 0xCu);
  }

  v4 = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4[5], "removeObject:", WeakRetained);
    objc_msgSend(v5[7], "removeObjectForKey:", WeakRetained);
    objc_msgSend(v5, "_purgeSubscriptionsForConnection:", WeakRetained);
  }

}

- (BOOL)_connectionCanControlSharing:(id)a3
{
  void *v3;
  char v4;

  -[NSMapTable objectForKey:](self->_peersByConnection, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canControlSharing");

  return v4;
}

- (BOOL)_connectionCanControlReceiving:(id)a3
{
  void *v3;
  char v4;

  -[NSMapTable objectForKey:](self->_peersByConnection, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canControlReceiving");

  return v4;
}

- (id)connections
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  return (id)-[NSMutableSet copy](self->_connections, "copy");
}

- (id)_subscribedConnectionsForTripID:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_connectionSubscriptionsByTripID, "objectForKeyedSubscript:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = 1;
    else
      v8 = !v4;
    if (!v8)
    {
      MSPGetSharedTripLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v11 = 138412290;
        v12 = v6;
        _os_log_impl(&dword_1B39C0000, v9, OS_LOG_TYPE_DEBUG, "[Server] Initialising subscriptions for trip %@", (uint8_t *)&v11, 0xCu);
      }

      v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_connectionSubscriptionsByTripID, "setObject:forKeyedSubscript:", v7, v6);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_purgeSubscriptionsForConnection:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSMutableDictionary *connectionSubscriptionsByTripID;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSObject *v16;
  MSPReceiverETAController *receivingController;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v4;
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEBUG, "[Server] Purging subscriptions for %@", buf, 0xCu);
  }

  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  connectionSubscriptionsByTripID = self->_connectionSubscriptionsByTripID;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __56__MSPSharedTripServer__purgeSubscriptionsForConnection___block_invoke;
  v26[3] = &unk_1E6651BA0;
  v20 = v4;
  v27 = v20;
  v8 = v6;
  v28 = v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](connectionSubscriptionsByTripID, "enumerateKeysAndObjectsUsingBlock:", v26);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[MSPSharedTripServer _subscribedConnectionsForTripID:createIfNeeded:](self, "_subscribedConnectionsForTripID:createIfNeeded:", v14, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v15, "count"))
        {
          MSPGetSharedTripLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v14;
            _os_log_impl(&dword_1B39C0000, v16, OS_LOG_TYPE_DEFAULT, "[Server] Unsubscribing from trip %@, no more connections", buf, 0xCu);
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_connectionSubscriptionsByTripID, "setObject:forKeyedSubscript:", 0, v14);
          receivingController = self->_receivingController;
          v21 = 0;
          -[MSPReceiverETAController unsubscribeFromUpdatesToSharedTrip:error:](receivingController, "unsubscribeFromUpdatesToSharedTrip:error:", v14, &v21);
          v18 = v21;
          if (v18)
          {
            MSPGetSharedTripLog();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v30 = v14;
              v31 = 2112;
              v32 = v18;
              _os_log_impl(&dword_1B39C0000, v19, OS_LOG_TYPE_ERROR, "[Server] Error unsubscribing from trip %@ for purged connection: %@", buf, 0x16u);
            }

          }
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
    }
    while (v11);
  }

}

void __56__MSPSharedTripServer__purgeSubscriptionsForConnection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));
  }

}

- (void)createControllers
{
  MSPSharedTripRelay *v3;
  MSPSharedTripRelay *idsRelay;
  MSPSenderETAController *v5;
  MSPSenderETAController *sendingController;
  MSPReceiverETAController *v7;
  MSPReceiverETAController *receivingController;

  v3 = objc_alloc_init(MSPSharedTripRelay);
  idsRelay = self->_idsRelay;
  self->_idsRelay = v3;

  -[MSPSharedTripRelay setAvailabilityDelegate:](self->_idsRelay, "setAvailabilityDelegate:", self);
  v5 = -[MSPSenderETAController initWithRelay:]([MSPSenderETAController alloc], "initWithRelay:", self->_idsRelay);
  sendingController = self->_sendingController;
  self->_sendingController = v5;

  -[MSPSenderETAController setDelegate:](self->_sendingController, "setDelegate:", self);
  v7 = -[MSPReceiverETAController initWithRelay:]([MSPReceiverETAController alloc], "initWithRelay:", self->_idsRelay);
  receivingController = self->_receivingController;
  self->_receivingController = v7;

  -[MSPReceiverETAController setDelegate:](self->_receivingController, "setDelegate:", self);
}

- (void)_setNotificationCenter:(id)a3
{
  -[MSPReceiverETAController _setNotificationCenter:](self->_receivingController, "_setNotificationCenter:", a3);
}

- (void)etaController:(id)a3 didUpdateDestinationForSharedTrip:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    v19 = "-[MSPSharedTripServer etaController:didUpdateDestinationForSharedTrip:]";
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEBUG, "[Server] %{private}s", buf, 0xCu);
  }

  -[MSPSharedTripServer connections](self, "connections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v12 && -[MSPSharedTripServer _connectionCanControlReceiving:](self, "_connectionCanControlReceiving:", v12))
        {

          objc_msgSend(v12, "remoteObjectProxy");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "destinationDidUpdateForSharedTrip:", v5);
        }
        else
        {
          MSPGetSharedTripLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v19 = "-[MSPSharedTripServer etaController:didUpdateDestinationForSharedTrip:]";
            v20 = 2112;
            v21 = v12;
            _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_DEBUG, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v9);
  }

}

- (void)etaController:(id)a3 didUpdateReachedDestinationForSharedTrip:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    v19 = "-[MSPSharedTripServer etaController:didUpdateReachedDestinationForSharedTrip:]";
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEBUG, "[Server] %{private}s", buf, 0xCu);
  }

  -[MSPSharedTripServer connections](self, "connections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v12 && -[MSPSharedTripServer _connectionCanControlReceiving:](self, "_connectionCanControlReceiving:", v12))
        {

          objc_msgSend(v12, "remoteObjectProxy");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "destinationReachedDidUpdateForSharedTrip:", v5);
        }
        else
        {
          MSPGetSharedTripLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v19 = "-[MSPSharedTripServer etaController:didUpdateReachedDestinationForSharedTrip:]";
            v20 = 2112;
            v21 = v12;
            _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_DEBUG, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v9);
  }

}

- (void)etaController:(id)a3 didUpdateETAForSharedTrip:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    v19 = "-[MSPSharedTripServer etaController:didUpdateETAForSharedTrip:]";
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEBUG, "[Server] %{private}s", buf, 0xCu);
  }

  -[MSPSharedTripServer connections](self, "connections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v12 && -[MSPSharedTripServer _connectionCanControlReceiving:](self, "_connectionCanControlReceiving:", v12))
        {

          objc_msgSend(v12, "remoteObjectProxy");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "etaDidUpdateForSharedTrip:", v5);
        }
        else
        {
          MSPGetSharedTripLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v19 = "-[MSPSharedTripServer etaController:didUpdateETAForSharedTrip:]";
            v20 = 2112;
            v21 = v12;
            _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_DEBUG, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v9);
  }

}

- (void)etaController:(id)a3 didUpdateRouteForSharedTrip:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    v19 = "-[MSPSharedTripServer etaController:didUpdateRouteForSharedTrip:]";
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEBUG, "[Server] %{private}s", buf, 0xCu);
  }

  -[MSPSharedTripServer connections](self, "connections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v12 && -[MSPSharedTripServer _connectionCanControlReceiving:](self, "_connectionCanControlReceiving:", v12))
        {

          objc_msgSend(v12, "remoteObjectProxy");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "routeDidUpdateForSharedTrip:", v5);
        }
        else
        {
          MSPGetSharedTripLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v19 = "-[MSPSharedTripServer etaController:didUpdateRouteForSharedTrip:]";
            v20 = 2112;
            v21 = v12;
            _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_DEBUG, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v9);
  }

}

- (void)etaController:(id)a3 sharedTripDidBecomeAvailable:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    v19 = "-[MSPSharedTripServer etaController:sharedTripDidBecomeAvailable:]";
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEBUG, "[Server] %{private}s", buf, 0xCu);
  }

  -[MSPSharedTripServer connections](self, "connections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v12 && -[MSPSharedTripServer _connectionCanControlReceiving:](self, "_connectionCanControlReceiving:", v12))
        {

          objc_msgSend(v12, "remoteObjectProxy");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "sharedTripDidBecomeAvailable:", v5);
        }
        else
        {
          MSPGetSharedTripLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v19 = "-[MSPSharedTripServer etaController:sharedTripDidBecomeAvailable:]";
            v20 = 2112;
            v21 = v12;
            _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_DEBUG, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v9);
  }

}

- (void)etaController:(id)a3 sharedTripDidBecomeUnavailable:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    v19 = "-[MSPSharedTripServer etaController:sharedTripDidBecomeUnavailable:]";
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEBUG, "[Server] %{private}s", buf, 0xCu);
  }

  -[MSPSharedTripServer connections](self, "connections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v12 && -[MSPSharedTripServer _connectionCanControlReceiving:](self, "_connectionCanControlReceiving:", v12))
        {

          objc_msgSend(v12, "remoteObjectProxy");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "sharedTripDidBecomeUnavailable:", v5);
        }
        else
        {
          MSPGetSharedTripLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v19 = "-[MSPSharedTripServer etaController:sharedTripDidBecomeUnavailable:]";
            v20 = 2112;
            v21 = v12;
            _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_DEBUG, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v9);
  }

}

- (void)etaController:(id)a3 sharedTripDidClose:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    v19 = "-[MSPSharedTripServer etaController:sharedTripDidClose:]";
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEBUG, "[Server] %{private}s", buf, 0xCu);
  }

  -[MSPSharedTripServer connections](self, "connections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v12 && -[MSPSharedTripServer _connectionCanControlReceiving:](self, "_connectionCanControlReceiving:", v12))
        {

          objc_msgSend(v12, "remoteObjectProxy");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "sharedTripDidClose:", v5);
        }
        else
        {
          MSPGetSharedTripLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v19 = "-[MSPSharedTripServer etaController:sharedTripDidClose:]";
            v20 = 2112;
            v21 = v12;
            _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_DEBUG, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v9);
  }

}

- (void)checkinWithCompletion:(id)a3
{
  void (**v4)(id, void *, void *, void *, uint64_t);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, void *, void *, uint64_t))a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPSharedTripRelay sharingIdentity](self->_idsRelay, "sharingIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_peersByConnection, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "canControlSharing"))
  {
    -[MSPSenderETAController activeHandles](self->_sendingController, "activeHandles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  if (objc_msgSend(v7, "canControlReceiving"))
  {
    -[MSPReceiverETAController allTrips](self->_receivingController, "allTrips");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }
  MSPGetSharedTripLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend(v7, "canControlSharing"))
      v11 = "";
    else
      v11 = " (not entitled)";
    v12 = objc_msgSend(v9, "count");
    v13 = objc_msgSend(v7, "canControlReceiving");
    v17 = 138413571;
    v14 = " (not entitled)";
    if (v13)
      v14 = "";
    v18 = v5;
    v19 = 2113;
    v20 = v6;
    v21 = 2113;
    v22 = v8;
    v23 = 2080;
    v24 = v11;
    v25 = 2048;
    v26 = v12;
    v27 = 2080;
    v28 = v14;
    _os_log_impl(&dword_1B39C0000, v10, OS_LOG_TYPE_DEFAULT, "[Server] Checking in on %@ (identity: %{private}@, %{private}@%s, %lu%s trips", (uint8_t *)&v17, 0x3Eu);
  }

  v15 = objc_msgSend(v7, "canControlSharing");
  if (objc_msgSend(v7, "canControlReceiving"))
    v16 = v15 | 2;
  else
    v16 = v15;
  v4[2](v4, v6, v8, v9, v16);

}

- (void)fetchSharingIdentityWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && -[MSPSharedTripServer _connectionCanControlSharing:](self, "_connectionCanControlSharing:", v5))
  {

    -[MSPSharedTripRelay sharingIdentity](self->_idsRelay, "sharingIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MSPGetSharedTripLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138477827;
      v9 = (const char *)v5;
      _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEFAULT, "[Server] fetchSendingIdentity: %{private}@)", (uint8_t *)&v8, 0xCu);
    }

    v4[2](v4, v5);
  }
  else
  {
    MSPGetSharedTripLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[MSPSharedTripServer fetchSharingIdentityWithCompletion:]";
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (void)fetchRequiresUserConfirmationOfSharingIdentityWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, void *, void *);
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  _BYTE v13[12];
  __int16 v14;
  void *v15;
  __int16 v16;
  NSObject *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, void *, void *))a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && -[MSPSharedTripServer _connectionCanControlSharing:](self, "_connectionCanControlSharing:", v5))
  {

    +[MSPMapsDefaultsAccessor get:](MSPMapsDefaultsAccessor, "get:", CFSTR("MapsSharedETADefaultSender"));
    v6 = objc_claimAutoreleasedReturnValue();
    -[MSPSharedTripRelay sharingIdentity](self->_idsRelay, "sharingIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v5 = 0;
    }
    else
    {
      v18[0] = *MEMORY[0x1E0CB2938];
      *(_QWORD *)v13 = CFSTR("Invalid account for sharing");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v18, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.SharedTrip"), 5, v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        goto LABEL_10;
    }
    if (v6)
    {
      v10 = -[NSObject isEqual:](v6, "isEqual:", v8) ^ 1;
      goto LABEL_15;
    }
LABEL_10:
    if (v5)
    {
      MSPGetSharedTripLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v13 = 138412290;
        *(_QWORD *)&v13[4] = v5;
        _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_ERROR, "[Server] fetchRequiresUserConfirmationOfSharingIdentity failed with error: %@", v13, 0xCu);
      }
      v10 = 1;
      goto LABEL_19;
    }
    v10 = 1;
LABEL_15:
    MSPGetSharedTripLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = "NO";
      *(_DWORD *)v13 = 136315651;
      if ((_DWORD)v10)
        v12 = "YES";
      *(_QWORD *)&v13[4] = v12;
      v14 = 2113;
      v15 = v8;
      v16 = 2113;
      v17 = v6;
      _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_DEFAULT, "[Server] fetchRequiresUserConfirmationOfSharingIdentity: %s, handle: %{private}@, last confirmed: %{private}@", v13, 0x20u);
    }
LABEL_19:

    v4[2](v4, v10, v8, v5);
    goto LABEL_20;
  }
  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v13 = 136315394;
    *(_QWORD *)&v13[4] = "-[MSPSharedTripServer fetchRequiresUserConfirmationOfSharingIdentityWithCompletion:]";
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", v13, 0x16u);
  }
LABEL_20:

}

- (void)reportUserConfirmationOfSharingIdentity:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  _BYTE v13[12];
  __int16 v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && -[MSPSharedTripServer _connectionCanControlSharing:](self, "_connectionCanControlSharing:", v8))
  {

    -[MSPSharedTripRelay sharingIdentity](self->_idsRelay, "sharingIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handle");
    v10 = objc_claimAutoreleasedReturnValue();

    if ((-[NSObject isEqualToString:](v10, "isEqualToString:", v6) & 1) != 0)
    {
      +[MSPMapsDefaultsAccessor set:value:](MSPMapsDefaultsAccessor, "set:value:", CFSTR("MapsSharedETADefaultSender"), v6);
      +[MSPMapsDefaultsAccessor synchronize](MSPMapsDefaultsAccessor, "synchronize");
      MSPGetSharedTripLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v13 = 138477827;
        *(_QWORD *)&v13[4] = v6;
        _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_DEFAULT, "[Server] reportUserConfirmationOfSharingIdentity: set user-confirmed handle: %{private}@", v13, 0xCu);
      }
      v8 = 0;
    }
    else
    {
      v16[0] = *MEMORY[0x1E0CB2938];
      *(_QWORD *)v13 = CFSTR("The provided sharing handle does not match the current sharing identity");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v16, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.SharedTrip"), 6, v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      MSPGetSharedTripLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v13 = 138412290;
        *(_QWORD *)&v13[4] = v8;
        _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_ERROR, "[Server] reportUserConfirmationOfSharingIdentity failed with error: %@", v13, 0xCu);
      }
    }

    v7[2](v7, v8);
  }
  else
  {
    MSPGetSharedTripLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v13 = 136315394;
      *(_QWORD *)&v13[4] = "-[MSPSharedTripServer reportUserConfirmationOfSharingIdentity:completion:]";
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_1B39C0000, v10, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", v13, 0x16u);
    }
  }

}

- (void)startSharingTripWithContacts:(id)a3 capabilityType:(unint64_t)a4 completion:(id)a5
{
  char *v8;
  void (**v9)(id, id);
  id v10;
  NSObject *v11;
  MSPSenderETAController *sendingController;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = (char *)a3;
  v9 = (void (**)(id, id))a5;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && -[MSPSharedTripServer _connectionCanControlSharing:](self, "_connectionCanControlSharing:", v10))
  {

    MSPGetSharedTripLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_DEFAULT, "[Server] Start sharing with contacts: %@", buf, 0xCu);
    }

    sendingController = self->_sendingController;
    v14 = 0;
    -[MSPSenderETAController startSharingWith:capabilityType:error:](sendingController, "startSharingWith:capabilityType:error:", v8, a4, &v14);
    v10 = v14;
    v9[2](v9, v10);
  }
  else
  {
    MSPGetSharedTripLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[MSPSharedTripServer startSharingTripWithContacts:capabilityType:completion:]";
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
    }

  }
}

- (void)startSharingTripWithMessagesGroup:(id)a3 completion:(id)a4
{
  char *v6;
  void (**v7)(id, id);
  id v8;
  NSObject *v9;
  MSPSenderETAController *sendingController;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 && -[MSPSharedTripServer _connectionCanControlSharing:](self, "_connectionCanControlSharing:", v8))
  {

    MSPGetSharedTripLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_1B39C0000, v9, OS_LOG_TYPE_DEFAULT, "[Service] Start sharing trip with group: %@", buf, 0xCu);
    }

    sendingController = self->_sendingController;
    v12 = 0;
    -[MSPSenderETAController startSharingWithGroup:error:](sendingController, "startSharingWithGroup:error:", v6, &v12);
    v8 = v12;
    v7[2](v7, v8);
  }
  else
  {
    MSPGetSharedTripLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[MSPSharedTripServer startSharingTripWithMessagesGroup:completion:]";
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
    }

  }
}

- (void)stopSharingTripWithContacts:(id)a3 completion:(id)a4
{
  -[MSPSharedTripServer stopSharingTripWithContacts:reason:completion:](self, "stopSharingTripWithContacts:reason:completion:", a3, 0, a4);
}

- (void)stopSharingTripWithContacts:(id)a3 reason:(unint64_t)a4 completion:(id)a5
{
  char *v8;
  void (**v9)(id, id);
  id v10;
  NSObject *v11;
  MSPSenderETAController *sendingController;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = (char *)a3;
  v9 = (void (**)(id, id))a5;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && -[MSPSharedTripServer _connectionCanControlSharing:](self, "_connectionCanControlSharing:", v10))
  {

    MSPGetSharedTripLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_DEFAULT, "[Service] stop sharing trip with Maps/Messages contacts: %@", buf, 0xCu);
    }

    sendingController = self->_sendingController;
    v14 = 0;
    -[MSPSenderETAController stopSharingWith:reason:error:](sendingController, "stopSharingWith:reason:error:", v8, a4, &v14);
    v10 = v14;
    objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:", 105, 0, 0);
    v9[2](v9, v10);
  }
  else
  {
    MSPGetSharedTripLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[MSPSharedTripServer stopSharingTripWithContacts:reason:completion:]";
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
    }

  }
}

- (void)stopSharingTripWithMessagesGroup:(id)a3 completion:(id)a4
{
  -[MSPSharedTripServer stopSharingTripWithMessagesGroup:reason:completion:](self, "stopSharingTripWithMessagesGroup:reason:completion:", a3, 0, a4);
}

- (void)stopSharingTripWithMessagesGroup:(id)a3 reason:(unint64_t)a4 completion:(id)a5
{
  char *v8;
  void (**v9)(id, id);
  id v10;
  NSObject *v11;
  MSPSenderETAController *sendingController;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = (char *)a3;
  v9 = (void (**)(id, id))a5;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && -[MSPSharedTripServer _connectionCanControlSharing:](self, "_connectionCanControlSharing:", v10))
  {

    MSPGetSharedTripLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_DEFAULT, "[Service] stop sharing trip with group: %@", buf, 0xCu);
    }

    sendingController = self->_sendingController;
    v14 = 0;
    -[MSPSenderETAController stopSharingWithGroup:reason:error:](sendingController, "stopSharingWithGroup:reason:error:", v8, a4, &v14);
    v10 = v14;
    v9[2](v9, v10);
  }
  else
  {
    MSPGetSharedTripLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[MSPSharedTripServer stopSharingTripWithMessagesGroup:reason:completion:]";
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
    }

  }
}

- (void)stopSharingTripWithCompletion:(id)a3
{
  -[MSPSharedTripServer stopSharingTripWithReason:completion:](self, "stopSharingTripWithReason:completion:", 0, a3);
}

- (void)stopSharingTripWithReason:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, id);
  id v7;
  NSObject *v8;
  MSPSenderETAController *sendingController;
  MSPSenderETAController *v10;
  MSPSenderETAController *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && -[MSPSharedTripServer _connectionCanControlSharing:](self, "_connectionCanControlSharing:", v7))
  {

    MSPGetSharedTripLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_DEFAULT, "[Server] Stop sharing", buf, 2u);
    }

    sendingController = self->_sendingController;
    v13 = 0;
    -[MSPSenderETAController stopSharingWithReason:error:](sendingController, "stopSharingWithReason:error:", a3, &v13);
    v7 = v13;
    v10 = -[MSPSenderETAController initWithRelay:]([MSPSenderETAController alloc], "initWithRelay:", self->_idsRelay);
    v11 = self->_sendingController;
    self->_sendingController = v10;

    -[MSPSenderETAController setDelegate:](self->_sendingController, "setDelegate:", self);
    v6[2](v6, v7);
  }
  else
  {
    MSPGetSharedTripLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[MSPSharedTripServer stopSharingTripWithReason:completion:]";
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1B39C0000, v12, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
    }

  }
}

- (void)fetchActiveHandlesWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && -[MSPSharedTripServer _connectionCanControlSharing:](self, "_connectionCanControlSharing:", v5))
  {

    -[MSPSenderETAController activeHandles](self->_sendingController, "activeHandles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MSPGetSharedTripLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = (const char *)v5;
      _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEFAULT, "[Server] Fetch active handles: %@", (uint8_t *)&v8, 0xCu);
    }

    v4[2](v4, v5);
  }
  else
  {
    MSPGetSharedTripLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[MSPSharedTripServer fetchActiveHandlesWithCompletion:]";
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (void)subscribeToSharedTripUpdatesWithIdentifier:(id)a3 completion:(id)a4
{
  char *v6;
  void (**v7)(id, _QWORD);
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  MSPReceiverETAController *receivingController;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = (void (**)(id, _QWORD))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 && -[MSPSharedTripServer _connectionCanControlReceiving:](self, "_connectionCanControlReceiving:", v8))
  {

    -[MSPSharedTripServer _subscribedConnectionsForTripID:createIfNeeded:](self, "_subscribedConnectionsForTripID:createIfNeeded:", v6, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    objc_msgSend(v9, "addObject:", v8);
    v11 = objc_msgSend(v9, "count");
    MSPGetSharedTripLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v10 == v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v20 = (const char *)v8;
        v21 = 2112;
        v22 = v6;
        _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_INFO, "[Server] %@ already subscribed to trip %@", buf, 0x16u);
      }

      v7[2](v7, 0);
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v20 = (const char *)v8;
        v21 = 2112;
        v22 = v6;
        v23 = 2048;
        v24 = objc_msgSend(v9, "count");
        _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_DEFAULT, "[Server] Added %@ to subscriptions for trip %@ (%lu subscriptions)", buf, 0x20u);
      }

      MSPGetSharedTripLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v6;
        _os_log_impl(&dword_1B39C0000, v15, OS_LOG_TYPE_DEFAULT, "[Server] Subscribe to trip: %@", buf, 0xCu);
      }

      receivingController = self->_receivingController;
      v18 = 0;
      -[MSPReceiverETAController subscribeToUpdatesToSharedTrip:error:](receivingController, "subscribeToUpdatesToSharedTrip:error:", v6, &v18);
      v17 = v18;
      ((void (**)(id, id))v7)[2](v7, v17);

    }
  }
  else
  {
    MSPGetSharedTripLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[MSPSharedTripServer subscribeToSharedTripUpdatesWithIdentifier:completion:]";
      v21 = 2112;
      v22 = (char *)v8;
      _os_log_impl(&dword_1B39C0000, v14, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
    }

    v9 = v8;
  }

}

- (void)unsubscribeFromSharedTripUpdatesWithIdentifier:(id)a3 completion:(id)a4
{
  char *v6;
  void (**v7)(id, NSObject *);
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  MSPReceiverETAController *receivingController;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = (void (**)(id, NSObject *))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 && -[MSPSharedTripServer _connectionCanControlReceiving:](self, "_connectionCanControlReceiving:", v8))
  {

    -[MSPSharedTripServer _subscribedConnectionsForTripID:createIfNeeded:](self, "_subscribedConnectionsForTripID:createIfNeeded:", v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    objc_msgSend(v9, "removeObject:", v8);
    v11 = objc_msgSend(v9, "count");
    MSPGetSharedTripLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v10 == v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v20 = (const char *)v8;
        v21 = 2112;
        v22 = v6;
        _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_DEBUG, "[Server] Connection %@ was not subscribed to trip: %@", buf, 0x16u);
      }
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v20 = (const char *)v8;
        v21 = 2112;
        v22 = v6;
        _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_DEFAULT, "[Server] Removed connection %@ from subscriptions for trip: %@", buf, 0x16u);
      }

      if (objc_msgSend(v9, "count"))
      {
        MSPGetSharedTripLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v15 = objc_msgSend(v9, "count");
          *(_DWORD *)buf = 134218242;
          v20 = (const char *)v15;
          v21 = 2112;
          v22 = v6;
          _os_log_impl(&dword_1B39C0000, v14, OS_LOG_TYPE_DEBUG, "[Server] %lu subscribed connections for trip %@", buf, 0x16u);
        }

      }
      MSPGetSharedTripLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v6;
        _os_log_impl(&dword_1B39C0000, v16, OS_LOG_TYPE_DEFAULT, "[Server] Unsubscribe from trip: %@", buf, 0xCu);
      }

      receivingController = self->_receivingController;
      v18 = 0;
      -[MSPReceiverETAController unsubscribeFromUpdatesToSharedTrip:error:](receivingController, "unsubscribeFromUpdatesToSharedTrip:error:", v6, &v18);
      v13 = v18;
      v7[2](v7, v13);
    }
  }
  else
  {
    MSPGetSharedTripLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[MSPSharedTripServer unsubscribeFromSharedTripUpdatesWithIdentifier:completion:]";
      v21 = 2112;
      v22 = (char *)v8;
      _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
    }
    v9 = v8;
  }

}

- (void)fetchSharedTripsWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && -[MSPSharedTripServer _connectionCanControlReceiving:](self, "_connectionCanControlReceiving:", v5))
  {

    -[MSPReceiverETAController allTrips](self->_receivingController, "allTrips");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MSPGetSharedTripLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = (const char *)v5;
      _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEFAULT, "[Server] Fetching all received trips: %@", (uint8_t *)&v8, 0xCu);
    }

    v4[2](v4, v5);
  }
  else
  {
    MSPGetSharedTripLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[MSPSharedTripServer fetchSharedTripsWithCompletion:]";
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (void)blockSharedTrip:(id)a3
{
  char *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && -[MSPSharedTripServer _connectionCanControlReceiving:](self, "_connectionCanControlReceiving:", v5))
  {

    MSPGetSharedTripLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEFAULT, "[Service] block sharing trip: %@", (uint8_t *)&v8, 0xCu);
    }

    -[MSPReceiverETAController blockSharedTrip:](self->_receivingController, "blockSharedTrip:", v4);
  }
  else
  {
    MSPGetSharedTripLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[MSPSharedTripServer blockSharedTrip:]";
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (void)clearBlockedTripIdentifiers
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[MSPSharedTripServer _connectionCanControlReceiving:](self, "_connectionCanControlReceiving:", v3))
  {

    MSPGetSharedTripLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_DEFAULT, "[Service] clear blocked trip identifiers", (uint8_t *)&v6, 2u);
    }

    -[MSPReceiverETAController clearBlockedTripIdentifiers](self->_receivingController, "clearBlockedTripIdentifiers");
  }
  else
  {
    MSPGetSharedTripLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[MSPSharedTripServer clearBlockedTripIdentifiers]";
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", (uint8_t *)&v6, 0x16u);
    }

  }
}

- (void)purgeExpiredBlockedTripIdentifiers
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[MSPSharedTripServer _connectionCanControlReceiving:](self, "_connectionCanControlReceiving:", v3))
  {

    MSPGetSharedTripLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_DEFAULT, "[Service] purge expired blocked trip identifiers", (uint8_t *)&v6, 2u);
    }

    -[MSPReceiverETAController purgeExpiredBlockedTripIdentifiers](self->_receivingController, "purgeExpiredBlockedTripIdentifiers");
  }
  else
  {
    MSPGetSharedTripLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[MSPSharedTripServer purgeExpiredBlockedTripIdentifiers]";
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", (uint8_t *)&v6, 0x16u);
    }

  }
}

- (void)senderController:(id)a3 didStartSharingWithGroupIdentifier:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    v19 = "-[MSPSharedTripServer senderController:didStartSharingWithGroupIdentifier:]";
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEBUG, "[Server] %{private}s", buf, 0xCu);
  }

  -[MSPSharedTripServer connections](self, "connections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v12 && -[MSPSharedTripServer _connectionCanControlSharing:](self, "_connectionCanControlSharing:", v12))
        {

          objc_msgSend(v12, "remoteObjectProxy");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "sharedTripDidStartSharingWithIdentifier:", v5);
        }
        else
        {
          MSPGetSharedTripLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v19 = "-[MSPSharedTripServer senderController:didStartSharingWithGroupIdentifier:]";
            v20 = 2112;
            v21 = v12;
            _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_DEBUG, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v9);
  }

}

- (void)senderController:(id)a3 didInvalidateSharedTripWithError:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    v19 = "-[MSPSharedTripServer senderController:didInvalidateSharedTripWithError:]";
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEBUG, "[Server] %{private}s", buf, 0xCu);
  }

  -[MSPSharedTripServer connections](self, "connections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v12 && -[MSPSharedTripServer _connectionCanControlSharing:](self, "_connectionCanControlSharing:", v12))
        {

          objc_msgSend(v12, "remoteObjectProxy");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "sharedTripInvalidatedWithError:", v5);
        }
        else
        {
          MSPGetSharedTripLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v19 = "-[MSPSharedTripServer senderController:didInvalidateSharedTripWithError:]";
            v20 = 2112;
            v21 = v12;
            _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_DEBUG, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v9);
  }

}

- (void)invalidateActiveHandlesForSenderController:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  NSObject *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[MSPSharedTripServer invalidateActiveHandlesForSenderController:]";
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_INFO, "[Server] %s", buf, 0xCu);
  }

  -[MSPSharedTripServer connections](self, "connections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v4;
  objc_msgSend(v4, "activeHandles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (v13 && -[MSPSharedTripServer _connectionCanControlSharing:](self, "_connectionCanControlSharing:", v13))
        {

          objc_msgSend(v13, "remoteObjectProxy");
          v13 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "sharedTripDidUpdateRecipients:", v7);
        }
        else
        {
          MSPGetSharedTripLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v21 = "-[MSPSharedTripServer invalidateActiveHandlesForSenderController:]";
            v22 = 2112;
            v23 = v13;
            _os_log_impl(&dword_1B39C0000, v14, OS_LOG_TYPE_DEBUG, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v10);
  }

}

- (void)relay:(id)a3 accountStatusChanged:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136380931;
    v24 = "-[MSPSharedTripServer relay:accountStatusChanged:]";
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEBUG, "[Server] %{private}s signedIntoiCloud %@", buf, 0x16u);

  }
  -[MSPSharedTripServer connections](self, "connections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        MSPGetSharedTripLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v13, "remoteObjectProxy");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v24 = (const char *)v13;
          v25 = 2112;
          v26 = v15;
          _os_log_impl(&dword_1B39C0000, v14, OS_LOG_TYPE_DEBUG, "[Server] connection %@ %@", buf, 0x16u);

        }
        objc_msgSend(v13, "remoteObjectProxy");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSPSharedTripRelay sharingIdentity](self->_idsRelay, "sharingIdentity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "sharingIdentityDidChange:", v17);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peersByConnection, 0);
  objc_storeStrong((id *)&self->_connectionSubscriptionsByTripID, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_idsRelay, 0);
  objc_storeStrong((id *)&self->_receivingController, 0);
  objc_storeStrong((id *)&self->_sendingController, 0);
}

+ (void)migrateIfNeeded
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D27108], "sharedObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runAfterFirstUnlock:block:", MEMORY[0x1E0C80D38], &__block_literal_global);

}

uint64_t __49__MSPSharedTripServer_Migration__migrateIfNeeded__block_invoke()
{
  int BOOL;
  NSObject *v1;
  NSObject *v2;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (_GEOConfigHasValue())
  {
    BOOL = GEOConfigGetBOOL();
    MSPGetSharedTripLog();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      v4[0] = 67109120;
      v4[1] = BOOL;
      _os_log_impl(&dword_1B39C0000, v1, OS_LOG_TYPE_INFO, "Will migrate legacy Share ETA user enabled flag: %d", (uint8_t *)v4, 8u);
    }

    GEOConfigSetBOOL();
    _GEOConfigRemoveValue();
  }
  else
  {
    MSPGetSharedTripLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v4[0]) = 0;
      _os_log_impl(&dword_1B39C0000, v2, OS_LOG_TYPE_DEBUG, "No legacy Share ETA user enabled flag to migrate", (uint8_t *)v4, 2u);
    }

  }
  +[MSPSharedTripStorageController removeFilesFromBackupsIfNeeded](MSPSharedTripStorageController, "removeFilesFromBackupsIfNeeded");
  return +[MSPSharedTripBlocklist migrateFromiCloudKVSIfNeeded](MSPSharedTripBlocklist, "migrateFromiCloudKVSIfNeeded");
}

@end
