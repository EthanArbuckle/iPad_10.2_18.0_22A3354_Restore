@implementation MRUNowPlayingControllerManager

+ (MRUNowPlayingControllerManager)sharedManager
{
  if (sharedManager___once != -1)
    dispatch_once(&sharedManager___once, &__block_literal_global_10);
  return (MRUNowPlayingControllerManager *)(id)sharedManager___sharedManager;
}

void __47__MRUNowPlayingControllerManager_sharedManager__block_invoke()
{
  MRUNowPlayingControllerManager *v0;
  void *v1;

  v0 = objc_alloc_init(MRUNowPlayingControllerManager);
  v1 = (void *)sharedManager___sharedManager;
  sharedManager___sharedManager = (uint64_t)v0;

}

- (MRUNowPlayingControllerManager)init
{
  MRUNowPlayingControllerManager *v2;
  uint64_t v3;
  NSDictionary *controllerMap;
  uint64_t v5;
  NSHashTable *observers;
  id v7;
  void *v8;
  MediaControlsEndpointsManager *v9;
  MediaControlsEndpointsManager *endpointsManager;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MRUNowPlayingControllerManager;
  v2 = -[MRUNowPlayingControllerManager init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    controllerMap = v2->_controllerMap;
    v2->_controllerMap = (NSDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    if (MRAVOutputContextGetSharedAudioPresentationContext())
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CC23D8]);
      objc_msgSend(v7, "setStyle:", 0);
      v8 = (void *)MRAVOutputContextCopyUniqueIdentifier();
      objc_msgSend(v7, "setRoutingContextUID:", v8);

      objc_msgSend(v7, "setAllowsNowPlayingApplicationLaunch:", 1);
      v9 = -[MediaControlsEndpointsManager initWithConfiguration:]([MediaControlsEndpointsManager alloc], "initWithConfiguration:", v7);
      endpointsManager = v2->_endpointsManager;
      v2->_endpointsManager = v9;

      -[MediaControlsEndpointsManager setDelegate:](v2->_endpointsManager, "setDelegate:", v2);
    }
    -[MRUNowPlayingControllerManager updateNowPlayingControllers](v2, "updateNowPlayingControllers");
    -[MRUNowPlayingControllerManager updateActiveController](v2, "updateActiveController");
  }
  return v2;
}

- (void)setActiveController:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  MRUNowPlayingController *v8;

  v8 = (MRUNowPlayingController *)a3;
  if (self->_activeController != v8)
  {
    objc_storeStrong((id *)&self->_activeController, a3);
    -[MRUNowPlayingController endpointController](v8, "endpointController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "route");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4C608]), "initWithName:requestID:reason:userInitiated:", CFSTR("collectionView:didSelectItemAtIndexPath:"), 0, CFSTR("User selected active system endpoint"), 1);
    -[MediaControlsEndpointsManager setActiveSystemRoute:requestDetails:](self->_endpointsManager, "setActiveSystemRoute:requestDetails:", v6, v7);
    -[MRUNowPlayingControllerManager notifyObserversDidChangeActiveController:](self, "notifyObserversDidChangeActiveController:", v8);

  }
}

- (MRUArtworkBackdropDataSource)artworkBackdropDataSource
{
  MRUArtworkBackdropDataSource *artworkBackdropDataSource;
  MRUArtworkBackdropDataSource *v4;
  MRUArtworkBackdropDataSource *v5;

  artworkBackdropDataSource = self->_artworkBackdropDataSource;
  if (!artworkBackdropDataSource)
  {
    v4 = objc_alloc_init(MRUArtworkBackdropDataSource);
    v5 = self->_artworkBackdropDataSource;
    self->_artworkBackdropDataSource = v4;

    artworkBackdropDataSource = self->_artworkBackdropDataSource;
  }
  return artworkBackdropDataSource;
}

- (void)updateDiscoveryMode
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "discoveryMode");
        if (v6 <= v9)
          v6 = v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  if (v6 >= 3)
    v10 = 3;
  else
    v10 = v6;
  -[MediaControlsEndpointsManager setDiscoveryMode:](self->_endpointsManager, "setDiscoveryMode:", v10);
}

- (id)controllerForIdentifier:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_controllerMap, "objectForKeyedSubscript:", a3);
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)updateAutomaticResponseLoading
{
  void *v2;
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
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)-[NSArray copy](self->_controllers, "copy", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "updateAutomaticResponseLoading");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)endpointsManager:(id)a3 defersRoutesReplacement:(id)a4
{
  id v5;

  v5 = (id)(*((uint64_t (**)(id, SEL, id))a4 + 2))(a4, a2, a3);
  -[MRUNowPlayingControllerManager updateNowPlayingControllers](self, "updateNowPlayingControllers");
  -[MRUNowPlayingControllerManager updateActiveController](self, "updateActiveController");
}

- (void)getOutputDeviceIsPlaying:(id)a3 completion:(id)a4
{
  -[MediaControlsEndpointsManager getOutputDeviceIsPlaying:completion:](self->_endpointsManager, "getOutputDeviceIsPlaying:completion:", a3, a4);
}

- (void)updateNowPlayingControllers
{
  MRUNowPlayingControllerManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  MRUNowPlayingController *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  MRUNowPlayingControllerManager *v21;
  void *v22;
  MRUEndpointController *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  NSArray *controllers;
  uint64_t v28;
  NSDictionary *controllerMap;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v2 = self;
  v51 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[MediaControlsEndpointsManager routes](self->_endpointsManager, "routes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)-[NSDictionary mutableCopy](v2->_controllerMap, "mutableCopy");
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[MediaControlsEndpointsManager routes](v2->_endpointsManager, "routes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v42;
    *(_QWORD *)&v10 = 138412546;
    v35 = v10;
    do
    {
      v13 = 0;
      v36 = v11;
      do
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v13);
        objc_msgSend(v14, "routeUID", v35);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v15);
          v16 = (MRUNowPlayingController *)objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            -[MediaControlsEndpointsManager endpointControllerForRoute:](v2->_endpointsManager, "endpointControllerForRoute:", v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v12;
            v19 = v6;
            v20 = v5;
            v21 = v2;
            v22 = v8;
            v23 = -[MRUEndpointController initWithEndpointController:]([MRUEndpointController alloc], "initWithEndpointController:", v17);
            v16 = -[MRUNowPlayingController initWithEndpointController:]([MRUNowPlayingController alloc], "initWithEndpointController:", v23);

            v8 = v22;
            v2 = v21;
            v5 = v20;
            v6 = v19;
            v12 = v18;
            v11 = v36;

          }
          objc_msgSend(v5, "addObject:", v16);
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v15);
        }
        else
        {
          MCLogCategoryDefault();
          v16 = (MRUNowPlayingController *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR))
          {
            v24 = objc_opt_class();
            *(_DWORD *)buf = v35;
            v47 = v24;
            v48 = 2112;
            v49 = v14;
            _os_log_impl(&dword_1AA991000, &v16->super, OS_LOG_TYPE_ERROR, "%@ ignoring endpoint route with no routeUID: %@", buf, 0x16u);
          }
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v11);
  }

  v25 = -[NSArray isEqualToArray:](v2->_controllers, "isEqualToArray:", v5);
  v26 = objc_msgSend(v5, "copy");
  controllers = v2->_controllers;
  v2->_controllers = (NSArray *)v26;

  v28 = objc_msgSend(v6, "copy");
  controllerMap = v2->_controllerMap;
  v2->_controllerMap = (NSDictionary *)v28;

  if (!v25)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v30 = (void *)-[NSHashTable copy](v2->_observers, "copy");
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v38 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "nowPlayingControllerManager:didChangeControllers:", v2, v5);
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v32);
    }

  }
}

- (void)updateActiveController
{
  void *v3;
  void *v4;
  MRUNowPlayingController *obj;

  -[MediaControlsEndpointsManager activeSystemRoute](self->_endpointsManager, "activeSystemRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "routeUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingControllerManager controllerForIdentifier:](self, "controllerForIdentifier:", v4);
  obj = (MRUNowPlayingController *)objc_claimAutoreleasedReturnValue();

  if (self->_activeController != obj)
  {
    objc_storeStrong((id *)&self->_activeController, obj);
    -[MRUNowPlayingControllerManager notifyObserversDidChangeActiveController:](self, "notifyObserversDidChangeActiveController:", obj);
  }

}

- (void)notifyObserversDidChangeActiveController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "nowPlayingControllerManager:didChangeActiveController:", self, v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSArray)controllers
{
  return self->_controllers;
}

- (void)setControllers:(id)a3
{
  objc_storeStrong((id *)&self->_controllers, a3);
}

- (MRUNowPlayingController)activeController
{
  return self->_activeController;
}

- (void)setArtworkBackdropDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_artworkBackdropDataSource, a3);
}

- (MediaControlsEndpointsManager)endpointsManager
{
  return self->_endpointsManager;
}

- (void)setEndpointsManager:(id)a3
{
  objc_storeStrong((id *)&self->_endpointsManager, a3);
}

- (NSDictionary)controllerMap
{
  return self->_controllerMap;
}

- (void)setControllerMap:(id)a3
{
  objc_storeStrong((id *)&self->_controllerMap, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_controllerMap, 0);
  objc_storeStrong((id *)&self->_endpointsManager, 0);
  objc_storeStrong((id *)&self->_artworkBackdropDataSource, 0);
  objc_storeStrong((id *)&self->_activeController, 0);
  objc_storeStrong((id *)&self->_controllers, 0);
}

@end
