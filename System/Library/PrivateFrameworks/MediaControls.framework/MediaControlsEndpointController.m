@implementation MediaControlsEndpointController

- (MediaControlsEndpointController)initWithEndpoint:(id)a3 client:(id)a4 player:(id)a5
{
  id v8;
  id v9;
  id v10;
  MediaControlsEndpointController *v11;
  uint64_t v12;
  NSString *specifiedClient;
  uint64_t v14;
  NSString *specifiedPlayer;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MediaControlsEndpointController;
  v11 = -[MediaControlsEndpointController init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    specifiedClient = v11->_specifiedClient;
    v11->_specifiedClient = (NSString *)v12;

    v14 = objc_msgSend(v10, "copy");
    specifiedPlayer = v11->_specifiedPlayer;
    v11->_specifiedPlayer = (NSString *)v14;

    -[MediaControlsEndpointController _createRequestController](v11, "_createRequestController");
    -[MediaControlsEndpointController _maybeReloadPlayerPathWithRoute:](v11, "_maybeReloadPlayerPathWithRoute:", v8);
  }

  return v11;
}

- (MediaControlsEndpointController)initWithEndpoint:(id)a3
{
  return -[MediaControlsEndpointController initWithEndpoint:client:player:](self, "initWithEndpoint:client:player:", a3, 0, 0);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsEndpointController route](self, "route");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "routeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsEndpointController label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p route: (%@) %@>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSString)bundleID
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  -[MediaControlsEndpointController playerPath](self, "playerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[MediaControlsEndpointController response](self, "response");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playerPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleID");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (NSString)representedBundleID
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  -[MediaControlsEndpointController playerPath](self, "playerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "representedBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[MediaControlsEndpointController response](self, "response");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playerPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "representedBundleID");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (MPCPlayerPath)playerPath
{
  void *v2;
  void *v3;

  -[MPRequestResponseController request](self->_requestController, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPCPlayerPath *)v3;
}

- (MPAVEndpointRoute)route
{
  void *v2;
  void *v3;

  -[MediaControlsEndpointController playerPath](self, "playerPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPAVEndpointRoute *)v3;
}

- (BOOL)isAirPlaying
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[MediaControlsEndpointController isDeviceSystemRoute](self, "isDeviceSystemRoute");
  if (v3)
  {
    -[MediaControlsEndpointController route](self, "route");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAirPlayingToDevice");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isDeviceSystemRoute
{
  void *v2;
  void *v3;
  char v4;

  -[MediaControlsEndpointController route](self, "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isDeviceRoute");
  else
    v4 = 1;

  return v4;
}

- (BOOL)isRoutingToWireless
{
  void *v2;
  char v3;

  -[MediaControlsEndpointController route](self, "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRoutingToWirelessDevice");

  return v3;
}

- (MPCPlayerResponse)response
{
  void *v3;
  char v5;

  v5 = 0;
  -[MediaControlsEndpointController _getConnected:invalid:](self, "_getConnected:invalid:", &v5, 0);
  if (v5)
  {
    -[MPRequestResponseController response](self->_requestController, "response");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (MPCPlayerResponse *)v3;
}

- (void)setAllowsAutomaticResponseLoading:(BOOL)a3
{
  if (self->_allowsAutomaticResponseLoading != a3)
  {
    self->_allowsAutomaticResponseLoading = a3;
    -[MediaControlsEndpointController _updateState](self, "_updateState");
    -[MediaControlsEndpointController _connectIfNeeded](self, "_connectIfNeeded");
  }
}

- (void)setRoute:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MediaControlsEndpointController route](self, "route");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[MediaControlsEndpointController _maybeReloadPlayerPathWithRoute:](self, "_maybeReloadPlayerPathWithRoute:", v6);
    v5 = v6;
  }

}

- (void)representsLongFormVideoContentWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(2, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__MediaControlsEndpointController_representsLongFormVideoContentWithCompletion___block_invoke;
  v7[3] = &unk_1E5819B40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __80__MediaControlsEndpointController_representsLongFormVideoContentWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  char v9;

  v2 = (void *)MEMORY[0x1E0CC2318];
  objc_msgSend(*(id *)(a1 + 32), "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "bundleIdRepresentsLongFormVideoContent:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CC2318];
    objc_msgSend(*(id *)(a1 + 32), "representedBundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "bundleIdRepresentsLongFormVideoContent:", v6);

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__MediaControlsEndpointController_representsLongFormVideoContentWithCompletion___block_invoke_2;
  v7[3] = &unk_1E581A148;
  v8 = *(id *)(a1 + 40);
  v9 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __80__MediaControlsEndpointController_representsLongFormVideoContentWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)connectAllowingAuthenticationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id from;
  id location;
  _QWORD v23[2];
  _QWORD v24[2];
  uint8_t buf[4];
  MediaControlsEndpointController *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MediaControlsEndpointController connectionDelegate](self, "connectionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsEndpointController route](self, "route");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endpointController:willAttemptToConnectToRoute:", self, v6);

  -[MediaControlsEndpointController route](self, "route");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (objc_msgSend(v8, "isInvalidated"))
      objc_msgSend(v8, "reset");
    -[MediaControlsEndpointController setAttemptingConnection:](self, "setAttemptingConnection:", 1);
    objc_initWeak(&location, self);
    objc_initWeak(&from, v8);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    MCLogCategoryRouting();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[MediaControlsEndpointController route](self, "route");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "routeName");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[MediaControlsEndpointController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v26 = self;
      v27 = 2112;
      v28 = v13;
      v29 = 2048;
      v30 = v14;
      v31 = 2114;
      v32 = v10;
      _os_log_impl(&dword_1AA991000, v11, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p> <%{public}@> Attempting connect with authentication", buf, 0x2Au);

    }
    v15 = *MEMORY[0x1E0CC1CC8];
    v23[0] = *MEMORY[0x1E0CC1CB8];
    v23[1] = v15;
    v24[0] = v10;
    v24[1] = CFSTR("MediaControlsEndpointController-allowAuthentication");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __79__MediaControlsEndpointController_connectAllowingAuthenticationWithCompletion___block_invoke;
    v17[3] = &unk_1E581A300;
    objc_copyWeak(&v19, &location);
    v17[4] = self;
    objc_copyWeak(&v20, &from);
    v18 = v4;
    objc_msgSend(v8, "connectWithOptions:userInfo:completion:", 1, v16, v17);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v19);

    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    -[MediaControlsEndpointController _updateState](self, "_updateState");
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }

}

void __79__MediaControlsEndpointController_connectAllowingAuthenticationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MCLogCategoryRouting();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v6 = WeakRetained;
    objc_msgSend(v6, "route");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "routeName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v9, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);

    *(_DWORD *)buf = 134219010;
    v19 = WeakRetained;
    v20 = 2112;
    v21 = v8;
    v22 = 2048;
    v23 = v10;
    v24 = 2114;
    v25 = v11;
    v26 = 2114;
    v27 = v3;
    _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p> <%{public}@> <- connect error: %{public}@", buf, 0x34u);

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__MediaControlsEndpointController_connectAllowingAuthenticationWithCompletion___block_invoke_7;
  v13[3] = &unk_1E581A2D8;
  objc_copyWeak(&v16, (id *)(a1 + 48));
  objc_copyWeak(&v17, (id *)(a1 + 56));
  v14 = v3;
  v15 = *(id *)(a1 + 40);
  v12 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
}

void __79__MediaControlsEndpointController_connectAllowingAuthenticationWithCompletion___block_invoke_7(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _BOOL8 v9;
  unint64_t v10;
  const __CFString *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  id v16;
  int v17;
  int v18;
  int v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  __int16 v24;
  uint8_t buf[4];
  id *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "route");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject connection](v4, "connection");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
LABEL_12:

      goto LABEL_13;
    }
    v6 = (void *)v5;
    objc_msgSend(WeakRetained, "route");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "connection");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v3)
    {
      if (*(_QWORD *)(a1 + 32))
        v9 = 0;
      else
        v9 = *((_BYTE *)WeakRetained + 8) != 0;
      objc_msgSend(WeakRetained, "setAutomaticResponseLoading:", v9);
      objc_msgSend(WeakRetained, "setAttemptingConnection:", 0);
      v24 = 0;
      v23 = 0;
      objc_msgSend(WeakRetained, "_getConnected:connecting:invalid:", (char *)&v24 + 1, &v23, &v24);
      MCLogCategoryRouting();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "route");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "routeName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(WeakRetained, "state");
        if (v10 > 3)
          v11 = CFSTR("?");
        else
          v11 = off_1E581A3E8[v10];
        v20 = v11;
        v12 = HIBYTE(v24);
        v13 = v23;
        v14 = v24;
        v15 = *((unsigned __int8 *)WeakRetained + 8);
        v19 = *((unsigned __int8 *)WeakRetained + 12);
        v17 = *((unsigned __int8 *)WeakRetained + 14);
        v18 = *((unsigned __int8 *)WeakRetained + 13);
        v16 = objc_loadWeakRetained(WeakRetained + 5);
        *(_DWORD *)buf = 134220546;
        v26 = WeakRetained;
        v27 = 2112;
        v28 = v21;
        v29 = 2112;
        v30 = v20;
        v31 = 1024;
        v32 = v12;
        v33 = 1024;
        v34 = v13;
        v35 = 1024;
        v36 = v14;
        v37 = 1024;
        v38 = v15;
        v39 = 1024;
        v40 = v17;
        v41 = 1024;
        v42 = v19;
        v43 = 1024;
        v44 = v18;
        v45 = 2048;
        v46 = v16;
        _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@)> [state: %@, connected: %{BOOL}u, connecting: %{BOOL}u invalid: %{BOOL}u, allowsAutoload: %{BOOL}u, autoload: %{BOOL}u, everHadResponse: %{BOOL}u, attemptConnect: %{BOOL}u, delegate: %p]", buf, 0x54u);

      }
      goto LABEL_12;
    }
  }
LABEL_13:
  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32) == 0);

}

- (NSString)label
{
  void *v2;
  void *v3;

  -[MPRequestResponseController request](self->_requestController, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setLabel:(id)a3
{
  MPRequestResponseController *requestController;
  id v4;
  id v5;

  requestController = self->_requestController;
  v4 = a3;
  -[MPRequestResponseController request](requestController, "request");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLabel:", v4);

}

- (void)launchNowPlayingApp
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t, uint64_t);
  void *v38;
  MediaControlsEndpointController *v39;
  id v40;
  uint8_t buf[4];
  MediaControlsEndpointController *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  _QWORD v49[3];
  _QWORD v50[4];

  v50[3] = *MEMORY[0x1E0C80C00];
  -[MediaControlsEndpointController route](self, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CC2318];
    -[MediaControlsEndpointController route](self, "route");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActiveRoute:reason:completion:", v5, CFSTR("Analytics: Launch now playing app"), 0);

    SBSCreateOpenApplicationService();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0C99E08]);
    v8 = *MEMORY[0x1E0D22DA8];
    v49[0] = *MEMORY[0x1E0D22D88];
    v49[1] = v8;
    v50[0] = MEMORY[0x1E0C9AAB0];
    v50[1] = MEMORY[0x1E0C9AAB0];
    v49[2] = *MEMORY[0x1E0D22D58];
    -[MediaControlsEndpointController route](self, "route");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "routeName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v7, "initWithDictionary:", v11);

    -[MediaControlsEndpointController representedBundleID](self, "representedBundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "length"))
    {
      -[MediaControlsEndpointController bundleID](self, "bundleID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
        v16 = v14;
      else
        v16 = (id)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
      v20 = v16;

      v13 = v20;
    }
    if (objc_msgSend(v13, "length") && !MRMediaRemoteApplicationIsSystemMediaApplication())
    {
      if (!MRMediaRemoteApplicationIsSystemPodcastApplication())
        goto LABEL_15;
      MCLogCategoryRouting();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        -[MediaControlsEndpointController route](self, "route");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "routeName");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[MediaControlsEndpointController delegate](self, "delegate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v42 = self;
        v43 = 2112;
        v44 = v33;
        v45 = 2048;
        v46 = v34;
        v47 = 2112;
        v48 = v13;
        _os_log_impl(&dword_1AA991000, v31, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p>  given %@ bundleID. Launching Podcasts", buf, 0x2Au);

      }
      v25 = CFSTR("podcasts://nowPlaying");
      v26 = MRMediaRemoteCopyLocalDeviceSystemPodcastApplicationDisplayID();
    }
    else
    {
      MCLogCategoryRouting();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        -[MediaControlsEndpointController route](self, "route");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "routeName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[MediaControlsEndpointController delegate](self, "delegate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v42 = self;
        v43 = 2112;
        v44 = v23;
        v45 = 2048;
        v46 = v24;
        v47 = 2112;
        v48 = v13;
        _os_log_impl(&dword_1AA991000, v21, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p>  given %@ bundleID. Launching Music", buf, 0x2Au);

      }
      v25 = CFSTR("music://show-now-playing");
      v26 = MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
    }
    v27 = (void *)v26;

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v28, *MEMORY[0x1E0D22D78]);

    v13 = v27;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", v12);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = MEMORY[0x1E0C809B0];
    v36 = 3221225472;
    v37 = __54__MediaControlsEndpointController_launchNowPlayingApp__block_invoke;
    v38 = &unk_1E581A328;
    v39 = self;
    v40 = v13;
    v30 = v13;
    -[NSObject openApplication:withOptions:completion:](v6, "openApplication:withOptions:completion:", v30, v29, &v35);
    +[MediaControlsAnalytics postAnalyticKind:](MediaControlsAnalytics, "postAnalyticKind:", 9, v35, v36, v37, v38, v39);

    goto LABEL_16;
  }
  MCLogCategoryRouting();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[MediaControlsEndpointController route](self, "route");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "routeName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsEndpointController delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v42 = self;
    v43 = 2112;
    v44 = v18;
    v45 = 2048;
    v46 = v19;
    _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p>  cannot launch Now Playing App with nil route", buf, 0x20u);

  }
LABEL_16:

}

void __54__MediaControlsEndpointController_launchNowPlayingApp__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    MCLogCategoryRouting();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(v5, "route");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "routeName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 134218754;
      v11 = v5;
      v12 = 2112;
      v13 = v7;
      v14 = 2048;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p>  cannot launch Now Playing App with bundleID: %@", (uint8_t *)&v10, 0x2Au);

    }
  }
}

- (void)updateRoutePropertiesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSArray *v10;
  NSArray *routeNames;
  NSString *v12;
  NSString *predictedDeviceUID;
  void *v14;
  id v15;

  -[MediaControlsEndpointController route](self, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "routeNames");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[MediaControlsEndpointController route](self, "route");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predictedOutputDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routeUID");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v15, "isEqualToArray:", self->_routeNames))
    goto LABEL_4;
  v7 = self->_predictedDeviceUID;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = -[NSString isEqual:](v6, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
LABEL_4:
      v10 = (NSArray *)objc_msgSend(v15, "copy");
      routeNames = self->_routeNames;
      self->_routeNames = v10;

      v12 = (NSString *)-[NSString copy](v6, "copy");
      predictedDeviceUID = self->_predictedDeviceUID;
      self->_predictedDeviceUID = v12;

LABEL_7:
      -[MediaControlsEndpointController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "endpointControllerRouteDidUpdate:", self);

      goto LABEL_8;
    }
  }
  if (+[MRUFeatureFlagProvider isNewControlsEnabled](MRUFeatureFlagProvider, "isNewControlsEnabled"))
    goto LABEL_7;
LABEL_8:

}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__MediaControlsEndpointController_controller_defersResponseReplacement___block_invoke;
  block[3] = &unk_1E581A350;
  v11 = v6;
  v12 = v7;
  block[4] = self;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __72__MediaControlsEndpointController_controller_defersResponseReplacement___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  const __CFString *v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  id WeakRetained;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  __int16 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  MCLogCategoryRouting();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "route");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "routeName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v29 = v3;
    v30 = 2112;
    v31 = v5;
    v32 = 2048;
    v33 = v6;
    _os_log_impl(&dword_1AA991000, v2, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p> -> defersResponseReplacement", buf, 0x20u);

  }
  v27 = 0;
  v26 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_getConnected:connecting:invalid:", (char *)&v27 + 1, &v26, &v27);
  MCLogCategoryRouting();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "route");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "routeName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(*(id *)(a1 + 32), "state");
    if (v9 > 3)
      v10 = CFSTR("?");
    else
      v10 = off_1E581A3E8[v9];
    v23 = v10;
    v11 = HIBYTE(v27);
    v12 = v26;
    v13 = v27;
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(unsigned __int8 *)(v14 + 8);
    v16 = *(unsigned __int8 *)(v14 + 14);
    v17 = *(unsigned __int8 *)(v14 + 12);
    v22 = *(unsigned __int8 *)(v14 + 13);
    WeakRetained = objc_loadWeakRetained((id *)(v14 + 40));
    *(_DWORD *)buf = 134220546;
    v29 = v8;
    v30 = 2112;
    v31 = v24;
    v32 = 2112;
    v33 = v23;
    v34 = 1024;
    v35 = v11;
    v36 = 1024;
    v37 = v12;
    v38 = 1024;
    v39 = v13;
    v40 = 1024;
    v41 = v15;
    v42 = 1024;
    v43 = v16;
    v44 = 1024;
    v45 = v17;
    v46 = 1024;
    v47 = v22;
    v48 = 2048;
    v49 = WeakRetained;
    _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@)> [state: %@, connected: %{BOOL}u, connecting: %{BOOL}u invalid: %{BOOL}u, allowsAutoload: %{BOOL}u, autoload: %{BOOL}u, everHadResponse: %{BOOL}u, attemptConnect: %{BOOL}u, delegate: %p]", buf, 0x54u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setHasEverReceivedResponse:", 1);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "response");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "endpointController:didLoadNewResponse:", v20, v21);

}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  return 1;
}

- (void)setState:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t state;
  const __CFString *v11;
  const __CFString *v12;
  NSObject *v13;
  unint64_t v14;
  const __CFString *v15;
  int v16;
  int v17;
  int v18;
  _BOOL4 allowsAutomaticResponseLoading;
  _BOOL4 automaticResponseLoading;
  _BOOL4 attemptingConnection;
  id WeakRetained;
  void *v23;
  _BOOL4 hasEverReceivedResponse;
  const __CFString *v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  __int16 v29;
  uint8_t buf[4];
  MediaControlsEndpointController *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  _BYTE v37[10];
  const __CFString *v38;
  _BOOL4 v39;
  __int16 v40;
  _BOOL4 v41;
  __int16 v42;
  _BOOL4 v43;
  __int16 v44;
  _BOOL4 v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (self->_state != a3)
  {
    MCLogCategoryRouting();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[MediaControlsEndpointController route](self, "route");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "routeName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MediaControlsEndpointController delegate](self, "delegate");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      state = self->_state;
      if (state > 3)
        v11 = CFSTR("?");
      else
        v11 = off_1E581A3E8[state];
      if ((unint64_t)a3 > 3)
        v12 = CFSTR("?");
      else
        v12 = off_1E581A3E8[a3];
      *(_DWORD *)buf = 134219010;
      v31 = self;
      v32 = 2112;
      v33 = v7;
      v34 = 2048;
      v35 = v8;
      v36 = 2114;
      *(_QWORD *)v37 = v11;
      *(_WORD *)&v37[8] = 2114;
      v38 = v12;
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p> changing state from %{public}@ -> %{public}@", buf, 0x34u);

    }
    self->_state = a3;
    v29 = 0;
    v28 = 0;
    -[MediaControlsEndpointController _getConnected:connecting:invalid:](self, "_getConnected:connecting:invalid:", (char *)&v29 + 1, &v28, &v29);
    MCLogCategoryRouting();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[MediaControlsEndpointController route](self, "route");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "routeName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[MediaControlsEndpointController state](self, "state");
      if (v14 > 3)
        v15 = CFSTR("?");
      else
        v15 = off_1E581A3E8[v14];
      v25 = v15;
      v16 = HIBYTE(v29);
      v17 = v28;
      v18 = v29;
      allowsAutomaticResponseLoading = self->_allowsAutomaticResponseLoading;
      automaticResponseLoading = self->_automaticResponseLoading;
      hasEverReceivedResponse = self->_hasEverReceivedResponse;
      attemptingConnection = self->_attemptingConnection;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      *(_DWORD *)buf = 134220546;
      v31 = self;
      v32 = 2112;
      v33 = v26;
      v34 = 2112;
      v35 = (uint64_t)v25;
      v36 = 1024;
      *(_DWORD *)v37 = v16;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = v17;
      LOWORD(v38) = 1024;
      *(_DWORD *)((char *)&v38 + 2) = v18;
      HIWORD(v38) = 1024;
      v39 = allowsAutomaticResponseLoading;
      v40 = 1024;
      v41 = automaticResponseLoading;
      v42 = 1024;
      v43 = hasEverReceivedResponse;
      v44 = 1024;
      v45 = attemptingConnection;
      v46 = 2048;
      v47 = WeakRetained;
      _os_log_impl(&dword_1AA991000, v13, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@)> [state: %@, connected: %{BOOL}u, connecting: %{BOOL}u invalid: %{BOOL}u, allowsAutoload: %{BOOL}u, autoload: %{BOOL}u, everHadResponse: %{BOOL}u, attemptConnect: %{BOOL}u, delegate: %p]", buf, 0x54u);

    }
    -[MediaControlsEndpointController delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "endpointControllerDidChangeState:", self);

  }
}

- (void)setAttemptingConnection:(BOOL)a3
{
  if (self->_attemptingConnection != a3)
  {
    self->_attemptingConnection = a3;
    -[MediaControlsEndpointController _updateState](self, "_updateState");
  }
}

- (void)setAutomaticResponseLoading:(BOOL)a3
{
  MPRequestResponseController *requestController;

  if (self->_automaticResponseLoading != a3)
  {
    self->_automaticResponseLoading = a3;
    requestController = self->_requestController;
    if (a3)
      -[MPRequestResponseController beginAutomaticResponseLoading](requestController, "beginAutomaticResponseLoading");
    else
      -[MPRequestResponseController endAutomaticResponseLoading](requestController, "endAutomaticResponseLoading");
  }
}

- (void)setHasEverReceivedResponse:(BOOL)a3
{
  if (self->_hasEverReceivedResponse != a3)
  {
    self->_hasEverReceivedResponse = a3;
    -[MediaControlsEndpointController _updateState](self, "_updateState");
  }
}

- (void)setOnScreen:(BOOL)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];

  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    if (a3 && !self->_attemptingConnection)
    {
      -[MPRequestResponseController response](self->_requestController, "response");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "playerPath");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isFullyResolved");

      if ((v6 & 1) == 0)
      {
        v7 = objc_alloc_init(MEMORY[0x1E0D4B380]);
        v8 = (void *)MEMORY[0x1E0D4B370];
        -[MediaControlsEndpointController route](self, "route");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[MediaControlsEndpointController bundleID](self, "bundleID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "pathWithRoute:bundleID:playerID:", v9, v10, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setPlayerPath:", v11);

        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __47__MediaControlsEndpointController_setOnScreen___block_invoke;
        v13[3] = &unk_1E581A378;
        v13[4] = self;
        v12 = (id)objc_msgSend(v7, "performWithCompletion:", v13);

      }
    }
  }
}

void __47__MediaControlsEndpointController_setOnScreen___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "playerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFullyResolved");

  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__MediaControlsEndpointController_setOnScreen___block_invoke_2;
    v8[3] = &unk_1E5818CB0;
    v6 = v3;
    v7 = *(_QWORD *)(a1 + 32);
    v9 = v6;
    v10 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
}

void __47__MediaControlsEndpointController_setOnScreen___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "playerPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    MCLogCategoryRouting();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 40);
      objc_msgSend(v7, "route");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "routeName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "playerPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "response");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "playerPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 134219010;
      v17 = v7;
      v18 = 2112;
      v19 = v9;
      v20 = 2048;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      v24 = 2112;
      v25 = v13;
      _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p> Reloading because re-request returned %@ and does not equal %@", (uint8_t *)&v16, 0x34u);

    }
    v14 = *(void **)(a1 + 40);
    objc_msgSend(v14, "route");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_reloadPlayerPathWithRoute:", v15);

  }
}

- (void)_connectionHasBecomeInvalid
{
  -[MediaControlsEndpointController setHasEverReceivedResponse:](self, "setHasEverReceivedResponse:", 0);
  -[MediaControlsEndpointController _updateState](self, "_updateState");
}

- (void)_createRequestController
{
  MPRequestResponseController *v3;
  MPRequestResponseController *requestController;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  _QWORD v39[2];
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[5];
  uint64_t v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  v3 = (MPRequestResponseController *)objc_alloc_init(MEMORY[0x1E0CC24E0]);
  requestController = self->_requestController;
  self->_requestController = v3;

  v37 = objc_alloc(MEMORY[0x1E0CC24C0]);
  v51 = *MEMORY[0x1E0CC2188];
  v34 = objc_alloc(MEMORY[0x1E0CC24C0]);
  v5 = *MEMORY[0x1E0CC2158];
  v50[0] = *MEMORY[0x1E0CC2168];
  v50[1] = v5;
  v6 = *MEMORY[0x1E0CC2150];
  v50[2] = *MEMORY[0x1E0CC2148];
  v50[3] = v6;
  v50[4] = *MEMORY[0x1E0CC2160];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 5);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = *MEMORY[0x1E0CC21B8];
  v7 = (void *)MEMORY[0x1E0CC24C0];
  v47 = *MEMORY[0x1E0CC2060];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "propertySetWithProperties:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v35;
  v48[1] = *MEMORY[0x1E0CC21A8];
  v8 = objc_alloc(MEMORY[0x1E0CC24C0]);
  v46 = *MEMORY[0x1E0CC2050];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = *MEMORY[0x1E0CC2170];
  v9 = (void *)MEMORY[0x1E0CC24C0];
  v43 = *MEMORY[0x1E0CC2058];
  v10 = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "propertySetWithProperties:", v33);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v8, "initWithProperties:relationships:", v32, v12);
  v49[1] = v13;
  v48[2] = *MEMORY[0x1E0CC21B0];
  v14 = (void *)MEMORY[0x1E0CC24C0];
  v42 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "propertySetWithProperties:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v34, "initWithProperties:relationships:", v38, v17);
  v52[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v37, "initWithProperties:relationships:", 0, v19);

  v21 = objc_alloc(MEMORY[0x1E0CC24C0]);
  v40 = *MEMORY[0x1E0CC2180];
  v22 = (void *)MEMORY[0x1E0CC24C0];
  v23 = *MEMORY[0x1E0CC2138];
  v39[0] = *MEMORY[0x1E0CC2140];
  v39[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "propertySetWithProperties:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v21, "initWithProperties:relationships:", 0, v26);

  -[MPRequestResponseController setDelegate:](self->_requestController, "setDelegate:", self);
  v28 = objc_alloc_init(MEMORY[0x1E0D4B380]);
  objc_msgSend(v28, "setTracklistRange:", 0, 1);
  objc_msgSend(v28, "setPlayingItemProperties:", v20);
  objc_msgSend(v28, "setQueueSectionProperties:", v27);
  -[MPRequestResponseController setRequest:](self->_requestController, "setRequest:", v28);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObserver:selector:name:object:", self, sel__connectionDidInvalidate_, *MEMORY[0x1E0CC2578], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObserver:selector:name:object:", self, sel__connectionDidConnect_, *MEMORY[0x1E0CC2570], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObserver:selector:name:object:", self, sel__connectionDidAttemptConnection_, *MEMORY[0x1E0CC2568], 0);

}

- (void)_getConnected:(BOOL *)a3 invalid:(BOOL *)a4
{
  -[MediaControlsEndpointController _getConnected:connecting:invalid:](self, "_getConnected:connecting:invalid:", a3, 0, a4);
}

- (void)_getConnected:(BOOL *)a3 connecting:(BOOL *)a4 invalid:(BOOL *)a5
{
  id v8;
  int v9;
  void *v10;
  void *v11;
  id v12;

  -[MediaControlsEndpointController route](self, "route");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 && (v12 = v8, v9 = objc_msgSend(v8, "isDeviceRoute"), v12, v8 = v12, !v9))
  {
    objc_msgSend(v12, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a3)
      *a3 = objc_msgSend(v10, "isConnected");
    if (a4)
      *a4 = objc_msgSend(v11, "isConnecting");
    if (a5)
      *a5 = objc_msgSend(v11, "isInvalidated");

    v8 = v12;
  }
  else
  {
    if (a3)
      *a3 = 1;
    if (a5)
      *a5 = 0;
    if (a4)
      *a4 = 0;
  }

}

- (void)_updateState
{
  uint64_t v3;
  unsigned __int8 v4;
  __int16 v5;

  v5 = 0;
  v4 = 0;
  -[MediaControlsEndpointController _getConnected:connecting:invalid:](self, "_getConnected:connecting:invalid:", (char *)&v5 + 1, &v4, &v5);
  if ((_BYTE)v5)
  {
    v3 = -1;
  }
  else if (HIBYTE(v5))
  {
    if (self->_hasEverReceivedResponse)
      v3 = 3;
    else
      v3 = 2;
  }
  else
  {
    v3 = (self->_attemptingConnection | v4) != 0;
  }
  -[MediaControlsEndpointController setState:](self, "setState:", v3);
}

- (void)_connectIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id from;
  id location;
  __int16 v20;
  _QWORD v21[2];
  _QWORD v22[2];
  uint8_t buf[4];
  MediaControlsEndpointController *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[MediaControlsEndpointController connectionDelegate](self, "connectionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsEndpointController route](self, "route");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endpointController:willAttemptToConnectToRoute:", self, v4);

  v20 = 0;
  -[MediaControlsEndpointController _getConnected:invalid:](self, "_getConnected:invalid:", (char *)&v20 + 1, &v20);
  if (!self->_allowsAutomaticResponseLoading || v20)
  {
    if (self->_allowsAutomaticResponseLoading && HIBYTE(v20) && !(_BYTE)v20 && !self->_attemptingConnection)
    {
      -[MediaControlsEndpointController setAutomaticResponseLoading:](self, "setAutomaticResponseLoading:", 1);
      return;
    }
LABEL_11:
    -[MediaControlsEndpointController setAutomaticResponseLoading:](self, "setAutomaticResponseLoading:", 0);
    return;
  }
  if (self->_attemptingConnection)
    goto LABEL_11;
  -[MediaControlsEndpointController route](self, "route");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MediaControlsEndpointController setAttemptingConnection:](self, "setAttemptingConnection:", 1);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v6);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  MCLogCategoryRouting();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[MediaControlsEndpointController route](self, "route");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "routeName");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[MediaControlsEndpointController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v24 = self;
    v25 = 2112;
    v26 = v11;
    v27 = 2048;
    v28 = v12;
    v29 = 2114;
    v30 = v8;
    _os_log_impl(&dword_1AA991000, v9, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p> <%{public}@> Attempting connect without authentication", buf, 0x2Au);

  }
  v13 = *MEMORY[0x1E0CC1CC8];
  v21[0] = *MEMORY[0x1E0CC1CB8];
  v21[1] = v13;
  v22[0] = v8;
  v22[1] = CFSTR("MediaControlsEndpointController");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__MediaControlsEndpointController__connectIfNeeded__block_invoke;
  v15[3] = &unk_1E581A3C8;
  objc_copyWeak(&v16, &location);
  v15[4] = self;
  objc_copyWeak(&v17, &from);
  objc_msgSend(v6, "connectWithUserInfo:completion:", v14, v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __51__MediaControlsEndpointController__connectIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MCLogCategoryRouting();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = WeakRetained;
    objc_msgSend(v6, "route");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "routeName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v9, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);

    *(_DWORD *)buf = 134219010;
    v18 = WeakRetained;
    v19 = 2112;
    v20 = v8;
    v21 = 2048;
    v22 = v10;
    v23 = 2114;
    v24 = v11;
    v25 = 2114;
    v26 = v3;
    _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p> <%{public}@> <- connect error: %{public}@", buf, 0x34u);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MediaControlsEndpointController__connectIfNeeded__block_invoke_36;
  block[3] = &unk_1E581A3A0;
  objc_copyWeak(&v15, (id *)(a1 + 40));
  objc_copyWeak(&v16, (id *)(a1 + 48));
  v14 = v3;
  v12 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
}

void __51__MediaControlsEndpointController__connectIfNeeded__block_invoke_36(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _BOOL8 v8;
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "route");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "connection");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      objc_msgSend(WeakRetained, "route");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "connection");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 == v2)
      {
        if (*(_QWORD *)(a1 + 32))
          v8 = 0;
        else
          v8 = WeakRetained[8] != 0;
        objc_msgSend(WeakRetained, "setAutomaticResponseLoading:", v8);
        objc_msgSend(WeakRetained, "setAttemptingConnection:", 0);
      }
    }
    else
    {

    }
  }

}

- (void)_maybeReloadPlayerPathWithRoute:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  -[MediaControlsEndpointController playerPath](self, "playerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "route");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
    -[MediaControlsEndpointController _reloadPlayerPathWithRoute:](self, "_reloadPlayerPathWithRoute:", v6);

}

- (void)_reloadPlayerPathWithRoute:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[MediaControlsEndpointController specifiedClient](self, "specifiedClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsEndpointController specifiedPlayer](self, "specifiedPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MPMediaControlsConfiguration style](self->_configuration, "style") == 1)
  {
    -[MPMediaControlsConfiguration presentingAppBundleID](self->_configuration, "presentingAppBundleID");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CC1CD0];
  -[MediaControlsEndpointController route](self, "route");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, v8, v9);

  objc_msgSend(MEMORY[0x1E0D4B370], "pathWithRoute:bundleID:playerID:", v14, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPRequestResponseController request](self->_requestController, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPlayerPath:", v10);

  -[MPRequestResponseController setNeedsReload](self->_requestController, "setNeedsReload");
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__routeDidChange_, v8, v14);

  }
  -[MediaControlsEndpointController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "endpointControllerRouteDidUpdate:", self);

  self->_attemptingConnection = 0;
  -[MediaControlsEndpointController _connectIfNeeded](self, "_connectIfNeeded");
  -[MediaControlsEndpointController _updateState](self, "_updateState");
  -[MediaControlsEndpointController updateRoutePropertiesIfNeeded](self, "updateRoutePropertiesIfNeeded");

}

- (void)_connectionDidInvalidate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  MediaControlsEndpointController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__MediaControlsEndpointController__connectionDidInvalidate___block_invoke;
  v6[3] = &unk_1E5818CB0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __60__MediaControlsEndpointController__connectionDidInvalidate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  void *v11;
  unint64_t v12;
  const __CFString *v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  id WeakRetained;
  int v21;
  int v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  __int16 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v4)
  {
    MCLogCategoryRouting();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(a1 + 40);
      objc_msgSend(v6, "route");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "routeName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v29 = v6;
      v30 = 2112;
      v31 = v8;
      v32 = 2048;
      v33 = v9;
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p> connectionDidInvalidate", buf, 0x20u);

    }
    v27 = 0;
    v26 = 0;
    objc_msgSend(*(id *)(a1 + 40), "_getConnected:connecting:invalid:", (char *)&v27 + 1, &v26, &v27);
    MCLogCategoryRouting();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(void **)(a1 + 40);
      objc_msgSend(v11, "route");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "routeName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(*(id *)(a1 + 40), "state");
      if (v12 > 3)
        v13 = CFSTR("?");
      else
        v13 = off_1E581A3E8[v12];
      v23 = v13;
      v14 = HIBYTE(v27);
      v15 = v26;
      v16 = v27;
      v17 = *(_QWORD *)(a1 + 40);
      v18 = *(unsigned __int8 *)(v17 + 8);
      v19 = *(unsigned __int8 *)(v17 + 14);
      v21 = *(unsigned __int8 *)(v17 + 12);
      v22 = *(unsigned __int8 *)(v17 + 13);
      WeakRetained = objc_loadWeakRetained((id *)(v17 + 40));
      *(_DWORD *)buf = 134220546;
      v29 = v11;
      v30 = 2112;
      v31 = v24;
      v32 = 2112;
      v33 = v23;
      v34 = 1024;
      v35 = v14;
      v36 = 1024;
      v37 = v15;
      v38 = 1024;
      v39 = v16;
      v40 = 1024;
      v41 = v18;
      v42 = 1024;
      v43 = v19;
      v44 = 1024;
      v45 = v21;
      v46 = 1024;
      v47 = v22;
      v48 = 2048;
      v49 = WeakRetained;
      _os_log_impl(&dword_1AA991000, v10, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@)> [state: %@, connected: %{BOOL}u, connecting: %{BOOL}u invalid: %{BOOL}u, allowsAutoload: %{BOOL}u, autoload: %{BOOL}u, everHadResponse: %{BOOL}u, attemptConnect: %{BOOL}u, delegate: %p]", buf, 0x54u);

    }
    objc_msgSend(*(id *)(a1 + 40), "_connectionHasBecomeInvalid");
  }

}

- (void)_connectionDidConnect:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  MediaControlsEndpointController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__MediaControlsEndpointController__connectionDidConnect___block_invoke;
  v6[3] = &unk_1E5818CB0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __57__MediaControlsEndpointController__connectionDidConnect___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  void *v11;
  unint64_t v12;
  const __CFString *v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  id WeakRetained;
  int v21;
  int v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  __int16 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v4)
  {
    MCLogCategoryRouting();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(a1 + 40);
      objc_msgSend(v6, "route");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "routeName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v29 = v6;
      v30 = 2112;
      v31 = v8;
      v32 = 2048;
      v33 = v9;
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p> connectionDidConnect", buf, 0x20u);

    }
    v27 = 0;
    v26 = 0;
    objc_msgSend(*(id *)(a1 + 40), "_getConnected:connecting:invalid:", (char *)&v27 + 1, &v26, &v27);
    MCLogCategoryRouting();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(void **)(a1 + 40);
      objc_msgSend(v11, "route");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "routeName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(*(id *)(a1 + 40), "state");
      if (v12 > 3)
        v13 = CFSTR("?");
      else
        v13 = off_1E581A3E8[v12];
      v23 = v13;
      v14 = HIBYTE(v27);
      v15 = v26;
      v16 = v27;
      v17 = *(_QWORD *)(a1 + 40);
      v18 = *(unsigned __int8 *)(v17 + 8);
      v19 = *(unsigned __int8 *)(v17 + 14);
      v21 = *(unsigned __int8 *)(v17 + 12);
      v22 = *(unsigned __int8 *)(v17 + 13);
      WeakRetained = objc_loadWeakRetained((id *)(v17 + 40));
      *(_DWORD *)buf = 134220546;
      v29 = v11;
      v30 = 2112;
      v31 = v24;
      v32 = 2112;
      v33 = v23;
      v34 = 1024;
      v35 = v14;
      v36 = 1024;
      v37 = v15;
      v38 = 1024;
      v39 = v16;
      v40 = 1024;
      v41 = v18;
      v42 = 1024;
      v43 = v19;
      v44 = 1024;
      v45 = v21;
      v46 = 1024;
      v47 = v22;
      v48 = 2048;
      v49 = WeakRetained;
      _os_log_impl(&dword_1AA991000, v10, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@)> [state: %@, connected: %{BOOL}u, connecting: %{BOOL}u invalid: %{BOOL}u, allowsAutoload: %{BOOL}u, autoload: %{BOOL}u, everHadResponse: %{BOOL}u, attemptConnect: %{BOOL}u, delegate: %p]", buf, 0x54u);

    }
    objc_msgSend(*(id *)(a1 + 40), "_connectIfNeeded");
    objc_msgSend(*(id *)(a1 + 40), "_updateState");
  }

}

- (void)_connectionDidAttemptConnection:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  MediaControlsEndpointController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__MediaControlsEndpointController__connectionDidAttemptConnection___block_invoke;
  v6[3] = &unk_1E5818CB0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __67__MediaControlsEndpointController__connectionDidAttemptConnection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  void *v11;
  unint64_t v12;
  const __CFString *v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  id WeakRetained;
  int v21;
  int v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  __int16 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v4)
  {
    MCLogCategoryRouting();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(a1 + 40);
      objc_msgSend(v6, "route");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "routeName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v29 = v6;
      v30 = 2112;
      v31 = v8;
      v32 = 2048;
      v33 = v9;
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@) | Delegate:%p> connectionDidAttemptConnection", buf, 0x20u);

    }
    v27 = 0;
    v26 = 0;
    objc_msgSend(*(id *)(a1 + 40), "_getConnected:connecting:invalid:", (char *)&v27 + 1, &v26, &v27);
    MCLogCategoryRouting();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(void **)(a1 + 40);
      objc_msgSend(v11, "route");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "routeName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(*(id *)(a1 + 40), "state");
      if (v12 > 3)
        v13 = CFSTR("?");
      else
        v13 = off_1E581A3E8[v12];
      v23 = v13;
      v14 = HIBYTE(v27);
      v15 = v26;
      v16 = v27;
      v17 = *(_QWORD *)(a1 + 40);
      v18 = *(unsigned __int8 *)(v17 + 8);
      v19 = *(unsigned __int8 *)(v17 + 14);
      v21 = *(unsigned __int8 *)(v17 + 12);
      v22 = *(unsigned __int8 *)(v17 + 13);
      WeakRetained = objc_loadWeakRetained((id *)(v17 + 40));
      *(_DWORD *)buf = 134220546;
      v29 = v11;
      v30 = 2112;
      v31 = v24;
      v32 = 2112;
      v33 = v23;
      v34 = 1024;
      v35 = v14;
      v36 = 1024;
      v37 = v15;
      v38 = 1024;
      v39 = v16;
      v40 = 1024;
      v41 = v18;
      v42 = 1024;
      v43 = v19;
      v44 = 1024;
      v45 = v21;
      v46 = 1024;
      v47 = v22;
      v48 = 2048;
      v49 = WeakRetained;
      _os_log_impl(&dword_1AA991000, v10, OS_LOG_TYPE_DEFAULT, "<EndpointController:%p (%@)> [state: %@, connected: %{BOOL}u, connecting: %{BOOL}u invalid: %{BOOL}u, allowsAutoload: %{BOOL}u, autoload: %{BOOL}u, everHadResponse: %{BOOL}u, attemptConnect: %{BOOL}u, delegate: %p]", buf, 0x54u);

    }
    objc_msgSend(*(id *)(a1 + 40), "_updateState");
  }

}

- (void)_routeDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MediaControlsEndpointController__routeDidChange___block_invoke;
  block[3] = &unk_1E5818C88;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __51__MediaControlsEndpointController__routeDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateRoutePropertiesIfNeeded");
}

- (id)_stateDumpObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  _QWORD v14[7];
  _QWORD v15[8];

  v15[7] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("_obj");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("hasEverReceivedResponse");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasEverReceivedResponse);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v4;
  v14[2] = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_state);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v5;
  v14[3] = CFSTR("attemptingConnection");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_attemptingConnection);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v6;
  v14[4] = CFSTR("allowsAutomaticResponseLoading");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowsAutomaticResponseLoading);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v7;
  v14[5] = CFSTR("automaticResponseLoading");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_automaticResponseLoading);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v8;
  v14[6] = CFSTR("requestResponseController");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), self->_requestController);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("<NONE>");
  if (v9)
    v11 = (const __CFString *)v9;
  v15[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (MPMediaControlsConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (NSArray)routeNames
{
  return self->_routeNames;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)allowsAutomaticResponseLoading
{
  return self->_allowsAutomaticResponseLoading;
}

- (BOOL)hasAvailableRoutes
{
  return self->_hasAvailableRoutes;
}

- (BOOL)onScreen
{
  return self->_onScreen;
}

- (BOOL)deviceUnlocked
{
  return self->_deviceUnlocked;
}

- (void)setDeviceUnlocked:(BOOL)a3
{
  self->_deviceUnlocked = a3;
}

- (MediaControlsEndpointControllerDelegate)delegate
{
  return (MediaControlsEndpointControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MediaControlsEndpointObserverDelegate)proxyDelegate
{
  return (MediaControlsEndpointObserverDelegate *)objc_loadWeakRetained((id *)&self->_proxyDelegate);
}

- (void)setProxyDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_proxyDelegate, a3);
}

- (MPRequestResponseController)requestController
{
  return self->_requestController;
}

- (BOOL)hasEverReceivedResponse
{
  return self->_hasEverReceivedResponse;
}

- (BOOL)isAttemptingConnection
{
  return self->_attemptingConnection;
}

- (NSString)specifiedClient
{
  return self->_specifiedClient;
}

- (NSString)specifiedPlayer
{
  return self->_specifiedPlayer;
}

- (NSString)predictedDeviceUID
{
  return self->_predictedDeviceUID;
}

- (BOOL)isAutomaticResponseLoading
{
  return self->_automaticResponseLoading;
}

- (MediaControlsEndpointControllerConnectionDelegate)connectionDelegate
{
  return (MediaControlsEndpointControllerConnectionDelegate *)objc_loadWeakRetained((id *)&self->_connectionDelegate);
}

- (void)setConnectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_connectionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connectionDelegate);
  objc_storeStrong((id *)&self->_predictedDeviceUID, 0);
  objc_storeStrong((id *)&self->_specifiedPlayer, 0);
  objc_storeStrong((id *)&self->_specifiedClient, 0);
  objc_storeStrong((id *)&self->_requestController, 0);
  objc_destroyWeak((id *)&self->_proxyDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_routeNames, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
