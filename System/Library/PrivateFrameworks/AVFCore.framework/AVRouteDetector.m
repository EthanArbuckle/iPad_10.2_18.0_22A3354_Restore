@implementation AVRouteDetector

- (AVRouteDetector)init
{
  AVRouteDetector *v2;
  AVRouteDetectorInternal *v3;
  void *v4;
  AVOutputDeviceDiscoverySession *outputDeviceDiscoverySession;
  uint64_t v6;
  void (*v7)(_QWORD);
  void *v8;
  void *v9;
  AVRouteDetector *v10;
  void (*v12[5])(_QWORD);
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)AVRouteDetector;
  v2 = -[AVRouteDetector init](&v20, sel_init);
  if (v2
    && (v3 = objc_alloc_init(AVRouteDetectorInternal), (v2->_routeDetectorInternal = v3) != 0)
    && (v3->multipleRoutesDetected = 0,
        v2->_routeDetectorInternal->detectsCustomRoutes = 0,
        v2->_routeDetectorInternal->routeDetectionEnabled = 0,
        v2->_routeDetectorInternal->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.avroutedetector.ivars"), (v2->_routeDetectorInternal->outputDeviceDiscoverySession = -[AVOutputDeviceDiscoverySession initWithDeviceFeatures:]([AVOutputDeviceDiscoverySession alloc], "initWithDeviceFeatures:", 1)) != 0))
  {
    objc_initWeak(&location, v2);
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    outputDeviceDiscoverySession = v2->_routeDetectorInternal->outputDeviceDiscoverySession;
    v6 = objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v7 = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __23__AVRouteDetector_init__block_invoke;
    v17[3] = &unk_1E302FA38;
    objc_copyWeak(&v18, &location);
    v2->_routeDetectorInternal->outputDevicesChangeNotificationToken = (id)objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", CFSTR("AVOutputDeviceDiscoverySessionAvailableOutputDevicesDidChangeNotification"), outputDeviceDiscoverySession, v6, v17);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __23__AVRouteDetector_init__block_invoke_2;
    v15[3] = &unk_1E302FA38;
    objc_copyWeak(&v16, &location);
    v2->_routeDetectorInternal->didEnterBackgroundNotificationToken = (id)objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", CFSTR("UIApplicationDidEnterBackgroundNotification"), 0, 0, v15);
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __23__AVRouteDetector_init__block_invoke_3;
    v13[3] = &unk_1E302FA38;
    objc_copyWeak(&v14, &location);
    v2->_routeDetectorInternal->didEnterForegroundNotificationToken = (id)objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", CFSTR("UIApplicationWillEnterForegroundNotification"), 0, 0, v13);
    v10 = v2;
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    v12[0] = v7;
    v12[1] = (void (*)(_QWORD))3221225472;
    v12[2] = (void (*)(_QWORD))__23__AVRouteDetector_init__block_invoke_4;
    v12[3] = (void (*)(_QWORD))&unk_1E302FA10;
    v12[4] = (void (*)(_QWORD))v2;
    AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E0C80D38], v12);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setRouteDetectionEnabled:(BOOL)routeDetectionEnabled
{
  NSObject *ivarAccessQueue;
  void (*v5)(_QWORD);
  void (*v6[5])(_QWORD);
  _QWORD block[6];
  BOOL v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  ivarAccessQueue = self->_routeDetectorInternal->ivarAccessQueue;
  v5 = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AVRouteDetector_setRouteDetectionEnabled___block_invoke;
  block[3] = &unk_1E3031820;
  v8 = routeDetectionEnabled;
  block[4] = self;
  block[5] = &v9;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v10 + 24))
  {
    v6[0] = v5;
    v6[1] = (void (*)(_QWORD))3221225472;
    v6[2] = (void (*)(_QWORD))__44__AVRouteDetector_setRouteDetectionEnabled___block_invoke_2;
    v6[3] = (void (*)(_QWORD))&unk_1E302FA10;
    v6[4] = (void (*)(_QWORD))self;
    AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E0C80D38], v6);
  }
  _Block_object_dispose(&v9, 8);
}

uint64_t __44__AVRouteDetector_setRouteDetectionEnabled___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateRouteDetectionEnabled");
  return objc_msgSend(*(id *)(a1 + 32), "_updateMultipleRoutesDetected");
}

uint64_t __23__AVRouteDetector_init__block_invoke_4(uint64_t a1)
{
  void *v2;
  BOOL v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (AVRouteDetectorShouldAppBeConsideredForeground_sniffUIApplicationOnce != -1)
    dispatch_once(&AVRouteDetectorShouldAppBeConsideredForeground_sniffUIApplicationOnce, &__block_literal_global_43);
  v3 = AVRouteDetectorShouldAppBeConsideredForeground_uiApplicationClass
    && (objc_opt_respondsToSelector() & 1) != 0
    && (v2 = (void *)objc_msgSend((id)AVRouteDetectorShouldAppBeConsideredForeground_uiApplicationClass, "performSelector:", AVRouteDetectorShouldAppBeConsideredForeground_sharedApplicationSelector), (objc_opt_respondsToSelector() & 1) != 0)&& (unint64_t)objc_msgSend(v2, "performSelector:", AVRouteDetectorShouldAppBeConsideredForeground_applicationStateSelector) > 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 65) = v3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 65))
  {
    if (dword_1EE2B0230)
      goto LABEL_12;
  }
  else if (dword_1EE2B0230)
  {
LABEL_12:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateRouteDetectionEnabled", v6, v7);
}

- (void)_updateRouteDetectionEnabled
{
  _BOOL4 v3;
  AVRouteDetectorInternal *routeDetectorInternal;
  DADiscovery *customRouteDiscoverySession;
  _BOOL4 v6;
  DADiscovery *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = -[AVRouteDetector isRouteDetectionEnabled](self, "isRouteDetectionEnabled");
  routeDetectorInternal = self->_routeDetectorInternal;
  if (!v3 || routeDetectorInternal->routeDetectionSuspended)
  {
    -[AVOutputDeviceDiscoverySession setDiscoveryMode:](routeDetectorInternal->outputDeviceDiscoverySession, "setDiscoveryMode:", 0);
    customRouteDiscoverySession = self->_routeDetectorInternal->customRouteDiscoverySession;
LABEL_4:
    -[DADiscovery invalidate](customRouteDiscoverySession, "invalidate");

    self->_routeDetectorInternal->customRouteDiscoverySession = 0;
    self->_routeDetectorInternal->customRoutesPresent = 0;
    return;
  }
  -[AVOutputDeviceDiscoverySession setDiscoveryMode:](routeDetectorInternal->outputDeviceDiscoverySession, "setDiscoveryMode:", 1);
  v6 = -[AVRouteDetector detectsCustomRoutes](self, "detectsCustomRoutes");
  customRouteDiscoverySession = self->_routeDetectorInternal->customRouteDiscoverySession;
  if (!v6)
    goto LABEL_4;
  if (!customRouteDiscoverySession)
  {
    v8 = objc_alloc_init(getDADiscoveryConfigurationClass());
    objc_msgSend(v8, "setBundleID:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier"));
    objc_msgSend(v8, "setBluetoothServices:", 0);
    objc_msgSend(v8, "setBluetoothCompanyIdentifiers:", 0);
    objc_msgSend(v8, "setBonjourServiceTypes:", 0);
    objc_msgSend(v8, "setPresenceOnly:", 1);
    self->_routeDetectorInternal->customRouteDiscoverySession = (DADiscovery *)objc_msgSend(objc_alloc((Class)getDADiscoveryClass[0]()), "initWithConfiguration:error:", v8, 0);
    if (self->_routeDetectorInternal->customRouteDiscoverySession)
    {
      objc_initWeak(&location, self);
      -[DADiscovery setDispatchQueue:](self->_routeDetectorInternal->customRouteDiscoverySession, "setDispatchQueue:", MEMORY[0x1E0C80D38]);
      v7 = self->_routeDetectorInternal->customRouteDiscoverySession;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __47__AVRouteDetector__updateRouteDetectionEnabled__block_invoke;
      v9[3] = &unk_1E3035CB0;
      objc_copyWeak(&v10, &location);
      -[DADiscovery setEventHandler:](v7, "setEventHandler:", v9);
      -[DADiscovery activate](self->_routeDetectorInternal->customRouteDiscoverySession, "activate");

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    else
    {

    }
  }
}

- (void)_updateMultipleRoutesDetected
{
  _BOOL4 v3;
  BOOL v4;
  _BOOL4 v5;
  NSObject *ivarAccessQueue;
  uint64_t v7;
  _QWORD block[6];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = -[AVRouteDetector isRouteDetectionEnabled](self, "isRouteDetectionEnabled");
  if (v3)
  {
    v4 = -[AVRouteDetector _isAirPlayDevicePresenceDetected](self, "_isAirPlayDevicePresenceDetected");
    v5 = -[AVRouteDetector detectsCustomRoutes](self, "detectsCustomRoutes");
    LOBYTE(v3) = v5 || v4;
    if (v5 && !v4)
      LOBYTE(v3) = -[AVRouteDetector _isCustomRoutePresenceDetected](self, "_isCustomRoutePresenceDetected");
  }
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  ivarAccessQueue = self->_routeDetectorInternal->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AVRouteDetector__updateMultipleRoutesDetected__block_invoke;
  block[3] = &unk_1E3031820;
  v9 = v3;
  block[4] = self;
  block[5] = &v10;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v11 + 24))
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AVRouteDetectorMultipleRoutesDetectedDidChangeNotification"), self, 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v7);
  }
  _Block_object_dispose(&v10, 8);
}

- (BOOL)isRouteDetectionEnabled
{
  NSObject *ivarAccessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_routeDetectorInternal->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__AVRouteDetector_isRouteDetectionEnabled__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)detectsCustomRoutes
{
  NSObject *ivarAccessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_routeDetectorInternal->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__AVRouteDetector_detectsCustomRoutes__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isAirPlayDevicePresenceDetected
{
  return -[AVOutputDeviceDiscoverySession devicePresenceDetected](self->_routeDetectorInternal->outputDeviceDiscoverySession, "devicePresenceDetected");
}

uint64_t __42__AVRouteDetector_isRouteDetectionEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 8);
  return result;
}

uint64_t __38__AVRouteDetector_detectsCustomRoutes__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 10);
  return result;
}

uint64_t __48__AVRouteDetector__updateMultipleRoutesDetected__block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v2 = *(unsigned __int8 *)(result + 48);
  if (*(unsigned __int8 *)(v1 + 9) != v2)
  {
    *(_BYTE *)(v1 + 9) = v2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __23__AVRouteDetector_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_updateMultipleRoutesDetected");
}

uint64_t __44__AVRouteDetector_setRouteDetectionEnabled___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v2 = *(unsigned __int8 *)(result + 48);
  if (*(unsigned __int8 *)(v1 + 8) != v2)
  {
    *(_BYTE *)(v1 + 8) = v2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

uint64_t __23__AVRouteDetector_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_didEnterBackground");
}

uint64_t __23__AVRouteDetector_init__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_didEnterForeground");
}

- (void)dealloc
{
  AVRouteDetectorInternal *routeDetectorInternal;
  NSObject *ivarAccessQueue;
  objc_super v5;

  routeDetectorInternal = self->_routeDetectorInternal;
  if (routeDetectorInternal)
  {
    if (routeDetectorInternal->outputDevicesChangeNotificationToken)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_routeDetectorInternal->outputDevicesChangeNotificationToken);

      routeDetectorInternal = self->_routeDetectorInternal;
    }
    if (routeDetectorInternal->didEnterBackgroundNotificationToken)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_routeDetectorInternal->didEnterBackgroundNotificationToken);

      routeDetectorInternal = self->_routeDetectorInternal;
    }
    if (routeDetectorInternal->didEnterForegroundNotificationToken)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_routeDetectorInternal->didEnterForegroundNotificationToken);

      routeDetectorInternal = self->_routeDetectorInternal;
    }

    routeDetectorInternal = self->_routeDetectorInternal;
    ivarAccessQueue = routeDetectorInternal->ivarAccessQueue;
    if (ivarAccessQueue)
    {
      dispatch_release(ivarAccessQueue);
      routeDetectorInternal = self->_routeDetectorInternal;
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)AVRouteDetector;
  -[AVRouteDetector dealloc](&v5, sel_dealloc);
}

- (void)setDetectsCustomRoutes:(BOOL)detectsCustomRoutes
{
  NSObject *ivarAccessQueue;
  void (*v5)(_QWORD);
  void (*v6[5])(_QWORD);
  _QWORD block[6];
  BOOL v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  ivarAccessQueue = self->_routeDetectorInternal->ivarAccessQueue;
  v5 = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__AVRouteDetector_setDetectsCustomRoutes___block_invoke;
  block[3] = &unk_1E3031820;
  v8 = detectsCustomRoutes;
  block[4] = self;
  block[5] = &v9;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v10 + 24))
  {
    v6[0] = v5;
    v6[1] = (void (*)(_QWORD))3221225472;
    v6[2] = (void (*)(_QWORD))__42__AVRouteDetector_setDetectsCustomRoutes___block_invoke_2;
    v6[3] = (void (*)(_QWORD))&unk_1E302FA10;
    v6[4] = (void (*)(_QWORD))self;
    AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E0C80D38], v6);
  }
  _Block_object_dispose(&v9, 8);
}

uint64_t __42__AVRouteDetector_setDetectsCustomRoutes___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v2 = *(unsigned __int8 *)(result + 48);
  if (*(unsigned __int8 *)(v1 + 10) != v2)
  {
    *(_BYTE *)(v1 + 10) = v2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __42__AVRouteDetector_setDetectsCustomRoutes___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateRouteDetectionEnabled");
  return objc_msgSend(*(id *)(a1 + 32), "_updateMultipleRoutesDetected");
}

- (BOOL)multipleRoutesDetected
{
  NSObject *ivarAccessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_routeDetectorInternal->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__AVRouteDetector_multipleRoutesDetected__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__AVRouteDetector_multipleRoutesDetected__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 9);
  return result;
}

_QWORD *__47__AVRouteDetector__updateRouteDetectionEnabled__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *result;
  _QWORD *v4;

  result = objc_loadWeak((id *)(a1 + 32));
  if (result)
  {
    v4 = result;
    result = (_QWORD *)objc_msgSend(result, "detectsCustomRoutes");
    if ((_DWORD)result)
    {
      result = (_QWORD *)objc_msgSend(a2, "eventType");
      if (result == (_QWORD *)50)
      {
        *(_BYTE *)(v4[1] + 64) = objc_msgSend(a2, "devicesPresent");
        return (_QWORD *)objc_msgSend(v4, "_updateMultipleRoutesDetected");
      }
    }
  }
  return result;
}

- (BOOL)_isCustomRoutePresenceDetected
{
  return self->_routeDetectorInternal->customRoutesPresent;
}

- (void)_didEnterBackground
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B0230)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  self->_routeDetectorInternal->routeDetectionSuspended = 1;
  -[AVRouteDetector _updateRouteDetectionEnabled](self, "_updateRouteDetectionEnabled", v4, v5);
}

- (void)_didEnterForeground
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B0230)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  self->_routeDetectorInternal->routeDetectionSuspended = 0;
  -[AVRouteDetector _updateRouteDetectionEnabled](self, "_updateRouteDetectionEnabled", v4, v5);
}

@end
