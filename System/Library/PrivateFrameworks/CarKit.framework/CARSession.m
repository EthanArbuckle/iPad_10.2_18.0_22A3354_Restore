@implementation CARSession

- (BOOL)_sessionReady
{
  NSObject *v3;
  _BOOL4 v4;
  _DWORD v6[2];
  __int16 v7;
  _BOOL4 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109376;
    v6[1] = -[CARSession isAuthenticated](self, "isAuthenticated");
    v7 = 1024;
    v8 = -[CARSession isActivated](self, "isActivated");
    _os_log_impl(&dword_1A83A2000, v3, OS_LOG_TYPE_DEFAULT, "session isAuthenticated:%d, isActivated:%d", (uint8_t *)v6, 0xEu);
  }

  v4 = -[CARSession isAuthenticated](self, "isAuthenticated");
  if (v4)
    LOBYTE(v4) = -[CARSession isActivated](self, "isActivated");
  return v4;
}

- (void)_newObserverAdded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  CARSession *v10;

  v4 = a3;
  -[CARSession configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__CARSession__newObserverAdded___block_invoke;
  v8[3] = &unk_1E54299E0;
  v9 = v4;
  v10 = self;
  v7 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

void __32__CARSession__newObserverAdded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "initialURL");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = objc_msgSend(v7, "screenType");

    if (v5 == 1)
    {
      objc_msgSend(v7, "initialURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(*(id *)(a1 + 32), "session:showUIForScreenInfo:withURL:", *(_QWORD *)(a1 + 40), v7, v6);

    }
  }

}

- (void)addObserver:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CARSession observers](self, "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", v5);

  -[CARSession _newObserverAdded:](self, "_newObserverAdded:", v5);
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CARSession observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

+ (int64_t)_siriRequestEventForEndpointAction:(id)a3
{
  id v3;
  int64_t v4;
  NSObject *v6;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA4690]) & 1) == 0)
  {
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA4680]) & 1) != 0)
    {
      v4 = 2;
      goto LABEL_9;
    }
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA4688]) & 1) != 0)
    {
      v4 = 3;
      goto LABEL_9;
    }
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA4698]) & 1) != 0)
    {
      v4 = 4;
      goto LABEL_9;
    }
    CarGeneralLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[CARSession _siriRequestEventForEndpointAction:].cold.1();

  }
  v4 = 1;
LABEL_9:

  return v4;
}

- (CARSession)initWithFigEndpoint:(OpaqueFigEndpoint *)a3 sessionStatusOptions:(unint64_t)a4
{
  CARSession *v6;
  CARSession *v7;
  CARObserverHashTable *v8;
  CARObserverHashTable *observers;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *clusterURLUpdateQueue;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSNumber *systemNightMode;
  void *v22;
  void *v23;
  uint64_t v24;
  CARAppearanceManager *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  CARAppearanceManager *appearanceManager;
  void *v32;
  int v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v44[4];
  CARSession *v45;
  _QWORD handler[4];
  id v47;
  id location;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = -[CARSession init](self, "init");
  v7 = v6;
  if (!v6)
  {
LABEL_21:
    a3 = v7;
    goto LABEL_22;
  }
  v6->_sessionStatusOptions = a4;
  v8 = -[CARObserverHashTable initWithProtocol:]([CARObserverHashTable alloc], "initWithProtocol:", &unk_1EE9AC738);
  observers = v7->_observers;
  v7->_observers = v8;

  if (a3)
  {
    v7->_endpoint = (OpaqueFigEndpoint *)CFRetain(a3);
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListeners();
    -[CARSession _fetchAuthenticationStatus](v7, "_fetchAuthenticationStatus");
    -[CARSession _fetchActivationStatus](v7, "_fetchActivationStatus");
    if (-[CARSession _sessionReady](v7, "_sessionReady"))
    {
      -[CARSession _updateConfiguration](v7, "_updateConfiguration");
      -[CARSession configuration](v7, "configuration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "screens");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12 >= 2)
      {
        CarGeneralLogging();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A83A2000, v13, OS_LOG_TYPE_DEFAULT, "Listening for cluster URL update notifications", buf, 2u);
        }

        v14 = dispatch_queue_create("com.apple.carkit.clusterURLUpdates", 0);
        clusterURLUpdateQueue = v7->_clusterURLUpdateQueue;
        v7->_clusterURLUpdateQueue = (OS_dispatch_queue *)v14;

        objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObserver:selector:name:object:", v7, sel__clusterURLsUpdated_, CFSTR("CRInstrumentClusterURLsDidChangeNotification"), 0);

      }
      CarGeneralLogging();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A83A2000, v17, OS_LOG_TYPE_DEFAULT, "Creating location based night mode observer", buf, 2u);
      }

      objc_initWeak(&location, v7);
      v18 = MEMORY[0x1E0C80D38];
      v19 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __55__CARSession_initWithFigEndpoint_sessionStatusOptions___block_invoke;
      handler[3] = &unk_1E5429A08;
      objc_copyWeak(&v47, &location);
      notify_register_dispatch("com.apple.private.carkit.fallbackNightModeChanged", &v7->_nightFallbackNotifyToken, MEMORY[0x1E0C80D38], handler);

      -[CARSession _endpointValueForKey:](v7, "_endpointValueForKey:", *MEMORY[0x1E0CA4350]);
      v20 = objc_claimAutoreleasedReturnValue();
      systemNightMode = v7->_systemNightMode;
      v7->_systemNightMode = (NSNumber *)v20;

      -[CARSession _fetchFallbackIsNightWithToken:](v7, "_fetchFallbackIsNightWithToken:", v7->_nightFallbackNotifyToken);
      -[CARSession _endpointValueForKey:](v7, "_endpointValueForKey:", *MEMORY[0x1E0CA4498]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
        v24 = objc_msgSend(v22, "integerValue");
      else
        v24 = -1;
      v7->_voiceTriggerMode = v24;
      v25 = [CARAppearanceManager alloc];
      -[CARSession configuration](v7, "configuration");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "screens");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[NSNumber BOOLValue](v7->_systemNightMode, "BOOLValue");
      -[CARSession fallbackNightMode](v7, "fallbackNightMode");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[CARAppearanceManager initWithScreens:initialSystemNightMode:initialLocationBasedNightMode:delegate:](v25, "initWithScreens:initialSystemNightMode:initialLocationBasedNightMode:delegate:", v27, v28, objc_msgSend(v29, "BOOLValue"), v7);
      appearanceManager = v7->_appearanceManager;
      v7->_appearanceManager = (CARAppearanceManager *)v30;

      if ((-[CARSession sessionStatusOptions](v7, "sessionStatusOptions") & 2) != 0)
      {
        +[CARPrototypePref disableLocationNightMode](CARPrototypePref, "disableLocationNightMode");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "valueBool");

        if (v33)
        {
          CarGeneralLogging();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A83A2000, v34, OS_LOG_TYPE_DEFAULT, "Disabling location night mode", buf, 2u);
          }

          -[CARAppearanceManager setDisableLocationNightMode](v7->_appearanceManager, "setDisableLocationNightMode");
        }
      }
      CarGeneralLogging();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = (void *)objc_opt_class();
        -[CARSession systemNightMode](v7, "systemNightMode");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "_stringForNightModeNumber:", v37);
        v38 = (id)objc_claimAutoreleasedReturnValue();
        v39 = (void *)objc_opt_class();
        -[CARSession fallbackNightMode](v7, "fallbackNightMode");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "_stringForNightModeNumber:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v50 = v38;
        v51 = 2112;
        v52 = v41;
        _os_log_impl(&dword_1A83A2000, v35, OS_LOG_TYPE_DEFAULT, "Initial system night mode: %@, initial location night mode: %@", buf, 0x16u);

      }
      -[CARSessionConfiguration screens](v7->_configuration, "screens");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v19;
      v44[1] = 3221225472;
      v44[2] = __55__CARSession_initWithFigEndpoint_sessionStatusOptions___block_invoke_269;
      v44[3] = &unk_1E5429A30;
      v45 = v7;
      objc_msgSend(v42, "enumerateObjectsUsingBlock:", v44);

      objc_destroyWeak(&v47);
      objc_destroyWeak(&location);
    }
    goto LABEL_21;
  }
LABEL_22:

  return (CARSession *)a3;
}

void __55__CARSession_initWithFigEndpoint_sessionStatusOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  NSObject *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CarGeneralLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A83A2000, v4, OS_LOG_TYPE_DEFAULT, "Received cartkid ambient light changed notification, fetching ambient light", v5, 2u);
    }

    objc_msgSend(WeakRetained, "_fetchFallbackIsNightWithToken:", a2);
  }

}

void __55__CARSession_initWithFigEndpoint_sessionStatusOptions___block_invoke_269(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__CARSession_initWithFigEndpoint_sessionStatusOptions___block_invoke_2;
  v6[3] = &unk_1E54299B8;
  v7 = v3;
  v4 = *(void **)(a1 + 32);
  v8 = v4;
  v5 = v3;
  objc_msgSend(v4, "_performExtendedEndpointAction:", v6);

}

void __55__CARSession_initWithFigEndpoint_sessionStatusOptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void (*v5)(uint64_t, void *, CFTypeRef *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CFTypeRef cf;

  cf = 0;
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void (**)(uint64_t, void *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 120);
  if (v5)
    v5(a2, v4, &cf);

  v6 = *(void **)(a1 + 40);
  if (cf)
  {
    objc_msgSend(*(id *)(a1 + 40), "_handleViewAreaChangeWithPayload:");
    CFRelease(cf);
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "viewAreas");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_updateScreenInfo:currentViewAreaToViewArea:duration:transitionControlType:", v7, v9, 0, 0.0);

  }
}

- (NSString)description
{
  void *v3;
  void *v4;
  __CFString *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v16 = (void *)MEMORY[0x1E0CB3940];
  v17.receiver = self;
  v17.super_class = (Class)CARSession;
  -[CARSession description](&v17, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARSession nightMode](self, "nightMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("NO");
  if (v4)
  {
    -[CARSession nightMode](self, "nightMode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "BOOLValue"))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
  }
  else
  {
    v6 = CFSTR("unset");
  }
  -[CARSession limitUserInterfaces](self, "limitUserInterfaces");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[CARSession limitUserInterfaces](self, "limitUserInterfaces");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "BOOLValue"))
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
  }
  else
  {
    v8 = CFSTR("unset");
  }
  -[CARSession electronicTollCollectionAvailable](self, "electronicTollCollectionAvailable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[CARSession electronicTollCollectionAvailable](self, "electronicTollCollectionAvailable");
    v10 = CFSTR("NO");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString BOOLValue](v5, "BOOLValue"))
      v10 = CFSTR("YES");
  }
  else
  {
    v10 = CFSTR("unset");
  }
  -[CARSession configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@, night mode: %@, limit UI: %@, ETC available: %@, configuration: %@"), v3, v6, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  if (v7)

  if (v4)
  return (NSString *)v12;
}

- (id)_fig_safe_description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CARSession;
  -[CARSession description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)dealloc
{
  OpaqueFigEndpoint *endpoint;
  objc_super v4;

  CMNotificationCenterGetDefaultLocalCenter();
  FigNotificationCenterRemoveWeakListeners();
  notify_cancel(self->_nightFallbackNotifyToken);
  endpoint = self->_endpoint;
  if (endpoint)
    CFRelease(endpoint);
  v4.receiver = self;
  v4.super_class = (Class)CARSession;
  -[CARSession dealloc](&v4, sel_dealloc);
}

- (OpaqueFigEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)_performExtendedEndpointAction:(id)a3
{
  void (**v4)(id, _QWORD);
  OpaqueFigEndpoint *v5;
  OpaqueFigEndpoint *v6;
  NSObject *v7;

  v4 = (void (**)(id, _QWORD))a3;
  v5 = -[CARSession endpoint](self, "endpoint");
  if (v5 && (v6 = v5, FigEndpointExtendedGetClassID(), CMBaseObjectIsMemberOfClass()))
  {
    if (v4)
      ((void (**)(id, OpaqueFigEndpoint *))v4)[2](v4, v6);
  }
  else
  {
    CarGeneralLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CARSession _performExtendedEndpointAction:].cold.1();

  }
}

- (id)_endpointValueForKey:(__CFString *)a3
{
  uint64_t CMBaseObject;
  uint64_t (*v5)(uint64_t, __CFString *, _QWORD, id *);
  int v6;
  BOOL v7;
  NSObject *v8;
  NSObject *v10;
  id v11;

  if (-[CARSession endpoint](self, "endpoint"))
  {
    v11 = 0;
    CMBaseObject = FigEndpointGetCMBaseObject();
    v5 = *(uint64_t (**)(uint64_t, __CFString *, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (!v5 || ((v6 = v5(CMBaseObject, a3, *MEMORY[0x1E0C9AE00], &v11), v6 != -12787) ? (v7 = v6 == 0) : (v7 = 1), !v7))
    {
      CarGeneralLogging();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CARSession _endpointValueForKey:].cold.2();

    }
    return v11;
  }
  else
  {
    CarGeneralLogging();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CARSession _endpointValueForKey:].cold.1();

    return 0;
  }
}

- (void)_setEndpointValue:(void *)a3 forKey:(__CFString *)a4
{
  uint64_t CMBaseObject;
  void (*v7)(uint64_t, __CFString *, void *);

  if (-[CARSession endpoint](self, "endpoint"))
  {
    CMBaseObject = FigEndpointGetCMBaseObject();
    v7 = *(void (**)(uint64_t, __CFString *, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v7)
      v7(CMBaseObject, a4, a3);
  }
}

- (void)_fetchAuthenticationStatus
{
  uint64_t CMBaseObject;
  void (*v4)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD, _QWORD, NSData **);
  NSData *MFiCertificateSerialNumber;
  NSObject *v8;
  NSData *v9;
  uint8_t v10[16];
  NSData *v11;
  CFTypeRef cf1;

  v11 = 0;
  cf1 = 0;
  -[CARSession endpoint](self, "endpoint");
  CMBaseObject = FigEndpointGetCMBaseObject();
  v4 = *(void (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v4
    && (v4(CMBaseObject, *MEMORY[0x1E0CA4120], 0, &cf1), cf1)
    && (CFEqual(cf1, (CFTypeRef)*MEMORY[0x1E0CA37E0]) || CFEqual(cf1, CFSTR("MFiMutualAuth"))))
  {
    -[CARSession endpoint](self, "endpoint");
    v5 = FigEndpointGetCMBaseObject();
    v6 = *(void (**)(uint64_t, _QWORD, _QWORD, NSData **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v6)
    {
      v6(v5, *MEMORY[0x1E0CA4118], 0, &v11);
      if (v11)
      {
        MFiCertificateSerialNumber = self->_MFiCertificateSerialNumber;
        self->_MFiCertificateSerialNumber = v11;

        self->_authenticated = 1;
        CarGeneralLogging();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl(&dword_1A83A2000, v8, OS_LOG_TYPE_DEFAULT, "endpoint is authenticated", v10, 2u);
        }

      }
    }
  }
  else
  {
    v9 = self->_MFiCertificateSerialNumber;
    self->_MFiCertificateSerialNumber = 0;

    self->_authenticated = 0;
  }
  if (cf1)
    CFRelease(cf1);
}

- (void)_fetchActivationStatus
{
  OUTLINED_FUNCTION_11(&dword_1A83A2000, a2, a3, "Unable to fetch activation status from AirPlay endpoint server with error %i", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (id)_capabilitiesIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  -[CARSession MFiCertificateSerialNumber](self, "MFiCertificateSerialNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CARSession MFiCertificateSerialNumber](self, "MFiCertificateSerialNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "base64EncodedStringWithOptions:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      v6 = v5;
    else
      v6 = CFSTR("CarCapabilitiesDefaultIdentifier");

  }
  else
  {
    v6 = CFSTR("CarCapabilitiesDefaultIdentifier");
  }
  return v6;
}

- (void)_updateConfiguration
{
  void *v3;
  CARSessionConfiguration *v4;
  unint64_t v5;
  CARSessionConfiguration *v6;
  CARSessionConfiguration *configuration;
  _QWORD v8[5];

  -[CARSession _capabilitiesIdentifier](self, "_capabilitiesIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRCarPlayCapabilities setCapabilitiesIdentifier:](CRCarPlayCapabilities, "setCapabilitiesIdentifier:", v3);

  if ((-[CARSession sessionStatusOptions](self, "sessionStatusOptions") & 4) != 0)
    +[CRCarPlayCapabilities waitForCarCapabilitiesValuesWithReply:](CRCarPlayCapabilities, "waitForCarCapabilitiesValuesWithReply:", 0);
  v4 = [CARSessionConfiguration alloc];
  v5 = -[CARSession sessionStatusOptions](self, "sessionStatusOptions");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__CARSession__updateConfiguration__block_invoke;
  v8[3] = &unk_1E5428C90;
  v8[4] = self;
  v6 = -[CARSessionConfiguration initWithSessionStatusOptions:propertySupplier:](v4, "initWithSessionStatusOptions:propertySupplier:", v5, v8);
  configuration = self->_configuration;
  self->_configuration = v6;

}

uint64_t __34__CARSession__updateConfiguration__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endpointValueForKey:", a2);
}

- (void)_updateCarCapabilities
{
  void *v3;
  id v4;

  -[CARSession configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateCarCapabilities");

  -[CARSession observers](self, "observers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionDidUpdateCarCapabilities:", self);

}

- (OpaqueFigEndpointRemoteControlSession)createRemoteControlSession:(id)a3 channelID:(id)a4 withoutReply:(BOOL)a5 qualityOfService:(id)a6 streamPriority:(id)a7 error:(id *)a8
{
  _BOOL4 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  __CFDictionary *Mutable;
  __CFDictionary *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  OpaqueFigEndpointRemoteControlSession *v28;
  NSObject *v29;
  NSObject *v30;
  _QWORD v32[7];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[2];

  v11 = a5;
  v42[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  objc_msgSend(v14, "substringToIndex:", 8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CARSession isActivated](self, "isActivated"))
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (Mutable)
    {
      v20 = Mutable;
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA44C8], v14);
      if (v15)
        CFDictionarySetValue(v20, (const void *)*MEMORY[0x1E0CA4520], v15);
      if (v11)
        CFDictionarySetValue(v20, (const void *)*MEMORY[0x1E0CA4540], MEMORY[0x1E0C9AAB0]);
      if (v16)
        CFDictionarySetValue(v20, (const void *)*MEMORY[0x1E0CA4530], v16);
      if (v17)
        CFDictionarySetValue(v20, (const void *)*MEMORY[0x1E0CA4550], v17);
      CFDictionarySetValue(v20, (const void *)*MEMORY[0x1E0CA4538], MEMORY[0x1E0C9AAB0]);
      v37 = 0;
      v38 = &v37;
      v39 = 0x2020000000;
      v40 = 0;
      v33 = 0;
      v34 = &v33;
      v35 = 0x2020000000;
      v36 = 0;
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __102__CARSession_createRemoteControlSession_channelID_withoutReply_qualityOfService_streamPriority_error___block_invoke;
      v32[3] = &unk_1E5429A58;
      v32[5] = &v37;
      v32[6] = v20;
      v32[4] = &v33;
      -[CARSession _performExtendedEndpointAction:](self, "_performExtendedEndpointAction:", v32);
      CFRelease(v20);
      v21 = *((int *)v34 + 6);
      if (!(_DWORD)v21)
      {
        CFRetain((CFTypeRef)v38[3]);
        v28 = (OpaqueFigEndpointRemoteControlSession *)v38[3];
LABEL_34:
        _Block_object_dispose(&v33, 8);
        _Block_object_dispose(&v37, 8);
        goto LABEL_35;
      }
      v41 = *MEMORY[0x1E0CB3388];
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v21, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = *((_DWORD *)v34 + 6);
      if (v24 == -16727)
      {
        CarGeneralLogging();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          -[CARSession createRemoteControlSession:channelID:withoutReply:qualityOfService:streamPriority:error:].cold.3();

        if (!a8)
          goto LABEL_33;
        v26 = 4;
      }
      else if (v24 == -17606)
      {
        CarGeneralLogging();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[CARSession createRemoteControlSession:channelID:withoutReply:qualityOfService:streamPriority:error:].cold.2();

        if (!a8)
          goto LABEL_33;
        v26 = 2;
      }
      else
      {
        CarGeneralLogging();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[CARSession createRemoteControlSession:channelID:withoutReply:qualityOfService:streamPriority:error:].cold.1();

        if (!a8)
          goto LABEL_33;
        v26 = 3;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.carkit.session"), v26, v23);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:

      v28 = 0;
      goto LABEL_34;
    }
    goto LABEL_22;
  }
  CarGeneralLogging();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    -[CARSession createRemoteControlSession:channelID:withoutReply:qualityOfService:streamPriority:error:].cold.4();

  if (!a8)
  {
LABEL_22:
    v28 = 0;
    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.carkit.session"), 1, 0);
  v28 = 0;
  *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_35:

  return v28;
}

uint64_t __102__CARSession_createRemoteControlSession_channelID_withoutReply_qualityOfService_streamPriority_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t result;

  v4 = a1[6];
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 80);
  if (v6)
    result = v6(a2, v4, v5 + 24);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

- (NSNumber)nightMode
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[CARSession appearanceManager](self, "appearanceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "effectiveGlobalNightMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (int64_t)userInterfaceStyleForScreenUUID:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[CARSession appearanceManager](self, "appearanceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "effectiveStyleForUIAppearanceForScreenUUID:", v4);

  return v6;
}

- (int64_t)mapInterfaceStyleForScreenUUID:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[CARSession appearanceManager](self, "appearanceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "effectiveStyleForMapAppearanceForScreenUUID:", v4);

  return v6;
}

- (void)_handleNightModeChange
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("CARSessionNightModeChangedNotification"), self, 0);

  -[CARSession observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CARSession nightMode](self, "nightMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "session:didUpdateNightMode:", self, objc_msgSend(v4, "BOOLValue"));

}

- (int64_t)_carUserInterfaceStyleForAppearanceMode:(unint64_t)a3
{
  int64_t v3;

  v3 = 2;
  if (a3 != 1)
    v3 = -1;
  if (a3)
    return v3;
  else
    return 1;
}

- (void)_handleAppearanceModeUpdateWithParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARSession configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screenInfoForScreenID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if ((objc_msgSend(v7, "supportsAppearanceMode") & 1) != 0)
    {
      -[CARSession appearanceManager](self, "appearanceManager");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject handleUIAppearanceUpdateWithParameters:](v8, "handleUIAppearanceUpdateWithParameters:", v4);
    }
    else
    {
      CarGeneralLogging();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[CARSession _handleAppearanceModeUpdateWithParameters:].cold.2();
    }
  }
  else
  {
    CarGeneralLogging();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CARSession _handleAppearanceModeUpdateWithParameters:].cold.1();
  }

}

- (void)_handleMapAppearanceModeUpdateWithParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARSession configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screenInfoForScreenID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if ((objc_msgSend(v7, "supportsMapAppearanceMode") & 1) != 0)
    {
      -[CARSession appearanceManager](self, "appearanceManager");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject handleMapAppearanceUpdateWithParameters:](v8, "handleMapAppearanceUpdateWithParameters:", v4);
    }
    else
    {
      CarGeneralLogging();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1A83A2000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring map appearance update because screen does not support maps appearance mode", v9, 2u);
      }
    }
  }
  else
  {
    CarGeneralLogging();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CARSession _handleAppearanceModeUpdateWithParameters:].cold.1();
  }

}

+ (id)_stringForNightModeNumber:(id)a3
{
  if (!a3)
    return CFSTR("Not set");
  objc_msgSend(a3, "BOOLValue");
  NSStringFromBOOL();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)APEndPointInfo
{
  return -[CARSession _endpointValueForKey:](self, "_endpointValueForKey:", CFSTR("EndpointInfo"));
}

- (NSString)sourceVersion
{
  void *v2;
  id v3;
  void *v4;

  -[CARSession _endpointValueForKey:](self, "_endpointValueForKey:", CFSTR("SourceVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "stringValue");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    v3 = v2;
  }
  v4 = v3;
LABEL_7:

  return (NSString *)v4;
}

- (void)_fetchFallbackIsNightWithToken:(int)a3
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t state64;

  CarGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CARSession _fetchFallbackIsNightWithToken:].cold.2();

  state64 = 0;
  notify_get_state(a3, &state64);
  v6 = state64;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", state64 != 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARSession setFallbackNightMode:](self, "setFallbackNightMode:", v7);

  CarGeneralLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CARSession _fetchFallbackIsNightWithToken:].cold.1(v6 != 0, v8);

  -[CARSession appearanceManager](self, "appearanceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleLocationBasedNightModeUpdate:", v6 != 0);

  -[CARSession _handleNightModeChange](self, "_handleNightModeChange");
}

- (void)appearanceManager:(id)a3 didUpdateUIAppearanceStyle:(int64_t)a4 forScreenUUIDs:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  CARSession *v11;

  v7 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__CARSession_appearanceManager_didUpdateUIAppearanceStyle_forScreenUUIDs___block_invoke;
  v9[3] = &unk_1E5429A80;
  v10 = v7;
  v11 = self;
  v8 = v7;
  objc_msgSend(a5, "enumerateObjectsUsingBlock:", v9);

}

void __74__CARSession_appearanceManager_didUpdateUIAppearanceStyle_forScreenUUIDs___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "effectiveStyleForUIAppearanceForScreenUUID:", v4);
  objc_msgSend(*(id *)(a1 + 40), "observers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "session:didUpdateAppearanceStyle:forScreenUUID:", *(_QWORD *)(a1 + 40), v5, v4);

}

- (void)appearanceManager:(id)a3 didUpdateMapAppearanceStyle:(int64_t)a4 forScreenUUIDs:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  CARSession *v11;

  v7 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__CARSession_appearanceManager_didUpdateMapAppearanceStyle_forScreenUUIDs___block_invoke;
  v9[3] = &unk_1E5429A80;
  v10 = v7;
  v11 = self;
  v8 = v7;
  objc_msgSend(a5, "enumerateObjectsUsingBlock:", v9);

}

void __75__CARSession_appearanceManager_didUpdateMapAppearanceStyle_forScreenUUIDs___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "effectiveStyleForMapAppearanceForScreenUUID:", v4);
  objc_msgSend(*(id *)(a1 + 40), "observers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "session:didUpdateMapAppearanceStyle:forScreenUUID:", *(_QWORD *)(a1 + 40), v5, v4);

}

- (NSNumber)limitUserInterfaces
{
  return (NSNumber *)-[CARSession _endpointValueForKey:](self, "_endpointValueForKey:", *MEMORY[0x1E0CA42F8]);
}

- (NSNumber)electronicTollCollectionAvailable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if ((-[CARSession sessionStatusOptions](self, "sessionStatusOptions") & 2) != 0)
  {
    -[CARSession _endpointValueForKey:](self, "_endpointValueForKey:", *MEMORY[0x1E0CA4490]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "valueForKey:", *MEMORY[0x1E0CA49B0]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "valueForKey:", CFSTR("active"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = 0;
      }

    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }
  return (NSNumber *)v3;
}

- (void)_handleOpenURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CARSession observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "session:openURL:", self, v4);

}

- (void)_handleSiriRequestEvent:(int64_t)a3 withPayload:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[CARSession observers](self, "observers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "session:handleSiriRequestEvent:withPayload:", self, a3, v6);

  -[CARSession observers](self, "observers");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "session:handleSiriRequestEvent:", self, a3);

}

- (void)_handleViewAreaChangeWithPayload:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("viewAreaIndex");
  objc_msgSend(v4, "objectForKey:", CFSTR("viewAreaIndex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    || (v6 = CFSTR("viewArea"),
        objc_msgSend(v4, "objectForKey:", CFSTR("viewArea")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    objc_msgSend(v4, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v9, "unsignedIntegerValue");

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("animationDurationMillis"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  -[CARSession configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "screenInfoForScreenID:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "viewAreas");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if ((unint64_t)v8 >= v16)
  {
    CarGeneralLogging();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CARSession _handleViewAreaChangeWithPayload:].cold.2((uint64_t)v8);

    v8 = 0;
  }
  objc_msgSend(v14, "viewAreas");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if ((unint64_t)v8 >= v19)
  {
    CarGeneralLogging();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[CARSession _handleViewAreaChangeWithPayload:].cold.1((uint64_t)v8);
  }
  else
  {
    objc_msgSend(v14, "viewAreas");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndex:", v8);
    v21 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "viewAreas");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _adjacentViewAreaForPayload(v4, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setAdjacentViewArea:", v23);
    -[CARSession _updateScreenInfo:currentViewAreaToViewArea:duration:transitionControlType:](self, "_updateScreenInfo:currentViewAreaToViewArea:duration:transitionControlType:", v14, v21, _transitionControlTypeForViewAreaChange(v21, v23), v12 / 1000.0);

  }
}

- (void)requestAdjacentViewAreaForScreenID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v4 = a3;
  -[CARSession configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screenInfoForScreenID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "adjacentViewArea");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "viewAreas");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "indexOfObject:", v7);

    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __49__CARSession_requestAdjacentViewAreaForScreenID___block_invoke;
      v10[3] = &unk_1E5429AA8;
      v11 = v4;
      v12 = v9;
      -[CARSession _performExtendedEndpointAction:](self, "_performExtendedEndpointAction:", v10);

    }
  }

}

uint64_t __49__CARSession_requestAdjacentViewAreaForScreenID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  result = CMBaseObjectGetVTable();
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(result + 24) + 112);
  if (v6)
    return v6(a2, v3, v4);
  return result;
}

- (void)_updateScreenInfo:(id)a3 currentViewAreaToViewArea:(id)a4 duration:(double)a5 transitionControlType:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;

  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "setCurrentViewArea:", v10);
  objc_msgSend(v11, "setCurrentViewAreaTransitionControlType:", a6);
  -[CARSession observers](self, "observers");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "session:didSetViewArea:forScreenID:withDuration:transitionControlType:", self, v10, v12, a6, a5);
}

- (void)_handleShowUIWithParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  CARSession *v15;
  id v16;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v4, "objectForKey:", CFSTR("url"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CARSession configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "screens");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__CARSession__handleShowUIWithParameters___block_invoke;
  v13[3] = &unk_1E5429808;
  v14 = v5;
  v15 = self;
  v16 = v8;
  v11 = v8;
  v12 = v5;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);

}

void __42__CARSession__handleShowUIWithParameters___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "observers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "session:showUIForScreenInfo:withURL:", *(_QWORD *)(a1 + 40), v6, *(_QWORD *)(a1 + 48));

  }
}

- (void)_handleStopUIWithParameters:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  CARSession *v10;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("uuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARSession configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__CARSession__handleStopUIWithParameters___block_invoke;
  v8[3] = &unk_1E54299E0;
  v9 = v4;
  v10 = self;
  v7 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

void __42__CARSession__handleStopUIWithParameters___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "observers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "session:stopUIForScreenInfo:", *(_QWORD *)(a1 + 40), v6);

  }
}

- (void)_handleDisplayPanelsUpdateWithParameters:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  v4 = a3;
  CarGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_DEFAULT, "Received display panels update", buf, 2u);
  }

  objc_msgSend(v4, "objectForKey:", CFSTR("displayPanels"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__CARSession__handleDisplayPanelsUpdateWithParameters___block_invoke;
  v7[3] = &unk_1E5428DA8;
  v7[4] = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

void __55__CARSession__handleDisplayPanelsUpdateWithParameters___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;

  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("videoStreams"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("uid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displays");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__CARSession__handleDisplayPanelsUpdateWithParameters___block_invoke_2;
  v14[3] = &unk_1E5428E20;
  v15 = v4;
  v8 = v4;
  objc_msgSend(v6, "bs_firstObjectPassingTest:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "updateStreams:", v11);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __55__CARSession__handleDisplayPanelsUpdateWithParameters___block_invoke_3;
  v12[3] = &unk_1E5429AD0;
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v9;
  v10 = v9;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v12);

}

uint64_t __55__CARSession__handleDisplayPanelsUpdateWithParameters___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __55__CARSession__handleDisplayPanelsUpdateWithParameters___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("uuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "screenInfoForScreenID:", v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v12;
  if (v12)
  {
    objc_msgSend(v12, "setPhysicalDisplay:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v12, "currentViewArea");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "observers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v12, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "session:didSetViewArea:forScreenID:withDuration:transitionControlType:", v10, v8, v11, 0, 0.0);

    }
    v7 = v12;
  }

}

- (void)requestCarUI
{
  -[CARSession requestCarUIForURL:](self, "requestCarUIForURL:", 0);
}

- (void)requestCarUIForURL:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__CARSession_requestCarUIForURL___block_invoke;
  v6[3] = &unk_1E5429AF8;
  v7 = v4;
  v5 = v4;
  -[CARSession _performExtendedEndpointAction:](self, "_performExtendedEndpointAction:", v6);

}

uint64_t __33__CARSession_requestCarUIForURL___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t (*v5)(uint64_t, _QWORD, uint64_t);

  v3 = *(_QWORD *)(a1 + 32);
  result = CMBaseObjectGetVTable();
  v5 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 24) + 8);
  if (v5)
    return v5(a2, 0, v3);
  return result;
}

- (void)setSiriForwardingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  _QWORD *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  CarGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("disabled");
    if (v3)
      v6 = CFSTR("enabled");
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_DEFAULT, "Setting test Siri forwarding %@", (uint8_t *)&v8, 0xCu);
  }

  v7 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if (!v3)
    v7 = (_QWORD *)MEMORY[0x1E0C9AE40];
  -[CARSession _setEndpointValue:forKey:](self, "_setEndpointValue:forKey:", *v7, *MEMORY[0x1E0CA4108]);
}

- (BOOL)carOwnsScreen
{
  void *v2;
  char v3;

  -[CARSession _endpointValueForKey:](self, "_endpointValueForKey:", *MEMORY[0x1E0CA4160]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)carOwnsMainAudio
{
  void *v2;
  char v3;

  -[CARSession _endpointValueForKey:](self, "_endpointValueForKey:", *MEMORY[0x1E0CA4158]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (unint64_t)navigationOwner
{
  void *v3;
  char v4;
  void *v6;
  int v7;

  -[CARSession _endpointValueForKey:](self, "_endpointValueForKey:", *MEMORY[0x1E0CA44C0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if ((v4 & 1) != 0)
    return 1;
  -[CARSession _endpointValueForKey:](self, "_endpointValueForKey:", *MEMORY[0x1E0CA4148]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
    return 2;
  else
    return 0;
}

- (id)lastNavigatingBundleIdentifier
{
  CARNavigationOwnershipManager *v2;
  void *v3;

  v2 = -[CARNavigationOwnershipManager initWithIdentifier:delegate:]([CARNavigationOwnershipManager alloc], "initWithIdentifier:delegate:", 0, 0);
  -[CARNavigationOwnershipManager lastNavigatingBundleIdentifier](v2, "lastNavigatingBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)requestTurnByTurnOwnership
{
  -[CARSession _setEndpointValue:forKey:](self, "_setEndpointValue:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CA44C0]);
}

- (void)releaseTurnByTurnOwnership
{
  -[CARSession _setEndpointValue:forKey:](self, "_setEndpointValue:forKey:", *MEMORY[0x1E0C9AE40], *MEMORY[0x1E0CA44C0]);
}

- (BOOL)recognizingSpeech
{
  void *v2;
  char v3;

  -[CARSession _endpointValueForKey:](self, "_endpointValueForKey:", *MEMORY[0x1E0CA4150]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)borrowScreenForClient:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  CARSessionScreenBorrowToken *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[CARSessionScreenBorrowToken initWithSession:client:reason:]([CARSessionScreenBorrowToken alloc], "initWithSession:client:reason:", self, v7, v6);

  return v8;
}

- (void)unborrowScreenForToken:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "unborrowToken");

}

- (void)takeScreenForClient:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__CARSession_takeScreenForClient_reason___block_invoke;
  v10[3] = &unk_1E54299B8;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[CARSession _performExtendedEndpointAction:](self, "_performExtendedEndpointAction:", v10);

}

uint64_t __41__CARSession_takeScreenForClient_reason___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  result = CMBaseObjectGetVTable();
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(result + 24) + 32);
  if (v6)
    return v6(a2, v3, v4);
  return result;
}

- (void)takeScreenForConnection
{
  -[CARSession _performExtendedEndpointAction:](self, "_performExtendedEndpointAction:", &__block_literal_global_28);
}

uint64_t __37__CARSession_takeScreenForConnection__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t (*v4)(uint64_t, const __CFString *, const __CFString *);

  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, const __CFString *, const __CFString *))(*(_QWORD *)(result + 24) + 32);
  if (v4)
    return v4(a2, CFSTR("com.apple.CarPlayApp"), CFSTR("InitialCarPlayConnection"));
  return result;
}

- (CARInputDeviceManager)inputDeviceManager
{
  CARInputDeviceManager *inputDeviceManager;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CARInputDeviceManager *v8;
  CARInputDeviceManager *v9;

  inputDeviceManager = self->_inputDeviceManager;
  if (!inputDeviceManager)
  {
    -[CARSession _endpointValueForKey:](self, "_endpointValueForKey:", *MEMORY[0x1E0CA4230]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CARSession configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screenIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CARSession _endpointValueForKey:](self, "_endpointValueForKey:", *MEMORY[0x1E0CA4490]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CARInputDeviceManager initWithEndpointInputDevices:screenIDs:vehicleInformation:session:]([CARInputDeviceManager alloc], "initWithEndpointInputDevices:screenIDs:vehicleInformation:session:", v4, v6, v7, self);
    v9 = self->_inputDeviceManager;
    self->_inputDeviceManager = v8;

    inputDeviceManager = self->_inputDeviceManager;
  }
  return inputDeviceManager;
}

- (void)setInputMode:(unint64_t)a3 forInputDevice:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  unint64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__CARSession_setInputMode_forInputDevice___block_invoke;
  v8[3] = &unk_1E5429AA8;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  -[CARSession _performExtendedEndpointAction:](self, "_performExtendedEndpointAction:", v8);

}

void __42__CARSession_setInputMode_forInputDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, id, uint64_t);
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v5 = *(void (**)(uint64_t, id, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 56);
  if (v5)
    v5(a2, v6, v4);

}

- (void)suggestUI:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD block[5];
  id v18;
  _QWORD v19[5];
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[CARSession sessionStatusOptions](self, "sessionStatusOptions") & 2) != 0)
  {
    CarGeneralLogging();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CARSession suggestUI:].cold.1();

  }
  else
  {
    -[CARSession configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screens");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    CarGeneralLogging();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7 < 2)
    {
      if (v9)
      {
        *(_DWORD *)buf = 138412290;
        v21 = v4;
        _os_log_impl(&dword_1A83A2000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring suggestUI with urls = %@", buf, 0xCu);
      }

    }
    else
    {
      if (v9)
      {
        *(_DWORD *)buf = 138543362;
        v21 = v4;
        _os_log_impl(&dword_1A83A2000, v8, OS_LOG_TYPE_DEFAULT, "suggestUI with urls = %{public}@", buf, 0xCu);
      }

      -[CARSession clusterSessionURLs](self, "clusterSessionURLs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[CARSession configuration](self, "configuration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "altScreenSuggestUIURLs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[CARSession clusterSessionURLs](self, "clusterSessionURLs");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __24__CARSession_suggestUI___block_invoke;
        v19[3] = &unk_1E5429BD0;
        v19[4] = self;
        CARHandleSuggestUI(v4, v13, v12, v19);

      }
      else
      {
        CarGeneralLogging();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A83A2000, v15, OS_LOG_TYPE_DEFAULT, "Fetching new cluster URLS", buf, 2u);
        }

        +[CARSessionStatus sessionUpdatesQueue](CARSessionStatus, "sessionUpdatesQueue");
        v16 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __24__CARSession_suggestUI___block_invoke_318;
        block[3] = &unk_1E5427D20;
        block[4] = self;
        v18 = v4;
        dispatch_async(v16, block);

      }
    }
  }

}

void __24__CARSession_suggestUI___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "sendCommand:withParameters:", CFSTR("suggestUI"), a2);
  }
  else
  {
    CarGeneralLogging();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __24__CARSession_suggestUI___block_invoke_cold_1();

  }
}

void __24__CARSession_suggestUI___block_invoke_318(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __24__CARSession_suggestUI___block_invoke_2;
  v2[3] = &unk_1E5429BF8;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  CRFetchInstrumentClusterURLs(v2);

}

void __24__CARSession_suggestUI___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__CARSession_suggestUI___block_invoke_3;
  block[3] = &unk_1E5427D70;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __24__CARSession_suggestUI___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "setClusterSessionURLs:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "altScreenSuggestUIURLs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "clusterSessionURLs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__CARSession_suggestUI___block_invoke_4;
  v6[3] = &unk_1E5429BD0;
  v6[4] = *(_QWORD *)(a1 + 32);
  CARHandleSuggestUI(v4, v5, v3, v6);

}

void __24__CARSession_suggestUI___block_invoke_4(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "sendCommand:withParameters:", CFSTR("suggestUI"), a2);
  }
  else
  {
    CarGeneralLogging();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __24__CARSession_suggestUI___block_invoke_cold_1();

  }
}

- (void)_clusterURLsUpdated:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CARSession *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CarGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v4;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_DEFAULT, "Cluster URLs updated with userInfo: %{public}@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__CARSession__clusterURLsUpdated___block_invoke;
  v7[3] = &unk_1E5427D20;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __34__CARSession__clusterURLsUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("CARSessionUpdateClusterURLsKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_mapNoNulls:", &__block_literal_global_322);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  CarGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A83A2000, v4, OS_LOG_TYPE_DEFAULT, "Updating with URLs: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "setClusterSessionURLs:", v3);
}

uint64_t __34__CARSession__clusterURLsUpdated___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a2);
}

- (BOOL)isPaired
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  _QWORD v7[4];
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v3 = dispatch_semaphore_create(0);
  -[CARSession MFiCertificateSerialNumber](self, "MFiCertificateSerialNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __22__CARSession_isPaired__block_invoke;
  v7[3] = &unk_1E5428480;
  v9 = &v10;
  v5 = v3;
  v8 = v5;
  CRIsPairedWithCertificateSerialNumber(v4, v7);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v4) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v4;
}

intptr_t __22__CARSession_isPaired__block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)sendCommand:(id)a3 withParameters:(id)a4
{
  id v6;
  id v7;
  OpaqueFigEndpoint *v8;
  OpaqueFigEndpoint *v9;
  NSObject *v10;
  void (*v11)(OpaqueFigEndpoint *, id, id, _QWORD, _QWORD);
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[CARSession endpoint](self, "endpoint"))
  {
    v8 = -[CARSession endpoint](self, "endpoint");
    if (!v8 || (v9 = v8, FigEndpointExtendedGetClassID(), !CMBaseObjectIsMemberOfClass()))
      v9 = 0;
    CarGeneralLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1A83A2000, v10, OS_LOG_TYPE_DEFAULT, "sending command %@ %@", (uint8_t *)&v12, 0x16u);
    }

    v11 = *(void (**)(OpaqueFigEndpoint *, id, id, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 24)
                                                                             + 72);
    if (v11)
      v11(v9, v6, v7, 0, 0);
  }

}

- (void)setCornerMaskImageData:(id)a3 forScreenInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint8_t buf[4];
  NSObject *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CARSession configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "screens");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v7);

  if ((v10 & 1) != 0)
  {
    objc_msgSend(v7, "identifier");
    v11 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "wantsCornerMasks"))
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v13 = objc_msgSend(v6, "length");
      CarGeneralLogging();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v15)
        {
          *(_DWORD *)buf = 138543618;
          v23 = v11;
          v24 = 2048;
          v25 = objc_msgSend(v6, "length");
          _os_log_impl(&dword_1A83A2000, v14, OS_LOG_TYPE_DEFAULT, "Screen %{public}@ requests corner masks - setting corner mask image data (length: %lu)", buf, 0x16u);
        }

        objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, v11);
      }
      else
      {
        if (v15)
        {
          *(_DWORD *)buf = 138543362;
          v23 = v11;
          _os_log_impl(&dword_1A83A2000, v14, OS_LOG_TYPE_DEFAULT, "Screen %{public}@ requests corner masks but nil data specified. Sending NSNull", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, v11);

      }
      v17 = objc_msgSend(v12, "copy");
    }
    else
    {
      CarGeneralLogging();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v23 = v11;
        _os_log_impl(&dword_1A83A2000, v16, OS_LOG_TYPE_DEFAULT, "Screen %{public}@ does not request corner masks. Sending NSNull", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0C99E38], "null", v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v21 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v19 = (void *)v17;
    -[CARSession _setEndpointValue:forKey:](self, "_setEndpointValue:forKey:", v17, *MEMORY[0x1E0CA41C0]);

  }
  else
  {
    CarGeneralLogging();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CARSession setCornerMaskImageData:forScreenInfo:].cold.1(v7, v11);
  }

}

- (CARSessionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setInputDeviceManager:(id)a3
{
  objc_storeStrong((id *)&self->_inputDeviceManager, a3);
}

- (int64_t)voiceTriggerMode
{
  return self->_voiceTriggerMode;
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (NSData)MFiCertificateSerialNumber
{
  return self->_MFiCertificateSerialNumber;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (NSNumber)systemNightMode
{
  return self->_systemNightMode;
}

- (void)setSystemNightMode:(id)a3
{
  objc_storeStrong((id *)&self->_systemNightMode, a3);
}

- (NSNumber)fallbackNightMode
{
  return self->_fallbackNightMode;
}

- (void)setFallbackNightMode:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackNightMode, a3);
}

- (int)nightFallbackNotifyToken
{
  return self->_nightFallbackNotifyToken;
}

- (void)setNightFallbackNotifyToken:(int)a3
{
  self->_nightFallbackNotifyToken = a3;
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (unint64_t)sessionStatusOptions
{
  return self->_sessionStatusOptions;
}

- (OS_dispatch_queue)clusterURLUpdateQueue
{
  return self->_clusterURLUpdateQueue;
}

- (void)setClusterURLUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clusterURLUpdateQueue, a3);
}

- (CARAppearanceManager)appearanceManager
{
  return self->_appearanceManager;
}

- (void)setAppearanceManager:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceManager, a3);
}

- (NSArray)clusterSessionURLs
{
  return self->_clusterSessionURLs;
}

- (void)setClusterSessionURLs:(id)a3
{
  objc_storeStrong((id *)&self->_clusterSessionURLs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterSessionURLs, 0);
  objc_storeStrong((id *)&self->_appearanceManager, 0);
  objc_storeStrong((id *)&self->_clusterURLUpdateQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_fallbackNightMode, 0);
  objc_storeStrong((id *)&self->_systemNightMode, 0);
  objc_storeStrong((id *)&self->_MFiCertificateSerialNumber, 0);
  objc_storeStrong((id *)&self->_inputDeviceManager, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

+ (void)_siriRequestEventForEndpointAction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1A83A2000, v0, v1, "Invalid Siri Request Event: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_performExtendedEndpointAction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_0(&dword_1A83A2000, v0, v1, "failed to get extended endpoint", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_endpointValueForKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1A83A2000, v0, v1, "no endpoint available, failed to get endpoint value for key %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_endpointValueForKey:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_4(&dword_1A83A2000, v0, v1, "failed to get endpoint value for key %@, error: %i");
  OUTLINED_FUNCTION_1();
}

- (void)createRemoteControlSession:channelID:withoutReply:qualityOfService:streamPriority:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_13(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_4(&dword_1A83A2000, v0, v1, "Unable to create remote control session for channel uuid: %{public}@, error: %d");
  OUTLINED_FUNCTION_1();
}

- (void)createRemoteControlSession:channelID:withoutReply:qualityOfService:streamPriority:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_13(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_4(&dword_1A83A2000, v0, v1, "Unable to create remote control session, invalid configuration for channel uuid: %{public}@, error: %d");
  OUTLINED_FUNCTION_1();
}

- (void)createRemoteControlSession:channelID:withoutReply:qualityOfService:streamPriority:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_13(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_4(&dword_1A83A2000, v0, v1, "Unable to create remote control session for channel uuid: %{public}@, channel already activated, error: %d");
  OUTLINED_FUNCTION_1();
}

- (void)createRemoteControlSession:channelID:withoutReply:qualityOfService:streamPriority:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1A83A2000, v0, v1, "Unable to create remote control session for channel uuid: %{public}@, endpoint not activated", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_handleAppearanceModeUpdateWithParameters:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_0(&dword_1A83A2000, v0, v1, "Unable to find screen for appearance mode update", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_handleAppearanceModeUpdateWithParameters:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_0(&dword_1A83A2000, v0, v1, "Screen does not support appearance mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_fetchFallbackIsNightWithToken:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  NSStringFromBOOL();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1A83A2000, a2, OS_LOG_TYPE_DEBUG, "Fetched night mode value: %{public}@", v4, 0xCu);

  OUTLINED_FUNCTION_14();
}

- (void)_fetchFallbackIsNightWithToken:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4(&dword_1A83A2000, v0, v1, "Fetching fallback night mode value", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_handleViewAreaChangeWithPayload:(uint64_t)a1 .cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_1A83A2000, v2, v3, "Request for view area index %{public}@, which is out of range for screen %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

- (void)_handleViewAreaChangeWithPayload:(uint64_t)a1 .cold.2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_1A83A2000, v2, v3, "Resetting to first view area for for view area index %{public}@, which is out of range for screen %@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

- (void)suggestUI:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_0(&dword_1A83A2000, v0, v1, "The CarPlay shell should not be sending suggest UIs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __24__CARSession_suggestUI___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_0(&dword_1A83A2000, v0, v1, "No parameters returned from CARHandleSuggestUI", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)setCornerMaskImageData:(void *)a1 forScreenInfo:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1A83A2000, a2, v4, "Ignoring corner mask image data for unknown screen ID: %{public}@", v5);

  OUTLINED_FUNCTION_14();
}

@end
