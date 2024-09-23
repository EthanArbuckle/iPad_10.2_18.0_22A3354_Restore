@implementation _DDUIRemoteDisplaySessionHandler

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50___DDUIRemoteDisplaySessionHandler_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_sharedInstance_0;
}

- (_DDUIRemoteDisplaySessionHandler)init
{
  _DDUIRemoteDisplaySessionHandler *v2;
  RPRemoteDisplayDiscovery *v3;
  RPRemoteDisplayDiscovery *rDiscovery;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DDUIRemoteDisplaySessionHandler;
  v2 = -[_DDUIRemoteDisplaySessionHandler init](&v6, sel_init);
  if (v2)
  {
    v3 = (RPRemoteDisplayDiscovery *)objc_alloc_init(MEMORY[0x1E0D83958]);
    rDiscovery = v2->_rDiscovery;
    v2->_rDiscovery = v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[RPRemoteDisplayDiscovery invalidate](self->_rDiscovery, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_DDUIRemoteDisplaySessionHandler;
  -[_DDUIRemoteDisplaySessionHandler dealloc](&v3, sel_dealloc);
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  RPRemoteDisplayDiscovery *rDiscovery;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  _BYTE buf[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _DDUICoreLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = self;
    _os_log_impl(&dword_1C87B2000, v5, OS_LOG_TYPE_DEFAULT, "Starting up _DDUIRemoteDisplaySessionHandler {self: %@}", buf, 0xCu);
  }

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  rDiscovery = self->_rDiscovery;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59___DDUIRemoteDisplaySessionHandler_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E81B45E8;
  v8[4] = self;
  objc_copyWeak(&v10, (id *)buf);
  v7 = v4;
  v9 = v7;
  -[RPRemoteDisplayDiscovery activateWithCompletion:](rDiscovery, "activateWithCompletion:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);

}

- (BOOL)isWifiStateOn
{
  id v2;
  BOOL v3;

  v2 = objc_alloc_init(MEMORY[0x1E0D1B458]);
  v3 = objc_msgSend(v2, "wifiState") != 10;
  objc_msgSend(v2, "invalidate");

  return v3;
}

- (BOOL)isContinuityCaptureUserPreferenceEnabled
{
  return softLinkFigContinuityCaptureGetUserPreferenceDisabled() ^ 1;
}

- (BOOL)canEnterSession
{
  _BOOL4 v3;

  v3 = -[_DDUIRemoteDisplaySessionHandler isWifiStateOn](self, "isWifiStateOn");
  if (v3)
    LOBYTE(v3) = -[_DDUIRemoteDisplaySessionHandler isContinuityCaptureUserPreferenceEnabled](self, "isContinuityCaptureUserPreferenceEnabled");
  return v3;
}

- (void)enterSessionWithRemoteDeviceID:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  if (-[_DDUIRemoteDisplaySessionHandler _isActivated](self, "_isActivated"))
  {
    -[RPRemoteDisplayDiscovery enterDiscoverySessionWithDevice:reason:](self->_rDiscovery, "enterDiscoverySessionWithDevice:reason:", v6, v7);
  }
  else
  {
    location = 0;
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __74___DDUIRemoteDisplaySessionHandler_enterSessionWithRemoteDeviceID_reason___block_invoke;
    v8[3] = &unk_1E81B4610;
    objc_copyWeak(&v11, &location);
    v9 = v6;
    v10 = v7;
    -[_DDUIRemoteDisplaySessionHandler activateWithCompletion:](self, "activateWithCompletion:", v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

- (BOOL)shouldByPassConfirmationForRemoteDeviceID:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = _os_feature_enabled_impl();
  -[RPRemoteDisplayDiscovery dedicatedDevice](self->_rDiscovery, "dedicatedDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistentIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v4);

  return -[_DDUIRemoteDisplaySessionHandler canEnterSession](self, "canEnterSession") & v5 & v8;
}

- (BOOL)shouldAutoAcceptCCConfirmation
{
  char has_internal_content;
  void *v4;
  void *v5;
  int v6;
  _BOOL4 v7;
  BOOL v8;
  BOOL v9;

  has_internal_content = os_variant_has_internal_content();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.Sharing"));
  objc_msgSend(v4, "objectForKey:", CFSTR("autoAcceptCCConfirmation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = objc_msgSend(v4, "BOOLForKey:", CFSTR("autoAcceptCCConfirmation"));
  else
    v6 = 0;

  v7 = -[_DDUIRemoteDisplaySessionHandler canEnterSession](self, "canEnterSession");
  if (v6)
    v8 = has_internal_content;
  else
    v8 = 0;
  v9 = v7 && v8;

  return v9;
}

- (void)presentProxCardForDevice:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  id v8;
  void *v9;
  void *v10;
  CPSAuthenticationSession *proxSession;
  id v12;
  __CFString *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  void (**v23)(id, void *);
  id v24;
  id location;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v13 = CFSTR("Disabled");
LABEL_10:
    UnsupportedErrorWithDescription(v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v21);

    goto LABEL_11;
  }
  if (SFDeviceClassCodeGet() != 1)
  {
    _DDUICoreLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_DDUIRemoteDisplaySessionHandler presentProxCardForDevice:completion:].cold.1((uint64_t)self, v14, v15, v16, v17, v18, v19, v20);

    v13 = CFSTR("Dedicated cameras can only be setup on iPhones");
    goto LABEL_10;
  }
  v8 = objc_alloc_init(getCPSDedicatedCameraRequestClass());
  objc_msgSend(v6, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDeviceName:", v9);

  if ((objc_msgSend(v6, "deviceType") & 0x10) != 0)
    objc_msgSend(v8, "setDeviceType:", 1);
  -[_DDUIRemoteDisplaySessionHandler cancelCurrentProxCard](self, "cancelCurrentProxCard");
  v10 = (void *)objc_msgSend(objc_alloc(getCPSAuthenticationSessionClass()), "initWithRequest:", v8);
  location = 0;
  objc_initWeak(&location, self);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __72___DDUIRemoteDisplaySessionHandler_presentProxCardForDevice_completion___block_invoke;
  v22[3] = &unk_1E81B4638;
  objc_copyWeak(&v24, &location);
  v23 = v7;
  objc_msgSend(v10, "setSessionCompletionHandler:", v22);
  objc_msgSend(v10, "start");
  proxSession = self->_proxSession;
  self->_proxSession = (CPSAuthenticationSession *)v10;
  v12 = v10;

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

LABEL_11:
}

- (void)cancelCurrentProxCard
{
  CPSAuthenticationSession *proxSession;

  -[CPSAuthenticationSession cancel](self->_proxSession, "cancel");
  proxSession = self->_proxSession;
  self->_proxSession = 0;

}

- (void)saveDedicatedDeviceInformation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  _DDUIRemoteDisplaySessionHandler *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D83950]);
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v5, "initWithIdentifier:name:model:accountID:", v6, v7, v8, v9);

    _DDUICoreLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412546;
      v14 = self;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1C87B2000, v11, OS_LOG_TYPE_DEFAULT, "{self: %@} Saving dedicated device: %@", (uint8_t *)&v13, 0x16u);
    }

    -[RPRemoteDisplayDiscovery saveDedicatedDevice:](self->_rDiscovery, "saveDedicatedDevice:", v10);
  }
  else
  {
    _DDUICoreLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = self;
      _os_log_impl(&dword_1C87B2000, v12, OS_LOG_TYPE_DEFAULT, "{self: %@} Removing dedicated device", (uint8_t *)&v13, 0xCu);
    }

    -[RPRemoteDisplayDiscovery saveDedicatedDevice:](self->_rDiscovery, "saveDedicatedDevice:", 0);
  }

}

- (RPRemoteDisplayDiscovery)rDiscovery
{
  return self->_rDiscovery;
}

- (BOOL)_isActivated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (CPSAuthenticationSession)proxSession
{
  return self->_proxSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxSession, 0);
  objc_storeStrong((id *)&self->_rDiscovery, 0);
}

- (void)presentProxCardForDevice:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C87B2000, a2, a3, "{self: %@} ignoring prox card request on device since this is not an iPhone", a5, a6, a7, a8, 2u);
}

@end
