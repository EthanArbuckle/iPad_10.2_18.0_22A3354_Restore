@implementation MPRemoteRadioController

- (void)start
{
  os_unfair_lock_s *p_lock;
  NSXPCListener *v4;
  NSXPCListener *listener;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_listener)
  {
    v4 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.MediaPlayer.MPRadioControllerServer"));
    listener = self->_listener;
    self->_listener = v4;

    -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
    -[NSXPCListener resume](self->_listener, "resume");
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_radioAvailabilityControllerRadioAvailableDidChangeNotification:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableSet copy](self->_connections, "copy");
  os_unfair_lock_unlock(p_lock);
  v6 = -[RadioAvailabilityController isRadioAvailable](self->_availabilityController, "isRadioAvailable");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "remoteObjectProxy", (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "clientRadioControllerRadioAvailabilityDidChange:", v6);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (MPRemoteRadioController)init
{
  MPRemoteRadioController *v2;
  MPRemoteRadioController *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  RadioAvailabilityController *v7;
  RadioAvailabilityController *availabilityController;
  _QWORD *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  RadioRecentStationsController *v13;
  RadioRecentStationsController *recentStationsController;
  _QWORD *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  MPRemoteRadioController *result;
  void *v20;
  void *v21;
  objc_super v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v22.receiver = self;
  v22.super_class = (Class)MPRemoteRadioController;
  v2 = -[MPRemoteRadioController init](&v22, sel_init);
  v3 = v2;
  if (!v2)
    return v3;
  v2->_lock._os_unfair_lock_opaque = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v5 = (void *)getRadioAvailabilityControllerClass_softClass;
  v31 = getRadioAvailabilityControllerClass_softClass;
  if (!getRadioAvailabilityControllerClass_softClass)
  {
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = (uint64_t)__getRadioAvailabilityControllerClass_block_invoke;
    v26 = &unk_1E31639A0;
    v27 = &v28;
    __getRadioAvailabilityControllerClass_block_invoke((uint64_t)&v23);
    v5 = (void *)v29[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v28, 8);
  v7 = (RadioAvailabilityController *)objc_alloc_init(v6);
  availabilityController = v3->_availabilityController;
  v3->_availabilityController = v7;

  v23 = 0;
  v24 = (uint64_t)&v23;
  v25 = 0x2020000000;
  v9 = (_QWORD *)getRadioAvailabilityControllerRadioAvailableDidChangeNotificationSymbolLoc_ptr;
  v26 = (void *)getRadioAvailabilityControllerRadioAvailableDidChangeNotificationSymbolLoc_ptr;
  if (!getRadioAvailabilityControllerRadioAvailableDidChangeNotificationSymbolLoc_ptr)
  {
    v10 = RadioLibrary();
    v9 = dlsym(v10, "RadioAvailabilityControllerRadioAvailableDidChangeNotification");
    *(_QWORD *)(v24 + 24) = v9;
    getRadioAvailabilityControllerRadioAvailableDidChangeNotificationSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v23, 8);
  if (v9)
  {
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__radioAvailabilityControllerRadioAvailableDidChangeNotification_, *v9, v3->_availabilityController);
    v28 = 0;
    v29 = &v28;
    v30 = 0x2050000000;
    v11 = (void *)getRadioRecentStationsControllerClass_softClass;
    v31 = getRadioRecentStationsControllerClass_softClass;
    if (!getRadioRecentStationsControllerClass_softClass)
    {
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = (uint64_t)__getRadioRecentStationsControllerClass_block_invoke;
      v26 = &unk_1E31639A0;
      v27 = &v28;
      __getRadioRecentStationsControllerClass_block_invoke((uint64_t)&v23);
      v11 = (void *)v29[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v28, 8);
    v13 = (RadioRecentStationsController *)objc_alloc_init(v12);
    recentStationsController = v3->_recentStationsController;
    v3->_recentStationsController = v13;

    v23 = 0;
    v24 = (uint64_t)&v23;
    v25 = 0x2020000000;
    v15 = (_QWORD *)getRadioRecentStationsControllerStationsDidChangeNotificationSymbolLoc_ptr;
    v26 = (void *)getRadioRecentStationsControllerStationsDidChangeNotificationSymbolLoc_ptr;
    if (!getRadioRecentStationsControllerStationsDidChangeNotificationSymbolLoc_ptr)
    {
      v16 = RadioLibrary();
      v15 = dlsym(v16, "RadioRecentStationsControllerStationsDidChangeNotification");
      *(_QWORD *)(v24 + 24) = v15;
      getRadioRecentStationsControllerStationsDidChangeNotificationSymbolLoc_ptr = (uint64_t)v15;
    }
    _Block_object_dispose(&v23, 8);
    if (v15)
    {
      objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__recentStationsControllerDidChangeStationsNotification_, *v15, v3->_recentStationsController);
      v23 = 0;
      v24 = (uint64_t)&v23;
      v25 = 0x2020000000;
      v17 = (_QWORD *)getMPCJinglePlayActivityReportingControllerDidFlushEventsNotificationSymbolLoc_ptr;
      v26 = (void *)getMPCJinglePlayActivityReportingControllerDidFlushEventsNotificationSymbolLoc_ptr;
      if (!getMPCJinglePlayActivityReportingControllerDidFlushEventsNotificationSymbolLoc_ptr)
      {
        v18 = MediaPlaybackCoreLibrary();
        v17 = dlsym(v18, "MPCJinglePlayActivityReportingControllerDidFlushEventsNotification");
        *(_QWORD *)(v24 + 24) = v17;
        getMPCJinglePlayActivityReportingControllerDidFlushEventsNotificationSymbolLoc_ptr = (uint64_t)v17;
      }
      _Block_object_dispose(&v23, 8);
      if (v17)
      {
        objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__playActivityReportingControllerDidFlushEventsNotification_, *v17, 0);

        return v3;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMPCJinglePlayActivityReportingControllerDidFlushEventsNotification(void)");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("MPRemoteRadioController.m"), 25, CFSTR("%s"), dlerror());
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getRadioRecentStationsControllerStationsDidChangeNotification(void)");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("MPRemoteRadioController.m"), 33, CFSTR("%s"), dlerror());
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getRadioAvailabilityControllerRadioAvailableDidChangeNotification(void)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("MPRemoteRadioController.m"), 32, CFSTR("%s"), dlerror());
  }

  __break(1u);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MPRemoteRadioController;
  -[MPRemoteRadioController dealloc](&v3, sel_dealloc);
}

- (void)serviceRadioControllerGetRadioAvailabilityWithCompletionHandler:(id)a3
{
  -[RadioAvailabilityController getRadioAvailabilityWithCompletionHandler:](self->_availabilityController, "getRadioAvailabilityWithCompletionHandler:", a3);
}

- (void)serviceRadioControllerGetRecentStationGroupsWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t j;
  MPRadioStation *v16;
  MPRadioRecentStationsGroup *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_hasRefreshedStations)
  {
    self->_hasRefreshedStations = 1;
    -[RadioRecentStationsController refreshWithCompletionHandler:](self->_recentStationsController, "refreshWithCompletionHandler:", 0);
  }
  -[RadioRecentStationsController stationGroups](self->_recentStationsController, "stationGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    v20 = v7;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v7;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v24)
    {
      v22 = 0;
      v23 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          objc_msgSend(v9, "stations", v20);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v11)
          {
            v12 = v11;
            v13 = 0;
            v14 = *(_QWORD *)v26;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v26 != v14)
                  objc_enumerationMutation(v10);
                v16 = -[MPRadioStation initWithStation:]([MPRadioStation alloc], "initWithStation:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
                if (v16)
                {
                  if (!v13)
                    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  objc_msgSend(v13, "addObject:", v16);
                }

              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            }
            while (v12);
          }
          else
          {
            v13 = 0;
          }

          if (objc_msgSend(v13, "count"))
          {
            v17 = objc_alloc_init(MPRadioRecentStationsGroup);
            objc_msgSend(v9, "localizedTitle");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPRadioRecentStationsGroup setLocalizedTitle:](v17, "setLocalizedTitle:", v18);

            -[MPRadioRecentStationsGroup setStations:](v17, "setStations:", v13);
            if (v17)
            {
              v19 = v22;
              if (!v22)
                v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(obj, "count"));
              v22 = v19;
              objc_msgSend(v19, "addObject:", v17);
            }

          }
        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v24);
    }
    else
    {
      v22 = 0;
    }

    v4[2](v4, v22, 0);
    v7 = v20;
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.mediaplayer.radio.private"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v7);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE2F2080);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v10);

    objc_msgSend(v7, "setExportedObject:", self);
    MPServiceRadioControllerGetXPCInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v11);

    v12 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __62__MPRemoteRadioController_listener_shouldAcceptNewConnection___block_invoke;
    v20[3] = &unk_1E3162668;
    objc_copyWeak(&v21, &location);
    objc_copyWeak(&v22, &from);
    objc_msgSend(v7, "setInterruptionHandler:", v20);
    v14 = v12;
    v15 = 3221225472;
    v16 = __62__MPRemoteRadioController_listener_shouldAcceptNewConnection___block_invoke_12;
    v17 = &unk_1E3162668;
    objc_copyWeak(&v18, &location);
    objc_copyWeak(&v19, &from);
    objc_msgSend(v7, "setInvalidationHandler:", &v14);
    -[MPRemoteRadioController _addConnection:](self, "_addConnection:", v7, v14, v15, v16, v17);
    objc_msgSend(v7, "resume");
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)_playActivityReportingControllerDidFlushEventsNotification:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v6 = (_QWORD *)getMPCJinglePlayActivityReportingControllerUserInfoDidIncludeRadioStationStartEventSymbolLoc_ptr;
  v14 = getMPCJinglePlayActivityReportingControllerUserInfoDidIncludeRadioStationStartEventSymbolLoc_ptr;
  if (!getMPCJinglePlayActivityReportingControllerUserInfoDidIncludeRadioStationStartEventSymbolLoc_ptr)
  {
    v7 = MediaPlaybackCoreLibrary();
    v6 = dlsym(v7, "MPCJinglePlayActivityReportingControllerUserInfoDidIncludeRadioStationStartEvent");
    v12[3] = (uint64_t)v6;
    getMPCJinglePlayActivityReportingControllerUserInfoDidIncludeRadioStationStartEventSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v11, 8);
  if (v6)
  {
    objc_msgSend(v5, "objectForKey:", *v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (objc_msgSend(v8, "BOOLValue"))
        -[MPRemoteRadioController _handleRecentStationsControllerDidChange](self, "_handleRecentStationsControllerDidChange");
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMPCJinglePlayActivityReportingControllerUserInfoDidIncludeRadioStationStartEvent(void)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("MPRemoteRadioController.m"), 26, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (void)_addConnection:(id)a3
{
  NSMutableSet *connections;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  connections = self->_connections;
  if (!connections)
  {
    v5 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
    v6 = self->_connections;
    self->_connections = v5;

    connections = self->_connections;
  }
  -[NSMutableSet addObject:](connections, "addObject:", v7);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_removeConnection:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSMutableSet *connections;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet removeObject:](self->_connections, "removeObject:", v5);

  if (!-[NSMutableSet count](self->_connections, "count"))
  {
    connections = self->_connections;
    self->_connections = 0;

  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_handleRecentStationsControllerDidChange
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
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

  v16 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableSet copy](self->_connections, "copy");
  os_unfair_lock_unlock(p_lock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "remoteObjectProxy", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "clientRadioControllerRecentStationsDidChange");

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (RadioAvailabilityController)availabilityController
{
  return self->_availabilityController;
}

- (RadioRecentStationsController)recentStationsController
{
  return self->_recentStationsController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentStationsController, 0);
  objc_storeStrong((id *)&self->_availabilityController, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

void __62__MPRemoteRadioController_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  uint8_t v5[16];

  v2 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_ERROR, "[MPRemoteRadioController] Connection interrupted.", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v4)
      objc_msgSend(WeakRetained, "_removeConnection:", v4);

  }
}

void __62__MPRemoteRadioController_listener_shouldAcceptNewConnection___block_invoke_12(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  uint8_t v5[16];

  v2 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_ERROR, "[MPRemoteRadioController] Connection invalidated.", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v4)
      objc_msgSend(WeakRetained, "_removeConnection:", v4);

  }
}

@end
