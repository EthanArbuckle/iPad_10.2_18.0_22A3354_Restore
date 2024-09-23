@implementation MRMediaControls

- (MRMediaControls)init
{
  MRMediaControlsConfiguration *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MRMediaControls *v9;

  v3 = objc_alloc_init(MRMediaControlsConfiguration);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRMediaControlsConfiguration setPresentingAppBundleID:](v3, "setPresentingAppBundleID:", v5);

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRMediaControlsConfiguration setPresentingAppProcessIdentifier:](v3, "setPresentingAppProcessIdentifier:", objc_msgSend(v6, "processIdentifier"));

  objc_msgSend((Class)getAVAudioSessionClass_0[0](), "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "routingContextUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRMediaControlsConfiguration setRoutingContextUID:](v3, "setRoutingContextUID:", v8);

  -[MRMediaControlsConfiguration setStyle:](v3, "setStyle:", -[MRMediaControls _mediaControlsStyleForRouteSharingPolicy:](self, "_mediaControlsStyleForRouteSharingPolicy:", objc_msgSend(v7, "routeSharingPolicy")));
  v9 = -[MRMediaControls initWithConfiguration:shouldObserveRoutingContextUIDChanges:](self, "initWithConfiguration:shouldObserveRoutingContextUIDChanges:", v3, 1);

  return v9;
}

- (MRMediaControls)initWithConfiguration:(id)a3
{
  return -[MRMediaControls initWithConfiguration:shouldObserveRoutingContextUIDChanges:](self, "initWithConfiguration:shouldObserveRoutingContextUIDChanges:", a3, 1);
}

- (MRMediaControls)initWithRouteSharingPolicy:(unint64_t)a3 routingContextUID:(id)a4
{
  id v6;
  unint64_t v7;
  MRMediaControlsConfiguration *v8;
  void *v9;
  void *v10;
  MRMediaControls *v11;

  v6 = a4;
  v7 = -[MRMediaControls _MPRouteSharingPolicyToAVRouteSharingPolicy:](self, "_MPRouteSharingPolicyToAVRouteSharingPolicy:", a3);
  v8 = objc_alloc_init(MRMediaControlsConfiguration);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRMediaControlsConfiguration setPresentingAppBundleID:](v8, "setPresentingAppBundleID:", v10);

  -[MRMediaControlsConfiguration setRoutingContextUID:](v8, "setRoutingContextUID:", v6);
  -[MRMediaControlsConfiguration setStyle:](v8, "setStyle:", -[MRMediaControls _mediaControlsStyleForRouteSharingPolicy:](self, "_mediaControlsStyleForRouteSharingPolicy:", v7));
  v11 = -[MRMediaControls initWithConfiguration:shouldObserveRoutingContextUIDChanges:](self, "initWithConfiguration:shouldObserveRoutingContextUIDChanges:", v8, 0);

  return v11;
}

- (MRMediaControls)initWithConfiguration:(id)a3 shouldObserveRoutingContextUIDChanges:(BOOL)a4
{
  id v6;
  MRMediaControls *v7;
  uint64_t v8;
  MRMediaControlsConfiguration *configuration;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MRMediaControls;
  v7 = -[MRMediaControls init](&v21, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    configuration = v7->_configuration;
    v7->_configuration = (MRMediaControlsConfiguration *)v8;

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.springboard")))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.MediaRemoteUI"));

      if ((v14 & 1) == 0)
        v7->_shouldObserveRoutingContextUIDChanges = a4;
    }
    if (v7->_shouldObserveRoutingContextUIDChanges)
    {
      _MRLogForCategory(2uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        -[MRMediaControls configuration](v7, "configuration");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "presentingAppBundleID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v23 = v17;
        _os_log_impl(&dword_193827000, v15, OS_LOG_TYPE_INFO, "Started observing routing context UID changes for app bundle: %{public}@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      getAVAudioSessionRoutingContextChangeNotification();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObserver:selector:name:object:", v7, sel__audioSessionRoutingContextDidChangeNotification, v19, 0);

    }
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MRMediaControls;
  -[MRMediaControls dealloc](&v3, sel_dealloc);
}

- (MRMediaControlsConfiguration)configuration
{
  MRMediaControls *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[MRMediaControlsConfiguration copy](v2->_configuration, "copy");
  objc_sync_exit(v2);

  return (MRMediaControlsConfiguration *)v3;
}

- (void)setRouteUID:(id)a3
{
  MRMediaControls *v5;
  id v6;

  v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_routeUID, a3);
  -[MRMediaControlsConfiguration setRouteUID:](v5->_configuration, "setRouteUID:", v6);
  objc_sync_exit(v5);

}

- (void)setPreferredWidth:(double)a3
{
  MRMediaControls *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_preferredWidth = a3;
  -[MRMediaControlsConfiguration setPreferredWidth:](obj->_configuration, "setPreferredWidth:", a3);
  objc_sync_exit(obj);

}

- (void)addCustomRowWithType:(id)a3 titleOverride:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  MRMediaControls *v12;
  void *v13;
  _BOOL4 v14;
  MRMediaControlsConfiguration *configuration;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _MRLogForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412802;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_193827000, v11, OS_LOG_TYPE_DEFAULT, "MediaControls - Adding Custom Row with type:%@, titleOverride: %@, identifier: %@", (uint8_t *)&v19, 0x20u);
  }

  v12 = self;
  objc_sync_enter(v12);
  -[MRMediaControlsConfiguration customRows](v12->_configuration, "customRows");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v14)
  {
    configuration = v12->_configuration;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRMediaControlsConfiguration setCustomRows:](configuration, "setCustomRows:", v16);

  }
  +[MRMediaControlsCustomRow rowWithType:titleOverride:identifier:](MRMediaControlsCustomRow, "rowWithType:titleOverride:identifier:", v8, v9, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRMediaControlsConfiguration customRows](v12->_configuration, "customRows");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v17);

  objc_sync_exit(v12);
}

- (void)startPrewarming
{
  void *v3;
  void *v4;
  unsigned int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_shouldObserveRoutingContextUIDChanges)
    -[MRMediaControls _updateAudioSessionRoutingContext](self, "_updateAudioSessionRoutingContext");
  -[MRMediaControls configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "style");
  _MRLogForCategory(2uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10 = 138543362;
    v11 = v3;
    _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_INFO, "Start prewarming remote view controller. Configuration : %{public}@", (uint8_t *)&v10, 0xCu);
  }

  -[MRMediaControls listener](self, "listener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_endpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MRMediaRemotePrewarmMediaControlsCommand(v4, v5, v9);

}

- (void)stopPrewarming
{
  NSObject *v2;
  uint8_t v3[16];

  _MRLogForCategory(2uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_INFO, "Stop prewarming remote view controller.", v3, 2u);
  }

  MRMediaRemoteDismissMediaControlsCommand();
}

- (void)present
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  _MRLogForCategory(2uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_INFO, "Present remote view controller.", buf, 2u);
  }

  -[MRMediaControls startPrewarming](self, "startPrewarming");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __26__MRMediaControls_present__block_invoke;
  v4[3] = &unk_1E30C8040;
  v4[4] = self;
  MRMediaRemotePresentMediaControlsCommand(MEMORY[0x1E0C80D38], v4);
}

uint64_t __26__MRMediaControls_present__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;

  if (a2)
  {
    v3 = result;
    _MRLogForCategory(2uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __26__MRMediaControls_present__block_invoke_cold_1(a2, v4);

    return objc_msgSend(*(id *)(v3 + 32), "_reset");
  }
  return result;
}

- (void)dismiss
{
  NSObject *v2;
  uint8_t v3[16];

  _MRLogForCategory(2uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_INFO, "Dismissing remote view controller at app's request.", v3, 2u);
  }

  MRMediaRemoteDismissMediaControlsCommand();
}

- (NSXPCListener)listener
{
  NSXPCListener *listener;
  NSXPCListener *v4;
  NSXPCListener *v5;

  listener = self->_listener;
  if (!listener)
  {
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v4 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
    v5 = self->_listener;
    self->_listener = v4;

    -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
    -[NSXPCListener activate](self->_listener, "activate");
    listener = self->_listener;
  }
  return listener;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id buf[2];

  v6 = a3;
  v7 = a4;
  _MRLogForCategory(2uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_INFO, "Received request to accept new connection.", (uint8_t *)buf, 2u);
  }

  objc_storeStrong((id *)&self->_connection, a4);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE306348);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v9);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE2E37F8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v10);

  objc_msgSend(v7, "setExportedObject:", self);
  objc_initWeak(buf, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__MRMediaControls_listener_shouldAcceptNewConnection___block_invoke;
  v12[3] = &unk_1E30C6AA0;
  objc_copyWeak(&v13, buf);
  objc_msgSend(v7, "setInvalidationHandler:", v12);
  objc_msgSend(v7, "resume");
  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);

  return 1;
}

void __54__MRMediaControls_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  _MRLogForCategory(2uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_INFO, "Connection to remote view controller invalidated.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reset");

}

- (void)openConnection
{
  NSObject *v2;
  uint8_t v3[16];

  _MRLogForCategory(2uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_INFO, "Connection established to remote view controller.", v3, 2u);
  }

}

- (void)setDismissalReason:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(2uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[MRMediaControls _dismissalReasonString:](self, "_dismissalReasonString:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_INFO, "MediaControls dismissed with reason : %@", (uint8_t *)&v7, 0xCu);

  }
  self->_dismissalReason = a3;
}

- (void)setTappedCustomRowIdentifier:(id)a3
{
  NSString *v4;
  NSObject *v5;
  NSString *tappedCustomRowIdentifier;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  _MRLogForCategory(2uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_INFO, "MediaControls dismissed with tapped custom row identifier : %@", (uint8_t *)&v7, 0xCu);
  }

  tappedCustomRowIdentifier = self->_tappedCustomRowIdentifier;
  self->_tappedCustomRowIdentifier = v4;

}

- (void)_reset
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSString *tappedCustomRowIdentifier;
  _QWORD v8[5];
  _QWORD block[5];
  uint8_t buf[4];
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getAVAudioSessionRoutingContextChangeNotification();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, 0);

  if (self->_dismissHandler)
    dispatch_async(MEMORY[0x1E0C80D38], self->_dismissHandler);
  v5 = MEMORY[0x1E0C809B0];
  if (self->_dismissHandlerWithReason)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __25__MRMediaControls__reset__block_invoke;
    block[3] = &unk_1E30C5CA8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  if (self->_customRowDidTapHandler && self->_tappedCustomRowIdentifier)
  {
    _MRLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      tappedCustomRowIdentifier = self->_tappedCustomRowIdentifier;
      *(_DWORD *)buf = 138412290;
      v11 = tappedCustomRowIdentifier;
      _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "MediaControls custom row did tap, rowIdentifier: %@", buf, 0xCu);
    }

    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __25__MRMediaControls__reset__block_invoke_68;
    v8[3] = &unk_1E30C5CA8;
    v8[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], v8);
  }
}

uint64_t __25__MRMediaControls__reset__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
}

uint64_t __25__MRMediaControls__reset__block_invoke_68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) + 16))();
}

- (void)_updateAudioSessionRoutingContext
{
  MRMediaControls *v3;
  void *v4;
  id v5;

  objc_msgSend((Class)getAVAudioSessionClass_0[0](), "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = self;
  objc_sync_enter(v3);
  objc_msgSend(v5, "routingContextUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRMediaControlsConfiguration setRoutingContextUID:](v3->_configuration, "setRoutingContextUID:", v4);

  -[MRMediaControlsConfiguration setStyle:](v3->_configuration, "setStyle:", -[MRMediaControls _mediaControlsStyleForRouteSharingPolicy:](v3, "_mediaControlsStyleForRouteSharingPolicy:", objc_msgSend(v5, "routeSharingPolicy")));
  objc_sync_exit(v3);

}

- (void)_audioSessionRoutingContextDidChangeNotification
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[MRMediaControls _updateAudioSessionRoutingContext](self, "_updateAudioSessionRoutingContext");
  _MRLogForCategory(2uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[MRMediaControlsConfiguration routingContextUID](self->_configuration, "routingContextUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_INFO, "Updating remote view controller routing context UID : %{public}@", (uint8_t *)&v6, 0xCu);

  }
  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateMediaControlsWithConfiguration:", self->_configuration);

}

- (int64_t)_mediaControlsStyleForRouteSharingPolicy:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int64_t v9;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SupportsSharedQueue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (!-[MRMediaControls _shouldUpdateStyleForCurrentConfigurationStyle:](self, "_shouldUpdateStyleForCurrentConfigurationStyle:", -[MRMediaControlsConfiguration style](self->_configuration, "style")))return -[MRMediaControlsConfiguration style](self->_configuration, "style");
  v9 = 2;
  if (v8)
    v9 = 3;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    return v9;
  else
    return 1;
}

- (unint64_t)_MPRouteSharingPolicyToAVRouteSharingPolicy:(unint64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (id)_dismissalReasonString:(unint64_t)a3
{
  if (a3)
    return CFSTR("MRMediaControlsDismissalReasonUserCancelled");
  else
    return CFSTR("MRMediaControlsDismissalReasonUnknown");
}

- (BOOL)_shouldUpdateStyleForCurrentConfigurationStyle:(int64_t)a3
{
  return (unint64_t)(a3 - 9) < 0xFFFFFFFFFFFFFFFBLL;
}

- (id)dismissHandlerWithReason
{
  return self->_dismissHandlerWithReason;
}

- (void)setDismissHandlerWithReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)customRowDidTapHandler
{
  return self->_customRowDidTapHandler;
}

- (void)setCustomRowDidTapHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)routeUID
{
  return self->_routeUID;
}

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_routeUID, 0);
  objc_storeStrong(&self->_customRowDidTapHandler, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong(&self->_dismissHandlerWithReason, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_tappedCustomRowIdentifier, 0);
}

void __26__MRMediaControls_present__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_193827000, a2, OS_LOG_TYPE_ERROR, "Error occurred while attempting to present remote view controller. %@", (uint8_t *)&v2, 0xCu);
}

@end
