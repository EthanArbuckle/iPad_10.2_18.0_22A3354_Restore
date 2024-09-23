@implementation GEONavigationServer

+ (id)identifier
{
  return CFSTR("navigation");
}

- (GEONavigationServer)init
{
  GEONavigationServer *v2;
  NSObject *v3;
  id v4;
  const char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  uint8_t buf[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GEONavigationServer;
  v2 = -[GEONavigationServer init](&v11, sel_init);
  if (v2)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEFAULT, "Initializing GEONavigationServer", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.Navigation.%@.%p"), objc_opt_class(), v2);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create(v5, v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    if (!notify_register_check("com.apple.GeoServices.navigation.openListenerConnection", &v2->_listenerConnectionOpenToken))notify_set_state(v2->_listenerConnectionOpenToken, 0);
  }
  return v2;
}

- (BOOL)shouldAcceptNewConnection:(id)a3 shouldCreateNavigationPeer:(BOOL)a4
{
  id v6;
  GEONavigationServerPeer *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  GEONavigationServerPeer *v20;
  void *v21;
  NSObject *queue;
  GEONavigationServerPeer *v23;
  _QWORD block[4];
  id v26;
  GEONavigationServer *v27;
  GEONavigationServerPeer *v28;
  char v29;
  _QWORD v30[5];
  GEONavigationServerPeer *v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  _BYTE buffer[1024];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  proc_pidpath(objc_msgSend(v6, "processIdentifier"), buffer, 0x400u);
  if (a4)
  {
    v7 = -[GEONavdPeer initWithXPCConnection:]([GEONavigationServerPeer alloc], "initWithXPCConnection:", v6);
    v8 = -[GEONavdPeer hasEntitlement:](v7, "hasEntitlement:", CFSTR("com.apple.geoservices.navigation_info"));
    if ((_DWORD)v8)
    {
      -[GEONavdPeer setExpectingUpdates:](v7, "setExpectingUpdates:", 1);
      GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buffer);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v34 = v6;
        v35 = 2112;
        v36 = v11;
        _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_DEFAULT, "Navigation server received connection from navigation listener: %@ (%@)", buf, 0x16u);

      }
    }
    else
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buffer);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v34 = v6;
        v35 = 2112;
        v36 = v16;
        _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "Navigation server received connection from navigation listener: %@ (%@), but it doesn't have the proper entitlement.", buf, 0x16u);

      }
    }

    -[GEONavigationServerPeer setHasEntitlement:](v7, "setHasEntitlement:", v8);
    -[GEONavigationServerPeer setDelegate:](v7, "setDelegate:", self);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE01F0B8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setExportedInterface:", v17);

    objc_msgSend(v6, "setExportedObject:", v7);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDFC98D8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRemoteObjectInterface:", v18);

    objc_msgSend(v6, "_setQueue:", self->_queue);
    objc_initWeak((id *)buf, self);
    v19 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __76__GEONavigationServer_shouldAcceptNewConnection_shouldCreateNavigationPeer___block_invoke;
    v30[3] = &unk_1E1C21530;
    v30[4] = self;
    objc_copyWeak(&v32, (id *)buf);
    v20 = v7;
    v31 = v20;
    v21 = (void *)MEMORY[0x18D765024](v30);
    objc_msgSend(v6, "setInvalidationHandler:", v21);
    objc_msgSend(v6, "setInterruptionHandler:", v21);
    queue = self->_queue;
    block[0] = v19;
    block[1] = 3221225472;
    block[2] = __76__GEONavigationServer_shouldAcceptNewConnection_shouldCreateNavigationPeer___block_invoke_2;
    block[3] = &unk_1E1C20FE8;
    v29 = v8;
    v26 = v6;
    v27 = self;
    v28 = v20;
    v23 = v20;
    dispatch_async(queue, block);

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buffer);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v34 = v6;
      v35 = 2112;
      v36 = v14;
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_DEFAULT, "Navigation server received connection from navigation service: %@ (%@)", buf, 0x16u);

    }
    -[GEONavigationServer _openPushStatePeerConnection:](self, "_openPushStatePeerConnection:", v6);
  }

  return 1;
}

void __76__GEONavigationServer_shouldAcceptNewConnection_shouldCreateNavigationPeer___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint8_t buf[16];

  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEFAULT, "InvalidationHandler/InterruptionHandler called for listener peer.", buf, 2u);
  }

  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__GEONavigationServer_shouldAcceptNewConnection_shouldCreateNavigationPeer___block_invoke_120;
  v4[3] = &unk_1E1C01158;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  v5 = *(id *)(a1 + 40);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v6);
}

void __76__GEONavigationServer_shouldAcceptNewConnection_shouldCreateNavigationPeer___block_invoke_120(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained[3], "removeObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v5[4], "removeObject:", *(_QWORD *)(a1 + 32));
    v4 = objc_msgSend(v5[3], "count");
    v3 = v5;
    if (!v4)
    {
      objc_msgSend(v5, "clearAllData");
      v3 = v5;
    }
  }

}

_QWORD *__76__GEONavigationServer_shouldAcceptNewConnection_shouldCreateNavigationPeer___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD *result;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  objc_msgSend(*(id *)(a1 + 32), "resume");
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 56))
  {
    v3 = *(void **)(v2 + 24);
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(void **)(v5 + 24);
      *(_QWORD *)(v5 + 24) = v4;

      v3 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    }
    objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "remoteObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationStateChanged:transportType:isResumingMultipointRoute:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), *(unsigned int *)(*(_QWORD *)(a1 + 40) + 56), *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 80));

    result = *(_QWORD **)(a1 + 40);
    if (result[8])
    {
      objc_msgSend(*(id *)(a1 + 32), "remoteObjectProxy");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "didUpdateLocation:routeMatchedCoordinate:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72));

      result = *(_QWORD **)(a1 + 40);
    }
    if (result[13])
      return (_QWORD *)objc_msgSend(result, "_requestRouteSummaryWithPeer:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    v10 = *(void **)(v2 + 32);
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(void **)(v12 + 32);
      *(_QWORD *)(v12 + 32) = v11;

      v10 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    }
    return (_QWORD *)objc_msgSend(v10, "addObject:", *(_QWORD *)(a1 + 48));
  }
  return result;
}

- (void)setNavigationSessionState:(unint64_t)a3 transportType:(int)a4 isResumingMultipointRoute:(BOOL)a5
{
  NSObject *v9;
  NSObject *queue;
  _QWORD block[6];
  int v12;
  BOOL v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v15 = a3;
    v16 = 1024;
    v17 = a4;
    _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_DEFAULT, "Navigation server setNavigationSessionState: %d transportType: %d", buf, 0xEu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__GEONavigationServer_setNavigationSessionState_transportType_isResumingMultipointRoute___block_invoke;
  block[3] = &unk_1E1C0CA58;
  block[4] = self;
  block[5] = a3;
  v12 = a4;
  v13 = a5;
  dispatch_async(queue, block);
}

void __89__GEONavigationServer_setNavigationSessionState_transportType_isResumingMultipointRoute___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  int v17;
  char v18;
  uint8_t buf[16];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(v2 + 48);
  if (v4 != v3 || *(_DWORD *)(v2 + 56) != *(_DWORD *)(a1 + 48))
  {
    *(_QWORD *)(v2 + 48) = v3;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = *(_DWORD *)(a1 + 48);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = *(_BYTE *)(a1 + 52);
    if (*(_QWORD *)(a1 + 40))
      goto LABEL_5;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = 0;

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 64);
    *(_QWORD *)(v7 + 64) = 0;

    if (*(_QWORD *)(a1 + 40))
    {
LABEL_5:
      if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 40))
      {
        GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_DEFAULT, "GEONavigationServer setting connection to open", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 32), "_notifyListenersOpenConnection");
        v9 = 0;
LABEL_10:
        v11 = *(_QWORD *)(a1 + 40);
        if (v11 == 2)
        {
          v12 = "com.apple.GeoServices.navigation.started";
        }
        else
        {
          if (v4 != 2 || v11 != 0)
            goto LABEL_19;
          v12 = "com.apple.GeoServices.navigation.stopped";
        }
        notify_post(v12);
LABEL_19:
        if (v9)
        {
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __89__GEONavigationServer_setNavigationSessionState_transportType_isResumingMultipointRoute___block_invoke_125;
          v16[3] = &__block_descriptor_45_e79_v24__0__GEONavigationServerPeer_8___GEONavigationServerListenerXPCInterface__16l;
          v14 = *(void **)(a1 + 32);
          v16[4] = *(_QWORD *)(a1 + 40);
          v17 = *(_DWORD *)(a1 + 48);
          v18 = *(_BYTE *)(a1 + 52);
          objc_msgSend(v14, "_forEachValidPeerOnIsolationQueue:", v16);
        }
        return;
      }
    }
    else if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 40))
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_DEFAULT, "GEONavigationServer setting connection to closed", buf, 2u);
      }

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
      notify_set_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 44), 0);
    }
    v9 = 1;
    goto LABEL_10;
  }
}

uint64_t __89__GEONavigationServer_setNavigationSessionState_transportType_isResumingMultipointRoute___block_invoke_125(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "navigationStateChanged:transportType:isResumingMultipointRoute:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), *(unsigned __int8 *)(a1 + 44));
}

- (void)setLocation:(id)a3 routeMatchedCoordinate:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  $212C09783140BCCD23384160D545CE0D v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__GEONavigationServer_setLocation_routeMatchedCoordinate___block_invoke;
  block[3] = &unk_1E1C01420;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

void __58__GEONavigationServer_setLocation_routeMatchedCoordinate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  double v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  int v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = *(_QWORD *)(a1 + 48);
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_DWORD *)(a1 + 48);
    v5 = *(float *)(a1 + 52);
    *(_DWORD *)buf = 138478339;
    v13 = v3;
    v14 = 1025;
    v15 = v4;
    v16 = 2049;
    v17 = v5;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "setLocation: %{private}@\nrouteMatchedCoordinate: [%{private}u, %{private}f]", buf, 0x1Cu);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__GEONavigationServer_setLocation_routeMatchedCoordinate___block_invoke_128;
  v9[3] = &unk_1E1C21578;
  v6 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v10 = v7;
  v11 = v8;
  objc_msgSend(v6, "_forEachValidPeerOnIsolationQueue:", v9);

}

uint64_t __58__GEONavigationServer_setLocation_routeMatchedCoordinate___block_invoke_128(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "didUpdateLocation:routeMatchedCoordinate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)setRoute:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__GEONavigationServer_setRoute___block_invoke;
  v7[3] = &unk_1E1C00738;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __32__GEONavigationServer_setRoute___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 40), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    v8 = v3;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "setRoute: %{private}@", buf, 0xCu);

  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__GEONavigationServer_setRoute___block_invoke_129;
  v5[3] = &unk_1E1C215A0;
  v4 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "_forEachValidPeerOnIsolationQueue:", v5);

}

void __32__GEONavigationServer_setRoute___block_invoke_129(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  if (objc_msgSend(a2, "wantsRoutes"))
    objc_msgSend(v5, "didUpdateRoute:", *(_QWORD *)(a1 + 32));

}

- (void)setETAUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    v11 = v4;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "setETAUpdate: %{private}@", buf, 0xCu);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__GEONavigationServer_setETAUpdate___block_invoke;
  v8[3] = &unk_1E1C00738;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

void __36__GEONavigationServer_setETAUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), *(id *)(a1 + 40));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__GEONavigationServer_setETAUpdate___block_invoke_2;
  v3[3] = &unk_1E1C215A0;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_forEachValidPeerOnIsolationQueue:", v3);

}

void __36__GEONavigationServer_setETAUpdate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  if (objc_msgSend(a2, "wantsRoutes"))
    objc_msgSend(v5, "didUpdateETA:", *(_QWORD *)(a1 + 32));

}

- (void)updateTrafficForCurrentRoute:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    v11 = v4;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "updateTrafficForCurrentRoute: %{private}@", buf, 0xCu);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__GEONavigationServer_updateTrafficForCurrentRoute___block_invoke;
  v8[3] = &unk_1E1C00738;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

void __52__GEONavigationServer_updateTrafficForCurrentRoute___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "mutableData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTraffic:", v2);

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__GEONavigationServer_updateTrafficForCurrentRoute___block_invoke_2;
  v5[3] = &unk_1E1C215A0;
  v4 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "_forEachValidPeerOnIsolationQueue:", v5);

}

void __52__GEONavigationServer_updateTrafficForCurrentRoute___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  if (objc_msgSend(a2, "wantsRoutes"))
    objc_msgSend(v5, "didUpdateTrafficForCurrentRoute:", *(_QWORD *)(a1 + 32));

}

- (void)setArrivedAtWaypoint:(id)a3 endOfLegIndex:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478083;
    v13 = v6;
    v14 = 2048;
    v15 = a4;
    _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "setArrivedAtWaypoint: %{private}@ endOfLegIndex: %lu", buf, 0x16u);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__GEONavigationServer_setArrivedAtWaypoint_endOfLegIndex___block_invoke;
  v9[3] = &unk_1E1C21578;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  -[GEONavigationServer _forEachValidPeer:](self, "_forEachValidPeer:", v9);

}

uint64_t __58__GEONavigationServer_setArrivedAtWaypoint_endOfLegIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "didArriveAtWaypoint:endOfLegIndex:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)setResumedNavigatingFromWaypoint:(id)a3 endOfLegIndex:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478083;
    v13 = v6;
    v14 = 2048;
    v15 = a4;
    _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "setResumedNavigatingFromWaypoint: %{private}@ endOfLegIndex: %lu", buf, 0x16u);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__GEONavigationServer_setResumedNavigatingFromWaypoint_endOfLegIndex___block_invoke;
  v9[3] = &unk_1E1C21578;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  -[GEONavigationServer _forEachValidPeer:](self, "_forEachValidPeer:", v9);

}

uint64_t __70__GEONavigationServer_setResumedNavigatingFromWaypoint_endOfLegIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "didResumeNavigatingFromWaypoint:endOfLegIndex:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)setRouteSummaryWithNavigationRouteSummaryData:(id)a3
{
  id v5;
  GEONavigationRouteSummary *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_routeSummaryData, a3);
  v6 = -[GEONavigationRouteSummary initWithData:]([GEONavigationRouteSummary alloc], "initWithData:", self->_routeSummaryData);
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "Setting route summary\n", buf, 2u);
  }

  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[GEONavigationRouteSummary destinationName](v6, "destinationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    v29 = v9;
    _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "\tDestination: %{private}@\n", buf, 0xCu);

  }
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    -[GEONavigationRouteSummary origin](v6, "origin");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "latLng");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "lat");
    v12 = v11;
    -[GEONavigationRouteSummary origin](v6, "origin");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "latLng");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lng");
    v16 = v15;
    -[GEONavigationRouteSummary destination](v6, "destination");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "latLng");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lat");
    v20 = v19;
    -[GEONavigationRouteSummary destination](v6, "destination");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "latLng");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lng");
    *(_DWORD *)buf = 134284289;
    v29 = v12;
    v30 = 2049;
    v31 = v16;
    v32 = 2049;
    v33 = v20;
    v34 = 2049;
    v35 = v23;
    _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_DEBUG, "\tFrom: [%{private}0.8f, %{private}0.8f] | To: [%{private}0.8f, %{private}0.8f]\n", buf, 0x2Au);

  }
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    v25 = -[GEONavigationRouteSummary transportType](v6, "transportType");
    *(_DWORD *)buf = 67109120;
    LODWORD(v29) = v25;
    _os_log_impl(&dword_1885A9000, v24, OS_LOG_TYPE_DEBUG, "\tTransport type: %d\n", buf, 8u);
  }

  -[GEONavigationServer _updateAllPeersWithMessage:data:](self, "_updateAllPeersWithMessage:data:", 0, self->_routeSummaryData);
}

- (void)setRouteSummaryWithTransitSummaryData:(id)a3
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_storeStrong((id *)&self->_transitSummaryData, a3);
  v5 = a3;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "Setting transit summary data", v7, 2u);
  }

  -[GEONavigationServer _updateAllPeersWithMessage:data:](self, "_updateAllPeersWithMessage:data:", 1, self->_transitSummaryData);
}

- (void)setRouteSummaryWithGuidanceStateData:(id)a3
{
  id v5;
  GEONavigationGuidanceState *v6;
  NSObject *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  uint8_t buf[4];
  __CFString *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_guidanceStateData, a3);
  v6 = -[GEONavigationGuidanceState initWithData:]([GEONavigationGuidanceState alloc], "initWithData:", v5);
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = -[GEONavigationGuidanceState navigationState](v6, "navigationState");
    if (v8 >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E1C215C0[(int)v8];
    }
    v10 = v9;
    v11 = -[GEONavigationGuidanceState trackedTransportType](v6, "trackedTransportType");
    if (v11 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v11);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E1C21608[(int)v11];
    }
    *(_DWORD *)buf = 138478083;
    v14 = v10;
    v15 = 2113;
    v16 = v12;
    _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "Setting guidance state: %{private}@ | transport type: %{private}@\n", buf, 0x16u);

  }
  -[GEONavigationServer _updateAllPeersWithMessage:data:](self, "_updateAllPeersWithMessage:data:", 2, self->_guidanceStateData);

}

- (void)setRouteSummaryWithActiveRouteDetailsData:(id)a3
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_storeStrong((id *)&self->_activeRouteDetailsData, a3);
  v5 = a3;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "Setting active route details data", v7, 2u);
  }

  -[GEONavigationServer _updateAllPeersWithMessage:data:](self, "_updateAllPeersWithMessage:data:", 3, self->_activeRouteDetailsData);
}

- (void)setRouteSummaryWithStepIndexData:(id)a3
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_storeStrong((id *)&self->_stepIndexData, a3);
  v5 = a3;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "Setting step index data", v7, 2u);
  }

  -[GEONavigationServer _updateAllPeersWithMessage:data:](self, "_updateAllPeersWithMessage:data:", 4, self->_stepIndexData);
}

- (void)setRouteSummaryWithStepNameInfoData:(id)a3
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_storeStrong((id *)&self->_stepNameInfoData, a3);
  v5 = a3;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "Setting step name info data", v7, 2u);
  }

  -[GEONavigationServer _updateAllPeersWithMessage:data:](self, "_updateAllPeersWithMessage:data:", 5, self->_stepNameInfoData);
}

- (void)setRouteSummaryWithRideSelectionsData:(id)a3
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_storeStrong((id *)&self->_rideSelectionsData, a3);
  v5 = a3;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "Setting selected ride option data", v7, 2u);
  }

  -[GEONavigationServer _updateAllPeersWithMessage:data:](self, "_updateAllPeersWithMessage:data:", 6, self->_rideSelectionsData);
}

- (void)setRouteSummaryWithPositionFromSignData:(id)a3
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_storeStrong((id *)&self->_positionFromSignData, a3);
  v5 = a3;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "Setting position from sign data", v7, 2u);
  }

  -[GEONavigationServer _updateAllPeersWithMessage:data:](self, "_updateAllPeersWithMessage:data:", 7, self->_positionFromSignData);
}

- (void)setRouteSummaryWithPositionFromManeuverData:(id)a3
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_storeStrong((id *)&self->_positionFromManeuverData, a3);
  v5 = a3;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "Setting position from maneuver data", v7, 2u);
  }

  -[GEONavigationServer _updateAllPeersWithMessage:data:](self, "_updateAllPeersWithMessage:data:", 8, self->_positionFromManeuverData);
}

- (void)setRouteSummaryWithPositionFromDestinationData:(id)a3
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_storeStrong((id *)&self->_positionFromDestinationData, a3);
  v5 = a3;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "Setting position from destination data", v7, 2u);
  }

  -[GEONavigationServer _updateAllPeersWithMessage:data:](self, "_updateAllPeersWithMessage:data:", 9, self->_positionFromDestinationData);
}

- (void)setNavigationVoiceVolumeWithData:(id)a3
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_storeStrong((id *)&self->_navigationVoiceVolumeData, a3);
  v5 = a3;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "Setting navigation voice volume data", v7, 2u);
  }

  -[GEONavigationServer _updateAllPeersWithMessage:data:](self, "_updateAllPeersWithMessage:data:", 10, self->_navigationVoiceVolumeData);
}

- (void)setCurrentRoadName:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "Setting current road name: %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__GEONavigationServer_setCurrentRoadName___block_invoke;
  v7[3] = &unk_1E1C215A0;
  v8 = v4;
  v6 = v4;
  -[GEONavigationServer _forEachValidPeer:](self, "_forEachValidPeer:", v7);

}

uint64_t __42__GEONavigationServer_setCurrentRoadName___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "currentRoadNameUpdated:", *(_QWORD *)(a1 + 32));
}

- (void)_requestRouteWithPeer:(id)a3
{
  id v4;
  NSObject *queue;
  _QWORD v6[4];
  id v7;
  GEONavigationServer *v8;

  v4 = a3;
  if (objc_msgSend(v4, "wantsRoutes"))
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__GEONavigationServer__requestRouteWithPeer___block_invoke;
    v6[3] = &unk_1E1C00738;
    v7 = v4;
    v8 = self;
    dispatch_async(queue, v6);

  }
}

void __45__GEONavigationServer__requestRouteWithPeer___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didUpdateRoute:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));

}

- (void)_requestETAWithPeer:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  GEONavigationServer *v7;

  v4 = a3;
  if (objc_msgSend(v4, "wantsRoutes"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __43__GEONavigationServer__requestETAWithPeer___block_invoke;
    v5[3] = &unk_1E1C00738;
    v6 = v4;
    v7 = self;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

void __43__GEONavigationServer__requestETAWithPeer___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didUpdateETA:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96));

}

- (void)_requestRouteSummaryWithPeer:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__GEONavigationServer__requestRouteSummaryWithPeer___block_invoke;
  v7[3] = &unk_1E1C00738;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __52__GEONavigationServer__requestRouteSummaryWithPeer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessage:data:toPeer:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104), *(_QWORD *)(a1 + 40));
}

- (void)_requestTransitSummaryWithPeer:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__GEONavigationServer__requestTransitSummaryWithPeer___block_invoke;
  v7[3] = &unk_1E1C00738;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __54__GEONavigationServer__requestTransitSummaryWithPeer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessage:data:toPeer:", 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), *(_QWORD *)(a1 + 40));
}

- (void)_requestGuidanceStateWithPeer:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__GEONavigationServer__requestGuidanceStateWithPeer___block_invoke;
  v7[3] = &unk_1E1C00738;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __53__GEONavigationServer__requestGuidanceStateWithPeer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessage:data:toPeer:", 2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120), *(_QWORD *)(a1 + 40));
}

- (void)_requestActiveRouteDetailsDataWithPeer:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__GEONavigationServer__requestActiveRouteDetailsDataWithPeer___block_invoke;
  v7[3] = &unk_1E1C00738;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __62__GEONavigationServer__requestActiveRouteDetailsDataWithPeer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessage:data:toPeer:", 3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128), *(_QWORD *)(a1 + 40));
}

- (void)_requestStepIndexWithPeer:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__GEONavigationServer__requestStepIndexWithPeer___block_invoke;
  v7[3] = &unk_1E1C00738;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __49__GEONavigationServer__requestStepIndexWithPeer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessage:data:toPeer:", 4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136), *(_QWORD *)(a1 + 40));
}

- (void)_requestStepNameInfoWithPeer:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__GEONavigationServer__requestStepNameInfoWithPeer___block_invoke;
  v7[3] = &unk_1E1C00738;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __52__GEONavigationServer__requestStepNameInfoWithPeer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessage:data:toPeer:", 5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144), *(_QWORD *)(a1 + 40));
}

- (void)_requestRideSelectionsWithPeer:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__GEONavigationServer__requestRideSelectionsWithPeer___block_invoke;
  v7[3] = &unk_1E1C00738;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __54__GEONavigationServer__requestRideSelectionsWithPeer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessage:data:toPeer:", 6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152), *(_QWORD *)(a1 + 40));
}

- (void)_requestPositionFromSignWithPeer:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__GEONavigationServer__requestPositionFromSignWithPeer___block_invoke;
  v7[3] = &unk_1E1C00738;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __56__GEONavigationServer__requestPositionFromSignWithPeer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessage:data:toPeer:", 7, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160), *(_QWORD *)(a1 + 40));
}

- (void)_requestPositionFromManeuverWithPeer:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__GEONavigationServer__requestPositionFromManeuverWithPeer___block_invoke;
  v7[3] = &unk_1E1C00738;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __60__GEONavigationServer__requestPositionFromManeuverWithPeer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessage:data:toPeer:", 8, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168), *(_QWORD *)(a1 + 40));
}

- (void)_requestPositionFromDestinationWithPeer:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__GEONavigationServer__requestPositionFromDestinationWithPeer___block_invoke;
  v7[3] = &unk_1E1C00738;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __63__GEONavigationServer__requestPositionFromDestinationWithPeer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessage:data:toPeer:", 9, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176), *(_QWORD *)(a1 + 40));
}

- (void)_requestNavigationVoiceVolumeWithPeer:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__GEONavigationServer__requestNavigationVoiceVolumeWithPeer___block_invoke;
  v7[3] = &unk_1E1C00738;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __61__GEONavigationServer__requestNavigationVoiceVolumeWithPeer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessage:data:toPeer:", 10, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184), *(_QWORD *)(a1 + 40));
}

- (void)_updateAllPeersWithMessage:(int64_t)a3 data:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__GEONavigationServer__updateAllPeersWithMessage_data___block_invoke;
  block[3] = &unk_1E1C01420;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

void __55__GEONavigationServer__updateAllPeersWithMessage_data___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "_sendMessage:data:toPeer:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_forEachValidPeer:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__GEONavigationServer__forEachValidPeer___block_invoke;
    v7[3] = &unk_1E1BFFBF0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

uint64_t __41__GEONavigationServer__forEachValidPeer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_forEachValidPeerOnIsolationQueue:", *(_QWORD *)(a1 + 40));
}

- (void)_forEachValidPeerOnIsolationQueue:(id)a3
{
  void (**v4)(id, void *, void *);
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, void *))a3;
  if (v4)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_listenerPeers;
    v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v10, "expectingUpdates", (_QWORD)v13))
          {
            objc_msgSend(v10, "connection");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "remoteObjectProxy");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            v4[2](v4, v10, v12);
          }
        }
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
}

- (void)_sendMessage:(int64_t)a3 data:(id)a4 toPeer:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  int64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v9, "expectingUpdates"))
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v13 = 134218242;
      v14 = a3;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_DEBUG, "Sending data with message: %ld, %@", (uint8_t *)&v13, 0x16u);
    }

    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    if (v9)
    {
      switch(a3)
      {
        case 0:
          objc_msgSend(v9, "connection");
          v11 = objc_claimAutoreleasedReturnValue();
          -[NSObject remoteObjectProxy](v11, "remoteObjectProxy");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "routeSummaryUpdatedWithNavigationRouteSummaryData:", v8);
          goto LABEL_19;
        case 1:
          objc_msgSend(v9, "connection");
          v11 = objc_claimAutoreleasedReturnValue();
          -[NSObject remoteObjectProxy](v11, "remoteObjectProxy");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "routeSummaryUpdatedWithTransitSummaryData:", v8);
          goto LABEL_19;
        case 2:
          objc_msgSend(v9, "connection");
          v11 = objc_claimAutoreleasedReturnValue();
          -[NSObject remoteObjectProxy](v11, "remoteObjectProxy");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "routeSummaryUpdatedWithGuidanceStateData:", v8);
          goto LABEL_19;
        case 3:
          objc_msgSend(v9, "connection");
          v11 = objc_claimAutoreleasedReturnValue();
          -[NSObject remoteObjectProxy](v11, "remoteObjectProxy");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "routeSummaryUpdatedWithActiveRouteDetailsData:", v8);
          goto LABEL_19;
        case 4:
          objc_msgSend(v9, "connection");
          v11 = objc_claimAutoreleasedReturnValue();
          -[NSObject remoteObjectProxy](v11, "remoteObjectProxy");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "routeSummaryUpdatedWithStepIndexData:", v8);
          goto LABEL_19;
        case 5:
          objc_msgSend(v9, "connection");
          v11 = objc_claimAutoreleasedReturnValue();
          -[NSObject remoteObjectProxy](v11, "remoteObjectProxy");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "routeSummaryUpdatedWithStepNameInfoData:", v8);
          goto LABEL_19;
        case 6:
          objc_msgSend(v9, "connection");
          v11 = objc_claimAutoreleasedReturnValue();
          -[NSObject remoteObjectProxy](v11, "remoteObjectProxy");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "routeSummaryUpdatedWithRideSelectionData:", v8);
          goto LABEL_19;
        case 7:
          objc_msgSend(v9, "connection");
          v11 = objc_claimAutoreleasedReturnValue();
          -[NSObject remoteObjectProxy](v11, "remoteObjectProxy");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "routeSummaryUpdatedWithPositionFromSignData:", v8);
          goto LABEL_19;
        case 8:
          objc_msgSend(v9, "connection");
          v11 = objc_claimAutoreleasedReturnValue();
          -[NSObject remoteObjectProxy](v11, "remoteObjectProxy");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "routeSummaryUpdatedWithPositionFromManeuverData:", v8);
          goto LABEL_19;
        case 9:
          objc_msgSend(v9, "connection");
          v11 = objc_claimAutoreleasedReturnValue();
          -[NSObject remoteObjectProxy](v11, "remoteObjectProxy");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "routeSummaryUpdatedWithPositionFromDestinationData:", v8);
          goto LABEL_19;
        case 10:
          objc_msgSend(v9, "connection");
          v11 = objc_claimAutoreleasedReturnValue();
          -[NSObject remoteObjectProxy](v11, "remoteObjectProxy");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "navigationUpdatedWithVoiceVolumeData:", v8);
LABEL_19:

          break;
        default:
          GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            v13 = 134217984;
            v14 = a3;
            _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEBUG, "Unknown message type found. Please file a bug. message type: %ld", (uint8_t *)&v13, 0xCu);
          }
          break;
      }

    }
  }

}

- (void)clearAllData
{
  GEOComposedRoute *route;
  NSData *routeSummaryData;
  NSData *transitSummaryData;
  NSData *guidanceStateData;
  NSData *activeRouteDetailsData;
  NSData *stepIndexData;
  NSData *stepNameInfoData;
  NSData *rideSelectionsData;
  NSData *positionFromSignData;
  NSData *positionFromManeuverData;
  NSData *positionFromDestinationData;
  NSData *navigationVoiceVolumeData;

  route = self->_route;
  self->_route = 0;

  routeSummaryData = self->_routeSummaryData;
  self->_routeSummaryData = 0;

  transitSummaryData = self->_transitSummaryData;
  self->_transitSummaryData = 0;

  guidanceStateData = self->_guidanceStateData;
  self->_guidanceStateData = 0;

  activeRouteDetailsData = self->_activeRouteDetailsData;
  self->_activeRouteDetailsData = 0;

  stepIndexData = self->_stepIndexData;
  self->_stepIndexData = 0;

  stepNameInfoData = self->_stepNameInfoData;
  self->_stepNameInfoData = 0;

  rideSelectionsData = self->_rideSelectionsData;
  self->_rideSelectionsData = 0;

  positionFromSignData = self->_positionFromSignData;
  self->_positionFromSignData = 0;

  positionFromManeuverData = self->_positionFromManeuverData;
  self->_positionFromManeuverData = 0;

  positionFromDestinationData = self->_positionFromDestinationData;
  self->_positionFromDestinationData = 0;

  navigationVoiceVolumeData = self->_navigationVoiceVolumeData;
  self->_navigationVoiceVolumeData = 0;

}

- (void)_openPushStatePeerConnection:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  GEONavdPeer *v7;
  GEONavdPeer *pushStatePeer;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  GEONavigationServer *v14;
  id v15;
  id buf[2];

  v4 = a3;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEFAULT, "Opening push state peer connection.", (uint8_t *)buf, 2u);
  }

  if (self->_pushStatePeer)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "Push state peer already connected. Aborting.", (uint8_t *)buf, 2u);
    }

  }
  else
  {
    v7 = -[GEONavdPeer initWithXPCConnection:]([GEONavdPeer alloc], "initWithXPCConnection:", v4);
    pushStatePeer = self->_pushStatePeer;
    self->_pushStatePeer = v7;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE01F3E8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setExportedInterface:", v9);

    objc_msgSend(v4, "setExportedObject:", self);
    objc_msgSend(v4, "_setQueue:", self->_queue);
    objc_initWeak(buf, self);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __52__GEONavigationServer__openPushStatePeerConnection___block_invoke;
    v13 = &unk_1E1C07830;
    v14 = self;
    objc_copyWeak(&v15, buf);
    objc_msgSend(v4, "setInvalidationHandler:", &v10);
    objc_msgSend(v4, "resume", v10, v11, v12, v13, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
  }

}

void __52__GEONavigationServer__openPushStatePeerConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  uint8_t buf[16];

  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEFAULT, "InvalidationHandler called for push state peer.", buf, 2u);
  }

  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__GEONavigationServer__openPushStatePeerConnection___block_invoke_153;
  block[3] = &unk_1E1BFF8B0;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  dispatch_async(v3, block);
  objc_destroyWeak(&v5);
}

void __52__GEONavigationServer__openPushStatePeerConnection___block_invoke_153(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_closePushStatePeerConnection");

}

- (void)_closePushStatePeerConnection
{
  NSObject *v3;
  GEONavdPeer *pushStatePeer;
  void *v5;
  GEONavdPeer *v6;
  uint8_t v7[16];

  GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEFAULT, "Closing push state peer connection.", v7, 2u);
  }

  pushStatePeer = self->_pushStatePeer;
  if (pushStatePeer)
  {
    -[GEONavdPeer connection](pushStatePeer, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    v6 = self->_pushStatePeer;
    self->_pushStatePeer = 0;

  }
}

- (void)_notifyListenersOpenConnection
{
  NSObject *v3;
  uint8_t v4[16];

  if (!self->_isListenerConnectionOpen)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEFAULT, "Navigation server notifying listeners to open", v4, 2u);
    }

    self->_isListenerConnectionOpen = 1;
    notify_set_state(self->_listenerConnectionOpenToken, 1uLL);
    notify_post("com.apple.GeoServices.navigation.openListenerConnection");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationVoiceVolumeData, 0);
  objc_storeStrong((id *)&self->_positionFromDestinationData, 0);
  objc_storeStrong((id *)&self->_positionFromManeuverData, 0);
  objc_storeStrong((id *)&self->_positionFromSignData, 0);
  objc_storeStrong((id *)&self->_rideSelectionsData, 0);
  objc_storeStrong((id *)&self->_stepNameInfoData, 0);
  objc_storeStrong((id *)&self->_stepIndexData, 0);
  objc_storeStrong((id *)&self->_activeRouteDetailsData, 0);
  objc_storeStrong((id *)&self->_guidanceStateData, 0);
  objc_storeStrong((id *)&self->_transitSummaryData, 0);
  objc_storeStrong((id *)&self->_routeSummaryData, 0);
  objc_storeStrong((id *)&self->_timeAndDistanceInfo, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_unEntitledPeers, 0);
  objc_storeStrong((id *)&self->_listenerPeers, 0);
  objc_storeStrong((id *)&self->_pushStatePeer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
