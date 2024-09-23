@implementation MediaControlsStandaloneEndpointController

- (MediaControlsStandaloneEndpointController)initWithEndpoint:(id)a3 client:(id)a4 player:(id)a5
{
  MediaControlsStandaloneEndpointController *v5;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  MPAVRoutingController *routingController;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MediaControlsStandaloneEndpointController;
  v5 = -[MediaControlsEndpointController initWithEndpoint:client:player:](&v13, sel_initWithEndpoint_client_player_, a3, a4, a5);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC22E8]), "initWithThrottlingEnabled:", 1);
    v7 = objc_alloc(MEMORY[0x1E0CC2318]);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "initWithDataSource:name:", v6, v9);
    routingController = v5->_routingController;
    v5->_routingController = (MPAVRoutingController *)v10;

    -[MPAVRoutingController setDelegate:](v5->_routingController, "setDelegate:", v5);
  }
  return v5;
}

- (MediaControlsStandaloneEndpointController)initWithRouteUID:(id)a3 client:(id)a4 player:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  MediaControlsStandaloneEndpointController *v13;
  MediaControlsStandaloneEndpointController *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && !objc_msgSend(v8, "isEqualToString:", CFSTR("LOCAL")))
  {
    v11 = 0;
    v12 = 0;
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC22E0]), "initWithEndpoint:", MRAVEndpointGetLocalEndpoint());
    v12 = 1;
  }
  v16.receiver = self;
  v16.super_class = (Class)MediaControlsStandaloneEndpointController;
  v13 = -[MediaControlsEndpointController initWithEndpoint:client:player:](&v16, sel_initWithEndpoint_client_player_, v11, v9, v10);
  v14 = v13;
  if (v13)
  {
    v13->_endpointDiscovered = v12;
    -[MediaControlsStandaloneEndpointController setRouteUID:](v13, "setRouteUID:", v8);
  }

  return v14;
}

- (MediaControlsStandaloneEndpointController)initWithEndpoint:(id)a3
{
  return -[MediaControlsStandaloneEndpointController initWithEndpoint:client:player:](self, "initWithEndpoint:client:player:", a3, 0, 0);
}

- (MediaControlsStandaloneEndpointController)initWithRouteUID:(id)a3
{
  return -[MediaControlsStandaloneEndpointController initWithRouteUID:client:player:](self, "initWithRouteUID:client:player:", a3, 0, 0);
}

- (void)dealloc
{
  MPMRAVEndpointObserverWrapper *endpointObserver;
  objc_super v4;

  MEMORY[0x1AF4242FC](-[MPMRAVEndpointObserverWrapper unwrappedValue](self->_endpointObserver, "unwrappedValue"));
  endpointObserver = self->_endpointObserver;
  self->_endpointObserver = 0;

  v4.receiver = self;
  v4.super_class = (Class)MediaControlsStandaloneEndpointController;
  -[MediaControlsStandaloneEndpointController dealloc](&v4, sel_dealloc);
}

- (void)setRouteUID:(id)a3
{
  const void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((-[NSString isEqual:](self->_routeUID, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_routeUID, a3);
    v5 = (const void *)MRAVEndpointObserverCreateWithOutputDeviceUID();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC23A0]), "initWithMRAVEndpointObserver:", v5);
    -[MediaControlsStandaloneEndpointController setEndpointObserver:](self, "setEndpointObserver:", v6);

    CFRelease(v5);
  }

}

- (void)setRoute:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[MediaControlsStandaloneEndpointController setEndpointDiscovered:](self, "setEndpointDiscovered:", v4 != 0);
  -[MediaControlsStandaloneEndpointController updateAllowsAutomaticResponseLoading](self, "updateAllowsAutomaticResponseLoading");
  if (v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)MediaControlsStandaloneEndpointController;
    -[MediaControlsEndpointController setRoute:](&v5, sel_setRoute_, v4);
  }

}

- (void)setAllowsAutomaticResponseLoading:(BOOL)a3
{
  self->_allowsAutomaticResponseLoading = a3;
  -[MediaControlsStandaloneEndpointController updateAllowsAutomaticResponseLoading](self, "updateAllowsAutomaticResponseLoading");
}

- (void)updateAllowsAutomaticResponseLoading
{
  void *v3;
  _BOOL8 allowsAutomaticResponseLoading;
  objc_super v5;

  -[MediaControlsEndpointController route](self, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    allowsAutomaticResponseLoading = self->_allowsAutomaticResponseLoading;
  else
    allowsAutomaticResponseLoading = 0;
  v5.receiver = self;
  v5.super_class = (Class)MediaControlsStandaloneEndpointController;
  -[MediaControlsEndpointController setAllowsAutomaticResponseLoading:](&v5, sel_setAllowsAutomaticResponseLoading_, allowsAutomaticResponseLoading);

}

- (void)setEndpointDiscovered:(BOOL)a3
{
  id v4;

  if (self->_endpointDiscovered != a3)
  {
    self->_endpointDiscovered = a3;
    -[MediaControlsEndpointController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpointControllerDidChangeState:", self);

  }
}

- (void)setEndpointObserver:(id)a3
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id location;

  v5 = a3;
  -[MediaControlsStandaloneEndpointController endpointObserver](self, "endpointObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MediaControlsStandaloneEndpointController endpointObserver](self, "endpointObserver");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    MEMORY[0x1AF4242FC](objc_msgSend(v7, "unwrappedValue"));

  }
  objc_storeStrong((id *)&self->_endpointObserver, a3);
  objc_initWeak(&location, self);
  -[MediaControlsStandaloneEndpointController endpointObserver](self, "endpointObserver");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "unwrappedValue");
  objc_copyWeak(&v9, &location);
  MRAVEndpointObserverAddEndpointChangedCallback();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __65__MediaControlsStandaloneEndpointController_setEndpointObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      objc_msgSend(WeakRetained, "_routeForEndpoint:", a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    MCLogCategoryRouting();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v16 = v8;
      v17 = 2114;
      v18 = v6;
      _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_DEFAULT, "[MediaControlsEndpointController setEndpointObserver] for %{public}@ to %{public}@", buf, 0x16u);
    }

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__MediaControlsStandaloneEndpointController_setEndpointObserver___block_invoke_10;
    v10[3] = &unk_1E5818D50;
    v11 = v5;
    v12 = v6;
    v13 = *(_QWORD *)(a1 + 32);
    v14 = a2;
    v9 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v10);

  }
}

uint64_t __65__MediaControlsStandaloneEndpointController_setEndpointObserver___block_invoke_10(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setRoute:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "setAllowsAutomaticResponseLoading:", *(_QWORD *)(a1 + 56) != 0);
  return objc_msgSend(*(id *)(a1 + 32), "updateRoutePropertiesIfNeeded");
}

- (void)beginObserving
{
  NSObject *v3;
  void *v4;
  id v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MCLogCategoryRouting();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[MediaControlsEndpointController route](self, "route");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1AA991000, v3, OS_LOG_TYPE_DEFAULT, "Begin observing: %{public}@", (uint8_t *)&v6, 0xCu);

  }
  -[MediaControlsStandaloneEndpointController endpointObserver](self, "endpointObserver");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  MEMORY[0x1AF4242E4](objc_msgSend(v5, "unwrappedValue"));

}

- (void)endObserving
{
  NSObject *v3;
  void *v4;
  id v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MCLogCategoryRouting();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[MediaControlsEndpointController route](self, "route");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1AA991000, v3, OS_LOG_TYPE_DEFAULT, "End observing: %{public}@", (uint8_t *)&v6, 0xCu);

  }
  -[MediaControlsStandaloneEndpointController endpointObserver](self, "endpointObserver");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  MEMORY[0x1AF4242FC](objc_msgSend(v5, "unwrappedValue"));

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

- (NSString)routeUID
{
  return self->_routeUID;
}

- (BOOL)isEndpointDiscovered
{
  return self->_endpointDiscovered;
}

- (MPAVRoutingController)routingController
{
  return self->_routingController;
}

- (MPMRAVEndpointObserverWrapper)endpointObserver
{
  return self->_endpointObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointObserver, 0);
  objc_storeStrong((id *)&self->_routingController, 0);
  objc_storeStrong((id *)&self->_routeUID, 0);
}

@end
