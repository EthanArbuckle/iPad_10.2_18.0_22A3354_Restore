@implementation MPMediaControls

- (MPMediaControls)init
{
  MPMediaControlsConfiguration *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MPMediaControls *v9;

  v3 = objc_alloc_init(MPMediaControlsConfiguration);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaControlsConfiguration setPresentingAppBundleID:](v3, "setPresentingAppBundleID:", v5);

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaControlsConfiguration setPresentingAppProcessIdentifier:](v3, "setPresentingAppProcessIdentifier:", objc_msgSend(v6, "processIdentifier"));

  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "routingContextUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaControlsConfiguration setRoutingContextUID:](v3, "setRoutingContextUID:", v8);

  -[MPMediaControlsConfiguration setStyle:](v3, "setStyle:", -[MPMediaControls _mediaControlsStyleForRouteSharingPolicy:](self, "_mediaControlsStyleForRouteSharingPolicy:", objc_msgSend(v7, "routeSharingPolicy")));
  v9 = -[MPMediaControls initWithConfiguration:shouldObserveRoutingContextUIDChanges:](self, "initWithConfiguration:shouldObserveRoutingContextUIDChanges:", v3, 1);

  return v9;
}

- (MPMediaControls)initWithConfiguration:(id)a3
{
  return -[MPMediaControls initWithConfiguration:shouldObserveRoutingContextUIDChanges:](self, "initWithConfiguration:shouldObserveRoutingContextUIDChanges:", a3, 1);
}

- (MPMediaControls)initWithRouteSharingPolicy:(unint64_t)a3 routingContextUID:(id)a4
{
  id v6;
  unint64_t v7;
  MPMediaControlsConfiguration *v8;
  void *v9;
  void *v10;
  MPMediaControls *v11;

  v6 = a4;
  v7 = -[MPMediaControls _MPRouteSharingPolicyToAVRouteSharingPolicy:](self, "_MPRouteSharingPolicyToAVRouteSharingPolicy:", a3);
  v8 = objc_alloc_init(MPMediaControlsConfiguration);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaControlsConfiguration setPresentingAppBundleID:](v8, "setPresentingAppBundleID:", v10);

  -[MPMediaControlsConfiguration setRoutingContextUID:](v8, "setRoutingContextUID:", v6);
  -[MPMediaControlsConfiguration setStyle:](v8, "setStyle:", -[MPMediaControls _mediaControlsStyleForRouteSharingPolicy:](self, "_mediaControlsStyleForRouteSharingPolicy:", v7));
  v11 = -[MPMediaControls initWithConfiguration:shouldObserveRoutingContextUIDChanges:](self, "initWithConfiguration:shouldObserveRoutingContextUIDChanges:", v8, 0);

  return v11;
}

- (MPMediaControls)initWithConfiguration:(id)a3 shouldObserveRoutingContextUIDChanges:(BOOL)a4
{
  id v7;
  MPMediaControls *v8;
  MPMediaControls *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MPMediaControls;
  v8 = -[MPMediaControls init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_configuration, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, sel_didEnterBackground_, *MEMORY[0x1E0DC4768], 0);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.springboard")))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.MediaRemoteUI"));

      if ((v15 & 1) == 0)
        v9->_shouldObserveRoutingContextUIDChanges = a4;
    }
    if (v9->_shouldObserveRoutingContextUIDChanges)
    {
      v16 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        -[MPMediaControls configuration](v9, "configuration");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "presentingAppBundleID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v23 = v18;
        _os_log_impl(&dword_193B9B000, v16, OS_LOG_TYPE_INFO, "Started observing routing context UID changes for app bundle: %{public}@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObserver:selector:name:object:", v9, sel__audioSessionRoutingContextDidChangeNotification, *MEMORY[0x1E0C89888], 0);

    }
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MPMediaControls;
  -[MPMediaControls dealloc](&v3, sel_dealloc);
}

- (void)setRouteUID:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_routeUID, a3);
  v5 = a3;
  -[MPMediaControlsConfiguration setRouteUID:](self->_configuration, "setRouteUID:", v5);

}

- (void)setPreferredWidth:(double)a3
{
  self->_preferredWidth = a3;
  -[MPMediaControlsConfiguration setPreferredWidth:](self->_configuration, "setPreferredWidth:");
}

- (void)addCustomRowWithType:(id)a3 titleOverride:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  MPMediaControlsConfiguration *configuration;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412802;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEFAULT, "MediaControls - Adding Custom Row with type:%@, titleOverride: %@, identifier: %@", (uint8_t *)&v17, 0x20u);
  }

  -[MPMediaControlsConfiguration customRows](self->_configuration, "customRows");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    configuration = self->_configuration;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaControlsConfiguration setCustomRows:](configuration, "setCustomRows:", v14);

  }
  +[MPMediaControlsCustomRow rowWithType:titleOverride:identifier:](MPMediaControlsCustomRow, "rowWithType:titleOverride:identifier:", v8, v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaControlsConfiguration customRows](self->_configuration, "customRows");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v15);

}

- (void)startPrewarming
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  CGRect v28;
  CGRect v29;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_shouldObserveRoutingContextUIDChanges)
    -[MPMediaControls _updateAudioSessionRoutingContext](self, "_updateAudioSessionRoutingContext");
  -[MPMediaControlsConfiguration sourceRect](self->_configuration, "sourceRect");
  if (CGRectEqualToRect(v28, *MEMORY[0x1E0C9D648])
    || (-[MPMediaControlsConfiguration sourceRect](self->_configuration, "sourceRect"),
        CGRectEqualToRect(v29, *MEMORY[0x1E0C9D628])))
  {
    -[UIView superview](self->_sourceView, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView frame](self->_sourceView, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[UIView window](self->_sourceView, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "screen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "coordinateSpace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "convertRect:toCoordinateSpace:", v14, v5, v7, v9, v11);
    -[MPMediaControlsConfiguration setSourceRect:](self->_configuration, "setSourceRect:");

  }
  v15 = (void *)MEMORY[0x1E0CB36F8];
  -[MPMediaControls configuration](self, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "archivedDataWithRootObject:requiringSecureCoding:error:", v16, 1, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPMediaControls configuration](self, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "style");

  v19 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    -[MPMediaControls configuration](self, "configuration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "description");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543362;
    v26 = v21;
    _os_log_impl(&dword_193B9B000, v19, OS_LOG_TYPE_DEFAULT, "Start prewarming remote view controller. Configuration : %{public}@", (uint8_t *)&v25, 0xCu);

  }
  -[MPMediaControls listener](self, "listener");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "endpoint");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_endpoint");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  MRMediaRemotePrewarmMediaControlsCommand();

}

- (void)stopPrewarming
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "Stop prewarming remote view controller.", v3, 2u);
  }

  MRMediaRemoteDismissMediaControlsCommand();
}

- (void)present
{
  NSObject *v3;
  uint8_t buf[16];

  v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "Present remote view controller.", buf, 2u);
  }

  -[MPMediaControls startPrewarming](self, "startPrewarming");
  MRMediaRemotePresentMediaControlsCommand();
}

- (void)dismiss
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "Dismissing remote view controller at app's request.", v3, 2u);
  }

  MRMediaRemoteDismissMediaControlsCommand();
}

- (void)didEnterBackground:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  uint8_t v8[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.MediaRemoteUI"));

  v6 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "App is MediaRemoteUI Not dismissing remote view controller for entering background.", buf, 2u);
    }

  }
  else
  {
    if (v7)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "Dismissing remote view controller due to app entering background.", v8, 2u);
    }

    MRMediaRemoteDismissMediaControlsCommand();
  }
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
  v8 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_INFO, "Received request to accept new connection.", (uint8_t *)buf, 2u);
  }

  objc_storeStrong((id *)&self->_connection, a4);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE371CE0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v9);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE348298);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v10);

  objc_msgSend(v7, "setExportedObject:", self);
  objc_initWeak(buf, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__MPMediaControls_listener_shouldAcceptNewConnection___block_invoke;
  v12[3] = &unk_1E315E5D0;
  objc_copyWeak(&v13, buf);
  objc_msgSend(v7, "setInvalidationHandler:", v12);
  objc_msgSend(v7, "resume");
  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);

  return 1;
}

- (void)openConnection
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_INFO, "Connection established to remote view controller.", v3, 2u);
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
  v5 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[MPMediaControls _dismissalReasonString:](self, "_dismissalReasonString:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_INFO, "MediaControls dismissed with reason : %@", (uint8_t *)&v7, 0xCu);

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
  v5 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_INFO, "MediaControls dismissed with tapped custom row identifier : %@", (uint8_t *)&v7, 0xCu);
  }

  tappedCustomRowIdentifier = self->_tappedCustomRowIdentifier;
  self->_tappedCustomRowIdentifier = v4;

}

- (void)_reset
{
  void *v3;
  id dismissHandler;
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
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C89888], 0);

  dismissHandler = self->_dismissHandler;
  if (dismissHandler)
    dispatch_async(MEMORY[0x1E0C80D38], dismissHandler);
  v5 = MEMORY[0x1E0C809B0];
  if (self->_dismissHandlerWithReason)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __25__MPMediaControls__reset__block_invoke;
    block[3] = &unk_1E3163508;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  if (self->_customRowDidTapHandler && self->_tappedCustomRowIdentifier)
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      tappedCustomRowIdentifier = self->_tappedCustomRowIdentifier;
      *(_DWORD *)buf = 138412290;
      v11 = tappedCustomRowIdentifier;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "MediaControls custom row did tap, rowIdentifier: %@", buf, 0xCu);
    }

    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __25__MPMediaControls__reset__block_invoke_71;
    v8[3] = &unk_1E3163508;
    v8[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], v8);
  }
}

- (void)_updateAudioSessionRoutingContext
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "routingContextUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaControlsConfiguration setRoutingContextUID:](self->_configuration, "setRoutingContextUID:", v3);

  -[MPMediaControlsConfiguration setStyle:](self->_configuration, "setStyle:", -[MPMediaControls _mediaControlsStyleForRouteSharingPolicy:](self, "_mediaControlsStyleForRouteSharingPolicy:", objc_msgSend(v4, "routeSharingPolicy")));
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
  -[MPMediaControls _updateAudioSessionRoutingContext](self, "_updateAudioSessionRoutingContext");
  v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[MPMediaControlsConfiguration routingContextUID](self->_configuration, "routingContextUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_INFO, "Updating remote view controller routing context UID : %{public}@", (uint8_t *)&v6, 0xCu);

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

  if (!-[MPMediaControls _shouldUpdateStyleForCurrentConfigurationStyle:](self, "_shouldUpdateStyleForCurrentConfigurationStyle:", -[MPMediaControlsConfiguration style](self->_configuration, "style")))return -[MPMediaControlsConfiguration style](self->_configuration, "style");
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
    return CFSTR("MPMediaControlsDismissalReasonUserCancelled");
  else
    return CFSTR("MPMediaControlsDismissalReasonUnknown");
}

- (BOOL)_shouldUpdateStyleForCurrentConfigurationStyle:(int64_t)a3
{
  return (unint64_t)(a3 - 9) < 0xFFFFFFFFFFFFFFFBLL;
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceView, a3);
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)customRowDidTapHandler
{
  return self->_customRowDidTapHandler;
}

- (void)setCustomRowDidTapHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
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

- (MPMediaControlsConfiguration)configuration
{
  return self->_configuration;
}

- (id)dismissHandlerWithReason
{
  return self->_dismissHandlerWithReason;
}

- (void)setDismissHandlerWithReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissHandlerWithReason, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_routeUID, 0);
  objc_storeStrong(&self->_customRowDidTapHandler, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_tappedCustomRowIdentifier, 0);
}

uint64_t __25__MPMediaControls__reset__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 16))();
}

uint64_t __25__MPMediaControls__reset__block_invoke_71(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 16))();
}

void __54__MPMediaControls_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_INFO, "Connection to remote view controller invalidated.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reset");

}

uint64_t __26__MPMediaControls_present__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = result;
    v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = a2;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "Error occurred while attempting to present remote view controller. %@", (uint8_t *)&v5, 0xCu);
    }

    return objc_msgSend(*(id *)(v3 + 32), "_reset");
  }
  return result;
}

@end
