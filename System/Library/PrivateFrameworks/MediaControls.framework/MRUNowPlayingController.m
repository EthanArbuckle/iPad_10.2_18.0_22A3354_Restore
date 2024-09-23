@implementation MRUNowPlayingController

- (MRUNowPlayingController)initWithEndpointController:(id)a3
{
  id v5;
  MRUNowPlayingController *v6;
  uint64_t v7;
  NSHashTable *observers;
  MRUTVRemoteController *v9;
  MRUTVRemoteController *tvRemoteController;
  MRUMPCMetadataDataSource *v11;
  MRUMetadataDataSource *metadataDataSource;
  MRUMetadataController *v13;
  MRUMetadataController *metadataController;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MRUNowPlayingController;
  v6 = -[MRUNowPlayingController init](&v16, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    objc_storeStrong((id *)&v6->_endpointController, a3);
    -[MRUEndpointController addObserver:](v6->_endpointController, "addObserver:", v6);
    v9 = -[MRUTVRemoteController initWithEndpointController:]([MRUTVRemoteController alloc], "initWithEndpointController:", v5);
    tvRemoteController = v6->_tvRemoteController;
    v6->_tvRemoteController = v9;

    -[MRUTVRemoteController setDelegate:](v6->_tvRemoteController, "setDelegate:", v6);
    v11 = -[MRUMPCMetadataDataSource initWithEndpointController:]([MRUMPCMetadataDataSource alloc], "initWithEndpointController:", v5);
    metadataDataSource = v6->_metadataDataSource;
    v6->_metadataDataSource = (MRUMetadataDataSource *)v11;

    v13 = -[MRUMetadataController initWithDataSource:]([MRUMetadataController alloc], "initWithDataSource:", v6->_metadataDataSource);
    metadataController = v6->_metadataController;
    v6->_metadataController = v13;

    -[MRUMetadataController addObserver:](v6->_metadataController, "addObserver:", v6);
  }

  return v6;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MRUEndpointController route](self->_endpointController, "route");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)identifier
{
  return -[MRUEndpointController routeUID](self->_endpointController, "routeUID");
}

- (NSString)nowPlayingInfoIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[MRUNowPlayingController identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingController metadataController](self, "metadataController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nowPlayingInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("|%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)setQueueHandoffCoordinator:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_queueHandoffCoordinator, a3);
  v5 = a3;
  -[MRUNowPlayingQueueHandoffCoordinator setDelegate:](self->_queueHandoffCoordinator, "setDelegate:", self);

}

- (MRUMediaSuggestionsController)mediaSuggestionsController
{
  MRUMediaSuggestionsController *mediaSuggestionsController;
  _BOOL4 v4;
  __objc2_class **v5;
  id v6;
  MRUMediaSuggestionsController *v7;
  void *v8;
  void *v9;
  MRUMediaSuggestionsController *v10;
  MRUMediaSuggestionsController *v11;

  mediaSuggestionsController = self->_mediaSuggestionsController;
  if (!mediaSuggestionsController)
  {
    v4 = +[MRUFeatureFlagProvider isMediaSuggestionsPushEnabled](MRUFeatureFlagProvider, "isMediaSuggestionsPushEnabled");
    v5 = off_1E5817AD8;
    if (!v4)
      v5 = off_1E5817AD0;
    v6 = objc_alloc_init(*v5);
    v7 = [MRUMediaSuggestionsController alloc];
    -[MRUNowPlayingController endpointController](self, "endpointController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUNowPlayingController metadataController](self, "metadataController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MRUMediaSuggestionsController initWithEndpointController:metadataController:dataSource:](v7, "initWithEndpointController:metadataController:dataSource:", v8, v9, v6);
    v11 = self->_mediaSuggestionsController;
    self->_mediaSuggestionsController = v10;

    -[MRUMediaSuggestionsController setDelegate:](self->_mediaSuggestionsController, "setDelegate:", self);
    mediaSuggestionsController = self->_mediaSuggestionsController;
  }
  return mediaSuggestionsController;
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    -[NSHashTable addObject:](self->_observers, "addObject:");
    -[MRUNowPlayingController updateAutomaticResponseLoading](self, "updateAutomaticResponseLoading");
  }
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
    -[MRUNowPlayingController updateAutomaticResponseLoading](self, "updateAutomaticResponseLoading");
  }
}

- (void)updateAutomaticResponseLoading
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
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
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v6 |= objc_msgSend(v9, "nowPlayingControllerShouldAutomaticallyUpdateResponse:", self);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  -[MRUEndpointController endpointController](self->_endpointController, "endpointController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAllowsAutomaticResponseLoading:", v6 & 1);
  objc_msgSend(v10, "setOnScreen:", v6 & 1);
  objc_msgSend(v10, "setDeviceUnlocked:", v6 & 1);
  objc_msgSend(v10, "proxyDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v6 & 1) != 0)
    objc_msgSend(v11, "beginObserving");
  else
    objc_msgSend(v11, "endObserving");

}

- (id)deviceSymbolName
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[MRUEndpointController route](self->_endpointController, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[MRUEndpointController isDeviceSystemRoute](self->_endpointController, "isDeviceSystemRoute"))
  {
    objc_msgSend(MEMORY[0x1E0CC2318], "_currentDeviceRoutingSymbolName");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MRUNowPlayingController outputDevicesSymbolName](self, "outputDevicesSymbolName");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (id)outputDevicesSymbolName
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  int v6;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;
  _BYTE v33[128];
  _QWORD v34[3];

  v34[1] = *MEMORY[0x1E0C80C00];
  -[MRUEndpointController route](self->_endpointController, "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "endpointObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "predictedOutputDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  if ((objc_msgSend(v2, "isSplitRoute") & 1) != 0)
  {
    v5 = CFSTR("person.2.fill");
  }
  else
  {
    v6 = objc_msgSend(v2, "isDeviceSpeakerRoute") ^ 1;
    if (v4)
      v6 = 1;
    if (v6 != 1 || v3 == 0)
    {
      v5 = CFSTR("airplayaudio");
    }
    else
    {
      objc_msgSend(v3, "outputDevices");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v3;
      if (v4)
      {
        v34[0] = v4;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
        v9 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v9;
      }
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v11 = v8;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v25 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
            v17 = objc_alloc(MEMORY[0x1E0CC22F8]);
            v32 = v16;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)objc_msgSend(v17, "initWithOutputDevices:", v18);
            objc_msgSend(v10, "addObject:", v19);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
        }
        while (v13);
      }

      MCLogCategoryDefault();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v29 = v21;
        v30 = 2114;
        v31 = v10;
        _os_log_impl(&dword_1AA991000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ imageForRoute routes: %{public}@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CC2318], "_symbolNameForRoutes:", v10);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v3 = v23;
    }
  }

  return v5;
}

- (void)imageForRoute:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  MRUMetadataController *metadataController;
  void *v30;
  void (**v31)(id, uint64_t);
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[5];
  void (**v37)(id, uint64_t);
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;
  _BYTE v43[128];
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "endpointObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predictedOutputDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  if (objc_msgSend(v6, "isSplitRoute"))
  {
    +[MRUAssetsProvider wirelessSharing](MRUAssetsProvider, "wirelessSharing");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v11 = (void *)v10;
    v7[2](v7, v10);

    goto LABEL_25;
  }
  v12 = objc_msgSend(v6, "isDeviceSpeakerRoute") ^ 1;
  if (v9)
    v12 = 1;
  if (v12 != 1 || !v8)
  {
    -[MRUMetadataController bundleID](self->_metadataController, "bundleID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      metadataController = self->_metadataController;
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __52__MRUNowPlayingController_imageForRoute_completion___block_invoke;
      v36[3] = &unk_1E5819D58;
      v36[4] = self;
      v37 = v7;
      -[MRUMetadataController representsLongFormVideoContentWithCompletion:](metadataController, "representsLongFormVideoContentWithCompletion:", v36);

      goto LABEL_25;
    }
    +[MRUAssetsProvider airplay](MRUAssetsProvider, "airplay");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v8, "outputDevices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v7;
  v30 = v9;
  if (v9)
  {
    v44[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v14;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v13, "count"));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v16 = v13;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v33 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        v22 = objc_alloc(MEMORY[0x1E0CC22F8]);
        v42 = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v22, "initWithOutputDevices:", v23);
        objc_msgSend(v15, "addObject:", v24);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
    }
    while (v18);
  }

  MCLogCategoryDefault();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v39 = v26;
    v40 = 2114;
    v41 = v15;
    _os_log_impl(&dword_1AA991000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ imageForRoute routes: %{public}@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CC2318], "_symbolImageForRoutes:", v15);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v31;
  v31[2](v31, (uint64_t)v27);

  v9 = v30;
LABEL_25:

}

void __52__MRUNowPlayingController_imageForRoute_completion___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  MCLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = objc_opt_class();
    v9 = 1024;
    v10 = a2;
    _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ imageForRoute representsLongFormVideoContent: %d", (uint8_t *)&v7, 0x12u);
  }

  v5 = *(_QWORD *)(a1 + 40);
  if ((a2 & 1) != 0)
    +[MRUAssetsProvider airplayVideo](MRUAssetsProvider, "airplayVideo");
  else
    +[MRUAssetsProvider airplay](MRUAssetsProvider, "airplay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

}

- (void)routingDeviceImage:(id)a3
{
  MRUEndpointController *endpointController;
  id v5;
  id v6;

  endpointController = self->_endpointController;
  v5 = a3;
  -[MRUEndpointController route](endpointController, "route");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingController imageForRoute:completion:](self, "imageForRoute:completion:", v6, v5);

}

- (void)endpointController:(id)a3 didChangeRoute:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "nowPlayingController:endpointController:didChangeRoute:", self, v6, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)tvRemoteController:(id)a3 didChangeShowTVRemote:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "nowPlayingController:tvRemoteController:didChangeShowTVRemote:", self, v6, v4);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  if (v4)
  {
    -[MRUEndpointController endpointController](self->_endpointController, "endpointController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "allowsAutomaticResponseLoading");

    if (v14)
      objc_msgSend(v6, "prewarmIfNeeded");
  }
  -[MRUNowPlayingController updateQuickTransportItem](self, "updateQuickTransportItem");

}

- (void)metadataController:(id)a3 didChangeBundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "nowPlayingController:metadataController:didChangeBundleID:", self, v6, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)metadataController:(id)a3 didChangeArtwork:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "nowPlayingController:metadataController:didChangeArtwork:", self, v6, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)metadataController:(id)a3 didChangeNowPlayingInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "nowPlayingController:metadataController:didChangeNowPlayingInfo:", self, v6, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  -[MRUNowPlayingController updateQuickTransportItem](self, "updateQuickTransportItem");
}

- (void)metadataController:(id)a3 didChangeTimeControls:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "nowPlayingController:metadataController:didChangeTimeControls:", self, v6, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)metadataController:(id)a3 didChangeTransportControls:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "nowPlayingController:metadataController:didChangeTransportControls:", self, v6, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  -[MRUNowPlayingController updateQuickTransportItem](self, "updateQuickTransportItem");
}

- (void)mediaSuggestionsController:(id)a3 didChangeMediaSuggestions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "nowPlayingController:mediaSuggestionsController:didChangeMediaSuggestions:", self, v6, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)queueHandoffCoordinator:(id)a3 didChangeState:(int64_t)a4
{
  id v6;
  MRUMRMetadataDataSource *v7;
  MRUEndpointController *endpointController;
  void *v9;
  MRUMRMetadataDataSource *v10;
  MRUMRMetadataDataSource *v11;
  _QWORD *p_metadataDataSource;
  void *v13;
  uint64_t v14;
  MRUNowPlayingQueueHandoffCoordinator *queueHandoffCoordinator;
  MRUMRMetadataDataSource *handoffDataSource;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4 == 4)
  {
    queueHandoffCoordinator = self->_queueHandoffCoordinator;
    self->_queueHandoffCoordinator = 0;

    handoffDataSource = self->_handoffDataSource;
    self->_handoffDataSource = 0;

    v14 = 0;
    p_metadataDataSource = &self->_metadataDataSource;
LABEL_6:
    -[MRUMetadataController setDataSource:](self->_metadataController, "setDataSource:", *p_metadataDataSource);
    goto LABEL_7;
  }
  if (a4 != 1)
    goto LABEL_8;
  v7 = [MRUMRMetadataDataSource alloc];
  endpointController = self->_endpointController;
  objc_msgSend(v6, "response");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MRUMRMetadataDataSource initWithEndpointController:response:](v7, "initWithEndpointController:response:", endpointController, v9);
  p_metadataDataSource = &self->_handoffDataSource;
  v11 = self->_handoffDataSource;
  self->_handoffDataSource = v10;

  objc_msgSend(v6, "response");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 1;
  if (v13)
    goto LABEL_6;
LABEL_7:
  -[MRUMediaSuggestionsController setIsQueueHandoffActive:](self->_mediaSuggestionsController, "setIsQueueHandoffActive:", v14);
LABEL_8:
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v17 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v21);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v22, "nowPlayingController:queueHandoffCoordinator:didChangeState:", self, v6, a4);
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v19);
  }

}

- (void)queueHandoffCoordinator:(id)a3 didChangeResponse:(id)a4
{
  void *v6;
  uint64_t v7;

  objc_msgSend(a3, "response");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUMRMetadataDataSource setResponse:](self->_handoffDataSource, "setResponse:", v6);

  v7 = 64;
  if (!a4)
    v7 = 72;
  -[MRUMetadataController setDataSource:](self->_metadataController, "setDataSource:", *(Class *)((char *)&self->super.isa + v7));
}

- (void)updateQuickTransportItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MRUTransportControlItem *v7;
  MRUTransportControlItem *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  id location;
  uint8_t v23[128];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  MRUTransportControlItem *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[MRUMetadataController nowPlayingInfo](self->_metadataController, "nowPlayingInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingController tvRemoteController](self, "tvRemoteController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v4);

  if (-[MRUEndpointController state](self->_endpointController, "state") == 3
    && (objc_msgSend(v3, "showPlaceholder") & 1) == 0)
  {
    -[MRUMetadataController transportControls](self->_metadataController, "transportControls");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerItem");
    v8 = (MRUTransportControlItem *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[MRUTVRemoteController showTVRemote](self->_tvRemoteController, "showTVRemote")
      || !objc_msgSend(v3, "showPlaceholder"))
    {
      v8 = 0;
      goto LABEL_9;
    }
    +[MRUAssetsProvider tvRemote](MRUAssetsProvider, "tvRemote");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[MRUAsset image:](MRUAsset, "image:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = [MRUTransportControlItem alloc];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __51__MRUNowPlayingController_updateQuickTransportItem__block_invoke;
    v20[3] = &unk_1E5818E18;
    objc_copyWeak(&v21, &location);
    v8 = -[MRUTransportControlItem initWithIdentifier:asset:mainAction:](v7, "initWithIdentifier:asset:mainAction:", CFSTR("tvremote"), v6, v20);
    objc_destroyWeak(&v21);
  }

LABEL_9:
  objc_storeStrong((id *)&self->_quickControlItem, v8);
  MCLogCategoryDefault();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v25 = v10;
    v26 = 2114;
    v27 = v8;
    _os_log_impl(&dword_1AA991000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ update quick transport controls: %{public}@", buf, 0x16u);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v15, "nowPlayingController:didChangeQuickControlItem:", self, v8);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
    }
    while (v12);
  }

  objc_destroyWeak(&location);
}

void __51__MRUNowPlayingController_updateQuickTransportItem__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentTVRemoteUsingApp:", 0);

}

- (MRUEndpointController)endpointController
{
  return self->_endpointController;
}

- (MRUTVRemoteController)tvRemoteController
{
  return self->_tvRemoteController;
}

- (MRUMetadataController)metadataController
{
  return self->_metadataController;
}

- (MRUNowPlayingQueueHandoffCoordinator)queueHandoffCoordinator
{
  return self->_queueHandoffCoordinator;
}

- (MRUTransportControlItem)quickControlItem
{
  return self->_quickControlItem;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (MRUMRMetadataDataSource)handoffDataSource
{
  return self->_handoffDataSource;
}

- (void)setHandoffDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_handoffDataSource, a3);
}

- (MRUMetadataDataSource)metadataDataSource
{
  return self->_metadataDataSource;
}

- (void)setMetadataDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_metadataDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataDataSource, 0);
  objc_storeStrong((id *)&self->_handoffDataSource, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_quickControlItem, 0);
  objc_storeStrong((id *)&self->_queueHandoffCoordinator, 0);
  objc_storeStrong((id *)&self->_metadataController, 0);
  objc_storeStrong((id *)&self->_tvRemoteController, 0);
  objc_storeStrong((id *)&self->_endpointController, 0);
  objc_storeStrong((id *)&self->_mediaSuggestionsController, 0);
}

@end
