@implementation MediaControlsActiveEndpointController

- (MediaControlsActiveEndpointController)initWithActiveEndpointType:(int64_t)a3
{
  void *v5;
  MediaControlsActiveEndpointController *v6;
  void *v7;
  objc_super v9;

  objc_msgSend(MEMORY[0x1E0CC2318], "systemRoute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)MediaControlsActiveEndpointController;
  v6 = -[MediaControlsEndpointController initWithEndpoint:](&v9, sel_initWithEndpoint_, v5);

  if (v6)
  {
    v6->_endpointType = a3;
    -[MediaControlsEndpointController setConnectionDelegate:](v6, "setConnectionDelegate:", v6);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel_activeSystemRouteDidChangeNotification_, *MEMORY[0x1E0D4C770], 0);

    -[MediaControlsActiveEndpointController _updateActiveSystemRoute](v6, "_updateActiveSystemRoute");
  }
  return v6;
}

- (void)setOnScreen:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (-[MediaControlsEndpointController onScreen](self, "onScreen") != v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)MediaControlsActiveEndpointController;
    -[MediaControlsEndpointController setOnScreen:](&v5, sel_setOnScreen_, v3);
    if (-[MediaControlsActiveEndpointController isDeferred](self, "isDeferred"))
    {
      -[MediaControlsActiveEndpointController _maybeRestoreDeferredPlayerPath](self, "_maybeRestoreDeferredPlayerPath");
    }
    else if (v3)
    {
      -[MediaControlsActiveEndpointController _maybeUpdateActiveSystemRoute](self, "_maybeUpdateActiveSystemRoute");
    }
  }
}

- (void)setDeviceUnlocked:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (-[MediaControlsEndpointController deviceUnlocked](self, "deviceUnlocked") != v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)MediaControlsActiveEndpointController;
    -[MediaControlsEndpointController setDeviceUnlocked:](&v5, sel_setDeviceUnlocked_, v3);
    -[MediaControlsActiveEndpointController _maybeRestoreDeferredPlayerPath](self, "_maybeRestoreDeferredPlayerPath");
  }
}

- (void)setActiveEndpointUID:(id)a3
{
  id v4;
  NSString *activeEndpointUID;
  id v6;

  v4 = a3;
  MRAVEndpointGetLocalEndpoint();
  v6 = (id)MRAVEndpointCopyUniqueIdentifier();
  if (objc_msgSend(v4, "isEqualToString:"))
  {

    v4 = 0;
  }
  activeEndpointUID = self->_activeEndpointUID;
  self->_activeEndpointUID = (NSString *)v4;

}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  id v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;

  v4 = a4;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != (void *)*MEMORY[0x1E0CC1CC0];
  if (v5 == (void *)*MEMORY[0x1E0CC1CC0])
  {
    v7 = objc_msgSend(v4, "code");

    if (v7 != 2)
    {
      v6 = 1;
      goto LABEL_6;
    }
    v8 = (void *)MEMORY[0x1E0CC2318];
    objc_msgSend(MEMORY[0x1E0CC2318], "systemRoute");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActiveRoute:reason:completion:", v5, CFSTR("invalid route error"), 0);
  }

LABEL_6:
  return v6;
}

- (void)endpointController:(id)a3 willAttemptToConnectToRoute:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  if (-[MediaControlsActiveEndpointController endpointType](self, "endpointType") == 1)
  {
    objc_msgSend(v6, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reset");

  }
}

- (void)activeSystemRouteDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  MediaControlsActiveEndpointController *v13;
  __int16 v14;
  uint64_t active;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D4C760]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (int)objc_msgSend(v6, "intValue");

  MCLogCategoryRouting();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = self;
    v14 = 2114;
    active = MRMediaRemoteActiveEndpointTypeCopyDescription();
    _os_log_impl(&dword_1AA991000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@ activeSystemRouteDidChangeNotification] with type %{public}@", (uint8_t *)&v12, 0x16u);
  }

  if (-[MediaControlsActiveEndpointController endpointType](self, "endpointType") == v7)
  {
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D4C758]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (int)objc_msgSend(v10, "intValue");

    -[MediaControlsActiveEndpointController _activeSystemRouteDidChangeWithChangeType:](self, "_activeSystemRouteDidChangeWithChangeType:", v11);
  }

}

- (id)_routeForEndpoint:(__MRAVEndpointRef *)a3
{
  uint64_t ExternalDevice;
  void *v5;
  void *v6;

  ExternalDevice = MRAVEndpointGetExternalDevice();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC22E0]), "initWithEndpoint:", a3);
  if (ExternalDevice)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC2310]), "initWithExternalDevice:", ExternalDevice);
    objc_msgSend(v5, "setConnection:", v6);

  }
  return v5;
}

- (void)_resetDeferredPlayerPath
{
  -[MediaControlsActiveEndpointController setIsDeferred:](self, "setIsDeferred:", 0);
  -[MediaControlsActiveEndpointController setActiveEndpointUID:](self, "setActiveEndpointUID:", 0);
  -[MediaControlsActiveEndpointController setDeferredPlayerPathFuture:](self, "setDeferredPlayerPathFuture:", 0);
  -[MediaControlsActiveEndpointController setDeferredPlayerPathInvalidationToken:](self, "setDeferredPlayerPathInvalidationToken:", 0);
  -[MediaControlsActiveEndpointController setDeferredPlayerPathTimer:](self, "setDeferredPlayerPathTimer:", 0);
}

- (void)_restoreDeferredPlayerPath
{
  -[MediaControlsActiveEndpointController _resetDeferredPlayerPath](self, "_resetDeferredPlayerPath");
  -[MediaControlsActiveEndpointController _updateActiveSystemRoute](self, "_updateActiveSystemRoute");
}

- (void)_maybeRestoreDeferredPlayerPath
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  const __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (-[MediaControlsActiveEndpointController isDeferred](self, "isDeferred"))
  {
    -[MediaControlsActiveEndpointController deferredPlayerPathFuture](self, "deferredPlayerPathFuture");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    -[MediaControlsActiveEndpointController activeEndpointUID](self, "activeEndpointUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && -[MediaControlsEndpointController deviceUnlocked](self, "deviceUnlocked"))
      v5 = !-[MediaControlsEndpointController onScreen](self, "onScreen");
    else
      v5 = 0;
    v6 = v3 ? v5 : 1;

    -[MediaControlsActiveEndpointController deferredPlayerPathTimer](self, "deferredPlayerPathTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = !v7 && !-[MediaControlsEndpointController onScreen](self, "onScreen");
    v9 = v6 | v8;

    if (v9)
    {
      MCLogCategoryRouting();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_activeEndpointUID);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[MediaControlsActiveEndpointController activeEndpointUID](self, "activeEndpointUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel_deferredPlayerPathFuture);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MediaControlsActiveEndpointController deferredPlayerPathFuture](self, "deferredPlayerPathFuture");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "result");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel_deferredPlayerPathTimer);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[MediaControlsActiveEndpointController deferredPlayerPathTimer](self, "deferredPlayerPathTimer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel_onScreen);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[MediaControlsEndpointController onScreen](self, "onScreen"))
          v15 = CFSTR("YES");
        else
          v15 = CFSTR("NO");
        NSStringFromSelector(sel_deviceUnlocked);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138414594;
        if (-[MediaControlsEndpointController deviceUnlocked](self, "deviceUnlocked"))
          v17 = CFSTR("YES");
        else
          v17 = CFSTR("NO");
        v23 = v21;
        v24 = 2112;
        v25 = v11;
        v26 = 2112;
        v27 = v12;
        v28 = 2112;
        v29 = v19;
        v30 = 2112;
        v31 = v13;
        v32 = 2112;
        v33 = v18;
        v34 = 2112;
        v35 = v14;
        v36 = 2112;
        v37 = v15;
        v38 = 2112;
        v39 = v16;
        v40 = 2112;
        v41 = v17;
        _os_log_impl(&dword_1AA991000, v10, OS_LOG_TYPE_ERROR, "Restoring deferredPlayerPath because %@=%@, %@=%@, %@=%@, %@=%@, %@=%@", buf, 0x66u);

      }
      -[MediaControlsActiveEndpointController _restoreDeferredPlayerPath](self, "_restoreDeferredPlayerPath");
    }
  }
}

- (void)_updateActiveSystemRoute
{
  NSObject *v3;
  _QWORD v4[5];
  id v5;
  uint8_t buf[4];
  MediaControlsActiveEndpointController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MCLogCategoryRouting();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_1AA991000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@ _updateActiveSystemRoute]", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__MediaControlsActiveEndpointController__updateActiveSystemRoute__block_invoke;
  v4[3] = &unk_1E5818DA0;
  objc_copyWeak(&v5, (id *)buf);
  v4[4] = self;
  -[MediaControlsActiveEndpointController _fetchActiveSystemRoute:](self, "_fetchActiveSystemRoute:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak((id *)buf);
}

void __65__MediaControlsActiveEndpointController__updateActiveSystemRoute__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_resetDeferredPlayerPath");
    objc_msgSend(v5, "_routeForEndpoint:", objc_msgSend(objc_retainAutorelease(v3), "unwrappedValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endpointWrapper");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "unwrappedValue");
    v8 = (void *)MRAVEndpointCopyUniqueIdentifier();

    objc_msgSend(*(id *)(a1 + 32), "route");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endpointWrapper");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "unwrappedValue");
    v11 = (void *)MRAVEndpointCopyUniqueIdentifier();

    if (v8 == v11)
      v12 = 1;
    else
      v12 = objc_msgSend(v8, "isEqual:", v11);
    objc_msgSend(*(id *)(a1 + 32), "route");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isInvalidated");

    if (!v12 || v15)
    {
      objc_msgSend(v5, "setRoute:", v6);
      objc_msgSend(v5, "updateRoutePropertiesIfNeeded");
      if ((v12 & 1) == 0)
      {
        MCLogCategoryRouting();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = *(_QWORD *)(a1 + 32);
          v18 = 138543874;
          v19 = v17;
          v20 = 2112;
          v21 = v11;
          v22 = 2114;
          v23 = v8;
          _os_log_impl(&dword_1AA991000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@ _updateActiveSystemRoute] route update from %{@public}@ to %{public}@", (uint8_t *)&v18, 0x20u);
        }

      }
    }

  }
}

- (void)_maybeUpdateActiveSystemRoute
{
  void *v3;
  id v4;

  -[MediaControlsEndpointController route](self, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsActiveEndpointController endpointType](self, "endpointType");
  v4 = v3;
  MRAVEndpointGetActiveSystemEndpointUID();

}

void __70__MediaControlsActiveEndpointController__maybeUpdateActiveSystemRoute__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "endpoint");
  v4 = (void *)MRAVEndpointCopyOutputDevices();
  if (!v3 && (objc_msgSend(*(id *)(a1 + 32), "isDeviceRoute") & 1) != 0)
  {
LABEL_13:
    objc_msgSend(*(id *)(a1 + 40), "route");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isInvalidated");

    if ((v14 & 1) == 0)
      goto LABEL_17;
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
          v11 = objc_msgSend(v3, "isEqualToString:", v10, v17);

          if ((v11 & 1) != 0)
          {

            goto LABEL_13;
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
        if (v7)
          continue;
        break;
      }
    }

  }
  MCLogCategoryRouting();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v22 = v16;
    _os_log_impl(&dword_1AA991000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@ _maybeUpdateActiveSystemRoute] triggering route update", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "_updateActiveSystemRoute");
LABEL_17:

}

- (void)_fetchActiveSystemRoute:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  uint8_t buf[4];
  MediaControlsActiveEndpointController *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MCLogCategoryRouting();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = self;
    _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@ _fetchActiveSystemRoute]", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[MediaControlsActiveEndpointController endpointType](self, "endpointType");
  v6 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&v8, (id *)buf);
  v7 = v4;
  MRAVEndpointResolveActiveSystemEndpointWithType();

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);

}

void __65__MediaControlsActiveEndpointController__fetchActiveSystemRoute___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = (void *)MRAVEndpointCopyUniqueIdentifier();
    objc_msgSend(WeakRetained, "setActiveEndpointUID:", v5);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    MCLogCategoryRouting();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v10 = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = a2;
      _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@ _fetchActiveSystemRoute] completing with endpoint %{public}@", (uint8_t *)&v10, 0x16u);
    }

    v8 = *(_QWORD *)(a1 + 40);
    if (a2)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC23A8]), "initWithMRAVEndpoint:", a2);
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
    }
  }

}

- (void)_activeSystemRouteDidChangeWithChangeType:(int64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  MediaControlsActiveEndpointController *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  MCLogCategoryRouting();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = MRMediaRemoteActiveEndpointChangeTypeCopyDescription();
    _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@ _activeSystemRouteDidChangeWithChangeType] with type %{public}@", buf, 0x16u);
  }

  if (a3 == 1 && -[MediaControlsEndpointController onScreen](self, "onScreen"))
  {
    MCLogCategoryRouting();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v10 = self;
      _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@ _activeSystemRouteDidChangeWithChangeType] deferring update", buf, 0xCu);
    }

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __83__MediaControlsActiveEndpointController__activeSystemRouteDidChangeWithChangeType___block_invoke;
    v8[3] = &unk_1E5818E68;
    v8[4] = self;
    -[MediaControlsActiveEndpointController _fetchActiveSystemRoute:](self, "_fetchActiveSystemRoute:", v8);
  }
  else
  {
    MCLogCategoryRouting();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v10 = self;
      _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@ _activeSystemRouteDidChangeWithChangeType] updating route immediately", buf, 0xCu);
    }

    -[MediaControlsActiveEndpointController _updateActiveSystemRoute](self, "_updateActiveSystemRoute");
  }
}

void __83__MediaControlsActiveEndpointController__activeSystemRouteDidChangeWithChangeType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D4B378], "sharedCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "playerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedPlayerPathForPlayerPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__MediaControlsActiveEndpointController__activeSystemRouteDidChangeWithChangeType___block_invoke_2;
  v9[3] = &unk_1E5818E40;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v7 = v3;
  v8 = (id)objc_msgSend(v6, "onCompletion:", v9);

}

void __83__MediaControlsActiveEndpointController__activeSystemRouteDidChangeWithChangeType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id location;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v7, "_updateActiveSystemRoute");
  }
  else
  {
    objc_msgSend(v7, "setIsDeferred:", 1);
    objc_msgSend(MEMORY[0x1E0D4B378], "sharedCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resolvedPlayerPathForPlayerPath:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setDeferredPlayerPathFuture:", v9);

    objc_initWeak(&location, *(id *)(a1 + 32));
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    v11 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __83__MediaControlsActiveEndpointController__activeSystemRouteDidChangeWithChangeType___block_invoke_3;
    v26[3] = &unk_1E5818E18;
    objc_copyWeak(&v27, &location);
    objc_msgSend(v10, "onInvalid:", v26);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setDeferredPlayerPathInvalidationToken:", v12);

    +[MediaControlsActiveEndpointController mediaRecentlyPlayedTimeout](MediaControlsActiveEndpointController, "mediaRecentlyPlayedTimeout");
    v14 = v13;
    objc_msgSend(*(id *)(a1 + 32), "route");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "endpoint");
    v16 = (void *)MRAVEndpointCopyLocalizedName();

    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "unwrappedValue");
    v17 = (void *)MRAVEndpointCopyLocalizedName();
    v18 = v11;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("deferredplayerPathTimer: Remaining at %@ instead of changing to %@"), v16, v17);
    v20 = objc_alloc(MEMORY[0x1E0D4D0C0]);
    v21 = MEMORY[0x1E0C80D38];
    v22 = MEMORY[0x1E0C80D38];
    v24[0] = v18;
    v24[1] = 3221225472;
    v24[2] = __83__MediaControlsActiveEndpointController__activeSystemRouteDidChangeWithChangeType___block_invoke_4;
    v24[3] = &unk_1E5818E18;
    objc_copyWeak(&v25, &location);
    v23 = (void *)objc_msgSend(v20, "initWithInterval:name:queue:block:", v19, v21, v24, v14);
    objc_msgSend(*(id *)(a1 + 32), "setDeferredPlayerPathTimer:", v23);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

}

void __83__MediaControlsActiveEndpointController__activeSystemRouteDidChangeWithChangeType___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setDeferredPlayerPathFuture:", 0);
    objc_msgSend(v2, "setDeferredPlayerPathInvalidationToken:", 0);
    objc_msgSend(v2, "_maybeRestoreDeferredPlayerPath");
    WeakRetained = v2;
  }

}

void __83__MediaControlsActiveEndpointController__activeSystemRouteDidChangeWithChangeType___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setDeferredPlayerPathTimer:", 0);
    objc_msgSend(v2, "_maybeRestoreDeferredPlayerPath");
    WeakRetained = v2;
  }

}

+ (double)mediaRecentlyPlayedTimeout
{
  if (mediaRecentlyPlayedTimeout_once != -1)
    dispatch_once(&mediaRecentlyPlayedTimeout_once, &__block_literal_global_2);
  return *(double *)&mediaRecentlyPlayedTimeout_timeout;
}

void __67__MediaControlsActiveEndpointController_mediaRecentlyPlayedTimeout__block_invoke()
{
  void *v0;
  uint64_t v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mediaremote"));
  objc_msgSend(v2, "objectForKey:", CFSTR("MediaRecentlyPlayedInterval"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();

  if (v0)
  {
    objc_msgSend(v2, "doubleForKey:", CFSTR("MediaRecentlyPlayedInterval"));
    mediaRecentlyPlayedTimeout_timeout = v1;
  }

}

- (int64_t)endpointType
{
  return self->_endpointType;
}

- (void)setEndpointType:(int64_t)a3
{
  self->_endpointType = a3;
}

- (NSString)activeRouteUID
{
  return self->_activeRouteUID;
}

- (MPCFuture)deferredPlayerPathFuture
{
  return self->_deferredPlayerPathFuture;
}

- (void)setDeferredPlayerPathFuture:(id)a3
{
  objc_storeStrong((id *)&self->_deferredPlayerPathFuture, a3);
}

- (id)deferredPlayerPathInvalidationToken
{
  return self->_deferredPlayerPathInvalidationToken;
}

- (void)setDeferredPlayerPathInvalidationToken:(id)a3
{
  objc_storeStrong(&self->_deferredPlayerPathInvalidationToken, a3);
}

- (MSVPersistentTimer)deferredPlayerPathTimer
{
  return self->_deferredPlayerPathTimer;
}

- (void)setDeferredPlayerPathTimer:(id)a3
{
  objc_storeStrong((id *)&self->_deferredPlayerPathTimer, a3);
}

- (NSString)activeEndpointUID
{
  return self->_activeEndpointUID;
}

- (BOOL)isDeferred
{
  return self->_isDeferred;
}

- (void)setIsDeferred:(BOOL)a3
{
  self->_isDeferred = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeEndpointUID, 0);
  objc_storeStrong((id *)&self->_deferredPlayerPathTimer, 0);
  objc_storeStrong(&self->_deferredPlayerPathInvalidationToken, 0);
  objc_storeStrong((id *)&self->_deferredPlayerPathFuture, 0);
  objc_storeStrong((id *)&self->_activeRouteUID, 0);
}

@end
